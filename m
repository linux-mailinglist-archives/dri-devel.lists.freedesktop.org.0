Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEoSD2eVgmkRWgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 01:40:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90390E0125
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 01:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4EC10E348;
	Wed,  4 Feb 2026 00:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lF+eaSrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CD610E0F0;
 Wed,  4 Feb 2026 00:40:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AF6342B78;
 Wed,  4 Feb 2026 00:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C2AC116D0;
 Wed,  4 Feb 2026 00:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770165601;
 bh=GKZovP5EOkZIiHKArIuUvE9p7wRRTOzjsnqws8YhSyA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lF+eaSrWziwRv88h/hRHnoiSfWjtPLke0CcocKziqLrVgVLuA8yvKTquq3WUj75uI
 8GO9FQYD/r19l2bHiXFwhcOsSwrS17MkZghkaRUrKsTt+ae17aYWW9TpQjvdN7UxK+
 q341UQQlA6OQXnrcP2fyTM4aBVbe2jDwT4pNBCrFxEE9W+N9tEfg/I+ywqtQlafeRC
 SpaTPl50S+Em5dUoNFMeLqczvdqTdAiD90jGvsqVzkO/ZkgGEjplrir+UlSC9yL3mA
 Sfiq6TdnJ1SC7wYjGuGwaB8vrHWXPiqrSrSr0Qkx4n9R2HGfCu3RhPi9Kw1fEmbnSN
 BbCyCTIVPouiQ==
Date: Wed, 4 Feb 2026 01:39:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>, 
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>
Subject: Re: [PATCH v4] drm/i915/selftests: Defer signalling the request fence
Message-ID: <aYKNTxTAwSV-V1g_@zenone.zhora.eu>
References: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130184507.45233-2-krzysztof.niemiec@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[andi.shyti@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,zenone.zhora.eu:mid]
X-Rspamd-Queue-Id: 90390E0125
X-Rspamd-Action: no action

Hi Krzysztof,

On Fri, Jan 30, 2026 at 07:45:08PM +0100, Krzysztof Niemiec wrote:
> The i915_active selftests live_active_wait and live_active_retire
> operate on an i915_active attached to a mock, empty request, created as
> part of test setup. A fence is attached to this request to control when
> the request is processed. The tests then wait for the completion of the
> active with __i915_active_wait(), and the test is considered successful
> if this results in setting a variable in the active callback.
> 
> However, the behavior of __i915_active_wait() is such that if the
> refcount for the active is 0, the function is almost completely skipped;
> waiting on a already completed active yields no effect. This includes a
> subsequent call to the retire() function of the active (which is the
> callback that the test is interested about, and which dictates whether
> its successful or not). So, if the active is completed before the
> aforementioned call to __i915_active_wait(), the test will fail.
> 
> Most of the test runs in a single thread, including creating the
> request, creating the fence for it, signalling that fence, and calling
> __i915_active_wait(). However, the request itself is handled
> asynchronously. This creates a race condition where if the request is
> completed after signalling the fence, but before waiting on its active,
> the active callback will not be invoked, failing the test.
> 
> Defer signalling the request's fence, to ensure the main test thread
> gets to call __i915_active_wait() before request completion.
> 
> v4:
> - Lower the delay timeout to 50ms (Jonathan)
> - Put the check on work_finished inside a helper function (Jonathan)
> 
> v3:
> - Embed the variables inside the live_active struct (Andi)
> - Move the schedule_delayed_work call closer to the wait (Andi)
> - Implement error handling in case an error state - the wait has
>   finished, but the deferred work didn't run - is somehow achieved (Andi)
> 
> v2:
> - Clarify the need for a fix a little more (Krzysztof K., Janusz)
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14808
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>

I'm sorry, but for now this patch, for the reason I explained you
in a previous version, is a nack.

You are trying to bypass locking issues by adding a random 50ms
delay. It's too fragile and looks hackish.

In any case, I've seen a few issues below, in case someone else
agrees and is willing to merge it.

