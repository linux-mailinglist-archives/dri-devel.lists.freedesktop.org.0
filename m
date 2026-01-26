Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEw1AP1td2mMgAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:37:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA2888EBB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 14:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E8A10E42D;
	Mon, 26 Jan 2026 13:36:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZAusd7gQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F39310E42C;
 Mon, 26 Jan 2026 13:36:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+m7HMdG6buGFF0K7rlfd98RvK+IxE9c7nMO6rl1y1wGusQWmWO/+BuX1ffPEMU9WaRoy04vmNJfm5Gr84lnVDB316LpnSVz0UKvek6FF3Gp+ztqGqruefh4+QXlIrIiYtppRhoJqZya/OI0j7Hrz5qiquApYDob9CA7oQhz4Ox0YUntuXJcMTg5KYncb3NKQ6cRxZqB7EkmSaBKPofieyZN/6FL4vSACuuvW+kCymtUybYjlym24RqT0P+ozYX0jyWhzZnjQYDbAOPSAfs5+eO9lqh8hHXXd4KNmEX/feM8YtTtV6k8UtXDT8FWdBh3wqfNyMs9XIp+LWSIeHxiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1b5yrI5+5Lp6dPK82ifmHs3KilsV1HlMT+q62liyqE=;
 b=hkTWZbsvgLH5vCl5n/H/mya1vBzu7i+FLPSx67WHKoh9E92BtGLMboE9dapXQAzDWH9PsNlbH2wqr2WdsEwYRHzkYT1iZOnZjJWk6kt8CERwfiwzRlchiIA6Jks6Bmqd/V3TEf+NBB9YaOsFYKVhpC6ixC2i+43bYHoOvX01BOmQiVrUYzTlBoSBwG6AdsDQLpMJSeXMfCOOazRD8ikNvOUKwyQN/uP0v3Bwxojyk0DqnNXKklREenmio4NmQx1nEK+HXR4CH8E49hiQvrE4mc8SidmFWdNTBl3TFdsaSeNnTs7OEAyq1bQFaVgAB48uCnCnfk0tSEFBxC6I88v7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1b5yrI5+5Lp6dPK82ifmHs3KilsV1HlMT+q62liyqE=;
 b=ZAusd7gQsXkeuTJK0m1MNbppt700zJuHRGbKtd5i8JCbZUfpcZK+bh77U6ZAzoTFOmeovhrtQ8iucXqKNql6cTqOXhTIKFNjKK+H4/Lq/QPDUtinmVkIbQrNFInzc1yB+moXutWnAvXg4eRcVez8G8zoa53hog87DpP1p6ox3xs=
