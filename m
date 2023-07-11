Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B374F1EA
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5451810E091;
	Tue, 11 Jul 2023 14:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2452010E3B7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 14:22:06 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b702319893so91954061fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689085324; x=1691677324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fgmqG4jujLqQxwJIJ5hn90DGaowksqxT71+ZFrlpWAo=;
 b=P+XhG1RoWkWCxoS/7h6wBFCjdnfi47tfCVIzhcVEL+s2Wkg2e39YOL6s9PfhplMbYP
 EG82NB933L18GZCmT73/u+8O+rJknSLCjJ2UHD0ZIMnYgY0yRzt+WpS5goY1vHMsEJCX
 LiWipyvBpnEvRm1HeV1gmN9CO/SHEF5uysxR4qUPpU7PytyEXjXopbml5+KNoW4CjOVG
 gd7DgbJ26HEtyi4tIIwZlgbMnmcVL/zWoOLshUgBjHzXj0Yg4BuXVyQyroAL28+5xzWI
 HI0BGpV0HSKRJkFvZg1byOqwvimpaCNTYp/3G3HjsdR8m1HkBwIn5DLwxzB7SVOM0rn0
 M3hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689085324; x=1691677324;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgmqG4jujLqQxwJIJ5hn90DGaowksqxT71+ZFrlpWAo=;
 b=PrS34PwNrm9osWBdjjxbUPvWKjgILzkj6qkRmsEtyzF9ochg/dehq5bXFphSxmoDWN
 dW65X0SVaaQ2OIC0QUCdMNhWSITMlXESbDP7iLx46B8riL9DX/HOTKsosEMNsl5capM/
 Qi0UBRpcJApXGnbtRcflAp33h2FEnYZvuGB2BIc4cqYDiB2Qu5FDUpzMZ3FdiG9G5Alm
 5wXekCrJXhNyt3LAYaWOGFlrj2c/vpD2zJaKslTQNfNk2A2wjeCRmaSTSrJ18PZFgID2
 cWbqjTQxAj5xkVpr1RjKZddjnSQxNRkLeHBGYsJYu62dy+ElmRp3fYgN66HPul77+8YM
 gddA==
X-Gm-Message-State: ABy/qLaDdO8tBxrIh3Qqc2Tqo5IXcXcFUzg7z5Ery3qMCDkElvznifPm
 KkdfAv0l2v7A2pBAiYIWAg2pNXkKf5kg+wTPsRE=
X-Google-Smtp-Source: APBJJlHpfuT3UxsY6ALFZB4Z/BEceDANtxuKi9GxtHxD67I2xBdVnCt8nJfM6i+UTVnNQAOf+0OKOA==
X-Received: by 2002:a2e:a0c8:0:b0:2b7:764:3caf with SMTP id
 f8-20020a2ea0c8000000b002b707643cafmr12539420ljm.10.1689085323898; 
 Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 v9-20020a2e87c9000000b002b6b4424a28sm487934ljj.13.2023.07.11.07.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 07:22:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run,
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v5 0/2] retrieve DSI DSC through priv-dsi[0]
Date: Tue, 11 Jul 2023 17:21:53 +0300
Message-Id: <168908465045.1869384.116123598004032569.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
References: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Jun 2023 10:24:44 -0700, Kuogee Hsieh wrote:
> moving retrieving struct drm_dsc_cofnig from setup_display to
> atomic_enable() and delete struct drm_dsc_config from
> struct msm_display_info.
> 
> Kuogee Hsieh (2):
>   drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
>   drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info
> 
> [...]

Applied, thanks!

[1/2] drm/msm/dpu: retrieve DSI DSC struct through priv->dsi[0]
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5430ec2d2992
[2/2] drm/msm/dpu: remove struct drm_dsc_config from struct msm_display_info
      https://gitlab.freedesktop.org/lumag/msm/-/commit/86841ba67bf0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
