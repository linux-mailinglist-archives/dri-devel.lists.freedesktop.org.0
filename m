Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3D39F8B4C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 05:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D9610EE66;
	Fri, 20 Dec 2024 04:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Zmugp9Tp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6602710EE63;
 Fri, 20 Dec 2024 04:37:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CR37/22j9f692ngW/wddf2qaXW74V/dMV9rg0GM5rXsUhSMpOiILkpuwB8OPXR0HL1fi9URqAVrqtKFtGmzed9TR7ta6V7vsSM0fyp6659dwzVJji7O3b6IDdH8jQ+nltd1/8mFao0mEGXW6bayLy5abRLG4yr75a2NGR0ZR+JbyGlndUOoxawqa+XEZj1+Qs3iN5d8UdbNwRXj8y+YByfLUiAXtp1Py/HN4v+kgxvn7eqNIGWrx2Up5d43xrf42hNSuhIyR+RmKS1vozkEVVjxU3NMG/4KoesPNwIEwNfJoFfOjDJqqVHt3mLTKvr1OIv1Zx56hRMJAeiGwrECDGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q169wOOmZzAWueGecZIBmRH1/FRK4wbRHF7IkMffhLo=;
 b=FrXIhk3o8ApnLwII8GmWRJ1aU6HdnB2AV6E6TkcuAht/xfrW6k6TeDERwTJJUWsI4+W6T0QcZWzu/+BOcg67POgqXNffYlwqlJG6dH5u0cffdmyPgqcpce39ozXhAAglcCYIHZSDFiaRoWaf57cqH2H2GimblHulcB9JckYGSF/Izvmo2G440IYIFLI9Rx1FjeQbb1TR4RB573LdcyVNVyzd5Gg4x84ROJtCjQ8wGN51CUzdhc0b7XzQwwzSBPip6kMoKTWBv4TAbIsqpaGp5yMJGStPe+rYpnWpFx7jHq/7gUvj2YQK63w0oqh0c80Vs4oATm9jwX11+Vc2I8QHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q169wOOmZzAWueGecZIBmRH1/FRK4wbRHF7IkMffhLo=;
 b=Zmugp9Tp4dXjaVbct3rAqv5lyeu6b4jA8akJHq3IrCJVMQHPhhEGxDe5I0SLuvzKduJmnJVSKP5gEc578xmkYPy3vZog8vFxekQyx+zAR6MRyOup/8ZZwgKJ9lKJRFk/Abwz6tSElbFOJYDvIW6l7TkVG27+Ud+MfmdcLZVNyxg=
