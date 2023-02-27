Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C366A4A72
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 19:59:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1ED10E2E1;
	Mon, 27 Feb 2023 18:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2BD10E45F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677524393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJsvYk7GXp8I4COeJ3t1hMqXzf5hp4/G1Bgw17Xxk70=;
 b=gTudn71mDNVN54tOKIo5APKwZa7xQQafnY6kMynfZX2n9VmP4m/Lcl/dU5wE8Jt2mkWirM
 rX59viPa6ho5qXwEm0k7Uod0b9aiuM2a46vg+rCSQpkhJc/a+Z66Wk4YIqrtneO+y2FbE2
 szvm6UiEfairv2lGMBZW2tshNyd9ykU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-76-qfrVvd0vO76vAiryUkmkOQ-1; Mon, 27 Feb 2023 13:59:50 -0500
X-MC-Unique: qfrVvd0vO76vAiryUkmkOQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 da15-20020a056402176f00b004ace822b750so10002155edb.20
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:59:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJsvYk7GXp8I4COeJ3t1hMqXzf5hp4/G1Bgw17Xxk70=;
 b=AkDDTL30QWk92iPAfE0WHeDD4yXj5loEu4ba1YZJhdGERxIhXRUtt6AZ4mB8ZG+qTM
 bge1WCCMFX2d5zx0fEVi4C+Nzapo7zf/GRsIKPb77bxIHHVzvB2fcl+o02AJQAx+9DJ4
 aCdoHhnraXToMC2vjyiEbIyPlMTy6KL7Rx/a/h4eqvr1/xoex8qntNKKsycweZzam69M
 CXkGaaLWX1VLBxnv4XBJabr7WTim8lf9yGekE3dssWXZwEoMF5taop829TIluNlRDlBg
 sqlgnc4LXTAi2fMbxRuTXdKgHWeNnuGAu0vX9Nb7NUI2qf0Ses7m44LBdiYNjHEykuJ1
 GJUA==
X-Gm-Message-State: AO0yUKW8vZYnJFw2OJwovEiX+DypNNayj3EG0XDyDDKJ7L1T9ZUY3tw/
 7QR0b5kxtSRbcw1dDf8Rq7djCIP33EXeejW5YWCBD5esR296GF2cNiLCFKyLlACqS7ZHVYP3SvK
 XEk6J9I5JeogX7u/0rQvQpk0IQXPP
X-Received: by 2002:a17:907:76f3:b0:878:50f7:a35a with SMTP id
 kg19-20020a17090776f300b0087850f7a35amr31180633ejc.72.1677524389408; 
 Mon, 27 Feb 2023 10:59:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/nAXyU6HErE/WKmVJkdOcUhliWwVp6EtClu1WGQ8XxsSLsimgCTlXes6YRi85ETu9ws3e7Hw==
X-Received: by 2002:a17:907:76f3:b0:878:50f7:a35a with SMTP id
 kg19-20020a17090776f300b0087850f7a35amr31180622ejc.72.1677524389137; 
 Mon, 27 Feb 2023 10:59:49 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a17090685d000b008b7a9ff7dfdsm3436723ejy.162.2023.02.27.10.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 10:59:48 -0800 (PST)
Message-ID: <f5b0e10a-d7ab-66cb-95dd-48c8f7aa3a46@redhat.com>
Date: Mon, 27 Feb 2023 19:59:47 +0100
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
 <67942a68-2ae7-8883-25d7-c6d595c3587e@redhat.com>
 <Y/z4QMyIkZLi4Ruw@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y/z4QMyIkZLi4Ruw@casper.infradead.org>
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

