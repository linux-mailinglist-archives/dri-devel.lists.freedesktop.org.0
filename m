Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C89AA06EA
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 11:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 100AE10E3E2;
	Tue, 29 Apr 2025 09:20:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="X8XdpFmK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FCFF10E3E2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 09:20:43 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-73de140046eso683983b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1745918443; x=1746523243; darn=lists.freedesktop.org; 
 h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ExKjWtsve78lQi8SE/lpl6CdGXeN4uhSj147JMScLyA=;
 b=X8XdpFmKYKyEyHNsQUIzGE8yjpb8FJRKK1iIzDEbVTmBVczYoRyZ73pwQdMv1ncAqD
 ZTYNmLS6q/W5PVfq3JNAa1BVv2aZjU0w65GPl6m48sfWJ2Fqf0QtBDIeb33WNCiYCqGt
 imZlNyaP/tL5m468TMnEoEOGQZi5CYwCQUSaLo2Gn9I5ZlVqiKerDhqsqoyjjnQVUXsw
 6UtWyNkldl7OmBUzJpa9tudE8HkK3nH7QPJiwcRfSX13EJAwp8yppv9R8y4eHWkwkAXQ
 emjwlo8pfhDiaxbCJWnhCitx2HqGturF7pA5xkgwcDcCsAlERKEQRoK9OujwBwAsKUHp
 V+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745918443; x=1746523243;
 h=references:in-reply-to:message-id:date:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ExKjWtsve78lQi8SE/lpl6CdGXeN4uhSj147JMScLyA=;
 b=OZaEMm8MgUb60m57SG3gjkWPgAInPBtFf2cQcOub3tGwhIj8/PS0XGcowI7YisMzYL
 ZjOLKSzcd8ELcE7M2N/BDGy2lSU2YTuUUt4bqLz9AH2TaxE1BQA5QwPIianPUPWfK7jR
 GVszi3soJe9o9TQ4JFx3U2c7lnkqCJrdozE9fkVDlAa/hwtZlE4IaeDgyA0Wbr4ZuxK7
 HwLetKrlWcl+CT2gBY483R35r/LthC+tiAEW3tMnWAT9Td/jK+CctgKM2s6YBzk528Xk
 mixUbbNO+fycr3WY/7o6q1ElMUPdiXi0pb8cWWtrarBFKQigp2NKAuDuQQY1D3AOCJ8u
 xXYw==
X-Gm-Message-State: AOJu0YwlJGk5jlGPOXiaP8oKtbzMHVPGU3Q62JYz0zZjLv1uiJo9VayV
 Hvd6ivgu+cI0KZR5yhsgD9VVsmYDWZ+NDpiHeDFsVLDysQO5d9JOUFWzhj1kHmzTT/omBs4lM6n
 IXLY2bQ==
X-Gm-Gg: ASbGnctng4pFDsOsuDyOHSzcjNDu7kmCOiF/qxzeET5G5B93J+mAEM/reGmEKAH/VqV
 qbNq7k6mRY8hpPaw0+f3tS1CXzXBclAUZu5NnVmn0evKCWJaaJrGfAeSh/fJiBxzW3AjKEkwmOY
 DDK3ejz8NGuiQDsdSSFyzBQ5UDwgFANu1zhCmR/tKjndvilmCfJvDI4q8LO3AFraDmwCNM1Nh+F
 t4V8j1uK++/fXWmmbv70iy8FzVMNPSaJCuZIr1IuHtzcdhqQhHDtARUOnBLa5nGXQp2K4daHrK9
 7GMiqQiPQdQxXgFbBT9NYCh1CrxnXwHLgVjBVvXnxfWh0QNACu4Bu8Qeew5DDjUjrO0Q7BpvVDb
 g4+ATMmVDGfC7fKk=
X-Google-Smtp-Source: AGHT+IH2iMzn53CRF+NGQzGZLWpsfyRGmknpAdNrvp1TjSVKEinECj9Y8/CPcYuQ77gfTWQW6bwtWA==
X-Received: by 2002:aa7:9a89:0:b0:730:f1b7:9ba9 with SMTP id
 d2e1a72fcca58-74029152ec2mr1011875b3a.7.1745918442626; 
 Tue, 29 Apr 2025 02:20:42 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 02:20:42 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v3 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
Date: Tue, 29 Apr 2025 17:20:29 +0800
Message-Id: <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
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

BOE NE140WUM-N6S EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45

70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a7ada5382c82..4bbd11d57b28 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1939,6 +1939,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
-- 
2.17.1

