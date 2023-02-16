Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E750698B52
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 05:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F119910E33A;
	Thu, 16 Feb 2023 04:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9A910E312;
 Thu, 16 Feb 2023 04:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ydc8FFdvGqJKMYKY5Z1C2y0ay19ihH7+o9U5XkPfVG8kGw2yGbrDWLzTyzopWqe33hTo2y6RZwCARX1c9KNLfYbxbJZs8N1LaZ41XHOPWXxDaElXZFP5qwbp5rxOuGCWYCil1+TW+Kx5Jrq1Y0OdYuYWBCXqUanvr/HXACsjcDCedL5Ln8rIG60qhnqCtLjTUTnrhC5omDbHKIs3wX247sVZQTk6l8YRw7hgIwz+JYwjsqHh41BOWazxid2IIHns7Kzc1bAHEQ+vgkjy3rlJQKKhYKfKvJbLUFSA/g99v/GhXrnjAv3p//ROsJ8KYDci5g4hp3c6ppiFUR0gQSpeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDfnTNYCG6/4HCbs0i0tDcsdPCUeCxoBjG/ewwLZiSI=;
 b=nkAYln1cT4I04UPHzJdF7hECQy0hk4TixSVKyKiKztVgvuTyknUUEwwaSOJBCQun19cYDzi+eGw0tPPEVxQfwvOLM6V+FwoHSIGIyjNtsr3kftHnVtsCLOOwYW6U47g3so6vP2yd0JlSB8r+581qrHwvrMBX7KCadYH9HWaz3BCNrkZzUSjEZrFibTfgLPxyBd3AL42jXUkI4oZAz7cvlXuUwC+P0rotp2c6X58NTXab6sHui5mwePO4qp6Z8L9+a6QaZBmlBIOyczHv63tgkiKUlBKg2y2grF1DEREpRyjy9u5mSmJnSJUvpKessBYs5GtfZ2e08mhTI+amBWqddg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDfnTNYCG6/4HCbs0i0tDcsdPCUeCxoBjG/ewwLZiSI=;
 b=DgCrmeJSI9MOtZfqIgpwgtH+qQSHmSS5CBTY3dC9+I+ZxEwqiEPkz+B/RPbWRYSgjYJFc+SpqCnRfrNAFdc2SAjThznR7RpgpTGBJdJM+l9SHn7WEJB9h9rfznDWZSwYk3Kr9a5oL4EtssFHgLWmJFuw3zo776zhttTvmKHcvVE=
Received: from DM6PR01CA0001.prod.exchangelabs.com (2603:10b6:5:296::6) by
 CYYPR12MB8656.namprd12.prod.outlook.com (2603:10b6:930:c3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 04:11:54 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::72) by DM6PR01CA0001.outlook.office365.com
 (2603:10b6:5:296::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Thu, 16 Feb 2023 04:11:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 04:11:54 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 15 Feb
 2023 22:11:53 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.2
Date: Wed, 15 Feb 2023 23:11:22 -0500
Message-ID: <20230216041122.7714-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT080:EE_|CYYPR12MB8656:EE_
X-MS-Office365-Filtering-Correlation-Id: aefe41c4-1345-457f-2e81-08db0fd3f04a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /eqyCsJE+p0/pZ1I/vUm0rFVoKrPg1Gnzyb7Zh99rjqabDel9zj5f5cHyEKsPYVe+tXoaD5KoM+nwuXVFsHPqrK7k0h69YT/4Jtimgis96SDtvzQElnV/Hdk/iost9aCaPGDu7QrVp30KHy5FikQcepimpti1pSwAlDzqB44uQ/3kMe1mEgsdqU4hLy9lhmfrabJIXXOt4fW9Dk0/x4y704DdzB3zXlRUIaEiz0bbYTVJ/crhGCtl999Wt9Ak4GjiIgiyvaEL0U8E2z+QOPuj73T5EzTwbwhCu+zfhSvkJ12BTsvGhYSCSXcf8538f9TA91VLj6NLFia7IfAUWJVfcVSdB+nOnwam54WsU2B+oDlEUtzCZn3sLBibL9o2AN6v5wwMDaBAU1Gyq5/evPnYoQKPn+PbfYQcmIkn0jHfpQZbdtpwPofWsv6xyXnun0uhqlVmtMDcix9ed3p8qfQUV90h08HgqGR8D1Ki1WScobAw1TX4XTge2f63erCe3MYqqtJuUgK3gUcWbt14LRgeQVI/vHxby/9AQLNb0oSyK1TtaTiPIhB3zvRfjpsIdobgJeHWkiF4kC4YP6g2royICPA3qR/6JH0rQ4Su7HaJYNiQF6BQY7JfLQZLs1HRgjIQo09HxAmBRx1xuKScKztdtQ9Dhd4Buh0OBliGRn0A+zMi8gymjTXNnUYZYKLyPkJ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(5660300002)(8936002)(2906002)(41300700001)(4326008)(70586007)(70206006)(8676002)(316002)(110136005)(40480700001)(6666004)(186003)(7696005)(1076003)(966005)(478600001)(16526019)(36756003)(26005)(40460700003)(2616005)(336012)(83380400001)(47076005)(36860700001)(426003)(81166007)(82740400003)(86362001)(356005)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 04:11:54.6185 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aefe41c4-1345-457f-2e81-08db0fd3f04a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8656
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

A couple of warning fixes for 6.2.

The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.2-2023-02-15

for you to fetch changes up to 2a00299e7447395d0898e7c6214817c06a61a8e8:

  drm/amd/display: Fail atomic_check early on normalize_zpos error (2023-02-15 22:46:42 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.2-2023-02-15:

amdgpu:
- Fix GC11.x suspend warning
- Fix display warning

----------------------------------------------------------------
Jack Xiao (1):
      drm/amd/amdgpu: fix warning during suspend

Leo Li (1):
      drm/amd/display: Fail atomic_check early on normalize_zpos error

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 3 +++
 drivers/gpu/drm/amd/amdgpu/mes_v11_0.c            | 2 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 +++++-
 3 files changed, 9 insertions(+), 2 deletions(-)