Received: from MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::20)
 by DM6PR12MB4297.namprd12.prod.outlook.com (2603:10b6:5:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:36:52 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:303:80:cafe::9) by MW4P223CA0015.outlook.office365.com
 (2603:10b6:303:80::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:36:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 13:36:51 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 07:36:51 -0600
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 26 Jan 2026 05:36:49 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 06/11] amdgpu/gtt: remove AMDGPU_GTT_NUM_TRANSFER_WINDOWS
Date: Mon, 26 Jan 2026 14:35:01 +0100
Message-ID: <20260126133518.2486-7-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
References: <20260126133518.2486-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|DM6PR12MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: 93de73e5-4822-4b7d-bb0b-08de5cdff6c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w2IAQtgK/WUnEmB0qOuH3Ij5xWTODnsH3Q506PUZovtGtOLcgQ43n4XiHXhD?=
 =?us-ascii?Q?Uw75uJ251v7iq5IEsDtzCAVZOun9Bb2uBhItClkgTMi/jZkU/BK3gsWnK6XX?=
 =?us-ascii?Q?2CAOwN1YQyAjSRgUrB2fPS1kuFw9kc/3gbu4uoCDS6Uda0+mAmPUPUFBpukT?=
 =?us-ascii?Q?ltUA3PIqpxabY4AabOw/gDv3TLu8/HM48ALIR/dZISPPbmpINtBFl0FlsJbb?=
 =?us-ascii?Q?zkRo8B7smMXHLtu43inJDzOSE/jZks17ZBSDsTCtEsuBKwdhqi6ZJBjCPiWw?=
 =?us-ascii?Q?4Bnsk7d3Xi/N+X00hzg6lP7Dl3tx4kESzeK/Dgqrdn2b3YB6hqTPts2VXufY?=
 =?us-ascii?Q?4F4+y/DCHYMu28E/Y7wdAOn5KjXHkA+6oLfD6kbwQc24S1nGGKBiZs2rOL6b?=
 =?us-ascii?Q?H3yJqGNKCKtRRJK685FFWQhNCOrZlrq0TMa4X7sj7G9Us99aa6dMW/2ugihG?=
 =?us-ascii?Q?xRUMsQ9Ai98z+tfsNcGPObpIpyUwrZyAKhZRP59ixrbfwW7pS9FOCSInCfV/?=
 =?us-ascii?Q?zGhYZwgvJ1tKY0RgnX1dZIkbGgc1YqLcRHWKeU0SSanjBUriRSd2Fv70x+qn?=
 =?us-ascii?Q?hKgCopTbHqNIVnKZS8XeDEqXfK2IBDV9EpocHBA3bfWA9zuqpVXFY7w2AN3s?=
 =?us-ascii?Q?MRRyFCjN8PhijeNpqblNo3cPq3Zdz0E8Cg8UXZOdGuCc75oR+GC+wOWzTVdy?=
 =?us-ascii?Q?Z2TiQ5kTPCFvk0YjXFG4mM11BFzGv8jr7J0Ht2J92ArvLPaYBBSjykkqlJqy?=
 =?us-ascii?Q?pMNrpaLyTEp6WFrXTjCLYuiTuAbxcBVdwB6roxaz5NfYvIKjdmDm68nDpL6J?=
 =?us-ascii?Q?sdaJhW8to1c/tB6fWm4MRXgTtLOJW9ekGysN4tT+4Ug0IMLQ5AMEP36u0QQr?=
 =?us-ascii?Q?t+v9HOkZQT5PSUnr32h9H5yhWCVcBL6qbDuNxzm84dzv/YnGSTdexMjji1tv?=
 =?us-ascii?Q?OrUzhWAg420nQgzoYYUEQWZg5732wpYHLYmRDv1M5Smc+uWt6e1NYhApJBDl?=
 =?us-ascii?Q?fkgI45gMF1HD7JV/7RTNd0MI+Y5WQFqM46JvnUmTV9YP9q4vUBZlVIJ9+uOq?=
 =?us-ascii?Q?aanTMKgvC0wec0FSBAzITUI/YUaaWQUmdbhKUt3JZlzhGedaDPA1mNTDS2d2?=
 =?us-ascii?Q?vddMQ1xK82H7YEUjh/BEvS5qbIon6Z9ref8SbnRA6d9HcKlmPwGoL9LbJp4H?=
 =?us-ascii?Q?DOsc65bX5sTbiMSIq5gEdlvE8IPmBvbAuiSPyOiyGVMwcXxfCB3wZvUNJOJx?=
 =?us-ascii?Q?Qjk/GgRCkrrQslDc7wqLAo3TlVqgLoKV88TKuxbQV34id4rxvslYOe4jdZ/C?=
 =?us-ascii?Q?Pt03Fewfinf0Q/kP3+n1ESWnLqh4cUKlXSxS0rUmJJAAytIeHYaq3GuW5akg?=
 =?us-ascii?Q?9jm/rUZuYE+Gy12KsyWWiJIkDjkpxQTcMgn2gRgH3UEk+JHEJRz6qo/ZmFBQ?=
 =?us-ascii?Q?/ht4Msf0al62BjgPvI7pilDLYIJkpbvstXoGD+d7UMEnN1eBbZ7FueIxdO7D?=
 =?us-ascii?Q?ITj7kda0zhzxaCpkk3FBwV0dBtBjk/9Gsmsn/EkDDJylDNqYt79BVB+/Gs/e?=
 =?us-ascii?Q?b2XuQmmaDdrhQID5Ql3RR54M0Ks6c75w3Yz4ISKtyUSfy2CPNWbl09EbHKKy?=
 =?us-ascii?Q?35rAke8ttyQz+/vrMshUuHzCRMhwnBaZ1Wybxeh/JsX0KjSplVBNrARkpQu2?=
 =?us-ascii?Q?K3EfWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:36:51.9757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93de73e5-4822-4b7d-bb0b-08de5cdff6c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4297
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9BA2888EBB
X-Rspamd-Action: no action

It's not needed anymore.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c | 5 +----
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
index f2e89fb4b666..9b0bcf6aca44 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
@@ -324,16 +324,13 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
 {
 	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
 	struct ttm_resource_manager *man = &mgr->manager;
-	uint64_t start, size;
 
 	man->use_tt = true;
 	man->func = &amdgpu_gtt_mgr_func;
 
 	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
 
-	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
-	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
-	drm_mm_init(&mgr->mm, start, size);
+	drm_mm_init(&mgr->mm, 0, adev->gmc.gart_size >> PAGE_SHIFT);
 	spin_lock_init(&mgr->lock);
 
 	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
index 5419344d60fb..c8284cb2d22c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
@@ -40,7 +40,6 @@
 #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
 
 #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
-#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
 
 extern const struct attribute_group amdgpu_vram_mgr_attr_group;
 extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
-- 
2.43.0

