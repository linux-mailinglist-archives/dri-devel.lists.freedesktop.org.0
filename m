Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F91064641B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 23:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515DA10E425;
	Wed,  7 Dec 2022 22:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961A810E0D1;
 Wed,  7 Dec 2022 22:28:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/u+RB/3pN+02NxQQVTpbA4M+jcXr/MA/WlVSuggIAb8exSIGGAm9r/9bUiK6GyoSkTYNafU++R3iEzy4LaVI0gv424z3T5nNbQeRaVfMLk9XpTx12jwRkbOvbR78vWtaEuJ7U17/yLurMYu9QeGGlLpvnDfBXZCYtvy9NbI7dAkmbh73quzP0/UJuAV+Z5Y73hS/OwXnHIMb+cYPLhNmikjkDFc4Y6Ca6Z0vmtkolenBEdkwuAMovDBgm9T0/BCGamr65tXRk2URpjJA3A/Lqw1iXwIUzJZhJHMfTvRV0+yo+WLoeFV8FzsEzjAt10FlQenyN+41oSQfFymalwGxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ab/NVOBqrVlAJe9XnsEYOsBMWXV2EUmWQ7uausceIPo=;
 b=WU50l44OGfsDpsy0LbaPet6T2TG6TbiSCS2y9gozYkTPvks9WWIL0Jf6/5nvgD6QYOBI0afSzHujYBy5qP3rNhseStwbfU022PL6b+JyPxil01J7Bqu3NBWBZkjNHQTlbZytm2AmxEk5qAcCb1ZKFf9lN9NLC9D11Wsu+EtY+6uOr3ebg6XIGKmDnpek2uwPcr5jLZOpa3GdF/87wCydzXDZdSO1h4k/zk+mYxxtiLO41kIvanIghQ0VJTzBas4jShvI4Rhw1309BvWjGA1fjfGsB69cmuEA7n1tMqGeqqVBpu5YDsPgtRz9OUVb6WmBOkyFDJqek6UkgHwL+Dk/kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ab/NVOBqrVlAJe9XnsEYOsBMWXV2EUmWQ7uausceIPo=;
 b=NaddtFfOJye3EK5A/yODe0Jua+xRf0D7wk6FtrvbYxEl9DuEr8aLbJ6H7dERynGGCrlVWAELNDRLK9LoYulLelKL1v61aDvihy/twsEN7cZpK6BBP7vr/LSnwQFtzY+WCpjpqA3LSjseaJswWs70Im5GLfJaL31oq6NEUfFo1R4=
Received: from BN7PR02CA0010.namprd02.prod.outlook.com (2603:10b6:408:20::23)
 by PH7PR12MB6665.namprd12.prod.outlook.com (2603:10b6:510:1a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 22:28:28 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::29) by BN7PR02CA0010.outlook.office365.com
 (2603:10b6:408:20::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 22:28:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 22:28:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 16:28:25 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.1
Date: Wed, 7 Dec 2022 17:27:51 -0500
Message-ID: <20221207222751.9558-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|PH7PR12MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: ec679e19-a600-4fce-515c-08dad8a25c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DS252q7IZ6Mq/WI+r+T7L/HceAj65XmHpANpJb7iVqwb+wSDiOMsy4UIHthYAoj+h4V4JdM/3Pyrj2+WvmEkmDm4zOPoyMt61/tv2zfFndiLrm95p1LE2+9HjI8JFjwk8mQtgSvfksUILRHvps1LiL07kUOBCr2gUc03Mbstr1KmT7XzeRpxblIKIl6q6E1TSnC4J8p4l+nuTa8L8gV0B1gilL7z2jfNw3O3amwRyzI2s1vZPEdw/sGBMIOYpYvN4FqXMevzYTtovxAn3IJnDy5I/9BnOk4imjoTFFsUjw9lVtsUAFlBkJekKniU9OknsHoo9VUBSZ83E9VNkcHmZqjKoaxRdI4wZhA0gMNvvib8UlTOwzKcTkv5IC6LanCxtlncg+89oxpRP1jK1MnygGiBUBGfljDlDtkgMoKozloAzrN8COoraMR9CKMjWMM6aBwYfjhorsaQv0/fb60mrZT9AbmTbnjRxXgXRkXKV4Qt7Wcz0e5vZXHw156A3sQBfgBVE+U2KWbThL4kp0O5zGTlEySKHePSa0PNZf1tfwOxgZI1obnCFdAUEV3h7a0PATsZ0VTGpID8l6Qs6yFLeZnSP6rleCiMXgMqP8mO4vMjHqXKVzDPh5flQzc0pspHoZ/rXmFdBdF1O1rkIDjbHG/I9sPTajnZW0npY4khuisNAYzTWHyhUYevvHkAeapl
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(2906002)(81166007)(86362001)(70586007)(8936002)(356005)(40460700003)(5660300002)(4326008)(36860700001)(83380400001)(478600001)(316002)(2616005)(110136005)(82740400003)(82310400005)(1076003)(47076005)(8676002)(40480700001)(966005)(41300700001)(70206006)(336012)(16526019)(426003)(6666004)(186003)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 22:28:27.0493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec679e19-a600-4fce-515c-08dad8a25c55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6665
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

A couple of small fixes for 6.1.

The following changes since commit 76dcd734eca23168cb008912c0f69ff408905235:

  Linux 6.1-rc8 (2022-12-04 14:48:12 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.1-2022-12-07

for you to fetch changes up to aeffc8fb2174f017a10df114bc312f899904dc68:

  drm/amd/display: fix array index out of bound error in DCN32 DML (2022-12-07 12:21:53 -0500)

----------------------------------------------------------------
amd-drm-fixes-6.1-2022-12-07:

amdgpu:
- S0ix fix
- DCN 3.2 array out of bounds fix

----------------------------------------------------------------
Aurabindo Pillai (1):
      drm/amd/display: fix array index out of bound error in DCN32 DML

Prike Liang (1):
      drm/amdgpu/sdma_v4_0: turn off SDMA ring buffer in the s2idle suspend

 drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c             | 24 ++++++++++++++--------
 .../gpu/drm/amd/display/dc/dml/display_mode_vba.h  |  2 +-
 2 files changed, 16 insertions(+), 10 deletions(-)
