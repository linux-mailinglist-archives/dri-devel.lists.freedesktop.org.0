Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3228D1F7B46
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 18:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86FF66E9DB;
	Fri, 12 Jun 2020 16:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8976B6E9DA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 16:01:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l17so8662446wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 09:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYX8Mu0xRBNEBtaXanAWRER9JPyLuWSI8UYsxJ+P19I=;
 b=YAgNNu9Vooe515Sa5+Y11Dtf1UbX6YbGrz8GF1xcR6V67cMNcL3wTluq3cywQmOf0r
 rF+Sm5qkZ/fNA2YQdsBhlbvpDON5nwsEc8HDnF2cZQJwtfEF2dTA/95o2OxT8c1FKWNz
 fCngQ0Oti9evDoPJw6t63noKUe56a4Ng2r+VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYX8Mu0xRBNEBtaXanAWRER9JPyLuWSI8UYsxJ+P19I=;
 b=F+1I7e7+fk132qLi4GNXTH/cmL9ZTGgzM5jx+bmTy9DQStkwnx0un5D4xqbHyX44Zl
 PN4Kj239dUgj2Y0x3XWuCkmFfORxExXpnE4SuQn3rGDMPBqAEriUMLK+To2i57/CmPoB
 QYc4FnVrj93th+Yr7kl1AmNAKwLmDMIlrukyYcjTKEoK7yCJGaLTu3kHjL7ljStN33Lw
 ewFQkvV5nU/b2nSLbcPyStAUe7x7vv/Y/uw8kHhH+99yT480cx3YaP/zXrqEx+W52fDK
 0jkxGVPqUIXCfRUo7nNKVjdkS3rSVOmgiLN9XArAskGHwiYBi5Fm0i6vbbIpGfJBHgss
 XMeQ==
X-Gm-Message-State: AOAM530Ece8UjhDBdDue/GP7wJ6mSCHVd6UwBSQTGY/x4TAa2Vnx5hm5
 EKnu68D/9sn3o3UavEDY3kkriIlaM+8=
X-Google-Smtp-Source: ABdhPJwJIw2fi2djhl6xIp8teUqUc8VlBhQGs+U1BAKFy/4rhESCGljCsXSzRXRoofhWIZ4PVDO+zA==
X-Received: by 2002:a1c:491:: with SMTP id 139mr13259039wme.99.1591977664956; 
 Fri, 12 Jun 2020 09:01:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j5sm10801566wrq.39.2020.06.12.09.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 09:01:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/8] drm/amdgpu: Use __drm_atomic_helper_crtc_reset
Date: Fri, 12 Jun 2020 18:00:50 +0200
Message-Id: <20200612160056.2082681-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
References: <20200612160056.2082681-1-daniel.vetter@ffwll.ch>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Roman Li <roman.li@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now also comes with the added benefit of doing a drm_crtc_vblank_off(),
which means vblank state isn't ill-defined and fail-y at driver load
before the first modeset on each crtc.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Mikita Lipski <mikita.lipski@amd.com>
Cc: Stylon Wang <stylon.wang@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 68a73065b516..36d605a6eb16 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4594,9 +4594,7 @@ static void dm_crtc_reset_state(struct drm_crtc *crtc)
 	if (WARN_ON(!state))
 		return;
 
-	crtc->state = &state->base;
-	crtc->state->crtc = crtc;
-
+	__drm_atomic_helper_crtc_reset(crtc, &state->base);
 }
 
 static struct drm_crtc_state *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
