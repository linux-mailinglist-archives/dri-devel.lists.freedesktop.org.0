Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E187B84BE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 18:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA2810E11F;
	Wed,  4 Oct 2023 16:17:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2082.outbound.protection.outlook.com [40.107.212.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9B510E11F;
 Wed,  4 Oct 2023 16:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BuwF52tdaMAePjIji27BuvX+N1BP6XxL9Z65lP9szn8oWN0TyWfXWzfd+s+RUr2Iw5HyVmMTO83eJB3qTX+FUg6P4H842o737joCDpE0MOUp5gTsKZ1Vz+x5IR9g3JMWNzt/3i0ImsTsE3UZk4lmnYKrklrmeNImHQXeC7P0gWLR85owWPFx1zYk3wD6/T3Uex0L3a/WD1Ptggq4Vt7kfeSdG1AOV55op3rAU3KWhX4+rwCSO/+AA7fMVKphGus89No34Q+3peRcTmlSYoKDCdCDngGwy+vZ2m0USs7+5j9Bc25Det1iT42Vi2ZeJPtWC4tDl9T8WzEO3iC+54VDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5pusBspMFJdz8Nbczdfqv2EwTWgulJlEx81GdPzMa8=;
 b=GPIadkdLdeCTzugL8rXvYqGMidlNEKA54UR0Zu1NBte+v99EikCuT1bPttBF99i8XTqj9mpSFHjtJcM1qCeUjUrLYBMzsSKkclgqvWnCmToOg2Yb93WRVzd9A53k0Xddy820TAF7I2JAjMX2DQACtetioe1iAi/BbavCIwKFYtMyjIksNI1E4ePZ1J3R8oyYW7TtiwE8zkJKSs0CvVzJ2q0njD/ZHrdyy+JZFq0wh8HYOKWtHjZioD6zttoSSFUCVqWOuGSoSt4Za4davJCYriDK9NbySeCUjpV8IFYr4DCAUZ1/4nJmhsq/aEZLKi0pVD/qC5ZnxebKjWm86E8zIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5pusBspMFJdz8Nbczdfqv2EwTWgulJlEx81GdPzMa8=;
 b=tMAPNTVo4dL7cafwvJDH1dBOO6H97TaNYKSPtCzh8MZXyGA/OsZe+lO4wb52aJp8l/yQPRtSwExxENkBwFUKuLTUka2fs5d59rXSDj6iAWUSoQ8knsiGiT+zGkY7SUyvJzOU2Mb4ny9LhrqrmC0AaMJIVM3CQC1TpXyWnw3PKmI=
Received: from PA7P264CA0518.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3db::15)
 by BY5PR12MB4952.namprd12.prod.outlook.com (2603:10b6:a03:1d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.36; Wed, 4 Oct
 2023 16:17:27 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10a6:102:3db:cafe::6a) by PA7P264CA0518.outlook.office365.com
 (2603:10a6:102:3db::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.27 via Frontend
 Transport; Wed, 4 Oct 2023 16:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Wed, 4 Oct 2023 16:17:26 +0000
Received: from rtg-Artic.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 4 Oct
 2023 11:17:21 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Felix.Kuehling@amd.com>, <Mukul.Joshi@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 0/2] drm/amdkfd: Fix unaligned doorbell absolute offset for
 gfx8
Date: Wed, 4 Oct 2023 21:46:50 +0530
Message-ID: <20231004161652.3082-1-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|BY5PR12MB4952:EE_
X-MS-Office365-Filtering-Correlation-Id: 41137fae-046f-40cf-0e1b-08dbc4f5665b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KQbXHuUoPIaMp7eHTCk1+0X6M7t0v6OAPaa26GOBob5oC3/M9p60HrpuJ0QsD+J81tvDCOPQb7ylpJBtBpeJnUojxlOYq7iwCKxXR0Yx0K5cx0bkV1WQd6yr9G6fZuwxuGn+kFNssLVi5JXHfq0VNkOjU4p9h6bksWyGl9bGQYrNHabS+QVZ15FKAwN4XWVxoWJsiddSqq6KlfWmTCS6apkv0Vl2zm3DIbNNGmNM6ZXENoYKsAEiYzAZA5IhVsD6d2n2e6tetov6iHS3Vh16hFYpUiLASpFyyC0aqCUwUnUo2CziKco1yh7stAjTHlBIBDZRp7GNYUxyAImHET9RcRNUVhUV3qDF9LNNgWqhBa7lbyEuGMY4ER+mgrJGoamQ0xeBanCbVDZPgeXLhw3zhF/pmYINPgi+gbBp9bknPheTuquxzsZXtlQ/FgWfc3Tuq0RVIAGpaGXG2elvyA6QG6Pu7Q0y3RflC7xcy8cCofMzdxk/65zbHfTBFZruiZMDZ1/0EswJjrF9f6/BZxpMNRSXDLxfab1CN3/8MHhQ2HZA6PhJkv0urPQKYJ2uhlLeCNRaAhFppHbuX7nN+mx93QBMgM00BHuF6hkDwlqkKxvrfsrj30oEgU622wl6GXOrcKn0FE2aAbwQCrqV+rAzxRc4aJV+zb8/AqOxzLoUtrXMcIeEennoIXwDMk2bZLP+CMQhaglubFFZiXZrN+v3odvc4AktANmbaUSYONIKViqQHxwX8+kiBzPEDbCx68LAFIQ7UMdwj3uDf/kQEhtkzg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(1800799009)(186009)(40470700004)(36840700001)(46966006)(41300700001)(40480700001)(316002)(54906003)(70206006)(110136005)(70586007)(478600001)(6666004)(40460700003)(36756003)(86362001)(2906002)(4744005)(8676002)(8936002)(4326008)(5660300002)(82740400003)(81166007)(356005)(2616005)(1076003)(83380400001)(47076005)(7696005)(336012)(16526019)(36860700001)(26005)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 16:17:26.5707 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41137fae-046f-40cf-0e1b-08dbc4f5665b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4952
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

Arvind Yadav (2):
  drm/amdgpu: Adding db_size to get doorbell absolute offset
  drm/amdkfd: get doorbell's absolute offset based on the db size

 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell.h        |  5 +++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_doorbell_mgr.c    | 13 +++++++++----
 .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  6 +++++-
 drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c           | 13 +++++++++++--
 .../gpu/drm/amd/amdkfd/kfd_process_queue_manager.c  |  4 +++-
 5 files changed, 31 insertions(+), 10 deletions(-)

-- 
2.34.1

