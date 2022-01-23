Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5454973B4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 18:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E3E10E77C;
	Sun, 23 Jan 2022 17:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991C010E77C
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:38:06 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4JhgLj0j4Dz4x1KK
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 17:38:05 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (1024-bit key) header.d=connolly.tech header.i=@connolly.tech
 header.b="BaAiCpzo"
Date: Sun, 23 Jan 2022 17:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
 s=protonmail; t=1642959479;
 bh=Uu0q8KAJ6+bG5zjqtcOXH0AHNydbxkmYhhsv+R7TrF8=;
 h=Date:To:From:Reply-To:Subject:Message-ID:From:To:Cc;
 b=BaAiCpzoXfFJOWjcTWs7zv8svJKzTGs4OybPeFMB4ajAc+nlGNxju10TEPbga1fDF
 QAM8TGa6WILZnZ3pvY2JboU9hnrpTjqJcabKgvfkQ8YMSpEcy6ri53d5QsKe5KqKqS
 Ai633Rv0ovMSoWVWWPP3cOFnXziAPWojwl9kc8yw=
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kees Cook <keescook@chromium.org>, Anton Vorontsov <anton@enomsg.org>,
 Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>,
 Henrik Rydberg <rydberg@bitmath.org>, Harigovindan P <harigovi@codeaurora.org>,
 Caleb Connolly <caleb@connolly.tech>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Alexander Martinz <amartinz@shiftphones.com>
From: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 4/6] drm/panel: visionox-rm69299: support the variant found in
 the SHIFT6mq
Message-ID: <20220123173650.290349-5-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Caleb Connolly <caleb@connolly.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for another variant of the rm69299 panel. This panel is
1080x2160 and is found in the shift-axolotl (SHIFT6mq).

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 .../gpu/drm/panel/panel-visionox-rm69299.c    | 281 ++++++++++++++----
 1 file changed, 221 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-rm69299.c b/drivers/gpu/d=
rm/panel/panel-visionox-rm69299.c
index eb43503ec97b..e3c58ed8a96a 100644
--- a/drivers/gpu/drm/panel/panel-visionox-rm69299.c
+++ b/drivers/gpu/drm/panel/panel-visionox-rm69299.c
@@ -20,10 +20,42 @@ struct visionox_rm69299 {
 =09struct regulator_bulk_data supplies[2];
 =09struct gpio_desc *reset_gpio;
 =09struct mipi_dsi_device *dsi;
+=09const struct drm_display_mode *mode;
 =09bool prepared;
 =09bool enabled;
 };

+static const struct drm_display_mode visionox_rm69299_1080x2248_60hz =3D {
+=09.name =3D "1080x2248",
+=09.clock =3D 158695,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 26,
+=09.hsync_end =3D 1080 + 26 + 2,
+=09.htotal =3D 1080 + 26 + 2 + 36,
+=09.vdisplay =3D 2248,
+=09.vsync_start =3D 2248 + 56,
+=09.vsync_end =3D 2248 + 56 + 4,
+=09.vtotal =3D 2248 + 56 + 4 + 4,
+=09.flags =3D 0,
+};
+
+static const struct drm_display_mode visionox_rm69299_1080x2160_60hz =3D {
+=09.name =3D "Visionox 1080x2160@60Hz",
+=09.clock =3D 158695,
+=09.hdisplay =3D 1080,
+=09.hsync_start =3D 1080 + 26,
+=09.hsync_end =3D 1080 + 26 + 2,
+=09.htotal =3D 1080 + 26 + 2 + 36,
+=09.vdisplay =3D 2160,
+=09.vsync_start =3D 2160 + 8,
+=09.vsync_end =3D 2160 + 8 + 4,
+=09.vtotal =3D 2160 + 8 + 4 + 4,
+=09.flags =3D 0,
+=09.width_mm =3D 74,
+=09.height_mm =3D 131,
+=09.type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
 static inline struct visionox_rm69299 *panel_to_ctx(struct drm_panel *pane=
l)
 {
 =09return container_of(panel, struct visionox_rm69299, panel);
@@ -68,14 +100,16 @@ static int visionox_rm69299_unprepare(struct drm_panel=
 *panel)

 =09ret =3D mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_OFF, NULL, 0)=
;
 =09if (ret < 0)
-=09=09dev_err(ctx->panel.dev, "set_display_off cmd failed ret =3D %d\n", r=
et);
+=09=09dev_err(ctx->panel.dev, "set_display_off cmd failed ret =3D %d\n",
+=09=09=09ret);

 =09/* 120ms delay required here as per DCS spec */
 =09msleep(120);

 =09ret =3D mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_ENTER_SLEEP_MODE, NULL, 0=
);
 =09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "enter_sleep cmd failed ret =3D %d\n", ret);