Received: from SA9PR03CA0022.namprd03.prod.outlook.com (2603:10b6:806:20::27)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 04:37:00 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:806:20:cafe::c0) by SA9PR03CA0022.outlook.office365.com
 (2603:10b6:806:20::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Fri,
 20 Dec 2024 04:37:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Fri, 20 Dec 2024 04:37:00 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 22:36:59 -0600
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <wayland-devel@lists.freedesktop.org>, <harry.wentland@amd.com>,
 <alex.hung@amd.com>
Subject: [V7 05/45] drm/colorop: Introduce new drm_colorop mode object
Date: Thu, 19 Dec 2024 21:33:11 -0700
Message-ID: <20241220043410.416867-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241220043410.416867-1-alex.hung@amd.com>
References: <20241220043410.416867-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f88e124-eba8-4a3a-301e-08dd20aff1f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZwWp6DLepgHpQ6hJ5clfP29zc5SopBx4n+GptzuYC6UCBHBKOD8zmraNvcBD?=
 =?us-ascii?Q?PALZEAV2FuTvhAJKGvpHEMTxnlLEzwVtg6it1ufyIXpl9y8i4RxycJ5dlQ7M?=
 =?us-ascii?Q?qvG8UhGN0uB43v5KWMf5Dtv8eUXwv2+I1w/Xpy490X3XN4+Gy5+NfRHTvWdG?=
 =?us-ascii?Q?kJyzAHULhAXR4fKR0naJWqRvg1q6GGP+CUAoU/p0sNM/HhIEsxinCHFYhWQ0?=
 =?us-ascii?Q?HZ0ks11cMwxx/dkSCSFGTb0ghd7uH/bAjKAYjTVUhHxXxQCdBvCB97secH3/?=
 =?us-ascii?Q?Sh9DJxFLFoku4sg6cM+tOOgpmDnIN+t5AHaqoN6DoMKwoq2UaU3ak7nfVQHQ?=
 =?us-ascii?Q?pBsT8YJDuhgES/c/CSSLq6hJG4KMZZyD7FlPGiXVFtIzB65h7hG7dqB5KkCh?=
 =?us-ascii?Q?i0XyARKu96+mX5lRaDxlg04IdRV9zU/89f4pCBjL1gCPwWLMWoAFtVt6h69g?=
 =?us-ascii?Q?rBtgc0ZHWZ+PYeiAdPJd3ckQVqrnhsX1aYgxqr5DZ8W9NeiS1zwXpibkjfHL?=
 =?us-ascii?Q?0l7DfFk76JvLCoJBz2K912X17HgzSAqtqgBy2m/bCqsp5Fp9VlbWTJnifxWU?=
 =?us-ascii?Q?pte/F1RqA4WQUd4e6cyBGSDBf9wzs2dPeeddNJunIh7ecaDdaGCvodTzGskq?=
 =?us-ascii?Q?59P4UnMX37vp9EzDUV1hvhLecqjBWD3f5lIvfnFtdNEPcse/V3UmaUGhBOdu?=
 =?us-ascii?Q?t+O3ItVBR5Q6UgBaqnTlU9d46M2LfXAFRyLabC1DmnXd7rnHeCnTnGjqli8z?=
 =?us-ascii?Q?QraNapcIcmURyruZWKhuLQwchYDNLONSs6PLQ9+WI/izE663CC8YO6YVHkh9?=
 =?us-ascii?Q?kfeSJ/aqrFz79ahSPDfqKREHvn9Mpui8vyEey4cuFvBcCuzo2f5iUo9RAdRn?=
 =?us-ascii?Q?AcTj7shHgA9j6lEZV2kUMnSzywJzgWqvERrZDuv4M56bfwNnTsxL997fEFU9?=
 =?us-ascii?Q?6qWn+AaAjD/H9au2JnkDZ++Gdl5IbsPu6orZ/VbQAoMCbFbrkM631R0w16YK?=
 =?us-ascii?Q?ieGvSP48lA023hoqSfYLaAYEqXB8ivFm4Tj2e1xoQ5lRU9lXUdwhxbfyy+u0?=
 =?us-ascii?Q?+B07ZUTjlVHccFYx3JbBTSaLTip+12piZTZPKg0TwPX0VhZidrVVaOLdbsjy?=
 =?us-ascii?Q?zwH2Su4eCp+kNC2hdDAMoV91PmgQlRKTfrMoZyE/PWArxcp7zDK5/mzEGeFE?=
 =?us-ascii?Q?VFkdJy63LRAIvbrmXHyJMytedrBYd6hqsapqaBfPz4a8bIHHZ8cEOKHAplH2?=
 =?us-ascii?Q?KnzihNGpMGss87pMOBuK/eWu44LlMLW9YeHw9Ks49W9C4KgC0HXeWGGT5AZq?=
 =?us-ascii?Q?zKaLqfl3r/U5aKPchkG+qvB6y4b5rN4+JwARXnSx4yuB5CiSEAGqO4Iq5zP5?=
 =?us-ascii?Q?bC/KFMwJ4JrPltReHqj7qFMFrNvTi8lI1H99+fFG5PnrLM7Rse15Hgmwnj6l?=
 =?us-ascii?Q?1+THSgt90CcFkCJy7kMoimRy2CJ66hOHggcnczixNv4/45e4Oxe6Ptqq/qfo?=
 =?us-ascii?Q?W5leMROa2rVSaYA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 04:37:00.6349 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f88e124-eba8-4a3a-301e-08dd20aff1f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
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

From: Harry Wentland <harry.wentland@amd.com>

This patches introduces a new drm_colorop mode object. This
object represents color transformations and can be used to
define color pipelines.

We also introduce the drm_colorop_state here, as well as
various helpers and state tracking bits.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
v7:
 - Fix checkpatch warnings and errors
  - Add a tab to for_each_oldnew_colorop_in_state definition
  - Change unsigned index to unsigned int index
  - Fix a checkpatch warning - a new line after variable declaration

v6:
 - Comment that properties validity depends on type (Louis Chauvet)

v5:
 - Add comment to drm_atomic_state.colorops
 - Replace a misplaced 'plane' with 'colorop' in comment
 - Fix colorop_list kernel doc
 - Add kernel doc for color_pipeline
 - drop unused drm_colorop_destroy_state
 - drop drm_colorop_init, to be introduced in later patch
   when used
 - Add kernel docs
 - Drop TODOs

v4:
 - Drop IOCTL definitions (Pekka)
 - add missing declaration (Chaitanya Kumar Borah)

v3:
 - Drop TODO for lock (it's handled in drm_modeset_drop_locks)
   (Melissa)
 - Don't get plane state when getting colorop state
 - Make some functions static (kernel test robot)

 drivers/gpu/drm/Makefile            |   1 +
 drivers/gpu/drm/drm_atomic.c        |  70 ++++++++++++
 drivers/gpu/drm/drm_atomic_helper.c |  12 ++
 drivers/gpu/drm/drm_atomic_uapi.c   |  48 ++++++++
 drivers/gpu/drm/drm_colorop.c       | 104 +++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c   |   7 ++
 include/drm/drm_atomic.h            |  89 +++++++++++++++
 include/drm/drm_atomic_uapi.h       |   1 +
 include/drm/drm_colorop.h           | 166 ++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h       |  18 +++
 include/drm/drm_plane.h             |   8 ++
 include/uapi/drm/drm_mode.h         |   1 +
 12 files changed, 525 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_colorop.c
 create mode 100644 include/drm/drm_colorop.h

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 784229d4504d..055f3e535d15 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -44,6 +44,7 @@ drm-y := \
 	drm_client.o \
 	drm_client_modeset.o \
 	drm_color_mgmt.o \
+	drm_colorop.o \
 	drm_connector.o \
 	drm_crtc.o \
 	drm_displayid.o \
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 0fc99da93afe..327d906c48c5 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -42,6 +42,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_writeback.h>
+#include <drm/drm_colorop.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
@@ -107,6 +108,7 @@ void drm_atomic_state_default_release(struct drm_atomic_state *state)
 	kfree(state->connectors);
 	kfree(state->crtcs);
 	kfree(state->planes);
+	kfree(state->colorops);
 	kfree(state->private_objs);
 }
 EXPORT_SYMBOL(drm_atomic_state_default_release);
@@ -138,6 +140,10 @@ drm_atomic_state_init(struct drm_device *dev, struct drm_atomic_state *state)
 				sizeof(*state->planes), GFP_KERNEL);
 	if (!state->planes)
 		goto fail;
