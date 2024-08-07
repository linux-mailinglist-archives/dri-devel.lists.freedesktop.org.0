Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D594A7D4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 14:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6128210E4E8;
	Wed,  7 Aug 2024 12:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LF898QWH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1907810E4E8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 12:39:04 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so245376866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 05:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1723034342; x=1723639142;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OnUFp98oxeUnctnSDs6TX1a8Wvygl0TqIj4jMlE8iGk=;
 b=LF898QWHvYTbsXeePFWVh+x9R/33LqSNFKGCjJzIHyUdo1iDFD3BWbMHPJxpRMtTL5
 W40Wey8AtQ8xnlpqHEajf15j8D4HToja1MkqdUtc+wwqw6v6uU74hVIbW7RzY3t7fTjE
 KCli2GESx3ikLFbqd/q4rSdsyKrfsvK/W26yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723034342; x=1723639142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OnUFp98oxeUnctnSDs6TX1a8Wvygl0TqIj4jMlE8iGk=;
 b=WeSGK+OnXnyW4MpvXcarLwT9Gi8DcLuiDmxuNgahx1ZEsjUw6PcfevHgnYE2DtD7rt
 KRK/3m2HSSn8bZyzzbUdTOs4z7MuDC/18p/48l8pZOuZAtgQ3zoreL/qS2Ib4IAKONT8
 jDkgRQy+F/HijWlgyanTS17p1J+1B+HOoybJ63xLx+0FNF4jJQTFofKEYiXWY3rMRLNm
 o/4ojuLAFWLqlS251IXaAVFSd+q2c1eRRXBKxvxo4bMSHPzk/qtHTry9dUKdsSxQPqRZ
 92XNuwqEPPVWYQSDFqtzjptz0MAYCt86ZTWTdLy0fgK62CxvtYz1Hxz2gJi0K0rIHf/l
 u25g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlU5pEcaygKfseLsgO7UlPMw71oDcHcdyCG5NLNzWqzKy+FpON67/jvsCojZglw8mcT7F49hXdG+NLMtpzVczMkMGtzmJcYOr5y8QE3eUu
X-Gm-Message-State: AOJu0Yy3nFWPprzk81mv5ckSzVMggfxZ29tubDQJu6d/bridtCEYHiu/
 AOaEBAk+tKD+g/EfK3X74XSh4BMMAidO44zktTMNIfgUOiv3nVOd/K3qqVSRMolN74I1xjL8PND
 QHryUB+Hvuam+c8c6CCRYD+azVhosVkJ+bkH09g==
X-Google-Smtp-Source: AGHT+IHFwDCBsgcnW5WchVhEPgcMtyfiG3UZcQkJplOkeEuntHKc8WivmqlczosZUlA4ogqE5T7gtqDWLirva45IL8c=
X-Received: by 2002:a17:906:7303:b0:a7a:b4bd:d0eb with SMTP id
 a640c23a62f3a-a7dc4e8764cmr1344622766b.24.1723034342168; Wed, 07 Aug 2024
 05:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240624185345.11113-1-michael@amarulasolutions.com>
In-Reply-To: <20240624185345.11113-1-michael@amarulasolutions.com>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 7 Aug 2024 14:38:51 +0200
Message-ID: <CAOf5uwkhThmTEuhYAxAgLqg86PEHJ49wWp67RahVhio=O2OfQw@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/panel: synaptics-r63353: Fix regulator unbalance
To: neil.armstrong@linaro.org, Doug Anderson <dianders@chromium.org>
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

Hi Doug

+cc Doug

I have seen that you have done some re-working and investigation on
drm stack, do you have some
suggestion on this case?

On Mon, Jun 24, 2024 at 8:53=E2=80=AFPM Michael Trimarchi
<michael@amarulasolutions.com> wrote:
>
> The shutdown function can be called when the display is already
> unprepared. For example during reboot this trigger a kernel
> backlog. Calling the drm_panel_unprepare, allow us to avoid
> to trigger the kernel warning
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> ---
>
> It's not obviovus if shutdown can be dropped or this problem depends
> on the display stack as it is implmented. More feedback is required
> here
>
> ---
>  drivers/gpu/drm/panel/panel-synaptics-r63353.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu=
/drm/panel/panel-synaptics-r63353.c
> index 169c629746c7..17349825543f 100644
> --- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> +++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
> @@ -325,7 +325,7 @@ static void r63353_panel_shutdown(struct mipi_dsi_dev=
ice *dsi)
>  {
>         struct r63353_panel *rpanel =3D mipi_dsi_get_drvdata(dsi);
>
> -       r63353_panel_unprepare(&rpanel->base);
> +       drm_panel_unprepare(&rpanel->base);
>  }
>
>  static const struct r63353_desc sharp_ls068b3sx02_data =3D {
> --
> 2.43.0
>


--=20
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com
