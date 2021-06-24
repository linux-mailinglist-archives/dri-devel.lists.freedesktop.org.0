Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83F43B2A38
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:19:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3296E9FB;
	Thu, 24 Jun 2021 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265E76E9FB;
 Thu, 24 Jun 2021 08:19:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9244F1FD66;
 Thu, 24 Jun 2021 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624522766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWd7Clsceha48alSO3MSAZOa9A037NnlaUwYocVgtFQ=;
 b=1uGjm7UZ7PJfsImGvXQs3KOVxH/bk0ooj9b2bSR2edOzZndQIk/dKTOkdfhuwuZ1ArzjN0
 3ujvsLTyNGTdVOJjOxBS+fsQJvfF+yz/szoJsoZ/AUWteqACGMpzqd+cXl+CS54ToA6/zz
 F9UEYZnG8dIpkLantgn7MZI0Egyzvmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624522766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWd7Clsceha48alSO3MSAZOa9A037NnlaUwYocVgtFQ=;
 b=/YMR/IYhBBufrAHuJE1r8ttx4pmSzgH1ziIBufrpWtlSM9pcaTJsJU2ZXs521xcjYnIZRJ
 3rlzR0512R0AfuBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 67D6711A97;
 Thu, 24 Jun 2021 08:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624522766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWd7Clsceha48alSO3MSAZOa9A037NnlaUwYocVgtFQ=;
 b=1uGjm7UZ7PJfsImGvXQs3KOVxH/bk0ooj9b2bSR2edOzZndQIk/dKTOkdfhuwuZ1ArzjN0
 3ujvsLTyNGTdVOJjOxBS+fsQJvfF+yz/szoJsoZ/AUWteqACGMpzqd+cXl+CS54ToA6/zz
 F9UEYZnG8dIpkLantgn7MZI0Egyzvmc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624522766;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vWd7Clsceha48alSO3MSAZOa9A037NnlaUwYocVgtFQ=;
 b=/YMR/IYhBBufrAHuJE1r8ttx4pmSzgH1ziIBufrpWtlSM9pcaTJsJU2ZXs521xcjYnIZRJ
 3rlzR0512R0AfuBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id w2+wFw1A1GA5HAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 08:19:25 +0000
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <13a2808e-e18b-d0c4-fd3f-9f74a1c28227@suse.de>
Date: Thu, 24 Jun 2021 10:19:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87im23u1ok.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1abtLFnknRMcm59L8jJCqfHfzBd2N565M"
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
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1abtLFnknRMcm59L8jJCqfHfzBd2N565M
Content-Type: multipart/mixed; boundary="S90tyVSEB8ao9W3GA3iiO0RRpFfoFToer";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, inki.dae@samsung.com,
 jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, p.zabel@pengutronix.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, bskeggs@redhat.com, tomba@kernel.org,
 hjc@rock-chips.com, heiko@sntech.de, benjamin.gaignard@linaro.org,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org,
 jernej.skrabec@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jyri.sarha@iki.fi, emma@anholt.net, linux-graphics-maintainer@vmware.com,
 zackr@vmware.com, hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com, rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com, hamohammed.sa@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID: <13a2808e-e18b-d0c4-fd3f-9f74a1c28227@suse.de>
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
In-Reply-To: <87im23u1ok.fsf@intel.com>

--S90tyVSEB8ao9W3GA3iiO0RRpFfoFToer
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.21 um 10:06 schrieb Jani Nikula:
> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> For KMS drivers, replace the IRQ check in VBLANK ioctls with a check f=
or
>> vblank support. IRQs might be enabled wthout vblanking being supported=
=2E
>>
>> This change also removes the DRM framework's only dependency on IRQ st=
ate
>> for non-legacy drivers. For legacy drivers with userspace modesetting,=

>> the original test remains in drm_wait_vblank_ioctl().
>>
>> v3:
>> 	* optimize test in drm_wait_vblank_ioctl() for KMS case (Liviu)
>> 	* update docs for drm_irq_uninstall()
>> v2:
>> 	* keep the old test for legacy drivers in
>> 	  drm_wait_vblank_ioctl() (Daniel)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>   drivers/gpu/drm/drm_irq.c    | 13 ++++---------
>>   drivers/gpu/drm/drm_vblank.c | 16 ++++++++++++----
>>   2 files changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
>> index c3bd664ea733..945dd82e2ea3 100644
>> --- a/drivers/gpu/drm/drm_irq.c
>> +++ b/drivers/gpu/drm/drm_irq.c
>> @@ -74,10 +74,8 @@
>>    * only supports devices with a single interrupt on the main device =
stored in
>>    * &drm_device.dev and set as the device paramter in drm_dev_alloc()=
=2E
>>    *
>> - * These IRQ helpers are strictly optional. Drivers which roll their =
own only
>> - * need to set &drm_device.irq_enabled to signal the DRM core that vb=
lank
>> - * interrupts are working. Since these helpers don't automatically cl=
ean up the
>> - * requested interrupt like e.g. devm_request_irq() they're not reall=
y
>> + * These IRQ helpers are strictly optional. Since these helpers don't=
 automatically
>> + * clean up the requested interrupt like e.g. devm_request_irq() they=
're not really
>>    * recommended.
>>    */
>>  =20
>> @@ -91,9 +89,7 @@
>>    * and after the installation.
>>    *
>>    * This is the simplified helper interface provided for drivers with=
 no special
