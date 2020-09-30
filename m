Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4927F406
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 23:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC84C6E82A;
	Wed, 30 Sep 2020 21:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D2C66E82A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 21:16:14 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id u24so1973062pgi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sZW+8qKOp3m43EfWZLNpJYe1y36F8PokgEJuoCHampY=;
 b=DSvNOsY80NqlhtrpB6F4YIGtNeFRvcqI6Qi9dvCdoIgoXmCRKCfOk5Z+jEO4dNARk4
 EU1x5GkkcDXojG2N/B2HvMfc9/jT0ajyGH+xbjaCX9z4ad6qmeMjfZelwlEQkSzztvW0
 3x3/tWU03NS9gCfXzkAdrl12JATRE+QoU8UHqf2uJ0GLEYpC0Yj6oQIAIRTN3bifMTNA
 jbys/un2T6JWNzKetHOLZCcgITrgjeJzqxed/KOusEJc/BdPYM4NEykXI8MrBDaY9oBZ
 QqBeJrDbu7mYwMl4/JOnX2EbysOQJd114vKdiweNyRb2wfbpmUT2FWcdjeS5uWrdr2fH
 0Aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sZW+8qKOp3m43EfWZLNpJYe1y36F8PokgEJuoCHampY=;
 b=GE4MZjZ4Gi8bTjuxjtrnKM87POkMdjA4ZmK9HgUMNj77lPubXVuzw/Qr+bjl9Wh65y
 lzoeEi0A/uWN42KOIDGQhm6I+Kc7Q2NSfVDO5ez053U/BtAIzzQag54KcIUIdkW3NMMN
 TiZhZSVhf2WPbpAeighOSlVPjtq/HlViglpcCNp2KT11K27mgSnWMtLJA5Kb+p6abUhc
 fBgsCl7sHpvm3hcNq1FB7x6izaCTLTjphJGHkeoH2fcEvTNb1BPJkkNHwJTC/1iHbUyy
 5Bt5V6kjJ25m+XWv+Jz0ZCCzUW9y4EA/yWWoAYNea0lGBw2X42WeO86RIHeRvbRCTU8q
 cKZQ==
X-Gm-Message-State: AOAM532OZ/PvhUv2UwdKzgkWoSsv96p7hFUq3OFkr+RCS7wSuAEISm5g
 TSus1sIafcTS1dvjQD2cqE8ai4vtH2E=
X-Google-Smtp-Source: ABdhPJxsFSNjgHpDzNtq4wVwgWANkelu4M73iefGHxOFIlorIu5tIYxVaPZjytP/ZipCAPyGNUuPpw==
X-Received: by 2002:aa7:8bd4:0:b029:13c:1611:6538 with SMTP id
 s20-20020aa78bd40000b029013c16116538mr1354483pfd.10.1601500573113; 
 Wed, 30 Sep 2020 14:16:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id u6sm3134612pjy.37.2020.09.30.14.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 14:16:12 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/crtc: Introduce per-crtc kworker
Date: Wed, 30 Sep 2020 14:17:20 -0700
Message-Id: <20200930211723.3028059-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200930211723.3028059-1-robdclark@gmail.com>
References: <20200930211723.3028059-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, timmurray@google.com,
 Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This will be used for non-block atomic commits.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_crtc.c | 11 +++++++++++
 include/drm/drm_crtc.h     |  8 ++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index aecdd7ea26dc..4f7c0bfce0a3 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -326,6 +326,14 @@ int drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *crtc,
 					   config->prop_out_fence_ptr, 0);
 		drm_object_attach_property(&crtc->base,
 					   config->prop_vrr_enabled, 0);
+
+		crtc->worker = kthread_create_worker(0, "%s-worker", crtc->name);
+		if (IS_ERR(crtc->worker)) {
+			drm_mode_object_unregister(dev, &crtc->base);
+			ret = PTR_ERR(crtc->worker);
+			crtc->worker = NULL;
+			return ret;
+		}
 	}
 
 	return 0;
@@ -366,6 +374,9 @@ void drm_crtc_cleanup(struct drm_crtc *crtc)
 
 	kfree(crtc->name);
 
+	if (crtc->worker)
+		kthread_destroy_worker(crtc->worker);
+
 	memset(crtc, 0, sizeof(*crtc));
 }
 EXPORT_SYMBOL(drm_crtc_cleanup);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 59b51a09cae6..dfdb04619b0d 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -30,6 +30,7 @@
 #include <linux/types.h>
 #include <linux/fb.h>
 #include <linux/hdmi.h>
+#include <linux/kthread.h>
 #include <linux/media-bus-format.h>
 #include <uapi/drm/drm_mode.h>
 #include <uapi/drm/drm_fourcc.h>
@@ -1172,6 +1173,13 @@ struct drm_crtc {
 	 * Initialized via drm_self_refresh_helper_init().
 	 */
 	struct drm_self_refresh_data *self_refresh_data;
+
+	/**
+	 * @worker:
+	 *
+	 * Per-CRTC worker for nonblock atomic commits.
+	 */
+	struct kthread_worker *worker;
 };
 
 /**
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
