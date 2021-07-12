Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8ED3C5FCC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 17:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B2389D2F;
	Mon, 12 Jul 2021 15:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4439C89CF6;
 Mon, 12 Jul 2021 15:51:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10043"; a="189688690"
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="189688690"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 08:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.84,234,1620716400"; d="scan'208";a="561785903"
Received: from aaroncar-mobl2.ger.corp.intel.com (HELO [10.213.240.41])
 ([10.213.240.41])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2021 08:51:44 -0700
Subject: Re: [PATCH 1/8] drm/i915: Explicitly track DRM clients
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210712121719.891536-1-tvrtko.ursulin@linux.intel.com>
 <20210712121719.891536-2-tvrtko.ursulin@linux.intel.com>
 <YOxUuxLqpIDEsmMT@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ba1a6cff-790f-a1e5-1cad-63f429b01f93@linux.intel.com>
Date: Mon, 12 Jul 2021 16:51:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOxUuxLqpIDEsmMT@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/07/2021 15:42, Daniel Vetter wrote:
> On Mon, Jul 12, 2021 at 01:17:12PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Tracking DRM clients more explicitly will allow later patches to
>> accumulate past and current GPU usage in a centralised place and also
>> consolidate access to owning task pid/name.
>>
>> Unique client id is also assigned for the purpose of distinguishing/
>> consolidating between multiple file descriptors owned by the same process.
>>
>> v2:
>>   Chris Wilson:
>>   * Enclose new members into dedicated structs.
>>   * Protect against failed sysfs registration.
>>
>> v3:
>>   * sysfs_attr_init.
>>
>> v4:
>>   * Fix for internal clients.
>>
>> v5:
>>   * Use cyclic ida for client id. (Chris)
>>   * Do not leak pid reference. (Chris)
>>   * Tidy code with some locals.
>>
>> v6:
>>   * Use xa_alloc_cyclic to simplify locking. (Chris)
>>   * No need to unregister individial sysfs files. (Chris)
>>   * Rebase on top of fpriv kref.
>>   * Track client closed status and reflect in sysfs.
>>
>> v7:
>>   * Make drm_client more standalone concept.
>>
>> v8:
>>   * Simplify sysfs show. (Chris)
>>   * Always track name and pid.
>>
>> v9:
>>   * Fix cyclic id assignment.
>>
>> v10:
>>   * No need for a mutex around xa_alloc_cyclic.
>>   * Refactor sysfs into own function.
>>   * Unregister sysfs before freeing pid and name.
>>   * Move clients setup into own function.
>>
>> v11:
>>   * Call clients init directly from driver init. (Chris)
>>
>> v12:
>>   * Do not fail client add on id wrap. (Maciej)
>>
>> v13 (Lucas): Rebase.
>>
>> v14:
>>   * Dropped sysfs bits.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk> # v11
>> Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@intel.com> # v11
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> 
> On the implementation: I'm not clear why this is a separate object. All
> that seems to achieve is make the lifetim fun we have in here even more
> annoying, for not real gain?
> 
> What's the reasons for this separate i915_drm_client struct? The commit
> message talks about de-duping these within the same process, but with
> fdinfo I'm not seeing the relevance of this anymore.

AFAIR I started with the new fields directly in file_priv (note 
file_priv then needed to be freed via RCU due sysfs access to it!), but 
then the idea there was to consolidate new members into a separate struct.

Plan was (and still is in internal) that the concept for DRM client will 
gain more users/usefulness and would benefit from encapsulation from the 
start.

For instance at patch 3 in the series it does consolidate i915 users of 
ctx->pid to go via ctx->client (process name as well). Those are async 
entry points (compared to file_priv lifetime) from error capture and 
debugfs. Hm no, debugfs is there no more, only error capture remains.

As you say since the change of direction to use fdinfo, the asynchronous 
entry path into those members from sysfs is gone. Hence if they were 
moved back to file_priv, and assuming ctx->pid/name changes to be 
undone, then file_priv could remain being immediately freed on file 
close. Or perhaps we lose easy pid/name update for files passed over 
sockets. I'd have to think about that a bit deeper.

But essentially I think ctx->client is a cleaner design that ctx->pid 
and given error capture and debugfs can be async to file_priv lifetime 
that's a benefit for me.

