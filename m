Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA043044D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 20:43:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED76E497;
	Sat, 16 Oct 2021 18:42:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB2F6E48D;
 Sat, 16 Oct 2021 18:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634409760; bh=uuIT5sIGiM41ZxesdxWnWDZbyFiOv+uiIKfgEAa+79g=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=IPIoKFx0JxVdsmzJPgBTvp6QG6KTtYTPJ7FOH9QHT8JCko3JXW8wBt0Y9GQMPgmT/
 FJiNf3KB1I56GHgZcgPxghVdtS98Hxxq0mv4+WyBq+oh3pabDHL5Vy8dxix4dtYa90
 vsoFDglbVlDzDBoSw/bmcFcZ1L61FCkvKuHaXHd8=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 16 Oct 2021 20:42:40 +0200 (CEST)
X-EA-Auth: XgZ+C9JXLspqcHF7gvV4o69gypOR8PoGzuWho0tgdXFOzw77zQtKGq6mnlQ6WYFfnvD7kDmgRao0vHJ/+OHWE4uibMILq82P
From: Claudio Suarez <cssk@net-c.es>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Emma Anholt <emma@anholt.net>,
 Maxime Ripard <mripard@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, ville.syrjala@linux.intel.com
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH v2 01/13] gpu/drm: make drm_add_edid_modes() consistent when
 updating connector->display_info
Date: Sat, 16 Oct 2021 20:42:14 +0200
Message-Id: <20211016184226.3862-2-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211016184226.3862-1-cssk@net-c.es>
References: <20211016184226.3862-1-cssk@net-c.es>
MIME-Version: 1.0
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

According to the documentation, drm_add_edid_modes
"... Also fills out the &drm_display_info structure and ELD in @connector
with any information which can be derived from the edid."

drm_add_edid_modes accepts a struct edid *edid parameter which may have a
value or may be null. When it is not null, connector->display_info and
connector->eld are updated according to the edid. When edid=NULL, only
connector->eld is reset. Reset connector->display_info to be consistent
and accurate.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_edid.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..c643db17782c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5356,14 +5356,13 @@ int drm_add_edid_modes(struct drm_connector *connector, struct edid *edid)
 	int num_modes = 0;
 	u32 quirks;
 
-	if (edid == NULL) {
-		clear_eld(connector);
-		return 0;
-	}
 	if (!drm_edid_is_valid(edid)) {
+		/* edid == NULL or invalid here */
 		clear_eld(connector);
-		drm_warn(connector->dev, "%s: EDID invalid.\n",
-			 connector->name);
+		drm_reset_display_info(connector);
+		if (edid)
+			drm_warn(connector->dev, "%s: EDID invalid.\n",
+				 connector->name);
 		return 0;
 	}
 
-- 
2.33.0



