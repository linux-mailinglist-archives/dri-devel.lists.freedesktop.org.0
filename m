Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020383D01B7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 20:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B5589CB8;
	Tue, 20 Jul 2021 18:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D7789C52
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 18:29:40 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id f17so27043864wrt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 11:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ir97/oWBQqDfcEf251FKZZuEuuRPdtGQ2wSBtFvBl4M=;
 b=XL8vIMXTl7C/5e4L9bvrmnmmFugTEtEqwvQjvDQjRC5XwR1PNpna1iisRnmHYsafQw
 fMGTvzfyl88bN1fMvp9yqKG88J7W7zBK3KrS8b1kamJB7WR1aaBRqKxUgyaRl3kKGH8z
 SFg1N4ONjMtAbd+/wefWc3Fc6FnVIVn1EdOLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ir97/oWBQqDfcEf251FKZZuEuuRPdtGQ2wSBtFvBl4M=;
 b=JVk5Nz5POZbk6KlhhAXfYxUzgU39F/gLCh3puaI9m4XrbQnHhCPgJQjyIFv80BJym2
 NBd2NjaNmAIsiiSsRRLtpnZS48O6rJFIJOgWeN96pyEeYhdVN2PiW+UGV4jjcdfGheeR
 EWukCa5M4J9OafOnHqIhPPdiNGVJt36vgHiHOYWOGBfLRfcAUlsUW0eIYVmXvmJfAv9I
 3ZeDqdtKZ52e+1ebzia0Q/wDJAu04S7NwkWKsfw5/DAojIM9IiRzivbVKQ6NeN7UBKjm
 POB95f5+hfM2lyRWVHyoL0uXxQh5LEdfOw1vFLPTm0IM8i88P0SociGT7TN/gWz/Bwus
 nUdg==
X-Gm-Message-State: AOAM530Nx3l9VFfD/1Y0z676MnUGcZX/MvQB+e4kasQurbO153ABr/wj
 q9vxHImxlViRwGabbXFPDs95GrsDw7FudQ==
X-Google-Smtp-Source: ABdhPJwgGMkmh7gEabJ8p28mRqsdJ90lDccl2t/af7syC8/I0zP6tcdYI9kmvmyWscRy9zn4jVfmVQ==
X-Received: by 2002:adf:df12:: with SMTP id y18mr38553776wrl.189.1626805778943; 
 Tue, 20 Jul 2021 11:29:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b8sm3121412wmb.20.2021.07.20.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 11:29:38 -0700 (PDT)
Date: Tue, 20 Jul 2021 20:29:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 3/6] drm/i915: Use a table for i915_init/exit
Message-ID: <YPcWEL48uQ9uW8aj@phenom.ffwll.local>
References: <20210720181357.2760720-1-jason@jlekstrand.net>
 <20210720181357.2760720-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720181357.2760720-4-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 01:13:54PM -0500, Jason Ekstrand wrote:
> If the driver was not fully loaded, we may still have globals lying
> around.  If we don't tear those down in i915_exit(), we'll leak a bunch
> of memory slabs.  This can happen two ways: use_kms = false and if we've
> run mock selftests.  In either case, we have an early exit from
> i915_init which happens after i915_globals_init() and we need to clean
> up those globals.
> 
> The mock selftests case is especially sticky.  The load isn't entirely
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
> 
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
> the module load syscall.
> 
> The solution here is to let i915_init() return success early and detect
> the early success in i915_exit() and only tear down globals and nothing
> else.  This way the module loads successfully, regardless of the success
> or failure of the tests.  Because we've not enumerated any PCI devices,
> no device nodes are created and it's entirely useless from userspace.
> The only thing the module does at that point is hold on to a bit of
> memory until we unload it and i915_exit() is called.  Importantly, this
> means that everything from our selftests has the ability to properly
> flush out between i915_init() and i915_exit() because there is at least
> one syscall boundary in between.
> 
> In order to handle all the delicate init/exit cases, we convert the
> whole thing to a table of init/exit pairs and track the init status in
> the new init_progress global.  This allows us to ensure that i915_exit()
> always tears down exactly the things that i915_init() successfully
> initialized.  We also allow early-exit of i915_init() without failure by
> an init function returning > 0.  This is useful for nomodeset, and
> selftests.  For the mock selftests, we convert them to always return 1
> so we get the desired behavior of the driver always succeeding to load
> the driver and then properly tearing down the partially loaded driver.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

