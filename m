Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E2328711E
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 11:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017EF6E0F0;
	Thu,  8 Oct 2020 09:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E286E0F0;
 Thu,  8 Oct 2020 09:00:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE3E3AF4D;
 Thu,  8 Oct 2020 09:00:25 +0000 (UTC)
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
 <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
 <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
 <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5c0dc0bf-b4ca-db84-708e-74a5b033018f@suse.de>
Date: Thu, 8 Oct 2020 11:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>
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
Cc: Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Qiang Yu <yuq825@gmail.com>,
 Kukjin Kim <kgene@kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0782968542=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0782968542==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1RRRYtJ6APQmd6LeI1KMPbGtdio7fZVjb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1RRRYtJ6APQmd6LeI1KMPbGtdio7fZVjb
Content-Type: multipart/mixed; boundary="jDFbYBZf8kdKgUAVGHXxfA7MPXZztPeOO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Wilson, Chris" <chris@chris-wilson.co.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
 <spice-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, Hans de Goede <hdegoede@redhat.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Kukjin Kim <kgene@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Message-ID: <5c0dc0bf-b4ca-db84-708e-74a5b033018f@suse.de>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
 <20201002095830.GH438822@phenom.ffwll.local>
 <5bf40546-8da9-1649-22da-a982f1e8d9c3@suse.de>
 <CAKMK7uEu0vwiG9Uz0_Ysyus0ZAF-1HNxvPZjcG3xZS=gkKgJLw@mail.gmail.com>
 <26ac0446-9e16-1ca1-7407-3d0cd7125e0e@suse.de>
 <09d634d0-f20a-e9a9-d8d2-b50e8aaf156f@amd.com>
 <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>
In-Reply-To: <CAKMK7uEPn=q1J50koveE+b49r=SE0eh5nTrxWOVRN2grdyNPTA@mail.gmail.com>

--jDFbYBZf8kdKgUAVGHXxfA7MPXZztPeOO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 07.10.20 um 16:30 schrieb Daniel Vetter:
> On Wed, Oct 7, 2020 at 3:25 PM Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
>>
>> Am 07.10.20 um 15:20 schrieb Thomas Zimmermann:
>>> Hi
>>>
>>> Am 07.10.20 um 15:10 schrieb Daniel Vetter:
>>>> On Wed, Oct 7, 2020 at 2:57 PM Thomas Zimmermann <tzimmermann@suse.d=
e> wrote:
>>>>> Hi
>>>>>
>>>>> Am 02.10.20 um 11:58 schrieb Daniel Vetter:
>>>>>> On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
>>>>>>> On Wed, Sep 30, 2020 at 2:34 PM Christian K=C3=B6nig
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 30.09.20 um 11:47 schrieb Daniel Vetter:
>>>>>>>>> On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=C3=B6nig =
wrote:
>>>>>>>>>> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
>>>>>>>>>>> Hi
>>>>>>>>>>>
>>>>>>>>>>> Am 30.09.20 um 10:05 schrieb Christian K=C3=B6nig:
>>>>>>>>>>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
>>>>>>>>>>>>> Hi Christian
>>>>>>>>>>>>>
>>>>>>>>>>>>> Am 29.09.20 um 17:35 schrieb Christian K=C3=B6nig:
>>>>>>>>>>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
>>>>>>>>>>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address=
 and location
>>>>>>>>>>>>>>> from and instance of TTM's kmap_obj and initializes struc=
t dma_buf_map
>>>>>>>>>>>>>>> with these values. Helpful for TTM-based drivers.
>>>>>>>>>>>>>> We could completely drop that if we use the same structure=
 inside TTM as
>>>>>>>>>>>>>> well.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Additional to that which driver is going to use this?
>>>>>>>>>>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers=
 will
>>>>>>>>>>>>> retrieve the pointer via this function.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I do want to see all that being more tightly integrated int=
o TTM, but
>>>>>>>>>>>>> not in this series. This one is about fixing the bochs-on-s=
parc64
>>>>>>>>>>>>> problem for good. Patch 7 adds an update to TTM to the DRM =
TODO list.
>>>>>>>>>>>> I should have asked which driver you try to fix here :)
>>>>>>>>>>>>
>>>>>>>>>>>> In this case just keep the function inside bochs and only fi=
x it there.
>>>>>>>>>>>>
>>>>>>>>>>>> All other drivers can be fixed when we generally pump this t=
hrough TTM.
>>>>>>>>>>> Did you take a look at patch 3? This function will be used by=
 VRAM
