Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D001DB4FDD3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 15:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638510E74F;
	Tue,  9 Sep 2025 13:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EMWKULF6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4A310E74F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 13:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757425553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KuUSi/wMj/deuFTckhCe0po1wpou4UMuleZXZpAya2o=;
 b=EMWKULF6g+7iuAinjy7TX4TVdqfppsvSymbPqseJztrPDdlzb69sChhXZqNdIyHHj1oxeP
 YeTiXD+ZCyBMCap6NGb7nrRnVJucyGWw9NvvYVKmC7W5HDn2VDX+0hnIAmUaB0F+gofjV+
 IoCF5gEEEbduak6PEk+vI9RNeSk/fAU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-Lx7kMtNfNjC_4PUMwTFN_Q-1; Tue, 09 Sep 2025 09:45:50 -0400
X-MC-Unique: Lx7kMtNfNjC_4PUMwTFN_Q-1
X-Mimecast-MFC-AGG-ID: Lx7kMtNfNjC_4PUMwTFN_Q_1757425550
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70d7c7e972eso122153656d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 06:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757425550; x=1758030350;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KuUSi/wMj/deuFTckhCe0po1wpou4UMuleZXZpAya2o=;
 b=oKa5QMIhhXSEzWPKVXV02IjdGus3cr76ZfuBv+BKr3QQNBERaams0UskEOrjcOrSEj
 x80oxReHn3cXO94huFLA/IPkv19x/JtcJyeLs3zlPG0HnF5S2S/EXR0H+2nAQq3ZmcO6
 KnE3ZZPdLn5MW40IZm0ZibwuimjyU3tel89bQMOUaow26qKYt1Kx3O9NLbUqy7759YxS
 wgwO2V+M7kv0en1SCe/zOCc/Jn7iFy9NUGxZsanAwWA+cX7ADDZxbDIvw0Qojn9AAyOA
 LezicbOiqV4Rgo13BcFTidbmGIzAUIFUE8tL2+LMyWySi3XJ2iSgLGbKPfi2a0Wo8eV/
 g7IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxnM4uPCidbusj5QCPUU9ptONZ0YulQ5IEd3YzmMk2me4m+RuhneMX2s7GD+CgySuvMeA0CHw5IMo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzn3TWyMxVZVDaqxoFqlsXroHIq9I7JFHvxjZmZBxFfP/Nd+3py
 4Yp1OB2oElveGOvpVyvEthCwg3zaDmX8LLpxrsyNwZ+pxQivKNknAAU4upqyMwQw3lQYO4fbkYA
 FTerZwMYS25jq/jVax+owVf6CbRsmjH7rjUamH4eC2SMvFxTgvjWVcuJ/ZPVnE72CNEFSNw==
X-Gm-Gg: ASbGnctsUP5reePNwGM1xHofalvHrEoGS/1Aog/SBqKzkVlcyZB3rWaWPPFFpksPWvN
 FSFEQiiUPO2qUbnYsdNEgg/3fJ/s1jjBhUKDNO7CNXg2de5rz0cOciRLdh+8RBa8FZxn5U9+BBk
 rHJQLU5REsSGOabY3pNNg2SUCjqkV9lj2i5WODT4aLs8zz/DBpzgD+dZ/sMdN6d4llc4IUzQOuK
 NAZzn8fl4f/U5QVx8d9bHyS7w3vDATx8kFdKq3TiSA9MafxV1g8WkTVUbVu1wdn1Ttwvn6k0cDz
 jLgoAosO2ebO9Ul6g5mqVbUSvDjAkcLlnAd7rdzXM3FYk55xh8M7nBW+rQ+gXSlBsmuWjY2suxs
 Y+qNfEVJ4qeDXmyRKiL0=
X-Received: by 2002:a05:6214:624:b0:70e:3e:6304 with SMTP id
 6a1803df08f44-739435cc42bmr94853906d6.65.1757425549543; 
 Tue, 09 Sep 2025 06:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmp4FTmcXOP7+RMzS1+U7HWsbh9sfiIsI3KOLWl/uwcWgSrIp6/82zb9nfnJx9VJ/Da/CuPA==
X-Received: by 2002:a05:6214:624:b0:70e:3e:6304 with SMTP id
 6a1803df08f44-739435cc42bmr94853596d6.65.1757425548985; 
 Tue, 09 Sep 2025 06:45:48 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-720b4665fcbsm138866926d6.37.2025.09.09.06.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 06:45:48 -0700 (PDT)
Date: Tue, 9 Sep 2025 09:45:46 -0400
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
Message-ID: <aMAvinQ4nn38E7tx@x1>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-2-9162470bb9f2@redhat.com>
 <aKX35U4jX55W3W61@vaman> <aKYFh5YI9j-MHKH4@x1>
MIME-Version: 1.0
In-Reply-To: <aKYFh5YI9j-MHKH4@x1>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MnL5whGheDUYmTHmE2hDcmcVTUup5Pc-1USVNRv7eBw_1757425550
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

On Wed, Aug 20, 2025 at 01:27:35PM -0400, Brian Masney wrote:
> On Wed, Aug 20, 2025 at 09:59:25PM +0530, Vinod Koul wrote:
> > On 10-08-25, 18:45, Brian Masney wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > on the cover letter of this series.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > > ---
> > >  drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > index e51b2d13eab473dddace48c75c2a8d73c8c65635..b0b6497e7eedcb6867541b573d22156ded29a4d5 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> > > @@ -90,10 +90,10 @@ static void mtk_hdmi_pll_unprepare(struct clk_hw *hw)
> > >  	usleep_range(80, 100);
> > >  }
> > >  
> > > -static long mtk_hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> > > -				    unsigned long *parent_rate)
> > > +static int mtk_hdmi_pll_determine_rate(struct clk_hw *hw,
> > > +				       struct clk_rate_request *req)
> > >  {
> > > -	return rate;
> > > +	return 0;
> > 
> > This does not sound correct to me? should this not check the requested
> > rate?
> 
> I can't speak as to whether or not this specific driver should have a
> rate check here. I've seen in some other drivers where the specific
> frequencies are managed in firmware, and Linux just passes on the rate
> request as is.
> 
> Some other phy drivers (most notably drivers/gpu/drm/msm/dsi/phy/) only
> makes sure that the requested rate is within a min/max range. Assuming
> I read this driver's set_rate() correctly, it looks like the min/max
> range may be 64-192 MHz. I'm not sure to be honest.
> 
> This change keeps the existing behavior of the driver as it is today,
> and just migrates off an old API.

I'm just checking to see if you have any questions about this series,
and plan to merge it for v6.18. I'm hoping that in v6.19 to remove this
old API from the clk core once all of the other subsystems outside of
drivers/clk/ have been updated.

As I mentioned previously: This change keeps the existing behavior of
the driver as it is today, and just migrates off an old API. I don't
have access to this hardware, or technical details about what should
be here.

Brian

