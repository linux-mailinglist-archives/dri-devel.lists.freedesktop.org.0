Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72186A065D6
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 21:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C5410E931;
	Wed,  8 Jan 2025 20:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="D3SPSsFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DAB10E933
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 20:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736367297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=/FTD7VRKbyo76kjBrHHQrkzkeyLU3UKrwKjjg/o7AY8=;
 b=D3SPSsFamn0DOy5cSxZQ1sJud2NwfBiyydTH6vj0xPvxKsAvV6kAPxkBJor7cqY4ET55h4
 HLygnh8LpOWNy6v4aJEFGwE9WB9jgYafijQVL6wGgIH4msLuCsB4PdfbUNPvi+yJUuBVgz
 lZ1ioAXb/Xd9KaZAIpcG/9RjgHvxMsg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-rpFM7fPENGG1OJGwy4ev6w-1; Wed, 08 Jan 2025 15:14:56 -0500
X-MC-Unique: rpFM7fPENGG1OJGwy4ev6w-1
X-Mimecast-MFC-AGG-ID: rpFM7fPENGG1OJGwy4ev6w
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so1344825e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 12:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736367295; x=1736972095;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:from:references:cc:to:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/FTD7VRKbyo76kjBrHHQrkzkeyLU3UKrwKjjg/o7AY8=;
 b=crT5y2s8dW5cbT6M97ytYKc6cibiXLdmGiRzqg0+tYPlrdpfgVBbqCrWGAHbmpdgvz
 0Zd2oryefLnMqfhfZoN0swpb8/JU3d1IXUyQZDzH1bvLe4/7RuBFPfmqSeRjjeHbtuvC
 I/HldbKQSZvnBRX9h6nxt6PE62SUqnnkcBEIw4J4SaVcilQg1CFWtQekLtSasaZhV/5B
 B3BD7vv69Rj+ZgGUrH1IIA4rNyWkTTUTaMW5PsUtyHuMetnyiTGDF/HqosFvA7uMILwm
 1Zx7X5GhZcpaJ7l56sHbMmpV+EwGir8SAnbjFv5DBUlpms8L95cr6ES0JKo+5dUu2QPG
 qHkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLRW+xV5viJwyIL5FzzCbhQI4EPNE9EMmSICjt8V9u8/O4eh63V4ao3p4JeGcXJd+5rHJu/VgBzcU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5QiVeWy4IOL5NZzXIjZ1k4bfR3HE5FLWGRxLeQd3SW1lvy555
 KG39T29DzeEijM7pX4W+umnsT6zkscJX4JjHXRB2VRJh1oKF81BPaDp7dFzqNd5WdkaBXAQCWSx
 tEmlqCqnlU2UrXIg9JSVT9RCKhyXmVDoE//hVBjL8RbHZOBoe3IhU6OV61blYMolJ2Q==
X-Gm-Gg: ASbGncu3OCvYU49ebNsU5S8zyK6KMYvSk6NqRLm12T+9K5iZLnLOaAdfYYK6T577gyk
 0KXD0pPtBDTGLLocV5OS05q2zEzT4iqS3yKXGDnMDUzwChszfvEF6EMStwNNWzw0B7OJiYhSSGm
 owhrwahL5pU5Ho693/5ya7gRpLGmrKbzQAA4aP+kfKP/ojKAXfIDUaTswBjSxxo7u1AX4EtT/WN
 UaiGz6gjJtj5dAsQOb8VkD+qwF/OCV6FuEH13p7ySgRazzHboyNc76NXYilcHg5U9ENB/sNLym8
 6CDfZya/7A==
X-Received: by 2002:a05:600c:6c0b:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-436e2707f07mr32749365e9.26.1736367295120; 
 Wed, 08 Jan 2025 12:14:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVFDRF8uyV2miULA6zaJOdskG6eSwfM6v3gJrBasiahKbvULLcZ0puYwfPtWfZ1vGxo8PORw==
X-Received: by 2002:a05:600c:6c0b:b0:434:ff25:199f with SMTP id
 5b1f17b1804b1-436e2707f07mr32749215e9.26.1736367294777; 
 Wed, 08 Jan 2025 12:14:54 -0800 (PST)
Received: from [192.168.3.141] (p4ff23c51.dip0.t-ipconnect.de. [79.242.60.81])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436dd11ddfdsm38278365e9.1.2025.01.08.12.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 12:14:54 -0800 (PST)
Message-ID: <b7465ad8-50ec-490b-a62a-e535e0a4691c@redhat.com>
Date: Wed, 8 Jan 2025 21:14:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
To: Matthew Wilcox <willy@infradead.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
 <1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com>
 <Z362xoQMxQRxYUlJ@casper.infradead.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z362xoQMxQRxYUlJ@casper.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0QVjALWY49G3-xo0VvmF5TXV4HJhy2iAsgKkSqQjua0_1736367295
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

On 08.01.25 18:32, Matthew Wilcox wrote:
> On Wed, Jan 08, 2025 at 04:18:42PM +0000, Lorenzo Stoakes wrote:
>> @@ -280,7 +269,10 @@ static void fb_deferred_io_work(struct work_struct *work)
>>   		struct folio *folio = page_folio(pageref->page);
>>   
>>   		folio_lock(folio);
>> -		folio_mkclean(folio);
>> +		rmap_wrprotect_file_page(fbdefio->mapping,
>> +					 pageref->offset >> PAGE_SHIFT,
>> +					 compound_nr(pageref->page),
>> +					 page_to_pfn(pageref->page));
>>   		folio_unlock(folio);
> 
> Why do we need to lock the folio?  (since this isn't necessarily a
> folio) 

Can you clarify the "since this isn't necessarily a folio" part ? Do you 
mean in the future, when we split "struct page" and "struct folio"?

Doing an rmap walk on something that won't be a folio is ... sounds odd 
(->wrong :) )

-- 
Cheers,

David / dhildenb

