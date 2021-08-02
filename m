Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B73DD232
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 10:43:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15F56E4AB;
	Mon,  2 Aug 2021 08:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14C56E4A2;
 Mon,  2 Aug 2021 08:43:27 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74B8E21FE4;
 Mon,  2 Aug 2021 08:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627893805; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5ZYz9fLgLtmet/AAJ94QSQ15N6Q3rn5L5Ro1hd+Mfc=;
 b=2L1QOHbBgTXUBsWD++imkLfrbAa4lVuYclavhnRcZsrhKHarT/S0QbXgvG4ne0mUoZvAwE
 36VF+VBsldyD6WyTz8PZvYTiti9kpP8pivdIu4AkaKe9oZw6f3v/+OE4tlSmI7r+vXq/8J
 vw3TbOhf2ZRT758XKSfwA3u8TD97lRg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627893805;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I5ZYz9fLgLtmet/AAJ94QSQ15N6Q3rn5L5Ro1hd+Mfc=;
 b=9Y/NZ5x28yXfcxius2pjcpZklB5bJnQ1Y1UddRKA5XRYNd0uozZCcRjoLlATYfnlmd8Z4d
 qbNxIuTK1YLCcSDA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CED3713882;
 Mon,  2 Aug 2021 08:43:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RAxGMSywB2F4DgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Aug 2021 08:43:24 +0000
Subject: Re: [PATCH 01/14] drm/amdgpu: Convert to Linux IRQ interfaces
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stefan Agner <stefan@agner.ch>,
 alison.wang@nxp.com, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 anitha.chrisanthus@intel.com, Rob Clark <robdclark@gmail.com>,
 edmund.j.dea@intel.com, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-2-tzimmermann@suse.de>
 <24a8b2ab-ef38-219b-99d4-806a44fa6aba@amd.com>
 <CADnq5_MmPu=k3cc7JCg1iemkCDnoxR1T8PTD_VJn=58f5DwUNQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0c321c93-ea2f-d12a-7057-5724d2d855bd@suse.de>
Date: Mon, 2 Aug 2021 10:43:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CADnq5_MmPu=k3cc7JCg1iemkCDnoxR1T8PTD_VJn=58f5DwUNQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PsjSchzCspKwsrvk5k9QQpuItNe3YAbAi"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PsjSchzCspKwsrvk5k9QQpuItNe3YAbAi
Content-Type: multipart/mixed; boundary="VDtTFrcVvE2fwROOnsp9guKSMN1gIOB0M";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@linux.ie>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Brian Starkey <brian.starkey@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, bbrezillon@kernel.org,
 nicolas.ferre@microchip.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Stefan Agner <stefan@agner.ch>,
 alison.wang@nxp.com, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 anitha.chrisanthus@intel.com, Rob Clark <robdclark@gmail.com>,
 edmund.j.dea@intel.com, Sean Paul <sean@poorly.run>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sascha Hauer <kernel@pengutronix.de>, jyri.sarha@iki.fi, tomba@kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Message-ID: <0c321c93-ea2f-d12a-7057-5724d2d855bd@suse.de>
Subject: Re: [PATCH 01/14] drm/amdgpu: Convert to Linux IRQ interfaces
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-2-tzimmermann@suse.de>
 <24a8b2ab-ef38-219b-99d4-806a44fa6aba@amd.com>
 <CADnq5_MmPu=k3cc7JCg1iemkCDnoxR1T8PTD_VJn=58f5DwUNQ@mail.gmail.com>
In-Reply-To: <CADnq5_MmPu=k3cc7JCg1iemkCDnoxR1T8PTD_VJn=58f5DwUNQ@mail.gmail.com>

