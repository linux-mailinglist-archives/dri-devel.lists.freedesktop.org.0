Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B835170A3
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:36:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AB510EC9D;
	Mon,  2 May 2022 13:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF5E10ECC6
 for <dri-devel@lists.freedesktop.org>; Mon,  2 May 2022 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651498584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wk6mLWRRViFXWkx+VvGzbw9fqjF1MLHsTTjWqUZV74g=;
 b=BSKvXyA5xSSH70wsc5yyTOKKMd/Z/yTNOZS2AdX1Qn6+XmXHLw92Jui6WSfbFMWpVdXiN1
 o1a+AznVsrjGr6yCgEf/MxV1pdxXGBLinEMypIV1CwyEe6iW+QB94P+dBrVAS8n6d0IDqU
 8CwiKvlRnBsrmmMZ1txN+Hed2eeOBdQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-HZ-fS6h5MUSGQQsgN-ESjA-1; Mon, 02 May 2022 09:36:23 -0400
X-MC-Unique: HZ-fS6h5MUSGQQsgN-ESjA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so4483916wmk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 May 2022 06:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wk6mLWRRViFXWkx+VvGzbw9fqjF1MLHsTTjWqUZV74g=;
 b=YNZsPtR6OsUsM/gWhtu9MxO+Tt+3ZnL1A8jFFIhSFwYZ9/0P5Ta6nKLhd9NSN1LEee
 Bf27gdSfmpJpeQ2CB9PrWwwGxsit/616yA3csU10sFx1/j1Vj7bBj57QMBFavsbO5sk2
 5d2YJEmsz+hwe8x5l3a8LAzADiIksTyJ5pDHpxoTUqOK1+8DAdwksRXeWz4iDJML1Q56
 3GeHKJKQi/1rd8uVPSeA4QPXsMdSWJke9fbn55JGikHkrFs53hnW0SqKoPpVAc3bOqWX
 F9f0PKWlnP85tFuedpNcO5hP6BzEThqIyeCDqcbMNSf3SlJ/U/u2QjxN0Biv73gD5HkO
 qHNA==
X-Gm-Message-State: AOAM532HF5CSjukYMSADQ/rShZ0zSRjgmFfcE56DZ2LIkY7Ql3MkY0Ao
 bm05/ei8+GBwWUIjLRbwZD1EHTa4TL/vyFOKtn6spuhfnBLUoHnNMks50YMvV8XubvBzKr+CEso
 /KOYtEceADX8zIjSwuCsUp8npvDnz
X-Received: by 2002:a05:600c:3b14:b0:394:1f06:37eb with SMTP id
 m20-20020a05600c3b1400b003941f0637ebmr10884562wms.193.1651498582008; 
 Mon, 02 May 2022 06:36:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEwL5W5ENYx/Gaa49NDx4yx3cjiPFzGsI/Mcnz7WEwp1islY54iqn0IFPIaaasmsyn0xwuUA==
X-Received: by 2002:a05:600c:3b14:b0:394:1f06:37eb with SMTP id
 m20-20020a05600c3b1400b003941f0637ebmr10884551wms.193.1651498581801; 
 Mon, 02 May 2022 06:36:21 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 v22-20020adf8b56000000b0020c5253d8d4sm7047386wra.32.2022.05.02.06.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:36:21 -0700 (PDT)
Message-ID: <c556b0f7-b3b9-17fd-7349-45cfb2dfe1d8@redhat.com>
Date: Mon, 2 May 2022 15:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] fbdev: Check in file_fb_info() if the fb_info was
 already been freed
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220502130944.363776-1-javierm@redhat.com>
 <20220502130944.363776-2-javierm@redhat.com>
 <fa010244-b250-ea6d-275e-bfbe1bd8f212@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <fa010244-b250-ea6d-275e-bfbe1bd8f212@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Helge Deller <deller@gmx.de>, Changcheng Deng <deng.changcheng@zte.com.cn>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/2/22 15:26, Thomas Zimmermann wrote:
> Hi
> 
> Am 02.05.22 um 15:09 schrieb Javier Martinez Canillas:
>> If real driver probes, the fbdev core kicks out all drivers that are using
>> a framebuffer that were provided by the system firmware. But it could be a
>> user-space process still has a file descriptor for the fbdev device node.
>>
>> This can lead to a NULL pointer dereference, if the framebuffer device is
>> unregistered and associated data freed, but later in the .release callback
>> is attempted to access its struct fb_info.
>>
>> To prevent this, make file_fb_info() to also check the fb_info reference
>> counter and just return NULL if this equals zero. Since that means it has
>> already been freed.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/video/fbdev/core/fbmem.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
>> index 84427470367b..20d8929df79f 100644
>> --- a/drivers/video/fbdev/core/fbmem.c
>> +++ b/drivers/video/fbdev/core/fbmem.c
>> @@ -751,8 +751,13 @@ static struct fb_info *file_fb_info(struct file *file)
>>   	int fbidx = iminor(inode);
>>   	struct fb_info *info = registered_fb[fbidx];
>>   
>> -	if (info != file->private_data)
>> -		info = NULL;
>> +	if (!info)
>> +		return NULL;
>> +
>> +	/* check that the fb_info has not changed or was already freed */
>> +	if (info != file->private_data || refcount_read(&info->count) == 0)
>> +		return NULL;
>> +
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> However, I'm having problems with the semantics of these variables: if 
> we have an info from registered_fb[fbinx] and the refcount in 
> info->count is still 0, isn't that a consistency problem? If so, we 
> should print a WARN_ON().
>

That's a good point. Maybe we are being too paranoid here? If the fb_info
was set to NULL then the existing if (info != file->private_data) check
will already catch that issue.

In other words, now that fb_release() is getting the fb_info with the
file_fb_info() function instead of file->private_data directly, the NULL
pointer dereference should not happen anymore.

I think that will just drop this patch, the less we touch the fbdev code
the better IMO.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

