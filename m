Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B49E5B91B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:33:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C8B10E204;
	Thu, 15 Sep 2022 00:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA31610E1CA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UrTT7QwQof63VN7IDSDKfIt2sJtV3+I3xYSNcLHiNaY=;
 b=PLmwqX4Ondb9XXP8bgGkAavS7iKIOx3u9JVtuHYxfay9K/3swa74R7wIcG25tfqGV+Y8ZM
 9CZ+O4fhWSikFJyczTPi7c2R1OFvzQepdwii/w3GELpIKrBpv7kKC+faVIbsOhz6/8vUzM
 gpfkefgHh0eBbLe99V4NSh5sj+fhOrw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-T9IMHNAiNOSOC80KQJ1qMA-1; Wed, 14 Sep 2022 20:33:11 -0400
X-MC-Unique: T9IMHNAiNOSOC80KQJ1qMA-1
Received: by mail-ed1-f69.google.com with SMTP id
 m13-20020a056402510d00b004519332f0b1so8313480edd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=UrTT7QwQof63VN7IDSDKfIt2sJtV3+I3xYSNcLHiNaY=;
 b=4R4Ca0V0Iqp4yhS77yx/xwK3OyVkrFQrs77t8yyz7SyMFmSn7fu+45QHMWiQvgeusc
 7F+3dHccnLtfqjjTHf3LkrJltSyUdgDQIiq0AbmzHbl6DGvE82dEHVpJ0gpCo8gPX4el
 uHPocwNIT1xpkA4NwA9KpsGcHGIQuFqmiKZczOJ57PMphO6+YfHxMiN1xPEXla2wbqQJ
 z4cNjGrpVQKZShyuj9BqEfyFVSGBQjsJB5h6feuadylgypXoofSS1zV0nYfps+IULd2e
 vCOIfxTRpchEu71BVvQ9CMTwEuwlLoUhPzIRJugo86v2XiT6XjN2/qMeM0IIIYJA8GPq
 v/SA==
X-Gm-Message-State: ACgBeo1GFbfFHGJUx7V/WmTS2Us0DyP3kaflCf7R3UmTPwpYaKy8U3HQ
 hgmjv7hs1cTyk4JXfobw3LyM1CLhVtzkB7vH7axpO227pEfHC/oFnAFUv/jLdApxs4GXVJedubG
 UFmXXw+tIZBRmKAf+mVLfg/gcEtkf
X-Received: by 2002:a17:907:b09:b0:76f:99cc:81cd with SMTP id
 h9-20020a1709070b0900b0076f99cc81cdmr26426927ejl.530.1663201990445; 
 Wed, 14 Sep 2022 17:33:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5g8V/nPxzHQDJZl0DRT92LXzhiR3i8YcPsXKLctBnnQWAlIwXPYox1IBRFR7Ze6l8SXhLAKA==
X-Received: by 2002:a17:907:b09:b0:76f:99cc:81cd with SMTP id
 h9-20020a1709070b0900b0076f99cc81cdmr26426916ejl.530.1663201990310; 
 Wed, 14 Sep 2022 17:33:10 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a50cd85000000b0043ba7df7a42sm10701852edi.26.2022.09.14.17.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:33:09 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 8/8] drm/fsl-dcu: remove trailing return
 statements
Date: Thu, 15 Sep 2022 02:32:31 +0200
Message-Id: <20220915003231.363447-9-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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

Remove the trailing return statements at the end of void functions.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c  | 1 -
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index c77df9b7893f..23687551c831 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -147,7 +147,6 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		     DCU_THRESHOLD_OUT_BUF_LOW(BUF_MIN_VAL));
 
 	drm_dev_exit(idx);
-	return;
 }
 
 static const struct drm_crtc_helper_funcs fsl_dcu_drm_crtc_helper_funcs = {
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 1be3062a95df..d0a14b5b506e 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -172,7 +172,6 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	drm_dev_exit(idx);
-	return;
 }
 
 static const struct drm_plane_helper_funcs fsl_dcu_drm_plane_helper_funcs = {
-- 
2.37.3

