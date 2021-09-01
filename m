Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C23FD2F9
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 07:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4A26E122;
	Wed,  1 Sep 2021 05:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9316E11C;
 Wed,  1 Sep 2021 05:35:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A69260F3A;
 Wed,  1 Sep 2021 05:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630474557;
 bh=ksxPtNuYubbYJ6aEkWBWuzz8xHMdSYMscQIeT1im6IA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ty0GJFSIcWgaBeKRXN4/6uAX4nYak0fxSLv9YsiCxQrOq79+KbqEd0zoNVkXvrZKS
 JHMUw+A2yt9SQuGiKpyKsZsfmXtWCPSolx5ojWtH2vkpV41ivnNuLOXPQBKdu6mMJk
 ctQFh2ju314ODOaTNG8f/rA20CAvCg55lT/BiD/wQiSX1GUJBX2vbT8HF1duftd5uV
 p9Od94iKZ66AHJ5UlKSWx+d5oRkSMiRiJcMsgV1pRMIkWS0jiGoHE5B5R5lpDFRKGw
 Hkcv8Ct2redDoA3wyGoP/1zbLDd/Yar5oewZM4lzlyOekLtVrhsdbP9mp50h7KzKL+
 9ZpRfmlhFXuWQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210830182445.167527-3-marijn.suijten@somainline.org>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-3-marijn.suijten@somainline.org>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc-sdm660: Remove transient global
 "xo" clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Martin Botka <martin.botka@somainline.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Pavel Dubrova <pashadubrova@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, Andy Gross <agross@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Jonathan Marek <jonathan@marek.ca>,
 Matthias Kaehlcke <mka@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
Date: Tue, 31 Aug 2021 22:35:56 -0700
Message-ID: <163047455623.42057.15513441659841056105@swboyd.mtv.corp.google.com>
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

Quoting Marijn Suijten (2021-08-30 11:24:45)
> The DSI PHY/PLL was relying on a global "xo" clock to be found, but the
> real clock is named "xo_board" in the DT.  The standard nowadays is to
> never use global clock names anymore but require the firmware (DT) to
> provide every clock binding explicitly with .fw_name.  The DSI PLLs have
> since been converted to this mechanism (specifically 14nm for SDM660)
> and this transient clock can now be removed.
>=20
> This issue was originally discovered in:
> https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be9=
6@somainline.org/
> and prevented the removal of "xo" at that time.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Presumably this wants to go with the first one.

Acked-by: Stephen Boyd <sboyd@kernel.org>
