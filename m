Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AINeBf2jd2k9jwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:27:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA418B713
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 18:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7531310E123;
	Mon, 26 Jan 2026 17:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="FqZV7D8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD66310E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h2l2VsX/8R5W80Gwmwfk77TtbOOheZyGre7BqV1n0/g=; b=FqZV7D8x3C0Zo1qP6Iios/U9Ul
 zpuLSVD5VXh2huooyiLrAAOEkPIU84Wicthc7ngLajJLPWEiqQSz1+IQM0x2bJLfdCJ9GTMMCAQPo
 uolxjmMM0GcZrRAechgcfg6QIBAxNmlTwsM5iU8SKS5slhhY4hrcuueZIJH6/L6MU/O7dYl3l8cvX
 TtoVEyrbKMveL9zDY05db//ZQAuvnvpjhESRMWA4RZ7V/jQGwms+GdVksrD1iMH54qPZbxDOnenf9
 AcKmqWQwo6SscPKAr1U6zcCxkBK+h74DNOFd9KXb90b9aJSYb0k/b4r6pApSUZg3bMHY+R4IdAAe5
 Wfp9RBpA==;
Received: from [187.36.210.68]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vkQMf-00A8mi-Aw; Mon, 26 Jan 2026 18:27:01 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 0/6] Power Management for Raspberry Pi V3D GPU
Date: Mon, 26 Jan 2026 14:26:36 -0300
Message-Id: <20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMyjd2kC/4XNSwqDMBCA4atI1k3JJDHGrnqP0kU0owbqgyhpi
 3j3RqHQUqTLf5j5ZiYjeocjOSUz8Rjc6PouhjwkpGxMVyN1NjbhjKcs45oGYenQ39HT1nSmxha
 7iSIWRdyQtswViaeDx8o9NvZyjd24cer9c/sSYJ3+AQNQRjPNqpzzApjUZ1ebmzPHsm/JKgb+o
 QjYUXhUmOA2VQWDXMkfRbwVxQDUjiKiIhF0JlGDtepLWZblBSo28u5FAQAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, Dom Cobley <popcornmix@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4539; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=hj+uwXXOqjjow7+1ZQCGFkYOlTxy8CW72WoLmBX2f1Q=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpd6Pdq8j28y2sNkGyeMvtHL3stY7GXNKttpCcw
 92V+yJdh/+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaXej3QAKCRA/8w6Kdoj6
 qnGJB/0Y/llrEvbqFYIGw7eAd8tTTt0agIGxoEyTeEdttPxU1lgXF/Vf8PeppXIOX9Enwgiic6t
 mI6vVpojECcaIYjVmwUKt3v3NkVD0GyIjFwPQ7wPueM0tAhQPToNmX9HtFN+D5CgAjaetgkm0BX
 wYXfKNIxN9Y/BpQ9/HPlJwvo61fuIWKAsOnO/8K35Re4alqGUJwrG1ph7PtvJ6lf4/OVqRvHQ38
 T+w7DEgLEtUzc8JigsIjp9tvtSDrqwTdEGsgxgxKto/65IoUA0iQypJVqHJ5VZVvoJg9a0JrkVt
 vq7ZPLuZeE2N7XztoA4WRZ0jLlWopGSG3r5qKJO6EeNX9Ykm
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:popcornmix@gmail.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,gmail.com,raspberrypi.com,pengutronix.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ABA418B713
X-Rspamd-Action: no action

This series introduces Runtime Power Management (PM) support for the
Raspberry Pi V3D GPU.

Currently, the V3D clock remains enabled for the entire system uptime,
even when the GPU is idle. With the introduction of Runtime PM, the
clock can now be disabled during idle periods. For example, with this
series applied on a Raspberry Pi 5, if we check `vcgencmd measure_clock
v3d`, we get:

(idle)

$ vcgencmd measure_clock v3d
frequency(0)=0

(running glmark2)

$ vcgencmd measure_clock v3d
frequency(0)=960016128

