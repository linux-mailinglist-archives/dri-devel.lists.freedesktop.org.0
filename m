Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1973FCC69E1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 09:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABB710EB9B;
	Wed, 17 Dec 2025 08:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="X2qgEXQS";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="Xkwq72id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1892 seconds by postgrey-1.36 at gabe;
 Wed, 17 Dec 2025 08:40:01 UTC
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4DC10EB9B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 08:40:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-k3ws.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765960801; 
 b=JMDLEbsvvHlAqyalP7IFKsijPsPDmsIS4J3AiZD4hjXSq0EGNNHPhaMaU3A5RqWl1cHM57RHZa
 A9+UrPB5VRnZmomK7/zpWTeO8GWZPqQuUgkrgLsj26nddV6x9r6jrGLduJvndIjm4R5TL1cnNj
 30o9LU2RmyogDPs38TkAlNT6cvxIVdTlTMBYTQLf98No+GqXUiE7rSSaspWIdalwhnERg3T3AP
 k+7K8wxFw3T+BolR/vuEShtZhkmvoA9taLLDRPSMU3AudJJAJqLlsHlpZuLGAw0VZSVa49SGXK
 f6EBdC0NZ5WZNOjHrxp2vBcy+DgpY5mCBnEgzMncNWWKiw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-k3ws.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-k3ws.prod.antispam.mailspamprotection.com;
 s=arckey; t=1765960801; 
 bh=xmTY/xIaeVDRWbqqsfAuF9zewXHVGxAP+LExztEljPw=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=afzwTwB/iDvNuc8Y3Yc+++Mc8n8d3Ulf/IpeJNTL17ARPxofl9VOBxE/b5Dw53trzK/2qKKiAE
 E/vtLuE/cmfDZ8fvxGAqhHMhS/PtAAwhIOFhwoXnlWD03VrKDxmc6UmFOz7EvhJtzBsszEAJUQ
 WdmFptgxt98+Wsq2ILs2J6htVBGNrYOsMlM/avc1iN9f0laH3HSs0uLLZ5VWHu3tAbuHFTnuRS
 OSRMPKAVyL8UuS4xIgy55uv/GGPnu16noaBu8ra4UAhXJpC2IoJZXeD0QTMuPLLaaDM6wW+Sqy
 Op6MZAtzPV7D0fsUyR/Wly7VSz6ancONvXBjh0naJoSfRA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=8Npd93JQJmakN0GeSlmk3CntxmjM1Fs8EpKnVHSDXVQ=; b=X2qgEXQS20KfcSNtiSGl76m0CN
 OuVyYIcttTdpEAt34kKRbsLphPyl2COon9jPuG4zYJ23J47/UlQ+6pxA9FROzGVpMELcHOEYqmy6H
 26bkx+rX9wFPAQEMhINgQONCV+N+W5ZdeXmgO1ZbhLIR4fiJnppgX9ZT1ay0cPA78UZU=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-k3ws.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vVma8-0000000ARax-0jud
 for dri-devel@lists.freedesktop.org; Wed, 17 Dec 2025 08:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=8Npd93JQJmakN0GeSlmk3CntxmjM1Fs8EpKnVHSDXVQ=; b=Xkwq72id1ZYGRxYnb2nIXxj2Xx
 X9yKX8l6qkAmL5EJ5VymyGc9OiX+kKSnJKi3hXHBXD5t12yU76kwT8r/k8Xj6FO5oMes3Bf95i1+X
 VHCl7BjJcJhHYAvjxKFQQebEEWI6qgqPEjV/IhhPXrD6hs5TPZQrfmXf4EZ3XLtuL384=;
Received: from [79.34.194.176] (port=63558 helo=[192.168.178.175])
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vVmZz-00000000ENx-3bB7; Wed, 17 Dec 2025 08:08:15 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 17 Dec 2025 09:06:56 +0100
Subject: [PATCH v3 3/3] drm/panic: avoid WARN when checking format support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-drm_draw_conv_check-v3-3-15b6f8bc1cbc@valla.it>
References: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
In-Reply-To: <20251217-drm_draw_conv_check-v3-0-15b6f8bc1cbc@valla.it>
To: Jocelyn Falempe <jfalempe@redhat.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=francesco@valla.it;
 h=from:subject:message-id; bh=xmTY/xIaeVDRWbqqsfAuF9zewXHVGxAP+LExztEljPw=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJlOKW+NhNbty9Tc3W4rfP+b73L2Jsug+PPyG78bhS89v
 ufZQv/tHaUsDGJcDLJiiiwh627c2zPX/FvaBsZHMHNYmUCGMHBxCsBEfHIZ/gc1mOie8vy7fHnV
 qsoSJclvX+buaP3Bu6SpVfmCz82gRntGhg07/3iplrWVuedv+JV7RPXh/41ub5YvCxYsDcmvUJV
 YzAYA
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 6be421077b96ef26abbed22114536702
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vVma8-0000000ARax-0jud-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-k3ws.prod.antispam.mailspamprotection.com; 
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

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index d4b6ea42db0fe65ea010255ff57554baf723e60c..27989a010ace38b18bc047ad87db64128ec25790 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -833,7 +833,7 @@ static bool drm_panic_is_format_supported(const struct drm_format_info *format)
 {
 	if (format->num_planes != 1)
 		return false;
-	return drm_draw_color_from_xrgb8888(0xffffff, format->format) != 0;
+	return drm_draw_can_convert_from_xrgb8888(format->format);
 }
 
 static void draw_panic_dispatch(struct drm_scanout_buffer *sb)

-- 
2.52.0

