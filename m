Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNK3IQI4j2n2MgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A68D13726E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 15:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7355210E81A;
	Fri, 13 Feb 2026 14:41:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="QeVJOLYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424BD10E7FE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 14:41:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770993651; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FBlKLM+xDCtEE5Moql62k0XZri4pErmlKphhoUMaRC/6QgmMSBXBrOingSrqGSuM7mvEKXODyUeg4uIMkVraDY3210QrClv5TBd7Cc31yg/Ac5aYUg86uNTS0zjruuFdiG87ZM3BB62sFJZ1lZlOKB126lbT3b9QpxhkEGsXUXw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770993651;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=y3rVHLRK/iXOxTv3jyXNjK2AAVYqbJ5KhV5LOzFCgEA=; 
 b=cYTiJ9tfkQqKrxayZn2frz9esSdFgjyMNYBT+xMtJEtUNpvGI4z4F4TNRbDsOz54eQ57I1Y6u2gW5zlxBj5fFxOKstf3W/oVKgElIC7Mx2F+TMBhSmGHk0GhjMgWBE5mj3ib8PwklFdlWfUte+uuRmm7Kp5TMIzWf+xkMdrDOdo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770993651; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=y3rVHLRK/iXOxTv3jyXNjK2AAVYqbJ5KhV5LOzFCgEA=;
 b=QeVJOLYqAxJBUSNwnYI2VjYvU/zBVz5dD5t2epyKHdM44wz75pof05NUENZk2lNj
 iH9Fw9CoXeAwuomITbAytt32UZG5A+j8B08PYB41TClljr6wTCrGzAbON9Nwzsoo1Ja
 prznZoYg5UDvR5Zrj0jf/NYiTSo8k8ErtR/DjjYg=
Received: by mx.zohomail.com with SMTPS id 1770993650647610.3468052929142;
 Fri, 13 Feb 2026 06:40:50 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Fri, 13 Feb 2026 11:40:30 -0300
Subject: [PATCH v3 1/2] drm/vkms: Fix bad matrix offset component
 multiplication
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-vkms-composer-fix-matrix-v3-1-2dab74293a23@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770993638; l=2212;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=wCZy79B+eepRoamdAh5pJIaH/bY+oNb2recp2MTBj4s=;
 b=IdfwEaRwwKZ3ARQyVPLGkUtNOyixvY1vIDKVICodhm/GjYx/M25AfUE9CzjjLJpmMFyWrI03v
 XtOvGd01yMWBye2pmGkXknPSi36zEkHpaqwoC577S9RnR1ynf+YkY0F
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
X-Rspamd-Queue-Id: 2A68D13726E
X-Rspamd-Action: no action

Pixels values are packed as 16-bit UNORM values, so the matrix offset
components must be multiplied properly by the idempotent element -i.e.
number 1 encoded as 16-bit UNORM-.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index cd85de4ffd03d..bcc88c54c482b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -17,6 +17,8 @@
 #include "vkms_composer.h"
 #include "vkms_luts.h"
 
+#define UNORM_16BIT_ONE				0xffff
+
 static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
 {
 	u32 new_color;
@@ -139,20 +141,25 @@ VISIBLE_IF_KUNIT void apply_3x4_matrix(struct pixel_argb_s32 *pixel,
 	g = drm_int2fixp(pixel->g);
 	b = drm_int2fixp(pixel->b);
 
+	/*
+	 * Pixels values are packed as 16-bit UNORM values, so the matrix offset
+	 * components must be multiplied properly by the idempotent element -i.e.
+	 * number 1 encoded as 16-bit UNORM-.
+	 */
 	rf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[0]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[1]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[2]), b) +
-	     drm_sm2fixp(matrix->matrix[3]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[3]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	gf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[4]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[5]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[6]), b) +
-	     drm_sm2fixp(matrix->matrix[7]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[7]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	bf = drm_fixp_mul(drm_sm2fixp(matrix->matrix[8]), r) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[9]), g) +
 	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[10]), b) +
-	     drm_sm2fixp(matrix->matrix[11]);
+	     drm_fixp_mul(drm_sm2fixp(matrix->matrix[11]), drm_int2fixp(UNORM_16BIT_ONE));
 
 	pixel->r = drm_fixp2int_round(rf);
 	pixel->g = drm_fixp2int_round(gf);

-- 
2.51.0

