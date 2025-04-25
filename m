Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8ADA9D231
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 21:49:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFC510E9B4;
	Fri, 25 Apr 2025 19:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O+t1bQU4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5D810E9B4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 19:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745610535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Iyio0+rdGGHZ3rJEpArzIbX1q77xWWWNHXXnWo3MTWI=;
 b=O+t1bQU41M+2cIK0CrRj1GH+/nN8ZWeWkjCX7E9U9RKtm9WyRVhGIz06TLtkbBiFKkMA67
 /Bwd9mk2ovTPx16+Uj2oUU2H7rtUPNhuehfRTi+jVINHC3t1G+taZhnAjMcE2tv0LToRMs
 OImxAX0pLQd6uEiC81mKlse7AghMK0Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-UGBoVennOreWSkdh_XGOCw-1; Fri, 25 Apr 2025 15:48:54 -0400
X-MC-Unique: UGBoVennOreWSkdh_XGOCw-1
X-Mimecast-MFC-AGG-ID: UGBoVennOreWSkdh_XGOCw_1745610533
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-440a4e2bad7so5161675e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 12:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745610533; x=1746215333;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Iyio0+rdGGHZ3rJEpArzIbX1q77xWWWNHXXnWo3MTWI=;
 b=gKirh3kP5BPPS71ccFQfZWZYS2dHgV/pdi4KkKdAKtjEZhkheowf/8KgrRovcD6rIV
 o5gpcpVYm+v25w+vVZUAsNmZoNxcmRJ3apQO7TvrI3LdFdeaEU+lpRxyBeZjvUmSdNAZ
 wjqoCsnHVRVFfodStauEZSqza04kspbStm9MCyWJnfCNf8pL46PhL+2/nfqPZSQxI41F
 7MliwhXci1/2x874T4RkjxC9IWca2WTNDZkH+IlHJClinSBsnhln2qI2r2EfgxlbcX3A
 1I4PqkiBohrzD8H9/pMbQpfuoNPhcqCXKdJYnpyx4ZMDhj8OQbImqxMZzaqBVtgTcC8S
 wGaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbb8zVz9B2oIgzzZ1bbLb94EMlO6BTz2U1WvyXB2t/o0JfR97mXd7g+ryqtrRJl445k9dbbORQMQc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTbCuShbhbUigMxRxxx6WwJonVCE9VEnCUyJWiJwF0R6+l6FGs
 5+clkZ6Z5Lxgf2C5P302/ALJfwGM8+m/CcZk0f9Fwlb0OhWEGgFF32ePogl4iqXDnk8HiLWy/yM
 xs+ybddEMa95XTRmBzVHl5rAXlaHXcjK5AHiW6BlWbItaOcIYDCjLe5zYwyC0ADZVQA==
X-Gm-Gg: ASbGnctLLd+eZZKwB5iE06ucWugOi4SiSjQKO9xh7fiYj+eOQDDWolh1OdP/sVDgA66
 6Ewb+slgYuu4rhN4GiUAZghlbokYSdW6nUNkVSbl2HXVab/O/R1/SkMSjEjQDbsl1pWejHF01cR
 4NktUKDHiMkDgh2ibsSWKexRu9eA/sek8oTgAwk52UbGZpBQiQv7FjGxYGCrY6QXiv/S1KERGI1
 9ZA560rrQdI56LUSk71Bjz7ny74X6N//Jhyz0e/2W1LlSwpveuLivVZDFPM2HZdgvQ2tkN5iipa
 sLI7Yy97BakzjNAXSnscC/jBhW52Y3ngT0O9JPSPbg==
X-Received: by 2002:a05:600c:45d0:b0:43d:5264:3cf0 with SMTP id
 5b1f17b1804b1-4409c4de02dmr67828905e9.11.1745610533032; 
 Fri, 25 Apr 2025 12:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCFfrtzSc+UtPRGo0BIvDxCf3n2hnwRdIbAoPATpGWLsnc5w/p+CDOEbj1RMEvVgHKgNRMBw==
