Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C6E613158
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 08:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E8510E139;
	Mon, 31 Oct 2022 07:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 34520 seconds by postgrey-1.36 at gabe;
 Mon, 31 Oct 2022 07:44:33 UTC
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CDED10E139
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 07:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667202264;
 s=strato-dkim-0002; d=goldelico.com;
 h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=jv9ooLMzbO12bD4+S6n1GQs3cXKFE7MBsIjT0Y/ZaEg=;
 b=FZe5vElCrfNPeBgFqJx1KeZL8Yd/5HHUHHDO0xO5nEh6zga6CO3mOaTdka6BZSOIHZ
 O3SakcOl63FWN87mxVit3EucHOa7IgqeKYxWRlyIXecwOwjzhv03uEJs9fqxuuosTBJz
 9zBVcpB9s95mQkv1asIfgWECaxdIf+0lJlhZ82tpo6ywl8swtaDlh57rKaJn6HIaNpg0
 i4octuaW2Uo1yEta/1rPsxuD2EPuIh4D6Fy2I9xQqkFd3N++rrIrIMvXXmnITYTiIL5E
 ups2t/0OR+LUKgZojAXzrXI4U0Do9CRmg/nGwbnmlYxJYN++LSo7AW8NlbMnqmF5MgDM
 528g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGerXQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id v55d69y9V7iNMbh
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 31 Oct 2022 08:44:23 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
Date: Mon, 31 Oct 2022 08:44:23 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <F3F3E8E1-7907-46A4-A670-CAEF6C3DB083@goldelico.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
 <0000784a-ae89-1081-0ec7-fc77d3381545@gmail.com>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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
Cc: tomba@kernel.org, Tony Lindgren <tony@atomide.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ivaylo,

> Am 31.10.2022 um 08:05 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>=20
> HI Nikolaus,
>=20
> On 31.10.22 =D0=B3. 0:08 =D1=87., H. Nikolaus Schaller wrote:
>> Hi Ivaylo,
>> it took a while until I found time to test newer kernels (mainline + =
Letux additions)
>> on the OMAP5 Pyra but unfortunately I did not get screen display for =
v6.1. Even worse,
>> the console was flooded by
>=20
> Could you elaborate on that - do you have anything on the display =
(during boot or dunno). Do you have simplefb enabled, so boot log to be =
visible on the display?

No bootlog enabled but I have some printk in the panel driver. It is =
initially enabled, then disabled and enabled again. Then the issues =
start...

> Is that wayland you are trying to run? Do you have PVR driver enabled? =
Did you try to boot vanilla kernel?

I have tested with Debian Stretch with standard Xorg with "omap" driver. =
PVR is not enabled. And without your patch everything is fine on all =
kernels since 4.something.

Vanilla kernel can not be booted on that machine - there is not even a =
device tree...

>=20
>> [   39.419846] WARNING: CPU: 0 PID: 3673 at =
drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
>> [   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET =
GPMC (Idle): Data Access in Supervisor mode during Functional access
>> ...
>=20
> I have no idea what that error is supposed to mean. @Tony?

A coincidence is that the display is sometimes showing some artistic =
patterns. So maybe DMA accesses non-existing memory?

>=20
>> making the system unuseable.
>> After doing some manual bisect by installing different kernel =
versions on the boot SD card,
>> I was able to identify that it crept in between v5.18 and v5.19-rc1. =
A git bisect on this
>> range (adding Letux patches on top of each bisect base) did reveal =
this patch as the first bad one.
>> After reverting it seems as if I can use any v5.19 .. v6.1-rc2 kernel =
without issues.
>> Now I wonder why this patch breaks my system?
>=20
> A wild guess - omap5 has some cache issues (as is visible from =
7cb0d6c17b96b8bf3c25de2dfde4fdeb9191f4c3), which lead to the above. =
Before the patch *all* access to the BO backing memory was done through =
TILER/DMM, mitigating the issue. After the patch, whoever tries to =
render to non-scanout buffer is doing it directly to the memory, causing =
the issue.
>=20
> Another possibility - someone assumes that memory is always linear, =
which is true when it is accessed through DMM, but it is not after the =
patch. Do you have my "drm: pvrsgx: dmabuf import - Do not assume =
scatterlist memory is contiguous" patch in your PVR driver? Maybe there =
is another driver that lacks similar patch.

Yes, it is included.

Best regards,
Nikolaus

>=20
> Regards,
> Ivo
>=20
>> BR and thanks,
>> Nikolaus
>>> Am 19.01.2022 um 11:23 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>>>=20
>>> On devices with DMM, all allocations are done through either DMM or =
TILER.
>>> DMM/TILER being a limited resource means that such allocations will =
start
>>> to fail before actual free memory is exhausted. What is even worse =
is that
>>> with time DMM/TILER space gets fragmented to the point that even if =
we have
>>> enough free DMM/TILER space and free memory, allocation fails =
because there
>>> is no big enough free block in DMM/TILER space.
>>>=20
>>> Such failures can be easily observed with OMAP xorg DDX, for example =
-
>>> starting few GUI applications (so buffers for their windows are =
allocated)
>>> and then rotating landscape<->portrait while closing and opening new
>>> windows soon results in allocation failures.
>>>=20
>>> Fix that by mapping buffers through DMM/TILER only when really =
needed,
>>> like, for scanout buffers.
>>>=20
>>> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
>>> ---
>>> drivers/gpu/drm/omapdrm/omap_gem.c | 12 ++++++++----
>>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c =
b/drivers/gpu/drm/omapdrm/omap_gem.c
>>> index 41c1a6d..cf57179 100644
>>> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
>>> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
>>> @@ -821,10 +821,12 @@ int omap_gem_pin(struct drm_gem_object *obj, =
dma_addr_t *dma_addr)
>>> 			if (ret)
>>> 				goto fail;
>>>=20
>>> -			if (priv->has_dmm) {
>>> -				ret =3D omap_gem_pin_tiler(obj);
>>> -				if (ret)
>>> -					goto fail;
>>> +			if (omap_obj->flags & OMAP_BO_SCANOUT) {
>>> +				if (priv->has_dmm) {
>>> +					ret =3D omap_gem_pin_tiler(obj);
>>> +					if (ret)
>>> +						goto fail;
>>> +				}
>>> 			}
>>> 		} else {
>>> 			refcount_inc(&omap_obj->pin_cnt);
>>> @@ -861,6 +863,8 @@ static void omap_gem_unpin_locked(struct =
drm_gem_object *obj)
>>> 			kfree(omap_obj->sgt);
>>> 			omap_obj->sgt =3D NULL;
>>> 		}
>>> +		if (!(omap_obj->flags & OMAP_BO_SCANOUT))
>>> +			return;
>>> 		if (priv->has_dmm) {
>>> 			ret =3D tiler_unpin(omap_obj->block);
>>> 			if (ret) {
>>> --=20
>>> 1.9.1
>>>=20

