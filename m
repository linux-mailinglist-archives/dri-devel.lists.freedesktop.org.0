Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A495AE09
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1888210E77B;
	Thu, 22 Aug 2024 06:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="iQIQ3Uw1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2052.outbound.protection.outlook.com [40.107.215.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A87110E77B;
 Thu, 22 Aug 2024 06:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8m7aGOpjWJvCtVf9KEM/X7/ODwIf3LViZUG/3/hXrlOoIM2o6gmRbg8czpk7v584SrNmdB1JllNIhO/RJRnmp5XbZQoi+9X/whcJLytPjAJUlZIpoMRkmETAQLg17umitGRl+bkD5Fl+DEcfR1VizccTo+KljBnNnEwVFaLmiJEZaKaBa1tQRs/FTdEs9bHbRtwHByPEUsj0Oy+25s+cI+goDOTKm3r8uhnxAC/OStzvUhTiiHrb17iSLmfCgQqKTL2gnVvw0/CO/ZAJpNKaHwbJ4TbT78xjYkmhS0rDkgIkesPUgpjmQvNbGGI2Two8pTcduIg4TYWOHhL1CbqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=afeNA+gWGiIHPUrwnv6d4HvsafNeI3qbgs5IzL4vkKdCmUQI6/6sQ7+mlNMQFKi37JwEy54V3WNE3n1gLTiMVFzysU3stzXQSo86QI8pNeJoXoGFmm4SMqOQnWTuiqKS8E/Cu9inPJqD/JqF9OoKQ1sglYoZIoVtEpSXfXsn8/N6DOpze5d4pSeRLg2WaZV7voG0kMNIiZuTl/UuOsnbSyG2wHUUMbq5uMBeGuFS0m1DYdLI5C9dIgp81ixAGlqaHaXSkvdinV13DB63Gtqw3hQxkeU5gUWv0RUWhJt6W6vfIsrhXXvnzgPgpJpqIFd9uh6YCbCsbbHtJzf8DhaT8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPHFiCX2D8HefJU2ksWv8ccMuI1S9KxOQ2E/bdwcOTg=;
 b=iQIQ3Uw1aGdyEiajJDjVST3DVHn+FvKgSjRGejb1y5FXZZw0uk8qs+kBaLnfgf3cOsEacQ8UaWJSsqNCgxp2hvDw2ic5iG3pRcrSShrkTNUzpz2OVjT9q2Hmi2atXKdzDOK5aFDVcZze3F6ukQMaF8cA66f3iACHqw+l6b4S08Bmm87ch7KfvxY3n4i8B2MQHya0bN0LX8YXtgJdd6goD6ugVdHWHvudftLoIlxeV46ITj7wMHer2PaLRxXMOtpJTBtzzNyd1gON3dc6AqJMavERDwTPTWC2dLwZn9Xxe9uwKKHWvxeIzgd94PPEZJPxp4h4w3zfGkpUr6145zssxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:52:17 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:52:17 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 3/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:51:34 +0800
