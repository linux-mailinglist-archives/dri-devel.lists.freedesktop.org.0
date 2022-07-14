Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A805750C7
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 16:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B8581130FD;
	Thu, 14 Jul 2022 14:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4BF61130E2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 14:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657808864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cz78mnFjzIkSh4ecW8yoUSs4S/2YW/7nJ4PcfLl3hvM=;
 b=d9IL9K/hdITl/hcAyZn5TrA51agEEuWTG3VNwHUKbigtGQJnNyoaNMaXUKGS3t8sAmdPBo
 A4ym1tK6+F+LTYpc6e5eVFEhpVQ1Tf3eSsv36p4F/Rpf6LXM7Y4A/yVoTuLp08M66jahX6
 H4FHrfTh49cRzpdHC3AvwJaPqeQx2B0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-pJpJ2m48Ni6P7N1uHrgvcg-1; Thu, 14 Jul 2022 10:27:43 -0400
X-MC-Unique: pJpJ2m48Ni6P7N1uHrgvcg-1
Received: by mail-ed1-f71.google.com with SMTP id
 y21-20020a056402359500b0043adf65d1a0so1618827edc.10
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 07:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Cz78mnFjzIkSh4ecW8yoUSs4S/2YW/7nJ4PcfLl3hvM=;
 b=ByzN7WW8T9msVWR1l3zpZo5zEh0GlxaDhpJiFTIEtqzDsL+11Uo/uUGdXCjoHpmcvl
 wzPQffr25Ela9YwHjlRkx86RBrPdWOKK1G1zf/Rp9AqgjM4ocqTZQUP6g1URlULZp9sZ
 u0HnlRcXO0GtGuBP2OlCxtZAE0wjBNLS1s1j91f8HuFoHv/u1szhYwEks+Kj3fttrAeg
 d8LN0p6zPPC3zy280/PbbGcFWgsiZAFiGBbEuYG5mVLTH+Bodwm4ShR+5TgXEpJn3pn/
 7+v5gM9Dq9i6dNn0DrKoHAqAA1yDVyIDPF88X15/Zbyp0aluiOxCbchccLUXOtspT9KW
 6Rgw==
X-Gm-Message-State: AJIora9St0HlUSVpWuwraPYGqXUBQWKysvN8fRqkwQOov6qQizSdwi8G
 SnoioJxVPwm7t6vtGcqsm6X3JVfrXbRjCe3rdKw6+7BLb0xJtsMGALZznGbKCeH+8M2AiNUVS8E
 wWCtOvv85qtjxKC70WiZsG4EqF8sa
X-Received: by 2002:a17:907:2cf3:b0:72b:8ac1:a21f with SMTP id
 hz19-20020a1709072cf300b0072b8ac1a21fmr9109474ejc.291.1657808862482; 
 Thu, 14 Jul 2022 07:27:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ty1LxlwMQaUDqd/kUFFh9O52BvtcEFAZw91orw4ZJDpuPzqfnnK+7eTtgC1obuOdRb2F/3KQ==
X-Received: by 2002:a17:907:2cf3:b0:72b:8ac1:a21f with SMTP id
 hz19-20020a1709072cf300b0072b8ac1a21fmr9109462ejc.291.1657808862329; 
 Thu, 14 Jul 2022 07:27:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b40:2ee8:642:1aff:fe31:a15c?
 ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a50fb82000000b0042bdb6a3602sm1084721edq.69.2022.07.14.07.27.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 07:27:41 -0700 (PDT)
Message-ID: <dda65c68-cea4-4323-b061-8fc2048bd604@redhat.com>
Date: Thu, 14 Jul 2022 16:27:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/3] drm/vc4: use drm managed resources
To: Maxime Ripard <maxime@cerno.tech>
References: <20220713085500.1970589-1-dakr@redhat.com>
 <20220713091049.qy4t3j3hh5jgtqum@houat>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20220713091049.qy4t3j3hh5jgtqum@houat>
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
Cc: airlied@linux.ie, emma@anholt.net, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 7/13/22 11:10, Maxime Ripard wrote:
> Hi Danilo,
> 
> On Wed, Jul 13, 2022 at 10:54:57AM +0200, Danilo Krummrich wrote:
>> This patch series converts DRM modeset object allocations from devm_*()
>> to drmm_*() memory allocators, or their corresponding convenience
>> wrappers, respectively, in order to tie the release action to the
>> underlaying struct drm_device.
>>
>> This can prevent potential use-after free issues on driver unload or
>> EPROBE_DEFERRED backoff.
> 
> Yeah, the driver had a lot of this kind of issues.
> 
> As it turns out, at the moment you sent it, I was applying a larger
> series (hopefully) addressing all of them:
> https://lore.kernel.org/all/20220711173939.1132294-1-maxime@cerno.tech/
Ah, great! That's covering even more than the series I sent.
> 
> Maxime

- Danilo

