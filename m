Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E52B35D2
	for <lists+dri-devel@lfdr.de>; Sun, 15 Nov 2020 16:39:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C124589DC0;
	Sun, 15 Nov 2020 15:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2089DC0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Nov 2020 15:39:17 +0000 (UTC)
Date: Sun, 15 Nov 2020 15:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605454755;
 bh=dXC3rmPqEFXxolZ/OrEnQPfXC6VMowVzkn8gYuCisNM=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=e8HhJA+1u418hzXEUgeZKlYEVzEbf5fFvJ8SoZvR6JcXrpO7ISg8bS0HBJN9bzof5
 nF//VHDm8md8kRojKiV23h36a0QOo3pAcW1GrJC2jtqZhGIkeXwPuSjwvliCymWdJk
 F6RPBqAlP1f3twLMVaQMRLPNXroprhswxKDqyYzIyydet9r6pb1ppQqhlxUWF8HTOS
 mduP9JN/qNj5pMPIZQOr9KjhD/KOAsv+CTo8OHp/gQ6TuO1j8yByls6pTTeTZfyBFo
 8FuJNDhyRb6mx6bktI/z3IZNdALW+tdf3kwTx1/pmpCxo9tvz4N8n5nzDmIoDWCQSN
 +CaqPcNooPz8Q==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH] drm: fix oops in drm_atomic_set_crtc_for_connector
Message-ID: <7xhyNYrWtzUIt3HNrWfi9iScW0k475RZiKNfF5TbPs@cp4-web-031.plabs.ch>
In-Reply-To: <20201115153139.24369-1-chris@chris-wilson.co.uk>
References: <20201115153139.24369-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

crtc can be NULL. connector, extracted from conn_state, can't.

Fixes: e3aae683e861 ("drm: convert drm_atomic_uapi.c to new debug helpers")
Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9df7f2a170e3..268bb69c2e2f 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -334,12 +334,12 @@ drm_atomic_set_crtc_for_connector(struct drm_connector_state *conn_state,
 		drm_connector_get(conn_state->connector);
 		conn_state->crtc = crtc;
 
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(connector->dev,
 			       "Link [CONNECTOR:%d:%s] state %p to [CRTC:%d:%s]\n",
 			       connector->base.id, connector->name,
 			       conn_state, crtc->base.id, crtc->name);
 	} else {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(connector->dev,
 			       "Link [CONNECTOR:%d:%s] state %p to [NOCRTC]\n",
 			       connector->base.id, connector->name,
 			       conn_state);
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
