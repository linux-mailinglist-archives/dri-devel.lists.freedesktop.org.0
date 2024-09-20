Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7AD97D369
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 11:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41A3610E7EC;
	Fri, 20 Sep 2024 09:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3TqK5BR2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B410E7EC;
 Fri, 20 Sep 2024 09:10:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ6WyKQHMq0XS6vOu28mDktTgE7HrUShSx0KcvheamK2Mj868llOeQwIjO8muCn5WJoRbscDDStE42br57cwyBxXo8ScfTvBzReyWHi0oHsN2wwSMBJOZiKQnEZmaM7rspmmp/i35YWrcVmpvi/vFtEJOFshv0lRnt4MkOjAGkXQ/+Kfs86ifu0Ni6AWI0xPV9TkQI2ARqH9lwQZQlhEIPHZb//xZye9XrOVKQX+Mgv8fnsz3vY6YBi2SmtQHVxhbaUlEFCoDZfckbkGgNKHJav3t/M17x+E/tlttYWe09/GehbedeRsvlqLBKUs6UoaSbytypb/LG/gvNqtQvDSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5drVreCTzL25bFSIjmeZYyEEAZJNDvOd/LsBiDFV5c=;
 b=uBULqNZei03hInHYyr0x8FQuNFdRuTCysC51mLhniAqySY+4aiiVPjl/VP4C/IgqIAbs6TU8D8g+BRqdvx+t0TUsgnbySxFoJD5ziLMIBgq4P64w0ts3JbVrfrYXsHBVDA1gvT+PlOKLV2nvc40hYrsa/5y25AW/13LoWR9brUoUPHuCYEK6b7x0vn9OU7I/pa0oZEpWzOG9ZNuSDuiMcGj7rAWCCNZ/MBLSGH6Y9ocgmH1uFTCbH8WkgeruDtmvxrrlgd9eazgoe6gOxG0WIu9LuL9A0uxXQKFQX5H4cCzEMrKCCMaSYYg4DWR14DaTNuRpiZvtvBhYew+4sEwROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5drVreCTzL25bFSIjmeZYyEEAZJNDvOd/LsBiDFV5c=;
 b=3TqK5BR2Rl+ag1mCnBje5ZcicsG4EUz6YdmbIqLypom0QcAbrBnTgD6azSFXR98DmDgxZEL47tjFG/FCvlV4rPRsYai5S6JPbZ9zznivLP3PTvEZohTYxN9iTk1waCZ1VWLScHt7HluLgg62OnKP4zafj8IinqC68OV+OlDCGJw=
Received: from CH0PR13CA0042.namprd13.prod.outlook.com (2603:10b6:610:b2::17)
 by CY8PR12MB7539.namprd12.prod.outlook.com (2603:10b6:930:96::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:10:00 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::b6) by CH0PR13CA0042.outlook.office365.com
 (2603:10b6:610:b2::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15 via Frontend
 Transport; Fri, 20 Sep 2024 09:10:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 20 Sep 2024 09:10:00 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 20 Sep
 2024 04:09:57 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <dri-devel@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tursulin@igalia.com>, <simona.vetter@ffwll.ch>, <robdclark@gmail.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 3/6] drm/amdgpu: delay the use of amdgpu_vm_set_task_info
