Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E91897985
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C180E112E9C;
	Wed,  3 Apr 2024 20:04:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GWUlKSrA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1C9112E9A
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:04:43 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-513e25afabaso359769e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Apr 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1712174681; x=1712779481;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=C1ldXuBtZD0meeLQ9ewOsNc58bmXcN65nhQZrzCO4+o=;
 b=GWUlKSrAmgLE+Zlhj3ySUx/R675xvCiTGSVU6tqwwWOBBGfvdrrM8fYvEUveNXRod4
 a0s/+tK4lXWjYhDm2kaL1ORqTEfXdVfSI/vI5Tby5WGwg/g+PTNuqlNalHuqDdjjgLJo
 9MZu66SnuczeQJYMWtQPOKF7aoKSOR/Y9qG5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712174681; x=1712779481;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1ldXuBtZD0meeLQ9ewOsNc58bmXcN65nhQZrzCO4+o=;
 b=oouZxIwXkxd5P4QfCqRaCOaSTuE1u1rVDYBZnDmZAz2KOMmhgsKgnKmokgfOOf6yn3
 aVY7Wa4wfcXm2rYShjCMVaWhkTtJMeuRxmcqZdNrcj9WWKIdGCRMs0Gl2u3UF3N3IWMm
 p0GtlGvdukvl4F8w33jKj3P2zEy6QpE8VC8Clw/pfqt+xXX8w3bPbSdnJFV18xFuG9DO
 QQSgBkkePY09I/LBj6q7r4AvUJB3VDagfM7XrzNwpHZaj911eQPSSPu/MwV3xEswHw4A
 czIlbAdcaaymJwSDU/nQRjkQwBNyvotabDHsc33L98hfVWrN80wsFUVFHGgRLTF4s9vx
 OE1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxXfA10diDHLE7KTzQmjpBYP54iPbUkDlVWZgpfnphZLhB1mmo6R3KGI+66rDtb1diP047kc8qaifPphNrj3uRwVq0MnozCBXn3hmIhmW3
X-Gm-Message-State: AOJu0YwkHERVyHfY3lmHpzIn9qLMaKFKrcW4PU0rXMkO/VT1lXaqJkKW
 W2B5TcwM3kMR19LUMZPqhBR3UFdUkXyEnrozI3m4xOwp8M9IlannB8o3jwV5y7MLyJ9Q+eH+D06
 6baiixnYqBH7P0yTIYvox1QsJSChXam9S+lFd
X-Google-Smtp-Source: AGHT+IEI86CzA7TT+IdyvGZ2GYs55lyyEY7kHHWG4VeBinBpm342IF+g/Z3YNKn5FTNDKtGHKVF5QpYrRF2JYfdtqg4=
X-Received: by 2002:ac2:5204:0:b0:516:b148:6d8 with SMTP id
 a4-20020ac25204000000b00516b14806d8mr354836lfl.50.1712174681526; Wed, 03 Apr
 2024 13:04:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Apr 2024 13:04:41 -0700
MIME-Version: 1.0
In-Reply-To: <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Z2pDGH+ncjQq-huDsn9jdN=1SfaaU+qw229nZpUVCDw@mail.gmail.com>
 <2f509949-7e7e-cbf6-c1d0-f25971c2d890@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 3 Apr 2024 13:04:41 -0700
Message-ID: <CAE-0n50qT2mHOGiU89NAmHdADQAAgs3aMP1RFOTTV8oCUbZKgw@mail.gmail.com>
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 abel.vesa@linaro.org, agross@kernel.org, airlied@gmail.com, 
 andersson@kernel.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2024-04-03 12:58:50)
>
>
> On 4/3/2024 12:51 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2024-03-29 12:50:35)
> >> Currently qmp_combo_dp_power_on() always return 0 in regardless of
> >> return value of cfg->configure_dp_phy(). This patch propagate
> >> return value of cfg->configure_dp_phy() all the way back to caller.
> >
> > Is this found via code inspection or because the phy is failing to power
> > on sometimes? I ask because I'm looking at a DP bug on Trogdor with
> > chromeos' v6.6 based kernel and wondering if this is related.
> >
>
> No, we actually hit an issue. This issue was originally reported as a
> link training issue while bringing up DP on x1e80100.
>
> While debugging that we noticed that we should not have even proceeded
> to link training because the PLL was not getting locked and it was
> failing silently since there are no other error prints (and hence the
> second part of the patch to improve the error logs), and we do not
> return any error code from this driver, we could not catch the PLL
> unlocked issue.

Did link training succeed in that case and the screen was black? Also,
did you figure out why the PLL failed to lock? I sometimes see reports
now with an "Unexpected interrupt:" message from the DP driver and the
interrupt is the PLL unlocked one (DP_INTR_PLL_UNLOCKED).

>
> > Also, is the call to phy_power_on() going to be checked in
> > the DP driver?
> >
> >   $ git grep -n phy_power_on -- drivers/gpu/drm/msm/dp/
> >   drivers/gpu/drm/msm/dp/dp_ctrl.c:1453:  phy_power_on(phy);
>
> Yes, this is a good point. We should also post the patch to add the
> error checking in DP driver to fail if phy_power_on fails.

Sounds great, thanks.
