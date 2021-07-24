Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D793D49DB
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 22:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249926E16D;
	Sat, 24 Jul 2021 20:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D92C86E1A7
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 20:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627158471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Q/1snXio7orhyt4GADMoDog5tLPSL6yylMx5qgvWHcw=;
 b=TUyT6Ydlgg/M8eNpPXjaSjLfGa7liEpVCvD4XR6bZsMGKQ4cWVxYDWj1K3g1ScPByqTG3S
 8doiAD8RbSKhsr8zJw2n3Hp6OrdW0DHdeRR5d5l7p2I8VddL2YYzfbga6MfMlBxsEGY+/Y
 DwX1RjnWz3r6Au6fH0H1kBa8JntANJ0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-0Yl2kZrBOH2NAVZFt-Jfpw-1; Sat, 24 Jul 2021 16:27:47 -0400
X-MC-Unique: 0Yl2kZrBOH2NAVZFt-Jfpw-1
Received: by mail-qk1-f199.google.com with SMTP id
 x12-20020a05620a14acb02903b8f9d28c19so4539160qkj.23
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/1snXio7orhyt4GADMoDog5tLPSL6yylMx5qgvWHcw=;
 b=h639ZVot0ill7Dxte9tC3024fEqg057VLwebN4qHDBNapnVBj+Mkqrtp+hBdxEDjfl
 99BinFz8jRvgxItKJ24HPNrLMuA8gHn/67CSX+TglcYYAeiK9uJRaqVkr/2e5mfGD1pu
 EZW5y14LRX6K8ACnxODDs45PBn7AQ6NNP1uHS0lq/ax78mlGm6pD5w+d6kTClK07EWJG
 syHoW9ma6jdLHO/hOZai5hSt+Ng4MTiXqFc+su7mEOtby1UrS22K7lrpTRZI1Jf+sFcE
 kN0NnOe+8jOxViNqDP+vwKye4HI+iz8qg5uCKeBxvpWtmR6tmDLiesYfBEQqOONKm54X
 eBnA==
X-Gm-Message-State: AOAM533lMZNYG3tnBSa3koN5UXnCh/LquphDWlxrXAsTqcP7v2s70Zak
 UAyo4UsJ8J4GHy7n0WUH4K9+9b6vg/AbI0T8y3fo+OO/MH4UnDlbxLYFPnxBcnS6fmAZJaOZBkP
 j7IG2fWM2IJBzAaPLKG3rdfkAlhHK
X-Received: by 2002:a37:f50d:: with SMTP id l13mr10711215qkk.298.1627158467472; 
 Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi6hIhq+NVUhVPqnbgHKJ7z9VSQvET+rT1MdV2KhuXvUks5lvzfgQYu10UOdSyzb83grMAEQ==
X-Received: by 2002:a37:f50d:: with SMTP id l13mr10711196qkk.298.1627158467186; 
 Sat, 24 Jul 2021 13:27:47 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id h68sm16650148qkf.126.2021.07.24.13.27.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 13:27:46 -0700 (PDT)
From: trix@redhat.com
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com,
 nikola.cornij@amd.com, ville.syrjala@linux.intel.com
Subject: [PATCH] drm/nouveau/kms/nv50-: use DRM_NOUVEAU_BACKLIGHT consistently
Date: Sat, 24 Jul 2021 13:27:31 -0700
Message-Id: <20210724202731.3949331-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

A build error when DRM_NOUVEAU_BACKLIGHT is not defined
disp.c:1665:52: error: 'struct nouveau_connector' has no
  member named 'backlight'

Use ifdef's similar to elsewhere in disp.c to conditionally
use the new backlight support.

Move scope of drm to where it is used, inside the backlight error
reporting.

Remove shadow ret decl.

Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 093e1f7163b31..6e957041edfb5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1659,23 +1659,28 @@ static void
 nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
 {
 	struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
-	struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 	struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
 	struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	struct nouveau_backlight *backlight = nv_connector->backlight;
+#endif
 	struct drm_dp_aux *aux = &nv_connector->aux;
 	int ret;
 	u8 pwr;
 
+#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 	if (backlight && backlight->uses_dpcd) {
 		ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
-		if (ret < 0)
+		if (ret < 0) {
+			struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
 			NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
 				 nv_connector->base.base.id, nv_connector->base.name, ret);
+		}
 	}
+#endif
 
 	if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
-		int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
+		ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
 
 		if (ret == 0) {
 			pwr &= ~DP_SET_POWER_MASK;
-- 
2.26.3

