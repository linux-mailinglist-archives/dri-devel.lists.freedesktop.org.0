Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4C34A025
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 04:14:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 720DC6E13C;
	Fri, 26 Mar 2021 03:14:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BCD6E12A;
 Fri, 26 Mar 2021 03:14:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TiZS6rI/Y7uQP/63L0Xcp0OF/EqFYHlpMRhIIYn1Q2WTZirUBga5PYDBAGVaeex5zcBqDNm7lIfJbAj6uc8i62RdZjA6clHrS0s+ZQQfQgk5q4zftS7x3pkLBllpx1sTNM1Yg+y1SZks9BWzy0WAnk/7ymI6bwXRMF9KkDiEmoBNNQnsOnSFzEH4Hqgep9c3O2A+3sEPmk3f3OExTH4JLUbq90rknO4er+kfjiO2/gaNndz/RFH914wmhzDgY741A95wfAuYjrUxXYRCQXIYuRbZy8FZvNxKtbzuCl+cna118q/fLhc/A+uw6zNjVtq8r7Z9tEu+ASfTcNKiZsPbaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T9vi23XccfZPsPJ0MYlgpRZc5mdGjy4aQFuAjZegKg=;
 b=BmrPZ9FYDIw08BjJaruARHOyw8wXeZcIYSY8bbKcgKdaxn9EOK+I1Lbr4t/IPAioEPC1ld6m4Ziw6K1Ji7aeIMdsqrZFLYPSsklEedRZl0IDMjknn3zIKgdDX4jpbqznaaSHh8U7OIiTOeMqwzE+wchyEQ/esz1YwqN8YpZfKmWNradSaCCdeJbO4bLr3SkwV3Gfp2JfKr0/eydRt+gaB9dRwu1Wy004Xc27cj//U3QX2rcuNhnQX4yR7Km0Jp5IsvVvYLqHwMjIp5xk/p1KF4ElOmwKO8Nf9zqSj/7XQTed2TMEE+m394GWhnBqk2wJHuAlduDIl4GgrAn3QuhStQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+T9vi23XccfZPsPJ0MYlgpRZc5mdGjy4aQFuAjZegKg=;
 b=g0v1dTM17MH+Z6nj9TZEc7s1uVjvi5pIqLO8seRANDh7O1h7IcVKlQ4Jc/Cw3CGzGC/KOqT4dwl/pHxX7vNBeTGbD8XYu2Bn6Hah0IQ8N4f+D0YTHXQGcAUf1PXTffSjFnOsEZxDpnOwJPdp7KYc0uKX3PcVvRDEni8pDW0oLHU=
