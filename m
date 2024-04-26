Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B05D8B2E6D
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 03:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E1B11A95E;
	Fri, 26 Apr 2024 01:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ECyJ8tVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E08111A95C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Apr 2024 01:47:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ws6B3fR2j6DFHCIjR4cZv4TtbAGRrLCw05CspZ6l0QTLumj216gz1S1R8XUzvdb577Phnu0nBEns8u4IBjPbaWYe3jLTyvOnzvNO5vsS7GOFEr7c/5iCh2LvxV3wHGGWhr7FXnF4S/wZhtc7mBLl1f4JMLRhN41tgqPii9PNwPqf45TYw5jRTKY8bV1Jaf2BwO0F3SdPMq5U8lP6HSmHz3o4stx493FSoQLU5yjpZrhiIZagvLeUYATAeEg5bQdUXOgtdVgEHWhpiKaThYBxwoQPcQe+1GaICkB76GTUta3KDenEF136IO4Of7t5iQZn177maoA6P8tahN7zScW0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAZ58Fqc9Or0IOAa21ZcwqwcYQHJ2T/acYKTRiXxiLs=;
 b=ant3PvBp5Z6437PEnkf3eUUBML2EWwlW+L8fuiXmMF9ZPUOG47DGFZyUXL5DtgvezZwIgEHynLcs01Ht9mNHLQKM2qCzCYkbb9U9pZ2x7J9wu2QaPdSMcESVQhT5gm5W6I/xlKcgxKeRFBELSTvochxKYUhVaQWHEDIFZjHJH/LeEkDPmq4kKfz0zATo73aXfUn8RtPTYAu+/4MqXzM90BviDX55UYFEwz+T+bWHrVOCmmC4DfmhJa5AVDcziWynT+mIvpmrdB0W+SWRoUzZatNuHNfWfo7ucZSWRj/ofat71JMCK7s9MCEo68No63Z9Q7h5AAcBKGmtXwpdgaOOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAZ58Fqc9Or0IOAa21ZcwqwcYQHJ2T/acYKTRiXxiLs=;
 b=ECyJ8tVxSZJ8QO0OKzEmMyp2I4eycIG/hZSeJNrfWhM99UcJf2lb1dbbsVSklVuv5Go1p7UVlaN6M0Xehmwrsv8GMocEp48D4jyT8wusumXBe0SpnENC003/XIo3N5u/r//y6dSHl0V0zPz/hqZPjQJKJ8juddQPsQ60oHsxQYs=
