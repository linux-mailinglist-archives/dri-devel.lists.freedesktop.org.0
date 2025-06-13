Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6710AD84FA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 09:53:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 603BC10E8D5;
	Fri, 13 Jun 2025 07:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="vbaPMG5l";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="NLhDrFN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BFE10E8DA;
 Fri, 13 Jun 2025 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1749801088;
 bh=BWL04/2weD75YWj7pQZYoOa
 pnHaWMWo9tcBrdAgItEQ=; b=vbaPMG5l5WgGwNJ+RPvmIakQaHT8+jAU+lWcpSNoIB1PouwCo2
 kM2KnpT/x2CfAaOdNmK8Wvsg3otZ3CuVt9L+xKX/P4/MQFePfLYAeXMLK0xBHGd7TY4POCiFqeK
 YRSbHdhP48QAPlls36p6kuTm8TLfw4B0kvKs1n9X66+Lc3jCUtmuwX/4/ZQXLkQbfePnuXfnO+T
 tH6IMw26Qcr0jV4dz6ahvxvb9EpIBNOql9Mn/TQfldgatXlKsQflGGJKXTMR+cOPK7ojSADmxdp
 3eynoVWh5i20mzkX4dV+c46RPs6j+q3NlJKb75pXDnHfi0lZDOeei4ziC34i8JYV5uA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1749801088; bh=BWL04/2weD75YWj7pQZYoOa
 pnHaWMWo9tcBrdAgItEQ=; b=NLhDrFN2FF+23QZOVr4NsYgk5AfU/fvm1x8KrWO6JxnoKaXppw
 mwmdvavZ8Hmw2JqeEdW925LJdoxyK1jngpDQ==;
Message-ID: <0783c4ab-e26e-4c90-93f5-342e761cee29@damsy.net>
Date: Fri, 13 Jun 2025 09:51:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/amdgpu: give each kernel job a unique id
To: Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 Philipp Stanner <phasta@kernel.org>, dri-devel@lists.freedesktop.org
References: <aEmR9420vj-ISz-W@cassiopeiae>
 <dc661205-1e5b-4697-863b-36a299365219@amd.com> <aEmcpsXwS8dLNGUg@cassiopeiae>
 <5f71cfd0-fd38-491c-8255-bdd3e0fb19dc@amd.com> <aEtnS6kvh1mssFTb@cassiopeiae>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <aEtnS6kvh1mssFTb@cassiopeiae>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


Hi,

Le 13/06/2025 à 01:48, Danilo Krummrich a écrit :
> On Thu, Jun 12, 2025 at 09:00:34AM +0200, Christian König wrote:
>> On 6/11/25 17:11, Danilo Krummrich wrote:
>>>>>> Mhm, reiterating our internal discussion on the mailing list.
>>>>>>
>>>>>> I think it would be nicer if we could use negative values for the kernel submissions and positive for userspace. But as discussed internally we would need to adjust the scheduler trace points for that once more.
>>>>>>
>>>>>> @Philip and @Danilo any opinion on that?
>>>>>
>>>>> Both, the U64_MAX and the positive-negative approach, are a bit hacky. I wonder
>>>>> why we need client_id to be a u64, wouldn't a u32 not be enough?
>>>>
>>>> That can trivially overflow on long running boxes.
>>>
>>> I don't know if "trivially" is the word of choice given that the number is
>>> 4,294,967,295.
>>>
>>> But I did indeed miss that this is a for ever increasing atomic. Why is it an
>>> atomic? Why is it not an IDA?
>>
>> Well IDA has some extra overhead compared to an ever increasing atomic, additional to that it might not be the best choice to re-use numbers for clients in a trace log.
> 
> I think the overhead is not relevant at all, this is called from
> drm_file_alloc(). The only path I can see where this is called is
> drm_client_init(), which isn't high frequent stuff at all, is it?
> 
> It seems to me that we should probably use IDA here.
> 
>> On the other hand using smaller numbers is usually nicer for manual inspection.

Re-using IDs might bring confusion in the trace logs, for instance when tracing lots of short lived 
processes.

> 
> Another option is to just add an interface to get a kernel client_id from the
> same atomic / IDA.

Honestly I don't really see the problem with the current patch: using the last N ids for the kernel 
jobs requires no other changes and works fine.

https://gitlab.freedesktop.org/drm/amd/-/issues/4260 has a screenshot of the UMR tool using these ids.

If the theoretical overlap with client drm id is a concern, adding code to drm_file_alloc() to not 
use the last 0xff ids would be easy.

btw maybe other drivers also use kernel jobs with the same semantics, in which case we might want to 
move the special IDs definition to a shared place.

Thanks,
Pierre-Eric

