Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1F7599EEF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 18:23:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F314710E9C3;
	Fri, 19 Aug 2022 16:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Fri, 19 Aug 2022 16:23:11 UTC
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4C610E6CB
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 8DDF83FB82
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:15:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h4VitkeS0w6t for <dri-devel@lists.freedesktop.org>;
 Fri, 19 Aug 2022 18:15:52 +0200 (CEST)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5C2963F591
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:15:51 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.55.54.48])
 by mail1.shipmail.org (Postfix) with ESMTPSA id C518836058A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1660925751; bh=sR/30eMe6KiQ6M0cP5XqjY9h6ypa7J3a4NvKva3KFDs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=LSoMM3r9gGPkKAHAJ151+qgGXUcLchKU9brO41DkgrU7depksyz8V8+Q75uaAiA4l
 5hrZ0XxRE3nuO5zMc3nrr/frYqd/8SUMkLqXdQM7S4fyE4djEAxsBNBdtw34+I2QZ3
 fuEZfQMvrQ4q03Lvr0geqd52S+UAdjiYcjMuZ8Ck=
Message-ID: <24c42f80-2223-2528-2ebf-fe10ffc47473@shipmail.org>
Date: Fri, 19 Aug 2022 18:15:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: Balancing ttm_mem_io_reserve() and ttm_mem_io_free()
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <e1c2abdd-8b7e-5611-e848-f9ec551a8880@linux.intel.com>
 <e4777ea9-9374-bb46-2c5c-4e70a30760bb@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <e4777ea9-9374-bb46-2c5c-4e70a30760bb@amd.com>
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

Hi, Christian,

On 8/19/22 10:52, Christian König wrote:
> Hi Thomas,
>
> IIRC we intentionally dropped that approach of balancing 
> ttm_mem_io_reserve()/ttm_mem_io_free().
>
> Instead the results from ttm_mem_io_reserve() are cached and that 
> cached information is freed by ttm_mem_io_free(). In other words every 
> time we need to make sure we have the cache filled we call 
> ttm_mem_io_reserve() and everytime we are about to free the resource 
> or don't need the mapping any more we call ttm_mem_io_free().
>
> The callbacks to io_mem_reserve() and io_mem_free() are then balanced.

Hmm, yes, in the end at resource destroy, anything reserved would indeed 
have been freed, but consider the following:

ttm_bo_vm_fault();
ttm_bo_vmap();
ttm_bo_vunmap();
ttm_bo_unmap_virtual();

Here, wouldn't we release the io_reservation on ttm_bo_vunmap() when it 
should really have been released on ttm_bo_unmap_virtual()?


>
> Fixing missing _free() calls in the error path is probably a good 
> idea, but I wouldn't go beyond that.
>
> Why should any of that be racy? You need to hold the reservation lock 
> to call any of those functions.

It's when now a ttm_resource has been detached from a bo, and combined 
with an ongoing async memcpy we no longer have a bo reservation to 
protect with. Now the async memcpy currently only exists in i915 and we 
might at some point be able to get rid of it, but it illustrates the 
problem.

Thanks,

Thomas


>
> Regards,
> Christian.



>
> Am 19.08.22 um 10:13 schrieb Thomas Hellström:
>> Hi Christian,
>>
>> I'm looking for a way to take some sort of reference across possible 
>> VRAM accesses  over the PCI bar, be it for runtime PM, workarounds or 
>> whatever.
>>
>> The ttm_mem_io_reserve/free seems like a good candidate, but is 
>> completely unbalanced and looks racy. In particular error paths 
>> forget to call ttm_mem_io_free().
>>
>> Would you have any objections if I took a look at attempting to 
>> balance calls to those functions, or do you have any other 
>> suggestions for a better method?
>>
>> Thanks,
>>
>> Thomas
>>
>>
>>
