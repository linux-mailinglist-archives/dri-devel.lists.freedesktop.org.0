Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD90B429743
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 21:06:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD366E940;
	Mon, 11 Oct 2021 19:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627D06E940;
 Mon, 11 Oct 2021 19:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Af7UAu0JFceptbrWaon3HLASCs2FxrSKwJFCOq9rjHs9o3DT1xVAK0oPUackRWw9dXHuHe7+kP9p5LZP5tT/siBEluLi+xMhxtm4xiUmyAlWghFkFPyp9vC75bp6+Kv+SBNLiLyke+SOC4kPeBAjI1H0XFS+9I9xnvB3TaIEc2FKt6q42IDdEmkhykfcYsP4JwAgnLoO6bKPowP7KmrGvkURErRVlFHW7aBATPaSZUWGCIJr2EZMdObTgEpxIU6rIurETN+ZE8D4qbB6n0CT5N/IsErtP867KAUcwbbHn3UfdDwzsSk/LgYSjmZsuCofbggxMWZFUEu5Pp4MO0cQvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94Hsy9uxVpjI7NE9tvsVTZAOa7AiXgnaKaKUuYzDA94=;
 b=BIrxuYFY3mH1SYmaMrKnpwEC26TfDDxmZb96DBOnLLensWnrmACV/gQC/DRQNr4taaxZVcQlNgiJegdkfE1oZy1J3HeAc1fbUosL4A4Y50lQhQnwXilg6BaY2fAx2wnUnY+ghAA11Tql4BxB6/LbNLkLojKTBRQ5BAvPwUciNnXZqX4RCk3hzgEfVBGWHhqxkwwYYsSqtBYgRygJw/mze98Rd9LDiA/pfBmZ1AzMcGshDkBTPGg8ZV0uFjbU3PjgPKZPSdRPfWxC3O1ygpIfDEQoGjRY5Jryu7P8OomO3ilW/o7B8Boqp4sTpMV1Bi23dCXHfd7OP83LHS8p3tBqGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94Hsy9uxVpjI7NE9tvsVTZAOa7AiXgnaKaKUuYzDA94=;
 b=lNQgdvqpUifB84D/qQuriqs6k7ob31upr3x2rezt8KNVaNm8WAVJLsvP1i+RFaz7vnNSDC68j4enYn9Su/xy8Y7QRoyNziJjTw5V1oepq+ifzJStF/CkuwsMBT6ipv2EUoo4GD0ekKnUJ7yZVFkChPc8ESvX+pSuc5cwe1h3TSQ=
Received: from DM3PR12CA0113.namprd12.prod.outlook.com (2603:10b6:0:55::33) by
 MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 19:06:31 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:55:cafe::52) by DM3PR12CA0113.outlook.office365.com
 (2603:10b6:0:55::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Mon, 11 Oct 2021 19:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 19:06:30 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Mon, 11 Oct
 2021 14:06:26 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/4] drm/i915/gt: do not check for NULL debugfs dentry
Date: Mon, 11 Oct 2021 21:06:06 +0200
Message-ID: <20211011190607.104618-3-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211011190607.104618-1-nirmoy.das@amd.com>
References: <20211011190607.104618-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9abd9914-9af0-47c8-703c-08d98cea3be0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4110:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4110DCFAE260AF46DC42560C8BB59@MN2PR12MB4110.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /BNFKHJXzQ8S8TfcGwPeJG0s2TCbDSxCpS0ev5piE7YMTXGf35bZtRok8DY6S+YweJ90JDYrBDCX7B+0X1yhAmzoFJR5fVfBzaz5iaZPLP5Ai5qKy1LeL7B2Ff89GGSkuzO/5iai5e+r9oKfekfvgY6V/Kje+q6zSE6+6j6CnlnBZma4jh1brE6WMkQHiZW8du2IjCvwN56UheWOcVTyJI6AEjlXa5K3aPi1BmRJS3sHySVA2veprpRZEdpqKvRc0vBPm4+7+1CnEBvFKH4AGxvpXs1JO+W4Zm8Q4Lf719zMuxxklg1RnKinzTl6olbaXgFSkwGOioz8pwh7rHv2+kT+O+tQRz0F4yE1XyHVEUHGH53UmzvHNPvJEkjSmZyCrQRc/a4kKszw1R7+QAb6NOT01mPRBDgU1HRmJ7S/tW1qK/o4xSXjQ8Io8VEU0KldBXOfiLUZ9kBT5HGQI6pCq8Fa3MHlyRNY/+DTnZQsnjPc/ZuP49flaZuqgFWQcF2Zq+Vhryurba+eYoSHQjv4tMzZNv4eUN2PpUQEQMZoFYNBCYzDgWG08mtnzEDjTapWtGnitxgXc7GVnLpnb4vvRHooQjW0p7FhjmtsghpwvQiVSrpFFBW0XlIDNbpSF9CmO4bwlmG4XDnwV5E4cJtK6DYVKIRDPb6QSEOzESXrssPv0ehwPKc7plq3vrFsdkTE2P1OLdI2E8x30l32oaFF3jSM/TaMN5W3EMEpKy6AwCc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(336012)(70206006)(36756003)(4326008)(83380400001)(1076003)(426003)(47076005)(6666004)(54906003)(2616005)(26005)(8676002)(186003)(508600001)(16526019)(356005)(44832011)(70586007)(81166007)(86362001)(6916009)(7696005)(5660300002)(82310400003)(8936002)(316002)(36860700001)(2906002)(4744005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 19:06:30.3586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abd9914-9af0-47c8-703c-08d98cea3be0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