g.l.o.r.i.o.u.s.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/i915_pci.c               | 104 ++++++++++++------
>  drivers/gpu/drm/i915/i915_perf.c              |   3 +-
>  drivers/gpu/drm/i915/i915_perf.h              |   2 +-
>  drivers/gpu/drm/i915/i915_pmu.c               |   4 +-
>  drivers/gpu/drm/i915/i915_pmu.h               |   4 +-
>  .../gpu/drm/i915/selftests/i915_selftest.c    |   2 +-
>  6 files changed, 80 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 4e627b57d31a2..64ebd89eae6ce 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1185,27 +1185,9 @@ static void i915_pci_shutdown(struct pci_dev *pdev)
>  	i915_driver_shutdown(i915);
>  }
>  
> -static struct pci_driver i915_pci_driver = {
> -	.name = DRIVER_NAME,
> -	.id_table = pciidlist,
> -	.probe = i915_pci_probe,
> -	.remove = i915_pci_remove,
> -	.shutdown = i915_pci_shutdown,
> -	.driver.pm = &i915_pm_ops,
> -};
> -
> -static int __init i915_init(void)
> +static int i915_check_nomodeset(void)
>  {
>  	bool use_kms = true;
> -	int err;
> -
> -	err = i915_globals_init();
> -	if (err)
> -		return err;
> -
> -	err = i915_mock_selftests();
> -	if (err)
> -		return err > 0 ? 0 : err;
>  
>  	/*
>  	 * Enable KMS by default, unless explicitly overriden by
> @@ -1222,31 +1204,87 @@ static int __init i915_init(void)
>  	if (!use_kms) {
>  		/* Silently fail loading to not upset userspace. */
>  		DRM_DEBUG_DRIVER("KMS disabled.\n");
> -		return 0;
> +		return 1;
>  	}
>  
> -	i915_pmu_init();
> +	return 0;
> +}
>  
> -	err = pci_register_driver(&i915_pci_driver);
> -	if (err) {
> -		i915_pmu_exit();
> -		i915_globals_exit();
> -		return err;
> +static struct pci_driver i915_pci_driver = {
> +	.name = DRIVER_NAME,
> +	.id_table = pciidlist,
> +	.probe = i915_pci_probe,
> +	.remove = i915_pci_remove,
> +	.shutdown = i915_pci_shutdown,
> +	.driver.pm = &i915_pm_ops,
> +};
> +
> +static int i915_register_pci_driver(void)
> +{
> +	return pci_register_driver(&i915_pci_driver);
> +}
> +
> +static void i915_unregister_pci_driver(void)
> +{
> +	pci_unregister_driver(&i915_pci_driver);
> +}
> +
> +static const struct {
> +   int (*init)(void);
> +   void (*exit)(void);
> +} init_funcs[] = {
> +	{ i915_globals_init, i915_globals_exit },
> +	{ i915_mock_selftests, NULL },
> +	{ i915_check_nomodeset, NULL },
> +	{ i915_pmu_init, i915_pmu_exit },
> +	{ i915_register_pci_driver, i915_unregister_pci_driver },
> +	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> +};
> +static int init_progress;
> +
> +static int __init i915_init(void)
> +{
> +	int err, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> +		err = init_funcs[i].init();
> +		if (err < 0) {
> +			while (i--) {
> +				if (init_funcs[i].exit)
> +					init_funcs[i].exit();
> +			}
> +			return err;
> +		} else if (err > 0) {
> +			/*
> +			 * Early-exit success is reserved for things which
> +			 * don't have an exit() function because we have no
> +			 * idea how far they got or how to partially tear
> +			 * them down.
> +			 */
> +			WARN_ON(init_funcs[i].exit);
> +
> +			/*
> +			 * We don't want to advertise devices with an only
> +			 * partially initialized driver.
> +			 */
> +			WARN_ON(i915_pci_driver.driver.owner);
> +			break;
> +		}
>  	}
>  
> -	i915_perf_sysctl_register();
> +	init_progress = i;
> +
>  	return 0;
>  }
>  
>  static void __exit i915_exit(void)
>  {
> -	if (!i915_pci_driver.driver.owner)
> -		return;
> +	int i;
>  
> -	i915_perf_sysctl_unregister();
> -	pci_unregister_driver(&i915_pci_driver);
> -	i915_pmu_exit();
> -	i915_globals_exit();
> +	for (i = init_progress - 1; i >= 0; i--) {
> +		if (init_funcs[i].exit)
> +			init_funcs[i].exit();
> +	}
>  }
>  
>  module_init(i915_init);
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index b4ec114a4698b..48ddb363b3bda 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4483,9 +4483,10 @@ static int destroy_config(int id, void *p, void *data)
>  	return 0;
>  }
>  
> -void i915_perf_sysctl_register(void)
> +int i915_perf_sysctl_register(void)
>  {
>  	sysctl_header = register_sysctl_table(dev_root);
> +	return 0;
>  }
>  
>  void i915_perf_sysctl_unregister(void)
> diff --git a/drivers/gpu/drm/i915/i915_perf.h b/drivers/gpu/drm/i915/i915_perf.h
> index 882fdd0a76800..1d1329e5af3ae 100644
> --- a/drivers/gpu/drm/i915/i915_perf.h
> +++ b/drivers/gpu/drm/i915/i915_perf.h
> @@ -23,7 +23,7 @@ void i915_perf_fini(struct drm_i915_private *i915);
>  void i915_perf_register(struct drm_i915_private *i915);
>  void i915_perf_unregister(struct drm_i915_private *i915);
>  int i915_perf_ioctl_version(void);
> -void i915_perf_sysctl_register(void);
> +int i915_perf_sysctl_register(void);
>  void i915_perf_sysctl_unregister(void);
>  
>  int i915_perf_open_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 34d37d46a1262..eca92076f31d2 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -1088,7 +1088,7 @@ static int i915_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>  
>  static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>  
> -void i915_pmu_init(void)
> +int i915_pmu_init(void)
>  {
>  	int ret;
>  
> @@ -1101,6 +1101,8 @@ void i915_pmu_init(void)
>  			  ret);
>  	else
>  		cpuhp_slot = ret;
> +
> +	return 0;
>  }
>  
>  void i915_pmu_exit(void)
> diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
> index 60f9595f902cd..449057648f39b 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.h
> +++ b/drivers/gpu/drm/i915/i915_pmu.h
> @@ -147,14 +147,14 @@ struct i915_pmu {
>  };
>  
>  #ifdef CONFIG_PERF_EVENTS
> -void i915_pmu_init(void);
> +int i915_pmu_init(void);
>  void i915_pmu_exit(void);
>  void i915_pmu_register(struct drm_i915_private *i915);
>  void i915_pmu_unregister(struct drm_i915_private *i915);
>  void i915_pmu_gt_parked(struct drm_i915_private *i915);
>  void i915_pmu_gt_unparked(struct drm_i915_private *i915);
>  #else
> -static inline void i915_pmu_init(void) {}
> +static inline int i915_pmu_init(void) { return 0; }
>  static inline void i915_pmu_exit(void) {}
>  static inline void i915_pmu_register(struct drm_i915_private *i915) {}
>  static inline void i915_pmu_unregister(struct drm_i915_private *i915) {}
> diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> index 1bc11c09faef5..935d065725345 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
> @@ -187,7 +187,7 @@ int i915_mock_selftests(void)
>  	err = run_selftests(mock, NULL);
>  	if (err) {
>  		i915_selftest.mock = err;
> -		return err;
> +		return 1;
>  	}
>  
>  	if (i915_selftest.mock < 0) {
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
