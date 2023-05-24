Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B3170FE6D
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CC610E5DF;
	Wed, 24 May 2023 19:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5817310E5DF;
 Wed, 24 May 2023 19:20:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6hl9HkoCSsdJGQHncFeBSZctBjWNEM7bliR2oPxuzCTzFarwEBz1eWshUiyuZ9yq81yfsx0QLii+muS+X0nM0MQXD6rkgMXhSKrOL75/CDiiBuefTohHZXsH/WJ2awqGAh06w2deoh5LlNMefyvqBCmt/la8SMxkeD4vNBHWc47W82sCEZkrShWanFhBIvawCfS+XNeHJKx2TIgeDtfCTwBQf/CL7eXnI0tULtSwLRBnsuw7425cNJNFf4Sz4rgiK6JfTCI/aNxGV9dfhXYJChVNH2XlrYkpDFGfkyscIYo5JENByu7aLMimeu26W9UOiGEYXnuHEwkoLM8NUJUBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZswGC+wvdudFGf0pzc33Yee4KSj208EDmKA9pMngpTw=;
 b=kqN/CUvocJhURwRWT+bUKmU+xN6F429Q209YMspgrhurk6yHD94LEpYU2dBbY0YMSNxpu1/NyJWYWiicRWsbGzOCkNLd+HaVksJLboFl3qDl3UO8V1y3gQGHNckBFsb+bsbQZxUO/YVq8JHBPFZy8A+PKynI+OFPi0Q/7YWvI6LGSn1KDP+he2M3sJ3bVDe7NLxuhbVSvm4//4lA6KoDJK5N4D4Zq0CxM9UBCwHdf8C/xHcpLAc/iVicpqEq/paLhvTCNqGn4q3F/GQloIQpi/69vSav7fT9cSn4K/jdSMpb2KQbrZcyOMfHpmbBRItoBYSlUADWRsrxLSlW1D8mgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZswGC+wvdudFGf0pzc33Yee4KSj208EDmKA9pMngpTw=;
 b=d2YmpN+XR2uYvJePrJFgT5YxPApzPa3bk97eaB+oE8t1oFJid8Sh2ZnoRW2epOlxGRTrU7JymdJD/RaVuMP5bVuQXNHetFdUA82Std0DSE0+Dxn3WA8I6RnpqSs5U8kllG1WU/4aWraErdH2Z1ijZAnuRozAKLBiZ7Bjrxw/0FU=
Received: from BN9PR03CA0892.namprd03.prod.outlook.com (2603:10b6:408:13c::27)
 by IA0PR12MB8896.namprd12.prod.outlook.com (2603:10b6:208:493::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 19:20:22 +0000
Received: from BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13c:cafe::cd) by BN9PR03CA0892.outlook.office365.com
 (2603:10b6:408:13c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 19:20:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT070.mail.protection.outlook.com (10.13.177.50) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.30 via Frontend Transport; Wed, 24 May 2023 19:20:21 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 May
 2023 14:20:19 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2] drm/amd/display: enable more strict compile checks
Date: Wed, 24 May 2023 15:19:55 -0400
Message-ID: <20230524191955.252212-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT070:EE_|IA0PR12MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fafae1b-0ffb-4b47-7c61-08db5c8beb3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RhlbLYYZOr6VDKctTL0Demh9i8rKVzJozIhBGO3yhpkfJm4TcvBL6Olnrx3A5pkZjjWRNJwi+tlYKlNiOtRRn+mY493DlDjdwrOy4ycallu/tf6K2BB87o4xlCMR5twoQweAmh7VnKR0D+vk3u74XIko4nvMGYHAZ1YwDXVXomDnd60qBQj7tmacd2C+9iokbgaf5JAHk59csNSk0rb3E7qSxTJuYrNlJtgk0dcEBIZNwq/gv/NXUC0IWfoPrbP+88R2UMhZaR0BFEaS1OPV+m4IFH+vnWm8lnX8sVcpVsjdrnrf0xXlxYSCHe3QVDxBpvi4EBGuB0wE7HOeNqf2yXJaLuI3N/ehLmktFNrDCU8eoZ5XYP3+mmK1K+I+69BA+JD22ili9m3ZsSvvY7i0s8O1qSKzjqpl8nMdPCzCwromV4zvhHX8RdL3SPHU8U7qaqVDbMGqHInUf7Y0pZCYB1mkMn0vrqrpoESFdvOkgRewBBKMgOslssPlaVbj5HHHT0AyRsE/zgsp1WCu/mWScf+TTP6L2eQKBV9tAHusyzteBFJj5bpEi1eAIY6HrC+KmdRp7gFxyuT/nZ0ONaB1oXJRbX2NAcO729PT/T+z2lMGwsyfbYvDfni+xPDVLYqxt/Ne4oiCtE7ctWkSmmQtHxtBCWYUGmZcNwFmb0FaJfjOwMVHWaPukV139z2l7hzn5GHKSecTxr7Ksgbdq9WXNRJ1Md1jp3Rw38qYJIEn7Led/c3ddTW62xHV1m2PXa+DsMWhXirIm6GgvKvgCT3xSVO8bEX/vM+FClQu8w+TglAGap+aWmR9jG0/FtUfsVWK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(6666004)(41300700001)(86362001)(2616005)(336012)(82310400005)(426003)(26005)(44832011)(16526019)(1076003)(186003)(36756003)(2906002)(82740400003)(81166007)(83380400001)(47076005)(356005)(36860700001)(40480700001)(8936002)(8676002)(5660300002)(6916009)(4326008)(70206006)(70586007)(478600001)(316002)(54906003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:20:21.9498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fafae1b-0ffb-4b47-7c61-08db5c8beb3b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8896
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
Cc: Leo Li <sunpeng.li@amd.com>, Kenny
 Ho <kenny.ho@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there are quite a number of issues that are quite easy for
the CI to catch, that slip through the cracks. Among them, there are
unused variable and indentation issues. Also, we should consider all
warnings to be compile errors, since the community will eventually end
up complaining about them. So, enable -Werror, -Wunused and
-Wmisleading-indentation for all kernel builds.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Kenny Ho <kenny.ho@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
v2: fix grammatical error
---
 drivers/gpu/drm/amd/display/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/Makefile b/drivers/gpu/drm/amd/display/Makefile
index 0d610cb376bb..3c44162ebe21 100644
--- a/drivers/gpu/drm/amd/display/Makefile
+++ b/drivers/gpu/drm/amd/display/Makefile
@@ -26,6 +26,8 @@
 
 AMDDALPATH = $(RELATIVE_AMD_DISPLAY_PATH)
 
+subdir-ccflags-y += -Werror -Wunused -Wmisleading-indentation
+
 subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/
 subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/inc/hw
 subdir-ccflags-y += -I$(FULL_AMD_DISPLAY_PATH)/dc/clk_mgr
-- 
2.40.1

