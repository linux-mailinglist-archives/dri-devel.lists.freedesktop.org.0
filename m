Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A9D7FCCCC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 03:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A9D910E35E;
	Wed, 29 Nov 2023 02:15:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B8710E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Nov 2023 02:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701224118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKn2JYUpqV3wbekajb5ZS+im7PxpappcmYXHnPLCMOg=;
 b=J5433omzfzB4G/x0ZNdxFjXMVOxE/PQEHMbNczMXThuxUPAc8RdcJfrfBldrc8AeqRrRho
 iCbVjRLDkUDwfbt+CWIPxpwNF8TJf394CEZjKWqeelxBxCSRKHmgnQI9MLu0f337HcNYk6
 Hcp2r2czeLcJBviFRNwt0XcSsBy8XwU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-O9E0-xpdP8mX2y9Hj6fGcQ-1; Tue, 28 Nov 2023 21:15:17 -0500
X-MC-Unique: O9E0-xpdP8mX2y9Hj6fGcQ-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-50aa822cb33so6030463e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 18:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701224115; x=1701828915;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XKn2JYUpqV3wbekajb5ZS+im7PxpappcmYXHnPLCMOg=;
 b=fYxkpfmJ7LYqbelmcmMWyZzYYa7dz1PxaQshS2pBDqay/Cug3/iXTrdiWguRqwRjcw
 ndC4+rmdbO4ZykuOaH0m0QznswxGZrLKAP/Uem1G+6Pv0e6sJ5D+iBI6FAbiaZ8cLcXw
 z0/x8mNz+7fbPG27Oq3XEbPFEMnr8BrxQlwx5U2t/CMFFqWGfi3fuXoa0cOkgNH8AADI
 iF0XAR5Ap3gS759n0OKApuD6C7ez/IbBrUpD/Jd1H3pJ5YxDd1WTIWP6HYS5+VP9mLq9
 fQw4eSUGW/2A7fw7K4dH+eI5syY1mcH6RZqLjuwGo0bGHfAtN9ktf+6n0z62WMjAa4TK
 4vZg==
X-Gm-Message-State: AOJu0YxrHgsUdrD+t5n2AMb2Bitsgv2vcK81hrCLNzlgbMFSsB7kzpk8
 NFT+KgRKS3922a8X+rp59Thn5y18j/Cj1xgHEVC0WGtBjJKzWs2NgP79P3puoxEopR0lCum5t2b
 XGqbzVXz6BnWo0Cb/F5Wp4LKR0qAj
X-Received: by 2002:a05:6512:3196:b0:50b:aa13:a761 with SMTP id
 i22-20020a056512319600b0050baa13a761mr9265067lfe.46.1701224115751; 
 Tue, 28 Nov 2023 18:15:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFS+WKRxrSYw288wOgG/cqzoj+euT0xS28Xc6/AGsdA9evhonP2l07Xitf1dqCow9oSCeSsQQ==
X-Received: by 2002:a05:6512:3196:b0:50b:aa13:a761 with SMTP id
 i22-20020a056512319600b0050baa13a761mr9265061lfe.46.1701224115460; 
 Tue, 28 Nov 2023 18:15:15 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090632cd00b009ca522853ecsm7358196ejk.58.2023.11.28.18.15.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 18:15:14 -0800 (PST)
Message-ID: <81ba79d1-8e7a-41d9-acaf-64f3eee1b97d@redhat.com>
Date: Wed, 29 Nov 2023 03:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Timur Tabi <ttabi@nvidia.com>, "gustavoars@kernel.org"
 <gustavoars@kernel.org>
References: <ZVZbX7C5suLMiBf+@work> <ZVZxXiXYIzEwUE3N@pollux>
 <6517a6a41eb72d16596c913dc56467e0390287a3.camel@nvidia.com>
 <4b10068c-4285-41df-b4bb-4c61ac70a30b@redhat.com>
 <f0662715-928d-4685-8f88-f2129eddab3c@embeddedor.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <f0662715-928d-4685-8f88-f2129eddab3c@embeddedor.com>
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/29/23 02:06, Gustavo A. R. Silva wrote:
> 
> 
> On 11/28/23 19:01, Danilo Krummrich wrote:
>> On 11/16/23 20:55, Timur Tabi wrote:
>>> On Thu, 2023-11-16 at 20:45 +0100, Danilo Krummrich wrote:
>>>> As I already mentioned for Timur's patch [2], I'd prefer to get a fix
>>>> upstream
>>>> (meaning [1] in this case). Of course, that's probably more up to Timur to
>>>> tell
>>>> if this will work out.
>>>
>>> Don't count on it.
>>
>> I see. Well, I think it's fine. Once we implement a decent abstraction we likely
>> don't need those header files in the kernel anymore.
>>
>> @Gustavo, if you agree I will discard the indentation change when applying the
>> patch to keep the diff as small as possible.
> 
> No problem.

Applied to drm-misc-fixes.

> 
> Thanks
> -- 
> Gustavo
> 
> 

