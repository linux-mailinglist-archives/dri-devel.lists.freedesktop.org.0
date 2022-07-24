Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74B757F6FB
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 22:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F7A8AD0A;
	Sun, 24 Jul 2022 20:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831C98AADE
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 20:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658693714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZz4b5LoajqAvsUTBnBgNSgY5TJeL+gVGY7SLqZJsYs=;
 b=eNZKb/ektgHzDdxM02D4umoPnfjXzuCxmpRoSEyUPQaGRojNHgxrJJiIwce4lQY2Dk4Mpn
 cPfQub89lMZ4DY7/D8Et7Kctb9dHTACfjOtsihdzvhfSqu1X12zmSY9qh2nUfpqeZwWz+d
 pLuQnzI3pH/DUXvR14K9Y2kp1Ejac54=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-5miV4zUmPNO1VkzooDJ2FA-1; Sun, 24 Jul 2022 16:15:06 -0400
X-MC-Unique: 5miV4zUmPNO1VkzooDJ2FA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h189-20020a1c21c6000000b003a2fdf9bd2aso5113864wmh.8
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 13:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kZz4b5LoajqAvsUTBnBgNSgY5TJeL+gVGY7SLqZJsYs=;
 b=34ucXALXro3FlOex3ycZDI89tbd+6X3Jb2TS0QrRkTFOqvEykLoU03xHeVLT47HStQ
 sT3rZ0pTgam4HKCpbCamV/IZYGzdGeDrpbhQ9QweX0ayEFtAl94Wo9I4wvIplrpIQ7/r
 d8MXJ7brudn9rZGZh8UPaRrcPyuayucj6BVEIZ7edsrtWSvd5tX9PccyhN6uXkuEwGYw
 PRlWtS8SUV3uykWribzrYDlu4kCUwudzpKXbHNwZchrKdVlsBM0JWIlzm6loRPJGp0j/
 ezalEFcYZo6aNFUgBR0CPbxlnbUljS/baSXuMCdUBOYq04oU8WAQnPyTjqvFuq4dASR0
 gQyw==
X-Gm-Message-State: AJIora+0s7kAcPno2/aWgbFl4SPJrntLhr/Tde6WNqYyHjna2UDyNbvp
 qGjQw3AErWeMCZDVWSrRyndJcZs7VbQSEfV6t22XHnXr8YznC6xcaVCazxbp1CtWvfOZa+h/5qq
 j6nMpA9+O8TxiBZpHdMFarFXlqvPK
X-Received: by 2002:a05:600c:4e94:b0:3a3:4448:62cc with SMTP id
 f20-20020a05600c4e9400b003a3444862ccmr6292849wmq.108.1658693705159; 
 Sun, 24 Jul 2022 13:15:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uuRx/wU5NQqtwBn5eDMRUu4h4Xzgsm5XmvnoiDQbrqTXU/ISSTDKN57eKI3H4AHbrm5rUtyw==
X-Received: by 2002:a05:600c:4e94:b0:3a3:4448:62cc with SMTP id
 f20-20020a05600c4e9400b003a3444862ccmr6292836wmq.108.1658693704845; 
 Sun, 24 Jul 2022 13:15:04 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b12-20020a05600c4e0c00b003a2fde6ef62sm12180954wmq.7.2022.07.24.13.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 13:15:04 -0700 (PDT)
Message-ID: <efcccedb-58e0-13a8-5c21-2e519e9fc335@redhat.com>
Date: Sun, 24 Jul 2022 22:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
 <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
 <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJpr1xf9mkfT-FhK9M58syMnWCFXozWHH9L_gxtXOqgh0yw@mail.gmail.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/22 22:10, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 22:51, Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> On 7/24/22 20:47, Javier Martinez Canillas wrote:
>>> Hello Dmitry,
>>
>> [...]
>>
>>>> Now there is no point in having this as a separate function. Could you
>>>
>>> The only reason why I kept this was to avoid duplicating the same comment
>>> in two places. I thought that an inline function would be better than that.
>>>
>>>> please inline it?
>>>>
>>
>> Or do you mean inline it as dropping the wrapper helper and just call to
>> drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
>> mentioned then we should probably have to duplicate the comment.
>>
>> Since is marked as inline anyways, the resulting code should be the same.
> 
> Yes, I'd like for you to drop the wrapper. I'm fine with duplicating
> the comment, since it will be in place where it matters (before
> checking ddev->registered) rather than just stating the contract for
> the wrapper (which can be easily ignored).
> 
> (And yes, I do read patches and commit messages before commenting.)
> 

OK. I'll post a v3 tomorrow doing that then. Sorry for the misunderstanding.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

