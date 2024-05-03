Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D78BB3FA
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 21:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294CB10EB3C;
	Fri,  3 May 2024 19:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MQhgFrjp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-185.mta1.migadu.com (out-185.mta1.migadu.com
 [95.215.58.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193310E325
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 19:29:31 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1714764569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=iUCfelyDQR7NwCOZaWX8ASl/1Ini/iPPBj8R9Vt6ybs=;
 b=MQhgFrjpk+EZ3O9deS9HezRuXkIATCAD7VU0drh/fheHoLEiEFrtdpTedu7h68oIDZiVOL
 ius4U2eUybf7aUGKtdcm/FOqMk1nIbEUaFQKUD5I18d/NNB5aj+I9euYQm5bBLlUCnzccT
 mvXqG2C9wZraGXfRKEzGFjfSk1o3azg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>,
 Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 00/10] drm: zynqmp_dp: IRQ cleanups and debugfs support
Date: Fri,  3 May 2024 15:29:12 -0400
Message-Id: <20240503192922.2172314-1-sean.anderson@linux.dev>
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

This series cleans up the zyqnmp_dp IRQ and locking situation. Once
that's done, it adds debugfs support. The intent is to enable compliance
testing or to help debug signal-integrity issues.

Last time I discussed converting the HPD work(s) to a threaded IRQ. I
did not end up doing that for this series since the steps would be

- Add locking
- Move link retraining to a work function
- Harden the IRQ
- Merge the works into a threaded IRQ (omitted)

Which with the exception of the final step is the same as leaving those
works as-is. Conversion to a threaded IRQ can be done as a follow-up.

Changes in v5:
- Fix AUX bus not getting unregistered
- Rebase onto drm-misc/drm-misc-next

Changes in v4:
- Rebase onto drm/drm-next

Changes in v3:
- Don't delay work
- Convert to a hard IRQ
- Use AUX IRQs instead of polling
- Take dp->lock in zynqmp_dp_hpd_work_func

Changes in v2:
- Rearrange zynqmp_dp for better padding
- Split off the HPD IRQ work into another commit
- Expand the commit message
- Document hpd_irq_work
- Document debugfs files
- Add ignore_aux_errors and ignore_hpd debugfs files to replace earlier
  implicit functionality
- Attempt to fix unreproducable, spurious build warning
- Drop "Optionally ignore DPCD errors" in favor of a debugfs file
  directly affecting zynqmp_dp_aux_transfer.

Sean Anderson (10):
  drm: zynqmp_kms: Fix AUX bus not getting unregistered
  drm: zynqmp_dp: Rearrange zynqmp_dp for better padding
  drm: zynqmp_dp: Don't delay work
  drm: zynqmp_dp: Add locking
  drm: zynqmp_dp: Don't retrain the link in our IRQ
  drm: zynqmp_dp: Convert to a hard IRQ
  drm: zynqmp_dp: Use AUX IRQs instead of polling
  drm: zynqmp_dp: Split off several helper functions
  drm: zynqmp_dp: Take dp->lock in zynqmp_dp_hpd_work_func
  drm: zynqmp_dp: Add debugfs interface for compliance testing

 Documentation/gpu/drivers.rst     |   1 +
 Documentation/gpu/zynqmp.rst      | 149 +++++
 MAINTAINERS                       |   1 +
 drivers/gpu/drm/xlnx/zynqmp_dp.c  | 883 +++++++++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_kms.c |  12 +-
 5 files changed, 977 insertions(+), 69 deletions(-)
 create mode 100644 Documentation/gpu/zynqmp.rst

-- 
2.35.1.1320.gc452695387.dirty

