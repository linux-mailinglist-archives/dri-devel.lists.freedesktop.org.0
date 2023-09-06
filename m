Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799A794625
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 00:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2778D10E11C;
	Wed,  6 Sep 2023 22:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F135F10E734
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:25:32 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50291d987a2so296230e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694039131; x=1694643931;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=uDonlp5HbiwJ26g/F+Y1WXSGwKSC1oc1l4KT4dWvVHo=;
 b=hgvOvAkIwS+kemDG+MzPYOWEg11G1Vg857ak8OfMcKNQBuu+d0ml1DjABsDhFcoTgX
 5/HRq4CPknvdw0065km1iYNo3YuP9Yj/SyHWOXI8DPg3lLSkAetu0tLj9/RcGO7AfX/p
 v8HskYtRuWf59vSOHpzab07Ml9XpUou73xD0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694039131; x=1694643931;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uDonlp5HbiwJ26g/F+Y1WXSGwKSC1oc1l4KT4dWvVHo=;
 b=lsT/y/ghwYLADSvSzzOxVocvuiBAfg7Y4wijGR7pyrggS5XTzfgyDLmduBA6XhSgLH
 bPZgw89/9PWfMyNnd36ckLq3pkD9SgEHODP7VRY951NDZf1Ja+UcqCpPfDaJwzbkUGNc
 cQytb4pam+7/GKxb2XxmGlHs7MWRYdMhOFp1IxNIpGrcDO5nJLH/tZ+2VR3eRsmeRnQJ
 6WYU2IuhVjbcyE9VQ7UntVlH1hmYMVjDg/61v0zJQD2Ub4IZ6hFIuNwYQuGSVLI3Mp9C
 4NoSUcYjqfSwXm+2hzPduRKoCE7QlANab8xCEBGc8ERdEb6dfGfTZ/DlfpdiGXFeM0bC
 ecog==
X-Gm-Message-State: AOJu0Ywfdk6vT04HlhurxwZDTKChC4XVXP0/xQcFY+r7Rm8D1z/q/J+t
 wu0nUCjqAXlAsSoZzdNYeFxlStOqFamchTxCeEAgyg==
X-Google-Smtp-Source: AGHT+IGRyS1c97uF22edCstQnjHE3++8HtvAIKFyj1onPIBRInMD2saCMupJhLIk5aHumPexINlma5qaQAzBw+T/Zf4=
X-Received: by 2002:ac2:4ecc:0:b0:4f8:586a:8af6 with SMTP id
 p12-20020ac24ecc000000b004f8586a8af6mr3147978lfr.4.1694039131144; Wed, 06 Sep
 2023 15:25:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Sep 2023 17:25:30 -0500
MIME-Version: 1.0
In-Reply-To: <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
References: <20230905174353.3118648-1-dmitry.baryshkov@linaro.org>
 <20230905174353.3118648-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Sep 2023 17:25:30 -0500
Message-ID: <CAE-0n508=RCxtWRd67TFGwMDdfNKWU9dJ+q7hVt1GWyTTz1w-w@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm: add a kernel param to select between MDP5
 and DPU drivers
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-05 10:43:51)
> For some of the platforms (e.g. SDM660, SDM630, MSM8996, etc.) it is
> possible to support this platform via the DPU driver (e.g. to provide
> support for DP, multirect, etc). Add a modparam to be able to switch
> between these two drivers.
>
> All platforms supported by both drivers are by default handled by the
> MDP5 driver. To let them be handled by the DPU driver pass the
> `msm.prefer_mdp5=false` kernel param.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
