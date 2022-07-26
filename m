Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB22258190F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:51:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDAE9278A;
	Tue, 26 Jul 2022 17:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B8D9645C;
 Tue, 26 Jul 2022 17:50:57 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id f11so13759692pgj.7;
 Tue, 26 Jul 2022 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tv9XZJtMf2UZGPK9r5daZO8lAjNs4ugv43Of9czCQIM=;
 b=n6N05FO3A/857gPBbDiuof2GwBfUn9kG0puB7kE8lFbQKIRgt5AHPZzAAaOh3dGaw+
 I0qC2WcECj1kdPZjXnWb2ynEpT0VEDMaY6F4290Haflq9ssHlBMTUon11dWEoP73dzhf
 QATtcmH9W6axNlapK/asy95XPOrDO5j6fV3PCqKz1+u+uvnOrCaQ36QvvRXKMZYLcL43
 fxhdUO4uzY6xfRvqsDmJ3lxyZnCuMuY4gEPFRh+lNZfpo6IBoOhjVOlWDypeT/R1l8cv
 jpP2SBPbKIuFLlqXbE7uv92AFhfT34u/Sku5aJTW7yANKYxCyAwXSjbjTzttH8HfRATU
 7XRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tv9XZJtMf2UZGPK9r5daZO8lAjNs4ugv43Of9czCQIM=;
 b=oHR64ctuD2rvkB4d8NNJv+4GWyxx+QYnzdR5d2BNQIZ6mrasZ3X42UzTLgSaO2M7iQ
 xsiPdtLkbg7UPk5ooxSlQcZXmShUiQZ8TxSUXwGcTLOpG5vod/uv1d1w46ukAUObv005
 qpz97xhKMm5PENNXrrOTNVZ6jSeeJMehR/xlZGO+ot/bKqPh8ZI0BS+RASDVoo8PUs+Z
 p/dIvEyEKUKs6j0adXq9N1snlfkAChrv1vsTNxvKfleMNF/h79R982oqHr2+Kqdw9CQ7
 cUclkkxXEJGflTxbss36KfMH4dPe/+wupzEqCDPYbIYUQNKw+IHCFPbGCUHXErW2jWql
 BI+g==
X-Gm-Message-State: AJIora9Jl5UOMDOkojZTYGX8Sw4hCrAc+I/llYLkz9bE00m455DhHrey
 ToFFLiYydLMMEwwmuy2QZHK7hlKQLRM=
X-Google-Smtp-Source: AGRyM1t4eqbPaP3I7M4Q4a8CREAJGaFkgWHmK7O/ZXpR+tC19xQ9DUEs+FBui8DB+uQCfvsd4JVx/A==
X-Received: by 2002:a05:6a00:1590:b0:52a:eb00:71dc with SMTP id
 u16-20020a056a00159000b0052aeb0071dcmr18652289pfk.64.1658857856554; 
 Tue, 26 Jul 2022 10:50:56 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 202-20020a6302d3000000b003db7de758besm10637529pgc.5.2022.07.26.10.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 10:50:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 15/15] drm/msm/gem: Convert to lockdep assert
Date: Tue, 26 Jul 2022 10:50:39 -0700
Message-Id: <20220726175043.1027731-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220726175043.1027731-1-robdclark@gmail.com>
References: <20220726175043.1027731-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3c6add51d13b..c4844cf3a585 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -197,8 +197,8 @@ msm_gem_unlock(struct drm_gem_object *obj)
 	dma_resv_unlock(obj->resv);
 }
 
-static inline bool
-msm_gem_is_locked(struct drm_gem_object *obj)
+static inline void
+msm_gem_assert_locked(struct drm_gem_object *obj)
 {
 	/*
 	 * Destroying the object is a special case.. msm_gem_free_object()
@@ -212,13 +212,10 @@ msm_gem_is_locked(struct drm_gem_object *obj)
 	 * Unfortunately lockdep is not aware of this detail.  So when the
 	 * refcount drops to zero, we pretend it is already locked.
 	 */
-	return dma_resv_is_locked(obj->resv) || (kref_read(&obj->refcount) == 0);
-}
-
-static inline void
-msm_gem_assert_locked(struct drm_gem_object *obj)
-{
-	GEM_WARN_ON(!msm_gem_is_locked(obj));
+	lockdep_assert_once(
+		(kref_read(&obj->refcount) == 0) ||
+		(lockdep_is_held(&obj->resv->lock.base) != LOCK_STATE_NOT_HELD)
+	);
 }
 
 /* imported/exported objects are not purgeable: */
-- 
2.36.1

