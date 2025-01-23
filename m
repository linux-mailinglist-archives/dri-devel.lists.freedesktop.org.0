Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27070A1AA49
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 20:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4294110E294;
	Thu, 23 Jan 2025 19:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="db9Z2wTV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643AE10E085
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 19:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=racBWyqS9eT6XrOD8oNXxYZvbTd9/X/VdEEMreyBhjM=; b=db9Z2wTVF/uVhHAOR21aCv6LwV
 c9zhnlcoXauLZ+WnFezUlGFiSdBMM/w/QynOIq1Fe3OdRSwZWK3CiwS3WYijnqmcvvUru8P273yvy
 A97YAumxWo+NJrSEnH9vXbN5xr6yktBkM/FjeFbnghr/mRJKy5eDI5BwdyfLVwc2KYC99wB6LsokS
 /IgjymNUldMwaEUrvMk1P7t3JnTwllghxCX1I0zNUMedb57y32RR2bZA7W+h9/aDi+xokTpOJP6yD
 e+/kq1N80X3yLbG3xnAOM2mnH5KYhwdvrFlTQUSzEpmhqtX525J5JY8+uQloc6QpIzGvKhLiXHGfz
 30H0rqVg==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tb2k6-001MFF-8e; Thu, 23 Jan 2025 20:19:54 +0100
Message-ID: <d78f21eb-b258-4d6a-85b4-76a809079e3d@igalia.com>
Date: Thu, 23 Jan 2025 16:19:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Assign job pointer to NULL before signaling the
 fence
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>, Phil Elwell <phil@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 stable@vger.kernel.org
References: <20250123012403.20447-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250123012403.20447-1-mcanal@igalia.com>
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

On 22/01/25 22:24, Maíra Canal wrote:
> In commit e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL
> after job completion"), we introduced a change to assign the job pointer
> to NULL after completing a job, indicating job completion.
> 
> However, this approach created a race condition between the DRM
> scheduler workqueue and the IRQ execution thread. As soon as the fence is
> signaled in the IRQ execution thread, a new job starts to be executed.
> This results in a race condition where the IRQ execution thread sets the
> job pointer to NULL simultaneously as the `run_job()` function assigns
> a new job to the pointer.
> 
> This race condition can lead to a NULL pointer dereference if the IRQ
> execution thread sets the job pointer to NULL after `run_job()` assigns
> it to the new job. When the new job completes and the GPU emits an
> interrupt, `v3d_irq()` is triggered, potentially causing a crash.
> 
> [  466.310099] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000c0
> [  466.318928] Mem abort info:
> [  466.321723]   ESR = 0x0000000096000005
> [  466.325479]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  466.330807]   SET = 0, FnV = 0
> [  466.333864]   EA = 0, S1PTW = 0
> [  466.337010]   FSC = 0x05: level 1 translation fault
> [  466.341900] Data abort info:
> [  466.344783]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> [  466.350285]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  466.355350]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  466.360677] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000089772000
> [  466.367140] [00000000000000c0] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [  466.375875] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> [  466.382163] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer snd_seq snd_seq_device algif_hash algif_skcipher af_alg bnep binfmt_misc vc4 snd_soc_hdmi_codec drm_display_helper cec brcmfmac_wcc spidev rpivid_hevc(C) drm_client_lib brcmfmac hci_uart drm_dma_helper pisp_be btbcm brcmutil snd_soc_core aes_ce_blk v4l2_mem2mem bluetooth aes_ce_cipher snd_compress videobuf2_dma_contig ghash_ce cfg80211 gf128mul snd_pcm_dmaengine videobuf2_memops ecdh_generic sha2_ce ecc videobuf2_v4l2 snd_pcm v3d sha256_arm64 rfkill videodev snd_timer sha1_ce libaes gpu_sched snd videobuf2_common sha1_generic drm_shmem_helper mc rp1_pio drm_kms_helper raspberrypi_hwmon spi_bcm2835 gpio_keys i2c_brcmstb rp1 raspberrypi_gpiomem rp1_mailbox rp1_adc nvmem_rmem uio_pdrv_genirq uio i2c_dev drm ledtrig_pattern drm_panel_orientation_quirks backlight fuse dm_mod ip_tables x_tables ipv6
> [  466.458429] CPU: 0 UID: 1000 PID: 2008 Comm: chromium Tainted: G         C         6.13.0-v8+ #18
> [  466.467336] Tainted: [C]=CRAP
> [  466.470306] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> [  466.476157] pstate: 404000c9 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  466.483143] pc : v3d_irq+0x118/0x2e0 [v3d]
> [  466.487258] lr : __handle_irq_event_percpu+0x60/0x228
> [  466.492327] sp : ffffffc080003ea0
> [  466.495646] x29: ffffffc080003ea0 x28: ffffff80c0c94200 x27: 0000000000000000
> [  466.502807] x26: ffffffd08dd81d7b x25: ffffff80c0c94200 x24: ffffff8003bdc200
> [  466.509969] x23: 0000000000000001 x22: 00000000000000a7 x21: 0000000000000000
> [  466.517130] x20: ffffff8041bb0000 x19: 0000000000000001 x18: 0000000000000000
> [  466.524291] x17: ffffffafadfb0000 x16: ffffffc080000000 x15: 0000000000000000
> [  466.531452] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  466.538613] x11: 0000000000000000 x10: 0000000000000000 x9 : ffffffd08c527eb0
> [  466.545777] x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> [  466.552941] x5 : ffffffd08c4100d0 x4 : ffffffafadfb0000 x3 : ffffffc080003f70
> [  466.560102] x2 : ffffffc0829e8058 x1 : 0000000000000001 x0 : 0000000000000000
> [  466.567263] Call trace:
> [  466.569711]  v3d_irq+0x118/0x2e0 [v3d] (P)
> [  466.573826]  __handle_irq_event_percpu+0x60/0x228
> [  466.578546]  handle_irq_event+0x54/0xb8
> [  466.582391]  handle_fasteoi_irq+0xac/0x240
> [  466.586498]  generic_handle_domain_irq+0x34/0x58
> [  466.591128]  gic_handle_irq+0x48/0xd8
> [  466.594798]  call_on_irq_stack+0x24/0x58
> [  466.598730]  do_interrupt_handler+0x88/0x98
> [  466.602923]  el0_interrupt+0x44/0xc0
> [  466.606508]  __el0_irq_handler_common+0x18/0x28
> [  466.611050]  el0t_64_irq_handler+0x10/0x20
> [  466.615156]  el0t_64_irq+0x198/0x1a0
> [  466.618740] Code: 52800035 3607faf3 f9442e80 52800021 (f9406018)
> [  466.624853] ---[ end trace 0000000000000000 ]---
> [  466.629483] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [  466.636384] SMP: stopping secondary CPUs
> [  466.640320] Kernel Offset: 0x100c400000 from 0xffffffc080000000
> [  466.646259] PHYS_OFFSET: 0x0
> [  466.649141] CPU features: 0x100,00000170,00901250,0200720b
> [  466.654644] Memory Limit: none
> [  466.657706] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
> 
> Fix the crash by assigning the job pointer to NULL before signaling the
> fence. This ensures that the job pointer is cleared before any new job
> starts execution, preventing the race condition and the NULL pointer
> dereference crash.
> 
> Cc: stable@vger.kernel.org
> Fixes: e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL after job completion")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---

Applied to misc/kernel.git (drm-misc-next-fixes).

Best Regards,
- Maíra
