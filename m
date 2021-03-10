Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC74334754
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 20:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9FE89CFA;
	Wed, 10 Mar 2021 19:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7265F89CFA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 19:02:35 +0000 (UTC)
Date: Wed, 10 Mar 2021 19:02:22 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/5] Add option to mmap GEM buffers cached
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-Id: <YVORPQ.MCVK409VD57J2@crapouillou.net>
In-Reply-To: <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <ab488f52-f93d-ff50-efc5-bbdceec99ecb@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, od@zcrc.me, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Le lun. 8 mars 2021 =E0 9:41, Thomas Zimmermann <tzimmermann@suse.de> a =

=E9crit :
> Hi Paul,
> =

> having individual functions for each mode only makes sense if the =

> decision is at compile time. But in patch 5, you're working around =

> your earlier design by introducing in-driver helpers that select the =

> correct CMA function.
> =

> In SHMEM helpers we have the flag map_wc in the GEM structure that =

> selects the pages caching mode (wc vs uncached). I think CMA should =

> use this design as well. Have a map_noncoherent flag in the CMA GEM =

> object and set it from the driver's implementation of =

> gem_create_object.

Is that a new addition? That severely reduces the patchset size, which =

is perfect.

I'll send a V3 then.

Cheers,
-Paul

> And in the long run, we could try to consolidate all drivers/helpers =

> mapping flags in struct drm_gem_object.
> =

> Best regards
> Thomas
> =

> Am 07.03.21 um 21:28 schrieb Paul Cercueil:
>> Rework of my previous patchset which added support for GEM buffers
>> backed by non-coherent memory to the ingenic-drm driver.
>> =

>> Having GEM buffers backed by non-coherent memory is interesting in
>> the particular case where it is faster to render to a non-coherent
>> buffer then sync the data cache, than to render to a write-combine
>> buffer, and (by extension) much faster than using a shadow buffer.
>> This is true for instance on some Ingenic SoCs, where even simple
>> blits (e.g. memcpy) are about three times faster using this method.
>> =

>> For the record, the previous patchset was accepted for 5.10 then had
>> to be reverted, as it conflicted with some changes made to the DMA =

>> API.
>> =

>> This new patchset is pretty different as it adds the functionality to
>> the DRM core. The first three patches add variants to existing =

>> functions
>> but with the "non-coherent memory" twist, exported as GPL symbols. =

>> The
>> fourth patch adds a function to be used with the damage helpers.
>> Finally, the last patch adds support for non-coherent GEM buffers to =

>> the
>> ingenic-drm driver. The functionality is enabled through a module
>> parameter, and is disabled by default.
>> =

>> Cheers,
>> -Paul
>> =

>> Paul Cercueil (5):
>>    drm: Add and export function drm_gem_cma_create_noncoherent
>>    drm: Add and export function drm_gem_cma_dumb_create_noncoherent
>>    drm: Add and export function drm_gem_cma_mmap_noncoherent
>>    drm: Add and export function drm_gem_cma_sync_data
>>    drm/ingenic: Add option to alloc cached GEM buffers
>> =

>>   drivers/gpu/drm/drm_gem_cma_helper.c      | 223 =

>> +++++++++++++++++++---
>>   drivers/gpu/drm/ingenic/ingenic-drm-drv.c |  49 ++++-
>>   drivers/gpu/drm/ingenic/ingenic-drm.h     |   4 +
>>   drivers/gpu/drm/ingenic/ingenic-ipu.c     |  14 +-
>>   include/drm/drm_gem_cma_helper.h          |  13 ++
>>   5 files changed, 273 insertions(+), 30 deletions(-)
>> =

> =

> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
