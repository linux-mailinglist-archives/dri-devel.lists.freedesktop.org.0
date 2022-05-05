Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 023C751C072
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 15:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D189C10E1D9;
	Thu,  5 May 2022 13:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E3810E1D9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 13:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651756774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IW6fOs7e5307KfibthmglvTovnRowFL+yzU/9f+OYUE=;
 b=a+/cQB3/ytrQ4GXerRzjZmwV4PbYFMPOH9cJt2HPMHvavlQb2AVIr9A00uAo/kzkO2BeQ8
 q7u3dzbDRVGpXnfxazuqdFIX+igQotxoEUBagJx8fFlRU3YWQNyTFalS4JYebbfLAGpYgN
 dWtfkS5ppyUlmatIp2znQ1SQDsABk5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-dtls_JUTMgWJDHqaN7S96g-1; Thu, 05 May 2022 09:19:33 -0400
X-MC-Unique: dtls_JUTMgWJDHqaN7S96g-1
Received: by mail-wm1-f70.google.com with SMTP id
 k35-20020a05600c1ca300b003946a9764baso634921wms.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 06:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IW6fOs7e5307KfibthmglvTovnRowFL+yzU/9f+OYUE=;
 b=UuCgA0uetzg2FvAB5V559fOsqBOfRTGCtT8/6CZJM5SjN1pUvsF03eH3Rf7pNOyWdm
 yMEFSnML2YH4etSUdIoLAA0sD8KjqrKhXC3L6szwoB75+bvbWJ+9TNGt9YKTk8CEgULU
 ZF7fLgAorLGRw7DRDQVPxP4YgZuEwO3ONYjmDkiD9o8lWb1zU2r2HtXd/W6fdTmlNGnV
 LM2Lew5FPL4kOuFeblaQJxVV/LGkbvD1Eh+lgB0GrA/MbkxcsuSEKaW1j6+6yXHyOMPq
 QlZ6eDPiK2D8xhvkWMls5EDEBVzKw+sgNh6ojoPOvSi3PUtHt/n/wI/It1CccxL0uy5A
 UEsQ==
X-Gm-Message-State: AOAM532lBp0uuAMHNG/ztonlYrWR3f3eipTIUwwH9L0Txw+uxTQDlfx/
 KhT3ua8VKtZjRhQ+akckx3FDwYXIoJ2lizGirZeHlEODTwejkXQ22hBnCFxI2wDaIXgl/rNJX2n
 WqYhhr1lcX9DNylhmvEBzBzGmhFAI
X-Received: by 2002:a05:600c:1d18:b0:394:6469:abec with SMTP id
 l24-20020a05600c1d1800b003946469abecmr4767697wms.89.1651756771916; 
 Thu, 05 May 2022 06:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznOboZJQssf1bkI3Rw7a6NAaieRAgtKHnzU4znuTG9Om0VUyJQMtC9zyn0YmSBtfpe6zPe9g==
X-Received: by 2002:a05:600c:1d18:b0:394:6469:abec with SMTP id
 l24-20020a05600c1d1800b003946469abecmr4767666wms.89.1651756771561; 
 Thu, 05 May 2022 06:19:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c17-20020a7bc011000000b003942a244f40sm6395959wmb.25.2022.05.05.06.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 06:19:31 -0700 (PDT)
Message-ID: <d53319d8-acaf-7b57-20cf-f35cc5969895@redhat.com>
Date: Thu, 5 May 2022 15:19:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 4/4] fbdev: vesafb: Cleanup fb_info in .fb_destroy
 rather than .remove
To: linux-kernel@vger.kernel.org, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20220505113128.264963-1-javierm@redhat.com>
 <20220505113128.264963-5-javierm@redhat.com>
 <YnPK3RLPdtvFze+8@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YnPK3RLPdtvFze+8@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Daniel,

On 5/5/22 15:02, Daniel Vetter wrote:

[snip]

>>  static void vesafb_destroy(struct fb_info *info)
>>  {
>>  	struct vesafb_par *par = info->par;
>> @@ -187,7 +191,13 @@ static void vesafb_destroy(struct fb_info *info)
>>  	arch_phys_wc_del(par->wc_cookie);
>>  	if (info->screen_base)
>>  		iounmap(info->screen_base);
>> +
>> +	if (((struct vesafb_par *)(info->par))->region)
>> +		release_region(0x3c0, 32);
> 
> This move seems rather iffy, so maybe justify it with "makes the code
> exactly as busted before 27599aacbaef ("fbdev: Hot-unplug firmware fb
> devices on forced removal")"
>

I think that will just drop this change. While being here I wanted the release
order to be the inverse of the order in which the driver acquires them. But I
will only move the framebuffer_release() that is the problematic bit.

Someone if care enough could fix the rest of the driver.
 
> Also same comments as on v1 about adding more details about what/how this
> fixes, with that: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>

Yes, I'll do that too. Thanks again for your comments and feedback.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

