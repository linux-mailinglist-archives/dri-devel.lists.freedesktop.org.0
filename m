Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05888AF6C2E
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 09:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC8310E7DC;
	Thu,  3 Jul 2025 07:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BafqzH8a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF51E10E7DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 07:57:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFAF444476;
 Thu,  3 Jul 2025 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751529447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gbui+zYgLvZpZpjNwyeYSZBvW/EWcwkD+YwOnsrwh88=;
 b=BafqzH8aNQ0DZbQyvd64Uc8HkX/W8cQI19Aqm1iwDisNwX55yiary9cFmpbVNgWGgBQ6JL
 1P81EpnEKIKWh1DNVTHyTt/UZ89JjOyK5SK6U7EtIU9Qy+PjnyJyqaP/ZjrUk8mW9zIt8o
 hZf7KLtih6YeZKRix1dy2CV09lRWITrNbK2QxEfzxqZ7Qy7HYtwr86FXk2kIZUDabctPP2
 Btvxfy/MCg6BVJoBpXQoWIKZwUL2H8lE3A2dOfz1IbWzSgc9L3Seyi6bPzv4sOI8sOqkYq
 z5/zzgcMgPdYH+m8uoJQczudv+2J5ny58wEacTZ9dLmuo7dRk+wYaF/OrMbcvw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 03 Jul 2025 09:57:00 +0200
Subject: [PATCH v7 4/8] drm/vkms: Add support for RGB565 formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250703-b4-new-color-formats-v7-4-15fd8fd2e15c@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2212;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y3S+U+2h2DJbwzQKp5+x7Wemr7UdoP66AqsKzkGXz9M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoZjfgSi/ZxuCgSAMffo7hkKw1IMo3O1sHetqj5
 uIWd2ePfI2JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaGY34AAKCRAgrS7GWxAs
 4kXVEACbwC7owWcjQUz+oeqc3QLJPhir3zQGBxlL8ZRw/8tp5DFaxQH8tvKd1k+DlkwSyCWGFsa
 vbqniIPlUEm3TcxAJ2Aput16mP3qUdPH+bEopYbLRk6lsD5+OJSIssPHMVEDh9HuSedO7CVxLVc
 3uwuWAf2mDE9B6R9k+CUsgWp9flxeO0ZrslSlAgenbSPfoNX49AVPuO4WzZAn3D/ayMmZdNVFfc
 4EhEOMg/UGEmZuPJu2pEWbCCcB+2w1TDeeEquu4IaWcslVyEiTuPql/S9ayj8nyZrxR4ZYKx55G
 IXbYAaBoPOoEt9LyE9K6LZauwgzaWyovztakONZ/4dHYiijGNOT6NfgrbCpHNkPBMsM7BXjYlog
 Om22TSFUin7pzKVMmn3TuqbxNUrbg4zfmEt1GsyYgvVAcJ/asBi42ga1UMsT6tSQQv2TcATVyWf
 8rl4y1eJVfLxgyKL0BvzzN4egt0/S4D3t6+B8RwUS2W+Tk6BlMXIz8QSdkY3G2JN4OeRzvEfcX8
 Ztnxes5UyuIJRTYvE1Pl0CRzaAxEcOonJb05sxvHMOlZwYfhbudmCySBr7sBc7hL4VroSFGjLGT
 hBUClO+WJqLuVxw4ObTLuj3zMMBEddqHF76EzF2B0H5SXKMoyO4qh6WKuqTI46IN4rlZH2qiUK1
 HhWeJgcxvJ6fPqg==
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

The format RGB565 was already supported. Add the support for:
- BGR565

Reviewed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c   |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
index c37d1aae6eac..544bb6795805 100644
--- a/drivers/gpu/drm/vkms/vkms_formats.c
+++ b/drivers/gpu/drm/vkms/vkms_formats.c
@@ -259,6 +259,16 @@ static struct pixel_argb_u16 argb_u16_from_grayu16(u16 gray)
 	return argb_u16_from_u16161616(0xFFFF, gray, gray, gray);
 }
 
+static struct pixel_argb_u16 argb_u16_from_BGR565(const __le16 *pixel)
+{
+	struct pixel_argb_u16 out_pixel;
+
+	out_pixel = argb_u16_from_RGB565(pixel);
+	swap(out_pixel.r, out_pixel.b);
+
+	return out_pixel;
+}
+
 VISIBLE_IF_KUNIT struct pixel_argb_u16 argb_u16_from_yuv888(u8 y, u8 channel_1, u8 channel_2,
 							    const struct conversion_matrix *matrix)
 {
@@ -451,6 +461,7 @@ READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[
 READ_LINE_le16161616(XBGR16161616_read_line, px, cpu_to_le16(0xFFFF), px[0], px[1], px[2])
 
 READ_LINE(RGB565_read_line, px, __le16, argb_u16_from_RGB565, px)
+READ_LINE(BGR565_read_line, px, __le16, argb_u16_from_BGR565, px)
 
 READ_LINE(R8_read_line, px, u8, argb_u16_from_gray8, *px)
 
@@ -675,6 +686,8 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
 		return &XBGR16161616_read_line;
 	case DRM_FORMAT_RGB565:
 		return &RGB565_read_line;
+	case DRM_FORMAT_BGR565:
+		return &BGR565_read_line;
 	case DRM_FORMAT_NV12:
 	case DRM_FORMAT_NV16:
 	case DRM_FORMAT_NV24:
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d4c51b4486f7..6e7597ab935d 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -24,6 +24,7 @@ static const u32 vkms_formats[] = {
 	DRM_FORMAT_ARGB16161616,
 	DRM_FORMAT_ABGR16161616,
 	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_NV16,
 	DRM_FORMAT_NV24,

-- 
2.49.0

