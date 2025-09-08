Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A27B4850F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A0DE10E468;
	Mon,  8 Sep 2025 07:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="legzcznT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA2010E002
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:37:46 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b475dfb4f42so2357196a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Sep 2025 23:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1757313465; x=1757918265; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jH4Sjcau6Gi5UxObTvTFnz0/+SFCfd31Xitbpoji5HE=;
 b=legzcznTQIm5GrZRaIBsMluvxXrAp4rjwYb14RYNC2V9sxRM7SjhIAyJAcwxaCwKHI
 6P++eSxb4s4lbOWHnw6YowjtGAamoJ/XA0yrZJ8DmwFzpRUSMAY9CTzXycv4kiJAv1it
 r3epjbjom+yHJy7UTCRDicNAtFYPY5WiClhNDevuHpekPcRnzefGP3xmI/mu0kTKvo16
 h8GL43vAR+f/mrgt0ZewqBJfqkRRx65heSCmYVw4tsmJfVayuZoUBmswhWrvek04npwz
 ID7kAgPXq5jeMuZpE9noyuQ1QSnsb+mSc95h3XZvk2yGHJ44nqX+tlm6mvUDp2hR6f69
 Yo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757313465; x=1757918265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jH4Sjcau6Gi5UxObTvTFnz0/+SFCfd31Xitbpoji5HE=;
 b=PpWRYFMtzoNNdKkwMk7lEghVdxKi8d3RWeh5JYauOCf56xGIDWKZ0wtN+rG6+oisrN
 XDPzRwtwj7+H7hksB0XSmfTMBrTcLYZlJxXoWmMT0TVL5EHxHCIIKwgiICPb/tzcPwhN
 0xLfUXwuGVndbdskxfomi57F0G0D8h5Luf/fBKW93UY2PlctBGUSfg92+6mvZwZHh4H6
 j6YepTQwPUGZTtEtv9tCacY0ZtDmGivMMr9iDba4kN0QkrFh22ssmSLbAGR/rzRxQVlN
 cbZsW0MtQ61ERhLxK1BFP6CdQu/qNEpjK88ltAK3AfqlTk3SoRlYvmwEhMG6mF9IGef5
 kPRA==
X-Gm-Message-State: AOJu0YwkHEtsRpGb5pwIUQKxinIvMe/rPF9348Bvn0xEeQ2TCKywEPGO
 N7QxA2AIT4Z/bVui6rIKY027/eoesvhm1TboRM06Ha4/N+TISb8e3CxioBhr8STCp/0=
X-Gm-Gg: ASbGncsOtam8Da1Ztm72yqPG5tMPitWUYROUFhgJvhbr6QvczgSnDGcObNB4fzzbXa7
 1fPXUWFTgpXQGqufb0IJIM6Fiat40NNwqnlT9cz1C9ABBut2eS0Gr1ncj6vxsW3RnsLcgfBwRzk
 RynZF2za1zQXQKJzuzpMSArwGMsL5j4Tti6F7fTc3p5Q51DjHI3+iSuocFbeH7N89PGSNPhNFgn
 g/lR2TKuj2JNxOxSX9JLHK8lLRsmHiGhze4AOkESDy2l1iFz4AyB6ATTmxvypOk6fvOJsTnGTvd
 rbMYl1aZII+/VVmjr1Agn1xBEBr+G7zpxI8P25lRPq+FYUcQ5LAwAFrFNlIsi9rn93uPdYcDu3b
 NzzgQC23aQ+f1rwOY032CeqARgpujUZPfPvnhwGU+tO8k04eQRviaLqzcin7KEea2qPIQe/HXUx
 TZvNmfaflnL1Hx5Oin5audbaIZZ1R05w==
X-Google-Smtp-Source: AGHT+IGpsO6x4pJoI6pOu49B3RBheMpt1wIY/m392MBVfGJXFMSZA2ZBUu+Pi6i6a+J4DjEW+mn6Dg==
X-Received: by 2002:a17:90b:2b4f:b0:32b:d8bf:c785 with SMTP id
 98e67ed59e1d1-32d43f5a670mr9627596a91.20.1757313465446; 
 Sun, 07 Sep 2025 23:37:45 -0700 (PDT)
Received: from ubuntu.. (202.60.225.076.static.cyberec.com. [202.60.225.76])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329e23858ecsm18097791a91.14.2025.09.07.23.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Sep 2025 23:37:45 -0700 (PDT)
From: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
To: dianders@chromium.org, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
Subject: [PATCH v3] drm/panel-edp: Add 4 more panels needed by mt8189
 Chromebooks
Date: Mon,  8 Sep 2025 14:37:32 +0800
Message-Id: <20250908063732.764289-1-wuzhongtian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 08 Sep 2025 07:25:13 +0000
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

