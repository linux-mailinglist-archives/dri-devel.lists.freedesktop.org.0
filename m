Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823046EFB1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122710E2BA;
	Thu,  9 Dec 2021 16:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B5010E120;
 Thu,  9 Dec 2021 14:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDikBHrE/4GObOAKGieMj9DmfScFeF8rPRgYN5ocCIZx3lSrlal1v4gtyma8oQn7YjqvfQhjPlIlVA8c5Fo9iSxsmzj4xwIkvjlGQLZRM/xRkYT4qWyM1OO43CeBAN63TwI/N03Ml7tYabLnSF+qgC3zpfyuuJ6a/H7ENBd1uBEQ6Er7jmPHl1RTYW+LXwbeWBiaHEbw0kgi0Pky0ZXVvFPsb0Z72OyLGQ5yYWd8dh3nElPFFVjk7egNmjqjnS9j9t8ydnKCRVm0v3IvfSs4+wi7hZrWThUuo/+yL9JIOI8FznZ8qEuxa2pAroJdmO7cGEnzbiqAq5TTguTB2RbNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=AQs2N+PpMLkIi2hefQB1yQ5DVMkCI9B/+/OAdqpfcaHF2aLApN3tvJ0fCOYiwPzQwNQePurHQvVt/4DQpjhpkQpUEtNK/qfc+EpG6CRi5RJyDxk3l7RoKV3+lueWWL50fdabTuZExki4OrV/TgjP7UIKMQzJJK1dAgdmSnJOYOIvwiFXm9vRwCekg3Pb+RXco8vn5IR4yRKxM3d/CVDSjiMsKbqwPdz2SlhCRi9tl1S2/b5pDpMwu/Sd7TUb+zGX5yPOizFV53F1gViMItTzIlmprjZmSBsj3yZmaRzqRJ/0APTuujes9bV8RHa/tYnHR3GJAmPwU+618WHJmVbEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=xxXD52f8+l5xAi63OV1MuGjVD0GNB5hns3rxAgOSg7wRxLqM4HNRegMdMjC9v2SoTyX43bDFpfS9HkzfDyxQyplXlGhHOYHhRDOm7Pd8ICkkmnEDbHub+7g9FPibnOg3mYomcdMvoQoF/VFKponZDviFezFU1X2uB3oKiw1d2S8=
Received: from MWHPR1601CA0009.namprd16.prod.outlook.com
 (2603:10b6:300:da::19) by MWHPR12MB1374.namprd12.prod.outlook.com
 (2603:10b6:300:12::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12; Thu, 9 Dec
 2021 14:21:06 +0000
Received: from CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:da:cafe::66) by MWHPR1601CA0009.outlook.office365.com
 (2603:10b6:300:da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.13 via Frontend
 Transport; Thu, 9 Dec 2021 14:21:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT012.mail.protection.outlook.com (10.13.175.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 9 Dec 2021 14:21:06 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 9 Dec
 2021 08:21:04 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v4 3/6] Documentation/gpu: Document pipe split visual
 confirmation
Date: Thu, 9 Dec 2021 09:20:44 -0500
Message-ID: <20211209142047.728572-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
References: <20211209142047.728572-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2189078-a320-4f3d-54a6-08d9bb1f23d7
X-MS-TrafficTypeDiagnostic: MWHPR12MB1374:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB137446AD5CD2CF150B89A69398709@MWHPR12MB1374.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7PRDYcdbTpIhXTLqTnyFClVuGNi0YOVJrzO0kjuS2Jwwdn7YyvkHPRCPCMCTQg93yfaWgDc9Mba/6KQtdF5FUsBSUZBjmi6rQIi5TJwZhrYpS0g87QndnZ1iTTib5nmLWtf7R+KnUuCOBvrlL7St4qSwkKPokG4AxIA0JNdRE1PmesgNcPh1+3p/+6ZyCWHVKC5HUdNkKvyIO6C494a8Zq3YD5IuwLGqwaBVbLcEZEUgaivUfrCewBFHiVTanpb8nWciJXDxioPzXiq5U9M05bDx/I+g8DRw8fgZ7VRW5sT0F2p5YVpRld1vReQo0qw42XKoAI+ylwDhT7xQebl/vFxvFXbXrJVAOaK6487kw4ZOn6egen/EcrH8u9PO7TPfK4S3PWyQloNd0SU+EsWsiyDLsg3bMrG90x5cRnm/ZkD7pMHHRwGRqGcGKaNPoUFqQqPDPJ7yboDqCJuLsbCqqnRfIbkUpQTWFhZlEDTsowTkhJ+x2isLnoc5frXIEiSK36sMPBlnpgUaPg47PD3mTwtcf6jvUUnX30UHkZutMboxjONWxZrhlWU4KRPKgJ9z6kIczyyDuFXIAPugzmwv3FSI+7RzeJcXfsGqkWDbQt3AD7So7KzGEcJ+A7poNOS+f8zD5MkAAaOHRZxNAuBxHl8f8rj7jq7etU+oYTrtkCE+sg1XTgbkSWipO2xZGpToHxpUysWOlvnI4VfxmWVY5OfjDKFY51VrZKesSCyXGE5Tisv209+6WzUZl081lJYOBuyaADtfaAWUxPKJ6LVS9wY81tPXYXIf51P8kWezekwvOcHVmnMK9WWlwJwL1BpX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(2906002)(70206006)(921005)(54906003)(16526019)(508600001)(8936002)(47076005)(5660300002)(426003)(2616005)(70586007)(83380400001)(6666004)(356005)(4326008)(7416002)(336012)(316002)(81166007)(110136005)(86362001)(26005)(36860700001)(1076003)(40460700001)(36756003)(186003)(8676002)(82310400004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 14:21:06.7793 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2189078-a320-4f3d-54a6-08d9bb1f23d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1374
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core provides a feature that makes it easy for users to debug
Pipe Split. This commit introduces how to use such a debug option.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index 532cbbd64863..6dbd21f7f59e 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -2,8 +2,18 @@
 Display Core Debug tools
 ========================
 
-DC Debugfs
-==========
+DC Visual Confirmation
+======================
+
+Display core provides a feature named visual confirmation, which is a set of
+bars added at the scanout time by the driver to convey some specific
+information. In general, you can enable this debug option by using::
+
+  echo <N> > /sys/kernel/debug/dri/0/amdgpu_dm_visual_confirm
+
+Where `N` is an integer number for some specific scenarios that the developer
+wants to enable, you will see some of these debug cases in the following
+subsection.
 
 Multiple Planes Debug
 ---------------------
@@ -34,3 +44,17 @@ split configuration.
 * There should **not** be any cursor corruption
 * Multiple plane **may** be briefly disabled during window transitions or
   resizing but should come back after the action has finished
+
+Pipe Split Debug
+----------------
+
+Sometimes we need to debug if DCN is splitting pipes correctly, and visual
+confirmation is also handy for this case. Similar to the MPO case, you can use
+the below command to enable visual confirmation::
+
+  echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_visual_confirm
+
+In this case, if you have a pipe split, you will see one small red bar at the
+bottom of the display covering the entire display width and another bar
+covering the second pipe. In other words, you will see a bit high bar in the
+second pipe.
-- 
2.25.1

