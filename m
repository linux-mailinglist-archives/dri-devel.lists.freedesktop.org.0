Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 690AC7B17EA
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 11:55:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E3210E60B;
	Thu, 28 Sep 2023 09:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A363310E5FE;
 Thu, 28 Sep 2023 09:55:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NTTkdfP2LiLnL+5ytg6WhPArakw7aJapU6qqfXuG+3wmlCbSrAXGqnNk973q1kVhlFB7Ptf6MgRZkzwB6ARywvw9SDcuO5h8pQhR2zjMjBgj60mJDH4dCVnrcvjo1lhjrTf8ZS43T/7+PBk6AOurgsmjkwrmhy7ZCNFGX4nzSA3fYPm8X90ZaLwJ8DwTUMYlaB9wqF3qIv903v4cGcz0krs3/WLZahKMPoo6HeNaWaHC30oIDIGPdqBipT8spop13uZa/z6RFPWK1MpCelefR0UET+Yt4UA+TotObPE431dljTaL/ohjsS/yHdrnUEGhLGUvXJ1ZOZ7JwXjKoScrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64JIPdpDT42o0qPZf0XjqN7f1EVK046zeeSe+W9fwUA=;
 b=TyF4vAHjDb2ZknfkXEKcob9fiimBnWg3miWDhXIj86WLwIKAOb2BzAMj2DmIcePZJQmQ0F2GuMiPWiajiN8StedgZqAPArXlikp+zpBA9qnV6eWiuyyuarh7VdRxf/CuZqucVXV7fHnihbIa5r7EOROejNLgc3Ug44f3niA5Ph4+DxrXWT01WpyH9HVpuWSgV6OMegp79y1aRm7tqPvMpnm0PzHzBaoBjrhqnJZrKVZFXa1s78FaszkFZJFchvH7/oZi4DX83Wf94Y7fw/AnxXH+FYaW2I+nOL5TGpNkDbWljEDahOnQqCUgZ48XnJOHBbjl2DfYF5n9H/nKqYL22w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64JIPdpDT42o0qPZf0XjqN7f1EVK046zeeSe+W9fwUA=;
 b=cvemqkMFwsb4AIhrtk4ApasbCR4t9BYWXh4KuLQCSIyLL0DcizoO0whYGFKHCGvOvkwoIecEChzKhotluMKME4Hvxpe2ZG0kJ845zhOlhIPU035ZDg/mvc632vlOnP24cLC8vqjF/BSimVHWf2l9BCkmPrV2z4xZ1cmx3qzCoQU=
Received: from MW4PR04CA0136.namprd04.prod.outlook.com (2603:10b6:303:84::21)
 by BY5PR12MB4145.namprd12.prod.outlook.com (2603:10b6:a03:212::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Thu, 28 Sep
 2023 09:55:05 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:84:cafe::26) by MW4PR04CA0136.outlook.office365.com
 (2603:10b6:303:84::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.24 via Frontend
 Transport; Thu, 28 Sep 2023 09:55:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 09:55:05 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 04:55:01 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 0/1] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Thu, 28 Sep 2023 15:24:26 +0530
Message-ID: <20230928095427.4337-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|BY5PR12MB4145:EE_
X-MS-Office365-Filtering-Correlation-Id: d686ad6d-71cd-4d8f-7e08-08dbc008fde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G9fizxEbw963W1EWU3njOTkovU/ecHg+JQhKBqSp5tMhok0iH1WO0F7oo24K4iEiz0664nJjWiggkF0IzSt2Vtda/Fnr07ay7CzTzD9O6rk2AC7SbN2g2i9VjmR0zoOL1vIxuyl/uhS9xAng7bLxn43MnMoHAkePLTaza4IBxD6JW9dj7HJIKpazTLR/oyK2DYwOGAtA6d83KyRbcxYw1nNYIVkqQVhrRLoJtt+/W4Q3V/aS7W2DdRX+6oTeERT4rBlQI0rRhsJBsonB+bF2wXIKacsAiWhkb8tP5dtYr0jr8/fiyiCzDEe1ghR31k9chH+NQZptleExUyoQghvczSU75luZvuHKDNzI4HLo2DtHwPbYF/oz3LQQlUrYR4+dMgphKBJHnOFX0QiTQLwlyDmjwVa0Q68R+Ae+lEb+h/TJ7EXcIoOEZnQJrXJAhX4uNYst/piRxJIS4uei/j/PX87c2nvsZKv5pBTRZIJm4XmRh6BpPYx8Q0MiF1Ng3dexcVIegqOevBnpSKuRndw01B12NqVTXudtfEWwqEXX8Yg68NGwmqavihanuj1eX39RBmhvdQgYrAIKtlaO6aleSqMINC2vGJ2bU+aLDRn66K2lLXfiUHd+aAqLhjKDYQnWiBAuh2V4NXxeAG+uXvMeJw3LKVl3AvgeyHi7wD+rbQBaxlvO+/7SZ4pBJH8RZ6xdggbiWuiQDTxCkP78z1LVrKKb6+uIDeIxAupq73FKLyvRVKrkfYKY45kK2emBslrTCxgnj1BaQPw1jbCz+j/s5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(39860400002)(396003)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(7696005)(6666004)(478600001)(81166007)(47076005)(36860700001)(356005)(86362001)(82740400003)(2906002)(4744005)(41300700001)(426003)(83380400001)(336012)(1076003)(16526019)(26005)(2616005)(36756003)(54906003)(5660300002)(110136005)(70206006)(70586007)(316002)(8936002)(8676002)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:55:05.3860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d686ad6d-71cd-4d8f-7e08-08dbc008fde9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4145
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

This patch is to adjust the absolute doorbell offset
against the doorbell id considering the doorbell
size of 32/64 bit.

v2:
- Addressed the review comment from Felix.

Arvind Yadav (1):
  drm/amdkfd: Fix unaligned doorbell absolute offset for gfx8

 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.34.1

