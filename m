Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4906695C86F
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 10:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 672EE10E367;
	Fri, 23 Aug 2024 08:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="dmiNhiFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from HK2PR02CU002.outbound.protection.outlook.com
 (mail-eastasiaazon11010054.outbound.protection.outlook.com [52.101.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB1710E367
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 08:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U36jZ0mZrcfnpWf4lgpP3QXRpccoMY2IZzVbLnMZBGk0cvya7+cIHpkS1j2VvSK5GZM1cw36fsg22GSEDTM3DEF5++b3d0PhTKKMvZCZp0PHgmUDSnrZWJU59/VFVbGnWA0LIZVX+kDXVO10qugt29vG//n/OPyvX1IedSjTkdxlLsMPs5fgeQ5XXHdGJs9lk53dQmm2+g0huojcWuKJuG6Awks4VD+IuNcEb5WNkHH2+1kPULFQ53LPvhtyqv1IJkLLTOUP4nnRcjnQdSOO99zeHNYeyDEyq0o/8KYYJhzYOoI6sLB8W+x3xWLWbmAx4E4liPwarju22luD8gWMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCbXIgdb0DW5NKaDI/HCebq1mwkoi24fiX+E2GLe4Kg=;
 b=LAJjPvOXyTY1dkS3wRNTlfWQUKOmJEfh43MY/rCvGeBefhPB0ET+Ww4iSFlD31teww1e110+rYwapZb5EAE8EsWmaF6b9hEYa7zSrqk4Fel9Lm/avKgW4daFEKJbOMIkgVjC8Ai48DRS4LqMjgX3NcVSsIbtDWUz/29f20JHQkrQgtWAIfwo0ews/Hb4c9nPL4JQ+OiVyXRjTDePbxw0nC/k/HpEWBbPdOi473THmxYAigxF0m9WfYx/V84yVL+RCdh8fyfZBxaetLGyhlPjBeDzO9F5DP+ddKodQs/FcgiEiUl6afXSUbFjGMFp5a2U1uxrTNV92szCOfGqIjvmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCbXIgdb0DW5NKaDI/HCebq1mwkoi24fiX+E2GLe4Kg=;
 b=dmiNhiFKeH09DjCUmydEGilOXOuodmfwYmUahrcYPefsdTqmI7nbs01q5tQyCuLIShZlYtI8N9AUNpP8FsepGe46RienStvWVPwOYbmRwv8aWMgh0k2CtlKO9jIXXu02E5NxIr349mM7uoApQOAjCx1sla808q6HCKOJvXYmRHVKDbaixUBUbtewqN0oAZm+Cmc78et1UfweB37VIQt4pMkygLNzwbOZv0b4kv3ieJQOL4ON519cMizp/knG5rjwf7ZJ5+6jzlDzJyavYNHiEIMHKCf2+TJ8VeIjn3cfJqj02LiPdaXuMxmTiR7PJviWuiAu46nedpXPVovILBqFcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14) by SEYPR06MB5351.apcprd06.prod.outlook.com
 (2603:1096:101:69::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 08:53:55 +0000
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f]) by KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f%7]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 08:53:54 +0000
From: Chen Yufan <chenyufan@vivo.com>
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Donald Robson <donald.robson@imgtec.com>,
 Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Chen Yufan <chenyufan@vivo.com>
