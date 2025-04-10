Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F934A83E68
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 11:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D6F310E810;
	Thu, 10 Apr 2025 09:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="XnDVd7Q8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2609E10E810
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 09:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744276966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3G2dA/uh7y81gqcecMrUlskMZ6C+yBGFXBGfQTVR2W8=;
 b=XnDVd7Q8i7Z83illjtnrjM2BPWYrU97K09Myoa6ZIjoGn0QLZUtKokiRNr5Fd1RWPfvkdW
 uSjkJOuybEDIANniOdi+lS0C0hPV9dMVBBlpaRsRE/sYJyrJOfUlL9XlQ0yEBsaTNNNL9S
 jlPKQdlqo+vkjs5Jf+DjF9nlPxssRQ4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-CJ31HJcRN5SRyjam5kmXzQ-1; Thu, 10 Apr 2025 05:22:45 -0400
X-MC-Unique: CJ31HJcRN5SRyjam5kmXzQ-1
X-Mimecast-MFC-AGG-ID: CJ31HJcRN5SRyjam5kmXzQ_1744276964
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3913aaf1e32so297609f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 02:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744276963; x=1744881763;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3G2dA/uh7y81gqcecMrUlskMZ6C+yBGFXBGfQTVR2W8=;
 b=IYvuXRdsk7UIvMJUiW1s5c7ZtdnucKaMmhVxWtfNC7hAKS7X+rmHxu/l2j9SeCtNwu
 TMFneEYdkICwCmKT89ZdAc060WnyXedouyFhGgjlg8fl3IJIj86/ml1mueSfrQgzcJF6
 2+ZJwjwtmjDIoELopMqz8YaZCW9HtxYj+ABBery5vEvI5+LdWWVB8x1JoFpGwL/hQKJq
 F0Hsjw8TeAsIZp54rfTBSfkmeqDNIwPZIKMMpGKA7C6beVczBHMIh2fALxlfMBzZVvWb
 qs1ii79SAKpfhBOlsSBEsSXD6We1r7MdalQls65eKbTdBrTAKMfrWDj9pGyqlyc4iQk/
 2ntA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDbfEgpDo8bKUUHdMrnris/itri4CFFEFBKxG22JywKa68+V/H9sL8JhslLPz5NLipHjvTiu6vs7M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdFuA8MCn1Gc33JYJmI+lJXlAqWgt+6U+kXfG4wlN9l300eADc
 xJGZ5hvLdlwOD95SI4bu+DoEWJz2Hcj8u2b0tDwS+3C1KrQ/IiGAv1BSeANQl3whjaMckoUvlID
 yCbrz6Lqe4OpvybWHhYm5/uqby1cyLOFGn8c7rHDzpLDr020CWDkId/UyjpvKhvYz5edmPQ+e7s
 Ev
X-Gm-Gg: ASbGncvIR7zUJ5h01I/pRMiBut2jrhU/GCVJJs+fEba3kw0V9/zv3gA1Z89/GY6am0D
 XlfXQ/HAF2NVK5M0CA8Gs+IcCzNZs7i0KTSzgzmVQY/pTTT8wA7N8Cyc3lOZvMqd+rklenfPuyz
 X61vQAmSHi7TB8K/2S+GE3UduLGHdWuOJ1xejAnoPYPKsAQ6SlDV1gBCKtJfuZbiK7nlqbLCQfR
 yhP+FcQim3GsMRL6hfXi+WV2b4DdGM/wuuWXtrT8tDjMfjyU5lQhNXxLX5c/Aw11Vyi8QBKdamT
 sL/r3sbxFtufsoRvDm36gfeJFTsiCFbWSjjdpx6ANFaso8T5b/vPgw==
X-Received: by 2002:adf:b641:0:b0:39c:2669:d7f4 with SMTP id
 ffacd0b85a97d-39d8fddf9cbmr1084633f8f.43.1744276963075; 
 Thu, 10 Apr 2025 02:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3A4N/y2Xwm9C2hhIG46pgbuWM+iB7GhYucAHMLdNuEQ5EK13MQnN0EGjvgGsRE7YUym+Ksw==
X-Received: by 2002:adf:b641:0:b0:39c:2669:d7f4 with SMTP id
 ffacd0b85a97d-39d8fddf9cbmr1084610f8f.43.1744276962538; 
 Thu, 10 Apr 2025 02:22:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f20901c58sm30744735e9.0.2025.04.10.02.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:22:41 -0700 (PDT)
