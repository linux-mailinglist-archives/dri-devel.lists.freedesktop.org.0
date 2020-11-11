Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4402AF13E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 13:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5378989E47;
	Wed, 11 Nov 2020 12:51:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0862E89E32
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 12:51:15 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFC9CA19;
 Wed, 11 Nov 2020 13:51:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1605099073;
 bh=03M0H/6Q0FicpBXAUeyVuY0edxiXRr6HBE6AiMF79ww=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ErHe2RL/x6Y/SPZxGetJaGeswP2lSlkaY4isAPzANK1DAIymBivHDOyzsuHP59fDZ
 sHd/cKPas4Hv3u2XzuJFSPt7896Z+LE9apQXOILg+13Q08uWmD9ikmuSIznDnEKS9u
 NFNOoqnq3djqrNj/ZFIjZgKwEitVGGPrcJeaXcIk=
Subject: Re: [PATCH] drm: rcar-du: Fix the return check of of_parse_phandle
 and of_find_device_by_node
To: Wang Xiaojun <wangxiaojun11@huawei.com>,
 laurent.pinchart@ideasonboard.com, airlied@linux.ie, daniel@ffwll.ch
References: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <360b40b7-cc94-0665-be5f-b18d992100f5@ideasonboard.com>
Date: Wed, 11 Nov 2020 12:51:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111031452.3659714-1-wangxiaojun11@huawei.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang Xiaojun,

On 11/11/2020 03:14, Wang Xiaojun wrote:
> of_parse_phandle and of_find_device_by_node may return NULL
> which cannot be checked by IS_ERR.

Indeed, both of these functions return either NULL or the correct value,
and no an errno.

> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> Reported-by: Hulk Robot <hulkci@huawei.com>

Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 72dda446355f..fcfddf7ad3f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -700,10 +700,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		int ret;
>  
>  		cmm = of_parse_phandle(np, "renesas,cmms", i);
> -		if (IS_ERR(cmm)) {
> +		if (!cmm) {
>  			dev_err(rcdu->dev,
>  				"Failed to parse 'renesas,cmms' property\n");
> -			return PTR_ERR(cmm);
> +			return -ENODEV;
>  		}
>  
>  		if (!of_device_is_available(cmm)) {
> @@ -713,10 +713,10 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  		}
>  
>  		pdev = of_find_device_by_node(cmm);
> -		if (IS_ERR(pdev)) {
> +		if (!pdev) {
>  			dev_err(rcdu->dev, "No device found for CMM%u\n", i);
>  			of_node_put(cmm);
> -			return PTR_ERR(pdev);
> +			return -ENODEV;
>  		}
>  
>  		of_node_put(cmm);
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
