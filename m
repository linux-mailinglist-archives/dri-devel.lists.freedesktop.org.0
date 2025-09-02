Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8BA2B3F892
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D881B10E5F6;
	Tue,  2 Sep 2025 08:34:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZR+P5tMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B0010E5F6
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:34:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 871FB41502;
 Tue,  2 Sep 2025 08:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18CFDC4CEED;
 Tue,  2 Sep 2025 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802048;
 bh=CJPCj8VWwLfpomy9Zok5G16ISXjah6HfvSiZNbxLUwg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZR+P5tMY49rlPeoRiqsLU64936WnRpKITzZdZVJL8FcfjK5Nu6cykFbn/PbAHNm/Z
 +cuIk4djsGxLuYOZnO4qujCTC149UOgHCTXfeFZtSX9x+HtCHuMyG8crUTNQV0L+0c
 shjPKFai7snEiizUOWGjCSR2+D3WjTKDCe4mR6gXbWbX8liL9t4wc4gPE8XielDaz4
 QLWEKDsFl6HuPbeNZf+dNrSYNTxReVPpR6T75+CvUF230b7ayDT89TehVcieRB8frJ
 gt2uqO+TPekQhjjF7DeANlcp/9yJfv/qyolBgJbZzMQRacLNEgbu3JvL2M/QLg4LGa
 NofaaLQIo6gUw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:50 +0200
Subject: [PATCH 22/29] drm/tidss: crtc: Cleanup reset implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-22-14ad5315da3f@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CJPCj8VWwLfpomy9Zok5G16ISXjah6HfvSiZNbxLUwg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVu/bOmdNXX9s+sodna/7Pwh8OVp9JnNPat4542ZLZ
 VGB99tOd0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHFjF2LDt+3u39Pk/Yous
 7sj8t4w/xvX3aBtnzKOTIadYP6+PZvJwOlz52rzs1fwdfvfUuNNEJzE2XJA1UXLt+fR69sTTeVW
 SZhcNLbwEXu1e5neFf9nDE5Mn/nkd9lFx9wZ+y5tdBT6+hW9aAQ==
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

The tidss_crtc_reset() function will (rightfully) destroy any
pre-existing state.

However, the tidss CRTC driver has its own CRTC state structure that
subclasses drm_crtc_state, and yet will destroy the previous state
by calling __drm_atomic_helper_crtc_destroy_state() and kfree() on its
drm_crtc_state pointer.

It works only because the drm_crtc_state is the first field in the
structure, and thus its offset is 0. It's incredibly fragile however, so
let's call our destroy implementation in such a case to deal with it
properly.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index eb431a238b11d22349d61f0e17f05994f50d5f2f..8fcc6a2f94770ae825eeb2a3b09856a2bf2d6a1e 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -355,13 +355,11 @@ static void tidss_crtc_destroy_state(struct drm_crtc *crtc,
 static void tidss_crtc_reset(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *tstate;
 
 	if (crtc->state)
-		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(crtc->state);
+		tidss_crtc_destroy_state(crtc, crtc->state);
 
 	tstate = kzalloc(sizeof(*tstate), GFP_KERNEL);
 	if (!tstate) {
 		crtc->state = NULL;
 		return;

-- 
2.50.1

