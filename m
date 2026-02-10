Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENzuOIVui2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:44:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD011E0DE
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 18:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB0010E5E8;
	Tue, 10 Feb 2026 17:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="IFSitOPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD6710E5E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 17:44:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770745465; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eK/Sa7hi9ehtuBz4qeuc37L4Xe8gLnGdKO6Azb/Zve3ZgNSLSfKEsU7eW5ZPwrwCwKxPU41eXvgVtycwxajSs2mYm2Hejt215XCERjH0NZbu7yBKftJl/j5lcOlzK5j1XplfUPsRJKUB8iXmd8nT5ynpMahfrD3jPH2KZD3RLfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770745465;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0vgkSbLWmvC7EDiF9dVV14HZzse+0SaoEp2wQjLogUg=; 
 b=hOeEb1MMuiG66LOKtt3jja/FE/CZnC1/dezzMh1K3kulTWBBpPPvSsyNHWlsjUxcZAWt01l0Za573V1sOWYxjYy3OnMCiL4xjQwe4wyhtLNgHx9O6wxV6YwLvc6P+B2I5llnBqZdq4VahqaMr66SyST0O1XmTM2fHIzC8w8Em/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770745465; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=0vgkSbLWmvC7EDiF9dVV14HZzse+0SaoEp2wQjLogUg=;
 b=IFSitOPs0Wjl97CqBcBQuwTcjzt4NeqlSltwxKlK0ZMWkofDS4lwsuVH8SwYbzZS
 Ms0L5+pzXJAmSkdc4S7OZIBYM3NpHXK3rcLRPrMkQhmNRIYflBUfeYgiqPyQ9YbncDt
 GqmY9YeyRBqfEiqrIMZI9vuaNJpGC/jDilEDdFPE=
Received: by mx.zohomail.com with SMTPS id 1770745463103698.7909230436375;
 Tue, 10 Feb 2026 09:44:23 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 10 Feb 2026 14:44:01 -0300
Subject: [PATCH v2 2/2] drm/vkms: Add kunit tests for alternative BT709
 encoding matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-vkms-composer-fix-matrix-v2-2-d1ed09cb23e8@collabora.com>
References: <20260210-vkms-composer-fix-matrix-v2-0-d1ed09cb23e8@collabora.com>
In-Reply-To: <20260210-vkms-composer-fix-matrix-v2-0-d1ed09cb23e8@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nfraprado@collabora.com, pekka.paalanen@collabora.com, 
 daniels@collabora.com, kernel@collabora.com, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770745445; l=5535;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=4lMPXq2NMEi3Ey0trVDFbPgIcjdkuEcpw4v3vC9NiBY=;
 b=8QblPWdv0ZO42gRbybZTS2E1pZds5I7mWmtw/K6aZ8iy/A2T3Z3gQbISkQuftNgLZ3MuCuKj2
 gcq27gKvlL7AFCZZA/oIhdEs0c+B6DUR2MB4wwcSPx7QSP1Fa4Yf5Pj
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:simona@ffwll.ch,m:melissa.srw@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:linux-kernel@vger.kernel.org,m:nfraprado@collabora.com,m:pekka.paalanen@collabora.com,m:daniels@collabora.com,m:kernel@collabora.com,m:ariel.dalessandro@collabora.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[bootlin.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ariel.dalessandro@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email,itu.int:url]
X-Rspamd-Queue-Id: 50DD011E0DE
X-Rspamd-Action: no action

Currently, BT.709 encoding matrix kunit tests don't cover the offset
component multiplication.

This commit adds another kunit tests using the BT.709 standard [0]
alternative representation of colors by three coordinates Y'Cb'Cr',
which are linear combinations of the (non-linear) RGB coordinates.

According to these formulas, if RGB varies between [0.0, 1.0], then Y'
will vary between [0.0, 1.0], while Cb' and Cr' will vary between
[-0.5, 0.5].

The 0.5 offset is added to the Cb' and Cr' components in the 3x4
encoding matrix, so the resulting pixel values then fits the 16-bit
UNORM.

[0] https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 drivers/gpu/drm/vkms/tests/vkms_color_test.c | 146 +++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_color_test.c b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
index 1a1c7cac2f158..53ab88e9e2f9e 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_color_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_color_test.c
@@ -393,6 +393,151 @@ static void vkms_color_ctm_3x4_bt709(struct kunit *test)
 	KUNIT_EXPECT_LT(test, out.b, 0x100);
 }
 
