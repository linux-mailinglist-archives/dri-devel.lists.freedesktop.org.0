Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOLBB5I/gWl6FAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:21:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0A7D2E60
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 01:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87710E223;
	Tue,  3 Feb 2026 00:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dq3MHABb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED09110E223
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 00:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770078094; x=1801614094;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=qzArX6lV5IESUxaAN4hisLmQcYLhWXNy4O9ymYe/ZAs=;
 b=Dq3MHABbXbxgnJTUOReuq9EFPrZFic9M4eVdSC++ee/lPQUc2xEI3C51
 m35pI1bgGsW0TEtBZ7XZNwqrqxhPHl86yczucVoOb3SEvaKfPjvxmksxz
 XRFEx5lSeKm59AgmbN4Gw6cfT91OGeqNg0IqkTr8aWphuSq49wzMX6Iti
 i3epMXv+MaAN2R1q27I9gr9qIOLVoD9ZXwnegvtjCiw/7MIhUS14g0OTA
 uVijp8TBJVUapNrK5J/QvfBqtFEnv39RhaBx8H9JdwMO1DuOFwrJ3SCJy
 iir/gZ6aJIPf0/VtQHVUVOcc0lAVNyNNPufX+KVZYS1x9Qh2ldicR7E70 g==;
X-CSE-ConnectionGUID: TmNe0MjeSFStZ6pvDmaFUQ==
X-CSE-MsgGUID: +YarBPhCTOyzj7pJRaymkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82615261"
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="82615261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:21:32 -0800
X-CSE-ConnectionGUID: lmklYiuJSxinUGQC2NcltQ==
X-CSE-MsgGUID: 80Q4SECmTIGpkayc2rTmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,269,1763452800"; d="scan'208";a="247276317"
Received: from orcnseosdtjek.jf.intel.com (HELO [10.166.28.109])
 ([10.166.28.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 16:21:32 -0800
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Mon, 02 Feb 2026 16:16:39 -0800
Subject: [PATCH v2] drm/mgag200: fix mgag200_bmc_stop_scanout()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-jk-mgag200-fix-bad-udelay-v2-1-ce1e9665987d@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4Xs2TXbllj15HsYDoWusMqPaZFIC
 O9uJfHq8ZvMfLNA5CAc4ZwtEHiSKEOfQO8yqBrX14ziE4MmfSClLd4f2NWu1kR4kzeWzuPLc+t
 mzOmkjLHWsnGQ9s/AqbG5r0XiRuI4hHm7mtQ3/VmPf6yTQoW+JM2UVyY3/iL9yO2+Gjoo1nX9A
 Af9Nz3CAAAA
X-Change-ID: 20260127-jk-mgag200-fix-bad-udelay-409133777e3a
To: Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
Cc: Pasi Vaananen <pvaanane@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.15-dev-f4b34
X-Developer-Signature: v=1; a=openpgp-sha256; l=10437;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=qzArX6lV5IESUxaAN4hisLmQcYLhWXNy4O9ymYe/ZAs=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhsxG+1aHLVPi46KKn7JO/H9Ys6Qqu93u8n/R8l2HeDTyK
 /YY6fJ3lLIwiHExyIopsig4hKy8bjwhTOuNsxzMHFYmkCEMXJwCMJFntxkZDtasWej86bf382Tv
 kp06Xtxqxa96Fs8oe6ByLMvrtqKGMyPD7ZDiA7Jv3Ipf6OqLtrz7KMn9y/t5+IPpT/xZz5hk7Fj
 OCwA=
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7A0A7D2E60
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

Every so often, approximately once every 20 minutes -- though with large
variance -- the output_poll_execute() thread would detect some sort of
change that required performing a hotplug event which results in attempting
to stop the BMC scanout, resulting in a 300msec delay on one CPU.

On this system, ptp4l was pinned to a single CPU. When the
output_poll_execute() thread ran on that CPU, it blocked ptp4l from
executing for its 300 millisecond duration.

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

The function has some helpful comments explaining what steps it is
attempting to take. In particular, step 3a and 3b are explained as such:

  3a - The third step is to verify if there is an active scan. We are
       waiting on a 0 on remhsyncsts (<XSPAREREG<0>.

  3b - This step occurs only if the remove is actually scanning. We are
       waiting for the end of the frame which is a 1 on remvsyncsts
       (<XSPAREREG<1>).

The actual steps 3a and 3b are implemented as while loops with a
non-sleeping udelay(). The first step iterates while the tmp value at
position 0 is *not* set. That is, it keeps iterating as long as the bit is
zero. If the bit is already 0 (because there is no active scan), it will
iterate the entire 300 attempts which wastes 300 milliseconds in total.
This is opposite of what the description claims.

The step 3b logic only executes if we do not iterate over the entire 300
attempts in the first loop. If it does trigger, it is trying to check and
wait for a 1 on the remvsyncsts. However, again the condition is actually
inverted and it will loop as long as the bit is 1, stopping once it hits
zero (rather than the explained attempt to wait until we see a 1).

Worse, both loops are implemented using non-sleeping waits which spin
instead of allowing the scheduler to run other processes. If the kernel is
not configured to allow arbitrary preemption, it will waste valuable CPU
time doing nothing.

There does not appear to be any documentation for the BMC register
interface, beyond what is in the comments here. It seems more probable that
the comment here is correct and the implementation accidentally got
inverted from the intended logic.

Reading through other DRM driver implementations, it does not appear that
the .atomic_enable or .atomic_disable handlers need to delay instead of
sleep. For example, the ast_astdp_encoder_helper_atomic_disable() function
calls ast_dp_set_phy_sleep() which uses msleep(). The "atomic" in the name
is referring to the atomic modesetting support, which is the support to
enable atomic configuration from userspace, and not to the "atomic context"
of the kernel. There is no reason to use udelay() here if a sleep would be
sufficient.

Replace the while loops with a read_poll_timeout() based implementation
that will sleep between iterations, and which stops polling once the
condition is met (instead of looping as long as the condition is met). This
aligns with the commented behavior and avoids blocking on the CPU while
doing nothing.

Note the RREG_DAC is implemented using a statement expression to allow
working properly with the read_poll_timeout family of functions. The other
RREG_<TYPE> macros ought to be cleaned up to have better semantics, and
several places in the mgag200 driver could make use of RREG_DAC or similar
RREG_* macros should likely be cleaned up for better semantics as well, but
that task has been left as a future cleanup for a non-bugfix.

Fixes: 414c45310625 ("mgag200: initial g200se driver (v2)")
Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
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

Thanks to Thomas Zimmermann for catching the originally unintended flipping
of the loop condition, and for helping determine this seems to actually be
correct. It seems likely that we are blocking for 300 milliseconds every
time unintentionally because we loop until there is an active scan instead
of looping until there is no more active scan.
---
Changes in v2:
- Update the description after the insights from Thomas, and the testing
  from Jocelyn.
- Fix some minor typos in the comments.
- No functional change from v1, though we now explain why we're changing
  the conditions in the commit message properly.
- Link to v1: https://patch.msgid.link/20260128-jk-mgag200-fix-bad-udelay-v1-1-db02e04c343d@intel.com
---
 drivers/gpu/drm/mgag200/mgag200_drv.h |  6 ++++++
 drivers/gpu/drm/mgag200/mgag200_bmc.c | 31 ++++++++++++-------------------
 2 files changed, 18 insertions(+), 19 deletions(-)

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
index a689c71ff165..bbdeb791c5b3 100644
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
@@ -42,30 +43,22 @@ void mgag200_bmc_stop_scanout(struct mga_device *mdev)
 
 	/*
 	 * 3a- The third step is to verify if there is an active scan.
-	 * We are waiting for a 0 on remhsyncsts <XSPAREREG<0>).
+	 * We are waiting for a 0 on remhsyncsts (<XSPAREREG<0>).
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
-	 * 3b- This step occurs only if the remove is actually
+	 * 3b- This step occurs only if the remote BMC is actually
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