--VDtTFrcVvE2fwROOnsp9guKSMN1gIOB0M
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.21 um 16:03 schrieb Alex Deucher:
> On Wed, Jul 28, 2021 at 6:27 AM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
>>
>> Am 27.07.21 um 20:27 schrieb Thomas Zimmermann:
>>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>>> don't benefit from using it.
>>>
>>> DRM IRQ callbacks are now being called directly or inlined.
>>>
>>> The interrupt number returned by pci_msi_vector() is now stored
>>> in struct amdgpu_irq. Calls to pci_msi_vector() can fail and return
>>> a negative errno code. Abort initlaizaton in thi case. The DRM IRQ
>>> midlayer does not handle this correctly.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>
>> Alex needs to take a look at this as well, but of hand the patch is
>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>.
>=20
> Looks good to me as well:
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks a lot. Do you have comments on the changes to radeon?

Best regards
Thomas

>=20
>>
>> Thanks,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  1 -
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 21 ++++++++++++++-------=

>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h |  2 +-
>>>    3 files changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_drv.c
>>> index 2bd13fc2541a..1e05b5aa94e7 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>> @@ -1775,7 +1775,6 @@ static const struct drm_driver amdgpu_kms_drive=
r =3D {
>>>        .open =3D amdgpu_driver_open_kms,
>>>        .postclose =3D amdgpu_driver_postclose_kms,
>>>        .lastclose =3D amdgpu_driver_lastclose_kms,
>>> -     .irq_handler =3D amdgpu_irq_handler,
>>>        .ioctls =3D amdgpu_ioctls_kms,
>>>        .num_ioctls =3D ARRAY_SIZE(amdgpu_ioctls_kms),
>>>        .dumb_create =3D amdgpu_mode_dumb_create,
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_irq.c
>>> index 0d01cfaca77e..a36cdc7323f4 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>>> @@ -46,7 +46,6 @@
>>>    #include <linux/pci.h>
>>>
>>>    #include <drm/drm_crtc_helper.h>
>>> -#include <drm/drm_irq.h>
>>>    #include <drm/drm_vblank.h>
>>>    #include <drm/amdgpu_drm.h>
>>>    #include <drm/drm_drv.h>
>>> @@ -184,7 +183,7 @@ void amdgpu_irq_disable_all(struct amdgpu_device =
*adev)
>>>     * Returns:
>>>     * result of handling the IRQ, as defined by &irqreturn_t
>>>     */
>>> -irqreturn_t amdgpu_irq_handler(int irq, void *arg)
>>> +static irqreturn_t amdgpu_irq_handler(int irq, void *arg)
>>>    {
>>>        struct drm_device *dev =3D (struct drm_device *) arg;
>>>        struct amdgpu_device *adev =3D drm_to_adev(dev);
>>> @@ -307,6 +306,7 @@ static void amdgpu_restore_msix(struct amdgpu_dev=
ice *adev)
>>>    int amdgpu_irq_init(struct amdgpu_device *adev)
>>>    {
>>>        int r =3D 0;
>>> +     unsigned int irq;
>>>
>>>        spin_lock_init(&adev->irq.lock);
>>>
>>> @@ -349,15 +349,22 @@ int amdgpu_irq_init(struct amdgpu_device *adev)=

>>>        INIT_WORK(&adev->irq.ih2_work, amdgpu_irq_handle_ih2);
>>>        INIT_WORK(&adev->irq.ih_soft_work, amdgpu_irq_handle_ih_soft);=

>>>
>>> -     adev->irq.installed =3D true;
>>> -     /* Use vector 0 for MSI-X */
>>> -     r =3D drm_irq_install(adev_to_drm(adev), pci_irq_vector(adev->p=
dev, 0));
>>> +     /* Use vector 0 for MSI-X. */
>>> +     r =3D pci_irq_vector(adev->pdev, 0);
>>> +     if (r < 0)
>>> +             return r;
>>> +     irq =3D r;
>>> +
>>> +     /* PCI devices require shared interrupts. */
>>> +     r =3D request_irq(irq, amdgpu_irq_handler, IRQF_SHARED, adev_to=
_drm(adev)->driver->name,
>>> +                     adev_to_drm(adev));
>>>        if (r) {
>>> -             adev->irq.installed =3D false;
>>>                if (!amdgpu_device_has_dc_support(adev))
>>>                        flush_work(&adev->hotplug_work);
>>>                return r;
>>>        }
>>> +     adev->irq.installed =3D true;
>>> +     adev->irq.irq =3D irq;
>>>        adev_to_drm(adev)->max_vblank_count =3D 0x00ffffff;
>>>
>>>        DRM_DEBUG("amdgpu: irq initialized.\n");
>>> @@ -368,7 +375,7 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>>>    void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>>    {
>>>        if (adev->irq.installed) {
>>> -             drm_irq_uninstall(&adev->ddev);
>>> +             free_irq(adev->irq.irq, adev_to_drm(adev));
>>>                adev->irq.installed =3D false;
>>>                if (adev->irq.msi_enabled)
>>>                        pci_free_irq_vectors(adev->pdev);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_irq.h
>>> index 78ad4784cc74..e9f2c11ea416 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h
>>> @@ -80,6 +80,7 @@ struct amdgpu_irq_src_funcs {
>>>
>>>    struct amdgpu_irq {
>>>        bool                            installed;
>>> +     unsigned int                    irq;
>>>        spinlock_t                      lock;
>>>        /* interrupt sources */
>>>        struct amdgpu_irq_client        client[AMDGPU_IRQ_CLIENTID_MAX=
];
>>> @@ -100,7 +101,6 @@ struct amdgpu_irq {
>>>    };
>>>
>>>    void amdgpu_irq_disable_all(struct amdgpu_device *adev);
>>> -irqreturn_t amdgpu_irq_handler(int irq, void *arg);
>>>
>>>    int amdgpu_irq_init(struct amdgpu_device *adev);
>>>    void amdgpu_irq_fini_sw(struct amdgpu_device *adev);
>>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VDtTFrcVvE2fwROOnsp9guKSMN1gIOB0M--

--PsjSchzCspKwsrvk5k9QQpuItNe3YAbAi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEHsCwFAwAAAAAACgkQlh/E3EQov+Dm
nQ//R/Caj7yaimr9wM2UmBAHzaME1DOlVYAImXkh2gnTDN6adDkWktxtcNEgrcLitvnCX073Ic4n
lTIQ/0KNHGOil7VQxhPYEaNcl2sy6igR9sn/PwUDvK2cF4KMCknw9ZHuCe8F8DWsne3GZSXcB7cV
GIrFyXRTeJnQyYuH1ZvqsIIknxhzo8NdDTw/iF4F8qBHThObTIohceplLel7+7UF8EpDos3ukWMo
vBzDpkLbGMhdh/0gm5cxQPEo21Lteu6fGa87peGRXyGBFlet5cX4eG+elkmzpFIW1PfvjX8dyQn0
YiTr/C1Dob0tCsEejuUiIisvuEjkWnGOqg95+wwx9vsnZbp186eTj4KDXI9EFzWPPqHrB5C8hOhX
77HXJnjhIqfzID/rUz7rKNgAhLw14MxpunKyXPyNm+9PS5Myp8QADAcvO4raJREMJCUwTP/eWQRv
477/wM0bBTq8wrOycst0HPkVM8VSh9qdUTyWt1Q5JzAiSbjre3zknR2IVNcu2RnbaabyWKd5sXfl
8h0bUBDoxzsKZ+tXqVUb4sZuFtvRWtKFxc9aKM6m4INtcs6Topqtyt3vovjC0cGRZ0OxRVJHdF+w
SyRAsqz3m+NdAOPUMCC/ouDsBnpF69b+qFUKOEf1qqYghFioaTrTMiVaWQsPN3oYva/ParhFyLTo
geU=
=zdfM
-----END PGP SIGNATURE-----

--PsjSchzCspKwsrvk5k9QQpuItNe3YAbAi--
