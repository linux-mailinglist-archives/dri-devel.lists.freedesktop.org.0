Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB3736844F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 18:00:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0E66E3AE;
	Thu, 22 Apr 2021 15:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3B86E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 15:59:58 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id n2so69533286ejy.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MFsgMi1vScM/Xb4Qn/U8v6SwMwWvXpGL3C1LP/euKw=;
 b=VMTL9Pmsx8mAuoF2J0RLpSs6vSjUyH+Qb+ikO0dild2RCYQ3a4jdGEB5/vdO4WmL54
 fQ4M9TjDLVcpbyb5dKniDuDZxSdHtqIhMISryjXKCkBbpaemDHnPmqYHXpbopgJeF86k
 g0l08o39WKNbGipu9sZ+c3RgufZts87Rj+DefkBvns/nFM+DNJUNVIWQF1wwf9XIaYUC
 1fcOaGzE44biHaJdvdwCmp4i/q5lvnEXA7PTiGN8FTRg1jJLqAKXKGYOUSqz4igMivnT
 nGhdxYzRv+EscSZEwEkGuKlJl8MPUwKoM7GGeU5wmzBkcfnLiCBibU4/J0bhU6ok0d5r
 u5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1MFsgMi1vScM/Xb4Qn/U8v6SwMwWvXpGL3C1LP/euKw=;
 b=cBJSZmsUa1KJVxrxNUFDyz72pj7tspY1ENKwaeReXPPtCJR0gTE6IYbKf0gco6f+Cq
 Jd8s7KiIkvkVY8xz+FvuhHIAo4mSFAAA96l6w7vGI3XPdVSv1V5AYSm1LM3L7vt8qZgh
 GMcyfQ98+rCya0lwrHfyil4xhOLarJ61Bd49WnFwf7B8e16E9qsq2UFLf/S8MvOF0UBE
 I/mfFjGRs3Fd0GtSu72BI/GnaIph9cs3uy4H9RgSgdeOHlJusWD50ll2qWJ092L6C0ta
 mVfsFAoLbpzkUbqcbSwobUPTHqpcmJwQrq4cB4ga84QvlM8uMGq/YpG8SBNjzCfJPCBv
 rLlg==
X-Gm-Message-State: AOAM533p+v3067mf4/npBYHGjN3Elmu1u0Flae2UNnDjS8eaZTxWktiw
 KGJPvqdPqm5HbAZ9vMh4/UM=
X-Google-Smtp-Source: ABdhPJxvokTBKhDTnzty8TsRMpTNxLZQx0zh1Pe3lEqnk4rJoiUWmNpIj2+juJqvF+Ghk2xyKBuI5w==
X-Received: by 2002:a17:906:4ed1:: with SMTP id
 i17mr4060093ejv.424.1619107196772; 
 Thu, 22 Apr 2021 08:59:56 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id q25sm2551608edt.51.2021.04.22.08.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 08:59:56 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Matthew Wilcox <willy@infradead.org>
Subject: [PATCH] drm/amd/amdgpu/amdgpu_drv.c: Replace drm_modeset_lock_all
 with drm_modeset_lock
Date: Thu, 22 Apr 2021 17:59:51 +0200
Message-Id: <20210422155951.6314-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_modeset_lock_all() is not needed here, so it is replaced with
drm_modeset_lock(). The crtc list around which we are looping never
changes, therefore the only lock we need is to protect access to
crtc->state.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 671ec1002230..bce8f6793d8e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1439,17 +1439,16 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 	if (amdgpu_device_has_dc_support(adev)) {
 		struct drm_crtc *crtc;
 
-		drm_modeset_lock_all(drm_dev);
-
 		drm_for_each_crtc(crtc, drm_dev) {
+			drm_modeset_lock(&crtc->mutex, NULL);
 			if (crtc->state->active) {
 				ret = -EBUSY;
-				break;
 			}
+			drm_modeset_unlock(&crtc->mutex);
+			if (ret < 0)
+				break;
 		}
 
-		drm_modeset_unlock_all(drm_dev);
-
 	} else {
 		struct drm_connector *list_connector;
 		struct drm_connector_list_iter iter;
-- 
2.31.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
