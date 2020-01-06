Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C7B13149C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 16:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173CB6E48C;
	Mon,  6 Jan 2020 15:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FBD86E489;
 Mon,  6 Jan 2020 15:17:08 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w15so37415008wru.4;
 Mon, 06 Jan 2020 07:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wUwxOiOhiSQ3VOG4n1QnFltXQzpVdC2uxmpMrj0xBkc=;
 b=PCOJmgty2UfCC20tLSAKItsBGGNfhAFp9MiR0UN2fclGnrUKNLFIKZiIMJpeWasSuN
 Qm1S17jzAyiE7igAIAOXylPGRoT9d3jDBVpeVqzEjc/bcxQri859TL3k9w8y4GV34AYM
 iS3G+Dg6g+Sn8y6l10Yv1wAaI+OPe939JB5rShuFrOGALYtp0SHOafFvkEl63FZaiM2s
 JPoohPfYIEILm1+4jYqdF9UQXXtmPTshrL+13CRFgRBL3Emajrq9WsDuHlifV+OI9h/o
 0Dj3mFqALTsdN8CObvy70XykwF4K6F+1X15RcZsChGYuzjr6N2B88jv4S2ZVXVRbzqkv
 xuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wUwxOiOhiSQ3VOG4n1QnFltXQzpVdC2uxmpMrj0xBkc=;
 b=VC1UvI8GWxxZSbF1gceDuCQDPZ3czX4nDCtg/5FRMPYKvFR3viTU/JxKdZeV4AfIm1
 dw8JNlKaOfLt2DqEDIX/0wElt+X/FUpgWKkdVOG8p09H2Chzn7uqsgsthV4MCAwdvkLi
 D8fD/9Kl0Q8NAbHR/+2oI6qRGi9IEIeV1iqCzgDu9HN8yeRXXX2tP+yHrIj6lP4c2f1m
 ohjVRqfw9oIgOTIhtvZXox0jSuWOKwrNVFqOWb7IOSrpFhMC4o/F6qYdjO3LEwm4EmlA
 i+kQ79enylliyL5RdpJoXwlxBZpAdv7A6NJ0CJuDRnxQzXk7rvkTg5yg/PvdxAyoSVY5
 PZig==
X-Gm-Message-State: APjAAAXnR0YuElMa+P0/oOVWmj54Y68KAs7nq2Su69a2lTpsd8pzVUL6
 5ZQQxX/U5Ziwhsa0ibTSyGA=
X-Google-Smtp-Source: APXvYqwZTHfp7/9UpuUJ5e2RmJsHYcsq3NG3ozF29Zh4Ewv6OFoXbqjHzZhSbwIBr+b+2dBzGDZHuw==
X-Received: by 2002:a5d:49c7:: with SMTP id t7mr101269812wrs.369.1578323827088; 
 Mon, 06 Jan 2020 07:17:07 -0800 (PST)
Received: from localhost.localdomain ([62.178.82.229])
 by smtp.gmail.com with ESMTPSA id l3sm72122463wrt.29.2020.01.06.07.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 07:17:06 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] drm/etnaviv: determine product, customer and eco id
Date: Mon,  6 Jan 2020 16:16:47 +0100
Message-Id: <20200106151655.311413-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106151655.311413-1-christian.gmeiner@gmail.com>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

They will be used for extended HWDB support.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 11 ++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d47d1a8e0219..7ee67e12141d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -333,9 +333,13 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 		gpu->identity.revision = etnaviv_field(chipIdentity,
 					 VIVS_HI_CHIP_IDENTITY_REVISION);
 	} else {
+		u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
 
 		gpu->identity.model = gpu_read(gpu, VIVS_HI_CHIP_MODEL);
 		gpu->identity.revision = gpu_read(gpu, VIVS_HI_CHIP_REV);
+		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
+		gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
+		gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
 
 		/*
 		 * !!!! HACK ALERT !!!!
@@ -350,7 +354,6 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 
 		/* Another special case */
 		if (etnaviv_is_model_rev(gpu, GC300, 0x2201)) {
-			u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
 			u32 chipTime = gpu_read(gpu, VIVS_HI_CHIP_TIME);
 
 			if (chipDate == 0x20080814 && chipTime == 0x12051100) {
@@ -373,6 +376,12 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 			gpu->identity.model = chipModel_GC3000;
 			gpu->identity.revision &= 0xffff;
 		}
+
+		if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
+			gpu->identity.eco_id = 1;
+
+		if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
+			gpu->identity.eco_id = 1;
 	}
 
 	dev_info(gpu->dev, "model: GC%x, revision: %x\n",
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 8f9bd4edc96a..68bd966e3916 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -15,11 +15,11 @@ struct etnaviv_gem_submit;
 struct etnaviv_vram_mapping;
 
 struct etnaviv_chip_identity {
-	/* Chip model. */
 	u32 model;
-
-	/* Revision value.*/
 	u32 revision;
+	u32 product_id;
+	u32 customer_id;
+	u32 eco_id;
 
 	/* Supported feature fields. */
 	u32 features;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