On 2/27/23 19:36, Matthew Wilcox wrote:
> On Mon, Feb 27, 2023 at 06:39:33PM +0100, Danilo Krummrich wrote:
>> On 2/21/23 19:31, Matthew Wilcox wrote:
>>> Lockdep will shout at you if you get it wrong ;-)  But you can safely
>>> take the spinlock before calling mas_store_gfp(GFP_KERNEL) because
>>> mas_nomem() knows to drop the lock before doing a sleeping allocation.
>>> Essentially you're open-coding mtree_store_range() but doing your own
>>> thing in addition to the store.
>>
>> As already mentioned, I went with your advice to just take the maple tree's
>> internal spinlock within the GPUVA manager and leave all the other locking
>> to the drivers as intended.
>>
>> However, I run into the case that lockdep shouts at me for not taking the
>> spinlock before calling mas_find() in the iterator macros.
>>
>> Now, I definitely don't want to let the drivers take the maple tree's
>> spinlock before they use the iterator macro. Of course, drivers shouldn't
>> even know about the underlying maple tree of the GPUVA manager.
>>
>> One way to make lockdep happy in this case seems to be taking the spinlock
>> right before mas_find() and drop it right after for each iteration.
> 
> While we don't have any lockdep checking of this, you really shouldn't be
> using an iterator if you're going to drop the lock between invocations.
> The iterator points into the tree, so you need to invalidate the iterator
> any time you drop the lock.

The tree can't change either way in my case. Changes to the DRM GPUVA 
manager (and hence the tree) are protected by drivers, either by 
serializing tree accesses or by having another external lock ensuring 
mutual exclusion. Just as a reminder, in the latter case drivers usually 
lock multiple transactions to the manager (and hence the tree) to ensure 
they appear atomic.

So, really the only purpose for me taking the internal lock is to ensure 
I satisfy lockdep and the maple tree's internal requirements on locking 
for future use cases you mentioned (e.g. slab cache defragmentation).

It's the rcu_dereference_check() in mas_root() that triggers in my case:

[   28.745706] lib/maple_tree.c:851 suspicious rcu_dereference_check() 
usage!

                stack backtrace:
[   28.746057] CPU: 8 PID: 1518 Comm: nouveau_dma_cop Not tainted 
6.2.0-rc6-vmbind-0.2+ #104
[   28.746061] Hardware name: ASUS System Product Name/PRIME Z690-A, 
BIOS 2103 09/30/2022
[   28.746064] Call Trace:
[   28.746067]  <TASK>
[   28.746070]  dump_stack_lvl+0x5b/0x77
[   28.746077]  mas_walk+0x16d/0x1b0
[   28.746082]  mas_find+0xf7/0x300
[   28.746088]  drm_gpuva_in_region+0x63/0xa0
[   28.746099]  __drm_gpuva_sm_map.isra.0+0x465/0x9f0
[   28.746103]  ? lock_acquire+0xbf/0x2b0
[   28.746111]  ? __pfx_drm_gpuva_sm_step+0x10/0x10
[   28.746114]  ? lock_is_held_type+0xe3/0x140
[   28.746121]  ? mark_held_locks+0x49/0x80
[   28.746125]  ? _raw_spin_unlock_irqrestore+0x30/0x60
[   28.746138]  drm_gpuva_sm_map_ops_create+0x80/0xc0
[   28.746145]  uvmm_bind_job_submit+0x3c2/0x470 [nouveau]
[   28.746272]  nouveau_job_submit+0x60/0x450 [nouveau]
[   28.746393]  nouveau_uvmm_ioctl_vm_bind+0x179/0x1e0 [nouveau]
[   28.746510]  ? __pfx_nouveau_uvmm_ioctl_vm_bind+0x10/0x10 [nouveau]
[   28.746622]  drm_ioctl_kernel+0xa9/0x160
[   28.746629]  drm_ioctl+0x1f7/0x4b0

> 
> You don't have to use a spinlock to do a read iteration.  You can just
> take the rcu_read_lock() around your iteration, as long as you can
> tolerate the mild inconsistencies that RCU permits.
>

Doing that would mean that the driver needs to do it. However, the 
driver either needs to serialize accesses or use it's own mutex for 
protection for the above reasons. Hence, that should not be needed.


