Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B42A2D0C0AD
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D0910E937;
	Fri,  9 Jan 2026 19:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CF9aVPFG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C13310E1BC;
 Fri,  9 Jan 2026 19:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncVG/xIg39fhSyL5ieqcrVV27ROCkYXDR75WWGENwlqIVTojAALMeR0XDJHTf19pbB+krQnfFG5xu0k7U5u4T7C7ZiZsp9EEGIU9yD0fm9VtNiNpKYVT3dkOseYlM7vyGuzcdqj2uk7R1d7X41VI8yiEczhOvMLWCLJ+w8szWROvH5MpBR3mCFPohj77ZOdnsaXLuv31MkuNk8wkr6cAKgkbTt8Rr8Rw+9kgr+Zjf4luaz7S67bAiwlK2DBgA3JOz6mMiEpYWZ0TZkzvLZnFCSLQf1Rs+735Lu7vjiZug2XEL3trr9bcnVtCRgFq6DiBuomIWvj7Fnph+9LM62mKrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNr3CdCQvUYqr5ij6lEGBlVanSipzQvm7lrNS9R4SeA=;
 b=CSEUneh5fuhoqibLDnKm96ESj6MWakq3pzWLW4IK9Pkk45z1yAIQAKarMChQX5fkDxZhig2sKKH6Lt1Oh+Dul6CEdIAyzufXVKhSuZF8EHc6IB03u2ncX/ixawikwQHsC8x79Rc+gnktyZyemI4+1Ju1cK7u78Gk04yCdY0k9TUt8Zr/N7I2k7TBmnBV1FZKInW1ImOG8up4XP/Tu87lvfJb2g0qJXyvPVX5nMm98aa7XBGF0BHMdlttHsLBbM2qY1FuB8EpDeaAJkUkR4Z0brv+chzvsLkG3YT38VxAPI2UOb2+GTj3kB+z6WGU3l10AHpASAeN1CklzzbnrlaCAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNr3CdCQvUYqr5ij6lEGBlVanSipzQvm7lrNS9R4SeA=;
 b=CF9aVPFG4ny+eDYRZeDwkCdiMhC5kZNhyRxtd0EHkmfWCpZ6UBjR83VJmkY1ZaI19UqV5JqtkK9mts3YvcQLeiS7fAqyHwquxil4WUboubzK0hJKgHxd+VFgAhR3juLDxZ5IEiVOwNm6ECdeVxz05P6DEejcOMzG1OaQiqMWogM=
Received: from CH0PR07CA0018.namprd07.prod.outlook.com (2603:10b6:610:32::23)
 by CH3PR12MB8281.namprd12.prod.outlook.com (2603:10b6:610:128::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 19:20:46 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::f8) by CH0PR07CA0018.outlook.office365.com
 (2603:10b6:610:32::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 19:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 19:20:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 13:20:46 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 11:20:46 -0800
Received: from thonkpad (10.180.168.240) by satlexmb08.amd.com (10.181.42.217)
 with Microsoft SMTP Server id 15.2.2562.17 via Frontend Transport;
 Fri, 9 Jan 2026 13:20:43 -0600
From: <sunpeng.li@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <simona@ffwll.ch>, <airlied@gmail.com>,
 <jani.nikula@linux.intel.com>, <ville.syrjala@linux.intel.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH v3 1/2] drm: Introduce drm_crtc_vblank_prepare()
