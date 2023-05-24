Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159970FE58
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 21:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB1610E591;
	Wed, 24 May 2023 19:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062.outbound.protection.outlook.com [40.107.102.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4812910E591;
 Wed, 24 May 2023 19:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juIsngSoVoziQN8itJJCReqSin6D28h6WfVf49WqNIOAx/nwVYGV331/rGmJoKxzSfbN0YsiwBP1mlZeoEQ5v35TdikVe9GavZwEYb95vzGBSx1wvMoSHR3ioQ6Owon7l1TLckMsaGPBNQUztORJgRwRkmlKT9MnzvE1Fd8dfVJp7+I9RbVLiaM95lmALPwZDNAFN3GemxvYkvKoEFhuZrLDjfjDvW0+4R/NIB1OxJX/DM7+Xt7cpNZWaMDdvCIUjf3SkvlyXBiCeE2xEAAEUe6+OS9dp2Y2Fy/bNAbg4SgAGUDB5vz2DV6X0IHaNJzR1+jNNsvm46/kFhBYBwsMXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQBAyPGXFsVGQUphORVfyEPjDfdDcNUK5WVsgDFJNfg=;
 b=F3L0abHI4ZNYzM3adAWUTD0OfEvn6k+OaTUs0QjFH8VQVDTx9NuxS/yAJHRdOuVM252db4FRMjobnqnfJXXT4zmV3eHFHH7B8uPusNTvPkN/yxjLL3vRgJAg+bM09panTF7hCcnUz4zEEJwPYLUBdwjvDBowkoJ4hC9Voge+HQC4nqeynQWpuBt1xI2QO+Ldww7bVxNdvX26kyJvv4rQR7o3J2bSO1uh/fzRN4hdx7Vv0gWLMldGnB1nnxII9jqaPNa4jCiSvtjBapXg8+Mw+Cl0qUVolmPhSHAro8yTqwcY9DuCJ/MJMlavX7X/9F0eeK8dntBsQHPyvh0AC7RCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQBAyPGXFsVGQUphORVfyEPjDfdDcNUK5WVsgDFJNfg=;
 b=fYJQotjiwIw7xv+5uMuxTL34nE8qVS2JhQpZCe8e3yyIuCT7AwKiC2LWMAbRiy5dpogFc7gWuvHWY9ynCgcL9xiKT8bIChe5r7SmtvFTIdcRCMzT7l9ilDs6gf/AWPEa+gWiuHt0i3v4aWr5TnyT2BgjCSGnnAkgm+oft8VVKoQ=
Received: from SJ0PR05CA0081.namprd05.prod.outlook.com (2603:10b6:a03:332::26)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 19:14:46 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:332:cafe::8e) by SJ0PR05CA0081.outlook.office365.com
 (2603:10b6:a03:332::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 19:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.16 via Frontend Transport; Wed, 24 May 2023 19:14:45 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 24 May
 2023 14:14:43 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: enable more strict compile checks
Date: Wed, 24 May 2023 15:14:21 -0400
Message-ID: <20230524191421.251221-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: edf958ff-f2a9-4a3a-59e8-08db5c8b228c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aLCdj336PKaK+fueoqgRfKdSQmF3p3HPvPmrqqz2LLp4S7cGw2acbIgIQDGwx3G8xdC7Pb6Hp5m3GUO2jajIk6c1KcerAa/iFOW1FGNCvKDbWoRDT+IZo5I0od1vPIb7pios8uHOom2HiDM47lNLw9GVf/Xz2+vj0xZyzr4amMgUAHlzOaq007ElTbN+rDr6vJEkMzWluO8xJ1eJJy7WEEXWUm0vroqht4Nptex2EZxHKgRV7UVHbAgveRCQtwn3ugmaue/l5Xn9t0H7Gz6jagies2DP0tpDnkioEiluCMQL+n3gwJTtDtxzYuknNBNkDLx3B28Y50ifli4KlyHqFlxKAzI7Q9e5abSDDHDlBeIjBSvsdd4SVWzP3LlBVjVy1bf0gFm0IXob/P/B254p42OzKqOBNFADgRwmL4fOyQiG1DpqeSXYHGRH4s0CARKxn0zqbw0EWzgXw+ZM/a8wWG/vTJaP0VHL9SOhQXuwT8juUDqWoaf09J6PkD7YgujLwhBsSssLgktnaJBfzYDP65BPOXFHxRnlHATxmWLUQYRnYIHIee+mrmLRh2+c0hMV92mutEas5GnUCoCODdiL5pe+Cl3wLLBfyRG8On9CgTxzQCgezbVTDy8Jx6tMWvZjEQXNopS0G+hBpv7RHQLc8GcHS3+M9629MBD43pblB3yV1MN/c0SyH4c99cRXZk/QTMys4v2MUa5xiSiLEMYuwIJrPTT1i0JNeLiXmBI6kck15hj94GtCdVqjNul1xzxWplcMMDnBD8xbam8O3ghmfYj6tUDo+eiFHoXzEkqhrUseqV4p0UyLCsENST81mWVd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199021)(46966006)(40470700004)(36840700001)(54906003)(2906002)(36860700001)(47076005)(82310400005)(5660300002)(8936002)(8676002)(44832011)(6666004)(40460700003)(41300700001)(4326008)(316002)(70206006)(478600001)(36756003)(70586007)(6916009)(40480700001)(81166007)(86362001)(2616005)(26005)(1076003)(83380400001)(186003)(16526019)(336012)(426003)(356005)(82740400003)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:14:45.2108 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edf958ff-f2a9-4a3a-59e8-08db5c8b228c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022
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
the CI to catch, that slip through the cracks. Among them, there unused
variable and indentation issues. Also, we should consider all warnings
to be compile errors, since the community will eventually end up
complaining about them. So, enable -Werror, -Wunused and
-Wmisleading-indentation for all kernel builds.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Kenny Ho <kenny.ho@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
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

