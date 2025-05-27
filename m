Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB41AC597C
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 19:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBD310E187;
	Tue, 27 May 2025 17:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="j2tzrQxn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9685010E187
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 17:57:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748368639; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gwimHX9XqzeAJDV/zd+IG2XotyVOfgpoSFdyDymnqce/jOWmhbKNIuPxpjcFO5rH/pzYe5lebBOjcmdonq4WxhZP31O+wzWAY+rtIKdJqrsgouDsCIkthzHR0MhVRgqByo4KhSSoMlFI9W6VRRAcTYsiu0euHhSjMu3vEucV37g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748368639;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=7OBjMWrGupcnVDTaEb5cuQtbsmhKT5VhtasjdYvma1c=; 
 b=KTz/4RTR+GPXPQ6GFBj5YCsFNtutQu2OTAZhv6PgPaCw5JUhc+S3W3vsbngGClPBH4GIOYP+0iPH4Xn8yNdm/pkwhheB+kVOWJjS481mVUGua3xEpMU1qwN9GqtNsmH8k+VnpqOf6VC5jmHAdvjd+/wT/htNeqHsAq6pHTxda7E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748368639; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=7OBjMWrGupcnVDTaEb5cuQtbsmhKT5VhtasjdYvma1c=;
 b=j2tzrQxnd8q/Flz5vlvRYcqQG9j3dXhpLQafbRRF+MgASy7c6HbzsT9iB564Pt+z
 A7/20CypbDY6aN8ZokIY8Jf6zr2sbkhs8k8JjO2BD09EQDW6Jgn6tpods2VhDgmeG/u
 xkD/R7foxz+zJZH5GZ6NpB4D9rumyxsPGlgoAYYs=
Received: by mx.zohomail.com with SMTPS id 1748368637146989.7128297385533;
 Tue, 27 May 2025 10:57:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 27 May 2025 19:57:08 +0200
Subject: [PATCH] drm/connector: only call HDMI audio helper plugged cb if
 non-null
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-hdmi-audio-helper-remove-fix-v1-1-6cf77de364d8@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPP8NWgC/zWNQQ6CMBQFr0L+2p/UCmq4imFR2qf8xFJsCyEh3
 N1G4nJmMbNRQhQkaquNIhZJEsYC51NFdjDjCyyuMGmlG9XoGw/OC5vZSeAB7wmRI3xYwE9Zub7
 02jqFa303VBJTRNG//KM7OOIzl0s+JPUmgW3wXnJbjVgz/0/U7fsX7BcHQ58AAAA=
X-Change-ID: 20250527-hdmi-audio-helper-remove-fix-43b2cd0e648a
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
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

On driver remove, sound/soc/codecs/hdmi-codec.c calls the plugged_cb
with NULL as the callback function and codec_dev, as seen in its
hdmi_remove function.

The HDMI audio helper then happily tries calling said null function
pointer, and produces an Oops as a result.

Fix this by only executing the callback if fn is non-null. This means
the .plugged_cb and .plugged_cb_dev members still get appropriately
cleared.

Fixes: baf616647fe6 ("drm/connector: implement generic HDMI audio helpers")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 05afc9f0bdd6b6f00d74223a9d8875e6d16aea5f..ae8a0cf595fc6fb11eecd820c7e8c5b75a746e18 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -103,7 +103,8 @@ static int drm_connector_hdmi_audio_hook_plugged_cb(struct device *dev,
 	connector->hdmi_audio.plugged_cb = fn;
 	connector->hdmi_audio.plugged_cb_dev = codec_dev;
 
-	fn(codec_dev, connector->hdmi_audio.last_state);
+	if (fn)
+		fn(codec_dev, connector->hdmi_audio.last_state);
 
 	mutex_unlock(&connector->hdmi_audio.lock);
 

---
base-commit: 502d44c1a440c5f428f50f02e58cd5633454ea8d
change-id: 20250527-hdmi-audio-helper-remove-fix-43b2cd0e648a

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

