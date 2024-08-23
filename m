Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C0395C908
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 11:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672B210E170;
	Fri, 23 Aug 2024 09:18:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="i918EeGa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2077.outbound.protection.outlook.com [40.107.215.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3E810E170;
 Fri, 23 Aug 2024 09:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILT1v18o3DKXnVb1yuMijepoWT6oHYThcD91aJ6NXDXUngHnDs7ZYKu3xADMR2tgl1l/852IG2UWwh1rDiAUCFoLi7hdhbHkeVdsfLZl7uSaLmEMWvEtRS3kjDnZ0A51Ng0a/OmSOvUy3lCcQckNSlQD0NLoWSPP6d6fyObfJLKUrQbk1345qYrJHx8yNbPAhKwoZN9RN9+dF6e7nNIrnrCwDVZFPfnnGxk4CP975bkvvxjDIvGBsJ4fr2cmjsDqb9/mAazBQWxuRfjDq0OMfAhDfqnjSuIgpgl2DaJZmsL8+C+ZTwOtLybdaGRoeVjg8Gm4VrxLfBVaUlvlM5DQig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDfq7uCV4cOOT5ffh/W2TF1PKI5RyE/Rz3fgtwhWspQ=;
 b=bpjrgVtGpKxx54hDObBtxfqY7hPphXIEKi7fF5gfEPuDo6JHRXtZPNfMVn8NgkF3lU4VIFovmsb/n8KpDSFCVjOSaAwAdzpxmn6/KrXjzzMn/6b8B8IdgSXJQZODWJYv9tAmHwVDuqHsCfH+k6NX3udlpDoJD3JfDGiJ/3kg29sXBFZPrvAu/Y0xELyTKIb4nDymrsfkZATu+ttaXFP7VB8IvN9rRW8nx34myREuox4s2D8kQsSXzFRWtGbZ5Xtr0X7uO3sCpYld19ctXaCIX+UXnsfgow/I1NClEuWUcgn6EOqZEgRd03/VfBo3ROlKmC/RqMc+0WAerPQas8Hkdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDfq7uCV4cOOT5ffh/W2TF1PKI5RyE/Rz3fgtwhWspQ=;
 b=i918EeGanKNVdhYzr4lVpKxCQbNXNU04rna5TLg41hIl80nZsh9/FADX/iKkYy8/mk0N3gXjDslhJ43abKkmak3Hyfq4714AJ4j9c0GX6p9Eva/fjDq2TUN9alaCVB9KU5NLwJEgHAlG+GrUVC1lgWYNu83RV5y2FMWW3+K4wjxuMztPcZH0VfDj3ZcASk8lqVzGMGt4yFcs1Cdj5/xtAHgoOOZyD6gVylHW4B4uYzNshQ8DT5LHL6j7Vz9E96FlBWrI8ySCCIZ8UibjDAZmRrPf5PT/kIciCXPZoFoYefSBGj8so9Iogi0ggy9YWS++0GRIGnu2vIIguRYuUfXPHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com (2603:1096:400:33d::14)
 by JH0PR06MB6293.apcprd06.prod.outlook.com (2603:1096:990:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 09:18:19 +0000
Received: from TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268]) by TYZPR06MB6263.apcprd06.prod.outlook.com
 ([fe80::bd8:d8ed:8dd5:3268%6]) with mapi id 15.20.7875.019; Fri, 23 Aug 2024
 09:18:19 +0000