Message-ID: <1beb29e4-0f11-4ed7-8096-436e0ac74679@redhat.com>
Date: Thu, 10 Apr 2025 11:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] virtgpu: don't reset on shutdown
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev
References: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WBety_1u9PdsjGWI1_C1Oc_CqDTHoyFMjfAYUtRVADM_1744276964
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hi Michael,

On 4/10/25 9:16 AM, Michael S. Tsirkin wrote:
> It looks like GPUs are used by panic after shutdown is invoked.
> Thus, breaking virtio gpu in the shutdown callback is not a good idea -
> guest hangs attempting to flush out the panics, with this warnings:
> 
> [   20.504464] WARNING: CPU: 0 PID: 568 at drivers/gpu/drm/virtio/virtgpu_vq.c:358 virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.505685] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink vfat fat intel_rapl_msr intel_rapl_common intel_uncore_frequency_common nfit libnvdimm kvm_intel kvm rapl iTCO_wdt iTCO_vendor_support virtio_gpu virtio_dma_buf pcspkr drm_shmem_helper i2c_i801 drm_kms_helper lpc_ich i2c_smbus virtio_balloon joydev drm fuse xfs libcrc32c ahci libahci crct10dif_pclmul crc32_pclmul crc32c_intel libata virtio_net ghash_clmulni_intel net_failover virtio_blk failover serio_raw dm_mirror dm_region_hash dm_log dm_mod
> [   20.511847] CPU: 0 PID: 568 Comm: kworker/0:3 Kdump: loaded Tainted: G        W         -------  ---  5.14.0-578.6675_1757216455.el9.x86_64 #1
> [   20.513157] Hardware name: Red Hat KVM/RHEL, BIOS edk2-20241117-3.el9 11/17/2024
> [   20.513918] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
> [   20.514626] RIP: 0010:virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.515332] Code: 00 00 48 85 c0 74 0c 48 8b 78 08 48 89 ee e8 51 50 00 00 65 ff 0d 42 e3 74 3f 0f 85 69 ff ff ff 0f 1f 44 00 00 e9 5f ff ff ff <0f> 0b e9 3f ff ff ff 48 83 3c 24 00 74 0e 49 8b 7f 40 48 85 ff 74
> [   20.517272] RSP: 0018:ff34f0a8c0787ad8 EFLAGS: 00010282
> [   20.517820] RAX: 00000000fffffffb RBX: 0000000000000000 RCX: 0000000000000820
> [   20.518565] RDX: 0000000000000000 RSI: ff34f0a8c0787be0 RDI: ff218bef03a26300
> [   20.519308] RBP: ff218bef03a26300 R08: 0000000000000001 R09: ff218bef07224360
> [   20.520059] R10: 0000000000008dc0 R11: 0000000000000002 R12: ff218bef02630028
> [   20.520806] R13: ff218bef0263fb48 R14: ff218bef00cb8000 R15: ff218bef07224360
> [   20.521555] FS:  0000000000000000(0000) GS:ff218bef7ba00000(0000) knlGS:0000000000000000
> [   20.522397] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   20.522996] CR2: 000055ac4f7871c0 CR3: 000000010b9f2002 CR4: 0000000000771ef0
> [   20.523740] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   20.524477] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
> [   20.525223] PKRU: 55555554
> [   20.525515] Call Trace:
> [   20.525777]  <TASK>
> [   20.526003]  ? show_trace_log_lvl+0x1c4/0x2df
> [   20.526464]  ? show_trace_log_lvl+0x1c4/0x2df
> [   20.526925]  ? virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
> [   20.527643]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.528282]  ? __warn+0x7e/0xd0
> [   20.528621]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.529256]  ? report_bug+0x100/0x140
> [   20.529643]  ? handle_bug+0x3c/0x70
> [   20.530010]  ? exc_invalid_op+0x14/0x70
> [   20.530421]  ? asm_exc_invalid_op+0x16/0x20
> [   20.530862]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
> [   20.531506]  ? virtio_gpu_queue_ctrl_sgs+0x174/0x290 [virtio_gpu]
> [   20.532148]  virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
> [   20.532843]  virtio_gpu_primary_plane_update+0x3e2/0x460 [virtio_gpu]
> [   20.533520]  drm_atomic_helper_commit_planes+0x108/0x320 [drm_kms_helper]
> [   20.534233]  drm_atomic_helper_commit_tail+0x45/0x80 [drm_kms_helper]
> [   20.534914]  commit_tail+0xd2/0x130 [drm_kms_helper]
> [   20.535446]  drm_atomic_helper_commit+0x11b/0x140 [drm_kms_helper]
> [   20.536097]  drm_atomic_commit+0xa4/0xe0 [drm]
> [   20.536588]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
> [   20.537162]  drm_atomic_helper_dirtyfb+0x192/0x270 [drm_kms_helper]
> [   20.537823]  drm_fbdev_shmem_helper_fb_dirty+0x43/0xa0 [drm_shmem_helper]
> [   20.538536]  drm_fb_helper_damage_work+0x87/0x160 [drm_kms_helper]
> [   20.539188]  process_one_work+0x194/0x380
> [   20.539612]  worker_thread+0x2fe/0x410
> [   20.540007]  ? __pfx_worker_thread+0x10/0x10
> [   20.540456]  kthread+0xdd/0x100
> [   20.540791]  ? __pfx_kthread+0x10/0x10
> [   20.541190]  ret_from_fork+0x29/0x50
> [   20.541566]  </TASK>
> [   20.541802] ---[ end trace 0000000000000000 ]--- 
> 
> The warning is from here:
> 
> /* For drm_panic */
> static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>                                            struct virtio_gpu_vbuffer *vbuf,
>                                            int elemcnt,
>                                            struct scatterlist **sgs,
>                                            int outcnt,
>                                            int incnt)
> {
>         struct virtqueue *vq = vgdev->ctrlq.vq;
>         int ret;
> 
>         if (vgdev->has_indirect)
>                 elemcnt = 1;
> 
>         if (vq->num_free < elemcnt)
>                 return -ENOMEM;
> 
>         ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
>         WARN_ON(ret);
> 
>         vbuf->seqno = ++vgdev->ctrlq.seqno;
>         trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
> 
>         atomic_inc(&vgdev->pending_commands);
> 
>         return 0;
> }
> 
> 
> Add an option for drivers to bypass the common break+reset handling.
> As DRM is careful to flush/synchronize outstanding buffers, it looks like
> GPU can just have a NOP there.
> 
> Fixes: 8bd2fa086a04 ("virtio: break and reset virtio devices on device_shutdown()")
> Cc: Eric Auger <eauger@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