+	state->colorops = kcalloc(dev->mode_config.num_colorop,
+				  sizeof(*state->colorops), GFP_KERNEL);
+	if (!state->colorops)
+		goto fail;
 
 	/*
 	 * Because drm_atomic_state can be committed asynchronously we need our
@@ -249,6 +255,20 @@ void drm_atomic_state_default_clear(struct drm_atomic_state *state)
 		state->planes[i].new_state = NULL;
 	}
 
+	for (i = 0; i < config->num_colorop; i++) {
+		struct drm_colorop *colorop = state->colorops[i].ptr;
+
+		if (!colorop)
+			continue;
+
+		drm_colorop_atomic_destroy_state(colorop,
+						 state->colorops[i].state);
+		state->colorops[i].ptr = NULL;
+		state->colorops[i].state = NULL;
+		state->colorops[i].old_state = NULL;
+		state->colorops[i].new_state = NULL;
+	}
+
 	for (i = 0; i < state->num_private_objs; i++) {
 		struct drm_private_obj *obj = state->private_objs[i].ptr;
 
@@ -568,6 +588,56 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_atomic_get_plane_state);
 
+
+/**
+ * drm_atomic_get_colorop_state - get colorop state
+ * @state: global atomic state object
+ * @colorop: colorop to get state object for
+ *
+ * This function returns the colorop state for the given colorop, allocating it
+ * if needed. It will also grab the relevant plane lock to make sure that the
+ * state is consistent.
+ *
+ * Returns:
+ *
+ * Either the allocated state or the error code encoded into the pointer. When
+ * the error is EDEADLK then the w/w mutex code has detected a deadlock and the
+ * entire atomic sequence must be restarted. All other errors are fatal.
+ */
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop)
+{
+	int ret, index = drm_colorop_index(colorop);
+	struct drm_colorop_state *colorop_state;
+
+	WARN_ON(!state->acquire_ctx);
+
+	colorop_state = drm_atomic_get_existing_colorop_state(state, colorop);
+	if (colorop_state)
+		return colorop_state;
+
+	ret = drm_modeset_lock(&colorop->plane->mutex, state->acquire_ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	colorop_state = drm_atomic_helper_colorop_duplicate_state(colorop);
+	if (!colorop_state)
+		return ERR_PTR(-ENOMEM);
+
+	state->colorops[index].state = colorop_state;
+	state->colorops[index].ptr = colorop;
+	state->colorops[index].old_state = colorop->state;
+	state->colorops[index].new_state = colorop_state;
+	colorop_state->state = state;
+
+	drm_dbg_atomic(colorop->dev, "Added [COLOROP:%d] %p state to %p\n",
+		       colorop->base.id, colorop_state, state);
+
+	return colorop_state;
+}
+EXPORT_SYMBOL(drm_atomic_get_colorop_state);
+
 static bool
 plane_switching_crtc(const struct drm_plane_state *old_plane_state,
 		     const struct drm_plane_state *new_plane_state)
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 43cdf39019a4..70ed524bb3c1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3022,6 +3022,8 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_plane *plane;
 	struct drm_plane_state *old_plane_state, *new_plane_state;
+	struct drm_colorop *colorop;
+	struct drm_colorop_state *old_colorop_state, *new_colorop_state;
 	struct drm_crtc_commit *commit;
 	struct drm_private_obj *obj;
 	struct drm_private_state *old_obj_state, *new_obj_state;
@@ -3099,6 +3101,16 @@ int drm_atomic_helper_swap_state(struct drm_atomic_state *state,
 		}
 	}
 
