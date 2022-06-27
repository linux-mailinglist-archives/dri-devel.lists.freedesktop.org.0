Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073B55BC53
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ABA10E1C6;
	Mon, 27 Jun 2022 22:36:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBF510E161;
 Mon, 27 Jun 2022 22:36:08 +0000 (UTC)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl
 [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B36953F812;
 Tue, 28 Jun 2022 00:36:05 +0200 (CEST)
Date: Tue, 28 Jun 2022 00:36:03 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 03/11] clk: fixed-factor: Introduce
 *clk_hw_register_fixed_factor_parent_hw()
Message-ID: <20220627223603.5dxxbqqqjddkgdnb@SoMainline.org>
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-4-marijn.suijten@somainline.org>
 <CAA8EJpomtbN0+ocD2pRbkYriUY4D9OnjgoFzL9qNHhPm3Uz5cQ@mail.gmail.com>
 <20220609221211.684C1C34114@smtp.kernel.org>
 <20220610074632.abtec5kulbclund4@SoMainline.org>
 <20220610190112.1352DC34114@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610190112.1352DC34114@smtp.kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-06-10 12:01:10, Stephen Boyd wrote:
> Quoting Marijn Suijten (2022-06-10 00:46:32)
> > On 2022-06-09 15:12:09, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2022-06-02 03:20:19)
> > > > On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
> > > > <marijn.suijten@somainline.org> wrote:
> > > > > diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> > > > > index 54942d758ee6..fabb98d0cdb2 100644
> > > > > --- a/drivers/clk/clk-fixed-factor.c
> > > > > +++ b/drivers/clk/clk-fixed-factor.c
> > > > > @@ -148,17 +151,50 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
> > > > >                 const char *name, unsigned int index, unsigned long flags,
> > > > >                 unsigned int mult, unsigned int div)
> > > > >  {
> > > > > -       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, index,
> > > > > -                                             flags, mult, div, true);
> > > > > +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL,
> > > > > +                                             index, flags, mult, div, true);
> > > > 
> > > > Here (and several times later) you are inserting an argument and then
> > > > moving arguments to the next line. My slight preference would be to
> > > > just insert the arg (and maybe break the line if it gets too long) w/o
> > > > touching the next lines.
> > 
> > That'll definitely look odd, as we'll end up with index floating on a
> > single line, all on its own.
> 
> Pretty sure Dmitry is suggesting to make the line longer, not put the
> index on a line by itself. Ignore the 80-column limit.

There's a "(and maybe break the line if it gets too long)" in there, but
it's ugly especially for short (ie. "0,") arguments.  I'm following your
request to ignore 80-columns as a limit.

Will resend this after being able to physically build-test it tomorrow,
thanks!

- Marijn
