Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8982B11B73
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA6110E1A5;
	Fri, 25 Jul 2025 10:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="LGsUA9BR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458D310E179;
 Fri, 25 Jul 2025 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OOpciwetaFaV2ukz/jkO+LK11DYvE3p779DTKh95WWs=; b=LGsUA9BRWBtPtK5DVIGnGVMTAF
 bBcVcXQJTRoGHi2Z/Hpjo5Edb+cYnV5gxEK7STPXNQjK+W2g2WjovoAUkwVh6YUtallfILAfBq3ma
 RWy2oHGr2KJpA3SFd1i+/lzn93Gy3z9iVj5IFXuOWxOfIW89/mASA2Na5piKT/4Ycfh7KFTYh/+8w
 B7uVw/DCMApElmeetOAJUXxJzuY0ZfVqTYpC1hozuCjbbVs+gq88x6bqZLlx2xPPWvivis6mpC7Av
 5OuKha+ANIkkcVaPn612inzrRTXAgzk4NAbnpdGZ19moAFig5+sg1F1EiZFVWVVrsvLsFKrKASewZ
 ZIwI5wwg==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1ufFFo-003ePy-Nu; Fri, 25 Jul 2025 12:02:16 +0200
Message-ID: <0b797424-a0dd-4b6e-bcb3-b45715284472@igalia.com>
Date: Fri, 25 Jul 2025 11:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 20/23] cgroup/drm: Introduce weight based scheduling control
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Tejun Heo <tj@kernel.org>
References: <20250502123256.50540-1-tvrtko.ursulin@igalia.com>
 <20250502123256.50540-21-tvrtko.ursulin@igalia.com>
 <jlswx5kabjkszrkdmoflcqi7ycbxbfjfflbni3knromz6ucx63@kjwypivu3jpq>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <jlswx5kabjkszrkdmoflcqi7ycbxbfjfflbni3knromz6ucx63@kjwypivu3jpq>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 02/06/2025 17:22, Michal Koutný wrote:
> Hello.

Hi and apologies for the delay.

> On Fri, May 02, 2025 at 01:32:53PM +0100, Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Similar to CPU and IO scheduling, implement a concept of weight in the DRM
>> cgroup controller.
>>
>> Individual drivers are now able to register with the controller which will
>> notify them of the relative scheduling weight for each open DRM client.
>>
>> The notifications are triggered on cgroup weight changes and DRM clients
>> appearing and disappearing in/from cgroups. Latter is done because it is
>> handy to ignore the groups with no DRM clients in relative weight
>> calculations.
>>
>> The notifications are also consolidated by using a delayed worker.
>>
>> On the userspace API level we use the same range and defaults as the CPU
>> controller - CGROUP_WEIGHT_MIN, CGROUP_WEIGHT_DFL and CGROUP_WEIGHT_MAX.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Michal Koutný <mkoutny@suse.com>
>> Cc: Tejun Heo <tj@kernel.org>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst |  22 ++
>>   include/linux/cgroup_drm.h              |   2 +
>>   kernel/cgroup/drm.c                     | 313 +++++++++++++++++++++++-
>>   3 files changed, 331 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index 1a16ce68a4d7..095b7dee0151 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2729,6 +2729,28 @@ HugeTLB Interface Files
>>           hugetlb pages of <hugepagesize> in this cgroup.  Only active in
>>           use hugetlb pages are included.  The per-node values are in bytes.
>>   
>> +DRM
>> +---
>> +
>> +The controller allows for configuring of scheduling weights of cgroups relative
>> +to their siblings.
>> +
>> +NOTE: This is an optional feature into which individual DRM drivers need to
>> +      opt-in if they want to support it.
>> +
>> +NOTE: Only single GPU systems will work as expected in the current
>> +      implementation.
>> +
>> +DRM Interface Files
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +  drm.weight
>> +        A read-write single value file which exists on non-root cgroups. The
>> +        default is "100".
> 
> Should this be akin to IO controller and have subkey granularity for
> individual devices? (With special 'default' entry.)
> 
> (Can those devices come and go (hotplug)?)

Hot(un)plug is possible yes.

I was thinking about the possibility of starting with the global weight 
and later adding per device if required. As in, global is better than 
nothing and works for many use cases.

Not only on the uapi level but even the RFC to begin with could be 
improved in the implementation to have separate scaled weights tree per 
device. But again, for the "better than nothing", single scaled weights 
tree and a no per device uapi controls already brings benefits and does 
not preclude later extensions with no need to change the uapi.

