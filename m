Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLwPAxMVeWl3vAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9B9A149
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 20:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A10F10E5BD;
	Tue, 27 Jan 2026 19:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xzTtqtki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A468110E5BD;
 Tue, 27 Jan 2026 19:42:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Blp37Z9744NyRcj481/r2SixPW5zc3ls7MJRn/frwZoij0fcCeFeVtRg4mXwKobcYvjzetVdwH6Uhm0N3lt31rNlumvNlqfxeQvJ+DagDCmwq5AyZl+yOHc8bCRF2gTHNmAZHScdibBcM9CUJr7yAhopKNuNDjiKURpAAj121uNL/32cJrTSzBbTET6Lnu5XfBS9U7LcGGTMUvOpBsog4r5oHIcnRexq15v4it359/zib3QIu6DNZC8ZEAj8HsRTADDQK3Zb3kbl4QbDIzdRO4FLSkTivW5HUMKL9DwFLkmwl/gtItJwuaVw06xi9mmZ0ehsYNeWWTKvOmPS4yPfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KZsZPsItMYRPSSuWkUToOQ+EOlJO4V9lxdQsdKVkkU=;
 b=Y0vGDe/NpVr2l3m3Z/61ERdoqGI9mEvspwASUwd/Kz5CgxKulYjcb6DsPvOWWxrY2i7cPpb9ZNOyCZirWjeza3sfz98jgJFk74O6bpmalJ+8afcwTAroDw19a0Z+ciiIszobPfgbDgB71Z8UxrdzAjX+T9HycMhYlEgRB8nEvRdaUUkKhKHDcAeXiayI4PcESvtT9qB0yVYaggnYyoVdQMbsREOSm94dUmkDjNx0558gt99+RQbZcFC8zhS0fHKmH0sZPGLOWMj/IDqwv4SLF4knNvXubxnBWb9b7QrzOox+EhPND1iclS1A9yitHXY92yIm5LMV9ETfu6OUeuGYzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KZsZPsItMYRPSSuWkUToOQ+EOlJO4V9lxdQsdKVkkU=;
 b=xzTtqtkiTREQxGBfcvF1gIabAVXyAzt3WO1Ico9ZZ/g9Q++xAbtKpFj5tQXsJQlww9ReuPLxnxX4XF6Gy9K6IZ1hQ2kx1Fm0DEXCrjk8WCjS+Nnbw8i3TjTTswN5RaQeAyuB54/IsGcxa06gDwuU4SEHmIVRe7o7Iz9iTpocNNE=
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27)
 by MW5PR12MB5624.namprd12.prod.outlook.com (2603:10b6:303:19d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 19:41:56 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:a8:cafe::d4) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Tue,
 27 Jan 2026 19:41:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Tue, 27 Jan 2026 19:41:56 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 27 Jan
 2026 13:41:55 -0600
Received: from thonkpad (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Tue, 27 Jan 2026 11:41:55 -0800
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>,
 <superm1@kernel.org>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH v4 1/2] drm: Introduce drm_crtc_vblank_prepare()
