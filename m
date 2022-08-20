Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13B59AC44
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 09:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2E910E2B6;
	Sat, 20 Aug 2022 07:33:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394810E287;
 Sat, 20 Aug 2022 07:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6ffTQxjwQYdKINjqXR3DsQloDJHIiWIsqEd11jEXaDdDRH73zlj07ew7HvMyv1Mk4+j1gNMe7UZLjcKVyawOYxJkroA1LzMxrMvEFurbEnLXSqGLJr1EeMpPBBSNlu/UIocu4fx3aJ6nG4Vin0UM4zYc6Lb0nZl/e6W7p+Jh78RHBrt5zDs17DeNV4b3pVLgsA38pkH58IPfAI112hyMOMoM88q1CycHD6W0FqX5NUUHPYl70S+IJAciOTrULuUtK5H2po+XIpJjDKXhokmsWxZHR7sNpunMznlEz5yzL6nE07SFE5uDwMiB+nCAYDD7ZsDYYG1dX9lAebF2YGI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8POOJfWBracUzh+wGks7y29DlKaHpot8pjeOMcJJlA=;
 b=ZQDho9fljZc5j9ZiHYCZmwrQA+FizvOeAGTR43r52wlSnkumKYuHzHWgHyJsqLXbz6NDfJjq61tXV+kVCjIh3y+Z+qNDMgAm79vczThVx22F3gBjYS14SKvB4FTbPjxqKWw/qcBsKFnBLK8Kza/1FOwssrOoC/NMl56jAbohf0Edumr8ijiQguyXu3dmc0+FmKnMW4pf/t0Svxz2Qw51b2Z22FbUThy8ZjL/ecAGxVw4yXoAb9Qxn/Au7hXClcJ5GcDPGuRNQ3mG15RFSo9v9trY6ucnW9OG+ZDOpw6C0kkcz2iqqn0CozUZaDseqNqi4oc0VqWkOFRTip7C0+WXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8POOJfWBracUzh+wGks7y29DlKaHpot8pjeOMcJJlA=;
 b=Q6TglM3q2aWvRQQzx907BjOT2FzLj7BKSfCVg4bWltcuBpNqc33RbDEswfPFrsDlnBoN5AT02Pj1AsQcmC64M07J5J2pq7nMZHpfqdhUfr/2O+7tU2Tm9SRYKAi+cFv5PPLNZUpq3kd2Zko7/SOwNd3EWIkavPL3lX1DHimLf1A=
Received: from MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::26)
 by CH2PR12MB4889.namprd12.prod.outlook.com (2603:10b6:610:68::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Sat, 20 Aug
 2022 07:33:43 +0000
Received: from CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::fa) by MW4P221CA0021.outlook.office365.com
 (2603:10b6:303:8b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20 via Frontend
 Transport; Sat, 20 Aug 2022 07:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT073.mail.protection.outlook.com (10.13.174.196) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5546.7 via Frontend Transport; Sat, 20 Aug 2022 07:33:42 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Sat, 20 Aug 2022 02:33:39 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v6 5/6] drm/nouveau: Implement intersect/compatible functions
