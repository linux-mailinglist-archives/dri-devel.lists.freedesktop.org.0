Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC469126BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 15:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BA010F18C;
	Fri, 21 Jun 2024 13:33:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="joQzu6Pf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2509 seconds by postgrey-1.36 at gabe;
 Fri, 21 Jun 2024 13:33:49 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3810F18C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 13:33:49 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LB3BRq021260;
 Fri, 21 Jun 2024 15:33:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 7V0RclItNFdKo29WOSpHddexvDxa6KYtY5l56bgncyo=; b=joQzu6Pf829wWuft
 mvJv87vpSqWVXiOZWA+bAqqmzslUFyEAvPJuzYRN+lI0yNlCl+M+uPn7exIwGDkQ
 bgxV/lz9d1yWH5QkfCyCpH73vz2G5cz+njQMV5CYx7tTwE8xXfrP9nB9aVJfVkpp
 EITOg+lucS4jbqqjnAJt5Z+10Kzc0PPv5OH8jI4NZ7LRy/hxO5AkiyvogIdd7piN
 m+hb+DtY9tk7heqkHsTK4wdwsCc7KLL5dPXMSZcD0JUs4xCU4wJ/IrE20E61zs6X
 8O7lpsr99DGIRiBaRACWH45Isxcv2y5dgyJFWpN4wKqg9RL3Md/iLtW0ak9DPDba
 ShZsZA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yvrkbkvv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jun 2024 15:33:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B679B40044;
 Fri, 21 Jun 2024 15:33:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2B4D221942;
 Fri, 21 Jun 2024 15:32:54 +0200 (CEST)
Received: from [10.48.87.177] (10.48.87.177) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 21 Jun
 2024 15:32:54 +0200
Message-ID: <902e6037-9ba9-41ab-bfd0-a25fe2c26bce@foss.st.com>
Date: Fri, 21 Jun 2024 15:32:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: TR: [PATCH v4] drm/stm: Avoid use-after-free issues with crtc and
 plane
To: Katya Orlova <e.orlova@ispras.ru>
References: <20240216125040.8968-1-e.orlova@ispras.ru>
 <0b91cb58-b9ca-4c67-b15a-77c60bc2ee18@foss.st.com>
 <ef635048bc7b4521be09ca06c66b57a5@foss.st.com>
Content-Language: en-US
CC: Philippe Cornu <philippe.cornu@foss.st.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <lvc-project@linuxtesting.org>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>
From: Yannick FERTRE <yannick.fertre@foss.st.com>
In-Reply-To: <ef635048bc7b4521be09ca06c66b57a5@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.87.177]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-21_05,2024-06-21_01,2024-05-17_01
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

Hi Katya,

thanks for the patch.

Tested-by: Yannick Fertre <yannick.fertre@foss.st.com>

BR

Le 19/03/2024 à 14:47, Philippe CORNU - foss a écrit :
> zut, déjà un acked-by de RGA...
> tu confirmes que je prends?
> Philippe
> ________________________________________
> De : Raphael GALLAIS-POU - foss
> Envoyé : lundi 26 février 2024 14:50
> À : Katya Orlova
> Cc : Yannick FERTRE - foss; Philippe CORNU - foss; David Airlie; Daniel Vetter; Maxime Coquelin; Alexandre TORGUE - foss; Philipp Zabel; dri-devel@lists.freedesktop.org; linux-stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; lvc-project@linuxtesting.org
> Objet : Re: [PATCH v4] drm/stm: Avoid use-after-free issues with crtc and plane
>
> On 2/16/24 13:50, Katya Orlova wrote:
>> ltdc_load() calls functions drm_crtc_init_with_planes(),
>> drm_universal_plane_init() and drm_encoder_init(). These functions
>> should not be called with parameters allocated with devm_kzalloc()
>> to avoid use-after-free issues [1].
>>
>> Use allocations managed by the DRM framework.
>>
>> Found by Linux Verification Center (linuxtesting.org).
>>
>> [1]
>> https://lore.kernel.org/lkml/u366i76e3qhh3ra5oxrtngjtm2u5lterkekcz6y2jkndhuxzli@diujon4h7qwb/
>>
>> Signed-off-by: Katya Orlova <e.orlova@ispras.ru>
> Hi Katya,
>
>
> Thanks for this submission.
>
> Acked-by: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>
>
>
> Regards,
> Raphaël
>