+=09=09dev_err(ctx->panel.dev, "enter_sleep cmd failed ret =3D %d\n",
+=09=09=09ret);
 =09}

 =09ret =3D visionox_rm69299_power_off(ctx);
@@ -84,10 +118,123 @@ static int visionox_rm69299_unprepare(struct drm_pane=
l *panel)
 =09return ret;
 }

+#define VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN 432
+
+static const u8 visionox_rm69299_1080x2248_60hz_init_seq[VISIONOX_RM69299_=
SHIFT_INIT_SEQ_LEN][2] =3D {
+=09{ 0xFE, 0x40 }, { 0x05, 0x04 }, { 0x06, 0x08 }, { 0x08, 0x04 },
+=09{ 0x09, 0x08 }, { 0x0A, 0x07 }, { 0x0B, 0xCC }, { 0x0C, 0x07 },
+=09{ 0x0D, 0x90 }, { 0x0F, 0x87 }, { 0x20, 0x8D }, { 0x21, 0x8D },
+=09{ 0x24, 0x05 }, { 0x26, 0x05 }, { 0x28, 0x05 }, { 0x2A, 0x05 },
+=09{ 0x2D, 0x28 }, { 0x2F, 0x28 }, { 0x30, 0x32 }, { 0x31, 0x32 },
+=09{ 0x37, 0x80 }, { 0x38, 0x30 }, { 0x39, 0xA8 }, { 0x46, 0x48 },
+=09{ 0x47, 0x48 }, { 0x6B, 0x10 }, { 0x6F, 0x02 }, { 0x74, 0x2B },
+=09{ 0x80, 0x1A }, { 0xFE, 0x40 }, { 0x93, 0x10 }, { 0x16, 0x00 },
+=09{ 0x85, 0x07 }, { 0x84, 0x01 }, { 0x86, 0x0F }, { 0x87, 0x05 },
+=09{ 0x8C, 0x00 }, { 0x88, 0x2E }, { 0x89, 0x2E }, { 0x8B, 0x09 },
+=09{ 0x95, 0x00 }, { 0x91, 0x00 }, { 0x90, 0x00 }, { 0x8D, 0xD0 },
+=09{ 0x8A, 0x03 }, { 0xFE, 0xA0 }, { 0x13, 0x00 }, { 0x33, 0x00 },
+=09{ 0x0B, 0x33 }, { 0x36, 0x1E }, { 0x31, 0x88 }, { 0x32, 0x88 },
+=09{ 0x37, 0xF1 }, { 0xFE, 0x50 }, { 0x00, 0x00 }, { 0x01, 0x00 },
+=09{ 0x02, 0x00 }, { 0x03, 0xE9 }, { 0x04, 0x00 }, { 0x05, 0xF6 },
+=09{ 0x06, 0x01 }, { 0x07, 0x2C }, { 0x08, 0x01 }, { 0x09, 0x62 },
+=09{ 0x0A, 0x01 }, { 0x0B, 0x98 }, { 0x0C, 0x01 }, { 0x0D, 0xBF },
+=09{ 0x0E, 0x01 }, { 0x0F, 0xF6 }, { 0x10, 0x02 }, { 0x11, 0x24 },
+=09{ 0x12, 0x02 }, { 0x13, 0x4E }, { 0x14, 0x02 }, { 0x15, 0x70 },
+=09{ 0x16, 0x02 }, { 0x17, 0xAF }, { 0x18, 0x02 }, { 0x19, 0xE2 },
+=09{ 0x1A, 0x03 }, { 0x1B, 0x1F }, { 0x1C, 0x03 }, { 0x1D, 0x52 },
+=09{ 0x1E, 0x03 }, { 0x1F, 0x82 }, { 0x20, 0x03 }, { 0x21, 0xB6 },
+=09{ 0x22, 0x03 }, { 0x23, 0xF0 }, { 0x24, 0x04 }, { 0x25, 0x1F },
+=09{ 0x26, 0x04 }, { 0x27, 0x37 }, { 0x28, 0x04 }, { 0x29, 0x59 },
+=09{ 0x2A, 0x04 }, { 0x2B, 0x68 }, { 0x30, 0x04 }, { 0x31, 0x85 },
+=09{ 0x32, 0x04 }, { 0x33, 0xA2 }, { 0x34, 0x04 }, { 0x35, 0xBC },
+=09{ 0x36, 0x04 }, { 0x37, 0xD8 }, { 0x38, 0x04 }, { 0x39, 0xF4 },
+=09{ 0x3A, 0x05 }, { 0x3B, 0x0E }, { 0x40, 0x05 }, { 0x41, 0x13 },
+=09{ 0x42, 0x05 }, { 0x43, 0x1F }, { 0x44, 0x05 }, { 0x45, 0x1F },
+=09{ 0x46, 0x00 }, { 0x47, 0x00 }, { 0x48, 0x01 }, { 0x49, 0x43 },
+=09{ 0x4A, 0x01 }, { 0x4B, 0x4C }, { 0x4C, 0x01 }, { 0x4D, 0x6F },
+=09{ 0x4E, 0x01 }, { 0x4F, 0x92 }, { 0x50, 0x01 }, { 0x51, 0xB5 },
+=09{ 0x52, 0x01 }, { 0x53, 0xD4 }, { 0x58, 0x02 }, { 0x59, 0x06 },
+=09{ 0x5A, 0x02 }, { 0x5B, 0x33 }, { 0x5C, 0x02 }, { 0x5D, 0x59 },
+=09{ 0x5E, 0x02 }, { 0x5F, 0x7D }, { 0x60, 0x02 }, { 0x61, 0xBD },
+=09{ 0x62, 0x02 }, { 0x63, 0xF7 }, { 0x64, 0x03 }, { 0x65, 0x31 },
+=09{ 0x66, 0x03 }, { 0x67, 0x63 }, { 0x68, 0x03 }, { 0x69, 0x9D },
+=09{ 0x6A, 0x03 }, { 0x6B, 0xD2 }, { 0x6C, 0x04 }, { 0x6D, 0x05 },
+=09{ 0x6E, 0x04 }, { 0x6F, 0x38 }, { 0x70, 0x04 }, { 0x71, 0x51 },
+=09{ 0x72, 0x04 }, { 0x73, 0x70 }, { 0x74, 0x04 }, { 0x75, 0x85 },
+=09{ 0x76, 0x04 }, { 0x77, 0xA1 }, { 0x78, 0x04 }, { 0x79, 0xC0 },
+=09{ 0x7A, 0x04 }, { 0x7B, 0xD8 }, { 0x7C, 0x04 }, { 0x7D, 0xF2 },
+=09{ 0x7E, 0x05 }, { 0x7F, 0x10 }, { 0x80, 0x05 }, { 0x81, 0x21 },
+=09{ 0x82, 0x05 }, { 0x83, 0x2E }, { 0x84, 0x05 }, { 0x85, 0x3A },
+=09{ 0x86, 0x05 }, { 0x87, 0x3E }, { 0x88, 0x00 }, { 0x89, 0x00 },
+=09{ 0x8A, 0x01 }, { 0x8B, 0x86 }, { 0x8C, 0x01 }, { 0x8D, 0x8F },
+=09{ 0x8E, 0x01 }, { 0x8F, 0xB3 }, { 0x90, 0x01 }, { 0x91, 0xD7 },
+=09{ 0x92, 0x01 }, { 0x93, 0xFB }, { 0x94, 0x02 }, { 0x95, 0x18 },
+=09{ 0x96, 0x02 }, { 0x97, 0x4F }, { 0x98, 0x02 }, { 0x99, 0x7E },
+=09{ 0x9A, 0x02 }, { 0x9B, 0xA6 }, { 0x9C, 0x02 }, { 0x9D, 0xCF },
+=09{ 0x9E, 0x03 }, { 0x9F, 0x14 }, { 0xA4, 0x03 }, { 0xA5, 0x52 },
+=09{ 0xA6, 0x03 }, { 0xA7, 0x93 }, { 0xAC, 0x03 }, { 0xAD, 0xCF },
+=09{ 0xAE, 0x04 }, { 0xAF, 0x08 }, { 0xB0, 0x04 }, { 0xB1, 0x42 },
+=09{ 0xB2, 0x04 }, { 0xB3, 0x7F }, { 0xB4, 0x04 }, { 0xB5, 0xB4 },
+=09{ 0xB6, 0x04 }, { 0xB7, 0xCC }, { 0xB8, 0x04 }, { 0xB9, 0xF2 },
+=09{ 0xBA, 0x05 }, { 0xBB, 0x0C }, { 0xBC, 0x05 }, { 0xBD, 0x26 },
+=09{ 0xBE, 0x05 }, { 0xBF, 0x4B }, { 0xC0, 0x05 }, { 0xC1, 0x64 },
+=09{ 0xC2, 0x05 }, { 0xC3, 0x83 }, { 0xC4, 0x05 }, { 0xC5, 0xA1 },
+=09{ 0xC6, 0x05 }, { 0xC7, 0xBA }, { 0xC8, 0x05 }, { 0xC9, 0xC4 },
+=09{ 0xCA, 0x05 }, { 0xCB, 0xD5 }, { 0xCC, 0x05 }, { 0xCD, 0xD5 },
+=09{ 0xCE, 0x00 }, { 0xCF, 0xCE }, { 0xD0, 0x00 }, { 0xD1, 0xDB },
+=09{ 0xD2, 0x01 }, { 0xD3, 0x32 }, { 0xD4, 0x01 }, { 0xD5, 0x3B },
+=09{ 0xD6, 0x01 }, { 0xD7, 0x74 }, { 0xD8, 0x01 }, { 0xD9, 0x7D },
+=09{ 0xFE, 0x60 }, { 0x00, 0xCC }, { 0x01, 0x0F }, { 0x02, 0xFF },
+=09{ 0x03, 0x01 }, { 0x04, 0x00 }, { 0x05, 0x02 }, { 0x06, 0x00 },
+=09{ 0x07, 0x00 }, { 0x09, 0xC4 }, { 0x0A, 0x00 }, { 0x0B, 0x04 },
+=09{ 0x0C, 0x01 }, { 0x0D, 0x00 }, { 0x0E, 0x04 }, { 0x0F, 0x00 },
+=09{ 0x10, 0x71 }, { 0x12, 0xC4 }, { 0x13, 0x00 }, { 0x14, 0x04 },
+=09{ 0x15, 0x01 }, { 0x16, 0x00 }, { 0x17, 0x06 }, { 0x18, 0x00 },
+=09{ 0x19, 0x71 }, { 0x1B, 0xC4 }, { 0x1C, 0x00 }, { 0x1D, 0x02 },
+=09{ 0x1E, 0x00 }, { 0x1F, 0x00 }, { 0x20, 0x08 }, { 0x21, 0x66 },
+=09{ 0x22, 0xB4 }, { 0x24, 0xC4 }, { 0x25, 0x00 }, { 0x26, 0x02 },
+=09{ 0x27, 0x00 }, { 0x28, 0x00 }, { 0x29, 0x07 }, { 0x2A, 0x66 },
+=09{ 0x2B, 0xB4 }, { 0x2F, 0xC4 }, { 0x30, 0x00 }, { 0x31, 0x04 },
+=09{ 0x32, 0x01 }, { 0x33, 0x00 }, { 0x34, 0x03 }, { 0x35, 0x00 },
+=09{ 0x36, 0x71 }, { 0x38, 0xC4 }, { 0x39, 0x00 }, { 0x3A, 0x04 },
+=09{ 0x3B, 0x01 }, { 0x3D, 0x00 }, { 0x3F, 0x05 }, { 0x40, 0x00 },
+=09{ 0x41, 0x71 }, { 0x83, 0xCE }, { 0x84, 0x02 }, { 0x85, 0x20 },
+=09{ 0x86, 0xDC }, { 0x87, 0x00 }, { 0x88, 0x04 }, { 0x89, 0x00 },
+=09{ 0x8A, 0xBB }, { 0x8B, 0x80 }, { 0xC7, 0x0E }, { 0xC8, 0x05 },
+=09{ 0xC9, 0x1F }, { 0xCA, 0x06 }, { 0xCB, 0x00 }, { 0xCC, 0x03 },
+=09{ 0xCD, 0x04 }, { 0xCE, 0x1F }, { 0xCF, 0x1F }, { 0xD0, 0x1F },
+=09{ 0xD1, 0x1F }, { 0xD2, 0x1F }, { 0xD3, 0x1F }, { 0xD4, 0x1F },
+=09{ 0xD5, 0x1F }, { 0xD6, 0x1F }, { 0xD7, 0x17 }, { 0xD8, 0x1F },
+=09{ 0xD9, 0x16 }, { 0xDA, 0x1F }, { 0xDB, 0x0E }, { 0xDC, 0x01 },
+=09{ 0xDD, 0x1F }, { 0xDE, 0x02 }, { 0xDF, 0x00 }, { 0xE0, 0x03 },
+=09{ 0xE1, 0x04 }, { 0xE2, 0x1F }, { 0xE3, 0x1F }, { 0xE4, 0x1F },
+=09{ 0xE5, 0x1F }, { 0xE6, 0x1F }, { 0xE7, 0x1F }, { 0xE8, 0x1F },
+=09{ 0xE9, 0x1F }, { 0xEA, 0x1F }, { 0xEB, 0x17 }, { 0xEC, 0x1F },
+=09{ 0xED, 0x16 }, { 0xEE, 0x1F }, { 0xEF, 0x03 }, { 0xFE, 0x70 },
+=09{ 0x5A, 0x0B }, { 0x5B, 0x0B }, { 0x5C, 0x55 }, { 0x5D, 0x24 },
+=09{ 0xFE, 0x90 }, { 0x12, 0x24 }, { 0x13, 0x49 }, { 0x14, 0x92 },
+=09{ 0x15, 0x86 }, { 0x16, 0x61 }, { 0x17, 0x18 }, { 0x18, 0x24 },
+=09{ 0x19, 0x49 }, { 0x1A, 0x92 }, { 0x1B, 0x86 }, { 0x1C, 0x61 },
+=09{ 0x1D, 0x18 }, { 0x1E, 0x24 }, { 0x1F, 0x49 }, { 0x20, 0x92 },
+=09{ 0x21, 0x86 }, { 0x22, 0x61 }, { 0x23, 0x18 }, { 0xFE, 0x40 },
+=09{ 0x0E, 0x10 }, { 0xFE, 0xA0 }, { 0x04, 0x80 }, { 0x16, 0x00 },
+=09{ 0x26, 0x10 }, { 0x2F, 0x37 }, { 0xFE, 0xD0 }, { 0x06, 0x0F },
+=09{ 0x4B, 0x00 }, { 0x56, 0x4A }, { 0xFE, 0x00 }, { 0xC2, 0x09 },
+=09{ 0x35, 0x00 }, { 0xFE, 0x70 }, { 0x7D, 0x61 }, { 0x7F, 0x00 },
+=09{ 0x7E, 0x4E }, { 0x52, 0x2C }, { 0x49, 0x00 }, { 0x4A, 0x00 },
+=09{ 0x4B, 0x00 }, { 0x4C, 0x00 }, { 0x4D, 0xE8 }, { 0x4E, 0x25 },
+=09{ 0x4F, 0x6E }, { 0x50, 0xAE }, { 0x51, 0x2F }, { 0xAD, 0xF4 },
+=09{ 0xAE, 0x8F }, { 0xAF, 0x00 }, { 0xB0, 0x54 }, { 0xB1, 0x3A },
+=09{ 0xB2, 0x00 }, { 0xB3, 0x00 }, { 0xB4, 0x00 }, { 0xB5, 0x00 },
+=09{ 0xB6, 0x18 }, { 0xB7, 0x30 }, { 0xB8, 0x4A }, { 0xB9, 0x98 },
+=09{ 0xBA, 0x30 }, { 0xBB, 0x60 }, { 0xBC, 0x50 }, { 0xBD, 0x00 },
+=09{ 0xBE, 0x00 }, { 0xBF, 0x39 }, { 0xFE, 0x00 }, { 0x51, 0x66 },
+};
+
 static int visionox_rm69299_prepare(struct drm_panel *panel)
 {
 =09struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
-=09int ret;
+=09int ret, i;

 =09if (ctx->prepared)
 =09=09return 0;
@@ -98,34 +245,55 @@ static int visionox_rm69299_prepare(struct drm_panel *=
panel)

 =09ctx->dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;

-=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xfe, 0x00 }, 2);
-=09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "cmd set tx 0 failed, ret =3D %d\n", ret);
-=09=09goto power_off;
-=09}
-
-=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0xc2, 0x08 }, 2);
-=09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "cmd set tx 1 failed, ret =3D %d\n", ret);
-=09=09goto power_off;
-=09}
-
-=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x35, 0x00 }, 2);
-=09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "cmd set tx 2 failed, ret =3D %d\n", ret);
-=09=09goto power_off;
-=09}
-
-=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]) { 0x51, 0xff }, 2);
-=09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "cmd set tx 3 failed, ret =3D %d\n", ret);
-=09=09goto power_off;
+=09if (ctx->mode =3D=3D &visionox_rm69299_1080x2160_60hz) {
+=09=09for (i =3D 0; i < VISIONOX_RM69299_SHIFT_INIT_SEQ_LEN; i++) {
+=09=09=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi,
+=09=09=09=09visionox_rm69299_1080x2248_60hz_init_seq[i], 2);
+=09=09=09if (ret < 0) {
+=09=09=09=09dev_err(ctx->panel.dev,
+=09=09=09=09=09"cmd set tx 0 failed, ret =3D %d\n", ret);
+=09=09=09=09return ret;
+=09=09=09}
+=09=09}
+=09} else {
+=09=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xfe, 0x00 },
+=09=09=09=09=09=092);
+=09=09if (ret < 0) {
+=09=09=09dev_err(ctx->panel.dev,
+=09=09=09=09"cmd set tx 0 failed, ret =3D %d\n", ret);
+=09=09=09return ret;
+=09=09}
+
+=09=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0xc2, 0x08 },
+=09=09=09=09=09=092);
+=09=09if (ret < 0) {
+=09=09=09dev_err(ctx->panel.dev,
+=09=09=09=09"cmd set tx 1 failed, ret =3D %d\n", ret);
+=09=09=09return ret;
+=09=09}
+
+=09=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x35, 0x00 },
+=09=09=09=09=09=092);
+=09=09if (ret < 0) {
+=09=09=09dev_err(ctx->panel.dev,
+=09=09=09=09"cmd set tx 2 failed, ret =3D %d\n", ret);
+=09=09=09return ret;
+=09=09}
+
+=09=09ret =3D mipi_dsi_dcs_write_buffer(ctx->dsi, (u8[]){ 0x51, 0xff },
+=09=09=09=09=09=092);
+=09=09if (ret < 0) {
+=09=09=09dev_err(ctx->panel.dev,
+=09=09=09=09"cmd set tx 3 failed, ret =3D %d\n", ret);
+=09=09=09return ret;
+=09=09}
 =09}

 =09ret =3D mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_EXIT_SLEEP_MODE, NULL, 0)=
