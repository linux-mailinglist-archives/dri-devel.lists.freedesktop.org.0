Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1F8D01E6D
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D55210E6D6;
	Thu,  8 Jan 2026 09:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQRNmBQN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712B310E6D4;
 Thu,  8 Jan 2026 09:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865519; x=1799401519;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Rjps/nX0jH3DCZt1X85lB/JZXzMu4fAgJVPB8baQO0Y=;
 b=UQRNmBQNV5r3zbgQ6n2kQlNTWOHvQHgpN/yf4M5eFHbgwzEcneVL+XOS
 XjE8GIxZiUweScT78oZCKmDuEu+neDeX1KK3g72ozUHGuay07sr0XRuQ4
 bDZDK3oS9Aq5B2S63YWJYdUHWsj1VBagrQdIz1izcAVzDYbPvD1q2+Lc+
 OmovAPeTvXlKwQN4stVtZWHNBZybu2ZuC12Cvf72eeWasHu+PCtyxHheq
 vOYt4IG8uXozSuKVhkQ4n9qdiclK7L9onnuAuIydm2X9PsrUdkEYrwpfA
 MrSWxnKmA7kxpwY1cCdaIY78Yzs0HHXPZydNTdpTHprlm2qNTnbvjvPZE w==;
X-CSE-ConnectionGUID: WJrvzC/MQmm0zZOd54EMig==
X-CSE-MsgGUID: N0qQzBh7TKmg4Q1VqaHqgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876541"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876541"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:08 -0800
X-CSE-ConnectionGUID: EUDy9DWVTRyD8FwbQAXkjw==
X-CSE-MsgGUID: +OOmk2EjQKq17vy5p8ltSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232073"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:03 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:23 +0530
Subject: [PATCH [RFC] v3 2/7] drm/atomic/plane: create async flip property
 for plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-2-e7730c3fe9ff@intel.com>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
In-Reply-To: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 andrealmeid@igalia.com, naveen1.kumar@intel.com, ville.syrjala@intel.com, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

For the planes supporting async flip create the plane property for
enabling async flip.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_plane.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index ca51c87267662c11cee5f28276b2b941e1a87973..dd457cf37e0977298e026b014414c59764432032 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -498,6 +498,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 						   blob->base.id);
 	}
 
+	if (dev->mode_config.async_page_flip)
+		drm_plane_create_async_flip_property(plane);
 
 	return 0;
 }

-- 
2.25.1

