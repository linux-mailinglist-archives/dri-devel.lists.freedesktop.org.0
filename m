Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149EA7A7BB1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 13:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC3B10E491;
	Wed, 20 Sep 2023 11:54:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D665110E494;
 Wed, 20 Sep 2023 11:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695210873; x=1726746873;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hYpNo1+K6ZDJ9Jat/1jZovxRpSLs4uQnMyhrFBhf+ro=;
 b=C9GvFR6AaJEnJA8U468TIAm4ZihqLloVpxqyXQWByKMl7n1Y4jgBhw0U
 ewZhw4C7IuJzzW0MwgVe/Wp/a55RMRx+IfCuXbFiMPKnFDkWPTAVGZZR6
 x4kkpCwA66iLvxB0MPcQizF8D4zMQc3NPxGKzBObuAI3c3o+DX8mmbJSx
 L2M1G26HuDDkYkSQxJvbIz4hlpTcWOsFnGJ2g446z4/70jwc5oh2vSa1Z
 Rczg98Xi1ht357jUn+TAo2O2fZnuuHFPqgmAm8srszlKA79x5vnbuzDje
 o5fIzJjtdkWkoC6+6DayP6NqXyfzow/Cmg5at4Z0ektegsB11sr6XjAWG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="379084313"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="379084313"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:54:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="816876199"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="816876199"
Received: from conorbyr-mobl1.ger.corp.intel.com (HELO [10.213.199.161])
 ([10.213.199.161])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 04:54:31 -0700
Message-ID: <0c852a65-6f8a-1d28-390e-88d2232b90cd@linux.intel.com>
Date: Wed, 20 Sep 2023 12:54:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Do not disable preemption for resets
To: Valentin Schneider <vschneid@redhat.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20230705093025.3689748-1-tvrtko.ursulin@linux.intel.com>
 <20230913080819.xnpM7Ybx@linutronix.de>
 <CAD235PRj3PzMwfwL6zaFko__XjQctKyMZAAXEmf_0==n_nCGpQ@mail.gmail.com>
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAD235PRj3PzMwfwL6zaFko__XjQctKyMZAAXEmf_0==n_nCGpQ@mail.gmail.com>
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
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
 Intel-gfx@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/09/2023 18:04, Valentin Schneider wrote:
> On Wed, 13 Sept 2023 at 18:48, Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
>>
>> On 2023-07-05 10:30:25 [+0100], Tvrtko Ursulin wrote:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>
>>> Commit ade8a0f59844 ("drm/i915: Make all GPU resets atomic") added a
>>> preempt disable section over the hardware reset callback to prepare the
>>> driver for being able to reset from atomic contexts.
>> …
>>
>> This missed the v6.6 merge window. Has this been dropped for some reason
>> or just missed by chance? Can this be still applied, please?
>>
> 
> Just an FYI, but I happened to be looking at an internal bug report
> for exactly this
> error site, so +1 here :)

It looks I failed to collect an r-b before the summer break and so it 
fell off my radar. Definitely want to merge it so I will try again.

Regards,

Tvrtko
