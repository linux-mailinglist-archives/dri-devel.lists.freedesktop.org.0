Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512F996EE82
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC7D10E9C5;
	Fri,  6 Sep 2024 08:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="jmHTdtdU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="p4EvLS17";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B42610E9C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:47:27 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1725612445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oa8B0exPuHorkfb3VBgoef687xB6sMs73RRCB0C9WhI=;
 b=jmHTdtdUGvZY4c5xEMGMPt8nSh9czuB7Jj3l9qfv9EQigYmGn3Ie9SEOdanBnAHuPojb7l
 hUgVGAdt7WpDxjVkLzCObUOrc4wsqiVEURn3vfiVd+CKSgRCsnrN9ecA94HQbkIFgi1Hr9
 NlDzC73sZikE6Er/v5CtxHroxj8eNasoNl+SmnxIYVbu4xuSS1PwNy/56spFcGxTpi10oj
 3alpK/SvjsKYfNSt8ACVCEhta4rwCvERxeFiwfSADG5TwSM85dcyBt2QhOCX9TS7alaP6V
 Ruwd63raIZjTRYXFDwOQj3yBsIdr5UY0vqEWeFFJ3SXDmGRlN3tHPj60/CZuxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1725612445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Oa8B0exPuHorkfb3VBgoef687xB6sMs73RRCB0C9WhI=;
 b=p4EvLS17dbTj5Ob8xY8Oe8RB2BbwrpnLWY2cdQDAt6u+h2mzS9aSCA82XaY0xA2fN/usUZ
 PBAoxx6bWkAvNkBA==
To: Jocelyn Falempe <jfalempe@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Javier Martinez Canillas
 <javierm@redhat.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Petr Mladek <pmladek@suse.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] drm/log: Introduce a new boot logger to draw
 the kmsg on the screen
In-Reply-To: <87seudchlu.fsf@jogness.linutronix.de>
References: <20240801100640.462606-1-jfalempe@redhat.com>
 <20240801100640.462606-4-jfalempe@redhat.com>
 <87o76czfb2.fsf@jogness.linutronix.de>
 <d4412d54-41b1-4671-9733-34ba1423404c@redhat.com>
 <87zfpwxqpc.fsf@jogness.linutronix.de>
 <87a5gm2khw.fsf@jogness.linutronix.de>
 <a421b31b-53ad-4f56-88be-66a7d4c3bb61@redhat.com>
 <87seudchlu.fsf@jogness.linutronix.de>
Date: Fri, 06 Sep 2024 10:53:25 +0206
Message-ID: <87plphcgo2.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-09-06, John Ogness <john.ogness@linutronix.de> wrote:
> Your device_lock()/device_unlock() callbacks probably just need to
> lock/unlock your mutex @drm_log_lock.

Sorry, forgot to mention that the device_lock() callback must also
disable migration. Since you are using a mutex, you will need to
manually do that as well...

mutex_lock(&drm_log_lock);
migrate_disable();

John
