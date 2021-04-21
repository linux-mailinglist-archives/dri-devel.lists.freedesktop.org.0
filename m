Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DA3669FD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 13:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D226E98C;
	Wed, 21 Apr 2021 11:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246006E98C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 11:37:44 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id sd23so54371990ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 04:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oWBPUAdz0xbZxQDvlBKt/PfAa9b2el0EabiMcGatIFg=;
 b=YPlvImMqdXUh5dVdxHkCpUAzrYQCivhicmqIMOZYoa2i/zeC0TylT2jZBPn+74Mk9e
 eBS07n08b+dr5GEduJSwYvIs0R8Fw6kfHreHRKK/IsBqeGZVKKkPbzbXEOeaaEhyhJIQ
 erEnNyTGQF32PqP1KxvNcYY44Hx25y2mDcFEQEnSVubq3da6C6ZM60eHPwk5OoC4MdS5
 pkU96+MFndULmjJNKGui5Q7SZKalWkAIOCorFfaqx0tMUVarT3/xEReSit3bWy0MdSKt
 nY+dWIPxk9alVxgebc65IRl65rAvKWKqZ4o6kho9jsFZxll+iCSV4SnN1Kz/jQC/P2yd
 U0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWBPUAdz0xbZxQDvlBKt/PfAa9b2el0EabiMcGatIFg=;
 b=Z78+46fFr/DJkeMpet1hFS6uF0E+xmPNTw4f0gJxyZWjpDVmq5Y4371fGOg+BPZ4Rc
 H3muVZRKDfi7pzvfJfPXlmAjF2ALNr1I3mzZSGpCDekzxUeRIGIrvwsXZtUpyXFtfDGk
 RQYZOruO/3KKBfnMgrPJwahL+bJ8JTItzsxWeknXqizcahOkBR1iAvhWt7UdhHz7TvUo
 l4Gs0SES5xXn28mk79QQUmiFR1C+vUgvrHg4QM/udX2cLZAS7v3ibhqQkFj6ftcqLgoE
 trtUGzkrNoU37iBEmkij+wf5Pkskkba4C5/4MMrpq1ssF6BGZGcqrZe/arB5Owr4rtT3
 /qow==
X-Gm-Message-State: AOAM533PQ5w89znVjeOqgmeLl7+hrzCig6GtHC4ykxSfoIC2F3gPkT6Y
 GiYxTE9FAMU+YO27BkE52nA=
X-Google-Smtp-Source: ABdhPJzPAZ3h1RqKMeZ1IlhRCUZuJQhZ8qEhEIy0MYhoIqogluXpl0NasLPUSMGtT07mQKVzhcGqrg==
X-Received: by 2002:a17:906:7188:: with SMTP id
 h8mr22879487ejk.227.1619005062775; 
 Wed, 21 Apr 2021 04:37:42 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id i1sm2735928edt.33.2021.04.21.04.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 04:37:42 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>
Subject: [PATCH v3 2/2] drm/amd/amdgpu/amdgpu_drv.c: Replace
 drm_modeset_*_all_ctx() with DRM_MODESET_LOCK_ALL_*()
Date: Wed, 21 Apr 2021 13:37:16 +0200
Message-Id: <20210421113716.15472-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210421113716.15472-1-fmdefrancesco@gmail.com>
References: <20210421113716.15472-1-fmdefrancesco@gmail.com>
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

This second patch makes use of the API that has been introduced with commit
b7ea04d299c7: DRM_MODESET_LOCK_ALL_BEGIN() simplifies grabbing all modeset
locks using a local context and has the advantage of reducing boilerplate.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v2: The work is split in two consecutive logical steps.
Changes from v1: Added further information to the commit message.

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 856903db34c5..43dd77c227ed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1441,12 +1441,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 		struct drm_modeset_acquire_ctx ctx;
 		int ret_lock = 0;
 
-retry:
-		drm_modeset_lock_all_ctx(drm_dev, &ctx);
-		if(ret_lock == -EDEADLK) {
-			drm_modeset_backoff(&ctx);
-			goto retry;
-		}
+		DRM_MODESET_LOCK_ALL_BEGIN(drm_dev, ctx, 0, ret_lock);
 
 		drm_for_each_crtc(crtc, drm_dev) {
 			if (crtc->state->active) {
@@ -1455,7 +1450,7 @@ static int amdgpu_pmops_runtime_idle(struct device *dev)
 			}
 		}
 
-		drm_modeset_drop_locks(&ctx);
+		DRM_MODESET_LOCK_ALL_END(drm_dev, ctx, ret_lock);
 
 	} else {
 		struct drm_connector *list_connector;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
