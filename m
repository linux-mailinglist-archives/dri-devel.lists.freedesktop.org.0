Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C51585765
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 01:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6BF10E712;
	Fri, 29 Jul 2022 23:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4CE10E29A;
 Fri, 29 Jul 2022 23:41:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0A36DB829E0;
 Fri, 29 Jul 2022 23:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1F9C433D7;
 Fri, 29 Jul 2022 23:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659138081;
 bh=4+EkarCy89gK1+2w7AQftCu8+S5fGMb83z7dEUIiXOE=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=GOZWVzk7d3J6nYjVSRz85NkTzdsL6jKyMZUilc9VqjdvCxKp2asJ9swXC7v6c2aUG
 TFVUv989BaI2SbUoKdqN1h5Lu4uWz1v2O4UYZyMIj/MkN2ZXQfioqAdQ4YCC3jde7f
 KHmpNY9al8F3CxJtCaNR0gIMxoGgE2D8AgFQmb9RTmT/1SN83FmJwsP7wnIBnQtYcM
 lqIDPSrw5gjsM1wcDf1Qw0WUB2xzKK+JStxtOeMF8oJtBFHGY8BKo9hQtJ8lADzyuJ
 B+fnHDmRi4wCVWQuF1z7Zexou7RWP27IKr8obtOyY7lqF9O/2TcGVOB6ouiAPZoqkt
 QrSOhfsc2LlZQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <192c5f16-8415-dfa1-39d2-8b404553ecd7@linaro.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
 <192c5f16-8415-dfa1-39d2-8b404553ecd7@linaro.org>
Subject: Re: [PATCH v3 00/11] drm/msm/dsi_phy: Replace parent names with
 clk_hw pointers
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Date: Fri, 29 Jul 2022 16:41:19 -0700
User-Agent: alot/0.10
Message-Id: <20220729234121.9F1F9C433D7@smtp.kernel.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-14 03:19:12)
> On 30/06/2022 01:53, Marijn Suijten wrote:
> > Marijn Suijten (11):
> >    clk: divider: Introduce devm_clk_hw_register_divider_parent_hw()
> >    clk: mux: Introduce devm_clk_hw_register_mux_parent_hws()
> >    clk: fixed-factor: Introduce *clk_hw_register_fixed_factor_parent_hw=
()
>=20
> Stephen, do we stand a chance of landing patches 1-3 into 5.20? We would =

> like to merge the series into 5.21 through the msm-next. Landing clk=20
> patches in 5.20 would save us from using immutable branches, etc.
>=20

Sure I can land the first three patches now for 5.20
