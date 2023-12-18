Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F88B8179D4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1D7910E3A1;
	Mon, 18 Dec 2023 18:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CA610E084
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:35:43 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-77f3159d822so259985085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1702924542; x=1703529342; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sy6k6O0gnka0FbbvIFBJRob1aY75ND6ZFq7nHnki2Ho=;
 b=CnMZb3jydxdgQmiRweppp/OPlZrNkfTCQvpyA4iI/oIt+T8OexnvAM/jwGzbsrdPnh
 TseQWLQ8OKsD50LGK7pflJFPF/l0A5OFVuQsckaWuOaY4P585/+Zq958YkN1O9CEOqCr
 hpJMj3lxS2M9DQDLLtx+ycjaIz2Z4HmRSQVlwlbFMNtZ08WsTRLqjfquAw13fkwoxXGw
 joFb885enWn6mZwyCU/viiaLd3zEpSfEvwOAIOh6R7R0eMMZlDXydFlpgaJVKxoc7EbP
 lCnaDHeCr8eAMAymg6iBDv79yZUARGgp+KmsF8Bh2VsbJx5NOQBFEfbwOG5X7JxA11QF
 Bfwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924542; x=1703529342;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sy6k6O0gnka0FbbvIFBJRob1aY75ND6ZFq7nHnki2Ho=;
 b=JKU9CadBOWoh3IZVEicTOuA48QxVPqwpUr0sU4QYerKhIXpf2KHm0g68nl8MyaxGnS
 O14WHnHWHHNL5Ac/if9Ein3QzxCK2JDquUsj6QMK1Ogz+jVkN7REKXStAXVVfebQtVD6
 HEZ2OW4TzQftZ1qdJzVLC2a/wPlW6P9oaCdgSYcAjK+TjmhK18d21dZBZdjePwsVB3TD
 KiH/ztk11nqBAtDvYs+1J0QnBshElrRBCyE90nZ6ErUjJbPpv0ZV5Gst42plhJKca87G
 A1325QvrY3Z9v8PLfvesn3Y3HeJpy2BOBczbmtmOHYyMg9I7b1SLtPm/rcm6hw9BtlBI
 9hvw==
X-Gm-Message-State: AOJu0YxGrMn1g/8ZdwFj3VqvJlCP0uvw3o3OgdVBTS6ZDQayVxepRNBF
 PpBHFkMotQNhD/bhTSYisR259HCtajMlipTWmYU=
X-Google-Smtp-Source: AGHT+IHO2lwtkTr6e6g4w5HE1ZOX6syB/PnhjRdnQee+I0Iem3MIJVAFE0+R348FIJpOKDA3rfRy4g==
X-Received: by 2002:a17:902:7449:b0:1d3:bb08:70f4 with SMTP id
 e9-20020a170902744900b001d3bb0870f4mr340215plt.60.1702893595855; 
 Mon, 18 Dec 2023 01:59:55 -0800 (PST)
Received: from xu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 l16-20020a170903245000b001cc8cf4ad16sm3559451pls.246.2023.12.18.01.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 01:59:55 -0800 (PST)
From: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Subject: [PATCH] drm/panel-edp: Add several generic edp panels
Date: Mon, 18 Dec 2023 17:59:33 +0800
Message-Id: <20231218095933.2487360-1-xuxinxiong@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the following 3 panels:
1. BOE NV116WHM-N49 V8.0
2. BOE NV122WUM-N41
3. CSO MNC207QS1-1

Signed-off-by: Xuxin Xiong <xuxinxiong@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 95c8472d878a..454c2398184f 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1852,8 +1852,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x098d, &boe_nv110wtm_n61.delay, "NV110WTM-N61"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09dd, &delay_200_500_e50, "NT116WHM-N21"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1139, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x114c, &innolux_n116bca_ea1.delay, "N116BCA-EA1"),
@@ -1863,6 +1865,8 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
 
+	EDP_PANEL_ENTRY('C', 'S', 'O', 0x1200, &delay_200_500_e50, "MNC207QS1-1"),
+
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x057d, &delay_200_500_e200, "R140NWF5 RH"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854a, &delay_200_500_p2e100, "M133NW4J"),
 	EDP_PANEL_ENTRY('I', 'V', 'O', 0x854b, &delay_200_500_p2e100, "R133NW4K-R0"),
-- 
2.39.2

