Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFA47EC928
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 18:02:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060210E55A;
	Wed, 15 Nov 2023 17:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8AD10E0E9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700067743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+K02y8E63N7Hl8bfWpAm+o723A4RMPADnx/bCpWAh0=;
 b=XXqTWg2L50diEQohYgsigYPdGsrN5gKSklC5u+wI42xR64YkbrptZtsQqIuG2wpfogwqrS
 wfRvUk9gwEJWxirW3WddrFNDoMzfve+qtIwKylshjtjBXQByECJAsTUxF67lWb5BWRpDqH
 xrMqwewJMITZgm7iqYpuh/y2NM820y4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-H95olxV_MZOBItHxwYulVw-1; Wed, 15 Nov 2023 12:02:22 -0500
X-MC-Unique: H95olxV_MZOBItHxwYulVw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9e644d94d85so139482666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 09:02:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700067741; x=1700672541;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+K02y8E63N7Hl8bfWpAm+o723A4RMPADnx/bCpWAh0=;
 b=koPeu3eJocQ2a97Jh6+TZo2vNqW7fPKFOyg3KVc2fZS9H7bULo/eOJTPdAXE3geyOy
 iO8XqrkAmlKn5FFpmkLdkWif8Nzo/xbVP6NhYhLm6dgEM7KzEVOGsoM7A+QAxvCsSfgl
 d1MGYgtXH9oEYWByQbkH0XrEqG8sdUij36KQNQBLYYJMzVibapnRidLqeqa/Ia8e8S1u
 YbOOVF0a3G65cqJvqX02SF3bPN1Yr4dzOK93TiOyWmHAJv3pH9gPJFLQAj/Z2BTm+TC4
 GlymUfa19TCO4luTlikmVGLeEFsGCjOltuU3krtfJPHuktUHMfloFtIhX393Nxw9701N
 WGjg==
X-Gm-Message-State: AOJu0Yz4wPle8Fjl4gAQKjR576jMKfO6WyNLm30FoHWKckJrcreO8Fks
 VjLCgHoXjl03fOVp4/DJLLdYWae9HACEj4rjFEKVhl3lEauD/MxhKU2igqw/dot/85lAs3JHFpy
 KdNpJPpsHXqfnqBGRywAYo0S3SxY1
X-Received: by 2002:a17:906:7693:b0:9e5:2b00:506f with SMTP id
 o19-20020a170906769300b009e52b00506fmr5192456ejm.15.1700067740251; 
 Wed, 15 Nov 2023 09:02:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmyLGRL3GwYsNwyV1gH7JktmROiYMN6I3Eellr851VhdnrwoZiNzuZ1mX4o6IaWOpV/CLtUA==
X-Received: by 2002:a17:906:7693:b0:9e5:2b00:506f with SMTP id
 o19-20020a170906769300b009e52b00506fmr5192406ejm.15.1700067739689; 
 Wed, 15 Nov 2023 09:02:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de9c:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:de9c:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a1709061b0900b0099bcf9c2ec6sm7283726ejg.75.2023.11.15.09.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 09:02:19 -0800 (PST)
Message-ID: <05cf6199-3884-4e46-90ac-0b8df7420af7@redhat.com>
Date: Wed, 15 Nov 2023 18:02:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] Documentation/gpu: VM_BIND locking document
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20231115124937.6740-1-thomas.hellstrom@linux.intel.com>
 <ZVTfmbDz1HGqt4Ef@pollux>
 <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <62cdf31f6dbbb3a114755affc89d22fde875c3ff.camel@linux.intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, linux-kernel@vger.kernel.org,
 Oak Zeng <oak.zeng@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/23 17:04, Thomas Hellström wrote:
> Hi, Danilo,
> 
> On Wed, 2023-11-15 at 16:11 +0100, Danilo Krummrich wrote:
>> On Wed, Nov 15, 2023 at 01:49:37PM +0100, Thomas Hellström wrote:
>>> Add the first version of the VM_BIND locking document which is
>>> intended to be part of the xe driver upstreaming agreement.
>>>
>>> The document describes and discuss the locking used during exec-
>>> functions, evicton and for userptr gpu-vmas. Intention is to be
>>> using the
>>> same nomenclature as the drm-vm-bind-async.rst.
>>>
> 
> Thanks for reviewing. I'll update the document accordingly except for
> the s/an rwsem/a rwsem/g, I think it's "an rwsem" similarly to "an r".

I read it as "read-write-sem". Would you read it as "ar-double-u-sem"
then I guess?

> 
> /Thomas
> 

