Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A15170F7
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 15:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8EA410EF47;
	Mon,  2 May 2022 13:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE2F10E865
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:10:06 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n14so14841136lfu.13
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 09:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Nf28pFd42ZVnx38GcwQNtFtPrZ2oJjcyAQfdnNyRvpE=;
 b=fBOD+RUJw6jb8ujbNpt4X/z3b2lEiqyBtNhbQTqnLKV1Hv5LELIt/O35QYauUOa+Y8
 yjFoGTDq8hBuP8gTnS3hLaW+iByildqbsRJmTmNUEMKI6svBxrL6Xo98iTYMLxpzAbRR
 Xg1C68nUJ8nnjOXdGtG0OUYB34rhartiXferve+7X6gHKPV0CIFqOYsHhYfBDVETmUhE
 oKvvMVMR50gSfnhWJ4ZwkoETODH4mZZT0UzDCmvZlr+aPiOr4RKevfeCBMLQUCynZWoJ
 8PjmTa1dOuBCry/6nPI9bTul5qfWzt4i5mwMIItO+yQYOIiMybZab1dkEAfMYLfVwYAX
 qLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Nf28pFd42ZVnx38GcwQNtFtPrZ2oJjcyAQfdnNyRvpE=;
 b=rbD0C79g9U/S4LXXkpgdyQBrl+hMpmo7tb5Pn3i22JBh3ML0vUCXW4lcT1hR/pLkDB
 b9HcUOgTqCNRx+5O4Y3AidPZmgvvuel4aaRAn2EAm0+9Rbrp79IXMFkpKS5qAPwVBR6+
 r5+M0IbHBMveKwshvdZHAwRZbwKrSbBw2ZrIVgjjnY7gKapHRLTJasLZnr2OCl/nAMsj
 4Xj/QKqEFrVO/WlWDnfEwlFwhiLEvhrmJvUBJaJZ9gIGJfp3fUefsxeJbYwQaUsaL12D
 7owV0bojpbxAWsbwNyTIFwx5vkhWWyPlSAs34C2wqo4s883rQoJ+Wvw9HaDkCBOjsvuZ
 FNmw==
X-Gm-Message-State: AOAM532AuyG2h6EfAtFsD50RYXsjlftutwneqdP5TftzAXtns6C7lt6b
 XoC3fCvZypIEJCE9OcYBhhU=
X-Google-Smtp-Source: ABdhPJwllqzcKcjS+nPZ+FQBW2m6FasElP+Juc0817U3hQVDb/GqYyG8BJA/OSRRz6v/XNeQxQk7Ag==
X-Received: by 2002:a05:6512:1504:b0:44b:36e:b50d with SMTP id
 bq4-20020a056512150400b0044b036eb50dmr28105186lfb.558.1651248604731; 
 Fri, 29 Apr 2022 09:10:04 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a19f105000000b0047221ec7b81sm270471lfh.58.2022.04.29.09.10.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 09:10:04 -0700 (PDT)
Subject: Re: [PATCH v2 14/19] xen/drmfront: use xenbus_setup_ring() and
 xenbus_teardown_ring()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220428082743.16593-1-jgross@suse.com>
 <20220428082743.16593-15-jgross@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e2e1f5c0-e78e-fa1e-bdee-54b5aeaba957@gmail.com>
Date: Fri, 29 Apr 2022 19:10:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220428082743.16593-15-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 02 May 2022 13:52:17 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28.04.22 11:27, Juergen Gross wrote:

Hello Juergen, all

> Simplify drmfront's ring creation and removal via xenbus_setup_ring()
> and xenbus_teardown_ring().
>
> Signed-off-by: Juergen Gross <jgross@suse.com>


I am not familiar with DRM bits of this driver, but a little bit 
familiar with Xen bits this patch only touches and I have environment to 
test.

Xen specific changes looks good to me. Also I didn't see any specific to 
this series issues when testing virtulized display driver except one I 
have already pointed out in PATCH v2 08/19.

root@salvator-x-h3-4x2g-xt-domu:~# dmesg | grep drm
[    0.158190] [drm] Registering XEN PV vdispl
[    0.159620] [drm] Connector device/vdispl/0/0: resolution 1920x1080
[    0.159888] [drm] Have 1 connector(s)
[    0.289069] [drm] Creating Xen PV DRM Display Unit
[    0.289873] [drm] Initialized xendrm-du 1.0.0 20180221 for vdispl-0 
on minor 0
[    0.289918] [drm] Initialized xendrm-du 1.0.0 20180221 on minor 0


