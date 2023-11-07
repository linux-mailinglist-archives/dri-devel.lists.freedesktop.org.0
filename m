Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CBB7E3D84
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 13:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0A110E5A2;
	Tue,  7 Nov 2023 12:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E5E10E5A1;
 Tue,  7 Nov 2023 12:28:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 9E797B816AC;
 Tue,  7 Nov 2023 12:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFA1C433C9;
 Tue,  7 Nov 2023 12:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699360137;
 bh=glK+fc6SkALhklAyab2VVmEAZfVWmTE/zUuxVHevs6E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WZXCcPmCP2KeSiqARRh/OtK9GrpCcoSmaLcQhmf3/IYzD7RyREV66aTtYURC+MR9T
 b6Zx6y9qWQSLMKO5k1ccySvTCYjdMip4RD/7kEGB9r3kywg2Nh5hzd/NVEW46DScRj
 jblaV0exYwhRhd3JU0wAJr9GzcuEkEOf04ltrhysS85rqys1c6/y4z+SrZ/vAADHTi
 pUy+shgzeCWFZ4TJDvU6a/E0arrB3gVTn22W3Sikv66vCAabWhyv3QCDbpkFavRVDw
 zrbouVo4UTRl6uaGwB/TQM7f79YHzwc64D22fmdi/8GRdZRFpu5bC3KPeesT5kfJ6l
 zvM2uvHQcwgfg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 19/25] drm/radeon: fix a possible null pointer
 dereference
Date: Tue,  7 Nov 2023 07:26:58 -0500
Message-ID: <20231107122745.3761613-19-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107122745.3761613-1-sashal@kernel.org>
References: <20231107122745.3761613-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.61
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com,
 Ma Ke <make_ruc2021@163.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ma Ke <make_ruc2021@163.com>

[ Upstream commit 2c1fe3c480f9e1deefd50d4b18be4a046011ee1f ]

In radeon_tv_get_modes(), the return value of drm_cvt_mode()
is assigned to mode, which will lead to a NULL pointer
dereference on failure of drm_cvt_mode(). Add a check to
avoid null point dereference.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index f7431d2246044..5837af5123a9f 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1122,6 +1122,8 @@ static int radeon_tv_get_modes(struct drm_connector *connector)
 	else {
 		/* only 800x600 is supported right now on pre-avivo chips */
 		tv_mode = drm_cvt_mode(dev, 800, 600, 60, false, false, false);
+		if (!tv_mode)
+			return 0;
 		tv_mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 		drm_mode_probed_add(connector, tv_mode);
 	}
-- 
2.42.0