> ---
>  drivers/gpu/drm/i915/selftests/i915_active.c | 51 +++++++++++++++++---
>  1 file changed, 45 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_active.c b/drivers/gpu/drm/i915/selftests/i915_active.c
> index 36c3a5460221..eadd0a8bc094 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_active.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_active.c
> @@ -21,6 +21,10 @@ struct live_active {
>  	struct i915_active base;
>  	struct kref ref;
>  	bool retired;
> +
> +	struct i915_sw_fence *submit;
> +	struct delayed_work work;
> +	bool work_finished;
>  };
>  
>  static void __live_get(struct live_active *active)
> @@ -76,11 +80,37 @@ static struct live_active *__live_alloc(struct drm_i915_private *i915)
>  	return active;
>  }
>  
> +static void __live_submit_work_handler(struct work_struct *work)

I don't see the point for the '__' here.

> +{
> +	struct delayed_work *d_work = container_of(work, struct delayed_work, work);
> +	struct live_active *active = container_of(d_work, struct live_active, work);
> +	i915_sw_fence_commit(active->submit);
> +	heap_fence_put(active->submit);
> +	active->work_finished = true;
> +}
> +
> +static int
> +__live_work_confirm_finished(struct drm_i915_private *i915,
> +			     struct live_active *active)
> +{
> +	int err = 0;
> +
> +	if (!active->work_finished) {
> +		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
> +
> +		drm_printf(&p, "active->work hasn't finished, something went\
> +				terribly wrong\n");

until 100 characters per line is fine, but I'm sure you can
reword to something better.

> +		err = -EINVAL;
> +		cancel_delayed_work_sync(&active->work);
> +	}
> +
> +	return err;
> +}
> +
>  static struct live_active *
>  __live_active_setup(struct drm_i915_private *i915)
>  {
>  	struct intel_engine_cs *engine;
> -	struct i915_sw_fence *submit;
>  	struct live_active *active;
>  	unsigned int count = 0;
>  	int err = 0;
> @@ -89,8 +119,11 @@ __live_active_setup(struct drm_i915_private *i915)
>  	if (!active)
>  		return ERR_PTR(-ENOMEM);
>  
> -	submit = heap_fence_create(GFP_KERNEL);
> -	if (!submit) {
> +	INIT_DELAYED_WORK(&active->work, __live_submit_work_handler);
> +	active->work_finished = false;
> +
> +	active->submit = heap_fence_create(GFP_KERNEL);
> +	if (!active->submit) {
>  		kfree(active);
>  		return ERR_PTR(-ENOMEM);
>  	}
> @@ -109,7 +142,7 @@ __live_active_setup(struct drm_i915_private *i915)
>  		}
>  
>  		err = i915_sw_fence_await_sw_fence_gfp(&rq->submit,
> -						       submit,
> +						       active->submit,
>  						       GFP_KERNEL);
>  		if (err >= 0)
>  			err = i915_active_add_request(&active->base, rq);
> @@ -134,8 +167,6 @@ __live_active_setup(struct drm_i915_private *i915)
>  	}
>  
>  out:
> -	i915_sw_fence_commit(submit);
> -	heap_fence_put(submit);
>  	if (err) {
>  		__live_put(active);
>  		active = ERR_PTR(err);
> @@ -156,6 +187,8 @@ static int live_active_wait(void *arg)
>  	if (IS_ERR(active))
>  		return PTR_ERR(active);

if we return with an error...

>  
> +	schedule_delayed_work(&active->work, msecs_to_jiffies(50));

... we don't schedule the work and therefore you leak the fence.

> +
>  	__i915_active_wait(&active->base, TASK_UNINTERRUPTIBLE);
>  	if (!READ_ONCE(active->retired)) {
>  		struct drm_printer p = drm_err_printer(&i915->drm, __func__);
> @@ -166,6 +199,8 @@ static int live_active_wait(void *arg)
>  		err = -EINVAL;
>  	}
>  
> +	err = __live_work_confirm_finished(i915, active);

Here you are overwriting err.

> +
>  	__live_put(active);
>  
>  	if (igt_flush_test(i915))
> @@ -186,6 +221,8 @@ static int live_active_retire(void *arg)
>  	if (IS_ERR(active))
>  		return PTR_ERR(active);
>  
> +	schedule_delayed_work(&active->work, msecs_to_jiffies(50));
> +
>  	/* waits for & retires all requests */
>  	if (igt_flush_test(i915))
>  		err = -EIO;
> @@ -199,6 +236,8 @@ static int live_active_retire(void *arg)
>  		err = -EINVAL;
>  	}
>  
> +	err = __live_work_confirm_finished(i915, active);

here as well.

Andi

> +
>  	__live_put(active);
>  
>  	return err;
> -- 
> 2.45.2
> 
