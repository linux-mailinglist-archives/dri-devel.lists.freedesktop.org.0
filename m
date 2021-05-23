Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27D38DC95
	for <lists+dri-devel@lfdr.de>; Sun, 23 May 2021 21:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585DE6E550;
	Sun, 23 May 2021 19:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC676E550
 for <dri-devel@lists.freedesktop.org>; Sun, 23 May 2021 19:19:41 +0000 (UTC)
Date: Sun, 23 May 2021 20:19:27 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v5 0/3] Add option to mmap GEM buffers cached
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <F0RKTQ.VPIWIN1LS7JH3@crapouillou.net>
In-Reply-To: <452b2228-2415-69d7-9212-51707daf8616@suse.de>
References: <20210523170415.90410-1-paul@crapouillou.net>
 <452b2228-2415-69d7-9212-51707daf8616@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le dim., mai 23 2021 at 21:05:30 +0200, Thomas Zimmermann=20
<tzimmermann@suse.de> a =E9crit :
> Hi
>=20
> Am 23.05.21 um 19:04 schrieb Paul Cercueil:
>> V5 of my patchset which adds the option for having GEM buffers=20
>> backed by
>> non-coherent memory.
>>=20
>> Changes from V4:
>>=20
>> - [2/3]:
>>      - Rename to drm_fb_cma_sync_non_coherent
>>      - Invert loops for better cache locality
>>      - Only sync BOs that have the non-coherent flag
>>      - Properly sort includes
>>      - Move to drm_fb_cma_helper.c to avoid circular dependency
>=20
> I'm pretty sure it's still not the right place. That would be=20
> something like drm_gem_cma_atomic_helper.c, but creating a new file=20
> just for a single function doesn't make sense.

drm_fb_cma_sync_non_coherent calls drm_fb_cma_* functions, so it's a=20
better match than its former location (which wasn't good as it created=20
a circular dependency between drm.ko and drm-kms-helper.ko).

Do you have a better idea?

>>=20
>> - [3/3]:
>>      - Fix drm_atomic_get_new_plane_state() used to retrieve the old
>>        state
>>      - Use custom drm_gem_fb_create()
>=20
> It's often a better choice to express such differences via different=20
> data structures (i.e., different instances of drm_mode_config_funcs)=20
> but it's not a big deal either.

The different drm_mode_config_funcs instances already exist in=20
drm_gem_framebuffer_helper.c but are static, and drm_gem_fb_create()=20
and drm_gem_fb_create_with_dirty() are just tiny wrappers around=20
drm_gem_fb_create_with_funcs() with the corresponding=20
drm_mode_config_funcs instance. I didn't want to copy them to=20
ingenic-drm-drv.c, but maybe I can export the symbols and use=20
drm_gem_fb_create_with_funcs() directly?

> Please go ahaed and merge if no one objects. All patches:
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks!

Cheers,
-Paul

> Best regards
> Thomas
>=20
>>      - Only check damage clips and sync DMA buffers if non-coherent
>>        buffers are used
>>=20
>> Cheers,
>> -Paul
>>=20
>> Paul Cercueil (3):
>>    drm: Add support for GEM buffers backed by non-coherent memory
>>    drm: Add and export function drm_fb_cma_sync_non_coherent
>>    drm/ingenic: Add option to alloc cached GEM buffers
>>=20
>>   drivers/gpu/drm/drm_fb_cma_helper.c       | 46 ++++++++++++++++++
>>   drivers/gpu/drm/drm_gem_cma_helper.c      | 38 +++++++++++----
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 59=20
>> +++++++++++++++++++++--
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |  1 +
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     | 21 ++++++--
>>   include/drm/drm_fb_cma_helper.h           |  4 ++
>>   include/drm/drm_gem_cma_helper.h          |  3 ++
>>   7 files changed, 156 insertions(+), 16 deletions(-)
>>=20
>=20
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
>=20


