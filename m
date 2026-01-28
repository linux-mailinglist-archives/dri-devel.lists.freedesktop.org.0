Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HQIJLBGemkp5AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407EA6D4C
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 18:26:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E029C10E740;
	Wed, 28 Jan 2026 17:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="l/RCeaDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AA610E2B9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 17:26:02 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71BE518CB;
 Wed, 28 Jan 2026 18:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1769621124;
 bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=l/RCeaDCETgXlyJvTBp6P54B2jqhi/sPvgWMbKhDWJ7QNTDJa5IbfBmHyba4CwGsj
 SCrfOMcMsBAk4VqdCWpdh4iEVkJ4cq0iaPzK6XQ11niEK3wp6fn0F3nis4Jq/P5+j/
 jQCCYZo3wg2Zg/Kdd59BK26zi5Au7LDWD1UcuAts=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 28 Jan 2026 19:25:26 +0200
Subject: [PATCH v8 01/11] drm/fourcc: Add warning for bad bpp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-xilinx-formats-v8-1-9ea8adb70269@ideasonboard.com>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
In-Reply-To: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pekka Paalanen <ppaalanen@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=0+4PliZFZn2ZEL7NwkuBYPphIbKpznlW8ky3nnE+a14=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpekail7GEf7ieuqRv7uv/kDEZDvLK0RPAIbNz4
 fljyBlDrbGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaXpGogAKCRD6PaqMvJYe
 9VVQEACK6YFdQ9mnuV4a123HQG6WR3MxNCgB64Sp+5lubNNkrnPG9nuYR6k8H14+BL346x4IWPP
 0wW+FIROeLXY06xL++3w4bHku/b9/J0I/24FBqVtdHVKlWs7ctHJk56YPMi8WYpQ66Vr7I2+uT0
 h/SaGBgbu7ReHsKLUTuwibe/ckuDev0P+ENXxrmtowiAeIbyUdKQdl/XbNHFuEev06X5dGmkppp
 3va2vtW/HBRbTMJAWQaTwwAmu6k1FZ/WKtj5N81qRwKXsF1vUy37m8rwBgmyJQOYAfLOUYXPxXK
 2nzbo1pPgOOKiIccCDl5H2qLoAmM6/OTcia1nJ8wFQarPCYxCPIxzBW8kg3N4pfcFW5nRE80hDg
 ZoRfMbS8u4VDJD/9i8fytnaeu2VYGwaJefBHrrXkC509EAh5HXyIN16y7Gru0Z5lzsESuKU2CiY
 ceCHgNs+vVrQmEcXgv5XpNIXfcvkf7B6PiLEwLpwEAN8SZaO5y/jwwUDrPpZfw9PnTKPDaoEFQG
 RlBMz8EJ9XlnOp7JJqXDsVsKAW8Vy3yDVpT4fXbPoKoD6QeId9tyxTnWhfQRYWyLNeiBz0Wc+FM
 31vZhnlCDyM3VLlKWFFOhwKiFLSr3r2JdqIsDUFNTs2xmNfltx07EoSawe3cAs/smJl3d60cnVz
 cUgNe3nw/v4vkdw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vishal.sagar@amd.com,m:anatoliy.klymenko@amd.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:laurent.pinchart@ideasonboard.com,m:michal.simek@amd.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:geert@linux-m68k.org,m:dmitry.baryshkov@oss.qualcomm.com,m:ppaalanen@gmail.com,m:tomi.valkeinen@ideasonboard.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,lists.infradead.org,linux-m68k.org,oss.qualcomm.com,gmail.com,ideasonboard.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[amd.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tomi.valkeinen@ideasonboard.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1407EA6D4C
X-Rspamd-Action: no action

drm_format_info_bpp() cannot be used for formats which do not have an
integer bits-per-pixel in a pixel block.

E.g. DRM_FORMAT_XV15's (not yet in upstream) plane 0 has three 10-bit
pixels (Y components), and two padding bits, in a 4 byte block. That is
10.666... bits per pixel when considering the whole 4 byte block, which
is what drm_format_info_bpp() does. Thus a driver that supports such
formats cannot use drm_format_info_bpp(),

It is a driver bug if this happens, but so handle wrong calls by
printing a warning and returning 0.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/drm_fourcc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
index e0d533611040..e662aea9d105 100644
--- a/drivers/gpu/drm/drm_fourcc.c
+++ b/drivers/gpu/drm/drm_fourcc.c
@@ -491,12 +491,20 @@ EXPORT_SYMBOL(drm_format_info_block_height);
  */
 unsigned int drm_format_info_bpp(const struct drm_format_info *info, int plane)
 {
+	unsigned int block_size;
+
 	if (!info || plane < 0 || plane >= info->num_planes)
 		return 0;
 
-	return info->char_per_block[plane] * 8 /
-	       (drm_format_info_block_width(info, plane) *
-		drm_format_info_block_height(info, plane));
+	block_size = drm_format_info_block_width(info, plane) *
+		     drm_format_info_block_height(info, plane);
+
+	if (info->char_per_block[plane] * 8 % block_size) {
+		pr_warn("unable to return an integer bpp\n");
+		return 0;
+	}
+
+	return info->char_per_block[plane] * 8 / block_size;
 }
 EXPORT_SYMBOL(drm_format_info_bpp);
 

-- 
2.43.0

