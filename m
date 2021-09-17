Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D219A410183
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 00:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124F96EE92;
	Fri, 17 Sep 2021 22:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6656EE92
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 22:55:51 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id m21so22251291qkm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vkE5pLigKpcmkQr00gNfVhLXxFW0Xiz9nMMvuNv3Tm4=;
 b=RHlyL7KnzEO7YLAK1AlmWZl+BSZRJXdkg5ABHzuCGu8ukSWk8A3kuE7Ot/CmryjFI2
 iz7NAMaKX7knGiMtH463B/q0dmxEwVGtpCNe4Gmn0Vhe2EY55LdCggRETe/CYGpsX6x5
 51AyKEGnffMaBlBsXLVFkHRjep2k34Oo7O2zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vkE5pLigKpcmkQr00gNfVhLXxFW0Xiz9nMMvuNv3Tm4=;
 b=qht8ypbVjsquZsWC0Sxeb023sxJMEJde/KyrlxuJkjHVh6MmahNikbWpvLKnmL66DS
 4kDAxbttnqyfHmpey5fRHGpk/WMGV69PUGLySjuFqf+DmzCu5tLeFVcSVSwi5YMeB1bk
 YSPdVz+88pme2dPjEx+BbjMO2/bXWJgNo0hnyvSyUinoIhzlftmcxz7xFMPFJnDjcEWk
 mtbK/yHhMqRuyK6MkEBXoHLeDbfRP0TzFXS09PTLYB56lOqfkczFOJy1uWLNdn9qDlon
 BKXlS7iDHJp7oQqWMzGPibTno4jFY/adZqJos+lzK4PKGzGUweQ/zqrP5zHXdgtu3rnr
 Jp6g==
X-Gm-Message-State: AOAM530Odo6+l9N08UtV/Ijjnx6llRIocCDGUAVAcgOaZXrPNm7Eu3MP
 N0KAXZVnedxYZbWPGGc0j6SLIpGiXcMuQhLO5RucSA==
X-Google-Smtp-Source: ABdhPJwfWJVdS8+qM3cuQSL16oRaVAmsep28BVhS2x1Nr9rpo5jyA7xo2oWroVqf/9I52aT4qRsilv4kfWLTStMtfG8=
X-Received: by 2002:a25:6744:: with SMTP id b65mr1171939ybc.100.1631919350944; 
 Fri, 17 Sep 2021 15:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
 <CAD=FV=WtC3AQr44idgzVe9RCjb9i=+ekJ_wKKnKMcHRSQX7dfQ@mail.gmail.com>
 <CAE-0n51AAXbDGH-V6527nT1Fp1BU8oWKEYmHnL6FkYs=P9OPOw@mail.gmail.com>
 <CAD=FV=W2wTtZtTKw4n9cSo1SYjs3KS84inKCeeHa8bybOc+sfw@mail.gmail.com>
In-Reply-To: <CAD=FV=W2wTtZtTKw4n9cSo1SYjs3KS84inKCeeHa8bybOc+sfw@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Fri, 17 Sep 2021 15:55:40 -0700
Message-ID: <CA+cxXhmEBn3nrbr006PpXYTkcRMWsVb7YxOcx7A_xhDL29+OqQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
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

Hi

