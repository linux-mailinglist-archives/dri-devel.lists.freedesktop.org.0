Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167539EB8E7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 19:00:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A36110E947;
	Tue, 10 Dec 2024 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v1C9AqZ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A54C10E94C;
 Tue, 10 Dec 2024 18:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5N/NzNNJZxxBghEG7XLIYUbiG9q6dZHzGdfO6V5umGYslse2YRkd6pMjfknqrY6JeJND8ZAzExCGr3iqK0MfKqaPnkNTTGu2qLbtHfgRbr+Lf1J/fCwFlI59RaJji2vMejYVDEL3/N4hikW+KriHDSggjXMzjresvBTZTEf3pEGcL+zNTVhtZjxihvV/7HTqHpqRwlYcVfFGsOlHLP0zGJ6Om7qf9a8kbG46QjYuYN24UkibGtVPvXWyvBdzxeS1qiUqcV5w9CWB1y/lRl1yEGWUpn1sG2G9eIVV+fCiCcylIzPJzZ4Wceid7J4HPCNIOTT54swjpt6Gs/SkQdYmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIUQT/57KDGwZBx3R/9Sp+xvZkpfbLak5DjtIRmow0s=;
 b=O4CRqg0LPNV/cJ2YSW5CvVRk16T+E7d64nOd7WqMZKBqTUGeoXSKmX4iwyT082uFfMO74U7f4orW8IwdZC7XS1wKSvw67JYn1ywQLchysbOLqkPEmkraIXt+lbV8naeL2kbo/nw6tRu/DORWj8FtLW3/D/LXiB/BLKn4TDr6Ec6ppgmVssiqZi7FpMKH0W9lqtQpgOp81fuKYYeZy+33K+/TyDQbRz+xy5A26Bej0exJX+ap93F6mzDQt76RRnNCmcPlTs97HhuKP+pqx6675l202u9OrKBEcpwSoTplT210b+GimlyWzf0DkaS2Lv6RWTvKg1gwMYEmjnTwaBwe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIUQT/57KDGwZBx3R/9Sp+xvZkpfbLak5DjtIRmow0s=;
 b=v1C9AqZ69M81tk1GpFTou3vEFp1up8JmQPnfvW77S8pvdBxGtnKiWCbJODJ0+c1/M+la3AoGkjXeLDkvXHd+SHWUe3EK6U5sJ1sc5Omn1ERSZTw/4dZVYZ/sqDzl/t1o4opV1use1sycgA3fIfAxXRtkailPjSAHHcTyyp3Y4LI=