>> +
>> +        The weights are in the range [1, 10000] and specify the relative
>> +        scheduling weights for cgroups in relation to their siblings.
>> +
>>   Misc
>>   ----
>>   
>> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
>> index d6a9a2fbdbf5..9961003958b4 100644
>> --- a/include/linux/cgroup_drm.h
>> +++ b/include/linux/cgroup_drm.h
>> @@ -6,6 +6,8 @@
>>   
>>   #include <drm/drm_file.h>
>>   
>> +#define DRM_CGROUP_WEIGHT_SHIFT 10
>> +
>>   #if IS_ENABLED(CONFIG_CGROUP_DRM)
>>   void drmcgroup_client_open(struct drm_file *file_priv);
>>   void drmcgroup_client_close(struct drm_file *file_priv);
>> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
>> index ea7655edf86a..532702604786 100644
>> --- a/kernel/cgroup/drm.c
>> +++ b/kernel/cgroup/drm.c
>> @@ -13,10 +13,18 @@ struct drm_cgroup_state {
>>   	struct cgroup_subsys_state css;
>>   
>>   	struct list_head clients;
>> +	unsigned int num_clients; /* Whole branch */
>> +
>> +	unsigned int sum_children_weights;
>> +
>> +	unsigned int weight;
>> +	unsigned int effective_weight;
> 
> IIUC, this is weight normalized across siblings (and not scaled by
> ancestors)?

No, it is the latter - I have them in a "global namespace". (But only 
groups which have DRM clients take part.)

> It should be then sufficient to only notify the siblings of modified
> cgroup after the recalculation, shouldn't it?
> 
>>   };
>>   
>>   struct drm_root_cgroup_state {
>>   	struct drm_cgroup_state drmcs;
>> +
>> +	struct delayed_work notify_work;
>>   };
>>   
>>   static struct drm_root_cgroup_state root_drmcs = {
>> @@ -31,7 +39,7 @@ css_to_drmcs(struct cgroup_subsys_state *css)
>>   	return container_of(css, struct drm_cgroup_state, css);
>>   }
>>   
>> -static void __maybe_unused
>> +static void
>>   drmcs_notify_weight(struct drm_cgroup_state *drmcs)
>>   {
>>   	struct drm_file *fpriv;
>> @@ -43,16 +51,152 @@ drmcs_notify_weight(struct drm_cgroup_state *drmcs)
>>   			fpriv->minor->dev->driver->cg_ops;
>>   
>>   		if (cg_ops && cg_ops->notify_weight)
>> -			cg_ops->notify_weight(fpriv, 0);
>> +			cg_ops->notify_weight(fpriv, drmcs->effective_weight);
>>   	}
>>   }
>>   
>> +static void drmcg_update_weights_locked(void)
>> +{
>> +	lockdep_assert_held(&drmcg_mutex);
>> +
>> +	mod_delayed_work(system_wq,
>> +			 &root_drmcs.notify_work,
>> +			 usecs_to_jiffies(1000));
> 
> This value is little bit magic.
> What is this consolidatiot good for?
> (I guess it's rather because of clients joining/leaving rather than
> cgroup attribute modifications.)

Correct, it is to coalesce update storms into one re-calculation event. 
There is no point in being instantenuous anyway, since DRM scheduling is 
generally really coarse grained compared to other subsystems. For 
example execution quanta is more often than not controlled by the 
userspace simply due the widespread lack of preemption.

I should indeed add a comment to this effect. Marked as TODO. Possibly 
lower the delay as well since I think one second is a bit too lazy.

>> +}
>> +
>> +static void drmcg_update_weights(void)
>> +{
>> +	mutex_lock(&drmcg_mutex);
>> +	drmcg_update_weights_locked();
>> +	mutex_unlock(&drmcg_mutex);
>> +}
>> +
>> +static u64
>> +drmcs_read_weight(struct cgroup_subsys_state *css, struct cftype *cft)
>> +{
>> +	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
>> +
>> +	return drmcs->weight;
>> +}
>> +
>> +static int
>> +drmcs_write_weight(struct cgroup_subsys_state *css, struct cftype *cftype,
>> +		   u64 weight)
>> +{
>> +	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
>> +	int ret;
>> +
>> +	if (weight < CGROUP_WEIGHT_MIN || weight > CGROUP_WEIGHT_MAX)
>> +		return -ERANGE;
>> +
>> +	ret = mutex_lock_interruptible(&drmcg_mutex);
>> +	if (ret)
>> +		return ret;
>> +	drmcs->weight = weight;
>> +	drmcg_update_weights_locked();
>> +	mutex_unlock(&drmcg_mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static void notify_worker(struct work_struct *work)
>> +{
>> +	struct drm_cgroup_state *root = &root_drmcs.drmcs;
>> +	struct cgroup_subsys_state *node;
>> +	bool updated;
>> +
>> +	mutex_lock(&drmcg_mutex);
>> +	rcu_read_lock();
>> +
>> +	/*
>> +	 * Always come back later if we race with core cgroup management.
>> +	 */
>> +	updated = false;
>> +	if (WARN_ON_ONCE(!css_tryget_online(&root->css)))
>> +		goto out_unlock;
>> +
>> +	css_for_each_descendant_post(node, &root->css) {
>> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
>> +
>> +		if (!css_tryget_online(node))
>> +			goto out_put;
>> +
>> +		drmcs->sum_children_weights = 0;
>> +		css_put(node);
>> +	}
>> +
>> +	css_for_each_descendant_post(node, &root->css) {
>> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
>> +		struct drm_cgroup_state *parent;
>> +
>> +		if (!css_tryget_online(node))
>> +			goto out_put;
>> +		if (!node->parent || !drmcs->num_clients) {
>> +			css_put(node);
>> +			continue;
>> +		}
>> +		if (!css_tryget_online(node->parent)) {
>> +			css_put(node);
>> +			goto out_put;
>> +		}
>> +
>> +		parent = css_to_drmcs(node->parent);
>> +		parent->sum_children_weights += drmcs->weight;
>> +		css_put(node);
>> +		css_put(&parent->css);
>> +	}
>> +
>> +	css_for_each_descendant_pre(node, &root->css) {
>> +		struct drm_cgroup_state *drmcs = css_to_drmcs(node);
>> +		struct cgroup_subsys_state *css;
>> +
>> +		if (!css_tryget_online(node))
>> +			goto out_put;
>> +		if (!drmcs->num_clients) {
>> +			css_put(node);
>> +			continue;
>> +		}
>> +
>> +		css_for_each_child(css, &drmcs->css) {
>> +			struct drm_cgroup_state *sibling = css_to_drmcs(css);
>> +
>> +			if (!css_tryget_online(css)) {
>> +				css_put(node);
>> +				goto out_put;
>> +			}
>> +			if (!sibling->num_clients) {
>> +				css_put(css);
>> +				continue;
>> +			}
>> +
>> +			sibling->effective_weight =
>> +				DIV_ROUND_CLOSEST(sibling->weight <<
>> +						  DRM_CGROUP_WEIGHT_SHIFT,
>> +						  drmcs->sum_children_weights);
>> +			drmcs_notify_weight(sibling);
>> +			css_put(css);
>> +		}
>> +
>> +		css_put(node);
>> +	}
>> +
>> +	updated = true;
>> +
>> +out_put:
>> +	css_put(&root->css);
>> +out_unlock:
>> +	rcu_read_unlock();
>> +
>> +	if (!updated)
>> +		drmcg_update_weights_locked();
>> +
>> +	mutex_unlock(&drmcg_mutex);
>> +}
>> +
>>   static void drmcs_free(struct cgroup_subsys_state *css)
>>   {
>> -	struct drm_cgroup_state *drmcs = css_to_drmcs(css);
>> -
>> -	if (drmcs != &root_drmcs.drmcs)
>> -		kfree(drmcs);
>> +	if (css != &root_drmcs.drmcs.css)
>> +		kfree(css_to_drmcs(css));
>>   }
>>   
>>   static struct cgroup_subsys_state *
>> @@ -62,6 +206,7 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
>>   
>>   	if (!parent_css) {
>>   		drmcs = &root_drmcs.drmcs;
>> +		INIT_DELAYED_WORK(&root_drmcs.notify_work, notify_worker);
>>   	} else {
>>   		drmcs = kzalloc(sizeof(*drmcs), GFP_KERNEL);
>>   		if (!drmcs)
>> @@ -70,9 +215,147 @@ drmcs_alloc(struct cgroup_subsys_state *parent_css)
>>   		INIT_LIST_HEAD(&drmcs->clients);
>>   	}
>>   
>> +	drmcs->weight = CGROUP_WEIGHT_DFL;
>> +	drmcs->effective_weight = (1 << DRM_CGROUP_WEIGHT_SHIFT) / 2;
>> +
>>   	return &drmcs->css;
>>   }
>>   
>> +static int drmcs_online(struct cgroup_subsys_state *css)
>> +{
>> +	drmcg_update_weights();
>> +
>> +	return 0;
>> +}
>> +
>> +static void drmcs_offline(struct cgroup_subsys_state *css)
>> +{
>> +	drmcg_update_weights();
>> +}
>> +
>> +static struct drm_cgroup_state *old_drmcs;
>> +
>> +static int drmcs_can_attach(struct cgroup_taskset *tset)
>> +{
>> +	struct cgroup_subsys_state *css;
>> +	struct task_struct *task;
>> +
>> +	task = cgroup_taskset_first(tset, &css);
>> +	old_drmcs = css_to_drmcs(task_css(task, drm_cgrp_id));
> 
> This is similar to cpuset's cpuset_attach_old_cs.
> Beware that when controller is disabled, the migration happens from
> multiple (chilren) csses.

Hmm I can't say I am an expert here. I guess you are saying this 
approach is unsafe?

AFAIR I copied it from one of the existing controllers and it was 
declared fine by Tejun at one point. But it was probably long time ago 
(this series has been floating around for a while) so things might have 
changed since.

What is the correct way to handle it these days? Perhaps there is a 
different way to determine the old group directly in the attach callback?

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static void __inc_clients(struct drm_cgroup_state *drmcs)
>> +{
>> +	struct cgroup_subsys_state *parent = NULL;
>> +
>> +	rcu_read_lock();
>> +	do {
>> +		drmcs->num_clients++;
>> +		WARN_ON_ONCE(!drmcs->num_clients);
>> +
>> +		if (parent)
>> +			css_put(parent);
>> +
>> +		parent = drmcs->css.parent;
>> +		if (parent) {
>> +			if (WARN_ON_ONCE(!css_tryget(parent)))
> 
> This should be ensured implicitly thanks to css::online_cnt.

You mean it cannot fail so I should replace it with a plain css_get()?

> 
>> +				break;
>> +
>> +			drmcs = css_to_drmcs(parent);
>> +		}
>> +	} while (parent);
>> +	rcu_read_unlock();
>> +}
>> +
>> +static void __dec_clients(struct drm_cgroup_state *drmcs)
>> +{
>> +	struct cgroup_subsys_state *parent = NULL;
>> +
>> +	rcu_read_lock();
>> +	do {
>> +		WARN_ON_ONCE(!drmcs->num_clients);
>> +		drmcs->num_clients--;
>> +
>> +		if (parent)
>> +			css_put(parent);
>> +
>> +		parent = drmcs->css.parent;
>> +		if (parent) {
>> +			if (WARN_ON_ONCE(!css_tryget(parent)))
>> +				break;
>> +
>> +			drmcs = css_to_drmcs(parent);
>> +		}
>> +	} while (parent);
>> +	rcu_read_unlock();
>> +}
>> +
>> +static void drmcs_attach(struct cgroup_taskset *tset)
>> +{
>> +	struct drm_cgroup_state *old = old_drmcs;
>> +	struct cgroup_subsys_state *css;
>> +	struct drm_file *fpriv, *next;
>> +	struct drm_cgroup_state *new;
>> +	struct task_struct *task;
>> +	bool migrated = false;
>> +
>> +	if (!old)
>> +		return;
>> +
>> +	task = cgroup_taskset_first(tset, &css);
>> +	new = css_to_drmcs(task_css(task, drm_cgrp_id));
>> +	if (new == old)
>> +		return;
> 
> Beware here too, it'd be better to use css from
> cgroup_taskset_for_each(task, css, tset) below as the new css.

Better as in it can be wrong? Or there can be more than one target css 
in the taskset?

In any case I could just remove this early exit since the loop below 
does fetch it again for every task.

The open about the source/old css remains though.

>> +
>> +	mutex_lock(&drmcg_mutex);
>> +
>> +	list_for_each_entry_safe(fpriv, next, &old->clients, clink) {
>> +		cgroup_taskset_for_each(task, css, tset) {
>> +			struct cgroup_subsys_state *old_css;
>> +			struct drm_cgroup_state *old_;
>> +
>> +			if (task->flags & PF_KTHREAD)
>> +				continue;
>> +			if (!thread_group_leader(task))
>> +				continue;
> 
> Maybe cgroup_taskset_for_each_leader()

Wasn't aware of it - marking as TODO thanks!

Regards,

Tvrtko

> 
>> +
>> +			new = css_to_drmcs(task_css(task, drm_cgrp_id));
>> +			if (WARN_ON_ONCE(new == old))
>> +				continue;
>> +
>> +			if (rcu_access_pointer(fpriv->pid) != task_tgid(task))
>> +				continue;
>> +
>> +			if (WARN_ON_ONCE(fpriv->__css != &old->css))
>> +				continue;
>> +
>> +			old_css = fpriv->__css;
>> +			old_ = css_to_drmcs(old_css);
>> +			fpriv->__css = &new->css;
>> +			css_get(fpriv->__css);
>> +			list_move_tail(&fpriv->clink, &new->clients);
>> +			__dec_clients(old);
>> +			__inc_clients(new);
>> +			css_put(old_css);
>> +			migrated = true;
>> +		}
>> +	}
>> +
>> +	if (migrated)
>> +		drmcg_update_weights_locked();
>> +
>> +	mutex_unlock(&drmcg_mutex);
>> +
>> +	old_drmcs = NULL;
>> +}
>> +
>> +static void drmcs_cancel_attach(struct cgroup_taskset *tset)
>> +{
>> +	old_drmcs = NULL;
>> +}
>> +
>>   void drmcgroup_client_open(struct drm_file *file_priv)
>>   {
>>   	struct drm_cgroup_state *drmcs;
>> @@ -85,6 +368,8 @@ void drmcgroup_client_open(struct drm_file *file_priv)
>>   	mutex_lock(&drmcg_mutex);
>>   	file_priv->__css = &drmcs->css; /* Keeps the reference. */
>>   	list_add_tail(&file_priv->clink, &drmcs->clients);
>> +	__inc_clients(drmcs);
>> +	drmcg_update_weights_locked();
>>   	mutex_unlock(&drmcg_mutex);
>>   }
>>   EXPORT_SYMBOL_GPL(drmcgroup_client_open);
>> @@ -100,7 +385,9 @@ void drmcgroup_client_close(struct drm_file *file_priv)
>>   
>>   	mutex_lock(&drmcg_mutex);
>>   	list_del(&file_priv->clink);
>> +	__dec_clients(drmcs);
>>   	file_priv->__css = NULL;
>> +	drmcg_update_weights_locked();
>>   	mutex_unlock(&drmcg_mutex);
>>   
>>   	css_put(&drmcs->css);
>> @@ -124,6 +411,9 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
>>   	if (src != dst) {
>>   		file_priv->__css = &dst->css; /* Keeps the reference. */
>>   		list_move_tail(&file_priv->clink, &dst->clients);
>> +		__dec_clients(src);
>> +		__inc_clients(dst);
>> +		drmcg_update_weights_locked();
>>   	}
>>   
>>   	mutex_unlock(&drmcg_mutex);
>> @@ -133,12 +423,23 @@ void drmcgroup_client_migrate(struct drm_file *file_priv)
>>   EXPORT_SYMBOL_GPL(drmcgroup_client_migrate);
>>   
>>   struct cftype files[] = {
>> +	{
>> +		.name = "weight",
>> +		.flags = CFTYPE_NOT_ON_ROOT,
>> +		.read_u64 = drmcs_read_weight,
>> +		.write_u64 = drmcs_write_weight,
>> +	},
>>   	{ } /* Zero entry terminates. */
>>   };
>>   
>>   struct cgroup_subsys drm_cgrp_subsys = {
>>   	.css_alloc	= drmcs_alloc,
>>   	.css_free	= drmcs_free,
>> +	.css_online	= drmcs_online,
>> +	.css_offline	= drmcs_offline,
>> +	.can_attach     = drmcs_can_attach,
>> +	.attach		= drmcs_attach,
>> +	.cancel_attach  = drmcs_cancel_attach,
>>   	.early_init	= false,
>>   	.legacy_cftypes	= files,
>>   	.dfl_cftypes	= files,
>> -- 
>> 2.48.0
>>
> 
> 
> Regards,
> Michal