Date: Tue, 27 Jan 2026 14:41:42 -0500
Message-ID: <20260127194143.176248-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|MW5PR12MB5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8a56a9-bca7-47d6-f3e2-08de5ddc2102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?78fldIZRHJMFM//DK6GRfAlz8VAifwzNO9ZQucwgFxQbOTyVSEcbx7NmWuO4?=
 =?us-ascii?Q?MHsnK8JaBNXGOK/eG8M1KLIFwf/RuAYi91lLnCI0f8ntQIbbMbxIsnzSwDly?=
 =?us-ascii?Q?pEthCDkW85VlX6MPkCPxfhl+OBfDcfbS3rhsj8UgxkzCAtN5tmv62zdemzwe?=
 =?us-ascii?Q?rSPMjKmgtg/rm04i8dMwGECN0D1Se/tu+m6AZG+xjxKkj828v3MRzzhFUxim?=
 =?us-ascii?Q?FApKgutk2eGlJY3dZevy0MRldm34dXEHMDuFKeYeQWO6Y0LeGW+w90aGVTeD?=
 =?us-ascii?Q?IPGds1NLo9a7z3TNy0AyoXQtwaCV2VGtisuD/th9iAyS04RI3Wx9aCuIhggQ?=
 =?us-ascii?Q?L5CF9ISsEJMXnkUkB4qfHyqmgW5PGxsNRpeXquQhKaiN9rBnxV9S9rMILEIG?=
 =?us-ascii?Q?GBzw6+hxSSMjgrMZU5PxYh/YbZGAXiwt5kuSuLs8cRsgU3LMsDIW8S4FHaWm?=
 =?us-ascii?Q?P/Fpy3mC3tFRik+syHyAQQIclSrEFn7iKVFY1IjDshNhHrkj9O3wLN6/hkDP?=
 =?us-ascii?Q?G6LhuagsCP41t/8sXFHlPpGnftC+MNd7v+jhCKH1nKfUZ82a7r9r/c4C2PPJ?=
 =?us-ascii?Q?ZJBZZ+MgwG2U/7UPIGIaM94Zy3VLAD6ppviMT+cYBHwPg1ZuxpmOsBBJF5iq?=
 =?us-ascii?Q?vWOiZplTuwgRVPoZ4kdoTzYOTIMVly0FHJt7tT1PdLtAeGalYx0Au5pvGjbr?=
 =?us-ascii?Q?Bfk5bNIqosK7lpeVn00vBv4uIsMr8R8cAUhQHyLc0uENOZCxPJHtCl/cYq/N?=
 =?us-ascii?Q?xM5tBonBOFpPt9ZXD9sP0Mol3cgVQ0g0RmtnG5/RqA+4LCsBfw/TAzEJD4+k?=
 =?us-ascii?Q?nm1izn2FB9ymtaUyW0ZA2NFOZxoXA0e3kwjjve0A3C7F/gmSClFaVgSO1omc?=
 =?us-ascii?Q?WifZMBX6Ut3OQGSrNmZswUVcBp81wrO34Xi5IF9djy2F3//WrckT275YCrML?=
 =?us-ascii?Q?HK4DbmQR6L0aUMtjlbuDdhZR48p8NfLRk6Ivxvfa1fF0dbAIs+yEPFEjlJSS?=
 =?us-ascii?Q?BbOUyDpchOD4gDRv5YvPfmB3STUQme3x7PPhzA4mTlCFiYYHkDFvl02eC/Oy?=
 =?us-ascii?Q?8BJWI5ySh3YdfcAV3HGY79dpLDMQN478+N4rhWUTXCkV+tFG8N4q0R56uCQM?=
 =?us-ascii?Q?+bQqoQ2lR3Z5So2jDQo35Ng3qIuRhLEpOzsYLDY6lX5K2gIHdorOi598OG6V?=
 =?us-ascii?Q?Kp36/L2OUs4Dj6bMuQdz1P6wVwURemauULtRaQZfw4ApPkxywnS7jsqLpsly?=
 =?us-ascii?Q?FucGF/rC6+YMnYVIgWXl63iIxJGR1zm/mtaIpScOr44lotolp/1aSWHbCyJI?=
 =?us-ascii?Q?FiUZB0Hy2tVCsNv6KOT82cl9D3UE10s00OA8Pw7RmuG4Ig9HN+4bSyzzPVpT?=
 =?us-ascii?Q?Z06ps57Uqm3u9+AUyr+VZhmrhBRimvj06UOmqVCC6L7ScFzPSCGrD7lSzFT5?=
 =?us-ascii?Q?ZoadNWJno5xiww0y/fiyiZ1bZjP4QEomDLC6D/fH5/9CwHI8EZV6NB2Jv8qK?=
 =?us-ascii?Q?eXqfj2XChL8myv66BuOr4la79ItZy2ArD2pT3kFLHsBAlHWcwq4bvKrs9Qy3?=
 =?us-ascii?Q?O4jV6X5QGGoeDR5j6QIPqrRO4kC8Z525NOphrgfZfRdwqherBta7Q8y5IYqw?=
 =?us-ascii?Q?3uHCSVYZ3WzNFm9Un0+28wtIkVS4QfOH4+2g9VGblEw4eh0Jr5eF5fIfB+O5?=
 =?us-ascii?Q?qOWeJA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:41:56.0785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8a56a9-bca7-47d6-f3e2-08de5ddc2102
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5624
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amd.com,ffwll.ch,gmail.com,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	FROM_NEQ_ENVFROM(0.00)[sunpeng.li@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B0A9B9A149
X-Rspamd-Action: no action

From: Leo Li <sunpeng.li@amd.com>

Some drivers need to perform sleepable operations prior to enabling
vblank interrupts. A display hardware spin-up from a low-power state
that requires synchronization with the rest of the driver, for example.

To support this, introduce a DRM-internal drm_crtc_vblank_prepare()
helper that calls back into the driver -- if implemented -- for DRM to
do such preparation work before enabling vblank.

v3:
* Unexport drm_crtc_vblank_prepare() and make it DRM internal
* Drop warnings in drm core for vblank_prepare(), drivers can do so in
  their implementations
* Drop unnecessary crtc null checks
* Check for drm_dev_has_vblank()
* Rebase on latest drm-misc-next

v4:
* EXPORT function to fix build error on DRM_KMS_HELPER=m

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_atomic_helper.c  |  9 +++++
 drivers/gpu/drm/drm_client_modeset.c |  4 +++
 drivers/gpu/drm/drm_internal.h       |  1 +
 drivers/gpu/drm/drm_plane.c          |  5 +++
 drivers/gpu/drm/drm_vblank.c         | 49 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank_helper.c  |  5 ++-
 drivers/gpu/drm/drm_vblank_work.c    |  8 +++++
 include/drm/drm_crtc.h               | 21 ++++++++++++
 8 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5840e9cc6f666..2b9fa4aa48a1a 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -48,6 +48,7 @@
 
 #include "drm_crtc_helper_internal.h"
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -1268,6 +1269,10 @@ crtc_disable(struct drm_device *dev, struct drm_atomic_state *state)
 		if (!drm_dev_has_vblank(dev))
 			continue;
 
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			continue;
+
 		ret = drm_crtc_vblank_get(crtc);
 		/*
 		 * Self-refresh is not a true "disable"; ensure vblank remains
@@ -1823,6 +1828,10 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
 		if (!new_crtc_state->active)
 			continue;
 
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret != 0)
+			continue;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret != 0)
 			continue;
diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
index fc4caf7da5fcd..6ccbde921dde4 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -1325,6 +1325,10 @@ int drm_client_modeset_wait_for_vblank(struct drm_client_dev *client, unsigned i
 	 * Only wait for a vblank event if the CRTC is enabled, otherwise
 	 * just don't do anything, not even report an error.
 	 */
+	ret = drm_crtc_vblank_prepare(crtc);
+	if (ret)
+		return ret;
+
 	ret = drm_crtc_vblank_get(crtc);
 	if (!ret) {
 		drm_crtc_wait_one_vblank(crtc);
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index f893b1e3a596e..8e3e21d734075 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -112,6 +112,7 @@ static inline bool drm_vblank_passed(u64 seq, u64 ref)
 }
 
 void drm_vblank_disable_and_save(struct drm_device *dev, unsigned int pipe);
+int drm_crtc_vblank_prepare(struct drm_crtc *crtc);
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe);
 void drm_vblank_put(struct drm_device *dev, unsigned int pipe);
 u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index bed2562bf911b..41681a3d96b15 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -35,6 +35,7 @@
 #include <drm/drm_vblank.h>
 
 #include "drm_crtc_internal.h"
