Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D858F6ABDAA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:05:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E119410E25B;
	Mon,  6 Mar 2023 11:05:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB7110E25B;
 Mon,  6 Mar 2023 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678100714; x=1709636714;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=O6PiwTTu85m7pc4dCo3XPKxBXGg6rYsyF/pHYI+SPTs=;
 b=P+vC9jx87RxgcRW1v47JVZxFzxwODPNguQet/1fRfAXNQi4tCRMYwH9g
 AiRxaPBhmLbJR9QGzHobWPc9Gms29kQ8ZsSlFKvcSbTc+DaVKoIpYCZFJ
 +o0IH8e3vG3bTEwX2kYD5B87T19N6Znn0D3TwOI2UClebeU9DQTpurd/x
 afZjATWhKHZse1nX9W/C2ayCc8tqhqWJR+DLX8LI/f0BmY5hDKUaIkluT
 RqpmQwDKDpT0QX+Vi1B2Dz3U3Js3NTqbapK/ozTomB/iDiw3zHv+SeZLm
 0BtlrDUgSMdiE3EJGxbnhWlao5NhzINxuBUVzGz/bOMNDfltpj2KnZD3R g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="334242145"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="334242145"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="850253563"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="850253563"
Received: from bholthau-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.77])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:05:08 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915: avoid flush_scheduled_work() usage
In-Reply-To: <32df5def-ad1a-e1aa-d2fe-f3c37cb01032@I-love.SAKURA.ne.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <32df5def-ad1a-e1aa-d2fe-f3c37cb01032@I-love.SAKURA.ne.jp>
Date: Mon, 06 Mar 2023 13:05:06 +0200
Message-ID: <87sfeita1p.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 03 Mar 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> On 2023/03/03 19:11, Tetsuo Handa wrote:
>> @@ -79,6 +81,7 @@ static int __init i915_init(void)
>>  {
>>  	int err, i;
>>  
>> +	i915_wq = alloc_workqueue("i915", 0, 0);
>
> Oops. I forgot to add
>
> 	if (!i915_wq)
> 		return -ENOMEM;
>
> here. But I'd like to wait for your response for a while before submitting v2 patch.

Looks like accounting for every schedule_work() and friends that we have
is pretty difficult at this point, so I agree going for a local
workqueue and flushing that is probably the way to go. Work specific
cleanups can follow.

However, we really don't want to add new module globals, not for this,
not for anything. So for most things it would have to be i915 device
specific. And that, in turn, would have to be two workqueues, one for
display, one for other stuff. Don't want to mix the two.

BR,
Jani.









>
>
>>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>>  		err = init_funcs[i].init();
>>  		if (err < 0) {
>> @@ -86,6 +89,7 @@ static int __init i915_init(void)
>>  				if (init_funcs[i].exit)
>>  					init_funcs[i].exit();
>>  			}
>> +			destroy_workqueue(i915_wq);
>>  			return err;
>>  		} else if (err > 0) {
>>  			/*
>> @@ -113,6 +117,7 @@ static void __exit i915_exit(void)
>>  		if (init_funcs[i].exit)
>>  			init_funcs[i].exit();
>>  	}
>> +	destroy_workqueue(i915_wq);
>>  }
>>  
>>  module_init(i915_init);
>

-- 
Jani Nikula, Intel Open Source Graphics Center
