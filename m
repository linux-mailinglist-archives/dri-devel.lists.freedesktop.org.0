Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29AD39BC1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 02:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9616610E307;
	Mon, 19 Jan 2026 01:12:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KUoTfDvG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C59B10E305
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 01:11:56 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b8718294331so56144166b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Jan 2026 17:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768785115; x=1769389915; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8+XechJIId3v9u+c/ggDmxy+XunBGz8iE7d4QwyvbM=;
 b=KUoTfDvGknsMxOSGiRA110K4piuuCMS6nYMzk7P5LVXKOwImHGtqpqRW+oIiDhCrVT
 MhyNywkK5bYpaMkzMCljCGpTc6QH0xNJNqYI80MNEHxfn+SdBlsJbzHBw6wGVMvyEMqc
 FomC+uL/74jIaUYsD4THj+sWjfyJjap3nsE8sNbvJEhU2uWJsL1iB/Jlpi3oZNvK7cf/
 9pphYUYOHN89uMTgibV3hzeG1cc09XadCCL3ROtDq3Gna+EtJSxyEtTNgYpY9M9fyzZL
 WjL0PCyabLlTuamXIHetD91ynd50ldJjc+JMF/5Pc6QPgXSzuQl6muHFbZiRSl5rk7me
 t1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768785115; x=1769389915;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y8+XechJIId3v9u+c/ggDmxy+XunBGz8iE7d4QwyvbM=;
 b=DuqKxqvO/4hA2HeEa38wIzbpURXfpAVngo8tLR8uwRL4lwWhBW7yRvKWySukAbw1w3
 ydqI3yE2/kN1pU0ZlYPgS5dcOAwZM80dNei3uX2EjImPsMBTiRb6vSj/K4hR/U4f1kvj
 Pf5O3h9KHHk2+hkG9dRhnlAtcPp2sIfr1rqcOaxB0AOkoGBqgb0bIhX3koabL1p2xPR1
 unzan19DpZbXwXOiVQk29Pmf9W9z/j1bgeGVTY4L4h2oHx47jV0xpF7ZLWdNmOgQjDsc
 4g659DlaNqSLW/ncFuYU+GamBkYo7DgXAUj2z3Tfq1IDPbUjDA+sRc6/HbC/7+AZHBxf
 8U+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpbDFmdPUwDEZWqETW7DFsPP4u29z6yB9Ph4H/ePU/TFZ+TO9emTAXOXw6eArV2sW3xS8CuWu+v1s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRLn+LH4ilsl9wBYi3RorH4vowBN8+FcgWKAjoEInv6W/PqkA4
 VIKNMmsmhRILjcIgbotjlf37dr5llhIHaqw8simlwVTDkaFL7MzwXOPD
X-Gm-Gg: AY/fxX6C8k2Fj1CBfziWzTjqIXjWT3B23wGnhrelPUIGp3coCkaTaGCcCwDl0JwqqRO
 XJN3KvX/o+dh/0Wxxee8EJW1FkeO8+CNpmBHqja4asgG4Mj3L1uLnqsT6dr4oeP2HLsXR+LF6PM
 OIVn95znFyOYLMN6ozEEkzJ+AhxAYctlRO2TfOJmXXu40QdWSBldpBLxhvbwUE41fDbryuUUBkR
 +IrRWJPEUudjDgjGDBr91FFYXIIe46S5SYWs6Hh7ViH8LgSlmEUsFoGwnzVSHDtjctRCRKIvwrA
 maWaHanaXVeKO+bxZZeo+sklMUNhW/Mtu65jw4mFxOzEXGemUT70wCz1TtcuZx+N9ko9DiZRGrZ
 Sdzmy7oaLDPaD/F9nozqnYGwfKuVDqJh1WJyE/LvCc8yq1X5cB9IFJ/v+JLcNZ0ob5YrcU/K6P+
 qUd6mUa/gZeAFtha+H3SZampTVYa5nwaxsFUta3+6sJi9cz/vzeDsdAkid0of9QUt/
X-Received: by 2002:a05:6402:5253:b0:647:9bdd:3211 with SMTP id
 4fb4d7f45d1cf-65452acc814mr4363238a12.4.1768785114650; 
 Sun, 18 Jan 2026 17:11:54 -0800 (PST)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4912sm8989806a12.30.2026.01.18.17.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 17:11:54 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: alexander.deucher@amd.com,
	harry.wentland@amd.com,
	sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, siqueira@igalia.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tomasz.pakula.oficjalny@gmail.com,
 bernhard.berger@gmail.com
Subject: [PATCH 04/17] drm/amd/display: Use bigger VRR range if found in AMD
 vsdb
Date: Mon, 19 Jan 2026 02:11:33 +0100
Message-ID: <20260119011146.62302-5-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
References: <20260119011146.62302-1-tomasz.pakula.oficjalny@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

[Why]
Some monitors only expose their full VRR range in AMD vsdb for some
reason.

[How]
Compare exposed ranges and use the bigger one.

This check could be merged with the previous one but it's better to keep
them separate to easily convey their meaning.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4177
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 69f3dbfe4ca3..37ab89532408 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -13204,6 +13204,18 @@ static bool copy_range_to_amdgpu_connector(struct drm_connector *conn)
 	return is_freesync_capable(range);
 }
 
+/**
+ * Returns true if range from AMD vsdb is bigger
+ */
+static bool compare_ranges(struct drm_connector *conn,
+			   struct amdgpu_hdmi_vsdb_info *vsdb)
+{
+	struct drm_monitor_range_info *range = &conn->display_info.monitor_range;
+
+	return (vsdb->max_refresh_rate_hz - vsdb->min_refresh_rate_hz) >
+	       (range->max_vfreq - range->min_vfreq);
+}
+
 /**
  * amdgpu_dm_update_freesync_caps - Update Freesync capabilities
  *
@@ -13277,6 +13289,10 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
 		if (valid_vsdb_cea && is_monitor_range_invalid(connector))
 			monitor_range_from_vsdb(connector, &vsdb_info);
 
+		/* Use bigger range if found in AMD vsdb */
+		if (valid_vsdb_cea && compare_ranges(connector, &vsdb_info))
+			monitor_range_from_vsdb(connector, &vsdb_info);
+
 		if (dpcd_caps.allow_invalid_MSA_timing_param)
 			freesync_capable = copy_range_to_amdgpu_connector(connector);
 
-- 
2.52.0

