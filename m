Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB13378B010
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 14:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871CA10E2A5;
	Mon, 28 Aug 2023 12:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C51AA10E2A5;
 Mon, 28 Aug 2023 12:27:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RF4ys2mb19ehBfSiAvyRUm2mZ8Uh+1F5IHmi+OXbH+LQRDsEct4dz1he1I2UgLuNBvSs+nTV7MV514oXuKiYPRmIhsjUDV2tGdF/8GP1X6AJmbkgPfz6wnmKMjJd4xo8Rw7L0+6y212RT41oDrQrvTTA4AqZ1AypgJ/IKwJinXE41Lof5rPtcUqi4CUNID6pJJv8BLSSZgaVGkc6gGwkv87G9E6cpxS19l1C7Kj2av8c4irhllBCMVd8Hr6RTpXU1XTJTRkL3kn70GwhHO3pj0tRPQG0VBV5gi+AnKP3cGTQBU0YYY6fyO57itvGOb0GQvDmThdhMbopaOhojrmRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WzLBkFEq0P/CGAn96QF99owWXAxiiXnVdVXF6XaNkg=;
 b=RRhrF4AKXIEGWhxIdz2MlA8wn9ZfaN7fiuMZmZgE2xI0Ra5sgYmWIBlexSNXsirVuj4p+qddxHAXEsTYhxB8fXWP/0It/3yllnkWu/tEq9zBhLz8/s3/8ZaRYKlBcE7qAJisfgIsEQm2eEpxjox9wGxCcXDXt6aLOCINvqRdqBvPYEsk1zemc587ovEntbbv0roM7MH73FXR659P0uVSeUdRkt8x3AH7zCFiH+/mhyF1fSvhAWI8/Navrzc4BT54lRD79EAvHHikWFx0iUQtg9KyXboUhWtDpJCbuze6Uv8zgvWpoT6WMme7vpVjgQ0/CoCcA0nM1VfXDs0qvKA6Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WzLBkFEq0P/CGAn96QF99owWXAxiiXnVdVXF6XaNkg=;
 b=bbX5YzbCQHiOF99w/1exQmHpR2YUfImchZQI/hmvT6XcAKYbEG5AdZAYLUzjDdV8SNHo6Sa3TVtuL7w46hJiav4mqBFyujoUG8z2nXfXbIwfDefJJtsmiIizXPEZarWQnnVz6axNpO9Y/atwuQT9WRDN/ZUvhOLheGVRIklaQE0=
Received: from CY8PR12CA0034.namprd12.prod.outlook.com (2603:10b6:930:49::22)
 by SA3PR12MB8024.namprd12.prod.outlook.com (2603:10b6:806:312::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 12:26:58 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:930:49:cafe::de) by CY8PR12CA0034.outlook.office365.com
 (2603:10b6:930:49::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Mon, 28 Aug 2023 12:26:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Mon, 28 Aug 2023 12:26:58 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 28 Aug
 2023 07:26:52 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v3 0/7] GPU workload hints for better performance
Date: Mon, 28 Aug 2023 17:56:07 +0530
Message-ID: <20230828122614.3815122-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SA3PR12MB8024:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f97efe-1d3b-4f83-d7b5-08dba7c212fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGcrCefQo2Ph7swI7VI+g0lPc45giauYZJBomD66ApLxb9h2G4e9IbYkNzDrxm6v4cw7LEwiWreBkcX/xqHh3Fb2lKyLxyFclIkMFjt3z/XRGciV9xeQAj3oyG+mu5f4UC2B4I/gzErzyNgf30KaJEyXLXNjZzUECz0HvVth5hhsw8rFcQHXXVXoo+s9fRP3YSp4p/V9xlXt5IRqTPJ+3FoNSc8NKmmG/yS1UMwZPPIcVSUBqaFPOIuyBnjClLQiJVzw1yZpSW9jmnydHc//Vp6Xln2MdqM32zVF1zRk+UhPAOpwzc+g4x7l4DG96Qesm/RXHI2Q2nJ2Qw/29tOtZ9vXdlnykpFiUXMRF5dx8T/UH0wUiZoQo+QqSFiCH2JdVoG0+kMcdBOK5LdN7ngKXR0/5P9YMeEL03xls8nPk/hnRhZCrh7kYoxWAObBx+w5y3WVMZu3o4FJNDioQReHMCXYThVaTtwoBFWNsVZyVduV2rHpEpykl4rFbGVgxk7B8onjPc2Okst0m2aYvO66JgJdz7StcSZIxd5AdV9NQ72hZtmZu5cYyFwiwsTHOTtJRcEyNfy+kbty/6J8vGDn/Zk8L2KAhmf1JIGiJ71rDRIWZrykjonCzrOvIaROLpjMq1k1vksBOJYTBSRnTSxP9+m6aElrNhs9CBKc4KeSXYqNneQWLp7rOFsMxleytDYdUQQxwhuOuyMLjEmcWTAuwm0rHMjlSQA2WMg4/IQONwWnTwwHdZP9VBcdvIqbPDcZgNn11xDdKZfZWlydeug+nw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199024)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(356005)(478600001)(81166007)(83380400001)(82740400003)(16526019)(26005)(426003)(336012)(47076005)(36860700001)(1076003)(2616005)(40480700001)(7696005)(110136005)(6666004)(86362001)(5660300002)(2906002)(316002)(8936002)(4326008)(70206006)(36756003)(41300700001)(54906003)(8676002)(70586007)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 12:26:58.6083 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f97efe-1d3b-4f83-d7b5-08dba7c212fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8024
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMDGPU SOCs supports dynamic workload based power profiles, which can
provide fine-tuned performance for a particular type of workload.
This patch series adds an interface to set/reset these power profiles
based on the submitted job. The driver can dynamically switch
the power profiles based on submitted job. This can optimize the power
performance when the particular workload is on. 

v2:
- Splitting workload_profile_set and workload_profile_put
  into two separate patches.
- Addressed review comment.
- Added new suspend function.
- Added patch to switches the GPU workload mode for KFD. 

v3:
- Addressed all review comment.
- Changed the function name from *_set() to *_get().
- Now clearing all the profile in work handler.
- Added *_clear_all function to clear all the power profile.


Arvind Yadav (7):
  drm/amdgpu: Added init/fini functions for workload
  drm/amdgpu: Add new function to set GPU power profile
  drm/amdgpu: Add new function to put GPU power profile
  drm/amdgpu: Add suspend function to clear the GPU power profile.
  drm/amdgpu: Set/Reset GPU workload profile
  drm/amdgpu: switch workload context to/from compute
  Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"

 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 226 ++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  61 +++++
 8 files changed, 309 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h

-- 
2.34.1