>>>>>>>>>>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it =
here, we
>>>>>>>>>>> have to duplicate the functionality in each if these drivers.=
 Bochs
>>>>>>>>>>> itself uses VRAM helpers and doesn't touch the function direc=
tly.
>>>>>>>>>> Ah, ok can we have that then only in the VRAM helpers?
>>>>>>>>>>
>>>>>>>>>> Alternative you could go ahead and use dma_buf_map in ttm_bo_k=
map_obj
>>>>>>>>>> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
>>>>>>>>>>
>>>>>>>>>> What I want to avoid is to have another conversion function in=
 TTM because
>>>>>>>>>> what happens here is that we already convert from ttm_bus_plac=
ement to
>>>>>>>>>> ttm_bo_kmap_obj and then to dma_buf_map.
>>>>>>>>> Hm I'm not really seeing how that helps with a gradual conversi=
on of
>>>>>>>>> everything over to dma_buf_map and assorted helpers for access?=
 There's
>>>>>>>>> too many places in ttm drivers where is_iomem and related stuff=
 is used to
>>>>>>>>> be able to convert it all in one go. An intermediate state with=
 a bunch of
>>>>>>>>> conversions seems fairly unavoidable to me.
>>>>>>>> Fair enough. I would just have started bottom up and not top dow=
n.
>>>>>>>>
>>>>>>>> Anyway feel free to go ahead with this approach as long as we ca=
n remove
>>>>>>>> the new function again when we clean that stuff up for good.
>>>>>>> Yeah I guess bottom up would make more sense as a refactoring. Bu=
t the
>>>>>>> main motivation to land this here is to fix the __mmio vs normal
>>>>>>> memory confusion in the fbdev emulation helpers for sparc (and
>>>>>>> anything else that needs this). Hence the top down approach for
>>>>>>> rolling this out.
>>>>>> Ok I started reviewing this a bit more in-depth, and I think this =
is a bit
>>>>>> too much of a de-tour.
>>>>>>
>>>>>> Looking through all the callers of ttm_bo_kmap almost everyone map=
s the
>>>>>> entire object. Only vmwgfx uses to map less than that. Also, every=
one just
>>>>>> immediately follows up with converting that full object map into a=

>>>>>> pointer.
>>>>>>
>>>>>> So I think what we really want here is:
>>>>>> - new function
>>>>>>
>>>>>> int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *=
map);
>>>>>>
>>>>>>    _vmap name since that's consistent with both dma_buf functions =
and
>>>>>>    what's usually used to implement this. Outside of the ttm world=
 kmap
>>>>>>    usually just means single-page mappings using kmap() or it's io=
mem
>>>>>>    sibling io_mapping_map* so rather confusing name for a function=
 which
>>>>>>    usually is just used to set up a vmap of the entire buffer.
>>>>>>
>>>>>> - a helper which can be used for the drm_gem_object_funcs vmap/vun=
map
>>>>>>    functions for all ttm drivers. We should be able to make this f=
ully
>>>>>>    generic because a) we now have dma_buf_map and b) drm_gem_objec=
t is
>>>>>>    embedded in the ttm_bo, so we can upcast for everyone who's bot=
h a ttm
>>>>>>    and gem driver.
>>>>>>
>>>>>>    This is maybe a good follow-up, since it should allow us to dit=
ch quite
>>>>>>    a bit of the vram helper code for this more generic stuff. I al=
so might
>>>>>>    have missed some special-cases here, but from a quick look ever=
ything
>>>>>>    just pins the buffer to the current location and that's it.
>>>>>>
>>>>>>    Also this obviously requires Christian's generic ttm_bo_pin rew=
ork
>>>>>>    first.
>>>>>>
>>>>>> - roll the above out to drivers.
>>>>>>
>>>>>> Christian/Thomas, thoughts on this?
>>>>> I agree on the goals, but what is the immediate objective here?
>>>>>
>>>>> Adding ttm_bo_vmap() does not work out easily, as struct ttm_bo_kma=
p_obj
>>>>> is a central part of the internals of TTM. struct ttm_bo_kmap_obj h=
as
>>>>> more internal state that struct dma_buf_map, so they are not easily=

