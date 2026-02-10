Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOJDJgn3imn2OwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:14:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB54118BBC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:14:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 902EE10E526;
	Tue, 10 Feb 2026 09:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K+qvRaxS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486A10E521;
 Tue, 10 Feb 2026 09:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSo3Ibp1iz1JKd0kCh+VFDrHrbUcntqUiBnXLSlDMfpW64SxgmCGvtHBunTY5n3N+QtzmPqDjuSiYG1LSGfWJWz9wOrRwjHlrs/b0Yq226FvnXn9hZMsIIeJxIp5XGqIvzDYYics+49Xy2nd566WEaB8VH2QtfIA3F8o92nEAbhOrWol7VYyi8iz84iKOQuNFYkdrqrrBJ7wINjdG8Pr5HqN/dI4TWjGqvfJgJyt60eTRUVCqilLAz8N7QUU28blXCQfuQiubdsi2YSTkAgjs7/gfiXIQjqGrXViRwaX2cjCLnSQvVlpW2m4SekDXClRFGkCgdpAMpJxj3dBsazLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QshxU7kPQZFwe59YhxzWgZZ3PoPqzGkqBcqfr8hca8M=;
 b=GXW9YPxdJdfoa4I/BIhp7X7DblPOn/vmRoGBNXoFvfy+g81MX6EaOMENFvLo2Djjj0ZRULN2PS2r2ycWf7jsjH6kRoNTqHwFQs2ucE2/MUZqxk9NRRVS9RX5R0JYv6CipvmowBdCD+YiUohP1qdjIjbXEgX1WGxU6v+0pO6qkvz8F/2kTaBzBGZjvpLr2qMt0Fek76/d4tzgS1pJjYgwr9GZXt8iyKKlsUL5aWmqGgEAbKSFgU3j8kpTJdjf1rcWovygWKCpWcaSuf7mO07zcD3s5aUCeki83WeG5jJY58ZLCGRMU1hvRefg4yaj7GAsOh8odIRz0cWYEiLgTZnidA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QshxU7kPQZFwe59YhxzWgZZ3PoPqzGkqBcqfr8hca8M=;
 b=K+qvRaxSJY3enYZYdtC+mq4bRITzwDa18SStIda7fxmB/eHAQ4BtomDQToLZKUeqbCjzueVtr222MdinZWAVUxSlwXY188gspKmKoypQj6u8IVRg50OJPazk56/AcemaE8gbTZ2Q4+/L9cllKFYj1sUfRKvprF+QWWJDhGlG/As=
