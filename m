Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4247EA19EB8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FA010E0FA;
	Thu, 23 Jan 2025 07:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VtD9GGru";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139D10E0FA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QPg7JT99Xl+wC+3kyRout8q7754kvYflrWqNPW706PU=; b=VtD9GGruXNBvWNfmnYhkrjacmt
 J9YAsmwEJ18X9qKh+5lqXYyjjFOE6TgJC4nmkStUCiRIkZQRIduMheEzg5sEUMBcb2qkMCPYWoqP0
 7Bn0BENkplgxQE/dCd+7TiZ8G6H8qk+KrJ9hZmCMdpARXLl8M5tkYEljPyV2moCf6nzjxpeg398CO
 OkFpYkgxg47oudDUZAJpfXXDLJUWt6VVyQTMU6wViEiC9Nj8RNCMTnTWp0ooMAbAV9fjX4/P1w8G3
 9dDqpP0PeAP7DsugL3gCBWoXzmm9bVAYD+VlHDYItq1YfhPMB7rGYUXQd5BtrSf6VmMzsC1xQUxby
 TWozBHWA==;
Received: from [47.63.138.17] (helo=[192.168.0.17])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tarOC-0015pd-75; Thu, 23 Jan 2025 08:12:32 +0100
Message-ID: <b60d2a9a374a278256fe290a2a389f59d3062754.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Assign job pointer to NULL before signaling
 the fence
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, Phil Elwell
 <phil@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com, 
 stable@vger.kernel.org
Date: Thu, 23 Jan 2025 08:12:19 +0100
In-Reply-To: <20250123012403.20447-1-mcanal@igalia.com>
References: <20250123012403.20447-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
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

Looks good to me:

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>

El mi=C3=A9, 22-01-2025 a las 22:24 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> In commit e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL
> after job completion"), we introduced a change to assign the job
> pointer
> to NULL after completing a job, indicating job completion.
>=20
> However, this approach created a race condition between the DRM
> scheduler workqueue and the IRQ execution thread. As soon as the
> fence is
> signaled in the IRQ execution thread, a new job starts to be
> executed.
> This results in a race condition where the IRQ execution thread sets
> the
> job pointer to NULL simultaneously as the `run_job()` function
> assigns
> a new job to the pointer.
>=20
> This race condition can lead to a NULL pointer dereference if the IRQ
> execution thread sets the job pointer to NULL after `run_job()`
> assigns
> it to the new job. When the new job completes and the GPU emits an
> interrupt, `v3d_irq()` is triggered, potentially causing a crash.
>=20
> [=C2=A0 466.310099] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000000000c0
> [=C2=A0 466.318928] Mem abort info:
> [=C2=A0 466.321723]=C2=A0=C2=A0 ESR =3D 0x0000000096000005
> [=C2=A0 466.325479]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 32=
 bits
> [=C2=A0 466.330807]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0 466.333864]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0 466.337010]=C2=A0=C2=A0 FSC =3D 0x05: level 1 translation fault
> [=C2=A0 466.341900] Data abort info:
> [=C2=A0 466.344783]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0=
x00000000
> [=C2=A0 466.350285]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess=
 =3D 0
> [=C2=A0 466.355350]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0,=
 Xs =3D 0
