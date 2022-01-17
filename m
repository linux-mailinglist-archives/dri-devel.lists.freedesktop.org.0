Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4167490419
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D5B10E3F4;
	Mon, 17 Jan 2022 08:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5ECF10E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:42:06 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b3so11444272plc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5onbuFYOFRTdmiOefhelTPb1vtwXuvBGEeko4zL+Gus=;
 b=lTFBGVb3VI9Pp2XzCX2o8oK0JNGpsLGozrM3M1pjfrgUTyKilWjfe018znEQQv00kV
 uCJ9mZYr2imldsl/X7kKLT/qOTkXfTGSVPjsHAj0hnD5X0jhxQF6pY8Vin51SsJOmeFH
 M79mBIFgVl02iGw6F8gXajYURE5fbTboA6l6Qctc8hRcIdEsAqLNzvPTvnLVJlIa2K2w
 P4aFuwve2uJhkrbDpOESzn8uZUoZdO1BaVxYm5yvxvGRCXcf/QNl9pSPUJ1axlU7jpA6
 IK9On/cYQtiTwawot8vSXJ7AjbBUGfq/B3vtkjSBgMVRtncEg0OqgxJ6T+Am3FQ1FO7E
 DFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5onbuFYOFRTdmiOefhelTPb1vtwXuvBGEeko4zL+Gus=;
 b=mXxR8sU9IryH0PRrlj5IBmkLjt7wwKOaL+qvzaMNN+Ff4n0bdI8z8d4INWpzZjwWSs
 ah/qZU++tBykdKfCeE2Cn7ZWecLktk8MDqSlRX+vZfgswUGsVJZ2zXztAK02CjK9GaXl
 hkVuhcnedHADVZx48utfEUCtCNJuLxCqEaWEU9UgMFeFhB5DEy7Msgi8JqS/cZaks7cb
 3ydO0p0g3Dyq9rYDYw31nyLv4BAYLvbmq2kxQxWxBI0qb/3JugOf8O9PC8HP9BpxrW4A
 8cogANjGSJXZth9w9xbWPaOSKS04KgY+uBQSuxPkHE5c7k2UO2U8bMfJlf6xBrMdqY4p
 L4HA==
X-Gm-Message-State: AOAM533fC10KADgvC0a1bd3KDskn9m5wIFcurbRkwegkEhGFcZk+ZXlp
 yzDPUiQm68PSHWKI+ldSgn4=
X-Google-Smtp-Source: ABdhPJyUyt6ygJ1Q5CL/MBBOFkS0XS5iZbCH1+5RzfcHne//TAXKgwCe8S9+NnrYFtBqbf2mb0udFA==
X-Received: by 2002:a17:90a:380b:: with SMTP id
 w11mr23856163pjb.113.1642408926493; 
 Mon, 17 Jan 2022 00:42:06 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47b:800:d5d1:d9c9:3c3f:6ba3:517a])
 by smtp.gmail.com with ESMTPSA id b7sm6385498pff.61.2022.01.17.00.42.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:42:05 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, mark.rutland@arm.com, javierm@redhat.com,
 tzimmermann@suse.de, lukas.bulwahn@gmail.com
Subject: [PATCH v2 3/3] drm/sprd: check the platform_get_resource() return
 value
Date: Mon, 17 Jan 2022 16:41:56 +0800
Message-Id: <20220117084156.9338-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, zou_wei@huawei.com, pony1.wu@gmail.com,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_resource() may fail and return NULL, so check it's value
before using it.

Reported-by: Zou Wei <zou_wei@huawei.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

v1 -> v2:
- new patch
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 5 +++++
 drivers/gpu/drm/sprd/sprd_dsi.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 06a3414ee..1637203ea 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -790,6 +790,11 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get I/O resource\n");
+		return -EINVAL;
+	}
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		dev_err(dev, "failed to map dpu registers\n");
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 911b3cddc..12b67a5d5 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -907,6 +907,11 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 	struct resource *res;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "failed to get I/O resource\n");
+		return -EINVAL;
+	}
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		drm_err(dsi->drm, "failed to map dsi host registers\n");
-- 
2.29.0

