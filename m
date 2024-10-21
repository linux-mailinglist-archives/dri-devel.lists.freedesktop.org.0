Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3549A6B9B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 16:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F193E10E520;
	Mon, 21 Oct 2024 14:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qq5dVfk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EAE10E520
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 14:08:17 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CDA7C502;
 Mon, 21 Oct 2024 16:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1729519590;
 bh=1MgP2F8moCqzsOmnkKF7V1hfTU0FvZDmOEK1cyki77U=;
 h=From:Subject:Date:To:Cc:From;
 b=qq5dVfk82X7Z+PF4NzgnaH5bFdE7UogRs2wyhYS0UF8dsCMpTlggVgl/9NYGh0DbK
 uRM22If/eevwpRaIWlyBgCQplWVywpKdYCodnLbzVoSuWBvt9YWjZ42LxHg+1+GSv1
 w6u6iFsJex/VON9cvzrTU77a3IAzdFlS2nR7dHng=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/7] drm/tidss: Interrupt fixes and cleanups
Date: Mon, 21 Oct 2024 17:07:44 +0300
Message-Id: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADFgFmcC/x2MQQqAIBAAvxJ7bkFFyvpKdLBaay9WbkQg/T3pO
 AMzGYQSk0BfZUh0s/AeC+i6gnnzcSXkpTAYZazqtMOLFxHkdGLgB0Pj2knbzlszQ2mOREX/v2F
 83w/Bowa5XwAAAA==
To: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Bin Liu <b-liu@ti.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1452;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=1MgP2F8moCqzsOmnkKF7V1hfTU0FvZDmOEK1cyki77U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnFmBIExpppKVyWBV2SrBM3cBXEDUR+rMt9YcPO
 DTwcqa6DuqJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZxZgSAAKCRD6PaqMvJYe
 9UG3D/0RLXhn4OgmO2WJA/yg0cD+Z7zCxoTW/wYj+xhtBs1MAhInKBBWvayyF7MvbVk1yixDnl+
 EMXcr8TmN9ulW1RtBQ8is0/kaG3J3O5ISwGgPM+ghz91R8CvN5/p5SucwFIYG7AfYDbFQmIF31w
 JwS4X3HB/jjgUmAr+L1h+CdrO+8cobWyequNyfkFPARjaMFPWGuHDmpBcJURaga1KY/eZw9/aqV
 Q/v11Kcai5oNL+YBHJakvsxlFejEy9/RcbPW+DlkoCZ1govJuJOxlVEOcSaFrDJc7k3JPim6nII
 ++7I1UPhUrRdG0JMo/t+p9mD9SH/rVqWzrn2u6YZYyJRG9rcuva7IbgdPFsXZSdZRZpjSqK10pC
 5VIgc3f2YcDgMHdxidp8kLhVhkNG67zEOrNCWjqM2WyUiswFtyNUWx35dAkqoflC0uTmP8fdI0a
 SUu1OUIqsZGg7L1dsWeAJpkrEXXe54x3Q338LQDUOZ9sw4hMD+i7+JliHBP/eNGoaOqipIkmSbE
 +DBlvwaER2pqE/p3CjqLcMba2DB1rXy7URXyj8gzY83/DQo/maYqP31IzWkLsvpwuslg5+aArv+
 lGVIldRhNFOmFwV8Eb7SKT+w7Yt4CNVKSVW3ngz2gPo8SkZwWStxBFo/4b9hcbo56gPk2jwlbz0
 P0C1oHN/N+HoJdQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

A collection of interrupt related fixes and cleanups. A few patches are
from Devarsh and have been posted to dri-devel, which I've included here
with a permission from Devarsh, so that we have all interrupt patches
together. I have modified both of those patches compared to the posted
versions.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Devarsh Thakkar (2):
      drm/tidss: Clear the interrupt status for interrupts being disabled
      drm/tidss: Fix race condition while handling interrupt registers

Tomi Valkeinen (5):
      drm/tidss: Fix issue in irq handling causing irq-flood issue
      drm/tidss: Remove unused OCP error flag
      drm/tidss: Remove extra K2G check
      drm/tidss: Add printing of underflows
      drm/tidss: Rename 'wait_lock' to 'irq_lock'

 drivers/gpu/drm/tidss/tidss_dispc.c | 28 ++++++++++++++++------------
 drivers/gpu/drm/tidss/tidss_drv.c   |  2 +-
 drivers/gpu/drm/tidss/tidss_drv.h   |  5 +++--
 drivers/gpu/drm/tidss/tidss_irq.c   | 34 +++++++++++++++++++++++-----------
 drivers/gpu/drm/tidss/tidss_irq.h   |  4 +---
 drivers/gpu/drm/tidss/tidss_plane.c |  8 ++++++++
 drivers/gpu/drm/tidss/tidss_plane.h |  2 ++
 7 files changed, 54 insertions(+), 29 deletions(-)
---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20240918-tidss-irq-fix-f687b149a42c

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

