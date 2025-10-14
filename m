Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A829BDB290
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 22:08:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6D710E696;
	Tue, 14 Oct 2025 20:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="lwSNrv37";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="RGmrBKkv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2745110E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 20:08:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-c01b.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472528; 
 b=cZOlX6iNg46RwnzRK+PGvDnk7TTZyMj52gQuyvjO1YPF0/og2hAsAQDtFT0NxJbkLY4zVNIIbl
 4GHHpyg4Tk0Exm7G0kZ4aQqOlw2cGTtCmIm++pTjsJrK2hnk7RM7ej9OudatpFjbjinHgVIau2
 rHKaVhzsLzMtDMZyVj2Mj8/ChayFo26YkCQdTV5DeNz6qD76lYeJD/0BQxF0G3wAkmPBQBtFZN
 LVTbIVOG/zodBc8wtjbZelnKrTmaLQcCoqOidDbqXLAsmo7boDMzgcTZOrd6vKXEg6So5MFO4T
 IVNTPH/N4GV8ZbEbdjRWKagCteYiB5G+mxnLIR32UTXkhQ==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-c01b.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-c01b.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472528; 
 bh=DRH7iMOTbuY1/iWEix7sZhqd6n/2Tw1ybJZR6DrwRcU=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=lP07NRKDtNymvT/Brhkx+C3pQG2F7nX6/3a2iNcW5JVsfxAKY83CWU9IyIkFEmWlDIPKljYcYO
 ldiu+jOQQjJMp/3Qq47S0Pimod2m+9n3dpUQfqI17WFnPUfKETuSmSft6JkN2p4rt1u1Nytp8d
 7BotUAb7QJbVTUy6ZJBYOWLRfi6s8NdbK+uPdfjjjm6r75e4dN4gEYWa16GLc/zZ20bOvZJOWU
 w59yGwOSqnkD4fULMP9Jn84+MqOhSIRHShd7R1x9zesSKb9vjbhkyCAfRhjta1vsXkbYhGzTRM
 uB8aabfbeqxW+Z3Zj55xYkL/rGo+CRao5Juvt/nvQ4WpCw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=kdy+0w++K99irbhKozpIsd52YcoplzuImJedZzCCHOA=; b=lwSNrv37/nCAk/Q/b0IZrn5lIh
 5Hci2uYLEu1pJoJEGy9O8XzrZbo0CEbArMvD2I/0b0jGxu0Lp2FVHj3oirI3a1uAfq/Mr2TQ6KE+V
 rKEZe8+JspOsWgAEKoS4KsYrQ1AGRXS7hGc2/IS0jqXMOSWtoDoFGTgTE9WmoJNDG71s=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-c01b.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v8lK7-00000003XJw-20cg
 for dri-devel@lists.freedesktop.org; Tue, 14 Oct 2025 20:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=kdy+0w++K99irbhKozpIsd52YcoplzuImJedZzCCHOA=; b=RGmrBKkvWCWAenzMbjO3HDgGK5
 CTfPntjK5yx0X/djbDQ2g1/47OESLQiGjrNdjRkeAB+mwd2KvOZbYCPQ/XITegvdvPLVdX73qQVO2
 ntYr5cUCf89yXjbSwdzTyxkJMyk9NC2YfRaIM/HHdjdFzIMHrPp+OIzwkUkVwrzeHKYw=;
Received: from [87.16.13.60] (port=64127 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v8lJs-00000000E00-22Lx; Tue, 14 Oct 2025 20:08:28 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 14 Oct 2025 22:08:14 +0200
Subject: [PATCH v2 3/3] drm/panic: avoid WARN when checking format support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm_draw_conv_check-v2-3-05bef3eb06fb@valla.it>
References: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
In-Reply-To: <20251014-drm_draw_conv_check-v2-0-05bef3eb06fb@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 08121723c6c51556a2c9a2b4215013c9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v8lK7-00000003XJw-20cg-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-c01b.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

Use drm_draw_can_convert_from_xrgb8888() instead of
drm_draw_color_from_xrgb8888() while checking if a color format is
usable. This avoids a WARN in case the first format is not usable.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 1d6312fa142935fcf763381920ad889ca4cf4b27..4ba961e445e576d03cfb58953eead90d32b40151 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -785,7 +785,7 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 {
 	if (format->num_planes != 1)
 		return false;
-	return drm_draw_color_from_xrgb8888(0xffffff, format->format) != 0;
+	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
 static void draw_panic_dispatch(struct drm_scanout_buffer *sb)

-- 
2.51.0