This fixes the guest WARN_ON()/hangs for me.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
> 
> Can someone who knows more about DRM and shutdown please tell me if this
> is a good idea?  Posting for testing and early feedback, completely
> untested.
> 
> 
> 
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 9 +++++++++
>  drivers/virtio/virtio.c              | 6 ++++++
>  include/linux/virtio.h               | 3 +++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> index 2d88e390feb4..210464146a9c 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> @@ -128,6 +128,14 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>  	drm_dev_put(dev);
>  }
>  
> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
> +{
> +	/*
> +	 * GPU is used by drm panic after shutdown.
> +	 * Do nothing here, opt out of device reset.
> +	 */
> +}
> +
>  static void virtio_gpu_config_changed(struct virtio_device *vdev)
>  {
>  	struct drm_device *dev = vdev->priv;
> @@ -162,6 +170,7 @@ static struct virtio_driver virtio_gpu_driver = {
>  	.id_table = id_table,
>  	.probe = virtio_gpu_probe,
>  	.remove = virtio_gpu_remove,
> +	.shutdown = virtio_gpu_shutdown,
>  	.config_changed = virtio_gpu_config_changed
>  };
>  
> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
> index 150753c3b578..95d5d7993e5b 100644
> --- a/drivers/virtio/virtio.c
> +++ b/drivers/virtio/virtio.c
> @@ -407,6 +407,12 @@ static void virtio_dev_shutdown(struct device *_d)
>  	if (!drv)
>  		return;
>  
> +	/* If the driver has its own shutdown method, use that. */
> +	if (drv->shutdown) {
> +		drv->shutdown(dev);
> +		return;
> +	}
> +
>  	/*
>  	 * Some devices get wedged if you kick them after they are
>  	 * reset. Mark all vqs as broken to make sure we don't.
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index 4d16c13d0df5..64cb4b04be7a 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -220,6 +220,8 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>   *    occurs.
>   * @reset_done: optional function to call after transport specific reset
>   *    operation has finished.
> + * @shutdown: synchronize with the device on shutdown. If provided, replaces
> + *    the virtio core implementation.
>   */
>  struct virtio_driver {
>  	struct device_driver driver;
> @@ -237,6 +239,7 @@ struct virtio_driver {
>  	int (*restore)(struct virtio_device *dev);
>  	int (*reset_prepare)(struct virtio_device *dev);
>  	int (*reset_done)(struct virtio_device *dev);
> +	void (*shutdown)(struct virtio_device *dev);
>  };
>  
>  #define drv_to_virtio(__drv)	container_of_const(__drv, struct virtio_driver, driver)

