Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD492BBB6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 15:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD8B10E557;
	Tue,  9 Jul 2024 13:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="In85yWQP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD50B10E557
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 13:48:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-52ea5765e75so5516218e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 06:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720532907; x=1721137707; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KhHYU7UmK4dnD7/sjmuMOOwDgcdEgKtZKNrTen8zuww=;
 b=In85yWQPbDT9FhAa8ks6yc4tK4+kTBlvCX1UvY1peFekp9/jQ33UFl1D/Z4kXPlIxJ
 5zPKOWpI8+3idCNbLZ5lwVNMwIs0SZ4I8xMtgJERN8hKLAKvc35dlgEhPTTcG0zHjmpw
 Q49MVcD0XYGDrZVVIw98JPdykpsPFJT/WioCKSdIt6wDGyDeQ7EhUTLRXTuGmo0ufOEa
 vrT8WZfetcYlvGBsyINbxIRCoqC4y+NtguzPRYWpoS+0zMqT7UNjUjmK4L/SkmsZdnJd
 0zXP+rxePOSMVAPW8ifg3znnPJtxrhpI8Mu2QAFYL+fe7T9eR+KQd1nHV0dwZcUhr3au
 mKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720532907; x=1721137707;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KhHYU7UmK4dnD7/sjmuMOOwDgcdEgKtZKNrTen8zuww=;
 b=G44qrLb6bQ5TgmHjAWKPJujaQh96abUPaE4/Yy7gqxVO/xyunJfLleteWio81TcByy
 CrQ59HsmukucQgmlwCYNZRvMuUlZ+psvF43HEPNigSWud5PGnkZyR7HeQfQy/1SYNkAy
 Sj4bTumc2S2LyHvU3jeKKJ/K0L3R/500VA63B8dETHEH8i0x8qV6PJCgeeZ4AuhhOBSl
 u2MMk5vvaTisMPjxJbNQmJ6vGkkWsmU5+2UIGQb2RE1wOmhcY1Y7atSsBt0d7RoaHyDk
 N0cQF+undxGFEa/ivy0Z/TEt2KVe3WMA85DWtZ7rZcRoe2v/RS+9tHeXk+diN6vSueFg
 lphQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9jV4qqD0xu1GILv0P+kj+AbVhbZG7ORPnLNOpj7cKnQQjnF/jpctC1lFlWtEotXG/iI6piMavkGykS7zkntBfgHXidXyC7xPvlplfBri7
X-Gm-Message-State: AOJu0Yxr9ZKfyPWPdVlxnahmnpkZhocxhVhjCWF/rxK6/SYClOX2iNPJ
 5x9VtIk+9wUYo0ieG9K3gaDjHqu5skhSJjApLIdSMZjCWwqTVqhDb7rffjmZ3GnnU+lL1J82DJ2
 rhzA=
X-Google-Smtp-Source: AGHT+IH+4DaePyXmIoNWLgjS79EsnJAzPqo0nKjSdovFNAcILKuskj9yBxxbOKOqicxdvrhvMII+KQ==
X-Received: by 2002:a05:6512:2349:b0:52e:6d71:e8f1 with SMTP id
 2adb3069b0e04-52eb99d20f1mr1872812e87.53.1720532905946; 
 Tue, 09 Jul 2024 06:48:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eb8e4959csm250297e87.82.2024.07.09.06.48.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 06:48:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm/msm/dpu: two fixes targeting 6.11
Date: Tue, 09 Jul 2024 16:48:21 +0300
Message-Id: <20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKU/jWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDcwNL3ZSCUt20zArd8iRds+QUU/NU49QkQwsjJaCGgqJUoAzYsOjY2lo
 A++nUC1wAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>, 
 Archit Taneja <architt@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org, 
 Leonard Lausen <leonard@lausen.nl>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bL6t+kZFucDajd7H3MVoLbxP4QMw5AdDFCkBISCWBK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmjT+o18HQEGU/sh2XXVi9PeuAXwCOvz/3KnFsm
 9WZwmhMseaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZo0/qAAKCRCLPIo+Aiko
 1ZpGCACE6gn9tmgMaVRmpBa4xTQljPegAbZFYn+ABYfIs31WEBWo/P9UqeL5ARG15SGCRyVcseT
 RxgOeDmBPXxGP9LOov67wJGBAUEvKJB0Pq8IOyegyKoLn4b+7H4TWdlpa2UOGSphHy1ZvoyX712
 MmV3f8r3HcL+p2HV6ZPJGfJW34MCMF7qVCDf3kcpWqSTPJZKW+kImOdbV90u7JaoKFX39eg8BbV
 G2rDiW3BCyta8sfiSHe4kMlk3AGfOPvh+L598PeQlQ0SJ9FkULJin5ywg8bPqpEr3REZg0Fs7PB
 Mz3sfn2D35c0aZgurVDkT2dQCqH2DaxaplNesO9HYYjA8y5t
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

Leonard Lausen reported an issue with suspend/resume of the sc7180
devices. Fix the WB atomic check, which caused the issue. Also make sure
that DPU debugging logs are always directed to the drm_debug / DRIVER so
that usual drm.debug masks work in an expected way.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/msm/dpu1: don't choke on disabling the writeback connector
      drm/msm/dpu: don't play tricks with debug macros

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       | 14 ++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 14 +++++++-------
 2 files changed, 9 insertions(+), 19 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-dpu-fix-wb-6cd57e3eb182

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

