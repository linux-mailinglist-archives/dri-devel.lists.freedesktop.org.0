Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 973FE8CAB98
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 12:14:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1B10E57F;
	Tue, 21 May 2024 10:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SXRsSih0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DF010E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 10:13:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 81E216212B;
 Tue, 21 May 2024 10:13:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D658AC2BD11;
 Tue, 21 May 2024 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716286438;
 bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=SXRsSih0Mj5GfwbMrS07ZwAtAkQmA0QjbNIddcx2ZflDqJJePZ8k01EWEfb9Xmvo5
 ckuIz70CYkEdHsxSgtGQOuNs+LiWc8ix2IYHoAnPbNZPIEivKrZ7ceUwQDaayvLOln
 rWLjFN0WaazcvSsUSSYzXplNZyT8HJeMszxa+o8srEj0AMt4t4BOc8k3fplDFAJdNd
 iWsgXhcWNzP66IATC71fSNJ8UZ7Fl2D6GHnTDscz8PuMBMOZOKK90MKL95aP3JSekn
 zWj+PU/bL/GH30xDfNKPm+yK+Z81R+i9D89paj7o3CzomfIuvabpTSaguCtXjsXJyA
 DR5rmaWNAhWgg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 21 May 2024 12:13:35 +0200
Subject: [PATCH v14 02/28] drm/mode_object: Export
 drm_mode_obj_find_prop_id for tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-kms-hdmi-connector-state-v14-2-51950db4fedb@kernel.org>
References: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
In-Reply-To: <20240521-kms-hdmi-connector-state-v14-0-51950db4fedb@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RHQ+M/X8yAIVLRtJQPx77FibueWozKcb1Cr3A01lM9s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDGk+xRelV+UeDr0cWyd+7C+LpjTDd2ExIaHwTbNmnT/7I
 dCSvX9tx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI6zXGWplitm8PPXpV7CPd
 PPe6f/0s+KLe8n3/8XjHChuvG12hn/WUnpte/OvD9+PzwdYvnPzMjPWV7GpGh81eP2NTWOph9mz
 ew9dHXd8f4XfMmRUsYW5dffSka5ub3pttYTU1P40y1FZ4VQMA
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

We'll need to use drm_mode_obj_find_prop_id() for kunit tests to make
sure a given property has been properly created. Let's export it for
tests only.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_mode_object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index 0e8355063eee..df4cc0e8e263 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -476,10 +476,11 @@ struct drm_property *drm_mode_obj_find_prop_id(struct drm_mode_object *obj,
 		if (obj->properties->properties[i]->base.id == prop_id)
 			return obj->properties->properties[i];
 
 	return NULL;
 }
+EXPORT_SYMBOL_FOR_TESTS_ONLY(drm_mode_obj_find_prop_id);
 
 static int set_property_legacy(struct drm_mode_object *obj,
 			       struct drm_property *prop,
 			       uint64_t prop_value)
 {

-- 
2.45.0

