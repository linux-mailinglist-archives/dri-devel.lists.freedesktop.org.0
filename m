Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BF69CFB3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 15:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCA610E120;
	Mon, 20 Feb 2023 14:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D51A10E120
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676904599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
 b=dJjDqq9nQeGAtaGn/elYkQbmnBvbpDrw1X7OUQKTwZJiInENZvjZL7V6TNiYkReuUVKEke
 jEIs0SlRZs6jw+u9iaUVHv5n1YXXE+Dvs2XO2xRpBTw8inIndPCUmBwJr0tHyIZuvT4dPL
 cJjzlCdhSvyT2EWuuBRziSY2o+9udfc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-uYRZ0B0wP8a4ldB5hS_zow-1; Mon, 20 Feb 2023 09:49:58 -0500
X-MC-Unique: uYRZ0B0wP8a4ldB5hS_zow-1
Received: by mail-ed1-f71.google.com with SMTP id
 ee6-20020a056402290600b004ad51f8fc36so1711753edb.22
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 06:49:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14aOzXv8/LFbctYEfZwWWmrtrURJsidYi3oSxaFz0Xw=;
 b=QAplcJHWZFM+HGayQIcGjhQWtqqOHqo6hS3sIksufQeSssEQx8XN4HKNfchIrTDgxy
 NhcU5BeP+P28M1GxTT89ONiYgE7aqOIzMujNgGi2tu2aOwpoAGyalI5M0YKKXGdjhfmH
 xrmgm9UujOsyxYFj5RuxsUQ3Mya/JNhArp0eDYCs6P4sDOn+FHEWZnMFa0tQgBN7iuzr
 JyAERjxSX+dJkpXzMwNa+apvHF8xzqBTsnocuV5hrVpEX5KnhKP5bDELgmTvSMtpm9WE
 fxyBwdbKT1r19lNwUr1jma2zPKu0LLBIskQCcUt/XttT295SIC5w9VrOoyzN/WwN8hIJ
 Ql5g==
X-Gm-Message-State: AO0yUKUtl7Fqn4i+VkUyK0LffkAE3MtSddR2StqjfcHzzIebDi2rIPVj
 /JzVin8fzElLdZ1ry3x2lsP1NXx/9lWw1bYQEObyr0Y/mkiIoDFh7kd591AALETMhBWrQqEUghH
 WSfZMLW/o5bb69NY+fWOJGtILYqAv
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id
 ck17-20020a170906c45100b0088b4962b72fmr7384961ejb.20.1676904597385; 
 Mon, 20 Feb 2023 06:49:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+98u/y2Cal3np2ksbwfkOOCjcq6rtCsH8aYGEsMo5bVtK+OVJWU6UbYetsNggJNxfOhh/MAw==
X-Received: by 2002:a17:906:c451:b0:88b:4962:b72f with SMTP id
 ck17-20020a170906c45100b0088b4962b72fmr7384942ejb.20.1676904597149; 
 Mon, 20 Feb 2023 06:49:57 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jr14-20020a170906a98e00b008af574fbfc2sm5934451ejb.33.2023.02.20.06.49.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:49:56 -0800 (PST)
Message-ID: <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
Date: Mon, 20 Feb 2023 15:00:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/Xn11dfdn7SfBD@casper.infradead.org>
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
Cc: matthew.brost@intel.com, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, boris.brezillon@collabora.com, bskeggs@redhat.com,
 tzimmermann@suse.de, Liam.Howlett@oracle.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 20:38, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:10PM +0100, Danilo Krummrich wrote:
>> Generic components making use of the maple tree (such as the
>> DRM GPUVA Manager) delegate the responsibility of ensuring mutual
>> exclusion to their users.
>>
>> While such components could inherit the concept of an external lock,
>> some users might just serialize the access to the component and hence to
>> the internal maple tree.
>>
>> In order to allow such use cases, add a new flag MT_FLAGS_LOCK_NONE to
>> indicate not to do any internal lockdep checks.
> 
> I'm really against this change.
> 
> First, we really should check that users have their locking right.
> It's bitten us so many times when they get it wrong.

In case of the DRM GPUVA manager, some users might serialize the access 
to the GPUVA manager and hence to it's maple tree instances, e.g. 
through the drm_gpu_scheduler. In such a case ensuring to hold a lock 
would be a bit pointless and I wouldn't really know how to "sell" this 
to potential users of the GPUVA manager.

> 
> Second, having a lock allows us to defragment the slab cache.  The
> patches to do that haven't gone anywhere recently, but if we drop the
> requirement now, we'll never be able to compact ranges of memory that
> have slabs allocated to them.
> 

Not sure if I get that, do you mind explaining a bit how this would 
affect other users of the maple tree, such as my use case, the GPUVA 
manager?

