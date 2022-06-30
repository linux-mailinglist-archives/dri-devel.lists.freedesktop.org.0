Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD07560F7C
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 05:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F40E10E5D7;
	Thu, 30 Jun 2022 03:18:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2072.outbound.protection.outlook.com [40.107.93.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2890B10E495;
 Thu, 30 Jun 2022 03:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFM0UjfUQF1N49LmhGNalpl3uG+rakTV7NaQJE702JYYJt1porEU2H56HVfN5L3PknFBOvmdkj9MCjYoRyrYw1VbAv5jcq+lHOSaKdVaClwWpwet2k+qKhOau83qKlqW5zr7EQfIhD2kRvfpohatTpSu7CExUKD/+aCbdK+L/Z7WCN5gX02Zka7KhbLDON8EhkFRBlfH/Wk1zlUr3pdxlcqSF3nwvL3cKX8FfULnQIjYPVroke46P8qIzC50/ZNQMg+6iVgErir8+a+qr/GY8GKAPoVnvYslq67Bk9HrJT3dCdb6TQOZn+ynDXWQUPSY0g0eYh5ffGS8POBTAZGrLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laNBeCzk/OomuB/kwNc4WvXqVx+19WlHZ/ohAvg0CtA=;
 b=RhwU35q1xJ8HL9ys/PA4z4PWBccwLePr7Q3cocFBHki3Byoq35GJ/UUsiMIROgB/ikvrdnnfgFEAL9OrqrcZizM/XzIwuu02xJpMTiH689VMPIKB/IIex8G2Y2yX1Zvkyl1ctLuDcbRFHCVwrKAjhv0HB0BvMNzUu3GRQJG7M/xBx50iza81vMvmc1AWEe/87A3jnIJLTV7wAZGXRCNxzYtknD4OLZ3scWWtEGZJ941OS9JqEhOHBVMLHaCWUWnPoaQxSd4YCyUhEUdItEkKlrsXEwGoTsrCIp3DqnmrxPQn1iVuMmp2KS0he+cwputemkKF5GN5SmbNkEx8652Oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laNBeCzk/OomuB/kwNc4WvXqVx+19WlHZ/ohAvg0CtA=;
 b=pow6Sz6qjvR85IpVcswNCS03Vmj6O+owlkGVNA8wuMpo4tpOR7p2pOldPHOyxgdidGk7zcPCCDRF0FGrJKwp110wcQkOpl5s+/VOBJSAZBR/jIJxUDXBShW4vSXKtOMa5P+xex/bcqJ3q6BLBa72sflKv0oW6x8EKIhBx4RNZug=
Received: from DM5PR08CA0026.namprd08.prod.outlook.com (2603:10b6:4:60::15) by
 IA1PR12MB6650.namprd12.prod.outlook.com (2603:10b6:208:3a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Thu, 30 Jun
 2022 03:18:27 +0000
Received: from DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::be) by DM5PR08CA0026.outlook.office365.com
 (2603:10b6:4:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 03:18:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT010.mail.protection.outlook.com (10.13.172.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 03:18:26 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 22:18:00 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 20:18:00 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 29 Jun 2022 22:17:57 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 0/5] I2S driver changes for Jadeite platform
Date: Thu, 30 Jun 2022 08:47:50 +0530
Message-ID: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbce5d17-7101-4803-f7a1-08da5a4732cd
X-MS-TrafficTypeDiagnostic: IA1PR12MB6650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4b6uKllpS8Agfto3sGxeAJ9HDWFGtF8YQlQW6En5LWnjpIneTEql/Wj6iPF11kUe5Y5bEE27wi1HBrJNnR4k3U+1jCFW1mq/q79GRmIOyLGAFupuo2krhQBGzcdIBK/s7x4W96qsZ25KNm6LAN/PsIAfIgtC+Pf4iBg5yJiV6e3fprsh1teVVpt2v1OdyloVeNHwAjqkCVKjMmFMA/yFD/XAOjwYey6p3EgLnwpRqvAxlKdY8su6cNBi1wcfEcd9hobmaT2hoU0Os11XdyNs6F1eAa/nkTrUq0aRq6MVtSySrxwfM9cKEFGRVv0zKBaInZDUXiVLn/SNIEF1C9gemjC5X4LEVF2h3b+7hk3DgeTQlcTYYoRpdVlm5wJv3h7N+0rJf2GsciFdJZqUS5QDdYLVtrvyokHdvNjrFLbSfHfpiU2wlFVFVPgkc9n1lGDHzh62FkSZDgwiIiJmtpKK+jjeIlXsKNDFXuVD1pF3NMl7m/5+ogWUg/uSMP3FtmluZcP8gdiFzpW5iQo8aygLuValM55+WJcIuA6+asFoSoHjQ5v22HRadC7OR1D6/OH69d35Iz5vF0QRxlAO7DsPwTyhQSOwOizrwujWNE1s99dTIvSmKKke7llnyJyzqZYphV+qeyOzFi6A5RyEWXXLUh9fN/qzsYo9Dpqrij5ubmIE8t6HGk9spX08dqId7SwAw28bUeUQaK0cFQA+BYVjhbUofETg+gGWGfGdKcym6+Vv4Q4UBqw7iWb4Xx5joVrSKOvDVyDnd0XIIpJEEhLyswqCwg9A/E1GCx0mye+H886n13KSAmEZJpVVkr40xOTRtun/aMjcfn5uJutpIoETFCFd45E6UJ+7YbUXT5+naHG/dlquzkGci+xN2gtgj7Mu
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(40470700004)(46966006)(110136005)(41300700001)(26005)(82310400005)(478600001)(81166007)(70586007)(70206006)(2616005)(5660300002)(83380400001)(40480700001)(426003)(82740400003)(7696005)(36756003)(36860700001)(2906002)(4326008)(336012)(1076003)(6666004)(47076005)(356005)(186003)(86362001)(40460700003)(8676002)(316002)(8936002)(54906003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 03:18:26.6477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbce5d17-7101-4803-f7a1-08da5a4732cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650
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


Vijendar Mukunda (5):
  drm/amdgpu: add dmi check for jadeite platform
  drm/amdgpu: create I2S platform devices for Jadeite platform
  ASoC: amd: add I2S MICSP instance support
  ASoC: amd: add Machine driver for Jadeite platform
  ASoC: amd: enable machine driver build for Jadeite platform

 drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c | 329 +++++++++++++++--------
 sound/soc/amd/Kconfig                   |  11 +
 sound/soc/amd/Makefile                  |   2 +
 sound/soc/amd/acp-es8336.c              | 333 ++++++++++++++++++++++++
 sound/soc/amd/acp-pcm-dma.c             |  50 +++-
 sound/soc/amd/acp.h                     |  13 +
 6 files changed, 627 insertions(+), 111 deletions(-)
 create mode 100644 sound/soc/amd/acp-es8336.c

-- 
2.25.1

