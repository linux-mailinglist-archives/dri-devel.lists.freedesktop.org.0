Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFABDB28B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 22:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8765410E695;
	Tue, 14 Oct 2025 20:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="ByKHDRCN";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="V6892QhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5955610E68C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 20:08:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-c01b.prod.antispam.mailspamprotection.com;
 s=arckey; t=1760472527; 
 b=Rfpko1B5aVIt9mF+lJAkhu5227CsksIlBj4JHCrd8UizYfPSk2LI/Rpe5/YPm0bsmxacQFcrEr
 OJEjGZp6HCX7w2rOYszAfrxVq4fFnH17GwXP6wdj9J1aeTz7DhlZ+wPjbWtrzrBQvZldxHgHuy
 bAqbQ+9kxyALf0hbLT8WQa0BHflkAat/Sl6y6JAfkAVxlODGPEHb84xb+jP2lImycFOo6qkmbO
 ToihwOnA0ajpjlY2bKGHw1R5vHIaGaDCt0vnNX/H4yi5CRsEADYiA0AQIlP4B82OgMG0miaCEy
 KJYCrwYHppOtirCdsWgB2sU7Tp5R7ZK4ydsPAvjd8h1W+A==;
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
 s=arckey; t=1760472527; 
 bh=47IvIiXfgXszMY+cAV0lSu8Ko5qTBff2hny8UxJ0ZUw=;
 h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
 b=tZAZu/1RagUFiSF9IYvnSZM0zHPTgdVfgmsKlEqsFCcDhi5N/rKaVvVAOa7+tn/31pW2GZzksg
 5goUNhrblMK6PXJkEH4iTRJnFEDjIDyQDEkuIupsW0xHPb+FEf5LWmQMDbhOQh8ZTjiDYvjYQM
 qKKK5e+hXeYvDIhlyO6nUiFSJavD/zM+5VNaadRuKGdYRe85U6K6x2sacrZmD/TfhVS0TNjY/F
 ZJiEmUGtZX+Axu4++DvNbGxGPaqGnh1v6h+275PoSCIxEk/LCPRmAxPPEDsn4qsekqBkYp1CEn
 nS5nk3n7KICtzWWSdeEwhizMFMtqRiriw0439zmycOCR3g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
 :Date:From:Reply-To:List-Unsubscribe;
 bh=bXAG6V6q0Gu2P/Y5b57UaRwcg3Y2X9SQRXNhHXSl2EQ=; b=ByKHDRCNEVawzAFrUchp0K+FBB
 XT2ReWZH7nnPcx7Q6q3C0t7qyeeZxiWhibns5DhXWsaYQRRfA6cjI5896KHr0/sWS3UzsKU6oZtr9
 TAfNkdouHqLShAp3vTzgnZWIUTICyJ+JpGvf9w4c49jPC20wh3Jak8C0/nRcOVQGNz/s=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-c01b.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1v8lK6-00000003XHe-2laJ
 for dri-devel@lists.freedesktop.org; Tue, 14 Oct 2025 20:08:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=bXAG6V6q0Gu2P/Y5b57UaRwcg3Y2X9SQRXNhHXSl2EQ=; b=V6892QhTTdQhHhDDoXiGrBBAZp
 Ea7auEnQac9Xh26Q0y0bmOh78arkoMN9SpvN/RRJJM+3DAmc/SkrPvt4FkmifrObM5Yx0nwW541Xt
 wEeikr9Tderq3CY74WyoRh/LkxsrQEhW4PCLXA9fFiMb4YiR9XneEAz+2bckFQov4XNY=;
Received: from [87.16.13.60] (port=64127 helo=fedora.fritz.box)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1v8lJr-00000000E00-2EEV; Tue, 14 Oct 2025 20:08:27 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 14 Oct 2025 22:08:13 +0200
Subject: [PATCH v2 2/3] drm/log: avoid WARN when searching for usable
 format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm_draw_conv_check-v2-2-05bef3eb06fb@valla.it>
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
X-SGantispam-id: 05f0740fabb217e8e172d1eb87631c64
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1v8lK6-00000003XHe-2laJ-feedback@antispam.mailspamprotection.com
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
drm_draw_color_from_xrgb8888() while searching for a usable color
format. This avoids a WARN in case the first format is not usable.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/gpu/drm/clients/drm_log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index d239f1e3c456397ad64007b20dde716f5d3d0881..c0150f0c3b4b395e6e2126cf0d9660c967c182ec 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -182,7 +182,7 @@ static u32 drm_log_find_usable_format(struct drm_plane *plane)
 	int i;
 
 	for (i = 0; i < plane->format_count; i++)
-		if (drm_draw_color_from_xrgb8888(0xffffff, plane->format_types[i]) != 0)
+		if (drm_draw_can_convert_from_xrgb8888(plane->format_types[i]))
 			return plane->format_types[i];
 	return DRM_FORMAT_INVALID;
 }

-- 
2.51.0