+	for_each_oldnew_colorop_in_state(state, colorop, old_colorop_state, new_colorop_state, i) {
+		WARN_ON(colorop->state != old_colorop_state);
+
+		old_colorop_state->state = state;
+		new_colorop_state->state = NULL;
+
+		state->colorops[i].state = old_colorop_state;
+		colorop->state = new_colorop_state;
+	}
+
 	drm_panic_lock(state->dev, flags);
 	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
 		WARN_ON(plane->state != old_plane_state);
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 7936c2023955..cfc1485b592e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -34,6 +34,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_writeback.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_colorop.h>
 
 #include <linux/dma-fence.h>
 #include <linux/uaccess.h>
@@ -642,6 +643,26 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	return 0;
 }
 
+
+static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
+		struct drm_colorop_state *state, struct drm_file *file_priv,
+		struct drm_property *property, uint64_t val)
+{
+	drm_dbg_atomic(colorop->dev,
+			"[COLOROP:%d] unknown property [PROP:%d:%s]]\n",
+			colorop->base.id,
+			property->base.id, property->name);
+	return -EINVAL;
+}
+
+static int
+drm_atomic_colorop_get_property(struct drm_colorop *colorop,
+		const struct drm_colorop_state *state,
+		struct drm_property *property, uint64_t *val)
+{
+	return -EINVAL;
+}
+
 static int drm_atomic_set_writeback_fb_for_connector(
 		struct drm_connector_state *conn_state,
 		struct drm_framebuffer *fb)