> [=C2=A0 466.360677] user pgtable: 4k pages, 39-bit VAs,
> pgdp=3D0000000089772000
> [=C2=A0 466.367140] [00000000000000c0] pgd=3D0000000000000000,
> p4d=3D0000000000000000, pud=3D0000000000000000
> [=C2=A0 466.375875] Internal error: Oops: 0000000096000005 [#1] PREEMPT
> SMP
> [=C2=A0 466.382163] Modules linked in: rfcomm snd_seq_dummy snd_hrtimer
> snd_seq snd_seq_device algif_hash algif_skcipher af_alg bnep
> binfmt_misc vc4 snd_soc_hdmi_codec drm_display_helper cec
> brcmfmac_wcc spidev rpivid_hevc(C) drm_client_lib brcmfmac hci_uart
> drm_dma_helper pisp_be btbcm brcmutil snd_soc_core aes_ce_blk
> v4l2_mem2mem bluetooth aes_ce_cipher snd_compress
> videobuf2_dma_contig ghash_ce cfg80211 gf128mul snd_pcm_dmaengine
> videobuf2_memops ecdh_generic sha2_ce ecc videobuf2_v4l2 snd_pcm v3d
> sha256_arm64 rfkill videodev snd_timer sha1_ce libaes gpu_sched snd
> videobuf2_common sha1_generic drm_shmem_helper mc rp1_pio
> drm_kms_helper raspberrypi_hwmon spi_bcm2835 gpio_keys i2c_brcmstb
> rp1 raspberrypi_gpiomem rp1_mailbox rp1_adc nvmem_rmem
> uio_pdrv_genirq uio i2c_dev drm ledtrig_pattern
> drm_panel_orientation_quirks backlight fuse dm_mod ip_tables x_tables
> ipv6
> [=C2=A0 466.458429] CPU: 0 UID: 1000 PID: 2008 Comm: chromium Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.13.0-v8+ #18
> [=C2=A0 466.467336] Tainted: [C]=3DCRAP
> [=C2=A0 466.470306] Hardware name: Raspberry Pi 5 Model B Rev 1.0 (DT)
> [=C2=A0 466.476157] pstate: 404000c9 (nZcv daIF +PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [=C2=A0 466.483143] pc : v3d_irq+0x118/0x2e0 [v3d]
> [=C2=A0 466.487258] lr : __handle_irq_event_percpu+0x60/0x228
> [=C2=A0 466.492327] sp : ffffffc080003ea0
> [=C2=A0 466.495646] x29: ffffffc080003ea0 x28: ffffff80c0c94200 x27:
> 0000000000000000
> [=C2=A0 466.502807] x26: ffffffd08dd81d7b x25: ffffff80c0c94200 x24:
> ffffff8003bdc200
> [=C2=A0 466.509969] x23: 0000000000000001 x22: 00000000000000a7 x21:
> 0000000000000000
> [=C2=A0 466.517130] x20: ffffff8041bb0000 x19: 0000000000000001 x18:
> 0000000000000000
> [=C2=A0 466.524291] x17: ffffffafadfb0000 x16: ffffffc080000000 x15:
> 0000000000000000
> [=C2=A0 466.531452] x14: 0000000000000000 x13: 0000000000000000 x12:
> 0000000000000000
> [=C2=A0 466.538613] x11: 0000000000000000 x10: 0000000000000000 x9 :
> ffffffd08c527eb0
> [=C2=A0 466.545777] x8 : 0000000000000000 x7 : 0000000000000000 x6 :
> 0000000000000000
> [=C2=A0 466.552941] x5 : ffffffd08c4100d0 x4 : ffffffafadfb0000 x3 :
> ffffffc080003f70
> [=C2=A0 466.560102] x2 : ffffffc0829e8058 x1 : 0000000000000001 x0 :
> 0000000000000000
> [=C2=A0 466.567263] Call trace:
> [=C2=A0 466.569711]=C2=A0 v3d_irq+0x118/0x2e0 [v3d] (P)
> [=C2=A0 466.573826]=C2=A0 __handle_irq_event_percpu+0x60/0x228
> [=C2=A0 466.578546]=C2=A0 handle_irq_event+0x54/0xb8
> [=C2=A0 466.582391]=C2=A0 handle_fasteoi_irq+0xac/0x240
> [=C2=A0 466.586498]=C2=A0 generic_handle_domain_irq+0x34/0x58
> [=C2=A0 466.591128]=C2=A0 gic_handle_irq+0x48/0xd8
> [=C2=A0 466.594798]=C2=A0 call_on_irq_stack+0x24/0x58
> [=C2=A0 466.598730]=C2=A0 do_interrupt_handler+0x88/0x98
> [=C2=A0 466.602923]=C2=A0 el0_interrupt+0x44/0xc0
> [=C2=A0 466.606508]=C2=A0 __el0_irq_handler_common+0x18/0x28
> [=C2=A0 466.611050]=C2=A0 el0t_64_irq_handler+0x10/0x20
> [=C2=A0 466.615156]=C2=A0 el0t_64_irq+0x198/0x1a0
> [=C2=A0 466.618740] Code: 52800035 3607faf3 f9442e80 52800021 (f9406018)
> [=C2=A0 466.624853] ---[ end trace 0000000000000000 ]---
> [=C2=A0 466.629483] Kernel panic - not syncing: Oops: Fatal exception in
> interrupt
> [=C2=A0 466.636384] SMP: stopping secondary CPUs
> [=C2=A0 466.640320] Kernel Offset: 0x100c400000 from 0xffffffc080000000
> [=C2=A0 466.646259] PHYS_OFFSET: 0x0
> [=C2=A0 466.649141] CPU features: 0x100,00000170,00901250,0200720b
> [=C2=A0 466.654644] Memory Limit: none
> [=C2=A0 466.657706] ---[ end Kernel panic - not syncing: Oops: Fatal
> exception in interrupt ]---
>=20
> Fix the crash by assigning the job pointer to NULL before signaling
> the
> fence. This ensures that the job pointer is cleared before any new
> job
> starts execution, preventing the race condition and the NULL pointer
> dereference crash.
>=20
> Cc: stable@vger.kernel.org
> Fixes: e4b5ccd392b9 ("drm/v3d: Ensure job pointer is set to NULL
> after job completion")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_irq.c | 16 ++++++++++++----
> =C2=A01 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c
> b/drivers/gpu/drm/v3d/v3d_irq.c
> index da203045df9b..72b6a119412f 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -107,8 +107,10 @@ v3d_irq(int irq, void *arg)
> =C2=A0
> =C2=A0		v3d_job_update_stats(&v3d->bin_job->base, V3D_BIN);
> =C2=A0		trace_v3d_bcl_irq(&v3d->drm, fence->seqno);
> -		dma_fence_signal(&fence->base);
> +
> =C2=A0		v3d->bin_job =3D NULL;
> +		dma_fence_signal(&fence->base);
> +
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> =C2=A0
> @@ -118,8 +120,10 @@ v3d_irq(int irq, void *arg)
> =C2=A0
> =C2=A0		v3d_job_update_stats(&v3d->render_job->base,
> V3D_RENDER);
> =C2=A0		trace_v3d_rcl_irq(&v3d->drm, fence->seqno);
> -		dma_fence_signal(&fence->base);
> +
> =C2=A0		v3d->render_job =3D NULL;
> +		dma_fence_signal(&fence->base);
> +
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> =C2=A0
> @@ -129,8 +133,10 @@ v3d_irq(int irq, void *arg)
> =C2=A0
> =C2=A0		v3d_job_update_stats(&v3d->csd_job->base, V3D_CSD);
> =C2=A0		trace_v3d_csd_irq(&v3d->drm, fence->seqno);
> -		dma_fence_signal(&fence->base);
> +
> =C2=A0		v3d->csd_job =3D NULL;
> +		dma_fence_signal(&fence->base);
> +
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> =C2=A0
> @@ -167,8 +173,10 @@ v3d_hub_irq(int irq, void *arg)
> =C2=A0
> =C2=A0		v3d_job_update_stats(&v3d->tfu_job->base, V3D_TFU);
> =C2=A0		trace_v3d_tfu_irq(&v3d->drm, fence->seqno);
> -		dma_fence_signal(&fence->base);
> +
> =C2=A0		v3d->tfu_job =3D NULL;
> +		dma_fence_signal(&fence->base);
> +
> =C2=A0		status =3D IRQ_HANDLED;
> =C2=A0	}
> =C2=A0

