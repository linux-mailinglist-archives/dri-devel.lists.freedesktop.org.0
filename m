Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250B7BCEBF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E0210E193;
	Sun,  8 Oct 2023 14:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFC910E145
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so4420595e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773683; x=1697378483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=apniIjixKvqckL9Sm3hOvmNcpwUz/iON/HgK/A5yGAU=;
 b=CWXu4JOJgVTkAgz2fM0DV+i+rBGoyQ/m4VN1w+DgXLYUIxONvCG7q33DAyN4L2txgJ
 KyedAMuDZE9fFJlvACj2v15/vRV/crBfU8qqwDu2PTZhOdITLpoS+5Lpl4cU/+AVyHD9
 LYoiEFYJi0rjN/Tr7RxpAgwKNa6mX/qFJwpRNHK5GsVJQYuwJnxrA0t3XkUA6nZPpN05
 Lrrcx8KKEFgS7UuosNQoumZ/0Op91spuMBv3/sX9+zBWpfP23uAzJKNsE0Lm7SjYw75a
 K9M0h5a75zsY2g/brXgXWRegtHgdzASRF7EHKW95J7oySn7M+KpUo8bP01cO/CL1NIHL
 LNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773683; x=1697378483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=apniIjixKvqckL9Sm3hOvmNcpwUz/iON/HgK/A5yGAU=;
 b=TJdiKY0Zl1kUn7cpscYN6ii2mx26lMmgb+Bm10dhdPNwisttXmXCStSh6Pa6ldpMbn
 kAyikFDqtw0IArfdESYRfUyM3C2xjHac9gLyJcngAEZRLgSRtA5amAUHtHQRNVa4E6j9
 QjTVhSRrTnExO4ksZ/dsTl1NHRAa5sBGxXI9IhGM8BslXUz4FY1VV3X6PPRm1xFC8yDh
 Zmecdp+UfpbtrZ67StPC4keFDHucwD3eVV+TKmSPDWnBebKFmZydTunC4QvvYvU5IdCH
 7ci/vrniUTZK1t9XelE4HK1jV+YyBv5IHIy/H0cUiWE8XEnG0HdzlG+fDqbrioJjC/M8
 C+0A==
X-Gm-Message-State: AOJu0YwltCn0P2oGgHY3YJjJLu4JqzAUAlXGO/QKyOfCdl+3cVmJ69oa
 5yAXGQMX6VcG1LPBArQnZ6UZvA==
X-Google-Smtp-Source: AGHT+IEyDzFGaiYy77HWqEHLP2FOooiZCpC/5v+tlr+lfavdl6lZ5i/lgD4uei9YtKP+WFzkew4kVA==
X-Received: by 2002:a05:6512:32cd:b0:4fa:f96c:745f with SMTP id
 f13-20020a05651232cd00b004faf96c745fmr12756503lfg.38.1696773683615; 
 Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: change interrupts code to make 0 be
 the no IRQ
Date: Sun,  8 Oct 2023 17:01:14 +0300
Message-Id: <169677306919.2570646.15759097589934726278.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 02 Aug 2023 13:04:18 +0300, Dmitry Baryshkov wrote:
> Having an explicit init of interrupt fields to -1 for not existing IRQs
> makes it easier to forget and/or miss such initialisation, resulting in
> a wrong interrupt definition.
> 
> Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.
> 
> Dependencies: [1]
> 
> [...]

Applied, thanks!

[2/8] drm/msm/dpu: remove irq_idx argument from IRQ callbacks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a437d2ad57cd
[3/8] drm/msm/dpu: extract dpu_core_irq_is_valid() helper
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bd4c87f01ed9
[4/8] drm/msm/dpu: add helper to get IRQ-related data
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c22014a4f9d4
[5/8] drm/msm/dpu: make the irq table size static
      https://gitlab.freedesktop.org/lumag/msm/-/commit/88910969b897
[6/8] drm/msm/dpu: stop using raw IRQ indices in the kernel output
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e44535d80deb
[7/8] drm/msm/dpu: stop using raw IRQ indices in the kernel traces
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4961180f7420
[8/8] drm/msm/dpu: shift IRQ indices by 1
      https://gitlab.freedesktop.org/lumag/msm/-/commit/2ebf933742ec

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
