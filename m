Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810BE40EB79
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 22:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572156E824;
	Thu, 16 Sep 2021 20:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703456E824
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 20:15:32 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso9830428otv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ojoWMvWYiGgf8hZbpbLo/au+nVIOyXutlWB62AfZAFw=;
 b=GfloMrd2w/KYv4zk0CGJz9edZXIutQAmTBaa5aaDUIGci3XF1xOKwOwFF7KDN4gWK6
 Chvmx9+KqA0rt4GCN4G1on/YjJGR/eWtdpkfVxXdeuaCcsY7f3fMsgDg4g0cTYb4oKcX
 VB+7JGwkeN/g2GcdMVaHm9g6URAoilmovScgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ojoWMvWYiGgf8hZbpbLo/au+nVIOyXutlWB62AfZAFw=;
 b=4P+pQeY3G/mkV2eeTDrXgkD74zlwnYFTiQGAOifJ+VojmmoqCdspzEUSQcKomdkghc
 sL+6x2S7lXdd4wbBDB2F2BCSVRxItVG73UeXWexN3pmt18dUIyxhzzUNt2Z3//peNzRX
 346ltkCMMRpF7xpgMF0rLzrMe2JdYEoQPNEB6ZvUxDgOAmL/3laG8Ji4KmwVUAJLa9KO
 w2atQp0fPQSrjip6vJrZr8ReiKY/ukRupYPn5ayjoasysXakljQRyCP5nqcC51O0OkNa
 cO1mEw4vD4WCfG7xARZLb8W6PApoHFcYTRLD0iHoJRGEq4/0lKcvUwaR+mxIQZCX0XP8
 18zQ==
X-Gm-Message-State: AOAM531q19Dh4BnzEdNXrGyMXlBa1f9iwcwJmwK6tM4tyAdsV8Csah8a
 vESEtE9lzZCqePR0UjdCV7ER4GP5s74K3+KzWBQang==
X-Google-Smtp-Source: ABdhPJw7pGqvIB2k2CpkvI7RssSaZPxmsZiSwx0HbdCnkzcDAjZu5wVjSAIrBe9RIjq2GBNHiYywWy/MzGu/BaeTbxU=
X-Received: by 2002:a05:6830:18c7:: with SMTP id
 v7mr6307269ote.126.1631823331648; 
 Thu, 16 Sep 2021 13:15:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Sep 2021 13:15:31 -0700
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WtC3AQr44idgzVe9RCjb9i=+ekJ_wKKnKMcHRSQX7dfQ@mail.gmail.com>
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.3.Ibf9b125434e3806b35f9079f6d8125578d76f138@changeid>
 <CAE-0n51JFM_yYdOsCQyvdMw5xXJ7REcbOJC6qi=6nfiNcdvnWw@mail.gmail.com>
 <CAD=FV=WtC3AQr44idgzVe9RCjb9i=+ekJ_wKKnKMcHRSQX7dfQ@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 16 Sep 2021 13:15:31 -0700
Message-ID: <CAE-0n51AAXbDGH-V6527nT1Fp1BU8oWKEYmHnL6FkYs=P9OPOw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/bridge: parade-ps8640: Add support for AUX
 channel
To: Doug Anderson <dianders@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>,
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

Quoting Doug Anderson (2021-09-15 14:27:40)
> Hi,
>
> On Tue, Sep 14, 2021 at 5:57 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Philip Chen (2021-09-14 16:28:45)
> > > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > index 8d3e7a147170..dc349d729f5a 100644
> > > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > > @@ -117,6 +144,129 @@ static inline struct ps8640 *bridge_to_ps8640(struct drm_bridge *e)
> > [...]
> > > +       case DP_AUX_I2C_WRITE:
> > > +       case DP_AUX_I2C_READ:
> > > +               break;
> > > +       default:
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       ret = regmap_write(map, PAGE0_AUXCH_CFG3, AUXCH_CFG3_RESET);
> > > +       if (ret) {
> > > +               dev_err(dev, "failed to write PAGE0_AUXCH_CFG3: %d\n", ret);
> >
> > Can we use DRM_DEV_ERROR()?
>
> I've never gotten clear guidance here. For instance, in some other
> review I suggested using the DRM wrapper and got told "no" [1]. ;-)
> The driver landed without the DRM_ERROR versions. I don't really care
> lots so it's fine with me to use use DRM_DEV_ERROR, I just wish I
> understood the rules...
>
> [1] https://lore.kernel.org/all/49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de/

