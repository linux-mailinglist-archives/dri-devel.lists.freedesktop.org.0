Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC067DF33F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:09:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACB010E886;
	Thu,  2 Nov 2023 13:08:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD610E888
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:08:57 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-507a55302e0so1143086e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1698930536; x=1699535336; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFt8qx5/VkaT0w4Ob6Qkcx9QhSIE50uMokOUdXnanY8=;
 b=p64OlxiqZRcdUzOhldzfXrytznCTWNXXTuNyUAmC0MaaDhQQhcKqCMJZKtMGFzhfc4
 FCUQzVmv8dNb6e+O+OR0fIy8u8CDbH0/rTMI/FA+XLd0hnlYiBN7DmUh+OJydgS3pkpD
 E3UIoS5ovtJqT2nqaY4HaiDWSzRctLnEtmtrpIuf6EKGyOahTlbzqqz6XfinLc9jI2YV
 SxIXTUNe6+CZ91GNOkXkuRHOfk5JSPnum+ZIDYqU061ikOABmLuVbnmtAwrRshFoV2D7
 OSECluWHipMcH3AF3CmE630WGPboC/CMadwRrV0janHLndZo0IAKu/61JNFtUireqZxk
 XRgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698930536; x=1699535336;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFt8qx5/VkaT0w4Ob6Qkcx9QhSIE50uMokOUdXnanY8=;
 b=vV6ySKwzDhqAU0/a2dC1IvzUzAjuSASagpohuKcYo7iytnAp4GpKYnC/9mAMyPV+9f
 NBy0AkPC66FQmhcMjMEmQyZvzPj3aVSpm+M77spHG+eagcP63+Cf7QRbsNkavIoojA4a
 xtaHqghnIk6qb6GvuGjW/aut7B2DVBG5df5dSpnKSB2TabNvnVGqx6YC5F8CdAXD2Z+q
 pAAxFklKxjiZluUATH0lrUDQDGtttOLompl5GDyVddWrnMdAIdoHIWpACLBC2Nteykv0
 +xp+BelzliJADLPBsTFTbWlj2kIavopTScDqLNfMc4pr7nz9w0fNKE0U9u4SglCosU5D
 vWLA==
X-Gm-Message-State: AOJu0Yzez4Y+PAbYf48af+NigmLhjJd2NHpHmh4XUmDXsxVbc3jdyfE3
 3V+o3G15i2XYIwYV5+zkYkyjtg==
X-Google-Smtp-Source: AGHT+IFa/tktj8xpd3HY1dQDdbCXt+HxfjGK5HEwlShWN9LEryh7eWYpXvAhR+DD91d/nF/rNXK1qw==
X-Received: by 2002:ac2:420d:0:b0:4fd:b1f6:b6ca with SMTP id
 y13-20020ac2420d000000b004fdb1f6b6camr11936238lfh.25.1698930535702; 
 Thu, 02 Nov 2023 06:08:55 -0700 (PDT)
Received: from ubuntu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 j15-20020a056512028f00b00507ab956ab9sm484167lfp.147.2023.11.02.06.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Nov 2023 06:08:55 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH] drm/panel: starry-2081101qfh032011-53g: Fine tune the panel
 power sequence
Date: Thu,  2 Nov 2023 21:08:44 +0800
Message-Id: <20231102130844.13432-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
 xuxinxiong@huaqin.corp-partner.google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For "starry, 2081101qfh032011-53g" this panel, it is stipulated in the
panel spec that MIPI needs to keep the LP11 state before the
lcm_reset pin is pulled high.

Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
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

