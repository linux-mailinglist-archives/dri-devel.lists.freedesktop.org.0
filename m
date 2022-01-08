Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F90B488538
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 19:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3CB10F2AA;
	Sat,  8 Jan 2022 18:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8126F10F2AA;
 Sat,  8 Jan 2022 18:09:24 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so16590130pjf.3; 
 Sat, 08 Jan 2022 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DocxFXdAJY37L6DlG3De/ynEIKw/NoYzpHSiyKpP1us=;
 b=SMD7T/2epjcnWjFmIgvtvEsWI+xc6iu760NJAZauiT9yO3Km0BZNCCYoEGzUhcsDpO
 BPCoXIfQfsj8C0ErQYCA/XO234JEZGfxPmaCkCEmuowKjGWrqTkRBkeM6cIHI9UftZ4+
 HEyoInJwCzCcYg3bCp7eC74248eN9ypLtYlsiPODduK+wOHRzZfjLigti/DTz573JGwl
 tkZnnI71N6PK2pA1sbZrgciShS5WuC8D08CqnJ3ZGANEp3vcMzxbKaOAtYh8zNcliHVF
 6ckPftLKasIRtQOMPDtHJlRTK1Leqy3oZ/5I0yANMiEqNLh2EYiwvKXUJHzqlIR+NIDJ
 9YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DocxFXdAJY37L6DlG3De/ynEIKw/NoYzpHSiyKpP1us=;
 b=bNByoSfmoyU3LAQl22HRwwJvNedn9qTtfULkwZpTUI9aRM2vE0zpkJl5yLLEMhEC25
 AegT6m8uqpoR4qtOdNrcU2uOLCByERhz5D68R8eYI7z/jTSG+fIdcMtioiS/mr5YWMrr
 3zlvBxNDuEzLAbzN3pluJnuIC43QfPekzrSeuMARAFUljhHoGu6Z0R2tfbXUiIuFO9hp
 +2BmMX39zqcTkk72Bb1IugFoOgeb+VGxE8hJMwXAmRagNqCjlc3eLEwIKL2xKAmg8pld
 fPNiQug3pk0JSDszARTd4F47sOafJYWGvE772q50+yF+LquEmINW5KDiSO42UdyQNfpC
 tZ0g==
X-Gm-Message-State: AOAM530f6WC1TdMyerDu+mf6qT6mgbroSkBIzyuPxqSOGRjRKgs+1uE3
 NawKgVlqFxS/eOfkjoMerwcF8SSJEuM=
X-Google-Smtp-Source: ABdhPJyJLFZ2l0VKMwTPAPRHyqaK0kNwqFAAoswZCfQgHtGirzg5qrPr0kRZgHcms1ohydXGRRGLYA==
X-Received: by 2002:a63:9204:: with SMTP id o4mr39996960pgd.596.1641665363603; 
 Sat, 08 Jan 2022 10:09:23 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id t191sm2049854pgd.3.2022.01.08.10.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:09:22 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] drm/msm/gpu: System suspend fixes
Date: Sat,  8 Jan 2022 10:09:09 -0800
Message-Id: <20220108180913.814448-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Because system suspend uses pm_runtime_force_suspend() we can't rely
runpm refcnt's to protect us if the GPU is active, etc.  Fortunately
*usually* the GPU is idle when system suspend is triggered.  But that
isn't quite good enough.

The first patch attempts to block for a modest amount of time until GPU
is idle (and failing that, returns -EBUSY).  We could have taken a
slightly easier approach and just returned -EBUSY if GPU is not idle,
but that would cause system suspend to fail.  And no one likes pulling
a hot laptop out of their backpack.

The second patch avoids getting devfreq callbacks after suspend, since
pm_runtime_force_suspend() breaks the pm_runtime_get_if_in_use() tricks
used to deal with devfreq callbacks while suspended.

Rob Clark (2):
  drm/msm/gpu: Wait for idle before suspending
  drm/msm/gpu: Cancel idle/boost work on suspend

 drivers/gpu/drm/msm/adreno/adreno_device.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_gpu.c              |  3 +++
 drivers/gpu/drm/msm/msm_gpu.h              |  3 +++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c      | 21 +++++++++++++++++++--
 4 files changed, 43 insertions(+), 2 deletions(-)

-- 
2.33.1

