Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134CF69FA2D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:28:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 245F910E1DB;
	Wed, 22 Feb 2023 17:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B52710E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677086915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lQEMvrvrwWUFc87bAMj47uqR0LzAryMK3MqNTl4bkt8=;
 b=SVEoTXaqSb1deJBae1mZuR96cIntaS3bvX8YAzUgOiJIZCZsuelngurtKp4rA62gDRm/qT
 h6L+awSlW1AqRAcjCr3DR5sFXpj8jjS5OvLzEjVJoI5xxVQ0P3emhRBR9Yha5iQaK5DHtz
 FPe3NwlnAgN/jUmraWiUr3ADnzs/X34=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-N1u0KRbPPuqp9QrMawUYIw-1; Wed, 22 Feb 2023 12:28:34 -0500
X-MC-Unique: N1u0KRbPPuqp9QrMawUYIw-1
Received: by mail-ed1-f72.google.com with SMTP id
 eh16-20020a0564020f9000b004acc4f8aa3fso11675953edb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 09:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lQEMvrvrwWUFc87bAMj47uqR0LzAryMK3MqNTl4bkt8=;
 b=1bco1F633Q1p7QWBxvYeCtuxvO6dfgvdXc8UDmyY52bnt0BdVvGeE/L0YFyBlb3deR
 XJI+cXpfiJ1Uto1nnWSNSbhWbs7+5Y3+o5QnOupvdLy7q7amwJjdFDSuUuu+1YGaiR89
 1tS4RDJFkd+Bnp+TiehQGI05i4KbE3e6L9K7qoDB1SR150invicLTvFL065kkLcY9mc1
 6Y47OVXRZzljeCkufh+agUTAfDvbk2+ROtpkKzxwagB1+sUqosc5W7OhJu/cvk4Fzr4y
 QeV9k0SHtyR1A34rKMeu8otWnVFznqrWRJ33G/X1/UM3Mb+XgBUok31GdMVmV2f7U8O0
 VUVw==
X-Gm-Message-State: AO0yUKUHabTTTAop6Nh1VzgJyfD/HYcWELvbASMez8wym2muTF/HLMAz
 yVq7ca+dXAFpXXbBpKaeMYIJg/LhAl0ZB/3fxaqjo5W1PQfnpzg/wONVRuKJwv7uHYuYggii9Co
 yrh+2cixVHnKmXG0nvCQjQu1RN6m6
X-Received: by 2002:a17:907:9849:b0:8b2:37b5:cc9 with SMTP id
 jj9-20020a170907984900b008b237b50cc9mr18174579ejc.17.1677086912718; 
 Wed, 22 Feb 2023 09:28:32 -0800 (PST)
X-Google-Smtp-Source: AK7set94oya+ivN5E0zBN+ZdUeHEWzDxgBB5z1krpgZihRLpdYMOicX3tApmaLmAqifgXi7BlCrlcA==
X-Received: by 2002:a17:907:9849:b0:8b2:37b5:cc9 with SMTP id
 jj9-20020a170907984900b008b237b50cc9mr18174547ejc.17.1677086912440; 
 Wed, 22 Feb 2023 09:28:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a17090674ca00b008ec43ae626csm16880ejl.167.2023.02.22.09.28.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 09:28:31 -0800 (PST)
Message-ID: <99d72837-894a-44c0-4be5-e20755ebab10@redhat.com>
Date: Wed, 22 Feb 2023 18:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 04/16] maple_tree: add flag MT_FLAGS_LOCK_NONE
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-5-dakr@redhat.com>
 <Y+/Xn11dfdn7SfBD@casper.infradead.org>
 <3bb02ec3-4d19-9135-cabc-26ed210f7396@redhat.com>
 <Y/ONYhyDCPEYH1ml@casper.infradead.org>
 <e43f6acc-175d-1031-c4a2-67a6f1741866@redhat.com>
 <Y/PZH/q2Xsr3od9m@casper.infradead.org> <Y/TXPasvkhtGiR+w@pollux>
 <Y/UN50hCaRe+8ZCg@casper.infradead.org>
 <91d34e47-10f6-8278-ef4c-72cdfa24e038@redhat.com>
 <Y/ZDjJmc4aGRGyVn@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y/ZDjJmc4aGRGyVn@casper.infradead.org>
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

On 2/22/23 17:32, Matthew Wilcox wrote:
> On Wed, Feb 22, 2023 at 05:11:34PM +0100, Danilo Krummrich wrote:
>> On 2/21/23 19:31, Matthew Wilcox wrote:
>>> on tue, feb 21, 2023 at 03:37:49pm +0100, danilo krummrich wrote:
>>>> It feels a bit weird that I, as a user of the API, would need to lock certain
>>>> (or all?) mas_*() functions with the internal spinlock in order to protect
>>>> (future) internal features of the tree, such as the slab cache defragmentation
>>>> you mentioned. Because from my perspective, as the generic component that tells
>>>> it's users (the drivers) to take care of locking VA space operations (and hence
>>>> tree operations) I don't have an own purpose of this internal spinlock, right?
>>>
>>> You don't ... but we can't know that.
>>
>> Thanks for the clarification. I think I should now know what to for the
>> GPUVA manager in terms of locking the maple tree in general.
>>
>> Though I still have very limited insights on the maple tree I want to share
>> some further thoughts.
>>
>>  From what I got so far it really seems to me that it would be better to just
>> take the internal spinlock for both APIs (normal and advanced) whenever you
>> need to internally.
> 
> No.  Really, no.  The point of the advanced API is that it's a toolbox
> for doing the operation you want, but isn't a generic enough operation
> to be part of the normal API.

Again the disclaimer, I'm just sharing my thoughts from the perspective 
of a user from a generic tree API.

For me it feels like - and this purely is an assumption, hence please 
correct me if I'm wrong on that - you consider the advanced API to be 
more of a collection of internal functions not *really* being meant to 
be used by arbitrary users and maybe even being slightly tied to mm 
since it originated there?

However, from my external perspective I see it the following way.

Even if an operation is not part of the 'normal API', but an API called 
'advanced API', it still is a generic API operation being exposed to 
arbitrary users. However, my point is not (at least not exclusively) 
that I do not consider this to be safe enough or something.

Its just that I think that when the API *enforces* the user to take an 
internal lock at certain places it can also just take the lock itself no 
matter what the API is being called. Especially when one can't rely on 
this lock at all for other (external) purposes anyways because the 
implementation behind the API is free to drop the lock whenever it needs to.

> To take an example from the radix
> tree days, in the page cache, we need to walk a range of the tree,
> looking for any entries that are marked as DIRTY, clear the DIRTY
> mark and set the TOWRITE mark.  There was a horrendous function called
> radix_tree_range_tag_if_tagged() which did exactly this.  Now look at
> the implementation of tag_pages_for_writeback(); it's a simple loop over
> a range with an occasional pause to check whether we need to reschedule.
> 
> But that means you need to know how to use the toolbox.  Some of the
> tools are dangerous and you can cut yourself on them.
> 
>> Another plus would probably be maintainability. Once you got quite a few
>> maple tree users using external locks (either in the sense of calling
> 
> I don't want maple tree users using external locks.  That exists
> because it was the only reasonable way of converting the VMA tree
> from the rbtree to the maple tree.  I intend to get rid of
> mt_set_external_lock().  The VMAs are eventually going to be protected
> by the internal spinlock.
> 

But the argument also holds for the case of using the advanced API and 
using the internal spinlock. If your requirements on locking change in 
the future every user implementation must be re-validated.

