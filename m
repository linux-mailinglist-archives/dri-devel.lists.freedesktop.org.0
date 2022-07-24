Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F957F6BD
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 21:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B5710E494;
	Sun, 24 Jul 2022 19:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1426F10E494
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 19:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658692263;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r9inbt98jsYkVMrgoCWp1i9QvqhbBgRlizGTcBJDaPI=;
 b=Xy45NyqaTp8a9LBnnNPlffZ+7kcwghDnvwPlcd5v+Rlmfz0ATnIlwB+WTwtyO2MLCM3C+f
 eOIcPqHgZ2qGFo9L6E7G3cmkCwHiiTq14ww0zuFUigHPYuDb8e4s4MOdU13GjltkWSfuuD
 Depk5Q43vAAu1jCJ4rxW82qeJRaGu4I=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-xEibddzgM3W0EZ_mGgFK8Q-1; Sun, 24 Jul 2022 15:50:59 -0400
X-MC-Unique: xEibddzgM3W0EZ_mGgFK8Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so5100221wma.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 12:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=r9inbt98jsYkVMrgoCWp1i9QvqhbBgRlizGTcBJDaPI=;
 b=amoafUYi5KVXN8hfgpXnqAmpmPpIrhLNzN77ZjuhLbQGyfRZlOVRIiFNlzcoeO2KfJ
 msKApTQyn7NPBpW6QRBjU/xbFug22qYpBJC5uOcksZZj6GBJM9FwCy3CIuHGwjPRXktf
 oO3OlvZ0JnmIi9sF8zjMJoZ1MmV+jN52cW+JM5FGYyDnNgL/PG2BhntmbTyhBfw+NLcl
 4p+jEjCDv6PW1pwJwcvPM+QzU3F4YPGN7lZcl/z87c0LoDd8h87WEZrT6tBTITVmBqI9
 vGDn+D31e7hBLv5SpyCF8HHSyr4ZXovEHA7l75aAAvnGUWb73Cd9odx5GCIUsgyyQ+54
 936A==
X-Gm-Message-State: AJIora9uruL4E6s8MPEWV/xPt35mija/e/zXW0X/TQfs7zt9mqTYBqI8
 LL2l8Qk4xUzNwrJexu676c9/gB2CVp6vkV5lm7oe6wCQbTdqr797o5CFwoLYlRGjnA6CxhiiAKt
 hdiE58F6Fzv9oEYGHNWmHfNIM5zLp
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr6458333wmq.73.1658692258573; 
 Sun, 24 Jul 2022 12:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uoDoNu1JLD2TNJP7ydWkOxddGEuigmdMNKn4c8VjBMMj5w1Ik7ZxaOU03qLsLDrorqkPvlCw==
X-Received: by 2002:a05:600c:4fd5:b0:3a3:4664:6d55 with SMTP id
 o21-20020a05600c4fd500b003a346646d55mr6458323wmq.73.1658692258383; 
 Sun, 24 Jul 2022 12:50:58 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o15-20020a05600c510f00b003a30fbde91dsm17433209wms.20.2022.07.24.12.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 12:50:57 -0700 (PDT)
Message-ID: <630a6654-0305-f3a8-e062-f13a0074d35a@redhat.com>
Date: Sun, 24 Jul 2022 21:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220724111327.1195693-1-javierm@redhat.com>
 <CAA8EJppEpPe4nfZ_kvNen6shSvgyUoL3adSQfhhCGCS2VmVZhQ@mail.gmail.com>
 <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
In-Reply-To: <6b3f98db-83bf-41cd-b23d-79b455a06ebd@redhat.com>
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

On 7/24/22 20:47, Javier Martinez Canillas wrote:
> Hello Dmitry,

[...]

>> Now there is no point in having this as a separate function. Could you
> 
> The only reason why I kept this was to avoid duplicating the same comment
> in two places. I thought that an inline function would be better than that.
> 
>> please inline it?
>>

Or do you mean inline it as dropping the wrapper helper and just call to
drm_atomic_helper_shutdown() in both callbacks ? I'm OK with that but as
mentioned then we should probably have to duplicate the comment.

Since is marked as inline anyways, the resulting code should be the same.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