One particular change was required in v3 to ensure a meaningful
reduction in idle power consumption: the V3D clock rate must be
explicitly set to the minimum rate during suspend. As explained in an
inline comment, this is needed as some firmware versions may not fully
power off the clock when its state is set to off. This issue can be
mitigated by setting the clock rate to 0 during suspend. For this same
reason, PATCH 1/6 has been added in v3.

Apart from that, the v3d patches are mostly identical to v2, but rebased
on top of drm-misc-next.

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.18.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-6.18

Best regards,
- Maíra

---
v1 -> v2: https://lore.kernel.org/r/20250728-v3d-power-management-v1-0-780f922b1048@igalia.com

- [1/5] NEW PATCH: "clk: bcm: rpi: Add missing logs if firmware fails" (Stefan Wahren)
- [2/5] Remove the "Fixes:" tag (Stefan Wahren)
- [2/5] dev_err_ratelimited() instead of dev_err() (Stefan Wahren)
- [2/5] Instead of logging the clock ID, use clk_hw_get_name(hw) to log the name (Stefan Wahren)
- [2/5] Add a newline character at the end of the log message (Stefan Wahren)
- [2/5] Use CLK_IS_CRITICAL for all clocks that can't be disabled (Maxime Ripard)
- [3/5] NEW PATCH: "clk: bcm: rpi: Maximize V3D clock"
- [4/5] Use devm_reset_control_get_optional_exclusive() (Philipp Zabel)
- [4/5] Make sure that resource are cleaned in the inverse order of allocation (Philipp Zabel)

v2 -> v3: https://lore.kernel.org/r/20250731-v3d-power-management-v2-0-032d56b01964@igalia.com

- Rebased on top of drm-misc-next
- Patches "[PATCH v2 1/5] clk: bcm: rpi: Add missing logs if firmware
  fails", "[PATCH v2 2/5] clk: bcm: rpi: Turn firmware clock on/off when
  preparing/unpreparing", and "[PATCH v2 3/5] clk: bcm: rpi: Maximize
  V3D clock" were applied to clk-next.
- [1/4] NEW PATCH: "clk: bcm: rpi: Let V3D consumers manage clock rate"
- [2/4] NEW PATCH: "clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED"
- [3/4] Added Philipp's R-b (Philipp Zabel)
- [4/4] s/drm_err/DRM_ERROR
- [4/4] Set the clock rate to 0 during suspend and to the maximum rate
  during resume

v3 -> v4: https://lore.kernel.org/r/20260116-v3d-power-management-v3-0-4e1874e81dd6@igalia.com

- Rebased on top of drm-misc-next
- [1/6, 3/6] Add Melissa's A-b (Melissa Wen)
- [2/6] NEW PATCH: "clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE
  behavior" (Stefan Wahren)
- [4/6] NEW PATCH: "drm/v3d: Use devm_reset_control_get_optional_exclusive()" (Melissa Wen)
- [5/6] Include more context to the commit message (Melissa Wen)
- [5/6, 6/6] Instead of creating the function v3d_gem_allocate(), use v3d_gem_init()
  and move HW initialization out of it (Melissa Wen)

---
Maíra Canal (6):
      clk: bcm: rpi: Let V3D consumers manage clock rate
      clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
      clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
      drm/v3d: Use devm_reset_control_get_optional_exclusive()
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c |  15 ++--
 drivers/gpu/drm/v3d/Makefile      |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c |  23 +++++-
 drivers/gpu/drm/v3d/v3d_drv.c     | 163 ++++++++++++++++++--------------------
 drivers/gpu/drm/v3d/v3d_drv.h     |  21 +++++
 drivers/gpu/drm/v3d/v3d_gem.c     |  25 +++---
 drivers/gpu/drm/v3d/v3d_irq.c     |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c     |  12 ++-
 drivers/gpu/drm/v3d/v3d_power.c   |  96 ++++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c  |  19 ++++-
 10 files changed, 273 insertions(+), 119 deletions(-)
---
base-commit: 68e28facbc8ab3e701e1814323d397a75b400865
change-id: 20250728-v3d-power-management-eebb2024dc96

