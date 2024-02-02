Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2299784760B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 18:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DF10E1AD;
	Fri,  2 Feb 2024 17:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="aKDxY839";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1C610E05B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 17:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706894687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR9kxX8LamvTtOW2aP7TGdeFVn3e+6VB6fTyt9wV3EY=;
 b=aKDxY839FlBRvYngU1pP/fSQdo+TM4tUM0skuYnDUywQDu9kz+b5re37JKg4DjSKmMkmkm
 +0JzEvwDEOddp6o/AflaZZQQnlMtVmh3pK/RXYJRmHuxp59ShOqF2NluUJ43l+7+OvB+z2
 4bX4g05I8xryg7U6Oif0lqO58FYo6ss=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-8ycmzhp1NXe0fIDdq15zfA-1; Fri, 02 Feb 2024 12:24:45 -0500
X-MC-Unique: 8ycmzhp1NXe0fIDdq15zfA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a357c92f241so146269266b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 09:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706894682; x=1707499482;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PR9kxX8LamvTtOW2aP7TGdeFVn3e+6VB6fTyt9wV3EY=;
 b=I/sPGlcqIeUKLfW5ggDSR5NUml8FEn+WZ+ZnYuydcV1YmHk/VhEyYLHx6w4NewYPkW
 B6KtjSElLvQqeuQZ7KurnPoDQYTz/Y3tXO7j8cJuFrEfmd/aKGwrXsb2YSM5DVXTvu/z
 gjt7FAUeUvmgzEIUMYJ6/uC16eXgUXQrWzSjcPH5Waafxg9JJEUKvnw/HFnxoBMgMBCI
 D3ybBF9pzNxgt8u/r2rCVvMGDpB8eFVqc240t5r5VUJiQnifnnduJgCaw+a7cBCJrplh
 csTApl/PZSEekntIUQdVKHxSQQupPo3zZtq1I3qxpgvh/GUlLBHlniPDzyLTSbvOAFQk
 lUIQ==
X-Gm-Message-State: AOJu0Ywj1bhpQ0uX+q08f0ngJX469Ei/qJKYGVNpQfVQ1JZftHlNnu32
 6IThvD6hjSTIq4JU4sByI5fecy3JurKT/xz0nTL82smdC1g47z46a5fCYTsbNiQVUZRhxd/65Zb
 aJrl3gm6DkiIi3FSIhSe8bB/evic/GIwTD4QruMfNiiIhEAuqgVglLVAVEjIa/vgeew==
X-Received: by 2002:a17:907:7843:b0:a37:319a:38eb with SMTP id
 lb3-20020a170907784300b00a37319a38ebmr360105ejc.0.1706894682605; 
 Fri, 02 Feb 2024 09:24:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEt8w6p84sMHOJSfZibvUkQPXI8mvCcukNAxY5GZC3AlBTh3NCHIb+7Crh8iBNkA83HESz25A==
X-Received: by 2002:a17:907:7843:b0:a37:319a:38eb with SMTP id
 lb3-20020a170907784300b00a37319a38ebmr360092ejc.0.1706894682352; 
 Fri, 02 Feb 2024 09:24:42 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWTL2A4x27iGLnCsksvK2YWnZzEynpuvQY4pY4zMtAU/KvmFzdEHdRNGrci8xKvfz4pYUOtv2L3zaYuW3bbFzhnfgyrjirMTbQIXYPu0e00t/Bruvn+DvarNJ6gavm75H++Z+dI3mKfqB8Wru0myGHuVP27c8HNiDXxoE9RtsfQ87LDr2/c7Q==
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 cu9-20020a170906ba8900b00a37116e2885sm712133ejd.84.2024.02.02.09.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Feb 2024 09:24:41 -0800 (PST)
Message-ID: <57c944d6-153b-480c-88b9-14fdcecaec50@redhat.com>
Date: Fri, 2 Feb 2024 18:24:40 +0100
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
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <eeecdd4b5daff8a831b6f11671a2205504e5173a.camel@nvidia.com>
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

On 2/2/24 18:14, Timur Tabi wrote:
> On Fri, 2024-02-02 at 01:05 +0100, Danilo Krummrich wrote:
>> nouveau_abi16_ioctl_channel_alloc() and nouveau_cli_init() simply call
>> their corresponding *_fini() counterpart. This can lead to
>> nouveau_sched_fini() being called without struct nouveau_sched ever
>> being initialized in the first place.
> 
> Thanks, I've confirmed that these patches do fix the problem

Cool, gonna add your 'Tested-by' then.

- Danilo
  

