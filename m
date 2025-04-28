Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6E5A9F6F4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 19:12:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2EEE10E626;
	Mon, 28 Apr 2025 17:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h4B2qOue";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AC610E625
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 17:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745860335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YlBurcqbe64ISpcElqVnUgzueWYOv8LWsAS36SHmzGE=;
 b=h4B2qOueyF/hwmmGTVyIFRkyfIF/vZ5AK3ke90qCeoKO+KSufp62P/MLsd8sS4R7rrpMsj
 vzey3+We8HfoUQ389MD0/j6ZotxSSeqLugip9Og2QC+aq1BFmCz/HlpEBWsPg6PfbcDqJo
 vaccYm3Q9Ev9N9rooUY3NgYBoC6b+90=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-P-r-F189Mky6oduFjvjT_g-1; Mon, 28 Apr 2025 13:12:14 -0400
X-MC-Unique: P-r-F189Mky6oduFjvjT_g-1
X-Mimecast-MFC-AGG-ID: P-r-F189Mky6oduFjvjT_g_1745860333
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so24088485e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 10:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745860333; x=1746465133;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=YlBurcqbe64ISpcElqVnUgzueWYOv8LWsAS36SHmzGE=;
 b=R3TyONUmkBzcvfaqaKmvHibDwvC4SDHunfh5f4ihzqThdfbi5QlRKkJEu9MLOUzgsa
 cDTQwVtW7qLKxO78FG7FHxcMnuYHPi9jN7UHyReHXm2g/bdkpEvOJBSqCzcVATO+bOIN
 tCmx/I9zpagPlq8Rid+t1jTOav/pf25eg2VoXQYniocqssuRFpq+j2d1JQvd2HVatEg4
 s/sGaHNB5S6UFzjYY9slWNog4rS8A2RtqQj7k7HWpODFyv3kgJjg2yNTQpE2HSEulZvF
 i804rzB0tvuNoBAxKeRxyLXj45SMwoiXzMPk3c4dCL9KVj9mXE610g/rMcGY+v1Ek9jV
 fwgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZiNdy/JXZi9ar/IC8QRJ4VfHknckRxD+g5sit18LaZf5yZpMT74S8fxDcstwrhHvAdyZOL4frPpE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy229N7Sg+iFobXIGk9LXfNQ8qdHUljnu8GpnZ6y1Z64XyXflSJ
 StKDlqkmxNrqeIIBJ4dxifZEHZZyFBLXmuWv8VLzX6BD06/xS2U9zMe3o6c9mICOJfxsM9UN6LF
 LdDzaEAN97id3ycq7uGAwoKny1dnMv19EDQReL/luewCPivV8Sx60LaKJVYGGP7/6ZA==
X-Gm-Gg: ASbGncs1WgcHsN0bWmIPq1cG6WhqZ0xgArKXgHgBp7O7bGo7wV5PTj1YQF6JOQZjcev
 gOUBqAB9UsV2emlcIP15lq+yabbA9UfbwlVk2FNpiu6ZjorBmhJuVUNPDWGcochhMgtncLDfM6G
 T5yLNm/+UImBpYcm1XsxIBco4icMFyByYgeDnt2RR7LXx8J2EVCwursofc1qe1bSW3TO5GJQbTi
 9ixNGD0OYpQA8c8s99mu0k9IMwzNF/ijk+J9651l7xa81bh8fP7VvaWiMdIoguQN3VGofrVnljE
 3qBZNhASGYHRBdTmu32/yzZ5wVfsUexfR2htt4qR9qZg4Jz9scBQadIi0ZYQFumgJ8RdBaL934L
 k3LhIPF6/rDFCZmlTCJ04x5T0O09j3AYTh3qILg==
X-Received: by 2002:a05:600c:4e4b:b0:43b:b756:f0a9 with SMTP id
 5b1f17b1804b1-441ac8eb213mr763535e9.11.1745860333364; 
 Mon, 28 Apr 2025 10:12:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGI3eEGBKgI0g/a7m3l8hddD1u69DnS0ugwSS0KDQtTLhljvtnZJ97Ojpq6J+GchDMn+0V3FA==
X-Received: by 2002:a05:600c:4e4b:b0:43b:b756:f0a9 with SMTP id
 5b1f17b1804b1-441ac8eb213mr763265e9.11.1745860332996; 
 Mon, 28 Apr 2025 10:12:12 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f32:c200:9add:4a7a:46aa:f740?
 (p200300d82f32c2009add4a7a46aaf740.dip0.t-ipconnect.de.
 [2003:d8:2f32:c200:9add:4a7a:46aa:f740])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4408d0a7802sm127236275e9.1.2025.04.28.10.12.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 10:12:12 -0700 (PDT)
Message-ID: <fc8117d9-57f8-4c28-9c46-328e4a3c4613@redhat.com>
Date: Mon, 28 Apr 2025 19:12:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] x86/mm/pat: introduce pfnmap_track() and
 pfnmap_untrack()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Peter Xu <peterx@redhat.com>
References: <20250425081715.1341199-1-david@redhat.com>
 <20250425081715.1341199-4-david@redhat.com>
 <554a6063-268c-49a7-883b-c39cf541c146@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <554a6063-268c-49a7-883b-c39cf541c146@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j7mU_-LzzKze6YIuZDTPRqtXOBLG1jhdBH_0D7qqt5E_1745860333
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


>>
>> +int pfnmap_track(unsigned long pfn, unsigned long size, pgprot_t *prot)
>> +{
>> +	const resource_size_t paddr = (resource_size_t)pfn << PAGE_SHIFT;
>> +
>> +	return reserve_pfn_range(paddr, size, prot, 0);
> 
> Nitty, but a pattern established by Liam which we've followed consistently
> in VMA code is to prefix parameters that might be less than obvious,
> especially boolean parameters, with a comment naming the parameter, e.g.:
 > > 	return reserve_pfn_range(paddr, size, prot, /*strict_prot=*/0);

Not sure I like that. But as this parameter goes away patch #8, I'll 
leave it as is in this patch and not start a bigger discussion on better 
alternatives (don't use these stupid boolean variables ...) ;)

[...]

>> +
>> +/**
>> + * pfnmap_track - track a pfn range
> 
> To risk sounding annoyingly pedantic and giving the kind of review that is
> annoying, this really needs to be expanded, I think perhaps this
> description is stating the obvious :)
> 
> To me the confusing thing is that the 'generic' sounding pfnmap_track() is
> actually PAT-specific, so surely the description should give a brief
> overview of PAT here, saying it's applicable on x86-64 etc. etc.
> 
> I'm not sure there's much use in keeping this generic when it clearly is
> not at this point?

Sorry, is your suggestion to document more PAT stuff or what exactly?

As you know, I'm a busy man ... so instructions/suggestions please :)

> 
>> + * @pfn: the start of the pfn range
>> + * @size: the size of the pfn range
> 
> In what units? Given it's a pfn range it's a bit ambiguous as to whether it
> should be expressed in pages/bytes.

Agreed. It's bytes. (not my favorite here, but good enough)


-- 
Cheers,

David / dhildenb

