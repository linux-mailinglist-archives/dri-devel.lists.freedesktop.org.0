Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FA2B1C61C
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 14:41:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC23B10E070;
	Wed,  6 Aug 2025 12:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RCMRIFH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013050.outbound.protection.outlook.com
 [40.107.44.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB94710E070;
 Wed,  6 Aug 2025 12:41:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga1n354gbYLyCTs1DBG3uqZUal5jUIlveJ4/ti2Wni7OAaRsyZcX7Rbs7R0/I6sBJkt+HiNjM+Ixaao7j8SSNez+6xsw2hiGpzSco4rSuzYx3hScRMMbIH3wzDNe4ILwfubpatFqZuibjt5ADGZqUuhmnLFgUtbYdhqKyk0bLdPH9FOUVpwpzIWKItCkket6b283o1xw80Q4NZZfp9/lSPVVSX/5NemsV2F7uAHsG5/fR6ddjDUQogIvtf07SP+RnIR0X+MBzkOfgB/QmRKHEw1e2npbjMZ442uNOQqtN+jQYbdh3hsfpVZne4C8WyoZqAm2/zA6JhslwVynxBJnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axdOaOolG8kZtj/LcZGfejwF+YZpW5txVVPTBVaHB6o=;
 b=VvFZdjl6R5xn23AbmgsWQNNnm7cCJdfzXmQA4hMxlEtXj4RgXHLp9aMtp33SOwSyeQfz6Vay6BtZsMOyXgLKsh8m8Fap/Aia2l1w3BV7nhCtjYh4aU2rW4irouzzcYM1mI00F7Tm69IixrxYhK65GexX1IKMhglyg5xSI0yfZCFjhysQ77Z9KFZZQAjjrYAnGIKuu/NHEd2ZaMIwiEACCW1Go5COIrUEKn9E5KCDAJfRkHe3rkAYCFeofU13Rbtb0VcrbnJN+Ui4NujAGJudaT3ZwiHBwswOS8qdZZh6KL9UzAV0uxa+MPPC5fLup4pXWuSQRTCccK58uMsUOPXQFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axdOaOolG8kZtj/LcZGfejwF+YZpW5txVVPTBVaHB6o=;
 b=RCMRIFH7UsBZdnf4mZS2MVg8sVbBONQtOzQTtxyC1LrCzo3xp5HEgI5rwRgDnepQIHK/0Lg9leQQgSQP4PxrT9XVOQUahIES6wKoF4p33rrAf7qw+YbvBoiOcqLAVv5RR+pXHxlzGgtypPhBdvjB3bxBQZKXRl36TtncCglg28z4NosYblRrcZD9XiQKoH8B3KJTDzBuXP+mfTneoYtZKXSoSmaGCl9SBFWXF64tPcixzPHFT+ZU7c6EB9BSwcJUe6ar25j3+F/NLPVio0sGMiuxuOXVTpGQxVf8BQk0L9VVkYfxBnmVeg/W67qCORI1b6y9t8UwfZv97db39GmT4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by TY0PR06MB5305.apcprd06.prod.outlook.com (2603:1096:400:210::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 12:41:33 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 12:41:32 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: liaoyuanhong@vivo.com
Subject: [PATCH] drm/amd/display: Use swap() to simplify code
Date: Wed,  6 Aug 2025 20:41:20 +0800
Message-Id: <20250806124120.381818-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0009.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::18) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|TY0PR06MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 200dd8f9-6474-45d8-2153-08ddd4e69277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xexaq5KUa/TRuydfbu+SdgBpcsXAKZzul40Oi6lJRSvIzTgjgzrZ8CoThHH3?=
 =?us-ascii?Q?MLTIHyVWk78AYE977SWSRVlOAfguJdNGYkLU18rW9Kjtx3jpUrwVxk6uI55S?=
 =?us-ascii?Q?r/t/LYLvECgwVzq9T1wkXufyTLMVHGBaSP9PfCnuqKxEoJCe0zJzeex0E1dv?=
 =?us-ascii?Q?1/YmWwBhz5Bq2xgqjF0cKCNmYPcTqDM3Vm4ZI6DML81jv0Gy+PbacaBaFlVW?=
 =?us-ascii?Q?XxjP3A4ftLsqYDFGTtkjsgbrIbZYb+96sIkj/JOv9mOhnpC0kj1jouBJz172?=
 =?us-ascii?Q?NxIG6QQij7sFmBur4spPoISQs7Zo6623WYOzbDjHsMMxquGnRGyipoHR5DEk?=
 =?us-ascii?Q?i5WtrmictMMOI8gNNH/qiI/ZYBFyVF8bRMKFfNF0yI671fzejvZ7w/bAfnpS?=
 =?us-ascii?Q?TcqT/7a5fK6DJiIVODNCaRRQd9epIOjbBTL1rd6Ilx2PbNsf87IA6xb3QbHf?=
 =?us-ascii?Q?1gKl7L+QeV2czJX/I3WLBSX/nW3pbwERjqPIdvfWdjRPdnj6IZ62WHYUBmjw?=
 =?us-ascii?Q?1yW7EyrqXDUhaYW7uqZ6KLnjHTHjOr46eVYfM4XcwEhkvGl2SdW/hQ19mpra?=
 =?us-ascii?Q?fHRJkjIkZmjE8tPmzF9debryXGIacVEWA0BAoAOaDTAmr7l8kOAK/jW4QX+o?=
 =?us-ascii?Q?v2Ge4G6dFIGvwIwUqXyw7gog+dBIElzZrStLMwXVcAgJpwtvhbBdYwTWTi3g?=
 =?us-ascii?Q?8YeXewzMa3T1rmTmcOwZnNJLE0yAXQT+AyzbIPoN9oA3q1XMFwxC8v/7Za9n?=
 =?us-ascii?Q?kpI29A3YovD97m3DzKpRZAp5r3b4sImaWoKOw65BLJ+594AOhpt6lGyE/8ek?=
 =?us-ascii?Q?c+ZC4VSA+KG/kLFh1jEoWyc2gBhLjVNXaluC0TX4ld5NGVax4MMgbkWh8FBe?=
 =?us-ascii?Q?UuyKu1VTxo1kJorAG7KbOxpiFHLYvfbPdTWtIf6ouoiaSKtt0YzOdb9mfzrc?=
 =?us-ascii?Q?ntWtWTmJcoW1v4C/HqtEm5Vq0ilYCesuGdBxQ9nDYFCcalOJWTXTa82WStu5?=
 =?us-ascii?Q?LFV4Wm9Zx188IUOyAb9N3Hp06SJqnzxzzTkNmHYbS/n+1ps7kuYkUvvcXniA?=
 =?us-ascii?Q?Hf+nSHzt1ddQGBa2WesCA/wucppHRUnV7LIzswNn58q4DxMJ8YwkbPYkP3Dn?=
 =?us-ascii?Q?nCPWksaR6Fm+2M1/KjQ3vX/X/7yXUvignvPOLo8Keu7v5qCEuUBj9k5iUNcZ?=
 =?us-ascii?Q?uwyaJnDjVwRffnYj2CGtdIivroZzv1S6Z5N0cKeI27Q5Cg1jVTBGTUZreXO3?=
 =?us-ascii?Q?8zZVbXB5d6IpES9OSwY99jyhP+g8f86ucBQRxbScLIqv12zVHcHFXsoR6Awv?=
 =?us-ascii?Q?REiNkO+zZ4jtiYQC9k5KmvY1Ae+5gmmUjPeoqyIl1FmgPLq/KHgjFjU/YBdS?=
 =?us-ascii?Q?0Wf0fyHIc1eI5+Ok435/GYVpwbmnI3q9Lf1ObUEOB0/2ocS5OsqdBFtj1wrq?=
 =?us-ascii?Q?FwEkmUyfKJSY1my1XRoEqjDn4lmAllNqyzmT8exHSoACg37ogVu3eYd5/5DD?=
 =?us-ascii?Q?c/mgukEa/f+qffs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eKjmz0hyfP54Azs0fjClhkaVcx2ZIIvECe/hyV0E2PEFSz4waWMESuth8FPZ?=
 =?us-ascii?Q?xTslrmvEefFbbdoAZMPv0FyeOzL/cXJZHMZgTmTjutfYiLHNBGDHFRZF+nIv?=
 =?us-ascii?Q?o+tY0Dti4gTztrmMghPqrX3KWTIVyax6kyRm8oDIUzJCa00j0xMKLI/NpMd4?=
 =?us-ascii?Q?cmWCMtXEA3mfkpO2M8LWbEnkz5KdA/2wuPSqp5Vl1b7vZZQ24rcnr1Y94wVG?=
 =?us-ascii?Q?wBXcme0rrxhGhmMHSPPa9GZqh/cSgeTRuwrha3Fd8hndwjO4JsWY/xVR03D4?=
 =?us-ascii?Q?ziUblOtNJQkP6ydO4CLdyXT/kywSWMwGIUmdU8M/aL2ZDBNLBBZCIzTKAl1L?=
 =?us-ascii?Q?asq+rl548OAdpCRZkxYd1t3qmvaxtghKqMpXnZhbY/BUcTb8kjbk72yDw4L2?=
 =?us-ascii?Q?X4yjIl9sZRdvzxxiyvvKTtAUzqjFK0T++5svzVXauSPJEdIvaIJ+SDOdIzaa?=
 =?us-ascii?Q?TKQ7KO8/fN6ljc1VNIPHMtcOlnDNyo66kScnbqHKzYn04zt/HGiWxWt+C600?=
 =?us-ascii?Q?15RBFy7tWLDN/d9kH/3PIQngKSqetmeQBF6sp96NmN7jCpCuvuSDLuzW1qdl?=
 =?us-ascii?Q?EDhlGgUCo4JsXHPPnxaB17bA/HAa+5WJAiDjotFxYV88TRIzS4cim34yQ2+3?=
 =?us-ascii?Q?mw0Qpe4M4+V63TyfcBCMshp1QPG+/OwKeuZuYsHlXLp3Mf/a4FRIM0p8dWk0?=
 =?us-ascii?Q?/2W6Xb7itLD4SyPxsTvr5LOLaKcOZ5s8ntn8egyd8G3KqFJJcNHAitZ8VETA?=
 =?us-ascii?Q?qNXm6ARGzOWxgZCuCGtdvNB/uwpRa8Ejx97jVRC3+fVs/jkbfOuW9Ewykez0?=
 =?us-ascii?Q?GQ9xv8CNKUPjo0FH7ZAVT6T+EoEoox2QZrv8HHOyFAK1Of1MALXHyvWmdpnS?=
 =?us-ascii?Q?iqRWf4Z5y/B2DRnEXqibXcDxVi9CksHcQBKN9/lKvB9dO3fukm8RKS19bMHp?=
 =?us-ascii?Q?KafTTGJbhT+7TUz4EKN/2rrwont2jOIaul/P4XAZswYcbTqICwss/XdU/AsI?=
 =?us-ascii?Q?UXBBAHpRMAZgHulDgR7ANWM9UElACJO5aVlipXX3239bSDcol4SPNz3BL+90?=
 =?us-ascii?Q?oUcM6TkOboAY6OWaAwtInIosCQAvtpkqK99o1xa1F+vOz0QDxrKJ6mlgH4Rc?=
 =?us-ascii?Q?Xuc+slIA2HPa2U4oIzgKKHuAx99IQSD57/kc+PA0r+QAKRCZOZJgXMnQ85bS?=
 =?us-ascii?Q?IgCXy9J2uTZv+eMIrubJpFNNbR15H++nvQw6goa9RezyeEW7bql3TxvTdYmO?=
 =?us-ascii?Q?ij9ykL1d4pLja067ILFxwKt0VjzJ6TGUcc8un3AUa2c/GVNesk4VACAHlNWX?=
 =?us-ascii?Q?4DF9tEDJ3bvjj1G9JQNuYJ0qD0cFeuHvHS6HxOybRZLaYF8pRQV4DxSE4Ybx?=
 =?us-ascii?Q?jkGngUtF/LHXHw4P28SrkuM/3X8ETnhoN0Bwb+7fwnVUJJiz+c2klSS7xQBm?=
 =?us-ascii?Q?s0d8udz/RGfRerfL433ov6nwY+7BjpVJG1yEUL9zWj1+8CcPgT+FDw0YGIMj?=
 =?us-ascii?Q?rk6YChXv3ZsbVQAGmLeDIXif7xm686hHNjRw+pcLeePs2WTLY4D9M0x5+MKz?=
 =?us-ascii?Q?Q4/rGW2WHcgfbgorLEaiLiq+LIRoZ63VyWGtl0Nr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200dd8f9-6474-45d8-2153-08ddd4e69277
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:41:32.3050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CewzuPwOlHRU1sUwPr0rWlwIYM3g2hr7gjdhder7khXx9Yy+nkWKVTYunK5HdBWqF0q9q8BfPklSJCyVZPjiJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5305
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

Replace the original swapping logic with swap() to improve readability and
remove temporary variables

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
index 5f1b49a50049..4cfe64aa8492 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
@@ -473,7 +473,6 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
 {
 	bool sorted, swapped;
 	unsigned int cur_index;
-	unsigned int temp;
 	int odm_slice_index;
 
 	for (odm_slice_index = 0; odm_slice_index < pipes->num_pipes_assigned_to_plane_for_odm_combine; odm_slice_index++) {
@@ -489,9 +488,8 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
 		swapped = false;
 		while (!sorted) {
 			if (pipes->pipes_assigned_to_plane[odm_slice_index][cur_index] > pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1]) {
-				temp = pipes->pipes_assigned_to_plane[odm_slice_index][cur_index];
-				pipes->pipes_assigned_to_plane[odm_slice_index][cur_index] = pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1];
-				pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1] = temp;
+				swap(pipes->pipes_assigned_to_plane[odm_slice_index][cur_index + 1],
+					 pipes->pipes_assigned_to_plane[odm_slice_index][cur_index]);
 
 				swapped = true;
 			}
-- 
2.34.1

