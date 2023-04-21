Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8456EACF3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 16:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8F010EE2A;
	Fri, 21 Apr 2023 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1B10EE33;
 Fri, 21 Apr 2023 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682087442; x=1713623442;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H8Remee2zEmqfUSIzqd+utYJFsZGQbKHCN0Q/yHbfqI=;
 b=OMrhgfRuBw/95coy5PmDjnHmC07coFxvGhkDfMvpaUiwq9QDuXiyysZO
 1nESKbByfAYyU1Nq15IXDai1cdktfwsM+/Y9AsGwjkqJ9ftTrq/UtSKhG
 Om2+HNsSau48dIh7ZJNndNmaPBkkMl5BtKeIFNGoNpdrP1m0Oe7QT3b4q
 0jH4czUPWrkwwzqY8ad6slPt+l8TOX5KQpeXBdzQnFpNXdGml+gkLlJW1
 0XFLgZofWTTL5/NapG7r6fokUZ3o/QoOMafq3W9clhOYtfNRvnxMgvxFj
 orC5A4x5FIdhJJ8/kc5v6eIZgmrph9IJfiPqhgUYjcV0CLvnVYqObGGyK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="411273237"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="411273237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:30:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="836184884"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="836184884"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.8.140])
 ([10.213.8.140])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 07:30:36 -0700
Message-ID: <a10480c6-162b-a886-28f6-e95930d4664b@intel.com>
Date: Fri, 21 Apr 2023 16:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH v7 2/7] lib/ref_tracker: improve printing stats
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>
References: <20230224-track_gt-v7-0-11f08358c1ec@intel.com>
 <20230224-track_gt-v7-2-11f08358c1ec@intel.com>
 <CANn89iLUDXz9VAtCQ6Gr2Jkxogdu_5g0tN9iCkAB0JD_B_05Gw@mail.gmail.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CANn89iLUDXz9VAtCQ6Gr2Jkxogdu_5g0tN9iCkAB0JD_B_05Gw@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21.04.2023 16:21, Eric Dumazet wrote:
> On Fri, Apr 21, 2023 at 1:35 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>> In case the library is tracking busy subsystem, simply
>> printing stack for every active reference will spam log
>> with long, hard to read, redundant stack traces. To improve
>> readabilty following changes have been made:
>> - reports are printed per stack_handle - log is more compact,
>> - added display name for ref_tracker_dir - it will differentiate
>>    multiple subsystems,
>> - stack trace is printed indented, in the same printk call,
>> - info about dropped references is printed as well.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> ---
>>   include/linux/ref_tracker.h | 15 ++++++--
>>   lib/ref_tracker.c           | 90 +++++++++++++++++++++++++++++++++++++++------
>>   2 files changed, 91 insertions(+), 14 deletions(-)
>>
>> diff --git a/include/linux/ref_tracker.h b/include/linux/ref_tracker.h
>> index 87a92f2bec1b88..fc9ef9952f01fd 100644
>> --- a/include/linux/ref_tracker.h
>> +++ b/include/linux/ref_tracker.h
>> @@ -17,12 +17,19 @@ struct ref_tracker_dir {
>>          bool                    dead;
>>          struct list_head        list; /* List of active trackers */
>>          struct list_head        quarantine; /* List of dead trackers */
>> +       char                    name[32];
>>   #endif
>>   };
>>
>>   #ifdef CONFIG_REF_TRACKER
>> -static inline void ref_tracker_dir_init(struct ref_tracker_dir *dir,
>> -                                       unsigned int quarantine_count)
>> +
>> +/* Temporary allow two and three arguments, until consumers are converted */
>> +#define ref_tracker_dir_init(_d, _q, args...) _ref_tracker_dir_init(_d, _q, ##args, #_d)
>> +#define _ref_tracker_dir_init(_d, _q, _n, ...) __ref_tracker_dir_init(_d, _q, _n)
>> +
> We only have four callers of ref_tracker_dir_init() .
>
> Why not simply add a name on them, and avoid this magic ?

If this can be done in one patch, that's great.

Regards
Andrzej

