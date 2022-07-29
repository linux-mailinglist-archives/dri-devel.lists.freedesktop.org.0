Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C972585775
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 01:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E610E5D1;
	Fri, 29 Jul 2022 23:47:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E319810E5D1;
 Fri, 29 Jul 2022 23:47:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 90ECEB829DF;
 Fri, 29 Jul 2022 23:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B2BC433C1;
 Fri, 29 Jul 2022 23:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659138453;
 bh=/9DF8fECnYB2+1mLIbUvSwsHWSZQ5617h3wGyODKus8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=fqV5DmyDyd/aGpJgkOZ/bQqpUmg7EmyY3RJtSPfzOdVhubYVxYltZRzxi1g9bC0z3
 TaP41Cy7lC1/xcQdB3AQxl0l6oNXCV+61kLOJ28dzakZV+I0WbpbZLq6+ej3KAZyhr
 73UrXVNSZ9KEVGVZHbQTzPtm94Dzw8ySEwV13Xq5eps2Y/Z0KKje9wHs+b91XRWNQ1
 n2tt3rZOQ/KwwhrYKdCbDdCrfWyP8ckuphBLaUG48VE+hDNDML9ipA1A3z8dwYD+uS
 c4LMaWk8LVdJRdkFn71x5EWsCtx/94Jic47f2wfDlUwEclUIisgDBWis5TzIPsWG/4
 EMk6GTq0TnSgw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220629225331.357308-4-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
 <20220629225331.357308-4-marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 03/11] clk: fixed-factor: Introduce
 *clk_hw_register_fixed_factor_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Date: Fri, 29 Jul 2022 16:47:31 -0700
User-Agent: alot/0.10
Message-Id: <20220729234733.36B2BC433C1@smtp.kernel.org>
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
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Marijn Suijten (2022-06-29 15:53:23)
> Add the devres and non-devres variant of
> clk_hw_register_fixed_factor_parent_hw() for registering a fixed factor
> clock with clk_hw parent pointer instead of parent name.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Applied to clk-next
