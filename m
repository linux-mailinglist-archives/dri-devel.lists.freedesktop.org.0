Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2C769C6A0
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875D110E5D7;
	Mon, 20 Feb 2023 08:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E39B10E600;
 Mon, 20 Feb 2023 08:29:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id eq27so6061907edb.5;
 Mon, 20 Feb 2023 00:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xI1y/hoA9blMQTDGCLBl5Smfvln2Cis/0rzcCHrgel4=;
 b=dgGItKAQQkeoMkR6EGYLvvEBh4kyCJuJUP8CtkK0UNPX4vQR968KiENnclo04Fmv2G
 gexczCIo1dulCOkggNp/SE9N7DofZUZNQ2qwxdCb26FdwF3ESSyr/kZZ3ooRtFoMfBrv
 EU4PV41LiSl3RlNJ96WbRQ44fDKq7KSbsWnwWUG7JWNg+vNV8CMekESG1XTowxQnP83y
 qroXSz3hcsVMQvpIok0DslOdGbdxStWmBngAUAqDok0GXaeD1nyLXsh7ob0cWlVIIYN9
 cooj/crL4Vy/q6cuCWdHvxord6gkEPxUyx7b8jt9jh0+zd22U4R8VsYF4Ax/4qCqshf1
 fmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xI1y/hoA9blMQTDGCLBl5Smfvln2Cis/0rzcCHrgel4=;
 b=H3so1bYftOQyk9yDBRWDpir6xv3yBsVYsFbLEHTwhQa2sjNtCTt5WPmmGyQb049kso
 D77Tn3YIF9VZwE+JHb+I9Vez6EKAXQ0X3UME7EPnG9jZy6/RlLzu1j6fVn+8p8mbkynD
 sOUj2oMiXpmGb5cPj5HvMVZYjQD5nPoRW4v6E4DEb78mKJj1Wdf4xpVnXokBcg/SOzpI
 vixf2WI65B5z33YglMFYMVRs4xhaAC7UTr9YIbByTtmbf1g6jF+se51KGU/kAd53xiwR
 4p6kIayh1Qsh83vWkuI01CZK1c5dxFtM7CiviOciMB/zwZk76bUGpPUq7WveYeU3oLMF
 fquw==
X-Gm-Message-State: AO0yUKUgRNb6sggteWFqoSbGEdftR+NBaYSRr9p+Ltp24F+9iRSkNceb
 sqfKI9e2VW7BDwdEamBfQ7M=
X-Google-Smtp-Source: AK7set9nIZXRzZikG+ZH719XGstXeDBuSR82cx4u/xoIf3QKtViZ+v+G+0vYna9P7Pd7OqUcf1gz1Q==
X-Received: by 2002:a17:906:9c85:b0:8af:2e78:ac2b with SMTP id
 fj5-20020a1709069c8500b008af2e78ac2bmr11295659ejc.3.1676881782377; 
 Mon, 20 Feb 2023 00:29:42 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:dede:81be:2cf1:ada5?
 ([2a02:908:1256:79a0:dede:81be:2cf1:ada5])
 by smtp.gmail.com with ESMTPSA id
 bk26-20020a170906b0da00b0089d5aaf85besm5433874ejb.219.2023.02.20.00.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 00:29:41 -0800 (PST)
Message-ID: <a8506b6d-512e-6e20-e390-e064d48c4a04@gmail.com>
Date: Mon, 20 Feb 2023 09:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 07/14] dma-buf/sw_sync: Add fence deadline support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-8-robdclark@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230218211608.1630586-8-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.02.23 um 22:15 schrieb Rob Clark:
> From: Rob Clark <robdclark@chromium.org>
>
> This consists of simply storing the most recent deadline, and adding an
> ioctl to retrieve the deadline.  This can be used in conjunction with
> the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
> sw_sync fences, merge them into a fence-array, set deadline on the
> fence-array and confirm that it is propagated properly to each fence.
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/dma-buf/sw_sync.c    | 58 ++++++++++++++++++++++++++++++++++++
>   drivers/dma-buf/sync_debug.h |  2 ++
>   2 files changed, 60 insertions(+)
>
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 348b3a9170fa..50f2638cccd3 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -52,12 +52,26 @@ struct sw_sync_create_fence_data {
>   	__s32	fence; /* fd of new fence */
>   };
>   
> +/**
> + * struct sw_sync_get_deadline - get the deadline of a sw_sync fence
> + * @tv_sec:	seconds elapsed since epoch (out)
> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec (out)
> + * @fence_fd:	the sw_sync fence fd (in)
> + */
> +struct sw_sync_get_deadline {
> +	__s64	tv_sec;
> +	__s32	tv_nsec;
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
>   
>   static const struct dma_fence_ops timeline_fence_ops;
>   
> @@ -171,6 +185,13 @@ static void timeline_fence_timeline_value_str(struct dma_fence *fence,
>   	snprintf(str, size, "%d", parent->value);
>   }
>   
> +static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	struct sync_pt *pt = dma_fence_to_sync_pt(fence);
> +
> +	pt->deadline = deadline;
> +}
> +
>   static const struct dma_fence_ops timeline_fence_ops = {
>   	.get_driver_name = timeline_fence_get_driver_name,
>   	.get_timeline_name = timeline_fence_get_timeline_name,
> @@ -179,6 +200,7 @@ static const struct dma_fence_ops timeline_fence_ops = {
>   	.release = timeline_fence_release,
>   	.fence_value_str = timeline_fence_value_str,
>   	.timeline_value_str = timeline_fence_timeline_value_str,
> +	.set_deadline = timeline_fence_set_deadline,
>   };
>   
>   /**
> @@ -387,6 +409,39 @@ static long sw_sync_ioctl_inc(struct sync_timeline *obj, unsigned long arg)
>   	return 0;
>   }
>   
> +static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigned long arg)
> +{
> +	struct sw_sync_get_deadline data;
> +	struct timespec64 ts;
> +	struct dma_fence *fence;
> +	struct sync_pt *pt;
> +
> +	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
> +		return -EFAULT;
> +
> +	if (data.tv_sec || data.tv_nsec)
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
> +	ts = ktime_to_timespec64(pt->deadline);
> +	data.tv_sec  = ts.tv_sec;
> +	data.tv_nsec = ts.tv_nsec;
> +
> +	dma_fence_put(fence);
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
> @@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsigned int cmd,
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
> index 6176e52ba2d7..2e0146d0bdbb 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(struct dma_fence *fence)
>    * @base: base fence object
>    * @link: link on the sync timeline's list
>    * @node: node in the sync timeline's tree
> + * @deadline: the most recently set fence deadline
>    */
>   struct sync_pt {
>   	struct dma_fence base;
>   	struct list_head link;
>   	struct rb_node node;
> +	ktime_t deadline;
>   };
>   
>   extern const struct file_operations sw_sync_debugfs_fops;