I think the rule is that the DRM specific printk stuff should be used so
that they can be stuck into the drm logs. On chromeOS we also have a
record of the drm logs that we can use to debug things, split away from
the general kernel printk logs. So using DRM prints when there's a DRM
device around is a good thing to do.

>
>
> > > +               return ret;
> > > +       }
> > > +
> > > +       /* Assume it's good */
> > > +       msg->reply = 0;
> > > +
> > > +       addr_len[0] = msg->address & 0xff;
> > > +       addr_len[1] = (msg->address >> 8) & 0xff;
> > > +       addr_len[2] = ((msg->request << 4) & SWAUX_CMD_MASK) |
> > > +               ((msg->address >> 16) & SWAUX_ADDR_19_16_MASK);
> >
> > It really feels like this out to be possible with some sort of
> > cpu_to_le32() API. We're shoving msg->address into 3 bytes and then
> > adding in the request and some length. So we could do something like:
> >
> >         u32 addr_len;
> >
> >         addr_len = FIELD_PREP(SWAUX_ADDR_MASK, msg->address);
> >         addr_len |= FIELD_PREP(SWAUX_CMD_MASK, msg->request);
> >         if (len)
> >                 addr_len |= FIELD_PREP(LEN_MASK, len - 1);
> >         else
> >                 addr_len |= FIELD_PREP(LEN_MASK, SWAUX_NO_PAYLOAD );
> >
> >         cpu_to_le32s(&addr_len);
> >
> >         regmap_bulk_write(map, PAGE0_SWAUX_ADDR_7_0, &addr_len, sizeof(addr_len));
>
> You're arguing that your version of the code is more efficient? Easier
> to understand? Something else? To me, Philip's initial version is
> crystal clear and easy to map to the bridge datasheet but I need to
> think more to confirm that your version is right. Thinking is hard and
> I like to avoid it when possible.
>
> In any case, it's definitely bikeshedding and I'll yield if everyone
> likes the other version better. ;-)

Yeah it's bikeshedding. I don't really care about this either but I find
it easier to read when the assignment isn't wrapped across multiple
lines. If the buffer approach is preferable then maybe use the address
macros to clarify which register is being set?

	unsigned int base = PAGE0_SWAUX_ADDR_7_0;

	addr_len[PAGE0_SWAUX_ADDR_7_0 - base] = msg->address;
	addr_len[PAGE0_SWAUX_ADDR_15_8 - base] = msg->address >> 8;
	addr_len[PAGE0_SWAUX_ADDR_23_16 - base] = msg->address >> 16;
	addr_len[PAGE0_SWAUX_ADDR_23_16 - base] |= msg->request << 4;
	...

>
>
> > > +               return ret;
> > > +       }
> > > +
> > > +       switch (data & SWAUX_STATUS_MASK) {
> > > +       /* Ignore the DEFER cases as they are already handled in hardware */
> > > +       case SWAUX_STATUS_NACK:
> > > +       case SWAUX_STATUS_I2C_NACK:
> > > +               /*
> > > +                * The programming guide is not clear about whether a I2C NACK
> > > +                * would trigger SWAUX_STATUS_NACK or SWAUX_STATUS_I2C_NACK. So
> > > +                * we handle both cases together.
> > > +                */
> > > +               if (is_native_aux)
> > > +                       msg->reply |= DP_AUX_NATIVE_REPLY_NACK;
> > > +               else
> > > +                       msg->reply |= DP_AUX_I2C_REPLY_NACK;
> > > +
> > > +               len = data & SWAUX_M_MASK;
> > > +               return len;
> >
> > Why no 'return data & SWAUX_M_MASK;' and skip the assignment?
>
> Actually, I think it's the "return" that's a bug, isn't it? If we're
> doing a "read" and we're returning a positive number of bytes then we
> need to actually _read_ them. Reading happens below, doesn't it?
>

Oh I missed that. We're still supposed to return data to upper
layers on a NACKed read?
