Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 703579D1389
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 15:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030B10E1C1;
	Mon, 18 Nov 2024 14:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Q6+vsu2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB40010E1C1;
 Mon, 18 Nov 2024 14:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mDCJIOza/IYsiEyD5hk1kWh3Loos8kCt5nJxdAil/eg=; b=Q6+vsu2OlijVpRi0yakZnPnQUB
 KROQ2/IIOcOq8Cs4csP2NYd6qmgceLETKtZK6KM+NfA4PmHOaIz7FPK/tWYupMGF8RD7rsV4/grK7
 pblU1hOAmtwMiTeSmxMsQrZF7l9kvzYKU0rfgR7BYUCRHfIyC774NmFg2LzBYrB/Yg6U6fibNiJzF
 gPN9RVoATI32SigUgP/RUWP/kgBZcO7Iu9PgTKqPmizyVEFlifMMq6oJu53NtdttiztilkSbABTtx
 oTR+yJIQgY8viknucMIXypnxmHMfK8HaQU/1CBPIOXQqc5yt4WKCw86LBQmatLw/pfm+s9Ur/k7iS
 ihfwpmFw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tD32I-008YP0-Pd; Mon, 18 Nov 2024 15:47:30 +0100
Message-ID: <73032ce8-ab60-4af3-befc-f24dc57e28fb@igalia.com>
Date: Mon, 18 Nov 2024 14:47:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] Documentation/gpu: Clarify drm memory stats
 definition
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, dri-devel@lists.freedesktop.org
References: <20241116044452.5925-1-Yunxiang.Li@amd.com>
 <20241116044452.5925-4-Yunxiang.Li@amd.com>
 <93826dcc-82de-4fb5-8574-7e6cb8355da4@gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <93826dcc-82de-4fb5-8574-7e6cb8355da4@gmail.com>
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


On 18/11/2024 14:03, Christian König wrote:
> Am 16.11.24 um 05:44 schrieb Yunxiang Li:
>> Define how to handle buffers with multiple possible placement so we
>> don't get incompatible implementations. Callout the resident requirement
>> for drm-purgeable- explicitly. Remove the requirement for there to be
>> only drm-memory- or only drm-resident-, it's not what's implemented and
>> having both is better for back-compat. Also re-order the paragraphs to
>> flow better.
>>
>> Signed-off-by: Yunxiang Li <Yunxiang.Li@amd.com>
>> CC: dri-devel@lists.freedesktop.org
>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 36 ++++++++++++---------------
>>   1 file changed, 16 insertions(+), 20 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>> b/Documentation/gpu/drm-usage-stats.rst
>> index ff964c707754a..973663f91a292 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -140,13 +140,9 @@ both.
>>   Memory
>>   ^^^^^^
>> -- drm-memory-<region>: <uint> [KiB|MiB]
>> -
>> -Each possible memory type which can be used to store buffer objects 
>> by the
>> -GPU in question shall be given a stable and unique name to be 
>> returned as the
>> -string here.
>> -
>> -The region name "memory" is reserved to refer to normal system memory.
>> +Each possible memory type which can be used to store buffer objects 
>> by the GPU
>> +in question shall be given a stable and unique name to be used as the 
>> "<region>"
>> +string. The region name "memory" is reserved to refer to normal 
>> system memory.
> 
> That looks like you squashed the "The region name..." sentence at the 
> end. Is that really helpful and intended?
> 
>>   Value shall reflect the amount of storage currently consumed by the 
>> buffer
>>   objects belong to this client, in the respective memory region.
>> @@ -154,31 +150,27 @@ objects belong to this client, in the respective 
>> memory region.
>>   Default unit shall be bytes with optional unit specifiers of 'KiB' 
>> or 'MiB'
>>   indicating kibi- or mebi-bytes.
>> -This key is deprecated and is an alias for drm-resident-<region>. 
>> Only one of
>> -the two should be present in the output.
>> +- drm-total-<region>: <uint> [KiB|MiB]
>> +
>> +The total size of all created buffers including shared and private 
>> memory. The
> 
> Maybe write "requested" instead of "created" since without a backing 
> store it is questionable if the BO is really "created".

Hmm is the term "requested" in colloquial use either by end users or 
user space developers in the context of buffer objects?

If we think the sentence needs to be improved upon, maybe something 
like: "The total size of all buffers, either created by user space APIs, 
or internally by the driver, including both shared and private buffers."

?

Regards,

Tvrtko

> 
> Apart from those two nit picks it looks good to me,
> Christian.
> 
>> +backing store for the buffers does not have to be currently 
>> instantiated to
>> +count under this category. To avoid double counting, if a buffer 
>> falls under
>> +multiple regions, the implementation should pick only one of the 
>> regions, and do
>> +so in a consistent manner.
>>   - drm-shared-<region>: <uint> [KiB|MiB]
>>   The total size of buffers that are shared with another file (e.g., 
>> have more
>> -than a single handle).
>> -
>> -- drm-total-<region>: <uint> [KiB|MiB]
>> -
>> -The total size of all created buffers including shared and private 
>> memory. The
>> -backing store for the buffers does not have to be currently 
>> instantiated to be
>> -counted under this category.
>> +than a single handle). Same caveat as drm-total- applies.
>>   - drm-resident-<region>: <uint> [KiB|MiB]
>>   The total size of buffers that are resident (have their backing 
>> store present or
>>   instantiated) in the specified region.
>> -This is an alias for drm-memory-<region> and only one of the two 
>> should be
>> -present in the output.
>> -
>>   - drm-purgeable-<region>: <uint> [KiB|MiB]
>> -The total size of buffers that are purgeable.
>> +The total size of buffers that are resident and purgeable.
>>   For example drivers which implement a form of 'madvise' like 
>> functionality can
>>   here count buffers which have instantiated backing store, but have 
>> been marked
>> @@ -192,6 +184,10 @@ One practical example of this can be presence of 
>> unsignaled fences in an GEM
>>   buffer reservation object. Therefore the active category is a subset of
>>   resident.
>> +- drm-memory-<region>: <uint> [KiB|MiB]
>> +
>> +This key is deprecated and is an alias for drm-resident-<region> if 
>> present.
>> +
>>   Implementation Details
>>   ======================
> 
