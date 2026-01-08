Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C31D01E7F
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 10:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FD510E6E4;
	Thu,  8 Jan 2026 09:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4cPoHTA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282B10E6DE;
 Thu,  8 Jan 2026 09:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767865524; x=1799401524;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=PJ1YeZPHXRZFKuD9o0jlPfDlSub58UVNGRK4ZIDCgx0=;
 b=J4cPoHTAfS1JXpZszl2FYNu86a1yMRnZuG1q/CHH1CYjZZQtgsfQ+FlN
 GuItiVyYQ+Stl4tqsWUZwgk+y+KDTagLJB6uHbJgNNLDLiSxgDUr/GMCS
 8AkzMJ9ixgPBDfgW7l6XDkwfpyEZKZWpPDhxubSaXmEmEDkM9oKEfDCI/
 pDEGqUw/WEE7rIhSRIQH+aAg54rRE2ATMkHOMGX43HXDkOCHKNZObie6K
 RnPzQnJF3q3MVDWaN1K/rCdY0JSJMxDzmRU7H1kUMoXM6D3I7rZxvjoZZ
 cI+FbwBsUORH1gq3+ZL1i5wXmYQT55eSJh9PiYrSjG6bQhBnz8+DZZYIv A==;
X-CSE-ConnectionGUID: h+Bo4MbIQnKBv54PZ+25eQ==
X-CSE-MsgGUID: QjlLTLZKShWRs7xyG6If0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="72876607"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="72876607"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 01:45:24 -0800
X-CSE-ConnectionGUID: gUHGIc1FTV6B63s0eXcZ+w==
X-CSE-MsgGUID: V9ZzUbYOTOG0quQU1/4zFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="208232176"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 01:45:19 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 08 Jan 2026 15:13:26 +0530
Subject: [PATCH [RFC] v3 5/7] drm/atomic: Allow planes with NULL fb along
 with async flip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-async-v3-5-e7730c3fe9ff@intel.com>
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

Along with async flip if there is a request to disable a sync plane by
providing a NULL fb allow them.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index fc938ea467e239edd6be77b7467c45ac8c8379fd..f0718a26e441ec1c9e118503936cb597211835e9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -718,7 +718,9 @@ static int drm_atomic_plane_async_check(const struct drm_plane_state *old_plane_
 	struct drm_crtc *crtc = new_plane_state->crtc;
 	struct drm_crtc_state *new_crtc_state = crtc->state;
 
-	if (!new_plane_state->async_flip)
+	if (new_crtc_state->async_flip && new_plane_state->fb == 0)
+		return 0;
+	else if (!new_plane_state->async_flip && !new_crtc_state->async_flip)
 		return 0;
 
 	/*

-- 
2.25.1