With regards to de-duping multiple fdinfo entries via client->id - that 
is actually the opposite from what you suggest. Whereas with the sysfs 
approach we had one entry per client, with fdinfo we have duplicates. So 
client->id is essential for userspace to correctly account per client 
statistics.

> Also, with the fdinfo approach, why do we still need to even track the
> pid? That can be all figured out from proc now, with much cleaner
> semantics.

Not sure what you mean here. As explained above pid is tracked as 
replacement for current ctx->pid tracking. So for uses inside i915.

Also note that even from userspace semantics of getting the pid from 
procfs is not necessarily clean, since actually three different file 
descriptors need to be open to get the whole set of data.

/proc/<pid>/fdinfo/<fd> - obviously
/proc/<pid>/fd/<fd> - to filter out non drm fds avoiding text parsing 
above file
/proc/<pid>/stat - to get the pid

Since in the intel_gpu_top conversion I do keep the /proc/<pid> open and 
do the rest via openat, I am hoping at least that's safe againt pid 
swaps. For the file descriptor cross check it is more questionable but 
worst case the drm fd check via stat could be dropped and replaced with 
more fdinfo text parsing.

Having the pid and process name in fdinfo hence makes this easier and 
potentially safer. Given how we already store ctx->pid I think that 
should be fine.

FWIW I still think the whole approach is bad since number of operations 
required scales with number of non drm processes (even threads) on the 
system.

Regards,

Tvrtko

