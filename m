Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266BFBAC97A
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 13:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4210E571;
	Tue, 30 Sep 2025 11:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bCnhxISn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FB810E573
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 11:00:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D8586408FD;
 Tue, 30 Sep 2025 11:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A180C4CEF0;
 Tue, 30 Sep 2025 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759230024;
 bh=NKvNmSTTCnghBZoltgtUc5cpRPp86DtJzcHKSw4Ef/Y=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=bCnhxISnQE1HEXFRSKMkEQ5yFkFNLCwwxPXfQRtZMxZ/RRnuNboiQKLKFEn5/TZu9
 CV9byeiaN0rColB8sq9poKxnqumvoDWO121l+DGS5MmxpOZGY4MqPhPAbRFaErsYNo
 V6K7SbNwNRxN32Dbcn0rj/qQWX4nhCjXgEvtHDcg9ZUBWLIjlYVA5k+GJEP/D8dRoZ
 vOpy90h3gvawvHbwBZDNCW99aRjiRx5uNC49BUGt6iViZCWsnlu1B7sQX/31ZB7QKk
 0jEdot+nRr81t2oer/oQDxAMO2pw7G0hiI7O1ohU8G4bUifwnt274c+sXzPpnRxXcf
 b62SqZZMzq6KQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 30 Sep 2025 12:59:22 +0200
Subject: [PATCH v5 07/39] drm/tilcdc: crtc: Use
 drm_atomic_helper_check_crtc_primary_plane()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-drm-no-more-existing-state-v5-7-eeb9e1287907@kernel.org>
References: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
In-Reply-To: <20250930-drm-no-more-existing-state-v5-0-eeb9e1287907@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NKvNmSTTCnghBZoltgtUc5cpRPp86DtJzcHKSw4Ef/Y=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBm3dyiVT1+0QWFib9fZ0HkM1y8fsWnUZPzJseaei3x/0
 8rrdpuPdExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJHGdmbHiWIRKd3/5XqKyw
 9VT+lTvzVBXFxKXMXDQci3+6/+Pc4usf8Lhq59pNAt4RH07q+0n2M9Z7firlZu3seBaf2DBb7k7
 KKwsDH5f3hWvMPzZWZN6qrr16K1pW69+tuqUyr6eViAh/NgcA
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

In the tilcdc_crtc_atomic_check(), the tilcdc driver hand-crafts its own
implementation of drm_atomic_helper_check_crtc_primary_plane(). And it
does so by accessing the state pointer in drm_atomic_state->planes which
is deprecated.

Let's use the right helper here.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Acked-by: Jyri Sarha <jyri.sarha@iki.fi>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Jyri Sarha <jyri.sarha@iki.fi>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index b5f60b2b2d0e72ae8ec0f3f4e5e85bc5004e6e5b..5718d9d83a49f38081aabbc9860847bdc83cf773 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -674,18 +674,11 @@ static int tilcdc_crtc_atomic_check(struct drm_crtc *crtc,
 									  crtc);
 	/* If we are not active we don't care */
 	if (!crtc_state->active)
 		return 0;
 
-	if (state->planes[0].ptr != crtc->primary ||
-	    state->planes[0].state == NULL ||
-	    state->planes[0].state->crtc != crtc) {
-		dev_dbg(crtc->dev->dev, "CRTC primary plane must be present");
-		return -EINVAL;
-	}
-
-	return 0;
+	return drm_atomic_helper_check_crtc_primary_plane(crtc_state);
 }
 
 static int tilcdc_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct tilcdc_crtc *tilcdc_crtc = to_tilcdc_crtc(crtc);

-- 
2.51.0

