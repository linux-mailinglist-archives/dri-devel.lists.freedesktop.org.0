Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB643D6C6
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 00:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F226E104;
	Wed, 27 Oct 2021 22:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1013E6E104
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 22:38:11 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id m63so10216994ybf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 15:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9oSytowWKNwBBfMwPK2z8OUTJ/DV6Vi07ePItefhWPA=;
 b=avoig4YK8GBf9CAkkiPstN495H8ufgsgLmycuwhIIcKQlChKBArOq3T7H08ISwbkZP
 b1PMg4Ox60dyWE6lCMObvITqTxbOWx7qItChFwJt3dxA05vzHSH6OFMuG9qobd7E+HeY
 IUlvslIN37ITjz9mW0+IcwO9HlspVWj1T2Dhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9oSytowWKNwBBfMwPK2z8OUTJ/DV6Vi07ePItefhWPA=;
 b=NfxJxdw4RZbihr6VF51cCQp/tE/b3hbooQL7Bbtaj/GOAcd/mzbUBX88Bb1D7oh0WQ
 oPsIxzIlJo129f1/xWLH6/q0qGdA/NOTQvE6KA7kSbei9WAYmZ2hPWGb6Tiwugaqxq0k
 qKVJbfY00498g8kjy21I25Op3YDqOpXrGKAa+mwf7Kk6IAmOpQqV3+2V2Xf5MGiAs0h2
 b0BXGq/ShUFcsEZVDv3RR5fK/Ly6JJ/Tacshoxe3kMqmO+MPYqbYJbV3DD482aCUNB2P
 6i5BPRuURjVBsTw+/YSUDbklqSS9fmv5wFa3LVTgW4D2ejEU3g015SRiJhMEBi24pBzB
 VO4g==
X-Gm-Message-State: AOAM533pLjSHDIdbd/dwAzUgZIu23sRlpggopyBDEWt4QL1DV9k0DWXb
 5UYb/yY/GWMb++piYhY3UY2elMkiIf/hU1ZWO39C7g==
X-Google-Smtp-Source: ABdhPJxB2cf0ejh1JrlD28UAn2KzuQGKwVaIkvK+lcXb819vEQtQoI7Rgsm+YxiVyRZXgYvOxJs7inAaTHHEdJmaQwA=
X-Received: by 2002:a25:23cc:: with SMTP id j195mr506259ybj.508.1635374290200; 
 Wed, 27 Oct 2021 15:38:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211026145622.v4.1.I9d81c3b44f350707b5373d00524af77c4aae862b@changeid>
 <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
In-Reply-To: <CAD=FV=WTQG_zdQVDFPe7u8_350Nwr9tSeWjtQO7FD-3N-JMjuQ@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Wed, 27 Oct 2021 15:37:59 -0700
Message-ID: <CA+cxXh=pxw7iPnmfs998fd=OZ1QHDRtc913GFOXpLzKF8ZkOeA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/bridge: parade-ps8640: Enable runtime power
 management
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

On Wed, Oct 27, 2021 at 3:08 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Oct 26, 2021 at 2:56 PM Philip Chen <philipchen@chromium.org> wrote:
> >
> > Fit ps8640 driver into runtime power management framework:
> >
> > First, break _poweron() to 3 parts: (1) turn on power and wait for
> > ps8640's internal MCU to finish init (2) check panel HPD (which is
> > proxied by GPIO9) (3) the other configs. As runtime_resume() can be
> > called before panel is powered, we only add (1) to _resume() and leave
> > (2)(3) to _pre_enable(). We also add (2) to _aux_transfer() as we want
> > to ensure panel HPD is asserted before we start AUX CH transactions.
> >
> > Second, the original driver has a mysterious delay of 50 ms between (2)
> > and (3). Since Parade's support can't explain what the delay is for,
> > and we don't see removing the delay break any boards at hand, remove
> > the delay to fit into this driver change.
> >
> > In addition, rename "powered" to "pre_enabled" and don't check for it
> > in the pm_runtime calls. The pm_runtime calls are already refcounted
> > so there's no reason to check there. The other user of "powered",
> > _get_edid(), only cares if pre_enable() has already been called.
> >
> > Lastly, change some existing DRM_...() logging to dev_...() along the
> > way, since DRM_...() seem to be deprecated in [1].
> >
> > [1] https://patchwork.freedesktop.org/patch/454760/
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> > In v3, I also added pm_suspend_ignore_children() in the ps8640_probe()
> > but forgot to mention that in the v3 change log.
> >
> > Changes in v4:
> > - Make ps8640_ensure_hpd() return int (This change was mis-added to
> >   another patch [2] in this patch series:
> >   [2] https://patchwork.kernel.org/project/dri-devel/patch/20211026121058.v3.2.I09899dea340f11feab97d719cb4b62bef3179e4b@changeid/)
> >
> > Changes in v3:
> > - Fix typo/wording in the commit message.
> > - Add ps8640_aux_transfer_msg() for AUX operation. In
> >   ps8640_aux_transfer(), wrap around ps8640_aux_transfer_msg()
> >   with PM operations and HPD check.
> > - Document why autosuspend_delay is set to 500ms.
> >
> >  drivers/gpu/drm/bridge/parade-ps8640.c | 186 +++++++++++++++----------
> >  1 file changed, 115 insertions(+), 71 deletions(-)
>
> Unfortunately, your patch no longer applies to drm-misc/drm-misc-next.
> Commit 7abbc26fd667 ("drm/bridge: ps8640: Register and attach our DSI
> device at probe") landed and that causes a merge conflict. Can you
> rebase and resend?
Yes, I will rebase and resend.

>
> This will also cause a conflict when Sam's change lands [1] so I guess
> we can see whose lands first. Let me review that now and maybe you add
> a Tested-by? If it lands that'll make it easier and you can just
> rebase on both of them?
As per your latest reply, I'll just rebase atop drm-misc-next for now.

>
>
> > +       pm_runtime_enable(dev);
> > +       /*
> > +        * In practice, ps8640_aux_transfer_msg() takes ~300ms to complete in
> > +        * the worst case. Set autosuspend_delay to 500ms.
> > +        */
> > +       pm_runtime_set_autosuspend_delay(dev, 500);
>
> To be a little nitpicky, this makes it sound as if the 500 ms needs to
> be greater than the 300 ms for correctness. That's not _really_ the
> case. During the whole ps8640_aux_transfer_msg() we're holding a PM
> Runtime reference (so it won't autosuspend no matter what) and at the
> end of it we mark that we were busy so the timer won't start ticking
> until then.
Yeah....sorry, looking again, I agree the comment I added in v3 is
pretty misleading.
I think autosuspend_delay just needs to be consistently longer than
the interval between each aux_transfer call during EDID read.
I'll measure the interval and add the number to the comment.

>
> Really the 500 ms is because we're quite slow to power up (~300 ms)
> and so we want to avoid powering down and powering up constantly. We
> definitely need to avoid a power down / power up when reading the EDID
> and an EDID read involves _several_ calls in a row to the AUX transfer
> function. We also expect that after userspace reads the EDID it will
> call us again "soon" to turn the power on and it's nice to not have to
> wait the 300 ms again. The 500 ms here is really just a number that's
> not too short but not too long. I suppose it's roughly related to the
> 300 ms because that's the delay we're trying to avoid, but otherwise
> they are unrelated. NOTE: the code will still be _correct_ if we miss
> the 500 ms window, it'll just be a lot slower.
>
> [1] https://lore.kernel.org/r/20211020181901.2114645-2-sam@ravnborg.org
>
> -Doug
