Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 007BBC2B4B6
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 12:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDAA10E186;
	Mon,  3 Nov 2025 11:23:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="uwm/QCgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B87E10E186
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 11:23:02 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0Thy6Pz1z9tg0;
 Mon,  3 Nov 2025 12:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1762168978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D/B5cSi2gvG8WS+XWr9mKVvN8RRTThm5Yd3lpHPpvD0=;
 b=uwm/QCgnP04rIAxBD8Seqrz57i6K8YDaj8DN+RJUocasdzWorlz6UnN9ihGSnyD2RqKfrn
 66U61IRN71+ga3IYZcP13G1k1PyQV92JpIUS3u6RuoF7CN5KlnUI1DdqC5DLsw8ndvHYWy
 bfgaBpt8uUVCvBGGZhohsYLs8WcHt9nsjG1QbP6qHNWSdyhXhobXFBjqdJMbEfFdeZYYZK
 fZ1/DleXb7BaPygi4BeZEF2gSrDtdEgPjQbiQZoT+HFHR3wXQ6M6hQfd0DfdlDDu0ZORyD
 F4e2IKQ/oQV7ZeBIZXGOXUn8awEcuEJrMprA3/sJDfvxsh5Ay3LsMQgYvade1Q==
Message-ID: <f1abafa2-97e8-49ad-abc8-c71914ac2212@mailbox.org>
Date: Mon, 3 Nov 2025 12:22:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm: Add "min bpc" connector property
To: Sasha McIntosh <sashamcintosh@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 trivial@kernel.org
References: <20251031204534.659180-1-sashamcintosh@google.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <20251031204534.659180-1-sashamcintosh@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: de984f8e742b7750fb9
X-MBO-RS-META: h31ojnu9ox344y78z53c4jqnpaxg5yw1
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

On 10/31/25 21:45, Sasha McIntosh wrote:
> [Why]
> When playing HDR or WCG content, bandwidth constraints may force the
> driver to downgrade to 6bpc, resulting in visual artifacts like banding.
> 
> Userspace should be able to configure a minimum allowed bpc.
> 
> [How]
> Introduce the "min bpc" connector property so the user can limit the
> minimum bpc. Mirror the "mac bpc" implementation.

One issue with this is that the effective bpc of the link (as observed by the user) can be higher than the physical bpc, due to things like DSC or various dithering techniques. So requiring a minimum physical bpc could artificially exclude configurations which would otherwise work fine.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
