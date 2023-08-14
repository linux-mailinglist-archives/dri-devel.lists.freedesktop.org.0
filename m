Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8B277B295
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 09:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87BA10E13B;
	Mon, 14 Aug 2023 07:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A7810E13B;
 Mon, 14 Aug 2023 07:35:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCAFryYPREj5WPtxjUJOyGIEmkgh1HH0rEpYb3hcB+1FTSEEAl9TzDgUkU0j3Qbx/pKcPoXJcSlNxJ3sztFDqlE8zyIXHkRLxlqtRR1JQv/Ndk+CflZQw0E0qE8MidBfGxzuBqhRf3MGQ9R5S+zPepzR9tdMoPIkUmP+jKmw4oOsRKuTrUDr7QRZvs/3hjK5LXZaIh1UTHi/JbtjxqB/QbQXHue7W2/k8u1ga/QAGxJ9RUjsTWg31VDh/FiOQiqlpikKNod55q5yrOk7ifz4SIaAmKLrMEXkNobkgJSGdGbcFDuXblUeErREsL9xUByeg9HtkyZjx4sLEp4kXFQ7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlnwonRkXXvXp1W3si0ZM4L+5Mm9Lw8e8KVP8MmwkNo=;
 b=S6aDSXPgOM/rUlJO7Se9PDHzZDMUz9QUF7hnv+PPF/4Dijp18kWTOvqSRs460kxxNElxgJ/KVk2xYqFx4BAlmEXOcMooohU48K/nvIFDtuxJrnD6w5kfb1c6MGfOg5Nqqg4tYa/VO5s5WK62GivG4zjW6Pv9DJqqY2V7Sw4JmsjQbVMmQ5xfQEw7G9EZg3OTr8eyMD0BagmldhPAGVfc/dnSsb3P4OIvhVxVVLmX7X/eb3rLqKa/YHOXpP5oPzeW5OzQelvZlISbpiSKKEOsQ/mzFom2z8uqN6KTj3QfS3vXBnby7cmNfAfxEFzaNSJRK/iZfHgLwDUtWSAfPwLJ3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlnwonRkXXvXp1W3si0ZM4L+5Mm9Lw8e8KVP8MmwkNo=;
 b=FYy3kUIouMZHsi90/2eQbYNfccFGpVZeVOj7vOr8VSi3Lxrb8yTq+b3IdOKkXvrwgEQRmWkCA/zbyKYiSja0lA8j4NH685PfqtkETT2kr8RGUX6I02SgadMi26+QTOJa/Lvh1DZt8/UnrzG2UizBFTY5py2zr465iFzVjdFg3Xo=
Received: from CY5PR10CA0017.namprd10.prod.outlook.com (2603:10b6:930:1c::20)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Mon, 14 Aug
 2023 07:35:24 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:1c:cafe::72) by CY5PR10CA0017.outlook.office365.com
 (2603:10b6:930:1c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:35:23 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 02:35:20 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/3] GPU workload hints for better performance
Date: Mon, 14 Aug 2023 13:04:35 +0530
Message-ID: <20230814073438.10682-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 96925a9b-c7cf-46c0-662c-08db9c99055d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFgehFXpGNX/pBzBW60N4q02mvYybeLz3EYoYfW7xwIynpST9Ah06/LKH8mJ7m6o7IXMv/66ga7C6E3GKaphyCf1VIfD52NQKRr4lSqpkmaV4N9L9ER2l1WvBA+/uDHDAtYmCXQR7OvEY5jDoo5DToEu+Ceq9QX5IquSz7OUPyOQF/itcMAH0oryTv+Onbwhj1qGhzUf9HEVFNdYp1e7lUaZIHvOvjsTY6SbESfpB5QjqeIKGftxMEKiVjdTaJMYwch9aCZ6cMzrHZqdmbs6VCD8jHWNAcfKOrEu+pHHOsx/2nC1CWOlujICCmKn+I14+qnuwQF3oMReYZpkB0xBZY+WjZ2FkaaRTGMM97snASWsPo1IiPaem0Alt6fc7wRTEOeVDt7P3ZkGdt7vaphOVeafWsJFOD1jEiKRYqFP+ypvMwncH57lSQTW4LjuwyDKo+II+rItcdLC4Fc+dNkZ78PSjh49rlzInTLbuioaiVQoBUClmzgOU7Y64DJhq1Qzf1ncqJZqt8ghr70MMVsAEMW7C8FTyInwDzn+9+fkpFFdDneTSo7iCoK+KJ8srxUauWrCfZxZoo5/TJqh3hUbjhigBknQdI3DznNLYKIGWzCzbp2jGkt0EXO1GD0dl9S/eca+Lrqf7IZIWC9rwtCgGJenhkHmlx0FJPXNBrWgjG6+ZNpa7OTqZ6ErlkttkXuIBlHrC/falkOPOCbzRMym6HbBeoXKujwcPLBLPu7LQk11lHUgEKqVCFd3f6W2I12OVY9UZtyQ7tu6Zik7qHQ2lw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(1800799006)(186006)(451199021)(82310400008)(46966006)(36840700001)(40470700004)(6666004)(7696005)(478600001)(83380400001)(2616005)(1076003)(336012)(426003)(26005)(16526019)(2906002)(316002)(41300700001)(110136005)(70206006)(70586007)(5660300002)(4326008)(8676002)(8936002)(86362001)(40460700003)(36756003)(47076005)(36860700001)(40480700001)(82740400003)(356005)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:35:23.5900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96925a9b-c7cf-46c0-662c-08db9c99055d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

AMDGPU SOCs supports dynamic workload based power profiles, which can
provide fine-tuned performance for a particular type of workload.
This patch series adds an interface to set/reset these power profiles
based on the submitted job. The driver can dynamically switch
the power profiles based on submitted job. This can optimize the power
performance when the particular workload is on.

Arvind Yadav (3):
  drm/amdgpu: Add new api to switch on/off power profile mode
  drm/amdgpu: Switch on/off GPU workload profile
  Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"

 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 156 ++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  44 +++++
 7 files changed, 213 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h

-- 
2.34.1

