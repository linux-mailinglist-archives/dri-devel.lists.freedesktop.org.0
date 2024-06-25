Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FE49170A2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:54:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B342210E1E9;
	Tue, 25 Jun 2024 18:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N2ztgljm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5089110E24A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 18:54:47 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so805230a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719341686; x=1719946486; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MlWLevDm2zqjucsLvNz+sklzdCOVo1h/iRiYHGn0hRY=;
 b=N2ztgljmvsMr6hgEMlBgNqa1XyR1ZGdgsaBFmz/gEcJaAZr7lFH6T+3XVYntn5z0Yc
 7SRoKzhlZz8MsQFEYXT9LG5E9xPGfX5lnyIeWygJo/ZkKNhRE4xS7Cy8ri7yqhivZ05g
 mHCM88q9ru473HWy+iPm89T8fwGPdxY/LDnEdK0V6rslQLSgNIzeMmG9UNcCOSAjj7wS
 k925iPg9GlTVVMaP7mi6lWjjoC/w2hwnoAepjzP70T3w7FcEjLAhLybrY3bMvYCpXjfQ
 F8psKebn02ZAYcZE69pWz5mnmJ5jx41Vro/5C31DJLt1eOo6LgKXXKOCuRxicqUYiVM4
 rK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719341686; x=1719946486;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MlWLevDm2zqjucsLvNz+sklzdCOVo1h/iRiYHGn0hRY=;
 b=FfnsI1eM0kX5goghq+XdVikGXTPTJLjOw4eV7aoasi4PsUbIbge+1JSEBOXNgioqi4
 IF8aWOf9ZIhUefftilbNFnbaVvNrebWe2AyCB5/lL0gUzkAZ1ZK6SHZKyyk3b4yzy1Mz
 qNnZZi/3HjSZ5v9ei6usUJ+zg2UyqIyhuMNNZtRvbQOCS/tvUeqdhcDqBfptC8IkOGSC
 jBlTsHevw3SjJbRYo0K57y/bpz2ad6Rlo1j+pwoCRs1EzdhE6zNuYtpR34Jr4O37Y3LG
 swCxPIv/deHEulBia9+Alu3RPmJxKjMJkyEiaMlG1hKuTaJ+v2BtKdiDrGCQCIsYh/J2
 GzKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ZaTyXu/+a9Wy3/MLVWBsL0oBSPjiV7AIhPz3LsaYrDDonAAjcu5UvF62MKrSMQM6AsGoV0Yb+ZpIxkZjA864o2ZTCRzkTjo1fZ26IfUn
X-Gm-Message-State: AOJu0YyJJJc6rQ3r1qOQbBTopDbGucZPJNTcIKYlnsKwRCbmx9YhnvTS
 DM8dqt8J9pTORsGTBT4/nAnFmtj+jIdQ/qRo38K/vWkmW/arHLJkEzqkzrZMHtY=
X-Google-Smtp-Source: AGHT+IGHmSo6n9cThj/nFhMH1FZ54jR9wobPuBoU/YgLk/mLOCyPuoU7nb07meAeeYoB7DOJTGYZOg==
X-Received: by 2002:aa7:cfd5:0:b0:57c:bc03:caa2 with SMTP id
 4fb4d7f45d1cf-57d44a678c3mr7057357a12.20.1719341685289; 
 Tue, 25 Jun 2024 11:54:45 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30583e93sm6206332a12.96.2024.06.25.11.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:54:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Clean up barriers
Date: Tue, 25 Jun 2024 20:54:40 +0200
Message-Id: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHESe2YC/0WMQQrCMBAAv1L27EoSk9p68h8ikjbbdkGTsilFK
 P27QQSZ0xxmNsgkTBku1QZCK2dOsYg5VNBPPo6EHIqDUcaq2jj0QSimR+eldJLRtMPJ1WdrrG6
 gVLPQwO/v8XYvPkh64TIJ+f/HqQaXNHP/u+GqsdD5LijXa92G65Ojl3RMMsK+fwD6Ib6YpgAAA
 A==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719341683; l=1005;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=E3eCmwo7E5Ovt0YtNYVpLKfzxgHw/0XSzCnMXdpVojw=;
 b=nm2/y18vGTibvoO/K8B4+1PtTQxWCP6SmmrdpvAvjFUoXQ3/QY26QfV6MYAYv8xg9+AR7p/1n
 A1mKNCOQQM6Ay3n3EwxDYCE1OJhNOxdc38QGrDX+QxWgyUl1F9hH+nx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Changes in v3:
- Drop the wrapper functions
- Drop the readback in GMU code
- Split the commit in two

Link to v2: https://lore.kernel.org/linux-arm-msm/20240509-topic-adreno-v2-1-b82a9f99b345@linaro.org/

Changes in v2:
- Introduce gpu_write_flush() and use it
- Don't accidentally break a630 by trying to write to non-existent GBIF

Link to v1: https://lore.kernel.org/linux-arm-msm/20240508-topic-adreno-v1-1-1babd05c119d@linaro.org/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      drm/msm/adreno: De-spaghettify the use of memory barriers
      Revert "drm/msm/a6xx: Poll for GBIF unhalt status in hw_init"

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)
---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240625-adreno_barriers-29f356742418

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

