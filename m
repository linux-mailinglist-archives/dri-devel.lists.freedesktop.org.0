Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B795BC65E47
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 20:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB9010E103;
	Mon, 17 Nov 2025 19:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="J7bMahNJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B8110E103
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 19:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763406762; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hrm+qKgW/rySYKUswoBT/MbdkDO6GqmBUPMxXuPc4hiuAzKiKmQbzkZvPLN3d/o5mHPGZHyMWx7uFdr8CMRYp3Umha7Bt4btZM18IQpTpGCfXVO1xMD2C9pCJWLcselh40lw/n3tjDwA2wTbvMIksSTdqzRpwJ5yxeGIl8KD28w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763406762;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Wl+Rgi87r48WhXQHR78kVLoSBu5iwS2wv+pKzPrF8ig=; 
 b=F8dcbuaN3E6mgwEs42uhNTVYhp+Em/q41SIAemz7vPn0dn39KT4+AmzlfyeU5SNyYR+/APcvDdI35Mx19+SUTY3bUKKG5nyBEA08laItInIqOmDTR6jQdFOZMhIQjNHQsI0kdZk9/ktMFmHMjWOnXj5Ql3yzGsWrYqVTzs3w7z8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763406762; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Wl+Rgi87r48WhXQHR78kVLoSBu5iwS2wv+pKzPrF8ig=;
 b=J7bMahNJZxwspv9ecDqh3gRSiMywGJUNMFlvEbFO6EWe0xu+m7PAIEd7b5gB+KJL
 cxRrCU72paetabfqXpFuKi4QjSWmkSS7fX2h6NeM84Ywfdk0tewhsdVa3LPbs9VTM3n
 HP3kq3F6rVEgvq7abK2Pc7v+Vk+Ys8tRTfy/KTmg=
Received: by mx.zohomail.com with SMTPS id 1763406759575712.9921053494943;
 Mon, 17 Nov 2025 11:12:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 17 Nov 2025 20:11:47 +0100
Subject: [PATCH v4 03/10] drm: Add enum conversion from/to HDMI_COLORSPACE
 to DRM_COLOR_FORMAT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-color-format-v4-3-0ded72bd1b00@collabora.com>
References: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
In-Reply-To: <20251117-color-format-v4-0-0ded72bd1b00@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Marius Vlad <marius.vlad@collabora.com>
X-Mailer: b4 0.14.3
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

From: Marius Vlad <marius.vlad@collabora.com>

This would please the compiler to have a enum transformation from one to
another even though the values are the same. It should also make things
obvious that we use different enums.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 18 ++++++++++++++++++
 include/drm/drm_connector.h     |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 0ad7be0a2d09..61c077b67ac3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1384,6 +1384,24 @@ drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum)
 	}
 }
 
+enum hdmi_colorspace
+color_format_to_hdmi_colorspace(enum drm_color_format fmt)
+{
+	switch (fmt) {
+	default:
+	case DRM_COLOR_FORMAT_AUTO:
+	case DRM_COLOR_FORMAT_RGB444:
+		return HDMI_COLORSPACE_RGB;
+	case DRM_COLOR_FORMAT_YCBCR444:
+		return HDMI_COLORSPACE_YUV444;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		return HDMI_COLORSPACE_YUV422;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		return HDMI_COLORSPACE_YUV420;
+	}
+}
+EXPORT_SYMBOL(color_format_to_hdmi_colorspace);
+
 /**
  * drm_get_color_format_name - return a string for color format
  * @colorspace: color format to compute name of
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index a071079fd3ad..e044976c8d76 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2586,6 +2586,9 @@ drm_color_format_to_color_format_enum(enum drm_color_format fmt);
 u32
 drm_color_format_enum_to_color_format(enum drm_color_format_enum fmt_enum);
 
+enum hdmi_colorspace
+color_format_to_hdmi_colorspace(enum drm_color_format fmt);
+
 /**
  * drm_for_each_connector_iter - connector_list iterator macro
  * @connector: &struct drm_connector pointer used as cursor

-- 
2.51.2

