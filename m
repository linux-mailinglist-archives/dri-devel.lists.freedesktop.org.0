Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC44791B1D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 18:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E6910E393;
	Mon,  4 Sep 2023 16:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D0DD110E393
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 16:06:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6178143D;
 Mon,  4 Sep 2023 09:06:52 -0700 (PDT)
Received: from [10.57.5.181] (unknown [10.57.5.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 204B73F740;
 Mon,  4 Sep 2023 09:06:13 -0700 (PDT)
Message-ID: <682ea473-05e7-4080-95f1-02cc1e1e19d1@arm.com>
Date: Mon, 4 Sep 2023 17:06:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230809165330.2451699-3-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-08-09 17:53, Boris Brezillon wrote:
[...]
> +/**
> + * struct drm_panthor_vm_create - Arguments passed to DRM_PANTHOR_IOCTL_VM_CREATE
> + */
> +struct drm_panthor_vm_create {
> +	/** @flags: VM flags, MBZ. */
> +	__u32 flags;
> +
> +	/** @id: Returned VM ID. */
> +	__u32 id;
> +
> +	/**
> +	 * @kernel_va_range: Size of the VA space reserved for kernel objects.
> +	 *
> +	 * If kernel_va_range is zero, we pick half of the VA space for kernel objects.
> +	 *
> +	 * Kernel VA space is always placed at the top of the supported VA range.
> +	 */
> +	__u64 kernel_va_range;

Off the back of the "IOVA as unsigned long" concern, Boris and I 
reasoned through the 64-bit vs. 32-bit vs. compat cases on IRC, and it 
seems like this kernel_va_range argument is a source of much of the pain.

Rather than have userspace specify a quantity which it shouldn't care 
about and depend on assumptions of kernel behaviour to infer the 
quantity which *is* relevant (i.e. how large the usable range of the VM 
will actually be), I think it would be considerably more logical for 
userspace to simply request the size of usable VM it actually wants. 
Then it would be straightforward and consistent to define the default 
value in terms of the minimum of half the GPU VA size or TASK_SIZE (the 
latter being the largest *meaningful* value in all 3 cases), and it's 
still easy enough for the kernel to deduce for itself whether there's a 
reasonable amount of space left between the requested limit and 
ULONG_MAX for it to use. 32-bit kernels should then get at least 1GB to 
play with, for compat the kernel BOs can get well out of the way into 
the >32-bit range, and it's only really 64-bit where userspace is liable 
to see "kernel" VA space impinging on usable process VAs. Even then 
we're not sure that's a significant concern beyond OpenCL SVM.

Thanks,
Robin.
