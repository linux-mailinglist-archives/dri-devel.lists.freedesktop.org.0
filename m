Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19D5F1D13
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D425410E63C;
	Sat,  1 Oct 2022 14:58:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A5810E639
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kkvjlmHN1GT70TYbeV/tCW9Fb42UM2HGXIPJtWzhOMU=;
 b=BJ6HHgebOX1W9EqFbggc+G49ec078Ew5hbs02j/8mELVyZgykQg596CnvxOkRt4I5bLN+m
 zXdhc4+a6Xa5I+QDJ1Vua7UIXUDOf7c6J9+TDYETKM3WaxEvEN6xqO9RmDjCVYTH4YWHR5
 WyrV6+mItiP+Ty9wJIAdnklKL3K/mXY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-219-4dXzmJxbPke6sj4eY-TzZw-1; Sat, 01 Oct 2022 10:58:41 -0400
X-MC-Unique: 4dXzmJxbPke6sj4eY-TzZw-1
Received: by mail-ej1-f70.google.com with SMTP id
 qk10-20020a1709077f8a00b0078297c303afso2586554ejc.20
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kkvjlmHN1GT70TYbeV/tCW9Fb42UM2HGXIPJtWzhOMU=;
 b=wXIjxMJx2lPX2pv+6kjcN7yhbjU7x9yzXWET05SvYb6R76ed6JJRZs+/WhMyWKT+9T
 0x06W8s0gdQmhtPO2pCiRDKPyGLybguwTgJOkKjrfWjcFp/laaTkTYnrBr3G07E9P/pm
 1o8FbEeKN2P2B637siRKo+oBQCMHe9lTYgjX7u76rDVuMo7p+41wEKCuaJTrVTynp4TY
 30vXOP3N+fBYRiyHPXU+JtnMgg48X7in6DIVYR+i27+VKpF6lRTrctjbCGaClx9G0fNV
 9Sr940VvYxiu4Nq40N5jODNg2bKI25BgkS87t1X6ulfdce4JPUx2QZl7+l5Gf05HLYw/
 fvkA==
X-Gm-Message-State: ACrzQf3WTDvX6v8E0rHzjk3NT2fgOiqdVst24HO+Wz0QWut12gYsBBX2
 kgtobOrQv0fs9aMsvvmViPi/2WJNN/w1pzWkF9uZ+iP3orZH+I+R5czsDU03tIIFrxjfWQxJuwZ
 dkr4NExwY8d/hJyxHCIwLms7FVVE2
X-Received: by 2002:a17:906:8461:b0:78a:5e7c:a46b with SMTP id
 hx1-20020a170906846100b0078a5e7ca46bmr368871ejc.592.1664636320786; 
 Sat, 01 Oct 2022 07:58:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6iCEsOFNwU2idahd/mpe75sVMBpercNJiTFFD1VX3LoGxt69klTiFnKH/4LCENoljmciJjXw==
X-Received: by 2002:a17:906:8461:b0:78a:5e7c:a46b with SMTP id
 hx1-20020a170906846100b0078a5e7ca46bmr368859ejc.592.1664636320624; 
 Sat, 01 Oct 2022 07:58:40 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 la15-20020a170907780f00b007812ba2a360sm2868328ejc.149.2022.10.01.07.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:40 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 9/9] drm/fsl-dcu: remove calls to
 drm_mode_config_cleanup()
Date: Sat,  1 Oct 2022 16:58:02 +0200
Message-Id: <20221001145802.515916-10-dakr@redhat.com>
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

drm_mode_config_init() simply calls drmm_mode_config_init(), hence
cleanup is automatically handled through registering
drm_mode_config_cleanup() with drmm_add_action_or_reset().

While at it, get rid of the deprecated drm_mode_config_init() and
replace it with drmm_mode_config_init() directly.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 4 +---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c | 5 +++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 3ac57516c3fe..cb74ae663f25 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -128,10 +128,9 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	}
 
 	return 0;
+
 done_irq:
 	drm_kms_helper_poll_fini(dev);
-
-	drm_mode_config_cleanup(dev);
 done_vblank:
 	return ret;
 }
@@ -141,7 +140,6 @@ static void fsl_dcu_unload(struct drm_device *dev)
 	drm_atomic_helper_shutdown(dev);
 	drm_kms_helper_poll_fini(dev);
 
-	drm_mode_config_cleanup(dev);
 	fsl_dcu_irq_uninstall(dev);
 }
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
index c3d55c0aca9f..219ca539dedd 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
@@ -23,7 +23,9 @@ int fsl_dcu_drm_modeset_init(struct fsl_dcu_drm_device *fsl_dev)
 	struct drm_device *drm = &fsl_dev->base;
 	int ret;
 
-	drm_mode_config_init(drm);
+	ret = drmm_mode_config_init(drm);
+	if (ret)
+		goto err;
 
 	drm->mode_config.min_width = 0;
 	drm->mode_config.min_height = 0;
@@ -49,6 +51,5 @@ int fsl_dcu_drm_modeset_init(struct fsl_dcu_drm_device *fsl_dev)
 	return 0;
 
 err:
-	drm_mode_config_cleanup(drm);
 	return ret;
 }
-- 
2.37.3

