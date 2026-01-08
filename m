Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44B7D06489
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 22:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F79B10E7CE;
	Thu,  8 Jan 2026 21:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WICIYSA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DF010E7CE
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 21:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767907433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
 b=WICIYSA+vwjd/DdwoKvGKLVMfiWK8oncSIcv0Y5TSkqkGTlg249YYYcJgtK5YTFgKitH4z
 R3He8g6rDTskvr65ZUBB7qLcQKYwor1tl5MthRnUYCi4E2F9GgxiIurxQhmTtB7SFlssE4
 KNdem95+9ItX69dH0Z3dk4W0zyw1NS8=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-qzagU4hCN2CXcOhXOUMhRw-1; Thu, 08 Jan 2026 16:23:49 -0500
X-MC-Unique: qzagU4hCN2CXcOhXOUMhRw-1
X-Mimecast-MFC-AGG-ID: qzagU4hCN2CXcOhXOUMhRw_1767907429
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-55b0cfe81afso8718187e0c.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767907429; x=1768512229;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aMZTdMgEwkPQanj/a0OAHfxOFan2ydElF0bb71YGl8A=;
 b=o9w9UD5Sdny74ZF3RCeDonECAvkXMkvdSWz2aeyApge3pGkKRX2N7DVqmkkgX48Qhb
 1Wg75/zhQLaqhLFEUz2VrNZK3h6BlIbmLoJ+PMnv4C2R9EWuK2GIpBWpnNdn3n+yzBqV
 d+RDcOfNq35zyuQHqNiwx1VT9YZafBmfW3gd0OQ7ypPZ8w/uANDA92ivYdXntanGsxx1
 DhfzEAG4xHWtoGCmY3Xbu1RRHgIEzg+//FjiHeAULGX5MwoBmxvFege9np6KxIwBK8zb
 LCTSAsQcrmH3ZJnbTi9yooUlT++ZRnj7wQMxjot5MgQ+CfKUtVg5rEEvoRSnHk/xCBK6
 sZRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsjcALQslrPfDg6OKUK3xUTXdfSPdS1WMiLxdHz/qw0fDeWTb3Gfj+UfsNUThTd3MOHSFPuZfuV3Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7PGm0LNlAXP6K7dxtGAdfjajk6YB3GmaV8dFFmI6JKZd7EZM0
 ob1s35Pt1Lj8MH/hn44k6YWMPhWlc4tXIeIYmjadCEfyC9Rfsjm2JCeiGKcevHjhZnQOcX/k/6E
 iD9tMKo8nVOS6DV9XHqgg8F+IzK0JdB+QQ9etef9D3sZIvyilVCvR6cEzKWqHwm9pEDmKrQ==
X-Gm-Gg: AY/fxX50gT6tdtTz1KN77DUjciYot9zEVTPmLmWIzyqBWoPyg3hUFTxFnN0sAt75L3W
 coPLx+Ej/edgbie6U1pcPeHL0YIRu07BcBcL7LItcGgAO9ScRzui+e8Sx55bEH3PrbvfbRJUi44
 4haOQkEF+yHBfxqc7mfSaKYNnWiI+Lb3tgDfXQMcr1wpKaVrhxNQv9N6VNzJcrk1aSXdXogBdBB
 vx96XwOhKZEwHnPEKwzc267Su9Q15R1cFmciupXjHcQQy2NkcazguN6vTvl3YUJeObkhncfFPuy
 aOFBkVG5aEWePo4giWFY+BEZVwTVQObNEW1I6fVSZuWoKKad+1qBo1xe6FFVmpVlKlhV98tR21p
 c9iMk1q5k
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id
 ada2fe7eead31-5eea76a8724mr1006318137.33.1767907429163; 
 Thu, 08 Jan 2026 13:23:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9+XK5E3OQPztXIo7GPKPfvpra0LA99i0XMQua/Tc/8Kj6tPqIGZY+3/QAUKTGxXE41kQHWQ==
X-Received: by 2002:a05:6102:162a:b0:5ee:a76a:8513 with SMTP id
 ada2fe7eead31-5eea76a8724mr1006294137.33.1767907428708; 
 Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Received: from redhat.com ([2600:382:811f:d757:daa5:b867:12a3:9d12])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ec772e322asm7790577137.13.2026.01.08.13.23.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 13:23:48 -0800 (PST)
Date: Thu, 8 Jan 2026 16:23:34 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 9/9] phy: ti: phy-j721e-wiz: convert from round_rate()
 to determine_rate()
Message-ID: <aWAgVt599agpNqZQ@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
 <aVurM1XRqiYlzi1B@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aVurM1XRqiYlzi1B@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GFspPwCAIl7hGoULCq29rAb4ZnW3LzgBjOtNVj4MpeU_1767907429
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Geert,

On Mon, Jan 05, 2026 at 07:14:43AM -0500, Brian Masney wrote:
> On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> > Hi Brian,
> > 
> > On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > >
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> > ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> > in phy/next
> > 
> > > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> > >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> > >  }
> > >
> > > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -                                  unsigned long *prate)
> > > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > > +                                     struct clk_rate_request *req)
> > >  {
> > >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> > >
> > > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > > +                                      div->table, 2, 0x0);
> > 
> > Is this correct?  divider_round_rate() can return a negative error code
> > (from divider_ro_determine_rate()), which is not handled here?
> > 
> > Looks like several other users of divider_round_rate() use this
> > same logic, and thus are affected, too.
> 
> Thanks for the review! You are correct that this is a bug.
> 
> I had planned once round_rate is removed from the clk core to post a
> series to remove divider_round_rate() and divider_ro_round_rate() (plus
> the _parent functions) since they call the corresponding determine_rate
> functions. I'll bump that up on my todo list this week.

I posted a series that fixes the issue you identified, plus removes
those deprecated APIs all in one go.

https://lore.kernel.org/linux-clk/20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com/T/#t

Brian

