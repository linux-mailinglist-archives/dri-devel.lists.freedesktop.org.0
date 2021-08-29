Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5D3FAD24
	for <lists+dri-devel@lfdr.de>; Sun, 29 Aug 2021 18:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA0489E15;
	Sun, 29 Aug 2021 16:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FB789E15;
 Sun, 29 Aug 2021 16:46:27 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 534B23F07E; 
 Sun, 29 Aug 2021 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630255584;
 bh=/glC/Zr2Yum31WUjvWeKRvl5aOrxqgWHFdI8zR2w0oE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=aYdeTekWHuWLpZ0NvfmCtzdzQeaO9SVV8L8K0KZQqoAKpqed6/h7fMZPcJ1HZbdiI
 Hy9TKT8k0YD4bjq0YILmg8iMCPiAt2fSAanoZJ/6hceoxihoQrHmoZMU5uQROtS2rg
 hr/VqIUSgVrHbLGimZF95S40pwZ2S1cJ0Vbdf3UD3EZ0dlrh27sUSoAElOy9zZTa+O
 /j6NoSZHR5pznsZvi81CywwNsPEIqXHacM7HtDgpK0VRdnduVaKdCy0uv+iJVw+/q0
 Z9X0Npomu/CwslDQb7gAX1D63HhWBCuX+DOTww2KCbjreUp4G2LERR4zJ2f/xtEWd6
 2a8RBzmas7YTQ==
From: Colin King <colin.king@canonical.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui.Pan@amd.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amd/display: Fix unused initialization of pointer
 sink
Date: Sun, 29 Aug 2021 17:46:24 +0100
Message-Id: <20210829164624.531391-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

Pointer sink is being inintialized with a value that is never read,
it is later being re-assigned a new value. Remove the redundant
initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e1e57e7465a7..9331c19fe9cb 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -10917,7 +10917,7 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 	struct amdgpu_dm_connector *amdgpu_dm_connector =
 			to_amdgpu_dm_connector(connector);
 	struct dm_connector_state *dm_con_state = NULL;
-	struct dc_sink *sink = amdgpu_dm_connector->dc_sink;
+	struct dc_sink *sink;
 
 	struct drm_device *dev = connector->dev;
 	struct amdgpu_device *adev = drm_to_adev(dev);
-- 
2.32.0