>>>>> convertible either. What you propose seems to require a reimplement=
ation
>>>>> of the existing ttm_bo_kmap() code. That is it's own patch series.
>>>>>
>>>>> I'd rather go with some variant of the existing patch and add
>>>>> ttm_bo_vmap() in a follow-up.
>>>> ttm_bo_vmap would simply wrap what you currently open-code as
>>>> ttm_bo_kmap + ttm_kmap_obj_to_dma_buf_map. Removing ttm_kmap_obj wou=
ld
>>>> be a much later step. Why do you think adding ttm_bo_vmap is not
>>>> possible?
>>> The calls to ttm_bo_kmap/_kunmap() require an instance of struct
>>> ttm_bo_kmap_obj that is stored in each driver's private bo structure
>>> (e.g., struct drm_gem_vram_object, struct radeon_bo, etc). When I mad=
e
>>> patch 3, I flirted with the idea of unifying the driver's _vmap code =
in
>>> a shared helper, but I couldn't find a simple way of doing it. That's=

>>> why it's open-coded in the first place.
>=20
> Yeah we'd need a ttm_bo_vunmap I guess to make this work. Which
> shouldn't be more than a few lines, but maybe too much to do in this
> series.
>=20
>> Well that makes kind of sense. Keep in mind that ttm_bo_kmap is
>> currently way to complicated.
>=20
> Yeah, simplifying this into a ttm_bo_vmap on one side, and a simple
> 1-page kmap helper on the other should help a lot.

I'm not too happy about the plan, but I'll send out something like this
in the next iteration.

Best regards
Thomas

