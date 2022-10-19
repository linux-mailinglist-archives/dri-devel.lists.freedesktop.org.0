Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A36604B74
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:31:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D546A10F27F;
	Wed, 19 Oct 2022 15:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBF110F27F;
 Wed, 19 Oct 2022 15:31:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHHPncJWNi0KY8HeCAcQFWXjb5Zo7kDz0OW1rnlK51lhttKMbBWQRuWr/sx+Ar6Xom3EqCdJDXPH41XpnUq3mSrHFHSZSOCaXcSAp1pTuEAlXmwLYwxTYRA5yAbSbQB/ADNlduWr9tTVmA250MQ2X+jaWYKzLOmkfMjKDJqBLCDCH34zdq1vE092wGDY1T2s0ZA+JS7R2Vgk+qHGkoMn46sMJqIqeKLcM4IRmVYYgqeW1U6LWNYdy6kFQ5setMY0hVap3bZCn/2WFTVTB2WiFL10zrjljYKi8kA6FSjxZDzkWDSsmJ9Tt9Mt6MFAbH7wISL+IHbNCQ9+MQFr/qMtVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4aqs3GxfViI4JVZ/A0ORkYRLDdlt9Zw5Ah2KcJeWdc=;
 b=j63ZNKIosEs8s/WtBONhVdLMLwj3MbLgkQ71ywyTi8ICeYxSfCjg3PywHf89bfdkXAoaNz+bklNBITTSvoWA0BH0HvEW3DxQPQ9HBvzeCY9UBCnPnHUcFAiuJnWxlx/Prpy3yiRG4iSyEzRKFHHVBj/EBYXUqiztiIrKRn+dXhX7qD7DX+kZt92QFoS+be6RHWQZOPHiM2oY6lOW/HL9W/Pqf4C5oAeO3qkWSo9ZuZ295hayFgCFS6U6mhoXOpD+k13wGQUvHWv80+noViVmcKyQgWnXegZAed3wHtBUgaw5vlt4QZslhzDL0LVqyCTFgkUitpziDlrx8o8byizPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+4aqs3GxfViI4JVZ/A0ORkYRLDdlt9Zw5Ah2KcJeWdc=;
 b=ua5vwGOjTIZJM8FNdmK04EfhvZcYlWwsi/F4X97TobzW7gG6K88GdW3HrCxA4g0RTJXsyYMNiOk8ifmEv3sKQ5A+/nF+Qm0RFTiWrurxEYBqTvrc0eVClG8n7nIZdfYaU/rwVWbNW4hYv79SsNB0FSl+UnTAKaXd94blxHI+i+w=
Received: from BN9PR03CA0592.namprd03.prod.outlook.com (2603:10b6:408:10d::27)
 by DM8PR12MB5415.namprd12.prod.outlook.com (2603:10b6:8:25::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.34; Wed, 19 Oct 2022 15:31:13 +0000
Received: from BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::79) by BN9PR03CA0592.outlook.office365.com
 (2603:10b6:408:10d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT111.mail.protection.outlook.com (10.13.177.54) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:31:13 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:29:41 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 5/6] =?UTF-8?q?drm/radeon:=20fix=E2=80=99s=20on=20ttm=5Fre?=
 =?UTF-8?q?source=20rework=20to=20use=20size=5Ft=20type?=
