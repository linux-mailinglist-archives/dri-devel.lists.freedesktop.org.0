Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E557955D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:41:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD2F12BC45;
	Tue, 19 Jul 2022 08:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2E111AE26
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658220061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCQLJQOHcJOJ8JmCqZRzHzMUpESxVjd3NNjhzKxLWQs=;
 b=e0ZdUbtf5HXBjlwwlpxQdWLny8rutNykCgR3POPuWtcBB5+L8fjIfVzuYeuCb18phWQGbK
 yQlnr4m4BKW8ec6TAzzNOIwZfSJQbOzsQamI1g3JbHAZvZuxTt7Vxlc0hePZ8QGqcjxwGd
 L1ybTnFY1ZTZKxeUKHXUVnEyGBK8dzQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-RHMff1VFNxKN8496Y0iyrg-1; Tue, 19 Jul 2022 04:40:58 -0400
X-MC-Unique: RHMff1VFNxKN8496Y0iyrg-1
Received: by mail-wr1-f71.google.com with SMTP id
 j23-20020adfb317000000b0021d7986c07eso2346671wrd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 01:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aCQLJQOHcJOJ8JmCqZRzHzMUpESxVjd3NNjhzKxLWQs=;
 b=SpoqOCzgY9dnOXVAYkEcbO6j77V79ciGVPh1SuctUvdlsEJ6dJ1S2svg3MyMEiZivy
 uVQog2z2CK+qJWGWhhaJm8QiR9B+JDDSdhdiqZT3+n1R1U+uUdPDl8NM1ux8BZYAyem4
 7pqQHpIfl1L9YugCwGFOvtdMM9HaDV2Bz5IkT6b2O5MGNO8RCGKhzKgWRh08QecNiyie
 F26rTtNrGYveaImrwnhwUTqC0UnwgCNzhAG95wFXt6J0u4ypPOqNv6ZyVMnPBbbHRWMn
 AcIedU+4NvGyezkzvNP/zuEa065eGX16i7+ptcL2G8Muu9o+0Lawegw+i+/zSQ1H4LgN
 wLOA==
X-Gm-Message-State: AJIora+1rKAt+0jaAYD+yZ1P7cVLGtMIfbhZb7ZmF9CH/be5ddctsu6B
 3lv9PEcDe8VyeeK0BCOccx/iNbnm00arSQrEVxnJwFdY24ukRwFpLq+7due/nWqMFTHGOD6byTJ
 vzCWkDmlmvTULCpSm5taz3n47YuxJ
X-Received: by 2002:a7b:c381:0:b0:3a2:aef9:8df4 with SMTP id
 s1-20020a7bc381000000b003a2aef98df4mr37053751wmj.7.1658220057356; 
 Tue, 19 Jul 2022 01:40:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toW+ZoFXTJPEFs8reXmrBMtF0NaGli8q7vJKFZ+PCo4DXMfNrAYpetGiTuQdFEWq6RXg/h9w==
X-Received: by 2002:a7b:c381:0:b0:3a2:aef9:8df4 with SMTP id
 s1-20020a7bc381000000b003a2aef98df4mr37053722wmj.7.1658220057065; 
 Tue, 19 Jul 2022 01:40:57 -0700 (PDT)
Received: from ?IPV6:2003:cb:c709:600:7807:c947:bc5a:1aea?
 (p200300cbc70906007807c947bc5a1aea.dip0.t-ipconnect.de.
 [2003:cb:c709:600:7807:c947:bc5a:1aea])
 by smtp.gmail.com with ESMTPSA id
 j23-20020a05600c1c1700b003a32251c3f9sm1833646wms.5.2022.07.19.01.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:40:56 -0700 (PDT)
Message-ID: <d0e631e1-c7ef-4e03-6c34-189042b84005@redhat.com>
Date: Tue, 19 Jul 2022 10:40:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v9 06/14] mm/gup: migrate device coherent pages when
 pinning instead of failing
To: Andrew Morton <akpm@linux-foundation.org>
References: <20220715150521.18165-1-alex.sierra@amd.com>
 <20220715150521.18165-7-alex.sierra@amd.com>
 <225554c2-9174-555e-ddc0-df95c39211bc@redhat.com>
 <20220718133235.4fdbd6ec303219e5a3ba49cf@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220718133235.4fdbd6ec303219e5a3ba49cf@linux-foundation.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, Felix.Kuehling@amd.com, apopple@nvidia.com,
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18.07.22 22:32, Andrew Morton wrote:
> On Mon, 18 Jul 2022 12:56:29 +0200 David Hildenbrand <david@redhat.com> wrote:
> 
>>>  		/*
>>>  		 * Try to move out any movable page before pinning the range.
>>>  		 */
>>> @@ -1919,7 +1948,8 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>>  				    folio_nr_pages(folio));
>>>  	}
>>>  
>>> -	if (!list_empty(&movable_page_list) || isolation_error_count)
>>> +	if (!list_empty(&movable_page_list) || isolation_error_count
>>> +		|| coherent_pages)
>>
>> The common style is to
>>
>> a) add the || to the end of the previous line
>> b) indent such the we have a nice-to-read alignment
>>
>> if (!list_empty(&movable_page_list) || isolation_error_count ||
>>     coherent_pages)
>>
> 
> I missed that.  This series is now in mm-stable so any fix will need to
> be a standalone followup patch, please.
> 
>> Apart from that lgtm.
>>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> And your reviewed-by's will be lost.  Stupid git.

I know, I already raised my concerns regarding the new workflow, so I
won't repeat that. I can understand (too some degree) that we don't want
code to change just before the new merge window opens.

But I do wonder if we really don't even want to do subject+description
updates. Sure, the commit IDs will change. Who cares?

Anyhow, it is what it is.

-- 
Thanks,

David / dhildenb

