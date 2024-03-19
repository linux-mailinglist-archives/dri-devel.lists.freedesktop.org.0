Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5C880769
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 23:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C04C10F6B8;
	Tue, 19 Mar 2024 22:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="qC24ItmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com
 [91.218.175.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7226D10F662
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 22:51:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710888696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=S9/a7zZ7K+tzZcY0ZjcWN73TQAR+qMuQ1J4ijtfKAJ4=;
 b=qC24ItmCdcMeli2r0BvFALbREJppQpq2xZ8hq0cobqTPHl04AqCVy89u8A2Wpw1VBMh33S
 oMyUcNYcrR4O7E4LFmAt0Pldik8LMLStopcKkZ4MFEDHSklREBUpCsHs7mNUSK1OJ4SLQ9
 6qC/S1K+g3mlLsQ8cnAKltw2q2Biqb8=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@amd.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/8] drm: zynqmp_dp: Misc. patches and debugfs support
Date: Tue, 19 Mar 2024 18:51:13 -0400
Message-Id: <20240319225122.3048400-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

This series adds debugfs support for the zynqmp_dp driver. The intent is
to enable compliance testing or to help debug signal-integrity issues.

The first four patches are general improvements (and could be applied
independently), while the last four add debugfs support.

Changes in v2:
- Fix kerneldoc
- Rearrange zynqmp_dp for better padding
- Document hpd_irq_work
- Split off the HPD IRQ work into another commit
- Expand the commit message
- Document debugfs files
- Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
  implicit functionality
- Attempt to fix unreproducable, spurious build warning
- Drop "Optionally ignore DPCD errors" in favor of a debugfs file
  directly affecting zynqmp_dp_aux_transfer.

Sean Anderson (8):
  drm: xlnx: Fix kerneldoc
  drm: zynqmp_dp: Downgrade log level for aux retries message
  drm: zynqmp_dp: Adjust training values per-lane
  drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
  drm: zynqmp_dp: Don't retrain the link in our IRQ
  drm: zynqmp_dp: Add locking
  drm: zynqmp_dp: Split off several helper functions
  drm: zynqmp_dp: Add debugfs interface for compliance testing

 Documentation/gpu/drivers.rst       |   1 +
 Documentation/gpu/zynqmp.rst        | 149 +++++
 MAINTAINERS                         |   1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c  |   6 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c    | 836 +++++++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |   1 +
 drivers/gpu/drm/xlnx/zynqmp_kms.h   |   4 +-
 7 files changed, 931 insertions(+), 67 deletions(-)
 create mode 100644 Documentation/gpu/zynqmp.rst

-- 
2.35.1.1320.gc452695387.dirty

