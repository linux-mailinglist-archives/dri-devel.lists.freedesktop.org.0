Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 944373FE828
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 05:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2A96E420;
	Thu,  2 Sep 2021 03:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D866E420;
 Thu,  2 Sep 2021 03:46:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 207E461041;
 Thu,  2 Sep 2021 03:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630554396;
 bh=/8DW5SDT/Ey58NWCYefeAXYVgJQH1XZS90QfyYkPXso=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=NWPNYXYrInATmspjofKaT83KWCK/PEHYOHcB+VO/cDJSgmHxTb/BnIBdrUvgfTcsw
 HjT5EgNGxuwTRwvJjhBRXgdt//YCYXBp7mw4Lbh3m5UjjWDv16CQTyV3IcUYnvEQCK
 3N72BjOGAzm9nRc6bokowrW73SKQ7KyXsYNjaDdTF8x90M5If0Ae8ZtOfCBt0G+oqu
 ZMCtAMfSjpI1PPAaMTQoQU3KitqgkYemAioqGYeaL6icGrYSJf1g9LFRsILRBVJ02+
 FYInXNpGnz3uewtvj3VZeMMclEP9qYs+G3BPX+XFWE5gkMwBvJznVO/WMDeTl6jfWY
 1aOR6IMM5Ekww==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YS9Aa0tADAf5KMSl@Marijn-Arch-PC.localdomain>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-3-marijn.suijten@somainline.org>
 <163047455623.42057.15513441659841056105@swboyd.mtv.corp.google.com>
 <YS9Aa0tADAf5KMSl@Marijn-Arch-PC.localdomain>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global
 "xo" clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To: Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 01 Sep 2021 20:46:34 -0700
Message-ID: <163055439497.405991.16122720273000010218@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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

Quoting Marijn Suijten (2021-09-01 01:57:15)
> On 2021-08-31 22:35:56, Stephen Boyd wrote:
> > Quoting Marijn Suijten (2021-08-30 11:24:45)
> > > The DSI PHY/PLL was relying on a global "xo" clock to be found, but t=
he
> > > real clock is named "xo_board" in the DT.  The standard nowadays is to
> > > never use global clock names anymore but require the firmware (DT) to
> > > provide every clock binding explicitly with .fw_name.  The DSI PLLs h=
ave
> > > since been converted to this mechanism (specifically 14nm for SDM660)
> > > and this transient clock can now be removed.
> > >=20
> > > This issue was originally discovered in:
> > > https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a=
1be96@somainline.org/
> > > and prevented the removal of "xo" at that time.
> > >=20
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> >=20
> > Presumably this wants to go with the first one.
>=20
> What are you referring to with "the first one"?  This patch can only go
> in after patch 1/2 of this series, unless you are suggesting to squash
> it with Bjorns cleanup and making sure that lands after the fix in the
> DSI?

The first patch in this series.
