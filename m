Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1232A3E7A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 09:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2766EC14;
	Tue,  3 Nov 2020 08:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820326E093
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 17:06:41 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t22so7116559plr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 09:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=ESh9xtdAgdP17+IlQOl8SchaQP1wByfvx2mtwCrql2Q=;
 b=X4DuJJO0/gEJdfLQm0/YE9Y2l9ZhKtY5Whhq2yImpVUTGKCiG2r0WVGyUFoVbJELm0
 LPmnoj1qViMSnbrVTZa3YlJxORw9Cxk4h/6jPyeDD7BV6b3PHq4EyLWx721+H44mT1+K
 ZBy4zvIIkSSMS0k9A5cRioGINRzvU1KBwGgS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=ESh9xtdAgdP17+IlQOl8SchaQP1wByfvx2mtwCrql2Q=;
 b=dUCnfd2P+9NuDmsYa2DPCcCXvngfAteWskbHyk+r/knQn753RUMI31uTeHKOnuBnhK
 BwjF+V7SS/NcvnTGMfA3KtQCTFminPK+BTSRuSWwEue2zdhdR0BCGrjBwGR3NKAOrBxQ
 l70jKauei0RnakZkFSRkKykMbz21gQCF3RUtFV7uNtAEDf++Bh7AJ3qqH5nRDmM6+zTv
 uwCSNjJ94RDEA49Qfn4Ummf8ZxVOAhMzEKKDTpIyvvTmroQyXC0tmWi5VMOPCWFCWFCw
 MzIoepb+tsd/DIGByga6hcTC1M+euStSGwDdsJtImmhBeNTW3b+3hmK07B2703ppFb3K
 vHTw==
X-Gm-Message-State: AOAM533OgGHXYWZKTkOwbRMTjvjFqZseqL8OpLoeJEqs05yq5eehQ49x
 HGnGOa7xnSGTa2Dk0JdN+vnRDg==
X-Google-Smtp-Source: ABdhPJxYfBE1SCamXj3nnapq9Wu8zWTv9R/9QOz630Xs5i8P2iZSQmvZci0pOSsNYwW2B9nmgp+aZA==
X-Received: by 2002:a17:902:8649:b029:d6:d1e7:e78b with SMTP id
 y9-20020a1709028649b02900d6d1e7e78bmr4135219plt.63.1604336801123; 
 Mon, 02 Nov 2020 09:06:41 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 12sm5476052pfh.88.2020.11.02.09.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 09:06:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VHvL4A3U==CECbgkfvRcy51v4cSBjodvRGA2463L+CZQ@mail.gmail.com>
References: <20201030011738.2028313-1-swboyd@chromium.org>
 <20201030011738.2028313-2-swboyd@chromium.org>
 <CAD=FV=VHvL4A3U==CECbgkfvRcy51v4cSBjodvRGA2463L+CZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/bridge: ti-sn65dsi86: Combine register
 accesses in ti_sn_aux_transfer()
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Date: Mon, 02 Nov 2020 09:06:38 -0800
Message-ID: <160433679882.884498.16765038474501300057@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:14:25 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-11-02 08:18:47)
> Hi,
> 
> On Thu, Oct 29, 2020 at 6:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > These register reads and writes are sometimes directly next to each
> > other in the register address space. Let's use regmap bulk read/write
> > APIs to get the data with one transfer instead of multiple i2c
> > transfers. This helps cut down on the number of transfers in the case of
> > something like reading an EDID where we read in blocks of 16 bytes at a
> > time and the last for loop here is sending an i2c transfer for each of
> > those 16 bytes, one at a time. Ouch!
> >
> > Changes in v2:
> >  - Combined AUX_CMD register write
> 
> The change from v1 to v2 makes me slightly nervous, though I guess
> it's fine.  Specifically, all the examples in the datasheet show
> programming the CMD before the ADDR and LEN.  This change will make it
> programmed after.  Since there's a separate START bit I guess it's OK,
> though.  Nothing in the datasheet explicitly says that the order in
> the examples is the only order that will work...

Hmmm now that you mention it the SEND bit is explicitly being cleared in
the programming sequence by being there at the start. If I want to
combine that with the adjacent register writes then I should make sure
that the SEND bit is cleared at the beginning. Otherwise the hardware
may be in the middle of a transaction if the previous transaction is
still running, i.e. a timeout where the SEND bit never cleared.

I think we should go back to the previous patch I had here. Combining
this register write is wrong. If anything, we should clear the SEND bit
on a timeout and make sure during probe that this bit is clear and then
drop the programming of this register from this function entirely. That
would reduce the sequence by one register, but is more complicated vs.
just making sure it has the clear bit here to begin with.

> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Thanks, but I'll send another round picking up acks and such and your
previous review tag on the v1 of this patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
