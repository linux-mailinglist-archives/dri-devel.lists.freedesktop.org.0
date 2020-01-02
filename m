Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A994712E4B9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 11:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C73989F6B;
	Thu,  2 Jan 2020 10:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8768189F69;
 Thu,  2 Jan 2020 10:02:47 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id j26so40151235ljc.12;
 Thu, 02 Jan 2020 02:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vckSF9hpY/qz2kAzKmxateqNX/b2XwGcAzaPFz9WQdQ=;
 b=TJXleVLoHctBPaOFvOv6CBlbQzySi93ukWOTrbxAnVszwNIKvekkBg0kLqA/Up4QDV
 IXsPkEGu47pYf0YNuo6sxMZykuzzD5jaPAc8BuPdywUUNDWetq9pikeV3j5nRpZMqwAX
 xswDDZ+yBQuWLPOBjfrVlJRpNnWGck36vEQS9YHyPDKf1Il+KT08+InDmRVeaKayFOFX
 I9D05hcO10SbgtwKWh2RJQ5zuLfxZRdnIzR+jGy36CzzKWW76052OdreLrtr3rmRCwGZ
 dGecClihocL73d3Zv2bGBYerkBDXwsQMFwK2+R0YrQpXkwzpJhVhmZSJRJNVUqoxfq5D
 lzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vckSF9hpY/qz2kAzKmxateqNX/b2XwGcAzaPFz9WQdQ=;
 b=ZoW+t1aVd/hDrU3UxMI4P7W27qt35CB/+tXNWgichD8HeJkCxafLGYGW851Hv/7FEt
 E+kjCdXkcitWm8EV9tf4BMMqQ4e1eAx7IhFKaBtdALwJBSvNvzptvR0zOd3Gih5zGP70
 tl71OFDKGkPI5GkbQAztdX9ZDG/TANXincNh7MwdB47KHk1EoZGHH3IAySquUqJikSw8
 WS7aNSFGu2dSEmi14PbtFKGxAqkoJlIwvFwM2dkjvrkZSr+v4dCD5Vx7VWAH9NLH9DrQ
 89U2vdsyEsnyjwfw4quFDlTfWsKv1bfZhwNlFev3EJXYIu6F7O86Ka5E9O92PAkxl18E
 Kj6Q==
X-Gm-Message-State: APjAAAWn9crOeoK4DsETsEB8A85irqNipUu13KVzTO+Z0CT6fvLf7ZYp
 lfEOM6moOe3eHa86QJ+/RdrY18edxqE=
X-Google-Smtp-Source: APXvYqy+OuS6PLVs/lm3LeFD0O7BF2v4S4kgM9bCjj1OccQ6dLHnyBdURAmyaNC9b1jbGsueQxOG3Q==
X-Received: by 2002:adf:df90:: with SMTP id z16mr86769792wrl.273.1577959364963; 
 Thu, 02 Jan 2020 02:02:44 -0800 (PST)
Received: from localhost.localdomain (62-178-82-229.cable.dynamic.surfer.at.
 [62.178.82.229])
 by smtp.gmail.com with ESMTPSA id r6sm55418683wrq.92.2020.01.02.02.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2020 02:02:44 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] drm/etnaviv: determine product, customer and eco id
Date: Thu,  2 Jan 2020 11:02:16 +0100
Message-Id: <20200102100230.420009-3-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102100230.420009-1-christian.gmeiner@gmail.com>
References: <20200102100230.420009-1-christian.gmeiner@gmail.com>
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

They will be used for extended HWDB support. The eco id logic was taken
from galcore kernel driver sources.

Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 17 +++++++++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h |  6 +++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
index d47d1a8e0219..253301be9e95 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
@@ -321,6 +321,18 @@ static void etnaviv_hw_specs(struct etnaviv_gpu *gpu)
 		gpu->identity.varyings_count -= 1;
 }
 
+static void etnaviv_hw_eco_id(struct etnaviv_gpu *gpu)
+{
+	const u32 chipDate = gpu_read(gpu, VIVS_HI_CHIP_DATE);
+	gpu->identity.eco_id = gpu_read(gpu, VIVS_HI_CHIP_ECO_ID);
+
+	if (etnaviv_is_model_rev(gpu, GC1000, 0x5037) && (chipDate == 0x20120617))
+		gpu->identity.eco_id = 1;
+
+	if (etnaviv_is_model_rev(gpu, GC320, 0x5303) && (chipDate == 0x20140511))
+		gpu->identity.eco_id = 1;
+}
+
 static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 {
 	u32 chipIdentity;
@@ -362,6 +374,8 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 			}
 		}
 
+		gpu->identity.product_id = gpu_read(gpu, VIVS_HI_CHIP_PRODUCT_ID);
+
 		/*
 		 * NXP likes to call the GPU on the i.MX6QP GC2000+, but in
 		 * reality it's just a re-branded GC3000. We can identify this
@@ -375,6 +389,9 @@ static void etnaviv_hw_identify(struct etnaviv_gpu *gpu)
 		}
 	}
 
+	etnaviv_hw_eco_id(gpu);
+	gpu->identity.customer_id = gpu_read(gpu, VIVS_HI_CHIP_CUSTOMER_ID);
+
 	dev_info(gpu->dev, "model: GC%x, revision: %x\n",
 		 gpu->identity.model, gpu->identity.revision);
 
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