+#include "drm_internal.h"
 
 /**
  * DOC: overview
@@ -1421,6 +1422,10 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 		u32 current_vblank;
 		int r;
 
+		r = drm_crtc_vblank_prepare(crtc);
+		if (r)
+			return r;
+
 		r = drm_crtc_vblank_get(crtc);
 		if (r)
 			return r;
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 42fe11cc139b9..f57de47438f0c 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1208,6 +1208,33 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
 	return ret;
 }
 
+/**
+ * drm_crtc_vblank_prepare - prepare to enable vblank interrupts
+ *
+ * @crtc: which CRTC to prepare
+ *
+ * Some drivers may need to spin-up hardware from a low power state before
+ * enabling vblank interrupts. This function calls the prepare_enable_vblank
+ * callback, if available, to allow drivers to do that.
+ *
+ * This is a DRM-internal function, and is a thin wrapper around a driver
+ * callback. Drivers are expected to sequence their own prepare work internally.
+ *
+ * The spin-up may call sleeping functions, such as mutex_lock(). Therefore,
+ * this must be called from process context, where sleeping is allowed.
+ */
+int drm_crtc_vblank_prepare(struct drm_crtc *crtc)
+{
+	if (!drm_dev_has_vblank(crtc->dev))
+		return -EINVAL;
+
+	if (crtc->funcs->prepare_enable_vblank)
+		return crtc->funcs->prepare_enable_vblank(crtc);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_vblank_prepare);
+
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
@@ -1306,6 +1333,10 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	int ret;
 	u64 last;
 