From: Yang Ruibin <11162571@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yang Ruibin <11162571@vivo.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v2] drivers:smumgr:fix up the misspellings
Date: Fri, 23 Aug 2024 17:18:02 +0800
Message-Id: <20240823091803.3452513-1-11162571@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWP286CA0015.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::13) To TYZPR06MB6263.apcprd06.prod.outlook.com
 (2603:1096:400:33d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6263:EE_|JH0PR06MB6293:EE_
X-MS-Office365-Filtering-Correlation-Id: 059dfa63-e920-428a-2aee-08dcc35486fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|52116014|921020|38350700014|81742002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1mx3mysgk6lfDS+6cG+T5pzdNrAt8QEp7nSW0mBRSRy2JfeYb9SHNmYM2jv/?=
 =?us-ascii?Q?WhMPMEUq1uS34dNMRWOPWUJU0uu4qhjzXhnhrnnoq2V/wh/1ZcJYhmMb3+i9?=
 =?us-ascii?Q?cCzmq84tgHbQtp181kcyGqAtaT/ve1Xq7t3l4ax6/oqYg1XOZeRjTYthRysA?=
 =?us-ascii?Q?GKzbRUXYVNVxhrQHbyZsVm1iryR04fQfmX+8ZdUoHuEu6BoxGZq72Dlvz92C?=
 =?us-ascii?Q?bxDdxnoHBrtt83VZ2u7NpNNe8XpwCu4SWdABuTYOUvmMAXMOpomZbh9wvTJd?=
 =?us-ascii?Q?JbSuQoFgeArx9WOo0PZ+eKU0/JKAbg0nyVKotlh+uEVPSd1WzTfM9yOLsQGF?=
 =?us-ascii?Q?WcD46SFBI/Eaujf3SlfYdI5tszwRjuAaVyTnBWwEk+iJoTXLD/Q6lUdXS925?=
 =?us-ascii?Q?NHSmPzPdBYSOjf2ASet0GjZWJs9a08Nkw+BsCJ12YtXchrAvkTUVVbPgj5jq?=
 =?us-ascii?Q?9MKSq3+wL0z1OYBvR57P0GqS032p6PjxOcKvTJX3UL7Ppp1H457WIUmRq1e+?=
 =?us-ascii?Q?CNsp4jRYSbvGx/DMx+m8y2ZekQGjiZVPRBzM8fMMwXDb3HykpRvwTGlBrsoL?=
 =?us-ascii?Q?B8pBphMlm8gYwebaKALKgSc0GPkJbx2kW+gq5EXY0+9yogIZMgPkqwUPo+6C?=
 =?us-ascii?Q?ealpjf7VC09JW56YyWw8TkVvP3lmIwJm/GgszVI7h/skf8O4GbDLUjThq3oV?=
 =?us-ascii?Q?zHG8r0srJH/NEsPKXl2gYAhTRKAytJ1Axywd8Aywp4jJ079iIhU9No9B8T2U?=
 =?us-ascii?Q?yNz5twLtjyXAi9bktAMuz+y/VsxcXb+V1yTgfKChf0wWfJmZYhPbySS+RjYU?=
 =?us-ascii?Q?Ku5ZzPe4pbgGFsnKatI1v7hj/YyLDviFLGazw4mZGvQoY250vxGIlx0aZuP7?=
 =?us-ascii?Q?lPlv80jrKAE0XMwCFv20VvMmUJMk6l6BuyXKGfxh4olMSgfRtXKor6vERVqd?=
 =?us-ascii?Q?ektNm1WH7fnOx04gVpfqfHrkw72sep4wr4o8rNujdrHnXVjGmzZT4tKlrc6B?=
 =?us-ascii?Q?uD6wivOiy7t+LMAQdUew66cJaebrgBboFY7+1axAfJb8jwtJyjSlICwXD9ww?=
 =?us-ascii?Q?HZI9xHo1tfm82rF7H6AzBvNFIzJ/5u9e6f8BWzJqN/tnGUI0t5jhdUZMI3n1?=
 =?us-ascii?Q?bF4gWKliJb1xTXhZYylhmpb/D6QRgvTCHS/Sgzp2n7biHoKK0lsoeED5OxJf?=
 =?us-ascii?Q?3LDLUOduJLSeT7ZwGZFFEcMS9HNIB918ZclYOHz4WJS074/CllreLV6iB2Fp?=
 =?us-ascii?Q?26NovM23UHxemRegiipE7bb1elXy1UsqrVsrROOD9DNFldhT3GZbuYlHiR5t?=
 =?us-ascii?Q?DDhX3rAYQVM5jIIyDB7RWsWATOIkjk9X0DBhhdRQ/wGXpWZyqd+RA7NPlbpv?=
 =?us-ascii?Q?MhHDLEE5R4d3vOwsPMSS17Ut4QQJ/R3TMbosx3qnSth12WyPnxSU9fyPpFrL?=
 =?us-ascii?Q?mKZYP56QGaeSoXKVLXx/FHvCHuvu8CGW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6263.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(921020)(38350700014)(81742002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+zvkhptrJZJGxEl6B8zu3tXrhHt+OFLOY5fKW9wiMMM1cyI+td5Qpgqvfw0?=
 =?us-ascii?Q?tq/EcdocwbVz/SOFzk4BslkPSE9LjVzXbh5PXlMxSTTAqELCCagjpMCTMhk/?=
 =?us-ascii?Q?+4HM9/Mn03qNEl184k6RoVe1unFX0owrQP+eWYSm8Ixc96AGRyvEokay2cf9?=
 =?us-ascii?Q?xmaSXN47kcEDTw+kEWTWpt0Hxsi8EE185NcnwiMNUzSLuf9re3wpWk6Z3FwW?=
 =?us-ascii?Q?5kqUYE5RSxwk4XAJ3/YF3c09O2xDSU3ujyxS3DWNIqvVxFXlr9NT1ZNfu89z?=
 =?us-ascii?Q?5OdS9ELAuInQJXSFEExtj7PpyAP9By2c/AWIFdZvGgkOrYqQdNp0SOd8WPcz?=
 =?us-ascii?Q?vGmEKv9Esr60tOXQTqXuMX1O9jysq5PuBVmhk+5Vfr13mrqhP1AMROLJxRqM?=
 =?us-ascii?Q?2Lch3npy0RGO28UiBCHzvoXNeqJN2X3xt+gM9WmmWbSE9XwYNDhPTngcRApm?=
 =?us-ascii?Q?RGTV4MaIng41G2wkC20xy1q1ibtaQReWosWxj4QjGVvK8IEgByf7PXgS91ep?=
 =?us-ascii?Q?cc/J+SpFX1FewoMVNggMWTPGEKDznT+NmdbuHtWviV+Zb/5/FLL/gKEIZE14?=
 =?us-ascii?Q?ZXtFps3HgQ5MZ/DHca5tarzinW362raIlnMm2D8pDVDaHfMfTbffzcTVX3lW?=
 =?us-ascii?Q?6i/SXF8Snndtkxu6RQ5D/56HGsP6HsL1JqL+Zk/+9DTDHNtvEMLluWsqo48y?=
 =?us-ascii?Q?ym+yyJsMfNQiAdmhqJJjoPr4qw+B3QMzodjReuFj2p2zvPgi5kKmw3mxqARV?=
 =?us-ascii?Q?hRP1XArnuIAZe8ZvIElRFshPzGCl9JGiarfor1EQEsSjFdeeWs2HCqPdbehl?=
 =?us-ascii?Q?251JgqZygI9pQXaxp0CmOTpDcT1gyjgF7mNeilrY1L9opjXw1XOotKldo6zP?=
 =?us-ascii?Q?Spv4Y6r9FOtptlMLp7rbh9AVy5Hk2fb070jg0f3+wLgiiickFeMRC9xvJodx?=
 =?us-ascii?Q?uMg/PjvomveGZ/yX3+opSTHU4I6wMiCUfALdQW6tY23Z+mX4bxi01azSGdqe?=
 =?us-ascii?Q?2KBVnGd2ksvXkRxmEtY93iPFeXF1jYquwpIXDIqGeAjsbkMPDc9DUbqOr5Rf?=
 =?us-ascii?Q?DIqbRN9EUT9KlEtnJOTJDdMeYsmu5cufBOPJtAg+cxD6F2zm3Jc50UwZ2R6p?=
 =?us-ascii?Q?h/6SQ+xybQxdRq8AS+jji+MSDfu7U49gDkex4loQ+GLde0TlrXZPYs63z+jA?=
 =?us-ascii?Q?he8DvkxuwzRRdILEaQFZDd6nkTTZ/SlBN9360jOu01ud7l6RARt0fMXeuxT0?=
 =?us-ascii?Q?x2Pj+MnFY2X/BCEQVFpHK05Xde31nP3fVRAKGpZw0fDo+Twl83q5WURodmuh?=
 =?us-ascii?Q?Ps/FDow/RsyPUEWjzQQRQOfBjuXFI4h/cg8AcsVajgWX2e2TV5ODdbgpOsKs?=
 =?us-ascii?Q?xu9DjOdPKRHg6GYGSIF4cmVzMhCQqCzyRXQQc6zvyJBDSdTCCbFlXl3H6uK0?=
 =?us-ascii?Q?WF8JQBkjfaxU0F2CmWpK+PdmSX8n3dAcGT8FrmRL0ureHa22SbJdJmtEdiJt?=
 =?us-ascii?Q?l+RR9K6MSmvCyGNrgp7UOmzLlzui3bpZHv+D+HAXQgDgO/HCgC5so26ewx6T?=
 =?us-ascii?Q?caLkds9yT54gauyTm/U2VGfuD+VU+NWOQN1vuZJU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059dfa63-e920-428a-2aee-08dcc35486fb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6263.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 09:18:19.0865 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHqu/VT3yxWaVIOkOkMxRVOFWrnHNG1uBx2w8zqLUnHAVrWnEw0y9jYQDmtxBneEdz62hg2uaH+FDM1ChW3QoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6293
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

Hightest is a typo.  It should be highest.Please ensure
the consistency of variable naming.

Signed-off-by: Yang Ruibin <11162571@vivo.com>
---
Changes V2:
- Replaced the word "hightest_pcie_level_enabled" with "hightest_pcie_level_enabled".
---
 .../drm/amd/pm/powerplay/smumgr/fiji_smumgr.c    | 16 ++++++++--------
 .../amd/pm/powerplay/smumgr/polaris10_smumgr.c   | 16 ++++++++--------
 .../drm/amd/pm/powerplay/smumgr/vegam_smumgr.c   | 16 ++++++++--------
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
index 5e43ad2b2..e16efc44d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
@@ -1014,7 +1014,7 @@ static int fiji_populate_all_graphic_levels(struct pp_hwmgr *hwmgr)
 	struct SMU73_Discrete_GraphicsLevel *levels =
 			smu_data->smc_state_table.GraphicsLevel;
 	uint32_t i, max_entry;
-	uint8_t hightest_pcie_level_enabled = 0,
+	uint8_t hightest_pcie_level_enabled = 0,
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
index ff6b563ec..d785cc646 100644
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
index 34c9f59b8..3e73f380a 100644
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

