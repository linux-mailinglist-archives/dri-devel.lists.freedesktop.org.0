Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7A717FDA
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 14:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22B5510E1C5;
	Wed, 31 May 2023 12:23:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A0010E1C5
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:23:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34V8vGVY012865; Wed, 31 May 2023 14:23:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=f/4V+3ywcAJTl9+Rz8L8N43LFhDVxFDBScrS7zYm3+Q=;
 b=ceITOanTGnl+bZkJBzk11F9bDED2a1fxEu8JFfvAl1LOwv7hfrGUo320mMVy5Ve5MYtL
 2z5joZhGREfc1euWlM6p+YvltXDxpk/o4Wto8YKabpD6wtiz1qDo9/XFZcewQhS67HLF
 vXnT3A3uCEb/GukNToMye2aewsnlAth+w7KgAbNdcMB1OkSAxB3365zpAaI7k92VL2kz
 gxzdbvOhsho21YR6IWiuP59dqPNNYlxxKC7dmgTIzqPiUEQrnNFM1mih4si7G7Zcoh5O
 yP+g9tXSnd0ehULbcMgKnq83QBQkYl80uBCy05HQwB6Fw6EqXlMrqFOBmhcc1KsI7VPN iA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx3671dth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 14:23:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BACE010002A;
 Wed, 31 May 2023 14:23:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A65E0233C8E;
 Wed, 31 May 2023 14:23:03 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 31 May
 2023 14:23:03 +0200
Message-ID: <421ecc95-413d-71c3-36e3-abc8da9db316@foss.st.com>
Date: Wed, 31 May 2023 14:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/stm: ltdc: check memory returned by devm_kzalloc()
Content-Language: en-US
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 <yannick.fertre@foss.st.com>, <philippe.cornu@foss.st.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>
References: <20230531072854.142629-1-claudiu.beznea@microchip.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230531072854.142629-1-claudiu.beznea@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_01,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/31/23 09:28, Claudiu Beznea wrote:
> devm_kzalloc() can fail and return NULL pointer. Check its return status.
> Identified with Coccinelle (kmerr.cocci script).
>
> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>
> Hi,
Hi Claudiu
>
> This has been addressed using kmerr.cocci script proposed for update
> at [1].
>
> Thank you,
> Claudiu Beznea
>
> [1] https://lore.kernel.org/all/20230530074044.1603426-1-claudiu.beznea@microchip.com/
>
>  drivers/gpu/drm/stm/ltdc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 03c6becda795..9f3ac54d4cb3 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1579,6 +1579,8 @@ static struct drm_plane *ltdc_plane_create(struct drm_device *ddev,
>  			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_sp) +
>  			       ARRAY_SIZE(ltdc_drm_fmt_ycbcr_fp)) *
>  			       sizeof(*formats), GFP_KERNEL);
> +	if (!formats)
> +		return NULL;
>  
>  	for (i = 0; i < ldev->caps.pix_fmt_nb; i++) {
>  		drm_fmt = ldev->caps.pix_fmt_drm[i];


Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

Thanks for your patch.

Cheers,
Raphaël G.-P.

