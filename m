Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6309A2DE2E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 14:55:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF8810E495;
	Sun,  9 Feb 2025 13:55:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=sdore.me header.i=@sdore.me header.b="iudWUhZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Fri, 07 Feb 2025 21:09:25 UTC
Received: from sdore.me (unknown [95.165.1.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C3910E02F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 21:09:25 +0000 (UTC)
Received: from [192.168.1.2] (beast.lan [192.168.1.2])
 by sdore.me (Postfix) with ESMTPSA id EF497EDE71D96;
 Sat, 08 Feb 2025 00:00:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sdore.me; s=SERV;
 t=1738962004; bh=ksvD8NEcd6TaYE9uOjAbzkgggV4qq6CKb54BE6GcwkM=;
 h=Subject:From:Reply-To:To:Cc:Date;
 b=iudWUhZvjMXAIc9nnklkFgZyK88TJbJOU76WRR7dYpWHdgnHLffDZHh7ZXcPaEBB8
 Uz4xXQmbCPq20RVPoURIi4REv93q/MMTMdEKhsNZLg0P4nnH+uEjhqZ/Alkd1QzT8y
 ax9UOKTZeTc0M1bpF/9JIdqYgV4m15a7ryBdg+EM=
Message-ID: <e60254ec3544d37367c9917bc0e1cd5fdb95248d.camel@sdore.me>
Subject: [PATCH RESEND] drm/edid: Implement DisplayID Type IX & X timing
 blocks parsing
From: Egor Vorontsov <sdoregor@sdore.me>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Date: Sat, 08 Feb 2025 00:00:03 +0300
Autocrypt: addr=sdoregor@sdore.me; prefer-encrypt=mutual;
 keydata=mQINBGDSFnMBEADfvtLiuRL6CHdMzETKrux7sNHWG+eJ2+pgRZ3Nc9pH/YWqjoed8OpFx
 OLeUxr9YSQ3uMD//JEe3+Sgte29Z3PAAHVkCwKBIucCnhHpXbcQZgC9xYMCd6GWR5+DpXN9szOIyb
 kvnEtuqTddz6Q7fYsaFDs0pH3jUUWmSAyCn2JCIRfT22XgO44B/yoqnM3JXHAayeHbEAQOzMe81q3
 deauI9W7SC9ScRT6VkgLuc+SxqH99el/OkiKTe/QpO6I6cVS8leesqnOGffkRPos/o2eRonqgDu0e
 Mw4YTu0x5iNr8Lbr4TefU2W1l6M3MNwOsLmI+58+3fK1vh0QqZ70NC4eyD9UEXk3mJyV7epfNU6fY
 0mFJbAhGV1TXomcy2MlOD1rDixw85zdK5uUwp0tfEkpxqKtihJmrTdApOTTVed303CLzgDsMokTIe
 aUOPqVZoWFDkvOzq6IppBkApJHBf1lcLlgwEn3cLQlGpYRSSi5NY3+UYtcOEZLDbF3TO6ncY8W2h3
 yQH/sAcSllfKKvkhdqEz4/Mha3GbZQXWgjrLy9BcISsQFj+DBN54I6a6kLm2n5wXH99sOp7s3jMeN
 zSU6PtuxZq4Gkt2K5JGT8yrIdfJfOH7yRUVm+8JqKNKqd6oczlDKV+lzRk9M/kjb8VQivaNSNwTo9
 3NxEuft0+tZgwARAQABtCJFZ29yIFZvcm9udHNvdiA8c2RvcmVnb3JAc2RvcmUubWU+iQJOBBMBCA
 A4FiEEXlTCjXwaPBiJP3U33a9iH2xv60MFAmDSFnMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4A
 ACgkQ3a9iH2xv60OquRAAgbgenXi+Ud0tYoAz6giuFKYqzuEYuoSVkjxYvZq90ODrzbu7EdvMVuKA
 qNqYjs3VRBPBMHXhJKEftKbX4bZwCoC2o2wB5oV5O13jVN083r49FTLCxmOoufCkaqscBBxi/X2T6
 +i0n5Nqx5NLBL0kE4NMTk1jxEEyuEjv7bBMs196G/d3EpNJT3YGkLXBUibpaSaVjE6zBr3UygieLD
 2QXNkRJubx2d0FoD8TezSt5hsHWg9FOElsW6ZImRI+5q+ptL39K3cpjxHMKyhmo7xypD5XNWdmsmV
 1+STnK7R+id18xs7JUDxHBtG7Z/3K6txgF5CPbPvtaEi9fB3K/uS03BnIzsY2/cY3r9UHHrHa/sP6
 DhDwj9dr2xIFG5w6ZNh4mUTHEJoWKEEsYKwXy2eJCB3XvP7GURAm8fXdIapONbHDYj7XX49Mj+LBr
 s4PNBuKaZTFgGQ6RSc7LpAR56xaEDR93m7zNy84mQtpab/owaox1A+BEujzKK/vEDvj9f8EWlWZRa
 DH2auNNAxdr2ACR8RzkojcFDCErAgc5sFQrgVUlvNmMdn3VL0CWmndzEQxsOdgVk9SwoHHYpHf4Cg
 gtchq3pTQ5XSRaP/wxOtQpzqJWq5uFERBTLU8WRXYv3mM3KMdvtTJadF8+P+KSSnn+/yHahR0HKVx
 PtHSH7Px/vI=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 09 Feb 2025 13:55:44 +0000
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
Reply-To: sdoregor@sdore.me
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some newer high refresh rate consumer monitors (including those by Samsung)
make use of DisplayID 2.1 timing blocks in their EDID data, notably for
their highest refresh rate modes. Such modes won't be available as of now.

Implement partial support for such blocks in order to enable native
support of HRR modes of most such monitors for users without having to rely
on EDID patching/override (or need thereof).

Link: https://gitlab.freedesktop.org/drm/misc/kernel/-/issues/55
Suggested-by: Maximilian Bo=C3=9Fe <max@bosse.io>
Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>

---

The formatting was taken from the neighboring code for consistency,
thus some warnings.

[Resent due to some Spamhaus issues that are now resolved.]

 drivers/gpu/drm/drm_displayid_internal.h | 13 +++++
 drivers/gpu/drm/drm_edid.c               | 61 ++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm=
_displayid_internal.h
index aee1b86a73c1..a75d0f637b72 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -66,6 +66,7 @@ struct drm_edid;
 #define DATA_BLOCK_2_STEREO_DISPLAY_INTERFACE	0x27
 #define DATA_BLOCK_2_TILED_DISPLAY_TOPOLOGY	0x28
 #define DATA_BLOCK_2_CONTAINER_ID		0x29
+#define DATA_BLOCK_2_TYPE_10_FORMULA_TIMING	0x2a
 #define DATA_BLOCK_2_VENDOR_SPECIFIC		0x7e
 #define DATA_BLOCK_2_CTA_DISPLAY_ID		0x81
=20
@@ -129,6 +130,18 @@ struct displayid_detailed_timing_block {
 	struct displayid_detailed_timings_1 timings[];
 };
=20
+struct displayid_formula_timings_9 {
+	u8 flags;
+	u8 hactive[2];
+	u8 vactive[2];
+	u8 refresh;
+} __packed;
+
+struct displayid_formula_timing_block {
+	struct displayid_block base;
+	struct displayid_formula_timings_9 timings[];
+};
+
 #define DISPLAYID_VESA_MSO_OVERLAP	GENMASK(3, 0)
 #define DISPLAYID_VESA_MSO_MODE		GENMASK(6, 5)
=20
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 13bc4c290b17..8a4dec1d781c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6833,6 +6833,64 @@ static int add_displayid_detailed_1_modes(struct drm=
_connector *connector,
 	return num_modes;
 }
=20
+static struct drm_display_mode *drm_mode_displayid_formula(struct drm_devi=
ce *dev,
+							   struct displayid_formula_timings_9 *timings,
+							   bool type_10)
+{
+	struct drm_display_mode *mode;
+	unsigned hactive =3D (timings->hactive[0] | timings->hactive[1] << 8) + 1=
;
+	unsigned vactive =3D (timings->vactive[0] | timings->vactive[1] << 8) + 1=
;
+	u8 rb =3D timings->flags & 0b111;
+	/* TODO: support RB-v2 & RB-v3 */
+	if (rb > 1)
+		return NULL;
+
+	mode =3D drm_cvt_mode(dev, hactive, vactive, timings->refresh, rb =3D=3D =
1, false, false);
+	if (!mode)
+		return NULL;
+
+	/* TODO: interpret S3D flags */
+
+	mode->type =3D DRM_MODE_TYPE_DRIVER;
+
+	if (timings->flags & 0x80)
+		mode->type |=3D DRM_MODE_TYPE_PREFERRED;
+	drm_mode_set_name(mode);
+
+	return mode;
+}
+
+static int add_displayid_formula_modes(struct drm_connector *connector,
+				       const struct displayid_block *block)
+{
+	struct displayid_formula_timing_block *fb =3D (struct displayid_formula_t=
iming_block *)block;
+	int num_timings;
+	struct drm_display_mode *newmode;
+	int num_modes =3D 0;
+	bool type_10 =3D block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING;
+	u8 timing_size =3D 6 + ((fb->base.rev & 0x70) >> 4);
+	/* extended blocks are not supported yet */
+	if (timing_size !=3D 6)
+		return 0;
+
+	if (block->num_bytes % timing_size)
+		return 0;
+
+	num_timings =3D block->num_bytes / timing_size;
+	for (int i =3D 0; i < num_timings; i++) {
+		struct displayid_formula_timings_9 *timings =3D \
+			(struct displayid_formula_timings_9 *)&((u8 *)fb->timings)[i * timing_s=
ize];
+
+		newmode =3D drm_mode_displayid_formula(connector->dev, timings, type_10)=
;
+		if (!newmode)
+			continue;
+
+		drm_mode_probed_add(connector, newmode);
+		num_modes++;
+	}
+	return num_modes;
+}
+
 static int add_displayid_detailed_modes(struct drm_connector *connector,
 					const struct drm_edid *drm_edid)
 {
@@ -6845,6 +6903,9 @@ static int add_displayid_detailed_modes(struct drm_co=
nnector *connector,
 		if (block->tag =3D=3D DATA_BLOCK_TYPE_1_DETAILED_TIMING ||
 		    block->tag =3D=3D DATA_BLOCK_2_TYPE_7_DETAILED_TIMING)
 			num_modes +=3D add_displayid_detailed_1_modes(connector, block);
+		else if (block->tag =3D=3D DATA_BLOCK_2_TYPE_9_FORMULA_TIMING ||
+			 block->tag =3D=3D DATA_BLOCK_2_TYPE_10_FORMULA_TIMING)
+			num_modes +=3D add_displayid_formula_modes(connector, block);
 	}
 	displayid_iter_end(&iter);
=20
--=20
2.48.0
