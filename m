Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E79248FE7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 23:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E210E6E185;
	Tue, 18 Aug 2020 21:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2B66E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 21:05:41 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id 62so19674578qkj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 14:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pXkXss55rzS0+J1j9G8LMC0JZgD8Ur2mdy76naLbvow=;
 b=WAutCtk2nyozjMSBlmFY17jetDNC4bvP4BhC0GQXYXAfAoFeqajlBOhbc1+/Plpybv
 IP7ZhsOEYJ//bh4b9uvTFDpPut+1p6mh+4/cPZr5NCMRZqNRwpjnbY5TAvnZdQGq0fNB
 t7ZwgQpfNYDSEpEjKtyuQDhWvBnFgjXYfh5zCiLtliTfNrXHiX3He8EmFbE4wUmk/+MZ
 S2SnWFd7+ea+YaqahtcWsDObs+qi+NGdRzxnwUdOKZR49OwPfW+OND/aR9xtt5tcO4GT
 uSQLJkP0B5fTEZLiH2ga1bx/wlcYIyNX312p3yRLSgemAASX1v1VXuFH0KexhUjTgSIi
 Hktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pXkXss55rzS0+J1j9G8LMC0JZgD8Ur2mdy76naLbvow=;
 b=d5eWJdrxSqHGPw/3XFNTdHrPGUbzY2uuStnVFYo3ft8RUzc0LBaYdkLhN7a1AepgZ+
 QSjWm9poMbYoMuO/oIszc+fQf1W/sG3bn0SJtdko7wdu2EG9gx77wm0fLP5izq3XrLa8
 +n1moUcJuvjCEy8Q6g/Fnojsss/LTHHJyzj6cMuqPfF83mz2nOolkkNhz8q69pdis4EE
 sL3q3ySw/rHpnThQLI2gp7CQh/cU6E6V1E+k7rmGb7LHjgN+FYtpB5DiqGTbr4PW7+6k
 JXO5Qrgj+CxCm1F1Vn0mNmjJj2mUAWa9UCCm++KJ/3fXX3HvPzTNdv/N485GwxBF/G8S
 RvlQ==
X-Gm-Message-State: AOAM533UZpNL00/bEGTaOjtkmHEKNxGezvM6xAuI44j3XzX6SDdTU+8y
 sJGSpUp0HxNFWp/0g21lq9FiRHtmULdBRQ==
X-Google-Smtp-Source: ABdhPJyGv57BDi7otsY4P77LrwXSLTFc/7q5MJRZ7dGvfqc5idTKZescuPzVgq2m+wxYV33subOqAw==
X-Received: by 2002:a05:620a:15e9:: with SMTP id
 p9mr19658161qkm.38.1597784740107; 
 Tue, 18 Aug 2020 14:05:40 -0700 (PDT)
Received: from localhost (mobile-166-177-184-140.mycingular.net.
 [166.177.184.140])
 by smtp.gmail.com with ESMTPSA id b37sm26385985qtk.85.2020.08.18.14.05.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 18 Aug 2020 14:05:39 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 seanpaul@chromium.org, airlied@linux.ie
Subject: [PATCH v6 13/14] drm/atomic: Use debug category printer for atomic
 state printer
Date: Tue, 18 Aug 2020 17:05:09 -0400
Message-Id: <20200818210510.49730-14-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200818210510.49730-1-sean@poorly.run>
References: <20200818210510.49730-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

The atomic state is printed if the DRM_UT_STATE is active, but it's
printed at INFO level. This patch converts it to use the debug
category printer so:

a- it's consistent with other DRM_UT_STATE logging
b- it's properly routed through drm_trace when introduced

Signed-off-by: Sean Paul <seanpaul@chromium.org>

Changes in v6:
-Added to the set
---
 drivers/gpu/drm/drm_atomic.c        | 5 +++--
 drivers/gpu/drm/drm_atomic_uapi.c   | 2 +-
 drivers/gpu/drm/drm_crtc_internal.h | 3 ++-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 58527f151984..96b804e85903 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1543,9 +1543,10 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state)
+void drm_atomic_print_state(const struct drm_atomic_state *state,
+			    const char *prefix)
 {
-	struct drm_printer p = drm_info_printer(state->dev->dev);
+	struct drm_printer p = drm_debug_category_printer(DRM_UT_STATE, prefix);
 	struct drm_plane *plane;
 	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 25c269bc4681..c6f3c652f47c 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1413,7 +1413,7 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 		ret = drm_atomic_nonblocking_commit(state);
 	} else {
 		if (drm_debug_enabled(DRM_UT_STATE))
-			drm_atomic_print_state(state);
+			drm_atomic_print_state(state, "commit_state");
 
 		ret = drm_atomic_commit(state);
 	}
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index da96b2f64d7e..077ea92fb12a 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -233,7 +233,8 @@ int __drm_atomic_helper_disable_plane(struct drm_plane *plane,
 int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 				   struct drm_atomic_state *state);
 
-void drm_atomic_print_state(const struct drm_atomic_state *state);
+void drm_atomic_print_state(const struct drm_atomic_state *state,
+			    const char *prefix);
 
 /* drm_atomic_uapi.c */
 int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
