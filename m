Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC35F1D0A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F8910E5C9;
	Sat,  1 Oct 2022 14:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59D110E40B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xaw3iUtMLKwH2xCvo5P17z6DGidg5D+TvENUAVXK2ek=;
 b=V7P63kD+Nw81eF0XxMKLp2BS7t+13/8Cf++yR5mJEolo+jhlonxKwXL0lBoXpRTCjeUfg5
 wMeRRrejGEKnX/NlCDrQvowDsfH5SKc2yYFXhFJK24qagHOIdlYfDYloNmK6WG7o/Pqsnj
 7vl978VlOeiqsVBpEgeD/ZJoNdxT4P8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-QcbulKGbOf6-mTpmYPIP7g-1; Sat, 01 Oct 2022 10:58:19 -0400
X-MC-Unique: QcbulKGbOf6-mTpmYPIP7g-1
Received: by mail-ed1-f69.google.com with SMTP id
 e15-20020a056402190f00b0044f41e776a0so5609758edz.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Xaw3iUtMLKwH2xCvo5P17z6DGidg5D+TvENUAVXK2ek=;
 b=vRz0HdG76zEkJqp4i2gPV06zEREGj9RyAeXYf1PnKA+r+LV43lO65WveRBAZMICnWf
 TMtRg0SL136s+idUSp42DJ276R77EHjYv3fzCWuzN9cwfMtxqEUronNGjQNMnjD6uw+t
 KjJuYpapqTyq+rV1SzM9lMmycE60esHGaLVgFdqZyowhYWr5vSPQN20yP8B3UiPm5mSb
 zDiTT/LP4vz2arnDk7+Ccbiv5dTPxVyrCx48SarUum9zr0Qo0vUfPBIfAFAJTNjeC/75
 GiPmZY73r8eGhqQapUqJmyCOuwRyNtF0LJ8jQnAE6gTzE1RUhb6jisyWfbEqke3DBSIM
 XrSA==
X-Gm-Message-State: ACrzQf2cvjJ2sE0DaXHX4jJyhbK7MnJ2vjCiAgdEZOGTK5k7UAgzS78U
 hcZjLKX2+btezF5YAllqDEEnKpLvVvn09cXnbAfZw+DN8m84TYvjoKpdKvcqm3B7TuKOd1I460n
 hK7Oe/MSOZ1935oSOvi3ih0LE9+GB
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr9931980ejc.755.1664636298702; 
 Sat, 01 Oct 2022 07:58:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6McnwQbh25ByTVLN8VQt9u6fQvaQzvbsTHh1j6XxDmkF9GAiQCD/6b0HFlFj3pU/ONxJXXjQ==
X-Received: by 2002:a17:907:3e03:b0:722:e694:438 with SMTP id
 hp3-20020a1709073e0300b00722e6940438mr9931973ejc.755.1664636298531; 
 Sat, 01 Oct 2022 07:58:18 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q21-20020a17090676d500b0072af4af2f46sm2816338ejn.74.2022.10.01.07.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 3/9] drm/fsl-dcu: crtc: use
 drmm_crtc_init_with_planes()
Date: Sat,  1 Oct 2022 16:57:56 +0200
Message-Id: <20221001145802.515916-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drmm_crtc_init_with_planes() instead of drm_crtc_init_with_planes()
to get rid of the explicit destroy hook in struct drm_plane_funcs.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index e05311e2b0e0..0b70624260fc 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -159,7 +159,6 @@ static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 static const struct drm_crtc_funcs fsl_dcu_drm_crtc_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
-	.destroy = drm_crtc_cleanup,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = drm_atomic_helper_crtc_reset,
 	.set_config = drm_atomic_helper_set_config,
@@ -180,8 +179,8 @@ int fsl_dcu_drm_crtc_create(struct fsl_dcu_drm_device *fsl_dev)
 	if (!primary)
 		return -ENOMEM;
 
-	ret = drm_crtc_init_with_planes(drm, crtc, primary, NULL,
-					&fsl_dcu_drm_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, crtc, primary, NULL,
+					 &fsl_dcu_drm_crtc_funcs, NULL);
 	if (ret) {
 		primary->funcs->destroy(primary);
 		return ret;
-- 
2.37.3

