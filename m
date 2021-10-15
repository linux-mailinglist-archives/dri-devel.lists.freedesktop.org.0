Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C5E42F0A3
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B6B6ED1A;
	Fri, 15 Oct 2021 12:22:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-6.mailo.com (ip-16.mailobj.net [213.182.54.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BE3893A7;
 Fri, 15 Oct 2021 12:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=net-c.es; s=mailo;
 t=1634297878; bh=6xsMxrnlNAEGEZg8rndfdmRmdX7OzFdxIK93N1Vj41A=;
 h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding;
 b=we7kd11KwZdcLgjjMJ1n8lRK3fDo19zH5H+Og0L2UPlokGtiTJopm6QnuLH4EOJht
 5HKLpcVo/mrtaM9O2pFNc33mi87Z4mE8ojMtrKoX5FL/aMy8x0EaKcRuy6pmDm38xd
 3hp0rY2XF9DIZ7sekQiL4y9PNSj7QVLoGHQK6q1I=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Fri, 15 Oct 2021 13:37:58 +0200 (CEST)
X-EA-Auth: I5yQV9m0ki9AV0UNNSJrv4h5p+a5jWS8S9ncIuKRt6xVG9l52oNHyLPXAl57MxkXxJHTp5hqDR4r6ZsIbzO0j0sAaB99p+vk
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
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, heiko@sntech.de,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org
Cc: Claudio Suarez <cssk@net-c.es>
Subject: [PATCH 05/15] drm/tegra: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
Date: Fri, 15 Oct 2021 13:37:03 +0200
Message-Id: <20211015113713.630119-6-cssk@net-c.es>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211015113713.630119-1-cssk@net-c.es>
References: <20211015113713.630119-1-cssk@net-c.es>
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

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi. Retriving the same information with
drm_detect_hdmi_monitor() is less efficient. Change to
drm_display_info.is_hdmi

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/tegra/hdmi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..21571221b49b 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -831,14 +831,10 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
-	struct edid *edid;
-
 	if (!output->connector.edid_blob_ptr)
 		return false;
 
-	edid = (struct edid *)output->connector.edid_blob_ptr->data;
-
-	return drm_detect_hdmi_monitor(edid);
+	return output->connector.display_info.is_hdmi;
 }
 
 static enum drm_connector_status
-- 
2.33.0



