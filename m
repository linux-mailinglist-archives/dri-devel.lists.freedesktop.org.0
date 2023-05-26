Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7867125BD
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 13:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F037510E1C4;
	Fri, 26 May 2023 11:40:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D846F10E1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 11:40:50 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34Q9qKcf012829; Fri, 26 May 2023 13:40:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Q/cQ+s7tQtjC/OitTWv7XOq+cPm+R5vQ5zct/mEOgKY=;
 b=gHdi/t9om+jjKpDK0hLDKd5Nlzg/LS8AEPW7NN+OMtb+wZpLg2ii9nhCCrNANKniCc+I
 B/A7VLw9/476mOlSakzzP60KUl22NHIEKaLnt2oRgqiQhfNZgtUGhQmz676EAFR6t0vr
 lhCKEm9yXaTnEYeigzmrvL5Dys8MGMagqaY/KciWemvzDbeGLsOKda8DHf5KtzaPVmoM
 1wsIbTuIBf1nLVFoLt8p/MRL2qlj0vj4veVIHNY/el1YsXFzPVTkgTTLNasDn+EgRMNG
 WGAsjSo/UWyU6JzgyBAVNx/i6Yd2LryQc0I2GVVahPtEjnrkRVDsMXk88/SMDCJUMueU 6g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt39u1328-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 13:40:44 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E049710002A;
 Fri, 26 May 2023 13:40:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7193229A9D;
 Fri, 26 May 2023 13:40:42 +0200 (CEST)
Received: from [10.48.0.148] (10.48.0.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 13:40:42 +0200
Message-ID: <62bd9682-b768-8be3-7a2f-0eceea6d9772@foss.st.com>
Date: Fri, 26 May 2023 13:40:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RESEND] drm/stm: ltdc: fix late dereference check
Content-Language: en-US
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>
References: <20230515123818.93971-1-raphael.gallais-pou@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230515123818.93971-1-raphael.gallais-pou@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.148]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
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


On 5/15/23 14:38, Raphael Gallais-Pou wrote:
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
> -	struct ltdc_device *ldev = crtc_to_ltdc(crtc);
> +	struct ltdc_device *ldev;
>   	int ret;
>   
>   	DRM_DEBUG_DRIVER("\n");
> @@ -1153,6 +1153,8 @@ static int ltdc_crtc_set_crc_source(struct drm_crtc *crtc, const char *source)
>   	if (!crtc)
>   		return -ENODEV;
>   
> +	ldev = crtc_to_ltdc(crtc);
> +
>   	if (source && strcmp(source, "auto") == 0) {
>   		ldev->crc_active = true;
>   		ret = regmap_set_bits(ldev->regmap, LTDC_GCR, GCR_CRCEN);

Hi Raphael,
Applied on drm-misc-next.

Note & fyi, I fixed the following warning, please be sure to follow this 
rule next time :-)
WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately 
followed by Closes: with a URL to the report

Many thanks for your patch,
Philippe :-)
