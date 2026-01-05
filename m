Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1233FCF3754
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 13:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D2E10E06B;
	Mon,  5 Jan 2026 12:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fOKBg4Xj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFC610E06B
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767615291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pALCUxgG0Sih3gS1zvT5EYeP9u7uxFAHJ/wplVNqgIA=;
 b=fOKBg4XjcnGQ9m2G2mFeqHIF9igLgD4dursA6xEG2l/ZqPskIVCDjZp5DeK/h+bsGwtWEV
 FafzP/JWRQqAXyc/YCyxDPD6Q19ONa4v7W8lTCr2c8HCrgYB7sqPRThPUDw9z3aV6r0zTt
 2i1a9yjYfYb7K4zj/MhqgZP9kY1IbaE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-LCkSdZvNPUyJkiiu78Qcug-1; Mon, 05 Jan 2026 07:14:48 -0500
X-MC-Unique: LCkSdZvNPUyJkiiu78Qcug-1
X-Mimecast-MFC-AGG-ID: LCkSdZvNPUyJkiiu78Qcug_1767615288
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2194e266aso2283790585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 04:14:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767615288; x=1768220088;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pALCUxgG0Sih3gS1zvT5EYeP9u7uxFAHJ/wplVNqgIA=;
 b=EEMtK7yebN+pqItrx0X3lNz13/0Bf40ok9RxNx8oZWR0tIG36KDEM49wZGUIfYqIff
 JVQsX/1/JrSLMcLCiW7sKKfWOnIqiQaRAfbNbgqRsqMzz24S0CfL9AkKyTC30rzPfo01
 wx2hCvJWcZMZDHHp+N4CPvbhv2ZDs/iHPDN8UzuSlmVn7oRlJuD7jdzy9fKlDUDvi6HU
 5Tc5V9yhaTOvtcY8KrxTyR8hbCrjV7dDd/CadAvloLnLVsBcchZNu2H90A1BlaziapiQ
 eQYh+MDTM+eeb4jbAm7Epi9QjL6YQ/bIEaPh2FvAE1OdRjjJLgyFeRu+b3se9HW13QED
 cEJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOFPzmrwQLM0ntm+JllGq2+/ZqLUsIUhrQkelAqbVT1FCsl4AmdaXZmCPtxLL8GRLXqVncvGUDYD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUz2U/iPoP3/4u2+HLJMVHe9vGgeUAdsYIx8UmhtRNqY5WWgBc
 RiATxl8Z0O0WNslFKwSgYTiYrWMGy3bN5iv+NESMb3ghg30kalCiHJ+HMXgVGZebJuJ1i+uLG2o
 4NyVxqNhkRvgUXmzHSsuXk/jHSH3MxRC75DuZXXQuiBYvXFoUs1yplUoR6rzV99S0b4JsUg==
X-Gm-Gg: AY/fxX4Hk8NVhagjqbr2N+dnHtmumbSO61Rt9ZzTe70CG3ae7kDaU5ybTpgQWMxk19E
 yxro+NJLSJ1EktMPd0zSi5moPz/FlahJMmH9SwaqLnc2whYFULqzcX8/8rO/4JqddmFnAMh79/O
 4w6XkM46QtRKo9PKJx0B/IgEtywkOk4zUSILfbo5Y0Hk/vEIHa4KNgcDQbxFY+uwUE0Vpi/IJvE
 3HYcLfhrIa3UTD6lc/EyjMrxIU8an/55WS6jE8JsGS10dENqS8DnaeRVnY0Hz/C1NgaK+LUy39c
 HskC4fX1BFEpULG4VVIRezr9t7i48k6BdCj3ij74LnzYTZGPStzFz3z+FzNxxklw6q39HP0Vnn5
 jH4sX+5qOqxVb+3lLQ9hZiELJg9wXESVyAFrALoTPRetz
X-Received: by 2002:a05:620a:44d5:b0:8b2:d6eb:8203 with SMTP id
 af79cd13be357-8c090501db3mr7123130685a.69.1767615287420; 
 Mon, 05 Jan 2026 04:14:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFX37kzKtyI4pVa2B6zkJ45mbfVDYf5b4bq6gq1EC+G2OfHkde7TEgVCraCyU1NH7StTtKeCg==
X-Received: by 2002:a05:620a:44d5:b0:8b2:d6eb:8203 with SMTP id
 af79cd13be357-8c090501db3mr7123126885a.69.1767615286882; 
 Mon, 05 Jan 2026 04:14:46 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c0971ee247sm3701650785a.27.2026.01.05.04.14.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 04:14:45 -0800 (PST)
Date: Mon, 5 Jan 2026 07:14:43 -0500
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
Message-ID: <aVurM1XRqiYlzi1B@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
 <20251212-phy-clk-round-rate-v3-9-beae3962f767@redhat.com>
 <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXudWW3MPKqP0-d+DyMNRF-X62oyHRnj=MM_9MSpJw6sw@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y5SIH4EomYgVz-Dx1_BhJuqR0Z_xaeX-MppecwOaYgI_1767615288
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

On Mon, Dec 29, 2025 at 11:18:52AM +0100, Geert Uytterhoeven wrote:
> Hi Brian,
> 
> On Fri, 12 Dec 2025 at 00:21, Brian Masney <bmasney@redhat.com> wrote:
> > The round_rate() clk ops is deprecated, so migrate this driver from
> > round_rate() to determine_rate() using the Coccinelle semantic patch
> > on the cover letter of this series.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for your patch, which is now commit 27287e3b52b5954b ("phy:
> ti: phy-j721e-wiz: convert from round_rate() to determine_rate()")
> in phy/next
> 
> > --- a/drivers/phy/ti/phy-j721e-wiz.c
> > +++ b/drivers/phy/ti/phy-j721e-wiz.c
> > @@ -934,12 +934,15 @@ static unsigned long wiz_clk_div_recalc_rate(struct clk_hw *hw,
> >         return divider_recalc_rate(hw, parent_rate, val, div->table, 0x0, 2);
> >  }
> >
> > -static long wiz_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
> > -                                  unsigned long *prate)
> > +static int wiz_clk_div_determine_rate(struct clk_hw *hw,
> > +                                     struct clk_rate_request *req)
> >  {
> >         struct wiz_clk_divider *div = to_wiz_clk_div(hw);
> >
> > -       return divider_round_rate(hw, rate, prate, div->table, 2, 0x0);
> > +       req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
> > +                                      div->table, 2, 0x0);
> 
> Is this correct?  divider_round_rate() can return a negative error code
> (from divider_ro_determine_rate()), which is not handled here?
> 
> Looks like several other users of divider_round_rate() use this
> same logic, and thus are affected, too.

Thanks for the review! You are correct that this is a bug.

I had planned once round_rate is removed from the clk core to post a
series to remove divider_round_rate() and divider_ro_round_rate() (plus
the _parent functions) since they call the corresponding determine_rate
functions. I'll bump that up on my todo list this week.

Brian

