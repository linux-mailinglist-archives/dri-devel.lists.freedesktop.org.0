Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38206AACBF
	for <lists+dri-devel@lfdr.de>; Sat,  4 Mar 2023 22:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4D610E1CF;
	Sat,  4 Mar 2023 21:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA0810E1CF
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Mar 2023 21:39:39 +0000 (UTC)
Received: from [192.168.2.210] (unknown [109.252.117.89])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 061CC660225B;
 Sat,  4 Mar 2023 21:39:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677965978;
 bh=9CrHTxyZW3KFylnn871/cD0eq6Djuw1QBrR3CDRcqBI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I6HoBgf/AQJHufIa+5Tx6ghOUVJqyq6TtBj5oaoc2UHq9Jw7Sf8aBLVZq8ChzQ4q7
 j1URZyVz3lW/rFcUw3ujKSP1wOANunAspGJIy7iEku5QqLaGAnvrSmt+EVQASPjM1m
 JgpPdhET7YCA8ddiPeiJmI09TYUAFmApsotMqphr+0i1uguhBcoAnyBK19N+wOVSbC
 +SjWg/J3j2AtE1NLvtGNrpYeiCv6Xi8CR6YoR+axsjM9DOU3T6xfkkPf2ZKd8+9vgw
 4y4zs8G82rIXEdr7FtcFziOKpDxnWmHty91qWRMS3Z9S1lD/Li8X0SoLD2vstQgmlo
 FuS+dFhJA73Zg==
Message-ID: <5ce56330-f4a3-e09d-e7bf-f8ae6d1cdc02@collabora.com>
Date: Sun, 5 Mar 2023 00:39:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6] drm/virtio: Add option to disable KMS support
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230302233506.3146290-1-robdclark@gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230302233506.3146290-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Ryan Neph <ryanneph@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 David Airlie <airlied@redhat.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/23 02:35, Rob Clark wrote:
> @@ -223,12 +223,15 @@ int virtio_gpu_init(struct virtio_device *vdev, struct drm_device *dev)
>  			num_scanouts, &num_scanouts);
>  	vgdev->num_scanouts = min_t(uint32_t, num_scanouts,
>  				    VIRTIO_GPU_MAX_SCANOUTS);
> -	if (!vgdev->num_scanouts) {
> -		DRM_ERROR("num_scanouts is zero\n");
> -		ret = -EINVAL;
> -		goto err_scanouts;
> +
> +	if (IS_ENABLED(CONFIG_DRM_VIRTIO_GPU_KMS) || !vgdev->num_scanouts) {

Unfortunately the IS_ENABLED check needs to be inverted here.

Secondly, with the IS_ENABLED check fixed and CONFIG_DRM_VIRTIO_GPU_KMS
disabled, kernel crashes with a NULL deref on boot after getting the
VIRTIO_GPU_EVENT_DISPLAY from host.

 ==================================================================
[    0.870144] BUG: KASAN: null-ptr-deref in
drm_kms_helper_hotplug_event+0x2b/0x50
[    0.870588] Read of size 8 at addr 0000000000000010 by task
kworker/0:1/14
[    0.870588]
[    0.870588] CPU: 0 PID: 14 Comm: kworker/0:1 Not tainted
6.2.0-next-20230303+ #387
[    0.871441] scsi host0: ahci
[    0.870588] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
[    0.870588] Workqueue: events virtio_gpu_dequeue_ctrl_func
[    0.870588] Call Trace:
[    0.870588]  <TASK>
[    0.872841] scsi host1: ahci
[    0.870588]  dump_stack_lvl+0x46/0x70
[    0.870588]  kasan_report+0xbb/0xf0
[    0.870588]  ? drm_kms_helper_hotplug_event+0x2b/0x50
[    0.870588]  drm_kms_helper_hotplug_event+0x2b/0x50
[    0.870588]  virtio_gpu_dequeue_ctrl_func+0x143/0x500
[    0.870588]  ? lock_is_held_type+0xd8/0x130
[    0.870588]  ? virtio_gpu_free_vbufs+0x40/0x40
[    0.875105] scsi host2: ahci
[    0.870588]  process_one_work+0x4f5/0x9a0
[    0.870588]  ? pwq_dec_nr_in_flight+0x100/0x100
[    0.870588]  ? spin_bug+0xe0/0xe0
[    0.870588]  worker_thread+0x8c/0x610
[    0.870588]  ? process_one_work+0x9a0/0x9a0
[    0.870588]  kthread+0x15a/0x190
[    0.870588]  ? kthread_complete_and_exit+0x20/0x20
[    0.870588]  ret_from_fork+0x1f/0x30
[    0.877201] scsi host3: ahci
[    0.870588]  </TASK>
[    0.870588]
==================================================================

I'll send a follow up fix.

-- 
Best regards,
Dmitry

