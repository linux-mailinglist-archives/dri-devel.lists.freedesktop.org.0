Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72A8BB0FF
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 18:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123361128FC;
	Fri,  3 May 2024 16:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="NwEvNM57";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948ED1128FE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 16:39:28 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-792639cf4faso268014985a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714754367; x=1715359167;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjSWzAvI8127nFCBAhRj+G6Ozr2Q97LS17/PxW+N9NU=;
 b=NwEvNM57mYfD/qHzi8GcKr01oZlzE0rKQyxfYPlwsc6rXqGyxuehzLbDYRHR/yy7Jt
 InxwwnW7YIYxSa8eS2uvfihhrVzTYvCPMg7KRliLLv/1tQgn7KaflEm7KYI5EpjZCrr+
 zQU/dpYpiMp1JW+XEwk6GnYTNU1DMCWyJrmqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714754367; x=1715359167;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjSWzAvI8127nFCBAhRj+G6Ozr2Q97LS17/PxW+N9NU=;
 b=KVQt+qfX5pvtUJeBnD4R4CK1cGNTn7BflZBqjMj5dtMYRuwX6le1iYOlvQ751mggSZ
 1HJP7X14l6jN+Cesmtg4CDxr+FTWF2OtKG0b1exSWeZs10mqk7oy62wSs+1dX6sLMRnu
 lpO/eetAwZVpoy8oT8fcgTv51VPo1ed5l/8D9Wf/rRZP51H96Ol2VFPJ244SxhoF9xpP
 s2uXjh5cOtLmEYLAq1RpP42KJTzhz+8lAVss7qDW8GpyZztjjLoEfAyCI2QQiUFYM7bb
 Re7G9eoibUmulc2cVda36dJYhOyp1/EKiP+ye931hz1pe6nKVcETCvJ0hHIatVazpat4
 Hh3g==
X-Gm-Message-State: AOJu0YxBktrfSUpe7DVY797uOlrBy+dDnoPKI5Qvsg0mkZNARdkrMXER
 ETCQZ0J0Dhd6wqcoz2l1Yas3tKlMb6Hdh0JWbSYQhNyY9ntAx0lB/EqMbbTCQ7YBPb+77q5KJtW
 Yqw==
X-Google-Smtp-Source: AGHT+IFEX0geJDk+88WdqGFEakCrRDNOWQ6m+3OEW6ZRFwCggCs1lG5JWMrOE38tLxhb0SeA1qxzwA==
X-Received: by 2002:a05:620a:430e:b0:790:8657:89ab with SMTP id
 u14-20020a05620a430e00b00790865789abmr4162293qko.47.1714754366944; 
 Fri, 03 May 2024 09:39:26 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com.
 [209.85.160.173]) by smtp.gmail.com with ESMTPSA id
 y5-20020a05620a44c500b007928561f01asm44915qkp.92.2024.05.03.09.39.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 09:39:26 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-436ed871225so423241cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 09:39:26 -0700 (PDT)
X-Received: by 2002:ac8:580b:0:b0:43a:2e2b:eec with SMTP id
 d75a77b69052e-43cd6f1d31amr3382801cf.2.1714753984705; Fri, 03 May 2024
 09:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240501154251.3302887-1-dianders@chromium.org>
 <20240501084109.v3.9.I947e28c81f9ef7dcd3add6e193be72d6f8ea086f@changeid>
In-Reply-To: <20240501084109.v3.9.I947e28c81f9ef7dcd3add6e193be72d6f8ea086f@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 3 May 2024 09:32:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U51FTOV2nnTbqkqUuaHFqib7-ua03O9tZN21EoX2dMsg@mail.gmail.com>
Message-ID: <CAD=FV=U51FTOV2nnTbqkqUuaHFqib7-ua03O9tZN21EoX2dMsg@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] drm/panel: innolux-p079zca: Don't use a table for
 initting panels
To: dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 Hsin-Yi Wang <hsinyi@google.com>, 
 Brian Norris <briannorris@chromium.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Joel Selvaraj <jo@jsfamily.in>, lvzhaoxiong@huaqin.corp-partner.google.com, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
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

Hi,

On Wed, May 1, 2024 at 8:43=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> @@ -132,33 +125,9 @@ static int innolux_panel_prepare(struct drm_panel *p=
anel)
>         /* p079zca: t4, p097pfg: t5 */
>         usleep_range(20000, 21000);
>
> -       if (innolux->desc->init_cmds) {
> -               const struct panel_init_cmd *cmds =3D
> -                                       innolux->desc->init_cmds;
> -               unsigned int i;
> -
> -               for (i =3D 0; cmds[i].len !=3D 0; i++) {
> -                       const struct panel_init_cmd *cmd =3D &cmds[i];
> -
> -                       err =3D mipi_dsi_generic_write(innolux->link, cmd=
->data,
> -                                                    cmd->len);
> -                       if (err < 0) {
> -                               dev_err(panel->dev, "failed to write comm=
and %u\n", i);
> -                               goto poweroff;
> -                       }
> -
> -                       /*
> -                        * Included by random guessing, because without t=
his
> -                        * (or at least, some delay), the panel sometimes
> -                        * didn't appear to pick up the command sequence.
> -                        */
> -                       err =3D mipi_dsi_dcs_nop(innolux->link);
> -                       if (err < 0) {
> -                               dev_err(panel->dev, "failed to send DCS n=
op: %d\n", err);
> -                               goto poweroff;
> -                       }
> -               }
> -       }
> +       err =3D innolux->desc->init(innolux);
> +       if (err < 0)
> +               goto poweroff;

FWIW, I happened to notice a bug in the above by code inspection. The
old code checked "if (innolux->desc->init_cmds)" and thus handled
init_cmds being NULL. The new code doesn't handle the init function
being NULL. One of the two panels in this file (which seems to have no
users in mainline) doesn't specify an init sequence.

I'll spin this next week with the extra "if" test.

-Doug
