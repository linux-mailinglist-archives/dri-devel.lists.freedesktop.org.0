Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A771B43BBC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 14:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32BB10E013;
	Thu,  4 Sep 2025 12:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="GV6j6M/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013033.outbound.protection.outlook.com
 [40.107.44.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF0810E013;
 Thu,  4 Sep 2025 12:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKOdLK14yrlKIIQj8eYuKzHqfmbBIKXQDaj+bJ+UzvXS4ep0h5m7VvdGNhNzsaQeuNxy6O301E+E+I0NA5CIe7cZTz7cd4HdKPDKXD1iP9sSdVnf9wKdJ4ikxw4N6Qn+nAyJmihPu2GmpM4YouQfumF4anMoMNVE5/P6HBzUUP1tDf12D1LKKR4wzNto81mnk7TIJquDPdfwKaSnoURF3+VSkn4ASv2je1COLFi+PaPrvQ51HRmT5noy8WqT2qASp2+En8Q0vYP+r3UyW6mIPcQw6NSAVfSrC5ex6QO4GXmqSira/A57Xn7MvOh/9rz3jUMA/OZhEq6dCCuCdMwR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06TFSUO/2S/BCeA732LX7xVRcqaRcj5HL+oHeCIT+m0=;
 b=mbMqxBuO/NoFe8zhAUdZmvzYWL3n4zIcRg300twwheXlIvo/XC2QZcmJ5fcrdz+zZP//yCgZ+k5jkkMir/ZTmL3j8hXFesCUZSH/oEKranEqkMf12fakw+NtIZNe/CmvQWiT2XRzNojONwOCJOb2nFyBkRuQ2OVocae1hQQbCN3MlTj+XFlf9qwWUqkx7qPd3p8zsdCB66WUSR0yUzeB6dyIBVQ3lyzRLW4OD+mWekjrD9QVuMaY0jFm0DAEt63VxOZPJFryHSG5sCY+hB1+wJ0xBpIkA6h304mBnA5mNxVO1dbcwxA01O8qyGDwpoiN1AzZIzElOO5syNqujImIig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06TFSUO/2S/BCeA732LX7xVRcqaRcj5HL+oHeCIT+m0=;
 b=GV6j6M/m9hDMiCbt1XQIZfxpy2Btkt3U0wfMpGo/0ak3pwkI5QXZoveJiKSiqAIueNEN9TCaNJO+XVqPX3A4OCGqceDRNgf3vo/M+LxRAKL0bTDkDaHbR8OabxLXZYcfvuYStEagJ+p8AE3zyM29ijxZ+7j/pc9/5DayEQKpMQgphqsginyJmLGrrz+pY83VFSWIpQOldsaLYG9781FS3+e410uvtzsjSH8lPcZWHH+nzqSa/QzgzfVrpMtjRUMyOVrqikorTzYbzIxCyQ8jF1JlDdAlS5trKlSnhvl5gY0j5pN+Ptifv0BMe+BpwkbqxiFfSuQTjcsN/J+Mt43OcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 PUZPR06MB5885.apcprd06.prod.outlook.com (2603:1096:301:110::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 12:36:56 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 12:36:56 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philip Yang <Philip.Yang@amd.com>, Alex Sierra <alex.sierra@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] drm/amdkfd: Fix error code sign for EINVAL in svm_ioctl()
Date: Thu,  4 Sep 2025 20:36:46 +0800
Message-Id: <20250904123646.464028-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|PUZPR06MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 99324071-0d21-467e-8da2-08ddebafbc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|7416014|1800799024|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LC7ZTiQpNdi3iIcTjUfsWJHeR+KMn0g2OaTl3Ojjqy2bgyQXYaRjU+XRrsxK?=
 =?us-ascii?Q?VqMCD18pL/OMA83udrfwyTEgc2E8wS54F36I1df8mh7UZhp/Wqt5j3f9mS/g?=
 =?us-ascii?Q?fpH8ConfilxevBcituu1dJYJwgHBbrU9dzVO7t7jdHu1wHj0kwyet7w9E4kF?=
 =?us-ascii?Q?qbRSyn8VGd4uf40+efmXCP63TP6QGQj04IJ4Sy2DrFiES3UMrL7pXK+5gtRq?=
 =?us-ascii?Q?BrkyG8dwkemcgUc8KFVUobCm+raiSOvaEHfsV61Ap8iWX8+3OUbEmpElF+Zk?=
 =?us-ascii?Q?6HaBtqY2HQCMSM6btHTRVMuBY68m8XZjogBaCbWfWNKofnhiUHKyKdbq9TCg?=
 =?us-ascii?Q?mVXiouPz8kVHZetdEeFPKVZQBQOpwcc5iEkBcOcI1+vCal3/bYaH7SLt/cwV?=
 =?us-ascii?Q?XN4R2BUD6Y3C0gGrM4bjn+Nerwj49OfUwiHbSciLj4ZX37ZJI2l/YPReLJJy?=
 =?us-ascii?Q?8X3iHvi9fWWpmu+/2aJUNgWFN6ogyle3+f7rM4KjBmUtEEgQLENbjGJ0IJIO?=
 =?us-ascii?Q?pdPdf1bFVZpNCtRf/Pblkaw8b1Z8Qv8BbanpAGFevj4zYRXtBpV9QIhM/5kW?=
 =?us-ascii?Q?nXI7FdqTbEFqPwgsXQ1udrKr9J2RXkjgC0dCvherSlHC1Lnkpnnx/9amAwSi?=
 =?us-ascii?Q?EnpSqpXLF0xSYpbX7sG7KLPxqXZsahEeiQco8HV3d8LvR2IPFS2+KWExlUwd?=
 =?us-ascii?Q?5UHABEHHe2Uwki2WGTR2vA/5wYKJKTpoGtx3kvZoQv3HyYyMV4WEX6bi6/ri?=
 =?us-ascii?Q?DtDf26BOxkv4E8izGYhN7k5CfzqDgpIxIOBH3MsQSuYtYEM0BzygIgR1Dsjv?=
 =?us-ascii?Q?CpXjeTw9iZ4LrljalH/Z1DWB3AW+9NbqfkwFKJg0Ap+5l8B4Z/AHbBXJ/ltC?=
 =?us-ascii?Q?zPCxFYxOZ5QAPVCi2tMV5Lo7E3XIRCrUqqvUJhzm2idl+PdFQq/0H3Mvk6pX?=
 =?us-ascii?Q?e5HYTm+mtfFpmUSjbzAZvXwtR0TyHe8LnIvHfh2LOUtS9ZmoqFk2MSmY3C13?=
 =?us-ascii?Q?1zIpxZ6k9+vHFl9U70mgYYbu+RzVUGoxR71Z7Rd/tnmdpeRou6Y+hgPIzlcn?=
 =?us-ascii?Q?LyUmwgQq70vuShNaSBT4+UcG4avLl3R+tEdlVnqH0g2XzPgtgUjLvKSOue9o?=
 =?us-ascii?Q?jVpvTvKLBIviEvKrdq0YNxn2hF+L2TSC49cm/wlBxCc3ellvftuYbxTHgu0n?=
 =?us-ascii?Q?ghhCiXHWNL35szPol2KE74NYDPMVBXqQE5WqjL4GZreePxCMfWavtYl6hVDN?=
 =?us-ascii?Q?GhbH+5RmSC3ykJt+gnw2lpMxTE+Ny78lhOG1nc0+mIFoJ+FOHpUYdhdFesky?=
 =?us-ascii?Q?2IYstw2fQCvIMsYqGAzUX9MGTglmmBuEdj7lz3P09eI6Hz2IS4UDGNENazgF?=
 =?us-ascii?Q?ecAt2vyPEjbw/QO8Q0HfTeJyYxYv110wi6AfCV4yiPuBgICFwOgWlhl2W9Fz?=
 =?us-ascii?Q?VAZdmA9LP7UDsMJhwJqU5rbFu0gm4ih0yeQC44VH5eN6bJmZWt/lB3GDj0os?=
 =?us-ascii?Q?KZT8QmaobgGctTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(1800799024)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YCEBpbeGUDO3JJ8Kl7l6SM1lJJPv7WFritmvwCjCIGRhq1xmQpmfpD/WNfHY?=
 =?us-ascii?Q?m56Wr90a9EEbjpFqE326IaFaGaZhCLn0WpEwdmWCjQZAkF2OOHO42rFFy3oP?=
 =?us-ascii?Q?qgUuOYohjCANA9YLXezcAWjU9jSp0PY+MnK0Uj7uzfKFL+0DnL/lHNXmNBmP?=
 =?us-ascii?Q?LlqJNppSVtPvJOu8WK3uVMVtU2b+ao4YlyqKqOIvFQ3QcPW6byTug4K8zV6Q?=
 =?us-ascii?Q?nZWOrUBRxOQ+NE8GW9p/TekSnCiYB3yH0rlgldgA6cF4xZ1lnroX7lrsdoO2?=
 =?us-ascii?Q?aklEPbh1fZAdZ41rWb2mRBr/RJZGIEPDX/Gs6b1XeHgDkKB4bXNXes0Swv88?=
 =?us-ascii?Q?sJ8orv7CVrCp+tctmATvUf8Fke1PsJiWK2WNFu5f7vV5yPBNPbL6REiFWjEW?=
 =?us-ascii?Q?5ao1g33NoskydKGaORvHy+Y4HrLIojU8wkpAtNKSH9HVBk072xsVJ+rAkeU4?=
 =?us-ascii?Q?zqfpuG6mSz3ECHyZ9miOOrgGDufglxQF2J0c0ORoJP/P7z12wovDN7rDBBwh?=
 =?us-ascii?Q?tVK7RItcFDCucQUvw156f+D3uheLfrjWx4cFlgm3aPEiTG7btgM7/7/jp2tc?=
 =?us-ascii?Q?FeKzsQC4kjFS5bF2GAuchHdL9xpQSiOks0y0C5zCjV5DPOB/SMDL+bX+dVpg?=
 =?us-ascii?Q?yDLuYGrxzoKchvNceSVsDY8MaQxWq9XDJEYqHS/kVxUMf8QDRe8xxVmMICX9?=
 =?us-ascii?Q?4BMQTueUF2EiYoB67LizPzgsdOS0dzugBgIMlLIic35CxGxOAD5HuHtSCj1E?=
 =?us-ascii?Q?PcTvfaS1eHtNeF7NteMCEGf9nl5W9pbuig9nwXM5VJSXic3vJnCBShfCeexV?=
 =?us-ascii?Q?QSQ6RorCpXgZ/zmEqGNC3YYO9J3cM4YUJAo5zk2we7qgg1VwPv8Zftb8ekAk?=
 =?us-ascii?Q?qmtT7uUAw1bH5yUiqYLmnJBCu3yAt7jGtFZZO1dX58jmC8NZrIFNyNkJbJu3?=
 =?us-ascii?Q?wfvQgH8ja0Jrb2e6iX9vciio0PgteXIpJ2aZuiRmX6IFmzniT3UOcXM3ZZEu?=
 =?us-ascii?Q?2cZILFEg7SPpJF3b4P8BjeMD6rGpOC/uHrs7SJG3V/0VzkZ8LOUmnxXPT6rL?=
 =?us-ascii?Q?8Hol33z8SHrB8xjmslcCXeTEk23A4q5d3SY9p3lt9zL8FS0s+cP6jDoa/ASI?=
 =?us-ascii?Q?mGrpwtmznj7+uIeq8pBmiSuxg7Y3HACHCMcMBWuCO04+t+ka2fIOtHzK+oW6?=
 =?us-ascii?Q?CSQnUun/6l/McxJBeJ83mW/PT1+tFtV9mq3rmqC3CN75n4yGfqDGkXToTQMz?=
 =?us-ascii?Q?isHv35BMIuqwoCAqU5OVbPBev/frZaAg063KPLPBqIr8suQ5FNxlLt9RbqSo?=
 =?us-ascii?Q?3rRiKxG9TcNmC990YF7JmN5oCRnap1AUJGLcfejGDd1eoO/0aPhOKcXW3ha6?=
 =?us-ascii?Q?RKxnpmuJUnEVMdPexWXOc+1qaNf03eNXEwTrYmueR1cSny4JGmxTt4cZWclP?=
 =?us-ascii?Q?qqpPBHc8BcwP5I9Lprz3Jl5Aneinn1aTFhueSR1dUH8/5EOjTb0Xw7uFGME3?=
 =?us-ascii?Q?Nli+ODBq0+b0P9U9D7Sd0O2maNPqDwBBhUco8iH2avnlGnUdDZTpog9IvT5K?=
 =?us-ascii?Q?KMgfRxKFqau74c0VbvjhDe6MmOBmEAisq9W+htN6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99324071-0d21-467e-8da2-08ddebafbc07
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 12:36:56.5547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jI2GDMh5WTtVYWF9TzEjFckK0dMbRVbVZYuVSdwWyKVSLoUAeJUQrxB/caCUx/TMoC/UA9sUyXAknoh6DY2D5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5885
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

Use negative error code -EINVAL instead of positive EINVAL in the default
case of svm_ioctl() to conform to Linux kernel error code conventions.

Fixes: 42de677f7999 ("drm/amdkfd: register svm range")
Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 521c14c7a789..68ba239b2e5d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -4261,7 +4261,7 @@ svm_ioctl(struct kfd_process *p, enum kfd_ioctl_svm_op op, uint64_t start,
 		r = svm_range_get_attr(p, mm, start, size, nattrs, attrs);
 		break;
 	default:
-		r = EINVAL;
+		r = -EINVAL;
 		break;
 	}
 
-- 
2.34.1

