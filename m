Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KdQLwd1emmr6wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:43:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28731A8C14
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 21:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C60810E766;
	Wed, 28 Jan 2026 20:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VDBBleUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072B610E766
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769633027; x=1801169027;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=0HFSJLD3DmydJ6eojx9Gl+2ZASNcQ0OUSNmFOnheJcs=;
 b=VDBBleUPOz7F+aDKbCeKPDTNBoONienYDfavM7GgwQRN9tYk0Zcd6KxH
 iInKi7mMSnlk6erMcDqqKq+Xbmz9MaeMvk2ByuQa4N7ac9JHMrUAMN5+K
 6IHv4nH1z/Vy1h3OwSTYEXFRalcffiexguNRO23jaM4BHSZqzxldDyRLg
 qfrd2PYlKBzwMpf7tk3ga6uoJsT0rxKQ0mPibQmHcuEjfdub3xNADz+P2
 tAyD3ruR2/xUNR40KIwCgNBKkVwNemjv3G5qwL+gIsiGXUO987RSXeoZR
 u63W+Cyli6eTpJkusToeW7AfVtp5urYM72jk6XFCUlmYNWP/IfNrEmxjj A==;
X-CSE-ConnectionGUID: I2my9E9XQfmSvAEzoRtgxA==
X-CSE-MsgGUID: 1+6daL+pS6a0zSHIh5LlxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="81972474"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81972474"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:43:43 -0800
X-CSE-ConnectionGUID: 9AtC1YS7QSmCD9OhJ6eVMw==
X-CSE-MsgGUID: frHkT0xGRJuqlmSv1fIECg==
X-ExtLoop1: 1
Received: from orcnseosdtjek.jf.intel.com (HELO [10.166.28.109])
 ([10.166.28.109])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 12:43:41 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 28 Jan 2026 12:41:35 -0800
Subject: [PATCH] drm/mgag200: sleep instead of busy wait for BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQrCMBAAv1L27MImkQb9inhYzZpu1bQkWCohf
 zd4HJiZCkWySoHzUCHLpkWX1MEcBrhPnKKghs5gyY5krMf5ie/I0RLhQ3e8ccBPkBd/8Ugn45z
 3XhxD79cs3fi/L9fWfhLf/tNrAAAA
X-Change-ID: 20260127-jk-mgag200-fix-bad-udelay-409133777e3a
To: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-f4b34
X-Developer-Signature: v=1; a=openpgp-sha256; l=7622;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=0HFSJLD3DmydJ6eojx9Gl+2ZASNcQ0OUSNmFOnheJcs=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhsyqkr8aZq1l6dkqWo+1c1jfmM55Oafk7gH5ezO/XeSPf
 MC5f8OsjlIWBjEuBlkxRRYFh5CV140nhGm9cZaDmcPKBDKEgYtTACaicYXhn33dtR+PN07iLHRS
 4ElQaJ2VYMrsvUDv+j2Ppdo9S9WS7jD8U/SYoN/3r5X7ddXTKUnfPfxnMufe/8hz4vG3APtoZ6k
 //AA=
X-Developer-Key: i=jacob.e.keller@intel.com; a=openpgp;
 fpr=204054A9D73390562AEC431E6A965D3E6F0F28E8
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:airlied@redhat.com,m:jfalempe@redhat.com,m:tzimmermann@suse.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:simona@ffwll.ch,m:pvaanane@redhat.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:jacob.e.keller@intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacob.e.keller@intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 28731A8C14
X-Rspamd-Action: no action

The mgag200_bmc_stop_scanout() function is called by the .atomic_disable()
handler for the MGA G200 VGA BMC encoder. This function performs a few
register writes to inform the BMC of an upcoming mode change, and then
polls to wait until the BMC actually stops.

The polling is implemented using a busy loop with udelay() and an iteration
timeout of 300, resulting in the function blocking for 300 milliseconds.

The function gets called ultimately by the output_poll_execute work thread
for the DRM output change polling thread of the mgag200 driver:

kworker/0:0-mm_    3528 [000]  4555.315364:
        ffffffffaa0e25b3 delay_halt.part.0+0x33
        ffffffffc03f6188 mgag200_bmc_stop_scanout+0x178
        ffffffffc087ae7a disable_outputs+0x12a
        ffffffffc087c12a drm_atomic_helper_commit_tail+0x1a
        ffffffffc03fa7b6 mgag200_mode_config_helper_atomic_commit_tail+0x26
        ffffffffc087c9c1 commit_tail+0x91
        ffffffffc087d51b drm_atomic_helper_commit+0x11b
        ffffffffc0509694 drm_atomic_commit+0xa4
        ffffffffc05105e8 drm_client_modeset_commit_atomic+0x1e8
        ffffffffc0510ce6 drm_client_modeset_commit_locked+0x56
        ffffffffc0510e24 drm_client_modeset_commit+0x24
        ffffffffc088a743 __drm_fb_helper_restore_fbdev_mode_unlocked+0x93
        ffffffffc088a683 drm_fb_helper_hotplug_event+0xe3
        ffffffffc050f8aa drm_client_dev_hotplug+0x9a
        ffffffffc088555a output_poll_execute+0x29a
        ffffffffa9b35924 process_one_work+0x194
        ffffffffa9b364ee worker_thread+0x2fe
        ffffffffa9b3ecad kthread+0xdd
        ffffffffa9a08549 ret_from_fork+0x29

On a server running ptp4l with the mgag200 driver loaded, we found that
ptp4l would sometimes get blocked from execution because of this busy
waiting loop.

