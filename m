Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B147D0432
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:50:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6810E562;
	Thu, 19 Oct 2023 21:50:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9C10E562
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 21:50:30 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c50d1b9f22so2286721fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1697752226; x=1698357026;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NvYs4y8luRIIMWCMTq8xHgd9BsFfOMy25z0twVyGFoo=;
 b=erea2793XttMIY+eOgGxvnWJPeByiDUwwQGyjXAmzmpF7JF467dSXUBstw6xx8ukgc
 5ZDf+sd2WiMQMXM0aonECXiuMJqW26XGwS8+EU+rdZwCaSXL0VBVzLOhmReHmBEV547W
 kQIZUd63ifroKuqaXoLuu4jVZ+dngUD/E2v4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697752226; x=1698357026;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NvYs4y8luRIIMWCMTq8xHgd9BsFfOMy25z0twVyGFoo=;
 b=u4sH5y5JTRergi7ZZmuEGY38CluYslMF2WXJPaO75hICpW7tk18V4tjgz8Ype3ixh2
 XrFEdEVTumYnsURxrPwPF3nyUzQO51CZ4HJ7SmFM+T58jRBdVXL1KIVSFk2X8qKJdDPI
 gdOasty6XY3XUIipZsduDy75KAb7iwTQYdJhArSXepmaOpgZFYsf9/fRO9UllZxw0Wtt
 nob344ZRqUEdOYL7nkoa9NpvfdIxMMXTVykyIEk10jv/rN6NQY7Cc7WbgKRkiS+ROGV5
 EAMLcFnN4IKqP4UsMeJbe9HU6b8Lyp7yYbvayrNRdow5lA49E7+ijuKR6Xvnw/u76OlC
 g5rg==
X-Gm-Message-State: AOJu0Ywk5viiUNKkAORdTGErrxt3ihIGu+d/LfjrOVMRCPEAuW4Pg2He
 IHWjyoIGETLOqXrt/9ncmdPfU6BWqKy7Cxl63BFjBA==
X-Google-Smtp-Source: AGHT+IFYnfz/HhMd5cjvFYsSW3h/jN9SDm1Z1NCF0EbG62DJa/d+OyxAXjoy29TxKGrsNBLfe7/22g==
X-Received: by 2002:a05:651c:548:b0:2c5:2d16:6d93 with SMTP id
 q8-20020a05651c054800b002c52d166d93mr124147ljp.28.1697752225661; 
 Thu, 19 Oct 2023 14:50:25 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com.
 [209.85.128.52]) by smtp.gmail.com with ESMTPSA id
 s19-20020a170906c31300b009b977bea1dcsm246287ejz.23.2023.10.19.14.50.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Oct 2023 14:50:25 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so13195e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 14:50:24 -0700 (PDT)
X-Received: by 2002:a05:600c:3b1d:b0:3f7:3e85:36a with SMTP id
 m29-20020a05600c3b1d00b003f73e85036amr31430wms.7.1697752224208; Thu, 19 Oct
 2023 14:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091844.804310-1-yangcong5@huaqin.corp-partner.google.com>
 <20231013091844.804310-3-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=UVP22ANJD5xEB6MRHCDjXN6SZhQWQshPxwhi51YRkEjQ@mail.gmail.com>
In-Reply-To: <CAD=FV=UVP22ANJD5xEB6MRHCDjXN6SZhQWQshPxwhi51YRkEjQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Oct 2023 14:50:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UV_yX=wBDMY1LhENfMYSbcZ=8xiCnQ6P3NXWdCHbn+zw@mail.gmail.com>
Message-ID: <CAD=FV=UV_yX=wBDMY1LhENfMYSbcZ=8xiCnQ6P3NXWdCHbn+zw@mail.gmail.com>
Subject: Re: [v4 2/3] drm/panel: ili9882t: Avoid blurred screen from fast sleep
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
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
Cc: neil.armstrong@linaro.org, will@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, catalin.marinas@arm.com, hsinyi@google.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Oct 13, 2023 at 2:43=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Fri, Oct 13, 2023 at 2:19=E2=80=AFAM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > At present, we have found that there may be a problem of blurred
> > screen during fast sleep/resume. The direct cause of the blurred
> > screen is that the IC does not receive 0x28/0x10. Because of the
> > particularity of the IC, before the panel enters sleep hid must
> > stop scanning, as i2c_hid_core_suspend before ili9882t_disable.
> > If move the ili9882t_enter_sleep_mode function to ili9882t_unprepare,
> > touch reset will pull low before panel entersleep, which does not meet
> > the timing requirements.. So in order to solve this problem, the IC
> > can handle it through the exception mechanism when it cannot receive
> > 0x28/0x10 command. Handling exceptions requires a reset 50ms delay.
> > Refer to vendor detailed analysis [1].
> >
> > Ilitek vendor also suggested switching the page before entering sleep t=
o
> > avoid panel IC not receiving 0x28/0x10 command.
> >
> > Note: 0x28 is display off, 0x10 is sleep in.
> >
> > [1]: https://github.com/ILITEK-LoganLin/Document/tree/main/ILITEK_Power=
_Sequence
> >
> > Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> > ---
> >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 22 ++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
>
> As talked about in response to the previous version [1], we can work
> to see if we can improve the sequencing. However, for now this seems
> fine.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DW_LT9mPYKjaKP3OvUDeNpsZxkhVN9NP_=
hQ+Es6Fe3dVw@mail.gmail.com

Pushed to drm-misc-next:

5820a1932ce8 drm/panel: ili9882t: Avoid blurred screen from fast sleep