Received: from CH0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:610:b0::31)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 09:14:39 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::e7) by CH0PR03CA0026.outlook.office365.com
 (2603:10b6:610:b0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Tue,
 10 Feb 2026 09:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 09:14:39 +0000
Received: from FRAPPELLOUX01-WSLPUB.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 10 Feb 2026 03:14:36 -0600
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, "Simona
 Vetter" <simona.vetter@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/amdgpu: fix sync handling in amdgpu_dma_buf_move_notify
Date: Tue, 10 Feb 2026 10:14:16 +0100
Message-ID: <20260210091417.1133-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4e4d16-bc77-4fce-538f-08de6884d199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qjeUxIPqPoWxUORcu51TnQL/ge/oaFI87bgh4fXJfI9uamJJxMdc9vWHPIOD?=
 =?us-ascii?Q?TDx3uWbtCt+Z2b4MFLlz9mLxMLkMBOu7K+/RCL93EeLi3mvrlKcDLaWLB0FE?=
 =?us-ascii?Q?/vCIM0I67wVlB3qB9hb0H2L71P/6zQzsoQ+fg/H7r8FoIpr7Y82aq7lyEbJ4?=
 =?us-ascii?Q?cohuAhWnZKfa7qMe+iZXeSvvxdHOFCRlI3+OI7LDch16kzINTzJIf35Q8Sip?=
 =?us-ascii?Q?Mx7e3iC/SyTZScv2o945Nr8QnOFQY0ybbokME/0C+VpB6FPFh+x/jcMfbxkY?=
 =?us-ascii?Q?7ct5dxTeJ/EmXyxGAr/Y2yI7/ze6ZqIfRHmfZHCTsdDV2VEOwG7VLNtvXdjb?=
 =?us-ascii?Q?c/+L+pZhiu//qHsGEmUxqtCbfq7JeC1qWLd2muz42sA1pKKhwngAUNFsnJrA?=
 =?us-ascii?Q?JhDw8y1kuMzVofJrhffTCMDB6GUHNZarDGAAR0tScbmDaSIDG07bMDHRVp6G?=
 =?us-ascii?Q?GaYu3RJ7X2uwwUs/RLYDr8uGxQXSoxXCXlTpp5PowoI/Db2DMfOH/8+unRnf?=
 =?us-ascii?Q?dJYKk/C+s//2NmKjYDqOBhXwqBf5YwLLCxRPWe74RUa2tEuWsmcl+Rs2Qapl?=
 =?us-ascii?Q?cJx3S7StO330/vXZ3WUVyvoVIll9T26YaVObDr+VjK8g3WS3OoVx+KoXJJFw?=
 =?us-ascii?Q?nb0Qjx9+lU6YnaReveZPpzs0IshNSiZGMUdwL2LUhUCdqWWAtVuQ5Sumjrzv?=
 =?us-ascii?Q?cek+mRt3uAwDkubBueQYINGzMC/Me5Xo9t55yvG2B7/NAVL/yQkOVXNqmWxR?=
 =?us-ascii?Q?o2yHNAMlqhROs0R+UMhNjMd1mpXaeYGwOBiLaxkE2U7tggsXLF9LRts1sHnP?=
 =?us-ascii?Q?DiEMAwP0j6Sgb6eCALUPp5Pzum5bamRMswhrMg6oZVfNyTxg3vgsa0KC0g7Z?=
 =?us-ascii?Q?HJtvbjgnFkS8Ob2goHU176rVW31V0CpfK9nNJwOaNfRUumAkUxyk1paNWQ83?=
 =?us-ascii?Q?PQfqMhIVQi+glU9c0OQuQljf6+QRE/2RRHGERlvrZrAbe7oGURNIpsO2oNwz?=
 =?us-ascii?Q?4PL/4G/1sLmL9WE+B4unhlq+Por5LyTfaPH6HEQ4yCprIGKI5NX6l0cb31N3?=
 =?us-ascii?Q?C9zg4lv7FQTV0qB2veWH3AIs6PxoYum7N4aAzfWrvbE8OR2GFtgsH0SQI+fq?=
 =?us-ascii?Q?4lj8B7OQ/dWPbIhhSpq4+AvoRY31JUQLK90Eklg69jSYBCeR2pM7BKMJdTe0?=
 =?us-ascii?Q?5wiDIyfM7PGyL9BhIpCIcFbRA4WOUklPNBHn+OatFirecUdoFT9mTO1tzbj3?=
 =?us-ascii?Q?AtsPQCHxmHfHU0nkrs3RgbESNw9ZVxiVLOHzVUe0XWvMc80sKTuUEzzvX7JU?=
 =?us-ascii?Q?4poZtRTFJD0s+Tvg9+fVNxGjZMB0b8XM7EE/YYABIiBdMpMoPp3ncQXFVdD7?=
 =?us-ascii?Q?gxn7f+C4jRY1iEqIfjZjMR1HB/nvqdVT2dK3Admw5sQda1fTrWKvzR29mo+u?=
 =?us-ascii?Q?lSuBlgcJoHqWfJwKgk0bY9DssxXg1n6QiafzMMXrm6MtMLbaOtdeSXISrcRw?=
 =?us-ascii?Q?FzXqFdlLO97Wjn+8UJz5zUHE5ihVF11Q23YKMOaqkY72UT+iB85kvaUIJXGh?=
 =?us-ascii?Q?QZ8f/AdLmmZt69I/9jAj1AJ1WCLqxCGhX2k9aOg1P8sdB4qgfR0dLOWUIW+t?=
 =?us-ascii?Q?K5Tc5N4GWK4/y62wPWNZvfDQHKF2iH+R0U2CG57A8dVknRwJRcqsqmmiLmA3?=
 =?us-ascii?Q?bft/wQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3MubN3PCe3fRVwJr/lYo2rLdQuAcI0HEAW9C57X/KDKjM0QwsglW8Zdq88DDNsBD4VgZd+e6zEE81hc00nrmsixLwzHldTnZ/yKinn/7U6Mlt4DbYjqH6KNCN6fb3xqFVK2OkchEZWJE+EvSfUwTxzRjD4qM28TIQmx6PUJZDDG4PadduGWYhJpo0k+RhuV7sj+9BECb4/YbYfmGeLjSivItFgtr8GxHon3OQ/9z8cqw634HRWvJdiLHZCd1apowa8NZ7fWm0kOn3BbZn0j7nssSr7WubLhtMPiB0hkOl8vGJoYrqpXagVsYohrTS4bW9IdfVDVgRVLFsYsIYewujcICNUDnWV6MNYG/B103PP2diuNQ9NFot36OmmPTl7O1MWus5DuF265glfwbjAyOkT/G+AkpZIa5mClVAbhY35hNenBEqaivrkbhFNebsVd6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:14:39.3904 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4e4d16-bc77-4fce-538f-08de6884d199
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[amd.com,gmail.com,ffwll.ch];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pierre-eric.pelloux-prayer@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4CB54118BBC
X-Rspamd-Action: no action

Invalidating a dmabuf will impact other users of the shared BO.
In the scenario where process A moves the BO, it needs to inform
process B about the move and process B will need to update its
page table.

The commit fixes a synchronisation bug caused by the use of the
ticket: it made amdgpu_vm_handle_moved behave as if updating
the page table immediately was correct but in this case it's not.

An example is the following scenario, with 2 GPUs and glxgears
running on GPU0 and Xorg running on GPU1, on a system where P2P
PCI isn't supported:

glxgears:
  export linear buffer from GPU0 and import using GPU1
  submit frame rendering to GPU0
  submit tiled->linear blit
Xorg:
  copy of linear buffer

The sequence of jobs would be:
  drm_sched_job_run                       # GPU0, frame rendering
  drm_sched_job_queue                     # GPU0, blit
  drm_sched_job_done                      # GPU0, frame rendering
  drm_sched_job_run                       # GPU0, blit
  move linear buffer for GPU1 access      #
  amdgpu_dma_buf_move_notify -> update pt # GPU0

It this point the blit job on GPU0 is still running and would
likely produce a page fault.

Fixes: a448cb003edc ("drm/amdgpu: implement amdgpu_gem_prime_move_notify v2")
Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index b9c38a4fe546..656c267dbe58 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -514,8 +514,15 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
 		r = dma_resv_reserve_fences(resv, 2);
 		if (!r)
 			r = amdgpu_vm_clear_freed(adev, vm, NULL);
+
+		/* Don't pass 'ticket' to amdgpu_vm_handle_moved: we want the clear=true
+		 * path to be used otherwise we might update the PT of another process
+		 * while it's using the BO.
+		 * With clear=true, amdgpu_vm_bo_update will sync to command submission
+		 * from the same VM.
+		 */
 		if (!r)
-			r = amdgpu_vm_handle_moved(adev, vm, ticket);
+			r = amdgpu_vm_handle_moved(adev, vm, NULL);
 
 		if (r && r != -EBUSY)
 			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
-- 
2.43.0

