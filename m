Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437416B5102
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 20:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B562D10E061;
	Fri, 10 Mar 2023 19:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9597 seconds by postgrey-1.36 at gabe;
 Fri, 10 Mar 2023 19:35:30 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D750C10E061
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Mar 2023 19:35:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32AGsv0Y113532;
 Fri, 10 Mar 2023 10:54:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1678467297;
 bh=rZ1TuA9PdwIqFv9PvRAEz3S9AdKRMMl+xNizKrzmmLk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=PbIPMIR1IXX8yGepL2NHxfC/JVoEl3zJ3At/oXcIoIcSL0PAyOec/ZxpnhEnMnghv
 bOUui4t2BcOmo7kv4xi7LBiRGnLQn4EZE7GlEa0MuZr6A2qYQZ+burmribXCCKr1ns
 ZwplzSJkEnONzM4aTg9PoYewRnawBE5pJiF0QYjI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32AGsvoC013877
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Mar 2023 10:54:57 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Mar 2023 10:54:57 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Mar 2023 10:54:57 -0600
Received: from [128.247.81.39] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32AGsvH9037518;
 Fri, 10 Mar 2023 10:54:57 -0600
Message-ID: <8f8f131d-437c-6bf8-9e44-1c3a6c01e68f@ti.com>
Date: Fri, 10 Mar 2023 10:54:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dma-buf: cma_heap: Check for device max segment size
 when attaching
Content-Language: en-US
To: John Stultz <jstultz@google.com>
References: <20230306165143.1671-1-afd@ti.com>
 <CANDhNCrzi+9BszTj+9v9t6cHOcxv=4C1yQZnZZ-_7FWoxwAd5A@mail.gmail.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <CANDhNCrzi+9BszTj+9v9t6cHOcxv=4C1yQZnZZ-_7FWoxwAd5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Liam Mark <lmark@codeaurora.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/6/23 8:48 PM, John Stultz wrote:
> On Mon, Mar 6, 2023 at 8:52 AM Andrew Davis <afd@ti.com> wrote:
>>
>> Although there is usually not such a limitation (and when there is it is
>> often only because the driver forgot to change the super small default),
>> it is still correct here to break scatterlist element into chunks of
>> dma_max_mapping_size().
> 
> Hey Andrew!
>    Thanks for sending this out!
> 
> So *why* is it "correct here to break scatterlist element into chunks
> of  dma_max_mapping_size()." ?
> 

Good question, I'm not 100% sure on the background myself. It seems
since some devices have restrictions on how large a mapping they can
handle in a single run, we should not hand out single scatterlist
elements longer than that.

It is still a contiguous buffer, but some drivers forget to set their
mapping limits and also only check the number of elements == 1 to determine
if a sg is contiguous (which is not correct as there is no rule that
contiguous runs must be merged into a single scatterlist). For those
driver this would be an issue (I've only found one such case in-tree and
sent a fix, https://lore.kernel.org/lkml/20220825162609.14076-1-afd@ti.com/)

>> This might cause some issues for users with misbehaving drivers. If
>> bisecting has landed you on this commit, make sure your drivers both set
>> dma_set_max_seg_size() and are checking for contiguousness correctly.
> 
> Why is this change worth the risk? (If this is really likely to break
> folks, should we maybe provide warnings initially instead? Maybe
> falling back to the old code if we can catch the failure?)
> 
> I don't really object to the change, just want to make sure the commit
> message is more clear on why we should make this change, what the
> benefit will be along with the potential downsides.
> 

I'm not sure it is worth the risk today either, but figured this being a
young enough exporter it could be a good spot to start with for exposing
misbehaving drivers vs some legacy GPU driver exporter. Plus better to
make this change now rather than later in any case.

I don't have any strong reason for this yet though, so I'm find with
just considering this patch an RFC for now.

Thanks,
Andrew

> thanks
> -john
