Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3A3A843B2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 14:52:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF9710E999;
	Thu, 10 Apr 2025 12:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="NosTH6wG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9903810E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744289512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdnsDqzi4HBdCMXPyh+ZkZXloK5d6xSq44jPpfEO0vo=;
 b=NosTH6wGHzh6THjULXeC9AFhxiUtbDina+Hq+IDHW0uVdgo5XR7ZouuPnE8924H4xrFpl6
 WEUH39P0eYt1uvvOl/atTZqxiupwHX1cXpLIgB+c5sJMZ9U1TdeaACvsMZagPADoVBMR6a
 /tBXvd3Nq5/Kz4aR+u8rtx87drDfDf0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-1QwuFXN0NoO8qpdqh8pBew-1; Thu, 10 Apr 2025 08:51:51 -0400
X-MC-Unique: 1QwuFXN0NoO8qpdqh8pBew-1
X-Mimecast-MFC-AGG-ID: 1QwuFXN0NoO8qpdqh8pBew_1744289510
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43ceb011ea5so5243025e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 05:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744289510; x=1744894310;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdnsDqzi4HBdCMXPyh+ZkZXloK5d6xSq44jPpfEO0vo=;
 b=nZqnh46KcM8TI6g9zZkLZ4xeLm4TWxUQf/4zsmoO+r7fbRJbAa0blbEKgQJAXfZx3T
 2/OUgjHr9q5uwXD0nIL3VNtEx6g8cAl66I+jHAuvuCSWXd/5HnPQwMJVxFehCFwruywO
 KVc3CSBp9P9xWxPaBm6rqxjvNQzCFXhn7/t3x8RmAbm3C8VUhsyeuNohIUPWALLqEeRW
 EZ6fICucgWf/FcCN0+wdZFIYyZbajMW6hPtyO3Etpy9LU2c7M7DiCSJFLs/tKvS8XfLM
 vAH3f5012oXisLSDq6/4odV339LfL5cHn7ORL5uJTSV2KT5i6AUnM0aGJHUUEnxaoEIh
 /5rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfSiug5g/lVu4rUkqwsuWWTjY574uiWj05JqimiX1MOjWiudM6rAaVjw2OxXkQkh8R+L0n5NkatIw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiLzMJK6caCqiu0UWtnhHKxG4CtVst2YXSgpa16EBlPL+YyogZ
 pVfrlVl5lCvdVLTPYG/EXNq+pNFgkRqS2HejSoKaEHYMbRGKPCsLjkLEgoDBPl0lW3upXadYoE8
 91dqAcuCAbK5VAt0y+C6ejla9B5HbKdrFza1Qbtc+ZbM26PlaUzvsC8+G2x1YctfT+w==
X-Gm-Gg: ASbGncvEtMvxJZMaEEiFcFnGFeXiHODBlZPuXiKIDkogqvvnQaX0XMeAoeNYMFWJFIx
 U6z2VeddyU8PZw3iF4uoMnQNikF/4rycvckWM09PaQiKmf42TN93MEPx2kWD0ynYfxfOIc6xaSO
 Rv/PSDEsWR1tnRaKtFViawjmxB5L/cX4PY6rxSLbeMpHXAd30DfNekYieQpvbDosQq0PZFB2Iwo
 STgCSAV9LhtKWNVALBAOE5I6/ChcYNaJEKu5rswwJuGZioA7ZVw3dENBEscgWJ6hkwbhPB39kFC
 mq7zaRzZi+4EKQuvvVsvZo+9Rezl2dVwr8rdyNphEZzVPzl+6m8=
X-Received: by 2002:a05:6000:1789:b0:390:fbba:e64b with SMTP id
 ffacd0b85a97d-39d8f494bddmr1917766f8f.31.1744289509879; 
 Thu, 10 Apr 2025 05:51:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGqf/OPzQlOi0VDIc8eN8px8JpM/oST+I4XH1tn5zBnGkSb5WHzDo/ISMxLAnA12YriOzLlA==
X-Received: by 2002:a05:6000:1789:b0:390:fbba:e64b with SMTP id
 ffacd0b85a97d-39d8f494bddmr1917727f8f.31.1744289509193; 
 Thu, 10 Apr 2025 05:51:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893fdfcesm4619924f8f.87.2025.04.10.05.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 05:51:48 -0700 (PDT)
