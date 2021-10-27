Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFD43D645
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A6F6E530;
	Wed, 27 Oct 2021 22:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC366E111
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 22:08:02 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i26so4564199ila.12
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AiP44UGVXbpC7k9IJewANkS+3gSAjhlyJBDwVsycucE=;
 b=Lu1kEcSgJ5CM4fb00TgWWDv0L3AjYU1il2R/D5xmDWuRnaaTHN04sJlmuCzfJUuhot
 h1Nm5jv0jK0T5bcewjFklOJFRyZhWSz3hKCfjw0eZ+FpyTXU+dbvkaG6RYHafg+12IHj
 gLJYqou40KMde0S7p+/JaI+zSz52QftF7ojCI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AiP44UGVXbpC7k9IJewANkS+3gSAjhlyJBDwVsycucE=;
 b=z32TXyL1YZte+eWN/VTTf1EE1Lk8tFftmpGaRx08+fYzbi6nKBqMY8A3dx88tKtzuP
 bpCCOXk1ikaKKCX4SzD6RvDpqkSp9uH0GrCQ6VGKc6vEjhiHPMx9SHKPGmG6InVfnCzj
 aAaKc+JDQMSpzYA1grzqTJgUI9Mg7NrQy/IMqBOvecMIiQjad3o8mT8okm4lH6+wzko8
 05Jp0/Qh66wcNnU+238swoQ9YC83fGdFFgH3bVxPp2c+Wr6gCRJYihBhk//ZJVAFLgCH
 +a6EhlH+oSQM/0IpPMO7g0/IBuvUNBc36f7dLkEuMp1ccvB6sTxLl0aSVK0OKUxQxwFz
 cWfQ==
X-Gm-Message-State: AOAM533UO9h0eWA1HJgIbivVo++pSTAJ0wGTFEtkB9KgjGfoBoPRk3HS
 aImB1qaT4cP3GhCjGBZNfHfokdPWsafCdQ==
X-Google-Smtp-Source: ABdhPJx5C4+8LIxs3aCsNA91iSxZs8LPa1vrpBWHX6jJu8eUhivcqjT0iZTm9S2qkQaJmxRh2vlNMw==
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr341357ilu.179.1635372481171; 
 Wed, 27 Oct 2021 15:08:01 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com.
 [209.85.166.49])
 by smtp.gmail.com with ESMTPSA id s7sm627871iow.31.2021.10.27.15.08.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 15:08:00 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id g8so4273596iob.10
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:08:00 -0700 (PDT)
X-Received: by 2002:a05:6602:342a:: with SMTP id
 n42mr161897ioz.136.1635372479999; 
 Wed, 27 Oct 2021 15:07:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
In-Reply-To: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Oct 2021 15:07:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
Message-ID: <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Philip Chen <philipchen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, Oct 26, 2021 at 2:56 PM Philip Chen <philipchen@chromium.org> wrote:
>
> Fit ps8640 driver into runtime power management framework:
>
> First, break _poweron() to 3 parts: (1) turn on power and wait for
> ps8640's internal MCU to finish init (2) check panel HPD (which is
> proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> called before panel is powered, we only add (1) to _resume() and leave
> (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> to ensure panel HPD is asserted before we start AUX CH transactions.
>
> Second, the original driver has a mysterious delay of 50 ms between (2)
> and (3). Since Parade's support can't explain what the delay is for,
> and we don't see removing the delay break any boards at hand, remove
> the delay to fit into this driver change.
>
> In addition, rename "powered" to "pre_enabled" and don't check for it
> in the pm_runtime calls. The pm_runtime calls are already refcounted
> so there's no reason to check there. The other user of "powered",
> _get_edid(), only cares if pre_enable() has already been called.
>
> Lastly, change some existing DRM_...() logging to dev_...() along the
> way, since DRM_...() seem to be deprecated in [1].
>
> [1] https://patchwork.freedesktop.org/patch/454760/
>
> Signed-off-by: Philip Chen <philipchen@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> In v3, I also added pm_suspend_ignore_children() in the ps8640_probe()
> but forgot to mention that in the v3 change log.
>
> Changes in v4:
> - Make ps8640_ensure_hpd() return int (This change was mis-added to
>   another patch [2] in this patch series:
>   [2] https://patchwork.kernel.org/project/dri-devel/patch/20211026121058.v3.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid/)
>
> Changes in v3:
> - Fix typo/wording in the commit message.
> - Add ps8640_aux_transfer_msg() for AUX operation. In
>   ps8640_aux_transfer(), wrap around ps8640_aux_transfer_msg()
>   with PM operations and HPD check.
> - Document why autosuspend_delay is set to 500ms.
>
>  drivers/gpu/drm/bridge/parade-ps8640.c | 186 +++++++++++++++----------
>  1 file changed, 115 insertions(+), 71 deletions(-)

Unfortunately, your patch no longer applies to drm-misc/drm-misc-next.
Commit 7abbc26fd667 ("drm/bridge: ps8640: Register and attach our DSI
device at probe") landed and that causes a merge conflict. Can you
rebase and resend?

This will also cause a conflict when Sam's change lands [1] so I guess
we can see whose lands first. Let me review that now and maybe you add
a Tested-by? If it lands that'll make it easier and you can just
rebase on both of them?


> +       pm_runtime_enable(dev);
> +       /*
> +        * In practice, ps8640_aux_transfer_msg() takes ~300ms to complete in
> +        * the worst case. Set autosuspend_delay to 500ms.
> +        */
> +       pm_runtime_set_autosuspend_delay(dev, 500);

To be a little nitpicky, this makes it sound as if the 500 ms needs to
be greater than the 300 ms for correctness. That's not _really_ the
case. During the whole ps8640_aux_transfer_msg() we're holding a PM
Runtime reference (so it won't autosuspend no matter what) and at the
end of it we mark that we were busy so the timer won't start ticking
until then.

Really the 500 ms is because we're quite slow to power up (~300 ms)
and so we want to avoid powering down and powering up constantly. We
definitely need to avoid a power down / power up when reading the EDID
and an EDID read involves _several_ calls in a row to the AUX transfer
function. We also expect that after userspace reads the EDID it will
call us again "soon" to turn the power on and it's nice to not have to
wait the 300 ms again. The 500 ms here is really just a number that's
not too short but not too long. I suppose it's roughly related to the
300 ms because that's the delay we're trying to avoid, but otherwise
they are unrelated. NOTE: the code will still be _correct_ if we miss
the 500 ms window, it'll just be a lot slower.

[1] https://lore.kernel.org/r/20211020181901.2114645-2-sam@ravnborg.org

-Doug