Every so often, approximately once every 20 minutes though with large
variance, the output_poll_execute() thread would detect some sort of change
that required performing a hotplug event which results in attempting to
stop the BMC scanout, resulting in a 300msec delay on one CPU.

On this system, ptp4l was pinned to a single CPU. When the
output_poll_execute() thread ran on that CPU, it blocked ptp4l from
executing for its 300millisecond duration.

This resulted in PTP service disruptions such as failure to send a SYNC
message on time, failure to handle ANNOUNCE messages on time, and clock
check warnings from the application. All of this despite the application
being configured with FIFO_RT and a higher priority than the background
workqueue tasks. (However, note that the kernel did not use
CONFIG_PREEMPT...)

It is unclear if the event is due to a faulty VGA connection, another bug,
or actual events causing a change in the connection. At least on the system
under test it is not a one-time event and consistently causes disruption to
the time sensitive applications.

Reading through other DRM driver implementations, it does not appear that
the .atomic_enable or .atomic_disable handlers need to delay instead of
sleep. For example, the ast_astdp_encoder_helper_atomic_disable() function
calls ast_dp_set_phy_sleep() which uses msleep(). The "atomic" in the name
is referring to the atomic modesetting support, which is the support to
enable atomic configuration from userspace, and not to the "atomic context"
of the kernel.

Replace the busy wait with a sleeping loop based on read_poll_timeout().
This ensures that other time sensitive operations are not blocked from
executing while the work thread is waiting for the BMC hardware.

Note the RREG_DAC is implemented using a statement expression to allow
working properly with the read_poll_timeout family of functions. The other
RREG_<TYPE> macros ought to be cleaned up to have better semantics, and
several places in the mgag200 driver could make use of RREG_DAC or similar
RREG_* macros should likely be cleaned up for better semantics as well, but
that task has been left as a future cleanup for a non-bugfix.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
We still do not know if the reconfiguration is caused by a different
bug or by a faulty VGA connector or something else. However, there is no
reason that this function should be spinning instead of sleeping while
waiting for the BMC scan to stop.

It is known that removing the mgag200 module avoids the issue. It is also
likely that use of CONFIG_PREEMPT (or CONFIG_PREEMPT_RT) could allow the
high priority process to preempt the kernel thread even while it is
delaying. However, it is better to let the process sleep() so that other
tasks can execute even if these steps are not taken.

There are multiple other udelay() which likely could safely be converted to
usleep_range(). However they are all short, and I felt that the smallest
targeted fix made the most sense. They could perhaps be cleaned up in a
non-fix commit or series along with other improvements like fixing the
other RREG_* macros.
---
 drivers/gpu/drm/mgag200/mgag200_drv.h |  6 ++++++
 drivers/gpu/drm/mgag200/mgag200_bmc.c | 27 ++++++++++-----------------
 2 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index f4bf40cd7c88..a875c4bf8cbe 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -111,6 +111,12 @@
 #define DAC_INDEX 0x3c00
 #define DAC_DATA 0x3c0a
 
+#define RREG_DAC(reg)						\
+	({							\
+		WREG8(DAC_INDEX, reg);				\
+		RREG8(DAC_DATA);				\
+	})							\
+
 #define WREG_DAC(reg, v)					\
 	do {							\
 		WREG8(DAC_INDEX, reg);				\
diff --git a/drivers/gpu/drm/mgag200/mgag200_bmc.c b/drivers/gpu/drm/mgag200/mgag200_bmc.c
index a689c71ff165..599b710bab9b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_bmc.c
+++ b/drivers/gpu/drm/mgag200/mgag200_bmc.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
@@ -12,7 +13,7 @@
 void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 {
 	u8 tmp;
-	int iter_max;
+	int ret;
 
 	/*
 	 * 1 - The first step is to inform the BMC of an upcoming mode
@@ -44,28 +45,20 @@ void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 	 * 3a- The third step is to verify if there is an active scan.
 	 * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
 	 */
-	iter_max = 300;
-	while (!(tmp & 0x1) && iter_max) {
-		WREG8(DAC_INDEX, MGA1064_SPAREREG);
-		tmp = RREG8(DAC_DATA);
-		udelay(1000);
-		iter_max--;
-	}
+	ret = read_poll_timeout(RREG_DAC, tmp, !(tmp & 0x1),
+				1000, 300000, false,
+				MGA1064_SPAREREG);
+	if (ret == -ETIMEDOUT)
+		return;
 
 	/*
 	 * 3b- This step occurs only if the remove is actually
 	 * scanning. We are waiting for the end of the frame which is
 	 * a 1 on remvsyncsts (XSPAREREG<1>)
 	 */
-	if (iter_max) {
-		iter_max = 300;
-		while ((tmp & 0x2) && iter_max) {
-			WREG8(DAC_INDEX, MGA1064_SPAREREG);
-			tmp = RREG8(DAC_DATA);
-			udelay(1000);
-			iter_max--;
-		}
-	}
+	(void)read_poll_timeout(RREG_DAC, tmp, (tmp & 0x2),
+				1000, 300000, false,
+				MGA1064_SPAREREG);
 }
 
 void mgag200_bmc_start_scanout(struct mga_device *mdev)

---
base-commit: e535c23513c63f02f67e3e09e0787907029efeaf
change-id: 20260127-jk-mgag200-fix-bad-udelay-409133777e3a

Best regards,
--  
Jacob Keller <jacob.e.keller@intel.com>

