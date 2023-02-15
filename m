Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29783697B8D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 13:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C21D10E107;
	Wed, 15 Feb 2023 12:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A0F10E107
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676463236; x=1707999236;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FHerWK72UG+H3H8mwhnAfMb+sPcrV3PH32jnJGYAJlk=;
 b=dZDEmZuCCzHIGNxv6ZZsSIZFuXjcz1ujGGvpCq6h1y6HZQfQmuXmGN5U
 u+MkqmjX2j9OJIpTat/snhvEDdBjrAcswgdYlTgdzVDC3oyKfe98GA4L2
 /QTgN2nZE0iODFKJn+hq9ycF3iGg3GPxMJ8SnMlhEf/Qic2Sqh5wHuxej
 g4nWVMreIP82HuMrGF9dpWCXH+4gEyBjOOLqxuukMB3XugzhIuDa+Ey72
 /ObE8D8NS3dOLBIn1TQSp568YeNnWw5yn8b1UbGn1+wuCBkBYHrOsTxgv
 p/EbFpLWdYvJw6z3XppX8xv2Zusw7z6IGPOZVBWUX+b2cE+hDdYngJnfP A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="358834199"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="358834199"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 04:13:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="671617697"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; d="scan'208";a="671617697"
Received: from josefgel-mobl.ger.corp.intel.com (HELO [10.251.213.167])
 ([10.251.213.167])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2023 04:13:54 -0800
Message-ID: <9e6b428e-81c0-4e2a-6825-43f022483013@linux.intel.com>
Date: Wed, 15 Feb 2023 13:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: Question: partial transfers of DMABUFs
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Vinod Koul <vkoul@kernel.org>
References: <53ea4d2db570d3ca514a69015488bd5b849a5193.camel@crapouillou.net>
 <836d600a-bb1c-fbb2-89f5-7c79c3150e8c@linux.intel.com>
 <d540965a25138772fa063d62e907ffd611f93205.camel@crapouillou.net>
 <05fb3949-d0aa-b653-d9a3-236a4c95a5a3@linux.intel.com>
 <77fc4dec6738d57ae6ca6232e502e3b228b1ae03.camel@crapouillou.net>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <77fc4dec6738d57ae6ca6232e502e3b228b1ae03.camel@crapouillou.net>
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
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023-02-15 13:00, Paul Cercueil wrote:
> Hi Maarten,
>
> Le mercredi 15 février 2023 à 12:52 +0100, Maarten Lankhorst a écrit :
>> Hey,
>>
>> On 2023-02-15 12:47, Paul Cercueil wrote:
>>> Hi Maarten,
>>>
>>> Le mercredi 15 février 2023 à 12:30 +0100, Maarten Lankhorst a
>>> écrit :
>>>> Hey,
>>>>
>>>> On 2023-02-15 11:48, Paul Cercueil wrote:
>>>>> Hi,
>>>>>
>>>>> I am working on adding support for DMABUFs in the IIO
>>>>> subsystem.
>>>>>
>>>>> One thing we want there, is the ability to specify the number
>>>>> of
>>>>> bytes
>>>>> to transfer (while still defaulting to the DMABUF size).
>>>>>
>>>>> Since dma_buf_map_attachment() returns a sg_table, I basically
>>>>> have
>>>>> two
>>>>> options, and I can't decide which one is the best (or the less
>>>>> ugly):
>>>>>
>>>>> - Either I add a new API function similar to
>>>>> dmaengine_prep_slave_sg(),
>>>>> which still takes a scatterlist as argument but also takes the
>>>>> number
>>>>> of bytes as argument;
>>>>>
>>>>> - Or I add a function to duplicate the scatterlist and then
>>>>> shrink
>>>>> it
>>>>> manually, which doesn't sound like a good idea either.
>>>>>
>>>>> What would be the recommended way?
>>>> Does this need an api change? If you create a DMA-BUF of size X,
>>>> it
>>>> has
>>>> to be of size X. You can pad with a dummy page probably if you
>>>> know
>>>> it
>>>> in advance. But after it has been imported, it cannot change
>>>> size.
>>> Yes, the sizes are fixed.
>>>
>>>> You don´t have to write the entire dma-buf either, so if you want
>>>> to
>>>> create a 1GB buf and only use the first 4K, that is allowed. The
>>>> contents of  the remainder of the DMA-BUF are undefined. It's up
>>>> to
>>>> userspace to assign a meaning to it.
>>>>
>>>> I think I'm missing something here that makes the whole question
>>>> m,ake
>>>> more sense.
>>> I want my userspace to be able to specify how much of the DMABUF is
>>> to
>>> be read from or written to.
>>>
>>> So in my new "dmabuf enqueue" IOCTL that I want to add to IIO, I
>>> added
>>> a parameter to specify the number of bytes to transfer (where 0
>>> means
>>> the whole buffer).
>>>
>>> The problem I have now, is that the current dmaengine core does not
>>> have a API function that takes a scatterlist (returned by
>>> dma_map_attachment()) and a transfer size in bytes, it will always
>>> transfer the whole scatterlist.
>>>
>>> So my two options would be to add a new API function to support
>>> specifying a bytes count, or add a mechanism to duplicate a
>>> scatterlist, so that I can tweak it to the right size.
>> This doesn't have to happen through DMA-BUF. Presumably you are both
>> the
>> importer and the exporter, so after you know how much is read, you
>> can
>> tell this to the importer that X number of bytes can be read from
>> DMA-BUF Y.
> Yes, I do that already as it is an argument in my ioctl.
>
>> In your case, when enqueing you will get a full SG list, but if you
>> know
>> only X bytes are read/written you only have to map the first X bytes
>> to
>> your IIO device. The rest of the SG list could be ignored safely.
> Yes. But I don't know how to "ignore the rest of the SG list".
>
> - dma_buf_map_attachment() does not have a parameter to specify that I
> only need the first X bytes mapped;
>
> - if I map the whole thing, dmaengine_prep_slave_sg() does not have an
> option to specify that I only want the first X bytes transferred.

sg_split apppears to allow you to split it? I'm not 100% sure whether it 
leaves the original SG untouched, but you can try to put it in between 
those 2 calls to get a smaller SG to pass to prep_slave_sg.

~Maarten

