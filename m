Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A77BA7CC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 19:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4B10E477;
	Thu,  5 Oct 2023 17:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2041.outbound.protection.outlook.com [40.107.100.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF93E10E476;
 Thu,  5 Oct 2023 17:20:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcZjjbTmWmemmoN8iOmJbkROjByiLp1qqi4yUL4pnLNCKa4erHTRbr8atIJcdNtAi1EfcR8ck+gHl5CSsi9I3VKHgx2Br+nYnYNqa7hT1gii50DXRmmB8ypuZ6PPoCSB9j1ccApelTkw4YOJwM0OFJ2M/74J2kDXto3XtNXm3RN+4PWL/FnZpG1XQEJC7QA0GEW8PSkS/qgxR4/MsgTZjbIvGYe7XaiEmAyt3b8Q0HTaLEU4+cr3X43mn6hEcllpMRxeJVrZgA2b9++DVacid1vhm8GGsDBo0KmJaTjBbaT9j7tEDvcSpEISZvCfvth1aBXLl2Q/BHQZ3Mqi/IWEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzbNQnM3FNHeNbAbr6R4lAyRL4pm65IdEdU17e359YI=;
 b=OnN26PJCYNY0RCNKOX6rc89KDzFfuSnolrIr+83tYcTttxaGofabO0l3uXCWFhKkXpJj9KxcBSbh8tQmN6bFauCwSErsFwvhTcCxA1cBGoTseWfPRbBqX5XX0BWFxAAQ9BWEu/SezapWknNf+tXIUmSup4pwHgnWJSBRJxqcJejt1Z/wXfEbNP9fC8ElmB1FxMWK9KzusQa9K1Q/ZOgl2yMIlNA83z22h24yd9V015iuBEUrlKye4RpCpizC3cfRNuNwPCQR8bVo4Mfj4jDS+ULsyRV/05KZ+3dnARzswRPOMI5uBXLvnII4Ox+gL0vteJqv8SAcpfTifDVjODTDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzbNQnM3FNHeNbAbr6R4lAyRL4pm65IdEdU17e359YI=;
 b=cHYkCendGHhYMU2W0k6adB4vzC1GuNjFDL2mxHCWK1Ti9ZhLZxrt8e9px1WGFL2qNQ95jqHGEeWQtaUIJIaIpdTQV0FWtEBwdkVkFp2RLf7f5lG3Fkm8+K6HID8XHkgB3VGF60b0hQhsZPY6u+tzzv8xJmaKLy//Y8xKZyosORc=
Received: from CY5PR15CA0055.namprd15.prod.outlook.com (2603:10b6:930:1b::18)
 by IA0PR12MB8205.namprd12.prod.outlook.com (2603:10b6:208:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Thu, 5 Oct
 2023 17:20:51 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::ee) by CY5PR15CA0055.outlook.office365.com
 (2603:10b6:930:1b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.29 via Frontend
 Transport; Thu, 5 Oct 2023 17:20:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 5 Oct 2023 17:20:50 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 12:20:46 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 0/1] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Thu, 5 Oct 2023 22:50:10 +0530
Message-ID: <20231005172011.9271-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|IA0PR12MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 98d92610-58f3-4d83-5799-08dbc5c76c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qIbt1uGW/MAOn6udHb5r9wckp9geCoLxx0gBQ1RRw+up6eET5KjNN8zXwIlX+HaO+vx1DJfaar6DJ77g3StH3a7lHGKhvVucYC3s2Vu+CXv0vNVAJc7U92FAc2zGbINgVP38+DVDY+rUX7gQA6m3GYPSor+78tqa3MQDlRUSqWE8IP5Xy1upXQA9YFVZyRlqrD/EUtXHpI3uVyXqR2Y1H7lPS4n+noV0YComqjWdX4Gw5jaXpvJUu7ek7ymPdzzORDBLyii/oFRgdk3GmbQ0m9CLmlj+aERZjb8i3MMI1FRVdJ7pDSeIDW+dX5rjaCwNd4SLrJlc3E6r4kVwTxEOk/bO5auWb9o651pM+xk7+tfe6lWqXgCDZc+MBaOBoXTF+3GogSwqpD40Wni3gSPiAOyzMYwMNUbw2lBJltgdSNrn2max+IOG9C8rV+IUPUe/ctDInStweZwyYeX3LcpGDtK2Rz6daAnVo8Wpo09BGVku4UPsX6FMQhCKqQ2l2aVnHJtBM0L+YiTCBI6QgTa85xzv3XsncM/qDJ3mhtfixvrkR0mId2V1bXtTv2Yv+uXCjl0P83gaACFrHFiVdqebzB4PIvjLsI7pBzs4oNlFnE1dg7vcqHfJ7D0KlYN8DO2K8cKIooB35jJSWsejydjzJbIFRvqaOiNYra3v3hcT/iVsvm5PZC0EVEECphzfWTkRkE60vylnqvvKt80Rb0ubZBd3eyKsZ/upaPHrfNi8M/qSrJg0Ib6W0tsp8cCYxrVa1vGdpxw24GvPnv4WlErDRA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(451199024)(1800799009)(82310400011)(186009)(64100799003)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(426003)(7696005)(6666004)(478600001)(336012)(356005)(36860700001)(47076005)(86362001)(81166007)(82740400003)(2906002)(8936002)(1076003)(26005)(83380400001)(2616005)(16526019)(4744005)(316002)(36756003)(4326008)(70586007)(54906003)(5660300002)(110136005)(70206006)(41300700001)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 17:20:50.8725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d92610-58f3-4d83-5799-08dbc5c76c56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8205
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On older chips, the absolute doorbell offset within
the doorbell page is based on the queue ID.
KFD is using queue ID and doorbell size to get an
absolute doorbell offset in userspace.

Here, adding db_size in byte to find the doorbell's
absolute offset for both 32-bit and 64-bit doorbell sizes.
So that doorbell offset will be aligned based on the doorbell
size.

v2:
- Addressed the review comment from Felix.

v3:
- Adding doorbell_size as parameter to get db absolute offset.  

v4:
  Squash the two patches into one.

Arvind Yadav (1):
  drm/amdkfd: get doorbell's absolute offset based on the db_size

 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c    | 13 +++++++++----
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  3 ++-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 10 ++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  3 ++-
 5 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.34.1

