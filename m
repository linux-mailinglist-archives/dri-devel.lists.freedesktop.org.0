Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A8552C74
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B04112872;
	Tue, 21 Jun 2022 07:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8C2112877
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655798214; x=1687334214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vCVXmWxUrFi6Xr9Wjm6brQnYsJGsIHmC+YmfL9+QGNE=;
 b=BWaOjZMmPN86ChMlCea71DRT57pFwgphpK7TeCsHUKhvGIzu+e1pBI0v
 JMDmNaIMWLj8qfDWpET5IlErmUMb6jwFxuYoVIo8F8qIztTmUVT/MQtNf
 QvujGwuNjElzjj876Hpu111CcinPYk65XqtcawJwVlQmorY71Slw9meUB
 j/TgJItWBZvBJPBwLcKMdGbyAJwiILnDvq/Gz8kZMCoy6gNQ2LuP5j22v
 zUSqTJuUpChVtJOKOIo/o5xRkpOqxLEtzCHuBTlpGbTj7WsJxuA3Wh9Cw
 wxXVzp/rkPnVHjqr3AXMI5X+2burpdgduF+bq1cfZfItB5xE96U4Lj32h g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="305498631"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="305498631"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 00:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="585185903"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga007.jf.intel.com with SMTP; 21 Jun 2022 00:56:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Jun 2022 10:56:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/xlnx: Fix build failure due to missing include
Date: Tue, 21 Jun 2022 10:56:48 +0300
Message-Id: <20220621075648.7717-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Dropping drm_blend.h from drm_crtc.h broke the
xlnx driver. Make it build again by including
drm_blend.h from the driver directly.

My .config was missing some required dependencies so
I never build tested it :/

Cc: Hyun Kwon <hyun.kwon@xilinx.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 90bb087f6674 ("drm: Drop drm_blend.h from drm_crtc.h")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 11c409cbc88e..cc32aa89cf8f 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -12,6 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_fb_cma_helper.h>
-- 
2.35.1

