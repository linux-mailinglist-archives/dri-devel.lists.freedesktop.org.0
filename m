Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B065A992CB7
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 15:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D39810E382;
	Mon,  7 Oct 2024 13:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Sl50zaRk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D2D10E382
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=041zFqYLwT8s4gme8PM0klQKTzy1BVSmavzTrbWNbi4=; b=Sl50zaRk3vUYg2s9ScO8sWfRxU
 lOitzhHe2tAiZ2l5Oa+tbF9AacLzNqD1hTcTQCk3fxgXbbpS45ybPHHZ0aR1ytbnABpehq+ADItQC
 d2kwhM09Kr5Oce28r97rxNMMmQ9J2YHHaz7taD8YB5e87EOM2e2s4IqyMmMddxL8dcqJgJwyLEQsP
 sP3W+TgV9Mr03m39+B7lONVdu9ZmGL1wQADx3gBJOUvZaz/2owRhkH0M9TajPp6yfEuEY611WRpCR
 hJwXGJALXxGzv3PJSdW3s8905Z/H+WXXjL6Q1cyr9XhwXp6HM+4RWUV1oGOwyHWcSsFDB5rsePHoI
 bwEgFHBg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1sxnVW-00690F-EP; Mon, 07 Oct 2024 15:10:38 +0200
Message-ID: <7b622d38-ca2b-43a8-93be-b2cc5b00aaa0@igalia.com>
Date: Mon, 7 Oct 2024 10:10:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Stop the active perfmon before being destroyed
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 "Juan A . Suarez Romero" <jasuarez@igalia.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 stable@vger.kernel.org
References: <20241004130625.918580-2-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20241004130625.918580-2-mcanal@igalia.com>
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

On 10/4/24 10:02, Maíra Canal wrote:
> When running `kmscube` with one or more performance monitors enabled
> via `GALLIUM_HUD`, the following kernel panic can occur:
> 
> [   55.008324] Unable to handle kernel paging request at virtual address 00000000052004a4
> [   55.008368] Mem abort info:
> [   55.008377]   ESR = 0x0000000096000005
> [   55.008387]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   55.008402]   SET = 0, FnV = 0
> [   55.008412]   EA = 0, S1PTW = 0
> [   55.008421]   FSC = 0x05: level 1 translation fault
> [   55.008434] Data abort info:
> [   55.008442]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> [   55.008455]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   55.008467]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   55.008481] user pgtable: 4k pages, 39-bit VAs, pgdp=00000001046c6000
> [   55.008497] [00000000052004a4] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [   55.008525] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> [   55.008542] Modules linked in: rfcomm [...] vc4 v3d snd_soc_hdmi_codec drm_display_helper
> gpu_sched drm_shmem_helper cec drm_dma_helper drm_kms_helper i2c_brcmstb
> drm drm_panel_orientation_quirks snd_soc_core snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd backlight
> [   55.008799] CPU: 2 PID: 166 Comm: v3d_bin Tainted: G         C         6.6.47+rpt-rpi-v8 #1  Debian 1:6.6.47-1+rpt1
> [   55.008824] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
> [   55.008838] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   55.008855] pc : __mutex_lock.constprop.0+0x90/0x608
> [   55.008879] lr : __mutex_lock.constprop.0+0x58/0x608
> [   55.008895] sp : ffffffc080673cf0
> [   55.008904] x29: ffffffc080673cf0 x28: 0000000000000000 x27: ffffff8106188a28
> [   55.008926] x26: ffffff8101e78040 x25: ffffff8101baa6c0 x24: ffffffd9d989f148
> [   55.008947] x23: ffffffda1c2a4008 x22: 0000000000000002 x21: ffffffc080673d38
> [   55.008968] x20: ffffff8101238000 x19: ffffff8104f83188 x18: 0000000000000000
> [   55.008988] x17: 0000000000000000 x16: ffffffda1bd04d18 x15: 00000055bb08bc90
> [   55.009715] x14: 0000000000000000 x13: 0000000000000000 x12: ffffffda1bd4cbb0
> [   55.010433] x11: 00000000fa83b2da x10: 0000000000001a40 x9 : ffffffda1bd04d04
> [   55.011162] x8 : ffffff8102097b80 x7 : 0000000000000000 x6 : 00000000030a5857
> [   55.011880] x5 : 00ffffffffffffff x4 : 0300000005200470 x3 : 0300000005200470
> [   55.012598] x2 : ffffff8101238000 x1 : 0000000000000021 x0 : 0300000005200470
> [   55.013292] Call trace:
> [   55.013959]  __mutex_lock.constprop.0+0x90/0x608
> [   55.014646]  __mutex_lock_slowpath+0x1c/0x30
> [   55.015317]  mutex_lock+0x50/0x68
> [   55.015961]  v3d_perfmon_stop+0x40/0xe0 [v3d]
> [   55.016627]  v3d_bin_job_run+0x10c/0x2d8 [v3d]
> [   55.017282]  drm_sched_main+0x178/0x3f8 [gpu_sched]
> [   55.017921]  kthread+0x11c/0x128
> [   55.018554]  ret_from_fork+0x10/0x20
> [   55.019168] Code: f9400260 f1001c1f 54001ea9 927df000 (b9403401)
> [   55.019776] ---[ end trace 0000000000000000 ]---
> [   55.020411] note: v3d_bin[166] exited with preempt_count 1
> 
> This issue arises because, upon closing the file descriptor (which happens
> when we interrupt `kmscube`), the active performance monitor is not
> stopped. Although all perfmons are destroyed in `v3d_perfmon_close_file()`,
> the active performance monitor's pointer (`v3d->active_perfmon`) is still
> retained.
> 
> If `kmscube` is run again, the driver will attempt to stop the active
> performance monitor using the stale pointer in `v3d->active_perfmon`.
> However, this pointer is no longer valid because the previous process has
> already terminated, and all performance monitors associated with it have
> been destroyed and freed.
> 
> To fix this, when the active performance monitor belongs to a given
> process, explicitly stop it before destroying and freeing it.
> 
> Cc: <stable@vger.kernel.org> # v5.15+
> Closes: https://github.com/raspberrypi/linux/issues/6389
> Fixes: 26a4dc29b74a ("drm/v3d: Expose performance counters to userspace")
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_perfmon.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

Applied to misc/kernel.git (drm-misc-fixes).

Best Regards,
- Maíra
