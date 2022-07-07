Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3C356AD53
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B7C10E26A;
	Thu,  7 Jul 2022 21:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FED610E26A;
 Thu,  7 Jul 2022 21:19:47 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id j3so9214638pfb.6;
 Thu, 07 Jul 2022 14:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Mqly/bmUD1+v4qx6JacIhpg9Ul0/6TMbAP2G8iAsIU=;
 b=Jy4LjqYXsHRJLEuWMy15VqPLyEiaTsf1cyTgG4LnEAnQ7+ZyzBgRaBgfsI3OLsSR25
 AuLZIiP5ku1xcxEhyGX5xE6iCy8uPyufdJk38lQyS+2dEFVCnjKfrxa9QjazqgFtkLNt
 XalKugilrwzxZdCPatAWtUZ10lmpfA0Dtsql+0SPL9T2QedYTIpGZoBWxMfR+mvz1XxA
 oIianSf1mDs/H+/vYnKJFDZ2HpWIwjTIINByzQRlhyKgKGjFW1OTLD/crJxSprvn7wwb
 D0tbQYBroY3kOJ8Syaut1HUYM0gwZXrTTqT3pWsLinpnHkfx4W6B1d29eeE02zENM2E5
 4wOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6Mqly/bmUD1+v4qx6JacIhpg9Ul0/6TMbAP2G8iAsIU=;
 b=RjuK89u+72xyWBmG+aWOBC10v+6xalggu7fNolixXBGy7rDTBARUHEdFIUsbHQhEGg
 4WtHIqJYZs+ctAg6piiihFTUqNALjiR3Mo6fk5BxKq+C88yvmqyleqmdC8I9iBZuCDzN
 ZGjBPkJzolRJJ/tmJg4H2yvUK3oDCAXdq1RMNUWFDhQUBXhc53sG3+NNvta/OQJhPEI6
 CI7H3Ppz38FbbvccrE4BzkGaA9YZqWrXG5qi2mJ3qD1Ny6uhLfBMRW9OGpaB1dCAdZ7/
 SI8f65W+2aoVBkNH3dLoD68R78E2K2pewFchliPtGovF8rQLJSK0QCOkalg6atJlqIzT
 yMGQ==
X-Gm-Message-State: AJIora/xox1oEoz9Zpiv4sv9oPk9JRGNWr58rfGR+mUvGwjhAdhbdnd0
 S4HIJ5EJGIxa5mcib4TfSC3OAt8QUZ4=
X-Google-Smtp-Source: AGRyM1t5W9ZMr1j90syEK2lDjCt9pxLeU/e2mHN5T0KEFQkQACvggQZHVEjihw+PqNIHYc4CePKp/g==
X-Received: by 2002:a63:5cd:0:b0:412:b163:b7e1 with SMTP id
 196-20020a6305cd000000b00412b163b7e1mr51911pgf.451.1657228786230; 
 Thu, 07 Jul 2022 14:19:46 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f70c00b0016bfa1a5170sm5207389plo.285.2022.07.07.14.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 14:19:45 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: Fix for non-visible planes
Date: Thu,  7 Jul 2022 14:20:00 -0700
Message-Id: <20220707212003.1710163-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
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
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org,
 Fernando Ramos <greenfoo@u92.eu>, Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Fixes `kms_cursor_crc --run-subtest cursor-offscreen`.. when the cursor
moves offscreen the plane becomes non-visible, so we need to skip over
it in crtc atomic test and mixer setup.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4dd0ce09ca74..4ba000951a90 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -422,6 +422,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (!state)
 			continue;
 
+		if (!state->visible)
+			continue;
+
 		pstate = to_dpu_plane_state(state);
 		fb = state->fb;
 
@@ -1195,6 +1198,9 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 		if (cnt >= DPU_STAGE_MAX * 4)
 			continue;
 
+		if (!pstate->visible)
+			continue;
+
 		pstates[cnt].dpu_pstate = dpu_pstate;
 		pstates[cnt].drm_pstate = pstate;
 		pstates[cnt].stage = pstate->normalized_zpos;
-- 
2.36.1

