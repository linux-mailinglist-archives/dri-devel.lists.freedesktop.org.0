Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C3B45DDA3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D6F6E9B9;
	Thu, 25 Nov 2021 15:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EC66E992;
 Thu, 25 Nov 2021 15:39:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2TtDOPtViimhqQ5Wvg0RcsMwZdFujNq3ORKsWgcbgxFu/tg3Dso7LLSCnnFcea650hXjl9rlLD577QAWG6+knb2M5KI8KsCSpkG3h8+ANlKZQjKkugUepPI4VGv63RRF8923U3bW7eg1pKfJZHxwG3Xy0+abycwMZaLo8GBHcHelV/ttk5naRXsF0UH9WgwB5nEB/9PAzIp7ix4wOobhfnWWa4GVGPfepJWqZNtELDEKmMcYcFtUnyh01ZNuMnXmn9wR/xPZqBFDOVsEOkYbKjlTT1nZ1H64sySFEf6NlBNVHRFxAOeIa5usFEBL31Ka6nDaffHmlKC5ffIpl1nJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0sfyX8rewW8zfLYEzw5yGHmfsHKGuwNnAb2ozuA4XpI=;
 b=iTh0l2XbrcIy4HSiyKzOa4A3OayF4J2Iyf2KDrFkCgleE3HUTNvV4bKNkjKiOGl6kfsDnRALNx/1e03vVoSIED7GZS9IpHz/f+OOCobC70NdCJK0PrEG5tm1boYlWbUZ2T5+sP0inKZK8XMUt/KIVXVkRUEOB1X9uwMyG+li5WhcP7b7OErQl47DvgN2cLIlmHNU2sPST8u2ig/ro/+1TrVXqwnmgTS3JD4jC0Gy/yUGUrCEu3S+J3+qMX8N15vp3fUjdlI89yKfT0Swpjcs4ahZdXWTj3IqB5BXqffta1JLc+tIrvgCtYtWsM89ReguM0ui6shQK5snVqbLVsai0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sfyX8rewW8zfLYEzw5yGHmfsHKGuwNnAb2ozuA4XpI=;
 b=KGxF4fMSoDOcHk7W2q+yW9aZzNC6ObxMgUg4nHa3GVJu0FdeiINYOgbftF2+TzGVFZdzk1VEtqWi5Bhfg4u2NEsVFiVgdDqC6K96Gwug7mneI67tyvr1WCfFOo9dvbaQQKXUQME5WWSNjm+6VLmjqD+qJ663BUJh4bMp3XK2+ug=
Received: from BN0PR02CA0012.namprd02.prod.outlook.com (2603:10b6:408:e4::17)
 by SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.26; Thu, 25 Nov
 2021 15:39:37 +0000
Received: from BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::a) by BN0PR02CA0012.outlook.office365.com
 (2603:10b6:408:e4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT009.mail.protection.outlook.com (10.13.176.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:37 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:35 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 3/6] Documentation/gpu: Document pipe split visual confirmation
Date: Thu, 25 Nov 2021 10:38:27 -0500
Message-ID: <20211125153830.1352994-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8327eae1-072c-4e93-a422-08d9b029c9aa
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5405:
X-Microsoft-Antispam-PRVS: <SJ0PR12MB540596E696729C2FCEEDC1B998629@SJ0PR12MB5405.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bow3XxMfs14Yv1rhu3k1N8yJG7fpExIGEFQMnx7gCMrIkUFpddbL8jEnkj1S/spvQubDlYV6hxKoPYzD0DnmntiDFqQRZjTMN9Qx5ZAIDneuKJs7y7bB96w7dKd3ExhV8bsbLAL9NN+w50p9KkWoasJhB6gO0UnukVwvaFdIPP/HVMeqO8rmiwZGG46z/I8sll5hAyuo96dsX7FXwlPkBFWjcDvRZNpUoxb5fWxlbA/7gKyda6DgqGIDO8V4ClnDnO6ppYUq0cp8RgxaR5B2kHPKoxUop7slO4OX6oMOmw6LzsVAs5XcUZos+bdYwzXflIyuGfMDlyG1PSavPAuF+G+EXyauCkHFhnxerfj7+08bflubpvX76ewmvzeIDly5sLFGyS6ApJPD4dtANHxtnuIVbZANmNN7QIR7X52xnzLbSHNbaeihIXu9QTQUsSUH5grZYTpIuOj9HL1HKaNpha16x6avV2qhyZD5KZJ93R1imvLUdepX/yinzIdF+Wge9Mtd6B4V+IihrzTgep9VsE9SPlMqyBS7l9razuIkgMWbPYQFcWGBZZE3I2ZwW/u1DkbG3WBz+pU7juMrCYBGUvw0QBOY368Sl1HpeLCUctUlej2e9+MlsDVC+cowxWIJM1acWULptW/QHU5XE6kyJr35VE6aARUjPrccrxW1kN03gclitOKP7jkcA0ValFztxKCMjxL6IW4TNGP10U9tq21UPXQrrZQ7rtIjxQAvGOcDRUrmhfhgkT08RGCYsxay
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(54906003)(110136005)(8936002)(316002)(8676002)(36756003)(2616005)(4326008)(426003)(2906002)(82310400004)(86362001)(1076003)(6666004)(186003)(26005)(16526019)(356005)(921005)(70206006)(5660300002)(508600001)(36860700001)(81166007)(83380400001)(47076005)(7416002)(336012)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:37.2747 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8327eae1-072c-4e93-a422-08d9b029c9aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT009.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
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
 bhawanpreet.lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display core provides a feature that makes it easy for users to debug
Pipe Split. This commit introduces how to use such a debug option.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
index 532cbbd64863..6dbd21f7f59e 100644
--- a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
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

