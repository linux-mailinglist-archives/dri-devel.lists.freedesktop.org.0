Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E003859FBA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 10:32:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882AA10E1FD;
	Mon, 19 Feb 2024 09:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="edc/Z2Zm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652F510E1FD
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708335165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CuNVPzO8lbQqqqy09By91mvZYjrxw+wFc/y+Ht7BtXA=;
 b=edc/Z2ZmfEb6MDbdIX2AIyj4tNJVt1iy1m7wTngd1V51/CvFjs8LLieI7ZO06UUH+4IeY7
 WwuAPM7jEG6fUfsHRJc6TlLO0yoZRy8tDhL0p9ex4NnN7osNP6d1yGX5Ii4TscjztAD/Ov
 Oltl4yOKsmPB2fY01TsK8g5Z+OaNccQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-71744R_oO1KqBMo2XCUfTw-1; Mon, 19 Feb 2024 04:32:43 -0500
X-MC-Unique: 71744R_oO1KqBMo2XCUfTw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a3e7f805eccso37190066b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 01:32:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708335162; x=1708939962;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CuNVPzO8lbQqqqy09By91mvZYjrxw+wFc/y+Ht7BtXA=;
 b=tTUL0DVl8L+IdkLFuM4ULVMLlvmtJvZRx//0QvTtcqpplcuobplyGHL8SYf/6I2NtJ
 ohH0BuZWCuQ3qStGoWuybgbLn1Rf+OV6Wj/BUR/zUVOLyTycUnL6kzclQQnkdGk0rIQR
 oUW9AdTdS6xlguIIGBn/dUZ4LOQpJD5KnwwiCsQS6zV3f4bNVsDylwSF57bVA4NJlpsR
 aTqTvgEXAD2Bxu0KJJC1ZZooqdFuP1FxFEHYkqPfnQkDihhvQ+5dv+Lo6Y+xQstN6j75
 7ocwgtuqcpSOXPgmU9j1oTlHORLp3FbsYA0WErofx8GNE73uAHefsqo6+7xxxsJcfO8W
 nqrA==
X-Gm-Message-State: AOJu0YxUsRVwBQRXzMgKwN0rev3C/y+GM1CGW/d/p8h2V/RHrblIeGzM
 Iae7iBF5hYU9XRd7tnmsKVlYSxhPHScbInBrlQnPtiulqo+B0cRcsbPEqVY2+bhQVqu6sLp+S7f
 7dn8i3GKkmKNHJHLg/nXTef+wUR9tqG09KEOSDYTiIjSyxKVMr+eBC8xreAhCEXfUQA==
X-Received: by 2002:a17:906:af0f:b0:a3e:c94b:a06d with SMTP id
 lx15-20020a170906af0f00b00a3ec94ba06dmr354832ejb.57.1708335162553; 
 Mon, 19 Feb 2024 01:32:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO/kUl8lA4Z0Lofba0KxFxP+BwU3H3Q5ouf9Ox+CY4VGLHHMbkTEJWY1Tt7Sf7pRGjeOr31A==
X-Received: by 2002:a17:906:af0f:b0:a3e:c94b:a06d with SMTP id
 lx15-20020a170906af0f00b00a3ec94ba06dmr354814ejb.57.1708335162206; 
 Mon, 19 Feb 2024 01:32:42 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a170906470200b00a3d0dd84276sm2741827ejq.184.2024.02.19.01.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 01:32:41 -0800 (PST)
Message-ID: <01ff9bf5-0206-4d5c-b799-6213529fc26b@redhat.com>
Date: Mon, 19 Feb 2024 10:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/nouveau: don't fini scheduler if not initialized
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kherbst@redhat.com" <kherbst@redhat.com>,
 "lyude@redhat.com" <lyude@redhat.com>, "airlied@gmail.com"
 <airlied@gmail.com>
References: <20240202000606.3526-1-dakr@redhat.com>
 <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
 <0cabb3e4e1f00dd0b0b3328a4da9bc8fa3ba6929.camel@nvidia.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <0cabb3e4e1f00dd0b0b3328a4da9bc8fa3ba6929.camel@nvidia.com>
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

On 2/15/24 00:48, Timur Tabi wrote:
> On Fri, 2024-02-02 at 17:14 +0000, Timur Tabi wrote:
>> On Fri, 2024-02-02 at 01:05 +0100, Danilo Krummrich wrote:
>>> nouveau_abi16_ioctl_channel_alloc() and nouveau_cli_init() simply call
>>> their corresponding *_fini() counterpart. This can lead to
>>> nouveau_sched_fini() being called without struct nouveau_sched ever
>>> being initialized in the first place.
>>
>> Thanks, I've confirmed that these patches do fix the problem.
> 
> Looks like I spoke too soon, I just hit the problem with the drm-next tree.

Did you apply the patch to drm-next?

> 
> I'm able to repro the problem by having r535_gsp_init() return an error.
> 	r535_gsp_rpc_poll return -EINVAL (I'm testing my own GSP-RM build) and
> nouveau_sched_fini() is called even though nouveau_sched_init() was never
> called.

