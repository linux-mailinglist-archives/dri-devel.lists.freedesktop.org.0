Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86968B56088
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 13:45:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7521810E011;
	Sat, 13 Sep 2025 11:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="MkEkMMbn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62C10EC3B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 13:11:20 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7725de6b57dso2460377b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 06:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1757682680; x=1758287480; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5lYJndhwGZVcx3e86xFchJKHdcqwz922OhwJ5EumsKA=;
 b=MkEkMMbnd4hatI1ClvN0dr1kBRq7azZ/qRCDeZsIiJWRd6qXYmTcMph5cUYiW3rezx
 g/Kr4jaH5BYiKXzt8xQbZodtFMPBl/8784UVJI3A1WOdajUTc35zW6xfmexPntikSCIT
 HxGOUmHacT0XXjjKUENojukPEkzVblnimgDCCjMB6zXsAahGcuYpvrrUMnM/c6SblR30
 Ru1QYTaGLbeKxm5lJhAjL6lPtpBAUYu493rFppLVJ0lbbwZHupiyngoBKSQLlJS77CrV
 DMI7yEqsJ9JZ/BAIgOH25+kWqrk9zgRY02YGYY2JH5bprzp2nKvmjQNh0dQxhwF52IQX
 ZEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757682680; x=1758287480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5lYJndhwGZVcx3e86xFchJKHdcqwz922OhwJ5EumsKA=;
 b=kwIfNKgyW4gwcG6woAFnrA3wVOiLgN1+oPhLnvzwY/FhvzLGsxDD8XFj7cuHBNJOgI
 hhbRsBuHFMcACSD9LMsu0/3EnKV6Zds1se6/il3NhjeD0FXN6O8OGsTx9fru0aPS1yyx
 +oAcTFUijIaNljdq9Q9yZWi45ItrO/uuKGYiUHRKHGtTSL+HlKR1IbmU+cbab1XX/6Kq
 auFOiAcYkwAaQgIqZB17YKxVaJ0JwfsAscXDBVZyPgud/2ke5Txc/CVg6U/jK5WMsAHT
 ZUUOXNqumUZBGI+4s3xyscXFJFVSaxZJ91Ik7U9/eqE45xVe4N1lVlmkJkThvWA3eyB8
 Y/Gw==
X-Gm-Message-State: AOJu0Yx1fXREjVs9V9gltkEIayqrP2X/VBzNncIdmurastBh1ov5afTj
 zS9VXAX92rAWIsjW7HXgE7RqoyL2KVmx5mUvLlTmAU2TcJX4K27lk2n4bnuse7XKG0g=
X-Gm-Gg: ASbGnct88qwtyNt4Lw6kNoke0fBBhtVMK1t8ausRlpeQmoN94Shodan0VyBdQyLrksK
 u8ghetwFnRrTNWVL2CX8pkogom2Ff1FMEgF1v55xY5cI06ZPE8Ajn4Ym+totDGTPKof4f71/e21
 gSHCzCwGYgP62HTQHIarEUxhsHIxlaFsMfdz+YBdBHKPSx5vxOiWbc1lcWVxJuKQQIOngRHbhL+
 RtNjA9jLazqC77RbRMFSbMkCtHiatVA6pY/mgX7UQxIgNIKPqVZBQxy7WEyv6hGJk8MZYf0A6Ct
 Tf5gW037WeEjzgLE3F66O2wWEL9sNmLM8QBhpIl0M7uTdKOWnQ2CNRt9ALcHBlmuksSnCsFI1H3
 A4EDL+LvEKEiJNp7QVGKGF6thZbzj8mPqwxRsdyGM1IqYUSVVyI0DHPYdtwI=
X-Google-Smtp-Source: AGHT+IFEAfQaJvImfeU+Sk332OoSdcbRzDlcnv9+uIupkz35lfqKRBWb80cXg6os9Y5lTDSczShf6Q==
X-Received: by 2002:a05:6a20:4321:b0:251:da24:9435 with SMTP id
 adf61e73a8af0-2602c91053dmr4105496637.52.1757682680347; 
 Fri, 12 Sep 2025 06:11:20 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a3a9e25bsm4724864a12.47.2025.09.12.06.11.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 06:11:19 -0700 (PDT)
From: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
To: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
Subject: [PATCH] drm/panel: add support for KD116N3730A07
Date: Fri, 12 Sep 2025 21:11:04 +0800
Message-ID: <20250912131104.1726775-1-yanzhijian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Sep 2025 11:45:22 +0000
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

Signed-off-by: Zhijian Yan <yanzhijian@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 62435e3cd9f4..2c8536c64c19 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2046,6 +2046,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1212, &delay_200_500_e50, "KD116N0930A16"),
 	EDP_PANEL_ENTRY('K', 'D', 'B', 0x1707, &delay_200_150_e50, "KD116N2130B12"),
 
+	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0110, &delay_200_500_e50, "KD116N3730A07"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x044f, &delay_200_500_e50, "KD116N9-30NH-F3"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x05f1, &delay_200_500_e80_d50, "KD116N5-30NV-G7"),
 	EDP_PANEL_ENTRY('K', 'D', 'C', 0x0809, &delay_200_500_e50, "KD116N2930A15"),
-- 
2.48.1