@@ -908,6 +929,16 @@ int drm_atomic_get_property(struct drm_mode_object *obj,
 				plane->state, property, val);
 		break;
 	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+
+		if (colorop->plane)
+			WARN_ON(!drm_modeset_is_locked(&colorop->plane->mutex));
+
+		ret = drm_atomic_colorop_get_property(colorop,
+				colorop->state, property, val);
+		break;
+	}
 	default:
 		drm_dbg_atomic(dev, "[OBJECT:%d] has no properties\n", obj->id);
 		ret = -EINVAL;
@@ -1084,6 +1115,23 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		ret = drm_atomic_plane_set_property(plane,
 				plane_state, file_priv,
 				prop, prop_value);
+
+		break;
+	}
+	case DRM_MODE_OBJECT_COLOROP: {
+		struct drm_colorop *colorop = obj_to_colorop(obj);
+		struct drm_colorop_state *colorop_state;
+
+		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+		if (IS_ERR(colorop_state)) {
+			ret = PTR_ERR(colorop_state);
+			break;
+		}
+
+		ret = drm_atomic_colorop_set_property(colorop,
+				colorop_state, file_priv,
+				prop, prop_value);
+
 		break;
 	}
 	default:
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
new file mode 100644
index 000000000000..d215e22c9d20
--- /dev/null
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#include <drm/drm_colorop.h>
+#include <drm/drm_print.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_plane.h>
+
+#include "drm_crtc_internal.h"
+
+static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
+							struct drm_colorop_state *state)
+{
+	memcpy(state, colorop->state, sizeof(*state));
+}
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop)
+{
+	struct drm_colorop_state *state;
+
+	if (WARN_ON(!colorop->state))
+		return NULL;
+
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_colorop_duplicate_state(colorop, state);
+
+	return state;
+}
+
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state)
+{
+	kfree(state);
+}
+
+/**
+ * __drm_colorop_state_reset - resets colorop state to default values
+ * @colorop_state: atomic colorop state, must not be NULL
+ * @colorop: colorop object, must not be NULL
+ *
+ * Initializes the newly allocated @colorop_state with default
+ * values. This is useful for drivers that subclass the CRTC state.
+ */
+static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
+				      struct drm_colorop *colorop)
+{
+	colorop_state->colorop = colorop;
+}
+
+/**
+ * __drm_colorop_reset - reset state on colorop
+ * @colorop: drm colorop
+ * @colorop_state: colorop state to assign
+ *
+ * Initializes the newly allocated @colorop_state and assigns it to
+ * the &drm_crtc->state pointer of @colorop, usually required when
+ * initializing the drivers or when called from the &drm_colorop_funcs.reset
+ * hook.
+ *
+ * This is useful for drivers that subclass the colorop state.
+ */
+static void __drm_colorop_reset(struct drm_colorop *colorop,
+				struct drm_colorop_state *colorop_state)
+{
+	if (colorop_state)
+		__drm_colorop_state_reset(colorop_state, colorop);
+
+	colorop->state = colorop_state;
+}
+
+void drm_colorop_reset(struct drm_colorop *colorop)
+{
+	kfree(colorop->state);
+	colorop->state = kzalloc(sizeof(*colorop->state), GFP_KERNEL);
+
+	if (colorop->state)
+		__drm_colorop_reset(colorop, colorop->state);
+}
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 37d2e0a4ef4b..f238a2f049b0 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -29,6 +29,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_mode_config.h>
 #include <drm/drm_print.h>
