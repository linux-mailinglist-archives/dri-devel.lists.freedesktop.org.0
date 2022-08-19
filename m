Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A55859A7A1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9965810E715;
	Fri, 19 Aug 2022 21:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402D10E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPqOotGSruHudwMIkA2GhgTM0KbwtUxu9NgLFadghJM=;
 b=FOn9avGsHkKZW9f+FpWmjsfVLqwpcdzlObFuNTnG6/6yc6UbDBaSzaBI4FGk8jvQpEPIPZ
 N1evTumBYpteTTEnPEodEE/+hN29DLUTWxjLRULlmKF9AepsRTFH+rWBLhHKz8KqoPcKMr
 BP+lrvfEHKgxrZYp6rdAGLxiyiz4THo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-271-ccrVPavkPj2i2496ceKECg-1; Fri, 19 Aug 2022 17:25:45 -0400
X-MC-Unique: ccrVPavkPj2i2496ceKECg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hv19-20020a17090760d300b00730d0a018a6so1948477ejc.21
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=hPqOotGSruHudwMIkA2GhgTM0KbwtUxu9NgLFadghJM=;
 b=H9JL/E2NJvM02pprWoFmMFZDpGW+MSCcYXRoXW21/IsRNvN4+KGZwP1uGeeIhBAlsZ
 igtLEbK0Q3Yj/yJU2WKitL35b/H2lsQh5LzNX2R21phQBZ2wleQBnUqZXLtj8q47UC3+
 mtoIxeeBqA85PIO4tYpcbVSh6cUXCngyfpo5FWSSYkBtLr0hMLsXusI17qxaqfFtXl6u
 mAB+TuJMCiNgjzGdxIogQRvAGLvUMWZLHQjXxlRk8bzMrp0LAxfLHhKYMuNZDIUyIS74
 xKGGjo9acB63nDTF8Vg95Lnr+YFEvqGgfloecAd86LkbffGz3gGaB67HaOCOHtYo1fkt
 AGTg==
X-Gm-Message-State: ACgBeo3qRW8ag3RbghVmPHJTYyD4MQ/wMzHaWGrVgjZj9z+ij2K1bBua
 Ty0mw9nHKXNOk2dwYPYa1W05r7KRCvh86r7oMtlXGb4sQ8e9CjsOt4QokAuTeK0l3lyddC1sD2a
 Zj6gGBD7NFQWasq3Q2BvSS82nfvdT
X-Received: by 2002:a05:6402:415:b0:446:230d:2b82 with SMTP id
 q21-20020a056402041500b00446230d2b82mr5875886edv.200.1660944344405; 
 Fri, 19 Aug 2022 14:25:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7HPGxg5GCr3oNRoWkMSOYoQXdCy3r5Rh15bVdNO88lO8+SW2gzGUe5OSb4mGaG4wbSWPX8tw==
X-Received: by 2002:a05:6402:415:b0:446:230d:2b82 with SMTP id
 q21-20020a056402041500b00446230d2b82mr5875877edv.200.1660944344223; 
 Fri, 19 Aug 2022 14:25:44 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 ej19-20020a056402369300b00445f1fa531bsm3650681edb.25.2022.08.19.14.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:25:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 8/8] drm/arm/malidp: drv: protect device
 resources after removal
Date: Fri, 19 Aug 2022 23:25:38 +0200
Message-Id: <20220819212538.559902-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index aedd30f5f451..8bb8e8d14461 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -234,9 +234,12 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
-	int i;
+	int i, idx;
 	bool fence_cookie = dma_fence_begin_signalling();
 
+	if (!drm_dev_enter(drm, &idx))
+		return;
+
 	pm_runtime_get_sync(drm->dev);
 
 	/*
@@ -267,6 +270,8 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	pm_runtime_put(drm->dev);
 
 	drm_atomic_helper_cleanup_planes(drm, state);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_mode_config_helper_funcs malidp_mode_config_helpers = {
-- 
2.37.2

