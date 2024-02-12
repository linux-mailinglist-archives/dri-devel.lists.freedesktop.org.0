Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1D8851F09
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D4310E5E8;
	Mon, 12 Feb 2024 21:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2inHAatk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7188110E160;
 Mon, 12 Feb 2024 21:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSax6p9vmbYrDLs+qtM/5jOn1ksTHvxDNDhx4dkXSr2ByOzryFyk4uvdfrvGltLvk99pgRNdJJdOKNQLjzL3jU1K+B2qJ4zlEiFlJUEfwvy4l8Sh08daPW7Dv1n2zvH213/0hVZhVMFfbdZDMLmrreI8wEjIlCHcThc5e4D54y3YGXWUSSYO2kR1BQcZLcjctnpXEeTx/JM1whkBaKE0dWew0hS4DydQ5isEpgLymOZbyN9waURPC+Uk4ufJOS5X7Z379aZgWHE9hvt+A+/xQ3YyOJVKKojHgCa045n7ASOjemPMFs2ex+mB3oX7y7xhXibIfFscwOaXKCJzD6xneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Np36lfcunEX+5VEROtXjAQrxsG9zSYLvkILaJ1ru3Y=;
 b=HnYHDbIVZG/oT+ECdykPjMTke0pmZ3vUPwjXGH+jshb8zU8QqPCFK17zneRUnejeoJfNGebP2q242i/IJx291aVJJKQoF287bDMOsSFWKYRuJxSdnwZSb0fL/eERAeO4cvS5aoHA0gO5/kUNtv08V80yPiyNLXoE4O5YBCm6LUdCQb1gilkCDDACNarHsHr8uaZa4KNFkiqfQ67S2VSJ02OJ9tNRYDu9ub7TLoUNnkeZA/s7OF/xcED4cr6N7/qpLWUTEN3r4O0arCrrcD7n48ZNyP6Bblo73bujSSYF+nhcTSqrUkD0DabNicKQk2cAnFlzUfCGiSFaCyqjXB9EqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Np36lfcunEX+5VEROtXjAQrxsG9zSYLvkILaJ1ru3Y=;
 b=2inHAatkjbXGgaiCEw/U04Cg2osMVylEToEEu+1rJeikjRhJoSytdQy0nIYAH83y7TjQysi7A5//3Jg8CYJkP9djmb/cLoqpuRStnp9sy3NevBE2FqWXZoO9H2I5ggyTbBR9phS7JtZPptJ7V5BnFNcG9zYSInEeORv+ZkY1p5g=
Received: from CH0PR04CA0083.namprd04.prod.outlook.com (2603:10b6:610:74::28)
 by CH3PR12MB8481.namprd12.prod.outlook.com (2603:10b6:610:157::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11; Mon, 12 Feb
 2024 21:04:45 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::c2) by CH0PR04CA0083.outlook.office365.com
 (2603:10b6:610:74::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Mon, 12 Feb 2024 21:04:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Mon, 12 Feb 2024 21:04:45 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 12 Feb
 2024 15:04:43 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>
Subject: [PATCH 1/6] Documentation/gpu: Update documentation on drm-shared-*
Date: Mon, 12 Feb 2024 16:04:23 -0500
Message-ID: <20240212210428.851952-2-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240212210428.851952-1-alexander.deucher@amd.com>
References: <20240212210428.851952-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|CH3PR12MB8481:EE_
X-MS-Office365-Filtering-Correlation-Id: 891b74b4-ecb6-48a6-6e1c-08dc2c0e3da6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sn4OzUIrln0fIDZcoHtm2PI+T51xNKDZlFhQCR/VjyxE9+CqxtG7wH5bsfBd/umVetUVoZri8+oRvaw2rbD2+VtfgJ1ir4kfdrVCS8G/sIWA3h5ukZ3fedy/8Y6gkSMAXuQXdW+mM3mc/j8fEnSaIr1Q9D+7bh9E1RtKnIPpT3PcprrzRSW6bKq/iApcxWNQO0JPrmpegdLIZABvheL35wYGhykfXgYtok0qR2WYY84cRKQgQUCSpv/O2SewiRhLDh01lOhqDJYuXQWjWhekbnzsdw+zCGz7hWP4rMHJbwKYYyz8w6OrHRUOa8onrUPZrCpSSirqzayNGKiZ93Su7aa16gBYrrNC5CObzSuVCcc4rG/69546sbh1AU5Ar6o4qjEZOVwdRnsjlwMgfUtMLDzwqOXZp0aIwR/cRdg9YT56LQHKkxyqb4vi2WkKeeTQmCChFnMnX/TtiwiNwKYFlJd6cG7jAnDYQ0uTi4dKUeQfGrB1wB+JL3cW7gMoKpEfrMXrB+3d3+9CD75gnPQyWEQZLvpnBF5f7K2wMqTLxZb1NZC4WUrhn1vmipzINLFd9q/hbxkILP1vRDFnveUrsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(136003)(376002)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(36840700001)(40470700004)(46966006)(316002)(81166007)(82740400003)(41300700001)(356005)(86362001)(426003)(36756003)(4744005)(15650500001)(2906002)(5660300002)(6666004)(4326008)(54906003)(336012)(70206006)(70586007)(83380400001)(8936002)(8676002)(478600001)(110136005)(7696005)(2616005)(26005)(1076003)(966005)(16526019);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 21:04:45.4624 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 891b74b4-ecb6-48a6-6e1c-08dc2c0e3da6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8481
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

Clarify the documentation in preparation for updated
helpers which check the handle count as well as whether
a dma-buf has been attached.

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 Documentation/gpu/drm-usage-stats.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index 7aca5c7a7b1d..6dc299343b48 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -138,7 +138,7 @@ indicating kibi- or mebi-bytes.
 
 - drm-shared-<region>: <uint> [KiB|MiB]
 
-The total size of buffers that are shared with another file (ie. have more
+The total size of buffers that are shared with another file (e.g., have more
 than a single handle).
 
 - drm-total-<region>: <uint> [KiB|MiB]
-- 
2.42.0

