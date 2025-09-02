Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5FAB3F879
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9BD10E5E0;
	Tue,  2 Sep 2025 08:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GSvf1ZRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A5910E5E0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 26FB060211;
 Tue,  2 Sep 2025 08:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFD8C4CEF8;
 Tue,  2 Sep 2025 08:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756801998;
 bh=tgHDqH0C2lxD8T1iP02FKrEoh+NLndcjoc9fVjgWywI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=GSvf1ZRW043A+UcKUKqeHcK77lMflTHce9vslIVN6tX0h1WQO7X+d209fBd0Fg5IB
 mb/L0aSOeNYDVIur9m57FnCU92BZ0JrLft879cwqD92WY6N2hPon0s7bAOA3op+Lr6
 JJzOqHDthW9vi5gGk7FjvnV8QF1jlNc/cTww3IkFSg1s9ghvysA+OweXqhRESDrr6N
 hvG3bbz0RSc7qbckco5LgeUYnM3pLSguRa/5XZ1e9sUBT8cJdvVRL2QUtKIU4TSqWK
 40+vu2Y7OQ/gCkRLJNluhS94ExUYV+uIzoneeW3pZUB04l0Pf1L24vBfow5oBdTdyg
 +WMEOwSswVOJw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:31 +0200
Subject: [PATCH 03/29] drm/atomic: Fix unused but set warning in
 for_each_old_private_obj_in_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-3-14ad5315da3f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=mripard@kernel.org;
 h=from:subject:message-id; bh=tgHDqH0C2lxD8T1iP02FKrEoh+NLndcjoc9fVjgWywI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVm/1EHQJlu5+OudfzbIK1pk3de3eV6Y8jkm6vfZ7s
 utU1bDqjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRzdKMDW84hRw38p3z4nR9
 stLG/9DDWVL+Jf4/erjupE784eMhoXM3W7rG9Op/0WVOgTFvf98WYazTY+H4YOQZmega/d87P32
 3bpzdmlSHw6vqT/sGsxU5WPF1nhZb/0Kf3dDcfm7ogb573wE=
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

The for_each_old_private_obj_in_state() macro triggers a compiler
warning if the obj parameter passed to it isn't used in the code block.

Add a similar workaround than in most other macros.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 include/drm/drm_atomic.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 689a29bdeb4a06672ab6fffecb513d58ff6e07f9..f13f926d21047e42bb9ac692c2dd4b88f2ebd91c 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1112,10 +1112,11 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
  */
 #define for_each_old_private_obj_in_state(__state, obj, old_obj_state, __i) \
 	for ((__i) = 0; \
 	     (__i) < (__state)->num_private_objs && \
 		     ((obj) = (__state)->private_objs[__i].ptr, \
+		      (void)(obj) /* Only to avoid unused-but-set-variable warning */, \
 		      (old_obj_state) = (__state)->private_objs[__i].old_state, 1); \
 	     (__i)++)
 
 /**
  * for_each_new_private_obj_in_state - iterate over all private objects in an atomic update

-- 
2.50.1

