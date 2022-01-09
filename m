Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9947B4889D2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jan 2022 15:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AE210EECF;
	Sun,  9 Jan 2022 14:20:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2060.outbound.protection.outlook.com [40.107.102.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E04910E2EE;
 Sun,  9 Jan 2022 14:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FPRoZl2WaPT4vFdg45NrhT7zFr42INHXP4WxMkQCxtYc+45RJZSw7JqUDF6GveCMOajW4ou0K8nuuedBTOJwR9mk/XUAzwF9njWyaBW96A0abtTQDhmPjOGHeiUNZHY5OwyjYL2ALcK6JdmCiJyCBxI1NKuiWEZiC4NjAn37px6UlCjk+pHjyR5b1/rMLCL3Iw09yUCngY8U6ws0yCRuvQBFNFMk7LjOB+OcMXNrq8xXtswWkP4DW9oAZC9k8DT43x0IPvPtaSjLaO8+1yoSokAik1SG4hEF2ze5b1XRNnspbyi1/UcJzegmrxnncKpb34RTS6FSeFfMPpLfGQah8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is4jq7tc15r/64c7pUUbmLHhNlmOHuLjsXh05SG6rCk=;
 b=iQ9+PTuHs1BsnKtkI3cHlBB9jt8ALYJAxEBpO8vgGvbm6nKDBseSblU6TVpZT28ZSX+d+vjFzbbX+S1ndle3aZpQA537PT3wHYczQO7XvDZhsIG0OBWntkkQpLccXC+9LgpqvOHdu9izxyHh3mE33YHIl1I6ZqdRNxlhSUhEKnxfx6AIKT1JFG9mF5gzwx4P829nS/sw0V0b+riFkicw6hyGB8hkhjhYKzMSZgWfPOxswI4sqT/8HZOt0TN5NDD3n9F5ZttTRLHHpJJ1+APG5m6yAoObekDmoR0FRxeAa03kkOkL88MhimlkG/BuKG0ScT6vtJMpdrq7ialvJqWWeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Is4jq7tc15r/64c7pUUbmLHhNlmOHuLjsXh05SG6rCk=;
 b=jbI1N9MS/nAeBqY+fepKR1teExPBNHHTFYGSTvT+BWrF0tqVAam3D5pUarpJHzE5c2l4ThGFRATASR60AQT6Izdx/MF+mFwOOyMpEECz3CEWt+E9Hzd7IHv6t7VMLj9Dr/qisaor6mf61ZF2JUFBFc3cHMESMPaVpZcfDcMKl+I=
Received: from BN1PR10CA0015.namprd10.prod.outlook.com (2603:10b6:408:e0::20)
 by DM6PR12MB3145.namprd12.prod.outlook.com (2603:10b6:5:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Sun, 9 Jan
 2022 14:20:25 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::91) by BN1PR10CA0015.outlook.office365.com
 (2603:10b6:408:e0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9 via Frontend
 Transport; Sun, 9 Jan 2022 14:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4867.9 via Frontend Transport; Sun, 9 Jan 2022 14:20:25 +0000
Received: from rtg-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 9 Jan
 2022 08:20:15 -0600
From: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v7 3/6] drm: implement top-down allocation method
Date: Sun, 9 Jan 2022 19:49:48 +0530
Message-ID: <20220109141951.134432-3-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220109141951.134432-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f10facb-3ef1-46eb-7437-08d9d37b2dc9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3145:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB314582CC17BF4CC8AF3E6687E44F9@DM6PR12MB3145.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5AziFRnF+0/bgFrI/rlrxqjy5XM+sVYM/EFKxF3N681A5XD1eEIYA7ekMuoQGuLARRJ+pmBUXMCakCWHwDINQVbjOs2N2RI5t6GlICti5cpuF2EfPd05DK+Sns2v21lUh4O/kNOr+VbVdKFbpkYLzBLKRZiHrH2Xil4ha+PtLRR6crv1B5jtOPzKxxnwi9iNgBkwYkT40L+lsdVo3q7x7mMH3obuInxLFzt8TN9ocZM4S35paxumLShd3U5P72M9JebsI9SYbNDDQRfP/vQIecEfuIz790lDSKnHCzFYsO0kZmtWdKeN+2G6ymX87Lc4ziJZD2PtPe0TMkhIsNM6QoME4Mn0jLBa8DXY71D5UJ5ACPxyxYPV63slJB1O/yYowKDQRqgUeVLU6lGbsot3VoaRLnB3IIJeeY+vtOeaFqlcxeyyBR0UrT+IeM7nn8Ii3CKz8prjSOf4d6wHRPABJ9kD9iK0nDliEIfL+4oh/AXafbVPpN6gPyK4SIqorvbG9xIR4Cp4egO6+K/UNAS70t+DmjcA3Kaq2pTX16SjimHlaLGcTdcxgXSDArUPh/+fYFy7K1682gdBWV+h32Yzjp4JPIecX2RIGbovKcx+bsPO1xLC0+2c++HF3djGiDEzHJou7vj+uWqQFQQG8E5sRbgzs2qRZ/Ku+wR1ZhA+ukaLSHdZevUHlUhE0iwaSypaDwQqx5LfXm/N6e/pAmZ0ge3+rH+vOWSiL4lZOzcEe/6jHbK4wJ+l255vHMp3gbnm3EQB4GDyXc8tLz0PoR7CDSXbWJiBXKLsSd1kyXn7ScLv4UL5orGfkRvxFHup+Uz4x30AOtUr++2XdMm5u4F4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700002)(81166007)(16526019)(508600001)(6666004)(8676002)(110136005)(316002)(82310400004)(336012)(4326008)(2616005)(426003)(54906003)(26005)(47076005)(36860700001)(2906002)(36756003)(1076003)(356005)(70586007)(40460700001)(70206006)(8936002)(83380400001)(5660300002)(7696005)(86362001)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2022 14:20:25.1938 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f10facb-3ef1-46eb-7437-08d9d37b2dc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
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
Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>, matthew.auld@intel.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a function which walk through the order list,
compares the offset and returns the maximum offset block,
this method is unpredictable in obtaining the high range
address blocks which depends on allocation and deallocation.
for instance, if driver requests address at a low specific
range, allocator traverses from the root block and splits
the larger blocks until it reaches the specific block and
in the process of splitting, lower orders in the freelist
are occupied with low range address blocks and for the
subsequent TOPDOWN memory request we may return the low
range blocks.To overcome this issue, we may go with the
below approach.