>> - * needs. Drivers which need to install interrupt handlers for multip=
le
>> - * interrupts must instead set &drm_device.irq_enabled to signal the =
DRM core
>> - * that vblank interrupts are available.
>> + * needs.
>>    *
>>    * @irq must match the interrupt number that would be passed to requ=
est_irq(),
>>    * if called directly instead of using this helper function.
>> @@ -156,8 +152,7 @@ EXPORT_SYMBOL(drm_irq_install);
>>    *
>>    * Calls the driver's &drm_driver.irq_uninstall function and unregis=
ters the IRQ
>>    * handler.  This should only be called by drivers which used drm_ir=
q_install()
>> - * to set up their interrupt handler. Other drivers must only reset
>> - * &drm_device.irq_enabled to false.
>> + * to set up their interrupt handler.
>>    *
>>    * Note that for kernel modesetting drivers it is a bug if this func=
tion fails.
>>    * The sanity checks are only to catch buggy user modesetting driver=
s which call
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 3417e1ac7918..10fe16bafcb6 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>>   	unsigned int pipe_index;
>>   	unsigned int flags, pipe, high_pipe;
>>  =20
>> -	if (!dev->irq_enabled)
>> -		return -EOPNOTSUPP;
>> +#if defined(CONFIG_DRM_LEGACY)
>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>> +		if (!dev->irq_enabled)
>> +			return -EOPNOTSUPP;
>> +	} else /* if DRIVER_MODESET */
>> +#endif
>> +	{
>> +		if (!drm_dev_has_vblank(dev))
>> +			return -EOPNOTSUPP;
>> +	}
>=20
> Sheesh I hate this kind of inline #ifdefs.

I don't like them either. I guess I'll go with suggestion 2. Thanks for=20
the feedback.

Best regards
Thomas

>=20
> Two alternate suggestions that I believe should be as just efficient:
>=20
> 1) The more verbose:
>=20
> #if defined(CONFIG_DRM_LEGACY)
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
> 		return dev->irq_enabled;
> 	else
> 		return drm_dev_has_vblank(dev);
> }
> #else
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	return drm_dev_has_vblank(dev);
> }
> #endif
>=20
> 2) The more compact:
>=20
> static bool drm_wait_vblank_supported(struct drm_device *dev)
> {
> 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_feature(=
dev, DRIVER_LEGACY)))
> 		return dev->irq_enabled;
> 	else
> 		return drm_dev_has_vblank(dev);
> }
>=20
> Then, in drm_wait_vblank_ioctl().
>=20
> 	if (!drm_wait_vblank_supported(dev))
> 		return -EOPNOTSUPP;
>=20
> The compiler should do the right thing without any explicit inline
> keywords etc.
>=20
> BR,
> Jani.
>=20
>>  =20
>>   	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>   		return -EINVAL;
>> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_devic=
e *dev, void *data,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>  =20
>> -	if (!dev->irq_enabled)
>> +	if (!drm_dev_has_vblank(dev))
>>   		return -EOPNOTSUPP;
>>  =20
>>   	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_dev=
ice *dev, void *data,
>>   	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>   		return -EOPNOTSUPP;
>>  =20
>> -	if (!dev->irq_enabled)
>> +	if (!drm_dev_has_vblank(dev))
>>   		return -EOPNOTSUPP;
>>  =20
>>   	crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--S90tyVSEB8ao9W3GA3iiO0RRpFfoFToer--

--1abtLFnknRMcm59L8jJCqfHfzBd2N565M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUQAwFAwAAAAAACgkQlh/E3EQov+AM
1xAAon3lHuqQy+6wjZWY/BW0yUved7wPrHSnsue/EvRwAf4qizG4REU3rRLH+CO8iBUiJrYZPSRn
8sm0Y4HwQlHt2Zy7ps/nbEtgjDg5fVOhqkc0IxmXPIw8joLCo6TwLxqboCYcPInMgdr/uvbP9n5m
NF5FKlGhp6pFqb2DT5ZtZQkT44FbTtDZBOXin66cdVcAif0KqmtFcXS3zR0tG+ORS7RejPtgRm/t
Q3DN33sXGq82NzsMKL9YZ7LWBlJLHgJ/1wBioZf1KmX86KpAkyFP+djzOk4wnBVi9bHH7QnhBR3B
Dxjl8W1VuSXnwAndfs06GbVKdVoz+mawg1cMurmLpaZ7LyRmKKDvAti8TEkfvStMPdnPe3pDQDY/
mG6SsUlrzre5LJRemQCMMAm5YRlIIkSWh4ECkVn8Q/dxq22nlDiPKSx9ZlA4sFM6iSF5IDix4yZB
Y1lLWX64M3Sit7s7TDWxDqDFovM0GE/5dkYhB9v7d+TOYuQWkxMSmwdd/54gU9Z6smzVA0rsxKyT
Y2wlMk9y7OtCVDdj2JrtH1O6q2QfSsBq/CaBWP/M2VunNnJZNBMnVNcHMhkv6pdmGnsk0863I/XQ
G+GOEdqotN7Q7Z4tVMyFLBslHhy8gUELR36bPe41g9Rir/ijBnTSBUs/L182bxvhFp9F8IZ6DiGh
wt0=
=LtMp
-----END PGP SIGNATURE-----

--1abtLFnknRMcm59L8jJCqfHfzBd2N565M--
