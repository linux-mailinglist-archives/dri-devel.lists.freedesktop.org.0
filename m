Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AC346677F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 343176F8B3;
	Thu,  2 Dec 2021 16:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2068.outbound.protection.outlook.com [40.107.95.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F076FA6D;
 Thu,  2 Dec 2021 16:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngigZN6cIoafF9UwRFaqQeQHlhCTDIB1W2zmdtHvkkSAXffI9HeJ7skoE/NgvNUXPjVuSQqzY83M1CT02JK3sfVtCbHclLRnUM4XRKlRcApc960o0Nm68lKMkdhvyoJemoX7EobBArDlSqFADKLDvnZVbH2YPfHnhXQREew+BElVrJmf1ohZZuIRSrkR165G/QjWObbfNuoLkiqcFyIwaO+n5UYE6KIfrm4vbEYJbo/n9AvC29E5tD9s+znbJChPHII91IBINFCpT5lV+0qd87UIwibi8oU7BeW/bU38d/BjhAiPspegsdz/NuGyTt3vwh/o6MEb4g1fsQqAXkGU3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=MN6Uy51R7tn7Ty/J6nXrak2Bo6ifxAD40JoMxQLFf02pDpTkSp52A8QgttPGYIG8EsQjAowyPi+/IskUQmzUOkODMF573cHR/JZRP1yHS2sGcziSLoRlAqjo8wQvSanYbxw7fZHDdh7/yZIqX+RgPA6NAGr9lX9OpNqrkOZ7qgbZYSyQX3ywbJ1USmpl7Pm+1ris40+74S77kAgDtr2ijb4z195cOTOoS8llFouzSytrHAMN2Atfx+79QvRB8XJRcP2zPe2OmypqprXZMN1+0XT4xltVX7qd8WLJ6mQAU+8u0trbgOIvhaQInBSgjn2KRKYLt++C9oW0oPgBNHH+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=4g1kL8/wB/MR7KlbE+hkAMJpbIIiU6cqTDr+13fE1yyU0Vd48xHrDmLt3mOhRWa8phLjVfRINNf+La6yZxu4WCfgCtuSVzWgVPKKhN3c4x3sDMPv28/I0fR4ayBkTy7JQ1cz4265T59ZOCn+JHxnu2BPalOrkWYbAEdMW41ogy4=
Received: from BN9PR03CA0138.namprd03.prod.outlook.com (2603:10b6:408:fe::23)
 by BY5PR12MB4885.namprd12.prod.outlook.com (2603:10b6:a03:1de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 16:02:03 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::90) by BN9PR03CA0138.outlook.office365.com
 (2603:10b6:408:fe::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:03 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:02:00 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 3/6] Documentation/gpu: Document pipe split visual
 confirmation
Date: Thu, 2 Dec 2021 11:01:29 -0500
Message-ID: <20211202160132.2263330-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
References: <20211202160132.2263330-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd905799-1004-4a8b-1b37-08d9b5ad1508
X-MS-TrafficTypeDiagnostic: BY5PR12MB4885:
X-Microsoft-Antispam-PRVS: <BY5PR12MB488539BFCF16A492DDF92E4898699@BY5PR12MB4885.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7URWu3jJpmfLEys3SMQdMrdElXfZpJE09lmItX6hcb19qJQHDvCOzkMNWSJ0A0glQbJOxlgdsedi+zIni4aZ9w13deGnwKMhL0Mh4FKMbO6Rw6uIgXtvmBHFJJiQJs6IMtgJvsThKjVtAFdPxBU+rMZLKEZbkSsn7gJVCE2khakIX2rJ7s5Oy56zYEH//Lf+F7sG0YsJ4HEFbrQ2u5RzlJ9mozyA90qjNvmH/RewvqsMnLSR7QZP8DqR4lNbfh73P6Eencr+j7Y23kczHUPCYUpylJIKCNj/uTPS6DvPTCfU1g9aXoImCb1//8UguMv2+8vejM0HrGnI1vBbSJB7ffDomROKITReAs2eGzcsc8tFpCjm57f4vZSh4y0I9yvVVML189j+FvztwQSyM6HCrynbzwZemgK8m4T0cK8pGjOZ3dDy0+cDpg1OIx+zvUC6DE4L/7p8+lW/v7bzUxvI4767KfOgaEAjtrSqUDRQIKxo+h8w64DFxEJwDhGvgR0HLQvhv1QlHLNkezgluZNM3oHDA4TAkyW00uRUr/luZqX0PpAETe81wi4fLNxPejU4m3z8n7Iqr/xLoKGuMcd66/+SRFbDOTaeVoJ8MWhrgeNVzOp8P+vwUE9EmT7LAJ28IdSMGp/RXtgCy1BMWweUbRg2druoEdAkFwjlcL2V3ej2Y0LU9ObRyFVJjH/NirUk4oqDQgX6sdklrrazyHwTsB7LofIo/Vqk98j5+WjzI7FmR5hawZ59yGfFoa0syywd86dyiTa3muVgHx9FGAtwJbWiTRhCo+vwdaKOYA9j33PC0QfyfNkRePRcUDqnt1D0
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(70206006)(36860700001)(86362001)(110136005)(8936002)(1076003)(70586007)(508600001)(921005)(54906003)(356005)(316002)(47076005)(82310400004)(5660300002)(83380400001)(26005)(2906002)(6666004)(8676002)(4326008)(2616005)(426003)(336012)(7416002)(186003)(16526019)(81166007)(36756003)(40460700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:03.5989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd905799-1004-4a8b-1b37-08d9b5ad1508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4885
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

