Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33157704D9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 17:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ADF10E729;
	Fri,  4 Aug 2023 15:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A9210E726
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 15:33:24 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so3911356e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 08:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691163203; x=1691768003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
 b=mdnuEsB4ff942lzJOdWVE5DqJm3m702v928B2Mi3mmyo6TIqs665k2iz+eFXpRSDsO
 wxNH7lZZnvlhOUiY1/Ingp+O0ZRLgna3JH04B4vy7QvFlJ9xWJnXnXp5n10x50OXGYMx
 +bzzTM6bUFkZETdlNeqJ3eBuD9p3S4KiCptEMJAo2PrnroTF40rl66GGmzv8h49zg+YQ
 FdEmOdD9PuxiqQ9JcKC6DM2q9d330hRd3Q4Y3qPLOBeI1zJ0OHIIvCrvrLCmXSBcpufJ
 ROJ2c0wA/i0WFKBqWxvJLA3i7LJ2at4dZO0TjY4+Wwx3w+PnHlCEDLr4B8THefjCDIGW
 3hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691163203; x=1691768003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f6jlXHLj1MUCfLZToewZeR7OtzKxIt9mLVk/gVOh5yw=;
 b=hahUpq+weB8xC4Pgyysp+ADbLfoqdwUQI6eMgQyXQ5/40Hw+JJXHZqD0ecjRUBe54U
 WZVpvn64xboLwz/aMABpvoyjVeJo83VIdAF18RxM562BqvaKr8b48fc1EYB/PHs7D4IC
 wF9t+Sc4xgWRrGXIP0SHM3Im4/9mkqE9hKkvr20AHYpcRz2GmZ6HFnht6xXl2WE8qj+a
 bZHdeq/+Iv407HVv7RFx/f6q2bxnfD3aiErf+X5dLS/l2NcfNaA1uLhg/WburRJ3QC/+
 ckzPf3qPBkLMHRmcsdE/e+T93VS2BNxHg4aXtEgMc0jqLIMCa37kkR11N84akvuZ9QTM
 QRAg==
X-Gm-Message-State: AOJu0YxG762lA8PqS0SvvMUkYhnznN3TAKZo8FIt0qECZLCDwl1gEoOe
 WScaZWP2eGdlx+SyuyIayOgeUg==
X-Google-Smtp-Source: AGHT+IGW7itXMzBpTRGOomYFU6pVFSKbCE5PJfR8t9U8RbjMcV1bPdCvMMMUsQWTLeJSl+72NkQFwg==
X-Received: by 2002:a05:6512:3d0d:b0:4fd:f876:d86 with SMTP id
 d13-20020a0565123d0d00b004fdf8760d86mr2138504lfv.50.1691163202824; 
 Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a05651204cc00b004f873ca4139sm411874lfq.71.2023.08.04.08.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 08:33:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v5 0/8] drm/msm/dpu: change interrupts code to make 0 be
 the no IRQ
Date: Fri,  4 Aug 2023 18:33:17 +0300
Message-Id: <169116308154.148471.9274793163444236457.b4-ty@linaro.org>
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

[1/8] drm/msm/dpu: fix the irq index in dpu_encoder_phys_wb_wait_for_commit_done
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d93cf453f51d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