On Thu, Sep 16, 2021 at 1:31 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Sep 16, 2021 at 1:15 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       /* Assume it's good */
> > > > > +       msg->reply = 0;
> > > > > +
> > > > > +       addr_len[0] = msg->address & 0xff;
> > > > > +       addr_len[1] = (msg->address >> 8) & 0xff;
> > > > > +       addr_len[2] = ((msg->request << 4) & SWAUX_CMD_MASK) |
> > > > > +               ((msg->address >> 16) & SWAUX_ADDR_19_16_MASK);
> > > >
> > > > It really feels like this out to be possible with some sort of
> > > > cpu_to_le32() API. We're shoving msg->address into 3 bytes and then
> > > > adding in the request and some length. So we could do something like:
> > > >
> > > >         u32 addr_len;
> > > >
> > > >         addr_len = FIELD_PREP(SWAUX_ADDR_MASK, msg->address);
> > > >         addr_len |= FIELD_PREP(SWAUX_CMD_MASK, msg->request);
> > > >         if (len)
> > > >                 addr_len |= FIELD_PREP(LEN_MASK, len - 1);
> > > >         else
> > > >                 addr_len |= FIELD_PREP(LEN_MASK, SWAUX_NO_PAYLOAD );
> > > >
> > > >         cpu_to_le32s(&addr_len);
> > > >
> > > >         regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, &addr_len, sizeof(addr_len));
> > >
> > > You're arguing that your version of the code is more efficient? Easier
> > > to understand? Something else? To me, Philip's initial version is
> > > crystal clear and easy to map to the bridge datasheet but I need to
> > > think more to confirm that your version is right. Thinking is hard and
> > > I like to avoid it when possible.
> > >
> > > In any case, it's definitely bikeshedding and I'll yield if everyone
> > > likes the other version better. ;-)
> >
> > Yeah it's bikeshedding. I don't really care about this either but I find
> > it easier to read when the assignment isn't wrapped across multiple
> > lines. If the buffer approach is preferable then maybe use the address
> > macros to clarify which register is being set?
> >
> >         unsigned int base = PAGE0_SWAUX_ADDR_7_0;
> >
> >         addr_len[PAGE0_SWAUX_ADDR_7_0 - base] = msg->address;
> >         addr_len[PAGE0_SWAUX_ADDR_15_8 - base] = msg->address >> 8;
> >         addr_len[PAGE0_SWAUX_ADDR_23_16 - base] = msg->address >> 16;
> >         addr_len[PAGE0_SWAUX_ADDR_23_16 - base] |= msg->request << 4;
>
> Sure, this looks nice to me. :-)
Thanks.
Implemented the fix in v4.
PTAL.

>
>
> > > > > +               return ret;
> > > > > +       }
> > > > > +
> > > > > +       switch (data & SWAUX_STATUS_MASK) {
> > > > > +       /* Ignore the DEFER cases as they are already handled in hardware */
> > > > > +       case SWAUX_STATUS_NACK:
> > > > > +       case SWAUX_STATUS_I2C_NACK:
> > > > > +               /*
> > > > > +                * The programming guide is not clear about whether a I2C NACK
> > > > > +                * would trigger SWAUX_STATUS_NACK or SWAUX_STATUS_I2C_NACK. So
> > > > > +                * we handle both cases together.
> > > > > +                */
> > > > > +               if (is_native_aux)
> > > > > +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> > > > > +               else
> > > > > +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> > > > > +
> > > > > +               len = data & SWAUX_M_MASK;
> > > > > +               return len;
> > > >
> > > > Why no 'return data & SWAUX_M_MASK;' and skip the assignment?
> > >
> > > Actually, I think it's the "return" that's a bug, isn't it? If we're
> > > doing a "read" and we're returning a positive number of bytes then we
> > > need to actually _read_ them. Reading happens below, doesn't it?
> > >
> >
> > Oh I missed that. We're still supposed to return data to upper
> > layers on a NACKed read?
>
> It seems highly likely not to matter in practice, but:
>
> * The docs from parade clearly state that when a NAK is returned that
> the number of bytes transferred before the NAK will be provided to us.
>
> * The i2c interface specifies NAK not as a return code but as a bit in
> the "reply". That presumably is to let us return the number of bytes
> transferred before the NAK to the next level up.
>
> * If we're returning the number of bytes and it's a read then we'd
> better return the data too!
>
> It looks like we handled this OK in the TI bridge driver. From reading
> the TI docs we'll get both AUX_IRQ_STATUS_AUX_SHORT and
> AUX_IRQ_STATUS_NAT_I2C_FAIL in the case of a partial transfer and so
> we'll do the right thing.

Thanks for catching the bug.
In v4, I made SWAUX_STATUS_I2C_NACK fall through to SWAUX_STATUS_ACKM and
store the number of read/written bytes in len w/o returning immediately.
PTAL.

>
> -Doug
