Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wA57Bgo4j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACC8137277
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE4310E807;
	Fri, 13 Feb 2026 14:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="kZclUK0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD6B10E807
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:41:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770993657; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=HNKSYEO43BSZKR0eZ93hRn0XLlDaZfFj7IBmTv7qfYrjCcm6VdBxxh8+f3ZmhP5oZHEOK7OWZEtqifVOgUkL1F4bi8o4uQdgQm5QMprnrGc9hpXM3W0LTGB478B76juXwgDm0xJO9hW+SXhdnySVs88uEE8XoZGlPWWAH5AB7dw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770993657;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Q99fSz617cjZuUG9cDURC1BJCZR9dQA4U0Zu7HoxbkI=; 
 b=Fp6l0+hK0TegsO15FAQf5PwO9TmKqFUdwt0Oo0rh+3KCqJ4OVYbM5aOCAuUhVQjh1Q6FiKPZYEWkhuUbP54KhcACzAZMs7mPxGWBNmTJPSiUYa72vErL8t2P0J7s6KZDQS3WOa7fcMy8a8zmIcrv3iM9TjJNHs5dgy+Mb3CsCKc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770993657; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=Q99fSz617cjZuUG9cDURC1BJCZR9dQA4U0Zu7HoxbkI=;
 b=kZclUK0+L+5NGGYLsw9/zyWhYNDUcbH8HQz5U2CiujVImVkEDQD+o04V/EBu109O
 cQ0v+1FNtxtMNPR6sPYkmrltu21tjohHweCFuIDn6N2EoryJGsEhXumnOJciFcWB045
 rNdThlHzJ9eMxEaMRFEo36Ej49q595UMrV+hmk+U=
Received: by mx.zohomail.com with SMTPS id 1770993655395273.88111312505373;
 Fri, 13 Feb 2026 06:40:55 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Fri, 13 Feb 2026 11:40:31 -0300
Subject: [PATCH v3 2/2] drm/vkms: Add kunit tests for alternative BT709
 encoding matrix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-vkms-composer-fix-matrix-v3-2-2dab74293a23@collabora.com>
References: <20260213-vkms-composer-fix-matrix-v3-0-2dab74293a23@collabora.com>
In-Reply-To: <20260213-vkms-composer-fix-matrix-v3-0-2dab74293a23@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770993638; l=5536;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=PumWczodsBNsggBqCarAvj6hMQRGTFFMA2kbZTwX0bs=;
 b=2xL9RYZi6l9pHElEOH5egYsufFl/iaNiccIH95Olx8MKW7o4A+FYadmrQ20x84cMDgMtBQXDM
 HGu/TvJnUL9A5Xnfbl9+nm1nD/HKqfBNn+3GmZUMLFPCU2b9A0WzkTX
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: 7ACC8137277
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
index 1a1c7cac2f158..3c4d12f652d6a 100644
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
+	KUNIT_EXPECT_GT(test, out.r, 0xfe00);
+	KUNIT_EXPECT_LT(test, out.r, 0x10000);
+
+	/* Cb' 128 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7f00);
+	KUNIT_EXPECT_LT(test, out.g, 0x8100);
+
+	/* Cr' 128 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7f00);
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
+	/* Cb' 128 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7f00);
+	KUNIT_EXPECT_LT(test, out.g, 0x8100);
+
+	/* Cr' 128 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7f00);
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
+	/* Y' 128 */
+	KUNIT_EXPECT_GT(test, out.r, 0x7f00);
+	KUNIT_EXPECT_LT(test, out.r, 0x8100);
+
+	/* Cb' 128 */
+	KUNIT_EXPECT_GT(test, out.g, 0x7f00);
+	KUNIT_EXPECT_LT(test, out.b, 0x8100);
+
+	/* Cr' 128 */
+	KUNIT_EXPECT_GT(test, out.b, 0x7f00);
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
+	/* Cb' 98 */
+	KUNIT_EXPECT_GT(test, out.g, 0x6100);
+	KUNIT_EXPECT_LT(test, out.g, 0x6300);
+
+	/* Cr' 255 */
+	KUNIT_EXPECT_GT(test, out.b, 0xfe00);
+	KUNIT_EXPECT_LT(test, out.b, 0x10000);
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
+	KUNIT_EXPECT_GT(test, out.r, 0xb500);
+	KUNIT_EXPECT_LT(test, out.r, 0xb780); /* laxed by half */
+
+	/* Cb' 29 */
+	KUNIT_EXPECT_GT(test, out.g, 0x1c00);
+	KUNIT_EXPECT_LT(test, out.g, 0x1e00);
+
+	/* Cr' 12 */
+	KUNIT_EXPECT_GT(test, out.b, 0x0b00);
+	KUNIT_EXPECT_LT(test, out.b, 0x0d00);
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
+	KUNIT_EXPECT_GT(test, out.g, 0xfe00);
+	KUNIT_EXPECT_LT(test, out.g, 0x10000);
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