Subject: [PATCH v2] drm/imagination: Convert to use time_before macro
Date: Fri, 23 Aug 2024 16:53:40 +0800
Message-Id: <20240823085341.8081-1-chenyufan@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::29) To KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5487:EE_|SEYPR06MB5351:EE_
X-MS-Office365-Filtering-Correlation-Id: 17fda4c6-b8cf-4513-54e9-08dcc3511e2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OKUYek/iUsWcI5dXZ7Go/8h6dhuzyL+BJk92G8UjAWX0wHqxcczGGzGShSBr?=
 =?us-ascii?Q?dWlMoHMms/yjRnFrKio21FXdtKoIWEuAKryibxzBy7bI/ncgbAbkBuJXacM8?=
 =?us-ascii?Q?pN0cO3fk7yaiWP796u53Haji2wTcM4M1Z4+ASE1nR5T2b2FvugScmOia5MVN?=
 =?us-ascii?Q?Fo5XoKwkBPsdYTG527Y77NEojmvykLhL1NJw1pBXo1uQkkLtdXQSxs8kVJMR?=
 =?us-ascii?Q?OnOldaHkZcj8KwamATZq44spTFzA+zuIaYYi2Db6MZrlfZgGauGNiTpwaYYs?=
 =?us-ascii?Q?Bu8s+aXVY60IKuFHJaNHytejoNmYmfsFlznUTqengOMlsf0tAFy4wKvCnvDB?=
 =?us-ascii?Q?9cpoId2+90bGNLtfiuI1AVqW614KT6EsEYelSv2exBIiQQkVFA7b2pu07P7T?=
 =?us-ascii?Q?gOyMUZQe5R/y8574Ddxh+WaawJcKvRBIZ0BPJ51Bw78XqlFD1+w9QLZxHF0X?=
 =?us-ascii?Q?JKDJXD+E/6oVFd7i79wY/rhNik/tqD+NK9FN5YbCd6WrY6khC6bgR25vK0E3?=
 =?us-ascii?Q?0lnV/78PPn9wUHLGRh1ZxWGdMyfSmAyVCi7h50WqlZwp5d/CcewTEXchW0Di?=
 =?us-ascii?Q?cZL/akJvJWpjX6WLgG6rgPCEXXDJjm/4a0LzVJYkSkjyjaJZCEJCInmzkJza?=
 =?us-ascii?Q?TOgLlDNdPXSoiamEePJorc74c+KLpYV6+hjzPivE4e1pbiyKMhrQ7euplUeo?=
 =?us-ascii?Q?DNt0Xpn0nENSYjbqbHG50gitTeO4Ld6lZ7HTjPMk9YlYsg7JaKQ8+M6e0GiI?=
 =?us-ascii?Q?aIjH3w8NAJlLC/2EIrEGbhhnbQOESoeaXJkp1o4+l2qsrj8XFcnIf1XUPxCH?=
 =?us-ascii?Q?e3LZudm8w3wlZqsJrLrbZyICapiI/XxW6X93ys0DvV5XRkLuK2TFhl1zDmo4?=
 =?us-ascii?Q?5Vvl9sfwt/Qb5UeBzHigU5F65kl0orA2aYafo+sK07ZSUEt/cqDdUyAsljMf?=
 =?us-ascii?Q?oa9U5rQ9lpV7ztQTZLsSLVAznH+9ct98HLFT2vHrwgYHdxjOg292lqZCXFQy?=
 =?us-ascii?Q?mRFEeOWJuxkS3KdDf/he81PMbJqA16CwiGDeBnvAdFBm9THJPP48pMjutV5i?=
 =?us-ascii?Q?YC9F9dbtO08sGtdSRmjdFx98GMcf+cwP1n8sfyeFQj/rxJl9KGtv74wgNvKV?=
 =?us-ascii?Q?ikXvyAdJhfw8gGCSNdc2N3JsDRcSeZGNXHaCbUROOVF17VBemI3Jo7ASi0VX?=
 =?us-ascii?Q?QIVGj8eykL3uhpYJsSLtEG7RqnRMKAXmpf8KTHGEf48yrRDa9qJT+PjfLfg0?=
 =?us-ascii?Q?uWTb1/EybZIRx6PKoKtVW3btZMjqRiyIpq3JUcUi1cKftQAC8cqhUB9OHKuu?=
 =?us-ascii?Q?1ii+F76Mr2/rna/Tc6p1Qo9kMXKFvoIrEXKau0m9m75f9UZHmen8mHQtIJAr?=
 =?us-ascii?Q?QSbmpNWsm82B8WiJPhkQ7H6FAUg6prVtsR9cRslh5Qu5AhijupvzrVLJJ0SQ?=
 =?us-ascii?Q?ib5vcTCGJKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB5487.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gaxCi9F8eHnpXCj5FuWv7Uo6gJrmoRnwRVEZGT5RspMx9nOV3cn/UHsEbKUh?=
 =?us-ascii?Q?NPSgTRjhLskXUfhqIA7ntbb1D+/onCTZuiG56he+m5uC7xPCdkW4sXySKqkX?=
 =?us-ascii?Q?vCkVJhYw28LQfZC30cihBIJQ1sObzfuKP1W9GFANAMM7SnvD7Q5Wa+tSX54C?=
 =?us-ascii?Q?APyk2sLx43qE47UewdnOqEz6tH+UXTnIdXSH63ScWT5+4BPW38vd0CARIgTX?=
 =?us-ascii?Q?13a07CcJUQ/xewOrH48+9Natm4yh0pKcD0efx/wTV+Sdu9z40FijJ3hk3dng?=
 =?us-ascii?Q?6uJiBbZx1q3SEeIQdbpSclKKZoDJDbXX8hPoif7CH5ckOVA1Baq9Y/ysD2T9?=
 =?us-ascii?Q?Agyk3YzbI7fBcVSD73yiTPvftKp345qdImw+xAVMBxVnhiA697dKSWDYG+Kn?=
 =?us-ascii?Q?3poHoiPku1H+YtBChVKy4uuwsFZdqrBjLVcr4NPv9rfwcnlVKTEvrua5C6rG?=
 =?us-ascii?Q?ycw+6ngdmWrUfb0GyuUhzS3YBNnuZtWY1MyNSfxZZM5ii/PQ3JFyrc5eIOvg?=
 =?us-ascii?Q?K7we2QQ+PGc39r5so8B/d1FZ6yUFaM+GrMQwjMqprovbSbYl2kLLP9WwIDqD?=
 =?us-ascii?Q?xAGF6aUCxyk2M4cz0OG1+SUcm2yP3jFwHNVr12zlec2nT7lSsuq+nYz1a/zL?=
 =?us-ascii?Q?DDO4s3N85iYVc/iMUpOxOzMeM6rOuH8PLt1+ZvGDAVNtNrlZOGrLAXvs8yM5?=
 =?us-ascii?Q?DsctfUrTHrg4Wzm92Q4vZEPhhD0tslmyRbP1Wisr6Kyt7I3Mg0I6SIaT7WHY?=
 =?us-ascii?Q?aRyBjcgOjo6K/qISFRQNg2S5tzErh1ORz3mi7HDQWhAkc/1MJ2Xt7/F2I3il?=
 =?us-ascii?Q?+s0dzlYx32ap2c0PbLZyllu8XLX80Xf+/2BmzpDdvdQ8HihN6nUBFAkXu5F5?=
 =?us-ascii?Q?3GhblkgcgYCpB/9p47aU1UH7bvWAjJE1xpiOFpwmKyX4/ERjgBLkxt4e+ASq?=
 =?us-ascii?Q?jakGRqaQLL9HvSsTZf1BX/2A8oo2WllVyUnuz4ThCATRebaqReOl5SHRXaOd?=
 =?us-ascii?Q?ajXd/A2XENQCIkEetib3v1+iVgR6dEn9G+4FW2GiTyeCM5htBItp8BEaLJ2a?=
 =?us-ascii?Q?MlhGpXufrLP65s0eGwar4YXyt6TSl5gB0Vsgh69OeBtAPdI/lWxjWfkD4z6S?=
 =?us-ascii?Q?Oi58enu9UIDDvZohfgqSAMWcQ+20444VI0teE0Nr551kx41aB3AexheKdzx8?=
 =?us-ascii?Q?//xRNYS1lkIpsJkGCe4aG5xZAjvlF03/EYgBs41+5ve0EPFGTuImK3qi2iFu?=
 =?us-ascii?Q?HtZAs81cSXTQ+G4u9FZlQpOJ6b4zD/KnXi24jnLPu5XR3dAWxFfF/kaNwX1n?=
 =?us-ascii?Q?7/cWGKuATkdFG7+XIxV0Gpx/Qw6TAKggeTtiF9csBGnAhW5ZZ3RTYmiOrvKn?=
 =?us-ascii?Q?rdOpxDp6nsrXp3ZcNT8mFKfRTB+Q1WBKuRS4YZ617LHn0pSY2G78e0JKyQ2O?=
 =?us-ascii?Q?eTOjoJ2Vq6sLPG0PoJhh8Tw9B81ygoJXhFuj4m800XKTHaGJfw0euGxyuutV?=
 =?us-ascii?Q?7Of/gU2qgIeoX239drhb6mSwftjzIK2HpL5yFH0pavLSjcaE/AFOwkwFdd90?=
 =?us-ascii?Q?3KsTzuCt18gi3XYeUqb2DhON2yEByuorq3/DDe2+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17fda4c6-b8cf-4513-54e9-08dcc3511e2d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5487.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 08:53:54.7785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSl539hSLGXkk/VKKBimT/+IZfUVmReoiFueZ94NB5zf8sOy17sZBs51NnfGuuSmz5GSPO66FIbbVGcOs4deLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5351
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

