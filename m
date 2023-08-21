Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B07823E8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0153810E1E4;
	Mon, 21 Aug 2023 06:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B99010E1E3;
 Mon, 21 Aug 2023 06:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHuW8B7D5NffQ/MUD/CFYlHeatIB25jfrXAEensnrzfvhizsxpt/R5kxTFh6OTbOuoXD/OrWQNX5M7EOlds9ZhzD9hQA7NegnqIAAsCrxewvbb5P3YSh2Bo3PDdjv8vrFvsgRcRicy2T16JhoPXEs1h0CJdDZFny3gQmWWYMc7HWpeGffb8/rn7IU/b/+Qmdjp6J/jAnTasX5Al1zoyS0a0sCiYricc5klpb2optZo4xqDrlbUAd15yOuZtA7ydiBOustgxMyUsGA6SE3yqFdSetiKzL7z6BUqV1LjEEOJDRVTVKPQvQFAr1yymkvWFXzCxf+x10FQJ8JtpERxio/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JbwH6VDh2xBqPLV1OWHr9bsg4AR1V/FJ7XHx0Uay4KA=;
 b=Fo1J9ClWP8dp/coz9vDh8/K/9sji9QcLQYHnfRX4J1n/ORrN0MZIaiyPaeHfoLZOeWA7mNiwOd12mAVYK/ke2ZukT9I7zvFKLmSGQaw8zBKFZggCzwAV7LBxbT/839XgLoU7mDRcc7rnYv6F4T23iTiYUS9CZzpFljtayvGZQp/vOXxF2729mFaGTBSo0bt0E130lfJ0xnO/QYdPY5udfjJHirplH7mlmBrxSSjcX3pnhhF6PuM6R2eze/FxwJz7eTrb7FXQDqnU99jn6m0Qo1u3bGYnj3dlVpp6T70qlmvBqOfjFlJLld8VESfOsPC+uljwXlWK1HxNPsJlZGTCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JbwH6VDh2xBqPLV1OWHr9bsg4AR1V/FJ7XHx0Uay4KA=;
 b=BskldcKbM4nESFQ1nVXbbirpzIBLl9yDo5PeGH59b9QC20InyV/V/xketk1HLttzgxS1gKZ8XBPzv+kx/gR9ySvGTvbHKjI9BjCiUGhsFiQqnwPAw/RRoIrlPuexOqsyoS50XG9oinz1SY826lM2/fAVwfyyEb16R6UhuODjLxw=
Received: from SA9PR10CA0019.namprd10.prod.outlook.com (2603:10b6:806:a7::24)
 by BL1PR12MB5095.namprd12.prod.outlook.com (2603:10b6:208:31b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 06:48:24 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::ba) by SA9PR10CA0019.outlook.office365.com
 (2603:10b6:806:a7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:48:24 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:48:20 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 0/7] GPU workload hints for better performance
Date: Mon, 21 Aug 2023 12:17:52 +0530
Message-ID: <20230821064759.94223-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|BL1PR12MB5095:EE_
X-MS-Office365-Filtering-Correlation-Id: e8fbc46a-df01-4dd0-80a4-08dba2129dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y2Y/3eshizVYtjjjPFH6nm71GOTftTRe89Ljy/cXt9dzf0aLtN2VgUmvyK1hgwUfIoaQaMn+cZi2qezO+qGSnB3jXf5yPiFY1tnQZfXsb+ejyPvteVzr8t6eybib63wOOPJdf0vArMOpOtcLvgwE0+nnkfpBNX6oB3HYLh5q8BfHXRAvzzfGTwYmxFfqdEg5gKKUdF1dSpk8AkGwYkS2x1xwxXK9UsKaTLqaGQp93skswsKgvOKApqSubTpUCfgk8ihtltgBxr4fPgmbGFSZqs/goCISH01gfpb/Cx6UypXWIwixhAGL/Ba4JNUVVEUwayS2YTOcJcxPbRTifTohvvgeyvsSEqYmfn2YngcooAvtu7vsTHJIWXSKBMiEB/+cG5GUTuRy+OsSQs1U738o6T+RAMw6pk954l3zUmrvVuS6TwOEsn/Dbqn0vB7wup0y/a7ySlu3oGTaj0P29EapcC+WXaFqxdqpUp+k6ls+aaN48CzfGOIEngzT7ODx7tIaLdyUKhrslFFA94LZ9PtZPONsAmQY+Ps3HCkSGA5HqFl3dXpSN9bNMvKpmOMwFYqQ/g4lmz978opeGNtaZRlVO4EcH7osFAS/CfRaKv3Lq1KwnQCTJh29Ksvp2jMjv3AahpVP24FODN+LGNLvNXQsoNlA2J6m8TYZDLB3LefBwFvPq/Z/MG6fdkRyCgDj0KbqzMEi3wZBHPhAolz1g6K1SU52GI3szKPYY0GesNRr47wUdwm74FQjkETkW9ptqjLr1CTlpM82jREHYrur2lLdLg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:48:24.0714 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8fbc46a-df01-4dd0-80a4-08dba2129dac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5095
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

Arvind Yadav (7):
  drm/amdgpu: Added init/fini functions for workload
  drm/amdgpu: Add new function to set GPU power profile
  drm/amdgpu: Add new function to put GPU power profile
  drm/amdgpu: Add suspend function to clear the GPU power profile.
  drm/amdgpu: Switch on/off GPU workload profile
  drm/amdgpu: switch workload context to/from compute
  Revert "drm/amd/amdgpu: switch on/off vcn power profile mode"

 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |   8 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c       |   5 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c       |  14 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c  | 220 ++++++++++++++++++
 drivers/gpu/drm/amd/include/amdgpu_workload.h |  61 +++++
 8 files changed, 303 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_workload.c
 create mode 100644 drivers/gpu/drm/amd/include/amdgpu_workload.h

-- 
2.34.1