+	ret = drm_crtc_vblank_prepare(crtc);
+	if (ret)
+		return ret;
+
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
@@ -1489,6 +1520,9 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	if (drm_crtc_vblank_prepare(crtc))
+		return;
+
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
@@ -1796,6 +1830,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 		return 0;
 	}
 
+	crtc = drm_crtc_from_index(dev, vblank->pipe);
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			return ret;
+	}
+
 	ret = drm_vblank_get(dev, pipe);
 	if (ret) {
 		drm_dbg_core(dev,
@@ -2031,6 +2072,10 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 		READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			return ret;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret) {
 			drm_dbg_core(dev,
@@ -2098,6 +2143,10 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
 	if (e == NULL)
 		return -ENOMEM;
 
+	ret = drm_crtc_vblank_prepare(crtc);
+	if (ret)
+		return ret;
+
 	ret = drm_crtc_vblank_get(crtc);
 	if (ret) {
 		drm_dbg_core(dev,
diff --git a/drivers/gpu/drm/drm_vblank_helper.c b/drivers/gpu/drm/drm_vblank_helper.c
index a04a6ba1b0ca0..fc5915acfa7f3 100644
--- a/drivers/gpu/drm/drm_vblank_helper.c
+++ b/drivers/gpu/drm/drm_vblank_helper.c
@@ -8,6 +8,8 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_vblank_helper.h>
 
+#include "drm_internal.h"
+
 /**
  * DOC: overview
  *
@@ -61,7 +63,8 @@ void drm_crtc_vblank_atomic_flush(struct drm_crtc *crtc,
 	crtc_state->event = NULL;
 
 	if (event) {
-		if (drm_crtc_vblank_get(crtc) == 0)
+		if (drm_crtc_vblank_prepare(crtc) == 0 &&
+		    drm_crtc_vblank_get(crtc) == 0)
 			drm_crtc_arm_vblank_event(crtc, event);
 		else
 			drm_crtc_send_vblank_event(crtc, event);
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index 70f0199251ea0..252f60007781b 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -113,11 +113,19 @@ int drm_vblank_work_schedule(struct drm_vblank_work *work,
 {
 	struct drm_vblank_crtc *vblank = work->vblank;
 	struct drm_device *dev = vblank->dev;
+	struct drm_crtc *crtc;
 	u64 cur_vbl;
 	unsigned long irqflags;
 	bool passed, inmodeset, rescheduling = false, wake = false;
 	int ret = 0;
 
+	crtc = drm_crtc_from_index(dev, vblank->pipe);
+	if (crtc) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			return ret;
+	}
+
 	spin_lock_irqsave(&dev->event_lock, irqflags);
 	if (work->cancelling)
 		goto out;
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd68..e5cf232d604c9 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -871,6 +871,27 @@ struct drm_crtc_funcs {
 	 */
 	u32 (*get_vblank_counter)(struct drm_crtc *crtc);
 
+	/**
+	 * @prepare_enable_vblank:
+	 *
+	 * An optional callback to prepare driver for enabling of vblank
+	 * interrupts. It allows drivers to perform any blocking operations for
+	 * hardware setup that might be needed, and thus is called before any
+	 * vblank spinlocks are acquired. It is called unconditionally,
+	 * regardless of whether vblank interrupts are already enabled or not.
+	 *
+	 * Consequently, this callback is not synchronized with the rest of
+	 * vblank management. Drivers should not access spinlock protected
+	 * states here.
+	 *
+	 * This callback is optional. If not set, no preparation is performed.
+	 *
+	 * Returns:
+	 *
+	 * Zero on success, negative errno on failure.
+	 */
+	int (*prepare_enable_vblank)(struct drm_crtc *crtc);
+
 	/**
 	 * @enable_vblank:
 	 *
-- 
2.52.0

