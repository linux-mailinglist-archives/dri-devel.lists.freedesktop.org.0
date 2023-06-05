Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025AB722EB8
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 20:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9A710E1D4;
	Mon,  5 Jun 2023 18:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2083.outbound.protection.outlook.com [40.107.100.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1520610E086;
 Mon,  5 Jun 2023 18:30:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+9NnUvFL0EoW9tjtoDo4IV/fFjEcjbxQ4ZXZgWv2xgf3plVQMvVRcUC8paNgnwJxWVMWUYDqpEe7svVc+dvQeSxwR/4noyUNJcUxsfaHnAm6vdP1Qbtcpfjg8YHcsrq51IM+51DhR+1r93ncIu8FAS/bHLfZlJg+tVEpeDEDEjg7vrQZNBzx4DWlEdBOiEzgZw6pEy5cPb2yb9gzCCJiG5XokKTnoB1fT15guSN2bPhODYEJLLFQdsorGOvJB5BhbXzwS4BGZd7xdTBIn/8/bMLAmcXv9MMVVmfVJVIzh4dBtr9x6emH6oU9QTXPALmUFPmdM8afw2eiCk4JOVZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pppZ9m01uGrkWk8pix1ay+7Y+tLg7NlvaxtIw9LKlVw=;
 b=QvvVe0ZHyof6FcciGDfVOeoqJzYXp8mn80fXDw0cVcRQYSKTPvkOgvLHXwwwfPYDYUeRYleOR+oFP1Us/vEQF9jneFTWSqnP3j8oCCRpgAv4SI29Fkzm4x1vRO4Zsdw9egAX5W9ZE4FAAjcpVBaYW/znfScG6/EmjYLlsH7C5h9W823KuwoD1nh3V4bK0JlDpyPaTuNEdWzvB0OxX91BdklzKQqxAJu1R0/wx0Uo+c6cjGXomOH0XPHLRdiS/ZpSLRgtjyiPf8eyeb7bwr9+7v3chzOCRAw+c8/T4kqluGLlNcvnM/S6X2IVfkKJAyruARogs3NHLqC59DIeGhM8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pppZ9m01uGrkWk8pix1ay+7Y+tLg7NlvaxtIw9LKlVw=;
 b=2KHgmptyNE8yN4+ff/ZDz4ZI5759KkQmljzKTDXtEFA1PirTLJFepdi2kLH1T4fH55Mp/43YygPA/h6WqhQBcO2bHIxw3v8oVKWjCMhgpCYN2pnRrkaeFEFLgVWqcU8OkZpz0G7hjvp91dIhI/J8bPkkoxWJMzF8PR00S7fm6xE=
Received: from DM6PR06CA0019.namprd06.prod.outlook.com (2603:10b6:5:120::32)
 by DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Mon, 5 Jun 2023 18:30:43 +0000
Received: from DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::cb) by DM6PR06CA0019.outlook.office365.com
 (2603:10b6:5:120::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Mon, 5 Jun 2023 18:30:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT113.mail.protection.outlook.com (10.13.173.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.33 via Frontend Transport; Mon, 5 Jun 2023 18:30:43 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Jun
 2023 13:30:41 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/amd/display: mark dml314's UseMinimumDCFCLK() as
 noinline_for_stack
Date: Mon, 5 Jun 2023 14:30:05 -0400
Message-ID: <20230605183007.204399-2-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605183007.204399-1-hamza.mahfooz@amd.com>
References: <20230605183007.204399-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT113:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: e407c002-ce7e-4afc-5c13-08db65f2f8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eGLibnA3SNv38TYgXc9CR/CbnCnLXNTC5fwvBRo60CVfht3+xvAVDnlGDe2YzXgWki45KVnnvxDwrn4sKhhhyMC1zRiw+CqVVKOo4SgRtwvs0HwdDUQ5ASiSASDRXKHsEW4GjcT1qTTJCW5zSwCqG85dcia+c2i4HKT+sK8/3gHH3s67/A6oMLkqQkjkWZm51/rc2zZnhe3Q10bVALlO8Ef7oTPXEjpRghEl25lRbxFh5sFVbhUPogSDyWmTpapkzIdh3wsIi1MtsGekV2ntiOC5ag7joPyvnbp8EF2DI2XEbkK0bbh8O4F4BobpR/iOPscNJ1FWh2mFGNDR2mAZFPC0IJGbkGdUhsf7jMOHmjuDFF2EIOQODSrhQ7ShPlsxvh3ff8+3EHBgiPxbLWCS5837ifIC3GPElUa3xZunF3j8/KpCa7qKY22K19utt+dxsThB34WKAHt8alt3buc1XLPkTwHePwuCsvcLVivhZOrf7sEk5MZZGP+y3wWo63WUHN2Kaa5gUbG3LH/V+5qUV9r3bcPmrQWiZDLtMx22NxTbkNlSusi9zgziIStHDP7B4VdloQN7SEGeIWJ3Rc2dftWlnv/rnRgVHCAtiEH0oDd60AkIlzqAteIoEQof3rNd5oGo+IHtwOu+JSW4lWSA5cYTp0adyNXsW+kQzxvzzpnLzu+jmHjrr8/DaVyzrlYZPWnyt2eJdU9MKpeopYnPenrsn4L7GNLa7u4PA1W1sDyshSUU/p4TQD5WgRCEtdhsBj9rMZCOFnDlHAJ4zPnlmpNvsyJEklBFZgElr6gAtSqY9X8g7f/cAY9gsNm5Xkod
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(40470700004)(46966006)(36840700001)(83380400001)(186003)(40460700003)(47076005)(336012)(426003)(2906002)(2616005)(36756003)(86362001)(82310400005)(81166007)(356005)(82740400003)(36860700001)(40480700001)(316002)(41300700001)(6666004)(5660300002)(8936002)(8676002)(54906003)(478600001)(6916009)(4326008)(70586007)(70206006)(26005)(1076003)(16526019)(7416002)(44832011)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 18:30:43.5072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e407c002-ce7e-4afc-5c13-08db65f2f8ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
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
Cc: Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, Paul Hsieh <Paul.Hsieh@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

clang reports:
drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3892:6: error: stack frame size (2632) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3892 | void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

So, since UseMinimumDCFCLK() consumes a lot of stack space, mark it as
noinline_for_stack to prevent it from blowing up
dml314_ModeSupportAndSystemConfigurationFull()'s stack size.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
index 27b83162ae45..1532a7e0ed6c 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
@@ -7061,7 +7061,7 @@ static double CalculateUrgentLatency(
 	return ret;
 }
 
-static void UseMinimumDCFCLK(
+static noinline_for_stack void UseMinimumDCFCLK(
 		struct display_mode_lib *mode_lib,
 		int MaxPrefetchMode,
 		int ReorderingBytes)
-- 
2.40.1

