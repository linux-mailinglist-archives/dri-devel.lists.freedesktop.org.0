Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2284970E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 10:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA45C10F3AD;
	Mon,  5 Feb 2024 09:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O8vpnEMG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E93010F39D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707126851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hy86fOlD9ikNX74nxEM0er3nn0CasnGRVhRsbCMtC1c=;
 b=O8vpnEMGKpPnwZpZOSXzjCJ1J4rOi3I/pgmp4H8MbpYRDa4ixbxWfAr+c9vZGZ1IWBTd4f
 nmuc12r94hTljVTzGYPhzIPqOwN0u/Plnq3DGd/8keUmfL6xe04YdcbS/dKXtYFpOfP0sk
 G9qVMTO+KpwBOCrAJb46IbYPvHNEMrA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-ublXT1uXOMiYqkyA43Bj_w-1; Mon, 05 Feb 2024 04:54:10 -0500
X-MC-Unique: ublXT1uXOMiYqkyA43Bj_w-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-a2c4e9cb449so283996766b.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 01:54:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707126849; x=1707731649;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hy86fOlD9ikNX74nxEM0er3nn0CasnGRVhRsbCMtC1c=;
 b=CQUZ95tCuUMlYv1KPSYT02Gtsx/DzeG1lrl/MvbxACDydEYpwDdRsiS6rh0wW6xeee
 Yl6aF61WXa7goENu+eUVknO/gyv3D5KEe3yJXnzsfqdbAowecPkjRORkYlVflcm6e4tY
 Mdh6gF388otk9H9BCfgeJdbGde8AFWoSq0IPO7shC0UTEpMiYhtJ1IjERrXmOntY4FpE
 reO8eugM/bMft5s7QNqCE+Jt5NBpQlhCM+oUQtA0mW2pEIRMuB+6k4Se4pTCPc0bQx8l
 +wd7j+dc9VvGgW4WaDUoPtGB9OEUQlQkr2LjDyYSvpMLJDJRq6xJ6fTPZOdkdGuZMyjr
 IDlw==
X-Gm-Message-State: AOJu0YzIXr800xMtQrJRe6ew2DOEHavLahZOSCEZv03mBwUSVmvbhAdh
 7jqBkyUdb6EyPPg97CAUqdNQ+an3tXH5M6lgBMzvaqVYt4Hm4H6XCVpwGqUqcKoPfa4ol79tRJB
 5Lqb+8PbIZvi8SJ2kMYCZPVFpKt1g/cZtdJGQgQujuUPbio31THWmQtK3qp9SpiMv9g==
X-Received: by 2002:a17:906:3284:b0:a36:f694:be6e with SMTP id
 4-20020a170906328400b00a36f694be6emr7034753ejw.12.1707126849037; 
 Mon, 05 Feb 2024 01:54:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpvh3tFsaQqXbiVDdnVs13tCPJTFcTMtcHnhUHiY//3vUUsHV4I8c3t31VE56QayafSoyQVg==
X-Received: by 2002:a17:906:3284:b0:a36:f694:be6e with SMTP id
 4-20020a170906328400b00a36f694be6emr7034734ejw.12.1707126848650; 
 Mon, 05 Feb 2024 01:54:08 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWCPzKFfAhhJ41hdsmyVJAvb8kOY9o3FT7Fnc7AwUM5VLqzclTbwb6QEwpxKpNlk7zlO2OApfcc+VPjfN15mnpKLjccP8lT1WuHqj78bGKSGN8wg0szywULkVke7t0CTNrrEKXRNQhIqNhFwPmaAOVcaGTI2Rut7Is54EAbYL2+5IXaKAiF2HSYHwU73qmwpPFB4ECotfBMEdgKK9tzgKbqdObh2BbSwF5x6wMDw4YukFQq8DDT4IacuYYiRXjTQVt94nOhT4psdKUeRw13pCIRdhfUlybomaMu1+nz/6Txqh3mPuvIWoeEmX/2OpgR3+rrR84KnTa3EpjRwtwRLvkFvSzFQtbS6c0hB04H9E1Rs8H341C3txSY9jqzxvuNZgNCdWyN7bNAWeuGY6t7nEnI/ht4SVghEZ//OeN0uRcsCrBsK8sAjVEVWqjSTJ1WYM7Qmv8EieibM3EgfaOyKimrAO9exTNJJN3eSMfla90wO7wCH6hdahTBC18tvGmgfBJspXsLo/Cc3Uk=
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1709061b4500b00a378377030csm1893902ejg.41.2024.02.05.01.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 01:54:07 -0800 (PST)
Message-ID: <82b39cc1-ac66-487d-ac78-1fe596cdfd98@redhat.com>
Date: Mon, 5 Feb 2024 10:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/14] drm: Add a driver for CSF-based Mali GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Andy Yan <andyshrk@163.com>
Cc: dri-devel@lists.freedesktop.org, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>,
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?=
 <peron.clem@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
 <1d4f82bc.2992.18d54856f45.Coremail.andyshrk@163.com>
 <20240129114147.43e5b865@collabora.com>
 <1554e55.29c.18d71ae9b6c.Coremail.andyshrk@163.com>
 <20240205100321.0321a208@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240205100321.0321a208@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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

