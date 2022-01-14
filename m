Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9FF48EF99
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 19:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F010E1AC;
	Fri, 14 Jan 2022 18:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908D10E1AC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 18:03:40 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id v123so7513525wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 10:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=U38RVxiG3sOh0MWzSEGRMLdXOoM3QqR6IHHi0QfBZi8=;
 b=kpWl9tiTaB9Y667+lup71x1J3yMu5ghjvQoCzOOh+q4D5IZ7zGM8zg/+N28TScTQ0g
 anXQOGW/wgm+xoWtCuWtpzWQH5OjTX3fBjNdmthHBM9IdXHwaPS3iarQ25LnNF54nfuk
 zccvVoDGoZrIQhhlFFrJZC3FFkyIBY/cx44eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=U38RVxiG3sOh0MWzSEGRMLdXOoM3QqR6IHHi0QfBZi8=;
 b=bg8kofBk2I/B7XH+1RBCM4N6vkD8gNng/T92u4CX8nNjTq6XQLSl4J1YK0dMQrIRqD
 50DK3yFrB8SXUNPDkKKFYdHZmXUs2D/QH4RH3dnssvvA0cboISmaECWV3jnvfensdkvW
 3m5Mc/nPheeAdVA+wY8x3ZSc2LFyd5C+SE8Mfdfu6A48S4yVXCLpHehnRoHt8fUD38MW
 0jVOJWCeObSNIRM777owE9uAPL27kgjOhOlVtlVLYVkdNbWObh9ro2I2LR+uHBNtLDns
 veen/HL1CgOT+8cbBeWI4tI4WiJY3+ahfrDvJeP+3GZtMcsbSJbWKM329DfkrPx1gHXM
 uIww==
X-Gm-Message-State: AOAM530U7+OFrKq8WPbecrK0odEGkGVt6//LDuVS3Bzi0ah9DkwE21+2
 kLmaSUsyL8nFL+fmat5rzAd1pA==
X-Google-Smtp-Source: ABdhPJyVV+dBLuNrlNBzg8Kf9VpXDDldf58VcfVCXoH95cU29uLwU/ZmIhJpGV5CUQg5nCnlJxrxuQ==
X-Received: by 2002:a05:600c:3790:: with SMTP id
 o16mr11384843wmr.174.1642183419143; 
 Fri, 14 Jan 2022 10:03:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id bg19sm12113937wmb.47.2022.01.14.10.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:03:38 -0800 (PST)
Date: Fri, 14 Jan 2022 19:03:36 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Iouri Tarassov <iourit@linux.microsoft.com>
Subject: Re: [PATCH v1 9/9] drivers: hv: dxgkrnl: Implement DXGSYNCFILE
Message-ID: <YeG6+Crv/Bg4h3u1@phenom.ffwll.local>
Mail-Followup-To: Iouri Tarassov <iourit@linux.microsoft.com>,
 kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com,
 gregkh@linuxfoundation.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 jenatali@microsoft.com
References: <cover.1641937419.git.iourit@linux.microsoft.com>
 <e04c8e820bc166d9d4fe8e388aace731bb3255b0.1641937420.git.iourit@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e04c8e820bc166d9d4fe8e388aace731bb3255b0.1641937420.git.iourit@linux.microsoft.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: wei.liu@kernel.org, sthemmin@microsoft.com, gregkh@linuxfoundation.org,
 haiyangz@microsoft.com, linux-hyperv@vger.kernel.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, spronovo@microsoft.com, jenatali@microsoft.com,
 kys@microsoft.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On Wed, Jan 12, 2022 at 11:55:14AM -0800, Iouri Tarassov wrote:
> Implement the LX_DXCREATESYNCFILE IOCTL (D3DKMTCreateSyncFile).
> 
> dxgsyncfile is built on top of the Linux sync_file object and
> provides a way for the user mode to synchronize with the execution
> of the device DMA packets.
> 
> The IOCTL creates a dxgsyncfile object for the given GPU synchronization
> object and a fence value. A sync_object file descriptor is returned to
> the caller. The caller could wait for the object by using poll().
> When the GPU synchronization object is signaled on the host, the host
> sends a message to the virtual machine and the sync_file object is
> signaled.
> 
> Signed-off-by: Iouri Tarassov <iourit@linux.microsoft.com>

Adding dri-devel, which get_maintainers.pl should have done automatically
with the dma_fence wildcard match. Not sure why that didn't happen.

