Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C22859A90D
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1610510E4B4;
	Fri, 19 Aug 2022 23:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A7910E213
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wDtbQGLiE39PVFtlUhXuYz+XJ8dWxVCvJywCPPxRNQ=;
 b=PnCDG3mxiOjW2BQahm8w1uA8IQzG3msjFuLKpKinCI8975HodqOhPnBruWyDQg8hgl/SaG
 8iwcdGeqAcRzyNP92OCL9XqZqN1m/jjhS/0ri0JzbYnvWXrUg4CjoBWpHnEP8L/Ohb6DDT
 0217RWaY8Tx+gsL6IldVyzj8rJvu4yA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-3ICOLQCyN527Esq0ELL9yA-1; Fri, 19 Aug 2022 19:11:09 -0400
X-MC-Unique: 3ICOLQCyN527Esq0ELL9yA-1
Received: by mail-ed1-f72.google.com with SMTP id
 r12-20020a05640251cc00b00440647ec649so3506589edd.21
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7wDtbQGLiE39PVFtlUhXuYz+XJ8dWxVCvJywCPPxRNQ=;
 b=yoQ8E/s9JZ8DpPCZVRg+KvVv/G++PR68jy7mLl3GFgm6WzE6O7ZMUiupiduvM3jT8M
 mjTH5gSfpY0PoB6lbodvcHOdP1mDmIrjnSqG6CHghvi5tMJa0eeFfXUk/vyzzBhf4bTU
 61z3dpveqZWV3HaTc6V6wTjs/eRxRvoLZwounsLI8bdKjzHV2vpmzdOyVLZyTFXb/JVN
 cWb8e6jmRNNhCLIL5mCvdWghUVxRwAzGpXTPl5ZbWpZoWjyyBYuEfhcOZVaX5m5VGW3I
 35LSTYAmVCtRoJoEilbCDRMuFD/40yVd7ww2PWicRAUK/AUUMPIBM0AEeu3X+wvwusdv
 EVcw==
X-Gm-Message-State: ACgBeo0hqnrqst2jxjyYP7OuAl6Y2wl8LT2yjYnIszSmbvrFyFXafVku
 7CmAzSor47X8KUHa0u/hyeq5mbn9Tt9DkSHWRFa03foHg2Skjt1qG545mXYtjvvP01Ashe39Y3U
 RVWM1e0GCanMBQR9YPaljauqEQ0ux
X-Received: by 2002:a05:6402:d57:b0:445:fba7:422d with SMTP id
 ec23-20020a0564020d5700b00445fba7422dmr7839118edb.138.1660950668522; 
 Fri, 19 Aug 2022 16:11:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5ZHmzoVrJtKFNxyLeq3xlHQ8rgV2AX90b7fLIXFYEYTM65oS0HV/TmNv1//+V+iUNwTnHqfA==
X-Received: by 2002:a05:6402:d57:b0:445:fba7:422d with SMTP id
 ec23-20020a0564020d5700b00445fba7422dmr7839114edb.138.1660950668409; 
 Fri, 19 Aug 2022 16:11:08 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a1709060a1400b007303fe58eb2sm2844636ejf.154.2022.08.19.16.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 3/7] drm/arm/hdlcd: crtc: use
 drmm_crtc_init_with_planes()
Date: Sat, 20 Aug 2022 01:10:54 +0200
Message-Id: <20220819231058.647658-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
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
to get rid of the explicit drm_crtc_cleanup() call.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/hdlcd_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index 4a8959d0b2a6..c0a5ca7f578a 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -42,7 +42,6 @@ static void hdlcd_crtc_cleanup(struct drm_crtc *crtc)
 
 	/* stop the controller on cleanup */
 	hdlcd_write(hdlcd, HDLCD_REG_COMMAND, 0);
-	drm_crtc_cleanup(crtc);
 }
 
 static int hdlcd_crtc_enable_vblank(struct drm_crtc *crtc)
@@ -333,8 +332,8 @@ int hdlcd_setup_crtc(struct drm_device *drm)
 	if (IS_ERR(primary))
 		return PTR_ERR(primary);
 
-	ret = drm_crtc_init_with_planes(drm, &hdlcd->crtc, primary, NULL,
-					&hdlcd_crtc_funcs, NULL);
+	ret = drmm_crtc_init_with_planes(drm, &hdlcd->crtc, primary, NULL,
+					 &hdlcd_crtc_funcs, NULL);
 	if (ret)
 		return ret;
 
-- 
2.37.2

