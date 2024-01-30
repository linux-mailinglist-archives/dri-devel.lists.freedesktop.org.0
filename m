Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16405842A4B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 18:03:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FF6113223;
	Tue, 30 Jan 2024 17:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2049.outbound.protection.outlook.com [40.107.95.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364161131CD;
 Tue, 30 Jan 2024 17:03:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D4Socgwh6xWUreUYINpG/J3KOLUSkFYyJPm+BrcQZJaDgQpyngPkEjeGOQStMtB2OWYEr4RpjtYhRnAvt3Nsu2+DOU0l4DKIMTTC7l6438fcpQDQbCxe6jJvodypZXLI6Y7jokseYSxVkrwmUZz0UuibPOr4Etfff2NV0NO6PirqKTIzaW2oNP3kd5wDcbixUDr/fcA7WpHABjnOMInVT8bREFzilZjSRYgpnGw0tzLCnlrmy/Z0Ljnoat/QOhWktgXSbS8HvDb+QPnVw7DkSdv3Je1hIung/dNVo4kju9sNQmHCpe+IPZxwJWCz1/FQj/Bw78EqfQtLH11O69969w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DY8aq4NpcJw/Ci//xgfd8DHDI0Bok1t9eLh2qxrsn74=;
 b=mypGHkT5wNGIOpi07sTXc7+ifeCVgYdtqcVVik43mxlRzqiHE+V+enCi9zZLaBiFJy0qQSkkF7vBLtPi55loaiAJMspogIta68x6d+SL/w4eH0cctFmNF0Mu6cZstr0MupjZjSaGbgPhZNZTvQUlYs8d3qbqoAS0CvgHPCPpDGELc+pKaCdOEJNC+hdJ/2gpejnXPcXG16lTZf9lQ8ErNnamHxGUa4hJoge1TeoncXFKnPXiMC/BngaQVbz/K8C1ImM0M88YaKvegyg7jU1FvVPNYio8WBgolJIkJ8+f5b4NM5Vk1YV9B2uBtjgvr3Ocew2iGRu1cwibfnBuBGkIPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DY8aq4NpcJw/Ci//xgfd8DHDI0Bok1t9eLh2qxrsn74=;
 b=YNTRl7mk6BfyCWS1Bea5YPVCZqPaRLzrWNP2E4zL0eDVe/3hxGAFmu8JnYbuw838TyyRmv6zaR4eFPgAOIa+3WvBXekEe93ec+3XhO1nYgONkOXh48PGlK+OKyKWhUmS2pamzMz8VWGJfXms73fUT91XMMn5rt5r2JU2l5ikkAY=
Received: from CH0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:610:11a::27)
 by MW4PR12MB5602.namprd12.prod.outlook.com (2603:10b6:303:169::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Tue, 30 Jan
 2024 16:13:28 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::e5) by CH0PR03CA0337.outlook.office365.com
 (2603:10b6:610:11a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 16:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 16:13:27 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 10:13:26 -0600
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <tvrtko.ursulin@linux.intel.com>, <daniel@ffwll.ch>
Subject: [PATCH 2/6] drm: add drm_gem_object_is_shared_for_memory_stats()
 helper
Date: Tue, 30 Jan 2024 11:12:31 -0500
Message-ID: <20240130161235.3237122-3-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130161235.3237122-1-alexander.deucher@amd.com>
References: <20240130161235.3237122-1-alexander.deucher@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|MW4PR12MB5602:EE_
X-MS-Office365-Filtering-Correlation-Id: e980d82c-14de-4084-e5b4-08dc21ae64cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62C4E/hL98yOUFiw4FLBUAQKygv0NgXxg3C/cJZW37bwK3efW+LH+RJqjY6giS/uscCEv9fmL5i8YOq8x2zQzJrEGTRgbVUC9WvVuHvYhi3hktagdkROzvJisOehkI1oBbhXdFjRgKxhXvmNcnYvs8XtAv4xW5lPcS7CdIr6436RaKV4bM2c00Oh72WZvr2MPyTyRE5vPy6mSCKtjERE33JQ9nafavv5jwYNerkGqam8estpdMIHeuA5HT1u/HvCfsjy/8AUk63vmsmK+Rv+6Gk2Mb74atV8rh9s/HKVoWwgZMNC5H2Ag93lo3Om75auOXIbbJK4aTNhqmXgOvzZOjQ0yYueKoZu5vgr0DTK6pWDCC0mQGXc2w/0bSWQzhvpTrLyLXQa1EJlYuRNV0GPVtwRIdJ0NpTN6lWT1KpI37FpNi5f5CcQFRa6qXssTq8+pvTfbmwgiyf2Fh+TycuJ1U/1MEIXxANbMaLHuv8QZf4QU0LROt+u2ksXv/+dMytzhuQ4isjM5JGyAt4qWgqdQD3F4VBQsVzypR3dYstvA6ZdotdVo+VJGbu7v601J5mlK+XPxg3ecAjMHuaGnvUJ0IpPd+mUSf7KUcNnKlgl82YLvfJTzzPUaRuYMUCJ9NpbDmaASNkxsJQpViCaUfPcLaFRJbpuigU2849J5nEFRjBseIuudH0P6/+biV/0xlQCZfRuok4UI6IPJ2j11tSV4PhebxHV8nTAWewKqYc+fvQ6kGSKV3Btaw/Qm+K1Kk16h1Ons9ppRsE6Gn2kaMSytg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(82310400011)(186009)(64100799003)(40470700004)(36840700001)(46966006)(83380400001)(16526019)(426003)(1076003)(6666004)(7696005)(336012)(478600001)(36860700001)(8936002)(47076005)(316002)(2616005)(41300700001)(5660300002)(4326008)(81166007)(2906002)(8676002)(70586007)(966005)(110136005)(70206006)(82740400003)(36756003)(86362001)(356005)(26005)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:13:27.8228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e980d82c-14de-4084-e5b4-08dc21ae64cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5602
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper so that drm drivers can consistently report
shared status via the fdinfo shared memory stats interface.

In addition to handle count, show buffers as shared if they
are shared via dma-buf as well (e.g., shared with v4l or some
other subsystem).

Link: https://lore.kernel.org/all/20231207180225.439482-1-alexander.deucher@amd.com/
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 16 ++++++++++++++++
 include/drm/drm_gem.h     |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 44a948b80ee1..71b5f628d828 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1506,3 +1506,19 @@ int drm_gem_evict(struct drm_gem_object *obj)
 	return 0;
 }
 EXPORT_SYMBOL(drm_gem_evict);
+
+/**
+ * drm_gem_object_is_shared_for_memory_stats - helper for shared memory stats
+ *
+ * This helper should only be used for fdinfo shared memory stats to determine
+ * if a GEM object is shared.
+ *
+ * @obj: obj in question
+ */
+bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
+{
+	if ((obj->handle_count > 1) || obj->dma_buf)
+		return true;
+	return false;
+}
+EXPORT_SYMBOL(drm_gem_object_is_shared_for_memory_stats);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 369505447acd..86a9c696f038 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -552,6 +552,7 @@ unsigned long drm_gem_lru_scan(struct drm_gem_lru *lru,
 			       bool (*shrink)(struct drm_gem_object *obj));
 
 int drm_gem_evict(struct drm_gem_object *obj);
+bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj);
 
 #ifdef CONFIG_LOCKDEP
 /**
-- 
2.42.0