> +struct dxgsyncpoint {
> +	struct dxghostevent	hdr;
> +	struct dma_fence	base;

This doesn't work unfortuntately. For better or worse memory fences like
monitored fences from wddm have completely different semantics from
dma_fence. You could probably hack this to be self-consistent for hyper-v,
but the problem is that then hv would have incompatible locking/nesting
rules compared to everything else, and dma_fence matter for memory
management so this includes whether you're allowed to kmalloc(GFP_KERNEL)
or not, and that's just a bit too much.

I discussed this quickly with Jesse on irc and it sounds like the reason
you want the dma_fence is just to emulate the sync_file interface for
android. I think the correct solution here is to create a hv_dxg_sync_file
fd, which emulates the exact ioctls that Android needs, but with a wddm
monitored fence underneath instead of a dma_fence underneath.

This way we guarantee that no one ever accidentally mixes these
incompatible concepts up in the kernel, and Android should still be able
to happily run under hyperv.

Thoughts?

Also pls cc me on this sync work since even if you drop dma_fence use
completely I'd like to follow this a bit.

Cheers, Daniel

> +	u64			fence_value;
> +	u64			context;
> +	spinlock_t		lock;
> +	u64			u64;
> +};
> +
> +#endif	 /* _DXGSYNCFILE_H */
> diff --git a/drivers/hv/dxgkrnl/dxgvmbus.c b/drivers/hv/dxgkrnl/dxgvmbus.c
> index 773d8f364b34..185fb7e38c21 100644
> --- a/drivers/hv/dxgkrnl/dxgvmbus.c
> +++ b/drivers/hv/dxgkrnl/dxgvmbus.c
> @@ -1311,15 +1311,18 @@ int create_existing_sysmem(struct dxgdevice *device,
>  	void *kmem = NULL;
>  	int ret = 0;
>  	struct dxgkvmb_command_setexistingsysmemstore *set_store_command;
> +	struct dxgkvmb_command_setexistingsysmempages *set_pages_command;
>  	u64 alloc_size = host_alloc->allocation_size;
>  	u32 npages = alloc_size >> PAGE_SHIFT;
>  	struct dxgvmbusmsg msg = {.hdr = NULL};
> -
> -	ret = init_message(&msg, device->adapter, device->process,
> -			   sizeof(*set_store_command));
> -	if (ret)
> -		goto cleanup;
> -	set_store_command = (void *)msg.msg;
> +	const u32 max_pfns_in_message =
> +		(DXG_MAX_VM_BUS_PACKET_SIZE - sizeof(*set_pages_command) -
> +		PAGE_SIZE) / sizeof(__u64);
> +	u32 alloc_offset_in_pages = 0;
> +	struct page **page_in;
> +	u64 *pfn;
> +	u32 pages_to_send;
> +	u32 i;
>  
>  	/*
>  	 * Create a guest physical address list and set it as the allocation
> @@ -1330,6 +1333,7 @@ int create_existing_sysmem(struct dxgdevice *device,
>  	dev_dbg(dxgglobaldev, "   Alloc size: %lld", alloc_size);
>  
>  	dxgalloc->cpu_address = (void *)sysmem;
> +
>  	dxgalloc->pages = vzalloc(npages * sizeof(void *));
>  	if (dxgalloc->pages == NULL) {
>  		pr_err("failed to allocate pages");
> @@ -1347,31 +1351,80 @@ int create_existing_sysmem(struct dxgdevice *device,
>  		ret = -ENOMEM;
>  		goto cleanup;
>  	}
> -	kmem = vmap(dxgalloc->pages, npages, VM_MAP, PAGE_KERNEL);
> -	if (kmem == NULL) {
> -		pr_err("vmap failed");
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -	ret1 = vmbus_establish_gpadl(dxgglobal_get_vmbus(), kmem,
> -				     alloc_size, &dxgalloc->gpadl);
> -	if (ret1) {
> -		pr_err("establish_gpadl failed: %d", ret1);
> -		ret = -ENOMEM;
> -		goto cleanup;
> -	}
> -	dev_dbg(dxgglobaldev, "New gpadl %d", dxgalloc->gpadl.gpadl_handle);
> +	if (!dxgglobal->map_guest_pages_enabled) {
> +		ret = init_message(&msg, device->adapter, device->process,
> +				sizeof(*set_store_command));
> +		if (ret)
> +			goto cleanup;
> +		set_store_command = (void *)msg.msg;
>  
> -	command_vgpu_to_host_init2(&set_store_command->hdr,
> -				   DXGK_VMBCOMMAND_SETEXISTINGSYSMEMSTORE,
> -				   device->process->host_handle);
> -	set_store_command->device = device->handle;
> -	set_store_command->device = device->handle;
> -	set_store_command->allocation = host_alloc->allocation;
> -	set_store_command->gpadl = dxgalloc->gpadl.gpadl_handle;
> -	ret = dxgvmb_send_sync_msg_ntstatus(msg.channel, msg.hdr, msg.size);
> -	if (ret < 0)
> -		pr_err("failed to set existing store: %x", ret);
> +		kmem = vmap(dxgalloc->pages, npages, VM_MAP, PAGE_KERNEL);
> +		if (kmem == NULL) {
> +			pr_err("vmap failed");
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +		ret1 = vmbus_establish_gpadl(dxgglobal_get_vmbus(), kmem,
> +					alloc_size, &dxgalloc->gpadl);
> +		if (ret1) {
> +			pr_err("establish_gpadl failed: %d", ret1);
> +			ret = -ENOMEM;
> +			goto cleanup;
> +		}
> +		dev_dbg(dxgglobaldev, "New gpadl %d",
> +			dxgalloc->gpadl.gpadl_handle);
> +
> +		command_vgpu_to_host_init2(&set_store_command->hdr,
> +					DXGK_VMBCOMMAND_SETEXISTINGSYSMEMSTORE,
> +					device->process->host_handle);
> +		set_store_command->device = device->handle;
> +		set_store_command->allocation = host_alloc->allocation;
> +		set_store_command->gpadl = dxgalloc->gpadl.gpadl_handle;
> +		ret = dxgvmb_send_sync_msg_ntstatus(msg.channel, msg.hdr,
> +						    msg.size);
> +		if (ret < 0)
> +			pr_err("failed to set existing store: %x", ret);
> +	} else {
> +		/*
> +		 * Send the list of the allocation PFNs to the host. The host
> +		 * will map the pages for GPU access.
> +		 */
> +
> +		ret = init_message(&msg, device->adapter, device->process,
> +				sizeof(*set_pages_command) +
> +				max_pfns_in_message * sizeof(u64));
> +		if (ret)
> +			goto cleanup;
> +		set_pages_command = (void *)msg.msg;
> +		command_vgpu_to_host_init2(&set_pages_command->hdr,
> +					DXGK_VMBCOMMAND_SETEXISTINGSYSMEMPAGES,
> +					device->process->host_handle);
> +		set_pages_command->device = device->handle;
> +		set_pages_command->allocation = host_alloc->allocation;
> +
> +		page_in = dxgalloc->pages;
> +		while (alloc_offset_in_pages < npages) {
> +			pfn = (u64 *)((char *)msg.msg +
> +				sizeof(*set_pages_command));
> +			pages_to_send = min(npages - alloc_offset_in_pages,
> +					    max_pfns_in_message);
> +			set_pages_command->num_pages = pages_to_send;
> +			set_pages_command->alloc_offset_in_pages =
> +				alloc_offset_in_pages;
> +
> +			for (i = 0; i < pages_to_send; i++)
> +				*pfn++ = page_to_pfn(*page_in++);
> +
> +			ret = dxgvmb_send_sync_msg_ntstatus(msg.channel,
> +							    msg.hdr,
> +							    msg.size);
> +			if (ret < 0) {
> +				pr_err("failed to set existing pages: %x", ret);
> +				break;
> +			}
> +			alloc_offset_in_pages += pages_to_send;
> +		}
> +	}
>  
>  cleanup:
>  	if (kmem)
> @@ -2685,6 +2738,7 @@ int dxgvmb_send_wait_sync_object_cpu(struct dxgprocess *process,
>  				     struct
>  				     d3dkmt_waitforsynchronizationobjectfromcpu
>  				     *args,
> +				     bool user_address,
>  				     u64 cpu_event)
>  {
>  	int ret = -EINVAL;
> @@ -2708,18 +2762,25 @@ int dxgvmb_send_wait_sync_object_cpu(struct dxgprocess *process,
>  	command->object_count = args->object_count;
>  	command->guest_event_pointer = (u64) cpu_event;
>  	current_pos = (u8 *) &command[1];
> -	ret = copy_from_user(current_pos, args->objects, object_size);
> -	if (ret) {
> -		pr_err("%s failed to copy objects", __func__);
> -		ret = -EINVAL;
> -		goto cleanup;
> -	}
> -	current_pos += object_size;
> -	ret = copy_from_user(current_pos, args->fence_values, fence_size);
> -	if (ret) {
> -		pr_err("%s failed to copy fences", __func__);
> -		ret = -EINVAL;
> -		goto cleanup;
> +	if (user_address) {
> +		ret = copy_from_user(current_pos, args->objects, object_size);
> +		if (ret) {
> +			pr_err("%s failed to copy objects", __func__);
> +			ret = -EINVAL;
> +			goto cleanup;
> +		}
> +		current_pos += object_size;
> +		ret = copy_from_user(current_pos, args->fence_values,
> +				     fence_size);
> +		if (ret) {
> +			pr_err("%s failed to copy fences", __func__);
> +			ret = -EINVAL;
> +			goto cleanup;
> +		}
> +	} else {
> +		memcpy(current_pos, args->objects, object_size);
> +		current_pos += object_size;
> +		memcpy(current_pos, args->fence_values, fence_size);
>  	}
>  
>  	ret = dxgvmb_send_sync_msg_ntstatus(msg.channel, msg.hdr, msg.size);
> diff --git a/drivers/hv/dxgkrnl/dxgvmbus.h b/drivers/hv/dxgkrnl/dxgvmbus.h
> index a19ac804a320..dc766d95a0c4 100644
> --- a/drivers/hv/dxgkrnl/dxgvmbus.h
> +++ b/drivers/hv/dxgkrnl/dxgvmbus.h
> @@ -139,6 +139,8 @@ enum dxgkvmb_commandtype {
>  	DXGK_VMBCOMMAND_GETCONTEXTSCHEDULINGPRIORITY = 61,
>  	DXGK_VMBCOMMAND_QUERYCLOCKCALIBRATION	= 62,
>  	DXGK_VMBCOMMAND_QUERYRESOURCEINFO	= 64,
> +	DXGK_VMBCOMMAND_LOGEVENT		= 65,
> +	DXGK_VMBCOMMAND_SETEXISTINGSYSMEMPAGES	= 66,
>  	DXGK_VMBCOMMAND_INVALID
>  };
>  
> @@ -245,6 +247,16 @@ struct dxgkvmb_command_setexistingsysmemstore {
>  	u32				gpadl;
>  };
>  
> +/* Returns ntstatus */
> +struct dxgkvmb_command_setexistingsysmempages {
> +	struct dxgkvmb_command_vgpu_to_host hdr;
> +	struct d3dkmthandle		device;
> +	struct d3dkmthandle		allocation;
> +	u32				num_pages;
> +	u32				alloc_offset_in_pages;
> +	/* u64 pfn_array[num_pages] */
> +};
> +
>  struct dxgkvmb_command_createprocess {
>  	struct dxgkvmb_command_vm_to_host hdr;
>  	void			*process;
> diff --git a/drivers/hv/dxgkrnl/ioctl.c b/drivers/hv/dxgkrnl/ioctl.c
> index 9770fabf163e..9236b6b95973 100644
> --- a/drivers/hv/dxgkrnl/ioctl.c
> +++ b/drivers/hv/dxgkrnl/ioctl.c
> @@ -19,6 +19,7 @@
>  
>  #include "dxgkrnl.h"
>  #include "dxgvmbus.h"
> +#include "dxgsyncfile.h"
>  
>  #undef pr_fmt
>  #define pr_fmt(fmt)	"dxgk:err: " fmt
> @@ -32,11 +33,6 @@ struct ioctl_desc {
>  };
>  static struct ioctl_desc ioctls[LX_IO_MAX + 1];
>  
> -static char *errorstr(int ret)
> -{
> -	return ret < 0 ? "err" : "";
> -}
> -
>  static int dxgsyncobj_release(struct inode *inode, struct file *file)
>  {
>  	struct dxgsharedsyncobject *syncobj = file->private_data;
> @@ -3561,7 +3557,7 @@ dxgk_wait_sync_object_cpu(struct dxgprocess *process, void *__user inargs)
>  	}
>  
>  	ret = dxgvmb_send_wait_sync_object_cpu(process, adapter,
> -					       &args, event_id);
> +					       &args, true, event_id);
>  	if (ret < 0)
>  		goto cleanup;
>  
> @@ -5457,4 +5453,6 @@ void init_ioctls(void)
>  		  LX_DXQUERYSTATISTICS);
>  	SET_IOCTL(/*0x44 */ dxgk_share_object_with_host,
>  		  LX_DXSHAREOBJECTWITHHOST);
> +	SET_IOCTL(/*0x45 */ dxgk_create_sync_file,
> +		  LX_DXCREATESYNCFILE);
>  }
> diff --git a/drivers/hv/dxgkrnl/misc.c b/drivers/hv/dxgkrnl/misc.c
> index ffb491641836..1b152c269265 100644
> --- a/drivers/hv/dxgkrnl/misc.c
> +++ b/drivers/hv/dxgkrnl/misc.c
> @@ -35,3 +35,9 @@ u16 *wcsncpy(u16 *dest, const u16 *src, size_t n)
>  	dest[i - 1] = 0;
>  	return dest;
>  }
> +
> +char *errorstr(int ret)
> +{
> +	return ret < 0 ? "err" : "";
> +}
> +
> diff --git a/drivers/hv/dxgkrnl/misc.h b/drivers/hv/dxgkrnl/misc.h
> index 7fe3fc45b67c..3079dd55c7a4 100644
> --- a/drivers/hv/dxgkrnl/misc.h
> +++ b/drivers/hv/dxgkrnl/misc.h
> @@ -44,6 +44,7 @@ extern const struct d3dkmthandle zerohandle;
>   */
>  
>  u16 *wcsncpy(u16 *dest, const u16 *src, size_t n);
> +char *errorstr(int ret);
>  
>  enum dxglockstate {
>  	DXGLOCK_SHARED,
> -- 
> 2.32.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
