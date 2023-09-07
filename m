Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C4797DFA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 23:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5F510E26A;
	Thu,  7 Sep 2023 21:34:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A18C10E3D7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 21:34:16 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-502934c88b7so1912968e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694122454; x=1694727254;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
 b=YokYx3xnN9MUkdVl8dnUsUZqm4LrukPKEfNQMqTDBzgYVwCQ0dG+d5yxqX2NQBRib+
 oZy/3jrVDdelY3ySdUBXD7NyzIQhvRlPhkawSz8Pr6nLKYkSRyojP9dqTKsFk8bS95RA
 fjV+9GSz80kEZj7IGY3/U3BZUhJeISgJSxS2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694122454; x=1694727254;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
 b=Dx56TG4acECBFk5LhpxB3c3dnSvvOUbPJIogLe2jWVKYcgTfH5pqesTbcBLciuSR9l
 a99OskortQY59ZNX4cou4N9yF2Uz2COwbWEsYWm7U75mRWCw4n0Mzvx1pDZtJu5Y8Mwj
 TyJ0Pwavj6oIwcb/NmXi6QXfr04eu6fmyK88U60z7OPXUTIPc74njqN7on9Rxw/8BS7l
 ZnqsM+5xkDYHilleh6Y9HFHadWch8uihvVZPful2HusMoaMx1rvh9CZ7ACF3+/oMqU46
 bVdy0N/b7pWy4e2Ihk4vXodFFRJg4ceWviSUOyGA4km7ESDPL3jqqNi5aBrGnPL6hrGa
 Yu5A==
X-Gm-Message-State: AOJu0Yx0+usDy7OCsmab9bNtaFMwNuaJarz/jqIKaaVoBTrhUyPwPHDU
 gW8LmmBrQx4uP83T3nUdpbBVcE6B/5JDWGJDJ5QPWQ==
X-Google-Smtp-Source: AGHT+IHFSLJRBNk28/pXHA3uV4ZreNC2omLjMVD44CUHGiQJ/6WY/p0NrEsWtw8OkStcCfwFeG5y/zxva1dptUDeGkU=
X-Received: by 2002:a19:7706:0:b0:4f9:7aee:8dc5 with SMTP id
 s6-20020a197706000000b004f97aee8dc5mr384540lfc.19.1694122454365; Thu, 07 Sep
 2023 14:34:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:34:13 -0700
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Sep 2023 14:34:13 -0700
Message-ID: <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
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

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 97ba41593820..1cb54f26f5aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 }
>         }
>
> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
> +                                        dp_panel->downstream_ports);
> +       if (rc)
> +               return rc;

I haven't been able to test it yet, but I think with an apple dongle
we'll never populate the 'downstream_ports' member if the HDMI cable is
not connected when this runs. That's because this function bails out
early before trying to read the downstream ports when there isn't a
sink. Perhaps we need to read it again when an hpd_irq comes in, or we
need to read it before bailing out from here?