On 2/5/24 10:03, Boris Brezillon wrote:
> +Danilo for the panthor gpuvm-needs update.
> 
> On Sun, 4 Feb 2024 09:14:44 +0800 (CST)
> "Andy Yan" <andyshrk@163.com> wrote:
> 
>> Hi Boris：
>> I saw this warning sometimes（Run on a armbain based bookworm），not sure is a know issue or something else。
>> [15368.293031] systemd-journald[715]: Received client request to relinquish /var/log/journal/1bc4a340506142af9bd31a6a3d2170ba access.
>> [37743.040737] ------------[ cut here ]------------
>> [37743.040764] panthor fb000000.gpu: drm_WARN_ON(shmem->pages_use_count)
>> [37743.040890] WARNING: CPU: 2 PID: 5702 at drivers/gpu/drm/drm_gem_shmem_helper.c:158 drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
>> [37743.040929] Modules linked in: joydev rfkill sunrpc lz4hc lz4 zram binfmt_misc hantro_vpu crct10dif_ce v4l2_vp9 v4l2_h264 snd_soc_simple_amplifier v4l2_mem2mem videobuf2_dma_contig snd_soc_es8328_i2c videobuf2_memops rk_crypto2 snd_soc_es8328 videobuf2_v4l2 sm3_generic videodev crypto_engine sm3 rockchip_rng videobuf2_common nvmem_rockchip_otp snd_soc_rockchip_i2s_tdm snd_soc_hdmi_codec snd_soc_simple_card mc snd_soc_simple_card_utils snd_soc_core snd_compress ac97_bus snd_pcm_dmaengine snd_pcm snd_timer snd soundcore dm_mod ip_tables x_tables autofs4 dw_hdmi_qp_i2s_audio dw_hdmi_qp_cec rk808_regulator rockchipdrm dw_mipi_dsi dw_hdmi_qp dw_hdmi analogix_dp drm_dma_helper fusb302 display_connector rk8xx_spi drm_display_helper phy_rockchip_snps_pcie3 phy_rockchip_samsung_hdptx_hdmi panthor tcpm rk8xx_core cec drm_gpuvm gpu_sched drm_kms_helper drm_shmem_helper drm_exec r8169 drm pwm_bl adc_keys
>> [37743.041108] CPU: 2 PID: 5702 Comm: kworker/u16:8 Not tainted 6.8.0-rc1-edge-rockchip-rk3588 #2
>> [37743.041115] Hardware name: Rockchip RK3588 EVB1 V10 Board (DT)
>> [37743.041120] Workqueue: panthor-cleanup panthor_vm_bind_job_cleanup_op_ctx_work [panthor]
>> [37743.041151] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> [37743.041157] pc : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
>> [37743.041169] lr : drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
>> [37743.041181] sp : ffff80008d37bcc0
>> [37743.041184] x29: ffff80008d37bcc0 x28: ffff800081d379c0 x27: ffff800081d37000
>> [37743.041196] x26: ffff00019909a280 x25: ffff00019909a2c0 x24: ffff0001017a4c05
>> [37743.041206] x23: dead000000000100 x22: dead000000000122 x21: ffff0001627ac1a0
>> [37743.041217] x20: 0000000000000000 x19: ffff0001627ac000 x18: 0000000000000000
>> [37743.041227] x17: 000000040044ffff x16: 005000f2b5503510 x15: fffffffffff91b77
>> [37743.041238] x14: 0000000000000001 x13: 00000000000003c5 x12: 00000000ffffffea
>> [37743.041248] x11: 00000000ffffdfff x10: 00000000ffffdfff x9 : ffff800081e0e818
>> [37743.041259] x8 : 000000000002ffe8 x7 : c0000000ffffdfff x6 : 00000000000affa8
>> [37743.041269] x5 : 0000000000001fff x4 : 0000000000000000 x3 : ffff8000819a6008
>> [37743.041279] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00018465e900
>> [37743.041290] Call trace:
>> [37743.041293]  drm_gem_shmem_free+0x144/0x14c [drm_shmem_helper]
>> [37743.041306]  panthor_gem_free_object+0x24/0xa0 [panthor]
>> [37743.041321]  drm_gem_object_free+0x1c/0x30 [drm]
>> [37743.041452]  panthor_vm_bo_put+0xc4/0x12c [panthor]
>> [37743.041475]  panthor_vm_cleanup_op_ctx.constprop.0+0xb0/0x104 [panthor]
>> [37743.041491]  panthor_vm_bind_job_cleanup_op_ctx_work+0x28/0xd0 [panthor]
> 
> Ok, I think I found the culprit: there's a race between
> the drm_gpuvm_bo_put() call in panthor_vm_bo_put() and the list
> iteration done by drm_gpuvm_prepare_objects(). Because we're not
> setting DRM_GPUVM_RESV_PROTECTED, the code goes through the 'lockless'
> iteration loop, and takes/release a vm_bo ref at each iteration. This
> means our 'were we the last vm_bo user?' test in panthor_vm_bo_put()
> might return false even if we were actually the last user, and when
> for_each_vm_bo_in_list() releases the ref it acquired, it not only leaks
> the pin reference, thus leaving GEM pages pinned (which explains this
> WARN_ON() splat), but it also calls drm_gpuvm_bo_destroy() in a path
> where we don't hold the GPUVA list lock, which is bad.