+/*
+ * BT.709 encoding matrix: Y'Cb'Cr' coordinates
+ *
+ * BT.709 standard [0] alternative representation of colors by three coordinates
+ * Y'Cb'Cr', which are linear combinations of the (non-linear) RGB coordinates.
+ *
+ * According to these formulas, if RGB varies between [0.0, 1.0], then Y'
+ * will vary between [0.0, 1.0], while Cb' and Cr' will vary between
+ * [-0.5, 0.5].
+ *
+ * The 0.5 offset is added to the Cb' and Cr' components in the 3x4 encoding
+ * matrix, so the resulting pixel values then fits the 16-bit UNORM.
+ *
+ * [0] https://www.itu.int/rec/R-REC-BT.709-6-201506-I/en
+ */
+static const struct drm_color_ctm_3x4 test_matrix_3x4_bt709_alt_enc = { {
+	0x00000000366cf400ull, 0x00000000b7175900ull, 0x0000000127bb300ull, 0,
+	0x800000001d5475a0ull, 0x8000000062ab8a80ull, 0x0000000080000000ull, 0x0000000080000000ull,
+	0x0000000080000000ull, 0x8000000074432c80ull, 0x800000000bbcd360ull, 0x0000000080000000ull,
+} };
+
+static void vkms_color_ctm_3x4_bt709_alt(struct kunit *test)
+{
+	struct pixel_argb_s32 out;
+
+	/* full white to bt709 */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0xffff;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 255 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.r, 0x11000);
+
+	/* Cb' 127 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.g, 0x8100);
+
+	/* Cr' 127 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.b, 0x8100);
+
+	/* full black to bt709 */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 0 */
+	KUNIT_EXPECT_LT(test, out.r, 0x100);
+
+	/* Cb' 127 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.g, 0x8100);
+
+	/* Cr' 127 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.b, 0x8100);
+
+	/* gray to bt709 */
+	out.a = 0xffff;
+	out.r = 0x7fff;
+	out.g = 0x7fff;
+	out.b = 0x7fff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 127 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8100);
+
+	/* Cb' 127 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.g, 0x8100);
+
+	/* Cr' 127 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.b, 0x8100);
+
+	/* == red 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0xffff;
+	out.g = 0x0;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 54 */
+	KUNIT_EXPECT_GT(test, out.r, 0x3500);
+	KUNIT_EXPECT_LT(test, out.r, 0x3700);
+
+	/* Cb' 99 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6200);
+	KUNIT_EXPECT_LT(test, out.g, 0x6400);
+
+	/* Cr' 255 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.b, 0x11000);
+
+	/* == green 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0xffff;
+	out.b = 0x0;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 182 */
+	KUNIT_EXPECT_GT(test, out.r, 0xB500);
+	KUNIT_EXPECT_LT(test, out.r, 0xB780); /* laxed by half*/
+
+	/* Cb' 29 */
+	KUNIT_EXPECT_GT(test, out.g, 0x1C00);
+	KUNIT_EXPECT_LT(test, out.g, 0x1E00);
+
+	/* Cr' 12 */
+	KUNIT_EXPECT_GT(test, out.b, 0x0B00);
+	KUNIT_EXPECT_LT(test, out.b, 0x0D00);
+
+	/* == blue 255 - bt709 enc == */
+	out.a = 0xffff;
+	out.r = 0x0;
+	out.g = 0x0;
+	out.b = 0xffff;
+
+	apply_3x4_matrix(&out, &test_matrix_3x4_bt709_alt_enc);
+
+	/* Y' 18 */
+	KUNIT_EXPECT_GT(test, out.r, 0x1100);
+	KUNIT_EXPECT_LT(test, out.r, 0x1300);
+
+	/* Cb' 255 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7F00);
+	KUNIT_EXPECT_LT(test, out.g, 0x11000);
+
+	/* Cr' 116 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7300);
+	KUNIT_EXPECT_LT(test, out.b, 0x7500);
+}
+
 static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_test_get_lut_index),
 	KUNIT_CASE(vkms_color_test_lerp),
@@ -400,6 +545,7 @@ static struct kunit_case vkms_color_test_cases[] = {
 	KUNIT_CASE(vkms_color_srgb_inv_srgb),
 	KUNIT_CASE(vkms_color_ctm_3x4_50_desat),
 	KUNIT_CASE(vkms_color_ctm_3x4_bt709),
+	KUNIT_CASE(vkms_color_ctm_3x4_bt709_alt),
 	{}
 };
 

-- 
2.51.0

