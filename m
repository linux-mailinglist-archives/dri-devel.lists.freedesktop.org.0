Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB7931455
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 14:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320AB10E376;
	Mon, 15 Jul 2024 12:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GQO/vgss";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896C110E376
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2024 12:34:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C9B1160DFD;
 Mon, 15 Jul 2024 12:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754F1C32782;
 Mon, 15 Jul 2024 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721046840;
 bh=kyfiwzoOkf5rEaYCmxUuypkvZ9dgsE17Q+IbBZDwcG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GQO/vgsseRuBpH9eZBnORw/lW+hVW0n5669ElLZfyhsu5uiNWZ2+cB/0+vbnw61A+
 wcPzqSSuPJ68fWKdLcfbpxa58laQ4P6zeTyyzNFBE7QeB0RhCQqfIdgf5py9VgRtzo
 zPHkZ5/vz4DiGnhqzMR6VHfQy/Ku+ym3tx8tMEV12PgDz1/0vPBMS3lfZ9Cb5Ksims
 qz1jMCmpbgLsJOXthBtjPjTKDzO5xzRhjkY65YyQuwvhkJRsIO2z6W60lBUIRiD4TU
 G8CR5/B7zdfFmbdVsbpnpNP0GJUuCJjOBeIHTvx55axOyRlSsVqlNBgtbpUDoSWoh3
 GhGfkI0kTFb4A==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1sTKty-000000000OY-2J5a;
 Mon, 15 Jul 2024 14:33:58 +0200
Date: Mon, 15 Jul 2024 14:33:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: x1e80100-crd: Fix backlight
Message-ID: <ZpUXNmrs2nfViUeP@hovoldconsulting.com>
References: <20240715-x1e80100-crd-backlight-v2-0-31b7f2f658a3@linaro.org>
 <20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715-x1e80100-crd-backlight-v2-3-31b7f2f658a3@linaro.org>
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

On Mon, Jul 15, 2024 at 02:15:39PM +0200, Stephan Gerhold wrote:
> The backlight does not work correctly with the current display panel
> configuration: It works after boot, but once the display gets disabled it
> is not possible to get it back on. It turns out that the ATNA45AF01 panel
> needs exactly the same non-standard power sequence as implemented by the
> panel-samsung-atna33xc20 driver for sc7180-trogdor-homestar.
> 
> Switch the panel in the DT to the new compatible and make two more changes
> to make it work correctly:
> 
>  1. Add the missing GPIO for the panel EL_ON3 line (EDP_BL_EN on CRD and
>     enable-gpios in the DT).
>  2. Drop the regulator-always-on for the panel regulator. The panel does
>     not seem to power off properly if the regulator stays on.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---
> This can be applied as fix for 6.11 since the driver works as-is with the
> fallback compatible. If so, the defconfig patch should ideally also go
> there to ensure people actually have the driver enabled.

Verified that I can change the brightness setting and that the backlight
comes on again after being turned off (e.g. at suspend):

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
