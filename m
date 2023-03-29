Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D76CF611
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 00:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F5410E1A3;
	Wed, 29 Mar 2023 22:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF58110E199;
 Wed, 29 Mar 2023 22:01:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D62r01uoqVZXDWTPMG19ray6+MVCAbXmKU7Ldf7V8H0iFzBNoUJCrIffImAgnwraP7htIIhGuzFYKO+cNIR/lFGB1sCg0m4lXJIjbGUyq6FMwWQwoYWddLxyb/mzgVSod0rASzwFt4vtRjlTLKrNxAssfu04MgFJx89Am/Qv9HKwP205gSqjxhm34g/2BukRh2ngbIzqItjD2EnR7365vFbspHnO32iqiBNbz1KDzF+wSVh8bwAuoJ6IxS+860Ce75RfWeXuMJ0jt9+/UYvKipJwyQ9pNKohP93ta7afHDjxhcPdryqPjnhSo2jm8VIUCrkZY+I4mwRZDovHqJ2uww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ZePqlh73OZNe2RJOYDVumPZOnRQhw+S5gN6D3l1Hdo=;
 b=e4f8kUzgd1uEBXyrYQ5Y5RvOwbRyNS4EVS6Ia3nXJzQJqcwzsje7p6fI3FjuEimsibcXNJqyZGeeyRiNlfmKB2O1YrpSUgENM6XTEoQTh8w2KhPfB2sdvcGbEV5UsEjToutjUJoPRu2x2jEu/5KvwSIgia8f2iO9rY/F/FtWuB5AByUUj0ljuPq8hgfDk2L6QaYWGVGpjFoonYJvwEqzhWBrg+/Kds6qNnJv8RDH92GKCVXPclYngFTg4/kVX4UM0MxtZaSfVuPR2z04mQTFvGidyf+0iQStHdd5AC2vMbqF+rNEhH04tyEXZ28g7jSfZsgovEIt//HDAeboZ5My6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZePqlh73OZNe2RJOYDVumPZOnRQhw+S5gN6D3l1Hdo=;
 b=Wh0o/0Ff8w1fZwPG1qXqSMEk7GbN7YB1PpfGLAc1rhMRxCNCn/pvBLybVQah74Y8CM3s3n0OOn5PePVJZdwc38T0ipMyRJ6kjr+aL7uigTGUpskGUGLvz0zPfb1NQm48OzTWUD30ud5zKLYS39wMovZ+F3NWuFTI7Kqh+CPURKY=
Received: from BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::19)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Wed, 29 Mar
 2023 22:01:14 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2c7:cafe::b2) by BL1P222CA0014.outlook.office365.com
 (2603:10b6:208:2c7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 22:01:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Wed, 29 Mar 2023 22:01:14 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 17:01:13 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.3
Date: Wed, 29 Mar 2023 18:00:59 -0400
Message-ID: <20230329220059.7622-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f7f361-0534-4ee2-4a5d-08db30a11d82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i7vDBVxUMsksfL6x5n4aktS3YYgipODCkm6BzXAqAofDbxt/raUdVU7Ya08Bgy0fSHiQlko7aYpOwxkTlE4hQnsmhlDcHfAoajFFVjoQee+86ZjZP7vNz8jZQLucAzZchzd2um7Z2veEb2p9QC7x+LtrX/50WyAPjmYh2lSOGPea8bwtUxQaA8pxwsKgH+WxeKmi91JslDXH/eRO/01yVhC8VIn/k++QcbkG5L3YLU6WRU7rIPImeHw0WG4PDnTSEYciLFtlFimEXIfV2cOswUl4NT+KhvplG71j/nywvOIhuTJf8wgpczNIV+YbeNIKvkFW3Vie57UPh3wQdWjEX00VJ5SPl61CCOgxDdnOs7u2GIrG2PbJSXyMLWgeEYQOo9y5nf2va6Hrx3125/7QkWOyhbAzEPrSZhVA6IUJmw+NKwFS1ihQ/I/A8Hm2dbuxTYwCDvP/88r/S+M0RkESawHk5Z48giCXo3YS8FogyeQ6deKS6CR8H7EqRYwgo6ZPZ5z84CFkX8y8vcolsD+as2V2TJZfM+p0xXn5agKDRVYLVH8/wDoKNa2MB4b0aEk0tcZr0oBQzYbgfQnlHDbeV8RuuiQr8OrVu5L8na1FKzdwZSSt5Z6dOjKaYqoEtFLTOg80tB9YheHRpk8KmV6F9qGUSzGwqjC42RJoT79gAfNbCc/ow/fl+QIQzjYJO01z
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(966005)(7696005)(478600001)(110136005)(40480700001)(6666004)(26005)(1076003)(316002)(8936002)(70206006)(16526019)(70586007)(40460700003)(8676002)(41300700001)(81166007)(2616005)(82740400003)(4326008)(336012)(4744005)(36860700001)(36756003)(83380400001)(2906002)(5660300002)(82310400005)(186003)(426003)(86362001)(47076005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 22:01:14.5533 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f7f361-0534-4ee2-4a5d-08db30a11d82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Fixes for 6.3.

The following changes since commit 197b6b60ae7bc51dd0814953c562833143b292aa:

  Linux 6.3-rc4 (2023-03-26 14:40:20 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-29

for you to fetch changes up to 68dc1846c3a44d5e633be145c169ce2fd5420695:

  drm/amd/display: Take FEC Overhead into Timeslot Calculation (2023-03-29 17:21:06 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-29:

amdgpu:
- Two DP MST fixes

----------------------------------------------------------------
Fangzhi Zuo (2):
      drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
      drm/amd/display: Take FEC Overhead into Timeslot Calculation

 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 51 ++++++++++++++++++----
 .../amd/display/amdgpu_dm/amdgpu_dm_mst_types.h    | 15 +++++++
 2 files changed, 58 insertions(+), 8 deletions(-)