root@generic-armv8-xt-dom0:~# xenstore-ls -f | grep vdispl
/local/domain/1/backend/vdispl = ""
/local/domain/1/backend/vdispl/2 = ""
/local/domain/1/backend/vdispl/2/0 = ""
/local/domain/1/backend/vdispl/2/0/frontend = 
"/local/domain/2/device/vdispl/0"
/local/domain/1/backend/vdispl/2/0/frontend-id = "2"
/local/domain/1/backend/vdispl/2/0/online = "1"
/local/domain/1/backend/vdispl/2/0/state = "4"
/local/domain/2/device/vdispl = ""
/local/domain/2/device/vdispl/0 = ""
/local/domain/2/device/vdispl/0/backend = 
"/local/domain/1/backend/vdispl/2/0"
/local/domain/2/device/vdispl/0/backend-id = "1"
/local/domain/2/device/vdispl/0/state = "4"
/local/domain/2/device/vdispl/0/be-alloc = "0"
/local/domain/2/device/vdispl/0/0 = ""
/local/domain/2/device/vdispl/0/0/resolution = "1920x1080"
/local/domain/2/device/vdispl/0/0/unique-id = "HDMI-A-1"
/local/domain/2/device/vdispl/0/0/req-ring-ref = "8"
/local/domain/2/device/vdispl/0/0/req-event-channel = "7"
/local/domain/2/device/vdispl/0/0/evt-ring-ref = "9"
/local/domain/2/device/vdispl/0/0/evt-event-channel = "8"
/libxl/2/device/vdispl = ""
/libxl/2/device/vdispl/0 = ""
/libxl/2/device/vdispl/0/frontend = "/local/domain/2/device/vdispl/0"
/libxl/2/device/vdispl/0/backend = "/local/domain/1/backend/vdispl/2/0"
/libxl/2/device/vdispl/0/frontend-id = "2"
/libxl/2/device/vdispl/0/online = "1"
/libxl/2/device/vdispl/0/state = "1"


It worth mentioning I noticed one issue, but I believe it is not related 
to your series.

root@salvator-x-h3-4x2g-xt-domu:~# modetest -M xendrm-du -s 31:1920x1080
[   62.431887] ------------[ cut here ]------------
[   62.431940] WARNING: CPU: 0 PID: 244 at 
drivers/gpu/drm/drm_gem.c:1055 drm_gem_mmap_obj+0x16c/0x180
[   62.432000] Modules linked in:
[   62.432025] CPU: 0 PID: 244 Comm: modetest Tainted: G W         
5.18.0-rc4-yocto-standard-00096-g936342d8fae2 #1
[   62.432067] Hardware name: XENVM-4.17 (DT)
[   62.432089] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[   62.432126] pc : drm_gem_mmap_obj+0x16c/0x180
[   62.432153] lr : drm_gem_mmap_obj+0x78/0x180
[   62.432178] sp : ffff800009da3bb0
[   62.432196] x29: ffff800009da3bb0 x28: 0000000000000008 x27: 
ffff0001c3a56780
[   62.432237] x26: ffff0001c3a56f00 x25: 00000000000007e9 x24: 
ffff0001c23dec00
[   62.432279] x23: ffff0001c0c98000 x22: ffff0001c2162b80 x21: 
0000000000000000
[   62.432320] x20: ffff0001c3a56780 x19: ffff0001c23dea00 x18: 
0000000000000001
[   62.432355] x17: 0000000000000000 x16: 0000000000000000 x15: 
000000000003603c
[   62.432394] x14: 0000000000000000 x13: 0000000000000000 x12: 
0000000000000000
[   62.432430] x11: 0000000000100000 x10: 0000ffff88071000 x9 : 
ffff0001c0f17e70
[   62.432470] x8 : ffff8001f65ce000 x7 : 0000000000000001 x6 : 
ffff0001c388a000
[   62.432505] x5 : ffff800009da3a10 x4 : 0000000000000090 x3 : 
0000000010046400
[   62.432539] x2 : 00000000000007e9 x1 : 9b0023a536f4f400 x0 : 
00000000100000fb
[   62.432579] Call trace:
[   62.432593]  drm_gem_mmap_obj+0x16c/0x180
[   62.432617]  drm_gem_mmap+0x128/0x228
[   62.432641]  mmap_region+0x384/0x5a0
[   62.432667]  do_mmap+0x354/0x4f0
[   62.432687]  vm_mmap_pgoff+0xdc/0x108
[   62.432710]  ksys_mmap_pgoff+0x1b8/0x208
[   62.432734]  __arm64_sys_mmap+0x30/0x48
[   62.432760]  invoke_syscall+0x44/0x108
[   62.432783]  el0_svc_common.constprop.0+0xcc/0xf0
[   62.432811]  do_el0_svc+0x24/0x88
[   62.432831]  el0_svc+0x2c/0x88
[   62.432855]  el0t_64_sync_handler+0xb0/0xb8
[   62.432875]  el0t_64_sync+0x18c/0x190
[   62.432898] ---[ end trace 0000000000000000 ]---
setting mode 1920x1080-60.00Hz@XR24 on connectors 31, crtc 34


Although we see that WARNING, the application still works. Looking into 
the code, I assume that problem is that frontend doesn't set the 
VM_DONTEXPAND flag in mmap callback.