> -Daniel
>=20
>>
>> Christian.
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> -Daniel
>>>>
>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>>>>> I think for the immediate need of rolling this out for vram helper=
s and
>>>>>> fbdev code we should be able to do this, but just postpone the dri=
ver wide
>>>>>> roll-out for now.
>>>>>>
>>>>>> Cheers, Daniel
>>>>>>
>>>>>>> -Daniel
>>>>>>>
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> -Daniel
>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>>> Best regards
>>>>>>>>>>> Thomas
>>>>>>>>>>>
>>>>>>>>>>>> Regards,
>>>>>>>>>>>> Christian.
>>>>>>>>>>>>
>>>>>>>>>>>>> Best regards
>>>>>>>>>>>>> Thomas
>>>>>>>>>>>>>
>>>>>>>>>>>>>> Regards,
>>>>>>>>>>>>>> Christian.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>      include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++=
++++++
>>>>>>>>>>>>>>>      include/linux/dma-buf-map.h  | 20 ++++++++++++++++++=
++
>>>>>>>>>>>>>>>      2 files changed, 44 insertions(+)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/t=
tm/ttm_bo_api.h
>>>>>>>>>>>>>>> index c96a25d571c8..62d89f05a801 100644
>>>>>>>>>>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
>>>>>>>>>>>>>>> @@ -34,6 +34,7 @@
>>>>>>>>>>>>>>>      #include <drm/drm_gem.h>
>>>>>>>>>>>>>>>      #include <drm/drm_hashtab.h>
>>>>>>>>>>>>>>>      #include <drm/drm_vma_manager.h>
>>>>>>>>>>>>>>> +#include <linux/dma-buf-map.h>
>>>>>>>>>>>>>>>      #include <linux/kref.h>
>>>>>>>>>>>>>>>      #include <linux/list.h>
>>>>>>>>>>>>>>>      #include <linux/wait.h>
>>>>>>>>>>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_vir=
tual(struct
>>>>>>>>>>>>>>> ttm_bo_kmap_obj *map,
>>>>>>>>>>>>>>>          return map->virtual;
>>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>>>      +/**
>>>>>>>>>>>>>>> + * ttm_kmap_obj_to_dma_buf_map
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_=
kmap.
>>>>>>>>>>>>>>> + * @map: Returns the mapping as struct dma_buf_map
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map=
=2E If the memory
>>>>>>>>>>>>>>> + * is not mapped, the returned mapping is initialized to=
 NULL.
>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct tt=
m_bo_kmap_obj
>>>>>>>>>>>>>>> *kmap,
>>>>>>>>>>>>>>> +                           struct dma_buf_map *map)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +    bool is_iomem;
>>>>>>>>>>>>>>> +    void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem=
);
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>> +    if (!vaddr)
>>>>>>>>>>>>>>> +        dma_buf_map_clear(map);
>>>>>>>>>>>>>>> +    else if (is_iomem)
>>>>>>>>>>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force _=
_iomem *)vaddr);
>>>>>>>>>>>>>>> +    else
>>>>>>>>>>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>      /**
>>>>>>>>>>>>>>>       * ttm_bo_kmap
>>>>>>>>>>>>>>>       *
>>>>>>>>>>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/=
dma-buf-map.h
>>>>>>>>>>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
>>>>>>>>>>>>>>> --- a/include/linux/dma-buf-map.h
>>>>>>>>>>>>>>> +++ b/include/linux/dma-buf-map.h
>>>>>>>>>>>>>>> @@ -45,6 +45,12 @@
>>>>>>>>>>>>>>>       *
>>>>>>>>>>>>>>>       *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
>>>>>>>>>>>>>>>       *
>>>>>>>>>>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_=
vaddr_iomem().
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + * .. code-block:: c
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>>       * Test if a mapping is valid with either dma_buf_ma=
p_is_set() or
>>>>>>>>>>>>>>>       * dma_buf_map_is_null().
>>>>>>>>>>>>>>>       *
>>>>>>>>>>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_v=
addr(struct
>>>>>>>>>>>>>>> dma_buf_map *map, void *vaddr)
>>>>>>>>>>>>>>>          map->is_iomem =3D false;
>>>>>>>>>>>>>>>      }
>>>>>>>>>>>>>>>      +/**
>>>>>>>>>>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping =
structure to
>>>>>>>>>>>>>>> an address in I/O memory
>>>>>>>>>>>>>>> + * @map:        The dma-buf mapping structure
>>>>>>>>>>>>>>> + * @vaddr_iomem:    An I/O-memory address
>>>>>>>>>>>>>>> + *
>>>>>>>>>>>>>>> + * Sets the address and the I/O-memory flag.
>>>>>>>>>>>>>>> + */
>>>>>>>>>>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dm=
a_buf_map *map,
>>>>>>>>>>>>>>> +                           void __iomem *vaddr_iomem)
>>>>>>>>>>>>>>> +{
>>>>>>>>>>>>>>> +    map->vaddr_iomem =3D vaddr_iomem;
>>>>>>>>>>>>>>> +    map->is_iomem =3D true;
>>>>>>>>>>>>>>> +}
>>>>>>>>>>>>>>> +
>>>>>>>>>>>>>>>      /**
>>>>>>>>>>>>>>>       * dma_buf_map_is_equal - Compares two dma-buf mappi=
ng structures
>>>>>>>>>>>>>>> for equality
>>>>>>>>>>>>>>>       * @lhs:    The dma-buf mapping structure
>>>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=
=3D02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b=
8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sda=
ta=3DHdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D=
0
>>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>>> amd-gfx mailing list
>>>>>>>>>>>>> amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D=
02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7=
C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3D=
H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
>>>>>>>>>>>> _______________________________________________
>>>>>>>>>>>> dri-devel mailing list
>>>>>>>>>>>> dri-devel@lists.freedesktop.org
>>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D=
02%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7=
C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3D=
HdHOA%2F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
>>>>>>>>>>>>
>>>>>>>>>>> _______________________________________________
>>>>>>>>>>> amd-gfx mailing list
>>>>>>>>>>> amd-gfx@lists.freedesktop.org
>>>>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02=
%7C01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3D=
H%2B5HKCsTrksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
>>>>>>>
>>>>>>> --
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> http://blog.ffwll.ch
>>>>> --
>>>>> Thomas Zimmermann
>>>>> Graphics Driver Developer
>>>>> SUSE Software Solutions Germany GmbH
>>>>> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
>>>>> (HRB 36809, AG N=C3=BCrnberg)
>>>>> Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer
>>>>>
>>>>
>>
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--jDFbYBZf8kdKgUAVGHXxfA7MPXZztPeOO--

--1RRRYtJ6APQmd6LeI1KMPbGtdio7fZVjb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9+1SUUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiNwWAf/Z6wurJbb9OHAKU2vC2UR7c+Pe4lu
/ZDIyVbUQzqpuG6kUt56Ei9bxPOuvbzMeimdkcpxCZHJn+R/yC2/0V4kzm8vHdV3
CPCdGSSWYEw52VeWQQLuibonRRB0BrCrCBm3pjfxh6S1cYhmDIHP7+wpTuNGLgE9
7MFOn5/KrTbDEeZdbrbgOBRbGPvUWdVAIeqLxWKBxveDEVjlvonQ3HxmFa8Gfjiv
bRSIkCJBGC1Idnddu8kE1hJKiftVE7aT/mOQeU4uGe+8laj9QvS9O3kZrWY2sfGX
KyENY1fBryoXsnEQQIcl3vy5ZELHlD0XHZnUf0kYnbjnXSY8mXdI2BSuMg==
=s7Qc
-----END PGP SIGNATURE-----

--1RRRYtJ6APQmd6LeI1KMPbGtdio7fZVjb--

--===============0782968542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0782968542==--
