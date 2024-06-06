Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 869208FE72B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 15:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1F710E951;
	Thu,  6 Jun 2024 13:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QwCR4uiG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954D710E94B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 13:08:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhiK7q2y4IomZOvOoZfVNNZJpn4HeZed1VoDtQcGd9w66yp+etRTg+9kjE0cIpKpvhfuitHpz1XlNwZqNVwEmMzqHcS2WJYrQMs1Rt9WGfjv/Nvi+rMU+TuHnqog+LDVs4RXahG8gCDExThMwVyoDgwrHmHVW6fYinIl/IquF8NZOCLepBE0jgcJisIrl1sVmvXBFSUWHRGWYQ4MI3Lk6vti/YkxnAEpG67qIQ9JVNyZUzvP6UFxp6hF6ieEpYYoQasBDw+yPVX+uyVar/NRLa/DJVbPXPth5haxOAuiffDSP9X77sMoozOBEWXy7aRlUFLNcuIlsBBB/8UbRRiTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riLJ+1NqVvvRg6P+90wZ22jvmHDfvQJB2KpV+ibkhf0=;
 b=RZnsS0OhuKwDSkPHg6TLq/NPkktfvr2I1jqbKcbpxZqirHLS27q58PscfXIrsFInIL6OXX2keHpJsVaOTwfxYiaTNmcVT90/BcdzES89+iYIXYC3xonaepBYntxreIb1QBxyk/6sTc/GiImzm9cW0+67r1XSZG/nFR3h/8rK5XwyR6ZqN1HQbjXdJW/oOY6jHourwjoqPqYM9NKmAsqUbaygJLtgsoSNkUwDTxlExOWBirNAvGcHfLOYmWNEC2igSSvz3k1wJQDyT38JWGiy5H1o6/kzO2JlPlVOqbLzAB1obQ3nQ+8v3ZvqHsIgiVezMrWbVyTk+NCn8BdhofmW5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riLJ+1NqVvvRg6P+90wZ22jvmHDfvQJB2KpV+ibkhf0=;
 b=QwCR4uiGiEMH9a8ahURWCAwNYNJZ2XjQLmHKrNI2DDgwj12EComUllXi4/8PU8n7xdrJ37NW/p2vxqVYMIFqTpwhT9qDQnboqI4dTS2Hjv4/U/o0mnViMWN7h0aVVd40b7h/xGa6znv0tV5Ioa7MM4QuRJhedUfDU9yYH5rjhSI=
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by MN6PR12MB8542.namprd12.prod.outlook.com (2603:10b6:208:477::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 13:07:52 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.18 via Frontend
 Transport; Thu, 6 Jun 2024 13:07:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7633.15 via Frontend Transport; Thu, 6 Jun 2024 13:07:52 +0000
Received: from patedamande.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 6 Jun
 2024 08:07:48 -0500
From: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <ltuikov89@gmail.com>, <matthew.brost@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <ville.syrjala@linux.intel.com>,
 <rostedt@goodmis.org>
CC: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: [PATCH v3 0/4] Improve gpu_scheduler trace events
Date: Thu, 6 Jun 2024 15:06:21 +0200
Message-ID: <20240606130629.214827-1-pierre-eric.pelloux-prayer@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MN6PR12MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a80a199-c85e-4d80-8c82-08dc8629ac47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|7416005|1800799015|36860700004|82310400017|921011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Aiz3hqAm8tiaBkU/gQ3viT1vWn7R7yg6GtjIlYm6O008XB+q+XJY/yLoJzWk?=
 =?us-ascii?Q?skjVOE+Yr/HkONCLMMSB13WJqYP8eEAI/N0YJMhyw42+AliffNHVK77Cpjoc?=
 =?us-ascii?Q?aUmRCXyGOai0vyOf6kLdXw2qaa+Rx9XG6p3bqxJDpRtfPJTY2AbQlCWCF9Yc?=
 =?us-ascii?Q?MbRTI5fPw/0dC6EYdIFcBdG0UPRWE5uPqS73Sr8fDFIgo9OEPTSwDJy4RJp8?=
 =?us-ascii?Q?G1qU9fNLj0e+zAex9aR9ApP8VwbcX9RBO/TME0CUQTSigOcec75yjMrhP+Ko?=
 =?us-ascii?Q?zTJyL9DRtdgNTHQOUuMb3YgADHBUWyVnKjymyBioDM/hN1SVi0IoGD2foEiN?=
 =?us-ascii?Q?QT62BeyFNijxy2H2/jNht4QTY86dS0Sv2v63NPFxZ4rWC2ITgu7RrxLeK0mH?=
 =?us-ascii?Q?cT/PPr32WF1AzWeGmtMmoj+pcX6ND+DGNoQA5Ti4pUIlyoF/6w3tkSdIvf6M?=
 =?us-ascii?Q?oUYnzXrG6pgKPd68WWgYgRX7Vk5Zl/AzFxmHvXtxOAd+3sDP9ICvNL+wNyOB?=
 =?us-ascii?Q?pDQ1xaVHBdKEyKbjHawI1QzsX/sGnyMRmBT5CQ3xm5GtpMLsYQ+cy28/g+GI?=
 =?us-ascii?Q?TAWtFCIu7U9z79ilqO3JQCiDRNFZAR26Y94o4Rmoe9mRUJDB7Z2aNaTZxOIY?=
 =?us-ascii?Q?fs4QiZVWSQiNB4egpmz9Qognqry/9IV+teSCn+DpUhFeNp+UEXSy1dcdcv3F?=
 =?us-ascii?Q?Knp86Vgc0CZAdTjXbiiaLZ3knY4917JdZixbVWSu+I8wsMp6354KSzvow5PP?=
 =?us-ascii?Q?3JTTAs6qSFqn/MYCT/RgRXoP9DyYhh2VO8L/zrGidkwJfH9hqARjUTiXkr7n?=
 =?us-ascii?Q?9u+kBTFuOY64gbyiOAwuKyAEG2FRtH+thRiz+mu+gRIpdN/+UkgXGEXgij0R?=
 =?us-ascii?Q?4s9BOcXNdagnoCTeCGp0B7u2ZO4hXX4iTdSPSIkFaC2nEz8Xfvdx19oZikRJ?=
 =?us-ascii?Q?RMISXjQewD/PiI4yMaDay1tLKKbm4XJEWFa/M/80AqTOK74IV7/sH41gfN++?=
 =?us-ascii?Q?3oCOBXsGVrhTKPJkCciNvuUrBCWdeJaKS3SBJHLR/W1TGtX5xHspI9EFDCkG?=
 =?us-ascii?Q?IjjFFx7gkaPIt7OTUAN/SQBErFQjpVQCdF9j3WFtfKtFA5+V9Mrq/vVvOJEb?=
 =?us-ascii?Q?ultbaQLvL/U1D+L42foDGOTnzYsBKypffOYiRSK5W2xp2h4EcBNAHSyOmk+/?=
 =?us-ascii?Q?bffI1ylsxCWaTOO7X4QlPOA82eoVnAH7rQK/WamRmgf7gU6v11UHvcbFM007?=
 =?us-ascii?Q?do50zn2KunaHv+Ne1CRDDYYGNWcr11g3H+KftfXyy8OYQOTxqMm2eXd/PRv6?=
 =?us-ascii?Q?CZEAebeXM9fjKsu1nhybHGWdW2pFcClYbxpH45raG2RhjE5R6a200LPsx7W3?=
 =?us-ascii?Q?SVT7PggR2eTiVlUQ7a8RoK9eVx7N?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(1800799015)(36860700004)(82310400017)(921011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 13:07:52.0356 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a80a199-c85e-4d80-8c82-08dc8629ac47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8542
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

Hi,

This is the new version of my patch series aiming at improving the
trace events around gpu jobs.
The main ideas implemented are: trace dependencies between jobs and
identify the GPU running jobs (because 'ring' is not a unique attribute).

Changes from v2:
* dropped all amdgpu changes. The goal here is to make the gpu_scheduler
trace events usable by a tool, without dependencies on driver-specific
events
* dropped the vblank related changes. I'll post a separate series to
cover drm/vblank events later.
* reworked fence printing so it's coherent between all events.
* added a dev_index to let the tools parsing the events which GPU is
running a job. It wasn't needed before the gpu scheduler switch to
workqueues because the queue pid was enough to identify the hardware queue.
* dropped the changes to trace the "why" of a dependency. I implemented
a version based on Sima's suggestion using xa_tag_pointer but I'm not
convinced it's really useful, so I'm dropping it for now.

Open questions:
* assuming the new fence printing format is agreed on,
should we add some code to preserve the old format?
* checkpatch doesn't like the indentation in the last patch, because
everything is vertically aligned to 'TP_fast_assign('. How to best fix it?
  
   WARNING: Statements should start on a tabstop
   #82: FILE: drivers/gpu/drm/scheduler/gpu_scheduler_trace.h:80:
   +        unsigned long idx;


v2: https://lists.freedesktop.org/archives/dri-devel/2024-February/441341.html

Pierre-Eric Pelloux-Prayer (4):
  drm/sched: store the drm_device instead of the device
  drm/sched: add dev_index=xx to the drm_sched_process_job event
  drm/sched: cleanup gpu_scheduler trace events
  drm/sched: trace dependencies for gpu jobs

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_sched.c       |  2 +-
 drivers/gpu/drm/imagination/pvr_queue.c       |  2 +-
 drivers/gpu/drm/lima/lima_sched.c             |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |  2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/panthor/panthor_mmu.c         |  2 +-
 drivers/gpu/drm/panthor/panthor_sched.c       |  2 +-
 .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 88 +++++++++++++++----
 drivers/gpu/drm/scheduler/sched_entity.c      | 11 ++-
 drivers/gpu/drm/scheduler/sched_main.c        | 28 +++---
 drivers/gpu/drm/v3d/v3d_sched.c               | 12 +--
 drivers/gpu/drm/xe/xe_execlist.c              |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.c         |  2 +-
 drivers/gpu/drm/xe/xe_gpu_scheduler.h         |  2 +-
 drivers/gpu/drm/xe/xe_guc_submit.c            |  2 +-
 include/drm/gpu_scheduler.h                   |  4 +-
 18 files changed, 115 insertions(+), 54 deletions(-)

-- 
2.40.1