Date: Fri, 20 Sep 2024 11:06:45 +0200
Message-ID: <20240920090920.1342694-4-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
References: <20240920090920.1342694-1-pierre-eric.pelloux-prayer@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|CY8PR12MB7539:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d85494-52f7-4c32-6d34-08dcd9540145
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w1kuZezKSdquTSXAlFGLuVvDtuGZVCy+5Bs+DLxLAY07pkr5+EYbi4RGwUjl?=
 =?us-ascii?Q?0T+JmqadVj49fL5YonoWcplW2FIIKuLSF8o94/buosoUdpXKy/1iKEQoKeqG?=
 =?us-ascii?Q?XqcKjcFFeM1Zifz5/mHkLQClsOMurTmXGQ4+9jzBiPtZj1ZVsb9eUy3WdzYP?=
 =?us-ascii?Q?R0eAl7CK3TATKxaOfdQDr8/XS9aaQQwv3e9eC+VCx72gtIEit0G54Sy2vY8z?=
 =?us-ascii?Q?tegWtdz4JjhwG3flXVK3R7qLCtOnCfstpZVRmkZiVGJLhXp7OOz+r0mSnib7?=
 =?us-ascii?Q?lg4Kk5k839TTCnZOAxNhx1k4m11hVgYhBwo9tBuzHOwss8znTTqVGXh8MT59?=
 =?us-ascii?Q?z/qpKEu10+zf+S1Z4rWUzu5hlVUnsPUQvUl/kXiIzU71Rt4q1OMqbp5LvEwv?=
 =?us-ascii?Q?iVJhC4vrncn0Da7hIsskNbu9RGysbT895x7qXF5G/deVZaNiKFsdFG5F4N9u?=
 =?us-ascii?Q?1kXfgaZKOR2Id4Knr4W1ClKwNCJVbyTKdJDBTGVGLsmvkwnNfWs95vVovnf3?=
 =?us-ascii?Q?MM+rVKuo2fYMsPAdGAbcr1J+7slQH7oRhwEflX5zY0yH7jfLcsxVANVO76nC?=
 =?us-ascii?Q?rSn10FScJdmYxVQ65Sxn7YQ0qEt0hrQwcnSDggFkqni61ztJSouV8HmJj5eS?=
 =?us-ascii?Q?82cvqy7novt5uwKmqCfCpYqkOHl5OapKRj2JTvJL5TXgXT+JxdHyRr0gsDTP?=
 =?us-ascii?Q?GhFxIxcjX1oSLYHEKcyC1WOPVSeeMcKcYNW8YGgvJSMBHQXtY6FdMrEkxCC/?=
 =?us-ascii?Q?poFzfSBgTbnxynMzzkTsGs7ETcNka2K36wvHIr1jzA9POeO3RGRzzB+XIVA+?=
 =?us-ascii?Q?v20di8opfhjNCLbI3Cqe/YQbZptdTCDqsBIh7zM6IVrUn2/95RnC6BiNwRNN?=
 =?us-ascii?Q?Poarw3Fp6oliOPllyc1SVRDHg4ltjTf2RB5rvBgqFIWmHkb1n/P7lOkMLIa7?=
 =?us-ascii?Q?m1FOk0P65e/VR/d/UqkC7QwBxu8Wp2fC+7YF1clKHYXThmQy4TmWvLExIkSN?=
 =?us-ascii?Q?3l8VhnZdaQKTuy/n8yMFSQfQUIzTZe4eZGPi1ne4Ieb+OCGI8TuVdMjnq3dI?=
 =?us-ascii?Q?tYdh9VA8vb+yCAoh8rEDHenF7KM6j8Byb/LioBhi3nXswKnRxThDFMMMhH7d?=
 =?us-ascii?Q?vBoj1E8DLFERAXmDQZUfAMfHmLLcVzQ4EBQnRn73CNcDqusRVWWUlT7Tta8T?=
 =?us-ascii?Q?ed9DUVEW0PM8aG0TZVIgTn4cf7bqSTFQllSDtiQ03oWfpWULuzhOxo4D5ry7?=
 =?us-ascii?Q?4QUls+lDQGDRYqNcMT2wDIPodRUuXsnMp1TrOrGyoYYiOHafmx5fZKz2Gb0l?=
 =?us-ascii?Q?hWCZrgeWwH2gWLePcf193ItqQ0fcDae4QyoJRV58TrziXnAv2CeVV16FLXsB?=
 =?us-ascii?Q?FrBRt9v0BQcdjBNQ/T98nWj1p2XYS0FGPzRyVXJ5mu4c8GVjwQ0Utf31sVpM?=
 =?us-ascii?Q?3Y7FM8h04KKs67LBrkR7Q8JXRtQRi007?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 09:10:00.0481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d85494-52f7-4c32-6d34-08dcd9540145
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7539
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

At this point the vm is locked so we safely modify it without risk of
concurrent access.

Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 1e475eb01417..891128ecee6d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -309,9 +309,6 @@ static int amdgpu_cs_pass1(struct amdgpu_cs_parser *p,
 		p->gang_leader->uf_addr = uf_offset;
 	kvfree(chunk_array);
 
-	/* Use this opportunity to fill in task info for the vm */
-	amdgpu_vm_set_task_info(vm);
-
 	return 0;
 
 free_all_kdata:
@@ -1180,6 +1177,9 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 		job->vm_pd_addr = amdgpu_gmc_pd_addr(vm->root.bo);
 	}
 
+	/* Use this opportunity to fill in task info for the vm */
+	amdgpu_vm_set_task_info(vm);
+
 	if (adev->debug_vm) {
 		/* Invalidate all BOs to test for userspace bugs */
 		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
-- 
2.40.1

