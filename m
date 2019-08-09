Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098A88BAA
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 15:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FB96E402;
	Sat, 10 Aug 2019 13:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113D76EED5
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 21:40:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D3DB9289F9A
Date: Fri, 9 Aug 2019 14:40:02 -0700
From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 6/9] drm/panfrost: Consolidate reset handling
Message-ID: <20190809214002.GA16127@kevin>
References: <20190808222200.13176-1-robh@kernel.org>
 <20190808222200.13176-7-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190808222200.13176-7-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Sat, 10 Aug 2019 13:55:12 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0010115569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0010115569==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

R-b, good stuff.

On Thu, Aug 08, 2019 at 04:21:57PM -0600, Rob Herring wrote:
> Runtime PM resume and job timeouts both call the same sequence of
> functions, so consolidate them to a common function. This will make
> changing the reset related code easier. The MMU also needs some
> re-initialization on reset, so rework its call. In the process, we
> hide the address space details within the MMU code in preparation to
> support multiple address spaces.
>=20
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> New patch in this version.
>=20
>  drivers/gpu/drm/panfrost/panfrost_device.c | 16 ++++++++++------
>  drivers/gpu/drm/panfrost/panfrost_device.h |  1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c    |  7 +------
>  drivers/gpu/drm/panfrost/panfrost_mmu.c    | 16 +++++++++-------
>  drivers/gpu/drm/panfrost/panfrost_mmu.h    |  3 +--
>  5 files changed, 22 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 8a111d7c0200..9814f4ccbd26 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -254,18 +254,22 @@ const char *panfrost_exception_name(struct panfrost=
_device *pfdev, u32 exception
>  	return "UNKNOWN";
>  }
>=20
> +void panfrost_device_reset(struct panfrost_device *pfdev)
> +{
> +	panfrost_gpu_soft_reset(pfdev);
> +
> +	panfrost_gpu_power_on(pfdev);
> +	panfrost_mmu_reset(pfdev);
> +	panfrost_job_enable_interrupts(pfdev);
> +}
> +
>  #ifdef CONFIG_PM
>  int panfrost_device_resume(struct device *dev)
>  {
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	struct panfrost_device *pfdev =3D platform_get_drvdata(pdev);
>=20
> -	panfrost_gpu_soft_reset(pfdev);
> -
> -	/* TODO: Re-enable all other address spaces */
> -	panfrost_gpu_power_on(pfdev);
> -	panfrost_mmu_enable(pfdev, 0);
> -	panfrost_job_enable_interrupts(pfdev);
> +	panfrost_device_reset(pfdev);
>  	panfrost_devfreq_resume(pfdev);
>=20
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 038b32c62484..4e5641db9c7e 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -132,6 +132,7 @@ int panfrost_unstable_ioctl_check(void);
>=20
>  int panfrost_device_init(struct panfrost_device *pfdev);
>  void panfrost_device_fini(struct panfrost_device *pfdev);
> +void panfrost_device_reset(struct panfrost_device *pfdev);
>=20
>  int panfrost_device_resume(struct device *dev);
>  int panfrost_device_suspend(struct device *dev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index 9bb9260d9181..d567ce98494c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -395,12 +395,7 @@ static void panfrost_job_timedout(struct drm_sched_j=
ob *sched_job)
>  	/* panfrost_core_dump(pfdev); */
>=20
>  	panfrost_devfreq_record_transition(pfdev, js);
> -	panfrost_gpu_soft_reset(pfdev);
> -
> -	/* TODO: Re-enable all other address spaces */
> -	panfrost_mmu_enable(pfdev, 0);
> -	panfrost_gpu_power_on(pfdev);
> -	panfrost_job_enable_interrupts(pfdev);
> +	panfrost_device_reset(pfdev);
>=20
>  	for (i =3D 0; i < NUM_JOB_SLOTS; i++)
>  		drm_sched_resubmit_jobs(&pfdev->js->queue[i].sched);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.c
> index eba6ce785ef0..13757427b886 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
> @@ -105,15 +105,12 @@ static int mmu_hw_do_operation(struct panfrost_devi=
ce *pfdev, u32 as_nr,
>  	return ret;
>  }
>=20
> -void panfrost_mmu_enable(struct panfrost_device *pfdev, u32 as_nr)
> +static void panfrost_mmu_enable(struct panfrost_device *pfdev, u32 as_nr)
>  {
>  	struct io_pgtable_cfg *cfg =3D &pfdev->mmu->pgtbl_cfg;
>  	u64 transtab =3D cfg->arm_mali_lpae_cfg.transtab;
>  	u64 memattr =3D cfg->arm_mali_lpae_cfg.memattr;
>=20
> -	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
> -	mmu_write(pfdev, MMU_INT_MASK, ~0);
> -
>  	mmu_write(pfdev, AS_TRANSTAB_LO(as_nr), transtab & 0xffffffffUL);
>  	mmu_write(pfdev, AS_TRANSTAB_HI(as_nr), transtab >> 32);
>=20
> @@ -137,6 +134,14 @@ static void mmu_disable(struct panfrost_device *pfde=
v, u32 as_nr)
>  	write_cmd(pfdev, as_nr, AS_COMMAND_UPDATE);
>  }
>=20
> +void panfrost_mmu_reset(struct panfrost_device *pfdev)
> +{
> +	panfrost_mmu_enable(pfdev, 0);
> +
> +	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
> +	mmu_write(pfdev, MMU_INT_MASK, ~0);
> +}
> +
>  static size_t get_pgsize(u64 addr, size_t size)
>  {
>  	if (addr & (SZ_2M - 1) || size < SZ_2M)
> @@ -375,9 +380,6 @@ int panfrost_mmu_init(struct panfrost_device *pfdev)
>  		dev_err(pfdev->dev, "failed to request mmu irq");
>  		return err;
>  	}
> -	mmu_write(pfdev, MMU_INT_CLEAR, ~0);
> -	mmu_write(pfdev, MMU_INT_MASK, ~0);
> -
>  	pfdev->mmu->pgtbl_cfg =3D (struct io_pgtable_cfg) {
>  		.pgsize_bitmap	=3D SZ_4K | SZ_2M,
>  		.ias		=3D FIELD_GET(0xff, pfdev->features.mmu_features),
> diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.h b/drivers/gpu/drm/pa=
nfrost/panfrost_mmu.h
> index f5878d86a5ce..d5f9b24537db 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_mmu.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_mmu.h
> @@ -11,7 +11,6 @@ void panfrost_mmu_unmap(struct panfrost_gem_object *bo);
>=20
>  int panfrost_mmu_init(struct panfrost_device *pfdev);
>  void panfrost_mmu_fini(struct panfrost_device *pfdev);
> -
> -void panfrost_mmu_enable(struct panfrost_device *pfdev, u32 as_nr);
> +void panfrost_mmu_reset(struct panfrost_device *pfdev);
>=20
>  #endif
> --
> 2.20.1

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQ17gm7CvANAdqvY4/v5QWgr1WA0FAl1N6DIACgkQ/v5QWgr1
WA1mNxAAhmwvD9PWNadDFt3vpI6JKND2VdVuTTjKsk6rBs3pCeDq/kA+vY95Fdrj
HVCu4/Ai+pr4mZ5Z5tZq31r40GexMcORYJxoHq2+Y3tSi8O5806tCDRQxA3JowcO
fc6VwfLMHqtbudtZIr0i8+vi2i72EIjd+5EBWFOS8cHp+YjHOb9fEOzvI+PslcbI
duHq4Kmja7uj8KBoq+80dGdhKtfa/j6/gN+bT7VyY1ycHeSnwCXEjGZbAmSkYZ6g
n/QRYoQmkQfCvBsEchthds1WOzq6z995sZVCRJTRab52fT0IDqTTr80TxCd2SBj/
rqpon3hZmRLnwBlZ81D7nyJ4smGyc21AXdJvI+inSLrp09bfvdOp5O26NKMBSu12
TRGC+GF8akywkgZPrVd3J9gJnM3EkK6iW8pjUuaHqguNuWxlDj12C6h3bvdC3EkD
cICnDvsL5LMCElj5je+ZcEvzSBpdSCf7BAP//9VfJY3xd1QslBmDIKisx4pqxjNE
PrDi0vYfAteDkXORAggx72mYzKj9/PwxJP0viKf8E4vzl6xGiSXwWoq23LKZj2qO
RQBN/AL7QBT1dxUiSI7UIKyDj7FB5meu4HfYyZaP8ZFtCL5ecz8XBbxGXVzA6CfI
xfExgXz2fMPHl/a8TOix5h42LrehdfF3YaRLKM6QbMcs2iAtYeQ=
=spyk
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--

--===============0010115569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0010115569==--
