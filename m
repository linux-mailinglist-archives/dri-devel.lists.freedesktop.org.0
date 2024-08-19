Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DA5957341
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 20:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB3810E1A0;
	Mon, 19 Aug 2024 18:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XImdera2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F9EB10E1A0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724092197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4lFIiiMRye69cO2CDTKsNTtf7eVlTg5I3EBKNS16KE8=;
 b=XImdera2207ruSyzRdNYp6BXEEjyxYubzsomsnqXD5ezYClOif6Yiu/4mzWerdbDdmzqAz
 +k/PnmYWe0Z7ycjlfPmbAlWPBm73OQu2t7yxxc8VsmI36FYDfnaCLuNox0D2+NaF4Dx6r6
 D4sATSVqsZ18TFAX5A2Lby/j3JPU/kI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-_o5ANTNTPPqNmaLOfCVGpg-1; Mon, 19 Aug 2024 14:29:56 -0400
X-MC-Unique: _o5ANTNTPPqNmaLOfCVGpg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4280a434147so38934255e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724092195; x=1724696995;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4lFIiiMRye69cO2CDTKsNTtf7eVlTg5I3EBKNS16KE8=;
 b=FbfR8TOCDvhaJakMER6bkCwF0piPUUE1Mj01M2CoMo7w7mibRkWkQ/L49Z6UaetpEK
 MlBCn9rD/nlahs1VJxh+ShnB5C0JzP3ZD1mgoBwGKp5v3AJlTONKglYMbfVO94AT7Aov
 H+z1CbWmQLWzkk8Mk13n/Vs9QrtjFTGndebsiEYUm/ev1Lkqvm9NIWTPZ4aOQKYHqEFJ
 I60aG6bP1af6AO2Ij5O2uqX3GX4G+5eMEDOGkLIsJRwsIDBn/nKOitttNzj/yR7GWayU
 72FId2GsI9iME1In1dEo/Q3jl7tSgl0VP66GQy3bBQ4wu7PSD+RVH1WOfy+00YOFjl84
 loWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Q3ATbDKQGNePaKE9AcPR4tQi0s7rqT1QqaRHO9diz2V1QFKAZYObUgUyuie+rS7+oEevU2F7vUT7Nq6G/IYQ4/fRkkfuqniASfBO11Dc
X-Gm-Message-State: AOJu0YxfElQIADOGYOCiVYENnp86Rt3Lbi0Wx9XVszXXuJB25QTw98c2
 7yWlJlUnYTnyqj7RB7fdq76SYrxEwp4cdnI2cKfR6mDkkwTXrtVNE6BxnwTIdpmIl70Db3d6da7
 aw0FrrksoTrK3fer/WF47a/kYbnoTwtS9tv5Rk5/LwkRLql+KRcEbGppvcTd66R+lRA==
X-Received: by 2002:a05:600c:19c9:b0:428:151b:e8e with SMTP id
 5b1f17b1804b1-429ed79c7a5mr83715115e9.10.1724092195178; 
 Mon, 19 Aug 2024 11:29:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGk0CorVXceopfXeadLKMfCM8Ki34PcTWH20nY6bDKinP9SMpodZdRD2jpn/mC1ynyKYRSJEA==
X-Received: by 2002:a05:600c:19c9:b0:428:151b:e8e with SMTP id
 5b1f17b1804b1-429ed79c7a5mr83714895e9.10.1724092194626; 
 Mon, 19 Aug 2024 11:29:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5bfsm174369695e9.46.2024.08.19.11.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 11:29:54 -0700 (PDT)
Message-ID: <b1e442df-83dd-402f-a9d6-00a7c8c51954@redhat.com>
Date: Mon, 19 Aug 2024 20:29:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Use XRGB8888 also for big endian systems
To: Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <20240816131310.1008205-1-jfalempe@redhat.com>
 <874j7gld19.fsf@minerva.mail-host-address-is-not-set>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <874j7gld19.fsf@minerva.mail-host-address-is-not-set>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/08/2024 17:58, Javier Martinez Canillas wrote:
> Jocelyn Falempe <jfalempe@redhat.com> writes:
> 
> Helo Jocelyn,
> 
> AFAICT your patch is doing two things:
> 
>> Mesa doesn't support BGRX8888, that means most wayland compositors
>> doesn't work on big endian guests.
>>
> 
> 1) Dropping the BGR{A,X}8888 support.
> 
>> Also the colors are inverted when testing a s390x VM on a s390x host.
>> So I fixed the DRM_FORMAT -> VIRTIO_GPU_FORMAT on big endian guests.
>> It may break big-endian guest on little-endian host, but then the
>> fix should be in qemu, because we don't know the host endianess in
>> the guest VM.
>>
> 
> 2) Fix the format translation to take into account the guest endianess.
> 
> Maybe is better to split the changes in two separate patches ?

Yes, I will send a v2 with 2 patches, that would be better.
> 
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
> 
> The patch makes sense to me though from your explanations.
> 
> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
> 

Thanks for the review.

-- 

Jocelyn

