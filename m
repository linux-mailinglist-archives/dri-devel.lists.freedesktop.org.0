Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BA7818AF7
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E786710E305;
	Tue, 19 Dec 2023 15:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 517B810E305
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 15:15:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a236d77dceeso201031366b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 07:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1702998940; x=1703603740;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PN8rbSgplrrQWhIPY3LvrBoVsaVg7KJ2wpNV5ztnbpo=;
 b=V6xhLc22wsVcFYHfjT7DB334/raiI1IeXDbqmj2IoXoLrQdMAL/FNE34bchrmalhQp
 l2u9EcHkT33BqbexBs+DUyYjU52osb0HKLgwNqGEQB+Vmrr+SUyqMgY4TRGzw0B9dH1N
 FdDYikQgmt8soedpvy3wNFHDs1wG3yq/wlVCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702998940; x=1703603740;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PN8rbSgplrrQWhIPY3LvrBoVsaVg7KJ2wpNV5ztnbpo=;
 b=gn9ijibXIE8QqjpqyD1WYwFcEvOpqE064zuqpaKlECAPuZYG/5F2Ldb363nkOCLzFX
 U2b46ecDnS5kQJ8kDtaCifgSCigSnWZSphmk9/7/6B4qM4k/WaWYQAlQKrvAfFhUCWUR
 8DBNQR1jDyadN6kJtsANzK9lZYtIq4QYHb0II95sjWT5yarqi+kXGRpBCA9X3W0t82ly
 rrk3DdVFMpaFJpEjqRFlt1bH0QiaOVQhe/RUTZ0dhOYeLQ3aOUOPdy8oOC2DMQ5LS1Wr
 In7fnxrb26fSzeUuGNpCSsLRMgc6IKptvjNJJ7ZXn+iiRJLN4WodxLDghlKhrge7vY4o
 wFNw==
X-Gm-Message-State: AOJu0Yw4i86f+WoV+9F9JGboSjdL6XwuLAt/jw3XGoUDe41DHE7YMrfb
 cGphJ98nflFg3OG70i32M2VJDKeMPM9VTsa0UGEIBVDy
X-Google-Smtp-Source: AGHT+IGgERh29de69ZMvp/Mw8pkk3sc/lbUeFFKqBxweYp1A1LqZbbvTSb/HBB5VsN1WS9pMz3id9g==
X-Received: by 2002:a17:906:6852:b0:a23:710e:68d0 with SMTP id
 a18-20020a170906685200b00a23710e68d0mr665843ejs.48.1702998939958; 
 Tue, 19 Dec 2023 07:15:39 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 ul5-20020a170907ca8500b00a1fa7e39957sm11802052ejc.136.2023.12.19.07.15.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 07:15:39 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-548ae9a5eeaso12829a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 07:15:39 -0800 (PST)
X-Received: by 2002:a50:8d4f:0:b0:553:773b:b7b2 with SMTP id
 t15-20020a508d4f000000b00553773bb7b2mr184335edt.6.1702998939101; Tue, 19 Dec
 2023 07:15:39 -0800 (PST)
MIME-Version: 1.0
References: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
In-Reply-To: <20231218090454.1.I5c6eb80b2f746439c4b58efab788e00701d08759@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 19 Dec 2023 07:15:21 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W65K6M_hYqvPFv01NosGE=WnUVBOAsTQH+B7p_L3tVGA@mail.gmail.com>
Message-ID: <CAD=FV=W65K6M_hYqvPFv01NosGE=WnUVBOAsTQH+B7p_L3tVGA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Fix size mismatch warning w/ len
To: dri-devel@lists.freedesktop.org
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Dec 18, 2023 at 9:05=E2=80=AFAM Douglas Anderson <dianders@chromium=
.org> wrote:
>
> After commit 26195af57798 ("drm/bridge: ps8640: Drop the ability of
> ps8640 to fetch the EDID"), I got an error compiling:
>
>   error: comparison of distinct pointer types
>   ('typeof (len) *' (aka 'unsigned int *') and
>    'typeof (msg->size) *' (aka 'unsigned long *'))
>   [-Werror,-Wcompare-distinct-pointer-types]
>
> Fix it by declaring the `len` as size_t.
>
> Fixes: 26195af57798 ("drm/bridge: ps8640: Drop the ability of ps8640 to f=
etch the EDID")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Sorry for sending this hot on the heels of the other patch, but for
> some reason that other patch compiled fine for me until I picked it
> back to my downstream tree. I'll see if I can track down why. In any
> case, as soon as I see a Reviewed-by tag I'll land this.
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've added a short explanation that the issue only shows up on
backports to kernels that don't have commit d03eba99f5bf ("minmax:
allow min()/max()/clamp() if the arguments have the same signedness.")
and landed this.

35ba6bd582cf drm/bridge: ps8640: Fix size mismatch warning w/ len
