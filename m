Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E7F5AD622
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A61510EA22;
	Mon,  5 Sep 2022 15:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC8110E41B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hPqOotGSruHudwMIkA2GhgTM0KbwtUxu9NgLFadghJM=;
 b=MGnZiADzzYFrKi2uPVMv5v6QgkAHDMj0sIUw/JjijoJQ5zFm9g5jM91IxUrAfx1tgdi4KU
 vusnRUsZ1XKpDzuW7tsAdqcfL9FJMPmF8VX7jdEU7EXTSYESkwkdGguVoBQcSCzoIe579F
 DwcMv+lH5fCFEiTqp57tafgvUM+UBVQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-607-1oemnaw1MsGR-TFc7CF9hA-1; Mon, 05 Sep 2022 11:20:45 -0400
X-MC-Unique: 1oemnaw1MsGR-TFc7CF9hA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c64-20020a1c3543000000b003a61987ffb3so5481783wma.6
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hPqOotGSruHudwMIkA2GhgTM0KbwtUxu9NgLFadghJM=;
 b=wqc96pRT/kg1owyEGN8w/3o8CAGxpWmIu9zqsB4F53XNT1lsOZul0JoP10wqm1DBRA
 Pc4meMmjj944Xv9F7s+sAufabqlEPeNdigNuUqPrtpxE7zvzOZkEV0GBwtz3/hI7n5ed
 RhCu8XqRLM/+ENHoW94WkUIV4SwHJbVbOJRHTBQdYUD+Y/OowljXwIcvi+lSTVng99nd
 hKAtcMWmk2pm4Aj/sl1ko19FvsTWDWTSNXkw656/2bDceg3j0elC2CANaBe1v6YQH59f
 QS7MSF2fAlnPh8CCxEddccfYSAXmPc9En5sMM6E8BTm3ozO7SdxJelKJ4KXyWXFX4JM8
 n/+g==
X-Gm-Message-State: ACgBeo0GTNYKBBaDdecOIk67TpNa3xeoRabZjhNCXrrLFbt7yk6OLAa6
 3YRS7uwEgZzPs/HKf4rN7X66+X5E0/+LOw5Y59fza+Aym+GuW7h6uHtL34sqCXyy9hLkiiemurH
 xozM5REiEO9QWY+yJuwxvJILzjiwA
X-Received: by 2002:a05:600c:1c0f:b0:3a5:4d6b:a883 with SMTP id
 j15-20020a05600c1c0f00b003a54d6ba883mr11252458wms.45.1662391244721; 
 Mon, 05 Sep 2022 08:20:44 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7nVSVriafKyRymiV7fyQtuEeLvMSSb3JbyLOA78o+7ULCvGCL0DCvbENDPzt7s804RJJ3wAg==
X-Received: by 2002:a05:600c:1c0f:b0:3a5:4d6b:a883 with SMTP id
 j15-20020a05600c1c0f00b003a54d6ba883mr11252445wms.45.1662391244580; 
 Mon, 05 Sep 2022 08:20:44 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adff385000000b00228c792aaaasm1383446wro.100.2022.09.05.08.20.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:20:44 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 8/8] drm/arm/malidp: drv: protect device
 resources after removal
Date: Mon,  5 Sep 2022 17:20:41 +0200
Message-Id: <20220905152041.98451-2-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
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

