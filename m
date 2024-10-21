Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740BE9A67D6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 14:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923F110E4B5;
	Mon, 21 Oct 2024 12:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tbUB+Jx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB82E10E4B4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 12:17:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539fe02c386so5361621e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 05:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729513070; x=1730117870; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8qLLGlelXfw2kOWRgnYcArT7sxf7Sh5Qskx0JzdYb0Y=;
 b=tbUB+Jx6a1RMCmYkru8BmpqyuPJTUvgrbkNONbaQmQcsG+PHO9slbvv+Ym7Gkig947
 bGvEZqJRnWqPW3A0CIL2QljXcrzIp2yXHZLC5GUWwl+mN2Tq1Mpenp/+43BfqHE1Fe/H
 f1zUHARMGtuV+2Psoy9UiWJC2I4zN2pqPBlX78l7nKXO7Uz1KUwb9HBjwTWCo1hSFAB1
 nVud2KkiwZRigQJuSOXpZJzbNFN9ykS2ULlReEpv9pwhLi0dCgZjxJAhdVGg9uUy/tt6
 ZdReQHGXO1ZLVI4IavGKfPhG8GbzhvlrV7DwjeCEv7GMo4KXMen9PSbHp+JiC0LWIYd5
 xngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513070; x=1730117870;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8qLLGlelXfw2kOWRgnYcArT7sxf7Sh5Qskx0JzdYb0Y=;
 b=roKVaQ3LfRmUADRH0AhlvUGZyODT/9e51FUcr2STvNSjzonq2UGBFLE2M0pAXWwclm
 o/FHefoBUqgrOqx0R4BZngx2j2LOIwTOq9OLK+YdNv5KFQKdCzmabjIQ7ZZszwWlsrp/
 pL/R2m7AgSaJeTkNvIzzCKMIRKcLaUbkSSDtR6yyRXPqJ1NFQM7aZ1H3h6KEPcxlyEdK
 51olQHY0Q0dW1jRV65Cr8zfnuqHGUtHthbtT75Estx7uWWkn3IEvhG1Ixrq4+oMlCd1t
 smUv9BK44qvLJLAZ/QAP21w5rsbtZgWLV3h3QBXzZIH5aHJXdj+gc8GY/bRmc6VL9AE2
 Zf2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnHsc29D/fEcwih3TWc4CyEUVa0m6Yf4C3xQNJUzCIaQlXNpf6mtSBThV/BF4iIih95wQhWITqmpo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw59C6Flx4B+lBhzBPqYiUB/ti8ausEXeJ05d8jWDdFE7G/hwKM
 HV5+o76zxKjSf9ne2fJKJjc1JQAu3qMdmUILMlR+aqjLIkJMcwrz+wmHwqydp2o=
X-Google-Smtp-Source: AGHT+IF0g/bNs020ktyvkJGhslYGuUa/hvVDeHmrz96Crq4Feba3diCTJ56gaV/wdKJy4llgsgIr6A==
X-Received: by 2002:a05:6512:3ca3:b0:539:f1d2:725b with SMTP id
 2adb3069b0e04-53a1583d16dmr3188181e87.4.1729513069926; 
 Mon, 21 Oct 2024 05:17:49 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.90])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a22431454sm464210e87.212.2024.10.21.05.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 05:17:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v6 00/15] drm/msm/dpu: be more friendly to X.org
Date: Mon, 21 Oct 2024 15:17:39 +0300
Message-Id: <172950935859.2053501.3604062038723435525.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
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


On Tue, 03 Sep 2024 06:22:43 +0300, Dmitry Baryshkov wrote:
> Unlike other compositors X.org allocates a single framebuffer covering
> the whole screen space. This is not an issue with the single screens,
> but with the multi-monitor setup 5120x4096 becomes a limiting factor.
> Check the hardware-bound limitations and lift the FB max size to
> 16383x16383.
> 
> 
> [...]

Applied, thanks!

[04/15] drm/msm/dpu: drop dpu_format_check_modified_format
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a26991933c01
[05/15] drm/msm/dpu: drop dpu_format_populate_layout from dpu_plane_sspp_atomic_update
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759bcfe8e710
[06/15] drm/msm/dpu: drop extra aspace checks in dpu_formats
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ce357877e6df
[07/15] drm/msm/dpu: drop msm_format from struct dpu_hw_fmt_layout
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5e317a64967b
[08/15] drm/msm/dpu: pass drm_framebuffer to _dpu_format_get_plane_sizes()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d13445bc61dc
[09/15] drm/msm/dpu: move pitch check to _dpu_format_get_plane_sizes_linear()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d8cb42418207
[10/15] drm/msm/dpu: split dpu_format_populate_layout
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b05093f4296a
[11/15] drm/msm/dpu: make dpu_format_populate_addrs return void
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4f3ec1e5e152
[12/15] drm/msm/dpu: move layout setup population out of dpu_plane_prepare_fb()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/dc0def61a16e
[13/15] drm/msm/dpu: check for the plane pitch overflow
        https://gitlab.freedesktop.org/lumag/msm/-/commit/707db375ecec
[14/15] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with DPU_MAX_IMG_WIDTH/HEIGHT
        https://gitlab.freedesktop.org/lumag/msm/-/commit/671cc420b5f8
[15/15] drm/msm/dpu: sync mode_config limits to the FB limits in dpu_plane.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2261751d5f22

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
