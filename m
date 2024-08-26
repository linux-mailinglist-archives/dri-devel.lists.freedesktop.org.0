Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CC295E771
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 05:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3860F10E09B;
	Mon, 26 Aug 2024 03:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="l52+iPqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2050.outbound.protection.outlook.com [40.107.255.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1716410E09B;
 Mon, 26 Aug 2024 03:47:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9ftphJy0DQlAImrQPcR0XDG3VxKOcWu41QPO0z7XUn5NLd/Pa8BikI0+wLpR5Ga8qMegSKui1gFFPgJeVGXl6ADB8i310u4WLxgSySpJRQlXRSWI4oWtQGverTWMyfvVm9n1KYe7J2cfnoqqFBjtQPE/KohFGYD2uXAX5CWhcnnDci5B494g8qtoLy7u4MRZTHJ0hKTUOxHIyvsiC4/DxyBWRsjn4EcWbQogsk06/MZQB8SPzm3aau6Q2HWEVm04kVXAJAl3Uhu3QyvsU8iAlPTjsiy3cU6KjXres4cmLF+1nf7l2suMAyBul0ikA8D/NK/1xYv4edQcKEirT0gzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nCrm5b6SvBIp4yPlpe6wiwSY1dJpppywBjxOLDse+Jc=;
 b=ILJhL3BNMeWaH6etKbf4I9IWBV5LiRTjYZiF8DJ3BmPcQfZfe3ZPNT8q0ZJs1cVBiR/mY/Ydz2rMHNza4+AkoQb2AUD/87+kF8Tix/A6HZzvXUkxFzDJawkX92QZ6lFawMeDzUA7bI4eJi3Fj/me295Lu0HD0onv7DypXe0I2lO7Rdu49BWnM8dLiLSb/97gkkLxO8BfKV6ubPiDykLbSi2snGw6DNdo4rUQIpQN/S8m1ZybgEbtyZXuQK+3zVp+gJC8o9i6jMtHoRrLyJahyn1kKoL+pSw69LIOEShapZudQRFa1vkbSJCMKGPCTSgEIn9TBRzgDLljm8y8N/aR8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nCrm5b6SvBIp4yPlpe6wiwSY1dJpppywBjxOLDse+Jc=;
 b=l52+iPqr9iNrinFvxyIzWh7WxNhPfJC1CyU3alEML8ZkzhFjjWDrH+BjeMn7+mGfFWYh8Wj2rZMSZh85UFpb6qQs88td6bhXpCRKivNE6Gf+cVO9tv5BSGLnDvSfzeB5JJ6tVBzuBrviJto0ZwKnBGJtUDIX5v2p8Y/4W3J1on6a71wYlIuU0QPtzZo9UW7oxEU9jNltC0l39giiH9JnpwLgLsk+c/xAaj+6dbbHhzOHoVJreLdqqHE9rXFe78gj3YxaIjnIBc5aFcFB+3ps4/Ut5UBXiMeKyK0K8XtBXoINx/LOcF18qooYXfwU1GZWWWRbtOauzI7UXKe9Rkg9Cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com (2603:1096:101:c5::14)
 by PUZPR06MB5475.apcprd06.prod.outlook.com (2603:1096:301:101::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 03:47:32 +0000
Received: from SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b]) by SEYPR06MB6252.apcprd06.prod.outlook.com
 ([fe80::d2f1:960e:a2e7:406b%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:47:32 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Yang Ruibin <11162571@vivo.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v3] drivers:smumgr:fix up the misspellings
Date: Mon, 26 Aug 2024 11:47:15 +0800
Message-Id: <20240826034722.1795097-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To SEYPR06MB6252.apcprd06.prod.outlook.com
 (2603:1096:101:c5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6252:EE_|PUZPR06MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9ba4d1-de9e-4391-5d82-08dcc581d0ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014|921020|81742002; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JyGM3hr/jgWVVjybZ9vA49HyajsA8CGleY5xWjG6wBtS9eAgL9b1g0nXSNJS?=
 =?us-ascii?Q?vkOgyOYuROLL9QLJprkaBey6+1kUIIx00fD8ckoGZFZP90JucWS/Stlhfcre?=
 =?us-ascii?Q?kd85Fk2xZ2DLJIpGUPDWx3cS3pzsy+ihJPEMvH90YVnb+jIdEWPI2JNdu1/9?=
 =?us-ascii?Q?PVyPOiYq93T8qC3oZs8Y2LgMfW5dg1Tb88+oUU1B98tbEC9oRDzNGGiLqzcO?=
 =?us-ascii?Q?X+E8+ZOQ0X5nzAUAtjeXQbrCtJiN+ASMkh3mQmnH56wVjw6+5gMTbb1o5nEh?=
 =?us-ascii?Q?4nG99Xyry00/+lLnQbMV9kDcFIs93VVVVVeuyZv9V4BUMxhQseTTJt9w8duf?=
 =?us-ascii?Q?OHCp2CdRSfJ8wSeLa6HLPmeZNb+u5+exgNzuZskKve/OoLpOim4r7wDhx430?=
 =?us-ascii?Q?vEwp+U9lS8iPj2DVHhLNgStpy4kip1LE6dASxtXGq8UP9Ck8qYyuQVe8i8Ij?=
 =?us-ascii?Q?IzVIicp1JTLwmDKxbkOKqbtYQ5cwM49/AoPvIm0ajzKlRSraY+eB0t70dSTM?=
 =?us-ascii?Q?yMWc3BXsb4tX0MFX9Rp2PbdR/PeohG0jLSc8L3rHWrTuHIoO7zz2/fRLkxVO?=
 =?us-ascii?Q?HkxTzkt7Wk6Zc8ZlnArEQIfHYlVQGaOqS2tGWAx+y7b+e/WJHUlrYrYmVeJ2?=
 =?us-ascii?Q?83q3okUjA47tzOKe2JkFnbToNRrgAoG0Jph8187B3dFKgogc0q4L+gTnxLTS?=
 =?us-ascii?Q?92i7ZKaSj+4Hzz9852rp3CFHO19kyeXImhwbDO3MMopvvAZSJkzxSmaYuI4K?=
 =?us-ascii?Q?wsUSZDfZ3xLyRDqwCIRQpJ9/rFQJLyLh7TGG5sfwEijZpvEf4tnFENVabfBE?=
 =?us-ascii?Q?A27H4QZg5c1hpKkEEXCDRoNAzPqH/apyw3bp77oxkY6ppLEDw77916nOKls1?=
 =?us-ascii?Q?apG5qwhlUTyP9TUieiI33+moJ5J/a6wQ50uKUx41ov2iJQWlmkyTPxtGRnbV?=
 =?us-ascii?Q?9tQUdf7C7Fzdc7xCkW7jeWZ/tqMiKzLKEFoqeemIhsGUfgFqQle1tPAzmZIP?=
 =?us-ascii?Q?y1Wgx3SWA1EdqwUFlOYkAGri0MM2TDcjnU+bbC/0HdizDswC2qA8KogR9tTF?=
 =?us-ascii?Q?/7TUII1upFEDUD5UHL9yZWBRNIqyjhG4x7jScAZVpGYb3iF8WKvlNaKclquD?=
 =?us-ascii?Q?UIHMcvQUOqR5Lbyvk6TpSY0zor4rzJirHPg1IRxT3BsMcqsC/Sv7AtkVyOMm?=
 =?us-ascii?Q?Z16qwEB4oyf72inLryF2rukdjV/QWS5zkEpgB45v1847HW/zeYJKMX3+VOUb?=
 =?us-ascii?Q?PsoULZuRTJKFOiijoF5Zjw+UvK+s2tM+QHK9KCxHueN7RuYCZwySesDERUva?=
 =?us-ascii?Q?hdui/wNdFMmlQtvHVJFGM1CiOPtg4wpxU3UovrR3QdVRCsBuO+Zqlsw4DB6l?=
 =?us-ascii?Q?UejstbcP2A6f6cDcDcbXe2EHBa/680npiiz5zoNC+xJaeBSOUrC7akRlQMST?=
 =?us-ascii?Q?B+najbk0ZbrWbkvnaepZ1SYIqTIr+BAn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB6252.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(921020)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AQ+hPzL3deTIzLvYIRRME4Wz64hG5F75ekGIPeNN3Omt6gILPxIm5h2NSSGL?=
 =?us-ascii?Q?/aMy46GEIWuF76musAHzCjjAfOdQC+L7jZYSzRrp+H+WqPDO9N5KTIKI8BKz?=
 =?us-ascii?Q?kYIYnPGRF6OTso5WYTH5tsWOeIyfZOPuWCg0+1JqoxquCKiFK1qlDcAqnx+0?=
 =?us-ascii?Q?PTLjGODLs0thISPBAwrWcOcP35Y0nDKMAoBohQNKfp0+cL941LyiS5mAX/Pv?=
 =?us-ascii?Q?wmbipvZF9YgWoxBqhH19UoYUmFiXroOzBoh7iRn4dWHt+LlmWbFRdffXKMlE?=
 =?us-ascii?Q?iT1Dja4VPAcZp9GRBO+zAvwIYjl+tSr0p7zFpZ2ExUFH7+CYU+aCdHDjcAsi?=
 =?us-ascii?Q?bQvlHE3GoK3W9MR2GIVarHjNgJnQQXdt9PXKZF2OvxInK2NI/2Z/gW3XUkmx?=
 =?us-ascii?Q?rYKTqYlXlg1RlRJjv9JeRG/a0Xf7z3WIYG+MmQZr63kErPVaJLW0piMSq7fp?=
 =?us-ascii?Q?9cSMwCsaWmwmABB7Ib3HGqv29huHLFKdp+bKvwa073Dtcth+KO7FFNljqYGJ?=
 =?us-ascii?Q?RFltv88nl9ihQUYsc8I3h3X4WhlpcQVIYPp5cJ3+tUJR+2ViUP545SuicRwa?=
 =?us-ascii?Q?e5hoAVFe/y5HXHE2syKiUgRa/UN+D9/9S5S1pFRq++cGFmY07LjFMARpx+ZW?=
 =?us-ascii?Q?/ygOccYhJZRWspKx1g2/I3z1ISzfYLgSd8RKiMpwfD8I21M6AO1VMUgN2kdP?=
 =?us-ascii?Q?vWpl6CnjNhnCrN59+a67Zw7jFkSjzDJiC14lzyVZpa6dulyVty8UbISaaxqg?=
 =?us-ascii?Q?pb23NWFrRxgJeeCeA1REqgeZOLvTJQslYisto41lfUcCIRrvT1O5YcEau61D?=
 =?us-ascii?Q?VkvlKZYq5VAu3uBMJSv9pdCxybhNIMj8U8GvQrokfVpcTuZoSVYG0bY7Z9N0?=
 =?us-ascii?Q?YnreJkeND4Y8t9IMrmlzLGJGrXn359uXVb2p0U1YSzicgi3k57RNmnfagkOu?=
 =?us-ascii?Q?HlMCHTEScT28EWZjAkYlJneQCLDau0dDxATdNb5EeoOX53Q2o6Q8YktEnHsN?=
 =?us-ascii?Q?es1E8Hrs9Kuzp6iBdsYLFZHa9JF/ij9LfO0hrwNU1mjnbDJvbFDytmfib0/8?=
 =?us-ascii?Q?iR9yqBTNCUt/IbWx54BmK5QnLXafLE1SAvvjPw7UFokNXVlddsGJIUc/nAla?=
 =?us-ascii?Q?3s1vdfBIhPcazo5RxJXDS3UQ9J7OPuCqo9OKPq49goisSZJt256JkMWUIYYJ?=
 =?us-ascii?Q?3Q2C7Qor9T0a+A1E3Wr315jQ/p+jGON/rEvUlH6ssN8KjhJwvOwq+BYT6EeQ?=
 =?us-ascii?Q?us8EQoZR5kWFuhspX8YaPaDTQI9ZjOWG9YGnB4AxvApxMd58sTl2bWpE7HyN?=
 =?us-ascii?Q?nGoKbBcGYS9gj+9l2/J+ReIYbMl696f0rfrA7FZ6Mj3jUC37eJClhkekQh7U?=
 =?us-ascii?Q?4WBFqaGEV+0SAMaHVz9DU7bbYRwIAA0E+zVIx9MSn8uTFlxfsfP+TcAsvlzA?=
 =?us-ascii?Q?4c4aDrgL1ny3PFPUzULivsUfuY6yysOfUVT8JN6uVI7O2xEF+Rnep3Zfzmr7?=
 =?us-ascii?Q?VAXHLqtcitkqm2CRvdWqTn7tkbpUBRjtno/NhHOIlIU+PR/aFH60qUxqLW57?=
 =?us-ascii?Q?Y+yB/b0j1m7aQgrguFPh12nS3XU44ZfrpP+FLGkm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9ba4d1-de9e-4391-5d82-08dcc581d0ab
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 03:47:32.4316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: js56QpT1JaNhj+uXO8uumWkjhmypT/mRB3qMu16Z8z+c2TONhxv5f64DHwDtNQXFqsLE7yZOgB85uSRTMRXEjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5475
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

Hightest is a typo. It should be highest.Please ensure
the consistency of variable naming.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
Changes V4:
-Adds some information in the subject
-Updated the ignored misspellings
---
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 16 ++++++++--------
 .../amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 16 ++++++++--------
 .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2956..e16efc44df88 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -1014,7 +1014,7 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU73_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 			lowest_pcie_level_enabled = 0,
 			mid_pcie_level_enabled = 0,
 			count = 0;
@@ -1054,27 +1054,27 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
index ff6b563ecbf5..d785cc6468ef 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
@@ -1050,7 +1050,7 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU74_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 		lowest_pcie_level_enabled = 0,
 		mid_pcie_level_enabled = 0,
 		count = 0;
@@ -1114,27 +1114,27 @@ static int polaris10_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
index 34c9f59b889a..3e73f380a591 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c
@@ -878,7 +878,7 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU75_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t highest_pcie_level_enabled = 0,
 		lowest_pcie_level_enabled = 0,
 		mid_pcie_level_enabled = 0,
 		count = 0;
@@ -925,27 +925,27 @@ static int vegam_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	} else {
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
-						(1 << (hightest_pcie_level_enabled + 1))) != 0))
-			hightest_pcie_level_enabled++;
+						(1 << (highest_pcie_level_enabled + 1))) != 0))
+			highest_pcie_level_enabled++;
 
 		while (hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << lowest_pcie_level_enabled)) == 0))
 			lowest_pcie_level_enabled++;
 
-		while ((count < hightest_pcie_level_enabled) &&
+		while ((count < highest_pcie_level_enabled) &&
 				((hw_data->dpm_level_enable_mask.pcie_dpm_enable_mask &
 						(1 << (lowest_pcie_level_enabled + 1 + count))) == 0))
 			count++;
 
 		mid_pcie_level_enabled = (lowest_pcie_level_enabled + 1 + count) <
-				hightest_pcie_level_enabled ?
+				highest_pcie_level_enabled ?
 						(lowest_pcie_level_enabled + 1 + count) :
-						hightest_pcie_level_enabled;
+						highest_pcie_level_enabled;
 
-		/* set pcieDpmLevel to hightest_pcie_level_enabled */
+		/* set pcieDpmLevel to highest_pcie_level_enabled */
 		for (i = 2; i < dpm_table->sclk_table.count; i++)
-			levels[i].pcieDpmLevel = hightest_pcie_level_enabled;
+			levels[i].pcieDpmLevel = highest_pcie_level_enabled;
 
 		/* set pcieDpmLevel to lowest_pcie_level_enabled */
 		levels[0].pcieDpmLevel = lowest_pcie_level_enabled;
-- 
2.34.1