The other approach, sorting each order list entries in
ascending order and compares the last entry of each
order list in the freelist and return the max block.
This creates sorting overhead on every drm_buddy_free()
request and split up of larger blocks for a single page
request.

v2:
  - Fix alignment issues(Matthew Auld)
  - Remove unnecessary list_empty check(Matthew Auld)
  - merged the below patch to see the feature in action
     - add top-down alloc support to i915 driver

Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/drm_buddy.c                   | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  3 ++
 include/drm/drm_buddy.h                       |  1 +
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
index cd914d104b1a..11356c2bb7aa 100644
--- a/drivers/gpu/drm/drm_buddy.c
+++ b/drivers/gpu/drm/drm_buddy.c
@@ -369,6 +369,26 @@ alloc_range_bias(struct drm_buddy *mm,
 	return ERR_PTR(err);
 }
 
+static struct drm_buddy_block *
+get_maxblock(struct list_head *head)
+{
+	struct drm_buddy_block *max_block = NULL, *node;
+
+	max_block = list_first_entry_or_null(head,
+					     struct drm_buddy_block,
+					     link);
+	if (!max_block)
+		return NULL;
+
+	list_for_each_entry(node, head, link) {
+		if (drm_buddy_block_offset(node) >
+		    drm_buddy_block_offset(max_block))
+			max_block = node;
+	}
+
+	return max_block;
+}
+
 static struct drm_buddy_block *
 alloc_from_freelist(struct drm_buddy *mm,
 		    unsigned int order,
@@ -379,11 +399,17 @@ alloc_from_freelist(struct drm_buddy *mm,
 	int err;
 
 	for (i = order; i <= mm->max_order; ++i) {
-		block = list_first_entry_or_null(&mm->free_list[i],
-						 struct drm_buddy_block,
-						 link);
-		if (block)
-			break;
+		if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
+			block = get_maxblock(&mm->free_list[i]);
+			if (block)
+				break;
+		} else {
+			block = list_first_entry_or_null(&mm->free_list[i],
+							 struct drm_buddy_block,
+							 link);
+			if (block)
+				break;
+		}
 	}
 
 	if (!block)
diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
index 143657a706ae..ae9201246bb5 100644
--- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
+++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
@@ -53,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
 	INIT_LIST_HEAD(&bman_res->blocks);
 	bman_res->mm = mm;
 
+	if (place->flags & TTM_PL_FLAG_TOPDOWN)
+		bman_res->flags |= DRM_BUDDY_TOPDOWN_ALLOCATION;
+
 	if (place->fpfn || lpfn != man->size)
 		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
 
diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 865664b90a8a..424fc443115e 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -28,6 +28,7 @@
 })
 
 #define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
+#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
 
 struct drm_buddy_block {
 #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
-- 
2.25.1

