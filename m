Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C506870928
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 19:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC50112426;
	Mon,  4 Mar 2024 18:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Acg/1THe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710D2112428
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709575861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vBjepeaDd7+e3s7rKO9VR+CPderTVwZuDQuLnzWRm24=;
 b=Acg/1THeHLoFn5C1pz6YnUJ69r7SGF3PDecP9z9X7MpkmTMyTddqjhiixg5gZdWwjjh0oC
 oMuqopTHo8xu06GDxpDBAEHgtDwFKGIuP3LNaIx6ipsJopTRGSdTJzn9//ocO+uUJ5fToH
 RUNDeLSU+1x1w0mIW7GCt4CvyY1FqmU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Sm64cS3RNK2PckjIxnRwpQ-1; Mon, 04 Mar 2024 13:10:59 -0500
X-MC-Unique: Sm64cS3RNK2PckjIxnRwpQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-564fec337b1so5882193a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 10:10:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709575858; x=1710180658;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vBjepeaDd7+e3s7rKO9VR+CPderTVwZuDQuLnzWRm24=;
 b=k31DBR5WY9/ZIFalJP8Lhc9DyhV27wGlDacPQBS404ihgoFVZVL93z27WB/7CedPn0
 87ljXTa2HtDYg9juHsAYoRu1RP6aBDJIadW+60Ct4pD3mOZuBbg+lVm/R0X6vGiKDSzN
 sK10W7bK25N6JD7OnGtY/+YKbLYw2vbUlnxUSyDaboVI3172+CLDPSbGSbuOLceOlrRb
 12aiarjBbcD0yd5ssFucQG5jnnp4iHuCdc441l9mhSLl+bEQx4YSgXNHSW6GPOjTGgKY
 M74abiimZl/znE0pLSpnYW1wjp2rtHXi4143f02rxx2Iik8X90hlavQcnd02ifYnyaWl
 FlLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCfyvbeTek/o5I+iBMhQA+8AMD3y6h3/SMsZUWoK2JZStV6KPiTpuwF6bifpQWiMjdm37NNsstTZt5aDyX6c1SoGV1516aowK6MtCSFDcQ
X-Gm-Message-State: AOJu0Yzp0Zoda4VVwVcCmPcX32f4WQD+mnPZ9SLipP7Q2CpVUO+i0JDv
 mFYttJIBZYOKPc28M9we5oucyFUaFUuOExg361NQjVOfHSKqxFAtckTxVhjB6fIYgwKj1RUai33
 W0cgCthlrq4JCfYKB+iVckiWH2oZFYuRCsTT3oEHFW6zQpAKGAmwWxvbkzOoYvGTmjw==
X-Received: by 2002:a05:6402:12d6:b0:565:4b37:4578 with SMTP id
 k22-20020a05640212d600b005654b374578mr248028edx.14.1709575858257; 
 Mon, 04 Mar 2024 10:10:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3t2S0aWyhJ/v1zCmDqncy36MkHWOfwiyAhlwadf3nqgax2jvehgYnODUkmNZDIdWTKSsqoQ==
X-Received: by 2002:a05:6402:12d6:b0:565:4b37:4578 with SMTP id
 k22-20020a05640212d600b005654b374578mr248007edx.14.1709575857934; 
 Mon, 04 Mar 2024 10:10:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 m13-20020aa7d34d000000b0056486eaa669sm4910231edr.50.2024.03.04.10.10.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 10:10:57 -0800 (PST)
Message-ID: <4a3dc556-d7f4-4741-ae5b-6722bd2ce1c1@redhat.com>
Date: Mon, 4 Mar 2024 19:10:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH stable v6.7] drm/nouveau: don't fini scheduler before
 entity flush
To: Greg KH <greg@kroah.com>
Cc: stable@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>
References: <20240304170158.4206-1-dakr@redhat.com>
 <2024030448-basin-grit-b550@gregkh>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <2024030448-basin-grit-b550@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/4/24 18:55, Greg KH wrote:
> On Mon, Mar 04, 2024 at 06:01:46PM +0100, Danilo Krummrich wrote:
>> Cc: <stable@vger.kernel.org> # v6.7 only
> You say 6.7 only, but this commit is in 6.6, so why not 6.6 also?

Good catch, I was sure I originally merged this for 6.7. This fix should indeed
be applied to 6.6 as well. Should have double checked that, my bad.

- Danilo

> 
> thanks,
> 
> greg k-h
> 

