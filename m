Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CF2A8950
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 22:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7406EDED;
	Thu,  5 Nov 2020 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38466EDED
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 21:54:44 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id y73so549616vsc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 13:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mv8DeRATZy+n1cuxhY7i11DSC6dCUpYDT7QslX7ET9c=;
 b=bxCcEqbXmtmRJ+14a+t/hizd895SIVzEZURuwc6SrVkGEWUTv18AjWmjrrN3eYY4qp
 k9XdzcnVZz4q+RJenTuRcsaHfaxdPjDbcPE+uKqyaT84rSjVn9YIsQEW9iMn1ydlSVIA
 Y3stKICkcdJWXeeiuzrmci39rROMfOzXc1U8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mv8DeRATZy+n1cuxhY7i11DSC6dCUpYDT7QslX7ET9c=;
 b=ZatGAiPoUOXNayc7sDqvCxFtj1CJyRhvGwCIQ+P9fHLTEu8gc1rKdlQHFFwpLlId3o
 1Vi/heSbfo201DAscgTOKgItPFE8yj7KVdo+HgVhLaEVj9ynJ0KwOuQbtmiXURL6QZWS
 wZitzBUTtLrTBMulJWvRtTr7bJkLSxryScVv9Z5/cQO4TedbLFZFgg5kar+tBMK3kG0n
 x1c0rrT3dh/jqmrj/9Lf5nPhJmKDlbVHIYZm4Mq0Nu6T/nCeyrke7/bqXkjWCkitLP+0
 m7fulDDfNdwBTsDmZMaClaPbbMsxdrEKvVzIljxZ3tbKj9eHPtYDXJBEGZ/MhMyNQwG6
 9PEQ==
X-Gm-Message-State: AOAM5310a/F9jhcgjhkyy1oYN+uVTwcUvAm40QZBehngEJdjJuV3IkGl
 sFBZu874kyylRrUgITlQeeqWKolZFDWKXQ==
X-Google-Smtp-Source: ABdhPJwsUE5Y+q1mPNarJZNHD9jUDNn75/bnaLBAYi3tyxU1QQhwCNHauj7zVihxZ6BT3jGGGfSKdg==
X-Received: by 2002:a67:f691:: with SMTP id n17mr2958687vso.56.1604613283770; 
 Thu, 05 Nov 2020 13:54:43 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47])
 by smtp.gmail.com with ESMTPSA id 102sm305087uan.14.2020.11.05.13.54.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 13:54:42 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id p12so984070uam.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 13:54:42 -0800 (PST)
X-Received: by 2002:a9f:2f15:: with SMTP id x21mr2632856uaj.104.1604613282559; 
 Thu, 05 Nov 2020 13:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
In-Reply-To: <20201028155617.v2.1.I31c4f8b111dbef1ab658f206764655ae983bc560@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2020 13:54:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U7PvC5nL3EudxE62MSHeha+zd1u_hCxYyCw8t5SaWUkQ@mail.gmail.com>
Message-ID: <CAD=FV=U7PvC5nL3EudxE62MSHeha+zd1u_hCxYyCw8t5SaWUkQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] drm: panel: simple: Allow timing constraints, not
 fixed delays
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Oct 28, 2020 at 3:58 PM Douglas Anderson <dianders@chromium.org> wrote:
> @@ -249,18 +327,19 @@ static int panel_simple_unprepare(struct drm_panel *panel)
>  {
>         struct panel_simple *p = to_panel_simple(panel);
>
> -       if (!p->prepared)
> +       if (p->prepared_time != 0)

Though I swear I tested this, clearly I didn't test well enough.  I
was poking with this patch series some more and realized that I got
the above (and the one in _prepare) totally and utterly backwards.
I'll send out a v3 now...

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