IIUC, GPUVM generally behaves correctly. It's just that the return value
of drm_gpuvm_bo_put() needs to be treated with care.

Maybe we should extend c50a291d621a ("drm/gpuvm: Let drm_gpuvm_bo_put()
report when the vm_bo object is destroyed") by a note explaining this
unexpected case, or, if not required anymore, simply revert the patch.

> 
> Long story short, I'll have to use DRM_GPUVM_RESV_PROTECTED, which is
> fine because I'm deferring vm_bo removal to a work where taking the VM
> resv lock is allowed. Since I was the one asking for this lockless
> iterator in the first place, I wonder if we should kill that and make
> DRM_GPUVM_RESV_PROTECTED the default (this would greatly simplify
> the code). AFAICT, The PowerVR driver shouldn't be impacted because it's
> using drm_gpuvm in synchronous mode only, and Xe already uses the
> resv-protected mode. That leaves Nouveau, but IIRC, it's also doing VM
> updates in the ioctl path.
> 
> Danilo, any opinions?

I agree that we should remove it once we got enough evidence that updating
the VA space in the asynchronous path isn't going to be a thing. I'm not
entirely sure, whether we'll attempt to re-work Nouveau, but I'd like to try
this approach with Nova. Hence, I'd still like to leave it in for a while.

OOC, knowing that you went a little back and forth with one or the other
approach, last I heard was that using DRM_GPUVM_RESV_PROTECTED didn't work
out well with shmem buffers. How did you fix it?

> 
> Andy, I pushed a new version to the panthor-next [1] and
> panthor-next+rk3588 [2] branches. The fix I'm talking about is [3], but
> you probably want to consider taking all the fixups in your branch.
> 
> Regards,
> 
> Boris
> 
> [1]https://gitlab.freedesktop.org/panfrost/linux/-/commits/panthor-next
> [2]https://gitlab.freedesktop.org/panfrost/linux/-/commits/panthor-next+rk3588
> [3]https://gitlab.freedesktop.org/panfrost/linux/-/commit/df48c09662a403275e76e679ee004085badea7c1
> 

