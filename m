Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40B1A9F738
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B771410E629;
	Mon, 28 Apr 2025 17:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VmD3ILt/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A3A10E629
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745861007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wY4CVzX+uN3IX3vcq1iWMePW9o5nKkePYfy/0EKsFFQ=;
 b=VmD3ILt/WYmKERk2aQfnLrcrIhmiy1c8JvAy4GZ0IJ/Bl3ZIzrLAWgjnP+QnZvTtWsy/ZW
 Hu0pYNEPmvgHIc4D3pfMNlA7S13A2jeiO4eJ6gZ8JGsscrVnMLlRlk9BlI+opqbPNywnwh
 z23loh3ULzxZaz7q/AIWBZcbYeehsFw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-zDLCnA1WNjyi7BH1zAGLDg-1; Mon, 28 Apr 2025 13:23:23 -0400
X-MC-Unique: zDLCnA1WNjyi7BH1zAGLDg-1
X-Mimecast-MFC-AGG-ID: zDLCnA1WNjyi7BH1zAGLDg_1745861002
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3912e4e2033so1570934f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:23:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745861002; x=1746465802;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=wY4CVzX+uN3IX3vcq1iWMePW9o5nKkePYfy/0EKsFFQ=;
 b=Xjbj6OxHcnqzNSCzy4YWPdc8RCP7KkjBPbjQt2B8xms/Fr5aG1uUNWroCJShuwz6Jf
 lCa9JyK0A7o+WrsmXFMQ6n3QeZq0nSMZQVowCK3uQpUhSTMsRIJlwR2n+iuzLWuw4Udq
 M1D+TD9mtf0uy0KMomvyVs/zYWC5CyaLmEqmqafRogrZ22TYpSLazH+unlVJmaWyYeRQ
 UrxQm8DG7c9yakU0n5Zg1rlWxFTYlNdj3zYseH4/NHnaCrBNrTcYh5Y1nuMrglC5VVMY
 O748JwhXyB6WJB81UGl8idfk0I0Uh2Q7+9Qn+5G1SuFLF+vp3VWli85k9W9KwMknIrdc
 MHiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrBsumNCFiE8E1QDV13R5JUe4cGOyhOAxkPdPPmLCaHIk1iaD3GBDds3fH1oe732KAp/+5Cb+DfPI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxvsSUK/fYwN3AMJMBmQ/tcWP/RLDgRNscG2C0dNm8jeHhn5dgl
 CSInbL6U4STH89+1BCT6mYgxVLYN8Q4lyXFjMU0MnZDii3sUg2k8CIMdeDkM4TsHPsArhbsnPIQ
 9icBa4qQ1bRZSmrZJF+RmXYn727BO+l1MvvYWbJdkgzZb2LLOQvMeq7fSyCZgAuEqTA==
X-Gm-Gg: ASbGnctCFOLGBqvifMJAwj9WdY/9iELo6UKWa2KDuDtcnuXSOY4BI3gomq608cals6j
 s8DjOqAAo8hn8B770WA1hMHMNyQcGImqcBI4E5lVxs43tGXydd28LF1dRfJuo2ekoBfH0DzuuR9
 F5L2lcbL8FSKTytoahvx7acIItyAFXzFvDMgutSg9NxxvN49/3HMpiZKV0EixfoHoEyB28TuXjd
 PCVHJnsf6x2OmO01JAbjw/ANbMu9OyowVJfx5lB7RbLeSFqzxOgqCE8MobmFHVemQ/T6tC0NzF9
 XGiNCT+erphEpkRZd6lwotrabrS+bGCW0pW9KU7nLwBQ6M4JHJAmuspISskito/Hy6QYwf/Fsjg
 XXE7m7Gd1btBbopcU887GDj9Pxj4zAAdcTYABUw==
X-Received: by 2002:a05:6000:40cb:b0:390:f394:6271 with SMTP id
 ffacd0b85a97d-3a07ab85dc3mr7533540f8f.43.1745861001704; 
 Mon, 28 Apr 2025 10:23:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIb09GQKvUWlrzMymYxayYtDPK47jESgQU5kjQqNoI7xzmODDrJ7lADPOND7gNymtIw+O2CQ==
X-Received: by 2002:a05:6000:40cb:b0:390:f394:6271 with SMTP id
 ffacd0b85a97d-3a07ab85dc3mr7533500f8f.43.1745861001273; 
 Mon, 28 Apr 2025 10:23:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740?
 (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de.
 [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408c80174dsm135486465e9.0.2025.04.28.10.23.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 10:23:20 -0700 (PDT)
Message-ID: <884fab29-e16a-4663-8e33-885bc70ca2f7@redhat.com>
Date: Mon, 28 Apr 2025 19:23:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/11] mm: convert VM_PFNMAP tracking to pfnmap_track()
 + pfnmap_untrack()
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org, Dave Hansen
 <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-6-david@redhat.com> <aAvvQ1h9bg11hiqI@x1.local>
 <bbadf008-9ffc-4628-9809-2d8cf104a424@redhat.com> <aA-n9hvSX9JLsRM-@x1.local>
 <7a26e29c-d889-450a-a5e1-ce671f09e4c8@redhat.com> <aA-rtji7ujQgckbM@x1.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aA-rtji7ujQgckbM@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 00UIspfqMi2nHtiiWWaOG-wFLeoKM15JPUJ8grmpUFo_1745861002
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

On 28.04.25 18:24, Peter Xu wrote:
> On Mon, Apr 28, 2025 at 06:16:21PM +0200, David Hildenbrand wrote:
>>> Probably due to what config you have.  E.g., when I'm looking mine it's
>>> much bigger and already consuming 256B, but it's because I enabled more
>>> things (userfaultfd, lockdep, etc.).
>>
>> Note that I enabled everything that you would expect on a production system
>> (incld. userfaultfd, mempolicy, per-vma locks), so I didn't enable lockep.
> 
> I still doubt whether you at least enabled userfaultfd, e.g., your previous
> paste has:
> 
>    struct vm_userfaultfd_ctx  vm_userfaultfd_ctx;   /*   176     0 */
> 
> Not something that matters.. but just in case you didn't use the expected
> config file you wanted to use..

You're absolutely right. I only briefly rechecked for this purpose here 
on my notebook, and only looked for the existence of members, not 
expecting that we have confusing stuff like vm_userfaultfd_ctx.

I checked again and the size stays at 192 with allyesconfig and then 
disabling debug options.

-- 
Cheers,

David / dhildenb

