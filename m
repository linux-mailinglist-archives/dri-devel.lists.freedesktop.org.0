Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69098ACECC9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 11:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DAB10E104;
	Thu,  5 Jun 2025 09:27:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UDS4Ey5b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90EF710E104
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0C9stOe9RN4H1EQdBa5SHVsy2V5RbQVPbAs6WsVd8c=; b=UDS4Ey5bLPQxPj5qcEGYOFawKt
 rpscUHm5jXmL+/JDi+ZZS/0eJzsotq+5AbnpA0C+t9/8V+dq4QT8mp+gABDhICN9l2133+YiZDGAh
 l/XvGCFoDTv7Z8E4O9RyLsw7JmG7/GEIcz/67wEU5mkDSHbxTnAx7ByyvRy+9cydDe5dvc3YXdK/X
 E1cJ81Mvu12g9ZZp0vHeFPLt25Vx5EIhyo7DDYu1oRZkeOb6ZN/GRjamiVWsnOZ9aIX4B6F1+/x86
 6uJtf2Epxm21eGLpm5yZKEFCV9Bia/Zp/K1XC1t7kGgdbG/PYZIaI14fWKVcLQPIuz6iIeTQ6j4p9
 iiriZk0A==;
Received: from 170.red-81-39-42.dynamicip.rima-tde.net ([81.39.42.170]
 helo=[10.0.21.177]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uN6t1-00HS66-O1; Thu, 05 Jun 2025 11:27:47 +0200
Message-ID: <26c90825-35d3-4362-9eaa-28316c7b6b6b@igalia.com>
Date: Thu, 5 Jun 2025 11:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/v3d: Avoid NULL pointer dereference in
 `v3d_job_update_stats()`
Content-Language: en-US
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 stable@vger.kernel.org
References: <20250602151451.10161-1-mcanal@igalia.com>
From: Chema Casanova <jmcasanova@igalia.com>
Organization: Igalia
In-Reply-To: <20250602151451.10161-1-mcanal@igalia.com>
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

This patch is:

Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

But I have a question. Could we see this scenario of the process finishing
before other access to job->file->driver_priv in other parts of the v3d 
driver?

Regards,

Chema

El 2/6/25 a las 17:14, Maíra Canal escribió:
> The following kernel Oops was recently reported by Mesa CI:
>
> [  800.139824] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000588
> [  800.148619] Mem abort info:
> [  800.151402]   ESR = 0x0000000096000005
> [  800.155141]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  800.160444]   SET = 0, FnV = 0
> [  800.163488]   EA = 0, S1PTW = 0
> [  800.166619]   FSC = 0x05: level 1 translation fault
> [  800.171487] Data abort info:
> [  800.174357]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
> [  800.179832]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  800.184873]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  800.190176] user pgtable: 4k pages, 39-bit VAs, pgdp=00000001014c2000
> [  800.196607] [0000000000000588] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [  800.205305] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
> [  800.211564] Modules linked in: vc4 snd_soc_hdmi_codec drm_display_helper v3d cec gpu_sched drm_dma_helper drm_shmem_helper drm_kms_helper drm drm_panel_orientation_quirks snd_soc_core snd_compress snd_pcm_dmaengine snd_pcm i2c_brcmstb snd_timer snd backlight
> [  800.234448] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.12.25+rpt-rpi-v8 #1  Debian 1:6.12.25-1+rpt1
> [  800.244182] Hardware name: Raspberry Pi 4 Model B Rev 1.4 (DT)
> [  800.250005] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  800.256959] pc : v3d_job_update_stats+0x60/0x130 [v3d]
> [  800.262112] lr : v3d_job_update_stats+0x48/0x130 [v3d]
> [  800.267251] sp : ffffffc080003e60
> [  800.270555] x29: ffffffc080003e60 x28: ffffffd842784980 x27: 0224012000000000
> [  800.277687] x26: ffffffd84277f630 x25: ffffff81012fd800 x24: 0000000000000020
> [  800.284818] x23: ffffff8040238b08 x22: 0000000000000570 x21: 0000000000000158
> [  800.291948] x20: 0000000000000000 x19: ffffff8040238000 x18: 0000000000000000
> [  800.299078] x17: ffffffa8c1bd2000 x16: ffffffc080000000 x15: 0000000000000000
> [  800.306208] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> [  800.313338] x11: 0000000000000040 x10: 0000000000001a40 x9 : ffffffd83b39757c
> [  800.320468] x8 : ffffffd842786420 x7 : 7fffffffffffffff x6 : 0000000000ef32b0
> [  800.327598] x5 : 00ffffffffffffff x4 : 0000000000000015 x3 : ffffffd842784980
> [  800.334728] x2 : 0000000000000004 x1 : 0000000000010002 x0 : 000000ba4c0ca382
> [  800.341859] Call trace:
> [  800.344294]  v3d_job_update_stats+0x60/0x130 [v3d]
> [  800.349086]  v3d_irq+0x124/0x2e0 [v3d]
> [  800.352835]  __handle_irq_event_percpu+0x58/0x218
> [  800.357539]  handle_irq_event+0x54/0xb8
> [  800.361369]  handle_fasteoi_irq+0xac/0x240
> [  800.365458]  handle_irq_desc+0x48/0x68
> [  800.369200]  generic_handle_domain_irq+0x24/0x38
> [  800.373810]  gic_handle_irq+0x48/0xd8
> [  800.377464]  call_on_irq_stack+0x24/0x58
> [  800.381379]  do_interrupt_handler+0x88/0x98
> [  800.385554]  el1_interrupt+0x34/0x68
> [  800.389123]  el1h_64_irq_handler+0x18/0x28
> [  800.393211]  el1h_64_irq+0x64/0x68
> [  800.396603]  default_idle_call+0x3c/0x168
> [  800.400606]  do_idle+0x1fc/0x230
> [  800.403827]  cpu_startup_entry+0x40/0x50
> [  800.407742]  rest_init+0xe4/0xf0
> [  800.410962]  start_kernel+0x5e8/0x790
> [  800.414616]  __primary_switched+0x80/0x90
> [  800.418622] Code: 8b170277 8b160296 11000421 b9000861 (b9401ac1)
> [  800.424707] ---[ end trace 0000000000000000 ]---
> [  800.457313] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
>
> This issue happens when the file descriptor is closed before the jobs
> submitted by it are completed. When the job completes, we update the
> global GPU stats and the per-fd GPU stats, which are exposed through
> fdinfo. If the file descriptor was closed, then the struct `v3d_file_priv`
> and its stats were already freed and we can't update the per-fd stats.
>
> Therefore, if the file descriptor was already closed, don't update the
> per-fd GPU stats, only update the global ones.
>
> Cc: stable@vger.kernel.org # v6.12+
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_sched.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
> index 466d28ceee28..5ed676304964 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -199,7 +199,6 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   	struct v3d_dev *v3d = job->v3d;
>   	struct v3d_file_priv *file = job->file->driver_priv;
>   	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
> -	struct v3d_stats *local_stats = &file->stats[queue];
>   	u64 now = local_clock();
>   	unsigned long flags;
>   
> @@ -209,7 +208,12 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
>   	else
>   		preempt_disable();
>   
> -	v3d_stats_update(local_stats, now);
> +	/* Don't update the local stats if the file context has already closed */
> +	if (file)
> +		v3d_stats_update(&file->stats[queue], now);
> +	else
> +		drm_dbg(&v3d->drm, "The file descriptor was closed before job completion\n");
> +
>   	v3d_stats_update(global_stats, now);
>   
>   	if (IS_ENABLED(CONFIG_LOCKDEP))
