Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AA7650DD
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 12:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE3510E0CA;
	Thu, 27 Jul 2023 10:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BDD10E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:20:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 44B6761DD3;
 Thu, 27 Jul 2023 10:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9266C433C8;
 Thu, 27 Jul 2023 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690453251;
 bh=Uv0jglg4XDxm5uiOcl1Fs0VDdmS3vnj5J06IHksC3j0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VjGCTE5fXWQGMkstr5mWfG/olGcukHbx9MJ5gIHM1kJfwo/BiFcjiuEaiA2TxQad6
 b/CL9D78jYHhDiLBxLD9gCBB6CtR9Pngnq1E4RM+cWQl1ITCzXzhPBEMorh0UStJGb
 V5QypMia7H1mT7Yv9W7oIRfkDRB1G3xJIxfo7Y/Lymzj+mXx3lcBAFmRFbWxhh8lk9
 h4N9LjcMkMC3/ZfJEah0qCVly/fWQ4ostsbFgLI1m7GG/WQbkHJ87BAgn9cUsNUERW
 XrnUyEDaK9+tFU+Iukly/qv+tfC9IZiVkgJJJYsmEkH+2gmJEivzAz4IAcCpkEsNUW
 WY8rxT9ubVHrA==
Message-ID: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
Date: Thu, 27 Jul 2023 19:20:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
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
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>,
 yujie.liu@intel.com, vbabka@suse.cz, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, tytso@mit.edu, netdev@vger.kernel.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/23 17:55, Qi Zheng wrote:
>>>           goto err;
>>>       }
>>>   +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>>> +    zmd->mblk_shrinker->private_data = zmd;
>>> +
>>> +    shrinker_register(zmd->mblk_shrinker);
>>
>> I fail to see how this new shrinker API is better... Why isn't there a
>> shrinker_alloc_and_register() function ? That would avoid adding all this code
>> all over the place as the new API call would be very similar to the current
>> shrinker_register() call with static allocation.
> 
> In some registration scenarios, memory needs to be allocated in advance.
> So we continue to use the previous prealloc/register_prepared()
> algorithm. The shrinker_alloc_and_register() is just a helper function
> that combines the two, and this increases the number of APIs that
> shrinker exposes to the outside, so I choose not to add this helper.

And that results in more code in many places instead of less code + a simple
inline helper in the shrinker header file... So not adding that super simple
helper is not exactly the best choice in my opinion.

-- 
Damien Le Moal
Western Digital Research

