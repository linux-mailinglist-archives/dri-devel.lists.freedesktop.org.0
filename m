Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9A7431D2
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F35B10E40E;
	Fri, 30 Jun 2023 00:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2287E10E40E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:42:03 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-992ace062f3so144171266b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1688085720; x=1690677720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Gb81mYg1YRwOXWbF2VsLlxsYCtOl437hvg6gzGbEbw=;
 b=VTlVFaoQ8U1QeuN0AHYtdkrY0JWUVAlwxNenW4wLFBV66mg1yjZGQCQl8cMuIBijIA
 n07AE48XhqmbeZj1rAyifG+ttfPmtiuywbMA12VrQjXYcS1eexLgE+aT3tNk5YtbyNkV
 rJQpWyP9Yvp4JBab4V2B+4ENibVNzJpm1hEGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688085720; x=1690677720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Gb81mYg1YRwOXWbF2VsLlxsYCtOl437hvg6gzGbEbw=;
 b=GS8Rq3VEaffKkm2PpXUmCxWD32EPsFeRtVLvCvOcLzOxhqb3QFk/+CZXmira4pqNhV
 t9MS6eL53Dit1KlySjjl28vu8iZq5iBcTyUGs9gvrheNWczom4PT6rgkLJ3B3vqiKfc7
 y1qpFImy1mGxGUZRHyW/rfVurmPbjbNWAQr1t9I0ObYN3Y/T0vbTCbCmGNiTGPKNiBuy
 IDI5qsxyaRNAzUJbFKzsXamsTwsQvlEAqq7ezpb1SczgXSV4Gm3YGHFntrNUvyj+GZqj
 j+7DlYu+vKdMi2yGBgLWcDtki3gQ+fzRZ17g9jx362wbvF4KZSUbXPMvJxSI+yAp/p37
 Ip8g==
X-Gm-Message-State: ABy/qLYaUhlMqadb+qjSLHREHUEiweBM/3LYfqB5yxhh9h5n2ElMIleo
 UpnpK2zIIMTXrDiucusA/hjvEKJTb9dif0iTUma/IIKl
X-Google-Smtp-Source: ACHHUZ6vGeInnozb71l5Le0HG35ymxx+IwnKUmoj4pI/Ey+/o59AKWnxY5w8xI0hZf4Q4HPYMuPwEA==
X-Received: by 2002:a17:906:4d02:b0:991:e24f:b290 with SMTP id
 r2-20020a1709064d0200b00991e24fb290mr662621eju.26.1688085719588; 
 Thu, 29 Jun 2023 17:41:59 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com.
 [209.85.208.47]) by smtp.gmail.com with ESMTPSA id
 w6-20020a17090633c600b0098748422178sm7340838eja.56.2023.06.29.17.41.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:41:58 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-51ddbf83ff9so4866a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:41:58 -0700 (PDT)
X-Received: by 2002:a50:baaf:0:b0:510:b2b7:8a78 with SMTP id
 x44-20020a50baaf000000b00510b2b78a78mr207972ede.5.1688085718420; Thu, 29 Jun
 2023 17:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230627050148.2045691-1-yangcong5@huaqin.corp-partner.google.com>
 <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
In-Reply-To: <CAD=FV=WR=fnhCxC37Eo3hinh2MV=eTNuXG+GrwgR6K_pV4Rbaw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Jun 2023 17:41:46 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
Message-ID: <CAD=FV=UcFn7Wq_Ock6RCT0mPhgjpJwF7dJjcbwcoESW9nni62Q@mail.gmail.com>
Subject: Re: [v2] drm/panel: Fine tune Starry-ili9882t panel HFP and HBP
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
Cc: neil.armstrong@linaro.org, devicetree@vger.kernel.org, sam@ravnborg.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 27, 2023 at 2:17=E2=80=AFPM Doug Anderson <dianders@google.com>=
 wrote:
>
> Hi,
>
> On Mon, Jun 26, 2023 at 10:01=E2=80=AFPM Cong Yang
> <yangcong5@huaqin.corp-partner.google.com> wrote:
> >
> > Because the setting of hproch is too small, there will be warning in

I realized that hproch should be hporch. I fixed when applying.


> > kernel log[1]. After fine tune the HFP and HBP, this warning can be
> > solved. The actual measurement frame rate is 60.1Hz.
> >
> > [1]: WARNING kernel:[drm] HFP + HBP less than d-phy, FPS will under 60H=
z
>
> Thanks for including the warming. This looks like something that's
> only printed on Mediatek display controllers. Just out of curiosity:
> is that because Mediatek controllers have special requirements, or is
> this something generic and the Mediatek controller is the only one
> that warns about it?
>
>
> > Fixes: 8716a6473e6c ("drm/panel: Support for Starry-ili9882t TDDI
> > MIPI-DSI panel")
>
> Ideally the tool you have to send mail wouldn't wrap the Fixes line.
> Probably not worth resending just for this, but see if there's
> something you can do to fix this in the future.
>
> Since this is a tiny fix, I don't think we need to wait too long. I'll
> plan to land it on Thursday unless Neil wants to land it himself
> sooner.
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

OK, landed. This is a weird time to land since this is a fix and the
fix has already made its way to Linus's tree but -rc1 isn't ready yet.
From reading the flowchart in the committer guidelines:

https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.html

...this means that it lands in drm-misc-next-fixes, so I've pushed it there=
.

59bba51ec2a5 drm/panel: Fine tune Starry-ili9882t panel HFP and HBP

-Doug
