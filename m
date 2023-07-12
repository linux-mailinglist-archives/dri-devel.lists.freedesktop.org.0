Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53CA750541
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E5A10E035;
	Wed, 12 Jul 2023 10:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FFC10E035
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:56:12 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1qJXVx-0005cG-C5; Wed, 12 Jul 2023 12:56:09 +0200
Message-ID: <a5a56eb095d124290b21cfb48fa1a9d002ba0c18.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] drm/amdgpu: Rework coredump to use memory dynamically
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 =?ISO-8859-1?Q?Andr=E9?= Almeida
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 12 Jul 2023 12:56:08 +0200
In-Reply-To: <3764d627-d632-5754-0bcc-a150c157d9f9@amd.com>
References: <20230711213501.526237-1-andrealmeid@igalia.com>
 <20230711213501.526237-4-andrealmeid@igalia.com>
 <e488da74-af52-62eb-d601-0e8a13cf0e87@amd.com>
 <0e7f2b0cc29ac77d4a55d0de6a66c477d867fbf7.camel@pengutronix.de>
 <3764d627-d632-5754-0bcc-a150c157d9f9@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 'Marek =?UTF-8?Q?Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>,
 michel.daenzer@mailbox.org,
 Timur =?ISO-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sorry, accidentally hit sent on the previous mail.

Am Mittwoch, dem 12.07.2023 um 12:39 +0200 schrieb Christian K=C3=B6nig:
> Am 12.07.23 um 10:59 schrieb Lucas Stach:
> > Am Mittwoch, dem 12.07.2023 um 10:37 +0200 schrieb Christian K=C3=B6nig=
:
> > > Am 11.07.23 um 23:34 schrieb Andr=C3=A9 Almeida:
> > > > Instead of storing coredump information inside amdgpu_device struct=
,
> > > > move if to a proper separated struct and allocate it dynamically. T=
his
> > > > will make it easier to further expand the logged information.
> > > Verry big NAK to this. The problem is that memory allocation isn't
> > > allowed during a GPU reset.
> > >=20
> > > What you could do is to allocate the memory with GFP_ATOMIC or simila=
r,
> > > but for a large structure that might not be possible.
> > >=20
> > I'm still not fully clear on what the rules are here. In etnaviv we do
> > devcoredump allocation in the GPU reset path with __GFP_NOWARN |
> > __GFP_NORETRY, which means the allocation will kick memory reclaim if
> > necessary, but will just give up if no memory could be made available
> > easily. This satisfies the forward progress guarantee in the absence of
> > successful memory allocation, which is the most important property in
> > this path, I think.
> >=20
> > However, I'm not sure if the reclaim could lead to locking issues or
> > something like that with the more complex use-cases with MMU notifiers
> > and stuff like that. Christian, do you have any experience or
> > information that would be good to share in this regard?
>=20
> Yeah, very good question.
>=20
> __GFP_NORETRY isn't sufficient as far as I know. Reclaim must be=20
> completely suppressed to be able to allocate in a GPU reset handler.
>=20
> Daniel added lockdep annotation to some of the dma-fence signaling paths=
=20
> and this yielded quite a bunch of potential deadlocks.
>=20
> It's not even that reclaim itself waits for dma_fences (that can happen,=
=20
> but is quite unlikely), but rather that reclaim needs locks and under=20
> those locks we then wait for dma_fences.
>=20
> We should probably add a define somewhere which documents that=20
> (GFP_ATOMIC | __NO_WARN) should be used in the GPU reset handlers when=
=20
> allocating memory for coredumps.
>=20
Hm, if the problem is the direct reclaim path where we might recurse on
a lock through those indirect dependencies then we should document this
somewhere. kswapd reclaim should be fine as far as I can see, as we'll
guarantee progress without waiting for the background reclaim.

I don't think it's appropriate to dip into the atomic allocation
reserves for a best-effort thing like writing the devcoredump, so I
think this should be GFP_NOWAIT, which will also avoid the direct
reclaim path.

Regards,
Lucas

