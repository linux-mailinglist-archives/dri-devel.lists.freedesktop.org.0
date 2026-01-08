Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9EDD02616
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C6210E282;
	Thu,  8 Jan 2026 11:28:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ThLzjdMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB9210E282
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:28:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 28BCB6012A;
 Thu,  8 Jan 2026 11:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAC0C16AAE;
 Thu,  8 Jan 2026 11:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767871697;
 bh=3Kjhp0b3kwImrDL2L6LwF5n2i36fqNua3dzRnbIjReU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ThLzjdMelW930c+ei43cTLAinWpByX4H/unWusBtDJx67SVViBKH2HJp4NN6pfDNJ
 S0o7hNKCFpHN/OgGfD6igSGlJ+DPmag7+/e0kTpckOhnpH4/JEH0gfkDq+GHZ7SxYn
 sTyyqEFxobiUx11gdTDahJHp0S7VvuoNQkGG/Ur1aZa0Y+nB3xQm4Fkmv34B6GL8QO
 Nq7K/rJN9iNmi7PHXBbpiP7k8HzQKFH8gMdUHColDMn4ALEVUyYXDEC8klO5AsygFp
 YxojfWXoN1bQ6FS99fp0EAppdIAS45JOYnyHidAfSv8R/GxlvUu1OujF92bEY8vZHy
 1hh01tlZp1NfA==
Date: Thu, 8 Jan 2026 11:28:10 +0000
From: Daniel Thompson <danielt@kernel.org>
To: =?iso-8859-1?B?QmFybmFi4XMgQ3rpbeFu?= <barnabas.czeman@mainlining.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
 Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
 Eugene Lepshy <fekz115@gmail.com>, Gianluca Boiano <morf3089@gmail.com>,
 Alejandro Tafalla <atafalla@dnyon.com>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/7] backlight: qcom-wled: Support ovp values for
 PMI8994
Message-ID: <aV-UyhP7wllSBpYj@aspen.lan>
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260108-pmi8950-wled-v2-2-8687f23147d7@mainlining.org>
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

On Thu, Jan 08, 2026 at 04:43:20AM +0100, Barnabás Czémán wrote:
> WLED4 found in PMI8994 supports different ovp values.
>
> Fixes: 6fc632d3e3e0 ("video: backlight: qcom-wled: Add PMI8994 compatible")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 41 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index a63bb42c8f8b..5decbd39b789 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1244,6 +1244,15 @@ static const struct wled_var_cfg wled4_ovp_cfg = {
>  	.size = ARRAY_SIZE(wled4_ovp_values),
>  };
>
> +static const u32 pmi8994_wled_ovp_values[] = {
> +	31000, 29500, 19400, 17800,
> +};
> +
> +static const struct wled_var_cfg pmi8994_wled_ovp_cfg = {
> +	.values = pmi8994_wled_ovp_values,
> +	.size = ARRAY_SIZE(pmi8994_wled_ovp_values),
> +};
> +

Do these *have* to be named after one of the two PMICs that implement
this OVP range.

Would something like wled4_alternative_ovp_values[] (and the same
throughout the patch) be more descriptive?


Daniel.
