Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1742E4413A2
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 07:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3376E0CA;
	Mon,  1 Nov 2021 06:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2B56E0CA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 06:11:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhTrPG5NWYLqFJXyeM3xJBWqtNhqwEVlh/8PeMt0Go6dlMaNuOjk3Ge2ahHHKliIV/C4s+4g6gfx4hD/yEQ0zvq+QDhwQ2n3HoWPlAxiCWLirw7IlxH0vzrHl8y/SrrHKqifMeHz4yrPq5CRrFSDPrT2c4ldkSp/RV601ill35G8D0zGqZn/mPFOtyvwEWu0aQobPh8wGJu6Rl0ZXvm52MUYxWKqHezfrENQ7utbIZhEgFVPfA/LO5Bn+RHl+vCX6+6Nt7+rmgaNFocZDrwgCzA12LF9bYTjl2bPcvJulUJ3sjcirRbKvU59HqzbE1Z3CK2JOjUSG/GK5KGE+Y2gig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aOXfWFVO2hup5zE3zl50c/fwD7g3YpBwR6DdXb7mEeA=;
 b=RMRcyfCY3lLvxN/ls+1NXrSdCvjHHh1Mx6Y07aJXTY07Y2NF3XQlQxF8hPkd7nM1AsWHayAmW8A55Dlfi7N+jz4mpWcbfye1XcKVXd97BYbzibQA9O7oQmoJ1t1/v6j/n6kFjsx4GlGJxN9WPWr5RXD3zn3NZvfGOP6UyFvJwYr0T3YiqTfC37rPemPexpwgaW5JLOJD+XE1d2xwlGWaKV3N5nuKepEseSDgEzRZus1yOCjuAV/DEz9YAG7QU2+2PUUqqng0ojRUieNua5m5OvfuDhukhPy3BWqnCazeP1V3rCMvHmIT/+Yrc9BzWTssvh4e/oa/mCRRy9FU8/fTnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOXfWFVO2hup5zE3zl50c/fwD7g3YpBwR6DdXb7mEeA=;
 b=IJ6OH0UI1MJ4QDBOd1n8kW/5C2/NUhtG6mLqGujtpKHwVedB2ntV7oJIi4dSKQ4tiGQ69r0roESRQ75Fk3YDjecFbDGz3hJSZ8Gxy3nlpClIs692wqDktX1ydNMNzYh/UW6R4xdC9EV7fz1Xksv6SoPHGtHXim9fDsygo41AfOs=
Received: from CO1PR15CA0068.namprd15.prod.outlook.com (2603:10b6:101:20::12)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 06:11:17 +0000
Received: from CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:101:20:cafe::ae) by CO1PR15CA0068.outlook.office365.com
 (2603:10b6:101:20::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 06:11:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT044.mail.protection.outlook.com (10.13.175.188) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 06:11:16 +0000
Received: from pyuan-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Mon, 1 Nov
 2021 01:11:13 -0500
From: Perry Yuan <Perry.Yuan@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2] drm/dp: Fix aux->transfer NULL pointer dereference on
 drm_dp_dpcd_access
