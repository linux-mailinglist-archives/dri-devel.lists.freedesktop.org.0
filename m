Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44C61296B
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 10:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372010E089;
	Sun, 30 Oct 2022 09:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBA710E2D2;
 Sat, 29 Oct 2022 18:43:24 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so9707883fac.7; 
 Sat, 29 Oct 2022 11:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=57RVFwJZ3iFyz/7pgcHKldBgiU0NMfJt4GoVXyg5tyw=;
 b=SjDvVlPBZ2PiKAi+9C6+buDBdSeaLu2FPV7dopY6H2t/EzsyqOVceneXRO6uq7jVZU
 7nTEiRra7/HOgK/ro0ucbD+RRKmzb/tphWhcwBiGB7EU6J2ZZDGpNSZL6kmgS7mq+3El
 lTSSOnxPfeZtvHzDA93lggQ4RJRCuOEvZYJTvVUr0pwMNRAS7iEbFSPK7+DzPW3I2O3D
 ggQ2ntiR+8hiVBqmmJAmPQNmwUALUoAVGod0ql2y0WM/rQOcKO3EJgVKIUB45fIEvten
 aBBJAsp021jcg92bFUbd+jUKm4PVPO6UVb9QZpz/+JY+5FH12iI25zfO8aL8aHXBaV3b
 Wrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=57RVFwJZ3iFyz/7pgcHKldBgiU0NMfJt4GoVXyg5tyw=;
 b=G/c58y0KONuo9gmM4Qf/StCoftz0VLWceLMSnckTZQfRnPkPeAYzMcLH/HF1TWZX0c
 E2mmayyCq5Hg/Z9JeiCcN4ohDXKBSCFyNyud//rDzy+2GUZNzVUhiNmX4gHOzcP8MA24
 YujQzIDxQa/XHQqQ6URSUsKOpnM9mWj1FsfMjCuaAuDKDgiPtpHi47E/tgtGnIbV+ddx
 amMTNGwknvd+rV/dY/EyLSXUHdTcR55uqtXncjt8OLag4wPBZoLTdw9/44GHYWSz0ICQ
 Tg4Nk0t2sBeK69bNeC/PIty+v/eF40w0t7ACuwZCPbhG2ZrzcpOOSFewvwM9+tYBdmqk
 bhJg==
X-Gm-Message-State: ACrzQf0eMwKmdbyK32+4sqalkrm3UuXBGxl/kfrSZGNEhc31G7OVM/3b
 hDN2zAgdv3gSlXQZsp2g/XA=
X-Google-Smtp-Source: AMsMyM50ufWSgBjfzZB6/E6vwfiM1/oZHheFjGzT0+KACVd090SUDpidYuUQA/FCYl90RsFjrF83QA==
X-Received: by 2002:a05:6870:612c:b0:132:a4d3:e0d8 with SMTP id
 s44-20020a056870612c00b00132a4d3e0d8mr2970057oae.95.1667069002990; 
 Sat, 29 Oct 2022 11:43:22 -0700 (PDT)
Received: from antonio-Lenovo-Legion-5-15IMH05H.multilaserwifi.com.br
 ([45.163.246.1]) by smtp.googlemail.com with ESMTPSA id
 o22-20020a9d7656000000b006619533d1ddsm855436otl.76.2022.10.29.11.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 11:43:22 -0700 (PDT)
From: antoniospg <antoniospg100@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Adding support to control backlight using
 bl_power for nva3.
Date: Sat, 29 Oct 2022 15:42:55 -0300
Message-Id: <20221029184255.24041-1-antoniospg100@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:26:02 +0000
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 antoniospg <antoniospg100@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test plan:

* Turn off:
echo 1 > /sys/class/backlight/nv_backlight/bl_power

* Turn on:
echo 0 > /sys/class/backlight/nv_backlight/bl_power

Signed-off-by: antoniospg <antoniospg100@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index a2141d3d9b1d..855d0ce9f7fa 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -263,7 +263,16 @@ nva3_set_intensity(struct backlight_device *bd)
 	u32 div, val;
 
 	div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
-	val = (bd->props.brightness * div) / 100;
+
+	switch (bd->props.power) {
+	case FB_BLANK_UNBLANK:
+		val = (bd->props.brightness * div) / 100;
+		break;
+	default:
+		val = 0;
+		break;
+	}
+
 	if (div) {
 		nvif_wr32(device, NV50_PDISP_SOR_PWM_CTL(or),
 			  val |
-- 
2.25.1

