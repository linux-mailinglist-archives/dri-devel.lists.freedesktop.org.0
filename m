Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E437E647A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 08:39:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8E410E1CC;
	Thu,  9 Nov 2023 07:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0610E1C6
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 07:38:45 +0000 (UTC)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFE888CD;
 Thu,  9 Nov 2023 08:38:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699515500;
 bh=K5DujEbhOcvF8V0vOBipXP97KqHSFEg9HlwVJty2vcQ=;
 h=From:Subject:Date:To:Cc:From;
 b=oUXtpzDbina89XTQ0xCyroC7niGhleWtFzrd5nONQFWnXuynFZIk5SMerX7gJd86K
 vFZnRcQSM8tt7RThRdnmtX/NVyQQW7OdJcpstV65SXQxYXD5i+NQWCQXYAuJCGjOv7
 la2CHaft0vtsXb+msObjhepskpL6pS9+S1/s+H8E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/11] drm/tidss: Probe related fixes and cleanups
Date: Thu, 09 Nov 2023 09:37:53 +0200
Message-Id: <20231109-tidss-probe-v2-0-ac91b5ea35c0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFGMTGUC/1XMMQ6DMAyF4asgz01lhyBBp94DMQRiiocSFCPUC
 nH3pnTq+D/pfTsoJ2GFW7FD4k1U4pzDXgoYJj8/2EjIDRZtSViiWSWomiXFnk1duZ6wqYfSj5A
 fS+JRXqfWdrkn0TWm94lv9F1/DiH9ORsZNK4i1zCOjaPqLoG9xrmPPoXrEJ/QHcfxAZa/ehitA
 AAA
To: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=K5DujEbhOcvF8V0vOBipXP97KqHSFEg9HlwVJty2vcQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlTIx5/yLJFpEz95q5saAlhY8HDiWiIQruDALpr
 YxC4SMpCw6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZUyMeQAKCRD6PaqMvJYe
 9Q7tEACvpcHd4FERj8bnkkfGozhkNIkIamq2k8bAlryuvPHV6RGk1sFeeOozCSHncd0CK0CIMRu
 BTMzMyL8JiQyGiPBQyvwaaLJDwEdTvL0+m/sdZvyiDYD6WA46JNJiciJY9JDJrpyVUVrhza8cXQ
 AtFKQF5e4Hh2+TyyM2Q0+snYwJlppHMxqDBf3T/c3sgLVnGbFLDHJp8FCt7ri8ArmkmS8TSwlUR
 78NMjrShiJLFOa5bzMHlhitgTE9DFatush1tkezO1k1tpC6wPs0OqKbpCwW3hKZR/SXmS4wlLNw
 2euaNxQrShxJVYzb6tRZy8SaD26Yu802+pGn0kd4H4tkrESLcYlZRD/vVQ2XvmU7z+jxLHqqxwZ
 eE+T7D/NKNoHibh+knmPX+yH4wka+K4AusC1/pMHXZusU9NzuM0tvzfDoV/yErZFFKqKJ/eduqf
 8saGCcnCSX69EdAE7KEFid+mynxGHOSE03y1X/vn4kfyQT8CKYqtCSUIE1HqA3w7Uv7e05GaqsJ
 8331ip8Ez0Gcb76na398kO3gDD9xWM8SWV1vq55y2aKO7kYM6Rqpzf8UPkT4FwLr1J4mLAaNTEz
 GBgCOxMjkkDMJ3FKC0Xdws4o6JYsMTIZpHApJeGSuGLpnytKOT/E3sFR7Y3ay+ZPAvslx1jQFY8
 jwjwzxvSeJTaGVw==
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
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While working on the TI BSP kernel, adding bootload splash screen
support, I noticed some issues with the driver and opportunities for
cleanups and improvements.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- Add missing pm_runtime_dont_use_autosuspend() in error path
- Add simple manual "reset" for K2G
- Leave tidss->dispc NULL if dispc_init fails
- Add Fixes tags
- Drop "drm/tidss: Add dispc_is_idle()"
- Add "drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY"
- Link to v1: https://lore.kernel.org/r/20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com

---
Tomi Valkeinen (11):
      drm/tidss: Use pm_runtime_resume_and_get()
      drm/tidss: Use PM autosuspend
      drm/tidss: Drop useless variable init
      drm/tidss: Move reset to the end of dispc_init()
      drm/tidss: Return error value from from softreset
      drm/tidss: Check for K2G in in dispc_softreset()
      drm/tidss: Add simple K2G manual reset
      drm/tidss: Fix dss reset
      drm/tidss: IRQ code cleanup
      drm/tidss: Fix atomic_flush check
      drm/tidss: Use DRM_PLANE_COMMIT_ACTIVE_ONLY

 drivers/gpu/drm/tidss/tidss_crtc.c  | 12 ++----
 drivers/gpu/drm/tidss/tidss_dispc.c | 79 +++++++++++++++++++++++++++++++++----
 drivers/gpu/drm/tidss/tidss_drv.c   | 15 +++++--
 drivers/gpu/drm/tidss/tidss_irq.c   | 54 ++++---------------------
 drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
 5 files changed, 97 insertions(+), 65 deletions(-)
---
base-commit: 9d7c8c066916f231ca0ed4e4fce6c4b58ca3e451
change-id: 20231030-tidss-probe-854b1098c3af

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

