Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3A4E85E5
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 07:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D444A10E1A5;
	Sun, 27 Mar 2022 05:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F35D10E1A5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Mar 2022 05:20:36 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id m18so7206962plx.3
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Mar 2022 22:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=/a7VRIQfIk0sc3S+jykLBy1he3snFYah83JVhZ/FtcE=;
 b=Gu4KKtsGjBhRW6NALsZW7nc+kbdqqMi0pvPUrm0M1PGXR6i7tH9CzlmoBZjvqIvKIB
 PANnpRV0QzyhRqV6SuqNlLC9we6wmEyOkgcgEsr3ygdMhosxl1ZnkumOC8GuI1PyZdAf
 hWX7RvBCmGl5CPoQslMoAUKcz3qTS1K11cPL2aOFjqKrXoK8/1DvDV9GuiZu/pzTLvGP
 0O+/NycEb2xyfFc9XgPFLlw1Swr0VZq+KHUcbsxJ8FsTEfRMgYr7wmfnj19e9hRz4J5T
 8rDqczBMI96n1yYUrmFxkmRb83MZcnPk4ByGlrnqJJAvx7I/KtRF+/OA0oCH2gZ8zGzF
 J4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/a7VRIQfIk0sc3S+jykLBy1he3snFYah83JVhZ/FtcE=;
 b=e40yQk7pIXKg85hkUKUFRGgZQxI6nQXQ7tKeLCxLUdX6kKdIDXOxj1eJlHeV/2kgSQ
 FtMkWURROEbIXIZSbOJ/2uTOVsazXWy24bdC6eY9e3RQ3DSoRB3FS/PbZd8TEzTEChoD
 zJTba68tUjSTr6VKKtA1dT1Qvgum4A9nqUU1a/QqHUuGYqIUnrUfipXPZ1avQ6pyOwL5
 EwnC5gCMdrVdT01vfq7LBTNqpQJGpAuhHzktLrY/sHNfoOQVgEvTBjaWNTaXw7Edjjl2
 WLusauVzCV/aAjfxxE3tcTeNKyV0Cdxg/WWc9W4q/wHy+R1NSaih9/zYqJ+g/af2GsRm
 cIGA==
X-Gm-Message-State: AOAM533Gv9GQUQ2wdrTm8j+3gi325eI4Vg2W8kTbBUURdeEf3SeMEyRK
 aAM8kabDBa1TAlF+9KRLzLs=
X-Google-Smtp-Source: ABdhPJwpKtizoLaCssM+03oOecEr9SKKWfBodr8JhWSrgJTi3+rwUGiYHVWv+7cjG+H0YSsjqMU39Q==
X-Received: by 2002:a17:902:d652:b0:153:ad02:741c with SMTP id
 y18-20020a170902d65200b00153ad02741cmr20017545plh.135.1648358435718; 
 Sat, 26 Mar 2022 22:20:35 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
 by smtp.googlemail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm15735507pjb.2.2022.03.26.22.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 22:20:35 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] gma500: fix an incorrect NULL check on list iterator
Date: Sun, 27 Mar 2022 13:20:28 +0800
Message-Id: <20220327052028.2013-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bug is here:
	return crtc;

The list iterator value 'crtc' will *always* be set and non-NULL by
list_for_each_entry(), so it is incorrect to assume that the iterator
value will be NULL if the list is empty or no element is found.

To fix the bug, return 'crtc' when found, otherwise return NULL.

Cc: stable@vger.kernel.org
fixes: 89c78134cc54d ("gma500: Add Poulsbo support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/psb_intel_display.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index d5f95212934e..42d1a733e124 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -535,14 +535,15 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 
 struct drm_crtc *psb_intel_get_crtc_from_pipe(struct drm_device *dev, int pipe)
 {
-	struct drm_crtc *crtc = NULL;
+	struct drm_crtc *crtc;
 
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct gma_crtc *gma_crtc = to_gma_crtc(crtc);
+
 		if (gma_crtc->pipe == pipe)
-			break;
+			return crtc;
 	}
-	return crtc;
+	return NULL;
 }
 
 int gma_connector_clones(struct drm_device *dev, int type_mask)
-- 
2.17.1

