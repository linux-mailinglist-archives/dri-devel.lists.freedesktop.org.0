Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559606A9788
	for <lists+dri-devel@lfdr.de>; Fri,  3 Mar 2023 13:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D450810E13C;
	Fri,  3 Mar 2023 12:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A8910E13C;
 Fri,  3 Mar 2023 12:49:45 +0000 (UTC)
Received: from fsav312.sakura.ne.jp (fsav312.sakura.ne.jp [153.120.85.143])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 323CnauL011810;
 Fri, 3 Mar 2023 21:49:36 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav312.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp);
 Fri, 03 Mar 2023 21:49:36 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav312.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 323CnaOO011807
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 3 Mar 2023 21:49:36 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <32df5def-ad1a-e1aa-d2fe-f3c37cb01032@I-love.SAKURA.ne.jp>
Date: Fri, 3 Mar 2023 21:49:36 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/i915: avoid flush_scheduled_work() usage
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
In-Reply-To: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023/03/03 19:11, Tetsuo Handa wrote:
> @@ -79,6 +81,7 @@ static int __init i915_init(void)
>  {
>  	int err, i;
>  
> +	i915_wq = alloc_workqueue("i915", 0, 0);

Oops. I forgot to add

	if (!i915_wq)
		return -ENOMEM;

here. But I'd like to wait for your response for a while before submitting v2 patch.


>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>  		err = init_funcs[i].init();
>  		if (err < 0) {
> @@ -86,6 +89,7 @@ static int __init i915_init(void)
>  				if (init_funcs[i].exit)
>  					init_funcs[i].exit();
>  			}
> +			destroy_workqueue(i915_wq);
>  			return err;
>  		} else if (err > 0) {
>  			/*
> @@ -113,6 +117,7 @@ static void __exit i915_exit(void)
>  		if (init_funcs[i].exit)
>  			init_funcs[i].exit();
>  	}
> +	destroy_workqueue(i915_wq);
>  }
>  
>  module_init(i915_init);

