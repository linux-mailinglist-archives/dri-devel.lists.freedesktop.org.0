Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E5E612969
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 10:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D05710E077;
	Sun, 30 Oct 2022 09:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B7C10E2D3;
 Sat, 29 Oct 2022 18:49:00 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-13c2cfd1126so9715263fac.10; 
 Sat, 29 Oct 2022 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=57RVFwJZ3iFyz/7pgcHKldBgiU0NMfJt4GoVXyg5tyw=;
 b=UmpE5fSWtp7oajWqEDBMnGKOSdYRlUjlCvONnEviqRMM5dChgSO3aEmhSQGMMCfW8A
 LdZyzL9YMoDOcDj6QecWqPEvDvATZKmXz79TjnZYp5sRJLvf0CqmxBdu6uqLTbW3CKZt
 Q1jdYGLgsrcVQsYvOQU0Qhkk/HGLQ4Udygmv3tx7Y1rNs+t9EtZGU9L5Q5w5iZUVgaoF
 PmP/cqOnpuPN5pW2helMx730eN6h2emtYVBqiq/bltkJNoeKp2YQ3dN/N9pVW6mbfhtn
 SN1hBQcEYqQA6WQgH1n9LXmZLoS9UB8uNWlV1YLLtr/4U/LA6tJhIOvGwZDgHU3IQsg1
 NJug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=57RVFwJZ3iFyz/7pgcHKldBgiU0NMfJt4GoVXyg5tyw=;
 b=uYkeBOh5eYIRh+QvZl+RwDwvznvCEjXDMQmKypnLtSDzjhT0Adr9ms2ZoH6b/whnX8
 RDDn9wLj26OW+MfvBSP8rBvLV1WURiXK+v6A9J4JwuBfw7T9F0zU1gz1tKaEOuGY5gOa
 jRDPpd2JBfzQNCQqVxCUktK4zWg52kohfKVvqg0l5vquDNJ5G69P1kIn9pNFXR2op+s4
 5nqaN6ek3NmOAuwZUJd1SAR7rpmw6pX1yGNQnP2pskWV6eoiUa0tNf1d16dFAbBXb5D9
 MulPG4+VGeBaiAsz0oNjPTdfoOvoy4fjvhImQy3nS3QGz1zghH683q56iL02fiNCb4mi
 OWjw==
X-Gm-Message-State: ACrzQf0YLfhezhuF6XF4NcsR4L1KkZyNTP+gc5V23xDxNmlPLzvx4Lz/
 FQEPDGn/oCTbHy+ecfp8Kk0=
X-Google-Smtp-Source: AMsMyM6gxp24dY1reFhIf12V9j7++47EFrSvA6JaTa/RQdLSoSvclTEVkuhzvfrgvmZmhqIDRpLyYw==
X-Received: by 2002:a05:6870:9627:b0:136:c323:2ad8 with SMTP id
 d39-20020a056870962700b00136c3232ad8mr12328976oaq.259.1667069339786; 
 Sat, 29 Oct 2022 11:48:59 -0700 (PDT)
Received: from antonio-Lenovo-Legion-5-15IMH05H.multilaserwifi.com.br
 ([45.163.246.1]) by smtp.googlemail.com with ESMTPSA id
 q11-20020a4a6c0b000000b0049602fb9b4csm741898ooc.46.2022.10.29.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 11:48:59 -0700 (PDT)
From: antoniospg <antoniospg100@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau: Adding support to control backlight using
 bl_power for nva3.
Date: Sat, 29 Oct 2022 15:48:50 -0300
Message-Id: <20221029184851.25340-1-antoniospg100@gmail.com>
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

