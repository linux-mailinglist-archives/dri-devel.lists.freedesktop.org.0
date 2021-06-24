Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD95C3B2B1F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 11:08:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323B86EB29;
	Thu, 24 Jun 2021 09:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9580F6EB26;
 Thu, 24 Jun 2021 09:08:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0463E1FD66;
 Thu, 24 Jun 2021 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKL9mP48io+APDMklw5yU/nTFyyLtllrHvhRByxGfgM=;
 b=Fa003aqPNfKvMmB5gj67Z2b+vADOqXwJZbsZa1wLiyJFEYxd8Ib341pE3+k1q3LB/3NTPM
 sec4L/zG58xoB1lJqeaGcoJORFmdA4MYlT10zNcfBOK9OQqTDe4HPy2ViRmxXEaOVhWpeB
 stgCohp2fTLc+re6z5B7wGsQj3RuBdw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKL9mP48io+APDMklw5yU/nTFyyLtllrHvhRByxGfgM=;
 b=5fbRrwXqzrlBotN6vVs6nYUPpayauPPnI+y3I6tTE09d75iLijxUx+ydMD0QEa5X+6VQch
 gQMq4UauX+vXn3AA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id D3DC011A97;
 Thu, 24 Jun 2021 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624525678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKL9mP48io+APDMklw5yU/nTFyyLtllrHvhRByxGfgM=;
 b=qka1M/+/Q0elb+Z4f6NaP+BgHuSA/yV87SJKUK7fBN5PWNEmX+fCZcno/5kvg/PzTE44iv
 joOoo0J1V3O+yOBF1zFmhwUrUs2dy9UjZf9K1YAFsRlSIR/viSN1/anfeuQcykgILCWH0K
 16EhnP2e/GNrZU++exd36UAeNj2qNMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624525678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rKL9mP48io+APDMklw5yU/nTFyyLtllrHvhRByxGfgM=;
 b=XNZZ2ccXjd52Zfc2lfinuyEZHBLa2WF7fIMYqmaGxOEk8UiNOL4HuWXLk8lyaE0Mmw9X8C
 niNIquqh21hULJCQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GA8HMm1L1GANNwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 09:07:57 +0000
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
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
Date: Thu, 24 Jun 2021 11:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <877dijtzl2.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Yy3WbyUimc1Hxu4dvJZCfzpxTV3jVapRO"
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
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Yy3WbyUimc1Hxu4dvJZCfzpxTV3jVapRO
Content-Type: multipart/mixed; boundary="4JbZC3NkmBgthQugAZppQ3TwC7sIXD4e6";
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
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Message-ID: <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com>
In-Reply-To: <877dijtzl2.fsf@intel.com>

--4JbZC3NkmBgthQugAZppQ3TwC7sIXD4e6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.21 um 10:51 schrieb Jani Nikula:
> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 24.06.21 um 10:06 schrieb Jani Nikula:
>>> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vbla=
nk.c
>>>> index 3417e1ac7918..10fe16bafcb6 100644
>>>> --- a/drivers/gpu/drm/drm_vblank.c
>>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_device *=
dev, void *data,
>>>>    	unsigned int pipe_index;
>>>>    	unsigned int flags, pipe, high_pipe;
>>>>   =20
>>>> -	if (!dev->irq_enabled)
>>>> -		return -EOPNOTSUPP;
>>>> +#if defined(CONFIG_DRM_LEGACY)
>>>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>>>> +		if (!dev->irq_enabled)
>>>> +			return -EOPNOTSUPP;
>>>> +	} else /* if DRIVER_MODESET */
>>>> +#endif
>>>> +	{
>>>> +		if (!drm_dev_has_vblank(dev))
>>>> +			return -EOPNOTSUPP;
>>>> +	}
>>>
>>> Sheesh I hate this kind of inline #ifdefs.
>>>
>>> Two alternate suggestions that I believe should be as just efficient:=

>>
>> Or how about:
>>
>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>>
>> {
>>
>> if defined(CONFIG_DRM_LEGACY)
>> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>>
>> 		return dev->irq_enabled;
>>
>> #endif
>> 	return drm_dev_has_vblank(dev);
>>
>> }
>>
>>
>> ?
>>
>> It's inline, but still readable.
>=20
> It's definitely better than the original, but it's unclear to me why
> you'd prefer this over option 2) below. I guess the only reason I can
> think of is emphasizing the conditional compilation. However,
> IS_ENABLED() is widely used in this manner specifically to avoid inline=

> #if, and the compiler optimizes it away.

