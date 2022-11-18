Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C93262F673
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:41:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8610E088;
	Fri, 18 Nov 2022 13:41:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C9E10E088
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668778886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ram0fxHmsZGxDUyD+WE0J7ZuzKKqh3rr7YEBxmiB/rs=;
 b=B7Q2ng7Ai1jUPqMy+cOdiwrJF6SW8I+ouBju1YaoY2t6iPSxi/UD00o4cMkwEpW41TGvrq
 X8JyRaJkCVE8NUuJAj/Ss9awzkQ3jpaL0P3MrVGWqhhRmyN02cE6Evs//ZwbnZXyihAdY9
 TUWLq81Xtdn1pVS9EkVbiA4RkER/zYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-413-At3W43KQMqWQVm1isfHHdQ-1; Fri, 18 Nov 2022 08:41:25 -0500
X-MC-Unique: At3W43KQMqWQVm1isfHHdQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 t12-20020adfa2cc000000b0022adcbb248bso1570213wra.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 05:41:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ram0fxHmsZGxDUyD+WE0J7ZuzKKqh3rr7YEBxmiB/rs=;
 b=4mmvsyL1viBVxLMse25EdR2GtHTx/FtpoRLsTn7+F02B1xt3zXxseNgQcA6/AIvDuc
 nWXRQn5UfZTd2tQpBi3tfCwaBoaPce6rVIImS6y6iQ8/r1bzLQ5KKkz19f3V/yVL9+4i
 YKqv8bdrOFW7zCMpImi5RseEr9ckmE7ASRSX68Qv/p0ywGpe74zducsRmy2buAOGcdIX
 taZ/X5hTztRFaJTVLZHBRzQGEntkqU+1VrRg+aFJfTNjqlsI1OD9Cg2yoNRI7hjs4i8k
 /llSXciehXnzIPKH1W+bx2csiboOaZN4798TDgKMLe6/BoR4J9O+BeAUF7BH6FE4lSUv
 0W3A==
X-Gm-Message-State: ANoB5plHPcZ/Y3teER8VrAeMYx+fy6Mtg/hLV79BejuPey7blFaJeME1
 zoV6kYnroPZnRadHnslMTMrx22vBOBOiu5pK05gNAEe+38OQANR69LTc9tMdMPVMU2LdYB2958b
 qYpBnua+Lb1uWJgH62cpZzHy8rbgM
X-Received: by 2002:a5d:4c42:0:b0:236:6f90:3e55 with SMTP id
 n2-20020a5d4c42000000b002366f903e55mr4378461wrt.374.1668778883669; 
 Fri, 18 Nov 2022 05:41:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6XLvWuWvd4Jd2lEeB3aExRzJOdGWzwQJmIcCNtrHxAtn0Vt/Tg+2tMwIXMQ4LM1et29YRKVw==
X-Received: by 2002:a5d:4c42:0:b0:236:6f90:3e55 with SMTP id
 n2-20020a5d4c42000000b002366f903e55mr4378454wrt.374.1668778883486; 
 Fri, 18 Nov 2022 05:41:23 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 l8-20020a5d4bc8000000b002238ea5750csm2345019wrt.72.2022.11.18.05.41.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 05:41:22 -0800 (PST)
Message-ID: <5893d46d-ca8a-81e4-2884-aa682ef69872@redhat.com>
Date: Fri, 18 Nov 2022 14:41:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/7] drm/logicvc: Fix preferred fbdev cpp
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 xinliang.liu@linaro.org, tiantao6@hisilicon.com, jstultz@google.com,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul.kocialkowski@bootlin.com, airlied@redhat.com, kraxel@redhat.com
References: <20221116160917.26342-1-tzimmermann@suse.de>
 <20221116160917.26342-3-tzimmermann@suse.de>
 <521e43bb-0c76-f3b7-aa78-8ed97edce613@redhat.com>
 <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <10c809cb-2ea9-273c-bfd2-a267e6219f22@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/18/22 14:22, Thomas Zimmermann wrote:

[...]

>>
>> I'm also not sure if this is needed. Since IIUC in logicvc_mode_init() the
>> driver does:
>>
>> 	preferred_depth = layer_primary->formats->depth;
>>
>> 	/* DRM counts alpha in depth, our driver doesn't. */
>> 	if (layer_primary->formats->alpha)
>> 		preferred_depth += 8;
>>
>> 	...
>> 	mode_config->preferred_depth = preferred_depth;
>>
>> So it seems this patch is not needed? Unless I'm misunderstanding the code.
> 
> The driver uses XRGB8888, so the 24-bit color depth has a 32-bit bpp 
> value. Hence the switch.
> 

Ah, I see. So is to set 32-bit bpp for both XRGB8888 and ARGB8888. But then
I think that you also need to fix logicvc_mode_init() to remove that += 8?

Because right now the preferred_depth += 8 would set a preferred_depth of 32
when should be just 24 even if alpha is enabled?

Or am I confusing again the meaning of the color depth?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

