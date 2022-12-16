Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED064EE9F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 17:09:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E16810E5EB;
	Fri, 16 Dec 2022 16:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F83110E5E8;
 Fri, 16 Dec 2022 16:09:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BA611CE1E67;
 Fri, 16 Dec 2022 16:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1AF5C433EF;
 Fri, 16 Dec 2022 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671206972;
 bh=Pd4cwhB/ZU6dBLtjwdLjnwes8/oi7QJg2yi0YsWb/s8=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=NtRD3VndI817OODNmbTpU841LM8EChnIpjTQ5bWsg1ipK9e6AjcPz2Iz5KNzoORgC
 if68KOtpvOquSNF8C/SwqZYQAWIH6g62XGFy+douxnxiTH28vAvIj+x/rXQp/n2y8f
 djEd4KOlkTbCGqzw6v50SaqoIx7pdkStQRIMpt0QH5++CFe8zSgQpoXXGctsStJomM
 6pePh3cpi2p2nAP8wYWhj+zzOHHD/1/o6h0zk7qTpFmkluFhpWPldlMKm1DBfvV2U3
 cYMV8/mNlEaUvGH9Q9dWrBGz7tdsxcYO1dssn0ksciG9rYWcG9mIa7E3grAD/lAg1M
 aoIyRmXyBeqPQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221215203751.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
References: <1671117062-26276-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221215203751.2.Ic128c1df50b7fc9a6b919932a3b41a799b5ed5e8@changeid>
Subject: Re: [PATCH 2/5] clk: qcom: gdsc: Support 'synced_poweroff' genpd flag
From: Stephen Boyd <sboyd@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org
Date: Fri, 16 Dec 2022 08:09:29 -0800
User-Agent: alot/0.10
Message-Id: <20221216160931.E1AF5C433EF@smtp.kernel.org>
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
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2022-12-15 07:10:58)
> Add support for the newly added 'synced_poweroff' genpd flag. This allows
> some clients (like adreno gpu driver) to request gdsc driver to ensure
> a votable gdsc (like gpucc cx gdsc) has collapsed at hardware.
>=20
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>=20
>  drivers/clk/qcom/gdsc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 9e4d6ce891aa..575019ba4768 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -136,7 +136,8 @@ static int gdsc_update_collapse_bit(struct gdsc *sc, =
bool val)
>         return 0;
>  }
> =20
> -static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
> +               bool force_sync)

Maybe just 'wait'? That matches kernel style and is short.
