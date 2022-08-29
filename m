Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC735A5725
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 00:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0401A10F539;
	Mon, 29 Aug 2022 22:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C563F10F533;
 Mon, 29 Aug 2022 22:30:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0171B8159F;
 Mon, 29 Aug 2022 22:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A49CC433C1;
 Mon, 29 Aug 2022 22:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661812235;
 bh=XR4jQathTB6ZptuH+sL9t6uDcotuMvsfdYzhSPZG6gI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=R+WH0iPW9Zf1owPKGWvfw9Bm6hcGCZ1ybMoBzojSSsUvC4/ER0vvqTcP5EssPuV0v
 d16cqYHuosEVZK1krOIeion/MiZ7Dn1mTyMlR/hdnfAfyEhehy5PSc8ts6YdJoK2wu
 WikLN8F4DoVnPVV7NNipLykUvmKTzqbqoGcTZWroN2NRtWMqi4CuyklZ9bq+91gbvy
 HtM5WSn3PkOc908fgiFmh7JiyQx+R6HxpBakqwJM9y1gdgpokvQyADg/rR/EDv09do
 6knZvPQ1M95yI5qT2/MpxX6yAgw6Xx+OAl69ImLTKYa7jBy29/E24HVgSI2yqiYzyZ
 Gp92yAP0lDLzA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v5 0/6] clk/qcom: Support gdsc collapse polling using
 'reset' interface
From: Stephen Boyd <sboyd@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Date: Mon, 29 Aug 2022 15:30:33 -0700
User-Agent: alot/0.10
Message-Id: <20220829223035.5A49CC433C1@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 krzysztof.kozlowski@linaro.org, Andy Gross <agross@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Philipp

Quoting Akhil P Oommen (2022-08-28 12:21:13)
>=20
> Some clients like adreno gpu driver would like to ensure that its gdsc
> is collapsed at hardware during a gpu reset sequence. This is because it
> has a votable gdsc which could be ON due to a vote from another subsystem
> like tz, hyp etc or due to an internal hardware signal. To allow
> this, gpucc driver can expose an interface to the client driver using
> reset framework. Using this the client driver can trigger a polling within
> the gdsc driver.

Please include the reset maintainer on reset related patches.

-Stephen

>=20
> This series is rebased on top of linus's master branch.
>=20
> Related discussion: https://patchwork.freedesktop.org/patch/493144/
>=20
> Changes in v5:
> - Nit: Remove a duplicate blank line (Krzysztof)
>=20
> Changes in v4:
> - Update gpu dt-binding schema
> - Typo fix in commit text
>=20
> Changes in v3:
> - Use pointer to const for "struct qcom_reset_ops" in qcom_reset_map (Krz=
ysztof)
>=20
> Changes in v2:
> - Return error when a particular custom reset op is not implemented. (Dmi=
try)
>=20
> Akhil P Oommen (6):
>   dt-bindings: clk: qcom: Support gpu cx gdsc reset
>   clk: qcom: Allow custom reset ops
>   clk: qcom: gdsc: Add a reset op to poll gdsc collapse
>   clk: qcom: gpucc-sc7280: Add cx collapse reset support
>   dt-bindings: drm/msm/gpu: Add optional resets
>   arm64: dts: qcom: sc7280: Add Reset support for gpu
>=20
>  .../devicetree/bindings/display/msm/gpu.yaml       |  6 +++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +++
>  drivers/clk/qcom/gdsc.c                            | 23 ++++++++++++++--=
--
>  drivers/clk/qcom/gdsc.h                            |  7 ++++++
>  drivers/clk/qcom/gpucc-sc7280.c                    | 10 ++++++++
>  drivers/clk/qcom/reset.c                           | 27 ++++++++++++++++=
++++++
>  drivers/clk/qcom/reset.h                           |  8 +++++++
>  include/dt-bindings/clock/qcom,gpucc-sc7280.h      |  3 +++
>  8 files changed, 83 insertions(+), 4 deletions(-)
