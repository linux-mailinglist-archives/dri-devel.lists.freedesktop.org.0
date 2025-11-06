Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5FBC39D8F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28BD10E867;
	Thu,  6 Nov 2025 09:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NWNvqDoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700AB10E867
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 09:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJTZqKErflRNTA1PcNon0KYwy43DvqlsN1t07JKo8Zg683Q7njIE6tM0I/gWfV7YYepsV2FYu1Lk4eB8WfHY4DTarPIabr0LeKMjbOSvWxO4ot2dESqZi0w1JuA9JUOXrgtNWHh1dRCawxHsTgRYCiOFQPna5jCgNHTUjMrGhYqP68IN3qoWhcRg/7UgF4UwKsTJAAqXuoFoFslkxMEoWNKtGEPKHulEuFbUhsm9zYh4TQnTV6byFp2lpAN9RIksdiOTQRXT1IUqtvuU8aEiVRtsqUs2cAJV2t6zSQhVWo0gX0yxns1iSJmgjS58w4etA2h9GPuxs64ji6eYa1Tp2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTtzB6qFYPssviQz5CwXw2yzojtZkgbNlIInA9oZcB8=;
 b=R88QQ0MxeT2+Qp1n5NTak4By2zh7eeVjulh9pg4Akf7E7FMgRrojZDHydwcXqt/Dt0wDxIUkGR/2Mb4oxwB5GxhtQWF7QbRN/COKsPXcqu/HFATcme7hMvXCIyKhBQIuc+w7evI7iz031HD+aVUfaS+f0ZvgfWP+j25Wl304uJBB2N6osAtizIrNQ9wNMLByDNCkQ7NOID+izgRi03HAG9AZWrrS/1EyzKT7qDq6+UuMYXdZKtzbhInH5IDDCkMArFdaE414azLAFEDgzn+LHmds4wrtxvwizUGxqUt8ZlHlT929WMFlVBRTgbpME5rLYW+5Z/KG1cWYJw7uHdHFPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=intel.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTtzB6qFYPssviQz5CwXw2yzojtZkgbNlIInA9oZcB8=;
 b=NWNvqDoavi6fwW6tWA6x3lDGOul1J1PFMx7jAm/8lbJABMpUp08D7U2/J1hyL0/IjFbOJc4F/7tQCNsS4+ipcmAj+4/zNi9P+/c0rd3AdTdao4cVnCs0n5gdypFqTVBiC2O1AnXj/H1tjq6/ApiBV3eqXmpKm5hJAQEzw0Af0RU=
