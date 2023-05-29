Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E010714710
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 11:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016C10E261;
	Mon, 29 May 2023 09:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EA510E260;
 Mon, 29 May 2023 09:29:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5UWHfdAKZXhKOvi+mxLTPCKNc159nffad7IXVmc8gWJ0PQM/apC8ljpWYMqxAUGVXedX0t3TpDv2Yi5LF+K67eLh2DN0yRlXRFO9gLacz01zzjwUx8s/QVU29Z6UEbVWPLyj/1pUQ5Nwa5bQ8wa6d93YW9hyr/j+IglfNmOvedGLVxkPGbedxEn/VIn2nQ7IQFVvzCUwllQ+6hjE8QC77xWLh7GN+NO0ibQDk8QhP7izhtNUl8E/psKGs33AlVUkx5ijt1wF8+V3AyWE9Z7eUMdVN9V3JSHe8Yu4A5KRLymVup/r18CAnzGaqBoe3cvlUY36DauM2ni6YRFXwpV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/k3GZZ+QrKgzBP03L+/MLF445nHfQuExoKLWM+MX3wo=;
 b=HeLHoZhswSVJYVoQZzRgERX+Bz5m02CgM4y7JaGz49xkl+WNjjcAZo9D28eDI4SlYwRUZitKZEgY9RUWlFnUvS64Hh7BM407Bs2XeYhECcisJlva4r/cnzNg+Pg3aOZJ4inj05ZnUGQtxCZ1zMkBeJBK/79j1wlobRWI/XXHIouq9bD+FjPfLutproEP4Et2wgAzv/7zMme1o4GapEtIkrAOp2sqrIj+RUdN9HpvVzh2l5Vrs8eXkmz++VGnqzMpnvqtBFG8REwiqjWJRs6tTNXSA45waHqy4Rth/xAucx8j7OT7z90um2eYgmpVem9sYYCxuv8oRmJjkvmeiYAyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/k3GZZ+QrKgzBP03L+/MLF445nHfQuExoKLWM+MX3wo=;
 b=AsmSAnmANXfGeTLMBjbCzNQcKXanXzG95RsxIt0CRtm4UyoV4qkZOOMGxf3O3XPnNvqAUftw8tXCUtFj3jEIR1FbhxDXUEGyhvU4rPeS8n7NVPC5YCxELb07wihNGshiO8S5j81p1XRRfJpEdaGxGfh6Lrimr/X3BKPLUK1+hpw=
Received: from BN0PR04CA0046.namprd04.prod.outlook.com (2603:10b6:408:e8::21)
 by SJ1PR12MB6292.namprd12.prod.outlook.com (2603:10b6:a03:455::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 09:29:16 +0000
Received: from BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::e9) by BN0PR04CA0046.outlook.office365.com
 (2603:10b6:408:e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22 via Frontend
 Transport; Mon, 29 May 2023 09:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT064.mail.protection.outlook.com (10.13.176.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.20 via Frontend Transport; Mon, 29 May 2023 09:29:15 +0000
Received: from majun-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 29 May
 2023 04:29:13 -0500
From: Ma Jun <Jun.Ma2@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>
Subject: [PATCH] drm/ttm: Remove redundant code in ttm_tt_init_fields
Date: Mon, 29 May 2023 17:28:53 +0800
Message-ID: <20230529092853.3430546-1-Jun.Ma2@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT064:EE_|SJ1PR12MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f6633b-2da7-4c32-495c-08db60272bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y0xIK2l5Zisq36dajv9sTb1ItPITYVWwmo7LM1mIN19hL4vikrZo0lagwfTwhNpzlckgJUjkx0LcKnZCsNDoxcPuTX4ulffFhP7VATQioc+l0Ng5fwaz5xFTxehmjrjr6wST6OCJaTMHoXrhS1YAobTXi6O8xnWsccAoyvlCcMp57frTIGMzIQQDo1iZwgRxfYvG4f9K0HD7zUhkybJhV64YO/QottkzwyGRjWcP6W0wTPXC/qCtdURbuC3br+/xt1uNxL19QNcwHBFwhpCyqNOLORYa7WaFIOiVkhGBlg2zRD52baLBheqPF9Tk8hRwgmRpcb+tvMz809Y2gwJL6LV08csSAm1nLRJVxlWKMxD7cby+8P9IK3iy+CH7lv8S6dvhF4mExkhsxkPXtUKxNz9Dzsgjd4Ab+r2Vdr8GWtpd6HTUOlKPLwRshKBCS1DwHDshFKgCOIwbhHr/LAMjyT7S9JVCQBxvBBjIT2uNUJ+gVx/wImF6eADurnAT1402a0ocxN+PT8ASdnhmlH0Sqf3VU5TP86nFF3ker8GuDTsjT4ROs0N/67nmOxkS2TovC0Ivi4GFLVme6PsNHwnNRmy+nGA9YZ/pFPPRRZyNzt1wQ+ufd4pVTMAgv0eiZf6yrQ+HPfSrywMiVfhunWxZ8MjP9j1u2+03ApDmsevjeMzqWer2y7I2sdDxHkAYPRrOPmaP7aJcHRwZYHFdGCbg9OxDkCLKXWjUctuAaQ9qzz9okaMAQgPPbVuO5LKOBnWLghvqh3mHNO6tM6RntDj5ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(54906003)(478600001)(110136005)(40460700003)(5660300002)(8936002)(8676002)(36756003)(2906002)(4744005)(86362001)(82310400005)(70206006)(70586007)(82740400003)(4326008)(6636002)(356005)(316002)(81166007)(450100002)(40480700001)(41300700001)(186003)(36860700001)(16526019)(1076003)(26005)(336012)(47076005)(7696005)(426003)(6666004)(83380400001)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 09:29:15.6243 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f6633b-2da7-4c32-495c-08db60272bd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6292
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
Cc: Ma Jun <Jun.Ma2@amd.com>, majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove redundant assignment code for ttm->caching

Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 02b812dacc5d..45a44544b656 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
 			       unsigned long extra_pages)
 {
 	ttm->num_pages = (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) + extra_pages;
-	ttm->caching = ttm_cached;
 	ttm->page_flags = page_flags;
 	ttm->dma_address = NULL;
 	ttm->swap_storage = NULL;
-- 
2.34.1

