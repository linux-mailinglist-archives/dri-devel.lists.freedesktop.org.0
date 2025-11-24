Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7DC819B1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 17:37:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCD410E2CB;
	Mon, 24 Nov 2025 16:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QkZ9pHli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010042.outbound.protection.outlook.com [52.101.61.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF6F10E24C;
 Mon, 24 Nov 2025 16:37:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIBY2DSOWeawm0n8GiGcmAZraIOSn3vOHUAy03NaWicd0p7MyygKAlsoMCaupxUOI1Xr0Vch+QoPoDwn3z33lMwbkGDUETqQha6D/IYcqFWUArqLsmKjr5RPr8Hs8UhabLwTI5GcOsRAYhSaT68zWyEsXwLY1TOFbHjdqXJLa3Asf9ZmVvRWLH0O8D2WJTLYqiryMzH3iqWu5wmqRFpXz4MhiYKQdLe7sySMiDRK6nNb8mPPpJsSqCxfQQ82l1QfSiFaZPUCTQ14+NIcP3o2GOA7HMfedxrbkUFtJHb4RpWkNWhImv5SUs4H8VZqij2EQfDQiLpNSDqUXLkCIUBtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3X/YNAxntdAAF8GX4mr9m5NoXT0Ou76/Dsoc0f+xZCk=;
 b=eQjtHmfLw4angeq6mim9XPr1nzIRuF4x7ONrBa+G4KSi4H+QLPe7xqtqzuVkDSmh2p6HbmDMVpADx8I8N1zYw5a/8CLoZWs0wrbkcSm8kCOPdBDtGXNZoZC50xrPwoicq7RqrBhYAfF1/zAW7qDRinfURlyZMpcLRYpGDfMjKc+DQZS/6KM8B7fQ2z2lGlgGfhpYHdv/ls9GkBH3qtMm28nAHqmA7TbM8eUnLWlZJ4R1RO7R3J166mW4K/c92ct0Y+7v7K2ynZ1j96C+Uf8Ii+pnZ7PgcSOR3QF6bDB8yVYRIvzZfghKLuPPYSQvJhWTJA7OxPsBsE2IfPWzaR1JXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3X/YNAxntdAAF8GX4mr9m5NoXT0Ou76/Dsoc0f+xZCk=;
 b=QkZ9pHlilsZhxvvYgoeiZBFEzZU/jafohAhUiSwXSKnQRnKQAu0NheZf8NY0Pgau6GVurUSIIxvPqGhqyToIb5P4j9kDZJWeB6NaoM5EPzcjUCgzbahe+OsAcPwpyzqxLqMfvdQkbcyhIlLVZhD5NakTtuypZ9WrImNHxAPChcI=
Received: from BN9PR03CA0245.namprd03.prod.outlook.com (2603:10b6:408:ff::10)
 by DS4PR12MB9706.namprd12.prod.outlook.com (2603:10b6:8:277::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 16:37:04 +0000
Received: from BL6PEPF0001AB57.namprd02.prod.outlook.com
 (2603:10b6:408:ff:cafe::8e) by BN9PR03CA0245.outlook.office365.com
 (2603:10b6:408:ff::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 16:36:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB57.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 16:37:03 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 24 Nov 2025 10:36:59 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "David (Ming Qiang) Wu"
 <David.Wu3@amd.com>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/2] drm/amdgpu: clear job on failure in
 amdgpu_job_alloc(_with_ib)
Date: Mon, 24 Nov 2025 17:36:13 +0100
Message-ID: <20251124163615.6388-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB57:EE_|DS4PR12MB9706:EE_
X-MS-Office365-Filtering-Correlation-Id: 046f0a6c-f937-4d5b-85fc-08de2b77b329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vOAlRuNBt1YyV8pFLXuAAqg+my/+WIrowSiI26SwdoekjEO6Chld+9BcTUt/?=
 =?us-ascii?Q?6diePAvxQnph+lJu+fpxcpdF38XkTsYFsgpseVkU6eo4oVn3IBLPbdw3voAc?=
 =?us-ascii?Q?r2j83OUNp87FQyh0yzRhwKSfWbEXJ+SNMQKjxAVtZkuquQjEicFkG5ZN/BkY?=
 =?us-ascii?Q?QoqND1EZXwNazqQfchbxOku1ySPUmJEZP43kyFfbWAmIognZsfwtTA+NAkDl?=
 =?us-ascii?Q?Crmlh6HHplZNpn3q1bJvvQ3X20rmvb/GKqJAQPVkILXbDh4sbbUWzcdeTFZX?=
 =?us-ascii?Q?QgjoKLBf6S7gSzHJuTCY8wlY7COezrHRTez7tC9wjChrBqEn11/LupQEv3mU?=
 =?us-ascii?Q?ACaBo/L4FTg6A9eJDUUkDawgiF7FtdEQfrhojo63aDqMLwQwn46sy5KK+jpG?=
 =?us-ascii?Q?rbIUt+twrWUd48+k96A2VfXQIhwXR7+PAQxQdoDOjgQxPxRvIMddtidwdFVR?=
 =?us-ascii?Q?AUx9OtFNbRBuw/IPefKgVR4QcK9Z+6YcXoBnBdV1ivT7mi3U8PCB31iBv3BK?=
 =?us-ascii?Q?gStTyt1qBjqMODjPrJrM7mqN1iIVZyUhRpeCPfajK0BmFTIMLdXnHyPYVS6E?=
 =?us-ascii?Q?kk3vBdz4BtOqV3isl87RyLtlVRsJI5Axw1zMtmHsYyJ6EJEqxIKlkBWFBu9M?=
 =?us-ascii?Q?hRbmTwWxWvJQXO0LrHN9QKBxVqZrNgcNfLkBZ+e2iRVaxhRF8ow4PlQWNHMe?=
 =?us-ascii?Q?iFrfbBWNPj3+h4Fgn6nBWokhTpUDv+2wu0QXrE0YkPpZQjt40wRso09jeStc?=
 =?us-ascii?Q?uQrjiHeIxalubs5pcs7NEEgnuH2NGATpXZ2At6RKhuzC3V7ifZgI5lKPwGzW?=
 =?us-ascii?Q?AbpxUF46ZmadtqeDti8H+uxoXHH6IlBnzmkdiAcIgMYUSpSlo608cUHDKcAM?=
 =?us-ascii?Q?9mUP4zfkZ4JpdlNY8kdo2+0mVT8POCa7dajsk0JEmeU85oP+Oc8d8AyqZvp/?=
 =?us-ascii?Q?cLdRjGXjwKN1QC7o0Sgw1Ec6Ta40vyozY6u1pGrtPMsK4eilBPzKyrGH5YLr?=
 =?us-ascii?Q?5tHdNPycnKHU1uctIgOwW2NKcJeJxBYYWzOoTB0KYOtMxrM4h2aWlk6Kj6d2?=
 =?us-ascii?Q?vBgxPorpNBWAOyOwvUH0fAah73TZWYRZjs5p0rQIIhTGVLrLNkzB2hsMWgGg?=
 =?us-ascii?Q?nH6DimFtKXBl3xFObLTLeGIf5uXg0DwrHJLiHqsCmy+lrUoGGXnuP523rrH5?=
 =?us-ascii?Q?Q70evTU7vApfZDCq39QUyoK1x3UpN6ewgellaAeR8uRAowy/yvJdw0PpxT7b?=
 =?us-ascii?Q?aVwkn3PdYt3g6f+qZCEAElKQyW6YcGsnhwblF4zadkDUFqjNRtgce0qbtqCk?=
 =?us-ascii?Q?OQmX03/RubWy48p9Z7uIV7Md9WkEWErd4gzKK3oA14pFzW/vgkDSGhs3XAFe?=
 =?us-ascii?Q?JzRwduCByuG1N3TqLC+asdryKlYoAbJwrPsZGa4Q5l0W8MIddziSerLHxEFy?=
 =?us-ascii?Q?4p29X7mtQinQEaYUT4YJkX+bkJqt1ZRlBL2A7hQDMDWZxUFUBaEfXuauN9jM?=
 =?us-ascii?Q?7jqM2TwHN2NxR5WxthfQGZU0NqM/mMiFUTXdgMNVw0Z5VGwfigFDv4bziDqt?=
 =?us-ascii?Q?i9amYixLPLAhRi6QVgY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 16:37:03.9687 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 046f0a6c-f937-4d5b-85fc-08de2b77b329
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB57.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9706
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

If memory is freed we need to nullify the pointer or the caller
might call kfree again (eg: amdgpu_cs_parser_fini calls kfree on
all non-null job pointers).

Fixes: a35c520c1611 ("drm/amdgpu: clean up and unify hw fence handling")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index efa3281145f6..2fc3d9da0fe7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -225,6 +225,7 @@ int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm *vm,
 	kfree((*job)->hw_fence);
 err_job:
 	kfree(*job);
+	*job = NULL;
 
 	return r;
 }
@@ -246,6 +247,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
 		if (entity)
 			drm_sched_job_cleanup(&(*job)->base);
 		kfree(*job);
+		*job = NULL;
 	}
 
 	return r;
-- 
2.43.0

