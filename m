Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD5890F36
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 01:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FED10E45F;
	Fri, 29 Mar 2024 00:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AhsdwHA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BFB10E45F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Mar 2024 00:24:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-513e25afabaso1641562e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711671847; x=1712276647;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=OKKadjbl+IjaVrgNtNEvMRJkka5H/Sf6yJutNvR12Xw=;
 b=AhsdwHA68nHV7fGOQyt4JjTTG5W6vuq+ZMlTXKu6zAFG0dLcQYkvgqKfunBXswZ/hI
 379aHtk906s7zXnkM8wkT4Jb+MDKvgRF77SLi/59JY05i11XEdSQNZ+539doya55TLTO
 lIQ0FmwqfqW+6Rd4er+cieUwbZ9PJ8BYRYvQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711671847; x=1712276647;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKKadjbl+IjaVrgNtNEvMRJkka5H/Sf6yJutNvR12Xw=;
 b=X4wvIzeiV9bIn9NNcYsKwn9ohIsXHCuTngIcpvkoGGILCqj2NH8FKty2bK29D23g9t
 e0UaM12THmg2VmoCiOn4mwheeI5ppC2+Gyk7ktd6NZzzoi5KrrviP5K/3bpSNnyGE8jM
 P+ggRiRNkHxH3ITJLmjZc+F9BHhghSzzE8HYLefHW5USM7Lz9vagUKqKiLqrDa7xmC+n
 KPy9NhWZl9LlQV4+RrivbTd/45lJPSpwwHBmaEfDQuSnTm5lgK7JDMXHGxOXfNZjDNYT
 x+YOj17qNu8gApNzJ1nABoc07G91197m443KpI7oM5jwdjMzEmsvbgPKT0aHN7bZibt0
 vU5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy2iQ06odEhWmfs6VOxYnsSsYDkZy0LCEKNqb2rE+piszxliG7t8IwfOBX1Jl2Td32Cagf6elEf59zpa65begvkv19fWbnAlaXcw92HWdd
X-Gm-Message-State: AOJu0YxZW1b3kzVltnn+H2EedXhP2UsffY2CSQmoKrDx2tjgTsCPcKtv
 XfD0g1NTBzVLz426R0oKkoWVEyde6bX6b+na7V/bjEEtvheEo8p2WWZDfsJnTGv+lAZthsRlIAt
 /MkwCBVlsTsU9c1SmcErJ/a04LzOOsHHSAPHn
X-Google-Smtp-Source: AGHT+IF7eR7SuZccKDbAejbaIA8l1qTeJc8Wrv2nofENrr5u/5niJzZ5bWpbyfr44eBl9K4WwSe8VpOjvVq6kooxSmU=
X-Received: by 2002:ac2:465e:0:b0:515:d100:1650 with SMTP id
 s30-20020ac2465e000000b00515d1001650mr177609lfo.57.1711671846981; Thu, 28 Mar
 2024 17:24:06 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Mar 2024 19:24:06 -0500
MIME-Version: 1.0
In-Reply-To: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
References: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 28 Mar 2024 19:24:06 -0500
Message-ID: <CAE-0n53qdRk0LRFambwRB=xiV4ak3Odoqhs4rOJg3x77c4MrTQ@mail.gmail.com>
Subject: Re: [PATCH v1] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, abel.vesa@linaro.org,
 agross@kernel.org, 
 airlied@gmail.com, andersson@kernel.org, daniel@ffwll.ch, 
 dianders@chromium.org, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Cc: quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_sbillaka@quicinc.com, marijn.suijten@somainline.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Quoting Kuogee Hsieh (2024-03-28 14:07:15)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 36632fa..884973a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2754,6 +2754,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>         const struct qmp_phy_cfg *cfg = qmp->cfg;
>         void __iomem *tx = qmp->dp_tx;
>         void __iomem *tx2 = qmp->dp_tx2;
> +       int ret = 0;

Please don't initialize locals that are unused before being assigned
unconditionally.

>
>         mutex_lock(&qmp->phy_mutex);
>
> @@ -2766,11 +2767,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
>         cfg->configure_dp_tx(qmp);
>
>         /* Configure link rate, swing, etc. */
> -       cfg->configure_dp_phy(qmp);
> +       ret = cfg->configure_dp_phy(qmp);
>
>         mutex_unlock(&qmp->phy_mutex);
>
> -       return 0;
> +       return ret;
>  }