This diff fixes an issue in my environment:

index 5a5bf4e..e31554d 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -71,7 +71,7 @@ static int xen_drm_front_gem_object_mmap(struct 
drm_gem_object *gem_obj,
          * the whole buffer.
          */
         vma->vm_flags &= ~VM_PFNMAP;
-       vma->vm_flags |= VM_MIXEDMAP;
+       vma->vm_flags |= VM_MIXEDMAP | VM_DONTEXPAND;
         vma->vm_pgoff = 0;

         /*


I am not 100% sure whether it is a proper fix, so I would kindly ask DRM 
folks to confirm. I will be able to send a formal patch then.


> ---
>   drivers/gpu/drm/xen/xen_drm_front_evtchnl.c | 43 ++++++---------------
>   1 file changed, 11 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
> index 4006568b9e32..e52afd792346 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front_evtchnl.c
> @@ -123,12 +123,12 @@ static irqreturn_t evtchnl_interrupt_evt(int irq, void *dev_id)
>   static void evtchnl_free(struct xen_drm_front_info *front_info,
>   			 struct xen_drm_front_evtchnl *evtchnl)
>   {
> -	unsigned long page = 0;
> +	void *page = NULL;
>   
>   	if (evtchnl->type == EVTCHNL_TYPE_REQ)
> -		page = (unsigned long)evtchnl->u.req.ring.sring;
> +		page = evtchnl->u.req.ring.sring;
>   	else if (evtchnl->type == EVTCHNL_TYPE_EVT)
> -		page = (unsigned long)evtchnl->u.evt.page;
> +		page = evtchnl->u.evt.page;
>   	if (!page)
>   		return;
>   
> @@ -147,8 +147,7 @@ static void evtchnl_free(struct xen_drm_front_info *front_info,
>   		xenbus_free_evtchn(front_info->xb_dev, evtchnl->port);
>   
>   	/* end access and free the page */
> -	if (evtchnl->gref != INVALID_GRANT_REF)
> -		gnttab_end_foreign_access(evtchnl->gref, page);
> +	xenbus_teardown_ring(&page, 1, &evtchnl->gref);
>   
>   	memset(evtchnl, 0, sizeof(*evtchnl));
>   }
> @@ -158,8 +157,7 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
>   			 enum xen_drm_front_evtchnl_type type)
>   {
>   	struct xenbus_device *xb_dev = front_info->xb_dev;
> -	unsigned long page;
> -	grant_ref_t gref;
> +	void *page;
>   	irq_handler_t handler;
>   	int ret;
>   
> @@ -168,44 +166,25 @@ static int evtchnl_alloc(struct xen_drm_front_info *front_info, int index,
>   	evtchnl->index = index;
>   	evtchnl->front_info = front_info;
>   	evtchnl->state = EVTCHNL_STATE_DISCONNECTED;
> -	evtchnl->gref = INVALID_GRANT_REF;
>   
> -	page = get_zeroed_page(GFP_NOIO | __GFP_HIGH);
> -	if (!page) {
> -		ret = -ENOMEM;
> +	ret = xenbus_setup_ring(xb_dev, GFP_NOIO | __GFP_HIGH, &page,
> +				1, &evtchnl->gref);
> +	if (ret)
>   		goto fail;
> -	}
>   
>   	if (type == EVTCHNL_TYPE_REQ) {
>   		struct xen_displif_sring *sring;
>   
>   		init_completion(&evtchnl->u.req.completion);
>   		mutex_init(&evtchnl->u.req.req_io_lock);
> -		sring = (struct xen_displif_sring *)page;
> -		SHARED_RING_INIT(sring);
> -		FRONT_RING_INIT(&evtchnl->u.req.ring, sring, XEN_PAGE_SIZE);
> -
> -		ret = xenbus_grant_ring(xb_dev, sring, 1, &gref);
> -		if (ret < 0) {
> -			evtchnl->u.req.ring.sring = NULL;
> -			free_page(page);
> -			goto fail;
> -		}
> +		sring = page;
> +		XEN_FRONT_RING_INIT(&evtchnl->u.req.ring, sring, XEN_PAGE_SIZE);
>   
>   		handler = evtchnl_interrupt_ctrl;
>   	} else {
> -		ret = gnttab_grant_foreign_access(xb_dev->otherend_id,
> -						  virt_to_gfn((void *)page), 0);
> -		if (ret < 0) {
> -			free_page(page);
> -			goto fail;
> -		}
> -
> -		evtchnl->u.evt.page = (struct xendispl_event_page *)page;
> -		gref = ret;
> +		evtchnl->u.evt.page = page;
>   		handler = evtchnl_interrupt_evt;
>   	}
> -	evtchnl->gref = gref;
>   
>   	ret = xenbus_alloc_evtchn(xb_dev, &evtchnl->port);
>   	if (ret < 0)


-- 
Regards,

Oleksandr Tyshchenko

