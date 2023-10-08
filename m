Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB8A7BCEB7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Oct 2023 16:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5210E160;
	Sun,  8 Oct 2023 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17AF10E145
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Oct 2023 14:01:24 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2bffc55af02so43472411fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Oct 2023 07:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696773683; x=1697378483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AxUKAYWwBeD3fhOuChFzH6czq0+a6bwaaNWd9hM/xo=;
 b=uwfvfT+R5jdkMOE7BqpBJcUpAPn//FIeBYnNegfwBQLww8EgaIQ7qQsjTh4WCw9ZnV
 MKHA47jocDYYrID3fIn784Ah+bfzl+CVaBgTW4CVme1vEhzI5yi8wgP5FZ4ji2MQhewL
 24cx6XyRfeowG/Kcmr9OI6Nkan8uaejE2n4jXvUOEBAdfSFJaIymOwx1lw+PdYX1x3Dw
 9csXHmgMTfJioF0oCDSj3tTvOtdretnZNlhn+zNdMOzPTB3HmpieoINOkRCawITaHp/G
 2LHB5Y8rMzACd5x4wTI05Q9AHT5ALlinlYWg4krwCO1snhJLkGNaSn6eZIdFms6P4l1Y
 LSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696773683; x=1697378483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6AxUKAYWwBeD3fhOuChFzH6czq0+a6bwaaNWd9hM/xo=;
 b=mYaBuViOZiPRbPtCHZxuj/BiJn2KSklD50Zij/MbiEbj4+3Vi8BWQ8IkG87B4+ZrAe
 Oq05OQpMm/Crsq90g6ua07ZSJPQiZo7Nrpc5QL6nFvrPq4v9Whdez+pQNWG2hiNusctN
 mXkGF0zeKaIclCMHTVV5bLKwwlVJcUpnQs/41D/psBF1KaaVS4of2oKpvu6px4utVYDo
 rt+rGMEabl4JeyAyVFemvrWlk/4h7hHYmAy5RtUAjURwi0PVMycA1UopxlhQCMWapb5y
 qv/+Tu/CMieBibqIxALVEix0snqiDm7dFmWiAmooP8pA/7phQvMO5w0WXc2+kQJVtQYh
 vXDw==
X-Gm-Message-State: AOJu0Yy7MR6sVEAsUauCujXFVFdkkq920GsOqUPOxBN5O4uw4FV2UEVX
 hw+N0ND4nn+gfx6o37IdpHO+Tg==
X-Google-Smtp-Source: AGHT+IGsqTrsOImdMhvATLLAdYVP4k0fs20niP68rGVFAV23rBnI9b++gPvcTznvyxr7TtMImQjc1A==
X-Received: by 2002:a19:4f43:0:b0:500:a240:7240 with SMTP id
 a3-20020a194f43000000b00500a2407240mr10846395lfk.52.1696773682823; 
 Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q14-20020ac24a6e000000b00504211d2a73sm1080455lfp.230.2023.10.08.07.01.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 07:01:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_ini
Date: Sun,  8 Oct 2023 17:01:13 +0300
Message-Id: <169677306905.2570646.4925967072440404111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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


On Mon, 04 Sep 2023 05:04:46 +0300, Dmitry Baryshkov wrote:
> rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
> performing the MDSS revision checks instead.
> 
> Changes since v2:
> - Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
> - Removed extra empty lines (Marijn)
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: inline _setup_pingpong_ops()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/536cb755ae62
[2/8] drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
      https://gitlab.freedesktop.org/lumag/msm/-/commit/feb77ef1518e
[3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ec6a2b7ea1a4
[4/8] drm/msm/dpu: inline _setup_intf_ops()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3d6253c215c1
[5/8] drm/msm/dpu: enable INTF TE operations only when supported by HW
      https://gitlab.freedesktop.org/lumag/msm/-/commit/72e72051c9f3
[6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a0903388dcb
[7/8] drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b9898213ae5a
[8/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4e2bbf17f41c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
