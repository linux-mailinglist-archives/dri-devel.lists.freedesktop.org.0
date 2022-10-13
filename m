Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 704725FE5AC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 00:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F65C10E9C0;
	Thu, 13 Oct 2022 22:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C9F10E9B8;
 Thu, 13 Oct 2022 22:55:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id o21so724738ple.5;
 Thu, 13 Oct 2022 15:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZPNZ3VLE0Hgex87FN0OkV1DekcEt1bf70+VW9u0u5I=;
 b=XR4pOh/xQyh1rFhshT6o+clCP1DO1ClDFqI7cfZDk7kMzC3yec7YYkEYOChszeCWGr
 wAQvsbjAKyigjj2ez4ReqZ2Y7Cn40BHbeMfpeCluilMs33cFWOUoLnTpltyDzST1Et51
 pUMeyHwOnpRh5N7/mnLAlFO+8FxRM6LnOld79xUj7kA+o2sYaEom0MTPTc8+FeLiBhm0
 wwUXnkun4WKBcKd8XzEkxNTepq8zllGyVRnDhHc4uYQJ5EphYdlgjjjgA5xzBAlA+DXg
 jPd+FKWfFoe6WIoZ95vGLOMs/0a6UxmT8X6bfT6XiJHyF7RT45ALIWGIDgJDoBuNgH72
 nPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZPNZ3VLE0Hgex87FN0OkV1DekcEt1bf70+VW9u0u5I=;
 b=tFKzt0py5sI2ohuv71HKdWqgaUIhYnFi+QC/o3UhzxkEj2byXhVkv+x+H/TFhZLbl7
 ZxQN0TGYNJ40HTZT2NwCDZSsxK2rtWOQZag1hxbESPpRhcTTJWegd2ymxAygbGRVaoRM
 oMnR2p4D9Zp0+2vwUA6C+koVJRp4wR2fpbPc/O4656k1avRHuZAHresGNm7OqHgeDAaA
 XP4gHUF/UhdF6YHbnXUBrw384VFH/5ZGcKXj1Ieh1mZZbHlSVkeN01C/sblojorg+LrC
 ig6jIRSR6dtrvDBqww+RvaWVVNg8J3z88NHH/obU86K6rlCiDhMw7pB/LS4dx6PxKshb
 lQdA==
X-Gm-Message-State: ACrzQf3yxafK2OR4R24e8ieuns5S+pNvdQgWlhrHYgl81XEIy/lo5zM1
 f6NP0zupwXIjaYsx+TIVmeWwsii20Ns=
X-Google-Smtp-Source: AMsMyM5SeaxGSOFjUEc1amD9PN0v9n6v+ZxTXU3WfxZU7s4Bd2Hpy5ww3QAawc27sjg9tF94dvu3JA==
X-Received: by 2002:a17:902:cf03:b0:17e:c7a:678e with SMTP id
 i3-20020a170902cf0300b0017e0c7a678emr2034151plg.10.1665701720262; 
 Thu, 13 Oct 2022 15:55:20 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 h3-20020aa796c3000000b0055fc0a132aasm221198pfq.92.2022.10.13.15.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 15:55:19 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/a6xx: Remove state objects from list before
 freeing
Date: Thu, 13 Oct 2022 15:55:15 -0700
Message-Id: <20221013225520.371226-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013225520.371226-1-robdclark@gmail.com>
References: <20221013225520.371226-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Technically it worked as it was before, only because it was using the
_safe version of the iterator.  But it is sloppy practice to leave
dangling pointers.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index b0124d0f286c..a5c3d1ed255a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1046,8 +1046,10 @@ static void a6xx_gpu_state_destroy(struct kref *kref)
 	if (a6xx_state->gmu_debug)
 		kvfree(a6xx_state->gmu_debug->data);
 
-	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node)
+	list_for_each_entry_safe(obj, tmp, &a6xx_state->objs, node) {
+		list_del(&obj->node);
 		kvfree(obj);
+	}
 
 	adreno_gpu_state_destroy(state);
 	kfree(a6xx_state);
-- 
2.37.3