Date: Sat, 20 Aug 2022 00:33:03 -0700
Message-ID: <20220820073304.178444-5-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
References: <20220820073304.178444-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e40252-818f-415c-7515-08da827e4ee6
X-MS-TrafficTypeDiagnostic: CH2PR12MB4889:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/X1b8rD0zVwj5Ph9fjxv3PYNy308OCOeC7WDoIgZCR2w7onNpNGyQpZMeyMw0cjHF18YUSCBwA6+yPhabNHgNwo1889UMqTR/FBfV1qIHNZMD+O/tYMhPVQte3GtEm73/RvMZS+MNXftdeM9xnOvQRzjbxev+paxYLXFANYJaZ74OtQw5uaySvr356xVRHh3SgsRwaffFXXj01Fi6ILMiPfxyKWGo621SCr+eRTgl0Ywre+uIdy7PfNHM3uncc3sWEuYPsKFqgigorYeFVPtdkD0PfnKLfWUXXMBNkipxxI0y/WMJEkzGLq0eOKqYN9xm0zlU3CP9JanZi0BTLLLwKKemzG1Ti2BBhf2muwWIV8oDRUk/un3Gr5hebMbvDgoM+QB+j2QCS2UkgXEj13uwFnhpghXN69C5COp/Gwq0RNXVyU+fzxWGQEPt0sCVi9DloQO/e1YUXqCrWEhZa3jU/tRWjEN8LrAjckm0Id0XC6IKqPVQS4AC/sdrJqY6p9vDoRh/839ZLIvzWgL30X8dY8AkuRBesP2Sy1sRx0dp6MUbc6Q4BZ3iMUdxHHgEl0ShAnxb9YUxsK4AUD/kaJ0OBCkSOwGMT4YJE1r+fXzz43gMdxNH/fCHHmaCfh2NwAbdYT4sehfT6gh+XmJzXuY+ITmY5Wfax8nfW1t2J4LzqYe0UJMhPI5UmvHc6EsY+lxKD3W23IYanMeFQT9EtUzec51ZbLl4/PEJH3j9OU+TItsbW0B49Rfyx1MAyz88tdiZzIZTpLJpVyW2j8W7Y2PEhBdm0+vz9r2/TjFrB98m0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(136003)(376002)(39860400002)(40470700004)(36840700001)(46966006)(40480700001)(47076005)(4326008)(70586007)(41300700001)(83380400001)(2906002)(6666004)(70206006)(36860700001)(8676002)(36756003)(426003)(336012)(16526019)(1076003)(316002)(110136005)(54906003)(186003)(2616005)(82310400005)(81166007)(356005)(8936002)(478600001)(82740400003)(40460700003)(86362001)(5660300002)(26005)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2022 07:33:42.5687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e40252-818f-415c-7515-08da827e4ee6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4889
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Implemented a new intersect and compatible callback function
fetching the start offset from struct ttm_resource.

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_mem.c | 29 +++++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_mem.h |  6 ++++++
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 24 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 2e517cdc24c9..76f8edefa637 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -187,3 +187,32 @@ nouveau_mem_new(struct nouveau_cli *cli, u8 kind, u8 comp,
 	*res = &mem->base;
 	return 0;
 }
+
+bool
+nouveau_mem_intersects(struct ttm_resource *res,
+		       const struct ttm_place *place,
+		       size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	/* Don't evict BOs outside of the requested placement range */
+	if (place->fpfn >= (res->start + num_pages) ||
+	    (place->lpfn && place->lpfn <= res->start))
+		return false;
+
+	return true;
+}
+
+bool
+nouveau_mem_compatible(struct ttm_resource *res,
+		       const struct ttm_place *place,
+		       size_t size)
+{
+	u32 num_pages = PFN_UP(size);
+
+	if (res->start < place->fpfn ||
+	    (place->lpfn && (res->start + num_pages) > place->lpfn))
+		return false;
+
+	return true;
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.h b/drivers/gpu/drm/nouveau/nouveau_mem.h
index 325551eba5cd..1ee6cdb9ad9b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.h
@@ -25,6 +25,12 @@ int nouveau_mem_new(struct nouveau_cli *, u8 kind, u8 comp,
 		    struct ttm_resource **);
 void nouveau_mem_del(struct ttm_resource_manager *man,
 		     struct ttm_resource *);
+bool nouveau_mem_intersects(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
+bool nouveau_mem_compatible(struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
 int nouveau_mem_vram(struct ttm_resource *, bool contig, u8 page);
 int nouveau_mem_host(struct ttm_resource *, struct ttm_tt *);
 void nouveau_mem_fini(struct nouveau_mem *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 85f1f5a0fe5d..9602c30928f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -42,6 +42,24 @@ nouveau_manager_del(struct ttm_resource_manager *man,
 	nouveau_mem_del(man, reg);
 }
 
+static bool
+nouveau_manager_intersects(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size)
+{
+	return nouveau_mem_intersects(res, place, size);
+}
+
+static bool
+nouveau_manager_compatible(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size)
+{
+	return nouveau_mem_compatible(res, place, size);
+}
+
 static int
 nouveau_vram_manager_new(struct ttm_resource_manager *man,
 			 struct ttm_buffer_object *bo,
@@ -73,6 +91,8 @@ nouveau_vram_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_vram_manager = {
 	.alloc = nouveau_vram_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -97,6 +117,8 @@ nouveau_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nouveau_gart_manager = {
 	.alloc = nouveau_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
@@ -130,6 +152,8 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
 const struct ttm_resource_manager_func nv04_gart_manager = {
 	.alloc = nv04_gart_manager_new,
 	.free = nouveau_manager_del,
+	.intersects = nouveau_manager_intersects,
+	.compatible = nouveau_manager_compatible,
 };
 
 static int
-- 
2.25.1

