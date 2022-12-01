Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DED8F63EC55
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 10:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55910E595;
	Thu,  1 Dec 2022 09:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2C1A10E594;
 Thu,  1 Dec 2022 09:22:08 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s5so1477706edc.12;
 Thu, 01 Dec 2022 01:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZxpUnfBd0p8vcBE3KJWC/GuBXuBQqcwTN9Z0iX5mpvg=;
 b=HD5y/WXR910sg83kjV2BWWD+qL/7BH8Xo4u7soFHYUr5CtSS9XJJU6O7ZscoquM91K
 6i8CKACWUqe/EphfLVNL2AHfOvDiEB044SEXeiwUHAsO2Jug0lRYot3mwxw96t79SLgK
 2iqa6epHYKcFXijhbisR/YZ3N9lhnp//SQWLMlTdL958FSj2WhAvDdmJIWdcfV7iFcP8
 tTj8SjoHaM4lifnQ1ICKCqtYfDBJitNjdgyn11dBfVbHqs2Dh+PsU617DNKiLxHj7vXx
 ASv/A9z6YvKKX9AVQwdse0/25qgPMFHyAACGc+tmr8vfUArHhK+A/P+quLM8po7jBoq3
 IwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZxpUnfBd0p8vcBE3KJWC/GuBXuBQqcwTN9Z0iX5mpvg=;
 b=uLufjz04DCZU2K+Yvz9+RfR9EVLVj6dsOkD/WKHh7qtpxvZ9CPhe0OUe93O7z0dNjw
 o/muyVJ9VOGNyJnMs5/thQbeC96rtXLt9Fz2/agwESo7o8c8NXn1zRc0xZIHgVEo1Qz7
 OIKCGWF5epZkICFobKs19oPSd0FBd412YET89SGO1FEpbgTsonOCylYplu7dO3pUOMAx
 qlFsKDi1PHQymgrOTUoHcV8W19Y1RaoxsWK0eKBEQfTYLUUTkjcN0J7DWB8ddwgf2xGb
 UagaflBnKv6JlNinzao/XYUddhM0jrsHt4BqE/2CW/zLkJUO3/5HZW0jYt5VgECM1YGT
 N5bQ==
X-Gm-Message-State: ANoB5pmEEtvBo7/0BYuTkbKyk/w1rIMisbXWSNAFIjKJ1tHzDro/AMZF
 PieVbhhXCE1ruLjPSQxSn2I=
X-Google-Smtp-Source: AA0mqf4/z8IWZm6GF+afL3r9Qn6kOIeqai5lAdazdtaxlhi3u/3DQBDzJbdDNAkDm3voiXgaDjvn1g==
X-Received: by 2002:aa7:c042:0:b0:462:2f5a:8618 with SMTP id
 k2-20020aa7c042000000b004622f5a8618mr59546512edo.42.1669886527062; 
 Thu, 01 Dec 2022 01:22:07 -0800 (PST)
Received: from cizrna.home (cst-prg-44-69.cust.vodafone.cz. [46.135.44.69])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906211200b007b29eb8a4dbsm1587879ejt.13.2022.12.01.01.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 01:22:06 -0800 (PST)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: 
Subject: [PATCH v4 6/7] drm/etnaviv: Add nn_core_count to chip feature struct
Date: Thu,  1 Dec 2022 10:21:27 +0100
Message-Id: <20221201092131.62867-7-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
References: <20221201092131.62867-1-tomeu.vizoso@collabora.com>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, italonicola@collabora.com,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR VIVANTE GPU IP" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We will use these for differentiating between GPUs and NPUs, as the
downstream driver does.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h  | 3 +++
 drivers/gpu/drm/etnaviv/etnaviv_hwdb.c | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
index 85eddd492774..c8f3ad2031ce 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.h
@@ -50,6 +50,9 @@ struct etnaviv_chip_identity {
 	/* Number of shader cores. */
 	u32 shader_core_count;
 
+	/* Number of Neural Network cores. */
+	u32 nn_core_count;
+
 	/* Size of the vertex cache. */
 	u32 vertex_cache_size;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
index 3f6fd9a3c088..9fc5223299e4 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_hwdb.c
@@ -16,6 +16,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 128,
 		.shader_core_count = 1,
+		.nn_core_count = 0,
 		.vertex_cache_size = 8,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -47,6 +48,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -78,6 +80,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 512,
 		.shader_core_count = 2,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
@@ -109,6 +112,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 1024,
 		.shader_core_count = 4,
+		.nn_core_count = 0,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 2,
@@ -140,6 +144,7 @@ static const struct etnaviv_chip_identity etnaviv_chip_identities[] = {
 		.register_max = 64,
 		.thread_count = 256,
 		.shader_core_count = 1,
+		.nn_core_count = 8,
 		.vertex_cache_size = 16,
 		.vertex_output_buffer_size = 1024,
 		.pixel_pipes = 1,
-- 
2.38.1