Add a few generic edp panels used by mt8189 chromebooks. For
BOE-NV140WUM-N44 , the enable timing required 80ms. For
CSW-MNE007QB3-1, the hpd_absent timing rquired 80ms, the enable timing
required 50ms, the disable timing required 50ms. For CSW-MNE007QS3-6,
the enable timing required 50ms. For CMN-N140JCA-ELK, the enable timing
required 80ms and disable timing required 50ms.

BOE NV140WUM-N44 V8.2
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 6a 0a 00 00 00 00
2e 20 01 04 a5 1e 13 78 03 fb f5 96 5d 5a 91 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 61 40 80 04 71 b0 3c 40 30 20
36 00 2d bc 10 00 00 1a 81 33 80 04 71 b0 3c 40
30 20 36 00 2d bc 10 00 00 1a 00 00 00 fd 00 28
3c 4c 4c 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 34 30 57 55 4d 2d 4e 34 34 0a 01 7c

02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06

CSW MNE007QB3-1:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 6e 14 00 00 00 00
00 23 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
36 00 2d bc 10 00 00 18 2b 30 80 a0 70 b0 23 40
30 20 36 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4a 4a 0f 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 42 33 2d 31 0a 20 01 69

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
00 3d 8a 54 cd a4 99 66 62 0f 02 45 54 40 5e 40
5e 00 44 12 78 2e 00 06 00 44 40 5e 40 5e 81 00
20 74 1a 00 00 03 01 28 3c 00 00 00 00 00 00 3c
00 00 00 00 8d 00 e3 05 04 00 e6 06 01 00 60 60
ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 68 90

CSW MNE007QS3-6:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 3f 14 00 00 00 00
00 22 01 04 a5 1e 13 78 03 2c c5 94 5c 59 95 29
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 ea 3d 80 c8 70 b0 2e 40 30 20
36 00 2e bd 10 00 00 1a 88 31 80 c8 70 b0 2e 40
30 20 36 00 2e bd 10 00 00 1a 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 53 33 2d 36 0a 20 01 80

70 20 79 02 00 81 00 14 74 1a 00 00 03 01 28 3c
00 00 00 00 00 00 3c 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 9e 90

CMN N140JCA-ELK:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0d ae 41 14 00 00 00 00
25 21 01 04 a5 1e 13 78 03 28 65 97 59 54 8e 27
1e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 42 3c 80 a0 70 b0 24 40 30 20
a6 00 2d bc 10 00 00 18 35 30 80 a0 70 b0 24 40
30 20 a6 00 2d bc 10 00 00 18 00 00 00 fd 00 28
3c 4b 4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 31 34 30 4a 43 41 2d 45 4c 4b 0a 20 01 14

02 03 0d 00 68 1a 00 00 01 01 28 3c 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 06

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhongtian Wu <wuzhongtian@huaqin.corp-partner.google.com>
---
Changes since v2:
- Modify the title
- Put the panel configuration in the right place
v2:https://lore.kernel.org/all/CAD=FV=WZAXnTGHhrMHTu3p0GL2ky2W1Xqmw2x2cL6FvvdYgG1g@mail.gmail.com/

Changes since v1:
-Update MNE007QB3-1 disable timing for SPEC
v1:https://lore.kernel.org/all/20250903082628.2847842-1-wuzhongtian@huaqin.corp-partner.google.com/
---
 drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 9a56e208cbdd..c7bec8a355b6 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1828,6 +1828,13 @@ static const struct panel_delay delay_50_500_e200_d200_po2e335 = {
 	.powered_on_to_enable = 335,
 };
 
+static const struct panel_delay delay_80_500_e50_d50 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 50,
+	.disable = 50,
+};
+
 #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id, _delay, _name) \
 { \
 	.ident = { \
@@ -1936,6 +1943,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a36, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a6a, &delay_200_500_e80, "NV140WUM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
@@ -1972,6 +1980,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1247, &delay_200_500_e80_d50, "N120ACA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142b, &delay_200_500_e80_d50, "N140HCA-EAC"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x142e, &delay_200_500_e80_d50, "N140BGA-EA4"),
+	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1441, &delay_200_500_e80_d50, "N140JCA-ELK"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x144f, &delay_200_500_e80_d50, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1468, &delay_200_500_e80, "N140HGA-EA1"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x14d4, &delay_200_500_e80_d50, "N140HCA-EAC"),
@@ -1985,8 +1994,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1100, &delay_200_500_e80_d50, "MNB601LS1-1"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x143f, &delay_200_500_e50, "MNE007QS3-6"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x146e, &delay_80_500_e50_d50, "MNE007QB3-1"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.34.1