Message-Id: <20240822065137.1331172-4-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822065137.1331172-1-yujiaoliang@vivo.com>
References: <20240822065137.1331172-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: 710b55fa-623a-40f6-77b0-08dcc276f674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hZW1tfR0YV2q6wdCrFhjGuvgaGlP9kfm0YtiyCpORokfCiAovbFGW4cyswQ9?=
 =?us-ascii?Q?1x0wq4UbG2JFjqv8gUQ9TZ24kDrki44aavy/9YQ3EL5Wl2G3MMDnziUhQ39x?=
 =?us-ascii?Q?yo09xfkXKLqdh2VHTzvbMTdLMXEK113EcE4rrTB+wBhSU67pF0IC2gum13Zr?=
 =?us-ascii?Q?GXUL1n5CBroazFoLe5glRrNgQEZ8qnFl2MvMiThNbrhQZCqBl6tXQeMFFJCK?=
 =?us-ascii?Q?rJ0OqNe96OHrCbzxwYBASAhuL7IuczdF69kv16zdgftZepKrgYAj4fMVkHjT?=
 =?us-ascii?Q?6++GUxtF76/k6BJDb/6ApVY9b17qdhVXxdFaK/RN3kXYqbqZ6HrOem0BE/o5?=
 =?us-ascii?Q?vdVQrJC7OWpoxOwZybfuvSvcfUFBMyre079wPC/IoMM9CH64QRZBX3BCHgiz?=
 =?us-ascii?Q?3PrRYbv4hW0oylw9AvzHTAi7S1rxYXPotLS154uMk9XjQCLr7icAhMssWJ2X?=
 =?us-ascii?Q?h/uxBnPq8CFS3FPhXNN47Tuxdlp+7Pdm9wx8VAr2jkr/2pUZ/x7PKeEBxLwk?=
 =?us-ascii?Q?E7lGqz/hJqBIpPmuxpjl7TRc3DVesaL6KsKd+pBtGPMx1F68LjrcefzAK69j?=
 =?us-ascii?Q?IgC3r0E7l+fL9pMcZqTkxGYKrTVf9QoLx8cap67LyWx+iPH/Y9wGyEHihw0i?=
 =?us-ascii?Q?U5N6AalQ4esTPm6cBv7hJcLwRdaY34qn/OYYN6tGB4yZUTNrCjg7HfBUoOqQ?=
 =?us-ascii?Q?4w4VErSzJ3QPXrw0t1zKhrHEG1sQbCMgFOg4Okpfx8nKWN87rk6xoRPrIy2v?=
 =?us-ascii?Q?Rtzij7gxd4LICA7XvC8Mo6konTwLlpR/7qyuyhmZhTWj6OAbYZ0DpTzegV8r?=
 =?us-ascii?Q?7drq5/ARfd/AuE3nhA0GrlcYHM8s4GnvuDpR+jTWDX5UMfaAvn0ZL2virED3?=
 =?us-ascii?Q?3/jOBlNXv/Fnuqekpo094L0e2ynJX8L/dK/pAp9300A6iAEMZco4jTZoucJs?=
 =?us-ascii?Q?TAiiISIeqVMTNqMQ2Beq4u4nnrCZhuYUpErK3JZcY22bduaD6nRID7HyQvwf?=
 =?us-ascii?Q?zmxKCegKcGec4X/2EpzwtM5DZhqhfyylNbKFYnup+u4USZ6+2Z7nPtwSo230?=
 =?us-ascii?Q?ipVIVCQMm+/m9l7M+iB05k2stR79JJ9tOsdOgq+YuedgOpg0isQRi+ZrK5rx?=
 =?us-ascii?Q?3+uV1ihUyxljPl2xyc6PQK8ndUzsrkluEAk52SiSE48Es2WVDBQybClWNrR8?=
 =?us-ascii?Q?NEKrdqDYB5rNzRLYUqq/JBxsiNK1QBGXgbu498rDrEA75Am4TLRDWYOIO7vP?=
 =?us-ascii?Q?cMorYs7Evdk3tsvzb+TGgnFjfjbEK7Fob5CcQz3u60Byn7o4nntdXl640rub?=
 =?us-ascii?Q?/HJyeWuu0nNXZOOVbi8sEfGEjwKMLJjeXr+WOkdvovl72TrQoYJWnw6lMF3H?=
 =?us-ascii?Q?gzMBlJuc6UI4NQVGnNnGpS7PPrimXT9IXU4pFIpjjIZiTxB+kWYDbVuNyrRA?=
 =?us-ascii?Q?yvqoEie7lUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ocGpLYDDfgpKvr2QJ1z45DDA7qQ4EbOHO9IHFXfO2Dfff/SxCPlso3v7KTwp?=
 =?us-ascii?Q?1E6HWa4P2XeWw2pH3HrY9UHUG+jwEAET5R2nZ0ddTd3kVmx5gli25zaExGfX?=
 =?us-ascii?Q?IeeJGDNRA1pvLbPXoFBR5N+36LSwvPpPq0RSz7hUt2ZY9/Sv7Q1AcniTUJuF?=
 =?us-ascii?Q?/2Ok3ZxWMRItLnFH1lULVq/6TdLrRnHQKXo6hZ4Urv0UXe222jLmdRx8UuPy?=
 =?us-ascii?Q?uNteN3MOiKPQSC6SoOFnCkV5Q0c+3fNNQHf+tqKwSiOb0NHqp7kycD7OrgN/?=
 =?us-ascii?Q?nnI3KYA78oSfSCeOFPFd0wSZ6JRgGTWbItCYJrLvPswPcl1dp9qO43Vzj+aW?=
 =?us-ascii?Q?aa7uUJhJbYragtTuiAxmk3t5CevNK7+dL3FD+XpAl03K6iivD2IY3gPMVllm?=
 =?us-ascii?Q?FVUeVcptvBRqD0jDJja49EX4fNnT76tEfk/LAr0sgZLIqhBI/fnCbQEW3YfP?=
 =?us-ascii?Q?mMUUJVqNcoJkHLhnuaI+U7FX6mCbpqVdC/OftF6vM4SwPYJCzZ7lBiFDphB+?=
 =?us-ascii?Q?DBwucyGtIPRA2Cvu2YgvtMzNGLDaqq3V7McKjzukpErnCzp1kfSVIqhLPTxz?=
 =?us-ascii?Q?vZC3yE+LBG43gKbIiHOnMMgUq6m13uESsXwt6RXPgKxS7zcifksRpX3mOqGy?=
 =?us-ascii?Q?4romKOBa/A6Oy9J1FtC5wgveR3hwDUrRHvHv348k7zsQx28tCnksj6jHgZ5k?=
 =?us-ascii?Q?i7vBXhry+zmWLWqO+VlXvRhnI1wbSkEtDtRmN8aIRYZA94wkhH0m5PEn3Om4?=
 =?us-ascii?Q?smNE6yBBC4DOZvH/uXyHF6is/PPq/yp4K7woaLg+bbn0TNJGe81Q+ZNAsk9O?=
 =?us-ascii?Q?P5d0OrLRsxhH2qlby4fTul++61rN+0XEuuOh7Ib9yE61pePhq76LsF5VdEVa?=
 =?us-ascii?Q?Ve5c1zPq6qJ/Uc++1nrkPSRl3s9UFT8QRWBh2o1fZ5qLw84y5x/LcPEaMp1o?=
 =?us-ascii?Q?RCcIcULgBwk7oQjhKCSS/s1YAGDEch21cFRo/T6J8zKnxUO/S67FiqzqkseT?=
 =?us-ascii?Q?yI0G2cJiToTvaJU/IL6ncFMPuLDU1hkIZtcnFL+WQw0NHuweGVmXXxY9zEOx?=
 =?us-ascii?Q?FjnRFz99VMkzENOwC3Aj5FcJ2MYydDi8MddIrHoVMhwxvIYUTlMMiSUdLqiX?=
 =?us-ascii?Q?D9L95gTIR9g2b5yLf2BJ8w2w3dqP7w5xgIh+xuUHg/Ty7LFXccTEWfqPDI7/?=
 =?us-ascii?Q?fpyQ1D/J3Zfcq1C6JvC/YJL8f2pJjwgDkTnMOdxRhCr1VsJ6MdXZNJCJfG/S?=
 =?us-ascii?Q?/QgCDTNXyfE2rob2pcXlrGsHEzLLnNaTRi4BJWEiS4XOL0g3Y/2LCXEr0DvJ?=
 =?us-ascii?Q?0Uoq5Tpe8ECiqwnsFDH1HgWBSyBvqjngm97laKfMM+d6aJgyhMddiORxWB2g?=
 =?us-ascii?Q?5f7tPPHWZ7zEZEBkciTWz2zIrv09rr8Kc58yUNRZRIJnPTl+OodeUiqoXyOu?=
 =?us-ascii?Q?C9qYYsL6cVs5SZcwca0O5FGaz1jjDKni5S4tHyfFudwId4uYWm/tijx5GUe4?=
 =?us-ascii?Q?KEc4rAKJdsKYMfnlKRNaEZtz6FMb1EzTEfXCG/+uebg27sGqcH+H+andQR0M?=
 =?us-ascii?Q?j48216duG5fm/3xC1Fcc4PT52YI/2teol13oiCiT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 710b55fa-623a-40f6-77b0-08dcc276f674
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:52:17.8243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jntqnmdgob7AzmigIoV6PnHwdrI/w3otxpR7xRG0MAAeF+LaS4J3xnTQ7i00qk320OsncfjJprH/4rrXrV4OmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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

 Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
index b38340c690c6..5d40f61261ad 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
@@ -797,9 +797,9 @@ static struct rect intersect_rec(const struct rect *r0, const struct rect *r1)
 	int r0_y_end = r0->y + r0->height;
 	int r1_y_end = r1->y + r1->height;
 
-	rec.x = r0->x > r1->x ? r0->x : r1->x;
+	rec.x = max(r0->x, r1->x);
 	rec.width = r0_x_end > r1_x_end ? r1_x_end - rec.x : r0_x_end - rec.x;
-	rec.y = r0->y > r1->y ? r0->y : r1->y;
+	rec.y = max(r0->y, r1->y);
 	rec.height = r0_y_end > r1_y_end ? r1_y_end - rec.y : r0_y_end - rec.y;
 
 	/* in case that there is no intersection */
-- 
2.34.1