Date: Wed, 19 Oct 2022 20:57:35 +0530
Message-ID: <20221019152736.654451-5-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT111:EE_|DM8PR12MB5415:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d0c4aa-7ee4-40c4-c990-08dab1e6f4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uC2pbB+jftov2FQFr6JQJANwGxtw+acPsWbKNCC/F8buEh11++2B6sbDdaDo1MOtAk1TRopVAKlghUd7/Uo+O73evv3Kb++PEHOj9LTsG148s6xqEJahhOB8cHsJXOcvVx4OlrO4CnFUrfvc+sdTsv1me0NEAeRvp2KiyzI5q5PgyGU18NXjsEO2c7BFBY3k8eUtsOttUG4IigksI4tWQbzv2q9KNEr579XrHyWKe2lctSgb0+MmjWcZpICtcxWMEq6xTMAQmjo1BDliRxGr7G7FY9vBxVGNKpre8CQ0/hPcZi+sOpVKj6Mu9GJMYEyJDXysOTxETShvTTvR79Uo+kLRvX4hw76CdkNlzG7dzgmOfAAEOsb1sOXkL2TTwF2GIQzvkDhArbuJroQ3MlVNEyFaXmPyakJ9J/MMqw1cxpAhT32yc19b6xMYWy8kftjYJm2+oiKEISbKGSUMNBXWG13XuFZLkd2RdHyX2uGSEm3QEe9dT77cpEM7huUCIaRWQWTtUfjfwY2MFAfruRl55EpWsD+JXgZA/3+sFmF9vp+7zjzsIanfJ8arc5PTkkDD8XCWo/bVdFJJgZ2X2qX9hCRO625XwcUXYmCtP2n20oqnVopRNHHmfoT34h7wtn09GXAJtvvm4Zo/gMC56gOnb8Hwrk6EDHOXdAU+XMfvVt4nUOxq15uOimv65HIgGnFBMJr+b7of9jGTtqkZztvCeiSdr5O0vQJHTTXSegMzJR7xpvwir1obCz+xPXX/RgfSXXIu1qiTgFuiUzgSAOLDTzePlj7xibqU0WoZAejGOHQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(110136005)(4326008)(54906003)(5660300002)(6666004)(7696005)(70586007)(70206006)(450100002)(36756003)(8936002)(316002)(26005)(41300700001)(36860700001)(81166007)(82740400003)(356005)(82310400005)(2616005)(40480700001)(426003)(47076005)(40460700003)(16526019)(336012)(186003)(1076003)(2906002)(86362001)(83380400001)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:31:13.1174 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d0c4aa-7ee4-40c4-c990-08dab1e6f4a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT111.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5415
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the ttm_resource from num_pages to size_t size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/radeon/radeon_cs.c     | 4 ++--
 drivers/gpu/drm/radeon/radeon_object.c | 4 ++--
 drivers/gpu/drm/radeon/radeon_trace.h  | 2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c    | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index 446f7bae54c4..4c930f0cf132 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -400,8 +400,8 @@ static int cmp_size_smaller_first(void *priv, const struct list_head *a,
 	struct radeon_bo_list *lb = list_entry(b, struct radeon_bo_list, tv.head);
 
 	/* Sort A before B if A is smaller. */
-	return (int)la->robj->tbo.resource->num_pages -
-		(int)lb->robj->tbo.resource->num_pages;
+	return (int)PFN_UP(la->robj->tbo.resource->size) -
+		(int)PFN_UP(lb->robj->tbo.resource->size);
 }
 
 /**
diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
index 00c33b24d5d3..710d04fcbea6 100644
--- a/drivers/gpu/drm/radeon/radeon_object.c
+++ b/drivers/gpu/drm/radeon/radeon_object.c
@@ -232,7 +232,7 @@ int radeon_bo_kmap(struct radeon_bo *bo, void **ptr)
 		}
 		return 0;
 	}
-	r = ttm_bo_kmap(&bo->tbo, 0, bo->tbo.resource->num_pages, &bo->kmap);
+	r = ttm_bo_kmap(&bo->tbo, 0, PFN_UP(bo->tbo.resource->size), &bo->kmap);
 	if (r) {
 		return r;
 	}
@@ -737,7 +737,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
 	if (bo->resource->mem_type != TTM_PL_VRAM)
 		return 0;
 
-	size = bo->resource->num_pages << PAGE_SHIFT;
+	size = bo->resource->size;
 	offset = bo->resource->start << PAGE_SHIFT;
 	if ((offset + size) <= rdev->mc.visible_vram_size)
 		return 0;
diff --git a/drivers/gpu/drm/radeon/radeon_trace.h b/drivers/gpu/drm/radeon/radeon_trace.h
index c9fed5f2b870..22676617e1a5 100644
--- a/drivers/gpu/drm/radeon/radeon_trace.h
+++ b/drivers/gpu/drm/radeon/radeon_trace.h
@@ -22,7 +22,7 @@ TRACE_EVENT(radeon_bo_create,
 
 	    TP_fast_assign(
 			   __entry->bo = bo;
-			   __entry->pages = bo->tbo.resource->num_pages;
+			   __entry->pages = PFN_UP(bo->tbo.resource->size);
 			   ),
 	    TP_printk("bo=%p, pages=%u", __entry->bo, __entry->pages)
 );
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index d33fec488713..fff48306c05f 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -181,7 +181,7 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
 
 	BUILD_BUG_ON((PAGE_SIZE % RADEON_GPU_PAGE_SIZE) != 0);
 
-	num_pages = new_mem->num_pages * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
+	num_pages = PFN_UP(new_mem->size) * (PAGE_SIZE / RADEON_GPU_PAGE_SIZE);
 	fence = radeon_copy(rdev, old_start, new_start, num_pages, bo->base.resv);
 	if (IS_ERR(fence))
 		return PTR_ERR(fence);
@@ -268,7 +268,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *mem)
 {
 	struct radeon_device *rdev = radeon_get_rdev(bdev);
-	size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
+	size_t bus_size = (size_t)mem->size;
 
 	switch (mem->mem_type) {
 	case TTM_PL_SYSTEM:
-- 
2.32.0

