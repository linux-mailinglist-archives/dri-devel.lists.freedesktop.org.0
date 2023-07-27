Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 300A3766054
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 01:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D5810E04A;
	Thu, 27 Jul 2023 23:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A3F10E04A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 23:48:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA7BB61F8A;
 Thu, 27 Jul 2023 23:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5FDC433C7;
 Thu, 27 Jul 2023 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690501724;
 bh=Ttxo2VAoV3s10tVDpG1rs4f+uNBtPiAAdsRn7qEPqAI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ak6ozI5MGJ+V/aaPZbipUbe6ZARep0hinqcaIFmiUbGlXqA4l6qqKubv3sXd24Wis
 E3nRqNpMPjywrGRezhx8kIl9BfOcFGOjuYtEl0wjzGKmd2W/r6L34Y8Q/Asia9+Ai+
 N65piXMA54Y1i5SwziMjZGbgl+PlpLxLOgApRck3LvpJfpGiaZrCds1yq/RX5+TIOO
 TcyhaMq04sGg4mmvI/xNg53Zl5ogRkSJoPUjgXBUN2wkW+R/Z24fG4Bcn7szmrfhkb
 1Y0rUs2KyI/CXZncywoQIP9j5+uNlee3CVuHYo0iSwOTdXpuIWfOUm7reRjWTqpcd1
 EASuIvTp5UKtQ==
Message-ID: <217f3a7e-7681-0da6-aaa7-252a1451f7ba@kernel.org>
Date: Fri, 28 Jul 2023 08:48:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
To: Dave Chinner <david@fromorbit.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
 <ZML22YJi5vPBDEDj@dread.disaster.area>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <ZML22YJi5vPBDEDj@dread.disaster.area>
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Muchun Song <songmuchun@bytedance.com>, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/28/23 07:59, Dave Chinner wrote:
> On Thu, Jul 27, 2023 at 07:20:46PM +0900, Damien Le Moal wrote:
>> On 7/27/23 17:55, Qi Zheng wrote:
>>>>>           goto err;
>>>>>       }
>>>>>   +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>>>>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>>>>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>>>>> +    zmd->mblk_shrinker->private_data = zmd;
>>>>> +
>>>>> +    shrinker_register(zmd->mblk_shrinker);
>>>>
>>>> I fail to see how this new shrinker API is better... Why isn't there a
>>>> shrinker_alloc_and_register() function ? That would avoid adding all this code
>>>> all over the place as the new API call would be very similar to the current
>>>> shrinker_register() call with static allocation.
>>>
>>> In some registration scenarios, memory needs to be allocated in advance.
>>> So we continue to use the previous prealloc/register_prepared()
>>> algorithm. The shrinker_alloc_and_register() is just a helper function
>>> that combines the two, and this increases the number of APIs that
>>> shrinker exposes to the outside, so I choose not to add this helper.
>>
>> And that results in more code in many places instead of less code + a simple
>> inline helper in the shrinker header file...
> 
> It's not just a "simple helper" - it's a function that has to take 6
> or 7 parameters with a return value that must be checked and
> handled.
> 
> This was done in the first versions of the patch set - the amount of
> code in each caller does not go down and, IMO, was much harder to
> read and determine "this is obviously correct" that what we have
> now.
> 
>> So not adding that super simple
>> helper is not exactly the best choice in my opinion.
> 
> Each to their own - I much prefer the existing style/API over having
> to go look up a helper function every time I want to check some
> random shrinker has been set up correctly....

OK. All fair points.


-- 
Damien Le Moal
Western Digital Research

