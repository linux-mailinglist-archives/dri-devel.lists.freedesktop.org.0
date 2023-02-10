Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21A6692162
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 16:02:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF50810ED56;
	Fri, 10 Feb 2023 15:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68DAD10ED56
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676041347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiigPyN5SiiDX7CiFNVb4PdP2y01RICIdjqkmFe2Y2c=;
 b=d+Nlr0s2p8ILeFtJMTbb+6zZ/0WPqKi+QFb4bF/Pom7FqoC/GZ6wV1Mf3n8Z4AW/s3QrdN
 MdkowEdjK8ap7wJfV9qpAg00dbBWlDUAdsVutHzYvo8TAhT8hEAihTnQ/p5dLBD5oFHtVn
 M09F2NAu39x5CFqa/KPDcBeRbelxCl4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-ex1H2ZULMGOY3j-l_OumLw-1; Fri, 10 Feb 2023 10:02:26 -0500
X-MC-Unique: ex1H2ZULMGOY3j-l_OumLw-1
Received: by mail-wr1-f70.google.com with SMTP id
 p7-20020a5d48c7000000b002c53d342406so1252202wrs.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 07:02:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aiigPyN5SiiDX7CiFNVb4PdP2y01RICIdjqkmFe2Y2c=;
 b=RDik7h8YZKrGvxNor4PmrYuN3pCIwAjg1lTmr1bkJIdYh70XqyLIeRC/pQ5r+dmra0
 Uu6uO8eWS+W6Af1gmzjdeTJArDYpyiUzRtYgrpAGlemMYIE5eTLuU8fUqRhmtNBoiI46
 JkVMJ0nO2VCnyo6W9+WvS2Xl88AGLHOTn698RaU/8y29QkiyM7swFyByc/lHTPmym/em
 nfXxc3/cwZWf16aTiEI4uYQ/K0UyOrd5MeNgwTyADq+rnpIdmBiAjbhfKnBWO5cDlohe
 iPIbAI/lVmZft69ygMZ55TNIc0LXf7jvnb0eX/mLtrR/mLQRW+h7RRUwwoEyTRGZL+Ct
 /w0g==
X-Gm-Message-State: AO0yUKVnis7sXOrTboJ4w3qK4z6A9TJCJVyM80NpHcVwn3oUzSGH1wdJ
 CDiZ01PQM3VCaSpW0v2r3X8DeNGVCIAPDT0HOR2SpXoYmOW4aIDkST9LzJy3XsO2bqzOEHdHqTy
 O5WxtiKD8kBVVQiSW4euiNDDUVP9B
X-Received: by 2002:a5d:6206:0:b0:2c3:e868:cf54 with SMTP id
 y6-20020a5d6206000000b002c3e868cf54mr16986987wru.13.1676041344865; 
 Fri, 10 Feb 2023 07:02:24 -0800 (PST)
X-Google-Smtp-Source: AK7set9avT3xGLvvN9r+5VcbJiFPk0AiaD5irD4eOAU1hr/lBRxw5C2LmKWvGSiA3THkRnloarpN5w==
X-Received: by 2002:a5d:6206:0:b0:2c3:e868:cf54 with SMTP id
 y6-20020a5d6206000000b002c3e868cf54mr16986969wru.13.1676041344687; 
 Fri, 10 Feb 2023 07:02:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 m9-20020adfe0c9000000b002c3d29d83d2sm3908666wri.63.2023.02.10.07.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 07:02:24 -0800 (PST)
Message-ID: <3d6b1064-46ff-9e73-63ac-e4209e2ca46c@redhat.com>
Date: Fri, 10 Feb 2023 16:02:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] drm/ast: Fix start address computation
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com
References: <20230209094417.21630-1-jfalempe@redhat.com>
 <76785a76-281d-f847-5904-d8df361aa0b4@suse.de>
 <c223bcc5-dfa2-66e1-a58e-a1634237894c@aspeedtech.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <c223bcc5-dfa2-66e1-a58e-a1634237894c@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/02/2023 01:33, Jammy Huang wrote:
> 
> On 2023/2/9 下午 05:55, Thomas Zimmermann wrote:
>>
>>
>> Am 09.02.23 um 10:44 schrieb Jocelyn Falempe:
>>> During the driver conversion to shmem, the start address for the
>>> scanout buffer was set to the base PCI address.
>>> In most cases it works because only the lower 24bits are used, and
>>> due to alignment it was almost always 0.
>>> But on some unlucky hardware, it's not the case, and some unitilized
>>
>> 'uninitialized'
>>
>>> memory is displayed on the BMC.
>>> With shmem, the primary plane is always at offset 0 in GPU memory.
>>>
>>>   * v2: rewrite the patch to set the offset to 0. (Thomas Zimmermann)
>>>   * v3: move the change to plane_init() and also fix the cursor plane.
>>>         (Jammy Huang)
>>>
>>> Tested on a sr645 affected by this bug.
>>>
>>> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Reviewed-by: Jammy Huang <jammy_huang@aspeedtech.com>

I just pushed it to drm-misc-fixes.

Thanks a lot,

-- 

Jocelyn