It's simply more readable to me as the condition is simpler. But option=20
2 is also ok.

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20
>>
>> Best regards
>> Thomas
>>
>>>
>>> 1) The more verbose:
>>>
>>> #if defined(CONFIG_DRM_LEGACY)
>>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>>> {
>>> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>>> 		return dev->irq_enabled;
>>> 	else
>>> 		return drm_dev_has_vblank(dev);
>>> }
>>> #else
>>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>>> {
>>> 	return drm_dev_has_vblank(dev);
>>> }
>>> #endif
>>>
>>> 2) The more compact:
>>>
>>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>>> {
>>> 	if  (IS_ENABLED(CONFIG_DRM_LEGACY) && unlikely(drm_core_check_featur=
e(dev, DRIVER_LEGACY)))
>>> 		return dev->irq_enabled;
>>> 	else
>>> 		return drm_dev_has_vblank(dev);
>>> }
>>>
>>> Then, in drm_wait_vblank_ioctl().
>>>
>>> 	if (!drm_wait_vblank_supported(dev))
>>> 		return -EOPNOTSUPP;
>>>
>>> The compiler should do the right thing without any explicit inline
>>> keywords etc.
>>>
>>> BR,
>>> Jani.
>>>
>>>>   =20
>>>>    	if (vblwait->request.type & _DRM_VBLANK_SIGNAL)
>>>>    		return -EINVAL;
>>>> @@ -2023,7 +2031,7 @@ int drm_crtc_get_sequence_ioctl(struct drm_dev=
ice *dev, void *data,
>>>>    	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>>    		return -EOPNOTSUPP;
>>>>   =20
>>>> -	if (!dev->irq_enabled)
>>>> +	if (!drm_dev_has_vblank(dev))
>>>>    		return -EOPNOTSUPP;
>>>>   =20
>>>>    	crtc =3D drm_crtc_find(dev, file_priv, get_seq->crtc_id);
>>>> @@ -2082,7 +2090,7 @@ int drm_crtc_queue_sequence_ioctl(struct drm_d=
evice *dev, void *data,
>>>>    	if (!drm_core_check_feature(dev, DRIVER_MODESET))
>>>>    		return -EOPNOTSUPP;
>>>>   =20
>>>> -	if (!dev->irq_enabled)
>>>> +	if (!drm_dev_has_vblank(dev))
>>>>    		return -EOPNOTSUPP;
>>>>   =20
>>>>    	crtc =3D drm_crtc_find(dev, file_priv, queue_seq->crtc_id);
>>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--4JbZC3NkmBgthQugAZppQ3TwC7sIXD4e6--

--Yy3WbyUimc1Hxu4dvJZCfzpxTV3jVapRO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUS20FAwAAAAAACgkQlh/E3EQov+Cd
sQ//WrJ+cTjeCic8XWKP/6B1g/HO+aPRrvY0ktdf5gWjTVO6YN/FUVYp01LvOH8E1lh+mUmOWXlH
6sTbGXnxD39Kch9JuZqlVwVDjG+SFSNcwJtHHF4D93/sMMgf0C00N0dUwPEFARmqTu091Ya/R3fI
6iTBwu1GDLEcHDVaw5asnzmmDY9mMr7GIiJ4Kcy9I9fsdNybxG+P6Em3pMTBUlOFN6N4/GHrqs7I
MjCvfDylb5jXxjPNMxQIeaevOwIi+xPTIZwGIeVdEhIpY6GHe8HKWFSqV2saCb9AoHW7vkNs0Tig
ol8QFs1B/Yau/K39PCoRg1F8Y4nJaZfKL7JCHh0/bhhetCas1X4j8m1Y+jGPHIXFCh6orFNIqT+v
J05PwfQ0vIz6bmxPxPt+KsHyf2RaYP6u5MPjfDICbAx1DPygVNuJLa+cUstqxoDqnPDNsK8a/s7b
1MitJWn6UOhnwzkXomyZcKTxvRzZqFy0nAcbGYQyGmZHg7hW1ylSuuWddE5a3wFgXY2yN4GwUARa
t3F4HqZ+cFDwQJrxZ7Lev/rHSEL+IduPHzjfun+HVUzuqk2X/n/7qrll6ne0HOmaTLX19qRbMsZp
NsZn3eCBnJbhcNS6NJ8CA6iMkBSb3oYkXDafmo8zZ1rbKVLsMJxHeaa/x9f79Ooa24VXjdRx3g0o
EqM=
=Jf7v
-----END PGP SIGNATURE-----

--Yy3WbyUimc1Hxu4dvJZCfzpxTV3jVapRO--