> Regards,
> Christian.
>=20
> >=20
> > Regards,
> > Lucas
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> > > > ---
> > > >    drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
> > > >    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 65 ++++++++++++++--=
------
> > > >    2 files changed, 51 insertions(+), 28 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu.h
> > > > index dbe062a087c5..e1cc83a89d46 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > > > @@ -1068,11 +1068,6 @@ struct amdgpu_device {
> > > >    	uint32_t                        *reset_dump_reg_list;
> > > >    	uint32_t			*reset_dump_reg_value;
> > > >    	int                             num_regs;
> > > > -#ifdef CONFIG_DEV_COREDUMP
> > > > -	struct amdgpu_task_info         reset_task_info;
> > > > -	bool                            reset_vram_lost;
> > > > -	struct timespec64               reset_time;
> > > > -#endif
> > > >   =20
> > > >    	bool                            scpm_enabled;
> > > >    	uint32_t                        scpm_status;
> > > > @@ -1085,6 +1080,15 @@ struct amdgpu_device {
> > > >    	uint32_t			aid_mask;
> > > >    };
> > > >   =20
> > > > +#ifdef CONFIG_DEV_COREDUMP
> > > > +struct amdgpu_coredump_info {
> > > > +	struct amdgpu_device		*adev;
> > > > +	struct amdgpu_task_info         reset_task_info;
> > > > +	struct timespec64               reset_time;
> > > > +	bool                            reset_vram_lost;
> > > > +};
> > > > +#endif
> > > > +
> > > >    static inline struct amdgpu_device *drm_to_adev(struct drm_devic=
e *ddev)
> > > >    {
> > > >    	return container_of(ddev, struct amdgpu_device, ddev);
> > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_device.c
> > > > index e25f085ee886..23b9784e9787 100644
> > > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > > > @@ -4963,12 +4963,17 @@ static int amdgpu_reset_reg_dumps(struct am=
dgpu_device *adev)
> > > >    	return 0;
> > > >    }
> > > >   =20
> > > > -#ifdef CONFIG_DEV_COREDUMP
> > > > +#ifndef CONFIG_DEV_COREDUMP
> > > > +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_=
lost,
> > > > +			    struct amdgpu_reset_context *reset_context)
> > > > +{
> > > > +}
> > > > +#else
> > > >    static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offs=
et,
> > > >    		size_t count, void *data, size_t datalen)
> > > >    {
> > > >    	struct drm_printer p;
> > > > -	struct amdgpu_device *adev =3D data;
> > > > +	struct amdgpu_coredump_info *coredump =3D data;
> > > >    	struct drm_print_iterator iter;
> > > >    	int i;
> > > >   =20
> > > > @@ -4982,21 +4987,21 @@ static ssize_t amdgpu_devcoredump_read(char=
 *buffer, loff_t offset,
> > > >    	drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
> > > >    	drm_printf(&p, "kernel: " UTS_RELEASE "\n");
> > > >    	drm_printf(&p, "module: " KBUILD_MODNAME "\n");
> > > > -	drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, ade=
v->reset_time.tv_nsec);
> > > > -	if (adev->reset_task_info.pid)
> > > > +	drm_printf(&p, "time: %lld.%09ld\n", coredump->reset_time.tv_sec,=
 coredump->reset_time.tv_nsec);
> > > > +	if (coredump->reset_task_info.pid)
> > > >    		drm_printf(&p, "process_name: %s PID: %d\n",
> > > > -			   adev->reset_task_info.process_name,
> > > > -			   adev->reset_task_info.pid);
> > > > +			   coredump->reset_task_info.process_name,
> > > > +			   coredump->reset_task_info.pid);
> > > >   =20
> > > > -	if (adev->reset_vram_lost)
> > > > +	if (coredump->reset_vram_lost)
> > > >    		drm_printf(&p, "VRAM is lost due to GPU reset!\n");
> > > > -	if (adev->num_regs) {
> > > > +	if (coredump->adev->num_regs) {
> > > >    		drm_printf(&p, "AMDGPU register dumps:\nOffset:     Value:\n")=
;
> > > >   =20
> > > > -		for (i =3D 0; i < adev->num_regs; i++)
> > > > +		for (i =3D 0; i < coredump->adev->num_regs; i++)
> > > >    			drm_printf(&p, "0x%08x: 0x%08x\n",
> > > > -				   adev->reset_dump_reg_list[i],
> > > > -				   adev->reset_dump_reg_value[i]);
> > > > +				   coredump->adev->reset_dump_reg_list[i],
> > > > +				   coredump->adev->reset_dump_reg_value[i]);
> > > >    	}
> > > >   =20
> > > >    	return count - iter.remain;
> > > > @@ -5004,14 +5009,34 @@ static ssize_t amdgpu_devcoredump_read(char=
 *buffer, loff_t offset,
> > > >   =20
> > > >    static void amdgpu_devcoredump_free(void *data)
> > > >    {
> > > > +	kfree(data);
> > > >    }
> > > >   =20
> > > > -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device *a=
dev)
> > > > +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_=
lost,
> > > > +			    struct amdgpu_reset_context *reset_context)
> > > >    {
> > > > +	struct amdgpu_coredump_info *coredump;
> > > >    	struct drm_device *dev =3D adev_to_drm(adev);
> > > >   =20
> > > > -	ktime_get_ts64(&adev->reset_time);
> > > > -	dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_KERNEL,
> > > > +	coredump =3D kmalloc(sizeof(*coredump), GFP_KERNEL);
> > > > +
> > > > +	if (!coredump) {
> > > > +		DRM_ERROR("%s: failed to allocate memory for coredump\n", __func=
__);
> > > > +		return;
> > > > +	}
> > > > +
> > > > +	memset(coredump, 0, sizeof(*coredump));
> > > > +
> > > > +	coredump->reset_vram_lost =3D vram_lost;
> > > > +
> > > > +	if (reset_context->job && reset_context->job->vm)
> > > > +		coredump->reset_task_info =3D reset_context->job->vm->task_info;
> > > > +
> > > > +	coredump->adev =3D adev;
> > > > +
> > > > +	ktime_get_ts64(&coredump->reset_time);
> > > > +
> > > > +	dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > > >    		      amdgpu_devcoredump_read, amdgpu_devcoredump_free);
> > > >    }
> > > >    #endif
> > > > @@ -5119,15 +5144,9 @@ int amdgpu_do_asic_reset(struct list_head *d=
evice_list_handle,
> > > >    					goto out;
> > > >   =20
> > > >    				vram_lost =3D amdgpu_device_check_vram_lost(tmp_adev);
> > > > -#ifdef CONFIG_DEV_COREDUMP
> > > > -				tmp_adev->reset_vram_lost =3D vram_lost;
> > > > -				memset(&tmp_adev->reset_task_info, 0,
> > > > -						sizeof(tmp_adev->reset_task_info));
> > > > -				if (reset_context->job && reset_context->job->vm)
> > > > -					tmp_adev->reset_task_info =3D
> > > > -						reset_context->job->vm->task_info;
> > > > -				amdgpu_reset_capture_coredumpm(tmp_adev);
> > > > -#endif
> > > > +
> > > > +				amdgpu_coredump(tmp_adev, vram_lost, reset_context);
> > > > +
> > > >    				if (vram_lost) {
> > > >    					DRM_INFO("VRAM is lost due to GPU reset!\n");
> > > >    					amdgpu_inc_vram_lost(tmp_adev);
>=20

