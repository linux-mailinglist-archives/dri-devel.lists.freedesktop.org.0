Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38945BB68D8
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 13:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFF110E320;
	Fri,  3 Oct 2025 11:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="NYQtRUKG";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="QFSC0CtG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4187 seconds by postgrey-1.36 at gabe;
 Fri, 03 Oct 2025 11:43:56 UTC
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4157210E320
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 11:43:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-66gm.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759491836; 
 b=CJITbAIksPvfw//SdT35RKopY9J/lt/Aebv0BcxAhmEGd/aMjzqjCphdXDSnEjHdcZvld4XghI
 AltwZd2qDD2xDo5Hyy4bDyQe3nEbPDF3BlR8nl5lSwfeEOe/2iQmwC24hHDdCmp3A2FXZodtY7
 zD9ScQ2yRq8/znoCPnwPSWHM4VINmlUDqeQLRUKp+7ZI5c5xUbqGPaQL5/yfAyFnuqV24LLY+6
 ju3DTGRtZ8hVTiGJodu4ZNCN/M1ywv84ffcJxD+KdWtT5V+fpwNMZKD8KgVVdTFppBUBHIsSCJ
 Le2vnH5dD3jvvOFildpI5c9urG8CWST9rHBLxK4ID9Dyhw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-66gm.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-66gm.prod.antispam.mailspamprotection.com;
 s=arckey; t=1759491836; 
 bh=oxztwgSohn0Urt4wlKgp0INnLZf70XV4Jyinfy0e++o=;
 h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=X3viTAWDR8xnTPPQwZvTxhAv12rUfX4TcBDGUxWP1KIEt2fnJ0s54Xi0ySdo4vT2W7hzPrtNb+
 XWE8FqDHa3hylWFMo5Ds0Sy2PTYsGwm5tz0tUos+eBsLhEA3Sd8T63DgqAN6ZPq9rtAb5GF/+Z
 +M2Vx2T+T+shzrarBx3SgjTQUtJRJb2LACN7tlkl4kYLW728nfrNZcPGdLKH++flhWi2yrmPnt
 LshtTh7GQJlb2u6Bj3yocgo7bBw7grv5TnaOVkIaXI2i3vu0g/TGnftDXjOE6AN1SMIK9peqif
 rypMZXnz/W8PfDDP7r/Ms6bJX/a1c7shHHj4IXJMN1oQvQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=hXsRLCbKNIXlJVJ6hEdkFul81XBtMTzLFWhNEYewW3s=; b=NYQtRUKGu1Tjqi1RVZY256PElN
 PpkHu8Bb2TwFhaX9JwXHTi4DdvxEJg/KJt/XKT2U8g6gmkrnBN06F785RcbOgndkUGCwNI3zfguFp
 SVngpFxunrWqcNgI20DabwFJWSII694MYHnPdtH+41vY0R6aJ8FR1vo6DEXzMYdRh7Cc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-66gm.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v4d6y-0000000Dun7-0Mew
 for dri-devel@lists.freedesktop.org; Fri, 03 Oct 2025 10:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=hXsRLCbKNIXlJVJ6hEdkFul81XBtMTzLFWhNEYewW3s=; b=QFSC0CtG6aJxxkXHpCPLA1lI0z
 zWCImVm3kWJI7cN7S1Wyot7YK2zjgcpKSXNvENIGQMj4phbyTzjG+S6U/8ywRcOvIoTZQiMZTnp9U
 cqo4Dz8+NYz0a3iUKM24hfEQ8PSY9YRGogzJoPSQe90VK8Tq/EBFt16j60WDpsWoczBE=;
Received: from [87.16.13.60] (port=61630 helo=fedora-2.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v4d6j-00000000PzU-2xlq; Fri, 03 Oct 2025 10:33:49 +0000
From: Francesco Valla <francesco@valla.it>
Date: Fri, 03 Oct 2025 12:33:03 +0200
Subject: [PATCH] drm/draw: fix color truncation in drm_draw_fill24
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-drm_draw_fill24_fix-v1-1-8fb7c1c2a893@valla.it>
X-B4-Tracking: v=1; b=H4sIAF6m32gC/x2MSwqAMAwFryJZW6ipLvQqIlJM1IA/UlBBvLvB1
 TAD7z2QWIUTNNkDyqck2TeTIs9gmOM2sRMyB/RYFd4HR7r2pPHqR1kWLA2341ghBYx1CAS2PJQ
 t/69t974fXhyDJ2UAAAA=
X-Change-ID: 20251003-drm_draw_fill24_fix-ea52d32a933d
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
X-SGantispam-id: 7be041777e8f2ebfabaa1c2138488c7d
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v4d6y-0000000Dun7-0Mew-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-66gm.prod.antispam.mailspamprotection.com; 
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

The color parameter passed to drm_draw_fill24() was truncated to 16
bits, leading to an incorrect color drawn to the target iosys_map.
Fix this behavior, widening the parameter to 32 bits.

Fixes: 31fa2c1ca0b2 ("drm/panic: Move drawing functions to drm_draw")

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_draw.c          | 2 +-
 drivers/gpu/drm/drm_draw_internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_draw.c b/drivers/gpu/drm/drm_draw.c
index 9dc0408fbbeadbe8282a2d6b210e0bfb0672967f..5b956229c82fb6e232e3342705a226c8e14c8568 100644
--- a/drivers/gpu/drm/drm_draw.c
+++ b/drivers/gpu/drm/drm_draw.c
@@ -127,7 +127,7 @@ EXPORT_SYMBOL(drm_draw_fill16);
 
 void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
 		     unsigned int height, unsigned int width,
-		     u16 color)
+		     u32 color)
 {
 	unsigned int y, x;
 
diff --git a/drivers/gpu/drm/drm_draw_internal.h b/drivers/gpu/drm/drm_draw_internal.h
index f121ee7339dc11537f677c833f0ee94fe0e799cd..20cb404e23ea6263b535ea2b81b25f84c37be8a2 100644
--- a/drivers/gpu/drm/drm_draw_internal.h
+++ b/drivers/gpu/drm/drm_draw_internal.h
@@ -47,7 +47,7 @@ void drm_draw_fill16(struct iosys_map *dmap, unsigned int dpitch,
 
 void drm_draw_fill24(struct iosys_map *dmap, unsigned int dpitch,
 		     unsigned int height, unsigned int width,
-		     u16 color);
+		     u32 color);
 
 void drm_draw_fill32(struct iosys_map *dmap, unsigned int dpitch,
 		     unsigned int height, unsigned int width,

---
base-commit: e406d57be7bd2a4e73ea512c1ae36a40a44e499e
change-id: 20251003-drm_draw_fill24_fix-ea52d32a933d

Best regards,
-- 
Francesco Valla <francesco@valla.it>

