Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92E46BE43
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 15:54:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019127B78C;
	Tue,  7 Dec 2021 14:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71CB6EA12;
 Tue,  7 Dec 2021 14:54:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPbaNd+ne4ZVMVaIsOVVM9HEpKWfGQxpfTtPG5DrVhuemY9KyXBBB0A10MiI6O4ggJDvRnXwfdAguOMisWS+v9Ubo/nOAkdNq0yMmCFyIDjS2vRYKGV1a8FruSQXiejaKjZYaDIW0s+goVc74lvdgu+ddC3SqE+aIp2D27b2mgl5mua8GROVHqm3xZCHnBgE2jBJS+XOG3jP8LjW6IdmwAeriB8ovXC9f4lG59DVGpdE8Te52XLISHI8mfcXFtt4Zw2htqUVcYY8VDiY6/B7xw7HDwp15hoOD2lRsfCO2N1rPeQtyx6HU3Gnm1Ai0zj9RlbfDfPNPddOMBo9NJNcvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=Mbq3CIkrN/08HwF1BuEe8sMrUJEbUfxaSCDwzarNr+5wju61IhO7P14ty8eXckET+KfL5JSo29o25QnejtmvMOwQC1WCjxIV6gaPnP7Dlp6mQ8Q5zDSYn3A0U7DrzMHj04eZm5XeohfWIOYWqKHk17WGwfT0vxwT7IjNEPb1XiqWs3U85pKUeNXTJb9C+S/KMxJbpsFM8Vd7or3JwWcVeoaHKjNYou9HG7rpy3Y8lDbGcMH0Rzt9Laj2Q45JVTDhq7qnmKB+P7bF6/8Eqr0HWXZL+Z1kpW39jxcBuK9cPGjrdldrAUUmxDmFH5QtJ0Wqntn5zW8QhNNEamGOB0Q7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBJRzHf4EEYvbBlN69lj+XARmY75Y09a7w0uPKpww+w=;
 b=yvphlH0aKWXCq2O+SSKEhAq6c7lqMWi/4xumzzfXs+81PPTWyexMQJ8jjrUYwKw40yXo4+iyj9yTV/0fYzWzW1TJAh2wnXhKKveYbPrsYEXIzPq62MZqp9OqDjqS7+H6BoODBo7aaR3EVw4KORhq8jPdNF/CmtIo7lehh/ujKpk=
Received: from DM6PR13CA0026.namprd13.prod.outlook.com (2603:10b6:5:bc::39) by
 DM6PR12MB4941.namprd12.prod.outlook.com (2603:10b6:5:1b8::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.11; Tue, 7 Dec 2021 14:54:19 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::cb) by DM6PR13CA0026.outlook.office365.com
 (2603:10b6:5:bc::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.5 via Frontend
 Transport; Tue, 7 Dec 2021 14:54:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Tue, 7 Dec 2021 14:54:19 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 7 Dec
 2021 08:54:13 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v3 3/6] Documentation/gpu: Document pipe split visual
 confirmation
Date: Tue, 7 Dec 2021 09:53:47 -0500
Message-ID: <20211207145350.286037-4-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2f6e9ac9-c4e6-49b9-1291-08d9b99172ac
X-MS-TrafficTypeDiagnostic: DM6PR12MB4941:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4941B97A79C3E8E5D29B985F986E9@DM6PR12MB4941.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hh88gKsjROTi7rAgCj5zzLylNDDpFKePUFSUW9qd0ZBzzQW7XsAbHzeucwDhWfQp1/skTB9J7RdF3qcuG2V88IpJurUaNtK92lsKnlQRyB9TdotgjBJ859U7EvudfUf06TICNi/QqjWdyeVmjwqAOy/EnvuXu/zeD7bNJQJptbnrqo7IdAzbLC8D6n54ReYak58yx6uqHyNFtlBq6flDlkcFivgTAd2G8VLSjZwp7A9Ulj9uY7XKsQUHZFEJM2XFtrA1sXMG/Xar40CNgFE+7xW9Ie1pmGeSIXoPTA978t5222ccd0fEdLO5SZsJqOJKga46NsyhFrB3Z2pBf2bzPYHmeZq5HrxcmVN+umsIH1089x8fqJ1JEPISdR8NjdBNm5NlCGEyX0Yki40JZElgi5ObUkXyzJmrSHimgKZGOQ7TYJW3duqhiw6ErMA+MYVi7A6kt8H6eBagApd/eni+8SUfZsKt6NzliZjl2/7cvZTv0Ok1L+fkL0zPJU8gzUkV+Fhk57So294H59ipGNM9vcjOCaS1r81nl9qRfSaiMXfCuZJN1G1u7IVI9cgHKkdb73G/y2Rq0B7ObVg/0E3RF9Tkd/IwnP4/w3bMdNGn5sIAuMOrwvI6907hhX8lk5pX1xkk4euAvJBsxc+JVGRFuTJ6bSwVj0dt6VhMoiJJ91SqULwxc4pqk+AZx3YhOZyQafobJ0LLMT1NTzMCXBC92+dQ37Td13U7MKmHWyz2Mwa1QQ96RNE586sXBTC/oSewvidjuQWv9oLRj9uuPpD7MmqQz9mu/612H12LgZ3D8cOEJ6/AbFEUfBkLQqE1f3oO
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(70206006)(70586007)(110136005)(4326008)(54906003)(47076005)(921005)(2906002)(316002)(8676002)(36860700001)(426003)(8936002)(2616005)(6666004)(356005)(86362001)(508600001)(82310400004)(81166007)(36756003)(40460700001)(83380400001)(26005)(186003)(16526019)(7416002)(5660300002)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 14:54:19.4130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6e9ac9-c4e6-49b9-1291-08d9b99172ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4941
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

