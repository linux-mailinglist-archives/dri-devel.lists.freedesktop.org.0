Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93459B8592
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 22:44:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50AF910E937;
	Thu, 31 Oct 2024 21:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZMB/vUAX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1956410E937
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 21:44:14 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53a0c160b94so1606030e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730411052; x=1731015852; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JABEHipC9Z0wTq9sKT+cueUNJ0QYw8iXu1pTjI6dILQ=;
 b=ZMB/vUAX5/OubG6uFoEGAh6AHp188vma2fWuTzy3mzwjxZ7ent1R5B20/dnnE3T8/U
 efjDj5+lW7gRRPqQsFj8y2NbZNuzmjovM+ryG/OWYr1oRmWjqYXONh2lZHQL3IKSUb6+
 Cvw9+nRxfYFMcSuGSMOZ+u9NEERzoZ7tFCR3Bqu0wjo35iv8Fu79b+VlGonfEpJmm23Y
 0xESDAXDw5cfYGnOhYchXqkrs6fvdFBaUqW7wKyfcwaxtmQjWxDls3V1S/qhC+Ydz8lm
 5MutHgB+0xB2ymgJnbR7sDyKqhZEHvVu/9+mE+dx1PQGerIdhWfP+1mTF8dSHJwD/i2w
 jIKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730411052; x=1731015852;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JABEHipC9Z0wTq9sKT+cueUNJ0QYw8iXu1pTjI6dILQ=;
 b=scE6k9XF3AErimIiJ694GCLT7+APxSLJNQ8GAi0YiuRFuu3rIBVhMScmDewiXS5+L2
 MtyyM7Dj4/dVRzoVzol9Js56ZIso3wkrId1IA5cobShTdnPncmOwKL9c//Si+zZ7qKwD
 dJiyD28GuHJzcF+uBqlRiyrJfePuNBVwCm98LhU+GjZmfghlGvNLjq96o0zQiPh/3U1D
 fR2ON9rfWVmOpKa3EN7xKMs1jQWdEzfpVrQUBgfzkVSVvdlvyR5Gto7ajzDlgO7OzxPn
 30Trli/V6yWYyfiD6UGFWqei+JAyai0sfKdN+dUYXIzgo3eNJMMrSKkWphhhePEc008H
 DQ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcV9qPrNf758UZCpKcGdfqG9km4GNG1yHqu7ZhfTO6vu3OqTy/X+9tGyo2V8aw9xZCfBCEe+48nd8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFchNOVfnVW6Suglz1kCou0adfMa3zjI7ZdJI8yCFdL289q5AX
 J/shMNPba5WjOO8Zxiz1lsWAgy4N0zkwN85kmO91dvNDzLsjZMcJlUeDScbKt+I=
X-Google-Smtp-Source: AGHT+IEF7sIF6pFMxEAg5enP1MZeKE+KWHTm+s7sQ42B2P3DpcIKoommDZFWzHt2IB4NWkD3YVwjMg==
X-Received: by 2002:a05:6512:b83:b0:535:66ff:c681 with SMTP id
 2adb3069b0e04-53d65e1ab82mr763727e87.48.1730411052093; 
 Thu, 31 Oct 2024 14:44:12 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c162sm339567e87.96.2024.10.31.14.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 14:44:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] drm/msm: minor msm_drv.h cleanup
Date: Thu, 31 Oct 2024 23:44:05 +0200
Message-Id: <20241031-dpu-move-topology-v1-0-8ffa8122d3b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACX6I2cC/x3MQQ5AMBBA0avIrE3SUgmuIhboYBJM0yJE3F1j+
 Rb/PxDIMwWokwc8nRxYtgidJjDM3TYRso2GTGVGq1yjdQeuchLu4mSR6caxGIwpqzJXvYXYOU8
 jX/+zad/3A8gAQ5JjAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=784;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=lntCchS/1G7soOEmMcWvSKjNtV6NhH/Ttsm15XGOC80=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnI/opmTHlf339jNV9uBeC4JpuWF5R5x010IQSv
 gdQZw72twCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyP6KQAKCRCLPIo+Aiko
 1V9eCACly3YzaLuZBIXqln4CQ9UIdmDlWM7KWZt00dBGUajGtHRSxP1uBTTaKLTnrKhKe6lxXEI
 fVnCkiQY2BOLVF8X+88N+d/NDmhnJDYJv7C2nIPPnAs72ZosfUVP9H6RtwmLWAnkmRCJZgHbNsB
 FqLZlKulDEzHD5xWGjdi+tc5juDiSYy6lZfi/i40mK9I+YMZYVw+PKTlC6Bsk7EdFCb7Bj7CHA9
 YmufZHFgXF5XR80IIkNFKJcnPglSgsz07Nq3GZMyaB7A5HDjhcJNzSVQROMd8IBvHFycFriSn3r
 FnWbs2OKwccwm3Vq2LwuaXWxY6dLmPaIqAk47A9ubhc32dn7
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

As I stumbled upon msm_display_topology define, perform minor cleanup of
msm_drv.h incldue file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      drm/msm: move msm_display_topology to the DPU driver
      drm/msm: move MAX_H_TILES_PER_DISPLAY to the DPU driver
      drm/msm: drop MAX_BRIDGES define

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      | 16 ++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h               | 18 ------------------
 3 files changed, 18 insertions(+), 18 deletions(-)
---
base-commit: 4a6fd06643afa99989a0e6b848e125099674227b
change-id: 20241031-dpu-move-topology-f5c4489830bd

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

