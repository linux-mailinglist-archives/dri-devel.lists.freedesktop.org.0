Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E970569847
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 04:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E267F10FD96;
	Thu,  7 Jul 2022 02:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17C510FD96;
 Thu,  7 Jul 2022 02:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPIg4nLiS04eJ1CUREcfq5ij0MMphLnjop+glFO9wV/R1SZpJJtZ+67fQyPd+nS0ZPeAvebgS/WDf8Co9NhiJEWksd8FxO6x+qh8fDv/ruHpnU6kRhxCx8+S+qmPuzl9DXLTl20ExXh87FSazcDCHgoHThgdXlPpzwQSb8Oobl5/FgPnP3LGcO5HBwMEgmC40EdOKtOfeZ243CUqlCIIX0PIYvuFUgGidd6TsBDf2XxhGXbH8FdtkdVoAGHYutcaz5SeBJFsleQW9DZ/vYyksko5YkVLLgu+2FSixgY5LoiC//pG2Shl6kPKKbYqgg1EeTLv2dSRdhbe3kJNJ1/JAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+yX/+hOb3Gmax1mMUAgYbgR6ruQph45zB51EqGQPc8=;
 b=iFzCASVFUCjZsrC21IKbeDvtdmoaonQ8UjSYW0MzfBAwDdV6/rsbUfaB1tUjXkTq/cPMaxbAGdmldKj0OSoGRYNgG/FPCceyZg7FwBHf4yKVlQzVxh1rlae2BH8NY0cvR1OunJzyyBgVPSMvcAAZLlAK7pxKq4nOEBAXovy5APhlFClERPdi4CC7CUAHtB5kszVreorGmRaApJHVOO0g7H2AgfD7rBy9AQ9f8zqga9qRrYCtmjZLCHhNGHt4motWrQAD+U2eT70Ecs4Exr9DwAm87fw1fdx08MjdEU2G8j2ZR5vQMaz8XKW58TP9WjdUHpZKo1p3U3/4HP0ZDJTTjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+yX/+hOb3Gmax1mMUAgYbgR6ruQph45zB51EqGQPc8=;
 b=YIf4zvnyuSKwfZqJYcRv94tAS3zIJpFFIGTsc3RQYKfo6jq9cBOlFm8TETF+36LYhgsCO1KKgXb19SSVfz7PWLv9vfZnSoevyih27X2leNCXFtiV4QeoNgd+S7cJjJg3JBiLgHduahJ8fVysC+uQLmS0ZCmmh99wiT1aYylQaC0=
Received: from DS7PR05CA0021.namprd05.prod.outlook.com (2603:10b6:5:3b9::26)
 by PH7PR12MB5618.namprd12.prod.outlook.com (2603:10b6:510:134::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Thu, 7 Jul
 2022 02:44:54 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::4d) by DS7PR05CA0021.outlook.office365.com
 (2603:10b6:5:3b9::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Thu, 7 Jul 2022 02:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 02:44:53 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 6 Jul
 2022 21:44:52 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.19
Date: Wed, 6 Jul 2022 22:44:21 -0400
Message-ID: <20220707024421.5773-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00251c75-6919-4421-2b95-08da5fc2abfe
X-MS-TrafficTypeDiagnostic: PH7PR12MB5618:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vb5s4C/NDH1RuJqAnd12/vGekKi78nqs6qfhGrigUSqcOcsMCFEPfX+x6L4Uipvd6ZX++Z/FVcwUdohsZnQdm6IYEkNSbYPAQ8lxpOGmWP97lA6qapCikLjwV1LMICLMiSCL54PJHwTjUZ0iqRwE3bYzMjtYtnGgh6g+dKpwS9NtEVU/aWaKHEN7YGzvhzb8/wWB7bbvsVzCjC3/XTUwqwyshtbSPv5HGu8+Kvzi22PsSSRRMj1CcE5R9eBkc6xr3mpu+q4jWO4csIrNj3NX9A7fvRIAaZqreGAvWvaXI7KH+TOAikO6ve5LIh8Fk0DoHNOTSqYLP9TnjQVc+wg4lY5NWFgmaMEZscB8esKKueYuM7NzUq9EHouSimi2KQGhI5H2gQdrghjMbGDjOI+6LS33zr6qm5t48Iydfic+jyp42b4lZNdrODIPPS0CQ3zzsFt312BiXrk07P/0aglz4UcLqpQhj6AmT6wcHS5MLjyyRkKS0S4SxeBEJmrL+uFVkb0H24fX0UIHthFq2lj0scOzEQnu33fJmND4uyIjb37qHzD46LZGaiG69J839G9OAavhvX4wlQ9WyDzTMsCIL3jU76rKCTCl/ZItl1HkzY0Q04Rk2OXSBZv9vt6ZvKoQG0u6jcGgatJartpxmiTuL88qkDE0zC4rm4JHb083s8Qig+CP6egeZB35E7pEYTLVqtXcytDgVwQTen1v2Zler6GmRXKhQab/+Zi+TLpPpmKuA0YbPYSy3A8Q/L8BqVqdTc6HqWp1nzmLK17dXlmdFwE4tHzSzQO/lFCx8ZouZwzH3L/72a1qyJax8Jn5QDo2SBYKqj30TmktC7DD/ReMvw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(40470700004)(36840700001)(46966006)(8936002)(2906002)(40480700001)(426003)(83380400001)(40460700003)(5660300002)(82310400005)(36860700001)(356005)(86362001)(478600001)(81166007)(70206006)(70586007)(966005)(47076005)(8676002)(7696005)(6666004)(1076003)(34020700004)(316002)(16526019)(82740400003)(2616005)(110136005)(36756003)(41300700001)(26005)(186003)(336012)(4326008)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 02:44:53.9264 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00251c75-6919-4421-2b95-08da5fc2abfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5618
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

Fixes for 5.19.

The following changes since commit b8f0009bc9edf9186b20ae2a9e442ef0af93040e:

  Merge tag 'drm-misc-fixes-2022-06-30' of git://anongit.freedesktop.org/drm/drm-misc into drm-fixes (2022-07-01 09:27:55 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.19-2022-07-06

for you to fetch changes up to 3a4b1cc28fbdc2325b3e3ed7d8024995a75f9216:

  drm/amdgpu/display: disable prefer_shadow for generic fb helpers (2022-07-06 22:00:03 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.19-2022-07-06:

amdgpu:
- Hibernation fix

----------------------------------------------------------------
Alex Deucher (2):
      drm/amdgpu: keep fbdev buffers pinned during suspend
      drm/amdgpu/display: disable prefer_shadow for generic fb helpers

 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       | 25 +++++++++++++++++++----
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c          |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c            |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c             |  3 ++-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c             |  3 ++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  3 ++-
 7 files changed, 33 insertions(+), 10 deletions(-)
