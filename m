Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F47DB3F878
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55F4810E5DF;
	Tue,  2 Sep 2025 08:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="acf/IRqR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0940910E5DF
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4FFBD60209;
 Tue,  2 Sep 2025 08:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB278C4CEF8;
 Tue,  2 Sep 2025 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756801995;
 bh=kj637CfnoTBAP2JHnQ7FgGsKAbZI6lr9iDOVp8nZO54=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=acf/IRqRy1dKrnhfcpuPZZu44SXxfHaD14eBvgxd4JmMIxSlQ87quAx8LQubSh255
 GW1XQW7Zxil7fd5WdQnYdnzWn99MBI0mi4UYjS3wmmNvuM7S88IWe8P5hBknorwid8
 rc50C7zdWWy3mKnO9m4ZzwErsy6+xeJXJJmlVvBNNL/sF1eTQEFz9yYfPxZ3ivyMMh
 ARMNJLDp3SshojoG8Rx/xgCOuoa7cigmtaLmXDpa8RiH1SMuqlZG0DdAIjJpyYz+XI
 ZfSm/HjAd3JfCtuy57PAmXPAOtmrkbwWGdXSS8PCECrH2Yrtk6rxWToI6CG5JSLmWz
 6o1qq/79PfnVw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:30 +0200
Subject: [PATCH 02/29] drm/atomic: Fix unused but set warning in
 for_each_old_plane_in_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-2-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1285; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kj637CfnoTBAP2JHnQ7FgGsKAbZI6lr9iDOVp8nZO54=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGi2q7Wjc6mfQDqijIooGWom/m600NFGVJUGNt33Gto+wV8sg
 IiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmi2q7UACgkQJ1/OGaI9vnYnbQF/YvG2
 Mr1FKSJx5wr1GHBZJIDiihazgl00jO7Xszl0BjZNfpnxCVP6m2FEDiBw2jwBAX44O5ak4Zsn4aM
 gII9+PMoeUuQ6Dv892qnsDEffFrD+UnaaPoijyzSW5OF2wjpHG0E=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The for_each_old_plane_in_state() macro triggers a compiler warning if
the plane parameter passed to it isn't used in the code block.

Add a similar workaround than in most other macros.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..689a29bdeb4a06672ab6fffecb513d58ff6e07f9 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1053,11 +1053,13 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	for ((__i) = 0;							\
 	     (__i) < (__state)->dev->mode_config.num_total_plane;	\
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
 			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
  * @plane: &struct drm_plane iteration cursor
  * @new_plane_state: &struct drm_plane_state iteration cursor for the new state

-- 
2.50.1

