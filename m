Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19072741AB6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 23:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E10010E3B0;
	Wed, 28 Jun 2023 21:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D798210E391
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 21:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687987376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fP84djK5erd2GrrGFYuKnbHCuXvHXjeqzaJ4gXaZwiY=;
 b=ZNw578iToXhS8R0iXbKZePNvpuDfvvME3cKvSMt04ZzMJ5l8VCcZwNoL0U3wyd8WDmwdCY
 Bf9Py+L4jRtKcHa32kdSG5G3EJ4nBD4wMfxFUQppghFoWTSqbsi2UGbxq5n0y46lt+/Hwy
 nC8QLlvDTm3Q31oucmmR1sNllJwvsTc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-zON2l-LNNJCinGZNhVp-Hw-1; Wed, 28 Jun 2023 17:22:55 -0400
X-MC-Unique: zON2l-LNNJCinGZNhVp-Hw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-313e542e2f5so38567f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 14:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687987374; x=1690579374;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fP84djK5erd2GrrGFYuKnbHCuXvHXjeqzaJ4gXaZwiY=;
 b=NYt2ii7QiumHrX48KRKqJuX0xIl1U0iX/w88H56uLhhLnHMOuRlAxR9cr0WP8n7vSv
 Q1BCGOQIrBbLvEf1wP4sD3tVlvlcmdXkX/EBvKZDojpx3v7BbIRR0en04ckPUde/STCC
 MWSbaKK6cpjWrLM+nQham06nkFyrT84+w6b5bkveJjTM+RtddSiqzzw+rHnhMsbXwfzG
 iimP2j/VhSGqeoaa36SuCXnONW7vf9902Na9CvAFTNYKCU7Fp0hN1qFjqfbDC7YkWuAx
 mhVAL1SfDUITNyMnbKyS76mTcdB6Ytd24h5DVpG7Wft0e68x3JUrMDfhdkvuzKWzg+cX
 mLag==
X-Gm-Message-State: AC+VfDzgb3VFbM6YQMxcX6hTlVe2iCdDiIT30HiRoZNABdMGiYWfUpg4
 bJufE5DfaX85ZFAD9I38+1LYs/8ZgklM70HtL1zPslVKxt0JwLmLNrUmB0LvJhZKxQxDpTqS/HJ
 T26LF94czNX0fFUMZkw1TTzdN5oOF
X-Received: by 2002:a05:6000:151:b0:314:a77:b6c0 with SMTP id
 r17-20020a056000015100b003140a77b6c0mr2925783wrx.1.1687987373883; 
 Wed, 28 Jun 2023 14:22:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5dTARVZLT46r+M/QXdzbg3Pfto134Vfy7ETRKzO1nDBcz+HGLvTECmnUAAxcjTyp3OM3kxvg==
X-Received: by 2002:a05:6000:151:b0:314:a77:b6c0 with SMTP id
 r17-20020a056000015100b003140a77b6c0mr2925773wrx.1.1687987373643; 
 Wed, 28 Jun 2023 14:22:53 -0700 (PDT)
Received: from kherbst.pingu ([95.90.48.30]) by smtp.gmail.com with ESMTPSA id
 r3-20020adfda43000000b0030ae3a6be4asm14294323wrl.72.2023.06.28.14.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 14:22:52 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/nouveau/disp: verify mode on atomic_check
Date: Wed, 28 Jun 2023 23:22:48 +0200
Message-ID: <20230628212248.3798605-3-kherbst@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230628212248.3798605-1-kherbst@redhat.com>
References: <20230628212248.3798605-1-kherbst@redhat.com>
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
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have to verify the selected mode as Userspace might request one which
we can't configure the GPU for.

X with the modesetting DDX is adding a bunch of modes, some so far outside
of hardware limits that things simply break.

Sadly we can't fix X this way as on start it sticks to one mode and
ignores any error and there is really nothing we can do about this, but at
least this way we won't let the GPU run into any errors caused by a non
supported display mode.

However this does prevent X from switching to such a mode, which to be
fair is an improvement as well.

Seen on one of my Tesla GPUs with a connected 4K display.

Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/199
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # v6.1+
Signed-off-by: Karol Herbst <kherbst@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 22c42a5e184d..edf490c1490c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1114,6 +1114,25 @@ nouveau_connector_atomic_check(struct drm_connector *connector, struct drm_atomi
 	struct drm_connector_state *conn_state =
 		drm_atomic_get_new_connector_state(state, connector);
 
+	/* As we can get any random mode from Userspace, we have to make sure the to be set mode
+	 * is valid and does not violate hardware constraints as we rely on it being sane.
+	 */
+	if (conn_state->crtc) {
+		struct drm_crtc_state *crtc_state =
+			drm_atomic_get_crtc_state(state, conn_state->crtc);
+
+		if (IS_ERR(crtc_state))
+			return PTR_ERR(crtc_state);
+
+		if (crtc_state->enable && (crtc_state->mode_changed ||
+					   crtc_state->connectors_changed)) {
+			struct drm_display_mode *mode = &crtc_state->mode;
+
+			if (connector->helper_private->mode_valid(connector, mode) != MODE_OK)
+				return -EINVAL;
+		}
+	}
+
 	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->dev)))
 		return 0;
 
-- 
2.41.0