Message-ID: <f1f3cfb2-86c4-42f9-b540-6feff196d426@redhat.com>
Date: Thu, 10 Apr 2025 14:51:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] virtgpu: don't reset on shutdown
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, Eric Auger <eauger@redhat.com>
References: <0d24e539766c9220b2380839472d1dc8739b5322.1744268995.git.mst@redhat.com>
 <07b30329-b4f0-4655-87fb-3ac52f9c64ff@redhat.com>
 <20250410084651-mutt-send-email-mst@kernel.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250410084651-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D0cQ1lpkIJQhD4lwyInk-c54BD93ZT62YQOTl-Jh1ks_1744289510
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/04/2025 14:48, Michael S. Tsirkin wrote:
> On Thu, Apr 10, 2025 at 02:33:26PM +0200, Jocelyn Falempe wrote:
>> On 10/04/2025 09:16, Michael S. Tsirkin wrote:
>>> It looks like GPUs are used by panic after shutdown is invoked.
>>> Thus, breaking virtio gpu in the shutdown callback is not a good idea -
>>> guest hangs attempting to flush out the panics, with this warnings:
>>
>> I don't think drm_panic is involved. In your backtrace, the warning
>> comes from virtio_gpu_queue_ctrl_sgs(), which is called by fbcon, using drm
>> fbdev emulation to draw the console.
>>
>> In case of drm_panic, it is the panic variant,
>> virtio_gpu_panic_queue_ctrl_sgs() which is called.
>>
>> Also the line number is for the centos-stream-9 kernel, which don't have the
>> "panic" variant of this function yet.
>>
>>>
>>> [   20.504464] WARNING: CPU: 0 PID: 568 at drivers/gpu/drm/virtio/virtgpu_vq.c:358 virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
>>> [   20.505685] Modules linked in: nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink vfat fat intel_rapl_msr intel_rapl_common intel_uncore_frequency_common nfit libnvdimm kvm_intel kvm rapl iTCO_wdt iTCO_vendor_support virtio_gpu virtio_dma_buf pcspkr drm_shmem_helper i2c_i801 drm_kms_helper lpc_ich i2c_smbus virtio_balloon joydev drm fuse xfs libcrc32c ahci libahci crct10dif_pclmul crc32_pclmul crc32c_intel libata virtio_net ghash_clmulni_intel net_failover virtio_blk failover serio_raw dm_mirror dm_region_hash dm_log dm_mod
>>> [   20.511847] CPU: 0 PID: 568 Comm: kworker/0:3 Kdump: loaded Tainted: G        W         -------  ---  5.14.0-578.6675_1757216455.el9.x86_64 #1
>>> [   20.513157] Hardware name: Red Hat KVM/RHEL, BIOS edk2-20241117-3.el9 11/17/2024
>>> [   20.513918] Workqueue: events drm_fb_helper_damage_work [drm_kms_helper]
>>> [   20.514626] RIP: 0010:virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
>>> [   20.515332] Code: 00 00 48 85 c0 74 0c 48 8b 78 08 48 89 ee e8 51 50 00 00 65 ff 0d 42 e3 74 3f 0f 85 69 ff ff ff 0f 1f 44 00 00 e9 5f ff ff ff <0f> 0b e9 3f ff ff ff 48 83 3c 24 00 74 0e 49 8b 7f 40 48 85 ff 74
>>> [   20.517272] RSP: 0018:ff34f0a8c0787ad8 EFLAGS: 00010282
>>> [   20.517820] RAX: 00000000fffffffb RBX: 0000000000000000 RCX: 0000000000000820
>>> [   20.518565] RDX: 0000000000000000 RSI: ff34f0a8c0787be0 RDI: ff218bef03a26300
>>> [   20.519308] RBP: ff218bef03a26300 R08: 0000000000000001 R09: ff218bef07224360
>>> [   20.520059] R10: 0000000000008dc0 R11: 0000000000000002 R12: ff218bef02630028
>>> [   20.520806] R13: ff218bef0263fb48 R14: ff218bef00cb8000 R15: ff218bef07224360
>>> [   20.521555] FS:  0000000000000000(0000) GS:ff218bef7ba00000(0000) knlGS:0000000000000000
>>> [   20.522397] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   20.522996] CR2: 000055ac4f7871c0 CR3: 000000010b9f2002 CR4: 0000000000771ef0
>>> [   20.523740] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>>> [   20.524477] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
>>> [   20.525223] PKRU: 55555554
>>> [   20.525515] Call Trace:
>>> [   20.525777]  <TASK>
>>> [   20.526003]  ? show_trace_log_lvl+0x1c4/0x2df
>>> [   20.526464]  ? show_trace_log_lvl+0x1c4/0x2df
>>> [   20.526925]  ? virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
>>> [   20.527643]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
>>> [   20.528282]  ? __warn+0x7e/0xd0
>>> [   20.528621]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
>>> [   20.529256]  ? report_bug+0x100/0x140
>>> [   20.529643]  ? handle_bug+0x3c/0x70
>>> [   20.530010]  ? exc_invalid_op+0x14/0x70
>>> [   20.530421]  ? asm_exc_invalid_op+0x16/0x20
>>> [   20.530862]  ? virtio_gpu_queue_ctrl_sgs+0x236/0x290 [virtio_gpu]
>>> [   20.531506]  ? virtio_gpu_queue_ctrl_sgs+0x174/0x290 [virtio_gpu]
>>> [   20.532148]  virtio_gpu_queue_fenced_ctrl_buffer+0x82/0x2c0 [virtio_gpu]
>>> [   20.532843]  virtio_gpu_primary_plane_update+0x3e2/0x460 [virtio_gpu]
>>> [   20.533520]  drm_atomic_helper_commit_planes+0x108/0x320 [drm_kms_helper]
>>> [   20.534233]  drm_atomic_helper_commit_tail+0x45/0x80 [drm_kms_helper]
>>> [   20.534914]  commit_tail+0xd2/0x130 [drm_kms_helper]
>>> [   20.535446]  drm_atomic_helper_commit+0x11b/0x140 [drm_kms_helper]
>>> [   20.536097]  drm_atomic_commit+0xa4/0xe0 [drm]
>>> [   20.536588]  ? __pfx___drm_printfn_info+0x10/0x10 [drm]
>>> [   20.537162]  drm_atomic_helper_dirtyfb+0x192/0x270 [drm_kms_helper]
>>> [   20.537823]  drm_fbdev_shmem_helper_fb_dirty+0x43/0xa0 [drm_shmem_helper]
>>> [   20.538536]  drm_fb_helper_damage_work+0x87/0x160 [drm_kms_helper]
>>> [   20.539188]  process_one_work+0x194/0x380
>>> [   20.539612]  worker_thread+0x2fe/0x410
>>> [   20.540007]  ? __pfx_worker_thread+0x10/0x10
>>> [   20.540456]  kthread+0xdd/0x100
>>> [   20.540791]  ? __pfx_kthread+0x10/0x10
>>> [   20.541190]  ret_from_fork+0x29/0x50
>>> [   20.541566]  </TASK>
>>> [   20.541802] ---[ end trace 0000000000000000 ]---
>>>
>>> The warning is from here:
>>
>> No, it comes from
>>
>> static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>> 				     struct virtio_gpu_vbuffer *vbuf,
>> 				     struct virtio_gpu_fence *fence,
>> 				     int elemcnt,
>> 				     struct scatterlist **sgs,
>> 				     int outcnt,
>> 				     int incnt)
>>>
>>> /* For drm_panic */
>>> static int virtio_gpu_panic_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>>>                                              struct virtio_gpu_vbuffer *vbuf,
>>>                                              int elemcnt,
>>>                                              struct scatterlist **sgs,
>>>                                              int outcnt,
>>>                                              int incnt)
>>> {
>>>           struct virtqueue *vq = vgdev->ctrlq.vq;
>>>           int ret;
>>>
>>>           if (vgdev->has_indirect)
>>>                   elemcnt = 1;
>>>
>>>           if (vq->num_free < elemcnt)
>>>                   return -ENOMEM;
>>>
>>>           ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
>>>           WARN_ON(ret);
>>>
>>>           vbuf->seqno = ++vgdev->ctrlq.seqno;
>>>           trace_virtio_gpu_cmd_queue(vq, virtio_gpu_vbuf_ctrl_hdr(vbuf), vbuf->seqno);
>>>
>>>           atomic_inc(&vgdev->pending_commands);
>>>
>>>           return 0;
>>> }
>>>
>>>
>>> Add an option for drivers to bypass the common break+reset handling.
>>> As DRM is careful to flush/synchronize outstanding buffers, it looks like
>>> GPU can just have a NOP there.
>>
>> So it looks like the shutdown is called in the middle of console drawing, so
>> either wait for it to finish, or let drm handle the shutdown, like your
>> patch does.
>>
>>>
>>> Fixes: 8bd2fa086a04 ("virtio: break and reset virtio devices on device_shutdown()")
>>> Cc: Eric Auger <eauger@redhat.com>
>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>
>>> Can someone who knows more about DRM and shutdown please tell me if this
>>> is a good idea?  Posting for testing and early feedback, completely
>>> untested.
>>>
>>>
>>>
>>>    drivers/gpu/drm/virtio/virtgpu_drv.c | 9 +++++++++
>>>    drivers/virtio/virtio.c              | 6 ++++++
>>>    include/linux/virtio.h               | 3 +++
>>>    3 files changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
>>> index 2d88e390feb4..210464146a9c 100644
>>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
>>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
>>> @@ -128,6 +128,14 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
>>>    	drm_dev_put(dev);
>>>    }
>>> +static void virtio_gpu_shutdown(struct virtio_device *vdev)
>>> +{
>>> +	/*
>>> +	 * GPU is used by drm panic after shutdown.
>>
>> Hopefully, there are no panic on shutdown.
> 
> 
> 
> OK looks like you agree with the patch, but the comments and the
> commit log need to be fixed up?
> 

Yes, that's my point, sorry if I wasn't clear.

> 
>>> +	 * Do nothing here, opt out of device reset.
>>> +	 */
>>> +}
>>> +
>>>    static void virtio_gpu_config_changed(struct virtio_device *vdev)
>>>    {
>>>    	struct drm_device *dev = vdev->priv;
>>> @@ -162,6 +170,7 @@ static struct virtio_driver virtio_gpu_driver = {
>>>    	.id_table = id_table,
>>>    	.probe = virtio_gpu_probe,
>>>    	.remove = virtio_gpu_remove,
>>> +	.shutdown = virtio_gpu_shutdown,
>>>    	.config_changed = virtio_gpu_config_changed
>>>    };
>>> diff --git a/drivers/virtio/virtio.c b/drivers/virtio/virtio.c
>>> index 150753c3b578..95d5d7993e5b 100644
>>> --- a/drivers/virtio/virtio.c
>>> +++ b/drivers/virtio/virtio.c
>>> @@ -407,6 +407,12 @@ static void virtio_dev_shutdown(struct device *_d)
>>>    	if (!drv)
>>>    		return;
>>> +	/* If the driver has its own shutdown method, use that. */
>>> +	if (drv->shutdown) {
>>> +		drv->shutdown(dev);
>>> +		return;
>>> +	}
>>> +
>>>    	/*
>>>    	 * Some devices get wedged if you kick them after they are
>>>    	 * reset. Mark all vqs as broken to make sure we don't.
>>> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
>>> index 4d16c13d0df5..64cb4b04be7a 100644
>>> --- a/include/linux/virtio.h
>>> +++ b/include/linux/virtio.h
>>> @@ -220,6 +220,8 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
>>>     *    occurs.
>>>     * @reset_done: optional function to call after transport specific reset
>>>     *    operation has finished.
>>> + * @shutdown: synchronize with the device on shutdown. If provided, replaces
>>> + *    the virtio core implementation.
>>>     */
>>>    struct virtio_driver {
>>>    	struct device_driver driver;
>>> @@ -237,6 +239,7 @@ struct virtio_driver {
>>>    	int (*restore)(struct virtio_device *dev);
>>>    	int (*reset_prepare)(struct virtio_device *dev);
>>>    	int (*reset_done)(struct virtio_device *dev);
>>> +	void (*shutdown)(struct virtio_device *dev);
>>>    };
>>>    #define drv_to_virtio(__drv)	container_of_const(__drv, struct virtio_driver, driver)
>>
>> Best regards,
>>
>> -- 
>>
>> Jocelyn
> 

