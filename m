Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D99F4907
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 11:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2188910E1B0;
	Tue, 17 Dec 2024 10:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f5Bk3EcC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6ED10E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 10:38:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso5793086e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 02:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734431901; x=1735036701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
 b=f5Bk3EcCqUd+ETLL8ETU2V95ukUbxHSQLWgdiErnB8M+fWQhMFa8r/uatsCeg8beO9
 H/G/gQJlGP6WlM2oKkZwaQ7oD27TXIulthXka+eEkADmNkJVt+M+ke8huCFuNHLnOCt1
 wNGxE80EUa49HQpJ5AC/6L+lzv26DMI5TGe83F8lEEriLgHs3QoNbwl+Nhp7IMRW2NQx
 gWhBv2YJy/2vLXXn8RKcb/XT/XzZfimR7IZeOIF6lCIR+le4V5+6UgtfQPl1U7a28HyM
 lIvV3xZuUHyyo9AVKqUJXwsqYcaVx6p1FVhoBR+GbZUdq9b7KshoCy6OLajepBc80UdI
 mMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734431901; x=1735036701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O2WYb32ky6fmIX8AC+7yLOBouXJ1HTE92cVXzHw7p0Q=;
 b=MqpgY3JXO1ztoiwOyPxHWpVrimxBssGOa7FYN0w9pFdCAEely7WhIt/R2Jpwt0UJif
 Xt8eVEdsgmrAw7MkE4vYoDn5n87HIZAsAzay5WEgkEV2V/KqjeOjVs2zB8bCMbuSSBfC
 fEQi48E9P5wvhgtkllGbwkarxuNE+B5U2ObeYgM+jlgvWCQ10bAZLA0e8Y29+aZOq0DM
 AUAJFHrnngqJ1TX+kg1RKbdo56k0mKvXSQjonB3E5vAsCbczZ6HTeKcINRNkrr+P53uN
 T25ccLd8MU3SUk3qIVm6A4/J974yke19/vax6oY9ITjIa1qxBonhnVFKK4hCzqPIt+Pn
 tTuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzvcYZcjkqMW2oO2dsdm1/i7SLpP5LQ5eRaBT4pLAfftPaceWKxBnV/8VPMV0RuF/soXEyRj7hYXk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzNGLUA4ElWcR1HMfkoKFQZI3DuIrmCx8Q7GaOsaHvGyD4oqf3
 T7DCtuUu2zTPFQFksB9LDAzfoK57db7VMafOFgiLnarinFsluec1SpPL/WEoLaI=
X-Gm-Gg: ASbGncvw05uknHlCoFburAnejV8fCiDTsu6c83PuSI4G+nofcGkNjIUTPbDbH7eF3Vk
 egBsO0DBXgOra59ia0v8FaFMqNhId8i/G4ZKwCnM2T2pe3hX/r6mD/hbzqQ+vpYCJgn9V4Ra2/C
 JGEVLrfQNiyJaATdU4wXU3rpE6qaMwmISzrUG7l9NdnHITCAkqsv1Lf2SDOaO3ambLHfi9RgXP2
 gKJG/3wphmkmZP8L+vj94EvkXw60xoPtbY4wTGZgyTQNp4/r4/SNjSL6JBzps45Aohdeu/3CNum
 p/Tu6ATrV/7zmd/06gGFENecm+1uE5oXbKuG
X-Google-Smtp-Source: AGHT+IEIrR2bMxG3Grf1QUMhkQELSDXhmLc/tmsZ1cto3QX1pRwRlgidZ0/hzrqApkhKtNgij3EB+g==
X-Received: by 2002:a05:6512:3b9d:b0:540:1dac:c042 with SMTP id
 2adb3069b0e04-5408ad82317mr5526367e87.8.1734431900751; 
 Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c1fc1csm1114367e87.240.2024.12.17.02.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 02:38:20 -0800 (PST)
Date: Tue, 17 Dec 2024 12:38:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Richard Acayan <mailingradian@gmail.com>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
Message-ID: <2e7ijil4v3wxzi7y2gsbyhh4o3vrhcbydcpzfcniij6cack3yf@wb2s2m7xet6a>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
 <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
 <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2E5SGIfAaKugNTP@hovoldconsulting.com>
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

On Tue, Dec 17, 2024 at 09:41:44AM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 10:27:28AM +0200, Dmitry Baryshkov wrote:
> > Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.
> 
> Please say something about why you're doing this and what the expected
> outcome of doing so is.
> 
> There is currently no way for a third party (e.g. stable or distro
> maintainer) to determine what this patch does, if it needs to be
> backported or if it's essentially just a clean up like Abhinav indicated
> in one of his replies.

These patches allow using colour transformation matrix (aka night mode)
with more outputs at the same time. I think at this point only CrOS
compositor actually uses CTM, so these changes do not need to be
backported. However they are not cleanups, it was a feedback for the
SM6150 patch for the reasons expressed in the Abhinav's email.

> 
> > Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Johan

-- 
With best wishes
Dmitry
