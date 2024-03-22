Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A9D88736E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 19:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB7C10F2E3;
	Fri, 22 Mar 2024 18:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/1wJ+NR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3240310EC56;
 Fri, 22 Mar 2024 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711133670; x=1742669670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VBTJYN8MtzJMJ3bnrBdHmsy+Q6+FPOGtOtt6rVpJlHA=;
 b=U/1wJ+NRSqrqO+Vu0NmX4EyFDY+ziJnLZEByazRriT+PBkLVOGI0TALl
 CBOvXrf65KMqybvrT5AyVXwmVtOnkiS2Sy7z73cdvmUbzsDKZ5M46U2kn
 UeJz/186fU9oVZvYE6s8CBHTKPxRnnCaKqNNlEiQVEmMKzrFCpFYcdJ0k
 o1oGZzK+qPrGGpAS0PLrDOoVlTV4PNYuan2VcTk7TF0h7nTEVhI7UEaGl
 FXjVHoDzzHMc/5anihrJYGSu/d/pEuqmGT/BfVyUPcp3w8PERevbE321Z
 Dnx3tZ6sZKcmm1kLLhMnjPgWoqd/dfJv3Gtv/PHogT0n1FA/1jZ2dQau+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16925571"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="16925571"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; d="scan'208";a="15036340"
Received: from mknizews-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.7.175])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 11:54:26 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Dale B Stimson <dale.b.stimson@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH] drm/i915/hwmon: Fix potential UAF on driver unbind
Date: Fri, 22 Mar 2024 19:54:03 +0100
Message-ID: <20240322185415.1006700-2-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hwmon is registered as a managed resource of i915.  Its functionality
depends of availability of i915 uncore.

On i915 unbind, we now block i915 access to hwmon, but leave i915 uncore
still available to hwmon.  Since uncore structures may be freed before
hwmon is actually unregistered, that may lead to UAF if someone is still
using hwmon sysfs interface:

<7> [469.045388] i915 0000:03:00.0: [drm] intel_gt_set_wedged called from intel_gt_set_wedged_on_fini+0xd/0x30 [i915]
<7> [469.120600] i915 0000:03:00.0: [drm:drm_client_release] drm_fb_helper
<4> [469.188183] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6dbf: 0000 [#1] PREEMPT SMP NOPTI
<4> [469.198970] CPU: 4 PID: 451 Comm: prometheus-node Tainted: G     U             6.8.0-CI_DRM_14465-g198e9d7559f7+ #1
<4> [469.209321] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.4221.A00.2305271351 05/27/2023
<4> [469.222589] RIP: 0010:hwm_energy+0x2b/0x100 [i915]
<4> [469.227527] Code: 48 89 e5 41 57 41 56 41 55 41 54 53 48 89 fb 48 83 e4 f0 48 83 ec 10 4c 8b 77 08 4c 8b 2f 8b 7f 34 48 89 74 24 08 85 ff 78 2b <45> 8b bd 54 02 00 00 49 8b 7e 18 e8 35 df ea ff 49 89 c4 48 85 c0
<4> [469.246119] RSP: 0018:ffffc90007aa7d00 EFLAGS: 00010202
<4> [469.251314] RAX: 0000000000000000 RBX: ffff88812b4b5828 RCX: 0000000000000000
<4> [469.258396] RDX: 0000000000000001 RSI: ffffc90007aa7da0 RDI: 000000006b6b6b6b
<4> [469.265478] RBP: ffffc90007aa7d40 R08: ffffc90007aa7da0 R09: 0000000000000001
<4> [469.272559] R10: 0000000000000001 R11: ffff88811889d340 R12: ffff88810e088810
<4> [469.279641] R13: 6b6b6b6b6b6b6b6b R14: 6b6b6b6b6b6b6b6b R15: ffff88812b4b5828
<4> [469.286722] FS:  00007f7b9c800700(0000) GS:ffff88888d000000(0000) knlGS:0000000000000000
<4> [469.294749] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [469.300454] CR2: 0000561a5fb45d88 CR3: 0000000111ff0000 CR4: 0000000000f50ef0
<4> [469.307535] PKRU: 55555554
<4> [469.310237] Call Trace:
<4> [469.312678]  <TASK>
<4> [469.335396]  hwm_read+0x9a/0x310 [i915]
<4> [469.339342]  hwmon_attr_show+0x36/0x120
<4> [469.343163]  dev_attr_show+0x15/0x60
<4> [469.346723]  sysfs_kf_seq_show+0xb5/0x100

Reset pointers to uncore in hwmon when unregistering i915, and teach hwmon
sysfs accessors to start with checking validity of those pointers and fail
immediately if no longer valid.

Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Fixes: b3b088e28183 ("drm/i915/hwmon: Add HWMON infrastructure")
Closes: https://gitlab.freedesktop.org/drm/intel/issues/10366
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Dale B Stimson <dale.b.stimson@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: <stable@vger.kernel.org> # v6.2+
---
 drivers/gpu/drm/i915/i915_hwmon.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index b758fd110c204..f5c1d04dae054 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -619,6 +619,9 @@ hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 {
 	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
 
+	if (!ddat->uncore)
+		return 0;
+
 	switch (type) {
 	case hwmon_in:
 		return hwm_in_is_visible(ddat, attr);
@@ -639,6 +642,9 @@ hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
 
+	if (!ddat->uncore)
+		return -ENXIO;
+
 	switch (type) {
 	case hwmon_in:
 		return hwm_in_read(ddat, attr, val);
@@ -659,6 +665,9 @@ hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
 
+	if (!ddat->uncore)
+		return -ENXIO;
+
 	switch (type) {
 	case hwmon_power:
 		return hwm_power_write(ddat, attr, channel, val);
@@ -686,6 +695,9 @@ hwm_gt_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 {
 	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
 
+	if (!ddat->uncore)
+		return 0;
+
 	switch (type) {
 	case hwmon_energy:
 		return hwm_energy_is_visible(ddat, attr);
@@ -700,6 +712,9 @@ hwm_gt_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 {
 	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
 
+	if (!ddat->uncore)
+		return -ENXIO;
+
 	switch (type) {
 	case hwmon_energy:
 		return hwm_energy_read(ddat, attr, val);
@@ -850,5 +865,14 @@ void i915_hwmon_register(struct drm_i915_private *i915)
 
 void i915_hwmon_unregister(struct drm_i915_private *i915)
 {
+	struct i915_hwmon *hwmon = i915->hwmon;
+	struct intel_gt *gt;
+	int i;
+
+	for_each_gt(gt, i915, i)
+		fetch_and_zero(&hwmon->ddat_gt[i].uncore);
+
+	fetch_and_zero(&hwmon->ddat.uncore);
+
 	fetch_and_zero(&i915->hwmon);
 }
-- 
2.43.0

