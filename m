Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D742668C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6C76E873;
	Fri,  8 Oct 2021 09:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2083.outbound.protection.outlook.com [40.107.237.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1F26E873;
 Fri,  8 Oct 2021 09:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRa1yzKur9z3ly4H/jAQWXt2Zva4PNTDOr+x5i0ALBAkQcMkEb/dHuhL4Pk+W5Dbpuerp5EMjQ35uIftcSNS/gLYf9MOPH7BZQN7xS9s+u/Ic8zCBNEZMEaeMwi89urHSav7GiMNZdI4uSg3CotJ67ChSG3P8C+nAZgRIO485dFZnq6ZSwyiPYWDkKSlmFC91LYbMxnefzuZmoufINoLqhUatp6LNcfs7buzjdcvqqk+tBb8OtrMV6YXHPkNx6m+bK/81IexrfKodMsLdpL9+sV+E2wspBveSLRnZ+0diMNQw6ZLE/2HQxv9rwMHioX1nIazckOZJcYH7xEz8DkfdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd/T76vZnTuvHrynw3dFGrkCvmJtdjAmRC8HKfTlv98=;
 b=CYrGen0+XOWzBr0PEC+1znEwZ6MdwRJaBxJ4phM8TPj1HPiOs7+MJybjhp6tOA5cVd395TXt5EnqAT6NbqpbK8Y9Tn+YYFb+0efaUz4FpBp09TOCArhfOLgQr3rqd+KVdKbMwgVkuXq2XomsD01Vh049veydCzl+BfL3HkPIMBM5YsGRPsDs6Zhdp8z1g0cgkhQdANOnojm/eiieIrUJUk6Qao5oC/qE7lRWcB/hNhQBoRmjjNVEDf3QQlZ5RfxTem3yxWZTm5QOAaPVf9arb1lomUs1iuLHm7iAIawKvRPiKWl7K/s7ZfRDNAYIFv5sFNB4dsBaoEFj3wpKw7BcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd/T76vZnTuvHrynw3dFGrkCvmJtdjAmRC8HKfTlv98=;
 b=yMHdc5cf8IKe2fOf1vXTKMsoTs6/41MZnwO5WzfcRH+TqiVM3kVNnikqmZDbvRMgjvtQ2LUFikYvEHej0YShPQRtVF31hnZhVfzet25zCM4ukUH6Isr7miWG1t8Sq0DNsfMymD/1/qL0pYiO0/haYkAACIoZlqipiLBf3ecaVUc=
Received: from DM5PR17CA0062.namprd17.prod.outlook.com (2603:10b6:3:13f::24)
 by BY5PR12MB3844.namprd12.prod.outlook.com (2603:10b6:a03:1ad::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Fri, 8 Oct
 2021 09:17:23 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::19) by DM5PR17CA0062.outlook.office365.com
 (2603:10b6:3:13f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Fri, 8 Oct 2021 09:17:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 09:17:22 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 04:17:19 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 "Zhenyu Wang" <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/5] drm/i915: check dri root before debugfs init
Date: Fri, 8 Oct 2021 11:17:01 +0200
Message-ID: <20211008091704.27094-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41b5a868-c28c-4c3f-d26b-08d98a3c6fd1
X-MS-TrafficTypeDiagnostic: BY5PR12MB3844:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3844B402D55EBC49D766BD498BB29@BY5PR12MB3844.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWdDVnvK0rZe5B3ifUYCjln6KtB4FhsJnrTfmVBONLU6dE8F1q7Vc2+ZydxFJnUn8iV5ij8RsB+g4I4ECI+HakR7hUdGjT0QQAGeFlO5GKBP1XNqb75xvNZLW+F7Kx1qYL0FKKadP1ZT5mlD0XlB90h035RzEzXtTD7TkyazJ7psZunA3cMBl0HhgQGRzmX7CZBxaPD/VDR/TMPLNETq6yeOuEXP5vRGmKikUYB2jrHf4H2bYdJe6w72qFVV0VeCuCj2EbLrFDefAckchqs+HnsDCYUZoMeVX82jDSSEh62jV3gP1Knab2Yfod2TlFFdpRWVQV109nwQD0JDa9TjIhKIz+We6w2ZYmio6gSrfpFHJb8fHMQ9qpjS5c07K2Sl8vFXmu/3M+whiPJptftbJPzVYRXe8+X8Bhco1+jfosGMUN1758bQjuKuWZggafTZzXbOUhGsqF6TjhAmuxoNc+Nj1VYuyFjXAOdM+iYmNSYQ/60UG1aGb6DVqzKixE0HlZXwaLRDRRNeI64E/RC2mthC7SISwPB8BwWXMBuCiuFdYeInbobELj7RjRaVNCafq0lThiK8LJUJsKTaOEtvZz7dQsLaiphRePeMoP8ypE0N10Yv3UtTIpY04dMo3fSDplS7PBlQzhpZOLP4dAWkAYOjVYiPEVqrcq3w0RYsHy77ftn6oowuhozZQd8qgy/0n5x/OXEaQRfX5VZNXtcYEF8MokPxutZRs344Zuj+LuM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(1076003)(6916009)(70206006)(7696005)(508600001)(54906003)(6666004)(4326008)(16526019)(186003)(44832011)(26005)(82310400003)(47076005)(36756003)(8936002)(70586007)(36860700001)(5660300002)(336012)(356005)(86362001)(426003)(316002)(81166007)(8676002)(2616005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:17:22.7049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b5a868-c28c-4c3f-d26b-08d98a3c6fd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3844
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

Return early if dri minor root dentry is NULL.

CC: Zhenyu Wang <zhenyuw@linux.intel.com>
CC: Zhi Wang <zhi.a.wang@intel.com>
CC: Jani Nikula <jani.nikula@linux.intel.com>
CC: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/i915/gvt/debugfs.c  | 3 +++
 drivers/gpu/drm/i915/i915_debugfs.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
index 9f1c209d9251..2d47acaa03ee 100644
--- a/drivers/gpu/drm/i915/gvt/debugfs.c
+++ b/drivers/gpu/drm/i915/gvt/debugfs.c
@@ -187,6 +187,9 @@ void intel_gvt_debugfs_init(struct intel_gvt *gvt)
 {
 	struct drm_minor *minor = gvt->gt->i915->drm.primary;

+	if (!minor->debugfs_root)
+		return;
+
 	gvt->debugfs_root = debugfs_create_dir("gvt", minor->debugfs_root);

 	debugfs_create_ulong("num_tracked_mmio", 0444, gvt->debugfs_root,
diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
index 44969f5dde50..d572b686edeb 100644
--- a/drivers/gpu/drm/i915/i915_debugfs.c
+++ b/drivers/gpu/drm/i915/i915_debugfs.c
@@ -1012,6 +1012,9 @@ void i915_debugfs_register(struct drm_i915_private *dev_priv)
 	struct drm_minor *minor = dev_priv->drm.primary;
 	int i;

+	if (!minor->debugfs_root)
+		return;
+
 	i915_debugfs_params(dev_priv);

 	debugfs_create_file("i915_forcewake_user", S_IRUSR, minor->debugfs_root,
--
2.32.0

