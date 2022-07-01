Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 974395632A7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538DB11BA90;
	Fri,  1 Jul 2022 11:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CE711BA87;
 Fri,  1 Jul 2022 11:41:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TY98j+2YA99YIEZZUswyDpRHYxeAMDX37NqF8dXI3hbCvqkM4izS9sYmR5+lCKm/gRF2CTXUvJKUaS/6wTSSQJqUjGfCLW1whYqUQfCvyK41QWo2stXGgMeG7QTQjJLGy8FVBn+MZ4oHeJ39aTDnlk5mRlw5N/lYdWbKdh+rrV16kzB+hycyVDnn+uiCRSG/1amXewbEA/iALnQnvcBo87+C/f06x+ILRUxtRIGjB059d/wrcwsXG6dvdzfTKctHVkt/3TOuoCkSt8dTa1cVtNA1X3OoZEfaRd630mhyS6O68qFBhKFAkHDxJ0hjUv0hO26L+wxkbcf0h/97RxyRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfO6ZexfbifOy9CsChgzCXyiQDL17nn8m4X01ykbPLY=;
 b=aNK74BPb3b/6oM5Ylo/OPSrXLNGo4MancYL4I+ZOYQVJR8qzGPKkAYq8kAizCvF9mcot/FunukOala3T6s7DAF1vBi7LG768SzxEUBnfdyGbszEVXfa/wrVGrc3ImVnUdZAjSuYJ4VgdTjB0qAjW2sYVN2duU380asReAlPB3qDPFWT3TYyfD5vzDbfY1TnauYT17v+v3Hfi2UGOnkIm+eoDU4XL7ZcgqySesNjK17ZcFj8L9VyDf0Tlp/KVPzZoXYI/umF5ds9SRVo0G1Qc6X0aBkzJFPsnElgaRf8lJiJzuFlGFWvagBmuOjukIkrqZ+5G80yDXWJjiLCciRarrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfO6ZexfbifOy9CsChgzCXyiQDL17nn8m4X01ykbPLY=;
 b=e0jCf7aLaNtQZEWOyBLLU4ZXw5/QH5kTdSzcBHbZNu5y+xjy9KtQ/qeJ1FhLB45k/0R0CeFDYZTAHLU5DHIHv+2+KPNS6OxBsFjST3IDaVSxlZOfLK+ma46l6n0k9s1RSx7JREQpgUPIn6IHYdhyO2JYVH1CE79seRABaB9Qy4M=
Received: from DM6PR05CA0055.namprd05.prod.outlook.com (2603:10b6:5:335::24)
 by MWHPR12MB1296.namprd12.prod.outlook.com (2603:10b6:300:f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 11:41:19 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::dd) by DM6PR05CA0055.outlook.office365.com
 (2603:10b6:5:335::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.11 via Frontend
 Transport; Fri, 1 Jul 2022 11:41:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 11:41:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:18 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:15 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 0/5] I2S driver changes for Jadeite platform
Date: Fri, 1 Jul 2022 17:11:02 +0530
Message-ID: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cee82d45-ab12-48f9-b395-08da5b569d82
X-MS-TrafficTypeDiagnostic: MWHPR12MB1296:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zYWnL0XqykJuXOTTlfjekDSun9yv3EgpuB70wAGeQQ/b8Jdzxtxt9qiie2zF0ZI2GvE0VtCNutsXmItE+brVup0L9ILbK3IjdbZy9njUuREB5zayQH9bv3PaN3MkZTItyEgYvuy9kjR2oQRKUtrMCVtxzx6BqqP3toxAdAuDepyyRCkvk8yjY6Y+Bo6731QSUmZp+ostenCcSEznC+QRrevJoLeDwDDyAr+8WO7DTU3iNR1o5kXBxsCuKioov1IS9EPESSWig0KqHxVIPk4DEWX9cpKvBJUpHGlSjrF8daG0tSP4VYMvzoWhodFv/973IU/pWwEV4X1pQf/pRdIlIipdTSNgdHVzbABtLQVlSkEJwKJoD7W5E7+sNgE2L0TLZ1lBh/NEq8Or1B+YkjQc1mdft4hXnFOGJctNM48XSmIkNdaMFezuawM7rtW0KYr7Xntiqc5SyOMvom5AgIHXjOplLlo8doZvF/WAahP6BN/tbBsv53Axs65jyvlVGHb+cR4cIZ6ydlPneMR8nH3zIwlRDT5giXHRjBTYL5ld77QPt2JajTOXgpajkNpVNcWeZTEfyitumFkg2ig1YS82xGzA1eyjTepbD0KI35SKRnkcbw/3XH5IFEgoMWgZJAuIBMca0ylTymV1qMNdQC+2J95jP0G83z6eGB+A8fn+IQXLNyXr2arcJoZ4HedLig1gSAd6hc8x0CovEtAHmpBSt2RTJBT37ZwGPHAAVSIyqriCGoHBdMd2oipyAVyjDleXWTyEu+ycKRVSbNfr8PRmFtAXdczZqStfFLaN7PKS3CQpA1vvtkOFOau1IonQTcqNegjtbsng6F9FEhquYtu9k8uC1bDFNuYfhepItAuLi7yqgvbA9nPIcVXG1UTZmOYI
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(46966006)(36840700001)(336012)(426003)(1076003)(47076005)(186003)(36860700001)(40460700003)(83380400001)(2616005)(70206006)(70586007)(110136005)(316002)(54906003)(5660300002)(8936002)(8676002)(4326008)(7696005)(2906002)(41300700001)(6666004)(26005)(478600001)(82740400003)(356005)(82310400005)(40480700001)(86362001)(36756003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:41:19.3312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cee82d45-ab12-48f9-b395-08da5b569d82
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1296
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
Cc: Alexander.Deucher@amd.com, zhuning@everest-semi.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jadeite(JD) platform is Stoney APU varaint which uses I2S MICSP
instance and ES8336 Codec.
This patch series creates I2S platform devices for JD platform,
adds I2S MICSP instance support and Machine driver support

This patch set depends on:
        --checkpatch warnings patch
	--https://patchwork.kernel.org/project/alsa-devel/patch/20220627125834.481731-1-Vijendar.Mukunda@amd.com/

changes since v1:
      - removed hw_params() callback in machine driver and
        moved sysclk programming logic to startup() callback.
      - Modified ACPI & I2C flag depedency checks in Kconfig file

Vijendar Mukunda (5):
  drm/amdgpu: add dmi check for jadeite platform
  drm/amdgpu: create I2S platform devices for Jadeite platform
  ASoC: amd: add I2S MICSP instance support
  ASoC: amd: add Machine driver for Jadeite platform
  ASoC: amd: enable machine driver build for Jadeite platform

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 329 ++++++++++++++++--------
 sound/soc/amd/Kconfig                   |  13 +
 sound/soc/amd/Makefile                  |   2 +
 sound/soc/amd/acp-es8336.c              | 324 +++++++++++++++++++++++
 sound/soc/amd/acp-pcm-dma.c             |  50 +++-
 sound/soc/amd/acp.h                     |  13 +
 6 files changed, 620 insertions(+), 111 deletions(-)
 create mode 100644 sound/soc/amd/acp-es8336.c

-- 
2.25.1

