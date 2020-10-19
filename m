Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66426292FC6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 22:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7625B6EAAA;
	Mon, 19 Oct 2020 20:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40B26EAAA;
 Mon, 19 Oct 2020 20:45:52 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id p21so436058pju.0;
 Mon, 19 Oct 2020 13:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EJxa0Y7nCs3Tf2gPtGPuKCLZyL3rYvU42pja/POPnYw=;
 b=ry6AqElEvEpY7ozJUzanUkr157xTcDW84vk1uqXe5KioXVcwLPw5jalHV1s0pWC2Af
 rriDWA/Zu7wUv5gHyqX9eXg6WRCK5RElbGpmxCRVi2vW57GeJQ3SMeFO2qMYj8FcxZLR
 o0m+6eFDETpO+n1tIu1lrgv3dtNTu5x5cfpY9GrMlEPs9+TSVIA42/UEQI43UfmpjrkV
 2Hw9XRE0TnlkXbC7x6+JI4L4SaY7eFt3JPDy6pjBUA59rPSTjzxjkfn45iZheO+MtECk
 DV2wknIBeq28KtNVQnc7YJv1N8kDWSLw35D3mSqi7pPHLc4LVdKiwVVQkNqG8KFcc1t5
 HYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EJxa0Y7nCs3Tf2gPtGPuKCLZyL3rYvU42pja/POPnYw=;
 b=B8oyOJeYSiDT5uxMsa1CSGOO5CtKAr9wNmXEahvHAE40HDA4PzQC1tRXfDpInz+cAL
 KagVy78xS9E/jgCdg0qxwwksRB3pH4m1AztmVdcU+f4yYKxv2PUFLBLzCKkXvaqz1T5r
 hpdAwPGq0HfTbdNdPRDKto/ExLrYRipFSFSQBMtY4HgUVNszNXHmvRdSZEznngAmV7AL
 o/zKivQMYcAuwQ/oJTxqVvvffy1P2rNYijiVg/ePFuEtjScA60tebKIjknNINkV9RESB
 K51B/Ce31Gssj6HVVYONcCAZYq/XInMCtn6raGoh+HFHKPueQoHczWc8FC2raAYj86pE
 YGGw==
X-Gm-Message-State: AOAM531PwFtXF5K2AVCFaVEUfYYlRil0eRQ0MuHPTft6duQxPgD1A8iT
 DEDzAiwPhkL7O6MflcvEushNxPk4KQDaFQ==
X-Google-Smtp-Source: ABdhPJwU2P1f6KBpJt/desSFYsQHS6iPfuSxa2BxK+skgo0A6H4N08swifB4YFHe+Ekvo2BsbH5YPw==
X-Received: by 2002:a17:90a:d584:: with SMTP id
 v4mr1272342pju.194.1603140352056; 
 Mon, 19 Oct 2020 13:45:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 q13sm660996pfg.3.2020.10.19.13.45.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 13:45:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/23] drm/msm: Use correct drm_gem_object_put() in fail
 case
Date: Mon, 19 Oct 2020 13:46:11 -0700
Message-Id: <20201019204636.139997-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We only want to use the _unlocked() variant in the unlocked case.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 6abcf9fe480d..3dcb2ef4740f 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1135,7 +1135,11 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	return obj;
 
 fail:
-	drm_gem_object_put(obj);
+	if (struct_mutex_locked) {
+		drm_gem_object_put_locked(obj);
+	} else {
+		drm_gem_object_put(obj);
+	}
 	return ERR_PTR(ret);
 }
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
