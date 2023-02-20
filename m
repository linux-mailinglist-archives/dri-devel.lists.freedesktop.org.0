Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15569CF88
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 15:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8ED10E11D;
	Mon, 20 Feb 2023 14:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731C10E0F7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676903898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
 b=OQuaRo+P1dylgkcrrlEuNfMx00z1IeN+pHP6Adohnf2LQgfrHS2ckIUYLXyoR0IGdrHRq4
 vfMyNxOE8J+M0HyXa2YJSl27q33GVU9EBDsa4WQ9aqj/TPDkGqPOKRTgkvfeuzX7y8GT7H
 cxYyHc6IKETQIS7mPTzhdrqzv0wVsuI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-547--XruLUTmNhSfhqYx5SGeDQ-1; Mon, 20 Feb 2023 09:38:17 -0500
X-MC-Unique: -XruLUTmNhSfhqYx5SGeDQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 cf11-20020a0564020b8b00b0049ec3a108beso1820339edb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 06:38:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZooPx0J4FahhlqcFr0VVGzJP8CK2Lifinz64+tcHuxs=;
 b=QRxJUj1tgx0I7jpmqHkbjRjwqaT/DWshAqMhPdJCJto54TBcqlmmr+mCU+Uj17f3Rm
 wDeVF/QBMHkUAzEq4dHC8AAu6I5YyUYSWH5FGu14lmPqZpQUJdVqydl1qapq5tmTGyaJ
 EVKcuE37XVzb1AW+yfWpeS0uQ043gOtXZ820OelE4qzi5YmC/RCKi9AUWC+HPBJG22N9
 qrmXtaHmpE/zwh9P+DO4TgWd7E77i2PYQ5wPHTD9X1ryz5QfVdG1qE9EmEnasUuLWa5X
 63pajYbZILYOuGRIvERjqSAtDkWDh2Ow/FFyMLMTu46dkGLJA0d/Xq5JFSNoEWpzPurk
 Z5Wg==
X-Gm-Message-State: AO0yUKWLJl+1vZkOXunONzNG8/gy48ojxn8eYHU1O5roG73LwO7WJ8x7
 77inP2TdPoiAQpoEobVb+WN3vXcsxPVshiHzxnkfi4JVwyBE46ZTORHo8+nNoDwVJY9zjVrwLRL
 yQuAHjRT1ZPfQOpgXedSLojoJUBLU
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id
 ga16-20020a1709070c1000b0087bda74d272mr11177678ejc.45.1676903896717; 
 Mon, 20 Feb 2023 06:38:16 -0800 (PST)
X-Google-Smtp-Source: AK7set890fgad0EenmfhXcAtdl+hYlW2r/ANHXfflzV6RWOHKEQ6317uyFhrXsZ5SSZOJN3kSOCx5Q==
X-Received: by 2002:a17:907:c10:b0:87b:da74:d272 with SMTP id
 ga16-20020a1709070c1000b0087bda74d272mr11177652ejc.45.1676903896465; 
 Mon, 20 Feb 2023 06:38:16 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 kj8-20020a170907764800b008c0b8dd4cbdsm3118420ejc.112.2023.02.20.06.38.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:38:15 -0800 (PST)
Message-ID: <e4244345-962d-1175-6ee3-a55083389437@redhat.com>
Date: Mon, 20 Feb 2023 14:48:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
To: Matthew Wilcox <willy@infradead.org>
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
 <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <Y+/ZW/8WXzrkQnUT@casper.infradead.org>
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
Cc: matthew.brost@intel.com, dri-devel@lists.freedesktop.org, corbet@lwn.net,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 boris.brezillon@collabora.com, bskeggs@redhat.com, tzimmermann@suse.de,
 Liam.Howlett@oracle.com, bagasdotme@gmail.com, christian.koenig@amd.com,
 jason@jlekstrand.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 20:45, Matthew Wilcox wrote:
> On Fri, Feb 17, 2023 at 02:44:09PM +0100, Danilo Krummrich wrote:
>> \#define SAMPLE_ITER(name, __mgr) \
>> 	struct sample_iter name = { \
>> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
> 
> This is usually called MA_STATE_INIT()

Yep, that's better.

> 
>> #define sample_iter_for_each_range(it__, start__, end__) \
>> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
>> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
> 
> This is a bad iterator design.  It's usually best to do this:
> 
> 	struct sample *sample;
> 	SAMPLE_ITERATOR(si, min);
> 
> 	sample_iter_for_each(&si, sample, max) {
> 		frob(mgr, sample);
> 	}
> 


The reason why I don't set index (and max) within SAMPLE_ITER() is that 
the range to iterate might not yet be known at that time, so I thought 
it could just be set in sample_iter_for_each_range().

However, I see that this might prevail users to assume that it's safe to 
iterate a range based on the same iterator instance multiple times 
though. Instead users should maybe move the tree walk to another 
function once the range is known.

The reason for the payload structure to be part of the iterator is that 
I have two maple trees in the GPUVA manager and hence two different 
payload types. Within the iterator structure they're just within a union 
allowing me to implement the tree walk macro just once rather than twice.

Anyway, I feel like your approach looks cleaner, hence I'll change it.

> I don't mind splitting apart MA_STATE_INIT from MA_STATE, and if you
> do that, we can also use it in VMA_ITERATOR.
> 

