Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE0A77704
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 10:58:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B498010E51E;
	Tue,  1 Apr 2025 08:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YPHaS3Yp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F5510E51E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 08:58:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7888161138;
 Tue,  1 Apr 2025 08:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D917AC4CEE4;
 Tue,  1 Apr 2025 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743497900;
 bh=t936lpg6lmBc/X8Bym05vY2nu5vTXDbTMcpPetbLpEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YPHaS3Ypb7ttO4k2FKtQOY6hFUF11P11Sx6s3zsZItIYqfsCfnMS/cwVM5ME1CTal
 NtEQPyAGqdG+U6pEMAyTv/g4P7gIKsT3k8VjHVyVFesBtw634TZARcIXqUswn19sAr
 bLCv8Wl13ies/KHRzLspJR+bvN8LowMRzI9ezi+k+iLsZK/MjPBVJTfaGdkLZjHrwp
 2gRc13j+KMEdVQwKaozA+zi/HxDe/odLlRQG+sL4hV0fJkfkmRFQebl0XLmgpc8wMZ
 IPPkOICZIHgyRtcwaer0oal9dZrXEGb5ur246E4jn9hNP+Y7FS64oIikvusN0gGTar
 9Duk3C0WY+ENQ==
Date: Tue, 1 Apr 2025 09:58:15 +0100
From: Daniel Thompson <danielt@kernel.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Markus.Elfring@web.de, lee@kernel.org, jingoohan1@gmail.com,
 deller@gmx.de, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3] backlight: pm8941: Add NULL check in wled_configure()
Message-ID: <Z-uqpxcge0J99IPI@aspen.lan>
References: <d5f2aa49-27e2-4cc1-91be-4e195ed5249e@web.de>
 <20250401082950.21698-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401082950.21698-1-bsdhenrymartin@gmail.com>
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

On Tue, Apr 01, 2025 at 04:29:50PM +0800, Henry Martin wrote:
> The function wled_configure() uses devm_kasprintf() without checking for
> allocation failures, which could lead to NULL pointer dereferences.
>
> Add proper error handling when devm_kasprintf() fails by:
> - Returning -ENOMEM immediately
> - Ensuring no resources are left allocated (none need cleanup in this case)

Two things have gone wrong here:

1. This patch has been incorrectly posted with the wrong patch number.
2. You've let Markus bully you into adding some pointless text in the
   patch description ;-). I think the original v3 was better worded.
   IMHO the bulleted list adds nothing useful.

When you get the chance please send a v4 of the patch so we can pick it
up without any confusion (I suspect it might be a week or two before
this gets pulled so clean mail threads help a lot). It's up to you but
I'd recommend keeping the original v3 wording and label it something
like:
V3 -> V4: No functional changes, just correcting the version number


Daniel.



>
> Fixes: f86b77583d88 ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> V2 -> V3: Fix commit message and verify proper error handling with
> resource cleanup.
> V1 -> V2: Fix commit message to use imperative mood and wrap lines to 75
> characters.
>
>  drivers/video/backlight/qcom-wled.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 9afe701b2a1b..a63bb42c8f8b 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1406,9 +1406,11 @@ static int wled_configure(struct wled *wled)
>  	wled->ctrl_addr = be32_to_cpu(*prop_addr);
>
>  	rc = of_property_read_string(dev->of_node, "label", &wled->name);
> -	if (rc)
> +	if (rc) {
>  		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
> -
> +		if (!wled->name)
> +			return -ENOMEM;
> +	}
>  	switch (wled->version) {
>  	case 3:
>  		u32_opts = wled3_opts;
> --
> 2.34.1
>
