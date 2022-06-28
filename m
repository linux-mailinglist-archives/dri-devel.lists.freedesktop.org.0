Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0808255BD66
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 04:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEEB10F0CD;
	Tue, 28 Jun 2022 02:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9563A10F0CD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 02:22:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D37661856;
 Tue, 28 Jun 2022 02:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3379C36AF5;
 Tue, 28 Jun 2022 02:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656382977;
 bh=II5V8rlChEaxkbTfzU8c2e0+GO+md+FVXTxegTAgFtM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lsATHVRsykbte+uNOXIqLB+7a+zb5qRIrWxFs7Atq/sipBi/cKQcRpe/bBhF3/1j2
 NKIshmJDJ7YI7M62kOaBdYAvfiJeTkG9+vO0xovVNyMViFkjevWqpKrFFl0Jrcj8Op
 AQqDuFlVETqu08tThGtZqb6ZwX+i9hA0Tpl5WOn7vP+Cg3dsaU/p0cH2Cstaze+r0j
 WE5/+l33E9W3GCZBKj208LNfXz+HRE8P64VD3DRXH2RgN4hWwcWJsXm93DA1WI3GZZ
 8J9hnpg4p+pFB6ZHLWd68bYREi8NQMgst4kZDGSp57uQfoLnkmcO0TTbu4/CanS4Mt
 Ro9GG5FueAEQQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/34] drm/vc4: crtc: Use an union to store the
 page flip callback
Date: Mon, 27 Jun 2022 22:22:14 -0400
Message-Id: <20220628022241.595835-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, emma@anholt.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maxime Ripard <maxime@cerno.tech>

[ Upstream commit 2523e9dcc3be91bf9fdc0d1e542557ca00bbef42 ]

We'll need to extend the vc4_async_flip_state structure to rely on
another callback implementation, so let's move the current one into a
union.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Link: https://lore.kernel.org/r/20220610115149.964394-10-maxime@cerno.tech
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index f4ccca922e44..c0332b69d22c 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -694,17 +694,17 @@ struct vc4_async_flip_state {
 	struct drm_framebuffer *old_fb;
 	struct drm_pending_vblank_event *event;
 
-	struct vc4_seqno_cb cb;
+	union {
+		struct vc4_seqno_cb seqno;
+	} cb;
 };
 
 /* Called when the V3D execution for the BO being flipped to is done, so that
  * we can actually update the plane's address to point to it.
  */
 static void
-vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
+vc4_async_page_flip_complete(struct vc4_async_flip_state *flip_state)
 {
-	struct vc4_async_flip_state *flip_state =
-		container_of(cb, struct vc4_async_flip_state, cb);
 	struct drm_crtc *crtc = flip_state->crtc;
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -743,6 +743,14 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 	up(&vc4->async_modeset);
 }
 
+static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
+{
+	struct vc4_async_flip_state *flip_state =
+		container_of(cb, struct vc4_async_flip_state, cb.seqno);
+
+	vc4_async_page_flip_complete(flip_state);
+}
+
 /* Implements async (non-vblank-synced) page flips.
  *
  * The page flip ioctl needs to return immediately, so we grab the
@@ -813,8 +821,8 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	 */
 	drm_atomic_set_fb_for_plane(plane->state, fb);
 
-	vc4_queue_seqno_cb(dev, &flip_state->cb, bo->seqno,
-			   vc4_async_page_flip_complete);
+	vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
+			   vc4_async_page_flip_seqno_complete);
 
 	/* Driver takes ownership of state on successful async commit. */
 	return 0;
-- 
2.35.1

