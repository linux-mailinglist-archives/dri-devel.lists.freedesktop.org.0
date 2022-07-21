Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B565257C93C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 12:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5F22B624;
	Thu, 21 Jul 2022 10:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA1418B8DF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 10:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658400131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S6Oe91FRPICcN6nsmsOytc0+ZsDZ34nAjk4onRd6keo=;
 b=E5AUK0fKBdivKjR1kafnPvlSl9zWgm+SANYYNGx6nA7IQzvBjcXyNQkPtLQKrx+GuXbnOa
 vSSduDIc7PRSQwpvf4oJq8aw/7q3K1kx7WVUPttfTWRXIWwwtZt0mm54F7Nd+SbEmWsXtV
 7KeZwVPDdMH6B0x0xw+8ubdBriaAHLY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-Jm8PL26AN4-AHkq3-pfYFw-1; Thu, 21 Jul 2022 06:42:09 -0400
X-MC-Unique: Jm8PL26AN4-AHkq3-pfYFw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x21-20020a05640226d500b0043abb7ac086so863196edd.14
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 03:42:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=S6Oe91FRPICcN6nsmsOytc0+ZsDZ34nAjk4onRd6keo=;
 b=1vQdCsgaGo3mY8ItX84Oeet33hnPCc6iDUrANRAJHKCVNpTuYIvTRj9tMnXX4SrA1/
 IymKfV5dSTtaL8J65VpSG0E+0O5NdShgT/faTswa0rjX6QRb0Ym7lZW8EsecL2SIiciu
 cfvC1zNwMWcCLvc8Pc1ffiP4tGL3x8OJYNeDv9QJs6KAV4DVONzE2C+xZBa0q/GunsLN
 VViOSfFTHRF7wk2WU8+IVvAV8D+vN7Wbi/LEHysvHkA3epNOeblZQ5/m26QJx+qZzx8g
 2QAxX9raK1g7L536rz1j5P37T+XQ7i6LAm3zYEuqnzeNhIhBWbMUBiolf1qKtFfr6nEN
 rcnQ==
X-Gm-Message-State: AJIora9lvDmYzt3MPlcn+v3U0NclAXFGY52WrRUC1ggAk6/yed+AT/mO
 MGDr+R043MNGGK+sxOqeMuXDzt+uf6B3RkqnsNjjcDBt8Sk6jcyLj9n+O0qcsfctGLktxgRpky6
 I79PBWywgVJze9w9ODdD1YMVsuckP
X-Received: by 2002:aa7:d9ce:0:b0:43a:6758:7652 with SMTP id
 v14-20020aa7d9ce000000b0043a67587652mr56423058eds.351.1658400128456; 
 Thu, 21 Jul 2022 03:42:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v17EzhGOch3a86h6Zsqe2LPHMxB/daHzlg6AZ3KMDLM8+xOpfJmbSL9eUobzfldn8e8sBHvg==
X-Received: by 2002:aa7:d9ce:0:b0:43a:6758:7652 with SMTP id
 v14-20020aa7d9ce000000b0043a67587652mr56423023eds.351.1658400128121; 
 Thu, 21 Jul 2022 03:42:08 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090606cf00b0072b810897desm680205ejb.105.2022.07.21.03.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jul 2022 03:42:07 -0700 (PDT)
Message-ID: <94904971-94b6-4e6f-3297-8ef4d1a04c30@redhat.com>
Date: Thu, 21 Jul 2022 12:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH drm-misc-next v5 1/4] drm/fb: rename FB CMA helpers to FB
 DMA helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220720153128.526876-1-dakr@redhat.com>
 <20220720153128.526876-2-dakr@redhat.com> <Ytg596Lk4kumqeRD@ravnborg.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Ytg596Lk4kumqeRD@ravnborg.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On 7/20/22 19:23, Sam Ravnborg wrote:
