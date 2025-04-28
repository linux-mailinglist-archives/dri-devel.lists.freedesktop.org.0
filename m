Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EE9A9FA61
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E5E10EA05;
	Mon, 28 Apr 2025 20:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VQkOGBZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440FC10EA05
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 20:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745871601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JvsTuXjn7VdpRaYIi2+HwQJx87fn25wHprZJ8iJ1PNg=;
 b=VQkOGBZdjETqAw7zhsxCdZ46dNpgXDygk7HY4G9fSDI04JsnheCG0OXQof2PAjNoxplicd
 DHOR56CPZJBnQm0sUYTKTCtHypgU7ii4t5H2wNqeuLrqcnMMPRlF/M72CyT937MYPnQDag
 sVOMIlDDX8+qLE5dzGYJ1x7uX8h6zzI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-300-IERJZ6RNMW-YrQveJ6lb2g-1; Mon, 28 Apr 2025 16:19:59 -0400
X-MC-Unique: IERJZ6RNMW-YrQveJ6lb2g-1
X-Mimecast-MFC-AGG-ID: IERJZ6RNMW-YrQveJ6lb2g_1745871598
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d00017e9dso29251555e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 13:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745871598; x=1746476398;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JvsTuXjn7VdpRaYIi2+HwQJx87fn25wHprZJ8iJ1PNg=;
 b=j3YNxqgOzB2PTwaGHz2GE9YnfiWac3rQTVbIZ2PUFSR+mgDq0Zf528kcKptOfKEftc
 07YDmHxvThxyN/SYGA6lJW/zks8BiVpp5tqIVXZDHNreHH5uOSmVR044+GrOTTQ4myKE
 n2sf7ZBtwEfm/dUWhQiW46ISAhEKWPAfFhHq3Fyemof32hJ9K6SlbmJc5aXeTFmPl3Bw
 7Jkcs1n5mVULHSeV9HYbcA10VZ9cQYBODUIs6ciH9gopq1Au9FeKH8LWcYBCqkhqrNne
 AEtfbceln4mLZqtgVTMmID8EBQxigJ0pM7P8Mf+IihiKmYwhJrz44/CPMBjhS6JzIVlF
 oiRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvP1gWhJPR2QY6kYIXgqWPbSHXK89ddw+CsRnsEwWXhu5Xpo7WCGz/NlOscKUFMLaf+eTtDqlkJuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxS5LG2gK7k3kvbslDvLoiBi1StdCfJM6RqXiWiW5KVb0Uoa3jV
 TWXU72wGOgWEUZqtYNjfng07ezE8Q2Fb0GoCrUVtw+Yz86Rf3vLS7TQdNGGDYS417d/DiysgQEu
 Solw7iA+H0SNErFGBjckVq6HRFXl3BmwyIWgQxpw8qCkL7pj3XMn75R8hzz0O09w8Aw==
X-Gm-Gg: ASbGncsX/aX02EYJzX1yy5EVaWxpii/6cDlkZojWQlMVRiZUyd1dfzDNq++QaV7j0Q5
 RJdKgwbZ1WpKWV5dPwbboOwMbaXMj9mROtViOnx/yY0/1YRknBeRp5koaaLryB5ri7M5oG2afMq
 PKqkbZSJO3tN4PscGvqO8YEiYLdsBEA+CvRfof/HFESjNofk+OomEiyeFl0tOCqJ8ZhO3hNJb65
 803likpgxrnq+kzZuRqETs+zgpMgOV3ntDqarguuMgpjiLCAtQF4B3L1b+1CmLMpLg+dpyfg2tE
 X1VI5PQAZIN/mPyvM8t6TvRQx4/W6vb0G5GD1FbHdOmbNJitL+Oxyl82EudcROtGk2WQjszFjSB
 /VjAc+e4Atv2H6cwHJj/SxAVcdmB2WQhc99F3xdM=
X-Received: by 2002:a05:600c:1986:b0:440:68db:a045 with SMTP id
 5b1f17b1804b1-441ad4e5d79mr688105e9.26.1745871597879; 
 Mon, 28 Apr 2025 13:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA72cAXrv/TlGoL3TY3i3ocOtaVRgrBh4l+fWWaE1+/hCYDSwBWzOpf+TvqnjHxephoKvbaw==
X-Received: by 2002:a05:600c:1986:b0:440:68db:a045 with SMTP id
 5b1f17b1804b1-441ad4e5d79mr687815e9.26.1745871597451; 
 Mon, 28 Apr 2025 13:19:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea?
 (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de.
 [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a538747esm133007735e9.35.2025.04.28.13.19.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 13:19:56 -0700 (PDT)
Message-ID: <ec14d3ec-5ec6-46df-a83c-aaf2cb5c255f@redhat.com>
Date: Mon, 28 Apr 2025 22:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com> <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com> <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com> <aA-rtji7ujQgckbM@x1.local>
 <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
 <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <f08118b3-0736-4a5d-b780-8e3d88f45c02@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7FXKVGxspKRQX6sC_Tjzwl2_TJBYY3Ai5JeAif6j8TQ_1745871598
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

On 28.04.25 21:37, Lorenzo Stoakes wrote:
> On Mon, Apr 28, 2025 at 07:23:18PM +0200, David Hildenbrand wrote:
>> On 28.04.25 18:24, Peter Xu wrote:
>>> On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
>>>>> Probably due to what config you have.  E.g., when I'm looking mine it's
>>>>> much bigger and already consuming 256B, but it's because I enabled more
>>>>> things (userfaultfd, lockdep, etc.).
>>>>
>>>> Note that I enabled everything that you would expect on a production system
>>>> (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.
>>>
>>> I still doubt whether you at least enabled userfaultfd, e.g., your previous
>>> paste has:
>>>
>>>     struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
>>>
>>> Not something that matters.. but just in case you didn't use the expected
>>> config file you wanted to use..
>>
>> You're absolutely right. I only briefly rechecked for this purpose here on
>> my notebook, and only looked for the existence of members, not expecting
>> that we have confusing stuff like vm_userfaultfd_ctx.
>>
>> I checked again and the size stays at 192 with allyesconfig and then
>> disabling debug options.
> 
> I think a reasonable case is everything on, except CONFIG_DEBUG_LOCK_ALLOC and I
> don't care about nommu.
> 
> So:
> 
> CONFIG_PER_VMA_LOCK
> CONFIG_SWAP
> CONFIG_MMU (exclude the nommu vm_region field)
> CONFIG_NUMA
> CONFIG_NUMA_BALANCING
> CONFIG_PER_VMA_LOCK
> CONFIG_ANON_VMA_NAME
> __HAVE_PFNMAP_TRACKING

Yes.

And our ugly friend CONFIG_USERFAULTFD

that is

struct vm_userfaultfd_ctx {
	struct userfaultfd_ctx *ctx;
};
#else /* CONFIG_USERFAULTFD */
#define NULL_VM_UFFD_CTX ((struct vm_userfaultfd_ctx) {})
struct vm_userfaultfd_ctx {};
#endif /* CONFIG_USERFAULTFD */

(yes, you made the same mistake as I made when skimming if everything 
relevant was enabled)

> 
> So to be clear - allyesconfig w/o debug gives us this yes? And we don't add a
> cache line? In which case all good :)

Looks like it!

-- 
Cheers,

David / dhildenb

