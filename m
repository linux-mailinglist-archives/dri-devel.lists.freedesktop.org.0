Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C556E0F16
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 15:45:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7047B10E17E;
	Thu, 13 Apr 2023 13:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2371 seconds by postgrey-1.36 at gabe;
 Thu, 13 Apr 2023 13:45:22 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5748810E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 13:45:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33D9R7j0016008; Thu, 13 Apr 2023 15:05:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fV8X/jR840R+J8jRG+/wDOQExdy42LB4fTNQAvYUlkA=;
 b=paB8uU8oahuqvLfLu5n6ygwrZegvxs4PYDxEKLDQwhECPRUlH9WUP6qhW5DFgaV3IsOY
 5d2o9U/x58IQSIeKL6z9UlKVC4+1n7bwOQLWOtlWq4S3eKmFlQrbaxXyrKNsJpzu//Xn
 BHIs1HfJl+cnZmUHmwiT4wOK7x9nUk67hYYQ4ucTIcEDiG34vckcgkp6/hYQk8jR7NPJ
 lgfFNJtP4rOmd8o+CiaqGGPDLpJtPQyFXtr8TLshSY4myBw2kyHNsTlpwe67qs5ixDgb
 +8/RYnxc2QXwohJAXz8ZudcWpfCN9lZufFRmGUAvkDxwlNA/TjopuL9gRPX5gwkm4xmM HQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pxf2q9g1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Apr 2023 15:05:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 46D1010002A;
 Thu, 13 Apr 2023 15:05:04 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32D3D21B515;
 Thu, 13 Apr 2023 15:05:04 +0200 (CEST)
Received: from [10.252.20.144] (10.252.20.144) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 13 Apr
 2023 15:05:03 +0200
Message-ID: <31659e74-661b-8bd3-e64e-33ac6d24f577@foss.st.com>
Date: Thu, 13 Apr 2023 15:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/stm: ltdc: fix late dereference check
To: Raphael GALLAIS-POU <gallais1@gnb.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
References: <20230412092553.279185-1-raphael.gallais-pou@foss.st.com>
Content-Language: en-US
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <20230412092553.279185-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.20.144]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_08,2023-04-13_01,2023-02-09_01
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Raphael,

thanks for the patch.

Reviewed-by: Yannick Fertre <yannick.fertre@foss.st.com>


On 4/12/23 11:25, Raphael GALLAIS-POU wrote:
> Attention: Sender not authenticated
> --------------------------------------------------
>
> In ltdc_crtc_set_crc_source(), struct drm_crtc was dereferenced in a
> container_of() before the pointer check. This could cause a kernel panic.
>
> Fix this smatch warning:
> drivers/gpu/drm/stm/ltdc.c:1124 ltdc_crtc_set_crc_source() warn: variable dereferenced before check 'crtc' (see line 1119)
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <error27@gmail.com>
> Link: https://lore.kernel.org/lkml/202212241802.zeLFZCXB-lkp@intel.com/
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/stm/ltdc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
> index 03c6becda795..b8be4c1db423 100644
> --- a/drivers/gpu/drm/stm/ltdc.c
> +++ b/drivers/gpu/drm/stm/ltdc.c
> @@ -1145,7 +1145,7 @@ static void ltdc_crtc_disable_vblank(struct drm_crtc *crtc)
>
>   static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   {
> -       struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> +       struct ltdc_device *ldev;
>          int ret;
>
>          DRM_DEBUG_DRIVER("\n");
> @@ -1153,6 +1153,8 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>          if (!crtc)
>                  return -ENODEV;
>
> +       ldev = crtc_to_ltdc(crtc);
> +
>          if (source && strcmp(source, "auto") == 0) {
>                  ldev->crc_active = true;
>                  ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);
> --
> 2.25.1
>