Received: from BY5PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:1e0::17)
 by BL1PR12MB5731.namprd12.prod.outlook.com (2603:10b6:208:386::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 01:47:07 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::8a) by BY5PR03CA0007.outlook.office365.com
 (2603:10b6:a03:1e0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.29 via Frontend
 Transport; Fri, 26 Apr 2024 01:47:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 01:47:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:47:05 -0500
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 25 Apr 2024 20:47:04 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Date: Thu, 25 Apr 2024 18:46:51 -0700
Subject: [PATCH v2 2/2] drm: xlnx: zynqmp_dpsub: Fix compilation error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240425-dp-live-fmt-fix-v2-2-6048e81211de@amd.com>
References: <20240425-dp-live-fmt-fix-v2-0-6048e81211de@amd.com>
In-Reply-To: <20240425-dp-live-fmt-fix-v2-0-6048e81211de@amd.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@amd.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Anatoliy Klymenko
 <anatoliy.klymenko@amd.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
Received-SPF: None (SATLEXMB03.amd.com: anatoliy.klymenko@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BL1PR12MB5731:EE_
X-MS-Office365-Filtering-Correlation-Id: f5837e49-b52d-4d38-2e85-08dc6592c761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTlXTHNqRkFDUGVUOWg0ZE1TN2R5RmRsWkdScisxY2R0K1Z2ZklLRU9PMnky?=
 =?utf-8?B?TjdhTkNKU1gxRm8wMHE1eGV3M2ZZVXB6S096b2dHRUhEUitERnN4emd0eGZz?=
 =?utf-8?B?bkUvVGw2bGdFeEVtWXJNbERpWUt2OHlPNW9LeEZ6V0RZRWJLdXh3c245Y2Ez?=
 =?utf-8?B?Qk1QZXV4TGY3cDd4Z0Frb3lST1c5ZmVLYjkzQUdwRldnYWdTcnNzaFZ5dHkx?=
 =?utf-8?B?WUZlVnBxZy95T2VWYkxoZ1RhaUR3VHlTanNSd2hIVVRwMk45dExRNWFlckRR?=
 =?utf-8?B?K0xOL0lOOWo0MnQvdUxqbmtvVTlDclhSbFNTbWpQSUpMMU9MaGJCVmtFSGZl?=
 =?utf-8?B?UmRoaTNCWXZ3ajY1RG1aaFVPZUZTdCs3NGVuT3N2c24wbVBmb1hJUW9LMHN3?=
 =?utf-8?B?YWo2NVkyWGlnYXpyVFFuUkZWTmFTV1A3UjBZY0VoVmdXY1A5Q0VxQXcwZW50?=
 =?utf-8?B?Qjg1U3V0V2dyTzdISjBMYldhU2V3b2VERnZiTEdoUnhTdXZNdTZCRUdFZ2JQ?=
 =?utf-8?B?bWViTUE0SW1aUUsxL214NFdjN29hbzk1cTNvQWoxb3pLTUE1QnZLSDVmbGpL?=
 =?utf-8?B?S1FpLzc0TkhHZVJ2QUEzZUkzS05UanVtdG9XR29KbnNRaDc0Q3hxOUFFLzJ5?=
 =?utf-8?B?Yk1KMHBYMzB2VUh0NnQzWWpEcklTMHQ5Q2pMbWlRcVJpRjB5OEk3cHpSUStI?=
 =?utf-8?B?aXhrdnB6SjdWWDhnVmNLYW1oT3BsRml5MlhCZFI2L1FGVGdOb2NYZ0FScXlL?=
 =?utf-8?B?VVNOcXkzcnJCQnNXcSs5cjI0STVjTzNCNHY2SXQ5R2syem5MaTN2YkpBM2Uv?=
 =?utf-8?B?UnkrRGx4YndEQUZyV1dFc3lKVDdMQTBhQ2g2YUU2RFllamwwL2pYY240QzJt?=
 =?utf-8?B?ME9OT0tRTFdUdCt2NE8wK3plbDl4UUVTVi9nRUg4T1l6bmI5K2ZhSmxDN0dp?=
 =?utf-8?B?dVZYY3ovVC9NK1Q2OEMrbllyMHNMbHd0OGtmQ1hZN0swc0tFS1VWWG81VlEr?=
 =?utf-8?B?cXRycTRMMWhIQzBpa1lvZCtwT1BMK1NLNlJ2amVRLzBET2dnVWtLVytDMnhD?=
 =?utf-8?B?NkU5dCtCa21MOEE4NmNmYXh4RU1oU2RHZjEzdno2KzJrNFowMUxQc0FLM3Iz?=
 =?utf-8?B?dUdWVS8ycDJXdG4xUG80SXMvaXJFV2lYeXZaYVhCYU9leTZxbkxRWUFoUEdY?=
 =?utf-8?B?WjBVVmgwNWE5d2xkVVNzZFdlUHRWZ2xwSXVJenhsVHFiNXc0b0hQTTEwUTZM?=
 =?utf-8?B?aExoVUUwNjFVS3U0LzZKSHRzaURQOVBPbTZGa1RFYTJ6STdTVEY3WnM2Uzky?=
 =?utf-8?B?czFiZG9BT2JidDFiU2cvZ0N4WHl2M09lYlIrblZxbTlBMHQ3ZVM5cTJTMmZr?=
 =?utf-8?B?bFhDNnhMQ1IzQTlFYmszUDJrZ0FpaGYyeENsWmo3blNXcWtCcWFtdFNyZTZy?=
 =?utf-8?B?bHJsdFNHcXlvbTl6NG5xTTZPRHhwQ0FneDdNYmRoMGlqWXFwMG9id1l1UUM0?=
 =?utf-8?B?NkZLL2NwUmtMZWZrR0FtSnUrZlY0YnRyMDRLRE5zMHRJK3VtVC9wYlBCZ3Q4?=
 =?utf-8?B?aFdRdzdSTWx4MzRHejI5cHBkRENFQmNCZ3FPaXRVYklMVVNPS0NXbkFXNzc0?=
 =?utf-8?B?dTI1ems2clhIZ1VPczVsdFJNQ2h4NmJ6UGJNdlRrSkhwNGducmRGVzliWlhH?=
 =?utf-8?B?UnhQcFJ5UU8rYWJWcUhLQzRPaHM2SnhhUElOYWJyaG1BYjJsTnZMUUxhOFdz?=
 =?utf-8?B?bUNCcElYRHd2NkoxWFdQVE00WHNXQ2IySzAxUTMzenVlSGhmc2JISDJBV1h0?=
 =?utf-8?B?QnNtZTczb3k3a2I2SXN6Y1d3Wm4xRmloY0cvd1ZXUldFNkNVYTYyYTI5Q1No?=
 =?utf-8?Q?ohyG/2mOYQ1G8?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005)(7416005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:47:06.3183 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5837e49-b52d-4d38-2e85-08dc6592c761
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5731
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

Fix W=1 clang 19 compilation error in zynqmp_disp_layer_drm_formats().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404260946.4oZXvHD2-lkp@intel.com/
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 423f5f4943cc..c9fb432d4cbd 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -981,7 +981,7 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
 	unsigned int i;
 	u32 *formats;
 
-	if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
+	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_NONLIVE)) {
 		*num_formats = 0;
 		return NULL;
 	}

-- 
2.25.1