Received: from MN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:208:52f::34)
 by DS7PR12MB6213.namprd12.prod.outlook.com (2603:10b6:8:97::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 09:40:25 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:52f:cafe::4c) by MN0PR03CA0029.outlook.office365.com
 (2603:10b6:208:52f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 09:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 09:40:24 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 6 Nov 2025 01:40:20 -0800
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Tvrtko
 Ursulin" <tvrtko.ursulin@igalia.com>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 4/4] drm/sched: limit sched score update to jobs change
Date: Thu, 6 Nov 2025 10:39:28 +0100
Message-ID: <20251106093933.18859-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251106093933.18859-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS7PR12MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: db50b297-cfb6-4dbf-a67d-08de1d188309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cXbfCdU0ILUmc2lIS45dxnbE4wCWspvjLjHMuwlT3iRSo1TjwNejRM2EsJ2A?=
 =?us-ascii?Q?lfqNbjkYKDv4FpTUfilt1KNu04H6lu/2aHlt/E6qPfUDmtQCVch2iGHQAOad?=
 =?us-ascii?Q?aOjIevAn90gsiLmtOHxxi7RJ6CLnmxZkbwipJiuRcbBK+O/feE2ybGbp0uDZ?=
 =?us-ascii?Q?zGYUpMwWEGePU04E3XNVze9JSMQjF7Xj6xjgJ8hkXi1lE/3HyKnYdwUPOhXX?=
 =?us-ascii?Q?Qxq3UUBtRzxtUQSkwtrzj4baDW71rGBlSlFyTgA1N5GhhzKDls/jB7Ug97za?=
 =?us-ascii?Q?VzsulAE0PYyWfTspf1MM9nu+6mXFip+9gDH0zCq/Sb6lqWy7RlMUrBlmTLYR?=
 =?us-ascii?Q?7LsGopnSK0Pyh4cFZ9fdNFOC69wDazEp9J1OBmto0zMmUELy3yr68Yt1X2+t?=
 =?us-ascii?Q?CtJzbPTxdQdyX5qdQD5LIkVmz4i+EuS53jJhoEKimoWvtdAW3RnyZRkq26UQ?=
 =?us-ascii?Q?t3KEyxYb6zq/nkIYnGrZ3LZ76itpkPXjQf9eH30f47kZ9O+nU2pdpC1KF2T0?=
 =?us-ascii?Q?6C/QPLyrw2Kcl8+43aSCQMvEtylR2J9R+9UzCpq+nIr4QQ2ejXEQ5xwjJzfo?=
 =?us-ascii?Q?Vw3ajJNSPEejYi9KhyqAuqI17pWosvvMDWwNYk9g2+mVgqTI0Y+hZ7KQdl8u?=
 =?us-ascii?Q?BkYTOPaKZCPK23GWjwmECPaQt0Vd0v+Tv40gkJ/FxlfgZIT/Nt0StgaLDLA4?=
 =?us-ascii?Q?LcGs879F/RXy463iUA6iAFeobJGgOTRoTFDguM7fqubDD8S7hXw+hnYhYBqX?=
 =?us-ascii?Q?a7zNpBKL/5QAIxU+bhz0rH4GwsomIXSd9Tns4KjhWSvhuvqzEY9jwf140dzg?=
 =?us-ascii?Q?2qiIhiOU6lUOh0ur2pV2JM+axL1KaOXv1dAtEi5dCATtK7TA28NStDZ5FNfF?=
 =?us-ascii?Q?QgpTOnlMFsr4pUXwoNE9pFNsj3T3R5E4jctd3GFVHfvImOoKWorumgb1Y3aK?=
 =?us-ascii?Q?gPCxGT3WP8zi4uUoQHEIH9KaVlBCP0Z/WBkGgWk+GXMFg9u1UmYnOSdIaZab?=
 =?us-ascii?Q?y++Ojn2F9zZ2UjCctkpKM/tHsoQI16MNdi5FrlNhYQEGv28S9aQ2n3zbtxNY?=
 =?us-ascii?Q?zR6nU0NipLpPg/y3Mi/Psm2Xdar6CIpAyydREeW9mciO6QxSV1V68/YMt8hq?=
 =?us-ascii?Q?wc7e9XKjjhI1O3lpaAdlUQT6RiKl5a6pOhsbsifDpMhSgYL11G56bCKU5gF0?=
 =?us-ascii?Q?df7zocAzIT4mt/qOlS19rTm+keeu3PXGZwNzxMBSulxp32NsXYSBkmqsenmz?=
 =?us-ascii?Q?pRco1V2MrRfqGSgFj+7ly0MC6B6TIUCPESx3bUSC6xNxu4Han6av5O9y4GVO?=
 =?us-ascii?Q?fO+5cxr2C+FOQnfsX7G0Bi1gfhGdEQciLdbX65f6UVZesJM6/EEGGAKUw+Yv?=
 =?us-ascii?Q?mRUI4qYzdpMzlqpdw14gaUHybAgPvJLDInm+6wh4XW7x0EoCwz0TreiDeo48?=
 =?us-ascii?Q?dZwurd0JES7BSHW1rIh7jf39reh2nHS3DjaXQrY31yWcajxLyfZNGnThQvGG?=
 =?us-ascii?Q?/yiGK571oi7H1L/dpy/Aq56K+7tTZ/uQ514GATtHVzBtNwEKaDG+BdHuERNf?=
 =?us-ascii?Q?if7qNP9bcCnvjv6JjJA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 09:40:24.7627 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db50b297-cfb6-4dbf-a67d-08de1d188309
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6213
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

Currently, the scheduler score is incremented when a job is pushed to an
entity and when an entity is attached to the scheduler.

This leads to some bad scheduling decision where the score value is
largely made of idle entities.

For instance, a scenario with 2 schedulers and where 10 entities submit
a single job, then do nothing, each scheduler will probably end up with
a score of 5.
Now, 5 userspace apps exit, so their entities will be dropped. In
the worst case, these apps' entities where all attached to the same
scheduler and we end up with score=5 (the 5 remaining entities) and
score=0, despite the 2 schedulers being idle.
When new entities show up, they will all select the second scheduler
based on its low score value, instead of alternating between the 2.

Some amdgpu rings depended on this feature, but the previous commit
implemented the same thing in amdgpu directly so it can be safely
removed from drm/sched.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Acked-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index c39f0245e3a9..8a3d99a86090 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -206,7 +206,6 @@ void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 	if (!list_empty(&entity->list))
 		return;
 
-	atomic_inc(rq->sched->score);
 	list_add_tail(&entity->list, &rq->entities);
 }
 
@@ -228,7 +227,6 @@ void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
 
 	spin_lock(&rq->lock);
 
-	atomic_dec(rq->sched->score);
 	list_del_init(&entity->list);
 
 	if (rq->current_entity == entity)
-- 
2.43.0

