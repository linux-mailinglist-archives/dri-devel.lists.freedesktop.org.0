Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A278296A9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 10:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C548110E58D;
	Wed, 10 Jan 2024 09:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA5710E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 09:54:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40A9dklx009461; Wed, 10 Jan 2024 10:54:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=SMY/YRkrLa8qTKcLx39OUdusAyLog8eoCTO/ymESOn4=; b=tj
 iGsheSbWzimarjEDpbU+QobiMrSVJmIgPKAo/DWYJhD7pxYKNE56lMoEUWTRUKO/
 ba9JdiKknjytZ4Q9iU43t9r38h1O7AvCv12V+D0BTpMZBq3kSI6AQYk2pVCVRKZA
 4/wkm1NewSIaeykN1KIFMWFCMl1Fqxi8CINWCZPbSaAkS24NQ3n62pDjCUIAtyBY
 P1Nk5rDK/ONiOn36/EtndXk3vtmpZ8+B+e3AJyz2uxoXMRa7gB5eWAbfQMc8kbUT
 BoyfMpxd0Vs/YMDua8YXPo1JegglE/O0SG8S0NVrVThbomT6bRBGzWeZhRnF0pzU
 40eFLUw9P1Cn1zNLv2Xw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexmffm6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 10:54:31 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1DE610002A;
 Wed, 10 Jan 2024 10:54:29 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9D812257A9B;
 Wed, 10 Jan 2024 10:54:29 +0100 (CET)
Received: from [10.252.22.30] (10.252.22.30) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 10:54:26 +0100
Message-ID: <74a39554-a514-42f3-a2ab-d436d4fee474@foss.st.com>
Date: Wed, 10 Jan 2024 10:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/stm: Fix an error handling path in
 stm_drm_platform_probe()
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Eric Anholt <eric@anholt.net>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20fff7f853f20a48a96db8ff186124470ec4d976.1704560028.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20fff7f853f20a48a96db8ff186124470ec4d976.1704560028.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.22.30]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yannick Fertre <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christophe,

On 1/6/24 17:54, Christophe JAILLET wrote:
> If drm_dev_register() fails, a call to drv_load() must be undone, as
> already done in the remove function.
>
> Fixes: b759012c5fa7 ("drm/stm: Add STM32 LTDC driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This was already sent a few years ago in [1] but it got no response.
> Since, there has been some activity on this driver, so I send it again.
>
> Note that it is untested.
>
> [1]: https://lore.kernel.org/all/20200501125511.132029-1-christophe.jaillet@wanadoo.fr/
> ---
>  drivers/gpu/drm/stm/drv.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
I tested it against stm32mp157c-dk2.dts.

Thanks for your submission.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>


Regards,

Raphaël Gallais-Pou

