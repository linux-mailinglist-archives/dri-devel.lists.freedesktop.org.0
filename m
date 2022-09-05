Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C755AD654
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444A610EA46;
	Mon,  5 Sep 2022 15:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FB910EA42
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7wDtbQGLiE39PVFtlUhXuYz+XJ8dWxVCvJywCPPxRNQ=;
 b=ORGLURHj/wLhnIW5StgTZzoLEbWEpRhvkz7zT8C5nVW3Oi1sVOljI/6AcTbPM/AZEEoA/B
 Ivs542Wt9jioUp5dxVuOQIhR7DcpJxe6xD7XF+V4xMidfxMPZNBruJwC/5ggdY5E2j7J05
 JuOf0vJfWXks+5dFLDiGXBWJP6xV/vk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-510-wjxcugNHMd2gFjV3ABB0Qw-1; Mon, 05 Sep 2022 11:27:34 -0400
X-MC-Unique: wjxcugNHMd2gFjV3ABB0Qw-1
Received: by mail-ej1-f72.google.com with SMTP id
 dr17-20020a170907721100b00741a1ef8a20so2464466ejc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7wDtbQGLiE39PVFtlUhXuYz+XJ8dWxVCvJywCPPxRNQ=;
 b=N0BnVX6JfzCQC/VmgE4zNq78/HCtlXEY9pdIl228muuH7P/QlYspr8GasfkZoEiBnA
 Orgdv7Te4SE9hV5lg0uQnUWpncI6Klhprr4Sh4DodLAcOJ7kYLGHKWpeByicP6fu4Pg1
 fujlhbtVjThK/kux6sSgM4rl5vO62NfCCXfZHjivxJuKzmcoXnS4zDhAQ7UkRMwhR73j
 SEEACfJ5L97jz9QdfmRQZIDQCnDplwIC+7Tm7NGzPPS2g5etgz9KOCVOnuFOCGjxYxyY
 Yqg/I73NigqIKJvAZQXY/EiUBRh4OQTviCwN3lFrLAtV9w2o9oBG1roN6yZrqnyNScAT
 OlkA==
X-Gm-Message-State: ACgBeo2mIgEylt4KKrRSgcOG9UpdbgXUIZb/nkCd1CUo+eg7NvdUtZL4
 lXH5LRGj/lwtCAKFp2xJuutkeKpUEpez6wElE+dxXh7cDCt8YXD91mPPjihlbuRyYHmrcZGmahz
 GFO52wtkewmE/KR3L090kGJTFYEkt
X-Received: by 2002:a17:907:a427:b0:761:2bd0:3e72 with SMTP id
 sg39-20020a170907a42700b007612bd03e72mr6872896ejc.346.1662391653348; 
 Mon, 05 Sep 2022 08:27:33 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5+7yZe7QTs81r9HK652dKS4RqWWeQcqNFOZjjgqfsu9vjr6GJZS80WRbgfEaB3pVKfT3aG+A==
X-Received: by 2002:a17:907:a427:b0:761:2bd0:3e72 with SMTP id
 sg39-20020a170907a42700b007612bd03e72mr6872882ejc.346.1662391653085; 
 Mon, 05 Sep 2022 08:27:33 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i23-20020aa7c9d7000000b0044e7d69091asm2418412edt.85.2022.09.05.08.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 3/7] drm/arm/hdlcd: crtc: use
 drmm_crtc_init_with_planes()
Date: Mon,  5 Sep 2022 17:27:15 +0200
Message-Id: <20220905152719.128539-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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

