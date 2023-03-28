Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C9A6CC193
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 15:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD65F10E797;
	Tue, 28 Mar 2023 13:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EF310E797;
 Tue, 28 Mar 2023 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680011971; x=1711547971;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2bpxXtg+8K5yT3Gb2/b1JBoxmrLCF2pbspOSjoZyEvE=;
 b=mU4xMKgiQmesz1uUYzgiJMhOjPhTEZAYB4jD6N5n62b0EGp86AVxE9RA
 3+XjOESqN5SeP8AVlF04cOHc3/ET09wD85fTpvE1lUG/Lc9PdyNgMd0o+
 K6A5X7/GMTijBMFi5AB8qfI6Avr3PMZFUXBTnr+J51BkNVAs0U6odX6ZM
 jE3lz/i1AddmXCc7e8np9WBAy+xrr0w48mT294vWu6bnqs3fFH4ZWtO48
 HQ948fqpVFDvgAaV5mGCmYHwxtnSAw6mA6IN10puSj2rRsaWEX7kZlB4C
 /Kr4BUHleWsUtnrZfR8E7BhKK9r9Wqe8mdiVt5WeGxSSyB3q2Z/xsqTnE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324463133"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="324463133"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:57:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="716492675"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; d="scan'208";a="716492675"
Received: from wheelerj-mobl.ger.corp.intel.com (HELO [10.213.213.242])
 ([10.213.213.242])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 06:57:35 -0700
Message-ID: <f973f656-acdf-320f-95d5-3f79cc3ce95a@linux.intel.com>
Date: Tue, 28 Mar 2023 14:57:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 07/15] dma-buf/sw_sync: Add fence deadline support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230308155322.344664-1-robdclark@gmail.com>
 <20230308155322.344664-8-robdclark@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230308155322.344664-8-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Gustavo Padovan <gustavo@padovan.org>, Matt Turner <mattst88@gmail.com>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 08/03/2023 15:52, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This consists of simply storing the most recent deadline, and adding an
> ioctl to retrieve the deadline.  This can be used in conjunction with
> the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
> sw_sync fences, merge them into a fence-array, set deadline on the
> fence-array and confirm that it is propagated properly to each fence.
> 
> v2: Switch UABI to express deadline as u64
> v3: More verbose UAPI docs, show how to convert from timespec
> v4: Better comments, track the soonest deadline, as a normal fence
>      implementation would, return an error if no deadline set.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> ---
>   drivers/dma-buf/sw_sync.c    | 81 ++++++++++++++++++++++++++++++++++++
>   drivers/dma-buf/sync_debug.h |  2 +
>   2 files changed, 83 insertions(+)
> 
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 348b3a9170fa..f53071bca3af 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -52,12 +52,33 @@ struct sw_sync_create_fence_data {
>   	__s32	fence; /* fd of new fence */
>   };
>   
> +/**
> + * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fence
> + * @deadline_ns: absolute time of the deadline
> + * @pad:	must be zero
> + * @fence_fd:	the sw_sync fence fd (in)
> + *
> + * Return the earliest deadline set on the fence.  The timebase for the
> + * deadline is CLOCK_MONOTONIC (same as vblank).  If there is no deadline

Mentioning vblank reads odd since this is drivers/dma-buf/. Dunno.

> + * set on the fence, this ioctl will return -ENOENT.
> + */
> +struct sw_sync_get_deadline {
> +	__u64	deadline_ns;
> +	__u32	pad;
> +	__s32	fence_fd;
> +};
> +
>   #define SW_SYNC_IOC_MAGIC	'W'
>   
>   #define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
>   		struct sw_sync_create_fence_data)
>   
>   #define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
> +#define SW_SYNC_GET_DEADLINE		_IOWR(SW_SYNC_IOC_MAGIC, 2, \
> +		struct sw_sync_get_deadline)
> +
> +
> +#define SW_SYNC_HAS_DEADLINE_BIT	DMA_FENCE_FLAG_USER_BITS
>   
>   static const struct dma_fence_ops timeline_fence_ops;
>   
> @@ -171,6 +192,22 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
>   	snprintf(str, size, "%d", parent->value);
>   }
>   
> +static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(fence->lock, flags);
> +	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
> +		if (ktime_before(deadline, pt->deadline))
> +			pt->deadline = deadline;
> +	} else {
> +		pt->deadline = deadline;
> +		set_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags);

FWIW could use __set_bit to avoid needless atomic under spinlock.

> +	}
> +	spin_unlock_irqrestore(fence->lock, flags);
> +}
> +
>   static const struct dma_fence_ops timeline_fence_ops = {
>   	.get_driver_name = timeline_fence_get_driver_name,
>   	.get_timeline_name = timeline_fence_get_timeline_name,
> @@ -179,6 +216,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
>   	.release = timeline_fence_release,
>   	.fence_value_str = timeline_fence_value_str,
>   	.timeline_value_str = timeline_fence_timeline_value_str,
> +	.set_deadline = timeline_fence_set_deadline,
>   };
>   
>   /**
> @@ -387,6 +425,46 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
>   	return 0;
>   }
>   
> +static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
> +{
> +	struct sw_sync_get_deadline data;
> +	struct dma_fence *fence;
> +	struct sync_pt *pt;
> +	int ret = 0;
> +
> +	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
> +		return -EFAULT;
> +
> +	if (data.deadline_ns || data.pad)
> +		return -EINVAL;
> +
> +	fence = sync_file_get_fence(data.fence_fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	pt = dma_fence_to_sync_pt(fence);
> +	if (!pt)
> +		return -EINVAL;
> +
> +	spin_lock(fence->lock);

This may need to be _irq.

> +	if (test_bit(SW_SYNC_HAS_DEADLINE_BIT, &fence->flags)) {
> +		data.deadline_ns = ktime_to_ns(pt->deadline);
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	spin_unlock(fence->lock);
> +
> +	dma_fence_put(fence);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>   static long sw_sync_ioctl(struct file *file, unsigned int cmd,
>   			  unsigned long arg)
>   {
> @@ -399,6 +477,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
>   	case SW_SYNC_IOC_INC:
>   		return sw_sync_ioctl_inc(obj, arg);
>   
> +	case SW_SYNC_GET_DEADLINE:
> +		return sw_sync_ioctl_get_deadline(obj, arg);
> +
>   	default:
>   		return -ENOTTY;
>   	}
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 6176e52ba2d7..a1bdd62efccd 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>    * @base: base fence object
>    * @link: link on the sync timeline's list
>    * @node: node in the sync timeline's tree
> + * @deadline: the earliest fence deadline hint
>    */
>   struct sync_pt {
>   	struct dma_fence base;
>   	struct list_head link;
>   	struct rb_node node;
> +	ktime_t deadline;
>   };
>   
>   extern const struct file_operations sw_sync_debugfs_fops;

Regards,

Tvrtko
