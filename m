Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8832B85A354
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 13:31:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825AC10E3CE;
	Mon, 19 Feb 2024 12:31:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="v+cFTfya";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497B710E3A1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:51 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512b42b6697so846519e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345849; x=1708950649; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIWqlE1cPX165do3NEp9Vd40+qOG9WCTV6W/duazB5M=;
 b=v+cFTfyaLwSVG6vbulRpCOL0qJZ/4wcBUYABmVUIrd9ALGfWufcYzJXpmUv4kGI2Hk
 vEcdtTzwh5G/zk0mGx8WD7rZ4LqzoeUEu/8OoCCeVifTxNgyKXU8YsS9+k9mqgtQ7LFH
 vyDDzSxsDo0uEdfl2nDDeUbtZ/M0iQ7ofqoBHaaJEG51bMArE7/4HBXpx0lAeZqLGqRT
 xH3wkVW6ebGZZogC/bKCljphxOochBazuVTkRI3gZ+6Nb+0iQqkJLIWFaBlEqcBFO3l9
 884AM2SfXG9q1S1iS1jd5BmWPY2M4qrG8VDyQXkiy7BZHCUFvHgQZvvmOmclcg3ib59t
 kjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345849; x=1708950649;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIWqlE1cPX165do3NEp9Vd40+qOG9WCTV6W/duazB5M=;
 b=ikn7GhiWGBX+FmLhhMDAjpvPYIlSDesIWBaXvgr2B03AmSLfumsb5Fus3DY7K3cSEx
 wLL4ilrRzI8khOfcftBf907xyTDdtU2U/FREt8yyMwmIP/62D8NISxOA0NY8Wwjj3NQ0
 qVE2LpYkkdWc56B0HWE6U52rxJXOTOTt7/ot3/rGiDBZq7Sh9bemVqC1o0i4Sx0FIYl1
 UNqbvlDBTR7W+5+TKP6krhYKYAmnli7OelNjaJNSCr3krF2DySofwqo2AOKwVlhGzmLn
 J4RIzR/JhNVEdolJaQeRL1CrILEgQuHd7VQgYfetOy1Lz82oXoAVpjUTEnbG1h+pm0UL
 sp8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqT+MT4p6k6i5JzwScAi9U+0PMKHE9MtXJ5JNpVoPSIEgoK0qsOomrNiu/980PHiG4J1qdZMb68unRUiVKuQMCYodxzj+XXTU1rtI5ZMYx
X-Gm-Message-State: AOJu0Yzhll2wk9VGOD69bgg9sQFZc4Q571hmI3KAAlZ/zDcl/jE7vMzP
 ElN8TxUGmRQPpAncp8j/szVYAHQPvhLTftU7jS5H2MhQQDOqtyzw1ESGLV2+yV4=
X-Google-Smtp-Source: AGHT+IFgAhvmZh5LxpfhxpuBO8bVNoLr52ZnhCi1bbOTANuMQKRN0YvmuCTEPJPwH7nXK+wPUAek/A==
X-Received: by 2002:a19:ee13:0:b0:512:aaf2:f2f7 with SMTP id
 g19-20020a19ee13000000b00512aaf2f2f7mr2579515lfb.23.1708345849425; 
 Mon, 19 Feb 2024 04:30:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 0/5] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
Date: Mon, 19 Feb 2024 14:30:36 +0200
Message-Id: <170834569502.2610898.892456628815949762.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 08 Feb 2024 17:20:40 +0200, Dmitry Baryshkov wrote:
> The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
> redundant. Implementations only set the IRQ indices there. Move
> statically allocated IRQs to dpu_encoder_phys_*_init() and set
> dynamically allocated IRQs in the irq_enable() callback.
> 
> The writeback backend of the dpu_encoder is the only user of the
> dpu_encoder_phys_ops::atomic_check() callback. Move corresponding code
> to the DPU's drm_writeback_connector implementation (dpu_writeback.c)
> and drop corresponding callback code.
> 
> [...]

Applied, thanks!

[1/5] drm/msm/dpu: split irq_control into irq_enable and _disable
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c6f60037bfa0
[2/5] drm/msm/dpu: split _dpu_encoder_resource_control_helper()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ca8c1fd3eed8
[3/5] drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d13f638c9b88
[4/5] drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c
      https://gitlab.freedesktop.org/lumag/msm/-/commit/71174f362d67
[5/5] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b0b621f41b45

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
