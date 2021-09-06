Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE7D401264
	for <lists+dri-devel@lfdr.de>; Mon,  6 Sep 2021 03:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6E389AD2;
	Mon,  6 Sep 2021 01:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3EF89AC9;
 Mon,  6 Sep 2021 01:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkykMXw5yvsC3tOJ6465BxfBoNZAQKy9NEH/IXX/ZgkwoEbWZA6i/BBKEIWmh2r4NduF/VipVi/adjO/J1Dl+yDPDC2Gyb3lHWojprERszWwsDMX024bDln0n3EHb8HV3DM405q9YKj6CaWX/RfHlctdLzaAToX6AnYEy9GArgeEPkG6OW9DtlSI98NJ3r3boNM81DzuuqBgZC6Er/Ci4N8/4NpXed3D8VVFItyU3/UWPUyCCItEPK+FLD0Dwsq9orDPy+L85F2RUkXTngk96eepsK/yOH5reC0HP25He3YhT1k8eEU002clYf3Ti7jpBV4NZVkJoax83kmdEXMgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1SyoPHDjHRAD7j6nnV77s3plbU1ueqoa4uAZuKlzklE=;
 b=Ly63W+uSfneAwTY4YpwTT0Gqa42zIuzzCCcHu35nIjsNj0vwBV7JlCZcgJkPA6u+7HHryPlBQqpk0/DoSYEfDf6fzfq2JGSPnM5/MURltHLWgukeaBHE6OqSrnRA7vDUkpJf6o66bA+uRd5AUuhnlr47E7LfnJNLGt3Lm7K9H+dyvbGA1nYM7MPVeQzcUXTc1yXL5v3FG0/DRG0gDlYzLin/dDETw3RHtE1ckJHXibbciQlVwOhdLHRNvPWYafqJn6xYheJ/iL3sk1HLrMYfjx+tnOFRCwzHhHJlLpTDQp2AlB4CS9F1W69DTm5A1pfb6Aqp/a8itphdYEKCJ013Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SyoPHDjHRAD7j6nnV77s3plbU1ueqoa4uAZuKlzklE=;
 b=NdvP5Duvhs1lTpYIOpr2oxu2YBtv78OXPmuouvWNsstajzjL3BQFX4dbcDTXKe6Tc4XxLNF3kVwmRAWj4RYbgiBuP25BJNuOChP5QtycPsar9aUCFr+PKYIMI8OU5YsD7WnSuVud3NYeeb+uQbCdmPss5meZOszEEk0RZrGSKPk=
Received: from DM6PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:100::34)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Mon, 6 Sep
 2021 01:12:29 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::8) by DM6PR03CA0057.outlook.office365.com
 (2603:10b6:5:100::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Mon, 6 Sep 2021 01:12:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 01:12:29 +0000
Received: from pp-server-two.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Sun, 5 Sep 2021
 20:12:26 -0500
From: xinhui pan <xinhui.pan@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <chenli@uniontech.com>, <dri-devel@lists.freedesktop.org>, xinhui pan
 <xinhui.pan@amd.com>
Subject: [PATCH v2 2/2] drm/amdpgu: Use VRAM domain in UVD IB test
Date: Mon, 6 Sep 2021 09:12:10 +0800
Message-ID: <20210906011210.80327-3-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210906011210.80327-1-xinhui.pan@amd.com>
References: <20210906011210.80327-1-xinhui.pan@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaa59881-3089-4392-f5e6-08d970d36570
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-Microsoft-Antispam-PRVS: <MN2PR12MB388620F28BE2738E56E7079F87D29@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:127;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BHbVVxFNSr7amANgftE5ko+N/d6JKOQSnhIq5J147kA47P2SJYGDK94K69P95rYa32EmV+9+B6YgK/dnhR6wPXTwkVGOZOX5Zq9btjsz+WcTYMNIDbrQf5L1TIQ9+OiAJR2UWeCImVV0qt1bJLY1hbfATaGSOE15513JWyULFh2J9aPCKATjnnmcZjniCsGfUsUv5HEmy/ZSJbaoJX2/pGQtyGli6ozRvZ8xB7YmViE7fsK9vP3Ablv4czq1eEzVQ/9n7eigg27nhVBBVWLWgilwOMtSfB2BOTPH9+gV2jeXj6t5W/Ur2Yw8LGC2p81adbR6D0ihBLroVbrJIPeiwpRR5/rQTP0JGSh8tlLudDhlGYfjsvwk0rkrpkVzSRZ7uZeRxU1Md1sXGrmk/HDb+uuqCaqkYhcRJn/EgI47K6kg37nlGxeMj/p8+rkVTUMpJNq8oThWRctd8ESYriuRN/5Vo7dXHx+UZ9PjkJPi2ViTp0xIAAHomVYw8GNq4gqGSqYatd6Mqqy77N01f1TsYOPeoL0wynnwzSWnX/ysw6J21cE5O0W8o5QF+7U1qOL8yvUvkUPLj0ZpeUZca3Y+2MSa7KBoCFeMl/iHcUzoMivbd+vSfhQovaJXG4lH4wz2nOYQ6MkwQgHDjBP1wAXmd7L47xhhVE7d+7otNf1yccJ7GLcZmb0bpNjSWILw7RpF8QihqytUTZ77WBFf9FRtzumnhnwdWWcWvi+96jVBwc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(1076003)(81166007)(70586007)(2616005)(356005)(86362001)(8676002)(2906002)(6666004)(508600001)(316002)(5660300002)(54906003)(8936002)(36860700001)(7696005)(336012)(4326008)(70206006)(47076005)(6916009)(26005)(82310400003)(186003)(426003)(16526019)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 01:12:29.0898 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaa59881-3089-4392-f5e6-08d970d36570
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
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

Like vce/vcn does, visible VRAM is OK for ib test.
While commit a11d9ff3ebe0 ("drm/amdgpu: use GTT for
uvd_get_create/destory_msg") says VRAM is not mapped correctly in his
platform which is likely an arm64.

So lets change back to use VRAM on x86_64 platform.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
index d451c359606a..e4b75f33ccc8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c
@@ -1178,7 +1178,11 @@ int amdgpu_uvd_get_create_msg(struct amdgpu_ring *ring, uint32_t handle,
 	int r, i;
 
 	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
+#ifdef CONFIG_X86_64
+				      AMDGPU_GEM_DOMAIN_VRAM,
+#else
 				      AMDGPU_GEM_DOMAIN_GTT,
+#endif
 				      &bo, NULL, (void **)&msg);
 	if (r)
 		return r;
@@ -1210,7 +1214,11 @@ int amdgpu_uvd_get_destroy_msg(struct amdgpu_ring *ring, uint32_t handle,
 	int r, i;
 
 	r = amdgpu_bo_create_reserved(adev, 1024, PAGE_SIZE,
+#ifdef CONFIG_X86_64
+				      AMDGPU_GEM_DOMAIN_VRAM,
+#else
 				      AMDGPU_GEM_DOMAIN_GTT,
+#endif
 				      &bo, NULL, (void **)&msg);
 	if (r)
 		return r;
-- 
2.25.1

