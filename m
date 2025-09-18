Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F14B86A40
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 21:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1DA110E0EC;
	Thu, 18 Sep 2025 19:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rmpGD1Hc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012002.outbound.protection.outlook.com [52.101.48.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C112510E0EC;
 Thu, 18 Sep 2025 19:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzeOqy7TPaFmdwTHa+dS/m0qIwDmkupBZykcVPt+9Jii0dmqvwiiD9JMLb1pvi3ehqfYK4mHoqhsDR+4fbU2YqRrPrJYqgXgUmuAM9LR8ZiZBgPvdKfwu6PC2VYZaSqFZPmbFM9elNoq9HbZuRXnlxj/w3eaMCLFr/zxxnhVjInYpU08nlfyGeahOXqEiikKdycYfDChdpGnaFuu+fjFlVfrBQMT27RmzbaTrCxpFER1z3+835uNACpKC8v2JlT4ETDpTOsj6PW0dxdF2NdqWKSgH7bOeerpqX8+rFQmwjv44as6jQ+nDaah25A9Lz2KP+StVLNSM7eY5u+hm87llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUQskEYAwsydPRAOqdiuIEIbGbsZz1MCMrdBJdVjHnw=;
 b=w17PrUw4oPVzetQ+IwmVAzVrE0qD2XwMZ0nBenPFmXf8mfkKxr6IWLtB6CrcG6h6BK3eMpD2w5qOEzHpGCU4W7xK0lWNNXTcGko6xqMj47KqelIdTmMbqx8Z8xpB/Q9RAlU1yPF7TcNN0ZBncKo+Sq8cuw7AkPPS3OPPU+We9RBYLsBH5Ola0aWJ/cWv1B2seLZBT/uN9m/UUgDGBEwjlmsF8AGRQnizWl+r366VAppSrANmxhBYRVo1MmXiRJ2qY8o70t69JFkJh70t81yuIhbVfjk/pDAdZCjd9PzVLIFokbMOgmdt2AAWiylGnbbuQ2Dg76zyI2PuKglDZF1y+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUQskEYAwsydPRAOqdiuIEIbGbsZz1MCMrdBJdVjHnw=;
 b=rmpGD1Hcep1iUWwVjPRo5rPqyTstGy0Wn1kggYtKFPHa+H3+CoQ+f1nOiZndvIl8w6Lstxj1eh+iEpUxUTNOtfAuKzVzOwRyA2CBlbq6Wy/Q2HWLZBIW2Q0HI/3qfJjDfBr3muEcWLkUvnx96Gtqf6wS8iv6JE3XT7lpgi3xVII=
Received: from BYAPR07CA0058.namprd07.prod.outlook.com (2603:10b6:a03:60::35)
 by SA5PPFA403A61D8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8da) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Thu, 18 Sep
 2025 19:14:44 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:60:cafe::3) by BYAPR07CA0058.outlook.office365.com
 (2603:10b6:a03:60::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.15 via Frontend Transport; Thu,
 18 Sep 2025 19:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 19:14:42 +0000
Received: from tr4.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Sep
 2025 12:14:41 -0700
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <simona.vetter@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [pull] amdgpu, amdkfd drm-fixes-6.17
Date: Thu, 18 Sep 2025 15:14:28 -0400
Message-ID: <20250918191428.2553105-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|SA5PPFA403A61D8:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f114c6-db09-40dc-4df1-08ddf6e79f79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mJe3f9LSCyBkL8nuvl8WOErbHxlLKj+fKnAyruJ+sCGhfRDBSZvSrlxdBIN4?=
 =?us-ascii?Q?+v69fvKB/fjjORamy98mtGUKZYViFDEi+MXr9mrPJ7WcnBmqfjvbrd5STXHG?=
 =?us-ascii?Q?yjyoNoLbbdZc46RbY6r2g49v/c9kCzI9kDJs9jlODVU3FInP4EmZgZiGuxze?=
 =?us-ascii?Q?FJKno558wmGcZDBxXRBbTEiaN2qaBrs8fGsZLiXTqprj5tC7TitG6ksVRkQW?=
 =?us-ascii?Q?MLsk6F8D9G7H4Ed5UlnxaGV2MO3HtjYCKtnWo9gZ65lcrSokM5b8vJANibzA?=
 =?us-ascii?Q?Ms9hkIJrwIbslXAkGiFtXTi9zWGrWLDGNIZgO2D4yt/S3sFmD330Ecgh2ZQA?=
 =?us-ascii?Q?Fgky4QUgIaCZuo7JBwgGurLmXONpAh+Kj9rExeVveWWTu+iox69bpsVDS1b2?=
 =?us-ascii?Q?4pej5UOLta7IViU0fZLVA1bl9Yc0YxsWeRbflBYnX0zuPf0noBLJS9f9dzfF?=
 =?us-ascii?Q?FaF7kNudK/IFf2KoQNDWYqik/1FOtGVMZYg1ZDi9C/PTM/KmFw4KenVSqHEI?=
 =?us-ascii?Q?DvQvsvh4MRDszpw8BDlkhncbTGcG9QkZpFnPDUTjjZ0CWKWnQMA3lWoIrHyK?=
 =?us-ascii?Q?n4PC527AxnN0ECDkTGTRTz7aXhIi7faNUcOzsLEsO6b5p/u+LisE4hu5gv8z?=
 =?us-ascii?Q?Jy0S4syzzmblvNb0BbWcwY4YdJO/ZTs8ThzetrBy4FsLq3YNn9FS8PZskIhd?=
 =?us-ascii?Q?Mmjy6Yj0+iinL2eEI3+jCcVUhyDtgdBFnVXhg47FGUxFQW/X+BxAUOTNl5X+?=
 =?us-ascii?Q?eb0hTDZa9GP0VgXt/kbnjAgpjiRySl0jLAv2NPWYTUfJ5uIBRkRwsLQy54ut?=
 =?us-ascii?Q?FSrN8FAeus+f0kTe/fDxv/OeDmEmkwZWHwcRjJ/YmmRoGpusn6i/SQeiSdcz?=
 =?us-ascii?Q?8bt+9utXoyBhBB7plW9BiWQVgC2FsOHzL0RrpCo0hTrY+WNTm+ipFLlpvYXg?=
 =?us-ascii?Q?9XadRkw2/ho/FL/OI57nRnArkckr5Pdd2pNa+zrWV7VkE/ICOqVU0N5Zpo1a?=
 =?us-ascii?Q?Z8k0/9zOiOyjL55FnUb6iuvE5lDmKSnLRTMmYcxjdI9gJdsXiSFceRAZDjqd?=
 =?us-ascii?Q?Ir88L66ZgenoFj03FqIxQ+MiGmazzDZdkY4AN71bUG+z2rgFQRxoW0VLpVGm?=
 =?us-ascii?Q?gn71Ewvy5d+2Khe6slkr4jIP6FOC0nmL5RN34yxQrpvex5QB81HODdSscqjv?=
 =?us-ascii?Q?4W1EKD3QVJ/wcV456ufxVNSN6CdzOfD69peVShuhOnhZlwLQ2xMYTexdnh8B?=
 =?us-ascii?Q?uVfEkH9/t+PjFnQHNfr+HrZ2cUOiH11xLAbMS0xftdGjKdmSGJ6MUJ6KuadL?=
 =?us-ascii?Q?n059mDVX50PC0t/jXNAOV0NSC73OpN3fJe63gTgV2hp2e6GuKdU4H6Zw/yjv?=
 =?us-ascii?Q?CSQIr07Hg8QUTijXOofhiq1VW6zDWEt9w7yN9eS25ZLHnMJ9vEu61+YWf9Fv?=
 =?us-ascii?Q?G5tDIS8nh4+VyxuxeN/E0rUXnGo1OT4dkIX7AMqwU1nTD7OjBVcmDw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 19:14:42.8549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f114c6-db09-40dc-4df1-08ddf6e79f79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFA403A61D8
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

Hi Dave, Simona,

Fixes for 6.17.

The following changes since commit f83ec76bf285bea5727f478a68b894f5543ca76e:

  Linux 6.17-rc6 (2025-09-14 14:21:14 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.17-2025-09-18

for you to fetch changes up to 9272bb34b066993f5f468b219b4a26ba3f2b25a1:

  drm/amdgpu: suspend KFD and KGD user queues for S0ix (2025-09-18 14:59:41 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.17-2025-09-18:

amdgpu:
- GC 11.0.1/4 cleaner shader support
- DC irq fix
- OD fix

amdkfd:
- S0ix fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdkfd: add proper handling for S0ix
      drm/amdgpu: suspend KFD and KGD user queues for S0ix

Ivan Lipski (1):
      drm/amd/display: Allow RX6xxx & RX7700 to invoke amdgpu_irq_get/put

Mario Limonciello (1):
      drm/amd: Only restore cached manual clock settings in restore if OD enabled

Srinivasan Shanmugam (1):
      drm/amdgpu/gfx11: Add Cleaner Shader Support for GFX11.0.1/11.0.4 GPUs

 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c        | 16 +++++++---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h        | 12 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 24 ++++++--------
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c            | 15 +++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_device.c           | 36 +++++++++++++++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 39 ++++++++++++++++++++++-
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c         |  2 +-
 7 files changed, 124 insertions(+), 20 deletions(-)
