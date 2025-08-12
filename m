Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F8B22108
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 10:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C8310E5C1;
	Tue, 12 Aug 2025 08:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="iJqoUHc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012033.outbound.protection.outlook.com [52.101.126.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F96510E5BC;
 Tue, 12 Aug 2025 08:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uW1dnEUaZa61RcNERL66s9+pgpm8BPgaWQuZT9+oHkwugLyhdKX5itDuCLi23zxw9YS4Cf8MmkEwGdfkPFewQqOwl+vhiVxOufswQxrHPE7tXOxwh2ZcFrlATiM2mMmc+5upLq6cTlqdZtBcQGi0NAHyhAaAIUmNRzXuFC2jQzXVjqLj/uBSe1hd5FlnQwnk/7ykehu688blHT6fZbFn53YMU377zL3g1/+I/711BsT8j1+AQjoU8P/wR54MOkLksUmDeXcgw5Qf4fYSpYQ9N+YpGBzIN1zbDpnX0pwIng+L6jFSoVLSTb0vhoGmDvkXZ1XHgvWhdl/vIfEC+UOSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uHsdIe3m2ri47Gibuqpe4BxsymeWEIxeu6s15XyQI8=;
 b=wVbmpoJI1Xpn53JrW+++eAHxwXWkY7wEHUVNZ0Oeg5WykFaCdn2YWZ29VeJWpcGTRlNEs7qNrApOQRBUK9iJMydVrwCxw2wv14S7sMlVHbjRhAgnbL3thzIZv/F4wIcxeNBSMWVsffoNoDze17al/2BAW68c61DtNRZTa5ubAnKzWfRhpNBqAFCsfmyoafciaf4nTZOQMLKhe/v7X9kaXe0S8kuS04R1My6hwLD0/FynfYT3l8Sf6dqNvDvB+NRE/CkOPUwonYzCT8sc6Rd8Jyat9APL7aR9AzgNAz6Tb8VV02L189ks9xz0hJi4hlGJWVEva7p9J5znLsv+KwW7sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uHsdIe3m2ri47Gibuqpe4BxsymeWEIxeu6s15XyQI8=;
 b=iJqoUHc/LIpCXfNEQatOs4DnVSH0uZMfug6curgbtprcAL4LVLxMfSEPJbY8PB71huboDyOz8srV2KcswVa00q+ryKyyt1A9xt4VZjDnMLHUz/cIi1p9Y/+sb9WHO7RzDIFwyu2OSWIt3A8AvdQmgMEuSl5nDMOl3TK/3CQYk9q3UgDeUqtJZX/pfu90RoF9hDk29swIcGEQvA46OW0mU1u3h1K695XHo4o9OoO+HxJYT1LztQ+GzS6bXzs4JdP/wBhH4oMI7bMtNzZ4a08bvg0iZrl9e0dBvKguOAhpYdGxMptzkUCSnJyEX02H4v+/3WxFXwwAQBJr3MV3t7mZQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5102.apcprd06.prod.outlook.com (2603:1096:400:1ba::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.22; Tue, 12 Aug 2025 08:32:21 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 08:32:21 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dillon Varone <dillon.varone@amd.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Alvin Lee <alvin.lee2@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: Use boolean context for pointer null checks
Date: Tue, 12 Aug 2025 16:31:49 +0800
Message-Id: <20250812083208.53809-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5102:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd21128-9ddb-49a4-204e-08ddd97ac1a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ASZQVgpXIZyhSoMYSsRo1sjmL1hWu7x+onh+/1kV98l3FI6mQ2gqaU36UAS2?=
 =?us-ascii?Q?NL+UFf5EHWCJ74C3HpOyhBE2Nsp3srVi6Aw/wxkQxJDlJtxolKuZwY3aF2+R?=
 =?us-ascii?Q?NCpDabRZ3mR/eOpNK0ZtTBdp4JlDbhvcUObJ9k0wNFI9tGt3Bh2IlNS2Ycr2?=
 =?us-ascii?Q?apVVhjvRXq5IvH6ezKJ0TMCxFflNTYs1s5fTirmmvjur1TGfsvtb+7PT+ceQ?=
 =?us-ascii?Q?d6kCMOP9vGvzEmbjjmqjFt8hYF7bU3GUSrZWis1Zh9+aOF+YTINcm0cn/rbY?=
 =?us-ascii?Q?sgSLehVq8caeQyskPrvJVd+7oQwJlGJeNS30kuEGmfZEA6K4N7/iQMXJTcKo?=
 =?us-ascii?Q?K6rK11uxJfH1XYlNFTARYq2zRbWGjDLPmzmUbpxn+dM9s4KCixNw8F1dT7Fs?=
 =?us-ascii?Q?XFmv1jcjBDJWXLxunwJMJVW5kocEfIx9X+ciitPOJ9o3HUVAOLNms9H9Y75F?=
 =?us-ascii?Q?qXFBMVDP1OKNXZPDOYNm5Qtnay3r3ZQ6IDBE4Aq4jrl52W5Qu1F6f5EUXAzs?=
 =?us-ascii?Q?+50QQg9KWZytwHm5FX64TOsmNvtjMZXlCZJcU+a9M90HaNyC7cUCN0EjW9Wu?=
 =?us-ascii?Q?1gYh+3JgNTn6iXY3S/LtZyAMZzpxWXa+VPxf7s0/fh2w3T3jU8hCAcbQEDAH?=
 =?us-ascii?Q?q4gaVPu15zQ225kXZYbS1PVZv/hj88G0uqUW668vY/g0qb4O3Z0ojzlaxxpo?=
 =?us-ascii?Q?iuqYgPS769EDJO16VnWQ/4vMILXjwrT/zdPon46PPzPUu0hjc90RGq8/c6Cw?=
 =?us-ascii?Q?v+222+9k8vqq4SscwA3AauQi4eAaPkZCMcTlraJZ4A3SGgEErI5gmfv2UHvv?=
 =?us-ascii?Q?opzIzutnC2Q20V6DytcOWBkB4Z79dK6OKNSozHDbcPsJCFXbSlDyoe+hlU1y?=
 =?us-ascii?Q?3ZbPZgftLDQ6lo/3bEwpkh/qruzwJVFC6A3TaFtmEelDMIdOdOFUZH0041Vn?=
 =?us-ascii?Q?SaTtIHBL0mXFGj1yVFenKyLvzJ7QN/HwciLRYmNQvCRF9MW3Ll4RC7AZe2g3?=
 =?us-ascii?Q?KvidXXkBpO5V3eniKHcm5IN7MiuyaDi2d31COQG/X0EZWpwRpU6p5p2wjWRR?=
 =?us-ascii?Q?+va7rceVux913rjqEWH3YJkGTusdP3CqA6aZOtFUR2bv9UxmV/dXTmCuXQuo?=
 =?us-ascii?Q?xrvua9n9ozi6+mSOebHtABX27M0lAv0xPTO1gSbvsW5tDAPqK4qCdin50smp?=
 =?us-ascii?Q?9kFDaRZQ4kmyzrv94kmpj8EFJ2X+GTLV5GFpF28Y4X6/MlvyFYXT0oKXalv0?=
 =?us-ascii?Q?EeRNQhG+SiALqhWZRECvgb2ABwpb/7eRF7f19LQSDqPRaZbkBn8sha/sSG74?=
 =?us-ascii?Q?LWEkG3jYRpod/qkeNxBiuD3VAU5VHodIXh+3jYEFjvKq2k+3ETar9uyEZJAh?=
 =?us-ascii?Q?ypTk+mEentDvr6YHFvb3P/waVIItZmdgWHtEsn0IO66lhZYgPiggKcCpmrC2?=
 =?us-ascii?Q?ZaRwBqwTryVqMQ/tAhSs9DRo5rj92Hu4jRTtw4CfkIjhpwtebol86vvz/Gnj?=
 =?us-ascii?Q?ayBYykEsaF3WRew=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CIJ9hhU69a/hCVPZKXU+lcV4h9xJ5djL0JVBP0Eetm+Z5gWOFS8zCdFWP8wc?=
 =?us-ascii?Q?kwUf6iuhGv3lJSxwB/rKWRdEw+XJMyy13zS89EcXMkKWSWd2YUphDN+lpgcq?=
 =?us-ascii?Q?+XYMCMm4Q2LDCyi2z9My4+QMg0ON9wU2XXOYJD77W4ciGKhlGmeJ+VcDegFS?=
 =?us-ascii?Q?qToHoH1vF3Iyju/zIN7BcJpGp4YqF2yM/tjooG9dS8ymBko5Z1OCtFJPPmjX?=
 =?us-ascii?Q?8H7w+c6U/CrtPsKQDw6niFcbvL4T74iwCSnv/qyJjYPTy4ZHcNTRIWA2Hal+?=
 =?us-ascii?Q?qUbe/H87PZW9v5D3Xti08B+hLioE/7rXPgELCOqy36agmAOoZ2q5GghDDJvQ?=
 =?us-ascii?Q?seVTJ+MHA/K6No8qWhEATwG27H/1sY4M92GIPuajc74CPYbhbNUCohyPg+Vn?=
 =?us-ascii?Q?H6z6g0WSfuravxlRcsMhTcaWKt6CVoTn+hkGsgzI6/wD/NfNaRYScEUeoaYE?=
 =?us-ascii?Q?3cjroroOSlQQU/4wSf8wonhjDvV8bmGukaIC4+8IwG7UxigjLN2qBUVnTQI0?=
 =?us-ascii?Q?KDpm7mVTvGCNa2mBWMM0A+KH/+cRGCuZgtH/4QIsWtLzenRb0gZ3BAP1Qg94?=
 =?us-ascii?Q?dfL48Qi31l4bCbglZQpkecpwggNsWLEPIaAt2t48x/4Nt89DQ/0JwFAf7k+9?=
 =?us-ascii?Q?jjty+9kYlwbAYNoaNVnFtiOR5dLssn7fiTAo3TijtWP7rQsQOYak/loEDWdj?=
 =?us-ascii?Q?gBLEHFsUjn4POlbGyU3em6aZkiZdoFSYkH5FyAhb0smwXNlgGlO1UMw+L6OL?=
 =?us-ascii?Q?gsV7sdX/LX9/fKpztbRkC3O33XJSe8WLRPEUm08ba36oExSbqXzMX4WNdBQp?=
 =?us-ascii?Q?B7bopGqc+uju/gZtBXwSVpD9WZVyP3PaFLenneZ+9e/QFb0tehNmTqMkvFxS?=
 =?us-ascii?Q?ya+Zc1LxluAIABUJMo11w75zyAjmtVEcT5KB9vsu/HGDZLMSqabk9OI01HG7?=
 =?us-ascii?Q?hlzOi9+q3GcFvdRfKWyxsF9dW+EEq2MgqjmvdQADmqK8qUg+E74T3nzp+gSh?=
 =?us-ascii?Q?YbJs+X3IzsqadajBtpaStg2L+n11lysCZwqnYOw+BaJ/PPFUAXcf2UBxHVPH?=
 =?us-ascii?Q?a1GMkb62lliAKBI2w+xOLA/y71XQssCKfz91tx/hlPu9kt8hcT7XcWJ5A9Zm?=
 =?us-ascii?Q?R8ZhsY/vg3zf9aVw3cjyTpgoAGgoZh1wT+bGNPe1Mlb/dxkJw+PRwT5jIF0f?=
 =?us-ascii?Q?+h6Bjq9HhePLsKqOib/Q2NKkan4Yq74cxfkpIiMFwtkDuubE0J1a/byi/F8q?=
 =?us-ascii?Q?KwYA8LdWnfSXrxM81p/m4xaaStm19xHlk+u2375GPxCTbMU5KPwZbRGajaDs?=
 =?us-ascii?Q?PZ3zatIsY5jwq4e05u3YBTGPA2gbJHwKFwE1c/ueMuwh5tmyWYCNQbi3Wq17?=
 =?us-ascii?Q?g+HOnbFHaTyQ/XViRFkcXNMnOd7qW6HNkZqAZHAR3k3uyp9cAlx0KbxGWn3i?=
 =?us-ascii?Q?HdRJa3WYneaIzhpkDhqaT2V5k4fqzxcMireYVpQtz0GWmN8s21om/xJvJhrc?=
 =?us-ascii?Q?30OfehnvOI9MZKEN75ZzRAS+2YP+X64DjsL3nNlpNfBa0gAv47xQVFC/Cd4K?=
 =?us-ascii?Q?ezho8zhrNkxGrkiHDhpGuR/+MZSZVOCnx3MWXyvd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd21128-9ddb-49a4-204e-08ddd97ac1a3
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:32:21.5904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FN3ouiyoYwj6sxOvOdT9XI3/KrmvqavCJtrYtjsTB7piszMFGziUgykePMcXtHc8elbtrMc/YweFenmRY1GxQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5102
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

Replace "out == 0" with "!out" for pointer comparison to improve code
readability and conform to coding style.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 .../amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c | 2 +-
 .../amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c | 2 +-
 .../amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c   | 2 +-
 .../amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
index 28394de02885..640087e862f8 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core_factory.c
@@ -10,7 +10,7 @@ bool dml2_core_create(enum dml2_project_id project_id, struct dml2_core_instance
 {
 	bool result = false;
 
-	if (out == 0)
+	if (!out)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_core_instance));
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
index 3861bc6c9621..dfd01440737d 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_dpmm/dml2_dpmm_factory.c
@@ -20,7 +20,7 @@ bool dml2_dpmm_create(enum dml2_project_id project_id, struct dml2_dpmm_instance
 {
 	bool result = false;
 
-	if (out == 0)
+	if (!out)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_dpmm_instance));
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
index cd3fbc0591d8..c60b8fe90819 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_mcg/dml2_mcg_factory.c
@@ -15,7 +15,7 @@ bool dml2_mcg_create(enum dml2_project_id project_id, struct dml2_mcg_instance *
 {
 	bool result = false;
 
-	if (out == 0)
+	if (!out)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_mcg_instance));
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
index 7ed0242a4b33..55d2464365d0 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_pmo/dml2_pmo_factory.c
@@ -26,7 +26,7 @@ bool dml2_pmo_create(enum dml2_project_id project_id, struct dml2_pmo_instance *
 {
 	bool result = false;
 
-	if (out == 0)
+	if (!out)
 		return false;
 
 	memset(out, 0, sizeof(struct dml2_pmo_instance));
-- 
2.34.1

