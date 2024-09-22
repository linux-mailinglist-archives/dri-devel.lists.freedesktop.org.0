Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D358E97E32D
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 22:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5476E10E28D;
	Sun, 22 Sep 2024 20:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R7LJEeTQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4AA10E28D
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 20:18:41 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53653ff0251so4059186e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Sep 2024 13:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727036319; x=1727641119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=89NZn7EPWRQfv+oAgAxCZDUnzyHJpJCpvKV/C2estH4=;
 b=R7LJEeTQhvIUhJRqNy0dDmCvZvaQwJgWkPTOk31mwsf2KW3Ibqr6cA9UXf9n1xp/bf
 T5Hymj9DyTCiSTPB4rBbCyPd6YkwmhjrB+rbOs7Wq5AYVHTMCz66GTwjiEvfT7gPTCIQ
 Yl7eiNezysa0PL02bpLJN9bqiPPY03Sd/XQlzCvhxXt/Uj+kgPhkNsA03TlJx2eP7Wso
 4gFYHXayFP5UswurdkxrHOa7o7bERr8pe/fsnLxrpApjTpU0Sgh2dO/N/tmMaDfkZpZj
 A68rc1bp6qceAejyKZlKNcY4PX/otUYHfcyp5NNsgdacbwADLe8doS55BAOWAxp/ikQw
 I2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727036319; x=1727641119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=89NZn7EPWRQfv+oAgAxCZDUnzyHJpJCpvKV/C2estH4=;
 b=bug0p6U/HYh5R2zg8zIK3CeXrV4GNTUzomnhdCPk6bzkzdcWYV87RRhgDf48DpfHUC
 pIXVFwPS6xSJBIZCO4ZQ8onk2R5zBMsH1u1fKXn+mA54cqz3Sgx7vBQg45tuxRrrVCUD
 UDOykwmVdW+kLx8DoYQuzxXjXhK+K4xmijuJ+P4IZ5cP0oPCW3qqiN5vSG2IV9JzwEM7
 B3zLMjJdXt2OyXyGaRODyOect5NnOEFYXWrOLP0t3XKNIa4O4v5TT/j6qpQWVYeUIQcF
 Q7AGhHID+dsJH0pXLtkCo2My/5dJAbo5vuERC2zNuZgSL/F9ZhAswHmMrJOzlWw/ZyPT
 GiPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYimKl/DNR5e2Jt6VNhsdhr4MtfotLUT/T22Jh0W5eK6JEQQlpGwuNro5vXuLLPkNaveQuMzdJfLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHvX/Gb179QTnJDD1DxVya7wVtctejeIMJbzh4UTePXprfmHZI
 ke7LuBJ/R7srhFaVQLGS0PCWSsK8OVex86c4Q09g0PW6yTUMZLVsewCMaMuLJLhsEgtcfOuOsLh
 vzk0wHpp7Xo4eC6SvmMsW8SM65K6JpySZTMFkUg==
X-Google-Smtp-Source: AGHT+IHD3PESdiZ5M8c82pzGjEDBJmRpIOWYAvoYMGspy3SOd57GMkLKZ0kIawbUWrPpUhUHuBgSO0BIKiBjirgRCqU=
X-Received: by 2002:a05:6512:3c8d:b0:52c:e3bd:c70b with SMTP id
 2adb3069b0e04-536ac2ce398mr4782306e87.1.1727036319408; Sun, 22 Sep 2024
 13:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240908-fix-nt35510-v2-1-d4834b9cdb9b@linaro.org>
 <5wpydjxkjfyojh5ybc5brxyqfkxt54mfrduxdpcoisytzdu76u@axgydzhle25h>
In-Reply-To: <5wpydjxkjfyojh5ybc5brxyqfkxt54mfrduxdpcoisytzdu76u@axgydzhle25h>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 22 Sep 2024 22:18:27 +0200
Message-ID: <CACRpkdZ7eCeSKy==F=7xuAt-kXMgpHkUfGm-d-scGrn31ifTVQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel: nt35510: Make new commands optional
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stefan Hansson <newbyte@postmarketos.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
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

On Sun, Sep 22, 2024 at 4:47=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> >       if (ret)
> >               return ret;
> > +
> >       ret =3D nt35510_send_long(nt, dsi, NT35510_P1_SETVCL,
> >                               NT35510_P1_VCL_LEN,
> >                               nt->conf->vcl);
> >       if (ret)
> >               return ret;
> > +
> >       ret =3D nt35510_send_long(nt, dsi, NT35510_P1_BT3CTR,
> >                               NT35510_P1_BT3CTR_LEN,
> >                               nt->conf->bt3ctr);
> >       if (ret)
> >               return ret;
> > +
> >       ret =3D nt35510_send_long(nt, dsi, NT35510_P1_SETVGH,
> >                               NT35510_P1_VGH_LEN,
> >                               nt->conf->vgh);
>
> I think this part is unrelted and should go in as a separate commit.
> Other than that LGTM.

Ooops residuals from an earlier patch iteration.

I fixed it up while applying the patch.

Thanks!
Linus Walleij