Date: Fri, 9 Jan 2026 14:20:26 -0500
Message-ID: <20260109192027.116325-1-sunpeng.li@amd.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|CH3PR12MB8281:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb34f82-aad1-4aea-d92b-08de4fb43101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RZ3aAqfW/M9X4wGd7wak5S2RcrFqv6G6WJKXqhRqE202C27PnwolZ4zFToTb?=
 =?us-ascii?Q?FSOCy6vs/UdzmZOFOiiaiwt7fXSYNi1Gvkn1Z/u5Q5fN3rZpbgt3CQPCzp4R?=
 =?us-ascii?Q?d3L6/3U6JHwt7XCv+xaSKrzWkqlqcio4fGFWWizsdgjSDyrXMLGJNjnFZW9C?=
 =?us-ascii?Q?Fn9hUBmeiyb91FRGeuJd67N83/uNGvoANoZ103iXw9iTIfxQYUHdwY7vIbXv?=
 =?us-ascii?Q?Zi1BGWBUxx3xkM44HNZJuCn5FCcNvTbtD9GtWaUvODia7zPVNSVbbbiFG2Oc?=
 =?us-ascii?Q?QKH3QAHsqD+lqNz+GM+YuzTbLUW/m45MNV2AGreYmQ8VEHwUgqnUF55rLPJP?=
 =?us-ascii?Q?9pWWzQ7I9NcKcH8yc0rq1NFx0NSFvQGkkXyVlkB1h/oYV+Bg2kEs9oHtiHDo?=
 =?us-ascii?Q?X/qF5hsPicfjaDsGpYBAR/dFvV3M05JWt0SR8Nzqj0giU9RPAve1x+Gev0bZ?=
 =?us-ascii?Q?aHYqcrWAYAyjyy/wkNVFf7NrEoBT9FTjX0oMFVJCA6knv1i75vG2NgjtRSGo?=
 =?us-ascii?Q?qv2n64TP+bv67sJ1EN3p+Io6NAckS9W5nokixLsSEgW1gYNG2Jy6L8dElGsQ?=
 =?us-ascii?Q?eK8G2XJyHfiliiQh7+Sr5bH5QB/+/A32HdvfHK8EWz/Wg7mhZTj2++Dmw7S0?=
 =?us-ascii?Q?6kYru0Gx9wwKsz3Uih0uiiQngggzL1GRKdLB0CWKK4zoA0pevgupR1gTctOH?=
 =?us-ascii?Q?AraM4i1rxbDLnr/AdwNSBh9Y+fVg9mhCa4HDgOGm+fViZd+wAHC9d8NQB58z?=
 =?us-ascii?Q?vMxYsiF6qXFdH/askoIx3Fnk9O7sh9kYe0u940kOmjSTAhKX4mXXE/1l17LI?=
 =?us-ascii?Q?FjcYtHo/vViMYDgdqbPjeA283ALEvpvkKiS/vK9b3cJXbOwCkIpdh0EQqQ7q?=
 =?us-ascii?Q?/H9ubCfNCgMy7hYH7KokDZgCaES4iDV35rtCABZYjGnYuJE/ooGNbHeDn5fV?=
 =?us-ascii?Q?FNm+gvawpdSS0o2iGVO7JxbLhNNoMIGqiQSLVpoWCn5jdZ53RaEUBih4noDO?=
 =?us-ascii?Q?TFL5EbfAzavQxf8Vd9oK8NELtqjWj+Jp/hk0r1HELJKDsiqL9j9aJO27wZRo?=
 =?us-ascii?Q?oTHbQSirGk3GRG3W0/guHLIl2WQI4FCEpTdeBmDDroNN3m4ZcfUhZXi24nNu?=
 =?us-ascii?Q?Y78U91l3vxCUTBlYMWe6TlC7Dc39uqM7miunB+kMfHwpmoiyXH9h4PuLvb10?=
 =?us-ascii?Q?Naf5TPx6qIFkVnxWNETT/WNe03RfdiScgIHA6wTS5nPgyVk696EPAVP/fQIR?=
 =?us-ascii?Q?pxcEBTbfNTgrNjaaabN4zavA7l0wwg6gaB2ZVlgjCIi9jQNMKFWwNV3ney1i?=
 =?us-ascii?Q?XthkXyLsa0VOF4gV8XcBWGi+Bx/IgiA0JeWjwVHYP+ZHUA/cdinsLdCbER0k?=
 =?us-ascii?Q?zGKPDY9Z5Mk4cRVKPyaCxw/CBvXEx0o8S8/CyTiBSP4QRjM/w0qksh9sagIO?=
 =?us-ascii?Q?bJIoSBuyqjnvDD/0sZazPCVKj48wROYZQHY1LB5Gdc9RERTA8ZeU/OagrnrF?=
 =?us-ascii?Q?zO0k97Y54FscLwQiYrllC4qrlHdXluTn9R1HNqjsAX2atwXpfjPGoGGDNTRQ?=
 =?us-ascii?Q?kcg5qORSNkt2wafOk14=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:20:46.7576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb34f82-aad1-4aea-d92b-08de4fb43101
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8281
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

Signed-off-by: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/drm_atomic_helper.c  |  9 ++++++
 drivers/gpu/drm/drm_client_modeset.c |  4 +++
 drivers/gpu/drm/drm_internal.h       |  1 +
 drivers/gpu/drm/drm_plane.c          |  5 +++
 drivers/gpu/drm/drm_vblank.c         | 48 ++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_vblank_helper.c  |  5 ++-
 drivers/gpu/drm/drm_vblank_work.c    |  8 +++++
 include/drm/drm_crtc.h               | 21 ++++++++++++
 include/drm/drm_vblank.h             |  1 +
 9 files changed, 101 insertions(+), 1 deletion(-)

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
index 42fe11cc139b9..b8a967a4ba7e5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1208,6 +1208,32 @@ static int drm_vblank_enable(struct drm_device *dev, unsigned int pipe)
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
+
 int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
@@ -1306,6 +1332,10 @@ int drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 	int ret;
 	u64 last;
 
+	ret = drm_crtc_vblank_prepare(crtc);
+	if (ret)
+		return ret;
+
 	ret = drm_vblank_get(dev, pipe);
 	if (drm_WARN(dev, ret, "vblank not available on crtc %i, ret=%i\n",
 		     pipe, ret))
@@ -1489,6 +1519,9 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
 
+	if (drm_crtc_vblank_prepare(crtc))
+		return;
+
 	spin_lock_irq(&dev->vbl_lock);
 	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
 		    pipe, vblank->enabled, vblank->inmodeset);
@@ -1796,6 +1829,13 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
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
@@ -2031,6 +2071,10 @@ int drm_crtc_get_sequence_ioctl(struct drm_device *dev, void *data,
 		READ_ONCE(vblank->enabled);
 
 	if (!vblank_enabled) {
+		ret = drm_crtc_vblank_prepare(crtc);
+		if (ret)
+			return ret;
+
 		ret = drm_crtc_vblank_get(crtc);
 		if (ret) {
 			drm_dbg_core(dev,
@@ -2098,6 +2142,10 @@ int drm_crtc_queue_sequence_ioctl(struct drm_device *dev, void *data,
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
diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
index 2fcef9c0f5b1b..c91384ee2617b 100644
--- a/include/drm/drm_vblank.h
+++ b/include/drm/drm_vblank.h
@@ -301,6 +301,7 @@ void drm_vblank_set_event(struct drm_pending_vblank_event *e,
 bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe);
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc);
 int drm_crtc_vblank_get(struct drm_crtc *crtc);
+int drm_crtc_vblank_prepare_and_get(struct drm_crtc *crtc);
 void drm_crtc_vblank_put(struct drm_crtc *crtc);
 int drm_crtc_wait_one_vblank(struct drm_crtc *crtc);
 void drm_crtc_vblank_off(struct drm_crtc *crtc);
-- 
2.52.0

