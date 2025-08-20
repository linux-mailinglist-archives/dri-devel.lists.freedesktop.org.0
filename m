Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF54B2E3C5
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A57A910E26A;
	Wed, 20 Aug 2025 17:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dH089n+T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8707610E26A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755710866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
 b=dH089n+TIXFlEGc7CcGxcnMifRoEomWsKPCQyFcGvQuUSYcI2Nr7kIMdduHG8M2ne0h7xm
 7xaAjFt+TdoNIwoeJ3wI8ZoRlZjw3x7FffAHu/jIjA/b1QNdYzxAxabUworKP7ZeMVLWZY
 qV+4K6hX5ZH0rKuzzp65hVGbxE6w2oo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-JKCZD9XLMO-S8ml2HkrhpA-1; Wed, 20 Aug 2025 13:27:45 -0400
X-MC-Unique: JKCZD9XLMO-S8ml2HkrhpA-1
X-Mimecast-MFC-AGG-ID: JKCZD9XLMO-S8ml2HkrhpA_1755710864
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109c7e901so2999521cf.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 10:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755710864; x=1756315664;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y70NAvFqmHqQ/QHVWzEdqMxMN+9/pnnsuJyiP3UY3H8=;
 b=HrvWLTIrdXbf3+Mav7RrxViCoW11T/SdmkxXOZkGUcwnBgQ3lxpPQHmONS7zkcdlC8
 H1mQZmsl6NltrHGEGKZ7yTljjF/JneMotktTcrya3rN8EL0YNvhiE7o7T4RfALKw45yS
 2hoqupEJZYG7as62RAY7CVWSCt6irl7JcogG/GY0iAJ3ep2QF5SNH6jhkw5yccQ0ExBe
 9yMTHFDC6vpAyfjP/j6hczLimLQVrchoqb/6k0UK+zpLqE1IHo8kLjd/g3l1We2eFEH0
 xiqYLTqDEAWocl9qXBysiKizPJZJrzzkqEx4iCfqKVEpgv3AQIDN1XGXRcDlaQY/Azr/
 GN3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEE5tljNHSsEGaJicZ5eqO0o24XVIUKHQAhg/etm6EleRzQ2MMlZ2V7Ij29omgwuZHrU+rruj298M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwN4Otboezenl5rh1MIEqZ6eJcQhFvEFHLv03Xr9ejQ/rJGwJM6
 SNfW2Lwhv1WrCHhGJQIanmZiJk//B4oYA+m5Z4WaaQYJrYUCJHfr/21im4X7AYtAPVwsHJjiKZe
 aWsl5xfJyfwURn44IxpJxVNYiKxoM9qXIa/NDNQVS+hEAC/agOYyPXA4vGw16uKv+fQtvTA==
X-Gm-Gg: ASbGncvqvtQrgSv85+xg3z8v9c6dc7a6vXo2Wy2efPXJOhCqGdQf3PUrKsa5eVHiumo
 eZJGoOzBcqZGvNe8t8Gez8XxH4gwpTM72FUX7JUP7fRgt19NK+pci5xKVtIvXb1cRSZcFPibHgK
 Jk+w3Uus/m0Kq/dclYnTqxNFLkXA7f4CXf1H8kJ8no/AMMUfkYMkumQ0Ezzb0w6xZUwIGWe9sDi
 YJc2R2ExWmZWMI61vMVxa23iHTKeeo/PUT27VV23GhhB2vvpUAFAqL9N5/fe31kAY03l5otJ6Jc
 oVu5G8EX86v1TBR8ZKSwYl39ZP7Oa0MX+OFzwrzCKQ7jFGrzBRUBOUG8h9f2JzY=
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id
 d75a77b69052e-4b29ac27162mr22633181cf.78.1755710863848; 
 Wed, 20 Aug 2025 10:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBHjmp0EQimLUiSVjKdx79ljrj20Q8jlRYnemWAhO0v2X5MfDUxphjoE81Tq8MZ5J1pPp2Eg==
X-Received: by 2002:ac8:5dc6:0:b0:4b2:9ac2:6857 with SMTP id
 d75a77b69052e-4b29ac27162mr22632391cf.78.1755710862940; 
 Wed, 20 Aug 2025 10:27:42 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b11dc5aeaasm87927511cf.19.2025.08.20.10.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 10:27:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:27:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from
 round_rate() to determine_rate()
Message-ID: <aKYFh5YI9j-MHKH4@x1>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
 <aKX35U4jX55W3W61@vaman>
MIME-Version: 1.0
In-Reply-To: <aKX35U4jX55W3W61@vaman>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mKh-4vaaJxVAPEKb69RF-3teJZlCLMiiL3zS2l-khrw_1755710864
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

Hi Vinod,

On Wed, Aug 20, 2025 at 09:59:25PM +0530, Vinod Koul wrote:
> On 10-08-25, 18:45, Brian Masney wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> >  	usleep_range(80, 100);
> >  }
> >  
> > -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > -				    unsigned long *parent_rate)
> > +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> > +				       struct clk_rate_request *req)
> >  {
> > -	return rate;
> > +	return 0;
> 
> This does not sound correct to me? should this not check the requested
> rate?

I can't speak as to whether or not this specific driver should have a
rate check here. I've seen in some other drivers where the specific
frequencies are managed in firmware, and Linux just passes on the rate
request as is.

Some other phy drivers (most notably drivers/gpu/drm/msm/dsi/phy/) only
makes sure that the requested rate is within a min/max range. Assuming
I read this driver's set_rate() correctly, it looks like the min/max
range may be 64-192 MHz. I'm not sure to be honest.

This change keeps the existing behavior of the driver as it is today,
and just migrates off an old API.

Brian