+#include <drm/drm_colorop.h>
 #include <linux/dma-resv.h>
 
 #include "drm_crtc_internal.h"
@@ -182,11 +183,15 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 void drm_mode_config_reset(struct drm_device *dev)
 {
 	struct drm_crtc *crtc;
+	struct drm_colorop *colorop;
 	struct drm_plane *plane;
 	struct drm_encoder *encoder;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 
+	drm_for_each_colorop(colorop, dev)
+		drm_colorop_reset(colorop);
+
 	drm_for_each_plane(plane, dev)
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
@@ -420,6 +425,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_list);
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
+	INIT_LIST_HEAD(&dev->mode_config.colorop_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
 	idr_init_base(&dev->mode_config.object_idr, 1);
 	idr_init_base(&dev->mode_config.tile_idr, 1);
@@ -441,6 +447,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	dev->mode_config.num_crtc = 0;
 	dev->mode_config.num_encoder = 0;
 	dev->mode_config.num_total_plane = 0;
+	dev->mode_config.num_colorop = 0;
 
 	if (IS_ENABLED(CONFIG_LOCKDEP)) {
 		struct drm_modeset_acquire_ctx modeset_ctx;
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 31ca88deb10d..effd9302c979 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -30,6 +30,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_util.h>
+#include <drm/drm_colorop.h>
 
 /**
  * struct drm_crtc_commit - track modeset commits on a CRTC
@@ -157,6 +158,11 @@ struct drm_crtc_commit {
 	bool abort_completion;
 };
 
+struct __drm_colorops_state {
+	struct drm_colorop *ptr;
+	struct drm_colorop_state *state, *old_state, *new_state;
+};
+
 struct __drm_planes_state {
 	struct drm_plane *ptr;
 	struct drm_plane_state *state, *old_state, *new_state;
@@ -408,6 +414,14 @@ struct drm_atomic_state {
 	 */
 	bool duplicated : 1;
 
+	/**
+	 * @colorops:
+	 *
+	 * Pointer to array of @drm_colorop and @drm_colorop_state part of this
+	 * update.
+	 */
+	struct __drm_colorops_state *colorops;
+
 	/**
 	 * @planes:
 	 *
@@ -549,6 +563,9 @@ drm_atomic_get_crtc_state(struct drm_atomic_state *state,
 struct drm_plane_state * __must_check
 drm_atomic_get_plane_state(struct drm_atomic_state *state,
 			   struct drm_plane *plane);
+struct drm_colorop_state *
+drm_atomic_get_colorop_state(struct drm_atomic_state *state,
+			     struct drm_colorop *colorop);
 struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
@@ -678,6 +695,55 @@ drm_atomic_get_new_plane_state(const struct drm_atomic_state *state,
 	return state->planes[drm_plane_index(plane)].new_state;
 }
 
+
+/**
+ * drm_atomic_get_existing_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the colorop state for the given colorop, or NULL
+ * if the colorop is not part of the global atomic state.
+ *
+ * This function is deprecated, @drm_atomic_get_old_colorop_state or
+ * @drm_atomic_get_new_colorop_state should be used instead.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_existing_colorop_state(struct drm_atomic_state *state,
+				    struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].state;
+}
+
+/**
+ * drm_atomic_get_old_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the old colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_old_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].old_state;
+}
+
+/**
+ * drm_atomic_get_new_colorop_state - get colorop state, if it exists
+ * @state: global atomic state object
+ * @colorop: colorop to grab
+ *
+ * This function returns the new colorop state for the given colorop, or
+ * NULL if the colorop is not part of the global atomic state.
+ */
+static inline struct drm_colorop_state *
+drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
+			       struct drm_colorop *colorop)
+{
+	return state->colorops[drm_colorop_index(colorop)].new_state;
+}
+
 /**
  * drm_atomic_get_existing_connector_state - get connector state, if it exists
  * @state: global atomic state object
@@ -925,6 +991,29 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 			     (new_crtc_state) = (__state)->crtcs[__i].new_state, \
 			     (void)(new_crtc_state) /* Only to avoid unused-but-set-variable warning */, 1))
 
