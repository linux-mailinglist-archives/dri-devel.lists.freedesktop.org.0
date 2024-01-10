Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F522829E68
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 17:22:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202D610E058;
	Wed, 10 Jan 2024 16:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4B610E058
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 16:22:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40AFqjcj006046; Wed, 10 Jan 2024 17:21:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=0lcmvy10VZgJVbxhJSRvChfEOTXYBSl765GGGCaCPCc=; b=EI
 38OfCZbtxSRr5yjDuwBBs5Ss8halUTdeerybUJJLG8A/1n4281auvTFRJdgtKCMW
 yfDoFHXImKhBghVaHLUQGnlXFbUvKtmCkWcSdVg5iq8OW9lImWc11SChjE+CXtJY
 fgLqwfgygsc1KFEWUyG8qTQ7Xxshq4+VqJ80sqHbo38IVk2D1dRUjTMFHqT4T+lB
 hjmxLNBZlMauHFOjw3MGADOrsCDKTkqeOUfKBsXzZwWy2ubNGxLkhqAnsFsaX0S8
 /MmliOEdBqRyh3fNmAeS4vUtLhXzOcht29ocExQ6vEQ8OQqSqA7AM2gqK8Trg/LY
 GttNoODiSzluYBtdCyKw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexrc9769-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Jan 2024 17:21:52 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2D0B010002A;
 Wed, 10 Jan 2024 17:21:48 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD533209730;
 Wed, 10 Jan 2024 17:21:48 +0100 (CET)
Received: from [10.252.16.30] (10.252.16.30) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 10 Jan
 2024 17:21:48 +0100
Message-ID: <34be5ba8-fa6a-4bd2-8c6e-673bae7d2354@foss.st.com>
Date: Wed, 10 Jan 2024 17:21:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v1 4/8] drm/stm: ltdc: implement bus clock
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231221124339.420119-1-raphael.gallais-pou@foss.st.com>
 <20231221124339.420119-5-raphael.gallais-pou@foss.st.com>
 <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <CAA8EJpq-NWUEe8QbUwDHu0BBSViWKh92PujD7PA84xgvSUsvhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.16.30]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Sam Ravnborg <sam@ravnborg.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Philippe Cornu <philippe.cornu@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/21/23 14:17, Dmitry Baryshkov wrote:
> On Thu, 21 Dec 2023 at 14:45, Raphael Gallais-Pou
> <raphael.gallais-pou@foss.st.com> wrote:
>> From: Yannick Fertre <yannick.fertre@foss.st.com>
>>
>> The latest hardware version of the LTDC presents the addition of a bus
>> clock, which contains the global configuration registers and the interrupt
>> register.
>>
>> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
>> ---
>>  drivers/gpu/drm/stm/ltdc.c | 8 ++++++++
>>  drivers/gpu/drm/stm/ltdc.h | 1 +
>>  2 files changed, 9 insertions(+)
> I might be missing something, but I don't see this clock being set
> (compare this patch to the patch 5/8)


Hi Dmitry,

This patch needs rework. I'll drop it for now and send it back later when it is
more mature.

Regards,

Raphaël

>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 5576fdae4962..67064f47a4cb 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -1896,6 +1896,8 @@ void ltdc_suspend(struct drm_device *ddev)
>>
>>         DRM_DEBUG_DRIVER("\n");
>>         clk_disable_unprepare(ldev->pixel_clk);
>> +       if (ldev->bus_clk)
>> +               clk_disable_unprepare(ldev->bus_clk);
>>  }
>>
>>  int ltdc_resume(struct drm_device *ddev)
>> @@ -1910,6 +1912,12 @@ int ltdc_resume(struct drm_device *ddev)
>>                 DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
>>                 return ret;
>>         }
>> +       if (ldev->bus_clk) {
>> +               if (clk_prepare_enable(ldev->bus_clk)) {
>> +                       DRM_ERROR("Unable to prepare bus clock\n");
>> +                       return -ENODEV;
>> +               }
>> +       }
>>
>>         return 0;
>>  }
>> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
>> index 9d488043ffdb..155d8e4a7c6b 100644
>> --- a/drivers/gpu/drm/stm/ltdc.h
>> +++ b/drivers/gpu/drm/stm/ltdc.h
>> @@ -44,6 +44,7 @@ struct ltdc_device {
>>         void __iomem *regs;
>>         struct regmap *regmap;
>>         struct clk *pixel_clk;  /* lcd pixel clock */
>> +       struct clk *bus_clk;    /* bus clock */
>>         struct mutex err_lock;  /* protecting error_status */
>>         struct ltdc_caps caps;
>>         u32 irq_status;
>> --
>> 2.25.1
>>
>
