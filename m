Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF4B41860
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 10:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F408E10E47C;
	Wed,  3 Sep 2025 08:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="RhXs/FjG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272D210E47C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 08:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756887973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiF4X17MAgeDzab0iosntA9Q/n0cbzxTmlw2m/AGEGE=;
 b=RhXs/FjGzCq4vQ5tiYj2Kn+D9BIk/ovbNBJRBGjQqqOLZfE+AX7HgUk/P1faeOSzhb4Y+8
 rMJB0jssbVUIYqnCUFrjtaiF6ynpWpdj4JokJpQuZv0SEfi0o1FD8aLGWbexYg7aAuDKjs
 I+n5IqeuKh3rYMgFurqESvS5/It2XZw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-p1bK5QajOGmqju4tTVAdgQ-1; Wed, 03 Sep 2025 04:26:11 -0400
X-MC-Unique: p1bK5QajOGmqju4tTVAdgQ-1
X-Mimecast-MFC-AGG-ID: p1bK5QajOGmqju4tTVAdgQ_1756887970
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-55f6a61e239so3008938e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 01:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756887970; x=1757492770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RiF4X17MAgeDzab0iosntA9Q/n0cbzxTmlw2m/AGEGE=;
 b=Dkzd0mQXlIsZqY3ZOUEwKsAyTMJflK20rxV/NvUjRxelXVgHrxWJZCyDPo++msaoDI
 IatwJLAJVm8lQ/T6e5gA9Rph4WekuJDucC86JqDpSc5VyEDwxIRPDbeRGQExOQGDnLkU
 VqWm2JfNCH0Jc+233nm7p84kStwJi7PelJnJjCq5m/aAYIRA1yUjARJ5NV2n3iV+WRyb
 wsGNFQeZeIRPuyIL2CBR1ziLIawhjQ6PbvSJvB7MItU7pB8AqCzRm+GDuHHSbOrE+vBX
 HuOhvV4omxHpjzfzR/N87UOvAoufUDSCx2mTu4p4vpO537SYXka+SSGByk+38mOY71ww
 m69w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiC2RzVrxYtzB00eOkgceGbM3nCMvGfNrbPrejIvvziFr/hr7A9lg0O1Ubj+TzWpW/0yfnB/DTY+8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQdL85DT3TtsXRpQeQhzG/7L8osUlGMOQH96uz95VIt+3IpJxa
 LiNZo06dgVy47sTdhL2GOHxTPGkv5IbbQHx7YDtT38G/HVIPX/Lp7dmyLWp14G0r++gjju/rTHV
 nwCS1Ahm5F/edfQ5BoQxTSJsC6jSs6drGTkNOsP2xx6f279AQkjyiPaNasWQ8l2H3DvPm
X-Gm-Gg: ASbGncukztzJbVMshRkOZt7bJNi88DxyhaeC6o3tnXUFWFJFZgiqoVdvF2MJPqlK6Gj
 wpmKmgl7Op2Ywq7yhJ4jnuI0jNfAj+tlMsnDPxtpmCgpOPyRiHP2tZYW2X4kQ9bUPxsZxaC1boZ
 aknRxctqNfTC44yhh8aA6xaQGmFvcvj9Igaofws8tyyF4scuKfOtKNp6B5UeRIN9lxjW2wlHaS4
 i2kPv6HokF9BZC6dG8+IQtIQ2zW91Dwf01ptwJfAQNoxW9+XnFjEGa/l7+hfTu2yYhQScZ7s8Fr
 OdDZ98VXNy2m48Lh9OCvIMBVEvIJOjMg5+mwZ58K0TtOamXU0MDKCwRQqx2chTHR8g==
X-Received: by 2002:a05:6512:6401:b0:55f:4faa:b630 with SMTP id
 2adb3069b0e04-55f708b9a35mr3755389e87.24.1756887970179; 
 Wed, 03 Sep 2025 01:26:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo/J8D+PycrrERqH27xh2tlYz9vfDI8vGXXWnNGFn0lTfvQ0eYEz+wc2QoktugLroVCaVR9Q==
X-Received: by 2002:a05:6512:6401:b0:55f:4faa:b630 with SMTP id
 2adb3069b0e04-55f708b9a35mr3755384e87.24.1756887969707; 
 Wed, 03 Sep 2025 01:26:09 -0700 (PDT)
Received: from [192.168.1.86] (85-23-48-6.bb.dnainternet.fi. [85.23.48.6])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ad525d1sm352909e87.139.2025.09.03.01.26.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 01:26:08 -0700 (PDT)
Message-ID: <ffac73b3-3c2f-402a-beb3-a98ba92c5335@redhat.com>
Date: Wed, 3 Sep 2025 11:26:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Balbir Singh <balbirs@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
 <20250903011900.3657435-6-balbirs@nvidia.com>
 <ea6caec5-fd20-444c-b937-6cab61198c46@redhat.com>
 <6a178e78-9ccd-4845-b4ca-1e84f7d31b91@nvidia.com>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <6a178e78-9ccd-4845-b4ca-1e84f7d31b91@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RDhjHJk0pKgqtMPQzDGTge7IlcX44QvSERXKHmZVOg0_1756887970
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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


On 9/3/25 09:05, Balbir Singh wrote:

> On 9/3/25 14:40, Mika Penttilä wrote:
>> Hi,
>>
>> On 9/3/25 04:18, Balbir Singh wrote:
>>
>>> Extend migrate_vma_collect_pmd() to handle partially mapped large
>>> folios that require splitting before migration can proceed.
>>>
>>> During PTE walk in the collection phase, if a large folio is only
>>> partially mapped in the migration range, it must be split to ensure
>>> the folio is correctly migrated.
>>>
> <snip>
>
>>> +
>>> +				/*
>>> +				 * The reason for finding pmd present with a
>>> +				 * large folio for the pte is partial unmaps.
>>> +				 * Split the folio now for the migration to be
>>> +				 * handled correctly
>>> +				 */
>> There are other reasons like vma splits for various reasons.
>>
> Yes, David had pointed that out as well, I meant to cleanup the comment change
> "The" to "One", I missed addressing it in the refactor, but easy to do

And of course now you split all mTHPs as well, which is different what we do today
(ignoring). Splitting might be the right thing to do, but maybe worth mentioning.

> Thanks,
> Balbir Singh
>
--Mika

