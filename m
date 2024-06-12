Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E09905396
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691F610E052;
	Wed, 12 Jun 2024 13:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZzuKSWww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6B110E194
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:22:15 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-62f518bbab1so13698087b3.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718198534; x=1718803334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qsoWuzn17VvjikVzQz6+Jyxo7R4j3K1aNLPcDUzQdZE=;
 b=ZzuKSWwwA/PaSd2Tq4t6VaAXUZ2lsWac8Bjl9tE5bSsxBDXYZ8j/Gc9tgu3kT3kZ9t
 REd3HOqglPjeXbAFTt0pDz7nEoShhgB8odmC7AjNPqv27HL2Lby1H1xhkhj8zxE1zMYw
 f9A4fiO8NtBOKJ+XVhROvaARIkzGOfUHLqnzz4npjcQI/83qdmz3iB8kEFAoNdC5mxFr
 qP15jBlqH8E1GiOqSNQlfUNvQNRV+7XYfnTFNbx1exrx2G4jVo+iKtArxF3dsBafBbFA
 XHKd5XFCqUZQOrsbCEiSQtpDGihnqgA4CvXe+e0eAXnls1lIBXf2e3NrifWhoIhFYH11
 EbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718198534; x=1718803334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qsoWuzn17VvjikVzQz6+Jyxo7R4j3K1aNLPcDUzQdZE=;
 b=bQZfdtEvM2+iixhPBin+ktuIgBgQAGB+UrwmRUhsEek+oDD3KQ7+QFUasJeCl/kz4B
 fSo0gfKiONn8fFjTYKEDmbhJRvOWGoqGziVBB6oOooExySFKhZ79cdtWConnlnt1VkZ0
 vEEHf6waxNiEvZv6GY94xPX5zAo+ojRdFAdbV/NXLqMthxTV7NQm6yizvJN9IBGv54LO
 vy/YqiMsTC9gMg5N/Hzs595aPAkGAij7gPFmvQtEkDzcbsBgXDlz1uJlUuBEE1IGyjIL
 EMgWGkc190qYd/7EaHvsK/uxf97ikv9emv0KXFVOnw7CPVUY0ehY8ysUXzCrgWKFHf/O
 UFjA==
X-Gm-Message-State: AOJu0YzEiRUKKR6HBzHRi9w7LcCIs5u1CExFccTtgerJQlGdv3qwStJh
 ZsM4CWRAgsO8Z9VgPumRjoCIVG8+XxFWixVQrLWd0fKJyVXHOQv3B8F7/mW9g24LT5IjcpnaUe+
 ZV0ODlkNW9x0nk7xb8FifxGvbdaXiWK/MD90WxA==
X-Google-Smtp-Source: AGHT+IHOmiC+sARRKPnM20C1DGRPtMc6UmI9stZNJsOQF5EN19JWxDcLDuyjTBRVCwm3T5Vs6GZWTmySOdJ8QSidTZY=
X-Received: by 2002:a0d:d841:0:b0:62c:e8a2:305 with SMTP id
 00721157ae682-62fba375c1fmr16113497b3.41.1718198534271; Wed, 12 Jun 2024
 06:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240522-fd-hdmi-hpd-v2-13-c30bdb7c5c7e@linaro.org>
 <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
In-Reply-To: <deaa2a50-9e16-4f23-8c13-34947ba4e4e0@web.de>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jun 2024 16:22:03 +0300
Message-ID: <CAA8EJppn_mVzmd==-bs8je8VjXrNrWu0hNXWAGuP+TP3DARReg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] drm/msm/hdmi: ensure that HDMI is one if HPD is
 requested
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, LKML <linux-kernel@vger.kernel.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 12 Jun 2024 at 16:01, Markus Elfring <Markus.Elfring@web.de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -117,11 +117,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(str=
uct drm_bridge *bridge,
> >
> >       DBG("power up");
> >
> > +     mutex_lock(&hdmi->state_mutex);
> >       if (!hdmi->power_on) {
> =E2=80=A6
> >       }
> > +     mutex_unlock(&hdmi->state_mutex);
> >
> >       if (hdmi->hdmi_mode) {
> >               msm_hdmi_config_avi_infoframe(hdmi);
> =E2=80=A6
>
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&hdmi->state_mutex);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L=
196

I am not.


--=20
With best wishes
Dmitry
