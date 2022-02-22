Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6194BF6B3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 11:54:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9E08916D;
	Tue, 22 Feb 2022 10:54:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B197310E4D7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 10:54:29 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21M9PpLE004215;
 Tue, 22 Feb 2022 11:54:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eyPV2WHrs60DIefFS3PzEvweoMxStSGvtgWsUpYbsgQ=;
 b=c+16qZyVN9Tj5TaYjnG/16ROtJ1e/mpPK0NFcoCu/9/bwNnW3wxw4uF4uOmKeMk0e3Gh
 JGA7tEpo61C4wHtAs+cXJjNldTK0I07mKwOQIdBPfOCBabMRVbfEPosl21X5JUahVsce
 iQ29O2rWmvfH+3+vDti1nsVnPZpRRkH5QQyAQSuY+4UeG2TYrv6k3t2TKoxODI6Odiqm
 PmKoFN1ya63dU71s9G3tcuWDEiJZBQfVPz5zycXf75TY9Pp2frk2F46XLMZUWMpcxQo7
 UOHq6k7sytmIy+K2PB7wijEkYYmu565acr4XlItWA0xbK6QdNSN6r1FCiFowMf3TGNb9 Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ecq13jjsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Feb 2022 11:54:15 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67229100034;
 Tue, 22 Feb 2022 11:54:13 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 53FB221B52E;
 Tue, 22 Feb 2022 11:54:13 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.45) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Feb
 2022 11:54:12 +0100
Subject: Re: [PATCH] drm/stm: Avoid using val uninitialized in
 ltdc_set_ycbcr_config()
To: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor
 <nathan@kernel.org>
References: <20220207165304.1046867-1-nathan@kernel.org>
 <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <430ee06d-04e7-3b8b-bf11-48a7b62eaf18@foss.st.com>
Date: Tue, 22 Feb 2022 11:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkXe8CB3QGe2e6Fhz8_SLOsOpcMumoKBiAzGE_VTXCkVg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-22_02,2022-02-21_02,2021-12-02_01
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
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/7/22 8:44 PM, Nick Desaulniers wrote:
> On Mon, Feb 7, 2022 at 8:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> Clang warns:
>>
>>    drivers/gpu/drm/stm/ltdc.c:625:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>>            default:
>>            ^~~~~~~
>>    drivers/gpu/drm/stm/ltdc.c:635:2: note: uninitialized use occurs here
>>            val |= LxPCR_YCEN;
>>            ^~~
>>    drivers/gpu/drm/stm/ltdc.c:600:9: note: initialize the variable 'val' to silence this warning
>>            u32 val;
>>                   ^
>>                    = 0
>>    1 warning generated.
>>
>> Use a return instead of break in the default case to fix the warning.
>> Add an error message so that this return is not silent, which could hide
>> issues in the future.
>>
>> Fixes: 484e72d3146b ("drm/stm: ltdc: add support of ycbcr pixel formats")
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1575
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   drivers/gpu/drm/stm/ltdc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 5eeb32c9c9ce..447ddde1786c 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -624,7 +624,8 @@ static inline void ltdc_set_ycbcr_config(struct drm_plane *plane, u32 drm_pix_fm
>>                  break;
>>          default:
>>                  /* RGB or not a YCbCr supported format */
>> -               break;
>> +               drm_err(plane->dev, "Unsupported pixel format: %u\n", drm_pix_fmt);
> 
> This is fine, but in the future you should add an explicit
> #include <drm/drm_print.h>
> to avoid implicit header dependencies (like the ones that Mingo is
> trying to detangle) for the declaration of drm_err. `drm_vprintf`
> needs it, too.
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 

Hi Nick,
and thank you for having pointing this.

Hi Nathan,
May I ask you please to update your patch changing drm_err(plane->dev, ) 
with DRM_ERROR().


Big thank you,

Philippe :-)



>> +               return;
>>          }
>>
>>          /* Enable limited range */
>>
>> base-commit: 542898c5aa5c6a3179dffb1d1606884a63f75fed
>> --
>> 2.35.1
>>
> 
> 
