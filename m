Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532863F8EB
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 21:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1F010E06E;
	Thu,  1 Dec 2022 20:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392B810E00F;
 Thu,  1 Dec 2022 20:20:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC3IU9PxIS5ESVMS8W+pWFdjkp8G8Qqdmp5cGOv2UTOUJUYm/ndpWR2618wFySvWUv7HC3LVNrMx19LeS1COpy2wSe7s4ZlFLRxE48vCOu3j4WgvAOZJJpgIDJYp80IDVIISoIfLG6zTDqJSt2r+6P8lRVuUd1B009tkol8RIwEUpV2mYoGaBaObBhS5eDpshiqDEPikfExhGXIP5/HYRMANUuMW/SzIDG1wTEeYDGiZ7tBHsr9vllEV1tk0wYklVbVJIldDaciWDfkTqzApbnzsYoyzqOl65FzdJGtVHXyqloNvEaSAHQjVqrKYxhLUoh6VdwKR64CgECvfiDEdiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfYrJEEEka1SPcGTFeia0HVbrU/Z22c77Z98T4275nM=;
 b=g7X+C+Z2RVVc1UcggziPVLgDq2wVZJTvnxBKloRu8bsiqtI2VPycx+vvW66ET61ntcek18yIeV2uzVjtFXbDL7V++EVsWv+uEGPJj9vSebRkwm2IIlSr8vwXg+agViJNa5XwEAaucuPgdOyF0T36ybrp3Co4ycU0ekXQMf57bLqyU9x6C0ygT72pY8bxTpKyZ1TC3WVP1EnEDPG7+XeY/mkkpXn+7BahKJFDobkFnebN8bZPHzFnaMUA4GdzmiISmji5E9YxKCrdPNJAyHN1/1fBbLU9b3XP+OEe3jTZe3TI0F5fdFImEAM1GOyfpFoWcFiUsxxrVEH2NIyrEsfc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfYrJEEEka1SPcGTFeia0HVbrU/Z22c77Z98T4275nM=;
 b=RVOmZqQ46VPtEluLmtWpBvoCT+jyCtyjM5B99roCZ/RxpHhFv+ECDQH0qdrfcuEXFdEn9p4p/fWzjtVrtShj59sBHOGTfIpkMnZTY+vDf8i6OOPEiyBDS8cnisvxUgCejktcH2SsVNsPJyKxy5KddNq5HA5G7OQ6WpPxiKteFw8=
Received: from BYAPR07CA0037.namprd07.prod.outlook.com (2603:10b6:a03:60::14)
 by MN2PR12MB4175.namprd12.prod.outlook.com (2603:10b6:208:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 20:20:34 +0000
Received: from CO1PEPF00001A63.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::41) by BYAPR07CA0037.outlook.office365.com
 (2603:10b6:a03:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Thu, 1 Dec 2022 20:20:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A63.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.17 via Frontend Transport; Thu, 1 Dec 2022 20:20:33 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 14:20:30 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Thu, 1 Dec 2022 15:20:15 -0500
Message-ID: <20221201202015.5931-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A63:EE_|MN2PR12MB4175:EE_
X-MS-Office365-Filtering-Correlation-Id: 20461f8e-4eb3-41f1-1a3b-08dad3d97fcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pp1OlJyL+wkCdzSjMt1HDW7boSLJ1QQqqZOmVfApD8ZZ3fHfNkBmQJLmej/ZLIicXJqdWWb+HUlD+4OocCY8dX7BxyfUCbhAZJ1D2awihVMMK3a3uWo3nsL8aLZSjn7Z17TLskHaGRoRyzYhOXUaH/fBu1ZONE4uEkMEt4bO781LshbR/LjUdO6w/z0qG9r7YZxIPpIl8zoxU0OMvVn/n4M+8N73GynBsDOsdswoV4u8CsF411LYZ+xwsdlexQXiT/azW9cSy4oStt18I6kn9Vzks8TgpM9EmzGn/kp4124rlRrVNdoRg2xWfumf6vMH5UCEBvYt6zEgXuMEs8ETJAfChcxzUuUQQp1lwtYjolnb4GF3l23lY7AKMwZbedXZyAQfzBuVtmy77FDebX4oKPZ8zPbdJMegYXIctiKCWkxREk2mAixHfWpT6VNWss74mKtysJuNxz095fD/1rOzSVdp0phTdAbJygShbZ9bbyoQ9P/BOC7tlt8qQ0KwrlPbamc1GovnqOy7WLrG+tjxWWg/M5idBtd82fwUeuCTfKbBVZeRsfRljaisLKpTCrpRD8drlMmZzhREGZs9YHuZtXyG+EUCB5F+AsYoyEoS4TqXRrNSzZYC4k0QSVGgbIi0d4OavRlsnAN3GwRnx5EHkSt/bs1ycFDsBHUR11AAseHLdU6t/M68LiR/MrHubc7J
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(426003)(47076005)(86362001)(7696005)(81166007)(966005)(478600001)(16526019)(356005)(6666004)(40460700003)(40480700001)(2616005)(36756003)(2906002)(4001150100001)(82740400003)(186003)(82310400005)(1076003)(336012)(70586007)(5660300002)(26005)(316002)(4744005)(36860700001)(8676002)(110136005)(8936002)(4326008)(70206006)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 20:20:33.0321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20461f8e-4eb3-41f1-1a3b-08dad3d97fcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00001A63.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
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

Just one last fix for 6.1.

The following changes since commit b7b275e60bcd5f89771e865a8239325f86d9927d:

  Linux 6.1-rc7 (2022-11-27 13:31:48 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-12-01

for you to fetch changes up to 9a8cc8cabc1e351614fd7f9e774757a5143b6fe8:

  drm/amdgpu: enable Vangogh VCN indirect sram mode (2022-12-01 15:09:49 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-12-01:

amdgpu:
- VCN fix for vangogh

----------------------------------------------------------------
Leo Liu (1):
      drm/amdgpu: enable Vangogh VCN indirect sram mode

 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 3 +++
 1 file changed, 3 insertions(+)