;
 =09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "exit_sleep_mode cmd failed ret =3D %d\n", r=
et);
-=09=09goto power_off;
+=09=09dev_err(ctx->panel.dev, "exit_sleep_mode cmd failed ret =3D %d\n",
+=09=09=09ret);
+=09=09return ret;
 =09}

 =09/* Per DSI spec wait 120ms after sending exit sleep DCS command */
@@ -133,8 +301,9 @@ static int visionox_rm69299_prepare(struct drm_panel *p=
anel)

 =09ret =3D mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_DISPLAY_ON, NULL, 0);
 =09if (ret < 0) {
-=09=09dev_err(ctx->panel.dev, "set_display_on cmd failed ret =3D %d\n", re=
t);
-=09=09goto power_off;
+=09=09dev_err(ctx->panel.dev, "set_display_on cmd failed ret =3D %d\n",
+=09=09=09ret);
+=09=09return ret;
 =09}

 =09/* Per DSI spec wait 120ms after sending set_display_on DCS command */
@@ -143,41 +312,23 @@ static int visionox_rm69299_prepare(struct drm_panel =
*panel)
 =09ctx->prepared =3D true;

 =09return 0;
-
-power_off:
-=09return ret;
 }

-static const struct drm_display_mode visionox_rm69299_1080x2248_60hz =3D {
-=09.name =3D "1080x2248",
-=09.clock =3D 158695,
-=09.hdisplay =3D 1080,
-=09.hsync_start =3D 1080 + 26,
-=09.hsync_end =3D 1080 + 26 + 2,
-=09.htotal =3D 1080 + 26 + 2 + 36,
-=09.vdisplay =3D 2248,
-=09.vsync_start =3D 2248 + 56,
-=09.vsync_end =3D 2248 + 56 + 4,
-=09.vtotal =3D 2248 + 56 + 4 + 4,
-=09.flags =3D 0,
-};
-
 static int visionox_rm69299_get_modes(struct drm_panel *panel,
 =09=09=09=09      struct drm_connector *connector)
 {
 =09struct visionox_rm69299 *ctx =3D panel_to_ctx(panel);
 =09struct drm_display_mode *mode;

-=09mode =3D drm_mode_create(connector->dev);
-=09if (!mode) {
-=09=09dev_err(ctx->panel.dev, "failed to create a new display mode\n");
-=09=09return 0;
-=09}
+=09mode =3D drm_mode_duplicate(connector->dev, ctx->mode);
+=09if (!mode)
+=09=09return -ENOMEM;
+
+=09drm_mode_set_name(mode);

-=09connector->display_info.width_mm =3D 74;
-=09connector->display_info.height_mm =3D 131;
-=09drm_mode_copy(mode, &visionox_rm69299_1080x2248_60hz);
 =09mode->type =3D DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
+=09connector->display_info.width_mm =3D mode->width_mm;
+=09connector->display_info.height_mm =3D mode->height_mm;
 =09drm_mode_probed_add(connector, mode);

 =09return 1;
@@ -199,6 +350,8 @@ static int visionox_rm69299_probe(struct mipi_dsi_devic=
e *dsi)
 =09if (!ctx)
 =09=09return -ENOMEM;

+=09ctx->mode =3D of_device_get_match_data(dev);
+
 =09mipi_dsi_set_drvdata(dsi, ctx);

 =09ctx->panel.dev =3D dev;
@@ -212,10 +365,11 @@ static int visionox_rm69299_probe(struct mipi_dsi_dev=
ice *dsi)
 =09if (ret < 0)
 =09=09return ret;

-=09ctx->reset_gpio =3D devm_gpiod_get(ctx->panel.dev,
-=09=09=09=09=09 "reset", GPIOD_OUT_LOW);
+=09ctx->reset_gpio =3D
+=09=09devm_gpiod_get(ctx->panel.dev, "reset", GPIOD_OUT_LOW);
 =09if (IS_ERR(ctx->reset_gpio)) {
-=09=09dev_err(dev, "cannot get reset gpio %ld\n", PTR_ERR(ctx->reset_gpio)=
);
+=09=09dev_err(dev, "cannot get reset gpio %ld\n",
+=09=09=09PTR_ERR(ctx->reset_gpio));
 =09=09return PTR_ERR(ctx->reset_gpio);
 =09}

@@ -237,13 +391,17 @@ static int visionox_rm69299_probe(struct mipi_dsi_dev=
ice *dsi)

 =09ret =3D regulator_set_load(ctx->supplies[0].consumer, 32000);
 =09if (ret) {
-=09=09dev_err(dev, "regulator set load failed for vdda supply ret =3D %d\n=
", ret);
+=09=09dev_err(dev,
+=09=09=09"regulator set load failed for vdda supply ret =3D %d\n",
+=09=09=09ret);
 =09=09goto err_set_load;
 =09}

 =09ret =3D regulator_set_load(ctx->supplies[1].consumer, 13200);
 =09if (ret) {
-=09=09dev_err(dev, "regulator set load failed for vdd3p3 supply ret =3D %d=
\n", ret);
+=09=09dev_err(dev,
+=09=09=09"regulator set load failed for vdd3p3 supply ret =3D %d\n",
+=09=09=09ret);
 =09=09goto err_set_load;
 =09}

@@ -268,7 +426,10 @@ static int visionox_rm69299_remove(struct mipi_dsi_dev=
ice *dsi)
 }

 static const struct of_device_id visionox_rm69299_of_match[] =3D {
-=09{ .compatible =3D "visionox,rm69299-1080p-display", },
+=09{ .compatible =3D "visionox,rm69299-1080p-display",
+=09  .data =3D &visionox_rm69299_1080x2248_60hz },
+=09{ .compatible =3D "visionox,rm69299-shift",
+=09  .data =3D &visionox_rm69299_1080x2160_60hz },
 =09{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, visionox_rm69299_of_match);
--
2.34.1


