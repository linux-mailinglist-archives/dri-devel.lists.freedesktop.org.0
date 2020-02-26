Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5216B170839
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 20:02:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D75F6EB8E;
	Wed, 26 Feb 2020 19:02:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770089.outbound.protection.outlook.com [40.107.77.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C30F6E107;
 Wed, 26 Feb 2020 19:02:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUd7FZFPRa4DaajCnSaFWGTU06rentfzDce/MiwbEXtpPNi0HD7JxEAS7DikANen72JvckZW3M9oSbxjjH9Gv7H9tRGllaZAb6URfBn7PowV3P0K21HDjEu/VW+8WTSsfjMm2djI/YLJSVXmkt+hqTyeRkDuBrQXywO4V6fVU07SjrSnlkN5KU93d8VkWO1XofJHolNvYztUjHKHPEa6yisKrtX4lU3BfjWXkloQHF0g6w+c+d3x0a3FFQWjZRabiCbdTnQ9960ZU7M9IRNtgEkY11l1CID9WCdOPQOgc2Lvs4jhMno0HLu494IJXw0I4/TYeda1nxksz8oT/zh+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbd1SlHF0GT3rkAKka7pQv0vq0zGroXvz/Uf3xVD+j4=;
 b=erOqMn5Dxo9ljojFSkWAUwvDIpZc1AFZo86GhpDh8i8L3ENqN3bS1nD81SBpHbNfN6j23gPKlOxDiTUoArIHiiUHM7M/wYPzt3ZVntpaBpyZ7ntoqEkL5ATCiBvHXvkOY0YIowzmOhZDuYu8pI03yCJ/ssztmW3ZeboHVCU0gAFYG6p2NdlpfWYhIWY10HmfMW8fTlVOYE9Lgr9ZJl71C4RZnBdcIq9MHikw38eJGsxyl/bs8uyeMxoIwBPTaPm1gIbGREhW1iTIygFpYIoIVStHtAogFWdGROVcBZIyK2TgkHHn+blORd6yTBHH2u/VeUEc/IYHTan923iJPYMrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbd1SlHF0GT3rkAKka7pQv0vq0zGroXvz/Uf3xVD+j4=;
 b=1PqKup73YTPJxMOXE9gWf+Bq0e+Jnmns5X91AzIocvorV0H+Xer9QWdH+vhxV3ytn4JMinqc2Ei6k2yXshtHmPFBs1s7pFncngKWpapXMvkyyG8Ev/3fM/Cs5BXoKJy03W1VqJlIaFU2MVEVjLJvve7bKLVoIs5C1hjX9VViQc0=
Received: from MN2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:208:134::48)
 by SN1PR12MB2591.namprd12.prod.outlook.com (2603:10b6:802:30::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.21; Wed, 26 Feb
 2020 19:02:04 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:208:134:cafe::34) by MN2PR16CA0035.outlook.office365.com
 (2603:10b6:208:134::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.14 via Frontend
 Transport; Wed, 26 Feb 2020 19:02:03 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 19:02:03 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 26 Feb
 2020 13:02:02 -0600
Received: from yuho-zbook.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 26 Feb 2020 13:02:01 -0600
From: Kenny Ho <Kenny.Ho@amd.com>
To: <y2kenny@gmail.com>, <cgroups@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <tj@kernel.org>, <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <felix.kuehling@amd.com>, <joseph.greathouse@amd.com>, <jsparks@cray.com>
Subject: [PATCH v2 00/11] new cgroup controller for gpu/drm subsystem
Date: Wed, 26 Feb 2020 14:01:41 -0500
Message-ID: <20200226190152.16131-1-Kenny.Ho@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
References: <lkaplan@cray.com; daniel@ffwll.ch; nirmoy.das@amd.com;
 damon.mcdougall@amd.com; juan.zuniga-anaya@amd.com; hannes@cmpxchg.org>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10001)(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(428003)(189003)(199004)(966005)(2906002)(81156014)(478600001)(7696005)(86362001)(426003)(6666004)(5660300002)(356004)(4326008)(36756003)(336012)(81166006)(8676002)(8936002)(70586007)(1076003)(316002)(186003)(26005)(2616005)(110136005)(70206006)(921003)(1121003)(2101003)(83996005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR12MB2591; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197d4d04-7c3b-4d99-20ad-08d7baee5dde
X-MS-TrafficTypeDiagnostic: SN1PR12MB2591:
X-Microsoft-Antispam-PRVS: <SN1PR12MB25912CBD2DE472770F97BE6883EA0@SN1PR12MB2591.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0325F6C77B
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DevkaLxOgJfhuT+lGFEeKI1RV+L06kV1msSCEQ3Fz+TAf3YYUiSb5V7GPze35dixn4CLlfp9kwJHcr3IvZ63Fw7DI9tlzBC0hcNIgF5Jfw/A+bfIBbBgQDozjkCU7T/ICCVr5KNsXKFAqvaVt4t0ZYReroAfyQiTutQqrkax7zyniZNeJ17Nu1XEljjTZkgmWq4Rko7/B66Uk4w1SKh9VpqbEi8H4OE8W3nJAyr5aEnYgAMn+Mi+hBG6M7LWXLAqJQl2cQ2Ymkq25ewE962K6hbHJaqDk7bveDuNE9pk15xqX/eTI1RXfzcgSpNEb7vREiK1ahYNDAgSfRfa8Ecs60nCDbdBLeYBMp2mjBVd5QkuHrsTa/wteSJTPEFmo0vItS2JSySyXIAg0zan6TfSRAVmByVuofLhxX6OgXj3m7B3qv5hR2whmitS19sgoD1N0ctPFJc8FuIjLcsvJqUHOvtfqLbZGq7dFd9rfbQG4mmv9yIu9bWK2+UCbOpHVL14But8WlXbwN2JznUL6eYD1KvC/5Ujp/PHDat/x0c+80/tbb5TIjvS/mGm905XGWUYcGyjO9U/ca1ZiPuq2lJ4YNpBU91+dq4Zh/yLuMZyLBccNiCoZdwQyvRO0CRrfIMB1DPH8VEP/gDLxyfCGAqlT6vB9I1mL/NiwTBH0Wl70vYr2adysJKYyUfUNG6nAU5g
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 19:02:03.5596 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197d4d04-7c3b-4d99-20ad-08d7baee5dde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2591
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
Cc: Kenny Ho <Kenny.Ho@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a submission for the introduction of a new cgroup controller for the drm subsystem follow a series of RFCs [v1, v2, v3, v4]

Changes from PR v1
* changed cgroup controller name from drm to gpu
* removed lgpu
* added compute.weight resources, clarified resources being distributed as partitions of compute device

PR v1: https://www.spinics.net/lists/cgroups/msg24479.html

Changes from the RFC base on the feedbacks:
* drop all drm.memory.* related implementation and focus only on buffer and lgpu
* add weight resource type for logical gpu (lgpu)
* uncoupled drmcg device iteration from drm_minor

I'd also like to highlight the fact that these patches are currently released under MIT/X11 license aligning with the norm of the drm subsystem, but I am working to have the cgroup parts release under GPLv2 to align with the norm of the cgroup subsystem.

RFC:
[v1]: https://lists.freedesktop.org/archives/dri-devel/2018-November/197106.html
[v2]: https://www.spinics.net/lists/cgroups/msg22074.html
[v3]: https://lists.freedesktop.org/archives/amd-gfx/2019-June/036026.html
[v4]: https://patchwork.kernel.org/cover/11120371/

Changes since the start of RFC are as follows:

v4:
Unchanged (no review needed)
* drm.memory.*/ttm resources (Patch 9-13, I am still working on memory bandwidth
and shrinker)
Base on feedbacks on v3:
* update nominclature to drmcg
* embed per device drmcg properties into drm_device
* split GEM buffer related commits into stats and limit
* rename function name to align with convention
* combined buffer accounting and check into a try_charge function
* support buffer stats without limit enforcement
* removed GEM buffer sharing limitation
* updated documentations
New features:
* introducing logical GPU concept
* example implementation with AMD KFD

v3:
Base on feedbacks on v2:
* removed .help type file from v2
* conform to cgroup convention for default and max handling
* conform to cgroup convention for addressing device specific limits (with major:minor)
New function:
* adopted memparse for memory size related attributes
* added macro to marshall drmcgrp cftype private ?(DRMCG_CTF_PRIV, etc.)
* added ttm buffer usage stats (per cgroup, for system, tt, vram.)
* added ttm buffer usage limit (per cgroup, for vram.)
* added per cgroup bandwidth stats and limiting (burst and average bandwidth)

v2:
* Removed the vendoring concepts
* Add limit to total buffer allocation
* Add limit to the maximum size of a buffer allocation

v1: cover letter

The purpose of this patch series is to start a discussion for a generic cgroup
controller for the drm subsystem.  The design proposed here is a very early 
one.  We are hoping to engage the community as we develop the idea.

Backgrounds
===========
Control Groups/cgroup provide a mechanism for aggregating/partitioning sets of
tasks, and all their future children, into hierarchical groups with specialized
behaviour, such as accounting/limiting the resources which processes in a 
cgroup can access[1].  Weights, limits, protections, allocations are the main 
resource distribution models.  Existing cgroup controllers includes cpu, 
memory, io, rdma, and more.  cgroup is one of the foundational technologies 
that enables the popular container application deployment and management method.

Direct Rendering Manager/drm contains code intended to support the needs of
complex graphics devices. Graphics drivers in the kernel may make use of DRM
functions to make tasks like memory management, interrupt handling and DMA
easier, and provide a uniform interface to applications.  The DRM has also
developed beyond traditional graphics applications to support compute/GPGPU
applications.

Motivations
===========
As GPU grow beyond the realm of desktop/workstation graphics into areas like
data center clusters and IoT, there are increasing needs to monitor and 
regulate GPU as a resource like cpu, memory and io.

Matt Roper from Intel began working on similar idea in early 2018 [2] for the
purpose of managing GPU priority using the cgroup hierarchy.  While that
particular use case may not warrant a standalone drm cgroup controller, there
are other use cases where having one can be useful [3].  Monitoring GPU
resources such as VRAM and buffers, CU (compute unit [AMD's nomenclature])/EU
(execution unit [Intel's nomenclature]), GPU job scheduling [4] can help
sysadmins get a better understanding of the applications usage profile. 
Further usage regulations of the aforementioned resources can also help sysadmins
optimize workload deployment on limited GPU resources.

With the increased importance of machine learning, data science and other
cloud-based applications, GPUs are already in production use in data centers
today [5,6,7].  Existing GPU resource management is very course grain, however,
as sysadmins are only able to distribute workload on a per-GPU basis [8].  An
alternative is to use GPU virtualization (with or without SRIOV) but it
generally acts on the entire GPU instead of the specific resources in a GPU.
With a drm cgroup controller, we can enable alternate, fine-grain, sub-GPU
resource management (in addition to what may be available via GPU
virtualization.)

In addition to production use, the DRM cgroup can also help with testing
graphics application robustness by providing a mean to artificially limit DRM
resources availble to the applications.


Challenges
==========
While there are common infrastructure in DRM that is shared across many vendors
(the scheduler [4] for example), there are also aspects of DRM that are vendor
specific.  To accommodate this, we borrowed the mechanism used by the cgroup to
handle different kinds of cgroup controller.

Resources for DRM are also often device (GPU) specific instead of system
specific and a system may contain more than one GPU.  For this, we borrowed
some of the ideas from RDMA cgroup controller.

Approach
========
To experiment with the idea of a DRM cgroup, we would like to start with basic
accounting and statistics, then continue to iterate and add regulating
mechanisms into the driver.

[1] https://www.kernel.org/doc/Documentation/cgroup-v1/cgroups.txt
[2] https://lists.freedesktop.org/archives/intel-gfx/2018-January/153156.html
[3] https://www.spinics.net/lists/cgroups/msg20720.html
[4] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/scheduler
[5] https://kubernetes.io/docs/tasks/manage-gpus/scheduling-gpus/
[6] https://blog.openshift.com/gpu-accelerated-sql-queries-with-postgresql-pg-strom-in-openshift-3-10/
[7] https://github.com/RadeonOpenCompute/k8s-device-plugin
[8] https://github.com/kubernetes/kubernetes/issues/52757

Kenny Ho (11):
  cgroup: Introduce cgroup for drm subsystem
  drm, cgroup: Bind drm and cgroup subsystem
  drm, cgroup: Initialize drmcg properties
  drm, cgroup: Add total GEM buffer allocation stats
  drm, cgroup: Add peak GEM buffer allocation stats
  drm, cgroup: Add GEM buffer allocation count stats
  drm, cgroup: Add total GEM buffer allocation limit
  drm, cgroup: Add peak GEM buffer allocation limit
  drm, cgroup: Add compute as gpu cgroup resource
  drm, cgroup: add update trigger after limit change
  drm/amdgpu: Integrate with DRM cgroup

 Documentation/admin-guide/cgroup-v2.rst       | 138 ++-
 Documentation/cgroup-v1/drm.rst               |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |   4 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  48 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    |   6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |   7 +
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |   3 +
 .../amd/amdkfd/kfd_process_queue_manager.c    | 153 +++
 drivers/gpu/drm/drm_drv.c                     |  12 +
 drivers/gpu/drm/drm_gem.c                     |  16 +-
 include/drm/drm_cgroup.h                      |  81 ++
 include/drm/drm_device.h                      |   7 +
 include/drm/drm_drv.h                         |  19 +
 include/drm/drm_gem.h                         |  12 +-
 include/linux/cgroup_drm.h                    | 138 +++
 include/linux/cgroup_subsys.h                 |   4 +
 init/Kconfig                                  |   5 +
 kernel/cgroup/Makefile                        |   1 +
 kernel/cgroup/drm.c                           | 913 ++++++++++++++++++
 19 files changed, 1563 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/cgroup-v1/drm.rst
 create mode 100644 include/drm/drm_cgroup.h
 create mode 100644 include/linux/cgroup_drm.h
 create mode 100644 kernel/cgroup/drm.c

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
