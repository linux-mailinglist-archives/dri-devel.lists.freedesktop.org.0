Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 599506C191F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 16:30:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2472310E5D3;
	Mon, 20 Mar 2023 15:30:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62910E5CE;
 Mon, 20 Mar 2023 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679326242; x=1710862242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YLTTzXJrZjbA4Wxj46rjaO2JWSkZPqUuFi5sx1rWTvc=;
 b=GP2l2jKzcyJQDRvdERqeJGH4Irwy3f2uUZKlxVRwzvzVGftQuYmyeAPI
 VGrBI9gXpKJsaZr+D1M5L4IlBQ2ryQBiN12uPpkdgb6VKWZ4YlpZIUqWm
 wR1XaE2NGnRxKeJWQX+WFIK0+ElA6qXanutY1VS8evpRLBMkxSZYum58P
 X0Dy/5B7/ojw3nMfb2Y5ZkxNr6dhMceVQ+ofw4I8UvkGcPzk7REyRDVWt
 g5O4YfWgummN3/FZaMzNtHht7Xfwf1VU4gk1HQJj30pQDDu+O+NU4MZed
 ATjPsXx4AcpBy6epkPC9JV3pL7b5y7d+oc1p8wJ0Saq481tXcLCB5TlmS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="322533718"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="322533718"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="791648659"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="791648659"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.6.65])
 ([10.213.6.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 08:30:38 -0700
Message-ID: <1b9729c0-8831-87bd-8cc2-2cc23e929351@intel.com>
Date: Mon, 20 Mar 2023 16:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [Intel-gfx] [PATCH v4 01/10] lib/ref_tracker: add unlocked leak
 print helper
Content-Language: en-US
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230224-track_gt-v4-0-464e8ab4c9ab@intel.com>
 <20230224-track_gt-v4-1-464e8ab4c9ab@intel.com>
 <ZBeT5cWWqY4hkqu6@ashyti-mobl2.lan>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ZBeT5cWWqY4hkqu6@ashyti-mobl2.lan>
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
Cc: netdev@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.03.2023 23:59, Andi Shyti wrote:
> Hi Andrzej,
> 
> [...]
> 
>> diff --git a/lib/ref_tracker.c b/lib/ref_tracker.c
>> index dc7b14aa3431e2..5e9f90bbf771b0 100644
>> --- a/lib/ref_tracker.c
>> +++ b/lib/ref_tracker.c
>> @@ -14,6 +14,38 @@ struct ref_tracker {
>>   	depot_stack_handle_t	free_stack_handle;
>>   };
>>   
>> +void __ref_tracker_dir_print(struct ref_tracker_dir *dir,
>> +			   unsigned int display_limit)
> 
> can we call this ref_tracker_dir_print_locked() instead of using
> the '__'?
> 

OK, 'locked' convention looks better.

Regards
Andrzej

>> +{
>> +	struct ref_tracker *tracker;
>> +	unsigned int i = 0;
>> +
>> +	lockdep_assert_held(&dir->lock);
>> +
>> +	list_for_each_entry(tracker, &dir->list, head) {
>> +		if (i < display_limit) {
>> +			pr_err("leaked reference.\n");
>> +			if (tracker->alloc_stack_handle)
>> +				stack_depot_print(tracker->alloc_stack_handle);
>> +			i++;
>> +		} else {
>> +			break;
>> +		}
>> +	}
>> +}
>> +EXPORT_SYMBOL(__ref_tracker_dir_print);
>> +
>> +void ref_tracker_dir_print(struct ref_tracker_dir *dir,
>> +			   unsigned int display_limit)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&dir->lock, flags);
>> +	__ref_tracker_dir_print(dir, display_limit);
>> +	spin_unlock_irqrestore(&dir->lock, flags);
>> +}
>> +EXPORT_SYMBOL(ref_tracker_dir_print);
>> +
>>   void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>>   {
>>   	struct ref_tracker *tracker, *n;
>> @@ -27,13 +59,13 @@ void ref_tracker_dir_exit(struct ref_tracker_dir *dir)
>>   		kfree(tracker);
>>   		dir->quarantine_avail++;
>>   	}
>> -	list_for_each_entry_safe(tracker, n, &dir->list, head) {
>> -		pr_err("leaked reference.\n");
>> -		if (tracker->alloc_stack_handle)
>> -			stack_depot_print(tracker->alloc_stack_handle);
>> +	if (!list_empty(&dir->list)) {
>> +		__ref_tracker_dir_print(dir, 16);
>>   		leak = true;
>> -		list_del(&tracker->head);
>> -		kfree(tracker);
>> +		list_for_each_entry_safe(tracker, n, &dir->list, head) {
>> +			list_del(&tracker->head);
>> +			kfree(tracker);
>> +		}
> 
> Just thinking whether this should go on a different patch, but I
> don't have a strong opinion.
> 
> Looks good!
> 
> Andi

