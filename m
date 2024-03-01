Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D174E86DCA8
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 09:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE6310EBF0;
	Fri,  1 Mar 2024 08:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l8AnAcDo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5715B10EBF0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 08:02:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3A62DCE0CDF;
 Fri,  1 Mar 2024 08:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221C4C433F1;
 Fri,  1 Mar 2024 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709280172;
 bh=XRLlrXz5Ocz4LCksB6fwt5zEqTtnXpKSX2G2ejKfTEk=;
 h=From:To:Cc:Subject:Date:From;
 b=l8AnAcDojII+1q3dzdic1WV3s60gNxGZS0Qh/of87n3Y4hUhMkBnHxYCevBVWJFDe
 nTXOj9caW+eorEqPnFEjfZddXaLTr2LgFDQbJ03hhoPJ/eNmyEydbMnWGCMBsYiMaM
 CLPJtC/6QNKI/qw0FfrOsErr5bRw/J2G3tZXP3turoL4eq5mOpPTedOaHC+LO4VN3x
 q44tNF8nglfxgQLuwswTm51m9gH8lXuqAji7gAonfezS5C0od+5n0SuMgT3gK8wLKD
 Y/FK5zJqZNgN/WgvidhTfz9JjjHgMgbritNRzvrRczgO7KgruruBbarckUAF8wEmRK
 b3d8ROA0rthZQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@redhat.com>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/sun4i: hdmi: Add missing drm_atomic header
Date: Fri,  1 Mar 2024 09:02:49 +0100
Message-ID: <20240301080249.823067-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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

Commit 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and
mode_valid") added a call to drm_atomic_get_new_connector_state() but
didn't include drm_atomic.h which defines it.

On some configuration, this leads to a build failure, presumably because
in the common case the header gets included by an intermediate header
but it isn't always the case.

Let's add a proper include.

Reported-by: Dave Airlie <airlied@redhat.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402291942.zVb1Vx4Y-lkp@intel.com/
Fixes: 358e76fd613a ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index b7cf369b1906..69001a3dc0df 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -14,10 +14,11 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
-- 
2.43.2