X-Received: by 2002:a05:600c:45d0:b0:43d:5264:3cf0 with SMTP id
 5b1f17b1804b1-4409c4de02dmr67828555e9.11.1745610532645; 
 Fri, 25 Apr 2025 12:48:52 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23df8.dip0.t-ipconnect.de. [79.242.61.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a5310ad2sm34335985e9.21.2025.04.25.12.48.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Apr 2025 12:48:52 -0700 (PDT)
Message-ID: <78f88303-6b00-42cf-8977-bf7541fa45a9@redhat.com>
Date: Fri, 25 Apr 2025 21:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/11] mm: convert track_pfn_insert() to
 pfnmap_sanitize_pgprot()
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
 <20250425081715.1341199-3-david@redhat.com> <aAvjJOmvm5GsZ-JN@x1.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aAvjJOmvm5GsZ-JN@x1.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e3G8jApwS1St3ggGvrfA-zPakF2uKOC7nb2agbp5swM_1745610533
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

On 25.04.25 21:31, Peter Xu wrote:
> On Fri, Apr 25, 2025 at 10:17:06AM +0200, David Hildenbrand wrote:
>> ... by factoring it out from track_pfn_remap().
>>
>> For PMDs/PUDs, actually check the full range, and trigger a fallback
>> if we run into this "different memory types / cachemodes" scenario.
> 
> The current patch looks like to still pass PAGE_SIZE into the new helper at
> all track_pfn_insert() call sites, so it seems this comment does not 100%
> match with the code?  Or I may have misread somewhere.

No, you're right, while reshuffling the patches I forgot to add the 
actual PMD/PUD size.

> 
> Maybe it's still easier to keep the single-pfn lookup to never fail..  more
> below.
> 

[...]

>>   /*
>> @@ -1556,8 +1553,23 @@ static inline void untrack_pfn_clear(struct vm_area_struct *vma)
>>   extern int track_pfn_remap(struct vm_area_struct *vma, pgprot_t *prot,
>>   			   unsigned long pfn, unsigned long addr,
>>   			   unsigned long size);
>> -extern void track_pfn_insert(struct vm_area_struct *vma, pgprot_t *prot,
>> -			     pfn_t pfn);
>> +
>> +/**
>> + * pfnmap_sanitize_pgprot - sanitize the pgprot for a pfn range
> 
> Nit: s/sanitize/update|setup|.../?
> 
> But maybe you have good reason to use sanitize.  No strong opinions.

What it does on PAT (only implementation so far ...) is looking up the 
memory type to select the caching mode that can be use.

"sanitize" was IMHO a good fit, because we must make sure that we don't 
use the wrong caching mode.

update/setup/... don't make that quite clear. Any other suggestions?

> 
>> + * @pfn: the start of the pfn range
>> + * @size: the size of the pfn range
>> + * @prot: the pgprot to sanitize
>> + *
>> + * Sanitize the given pgprot for a pfn range, for example, adjusting the
>> + * cachemode.
>> + *
>> + * This function cannot fail for a single page, but can fail for multiple
>> + * pages.
>> + *
>> + * Returns 0 on success and -EINVAL on error.
>> + */
>> +int pfnmap_sanitize_pgprot(unsigned long pfn, unsigned long size,
>> +		pgprot_t *prot);
>>   extern int track_pfn_copy(struct vm_area_struct *dst_vma,
>>   		struct vm_area_struct *src_vma, unsigned long *pfn);
>>   extern void untrack_pfn_copy(struct vm_area_struct *dst_vma,
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index fdcf0a6049b9f..b8ae5e1493315 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1455,7 +1455,9 @@ vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write)
>>   			return VM_FAULT_OOM;
>>   	}
>>   
>> -	track_pfn_insert(vma, &pgprot, pfn);
>> +	if (pfnmap_sanitize_pgprot(pfn_t_to_pfn(pfn), PAGE_SIZE, &pgprot))
>> +		return VM_FAULT_FALLBACK;
> 
> Would "pgtable" leak if it fails?  If it's PAGE_SIZE, IIUC it won't ever
> trigger, though.
> 
> Maybe we could have a "void pfnmap_sanitize_pgprot_pfn(&pgprot, pfn)" to
> replace track_pfn_insert() and never fail?  Dropping vma ref is definitely
> a win already in all cases.

It could be a simple wrapper around pfnmap_sanitize_pgprot(), yes. 
That's certainly helpful for the single-page case.

Regarding never failing here: we should check the whole range. We have 
to make sure that none of the pages has a memory type / caching mode 
that is incompatible with what we setup.


Thanks a bunch for the review!
-- 
Cheers,

David / dhildenb

