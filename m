Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 355E557F698
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 20:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5534956D0;
	Sun, 24 Jul 2022 18:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC3794B34
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 18:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658688466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
 b=Cc2aDXeFRz7dTmVQbzf+ZS1tYoJgof1T9IlaGIrtmMTalgvjNcUeYJGh7lXx38xqCvYFpu
 il8TPbos85GLlv3xalqDd6mpRp4A9eXAKBqOp6mxo4kOSkGrwwdk3UnnSw/zazO9qXpr0X
 jM7iHAq6dDMnxpGt8stBV0qaiG4DES0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-0NUCDJa4OeWx5cqQg9lZ6w-1; Sun, 24 Jul 2022 14:47:43 -0400
X-MC-Unique: 0NUCDJa4OeWx5cqQg9lZ6w-1
Received: by mail-wm1-f70.google.com with SMTP id
 c17-20020a7bc011000000b003a2bfaf8d3dso5080794wmb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 11:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xHhcfGRCAjt5E9OSivN130xjZgYbsf/HAXgqsJ2fhnE=;
 b=x+LyXzAF0qEU60nQacCskNLSQBnP1d5Ogb6vLcYDyHh211WZFwrDbm9xHACAmGATTq
 VejFNmcYkpXwz/J1zxzpxGIhGNMQUxphFvLeEdCIdgmOr5wv59fkEns0GZS+oAh1XBRI
 LxS7cpOenLJ5IBVsC8BYh2PNpcISqtm6dFfSzHgSoNBRm2IlBvH8/KdNebOTCm3rPwH2
 GsGcAoOGw/yq3QtWH2EGu/p/+WsikvjxDj0xHoHpXbmzen7D3gG4iKp/13ivA+1AGoKc
 GNRf9/oQm0WxPwAZ1WM90nmWjM/o1ctp7zfVxJLfhyg23XX7PgkH7CEH6zK3QxHl0NEb
 okXA==
X-Gm-Message-State: AJIora+OfrH85k8/yKHetOXJbc0XJMDAWksdOB+uvG0pWiAqAq9Udmyy
 JlSFmM6sI3nihqYJR5w0D2kKIPm43tZ0LEP+wAGlejhFdXb2wKaAGnb2ot9/oB7JyPKZOs0TC/i
 DzdA87YcDs675pssT4e2jok44tulN
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id
 r10-20020a05600c284a00b003a2ffb7b56fmr18986264wmb.134.1658688461982; 
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v//byKmdQgT5WvEWcDFD958f9+TODdjybZDGMctnTVoovPF22h8szxUHlYNCu+EncFlDUATg==
X-Received: by 2002:a05:600c:284a:b0:3a2:ffb7:b56f with SMTP id
 r10-20020a05600c284a00b003a2ffb7b56fmr18986246wmb.134.1658688461720; 
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o8-20020a05600c378800b003a2e7c13a3asm11441121wmr.42.2022.07.24.11.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 11:47:41 -0700 (PDT)
Message-ID: <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
Date: Sun, 24 Jul 2022 20:47:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
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

Hello Dmitry,

Thanks for your feedback.

On 7/24/22 20:36, Dmitry Baryshkov wrote:
> On Sun, 24 Jul 2022 at 14:13, Javier Martinez Canillas
> <javierm@redhat.com> wrote:

[...]

>>
>> +/*
>> + * Shutdown the hw if we're far enough along where things might be on.
>> + * If we run this too early, we'll end up panicking in any variety of
>> + * places. Since we don't register the drm device until late in
>> + * msm_drm_init, drm_dev->registered is used as an indicator that the
>> + * shutdown will be successful.
>> + *
>> + * This function must only be called if drm_dev->registered is true.
>> + */
>> +static inline void msm_shutdown_hw(struct drm_device *dev)
>> +{
>> +       drm_atomic_helper_shutdown(dev);
>> +}
> 
> Now there is no point in having this as a separate function. Could you

The only reason why I kept this was to avoid duplicating the same comment
in two places. I thought that an inline function would be better than that.

> please inline it?
>

That's already the case. Sorry but I have to ask, do you read my patches
before commenting? I have the feeling that is the second time that you ask
for something that was already done in the patch.
 
[...]

>>
>> -       if (!priv || !priv->kms)
>> -               return;
>> -
>> -       drm_atomic_helper_shutdown(drm);
> 
> It might be worth repeating the comment here.
>

As mentioned I thought about it. But then decided that an inline function would
be better to have the comment just in one place. I don't have a strong opinion
though so I could change if others agree that duplicating the comment is better.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

