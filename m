Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFD7791F04
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 23:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB3D10E408;
	Mon,  4 Sep 2023 21:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AECB10E409
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 21:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693863154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nhRkXMoYCNeo8HGCMD9oHKpY5o3vL1RRFO5aL/xHKUM=;
 b=ZwpD57dyANJMDVRgebqvU/NlDOzpZ7OO/R2wqjkuh9JXekJ+0hNcHO0cweKy9v2QAya0xr
 o89Qu8b+c3sBULPVOYvVcaihVfgh+gc9wgS8+KghrVbkjcBLEIoZIXgkRZS2nwIYDg/oeM
 DOE+sHekT2SjWG0xFS+b5kDZAsFpeq4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-QqwlE80EPtqggCFvrWuHTw-1; Mon, 04 Sep 2023 17:32:33 -0400
X-MC-Unique: QqwlE80EPtqggCFvrWuHTw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9a5cd04315aso134658566b.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 14:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693863152; x=1694467952;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhRkXMoYCNeo8HGCMD9oHKpY5o3vL1RRFO5aL/xHKUM=;
 b=TEzLwwalZQYqRhM7CwwDoIPUyYGXykmbyZyD7WWgYzO1PZbbFjy54fK/hM8y4Z8K5L
 iIKGkY3tZ3Hj5JZ7FeN29pSb/sDuQTYG/jRxrUCtU00yJvSfMFrwuJec9U8GjvGYYbrW
 vQXB9Tq0jZqlqobO8gok0bkU4QJRjuklohKq7MH9BXaDo6aeNAf7vaWTF2omrRImsaje
 SuaxF5rqPq53M6o0MZVgnyBYImZWemmPP3xrNp3k9j67MBz1nA+lpdWZepgZWwopv8cN
 6AwEI/Ig8iHK87gkJHtnZ+J41H8FyU03bi+igp0lJo9pkdX4qUdGB3PIqhREnip34FGJ
 8yXg==
X-Gm-Message-State: AOJu0YyKUe5On7bByGWCi5Mtkw7OzqoTqHhi6r7qLweJZfA7VCpkX5st
 vDy7KrRO4jMoQjq3/PWuXs+wyqtuka1PM5JdahOFrSqm07/EPDQYcPXcEyMjvM9fgKsDY/hzQz9
 6KUlsZmNwmTcC+1OBqqY3TYV1tk8nH/FiN0sm
X-Received: by 2002:a17:907:58d:b0:9a2:1b6d:eeca with SMTP id
 vw13-20020a170907058d00b009a21b6deecamr7313651ejb.44.1693863152337; 
 Mon, 04 Sep 2023 14:32:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW2eQ4JT/dEoni0dG2C3NUm3hs7HkAMf8+zXF8J0LTw7OR14+5DGuYh1v0QOlZNmrfwfOApQ==
X-Received: by 2002:a17:907:58d:b0:9a2:1b6d:eeca with SMTP id
 vw13-20020a170907058d00b009a21b6deecamr7313643ejb.44.1693863151982; 
 Mon, 04 Sep 2023 14:32:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a1709066d9200b0099b5a71b0bfsm6697809ejt.94.2023.09.04.14.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 14:32:31 -0700 (PDT)
Message-ID: <8d38c7a4-03de-a9ed-13a2-3044352392e9@redhat.com>
Date: Mon, 4 Sep 2023 23:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] drm/doc/rfc: Mark DRM_VM_BIND as complete.
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org
References: <20230829163005.54067-1-rodrigo.vivi@intel.com>
 <20230829163005.54067-3-rodrigo.vivi@intel.com> <ZPDlqqBghH3FE4HE@intel.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <ZPDlqqBghH3FE4HE@intel.com>
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
Cc: daniel.vetter@ffwll.ch, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On 8/31/23 21:10, Rodrigo Vivi wrote:
> On Tue, Aug 29, 2023 at 12:30:03PM -0400, Rodrigo Vivi wrote:
>> The consensus is for individual drivers VM_BIND uapis with
>> the GPUVA helpers that are already implemented and merged
>> upstream.
>>
>> The merged GPUVA documentation also establish some overall
>> rules for the locking to be followed by the drivers.
> 
> Danilo, do you agree with this?
> if nothing is missing on that front, could you please ack this patch?

I agree with the above, hence:

Acked-by: Danilo Krummrich <dakr@redhat.com>

However, the documentation below seems to be more about a common DRM_VM_BIND IOCTL?
I guess your commit refers to the end where it talks about common VM_BIND helpers.

Otherwise the patch is moving the "DRM_VM_BIND" paragraph somewhere below the
"Dev_coredump"paragraph. Is there some kind of "Done-Section" I'm missing?

- Danilo

> 
>>
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   Documentation/gpu/rfc/xe.rst | 34 +++++++++++++++++-----------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/Documentation/gpu/rfc/xe.rst b/Documentation/gpu/rfc/xe.rst
>> index bf60c5c82d0e..a115526c03e0 100644
>> --- a/Documentation/gpu/rfc/xe.rst
>> +++ b/Documentation/gpu/rfc/xe.rst
>> @@ -106,23 +106,6 @@ our tree. Missing Nouveau patches should *not* block Xe and any needed GPUVA
>>   related patch should be independent and present on dri-devel or acked by
>>   maintainers to go along with the first Xe pull request towards drm-next.
>>   
>> -DRM_VM_BIND
>> ------------
>> -Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
>> -fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
>> -development of a common new drm_infrastructure. However, the Xe team needs to
>> -engage with the community to explore the options of a common API.
>> -
>> -As a key measurable result, the DRM_VM_BIND needs to be documented in this file
>> -below, or this entire block deleted if the consensus is for independent drivers
>> -vm_bind ioctls.
>> -
>> -Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> -Xe merged, it is mandatory to enforce the overall locking scheme for all major
>> -structs and list (so vm and vma). So, a consensus is needed, and possibly some
>> -common helpers. If helpers are needed, they should be also documented in this
>> -document.
>> -
>>   ASYNC VM_BIND
>>   -------------
>>   Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> @@ -230,3 +213,20 @@ Later, when we are in-tree, the goal is to collaborate with devcoredump
>>   infrastructure with overall possible improvements, like multiple file support
>>   for better organization of the dumps, snapshot support, dmesg extra print,
>>   and whatever may make sense and help the overall infrastructure.
>> +
>> +DRM_VM_BIND
>> +-----------
>> +Nouveau, and Xe are all implementing ‘VM_BIND’ and new ‘Exec’ uAPIs in order to
>> +fulfill the needs of the modern uAPI. Xe merge should *not* be blocked on the
>> +development of a common new drm_infrastructure. However, the Xe team needs to
>> +engage with the community to explore the options of a common API.
>> +
>> +As a key measurable result, the DRM_VM_BIND needs to be documented in this file
>> +below, or this entire block deleted if the consensus is for independent drivers
>> +vm_bind ioctls.
>> +
>> +Although having a common DRM level IOCTL for VM_BIND is not a requirement to get
>> +Xe merged, it is mandatory to enforce the overall locking scheme for all major
>> +structs and list (so vm and vma). So, a consensus is needed, and possibly some
>> +common helpers. If helpers are needed, they should be also documented in this
>> +document.
>> -- 
>> 2.41.0
>>
> 

