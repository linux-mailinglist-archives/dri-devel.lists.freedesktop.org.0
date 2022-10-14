Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7855FEDF3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 14:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B61610E255;
	Fri, 14 Oct 2022 12:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Fri, 14 Oct 2022 12:23:00 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E72710EADA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 12:23:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EBBwK0019805;
 Fri, 14 Oct 2022 14:17:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=NayT1GMM1DNVglT/x/bBJmac0mOIXzmhJ93fnBTRgQw=;
 b=CthuGle6EAXZk3IUpv7Pm/1IgTbkyLJ08JU49BIVc7kJphHkqw0sYqGLf6mF4+aJbHYK
 KSoPBBTrl3sViKkdZw8xJs1LheoYS59P65iX/1YlYGEgjxFQvsjX5mfAYdFFU7r1ouSL
 iKa8H/v6Q6aNYcyNfVn7BrOnzyrWe/jsy9m0NI+etG8Kk+6+GZskLl/osV/g839IMTDF
 M8V4Ss/Gfu9qNg639snZsxUIIoCS+hTLIFsGU1Wjo2FkhN0/3ypu/v/fmwiifA5Ra6NI
 asMhRVWJ5+4UlP8jXchJtvyEeZPGQr95PMny1csunDFEICOGyNR3RcbeAYNgFoSYWmjn 7w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k5v4n8r1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 14:17:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3CB9310002A;
 Fri, 14 Oct 2022 14:17:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30E41228A4D;
 Fri, 14 Oct 2022 14:17:41 +0200 (CEST)
Received: from [10.48.0.201] (10.75.127.122) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 14:17:38 +0200
Message-ID: <93a77911-e9b2-d2e1-4fff-41f63c87376b@foss.st.com>
Date: Fri, 14 Oct 2022 14:17:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/stm: Fix resolution bitmasks
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <dri-devel@lists.freedesktop.org>
References: <20221011231048.505967-1-marex@denx.de>
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20221011231048.505967-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.122]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_06,2022-10-14_01,2022-06-22_01
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
Cc: Antonio Borneo <antonio.borneo@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Abriou <vincent.abriou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

thanks for the patch.

Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>

On 10/12/22 01:10, Marek Vasut wrote:
> STM32MP15xx RM0436 Rev 6 "35.7.3 LTDC synchronization size configuration
> register (LTDC_SSCR)" on page 1784 and onward indicates VSH and similar
> bits are all [11:0] instead of [10:0] wide. Fix this.
>
> [1] https://www.st.com/resource/en/reference_manual/DM00327659-.pdf
>
> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Antonio Borneo <antonio.borneo@foss.st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@foss.st.com>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
>   drivers/gpu/drm/stm/ltdc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 03c6becda795c..639ed00b44a57 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -111,16 +111,16 @@
>   #define LTDC_L1FPF1R	(ldev->caps.layer_regs[24])	/* L1 Flexible Pixel Format 1 */
>   
>   /* Bit definitions */
> -#define SSCR_VSH	GENMASK(10, 0)	/* Vertical Synchronization Height */
> +#define SSCR_VSH	GENMASK(11, 0)	/* Vertical Synchronization Height */
>   #define SSCR_HSW	GENMASK(27, 16)	/* Horizontal Synchronization Width */
>   
> -#define BPCR_AVBP	GENMASK(10, 0)	/* Accumulated Vertical Back Porch */
> +#define BPCR_AVBP	GENMASK(11, 0)	/* Accumulated Vertical Back Porch */
>   #define BPCR_AHBP	GENMASK(27, 16)	/* Accumulated Horizontal Back Porch */
>   
> -#define AWCR_AAH	GENMASK(10, 0)	/* Accumulated Active Height */
> +#define AWCR_AAH	GENMASK(11, 0)	/* Accumulated Active Height */
>   #define AWCR_AAW	GENMASK(27, 16)	/* Accumulated Active Width */
>   
> -#define TWCR_TOTALH	GENMASK(10, 0)	/* TOTAL Height */
> +#define TWCR_TOTALH	GENMASK(11, 0)	/* TOTAL Height */
>   #define TWCR_TOTALW	GENMASK(27, 16)	/* TOTAL Width */
>   
>   #define GCR_LTDCEN	BIT(0)		/* LTDC ENable */
