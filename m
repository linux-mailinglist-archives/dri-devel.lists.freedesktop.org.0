Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 908EF28265D
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 21:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE636E13C;
	Sat,  3 Oct 2020 19:39:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67406E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Oct 2020 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601753979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=1IoI0EkrFuvdFZWNYyFFEEON1f+8fthEHRT5ClyKvFc=;
 b=NFgoSWpOhQ0MxRtx4he7IZSKUBvuN0WKOt8ChIwMM4YzySZCZyvLVCKvc4K8c0VUmC5/+q
 mYjeKoZU33pPTXesauUXJ5t8mnJpmxSVsylUqqYa9sCKQ8kmXrykuzNk/oRr5IK0fgbZgf
 HdoB6zMpBXUWtYwxrj9x/dOi2wdTdcg=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-29yNtt_qP22k4YRmUsuFGw-1; Sat, 03 Oct 2020 15:39:35 -0400
X-MC-Unique: 29yNtt_qP22k4YRmUsuFGw-1
Received: by mail-qk1-f198.google.com with SMTP id u2so972209qka.2
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Oct 2020 12:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1IoI0EkrFuvdFZWNYyFFEEON1f+8fthEHRT5ClyKvFc=;
 b=C9YfW774BkI5e9IDeuttnzt5nW3SmVliyCpr6R1t7OkcDg7zhAHMl7fGPS1V80E4/T
 gYi4plLtx1C1hIUTRJRrnkiKm9zceDmwm4XzWXsUxck3NQyh0+9jED2UncXRKKMaxxK6
 xn0eHZlc4Xj/mFvUPS534Am6w45XeywgpVOc6DkzDruPVYy0Mo/VKu8/6DV3QYUcuY+S
 SyPxpf3PwDruVkZgjUh0blsjwARwieZRM61Aspw4Wd+jDnnSotPC60O42lNXWlp4YGU8
 g9HPdb/r+pyWXFc3hKwJEJEoFiwGWSdRF/kyTRJIQNlZa0Y8DigNufdL3VlfP5TiwHXM
 thgA==
X-Gm-Message-State: AOAM533T/w85epL2rbH20zqUHQ5SBx41uT5lgPUz9j2qBPQ3P+IbOT3I
 LAA7ldWNHB/nOPKQ16OvQ/MtW3kx1JiyvjNM5bCKxFxFUqUhqyW4yDNYdG1wU3F8IgeV7Z04lo5
 stu5qPHkFNWB8jqe7YVhISVSfGYg5
X-Received: by 2002:a0c:a203:: with SMTP id f3mr2723800qva.33.1601753974821;
 Sat, 03 Oct 2020 12:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4M/pjCxAlSDw6JNZ0/Bzg4FRDd44Ah4W5DbfR+Md9/Z2wSoRt68Ug7QOcM+nGmpJrw5BOBg==
X-Received: by 2002:a0c:a203:: with SMTP id f3mr2723789qva.33.1601753974628;
 Sat, 03 Oct 2020 12:39:34 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id r187sm3730335qkc.63.2020.10.03.12.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 12:39:34 -0700 (PDT)
From: trix@redhat.com
To: patrik.r.jakobsson@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 natechancellor@gmail.com, ndesaulniers@google.com, alan@linux.intel.com,
 airlied@redhat.com, yakui.zhao@intel.com
Subject: [PATCH] drm/gma500: fix double free of gma_connector
Date: Sat,  3 Oct 2020 12:39:28 -0700
Message-Id: <20201003193928.18869-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem:

cdv_intel_dp.c:2101:2: warning: Attempt to free released memory
        kfree(gma_connector);
        ^~~~~~~~~~~~~~~~~~~~

In cdv_intel_dp_init() when the call to cdv_intel_edp_panel_vdd_off()
fails, the handler calls cdv_intel_dp_destroy(connector) which does
the first free of gma_connector. So adjust the goto label and skip
the second free.

Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index 720a767118c9..deb4fd13591d 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -2083,7 +2083,7 @@ cdv_intel_dp_init(struct drm_device *dev, struct psb_intel_mode_device *mode_dev
 			DRM_INFO("failed to retrieve link info, disabling eDP\n");
 			drm_encoder_cleanup(encoder);
 			cdv_intel_dp_destroy(connector);
-			goto err_priv;
+			goto err_connector;
 		} else {
         		DRM_DEBUG_KMS("DPCD: Rev=%x LN_Rate=%x LN_CNT=%x LN_DOWNSP=%x\n",
 				intel_dp->dpcd[0], intel_dp->dpcd[1], 
-- 
2.18.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
