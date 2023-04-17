Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C8D6E516E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ECB10E5C0;
	Mon, 17 Apr 2023 20:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AF310E5B5;
 Mon, 17 Apr 2023 20:12:19 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso13866883pjr.3; 
 Mon, 17 Apr 2023 13:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681762339; x=1684354339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c9ZcH/UsIU/GcQvCDP1QRyb831wl6lpWFQtu8V+MLrA=;
 b=JLFDGszkk3bWSS4oOn0Z5jXx5pu5tQyCXMtYa7M5wXTMF4vf86At8265QTzScrAoj8
 +O8gZyxn1daqdjD1dpgIeMzX2XDqD94nLo6iKJN2Knuglbukt5stAF1HMUg79eAdk9qr
 t1tg3XFRM5FxUHB2R2vbZn+EM1piSSFQWJ3WjLHiDvX4klcR8VdUFmbCHiaO2C8vYQgc
 jEylp4v/NvZjQCtmeY58poEjl7g2SUbTBjDZSVPmMP7uFif42uNOY8MDBXaqjaWwT2w0
 uqbKqOH2TXothSMwU5CD0xtVKHrATYvPRWZAP8+in3UhMba9lNuTXbq74R34YlfHbvHL
 27BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681762339; x=1684354339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c9ZcH/UsIU/GcQvCDP1QRyb831wl6lpWFQtu8V+MLrA=;
 b=ADUdn/BtjyDnu5U1sxa7ycvRohw8lF2K5d0iFqk0uZ46KylTVirNMvDuUMv/YgtVWM
 Zlp5cdyntUIx1fZsH7Mk7Oj2vBIgubPkYg5ChjRddP944PQ4JGgh2EHUKqp2eSkKD8zv
 agpxQWtC5bmrze+Vzx2Fkm0IlymdYao2Z+kghzM+D+BEp/Ukn4R4qce08UXHM9Ld6xnp
 Z0a7hUbEzvWU2FE+uAKZ5mD6UTOrVzauBQqZ339NchrpawyYZtvP9PqvrpbcUQRC0Dc+
 1vJSEyQ6B8Hp42vIV0uzVA5JOS9huioMSNjj7I0bqHx2obOTtvzWrsnrC8iX015zdd/H
 J3Aw==
X-Gm-Message-State: AAQBX9dzy6U0gcsqPfCx/zEcO95GBNi/MoXNOvsSYzNYQuLmdKda/rEn
 Kkphn5HkeW8flvOeIwGPYuvg32oYpao=
X-Google-Smtp-Source: AKy350YD7UMGXIJ56E5NzWJ0ernvcLLeIW8Ry6wjCWgcRxvgxJ0fIYk2uFG9KJbQD74pEtwQSbpohQ==
X-Received: by 2002:a17:902:854b:b0:1a2:9dd8:d646 with SMTP id
 d11-20020a170902854b00b001a29dd8d646mr75485plo.54.1681762338766; 
 Mon, 17 Apr 2023 13:12:18 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 13-20020a170902c14d00b001a69dfd918dsm6166625plj.187.2023.04.17.13.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:12:18 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 0/3] drm: Add comm/cmdline fdinfo fields
Date: Mon, 17 Apr 2023 13:12:09 -0700
Message-Id: <20230417201215.448099-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
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
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

When many of the things using the GPU are processes in a VM guest, the
actual client process is just a proxy.  The msm driver has a way to let
the proxy tell the kernel the actual VM client process's executable name
and command-line, which has until now been used simply for GPU crash
devcore dumps.  Lets also expose this via fdinfo so that tools can
expose who the actual user of the GPU is.

Rob Clark (3):
  drm/doc: Relax fdinfo string constraints
  drm/msm: Rework get_comm_cmdline() helper
  drm/msm: Add comm/cmdline fields

 Documentation/gpu/drm-usage-stats.rst   | 37 +++++++++++++++----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +--
 drivers/gpu/drm/msm/msm_drv.c           |  2 ++
 drivers/gpu/drm/msm/msm_gpu.c           | 27 +++++++++++++-----
 drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++--
 drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
 6 files changed, 58 insertions(+), 25 deletions(-)

-- 
2.39.2

