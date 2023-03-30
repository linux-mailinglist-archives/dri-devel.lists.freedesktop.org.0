Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0695D6D123E
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 00:39:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4287A10F082;
	Thu, 30 Mar 2023 22:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8C810F085
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 22:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680215983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5KLRGaugo3bJYNHTNbGObcKYy+aEw9oHl8WJdhU1s28=;
 b=IvactrNgFYTK31q2S+4NgnWODymlIM9iSK6jA6tmNOOh4b2qUi7ouIiRobu2yDZpi4uRpC
 J9zDZYLgyGnNBPI0toDU/uyBGrOnezZVfMQ/tJ2jjYUimGThocl4/MaGEKPzELmqe0Dvsb
 YeEfcCjLAxgdjLDNs+k61rtAT1IUmWo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-ghB6LQyAPwi-VDLc4Ulc8Q-1; Thu, 30 Mar 2023 18:39:41 -0400
X-MC-Unique: ghB6LQyAPwi-VDLc4Ulc8Q-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020a0564020e8b00b004e59d4722a3so28929354eda.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680215980;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5KLRGaugo3bJYNHTNbGObcKYy+aEw9oHl8WJdhU1s28=;
 b=yLMaXQbdvEqwcuQZtsycKLy3Bj7LoAcaRYMDNy6FVt9V3e+NSHgHLO8olQtjkc27l5
 c1etnJM19hma0qhwnYW9veIkWXeBTUcoV8M8zsM7B4SLGQav74E6PRoj3GvwVEHrRT4T
 D/eBB1Vb0j1YKK7Ocjv8z7vYoqcz7BUoK9Bv1ew9ydqqW3TQKtj2MVzeOMfHnrBOiMpN
 BSriyblFHwGx2jZF92NX2qb+WTQfuOK5nawoSU3A02lfv2rei4QkNvZ//tz1wr0AieMC
 ELqr9yarXUOA2CsN3ppf+HFGIoBmIJOApSr+PeLfFPyew3hyz9vB4bPeun0wuXRKLssT
 Anow==
X-Gm-Message-State: AAQBX9duOA4hqx3/pLcCoQD7Ba0azRdSM1ps2Zp6/cqmYB2KQMihIg8M
 ysfLMJgMWykRtoc421pEdKnTNsXtyKqH/2tnugscSHdWFPJxjazGe7jWM6XX4WZUhFDb/npCc7S
 YPKXhfllLobym2ZpYnvb09k3zwvLc
X-Received: by 2002:a17:906:297:b0:932:170:e07b with SMTP id
 23-20020a170906029700b009320170e07bmr2717007ejf.7.1680215980702; 
 Thu, 30 Mar 2023 15:39:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350YArwjRfAnCTrwT8vxsxel4wJik3BioMPfTSW1diiRfUzP7BNbx8CC8jIFESIUiLA6Oy1WH9w==
X-Received: by 2002:a17:906:297:b0:932:170:e07b with SMTP id
 23-20020a170906029700b009320170e07bmr2716990ejf.7.1680215980283; 
 Thu, 30 Mar 2023 15:39:40 -0700 (PDT)
Received: from kherbst.pingu (ip1f113ce7.dynamic.kabel-deutschland.de.
 [31.17.60.231]) by smtp.gmail.com with ESMTPSA id
 t2-20020a1709061be200b00932b3e2c015sm288612ejg.51.2023.03.30.15.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 15:39:39 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/disp: Support more modes by checking with lower
 bpc
Date: Fri, 31 Mar 2023 00:39:38 +0200
Message-Id: <20230330223938.4025569-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This allows us to advertise more modes especially on HDR displays.

Fixes using 4K@60 modes on my TV and main display both using a HDMI to DP
adapter. Also fixes similiar issues for users running into this.

Cc: stable@vger.kernel.org # 5.10+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 32 +++++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c    |  8 ++++---
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index ed9d374147b8d..f28e47c161dd9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -363,6 +363,35 @@ nv50_outp_atomic_check_view(struct drm_encoder *encoder,
 	return 0;
 }
 
+static void
+nv50_outp_atomic_fix_depth(struct drm_encoder *encoder, struct drm_crtc_state *crtc_state)
+{
+	struct nv50_head_atom *asyh = nv50_head_atom(crtc_state);
+	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+	struct drm_display_mode *mode = &asyh->state.adjusted_mode;
+	unsigned int max_rate, mode_rate;
+
+	switch (nv_encoder->dcb->type) {
+	case DCB_OUTPUT_DP:
+		max_rate = nv_encoder->dp.link_nr * nv_encoder->dp.link_bw;
+
+                /* we don't support more than 10 anyway */
+		asyh->or.bpc = max_t(u8, asyh->or.bpc, 10);
+
+		/* reduce the bpc until it works out */
+		while (asyh->or.bpc > 6) {
+			mode_rate = DIV_ROUND_UP(mode->clock * asyh->or.bpc * 3, 8);
+			if (mode_rate <= max_rate)
+				break;
+
+			asyh->or.bpc -= 2;
+		}
+		break;
+	default:
+		break;
+	}
+}
+
 static int
 nv50_outp_atomic_check(struct drm_encoder *encoder,
 		       struct drm_crtc_state *crtc_state,
@@ -381,6 +410,9 @@ nv50_outp_atomic_check(struct drm_encoder *encoder,
 	if (crtc_state->mode_changed || crtc_state->connectors_changed)
 		asyh->or.bpc = connector->display_info.bpc;
 
+	/* We might have to reduce the bpc */
+	nv50_outp_atomic_fix_depth(encoder, crtc_state);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index e00876f92aeea..d49b4875fc3c9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -263,8 +263,6 @@ nouveau_dp_irq(struct work_struct *work)
 }
 
 /* TODO:
- * - Use the minimum possible BPC here, once we add support for the max bpc
- *   property.
  * - Validate against the DP caps advertised by the GPU (we don't check these
  *   yet)
  */
@@ -276,7 +274,11 @@ nv50_dp_mode_valid(struct drm_connector *connector,
 {
 	const unsigned int min_clock = 25000;
 	unsigned int max_rate, mode_rate, ds_max_dotclock, clock = mode->clock;
-	const u8 bpp = connector->display_info.bpc * 3;
+	/* Check with the minmum bpc always, so we can advertise better modes.
+	 * In particlar not doing this causes modes to be dropped on HDR
+	 * displays as we might check with a bpc of 16 even.
+	 */
+	const u8 bpp = 6 * 3;
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE && !outp->caps.dp_interlace)
 		return MODE_NO_INTERLACE;
-- 
2.39.2

