Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B04870790
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 17:51:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5B112356;
	Mon,  4 Mar 2024 16:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MwiAHia/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9B9112356
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 16:51:28 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2d228a132acso61892711fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709571084; x=1710175884;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOyMFcdZeiizIIdM2h9cviSaGUWkoYW6H6plPEQ7/JE=;
 b=MwiAHia/OSypyS99+y/E5XJ77VgmaWl0+hnhK6MxHbc1udorS64Z/mtoHW6q/nlKRr
 Ajh6xPOu+ZinizLCX/dck6gO/epdkjW5efsvYF/XFjslToQua+wEpWrMfduUSo8a2/Wk
 jYJQlCc/D/H47/hU2XWFVpAIHYSmm9iYu8hBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709571084; x=1710175884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xOyMFcdZeiizIIdM2h9cviSaGUWkoYW6H6plPEQ7/JE=;
 b=a+KhfgG57+tgw//DHk7jZ87ortJOGbZ9p1ZMsFtCuPseuGikytGwvBotXRPhuuAsps
 fYPHzUpbScokHBodRx49SkW2lKN8/0aWs+JO3JR6HT53qWtaPgtpO9IdFEhXsAdY4oNV
 N2cQaFWRRvCrAQCb9c37iyrhDbQTU1mNcNs9eq4xQSgCbOJtm4iL4z57xWRTTnMDs1OB
 xp3w6mmXtmcdt/5qwWM05rHd9mESAyr9Oh4jlHm6QgjpAfNZPIHVShrUzU26HXv8PrB4
 WBzFya50lEv/nEzC2SlCoPINRGbeRyzpXdKDIGcXBpugOCg+hAg0+uDXxtzwcxwIZIUF
 /rgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW89KsYRPWlGrco/pWvBdvJK0EVoR0LXQn2jcTtt7yiJavl4h9xhCajFNeK3BYUqKf7WNsFsRkOudDJuHuB7i8Lk5wQZv5wknkjmJ8ZEpRk
X-Gm-Message-State: AOJu0YwnoFilMAIEfPUKLOl/JZVA2APdrtE2NYNn5n0UyPC+RG1hO/ed
 gjhUJhHGwxQd66P+/NBT52F7hfzpaSG5iYuUTkoHC4+rv/9gtmvAedy36MyBfS8/ASowubJEHcz
 z/5N0
X-Google-Smtp-Source: AGHT+IHnML6Trsu5gftAkW9YLNGpx+haochEfEZRj+IhUI+r5xrUk7gt5bUNuvA1U934/nsGyuYmgQ==
X-Received: by 2002:ac2:5e67:0:b0:513:df6:dcd3 with SMTP id
 a7-20020ac25e67000000b005130df6dcd3mr6260563lfr.48.1709571084233; 
 Mon, 04 Mar 2024 08:51:24 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47]) by smtp.gmail.com with ESMTPSA id
 ag12-20020a1709069a8c00b00a45403d68cesm1495360ejc.175.2024.03.04.08.51.22
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:51:23 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412d84ffbfaso98015e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 08:51:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUnTGDaJprwjlzq3XaJ5XWxAtVMobV6zFLa893Pz/td5IPr90FWEoCFV88TDkPpi3yCBEFhpak8LlQDSJrk5P9Ulv9NgIMMnx96WReTMZJU
X-Received: by 2002:a7b:c417:0:b0:412:dd21:292 with SMTP id
 k23-20020a7bc417000000b00412dd210292mr263164wmi.0.1709571082557; Mon, 04 Mar
 2024 08:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20240301061128.3145982-1-yangcong5@huaqin.corp-partner.google.com>
In-Reply-To: <20240301061128.3145982-1-yangcong5@huaqin.corp-partner.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 4 Mar 2024 08:51:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UP9NxfmT8rqLd-HUq8QwJXa5xO7UbrgYHLw4vOKZO7hA@mail.gmail.com>
Message-ID: <CAD=FV=UP9NxfmT8rqLd-HUq8QwJXa5xO7UbrgYHLw4vOKZO7hA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
 panel HFP and HBP
To: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch, 
 hsinyi@chromium.org, swboyd@chromium.org, airlied@gmail.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Thu, Feb 29, 2024 at 10:11=E2=80=AFPM Cong Yang
<yangcong5@huaqin.corp-partner.google.com> wrote:
>
> The current measured frame rate is 59.95Hz, which does not meet the
> requirements of touch-stylus and stylus cannot work normally. After
> adjustment, the actual measurement is 60.001Hz. Now this panel looks
> like it's only used by me on the MTK platform, so let's change this
> set of parameters.
>
> Fixes: cea7008190ad ("drm/panel: Fine tune Himax83102-j02 panel HFP and H=
BP")

Your "Fixes:" tag is not quite right. It needs to have the _exact_
subject of the old commit message, AKA:

Fixes: cea7008190ad ("drm/panel: boe-tv101wum-nl6: Fine tune
Himax83102-j02 panel HFP and HBP")

> Signed-off-by: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

A little odd that the patch you're fixing claimed that it caused the
measured rate to be 60.01Hz and here you're saying that it ended up
being 59.95Hz. I guess there was a measurement error when the previous
patch was posted?

In any case, the argument still holds that this is a panel that still
appears to be only used by your board, so small tweaks to the numbers
here seem OK.

Landed to "drm-misc-fixes" after:
* Adding "(again)" to the end of the subject to make it distinct from
the previous patch description
* Fixing your Fixes tag

9dfc46c87cdc drm/panel: boe-tv101wum-nl6: Fine tune Himax83102-j02
panel HFP and HBP (again)


-Doug