+/**
+ * for_each_oldnew_colorop_in_state - iterate over all colorops in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @colorop: &struct drm_colorop iteration cursor
+ * @old_colorop_state: &struct drm_colorop_state iteration cursor for the old state
+ * @new_colorop_state: &struct drm_colorop_state iteration cursor for the new state
+ * @__i: int iteration cursor, for macro-internal use
+ *
+ * This iterates over all colorops in an atomic update, tracking both old and
+ * new state. This is useful in places where the state delta needs to be
+ * considered, for example in atomic check functions.
+ */
+#define for_each_oldnew_colorop_in_state(__state, colorop, old_colorop_state, new_colorop_state, __i) \
+	for ((__i) = 0;							\
+	     (__i) < (__state)->dev->mode_config.num_colorop;		\
+	     (__i)++)							\
+		for_each_if ((__state)->colorops[__i].ptr &&		\
+			     ((colorop) = (__state)->colorops[__i].ptr,	\
+			      (void)(colorop) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_colorop_state) = (__state)->colorops[__i].old_state,\
+			      (new_colorop_state) = (__state)->colorops[__i].new_state, 1))
+
+
 /**
  * for_each_oldnew_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
diff --git a/include/drm/drm_atomic_uapi.h b/include/drm/drm_atomic_uapi.h
index 4c6d39d7bdb2..70a115d523cd 100644
--- a/include/drm/drm_atomic_uapi.h
+++ b/include/drm/drm_atomic_uapi.h
@@ -37,6 +37,7 @@ struct drm_crtc;
 struct drm_connector_state;
 struct dma_fence;
 struct drm_framebuffer;
+struct drm_colorop;
 
 int __must_check
 drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
new file mode 100644
index 000000000000..cc3e94dcf085
--- /dev/null
+++ b/include/drm/drm_colorop.h
@@ -0,0 +1,166 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2023 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Authors: AMD
+ *
+ */
+
+#ifndef __DRM_COLOROP_H__
+#define __DRM_COLOROP_H__
+
+#include <drm/drm_mode_object.h>
+#include <drm/drm_mode.h>
+#include <drm/drm_property.h>
+
+/**
+ * struct drm_colorop_state - mutable colorop state
+ */
+struct drm_colorop_state {
+	/** @colorop: backpointer to the colorop */
+	struct drm_colorop *colorop;
+
+	/*
+	 * Color properties
+	 *
+	 * The following fields are not always valid, their usage depends
+	 * on the colorop type. See their associated comment for more
+	 * information.
+	 */
+
+	/** @state: backpointer to global drm_atomic_state */
+	struct drm_atomic_state *state;
+};
+
+/**
+ * struct drm_colorop - DRM color operation control structure
+ *
+ * A colorop represents one color operation. They can be chained via
+ * the 'next' pointer to build a color pipeline.
+ */
+struct drm_colorop {
+	/** @dev: parent DRM device */
+	struct drm_device *dev;
+
+	/**
+	 * @head:
+	 *
+	 * List of all colorops on @dev, linked from &drm_mode_config.colorop_list.
+	 * Invariant over the lifetime of @dev and therefore does not need
+	 * locking.
+	 */
+	struct list_head head;
+
+	/**
+	 * @index: Position inside the mode_config.list, can be used as an array
+	 * index. It is invariant over the lifetime of the colorop.
+	 */
+	unsigned int index;
+
+	/** @base: base mode object */
+	struct drm_mode_object base;
+
+	/**
+	 * @plane:
+	 *
+	 * The plane on which the colorop sits. A drm_colorop is always unique
+	 * to a plane.
+	 */
+	struct drm_plane *plane;
+
+	/**
+	 * @state:
+	 *
+	 * Current atomic state for this colorop.
+	 *
+	 * This is protected by @mutex. Note that nonblocking atomic commits
+	 * access the current colorop state without taking locks.
+	 */
+	struct drm_colorop_state *state;
+
+	/*
+	 * Color properties
+	 *
+	 * The following fields are not always valid, their usage depends
+	 * on the colorop type. See their associated comment for more
+	 * information.
+	 */
+
+	/** @properties: property tracking for this colorop */
+	struct drm_object_properties properties;
+
+};
+
+#define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
+
+/**
+ * drm_colorop_find - look up a Colorop object from its ID
+ * @dev: DRM device
+ * @file_priv: drm file to check for lease against.
+ * @id: &drm_mode_object ID
+ *
+ * This can be used to look up a Colorop from its userspace ID. Only used by
+ * drivers for legacy IOCTLs and interface, nowadays extensions to the KMS
+ * userspace interface should be done using &drm_property.
+ */
+static inline struct drm_colorop *drm_colorop_find(struct drm_device *dev,
+		struct drm_file *file_priv,
+		uint32_t id)
+{
+	struct drm_mode_object *mo;
+
+	mo = drm_mode_object_find(dev, file_priv, id, DRM_MODE_OBJECT_COLOROP);
+	return mo ? obj_to_colorop(mo) : NULL;
+}
+
+struct drm_colorop_state *
+drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
+
+void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
+				      struct drm_colorop_state *state);
+
+/**
+ * drm_colorop_reset - reset colorop atomic state
+ * @colorop: drm colorop
+ *
+ * Resets the atomic state for @colorop by freeing the state pointer (which might
+ * be NULL, e.g. at driver load time) and allocating a new empty state object.
+ */
+void drm_colorop_reset(struct drm_colorop *colorop);
+
+/**
+ * drm_colorop_index - find the index of a registered colorop
+ * @colorop: colorop to find index for
+ *
+ * Given a registered colorop, return the index of that colorop within a DRM
+ * device's list of colorops.
+ */
+static inline unsigned int drm_colorop_index(const struct drm_colorop *colorop)
+{
+	return colorop->index;
+}
+
+
+#define drm_for_each_colorop(colorop, dev) \
+	list_for_each_entry(colorop, &(dev)->mode_config.colorop_list, head)
+
+
+#endif /* __DRM_COLOROP_H__ */
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 271765e2e9f2..d4661d4431dc 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -499,6 +499,24 @@ struct drm_mode_config {
 	 */
 	struct raw_spinlock panic_lock;
 
+	/**
+	 * @num_colorop:
+	 *
+	 * Number of colorop objects on this device.
+	 * This is invariant over the lifetime of a device and hence doesn't
+	 * need any locks.
+	 */
+	int num_colorop;
+
+	/**
+	 * @colorop_list:
+	 *
+	 * List of colorop objects linked with &drm_colorop.head. This is
+	 * invariant over the lifetime of a device and hence doesn't need any
+	 * locks.
+	 */
+	struct list_head colorop_list;
+
 	/**
 	 * @num_crtc:
 	 *
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index dd718c62ac31..2a9b902623c0 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -243,6 +243,14 @@ struct drm_plane_state {
 	 */
 	enum drm_scaling_filter scaling_filter;
 
+	/**
+	 * @color_pipeline:
+	 *
+	 * The first colorop of the active color pipeline, or NULL, if no
+	 * color pipeline is active.
+	 */
+	struct drm_colorop *color_pipeline;
+
 	/**
 	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
 	 * and for async plane updates.
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..d49cded6c568 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
-- 
2.43.0

