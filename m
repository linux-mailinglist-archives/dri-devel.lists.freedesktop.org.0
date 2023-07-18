Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24A757F62
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 16:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85A510E0E4;
	Tue, 18 Jul 2023 14:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDF010E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 14:24:15 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4fdd31bf179so87105e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1689690251; x=1692282251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HFgUWvdvnkQ6F7sGz59bCo1vWE/XSynA4fQJ3vd3zkE=;
 b=fR6JPaQCJzgizl3XUccARxRu/Q6eTvQVsSNvuTXT5nfZ0NPA2T9vekOLy3+cP5na+F
 pxhjOLtPdSmhZOZVir5ELUOr9Ky/eB8yl0trtusDrttho4U1n2q4+0GsG341PBa1e/Kp
 HFonOds5K+hzkR1F9t/APpjeQEJqevVRglXgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689690251; x=1692282251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HFgUWvdvnkQ6F7sGz59bCo1vWE/XSynA4fQJ3vd3zkE=;
 b=Wm4mdMt2bN+yweo+i8UXRpoE9ai2ucr0IiU3f6ATa5wBVpL6VSTGTLi/jYZWprnTbS
 BlaLJ/f5AE71p2b+LFvHKJMXxhBcLl5aEi6iWV3qaqkuVJMmkTjvPpISKE9ruot/UW1Q
 IsBCwmZncJU9nwKr8XBmdsviIxVZTleuawq5QfaTcj0jIYLhDxnPA9VTiK4uXgTQkkBp
 2IoQaBh7FAEn9szc1SoKU13NIZxKvQqitOmNlL/4KGTub0aG1rk7BjmhXznuf+qs3hG3
 Xt9TBPHTjEuJ9vO/p9GFWEVdVgLzNP6+EvIGGjxB4scnOMGCooMO1+3rbqfCTwRvK9Y9
 Z+/Q==
X-Gm-Message-State: ABy/qLaSX6xOPtNm6F4F839tklOHw23cu4MVbsD4e80JzmalNcNuio60
 oQ7W27EmXkKT/9f4QICr5GYR79JHnRkYV11oKf+5kc3B
X-Google-Smtp-Source: APBJJlFIfjk8wpr0RMUJaXS2tX5GWWFw+n5lrOhBQaSTHWYlbYi86CHh1f+ZOFx5lzxbkagHeuFDKg==
X-Received: by 2002:a19:2d53:0:b0:4fb:7be5:4870 with SMTP id
 t19-20020a192d53000000b004fb7be54870mr9464168lft.46.1689690251551; 
 Tue, 18 Jul 2023 07:24:11 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05640210c600b0051873c201a0sm1312822edu.26.2023.07.18.07.24.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 07:24:10 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so13568a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 07:24:10 -0700 (PDT)
X-Received: by 2002:a50:d0c6:0:b0:51d:ebed:93a6 with SMTP id
 g6-20020a50d0c6000000b0051debed93a6mr93216edf.5.1689690250553; Tue, 18 Jul
 2023 07:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230709162253.464299-1-marex@denx.de>
In-Reply-To: <20230709162253.464299-1-marex@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Jul 2023 07:23:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XoX+weEHHz0Cy7ebx-6dRTLAqNeDWz-ejbj6=fAi-F2g@mail.gmail.com>
Message-ID: <CAD=FV=XoX+weEHHz0Cy7ebx-6dRTLAqNeDWz-ejbj6=fAi-F2g@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: simple: Drop prepared_time
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jul 9, 2023 at 9:23=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> This has been superseded by RPM in commit
> 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive=
 unprepare / prepare")
> and the last user of the non-RPM case has been dropped in commit
> b6d5ffce11dd ("drm/panel-simple: Non-eDP panels don't need "HPD" handling=
")
> whatever is left in this driver is just assigned and never used.
> Drop the remaining parts.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 4 ----
>  1 file changed, 4 deletions(-)

Thanks for cleaning this up.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'm happy to apply this or happy for others to. I'll wait a few more
days and then apply it if nobody else has.

-Doug
