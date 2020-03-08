Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BC617DA60
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE846E2D3;
	Mon,  9 Mar 2020 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr
 [80.12.242.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DFE76E28A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 09:26:47 +0000 (UTC)
Received: from localhost.localdomain ([90.126.162.40]) by mwinf5d18 with ME
 id BlSf220010scBcy03lSf0d; Sun, 08 Mar 2020 10:26:44 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 08 Mar 2020 10:26:44 +0100
X-ME-IP: 90.126.162.40
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, Bhawanpreet.Lakha@amd.com,
 mario.kleiner.de@gmail.com, David.Francis@amd.com
Subject: [PATCH] drm/amdgpu/display: Fix an error handling path in
 'dm_update_crtc_state()'
Date: Sun,  8 Mar 2020 10:26:37 +0100
Message-Id: <20200308092637.8194-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'dc_stream_release()' may be called twice. Once here, and once below in the
error handling path if we branch to the 'fail' label.

Set 'new_stream' to NULL, once released to avoid the duplicated release
function call.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Maybe the 'goto fail' at line 7745 should be turned into a 'return ret'
instead. Could be clearer.

No Fixes tag provided because I've not been able to dig deep enough in the
git history.
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 97c1b01c0fc1..9d7773a77c4f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7704,8 +7704,10 @@ static int dm_update_crtc_state(struct amdgpu_display_manager *dm,
 
 skip_modeset:
 	/* Release extra reference */
-	if (new_stream)
-		 dc_stream_release(new_stream);
+	if (new_stream) {
+		dc_stream_release(new_stream);
+		new_stream = NULL;
+	}
 
 	/*
 	 * We want to do dc stream updates that do not require a
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
