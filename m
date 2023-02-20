Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795FB69CF8A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 15:38:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C9910E11E;
	Mon, 20 Feb 2023 14:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9779010E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676903911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GmKQfePBNM74oyII8jIIZFFDqjkHPWvhxdC7o2iizgc=;
 b=hlXkYNRutMU1uhGrZxnK0It/5ye6aW9rbzg7PU4YYD1TwKTw2N+LAM9iPisl9A/ciZs3h2
 iF0RaetLT9cGjOrTZv24v8HOSOpCMylk3TwthFHjg6hzTUFz8ID75aknxLnyCT85nSV6BW
 BC9xzYgunCvHiz7aVCDDi86PDEdclOg=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-l9u7q2xtPT2xJqKTD0LNNA-1; Mon, 20 Feb 2023 09:38:30 -0500
X-MC-Unique: l9u7q2xtPT2xJqKTD0LNNA-1
Received: by mail-ed1-f70.google.com with SMTP id
 er17-20020a056402449100b004ad793116d5so211666edb.23
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 06:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GmKQfePBNM74oyII8jIIZFFDqjkHPWvhxdC7o2iizgc=;
 b=uhAuqVWt7AvMDeqenSryehRZcY67DKyUJp/sUIAjv0nsmy9ir1ROYiKr/GHVHJnJBR
 d/pC5AEbCQaZnQIJ2RR/8iNEfdzlBD/Z1hVC5/V++CUSCkbR0s2p26lef0ztRqiSMjUA
 sdMjWCWl4T2KND48BF7MeiDZbnA8GHK0/NbqzEn1usElH45PyETec6wJAvqn4Fxeq4t/
 XLTyWvlIFJEmQajNq+tvNcOFku2JIBMUq3gc/44oCme6IZLAPmbgT59pmQ+x+76v4OQR
 jfccLJr3fPbcSBIYmPnICOHbMGpCoajghEtcVpJPrklE+kbFFo+nzRu+qifNgUHho4LZ
 ceyQ==
X-Gm-Message-State: AO0yUKXzgHlLHSy5ngUwpLx9mgMlx+S50sv2naWCePnwTpNDuGg0HvWF
 ZR0Tx7gLSaJvMqKBbxQiYvECFqrXyscExZ8LtvZqdrE6/Z7eaHnk2qTtbloaZvON0aO8ujHLReL
 fZUYo0CVJVD2ksuGRL5P61x9dIqsA
X-Received: by 2002:a17:906:f289:b0:881:f2f:6633 with SMTP id
 gu9-20020a170906f28900b008810f2f6633mr8043855ejb.50.1676903909576; 
 Mon, 20 Feb 2023 06:38:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+xMJtKlq9dHWjhHAyEZojNoMP62Bp2lM1Yx4E5E9ujUsu4uyPFe0LjE0LZiflfnT2xQHRXVA==
X-Received: by 2002:a17:906:f289:b0:881:f2f:6633 with SMTP id
 gu9-20020a170906f28900b008810f2f6633mr8043823ejb.50.1676903909289; 
 Mon, 20 Feb 2023 06:38:29 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 hz13-20020a1709072ced00b008b30e2a450csm4549530ejc.144.2023.02.20.06.38.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 06:38:28 -0800 (PST)
Message-ID: <3c9e368a-0ecb-fc60-dac4-f12fa23d8f60@redhat.com>
Date: Mon, 20 Feb 2023 14:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>, airlied@gmail.com,
 daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org, corbet@lwn.net,
 christian.koenig@amd.com, bskeggs@redhat.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20230217134422.14116-1-dakr@redhat.com>
 <20230217134422.14116-4-dakr@redhat.com>
 <20230217183404.jmjew5lrduts6cpo@revolver>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230217183404.jmjew5lrduts6cpo@revolver>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/17/23 19:34, Liam R. Howlett wrote:
> * Danilo Krummrich <dakr@redhat.com> [230217 08:44]:
>> Split up the MA_STATE() macro such that components using the maple tree
>> can easily inherit from struct ma_state and build custom tree walk
>> macros to hide their internals from users.
>>
>> Example:
>>
>> struct sample_iter {
>> 	struct ma_state mas;
>> 	struct sample_mgr *mgr;
>> 	struct sample_entry *entry;
>> };
>>
>> \#define SAMPLE_ITER(name, __mgr) \
>> 	struct sample_iter name = { \
>> 		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
>> 		.mgr = __mgr,
>> 		.entry = NULL,
>> 	}
> 
> I see this patch is to allow for anonymous maple states, this looks
> good.
> 
> I've a lengthy comment about the iterator that I'm adding here to head
> off anyone that may copy your example below.
> 
>>
>> \#define sample_iter_for_each_range(it__, start__, end__) \
>> 	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
>> 	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))
> 
> I see you've added something like the above in your patch set as well.
> I'd like to point out that the index isn't the only state information
> that needs to be altered here, and in fact, this could go very wrong.
> 
> The maple state has a node and an offset within that node.  If you set
> the index to lower than the current position of your iterator and call
> mas_find() then what happens is somewhat undefined.  I expect you will
> get the wrong value (most likely either the current value or the very
> next one that the iterator is already pointing to).  I believe you have
> been using a fresh maple state for each iterator in your patches, but I
> haven't had a deep look into your code yet.

Yes, I'm aware that I'd need to reset the whole iterator in order to 
re-use it.

Regarding the other considerations of the iterator design please see my 
answer to Matthew.

> 
> We have methods of resetting the iterator and set the range (mas_set()
> and mas_set_range()) which are safe for what you are doing, but they
> will start the walk from the root node to the index again.
> 
> So, if you know what you are doing is safe, then the way you have
> written it will work, but it's worth mentioning that this could occur.
> 
> It is also worth pointing out that it would be much safer to use a
> function to do the above so you get type safety.. and I was asked to add
> this to the VMA interface by Linus [1], which is on its way upstream [2].
> 
> 1. https://lore.kernel.org/linux-mm/CAHk-=wg9WQXBGkNdKD2bqocnN73rDswuWsavBB7T-tekykEn_A@mail.gmail.com/
> 2. https://lore.kernel.org/linux-mm/20230120162650.984577-1-Liam.Howlett@oracle.com/

You mean having wrappers like sample_find() instead of directly using 
mas_find()?

> 
>>
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
>> ---
>>   include/linux/maple_tree.h | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
>> index e594db58a0f1..ca04c900e51a 100644
>> --- a/include/linux/maple_tree.h
>> +++ b/include/linux/maple_tree.h
>> @@ -424,8 +424,8 @@ struct ma_wr_state {
>>   #define MA_ERROR(err) \
>>   		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
>>   
>> -#define MA_STATE(name, mt, first, end)					\
>> -	struct ma_state name = {					\
>> +#define __MA_STATE(mt, first, end)					\
>> +	{								\
>>   		.tree = mt,						\
>>   		.index = first,						\
>>   		.last = end,						\
>> @@ -435,6 +435,9 @@ struct ma_wr_state {
>>   		.alloc = NULL,						\
>>   	}
>>   
>> +#define MA_STATE(name, mt, first, end)					\
>> +	struct ma_state name = __MA_STATE(mt, first, end)
>> +
>>   #define MA_WR_STATE(name, ma_state, wr_entry)				\
>>   	struct ma_wr_state name = {					\
>>   		.mas = ma_state,					\
>> -- 
>> 2.39.1
>>
> 