Date: Mon, 1 Nov 2021 02:10:52 -0400
Message-ID: <20211101061053.38173-1-Perry.Yuan@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b45f50d-da33-4d9e-ea29-08d99cfe6a69
X-MS-TrafficTypeDiagnostic: PH0PR12MB5466:
X-Microsoft-Antispam-PRVS: <PH0PR12MB5466250C3E17F88979E1DBFD9C8A9@PH0PR12MB5466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +4N3ywN45zi6O+p30ug6vEQXJtsqW4W3p7h8w7uswT6xCaVS1XH1Cbo+f9Nw8jssi5Sjw3Ab0xWNioNcw940SBaKyVUSD6Pj4v/uUYm749FcSClhyEcsHJRsesXEs7bSyUpl+nqWu+zED6Ntp4v2IXnNmfTTAqbIDO++AWVZ21CyTyxEuOWbM1fpUfJpVoC7ytYDiZmm4PQuppN32tT+6DGjay5QF8BSe6/s5lBzW5sNjpsBvg/xL10Y4jnMbPULIKopEPoFJqrGrQ/cLl9H86gSyAuAqIk/dNXE0zS+e7EVtDB3EitVaXXNFsZry9HyQaTGxgWmQyUSW8oXMVeIXqyEXG6vcdq0L2+24wMQB52PzdUpbY42rHParFkmSB91rMYWE2DoVusxdztFGFDiiOOSsFALUKTwoxdRrfUPKFy/9fjAdfJVYn9amhf/GutCpvgRJQuZEGXe82Ps9AMTkzfs9SaeHKu4yIHIIAcVpiodsjPO6K7z0FFHV1Qnqus7EaiIB3Es8B/R8eMbr/1rjevaroD1Qshdo7KCQRMiLgMoLJKBMUNZg1JHKR+HQPjs0OKwa4JAQk3QnYlCtAQU/Y9EJphiHm7AI/WGF00Kp7MR8QT+sBb+ITwsXd+AQ1vNR5vwDhQQtyEtm7tzkOAPcbG6V0+h5EVTHbJ5BViOeUJtyHakVtybH3h5fraavCgnfftEPpI1XGCpg+4DnBb4zD4GOWrRmXLWPz+GK8wAkJA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(6666004)(26005)(36756003)(7696005)(2616005)(70586007)(356005)(508600001)(83380400001)(2906002)(5660300002)(81166007)(426003)(86362001)(47076005)(82310400003)(8676002)(4326008)(8936002)(110136005)(186003)(70206006)(54906003)(336012)(316002)(16526019)(1076003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 06:11:16.8919 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b45f50d-da33-4d9e-ea29-08d99cfe6a69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466
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
Cc: Perry.Yuan@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xinmei.Huang@amd.com, Ray.Huang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix below crash by adding a check in the drm_dp_dpcd_access which
ensures that aux->transfer was actually initialized earlier.

BUG: kernel NULL pointer dereference, address: 0000000000000000
PGD 0 P4D 0
Oops: 0010 [#1] SMP NOPTI
RIP: 0010:0x0
Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
RSP: 0018:ffffa8d64225bab8 EFLAGS: 00010246
RAX: 0000000000000000 RBX: 0000000000000020 RCX: ffffa8d64225bb5e
RDX: ffff93151d921880 RSI: ffffa8d64225bac8 RDI: ffff931511a1a9d8
RBP: ffffa8d64225bb10 R08: 0000000000000001 R09: ffffa8d64225ba60
R10: 0000000000000002 R11: 000000000000000d R12: 0000000000000001
R13: 0000000000000000 R14: ffffa8d64225bb5e R15: ffff931511a1a9d8
FS: 00007ff8ea7fa9c0(0000) GS:ffff9317fe6c0000(0000) knlGS:0000000000000000
CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 000000010d5a4000 CR4: 0000000000750ee0
PKRU: 55555554
Call Trace:
drm_dp_dpcd_access+0x72/0x110 [drm_kms_helper]
drm_dp_dpcd_read+0xb7/0xf0 [drm_kms_helper]
drm_dp_start_crc+0x38/0xb0 [drm_kms_helper]
amdgpu_dm_crtc_set_crc_source+0x1ae/0x3e0 [amdgpu]
crtc_crc_open+0x174/0x220 [drm]
full_proxy_open+0x168/0x1f0
? open_proxy_open+0x100/0x100
do_dentry_open+0x156/0x370
vfs_open+0x2d/0x30

v2: fix some typo

Signed-off-by: Perry Yuan <Perry.Yuan@amd.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 6d0f2c447f3b..76b28396001a 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -260,6 +260,10 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 	msg.buffer = buffer;
 	msg.size = size;
 
+	/* No transfer function is set, so not an available DP connector */
+	if (!aux->transfer)
+		return -EINVAL;
+
 	mutex_lock(&aux->hw_mutex);
 
 	/*
-- 
2.25.1

