Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA8AF6C35
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8E010E7E0;
	Thu,  3 Jul 2025 07:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kqA+ZFRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50710E7DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:57:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4F3E44498;
 Thu,  3 Jul 2025 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751529448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xor3CjGzOLPr9kT51iYNqi58nPlYRydTENN8kwzKB+s=;
 b=kqA+ZFRbFhdl7+v9Fqmdr92KU64nUi2uYmFQ4d5Dm0AUELC/5ZKqC3A6MpCw6gkezT7ZDr
 mBoafnbCkFR7asRx8uCpIr+51fdhu4zPMGyPL9kpJIDNnqRngj87U72dExRulO4Ev6AU0V
 yRAwdHXm81mtYstAzJd6l2UJBL1OeP+WapSAhTwXhKL4r3aKS9jHc04NbXTB8XIme/kT0v
 e3wIw6zO1ma+GVXaZprNyXWzIgdvwNpSd9CKe/BB/UMs5euPh/37QKKSHxRTFpyqGzPLlB
 cDKv8mBxe9/bn9Un7pr9bYF34D+MwDO9ZW5tptbB4wYGRyuw1cy1ATw+wW4K3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:57:01 +0200
Subject: [PATCH v7 5/8] drm/vkms: Add support for RGB888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-5-15fd8fd2e15c@bootlin.com>
References: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
In-Reply-To: <20250703-b4-new-color-formats-v7-0-15fd8fd2e15c@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2003;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2Jf/qjD85M4WSRxtEpGCluMxSP6BXTGF6SPxegmrRUA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfgKKG48v6367zrWTwGsloP2cj80JOQmpQVq
 Dnw875SqYmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34AAKCRAgrS7GWxAs
 4h0KEACCIhqNAH7+RDj0/9EkGBUS6qQUkMr8rWNDStAtmHPVE5jMc2ReNdDTZJyWCOxKj3ecv/2
 MhHIIBngLYJez1gDWAP6U96SgoqPlDfOYmI65TjWZnOom+JZBBh5Rpg/xPEVgRQXNVXlg71aT9m
 g6jIqwaKa9X3v5wh0jtDjhC52kHFUghaqBtD8lnbAmXWA9hFs3nPCkVkj4gn6+nLlSvy6yxlQKA
 SQfllCiBFTUbrPku1UxsuS0CujxmfSPIpKCEe0KwchIMBDkkdySmYU+ESj3XO8/cIDpsC08oXfn
 PiNTVYcHHkoaLwOQcKQKNmdohWXQnM7Buy8x0/LcHUp/R9HydDpOWIt48odsHUmkpAJUgUOUvoi
 w10gj0ziSUpF+JAsjt/ERKcNlo8ZtLWiG1paTNpnymUlcdLWK5u7ZskwU0S2OYzdO4EaK+hLdN/
 599HQDcU51VNJGeFYTZ0h0zE1DUUP+9J8eo4SE2wfkTZxaVc/DEPCxljGwtw67HTP3BuaSi4QwF
 atS7Jhoq40PzhgGzTnXYg9jbGNKD8xk+/v3EYAwcn7B/HRaU6tKKzCaW6CujCbcVU5Vi42Hyn5j
 KkvF2HfsnCMs0HuZk7/PpmFyaQ4VD4+zvlqf3IBAVmpUBXXbv3fhgWSFG88xRLa1ozCS1Lf4Jo0
 aKXg8Dzu5wqshRA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduleejfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptdeiveeiudehtddtgfethfduudefffduteekgeevueetudevheehieevtddttdeknecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlvghjrgguvgihvggvsehgohhoghhlvgdrtghomhdprhgtp
 hhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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

Add the support for:
- RGB888
- BGR888

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 7 +++++++
 drivers/gpu/drm/vkms/vkms_plane.c   | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index 544bb6795805..f1649d9bf430 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -455,6 +455,9 @@ READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
 READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
+READ_LINE_ARGB8888(RGB888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(BGR888_read_line, px, 0xFF, px[0], px[1], px[2])
+
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(ABGR16161616_read_line, px, px[3], px[0], px[1], px[2])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -676,6 +679,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XRGB8888_read_line;
 	case DRM_FORMAT_XBGR8888:
 		return &XBGR8888_read_line;
+	case DRM_FORMAT_RGB888:
+		return &RGB888_read_line;
+	case DRM_FORMAT_BGR888:
+		return &BGR888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_ABGR16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6e7597ab935d..9f34f3a18d8c 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -19,6 +19,8 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_RGBA8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_XBGR16161616,
 	DRM_FORMAT_ARGB16161616,

-- 
2.49.0

