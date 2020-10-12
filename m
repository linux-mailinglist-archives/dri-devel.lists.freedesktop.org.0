Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E13D28B494
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 14:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5361D6E436;
	Mon, 12 Oct 2020 12:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9ED6E436
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:25:44 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201012122542epoutp0416d6c871680641b223054af08426c9ed~9Pkzps-KT1309513095epoutp04Z
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 12:25:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201012122542epoutp0416d6c871680641b223054af08426c9ed~9Pkzps-KT1309513095epoutp04Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1602505542;
 bh=L11dY+TbnuLdkp3zTMtz5IJV/+Tv+vt9CaJFX1fcQjU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=XJOW/NlQABo4OdFKtbTh4mZw1eBO5igr+UVLIhcumr6wgg7Bm0SyIBYH05YBeOHfq
 km0tWpkBjQqDIMarF4H6+Vq6SnDEBITyzzbjahRlH0FYr0r3YiT0pilMNQsXVg4Q+O
 oSUWMXZYy/xUIs0ZtfhqsID9IAr0M4zLLENwaSAk=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201012122541epcas1p244786d3f61f54863c46f267656cb9f79~9PkyyyF-d0803808038epcas1p2N;
 Mon, 12 Oct 2020 12:25:41 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4C8yZB43gZzMqYlr; Mon, 12 Oct
 2020 12:25:38 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1E.7B.09577.24B448F5; Mon, 12 Oct 2020 21:25:38 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20201012122538epcas1p3d2174aaaa388d78a53b20a614dd3f932~9PkvgCAcu2812428124epcas1p34;
 Mon, 12 Oct 2020 12:25:38 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201012122537epsmtrp277cb61a4137809143b9bffe9d9a23ecd~9Pkve9ifD0659706597epsmtrp2Y;
 Mon, 12 Oct 2020 12:25:37 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-60-5f844b424871
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 66.24.08745.14B448F5; Mon, 12 Oct 2020 21:25:37 +0900 (KST)
Received: from [10.113.111.64] (unknown [10.113.111.64]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201012122537epsmtip27c7f754c524cad4824b1c18c5ecfadc5~9Pku-OY8a1078310783epsmtip2h;
 Mon, 12 Oct 2020 12:25:37 +0000 (GMT)
Subject: Re: [PATCH 1/4] drm/vc4: kms: Split the HVS muxing check in a
 separate function
To: Maxime Ripard <maxime@cerno.tech>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Eric Anholt <eric@anholt.net>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <7dd0013d-b78b-7338-968f-0c42264bb940@samsung.com>
Date: Mon, 12 Oct 2020 21:25:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201008112519.43691-1-maxime@cerno.tech>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc997fS0g+ATRO+IEamaHWqBi5aGWGcHtTZzhR5ZlRNd19A1I
 f66vRcRkQwTi+DFXBRlFwCEEIaAMOigEJr/kx2AwhoFQYWzIpggIE1G3RV3Lw4z/Pvec77nf
 c+7N4aGuqVwPXrxaT+vUMiUfd8TqO3x8hYfCUqX+XW2QzB7oRcjq7FsYWd5/HSXnC69iZHHn
 AIe8vbyAk61nhgGZP/cSJxfKM3Cy9u4IhzTeqeGS3/71PUaWjQ4h5DfPXgDyunUWJ9NaOrmk
 pagNkFO5k4A0zxk5B92olIUunKoqqgKUafInnBofGMSpRtMEl7raPINQtZVf4lTDk984VFFv
 BDWZ2Y1QdaVfUGm3/sGor8yVgKrrO00t1W4NXx+tOBBHy+S0zotWx2jk8epYCT8sShoiFe/1
 FwlFQWQg30stU9ESfujRcOHb8UrbxHyvBJnSYAuFyxiG7xd8QKcx6GmvOA2jl/BprVypDdL6
 MjIVY1DH+sZoVPtE/v67xTbhx4q4npoJRDvikjhXcZGTDEacMoADDxJ74KXWa4idXQkLgGXn
 w1l+BOCVPCwDONp4CcCumkzwqiA9vwSwiSYA7+cacfYwD2BL+ROuXeVGRMPxH6xce2IjMY3A
 0rtLKyUokYPC2kIzblfhhBAuZ42umDsTwXDG2oTaGSPegD3LcyvsTnwIG/+Y4bKaDbA3fxqz
 swMRCGebi1Z6QglP2DB/GWV5M7ROFyN2M0jccIDNWc9WGw+Fj1+0cVl2gw+6zavsAZcetuAs
 M/B2/gOMLU4G8LyxYFUUAG+WXbTdyrM5+MAbTX5s2Bs2/lu42oQLfLicxbFLIOEMz6W7spLt
 8M/kVg7LW+CP2eUIyxQ0P03DvwbepjWjmdaMY1ozjul/4ysAqwSbaC2jiqUZkVa89rtrwco6
 7AiygLz5Rd92gPBAO4A8lL/ReUCQInV1lstOJdE6jVRnUNJMOxDbHtuIerjHaGz7pNZLReLd
 AQEB5B7RXrFIxN/s/LvVS+pKxMr0tIKmtbTuVR3Cc/BIRgSWnupzY3GbptS5Pto7CS7yqLZd
 gpP3JZeKp9rqjg5H5n20bSTSPJj0psd+Q+onJ3WNgUENAkMotf1C1AaZjydHP77wqwp5P4d0
 HC4YjJB4d9SXnI6cm3Wq4CQMb/U3lq0zHh5S5D1v6fulfiSnQ77F7b3Ea4d585yCSPOZQIvf
 YknMVEWfKXC/MiVEVfpdIyds58+LaHpVtujp2KP17gUR0hPrhniTFknWZcH0zaToHoXVqZ/6
 9O88S/zje+9g+7qOfVCGnlW+K/CsfmusWcI9fsg4dWI8cWZil/Dz6OM67DPhtul+6+sXYg8y
 r40SUc/r7rl1v0RPHQnZmXm289iRhGA+xsTJRDtQHSP7D/utTB2XBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzH932e5557unY87tC3sqzDbDdO+VFfRmTM48dGxlBWbjzKXLnd
 I6SNnPw6HSLWPepSIg6N67hwot9dOEOu6YdLZa1VTiyzZsVTbP33+uz9fn0+/3woXNZBBFB7
 kvazuiS1RkFKiEeViqmzI9emx4XYhkKR0eXE0D1jNYGKXhXjqC/3OoHyqlwi1DDgJdGLY+8B
 MvUOk8hbZCCRtcMtQpnN98Uov/8hgW40vsVQ9q8hgIqbekh04lmVGJWaywFqv+wByNabKVom
 Z/TeGpK5a74LGN7zmmRaXG9I5jHfKmauO7oxxmo5QzL2n20ixuyMYjxnazGmpPAoc6J6kGDO
 2SyAKXmZyvywBm0YHy1ZvIvV7DnA6uZE7JAk1N1vxbTucYd6b18SpQG3rwH4UJCeD0+aCoAB
 SCgZXQpgtlkYhGAKtJy3iQyA+styWFnJjXZ6ABz6OiwWOnI6GraUNYmFYCLdiUHe1UkKA05f
 wWF1eT02qhgAfN1RPLKWpGfDgYxGTGApHQG7m57gAhP0DFg30IsL5ybR2+Dj0oWjlQnQaeok
 BPahw2GPwzyyBqfDoLnkMz7KU6G9L+cf+8GmzjzsApDxY3R+jMKPUfgxyjVAWIA/q+US4xO5
 UO3cJPagilMncslJ8aqd+xKtYOQPlMpS4LB8U1UAjAIVAFK4YqLUNVMfJ5PuUqccZnX74nTJ
 GparAIEUofCTDvD5sTI6Xr2f3cuyWlb3P8Uon4A0bNpFTar8ifGTf1b/7uzp0i3fjefk9geZ
 ypDQ9Er5zWDXcOa6Z9YXUUfTfmZczfCzEKvL2g4HTX4aXvTUE+3d+qarIWt3grGkq53u1233
 bg4+f21ru/+gN9JwhC9AWN5KG+ncGPXF6Fj/NpzYdKrlVDuK8ZsX7L9wsNAeo9emfYlZ0pPT
 HPk1ROX8aFmyyL5GebYt993QSverPrDK5Ci/E6beHtFflmKbr7mz7cKl8GXOY3Pmbby4NHDV
 XNGD5m9VqctVM+pD4naGKSS3Yo/HYM8X5wY2nHan61ccMdW2evSOqgW/Y6X1dRtyxtXXiGZy
 H7DCWT8k0yZpfJNPh3X0BeXSCoJLUIcqcR2n/gNUPFHldgMAAA==
X-CMS-MailID: 20201012122538epcas1p3d2174aaaa388d78a53b20a614dd3f932
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201008112530epcas1p30d837c7b03283651c988a2177558e376
References: <CGME20201008112530epcas1p30d837c7b03283651c988a2177558e376@epcas1p3.samsung.com>
 <20201008112519.43691-1-maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 =?UTF-8?B?64KY7ISx6rWt?= <sungguk.na@samsung.com>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 10/8/20 8:25 PM, Maxime Ripard wrote:
> The code that assigns HVS channels during atomic_check is starting to grow
> a bit big, let's move it into a separate function.
>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Thanks for this patch set, I checked all patches well works.

All patches:

Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>

Best regards,
Hoegeun

> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index 149825ff5df8..846fe8b3cb7a 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -612,13 +612,13 @@ static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
>   #define NUM_OUTPUTS  6
>   #define NUM_CHANNELS 3
>   
> -static int
> -vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> +static int vc4_pv_muxing_atomic_check(struct drm_device *dev,
> +				      struct drm_atomic_state *state)
>   {
>   	unsigned long unassigned_channels = GENMASK(NUM_CHANNELS - 1, 0);
>   	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
>   	struct drm_crtc *crtc;
> -	int i, ret;
> +	unsigned int i;
>   
>   	/*
>   	 * Since the HVS FIFOs are shared across all the pixelvalves and
> @@ -691,6 +691,18 @@ vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
>   		}
>   	}
>   
> +	return 0;
> +}
> +
> +static int
> +vc4_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
> +{
> +	int ret;
> +
> +	ret = vc4_pv_muxing_atomic_check(dev, state);
> +	if (ret)
> +		return ret;
> +
>   	ret = vc4_ctm_atomic_check(dev, state);
>   	if (ret < 0)
>   		return ret;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
