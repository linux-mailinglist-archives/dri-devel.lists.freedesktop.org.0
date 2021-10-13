Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42ABC42C8CF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713296EA13;
	Wed, 13 Oct 2021 18:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD66EA59;
 Wed, 13 Oct 2021 18:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iSpmrdOjRe1JCHIPUWknFO0tSNNSkh5a+v48ZMqmknF/c1Sl8BZLeNHEKGUateb2K+vhEeI8ZvNw/ZOi/3X41thV5dBIQW8P5DQDvdJjPmackVj1XU9RuLb0c2ej6obH1p7XSx36TY+wngvt9qRACU0BLUufi2QyPz1NKdrJN78RMoRC9DaJ7z/gfCaYeUQ3kmxWCJk8UDDSbFjX7lI5vuQgbqvW9Ql0tmreQmFQYesMDCy4WoYRwmYLMPeyLnMEJoJj6EPMwdpHimLBe6upRLcpQ8d7nHmKambUq6sWAm71GfuerFTXzQn2SQORZbNWZrpg83NnkEaSfo6xzzh0MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Hsy9uxVpjI7NE9tvsVTZAOa7AiXgnaKaKUuYzDA94=;
 b=kxxovHiNs5TDlURrrtZiz4E8oZiBAW62A+Et6WcmMd8JU1yQeojen9a73fkM6wdb9qy9LkF6kRWUnNLRBxA/+JD43w0/rjlJN+EHmkJX6MmV8kIAxpAAhY8aOk8nk4kCKb9K9SXuRtmNLid13tZVVzJkUfq1rUJED/zBEyLOdoki6Jb7r4OE0sSMyKvaels7b9S9zRkkQr0KH2fCTWaEU4eQ8jd5SHgJ28CGmOn33wDrHTM7+6/zQQkITFBfVyOohVBGcRQVDQOnNEh7Dr9r6drxF/z3+TEKzo92Chy4JKInCDvmgl+U4q4dbhITfsIrWOBC6LLXoi6uFOkLBUFrrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Hsy9uxVpjI7NE9tvsVTZAOa7AiXgnaKaKUuYzDA94=;
 b=y5nPxKr4CctjuttyZy8EUDe6V03QdHMlEmYFaiwRDBJIf4OWEshguZsux8WFNllbxNI1qenIQbi1AJ2FuuRsZHhXL+6Wea8tCqwt0S8Zh/sDd6NUsRW+p7Gqv6SOCB+rP+wg053kVwEcrKL2G4vb2LGbGkv/ZNw0I12qt3q0O0g=
Received: from DS7PR05CA0004.namprd05.prod.outlook.com (2603:10b6:5:3b9::9) by
 BN6PR12MB1857.namprd12.prod.outlook.com (2603:10b6:404:102::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Wed, 13 Oct
 2021 18:36:17 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::cf) by DS7PR05CA0004.outlook.office365.com
 (2603:10b6:5:3b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 18:36:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 18:36:17 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 13:36:15 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm/i915/gt: do not check for NULL debugfs dentry
Date: Wed, 13 Oct 2021 20:36:00 +0200
Message-ID: <20211013183601.16514-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013183601.16514-1-nirmoy.das@amd.com>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88ba0d73-cf36-4d14-429e-08d98e78580f
X-MS-TrafficTypeDiagnostic: BN6PR12MB1857:
X-Microsoft-Antispam-PRVS: <BN6PR12MB185776D90C6F978B4FEA5E0C8BB79@BN6PR12MB1857.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/93BHFQhDwkDHnNEkpur6DNVcImBZch4qtofeo31K/u1X57y8vDpeTP4gTPb6h2w0IQ4MEWQyPX0v8v/0bEi+7aOPr+qZbcR//2H/hYfJbVZ6ngqUjQP4kZpRWfYcAAo6RoO5+ElArNLPvY/V89MsghU1f5GC3mon1PDllDHuEOAj+V5vTfN6jKORGJjt2RPEaEzRWMUU8JDO9BqweDiBCXaFdR40rkTAx6wzJ2pcdIyrsZU1tbA3DpWZB8HlO1eS/N8Y77L3h436RbxOLNGE8ndNix0PcA1f8CKXUEbywh0t/vs35/t3eaK1fbjZp5q4rEdSZCoNs/XNkTFO5P8a55R2AOWv7nTq1uU7XKX4A15PFsxPvFBSDkZnAUkpQ+qjueAFZY9VhX6TXDTy79Q7YUr9rs+iA8CTnZsGqdtDKrMrL5sr+8j30hNy0NmGeTTfhGYUGh2nZf3KZeDoCBxaU6OSGY8b0sGemcQwVxdgqvFdoxj1yRNEdebVr+O8efSyWpKz9oy3bBm3L5HgSA0WKnzMvuDGfIfFqlYh5B0Y19TNxLsDQvX3h2iTEXFCFAoOTZNbn32dmcVmhVT1fQvZkN02+fPqufaO2SzCsfh5mDHvMafBrR93J4bE9V03VuYI5tMqzn99NvICl6hGdj7Qk+GfTkjSKEiWRw+8GhPLx55wzibuAXDlqoabQFRBbi02LeSc3X3hExM3S9EfAo63BzX/tynf9t6PkEIWL4PHw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(81166007)(26005)(356005)(47076005)(186003)(508600001)(44832011)(86362001)(8676002)(5660300002)(7696005)(36756003)(83380400001)(70206006)(70586007)(54906003)(36860700001)(82310400003)(8936002)(6916009)(316002)(6666004)(426003)(336012)(2616005)(2906002)(4744005)(4326008)(1076003)(16526019)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 18:36:17.3411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88ba0d73-cf36-4d14-429e-08d98e78580f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1857
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do not check for NULL value as drm.primary->debugfs_root
will either contain a valid pointer or an encoded error
instead of NULL.

CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/i915/gt/debugfs_gt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/debugfs_gt.c b/drivers/gpu/drm/i915/gt/debugfs_gt.c
index 591eb60785db..95ca1b3ad320 100644
--- a/drivers/gpu/drm/i915/gt/debugfs_gt.c
+++ b/drivers/gpu/drm/i915/gt/debugfs_gt.c
@@ -16,9 +16,6 @@ void debugfs_gt_register(struct intel_gt *gt)
 {
 	struct dentry *root;
 
-	if (!gt->i915->drm.primary->debugfs_root)
-		return;
-
 	root = debugfs_create_dir("gt", gt->i915->drm.primary->debugfs_root);
 	if (IS_ERR(root))
 		return;
-- 
2.32.0

