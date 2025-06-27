Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAE4AEB340
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DDE10E9A7;
	Fri, 27 Jun 2025 09:48:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GoDTQxz2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095FE10E9A1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:02 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 478CB5867F2
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6330D438CE;
 Fri, 27 Jun 2025 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751015571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZkYzGTzKnCPxgrG7djfdUXqx/RAJvRaE5dNYS/hgmd4=;
 b=GoDTQxz28A9pL5zDDp7/KGZaR53WHWIvuryBJA7kQhNM4QZV1pmhZ8J7dkV58DZWnSkXTh
 xPVIKISbpTNyd2obbPK8A/PvXOfUxS4aea5BpM+8x6VXzBiLP+lr6NjrcMIsc0OimAuM23
 0sQnSDD5xit+W7yqSX2Xj24v3ttfDKE1mPQZ/VIcufCS2OvMNqMr4RC1r7rqNCx7cGlus6
 OUfJ55RaDNvQaqzO4aBPLszGG9LT+okawlyghgk6w9q1IzxfmQR9Jiv9UWb1XjuLDikzu/
 eRG9XqJu+1N+9WA7h24eKBsHl617czzggwZ92AHe6GlswzAEQ/Qo9vg8uQElOA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 27 Jun 2025 11:12:33 +0200
Subject: [PATCH v5 2/8] drm/vkms: Add support for ARGB8888 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-b4-new-color-formats-v5-2-94452f119c72@bootlin.com>
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VluQZsu6hTa2k+QlWONlhO7+C7gKk5KEXpvKGgiQlG4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCMYJpSPP1kl8SWM9D5a4s3g3mhROxI4sFJx
 2nLo0P9R3WJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5gjAAKCRAgrS7GWxAs
 4hqsD/9Wpm6cdjmTUQnvJTDkkt81EWeUxnLhESpjW2WJuT/MNoRTUSwf/SBHD5hbxEd2NAUtcz2
 a2RUe6YkAKnsFuPxVHx3HZkX6Rfwn/SIPH4GtRsfAX/ldOdoYUydHae4PkSesRKZYN7RhavRX5s
 Kzfk/cD2chB0hBIy8ta2dTvlnlxqp58O7nPvqN/waXmKZckF8GvqYhjUoyG7wzCWILkkxPvtHhO
 iav5McorffbcrMP0MDvnKGlpTqFZtI+Hn9eTERXVzNJpj/QYdN/wfKINeHET0C5YFwU04hXkKlr
 8te3xdDQ+p3GWOxegGIb3XsQD0nqlA/Ax/t5Th2q7xR15w/jaeHDQv3YX65Xo5Ijy30flp7WbTM
 VCO9EQCRPe83+shWev3t5jqp+ijhieytZgSDwM33fiZv1bBc3FhdTZ6ZczshtYPiolqzoNG0k9T
 KBID9ujUsrLFslJ0rX83MzFnsPvrMPfLHn1wrCCSBGN7rgqP5jSfcHZ6TOQmx48YF7SHhPo/Gl/
 CLD2Kys8Glv3oj+RWo2sfGI/jNF84x5TXdtIZshVcRA4dn1VDHL2TeVdsDFTid36SZ9gaz1HQVY
 I8V7dknmwoYJtUhM7OQwiWV1TtZ8mnl3L013EpbGbth1+bcV2FjXxwSkrpzh8OfO2XY+enmGnR+
 ZeZ8QMrUzBLRHaw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduledprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepshhiqhhuvghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrrhhthhhurhhgrhhilhhlohesrhhishgvuhhprdhnvghtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtt
 hhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjvghrvghmihgvrdgurghuthhhvghrihgsvghssegsohhothhlihhnrdgtohhm
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

The formats XRGB8888 and ARGB8888 were already supported. Add the
support for: - XBGR8888 - RGBX8888 - BGRX8888 - ABGR8888 - RGBA8888 -
BGRA8888

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++--
 drivers/gpu/drm/vkms/vkms_plane.c   |  5 ++++-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index a9c624081dac..231b327e86b3 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -432,9 +432,12 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
 
 
 READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
+READ_LINE_ARGB8888(XBGR8888_read_line, px, 0xFF, px[0], px[1], px[2])
 
 READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
+READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
+READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
 
 READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
 READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
@@ -644,10 +647,16 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 	switch (format) {
 	case DRM_FORMAT_ARGB8888:
 		return &ARGB8888_read_line;
-	case DRM_FORMAT_XRGB8888:
-		return &XRGB8888_read_line;
 	case DRM_FORMAT_ABGR8888:
 		return &ABGR8888_read_line;
+	case DRM_FORMAT_BGRA8888:
+		return &BGRA8888_read_line;
+	case DRM_FORMAT_RGBA8888:
+		return &RGBA8888_read_line;
+	case DRM_FORMAT_XRGB8888:
+		return &XRGB8888_read_line;
+	case DRM_FORMAT_XBGR8888:
+		return &XBGR8888_read_line;
 	case DRM_FORMAT_ARGB16161616:
 		return &ARGB16161616_read_line;
 	case DRM_FORMAT_XRGB16161616:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3fdd161d0f0..01fed722808b 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -14,8 +14,11 @@
 
 static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_RGB565,

-- 
2.49.0

