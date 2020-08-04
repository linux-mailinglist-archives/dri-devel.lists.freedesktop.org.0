Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FE523BA1C
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 14:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6D86E045;
	Tue,  4 Aug 2020 12:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646CC6E045;
 Tue,  4 Aug 2020 12:09:51 +0000 (UTC)
Received: from localhost (unknown [122.171.202.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E70462177B;
 Tue,  4 Aug 2020 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596542990;
 bh=gey3esvl8wxAFJQ2OBCATSygwLbCiyTXxmuo4omuQjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZZOJqEZ7ULpCVvpaR+mEa6S1b07HmtrWcayO6oiJVvACUiM9YU99kR+7yCx509uj+
 PqVDfLqST8/x5f9kYzlfz0llp8qz2n58fvd10CVoYrBGEspn96gmX4MXk1wNHuwGG3
 oWqka7+RyZxNSFDocwiL3Av/TJINQWNRcXQbUhdc=
Date: Tue, 4 Aug 2020 17:39:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
Message-ID: <20200804120946.GQ12965@vkoul-mobl>
References: <20200726111215.22361-1-konradybcio@gmail.com>
 <20200726111215.22361-5-konradybcio@gmail.com>
 <20200803110016.GL12965@vkoul-mobl>
 <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtW29BtJPq1xDEtvtkPHFVWEd_QJk5FpJEQPbmofnS64Q@mail.gmail.com>
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk <linux-clk@vger.kernel.org>,
 Konrad Dybcio <konradybcio@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 martin.botka1@gmail.com, Andy Gross <agross@kernel.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 Harigovindan P <harigovi@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03-08-20, 09:06, Rob Clark wrote:
> On Mon, Aug 3, 2020 at 4:00 AM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 26-07-20, 13:12, Konrad Dybcio wrote:
> > > These SoCs make use of the 14nm phy, but at different
> > > addresses than other 14nm units.
> > >
> > > Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> > > ---
> > >  .../devicetree/bindings/display/msm/dsi.txt    |  1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
> > >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
> >
> > Is there a reason why dsi phy needs to be here and not in phy subsystem
> > drivers/phy/ ?
> 
> *maybe* it would be possible to split out all of the dsi (and hdmi)
> phy to drivers/phy.  But splitting out just the new ones wouldn't be
> practical (it would duplicate a lot of code, and make the rest of the
> dsi code have to deal with both cases).  And unlike dp/usb-c I'm not
> really sure I see an advantage to justify the churn.

So the question would be if it helps in reuse if we do that and does it
result in a better solution than dsi code managing the phy. The
advantage of framework (like phy) is that different subsystems can use
a (phy) driver and common framework helps reduce duplicates.

Yes sure the question was not for a new phy but about the whole
msm/dsi/phy code and future for it.

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
