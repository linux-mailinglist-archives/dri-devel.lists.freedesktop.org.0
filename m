Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF3875B98
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 01:48:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0329E10FBC6;
	Fri,  8 Mar 2024 00:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="vBUvEBZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C1E10FBC6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 00:48:11 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dd10a37d68so13619215ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Mar 2024 16:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1709858890; x=1710463690; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cRm8D61etT1wEE9ZqTXPR465tYE154OjnBr2zkyvLfY=;
 b=vBUvEBZfFVJMRqufhI7UEOOskyJJBs4Qe229Y0Cg5qeoJNGQZT/Wq1lZH39dyv3ulN
 jmZT5G44nmWwDKoFT3uhvVAQbS3Ym7rzT3ljlzrIsLcHRIFzCwdPLMp3V6+kxoEUARXj
 PTD29DDzC9nrvg9FU5xA9O2kvniq1+1iAi+rMCjo736OBJG9keSDR4gLAj/tEJRhtMVo
 ZiKjAXnJLFcmyE5rBBNRwZ5wR9RcM5S999NOda8CFhTLqRPlPfPCdITGbiqVFehLFMRw
 EOGcmSf4d6uz5HAmmKUi1snsSnbLJweJFqMRzC5szbf/6E6DfZYHx7gi/Tfd+vmcQz1M
 BYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709858890; x=1710463690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cRm8D61etT1wEE9ZqTXPR465tYE154OjnBr2zkyvLfY=;
 b=jeb+gguPobCEE/lqnNMwaCN9WjQYPR3CcJ5mDxzwpe9IzrC6jRRa1UoqMZF6BhgWbo
 iodDUAnP/VfFrLFnLI83X9y4NIfLAc2LR4dZ70r9BTkKGvsihhYmEnuLJnhVV96vdZAy
 ZVd8E5ayw/7bI8JKUF2VWpsJKS8UpHqso41YJZAlax6tLpfZxsmogOftGFUN8kXjzD6g
 N35WSUPkkB3mWooRhIRiDeYHc5tbX/IoZnETPU/qdiWjslbxehyE3Lw8E5RpXlx+mr3x
 Sn58BAE69+XHkucbMuwhujqY7W5TrJbsRGRkfj0f5rGujKtVBcZwhYtaJFqKV42NWD9P
 kcdg==
X-Gm-Message-State: AOJu0YzopmDOmys8BFnwrkCGRkWegE1JT2VnsjKK+63sMZxeRv7dkMZV
 yuQTOmtgmn9cpE5xv2CrwAtcruTBlVK0FPZlUmnSmZ/QEaIUwsF6bCn7Pkr9S0c=
X-Google-Smtp-Source: AGHT+IENi1OtAYtCq66iswHj76HX1V9umjMChq2vno/A5VuNp8Xeqzs/a0D0DwP3R6xNOwINfRfFcg==
X-Received: by 2002:a17:902:f705:b0:1dc:a844:a38b with SMTP id
 h5-20020a170902f70500b001dca844a38bmr10788072plo.67.1709858890503; 
 Thu, 07 Mar 2024 16:48:10 -0800 (PST)
Received: from xu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170902c38c00b001dc819f157dsm15233055plg.251.2024.03.07.16.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 16:48:10 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>
Subject: [V2] drm/panel-edp: Add BOE NT116WHM-N44 and CMN N116BCA-EA1
Date: Fri,  8 Mar 2024 08:47:57 +0800
Message-Id: <20240308004757.1048284-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.40.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the following 2 panels:
1. BOE NT116WHM-N44
2. CMN N116BCA-EA1

Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---
Changes in V2:
  - Updated the subject of commit message.
link to V1: https://patchwork.freedesktop.org/patch/msgid/20240307094433.3440431-1-xuxinxiong@huaqin.corp-partner.google.com
---
 drivers/gpu/drm/panel/panel-edp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a0b6f69b916f..e21b4bb2bb3c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1952,6 +1952,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1138, &innolux_n116bca_ea1.delay, "N116BCA-EA1-RC4"),
@@ -1963,6 +1964,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1154, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
-- 
2.40.1

