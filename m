Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NAXJktzj2n7QwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:54:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B71390A0
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0FD10E302;
	Fri, 13 Feb 2026 18:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eqJ0WcTx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7335210E19B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=txKv3cVQrZKTkqyDAzIwNqeoNl4lUFsfj4I12QJs6VA=; b=eqJ0WcTxn5/Ax8U/tzickw/MyD
 FKMudGpidszUaqvzamdv5bKZZ9zdsJ5PZKo9dJ62p1LLwQIvOcjcuR+NTf6PdK5iSq8ht+0dAmFMD
 JMklkfeFUb5VF4KI1xw8FvZUZ4ienM3Bilg+8PgFx+bPG4uqkIK2R9kVHg3jaVXChXuo14U11jGwX
 IebcFEFDoLibgiTZd2QJKX3c9jAAfODYqIgReZqiLG97Ogu3c/9p8hSQjtbF3cYuqVvC/I/4m3N+p
 hfqRO/VcUGK2s6xOJUyZmWSCTIFySSBMgBF4GBrjHRgUiJFWQ5PC/3ZKByEIjCVgKbUQliuRMr3bS
 fDtUWAaQ==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vqyIG-000Sqv-TO; Fri, 13 Feb 2026 19:53:33 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Subject: [PATCH v5 0/7] Power Management for Raspberry Pi V3D GPU
Date: Fri, 13 Feb 2026 15:52:53 -0300
Message-Id: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAZzj2kC/4XNzQrCMAzA8VeRnq00add1nnwP8dCt2Sy4Dzqpi
 uzd7QaCIsPjPyS/PNlIwdPI9psnCxT96PsuRbbdsOpsu4a4d6kZCsxEjoZH6fjQ3yjw1na2oZa
 6Kycqy7ShXFVolk6HQLW/L+zxlPrsx2sfHsuXCPP0DxiBC54bUReIJQhlDr6xF293Vd+yWYz4o
 UhYUTApQqLLdCmg0OpHkW9FCwC9osikKAKTKzLgnP5R1IeCa4pKSmVrdDVopwi/lGmaXnVhg9q
 LAQAA
X-Change-ID: 20250728-v3d-power-management-eebb2024dc96
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4729; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=0EVfKIvCHzcJxJ1ZmhXGh4Tz/RasBDlQrEbZddzRlns=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDJn9xcrv/KXTzI8/clis8WHlTv4ddReXqlyblLjFOj2Le
 89Zo+6/nYzGLAyMHAyyYoosP57E1jKKlbNrLiu/CDOIlQlkCgMXpwBMhDuS/Z/ttQBbntM7VwX0
 RJ1VWOGXwB7O8f7u3+X7p5y2MQ38KefOmF6zUHBfdLYOl826LKuMzpQAvz5vLktfgRPqbAwl245
 M79tRa8/+bBEze3fF8alsu3oaFLuaUhiDlRM/X+LVLH9VL/d8Zv/fyuQqv+LfCoL6M//PqrH7JM
 adeq+LP/do9HVTd+b9U0SfJql6sOt4aDiu+Pzr+i5uy+kCv6wL+pWul3ZfubvOXkKr509Mb2pdw
 OW5ncnNDAd//34yR1h9dmHR3lXfQ4urvi+ckLqBt8F+tg9DltmDuRkLn2rFF//bkc14iHtz8tWI
 gv7W9nVa9hGN/tZO3jFabCyST5JuHNnlK/F0s/3a5X0A
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,raspberrypi.com,pengutronix.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
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
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid]
X-Rspamd-Queue-Id: E24B71390A0
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

To ease testing in Raspberry Pi 4 and 5, I prepared a downstream branch
backporting this series to rpi-6.18.y [1].

[1] https://github.com/mairacanal/linux-rpi/tree/v3d/downstream/power-management-v5

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
- [4/4] s/DRM_ERROR/drm_err
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

v4 -> v5: https://lore.kernel.org/r/20260126-v3d-power-management-v4-0-caf2df16d4e2@igalia.com

- [2/7] Add Stefan's A-b (Stefan Wahren)
- [2/7, 5/7, 6/7] Add Melissa's R-b (Melissa Wen)
- [4/7] NEW PATCH: "pmdomain: bcm: bcm2835-power: Increase ASB control timeout"
- [7/7] Remove redundant pm_runtime_mark_last_busy() from v3d_pm_runtime_put()
- [7/7] Use pm_runtime_get_if_active() in v3d_mmu_flush_all() instead of
  pm_runtime_get_noresume() + pm_runtime_active()
- [7/7] Add missing PM runtime calls to v3d_perfmon_start() and v3d_perfmon_stop()

---
Maíra Canal (7):
      clk: bcm: rpi: Let V3D consumers manage clock rate
      clk: bcm: rpi: Add a comment about RPI_FIRMWARE_SET_CLOCK_STATE behavior
      clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as CLK_IGNORE_UNUSED
      pmdomain: bcm: bcm2835-power: Increase ASB control timeout
      drm/v3d: Use devm_reset_control_get_optional_exclusive()
      drm/v3d: Allocate all resources before enabling the clock
      drm/v3d: Introduce Runtime Power Management

 drivers/clk/bcm/clk-raspberrypi.c    |  15 ++--
 drivers/gpu/drm/v3d/Makefile         |   3 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c    |  23 ++++-
 drivers/gpu/drm/v3d/v3d_drv.c        | 163 +++++++++++++++++------------------
 drivers/gpu/drm/v3d/v3d_drv.h        |  20 +++++
 drivers/gpu/drm/v3d/v3d_gem.c        |  25 +++---
 drivers/gpu/drm/v3d/v3d_irq.c        |  15 ++--
 drivers/gpu/drm/v3d/v3d_mmu.c        |  10 ++-
 drivers/gpu/drm/v3d/v3d_perfmon.c    |  18 +++-
 drivers/gpu/drm/v3d/v3d_power.c      |  96 +++++++++++++++++++++
 drivers/gpu/drm/v3d/v3d_submit.c     |  19 +++-
 drivers/pmdomain/bcm/bcm2835-power.c |   5 +-
 12 files changed, 286 insertions(+), 126 deletions(-)
---
base-commit: df4dc947c46bb9f80038f52c6e38cb2d40c10e50
change-id: 20250728-v3d-power-management-eebb2024dc96