Received: from SJ0PR05CA0060.namprd05.prod.outlook.com (2603:10b6:a03:33f::35)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Tue, 10 Dec
 2024 18:00:11 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::be) by SJ0PR05CA0060.outlook.office365.com
 (2603:10b6:a03:33f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.10 via Frontend Transport; Tue,
 10 Dec 2024 18:00:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 10 Dec 2024 18:00:09 +0000
Received: from MKM-L10-YUNXIA9.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 12:00:04 -0600
From: Yunxiang Li <Yunxiang.Li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <christian.koenig@amd.com>,
 <tvrtko.ursulin@igalia.com>
CC: <Alexander.Deucher@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 4/6] drm: consider GEM object shared when it is exported
Date: Tue, 10 Dec 2024 12:59:37 -0500
Message-ID: <20241210175939.2498-5-Yunxiang.Li@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210175939.2498-1-Yunxiang.Li@amd.com>
References: <20241210175939.2498-1-Yunxiang.Li@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: 42219f1e-b7dd-4f6c-c55e-08dd19447cb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cXtDStFooCbaAVCglEXqu1yxRFbeQvc7NO2TmPfiTcakVVgCXnhp/Tnk4xZ3?=
 =?us-ascii?Q?/JfHpo7Zf2LT3WgbhvUiqAUeriy7EyRZABL1GsQxTE2gbBROtrHhGkbriszM?=
 =?us-ascii?Q?hhdzJXZW1LTR14NxRLeF8N6d6eHVF94pbe6/XE+TgxsY0MaYc67c3CTdRG1g?=
 =?us-ascii?Q?Uk3JltvJjN7MJQC232lt9ha9rtSKDy9aDjG8fTUw9QlJxMQAS2hvawQnzUZh?=
 =?us-ascii?Q?NFit9xlmHBoOhqNYQG+PNLpd+0tANDlzXf3VdoMe30TcZVZHzndoyN0K9D9h?=
 =?us-ascii?Q?6z7t/JOBvk2EWZ9Emw63DUaqigWt/15MTNF35ve9uSf16RSKGca1btNfxN35?=
 =?us-ascii?Q?toXaDgJlY1jV8XisZpmrSjF1/l7KThJDXiIX7fJkxYtarHIW0Zlj3ehSlx1Z?=
 =?us-ascii?Q?iL0GR0Gw4TKrqNZU+HndnFdmdvPc0OhhZiFrfrL7umISPZ0aapzVnLQqnn8n?=
 =?us-ascii?Q?iJqHM2FTAGhHfNBvfc304FV43d3anGB9wy/Wy6EDOQ3GNe2TlZdlFHif1yek?=
 =?us-ascii?Q?EyYPOUHsCuX3yyUITConGWIkHILEIqteJV1nxVwTR4K5rELfr0AOAHUmdBQ6?=
 =?us-ascii?Q?41wRYgv3+JVGBiYkD6qcsn9FdzoEgVzDOHkrYDo7ekMHZsyldJM2f/m75Oyx?=
 =?us-ascii?Q?rQJfjnDRuBL/yPpYPfQXYQo4X4vFgZvcMWIgNWlECWa9LYtNxoZQ9o81NmHf?=
 =?us-ascii?Q?sJBMHFoMeYtQB7Z8dj4XmKq4tJqLvxDj+gaMiJs2/NutIy9+xYdtrdGcQ07L?=
 =?us-ascii?Q?Txdvaq76Ea3r+Ot2uPLG3R8RpO63D9iu025qDZCg4jB18x8lzCDtWQM/suO1?=
 =?us-ascii?Q?CozAm+NxT9wq8XIkXz3fhi+IywrAUigl4G3IxZWIVSPdUhSmhNUl+lF593VL?=
 =?us-ascii?Q?i231HPiMXNfgmzyAN+f+l2JNk5r5CVaNtonrRAIDk8kr5pPsNW6OR7bHGkyv?=
 =?us-ascii?Q?mfa1TaucHPeHJ5SRcL5spSFsbe5bJ8rtcYwzlqeUn//8mxI0vUce1gLS73hf?=
 =?us-ascii?Q?vRJifw8o4LXvnpihjDy2lx+Qh0Oaw5mEzDCfaOGGILrUD1gGXMxyqMUS0+P8?=
 =?us-ascii?Q?esJ5KZ2AZvcn53DY2P94s2ifXCoJcKz6JeRjRSk9pqmGV+H8cE/iVPhLvOwk?=
 =?us-ascii?Q?fYgV1kFBAera+TQKECNW8OEuaxmT4a4SMPpVRqVQGreGxVisgHoUwEyJN15U?=
 =?us-ascii?Q?wBjzQ927l0tpc76dDCYXtSxkudZItZgch9kAWzLSovPSjtbP8Da9/Nc+wxPS?=
 =?us-ascii?Q?mNtkmX8ATWqG0mHRPIyqXA/LRr5tWaXvGscKZmS3bEfkJ4HXVNRapkZMruU6?=
 =?us-ascii?Q?zfIuCFH3siJ2OlNeafeoD0qCcs8rLecZ3WHDu7ZtGqRRnlkMZsfWF/5uNjyX?=
 =?us-ascii?Q?ge79EqxqjZTxfrXiVvmmMVqDKNQ0fktnz/5H5PWBu/ezREJL2K4VEkQCAcRT?=
 =?us-ascii?Q?DRpAE5JUwyhAk/Nu5NwQ91crgs7cUDOM?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 18:00:09.5492 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42219f1e-b7dd-4f6c-c55e-08dd19447cb7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194
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

Tracking the state of a GEM object for shared stats is quite difficult
since the handle_count is managed behind driver's back. So instead
considers GEM object shared the moment it is exported with flink ioctl.
This makes it work the same to the dma_buf case. Add a callback for
drivers to get notified when GEM object is being shared.

Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>

CC: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_gem.c   |  3 +++
 drivers/gpu/drm/drm_prime.c |  3 +++
 include/drm/drm_gem.h       | 12 +++++++++++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index d4bbc5d109c8b..1ead11de31f6b 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -854,6 +854,9 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
 			goto err;
 
 		obj->name = ret;
+
+		if (obj->funcs->shared)
+			obj->funcs->shared(obj);
 	}
 
 	args->name = (uint64_t) obj->name;
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0e3f8adf162f6..336d982d69807 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -406,6 +406,9 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
 	obj->dma_buf = dmabuf;
 	get_dma_buf(obj->dma_buf);
 
+	if (obj->funcs->shared)
+		obj->funcs->shared(obj);
+
 	return dmabuf;
 }
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index da11c16e212aa..8c5ffcd485752 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -122,6 +122,16 @@ struct drm_gem_object_funcs {
 	 */
 	struct dma_buf *(*export)(struct drm_gem_object *obj, int flags);
 
+	/**
+	 * @shared:
+	 *
+	 * Callback when GEM object becomes shared, see also
+	 * drm_gem_object_is_shared_for_memory_stats
+	 *
+	 * This callback is optional.
+	 */
+	void (*shared)(struct drm_gem_object *obj);
+
 	/**
 	 * @pin:
 	 *
@@ -568,7 +578,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
  */
 static inline bool drm_gem_object_is_shared_for_memory_stats(struct drm_gem_object *obj)
 {
-	return (obj->handle_count > 1) || obj->dma_buf;
+	return obj->name || obj->dma_buf;
 }
 
 #ifdef CONFIG_LOCKDEP
-- 
2.34.1

