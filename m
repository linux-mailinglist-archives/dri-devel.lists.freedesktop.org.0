Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B486B3CF619
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 10:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5C789BFB;
	Tue, 20 Jul 2021 08:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD95E89BFB;
 Tue, 20 Jul 2021 08:25:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="272313214"
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="272313214"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 01:25:33 -0700
X-IronPort-AV: E=Sophos;i="5.84,254,1620716400"; d="scan'208";a="657416868"
Received: from ekearns1-mobl.amr.corp.intel.com (HELO [10.213.195.253])
 ([10.213.195.253])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 01:25:31 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: Always call i915_globals_exit()
 from i915_exit()
To: Jason Ekstrand <jason@jlekstrand.net>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210719183047.2624569-1-jason@jlekstrand.net>
 <20210719183047.2624569-4-jason@jlekstrand.net>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <6ecf6891-67c2-94ac-32ce-28c1a1a7db0b@linux.intel.com>
Date: Tue, 20 Jul 2021 09:25:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719183047.2624569-4-jason@jlekstrand.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/07/2021 19:30, Jason Ekstrand wrote:
> If the driver was not fully loaded, we may still have globals lying
> around.  If we don't tear those down in i915_exit(), we'll leak a bunch
> of memory slabs.  This can happen two ways: use_kms = false and if we've
> run mock selftests.  In either case, we have an early exit from
> i915_init which happens after i915_globals_init() and we need to clean
> up those globals.  While we're here, add an explicit boolean instead of
> using a random field from i915_pci_device to detect partial loads.
> 
> The mock selftests case gets especially sticky.  The load isn't entirely
> a no-op.  We actually do quite a bit inside those selftests including
> allocating a bunch of mock objects and running tests on them.  Once all
> those tests are complete, we exit early from i915_init().  Perviously,
> i915_init() would return a non-zero error code on failure and a zero
> error code on success.  In the success case, we would get to i915_exit()
> and check i915_pci_driver.driver.owner to detect if i915_init exited early
> and do nothing.  In the failure case, we would fail i915_init() but
> there would be no opportunity to clean up globals.
> 
> The most annoying part is that you don't actually notice the failure as
> part of the self-tests since leaking a bit of memory, while bad, doesn't
> result in anything observable from userspace.  Instead, the next time we
> load the driver (usually for next IGT test), i915_globals_init() gets
> invoked again, we go to allocate a bunch of new memory slabs, those
> implicitly create debugfs entries, and debugfs warns that we're trying
> to create directories and files that already exist.  Since this all
> happens as part of the next driver load, it shows up in the dmesg-warn
> of whatever IGT test ran after the mock selftests.

Story checks out but I totally don't get why it wouldn't be noticed 
until now. Was it perhaps part of the selfetsts contract that a reboot 
is required after failure?

> While the obvious thing to do here might be to call i915_globals_exit()
> after selftests, that's not actually safe.  The dma-buf selftests call
> i915_gem_prime_export which creates a file.  We call dma_buf_put() on
> the resulting dmabuf which calls fput() on the file.  However, fput()
> isn't immediate and gets flushed right before syscall returns.  This
> means that all the fput()s from the selftests don't happen until right
> before the module load syscall used to fire off the selftests returns
> which is after i915_init().  If we call i915_globals_exit() in
> i915_init() after selftests, we end up freeing slabs out from under
> objects which won't get released until fput() is flushed at the end of
> the module load.

Nasty. Wasn't visible while globals memory leak was "in place". :I

> The solution here is to let i915_init() return success early and detect
> the early success in i915_exit() and only tear down globals and nothing
> else.  This way the module loads successfully, regardless of the success
> or failure of the tests.  Because we've not enumerated any PCI devices,
> no device nodes are created and it's entirely useless from userspace.
> The only thing the module does at that point is hold on to a bit of
> memory until we unload it and i915_exit() is called.  Importantly, this
> means that everything from our selftests has the ability to properly
> flush out between i915_init() and i915_exit() because there are a couple
> syscall boundaries in between.

When you say "couple of syscall boundaries" you mean exactly two (module 
init/unload) or there is more to it? Like why "couple" is needed and not 
just that the module load syscall has exited? That part sounds 
potentially dodgy. What mechanism is used by the delayed flush?

Have you checked how this change interacts with the test runner and CI?

> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Fixes: 32eb6bcfdda9 ("drm/i915: Make request allocation caches global")
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/i915_pci.c | 32 +++++++++++++++++++++++++-------
>   1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 4e627b57d31a2..24e4e54516936 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1194,18 +1194,31 @@ static struct pci_driver i915_pci_driver = {
>   	.driver.pm = &i915_pm_ops,
>   };
>   
> +static bool i915_fully_loaded = false;

No need to initialize.

> +
>   static int __init i915_init(void)
>   {
>   	bool use_kms = true;
>   	int err;
>   
> +	i915_fully_loaded = false;

Ditto.

> +
>   	err = i915_globals_init();
>   	if (err)
>   		return err;
>   
> +	/* i915_mock_selftests() only returns zero if no mock subtests were


/*
  * Please use this multi line comment style in i915.
  */


> +	 * run.  If we get any non-zero error code, we return early here.
> +	 * We always return success because selftests may have allocated
> +	 * objects from slabs which will get cleaned up by i915_exit().  We
> +	 * could attempt to clean up immediately and fail module load but,
> +	 * thanks to interactions with other parts of the kernel (struct
> +	 * file, in particular), it's safer to let the module fully load
> +	 * and then clean up on unload.
> +	 */
>   	err = i915_mock_selftests();
>   	if (err)
> -		return err > 0 ? 0 : err;
> +		return 0;
>   
>   	/*
>   	 * Enable KMS by default, unless explicitly overriden by
> @@ -1225,6 +1238,12 @@ static int __init i915_init(void)
>   		return 0;
>   	}
>   
> +	/* After this point, i915_init() must either fully succeed or
> +	 * properly tear everything down and fail.  We don't have separate
> +	 * flags for each set-up bit.
> +	 */
> +	i915_fully_loaded = true;
> +
>   	i915_pmu_init();
>   
>   	err = pci_register_driver(&i915_pci_driver);
> @@ -1240,12 +1259,11 @@ static int __init i915_init(void)
>   
>   static void __exit i915_exit(void)
>   {
> -	if (!i915_pci_driver.driver.owner)
> -		return;
> -
> -	i915_perf_sysctl_unregister();
> -	pci_unregister_driver(&i915_pci_driver);
> -	i915_pmu_exit();
> +	if (i915_fully_loaded) {
> +		i915_perf_sysctl_unregister();
> +		pci_unregister_driver(&i915_pci_driver);
> +		i915_pmu_exit();
> +	}
>   	i915_globals_exit();
>   }
>   
> 

Regards,

Tvrtko
