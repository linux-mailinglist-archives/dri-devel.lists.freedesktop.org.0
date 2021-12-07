Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24446BE45
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962366F4C6;
	Tue,  7 Dec 2021 14:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 255D16F4C6;
 Tue,  7 Dec 2021 14:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb9PPIXS5FhsTcJTizgm5mmGXGZ/5zDFXVRS0JxpBU9fDGfXAF4aYScCecgXP27yCQK0Vufm8QbV+OusNooFNJ0tMo+ODWouCalmK3yKK4GmKpb4waMun36aZm1sjUBNJH7iI1r9edEWpRdu8YYVJPdv9UISCHtfgB2BhyYPGm77E+oDcsvZrYXKZgCFmAYhok+lE5N1TcTwTr/pG2GZFxrFB9f2lKjjFzHXgWsVncoHOxbCTHUFZWs2FnrlopONu/RJFc/CwS2ucuea7uloqEPombwK8mKCyXNlal49IHhq5ACJVYV4Y3TIDB3eIViHT8RCG+Dia0bJ9VQYCtPx9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=CmJ0QVrkKZKFFefxuEwBIjaV9lW+Y4GDEm1rpJo8dLOKkNRtKJxvXqgvrjIf0ocxqK7y9KoC+tCAzkBTNOKF1W3jse99HVyyyH45vKX036IARVgo9J9P253rA4dm6C7duDAIbJBdTZ4l/NRAWv+ubkmdb1S4DtLZ814GeCqUVR4XcDjLaNTdciLG11h+jraJAX5GHsBTTIY379btcrqsXVhvwXPrNP18Qx+XmplKHiTwAfrIfr7XJ2dm1VKa/H4Q7bZGj7oYtsRyphKZybS9ssgql7JTSvI9AFc3Kz7EMOdLsD8+JUI42GmtPmGJnA+e9Ye+h2TEisNh5/EzkoGtTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mjlovj+UAEX9x+cMvz7GKL6/foenGzy2pc9MGyqZto=;
 b=F6Zm4FSttAtxQYw8GoC5zYvxJ2QiMcmu9KU4MxmgWht/L9uxqaB/zV8TK7+riKiE+wQ2oOExxgqb1e4bD/bBLzKD0Y9BqXW9OXeulXqHzVyYmYhQXGelyh4j8HRL6lG377CiLMKbsHYsCzO1yvHq+U7OmMOa1+JDMsl+HTVIve8=
Received: from DM6PR13CA0005.namprd13.prod.outlook.com (2603:10b6:5:bc::18) by
 MW2PR12MB2554.namprd12.prod.outlook.com (2603:10b6:907:3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.16; Tue, 7 Dec 2021 14:54:18 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::2e) by DM6PR13CA0005.outlook.office365.com
 (2603:10b6:5:bc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.10 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:17 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:11 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 2/6] Documentation/gpu: Document amdgpu_dm_visual_confirm
 debugfs entry
Date: Tue, 7 Dec 2021 09:53:46 -0500
Message-ID: <20211207145350.286037-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
References: <20211207145350.286037-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1384aa1b-bd64-45f8-ac72-08d9b99171bd
X-MS-TrafficTypeDiagnostic: MW2PR12MB2554:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB255435CEED5EE0C70822788C986E9@MW2PR12MB2554.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zUD49LFT4SDEAE62w6oUsbNVa019qVTeYLKuIpVnAVaH98FWCMtmX9Tqpq1rI7G5B8fgIIiq6iOTQb6tdVuGGv7pALZzfos6PKyJ69cdZKlJHWBvDEry/SejmEW7tqDrrLdxGKD9iAdjonfW+dYw8Sgu3v/po0hImRrEJ6a74JJWjxMezkLD/Eqk0WdxZ7FGy/d7n9V0VhkbjiOSkqrkpd2p7VFrtpQ2K5slc5qiG2wuf98FUfRGtMKGLBfRc46d2ukBVjyxXmGqX+kgpoV31ExvWNAUefZbOGoIpYM1LEpX1LuvIFhuf+EiJkNILp35aI7x6e1FqikgdYvhhgX3FggKMk30e30VVonIkghll/1y+GXG4xbzuTotMmXCAY1Eiu102MJKEpENyqKcCNXV02VCJ9SQ0zG+MifTtxX2v08zuq7DC8et9fnBfEI6j9Z9ueITdvZ/YHPxJNdQ9YnJVY8S17yHG2bVYfIIOFNrNwTNMJHGin7qLHjZiI3m6tpM36eaNlLwhv0Xes+BEeEf7YOU/ufJYNP6ZIWSppWjUbunL+uWYxEojblykOV9OZU4TyjBku9kFZ1ND4A9NaF9mxhcF7V2IPDOsfCZOF0GweV7sKd4x0WnQpFWJDcsm4JtBllUQiWYELKR7NsfgFb70LUzD3x7YuNvc/kSHQOFtb18S01UQ99lBBL5vOzRwqTeK3oqKlYBivp2RquK+EhlYeo6KMSr0XRNjWRiCw1UGVvih/J2cSUj2yl8bFQs3ZtZHQXcCJmbGsWGXFaRiO4SjlMpbenW3zSPgOaiaRM7fCaFzkp2E2YPL4au2Q98cCIq
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(40460700001)(54906003)(921005)(81166007)(1076003)(110136005)(82310400004)(36756003)(316002)(36860700001)(336012)(47076005)(2906002)(356005)(26005)(426003)(7416002)(70586007)(86362001)(8936002)(8676002)(508600001)(6666004)(4326008)(186003)(70206006)(2616005)(16526019)(5660300002)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:17.8506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1384aa1b-bd64-45f8-ac72-08d9b99171bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2554
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
Multiple planes by enabling a visual notification at the bottom of each
plane. This commit introduces how to use such a feature.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index bbb8c3fc8eee..532cbbd64863 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -1,4 +1,36 @@
+========================
 Display Core Debug tools
 ========================
 
-TODO
+DC Debugfs
+==========
+
+Multiple Planes Debug
+---------------------
+
+If you want to enable or debug multiple planes in a specific user-space
+application, you can leverage a debug feature named visual confirm. For
+enabling it, you will need::
+
+  echo 1 > /sys/kernel/debug/dri/0/amdgpu_dm_visual_confirm
+
+You need to reload your GUI to see the visual confirmation. When the plane
+configuration changes or a full update occurs there will be a colored bar at
+the bottom of each hardware plane being drawn on the screen.
+
+* The color indicates the format - For example, red is AR24 and green is NV12
+* The height of the bar indicates the index of the plane
+* Pipe split can be observed if there are two bars with a difference in height
+  covering the same plane
+
+Consider the video playback case in which a video is played in a specific
+plane, and the desktop is drawn in another plane. The video plane should
+feature one or two green bars at the bottom of the video depending on pipe
+split configuration.
+
+* There should **not** be any visual corruption
+* There should **not** be any underflow or screen flashes
+* There should **not** be any black screens
+* There should **not** be any cursor corruption
+* Multiple plane **may** be briefly disabled during window transitions or
+  resizing but should come back after the action has finished
-- 
2.25.1