Use time_*() macros instead of using
jiffies directly to handle overflow issues.

Fixes: cc1aeedb98ad ("drm/imagination: Convert to use time_before macro")
Signed-off-by: Chen Yufan <chenyufan@vivo.com>
---
The modifications made compared to the previous version are as follows:
1. Change the prefix of subject.
2. Add fixes.
3. Drop the cast of RESERVE_SLOT_TIMEOUT.
---
 drivers/gpu/drm/imagination/pvr_ccb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_ccb.c b/drivers/gpu/drm/imagination/pvr_ccb.c
index 4deeac7ed..2bbdc05a3 100644
--- a/drivers/gpu/drm/imagination/pvr_ccb.c
+++ b/drivers/gpu/drm/imagination/pvr_ccb.c
@@ -321,7 +321,7 @@ static int pvr_kccb_reserve_slot_sync(struct pvr_device *pvr_dev)
 	bool reserved = false;
 	u32 retries = 0;
 
-	while ((jiffies - start_timestamp) < (u32)RESERVE_SLOT_TIMEOUT ||
+	while (time_before(jiffies, start_timestamp + RESERVE_SLOT_TIMEOUT) ||
 	       retries < RESERVE_SLOT_MIN_RETRIES) {
 		reserved = pvr_kccb_try_reserve_slot(pvr_dev);
 		if (reserved)
-- 
2.39.0

