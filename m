Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D107F3BBE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 03:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5CA10E2E1;
	Wed, 22 Nov 2023 02:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2075910E2E1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 02:25:58 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-5c1f8b0c149so3677871a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 18:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1700619957; x=1701224757; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=y6oaSFdOAfyOWOTmB7DyHEXSPFXvqEW9PprXnybx5JuSExvxcwE7fdY+rIWbJ7Afoh
 xGN5L8Z7mM7iyjqT4Qfr3XL/pNSlskDfVKn//mG1IJ0nfyXD8UHIMh4YyocVav8Fyn9S
 qNyb2GsTUbOIGLNCAktu6fbDmed9xFTWT28w4s/HSannuV1PKpcyLCjkNN+e4A+X5moK
 mdjEDDIDQLCsfSbgRLhcbqCqWjxCRTnb4wtUQl4H33O0hIxAV1XK/p6Fzj/7UILkxbCx
 cxH07AUgM13D8EbqhpQcOBIU91kR3Jxh4kZud4mfJznX4qGOTTeLNlyKk+la25+Vt+di
 JN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700619957; x=1701224757;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=svcfYfXlwDJupdIFsQW7E4a45tIGoCFbMzL7qmh8Xbi08Czr15fTRFWSmfm8qfFPGs
 a5tWF/tS5KgRRZzoKsAG4d4A9X6fOrFo/YK1woAuFmAPXQQPpJEe6FYAHd9geL36HAMH
 QdK+L/VHfMIR+5uUr7AntOT9zYKYbXKXtTlTpgLuHa+aCpzSh3HQsQE9VDJFKmSazsij
 mRMijdpJs3d0DBK1XHgOsOkxJlMlqDY3XT3r5Pr7eTGAluuISvRwlALly5FdyR9aZoHS
 U/oEY45mKLCWxNh4BxGq2fpkZ26NWISrqmIwONMxDfiJGVCI0MhshogrGGMloumo9hO/
 NK0g==
X-Gm-Message-State: AOJu0YypvltnQ9UuSMEyetQ/XuFLwfZU5Nuq1HnvMlvKOmWPoDZkLNf3
 33T1cStXHfrPjd8gCi05ki5mgg==
X-Google-Smtp-Source: AGHT+IEDjRwFmQmbUvi6p1ndGbgqHuxBEb/UCVpo28zRMe3N81nvzXs2ifJB+NXyzbfwvOAcktAlDA==
X-Received: by 2002:a05:6a20:840d:b0:153:78c1:c40f with SMTP id
 c13-20020a056a20840d00b0015378c1c40fmr1116357pzd.15.1700619957452; 
 Tue, 21 Nov 2023 18:25:57 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a17090341cf00b001c7283d3089sm8525108ple.273.2023.11.21.18.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 18:25:56 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 RESEND] drm/panel: starry-2081101qfh032011-53g: Fine tune
 the panel power sequence
Date: Wed, 22 Nov 2023 10:25:43 +0800
Message-Id: <20231122022543.32254-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, tzimmermann@suse.de, mripard@kernel.org,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the "starry, 2081101qfh032011-53g" panel, it is stipulated in the
panel spec that MIPI needs to keep the LP11 state before the
lcm_reset pin is pulled high.

Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel")
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4f370bc6dca8..4ed8c2e28d37 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1765,6 +1765,7 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = starry_qfh032011_53g_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-- 
2.17.1

