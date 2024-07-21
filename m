Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5386093B1E3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 15:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08AA810E6CA;
	Wed, 24 Jul 2024 13:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="2Ua3SOVO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DC010E20E
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 10:04:56 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1fc56fd4de1so23763755ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jul 2024 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1721556296; x=1722161096; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m4KDhT5gq5T8T7VRjwwTI9Oh7Vqbyn6hUU8M3Hurzss=;
 b=2Ua3SOVOmeEHKfHvZ1ZIjnl5JwUizMprRdwQl6+UKh3qe9Fe3eN6Tu/foC8YDcT7dR
 olMDzli8NsoCTb8tRDbPoMTWGHCq8j6W12V7Yq39KwFQDVR4hXBTiHAdq7DtNUHJ/npA
 4cbwwO7kP/92hCUGYPlN3DqjShVL0fQCOrN3Qd3zPLvcdF9W6AsI/xbzp5fz6poEMiNy
 SD6L/URGCPpgiXM1ACHxsb63To75QO7yLaDIOtNVb+QAkvRUvzZ07ux5CZs1k6BBzKKz
 Wbom9ubTk0G+iKHigt6NxN04xdLWm3xZcF6Mwq1LctcEnzG+8IZed4dGwJNOUDwd8IDK
 r2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721556296; x=1722161096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m4KDhT5gq5T8T7VRjwwTI9Oh7Vqbyn6hUU8M3Hurzss=;
 b=aWEMgYk8Voxf98tKA2DxsvJn0PwiGTVo8MY+2ThKSU+GU6rFtrWWRIvTlE3iMxIb1F
 txAnuQLRmMgeFr7d6apJnDo6//fl9nlbxsnQB8VlcyjErWZY5yxe0MAf0sz0BieMw7hD
 9DV+P2RtiaF1rF2YEYHvemJiWETcQ/eKlYJeg0WGwGjyJXvhCfzq62DjMHQ3UdCNFKML
 7uEmDOK34UQVGzDYB1XTCdwKvfeMxOYV4248PZmTIGPKp2WPkqqNSXgPUdLZw/kb6Xdb
 z08Q4EmfmEt+IWPLMbBHz4IjLlXM6TKDl0jSfgUeIHMnOPRxEYxxwhwX3p84wasCqPgA
 kXHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSqsUHAaV4k7vELWye6rFYL/Sdc1JKqbNTyuNDd7OPp//lSmmQ29g6R8YTvpnbppsuah71xtE4py/56wZaCP8PiHKJHAtK6XTSd8umYuzu
X-Gm-Message-State: AOJu0Yx+MNnLsXXpOLert9i15OROi6t05m4nLBD6Q0codxSGkYCQBxPe
 Z2fHaIgEwES34Gwil88hzzRk+Mu0alLdARP9sqWSKojLHKjzsChf+x+JezJXoh0=
X-Google-Smtp-Source: AGHT+IFVSboySOiEcC1bu7V7Yiv5SI5UwSYP3NV3Bf6wk2PDijqWXIEuJnfYp9OyRHsQd8nY0JpqEw==
X-Received: by 2002:a17:903:40c7:b0:1fa:97ec:3a4 with SMTP id
 d9443c01a7336-1fd74d16afbmr75953575ad.8.1721556295852; 
 Sun, 21 Jul 2024 03:04:55 -0700 (PDT)
Received: from terryhsiao-Latitude-5490.. ([150.117.130.219])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fd6f31c5a6sm33911155ad.180.2024.07.21.03.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 03:04:55 -0700 (PDT)
From: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
Subject: [PATCH v2] drm/panel-edp: Add 6 panels used by MT8186 Chromebooks
Date: Sun, 21 Jul 2024 18:04:49 +0800
Message-Id: <20240721100449.8280-1-terry_hsiao@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jul 2024 13:42:47 +0000
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

The raw EDIDs for each panel:

AUO
- B116XTN02.3
00 ff ff ff ff ff ff 00 06 af aa 73 00 00 00 00
00 21 01 04 95 1a 0e 78 02 6b f5 91 55 54 91 27
22 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 e2 50 00 1e 30 26 16
36 00 00 90 10 00 00 18 df 13 56 e2 50 00 1e 30
26 16 36 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 50 05 18 7d 20 20 20 00 67
- B116XAN06.1
00 ff ff ff ff ff ff 00 06 af 99 a1 00 00 00 00
00 1f 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 3a
- B116XAT04.1
00 ff ff ff ff ff ff 00 06 af b4 c4 00 00 00 00
12 22 01 04 95 1a 0e 78 02 9e a5 96 59 58 96 28
1b 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ce 1d 56 ea 50 00 1a 30 30 20
46 00 00 90 10 00 00 18 df 13 56 ea 50 00 1a 30
30 20 46 00 00 90 10 00 00 18 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 10 48 ff 0f 3c 7d 0c 0a 2a 7d 20 20 20 00 e7

BOE
- NV116WHM-A4D
00 ff ff ff ff ff ff 00 09 e5 fa 0c 00 00 00 00
12 22 01 04 95 1a 0e 78 03 0b 55 9a 5f 58 95 28
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 96 1d 56 c8 50 00 26 30 30 20
36 00 00 90 10 00 00 1a b9 13 56 c8 50 00 26 30
30 20 36 00 00 90 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0d 40 ff 0a 3c 7d 0f 0c 17 7d 00 00 00 00 1a

CMN
- N116BCA-EA2
00 ff ff ff ff ff ff 00 0d ae 5d 11 00 00 00 00
0f 21 01 04 95 1a 0e 78 03 67 75 98 59 53 90 27
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
a6 00 00 90 10 00 00 1a e7 13 56 e2 50 00 20 30
30 20 a6 00 00 90 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0c 3d ff 0d 3c 7d 0d 0a 15 7d 00 00 00 00 0f
- N116BCP-EA2
00 ff ff ff ff ff ff 00 0d ae 61 11 00 00 00 00
0f 21 01 04 95 1a 0e 78 03 67 75 98 59 53 90 27
1c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 da 1d 56 e2 50 00 20 30 30 20
a6 00 00 90 10 00 00 1a e7 13 56 e2 50 00 20 30
30 20 a6 00 00 90 10 00 00 1a 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02
00 0c 3d ff 0d 3c 7d 0d 0a 15 7d 00 00 00 00 0b

Signed-off-by: Terry Hsiao <terry_hsiao@compal.corp-partner.google.com>
---
 Change from v1 to v2
 * Modify the description of subject
 * Add the raw EDIDs
 * Sorted according to the order
 drivers/gpu/drm/panel/panel-edp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index f85a6404ba58..18a2ba2953b3 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1845,7 +1845,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x73aa, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x8594, &delay_200_500_e50, "B133UAN01.0"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xa199, &delay_200_500_e50, "B116XAN06.1"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
 
@@ -1901,6 +1904,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c20, &delay_200_500_e80, "NT140FHM-N47"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
@@ -1916,8 +1920,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1156, &delay_200_500_e80_d50, "Unknown"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1157, &delay_200_500_e80_d50, "N116BGE-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115b, &delay_200_500_e80_d50, "N116BCN-EB1"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115d, &delay_200_500_e80_d50, "N116BCA-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x115e, &delay_200_500_e80_d50, "N116BCA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1160, &delay_200_500_e80_d50, "N116BCJ-EAK"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1161, &delay_200_500_e80, "N116BCP-EA2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
-- 
2.34.1

