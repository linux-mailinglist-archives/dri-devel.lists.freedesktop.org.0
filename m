Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C59466781
	for <lists+dri-devel@lfdr.de>; Thu,  2 Dec 2021 17:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494E56FA84;
	Thu,  2 Dec 2021 16:02:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09736FA6E;
 Thu,  2 Dec 2021 16:02:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bom6ystPltoua1P1FwHZs6dLYY/ONEIYR1HV+2Rgg4pwwG9Y5C8ATh7hdtEreUpUAYnB72TAdnfloOu4ggv0L7GhqagvN6p5W0MMiB9XJeqdnX9QBU5Kes1Wovu/IesIhzn5n2maa43RYpvN9sppnVyb7irmEm6/4IXGGwBGFXqjbguhvi7hDPMZODRk+HE/vEAaB9aKcNQExjZDPYP5CfqPY8OcxMd8Mg4GZSxO8pWE92jOKb3K+0T/Xdlj+qwFgW5SG6Nj97NocGps3ceDLoGp4pauJxv+fORA363jU/IClIC8suAXeBmJLIVlPmj9TvlcJOJdobS0tdIWiq6O5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=bFKq/S9vDy8zsOfFBeCfxrYdHDPKhdiCaRkYDGZuvgjgyRwJ1OOmGzrn2JXikO5YoWAftsolnnW3pznhO7omRCSKZNm/FYpzyVLsE1S9/XJ3IpE6AnHQm54syNHFN/d2EIiU1EYX2mLhx9ho4W+PDvcq9apb9XVtPoGXvOBa0TV9vecGoISmHjc/d5S/DiydFiR2D/DV9XfEgrkA7SLlUgouhEObo8xoTE37Nn38fYxWCM+yHx3FfAq/pp2kJA3ltsyIv/Hgns3jq51GKS7TxU3vEUbFIynRgO3FDIenJlUTBmZP7TROq2xqVMxE3XfVs/wL3muMUDBT4Lucl0MRRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LXPkcDirSVzKYjWAnrUMru1Nl3TdMk9JwLK6zJZ6VfY=;
 b=TMl/+6JfVVHO3iTruuqVQxR5dXJ16145UBwjv1k5LXCCvrFKMz2FsqnLQwgC+FX5ohiIc2DG9n2CSLbd02wm/Y252AWd40eGB1LyV+Ej5hvwGy02q8Fz0h9pnV9N4d5Hd90K2yoXA8jJAaT10UKIHnwBbVT3YpjTQVZ4KeW0wFg=
Received: from BN9PR03CA0127.namprd03.prod.outlook.com (2603:10b6:408:fe::12)
 by DM6PR12MB3786.namprd12.prod.outlook.com (2603:10b6:5:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Thu, 2 Dec
 2021 16:02:05 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::8c) by BN9PR03CA0127.outlook.office365.com
 (2603:10b6:408:fe::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Thu, 2 Dec 2021 16:02:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Thu, 2 Dec 2021 16:02:04 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 2 Dec
 2021 10:02:02 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, Michel Daenzer <michel@daenzer.net>, "Bas
 Nieuwenhuizen" <bas@basnieuwenhuizen.nl>, Marek Olsak <marek.olsak@amd.com>,
 Roman Gilg <subdiff@gmail.com>, Nicholas Kazlauskas
 <nicholas.kazlauskas@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Mark
 Yacoub" <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, "Pekka
 Paalanen" <ppaalanen@gmail.com>, Yann Dirson <ydirson@free.fr>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: [PATCH v2 4/6] Documentation/gpu: How to collect DTN log
Date: Thu, 2 Dec 2021 11:01:30 -0500
Message-ID: <20211202160132.2263330-5-Rodrigo.Siqueira@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 45703c8e-3a76-4e70-1020-08d9b5ad15c2
X-MS-TrafficTypeDiagnostic: DM6PR12MB3786:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3786F7501ABBA104564455CA98699@DM6PR12MB3786.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 88qmydn0hO0kakC9DjGFe8yGj8ZJxHsv95Pjm+DP1i9QdXrIPjxh6opZ8FdF/6ksLlnBtLsx4MMnwnyNRh6TyrvlgCmkfsfi3i0Bd1gwxIFoL+E4atRWIMqEgku/c+/mptT/OhsE6ILnunjDOu3vcQtYKfZQXkE8LbAwKRzLXKd8F2HC9wKXmkoGBE0EwYnQQ4CB7oxODiz7/PaQfeEZEiOH9EPcPFZMM1tpVrgQ5jj6w8qzgWpVF4bCUAQp1RrPupQXK2W1WrkcZkXNmPAM3t7BiXBdfk/03UU2NtFTvJSpbgUAQdeMhgKkJvyedmHiBFxELcE/xbwQO69mSlbYfb25tBPYWOdp891g4Skt2h78uukk3WxObYS633UFilGw4XTr5wphM7jMnIJSObGkBkETRA0zfX7Or7mfqmsI8nFMrvFCCkugelKDebuuy1QneeoMVPpSu4X1Xh5UQGTN+ypotcCBthZHXo7uRxVpPrV0mEMkhbacSdvHCddZpsVtpaWMBUNrwMh9Pq8+QSL/6UD38F7lEaWISta8tPpQIZpuhRQs63+5VwVfz0cSEpQFfm7+8tjw9Qc0VagyJl4Q/jeyzZl5VGRkFXfwl+MZvWV3jXmzrpv4royC07YhcJULG/KAH8t5698md/FYr+IynW2x430QkacOyFpkYi/MvXO4ghohWhnztqm4NnUXeuOXPsodJpBbPXekXJamYin45e7PuIz15UkVeQE/WIbPWaXuNO61lPScUALSgx6/b5leq/vwwn0fIbMSDqyN9UCcq1jIYStasYQLHWQLTnTSqqtJKxDyciDIamNLbs0/T7Y/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(40470700001)(5660300002)(8936002)(426003)(2616005)(8676002)(6666004)(47076005)(26005)(16526019)(40460700001)(356005)(336012)(186003)(1076003)(82310400004)(54906003)(7416002)(2906002)(110136005)(508600001)(70206006)(86362001)(36756003)(81166007)(36860700001)(921005)(316002)(83380400001)(4326008)(70586007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 16:02:04.8176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45703c8e-3a76-4e70-1020-08d9b5ad15c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3786
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

Introduce how to collect DTN log from debugfs.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu/display/dc-debug.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentation/gpu/amdgpu/display/dc-debug.rst
index 6dbd21f7f59e..40c55a618918 100644
--- a/Documentation/gpu/amdgpu/display/dc-debug.rst
+++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
@@ -58,3 +58,20 @@ In this case, if you have a pipe split, you will see one small red bar at the
 bottom of the display covering the entire display width and another bar
 covering the second pipe. In other words, you will see a bit high bar in the
 second pipe.
+
+DTN Debug
+=========
+
+DC (DCN) provides an extensive log that dumps multiple details from our
+hardware configuration. Via debugfs, you can capture those status values by
+using Display Test Next (DTN) log, which can be captured via debugfs by using::
+
+  cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+Since this log is updated accordingly with DCN status, you can also follow the
+change in real-time by using something like::
+
+  sudo watch -d cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+When reporting a bug related to DC, consider attaching this log before and
+after you reproduce the bug.
-- 
2.25.1