>> ---
>>   drivers/gpu/drm/i915/Makefile          |   5 +-
>>   drivers/gpu/drm/i915/i915_drm_client.c | 113 +++++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.h |  61 +++++++++++++
>>   drivers/gpu/drm/i915/i915_drv.c        |   6 ++
>>   drivers/gpu/drm/i915/i915_drv.h        |   5 ++
>>   drivers/gpu/drm/i915/i915_gem.c        |  21 ++++-
>>   6 files changed, 206 insertions(+), 5 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 10b3bb6207ba..784f99ca11fc 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -33,8 +33,9 @@ subdir-ccflags-y += -I$(srctree)/$(src)
>>   # Please keep these build lists sorted!
>>   
>>   # core driver code
>> -i915-y += i915_drv.o \
>> -	  i915_config.o \
>> +i915-y += i915_config.o \
>> +	  i915_drm_client.o \
>> +	  i915_drv.o \
>>   	  i915_irq.o \
>>   	  i915_getparam.o \
>>   	  i915_mitigations.o \
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
>> new file mode 100644
>> index 000000000000..83080d9836b0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
>> @@ -0,0 +1,113 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2020 Intel Corporation
>> + */
>> +
>> +#include <linux/kernel.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +
>> +#include "i915_drm_client.h"
>> +#include "i915_gem.h"
>> +#include "i915_utils.h"
>> +
>> +void i915_drm_clients_init(struct i915_drm_clients *clients,
>> +			   struct drm_i915_private *i915)
>> +{
>> +	clients->i915 = i915;
>> +
>> +	clients->next_id = 0;
>> +	xa_init_flags(&clients->xarray, XA_FLAGS_ALLOC);
>> +}
>> +
>> +static int
>> +__i915_drm_client_register(struct i915_drm_client *client,
>> +			   struct task_struct *task)
>> +{
>> +	char *name;
>> +
>> +	name = kstrdup(task->comm, GFP_KERNEL);
>> +	if (!name)
>> +		return -ENOMEM;
>> +
>> +	client->pid = get_task_pid(task, PIDTYPE_PID);
>> +	client->name = name;
>> +
>> +	return 0;
>> +}
>> +
>> +static void __i915_drm_client_unregister(struct i915_drm_client *client)
>> +{
>> +	put_pid(fetch_and_zero(&client->pid));
>> +	kfree(fetch_and_zero(&client->name));
>> +}
>> +
>> +static void __rcu_i915_drm_client_free(struct work_struct *wrk)
>> +{
>> +	struct i915_drm_client *client =
>> +		container_of(wrk, typeof(*client), rcu.work);
>> +
>> +	xa_erase(&client->clients->xarray, client->id);
>> +
>> +	__i915_drm_client_unregister(client);
>> +
>> +	kfree(client);
>> +}
>> +
>> +struct i915_drm_client *
>> +i915_drm_client_add(struct i915_drm_clients *clients, struct task_struct *task)
>> +{
>> +	struct i915_drm_client *client;
>> +	int ret;
>> +
>> +	client = kzalloc(sizeof(*client), GFP_KERNEL);
>> +	if (!client)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	kref_init(&client->kref);
>> +	client->clients = clients;
>> +	INIT_RCU_WORK(&client->rcu, __rcu_i915_drm_client_free);
>> +
>> +	ret = xa_alloc_cyclic(&clients->xarray, &client->id, client,
>> +			      xa_limit_32b, &clients->next_id, GFP_KERNEL);
>> +	if (ret < 0)
>> +		goto err_id;
>> +
>> +	ret = __i915_drm_client_register(client, task);
>> +	if (ret)
>> +		goto err_register;
>> +
>> +	return client;
>> +
>> +err_register:
>> +	xa_erase(&clients->xarray, client->id);
>> +err_id:
>> +	kfree(client);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +void __i915_drm_client_free(struct kref *kref)
>> +{
>> +	struct i915_drm_client *client =
>> +		container_of(kref, typeof(*client), kref);
>> +
>> +	queue_rcu_work(system_wq, &client->rcu);
>> +}
>> +
>> +void i915_drm_client_close(struct i915_drm_client *client)
>> +{
>> +	GEM_BUG_ON(READ_ONCE(client->closed));
>> +	WRITE_ONCE(client->closed, true);
>> +	i915_drm_client_put(client);
>> +}
>> +
>> +void i915_drm_clients_fini(struct i915_drm_clients *clients)
>> +{
>> +	while (!xa_empty(&clients->xarray)) {
>> +		rcu_barrier();
>> +		flush_workqueue(system_wq);
>> +	}
>> +
>> +	xa_destroy(&clients->xarray);
>> +}
>> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
>> new file mode 100644
>> index 000000000000..396f1e336b3f
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
>> @@ -0,0 +1,61 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2020 Intel Corporation
>> + */
>> +
>> +#ifndef __I915_DRM_CLIENT_H__
>> +#define __I915_DRM_CLIENT_H__
>> +
>> +#include <linux/kref.h>
>> +#include <linux/pid.h>
>> +#include <linux/rcupdate.h>
>> +#include <linux/sched.h>
>> +#include <linux/xarray.h>
>> +
>> +struct drm_i915_private;
>> +
>> +struct i915_drm_clients {
>> +	struct drm_i915_private *i915;
>> +
>> +	struct xarray xarray;
>> +	u32 next_id;
>> +};
>> +
>> +struct i915_drm_client {
>> +	struct kref kref;
>> +
>> +	struct rcu_work rcu;
>> +
>> +	unsigned int id;
>> +	struct pid *pid;
>> +	char *name;
>> +	bool closed;
>> +
>> +	struct i915_drm_clients *clients;
>> +};
>> +
>> +void i915_drm_clients_init(struct i915_drm_clients *clients,
>> +			   struct drm_i915_private *i915);
>> +
>> +static inline struct i915_drm_client *
>> +i915_drm_client_get(struct i915_drm_client *client)
>> +{
>> +	kref_get(&client->kref);
>> +	return client;
>> +}
>> +
>> +void __i915_drm_client_free(struct kref *kref);
>> +
>> +static inline void i915_drm_client_put(struct i915_drm_client *client)
>> +{
>> +	kref_put(&client->kref, __i915_drm_client_free);
>> +}
>> +
>> +void i915_drm_client_close(struct i915_drm_client *client);
>> +
>> +struct i915_drm_client *i915_drm_client_add(struct i915_drm_clients *clients,
>> +					    struct task_struct *task);
>> +
>> +void i915_drm_clients_fini(struct i915_drm_clients *clients);
>> +
>> +#endif /* !__I915_DRM_CLIENT_H__ */
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
>> index 30d8cd8c69b1..8247dcc7586e 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -68,6 +68,7 @@
>>   #include "gt/intel_rc6.h"
>>   
>>   #include "i915_debugfs.h"
>> +#include "i915_drm_client.h"
>>   #include "i915_drv.h"
>>   #include "i915_ioc32.h"
>>   #include "i915_irq.h"
>> @@ -343,6 +344,8 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>   
>>   	intel_gt_init_early(&dev_priv->gt, dev_priv);
>>   
>> +	i915_drm_clients_init(&dev_priv->clients, dev_priv);
>> +
>>   	i915_gem_init_early(dev_priv);
>>   
>>   	/* This must be called before any calls to HAS_PCH_* */
>> @@ -362,6 +365,7 @@ static int i915_driver_early_probe(struct drm_i915_private *dev_priv)
>>   
>>   err_gem:
>>   	i915_gem_cleanup_early(dev_priv);
>> +	i915_drm_clients_fini(&dev_priv->clients);
>>   	intel_gt_driver_late_release(&dev_priv->gt);
>>   	intel_region_ttm_device_fini(dev_priv);
>>   err_ttm:
>> @@ -381,6 +385,7 @@ static void i915_driver_late_release(struct drm_i915_private *dev_priv)
>>   	intel_irq_fini(dev_priv);
>>   	intel_power_domains_cleanup(dev_priv);
>>   	i915_gem_cleanup_early(dev_priv);
>> +	i915_drm_clients_fini(&dev_priv->clients);
>>   	intel_gt_driver_late_release(&dev_priv->gt);
>>   	intel_region_ttm_device_fini(dev_priv);
>>   	vlv_suspend_cleanup(dev_priv);
>> @@ -996,6 +1001,7 @@ static void i915_driver_postclose(struct drm_device *dev, struct drm_file *file)
>>   	struct drm_i915_file_private *file_priv = file->driver_priv;
>>   
>>   	i915_gem_context_close(file);
>> +	i915_drm_client_close(file_priv->client);
>>   
>>   	kfree_rcu(file_priv, rcu);
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index c4747f4407ef..338d384c31eb 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -96,6 +96,7 @@
>>   #include "intel_wakeref.h"
>>   #include "intel_wopcm.h"
>>   
>> +#include "i915_drm_client.h"
>>   #include "i915_gem.h"
>>   #include "i915_gem_gtt.h"
>>   #include "i915_gpu_error.h"
>> @@ -284,6 +285,8 @@ struct drm_i915_file_private {
>>   	/** ban_score: Accumulated score of all ctx bans and fast hangs. */
>>   	atomic_t ban_score;
>>   	unsigned long hang_timestamp;
>> +
>> +	struct i915_drm_client *client;
>>   };
>>   
>>   /* Interface history:
>> @@ -1218,6 +1221,8 @@ struct drm_i915_private {
>>   
>>   	struct i915_pmu pmu;
>>   
>> +	struct i915_drm_clients clients;
>> +
>>   	struct i915_hdcp_comp_master *hdcp_master;
>>   	bool hdcp_comp_added;
>>   
>> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
>> index 590efc8b0265..ea6c88a99ed2 100644
>> --- a/drivers/gpu/drm/i915/i915_gem.c
>> +++ b/drivers/gpu/drm/i915/i915_gem.c
>> @@ -1179,25 +1179,40 @@ void i915_gem_cleanup_early(struct drm_i915_private *dev_priv)
>>   int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>>   {
>>   	struct drm_i915_file_private *file_priv;
>> -	int ret;
>> +	struct i915_drm_client *client;
>> +	int ret = -ENOMEM;
>>   
>>   	DRM_DEBUG("\n");
>>   
>>   	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>>   	if (!file_priv)
>> -		return -ENOMEM;
>> +		goto err_alloc;
>> +
>> +	client = i915_drm_client_add(&i915->clients, current);
>> +	if (IS_ERR(client)) {
>> +		ret = PTR_ERR(client);
>> +		goto err_client;
>> +	}
>>   
>>   	file->driver_priv = file_priv;
>>   	file_priv->dev_priv = i915;
>>   	file_priv->file = file;
>> +	file_priv->client = client;
>>   
>>   	file_priv->bsd_engine = -1;
>>   	file_priv->hang_timestamp = jiffies;
>>   
>>   	ret = i915_gem_context_open(i915, file);
>>   	if (ret)
>> -		kfree(file_priv);
>> +		goto err_context;
>> +
>> +	return 0;
>>   
>> +err_context:
>> +	i915_drm_client_close(client);
>> +err_client:
>> +	kfree(file_priv);
>> +err_alloc:
>>   	return ret;
>>   }
>>   
>> -- 
>> 2.30.2
>>
> 
