Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 184C752C40D
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 22:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94BC10F573;
	Wed, 18 May 2022 20:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C40E10F573;
 Wed, 18 May 2022 20:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hoa3q4mQZZEa1Gfw8bUNsNUvrW6IXvY1pUtL9LbEjYsEVAkQNLFvmsziKD6jOpAkrRmCfDbvM7i5RjRPIcKOrPK6WCpTQBMGxavS6QT2iAkzaD/iTb/WYRj0XP0GDz6C8b5WjGnWc7A4fORZqr+bqMeOFVxa70O2+XYrKXhEquhlq290Y77FguYSnP0Ff0PzNkwjlhn4E8IVgiGgC/cds53VKJ1Aejdy86J1KOLnTz2qljG3UT8tCUYdXY+LoM6hdMBHeyGOBMX8REzSEUILuei/TQ53lRCaE28cHZvc4rg8Yp6+8y9lVovwhWtZdbZeESXnWuz9P7ZxT58mrS6fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKTrZfs5YMK11IFpmVAIQDsXJR+ECn0eNPl5PST9I7o=;
 b=M387Xl6n3i/adLtEUCElKslotLpqtayvLBpnsZ64jJZ9nFqbug/LUMZPdEKdm9DbqeWkrR64ODf0RCdziiH6Sww6BRt3i+oCwcVeZ+jEwNZyHIBNdltQYJWhcUBFiY/2UHvCFAu2/HV2K3jl14YNhD/Lgh/Eu1Zq1AMxdimgcYlJeFpvU47Yhqa+D1qg9mAXMTuNhPi0JgmYztHDtJ/InzvBFn20WuT5XsBxw/i7Fr4K9ddEZ/Dc8u2zmmMYiXRwaadWbTZRGiMNukQiae5NW8dbYbgfK+jwHs5dE2V59cYIa6hxPejPQrn3H3dMe+RtZW3lMfN2JUje6Qir6BVNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKTrZfs5YMK11IFpmVAIQDsXJR+ECn0eNPl5PST9I7o=;
 b=l1+nMjUeju9Z6VyXwPYD21/NSqo4wr5zsR2n2x61TxpDD3R+hHUXNoe1VCKpTJ9lQRPzVy9ko1EnWrvG/qJTxJd/Xm77jNoXG89nNzfRmNkylbG3NppBnlsFvqZIbdQYzt/tCrvFtqsf999fwnQ2jlriolLMKJgb/qnt7D5SNCg=
Received: from BN9PR03CA0444.namprd03.prod.outlook.com (2603:10b6:408:113::29)
 by MWHPR12MB1680.namprd12.prod.outlook.com (2603:10b6:301:10::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.16; Wed, 18 May
 2022 20:21:04 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::c) by BN9PR03CA0444.outlook.office365.com
 (2603:10b6:408:113::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14 via Frontend
 Transport; Wed, 18 May 2022 20:21:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 20:21:03 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 18 May
 2022 15:21:02 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-5.18
Date: Wed, 18 May 2022 16:20:45 -0400
Message-ID: <20220518202045.9123-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91ed25e9-272d-4e93-b600-08da390beea2
X-MS-TrafficTypeDiagnostic: MWHPR12MB1680:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1680B3F83AFEC38189DD4476F7D19@MWHPR12MB1680.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ibOkLGrXh04h4zXv8BVCj13uAnV5mDRUArLwrES5qL/GYmTHiMQtC9lBKcy5a1iGWQvnxC3nVxiuinZi1jAB2H/nwwEWoEr7LT8YTHXMJC/DxokpkWnBx6hGMEaTZGYtwvmXe/vEIL2MGFW2U8v905zQGsYDRQ1MNH3NEVEwgco6wbk/MOnAGyOkz2Or//EDbaO5URToNCfvwomGpjjk+COPqQ23VHlBhhYXxvRtpAvz1YffpJo0DSRYYF7ZkuwFJcX3YC9+2x6uwFIo04vzQn1CuBZrppqPr7Zod/4AtfBnn5RIJ8xm82zt1fDiQ0CUAiGbBD9S4LO8PrLD/2U/ZbHT+M58BgOUNEyQdza236jr3bTYTyo5ya1mI4e3q++SMaE0kif2iHPCI8nLhWoVzX8GuUlQIu33ZaUZHBECOhW8Ly4uP/62KkSQQFDznHWpWMrWdnAQfdPw2wcgv5keDaZfbjL5u8IaYkwi4wLuSOEpbLRrCggmqPZcaQ8X49leIUwYFuMNbdN6LS6s0Uc2olzCNvGIEGrehpLejCdXoHQTSxSabxUxitCeCvOBjuCuUGREMFdqyJt4E6GNq+yQyynrwMnz0qC0S6bmCBAT9K4H6f/pdp9mutqdbhxddLcy7IyqCpG7bp2fQYmf7WEaiwbZmUWfNmS77KsJ+Rwd5/B1TKKYFiw747HLW/Fy8Eso6g54D4NpW0BVFvsSlgda3A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(81166007)(86362001)(83380400001)(2906002)(6666004)(47076005)(426003)(336012)(356005)(16526019)(186003)(1076003)(316002)(82310400005)(36860700001)(110136005)(70206006)(966005)(40460700003)(8676002)(2616005)(36756003)(5660300002)(508600001)(8936002)(4326008)(70586007)(26005)(7696005)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 20:21:03.6629 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ed25e9-272d-4e93-b600-08da390beea2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1680
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

Just one suspend/resume regression fix.

The following changes since commit 42226c989789d8da4af1de0c31070c96726d990c:

  Linux 5.18-rc7 (2022-05-15 18:08:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-5.18-2022-05-18

for you to fetch changes up to 7123d39dc24dcd21ff23d75f46f926b15269b9da:

  drm/amd: Don't reset dGPUs if the system is going to s2idle (2022-05-18 15:24:35 -0400)

----------------------------------------------------------------
amd-drm-fixes-5.18-2022-05-18:

amdgpu:
- Suspend/resume regression fix

----------------------------------------------------------------
Mario Limonciello (1):
      drm/amd: Don't reset dGPUs if the system is going to s2idle

 drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 14 ++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |  2 +-
 3 files changed, 17 insertions(+), 1 deletion(-)
