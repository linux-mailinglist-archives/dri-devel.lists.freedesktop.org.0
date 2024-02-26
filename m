Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080B86682D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C64E10ED2D;
	Mon, 26 Feb 2024 02:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="z2nMnaB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD31D10ED2E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:28:02 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so30388851fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708914480; x=1709519280; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=okMwD+HI3Hm1J7uyI3T50cIUeGmA4G9Oagnd36eStaI=;
 b=z2nMnaB6LxS7HGA2MOjKuqKCE1N33te9/4tzFTIg86jGTsdnTynpxqRFY2FgN6/P7d
 yN9rZQ5fP7aqDdx5xEui8YtF8U2vKYi5Or7zWUWq1nMPdzVXhVxaiPYcOxPZo9lJ3/OJ
 wlZLUKs/0VcOSGzXR79tr8trlNqU6FuAO6QLObUsgcQ7P57lty4KTkycE/M7zoNbVaS7
 /VlvbiCd76/S/14lWRhcHgTfGysr7wxIXZ0LcqpB0v8YmyV3gvxAysNhxvggWyzEd54V
 XXpmBw0ewD3kYpQ/aqPDh44DlVbPCTBKKdLkg4pZgSK/iaQch3PF1GjuZwM4K1xT5UbL
 Lg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708914480; x=1709519280;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=okMwD+HI3Hm1J7uyI3T50cIUeGmA4G9Oagnd36eStaI=;
 b=c2QnRll0OMmn0JPZJYYV+PX6zHW+4p3eSaowoptIIMcRmkJeDNo7jH5J2GKv5PBNlR
 rccFq9DNgLk1HqVLWd4k5NXt+OMoXYa8sarqx7Y28UqrnFY2SBvsVy8qyXbvkbb3SJgC
 XIiI8eJfPSYzPpWfcjYlSeSsPAVowk4mgsix4pqtPKbf+NNZFMXh7HoGCEtiUPJriINt
 NYoR4nh4f9laJW9hZHoh73MM97Nw2yS3ENAi348kGf0P/0XnTGEm9RS5p8rjUaXqCwYY
 5qEuBSDtBfJG+nybwbqkGMnfUNGVfHVUyWDbxzVP6HbgqAjYE3l9hQhb3fSozCO8G/zT
 rvcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNXz7C/lDi8nr4mYl7CAX3j+KK7T1erRjdqySSfnyk+b4qJ59dSSoYk30xQt8nRgLiLI+QfbcwjPSZSpm6/nfJGxj9YXLAymasJNlm2Fzi
X-Gm-Message-State: AOJu0Yz5gsiIyy2HEN2luinokAVtAQ6ASvCdr+44Djrw9GcDXJpLS34W
 hzVeQ9YVnQlv0YelXsHUxHzG4L/IlntoPp70gWjEXIffipQ5k/fpuq3JbPDhh44=
X-Google-Smtp-Source: AGHT+IFGLuNRRkqyJ84YiBMteFx/W6fawxgt5SBqlorHTEGoOuvKsKcz8VAynwdAnzKsErvRBTJm4g==
X-Received: by 2002:a2e:8e90:0:b0:2d2:7813:6ca0 with SMTP id
 z16-20020a2e8e90000000b002d278136ca0mr2918485ljk.7.1708914480645; 
 Sun, 25 Feb 2024 18:28:00 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a2e8553000000b002d11ef66881sm713092ljj.91.2024.02.25.18.28.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:28:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/3] drm/msm/dpu: debug commit_done timeouts
Date: Mon, 26 Feb 2024 04:27:58 +0200
Message-Id: <20240226-fd-dpu-debug-timeout-v4-0-51eec83dde23@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC7322UC/4XNTQ6CMBCG4auQrh3TDlCKK+9hXEB/oIlS0gLRE
 O5uYaPGEJfvl8wzMwnaWx3IKZmJ15MN1nUxskNCZFt1jQarYhOkmFFGORgFqh9B6XpsYLB37cY
 BdMkKQ2spKE9JPO29NvaxsZdr7NaGwfnn9mVi6/oHnBgw4KosOAqR8Yydb7arvDs635BVnPCtI
 BU7CkalNCUtDKuVEsWPkn4omO8oKVDAHA3WyKSS8ktZluUFfP0DdkUBAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=u8jCfED3AAIM0Dr6uUkSBL8XcOIWg1vYet7ORyo2cy0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/cvswuEB9zryNmyO7i/5aXauDX8QwQLWQAka
 RMUD4mkizCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdv3LwAKCRCLPIo+Aiko
 1TlDB/43tK/bein7ge2pajmcDIVMZuxTdeAV4isVizetYKrBenH9uItcj3p7VUY5u4Le4CJ3cpC
 4kqF5hevPGzVDS/4TjVU2RAkY2DUAmIi0OFReena7J5OipQJOlRSyA8oxkM3TeO/R4eDcQpr7Vd
 rE4g14bhQtAZLWhJj18qeNmjsVNArxwl4GnTI1AkA6c3zxc7w6n5rd4Cs4ct3ZyBxjimMuiRmz+
 xwyzV5zcU8TVItaS3wEY61WNdDAL4zc55MgwQJ9bXYOjyWhZvMuvrvYpy0Pi48UX04OeN5btAPq
 xPX1K46ZWpznAtBJFSSwBy6qtVd56Xc06jbR3FnFNdwycecb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to debug commit_done timeouts ([1]) display the sticky bits of
the CTL_FLUSH register and capture the devcore dump when the first such
timeout occurs.

[1] https://gitlab.freedesktop.org/drm/msm/-/issues/33

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v4:
- Reworded documentation for new funcsions (Abhinav)
- Link to v3: https://lore.kernel.org/r/20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org

Changes in v3:
- Capture the snapshot only on the first comit_done timeout (Abhinav)
- Link to v2: https://lore.kernel.org/r/20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org

Changes in v2:
- Added a call to msm_disp_snapshot_state() to trigger devcore dump
  (Abhinav)
- Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org

---
Dmitry Baryshkov (3):
      drm/msm/dpu: make "vblank timeout" more useful
      drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
      drm/msm/dpu: capture snapshot on the first commit_done timeout

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 79 ++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        | 22 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  2 +-
 drivers/gpu/drm/msm/msm_drv.h                      | 10 ---
 5 files changed, 65 insertions(+), 50 deletions(-)
---
base-commit: 33e1d31873f87d119e5120b88cd350efa68ef276
change-id: 20240106-fd-dpu-debug-timeout-e917f0bc8063

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

