Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8AB5AE54F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 12:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE36310E5BA;
	Tue,  6 Sep 2022 10:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050:0:465::101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE8E10E5BE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 10:25:57 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4MMM3k2sx9z9ssf;
 Tue,  6 Sep 2022 12:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1662459954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYiOLCocObvnWLd0fdHGQ3psgoMX0E0A76mnhWqwJX8=;
 b=hIX+bN/sAzudzFrZLCaTMSiJ1K4Gkc8gZxD4kmnKBD9ohOl7o6xGNfMdqrNarGY6kYRV7u
 E2ekvI3gSRbJlipkXn26cBhJvEubN+66wXwZUbmLlfrvfu+KwZ8Oak5qgAldUrv8mibMbl
 xurU8fr1Pg/6ZN/jHOqCvavVc0PrNy93FHdEyKC9xVkX+kwIf7TK8qcsdduWqVKNkq725r
 f1aZiW1cyPGgH/S2BJplbNirMipT2InIekjQ3JYakUmb/QAZ/AQKmqssGqjabdJKmxlJxn
 kRbafF2NZVO+XF1f1cLZj0Gl2EA3t/5vb+JL8iqSuegWs2eWpzOPf/yQB2khkg==
Message-ID: <530089c9-59c2-8ff9-a547-b25d5ad04c59@mailbox.org>
Date: Tue, 6 Sep 2022 12:25:53 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] drm/gma500: Fix crtc_vblank reference leak when
 userspace queues multiple events
Content-Language: en-CA
To: Hans de Goede <hdegoede@redhat.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
References: <20220905133738.466490-1-hdegoede@redhat.com>
 <20220905133738.466490-3-hdegoede@redhat.com>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220905133738.466490-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gbux4981o34no596ded5xt4eu9w7ker5
X-MBO-RS-ID: 41700cda5c771a10f04
X-Rspamd-Queue-Id: 4MMM3k2sx9z9ssf
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-05 15:37, Hans de Goede wrote:
> The gma500 page-flip code kinda assume that userspace never queues more
> then 1 vblank event. So basically it assume that userspace does:
> 
> - page-flip
> - wait for vblank event
> - render
> - page-flip
> - etc.
> 
> In the case where userspace would submit 2 page-flips without waiting
> for the first to finish, the current code will just overwrite
> gma_crtc->page_flip_event with the event from the 2nd page-flip.

This cannot happen. Common code returns -EBUSY for an attempt to submit a page flip while another one is still pending.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