> Hi Danilo,
> 
> On Wed, Jul 20, 2022 at 05:31:25PM +0200, Danilo Krummrich wrote:
>> Rename "FB CMA" helpers to "FB DMA" helpers - considering the hierarchy
>> of APIs (mm/cma -> dma -> fb dma) calling them "FB DMA" seems to be
>> more applicable.
>>
>> Besides that, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
>> requests to rename the CMA helpers and implies that people seem to be
>> confused about the naming.
>>
>> In order to do this renaming the following script was used:
>>
>> ```
>> 	#!/bin/bash
>>
>> 	DIRS="drivers/gpu include/drm Documentation/gpu"
>>
>> 	REGEX_SYM_UPPER="[0-9A-Z_\-]"
>> 	REGEX_SYM_LOWER="[0-9a-z_\-]"
>>
>> 	REGEX_GREP_UPPER="(${REGEX_SYM_UPPER}*)(FB)_CMA_(${REGEX_SYM_UPPER}*)"
>> 	REGEX_GREP_LOWER="(${REGEX_SYM_LOWER}*)(fb)_cma_(${REGEX_SYM_LOWER}*)"
>>
>> 	REGEX_SED_UPPER="s/${REGEX_GREP_UPPER}/\1\2_DMA_\3/g"
>> 	REGEX_SED_LOWER="s/${REGEX_GREP_LOWER}/\1\2_dma_\3/g"
>>
>> 	# Find all upper case 'CMA' symbols and replace them with 'DMA'.
>> 	for ff in $(grep -REHl "${REGEX_GREP_UPPER}" $DIRS)
>> 	do
>> 	       sed -i -E "$REGEX_SED_UPPER" $ff
>> 	done
>>
>> 	# Find all lower case 'cma' symbols and replace them with 'dma'.
>> 	for ff in $(grep -REHl "${REGEX_GREP_LOWER}" $DIRS)
>> 	do
>> 	       sed -i -E "$REGEX_SED_LOWER" $ff
>> 	done
>>
>> 	# Replace all occurrences of 'CMA' / 'cma' in comments and
>> 	# documentation files with 'DMA' / 'dma'.
>> 	for ff in $(grep -RiHl " cma " $DIRS)
>> 	do
>> 		sed -i -E "s/ cma / dma /g" $ff
>> 		sed -i -E "s/ CMA / DMA /g" $ff
>> 	done
>> ```
>>
>> Only a few more manual modifications were needed, e.g. reverting the
>> following modifications in some DRM Kconfig files
>>
>>      -       select CMA if HAVE_DMA_CONTIGUOUS
>>      +       select DMA if HAVE_DMA_CONTIGUOUS
>>
>> as well as manually picking the occurrences of 'CMA'/'cma' in comments and
>> documentation which relate to "FB CMA", but not "GEM CMA".
>>
>> This patch is compile-time tested building a x86_64 kernel with
>> `make allyesconfig && make drivers/gpu/drm`.
>>
>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> For the most part I like the patch.
> But there is a few cases I would like to see fixed.
> 
> 
>> diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
>> index e89ae0ec60eb..fab18135f12b 100644
>> --- a/drivers/gpu/drm/arm/hdlcd_drv.c
>> +++ b/drivers/gpu/drm/arm/hdlcd_drv.c
>> @@ -25,7 +25,7 @@
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_debugfs.h>
>>   #include <drm/drm_drv.h>
>> -#include <drm/drm_fb_cma_helper.h>
>> +#include <drm/drm_fb_dma_helper.h>
>>   #include <drm/drm_fb_helper.h>
>>   #include <drm/drm_gem_cma_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
> 
> 
> The only change in the file above is the rename of the include file.
> This is a strong hint that the include is not needed and the correct fix
> is to drop the include. There are more cases like the above.

Yep, good catch.

> 
> This is a manual process on top of what you could automate, but then I
> suggest to identify them and remove the includes before you change the
> file name.
> 
> Or if anyone applies the patches then at least do it in a follow-up at
> the places will never be easier to spot.
> 
> So with this cleanup done either before or after this patch.

I'll add anther patch to remove the unused includes before doing the 
renaming.

> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> 

- Danilo