Received: from DM6PR07CA0085.namprd07.prod.outlook.com (2603:10b6:5:337::18)
 by PH0PR12MB5499.namprd12.prod.outlook.com (2603:10b6:510:d5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Fri, 26 Mar
 2021 03:14:34 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::9a) by DM6PR07CA0085.outlook.office365.com
 (2603:10b6:5:337::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend
 Transport; Fri, 26 Mar 2021 03:14:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.18 via Frontend Transport; Fri, 26 Mar 2021 03:14:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Mar
 2021 22:14:33 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Thu, 25 Mar 2021 22:14:32 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm: Update MST First Link Slot Information Based on Encoding
 Format
Date: Thu, 25 Mar 2021 23:14:16 -0400
Message-ID: <20210326031416.2166481-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee6711d4-ec0a-4acb-a953-08d8f00547c8
X-MS-TrafficTypeDiagnostic: PH0PR12MB5499:
X-Microsoft-Antispam-PRVS: <PH0PR12MB5499139F2582DB0C217B4DBAE5619@PH0PR12MB5499.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XPMmR5V/gDv2KXCIr2Cjw/5VlIUdx3P7y8qjBKzVkFk8Pdg1yM5OcyWo8aBcgf457FJ53fWNjW+xdXZbPIg7t4AKlNL8SwbLt6fx5MJDg5QvbsgMRPTqppya9XId5l8t6uRwbHszr6sn6OkpNNqG4iRjRULaiwj82D3G5lsDI/a50M25B3znb+97tQCsMwBG+DQz1lfZdPt8bBF8uH9Iy0KWsLLhbr9WjZtoxvAlB+sj0nMdGYSvKMoMFk9jyzE4fZt49s0ad2XLp6lrwf9aVDFqAXxZAkw+6+JN9JS/nG7j6FR0ivX8n3/+bIMXCdvuoaVZ8xNlvJqjTtp5+O84Pj/6zL9Qt4oEQIszitWmqHtGq4WIRT29wjb8vhu2mmbKp5m99sUcJTfcotqBqYKAxKQj0Xnb2z5Z/YJkAoLVHkU7ZetV71qwZjGdujQGjxXWO/L7tw/71zLfRhjN3xfFF+1EPn2Wx2UlE2Ji68liLenMlSVYSNL/Mz370OBI1ao7QTjkv47I5uv027IKu4mOaEhkIFLs1ZD43V4iPiMXdWayR8AdP+wkj84vdwmlT5E0Q8Xg85GJBp3K2U1MselQINeQllAeFNANDAyAaVi8UHYynI/ZUZu3W2joXFB4y04lBC6Bs7Qj3VihbBclk+6pXVMbgxGYg8VdqWKp9FJpMW3jhX0SNxZUllv44lGoFjKp
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(36840700001)(46966006)(82310400003)(86362001)(6666004)(316002)(8936002)(2906002)(54906003)(15650500001)(2616005)(5660300002)(70586007)(36860700001)(47076005)(36756003)(83380400001)(110136005)(8676002)(478600001)(7696005)(426003)(356005)(82740400003)(1076003)(4326008)(26005)(186003)(81166007)(336012)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 03:14:34.1701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6711d4-ec0a-4acb-a953-08d8f00547c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5499
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
Cc: Rodrigo.Siqueira@amd.com, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 wayne.lin@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

8b/10b encoding format requires to reserve the first slot for
recording metadata. Real data transmission starts from the second slot,
with a total of available 63 slots available.

In 128b/132b encoding format, metadata is transmitted separately
in LLCP packet before MTP. Real data transmission starts from
the first slot, with a total of 64 slots available.

Update the slot information after link detect.

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/drm_dp_mst_topology.c | 48 ++++++++++++++++++++++-----
 include/drm/drm_dp_mst_helper.h       |  8 +++++
 2 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 42a0c6888c33..577ed4224778 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3382,7 +3382,7 @@ int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
 	struct drm_dp_payload req_payload;
 	struct drm_dp_mst_port *port;
 	int i, j;
-	int cur_slots = 1;
+	int cur_slots = mgr->first_link_start_slot;
 
 	mutex_lock(&mgr->payload_lock);
 	for (i = 0; i < mgr->max_payloads; i++) {
@@ -4302,8 +4302,13 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 
 	num_slots = DIV_ROUND_UP(pbn, mgr->pbn_div);
 
-	/* max. time slots - one slot for MTP header */
-	if (num_slots > 63)
+	/**
+	 * first_link_total_avail_slots: max. time slots
+	 * first slot reserved for MTP header in 8b/10b,
+	 * but not required for 128b/132b
+	 */
+
+	if (num_slots > mgr->first_link_total_avail_slots)
 		return -ENOSPC;
 	return num_slots;
 }
@@ -4314,8 +4319,12 @@ static int drm_dp_init_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 {
 	int ret;
 
-	/* max. time slots - one slot for MTP header */
-	if (slots > 63)
+	/**
+	 * first_link_total_avail_slots: max. time slots
+	 * first slot reserved for MTP header in 8b/10b,
+	 * but not required for 128b/132b
+	 */
+	if (slots > mgr->first_link_total_avail_slots)
 		return -ENOSPC;
 
 	vcpi->pbn = pbn;
@@ -4488,6 +4497,25 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+/*
+ * drm_dp_mst_update_first_link_slot_info()
+ *  update the first link's total available slots and starting slot
+ * @mgr: manager to store the slot info.
+ * @encoding_format: detected link encoding format
+ */
+void drm_dp_mst_update_first_link_slot_info(
+	struct drm_dp_mst_topology_mgr *mgr, uint8_t encoding_format)
+{
+	if (encoding_format == DP_CAP_ANSI_128B132B) {
+		mgr->first_link_total_avail_slots = 64;
+		mgr->first_link_start_slot = 0;
+	}
+	DRM_DEBUG_KMS("%s encoding format on 0x%p -> total %d slots, start at slot %d\n",
+	(encoding_format == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b",
+		mgr, mgr->first_link_total_avail_slots, mgr->first_link_start_slot);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_first_link_slot_info);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -4518,8 +4546,8 @@ bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 
 	ret = drm_dp_init_vcpi(mgr, &port->vcpi, pbn, slots);
 	if (ret) {
-		DRM_DEBUG_KMS("failed to init vcpi slots=%d max=63 ret=%d\n",
-			      DIV_ROUND_UP(pbn, mgr->pbn_div), ret);
+		DRM_DEBUG_KMS("failed to init vcpi slots=%d max=%d ret=%d\n",
+			DIV_ROUND_UP(pbn, mgr->pbn_div), mgr->first_link_total_avail_slots, ret);
 		drm_dp_mst_topology_put_port(port);
 		goto out;
 	}
@@ -5162,7 +5190,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mgr->first_link_total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5191,7 +5219,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 	}
 	DRM_DEBUG_ATOMIC("[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
 			 mgr, mst_state, avail_slots,
-			 63 - avail_slots);
+			 mgr->first_link_total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5455,6 +5483,8 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	if (!mgr->proposed_vcpis)
 		return -ENOMEM;
 	set_bit(0, &mgr->payload_mask);
+	mgr->first_link_total_avail_slots = 63;
+	mgr->first_link_start_slot = 1;
 
 	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
 	if (mst_state == NULL)
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index bd1c39907b92..f4310b3705e7 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -653,6 +653,13 @@ struct drm_dp_mst_topology_mgr {
 	 */
 	int pbn_div;
 
+	/**
+	 * @first_link_total_avail_slots: frist link total slots available.
+	 * @first_link_start_slot: start slot index for real data transmission.
+	 */
+	u8 first_link_total_avail_slots;
+	u8 first_link_start_slot;
+
 	/**
 	 * @funcs: Atomic helper callbacks
 	 */
@@ -795,6 +802,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
 
 void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+void drm_dp_mst_update_first_link_slot_info(struct drm_dp_mst_topology_mgr *mgr, uint8_t encoding_format);
 
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
