Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6DB7A6E99
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 00:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7863310E414;
	Tue, 19 Sep 2023 22:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFBF10E408
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695162241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iu9scWxa8/Kic0aeMHk9swfJe1CpFtZjtsKcvFgigt0=;
 b=N1kdmYidjS/mVMOJw1vKEOAmc0DAFHV9iZ3ZV9slwBhXJEszcttNrN1YhmoLMNNV7I3Mov
 Bz9QKwWeI5a99aJxeb4PGuR5EdCg/V/oaTzPdkhMn83oGpq4ioDoBeHa7jF861VWJl1yG5
 sUG6W+OkOiACaa4f0hQLvTWGttQwCBU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-lSeWCXz2PO-54Bxx2RV7kA-1; Tue, 19 Sep 2023 18:23:59 -0400
X-MC-Unique: lSeWCXz2PO-54Bxx2RV7kA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b8405aace3so77688761fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 15:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695162238; x=1695767038;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iu9scWxa8/Kic0aeMHk9swfJe1CpFtZjtsKcvFgigt0=;
 b=kNA/os0pJW8BeOurx4WtnKSpoFksdyyT2+0cvmNPvLJM1CwmBhmmD9OUwx+R3g5fru
 acP75N9oNMzEBX5hkOJyF5AXMT/sMVahQKeSIRIeMx3mSgANoKZKgYVnh44G/yMywibI
 syX39J12hz+oMr7KugZpkT/c9U7+SqQVwyPi4PFWlcRswoztHLqO6s+wj8CrqzOU4DjW
 OILkHSfPPkQQtFp6WRg7pYknAewBt9p8Oqurx+OLbzfk1BFrfAcbNKYPSK7pit2u/FIv
 mWx+zaZM9CVcxSHwu78/HR9fG0AacEk5TFbzEvIl+RymCVfh9sFU45C7b8kZD6Y2fFxc
 Xv0Q==
X-Gm-Message-State: AOJu0YxbC3Nl6AjmrI0QrtlqwmQv51FvO1fEldukbZfpON3u4evwsrt2
 MTWVMgww3sfHUtqKbPoA73JjWs3QLFo3LBb0kdL8SBCqsMl2nXurqS74btUMoMLOW9zUTjg/rR/
 St7YCGCeBtc4luNFFEc2s280lwtLp
X-Received: by 2002:a2e:9dd4:0:b0:2c0:3284:64d5 with SMTP id
 x20-20020a2e9dd4000000b002c0328464d5mr566293ljj.47.1695162238076; 
 Tue, 19 Sep 2023 15:23:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLfTM/e2pj9i25MZfS/WM7Ty4jUCTezq3kTq4v+sE6/bvXNCRHvHUXT0YlVrk/G/yCtRqIA==
X-Received: by 2002:a2e:9dd4:0:b0:2c0:3284:64d5 with SMTP id
 x20-20020a2e9dd4000000b002c0328464d5mr566282ljj.47.1695162237631; 
 Tue, 19 Sep 2023 15:23:57 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 br13-20020a170906d14d00b0099cf9bf4c98sm8464321ejb.8.2023.09.19.15.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Sep 2023 15:23:57 -0700 (PDT)
Message-ID: <3f643295-f742-ab49-18fa-f0d07981e59b@redhat.com>
Date: Wed, 20 Sep 2023 00:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
 <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
 <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <813a260a-80ac-4c11-a0c5-f50edb399b5c@kadam.mountain>
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/23 16:24, Dan Carpenter wrote:
> On Sat, Sep 16, 2023 at 01:41:43AM +0200, Danilo Krummrich wrote:
>> Hi Dan,
>>
>> On 9/15/23 14:59, Dan Carpenter wrote:
>>> The u_memcpya() function is supposed to return error pointers on
>>> error.  Returning NULL will lead to an Oops.
>>>
>>> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> index 3666a7403e47..52a708a98915 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
>>> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>>>    	size_t bytes;
>>>    	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
>>> -		return NULL;
>>> +		return ERR_PTR(-ENOMEM);
>>
>> I plan to replace this function with an upcoming vmemdup_array_user() helper,
>> which returns -EOVERFLOW instead, hence mind using that?
>>
>> Unless you disagree, no need to resubmit the patch, I can change it
>> before applying the patch.
> 
> Generally, I would say that ENOMEM is the correct error code.  I feel
> like someone thinks EOVERFLOW means integer overflow and that's not
> correct.  I means like if you pass a number higher than INT_MAX to
> kstroint().
> 
> But I don't care strongly about this.  You can change it if you want to.

I seems that vmemdup_array_user() will keep using EOVERFLOW, hence aligning to
that.

Pushed the patch to drm-misc-fixes, thanks!

> 
> regards,
> dan carpenter
> 

