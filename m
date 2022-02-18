Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0603D4BBB4C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C868A10EE13;
	Fri, 18 Feb 2022 14:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7594710ED72
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:56:38 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id k41so5445932wms.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ShbwZ80LmFKnV7XTCTWddvBgAcwyS+Rlr/cQnWDh+r8=;
 b=TlvVaSawjag5QcCFrxOeydzjezBCwYA71bAh5NjNpv3SHN6mqttytcIZ1ZgpBwKBhm
 rfezW9xKGlKKy1maOF0q0bZ8eb7bdAdt3KImIxdsP4RGbc6xusqEay/AvTrvAJqQFXG2
 dFIYcwHJUnJKRK5mHz9wwLo7pz8tFPX24yMCFluQA8LhYto3jG+pxfhSE4BHc4ydSuYQ
 FWjcKhv99vqLAw5J5Ij9ED2zWsNF0alEUiHfeRsqnM9UnQlIlw1hoP080u7AuNamg0Nc
 /cGm5OlLFhP3l+rDTAT9YHDNeOe/jnE801jLgnj8e3a6tQD+NefNHPIkBSjT29J3iuSe
 Lsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ShbwZ80LmFKnV7XTCTWddvBgAcwyS+Rlr/cQnWDh+r8=;
 b=M0S0PfBXLabeVA2mYmwZOANMn6KT5IsCrn3M7sa0R6XnM68+yNlRGkzxNqglQ9fiFc
 9eJgXpJvtvLapGxRDh83/ILDlctu5PcgqDdF7S83tLHjv1Ud36DPkluUmjKbsjqh9/Ao
 R0btl+0z+6glxy3WkLT8UDx2hYJAdCrPjo90M++xQZTv4FJ5oTfa0OPwyEvpKovILtVl
 3ejeJu4LRQ6NAFdEz8oD4cvQ72Fv2WeCB22ZvFyH/0zaISi8rnStKZJVblEQnz/U+eMx
 yUlPsMNxcQrBauQt0YyNF/d2s1zw9keLbxLA6673Y+8oJpZvKnZdDLaQ7pyIIyf6sdH2
 ueVA==
X-Gm-Message-State: AOAM533CSj2TUtAUhuu3hu41sAlOj4AbMDZc1ryU3BJmst//jdjHIOgy
 60mFSSv79NjfFzzBWx79WpEqmQ==
X-Google-Smtp-Source: ABdhPJxQb+ScIrjd3rfZdwkrYFFMK8Y51NEi9X9M09wLIOSbidtouCx2ztOxoRTCWFl9dttaBKNF5w==
X-Received: by 2002:a1c:4408:0:b0:37b:c7f0:a36e with SMTP id
 r8-20020a1c4408000000b0037bc7f0a36emr7420230wma.186.1645196196839; 
 Fri, 18 Feb 2022 06:56:36 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-3b28-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:3b28:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id b10sm47431454wrd.8.2022.02.18.06.56.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Feb 2022 06:56:36 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, kishon@ti.com, vkoul@kernel.org, deller@gmx.de,
 ck.hu@mediatek.com, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: [PATCH v8 18/19] drm/mediatek: change the aux retries times when
 receiving AUX_DEFER
Date: Fri, 18 Feb 2022 15:54:36 +0100
Message-Id: <20220218145437.18563-19-granquet@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218145437.18563-1-granquet@baylibre.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jitao Shi <jitao.shi@mediatek.com>

DP 1.4a Section 2.8.7.1.5.6.1:
A DP Source device shall retry at least seven times upon receiving
AUX_DEFER before giving up the AUX transaction.

Aux should retry to send msg whether how many bytes.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index fe91ab8b2fd89..4e880d8a8a186 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1879,7 +1879,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	bool is_read;
 	u8 request;
 	size_t accessed_bytes = 0;
-	int retry = 3, ret = 0;
+	int retry, ret = 0;
 
 	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
 
@@ -1913,15 +1913,21 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	}
 
 	if (msg->size == 0) {
-		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
-					     msg->address + accessed_bytes,
-					     msg->buffer + accessed_bytes, 0);
+		retry = 7;
+		while (retry--) {
+			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
+						     msg->address + accessed_bytes,
+						     msg->buffer + accessed_bytes, 0);
+			if (ret == 0)
+				break;
+			msleep(50);
 		}
 	} else {
 		while (accessed_bytes < msg->size) {
 			size_t to_access =
 				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
 				      msg->size - accessed_bytes);
+			retry = 7;
 			while (retry--) {
 				ret = mtk_dp_aux_do_transfer(mtk_dp,
 							     is_read, request,
-- 
2.34.1

