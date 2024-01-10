Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EBD8293D3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 07:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC81310E578;
	Wed, 10 Jan 2024 06:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3D610E578
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 06:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8LT9BL57BeWZdSHKUkKlawzK9MVVsWh5Fq4fsnl/h8Q=; b=PcvnvzoeFE2gNKC1e7k5Ehc87e
 1orSTQvPSgulrtXe/AgvpU76rBMR6DlOuhEix2oqpYAMpNSFzwHPuq5Jt6SEmqCMERIiqmCa8Shvu
 kqs0QR4wkrmO/P3PnnePNXNOhXk4mYLwdCBxIP8bLgXW+Q3POerHI/l5u0+xWzVGi9SKZnEHALp1G
 dLZMNkE0iECcK7Fbj8ABZorRJTzdFCcpnVTDddSEWcdJM9tH8gu1ORnRWEYWsrwyCidlAGk0c37s0
 //ksXjwYDZOHDdU73i6UbcQec+V/FW49Ro3HDH9IdijK1zzSBxJeLWgmyBpi5BOvQge/CRGxW2K0J
 V2/p6MWw==;
Received: from 193.48.60.213.dynamic.reverse-mundo-r.com ([213.60.48.193]
 helo=[192.168.0.101]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rNSOV-004rhA-IT; Wed, 10 Jan 2024 07:48:55 +0100
Message-ID: <b067ade09929bb3fa6a2fea88f83196b11354553.camel@igalia.com>
Subject: Re: [PATCH] drm/v3d: Free the job and assign it to NULL if
 initialization fails
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 10 Jan 2024 07:48:55 +0100
In-Reply-To: <20240109142857.1122704-1-mcanal@igalia.com>
References: <20240109142857.1122704-1-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think this is fine, but I was wondering if it would be simpler and
easier to just remove the sched cleanup from v3d_job_init and instead
always rely on callers to eventually call v3d_job_cleanup for fail
paths, where we are already calling v3d_job_cleanup.

Iago

El mar, 09-01-2024 a las 11:28 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> Currently, if `v3d_job_init()` fails (e.g. in the IGT test "bad-in-
> sync",
> where we submit an invalid in-sync to the IOCTL), then we end up with
> the following NULL pointer dereference:
>=20
> [=C2=A0=C2=A0 34.146279] Unable to handle kernel NULL pointer dereference=
 at
> virtual address 0000000000000078
> [=C2=A0=C2=A0 34.146301] Mem abort info:
> [=C2=A0=C2=A0 34.146306]=C2=A0=C2=A0 ESR =3D 0x0000000096000005
> [=C2=A0=C2=A0 34.146315]=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =
=3D 32 bits
> [=C2=A0=C2=A0 34.146322]=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> [=C2=A0=C2=A0 34.146328]=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> [=C2=A0=C2=A0 34.146334]=C2=A0=C2=A0 FSC =3D 0x05: level 1 translation fa=
ult
> [=C2=A0=C2=A0 34.146340] Data abort info:
> [=C2=A0=C2=A0 34.146345]=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000005, ISS2 =
=3D 0x00000000
> [=C2=A0=C2=A0 34.146351]=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagA=
ccess =3D 0
> [=C2=A0=C2=A0 34.146357]=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =
=3D 0, Xs =3D 0
> [=C2=A0=C2=A0 34.146366] user pgtable: 4k pages, 39-bit VAs,
> pgdp=3D00000001232e6000
> [=C2=A0=C2=A0 34.146375] [0000000000000078] pgd=3D0000000000000000,
> p4d=3D0000000000000000, pud=3D0000000000000000
> [=C2=A0=C2=A0 34.146399] Internal error: Oops: 0000000096000005 [#1] PREE=
MPT
> SMP
> [=C2=A0=C2=A0 34.146406] Modules linked in: rfcomm snd_seq_dummy snd_hrti=
mer
> snd_seq snd_seq_device algif_hash aes_neon_bs aes_neon_blk
> algif_skcipher af_alg bnep hid_logitech_hidpp brcmfmac_wcc brcmfmac
> brcmutil hci_uart vc4 btbcm cfg80211 bluetooth bcm2835_v4l2(C)
> snd_soc_hdmi_codec binfmt_misc cec drm_display_helper hid_logitech_dj
> bcm2835_mmal_vchiq(C) drm_dma_helper drm_kms_helper videobuf2_v4l2
> raspberrypi_hwmon ecdh_generic videobuf2_vmalloc videobuf2_memops ecc
> videobuf2_common rfkill videodev libaes snd_soc_core dwc2 i2c_brcmstb
> snd_pcm_dmaengine snd_bcm2835(C) i2c_bcm2835 pwm_bcm2835 snd_pcm mc
> v3d snd_timer snd gpu_sched drm_shmem_helper nvmem_rmem
> uio_pdrv_genirq uio i2c_dev drm fuse dm_mod
> drm_panel_orientation_quirks backlight configfs ip_tables x_tables
> ipv6
> [=C2=A0=C2=A0 34.146556] CPU: 1 PID: 1890 Comm: v3d_submit_csd Tainted:
> G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 C=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.7.0-rc3-g49ddab089611 #68
> [=C2=A0=C2=A0 34.146563] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (D=
T)
> [=C2=A0=C2=A0 34.146569] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT =
-SSBS
> BTYPE=3D--)
> [=C2=A0=C2=A0 34.146575] pc : drm_sched_job_cleanup+0x3c/0x190 [gpu_sched=
]
> [=C2=A0=C2=A0 34.146611] lr : v3d_submit_csd_ioctl+0x1b4/0x460 [v3d]
> [=C2=A0=C2=A0 34.146653] sp : ffffffc083cbbb80
> [=C2=A0=C2=A0 34.146658] x29: ffffffc083cbbb90 x28: ffffff81035afc00 x27:
> ffffffe77a641168
> [=C2=A0=C2=A0 34.146668] x26: ffffff81056a8000 x25: 0000000000000058 x24:
> 0000000000000000
> [=C2=A0=C2=A0 34.146677] x23: ffffff81065e2000 x22: ffffff81035afe00 x21:
> ffffffc083cbbcf0
> [=C2=A0=C2=A0 34.146686] x20: ffffff81035afe00 x19: 00000000ffffffea x18:
> 0000000000000000
> [=C2=A0=C2=A0 34.146694] x17: 0000000000000000 x16: ffffffe7989e34b0 x15:
> 0000000000000000
> [=C2=A0=C2=A0 34.146703] x14: 0000000004000004 x13: ffffff81035afe80 x12:
> ffffffc083cb8000
> [=C2=A0=C2=A0 34.146711] x11: cc57e05dfbe5ef00 x10: cc57e05dfbe5ef00 x9 :
> ffffffe77a64131c
> [=C2=A0=C2=A0 34.146719] x8 : 0000000000000000 x7 : 0000000000000000 x6 :
> 000000000000003f
> [=C2=A0=C2=A0 34.146727] x5 : 0000000000000040 x4 : ffffff81fefb03f0 x3 :
> ffffffc083cbba40
> [=C2=A0=C2=A0 34.146736] x2 : ffffff81056a8000 x1 : ffffffe7989e35e8 x0 :
> 0000000000000000
> [=C2=A0=C2=A0 34.146745] Call trace:
> [=C2=A0=C2=A0 34.146748]=C2=A0 drm_sched_job_cleanup+0x3c/0x190 [gpu_sche=
d]
> [=C2=A0=C2=A0 34.146768]=C2=A0 v3d_submit_csd_ioctl+0x1b4/0x460 [v3d]
> [=C2=A0=C2=A0 34.146791]=C2=A0 drm_ioctl_kernel+0xe0/0x120 [drm]
> [=C2=A0=C2=A0 34.147029]=C2=A0 drm_ioctl+0x264/0x408 [drm]
> [=C2=A0=C2=A0 34.147135]=C2=A0 __arm64_sys_ioctl+0x9c/0xe0
> [=C2=A0=C2=A0 34.147152]=C2=A0 invoke_syscall+0x4c/0x118
> [=C2=A0=C2=A0 34.147162]=C2=A0 el0_svc_common+0xb8/0xf0
> [=C2=A0=C2=A0 34.147168]=C2=A0 do_el0_svc+0x28/0x40
> [=C2=A0=C2=A0 34.147174]=C2=A0 el0_svc+0x38/0x88
> [=C2=A0=C2=A0 34.147184]=C2=A0 el0t_64_sync_handler+0x84/0x100
> [=C2=A0=C2=A0 34.147191]=C2=A0 el0t_64_sync+0x190/0x198
> [=C2=A0=C2=A0 34.147201] Code: aa0003f4 f90007e8 f9401008 aa0803e0 (b8478=
c09)
> [=C2=A0=C2=A0 34.147210] ---[ end trace 0000000000000000 ]---
>=20
> This happens because we are calling `drm_sched_job_cleanup()` twice:
> once at `v3d_job_init()` and again when we call `v3d_job_cleanup()`.
>=20
> To mitigate this issue, we can return to the same approach that we
> used
> to use before 464c61e76de8: deallocate the job after `v3d_job_init()`
> fails and assign it to NULL. Then, when we call `v3d_job_cleanup()`,
> job
> is NULL and the function returns.
>=20
> Fixes: 464c61e76de8 ("drm/v3d: Decouple job allocation from job
> initiation")
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
> =C2=A0drivers/gpu/drm/v3d/v3d_submit.c | 35 +++++++++++++++++++++++++----=
-
> --
> =C2=A01 file changed, 28 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
> b/drivers/gpu/drm/v3d/v3d_submit.c
> index fcff41dd2315..88f63d526b22 100644
> --- a/drivers/gpu/drm/v3d/v3d_submit.c
> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
> @@ -147,6 +147,13 @@ v3d_job_allocate(void **container, size_t size)
> =C2=A0	return 0;
> =C2=A0}
>=20
> +static void
> +v3d_job_deallocate(void **container)
> +{
> +	kfree(*container);
> +	*container =3D NULL;
> +}
> +
> =C2=A0static int
> =C2=A0v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 struct v3d_job *job, void (*free)(struct =
kref *ref),
> @@ -273,8 +280,10 @@ v3d_setup_csd_jobs_and_bos(struct drm_file
> *file_priv,
>=20
> =C2=A0	ret =3D v3d_job_init(v3d, file_priv, &(*job)->base,
> =C2=A0			=C2=A0=C2=A0 v3d_job_free, args->in_sync, se,
> V3D_CSD);
> -	if (ret)
> +	if (ret) {
> +		v3d_job_deallocate((void *)job);
> =C2=A0		return ret;
> +	}
>=20
> =C2=A0	ret =3D v3d_job_allocate((void *)clean_job,
> sizeof(**clean_job));
> =C2=A0	if (ret)
> @@ -282,8 +291,10 @@ v3d_setup_csd_jobs_and_bos(struct drm_file
> *file_priv,
>=20
> =C2=A0	ret =3D v3d_job_init(v3d, file_priv, *clean_job,
> =C2=A0			=C2=A0=C2=A0 v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
> -	if (ret)
> +	if (ret) {
> +		v3d_job_deallocate((void *)clean_job);
> =C2=A0		return ret;
> +	}
>=20
> =C2=A0	(*job)->args =3D *args;
>=20
> @@ -860,8 +871,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>=20
> =C2=A0	ret =3D v3d_job_init(v3d, file_priv, &render->base,
> =C2=A0			=C2=A0=C2=A0 v3d_render_job_free, args->in_sync_rcl,
> &se, V3D_RENDER);
> -	if (ret)
> +	if (ret) {
> +		v3d_job_deallocate((void *)&render);
> =C2=A0		goto fail;
> +	}
>=20
> =C2=A0	render->start =3D args->rcl_start;
> =C2=A0	render->end =3D args->rcl_end;
> @@ -874,8 +887,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>=20
> =C2=A0		ret =3D v3d_job_init(v3d, file_priv, &bin->base,
> =C2=A0				=C2=A0=C2=A0 v3d_job_free, args->in_sync_bcl,
> &se, V3D_BIN);
> -		if (ret)
> +		if (ret) {
> +			v3d_job_deallocate((void *)&bin);
> =C2=A0			goto fail;
> +		}
>=20
> =C2=A0		bin->start =3D args->bcl_start;
> =C2=A0		bin->end =3D args->bcl_end;
> @@ -892,8 +907,10 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void
> *data,
>=20
> =C2=A0		ret =3D v3d_job_init(v3d, file_priv, clean_job,
> =C2=A0				=C2=A0=C2=A0 v3d_job_free, 0, NULL,
> V3D_CACHE_CLEAN);
> -		if (ret)
> +		if (ret) {
> +			v3d_job_deallocate((void *)&clean_job);
> =C2=A0			goto fail;
> +		}
>=20
> =C2=A0		last_job =3D clean_job;
> =C2=A0	} else {
> @@ -1015,8 +1032,10 @@ v3d_submit_tfu_ioctl(struct drm_device *dev,
> void *data,
>=20
> =C2=A0	ret =3D v3d_job_init(v3d, file_priv, &job->base,
> =C2=A0			=C2=A0=C2=A0 v3d_job_free, args->in_sync, &se,
> V3D_TFU);
> -	if (ret)
> +	if (ret) {
> +		v3d_job_deallocate((void *)&job);
> =C2=A0		goto fail;
> +	}
>=20
> =C2=A0	job->base.bo =3D kcalloc(ARRAY_SIZE(args->bo_handles),
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(*job->base.bo), GFP_=
KERNEL);
> @@ -1233,8 +1252,10 @@ v3d_submit_cpu_ioctl(struct drm_device *dev,
> void *data,
>=20
> =C2=A0	ret =3D v3d_job_init(v3d, file_priv, &cpu_job->base,
> =C2=A0			=C2=A0=C2=A0 v3d_job_free, 0, &se, V3D_CPU);
> -	if (ret)
> +	if (ret) {
> +		v3d_job_deallocate((void *)&cpu_job);
> =C2=A0		goto fail;
> +	}
>=20
> =C2=A0	clean_job =3D cpu_job->indirect_csd.clean_job;
> =C2=A0	csd_job =3D cpu_job->indirect_csd.job;
> --
> 2.43.0
>=20
>=20

