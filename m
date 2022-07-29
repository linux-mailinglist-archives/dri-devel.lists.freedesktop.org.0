Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697158576E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 01:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B254410E21C;
	Fri, 29 Jul 2022 23:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AED810E0A9;
 Fri, 29 Jul 2022 23:47:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A9006194E;
 Fri, 29 Jul 2022 23:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4260C433C1;
 Fri, 29 Jul 2022 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659138432;
 bh=iXobB2v9U1JQBSFHCNTZcXFdVal0vAJP87SyEQP4Ecs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Qn2EZMoCBv+z+JCCiSG7AFWXXo6VULLglIhBmCyykVc1h9qAsWhfVtcgoaR2DJbbg
 PPo7KiPkCqMKtArMeUfJY68WJ1Gi7oc/cwcfoF9qHREKRrb84vjPvh/P59aF2T2mxJ
 rPuNjH9w+UBuxL/9hDdAHdhMUCpaT7LPL8cpLtaKRJXwgLXgHlMZTd+W5TKCfH58HS
 GG1MLfkdyYGfXOGzwMI5fdPsHwfLyi53XcGQR+Qa3h1JeC1VDDx0p35xADhnqQfy5Y
 yBKcXvffpLJX1lr6QhuWl+hN+/WNUfMgJT0jwEyvgblLer10UrocT/JMfZxLvkfLIz
 XVMhlYa37DfZw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220629225331.357308-2-marijn.suijten@somainline.org>
References: <20220629225331.357308-1-marijn.suijten@somainline.org>
 <20220629225331.357308-2-marijn.suijten@somainline.org>
Subject: Re: [PATCH v3 01/11] clk: divider: Introduce
 devm_clk_hw_register_divider_parent_hw()
From: Stephen Boyd <sboyd@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
Date: Fri, 29 Jul 2022 16:47:10 -0700
User-Agent: alot/0.10
Message-Id: <20220729234711.E4260C433C1@smtp.kernel.org>
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

Quoting Marijn Suijten (2022-06-29 15:53:21)
> Add the devres variant of clk_hw_register_divider_parent_hw() for
> registering a divider clock with clk_hw parent pointer instead of parent
> name.
>=20
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Applied to clk-next
