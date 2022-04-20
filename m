Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50151508444
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD9210F267;
	Wed, 20 Apr 2022 08:56:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16B410F260;
 Wed, 20 Apr 2022 08:56:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBIJsKxfHpWbWx99gO27WajqI66IMtH/Vgz79C5QhajImmK83bQQQZDB29UrDDgwR/ZXeoBVRzJ7zU6Kv6bAN6FgJJ5AZaoXOva9HvUeFg0NdKT0hPz8N5vm/5YSIuqBDTQHYQl9CTSsQxrvttFFRvZpl7Je5bUZgddS54RNL07+59+UKmOUmjryN4RMoHsxCPhKQi/T6ezKwqTmW6h3fXSTTWL10Q3WdRYBN/yb90G6Elw1h8m3zxcwyHLe0GhMknsCQWZ/H7t/12SaPs7HK93iQeXn9OkYWVyyTcBNkJN/GEAgtJz7hdB6IOjUin61JTu7ZajJxoPp1cxOM3tq1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYuiAGols03Sh/7Lb8xiSNhL+df5k0p0WaVDHwuv2Y4=;
 b=YjbzANt7gvRbTQePVI9NEbXAySX4KvTZHhEkrRlInR6XN2c+wQn5pCNerZiE8wSaPPdBgHDCih9BwhuOhBLoEYws6LJ3ESKEKQki9WbPp4LKKZ1Br8pMpWoaOe5KxZgbzG68ksbrVYsFHy0wyPm/+EAy3ZxojDbiqPGyalf+dZo0goJ8RrpHYJojkGNA7yO+gAMTDmTYTWOIsYh3qQOu6ziuKoPT7+FkjPO834R10uVrPiGZaRrw2U0RTBKrDClih9Fd8qJSOMqsMJxYyrnjYNOYsVNxjP0vOAWgW3frxo2ZgTmE2gTlpwck3Pjzr2OgFxf2DlDYvdeC7YoiXFsDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYuiAGols03Sh/7Lb8xiSNhL+df5k0p0WaVDHwuv2Y4=;
 b=TmG2g4zUNTY8JOh6y77LTIu/vPr9vOs3hLfYtTVDc6SepOtltJ6nzqUmJvXKxvzooQ4P/IJnkZ3G8rYyzYCF7MT1eOuU0mv5SSEN+WRJ5sIcFGauSRqf6K2kZkKnUHpepgNIrks0nYRIdM5UPF2IoECn8igfx3nTGbKMrub+zcU=
Received: from BN9PR03CA0987.namprd03.prod.outlook.com (2603:10b6:408:109::32)
 by DM6PR12MB2716.namprd12.prod.outlook.com (2603:10b6:5:49::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Wed, 20 Apr
 2022 08:56:30 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109::4) by BN9PR03CA0987.outlook.office365.com
 (2603:10b6:408:109::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Wed, 20 Apr 2022 08:56:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5186.14 via Frontend Transport; Wed, 20 Apr 2022 08:56:30 +0000
Received: from kevin-mlse-vm.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Apr
 2022 03:56:28 -0500
From: Yang Wang <KevinYang.Wang@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc limit
Date: Wed, 20 Apr 2022 16:56:12 +0800
Message-ID: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d827d44-54e3-4d1a-585d-08da22aba99a
X-MS-TrafficTypeDiagnostic: DM6PR12MB2716:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB2716A1F620107A54A84240A082F59@DM6PR12MB2716.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L+Waxx8DHqKP64Oe9EnuvRoLHIgqIzpq3riSU5a2PnqYWwiPMqApO+ydEk28eNCNFjjb/o/HzbYTn6qnO7U9HJSTLbeQgLaEQbTFoB1269s5MUaMNI1dyIA+w1o5aUkf5YUmlykW7ASIT7G6j0EpkdHSUMZXnbxCObTMEmpOfukAfO6HBJynu7o+d2Aj/n90YB6AQ+ZVLS2Sq/AM5qhtqvpSEsX6Wx2VUjeVmJXVydj0l7FRaqDlNz7nXmv6wF16YgczOh3lL6LRrLp70aHNCssB6MW6wkgzMIMoEewM3O+cfCpop0d1nLrDCaw4QhQD9TNGeGOArrCSw4uzrJdUDIO5UaFIpAOKnyH3QRM7F7fwkINc/gaJrWpGA8B+kc0bcnuHEqDuVS0yMxAj+93p6J7Xi+Qa8jmb2Akq56aYq2G8ZA51WKkb1mLtHVjCqx2eOq3uZQ4HeRcL3nxBNXGGe+VEB20kta9lh1RK0d7Lo4jefGC4ve80r1oAswfqLfQO7KoCYe9aOMYc9alUcsVcgKYTT9Ikv53xZrf9yIxE+hLLobCN85DP7UA8bNInS0c74zhyZCV0K975qcMbzQtSfzwH4VEQZYN00eR2N6P1BWyuReieBw1K1sy7n8duB6MOtD14n+HS82M9UaZjvwnzZWkhKD5caR3KJBAt+JaUbVEORY/AX0e/wUgIYRlOLuf/lb9wDXjFeHf8+/VhOS751A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(40460700003)(70206006)(8936002)(450100002)(81166007)(356005)(70586007)(1076003)(82310400005)(336012)(83380400001)(5660300002)(4326008)(47076005)(8676002)(36860700001)(36756003)(110136005)(2616005)(86362001)(16526019)(2906002)(426003)(7696005)(316002)(54906003)(186003)(508600001)(26005)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 08:56:30.6094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d827d44-54e3-4d1a-585d-08da22aba99a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2716
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
Cc: christian.koenig@amd.com, Yang Wang <KevinYang.Wang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()
to allocate memory, when request size is exceeds kmalloc limit, it will
cause allocate memory fail.

e.g: when ttm want to create a BO with 1TB size, it maybe fail.

Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 79c870a3bef8..9f2f3e576b8d 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
 static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
 	ttm->pages = kvmalloc_array(ttm->num_pages, sizeof(void*),
-			GFP_KERNEL | __GFP_ZERO);
+				    GFP_KERNEL);
 	if (!ttm->pages)
 		return -ENOMEM;
+
+	memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
+
 	return 0;
 }
 
@@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
 	ttm->pages = kvmalloc_array(ttm->num_pages,
 				    sizeof(*ttm->pages) +
 				    sizeof(*ttm->dma_address),
-				    GFP_KERNEL | __GFP_ZERO);
+				    GFP_KERNEL);
 	if (!ttm->pages)
 		return -ENOMEM;
 
+	memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + sizeof(*ttm->dma_address)));
+
 	ttm->dma_address = (void *)(ttm->pages + ttm->num_pages);
 	return 0;
 }
@@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
 {
 	ttm->dma_address = kvmalloc_array(ttm->num_pages,
 					  sizeof(*ttm->dma_address),
-					  GFP_KERNEL | __GFP_ZERO);
+					  GFP_KERNEL);
 	if (!ttm->dma_address)
 		return -ENOMEM;
+
+	memset(ttm->dma_address, 0, ttm->num_pages * sizeof(*ttm->dma_address));
+
 	return 0;
 }
 
-- 
2.25.1

