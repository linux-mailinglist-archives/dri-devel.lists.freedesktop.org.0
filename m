Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D7E667958
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AD210E905;
	Thu, 12 Jan 2023 15:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93DA10E90C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 15:32:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 gz9-20020a17090b0ec900b002290bda1b07so890558pjb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvNRo5TsbXJJ428tB14x7kU1AlvgmP7fU9qmiXnk6oM=;
 b=QDfSO1Am4vtsGOXiksfoxK4Viyu+BM5hWjfmy9GRQMHJ/moq8SRgAegjQ5J1FyrcBL
 wvWdJASZ9lw4VrpoxZMt+ciiSm0+o66EesUfyDYAE5E+w/ETxfQv9LywVHA136bEefqn
 UbjZJLHum5E7V7YubrCr5XvkG2MfY1X/lHhF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvNRo5TsbXJJ428tB14x7kU1AlvgmP7fU9qmiXnk6oM=;
 b=ZqI1IpX7F2EQaUKFna6LWPWskptnlsWcoG+jK06eoxTR+6Ty/+/bBy/uYrDwyLpLqR
 ujRyanovs4i2Q/sqOYcWd5Jjw+NG/E0xc/xSDAjylWYfKkEz4Ak2Wdf7QGpbBgcg3J2R
 X0RLWcny3pBMwW3BRT2oyEE6bed6rRIdayq/zuK+4nhWcT/nv13UrSav7ErXFKcrzaBn
 Pqd0a5iBXpRCNmG6OqPKtKEkPKcpF+CJ2CKD5PfmExzt6rw9xQ1Wwln1UQiMjfc5x9Dn
 kzIOZ2h+IN/lw4dV8/Mkrs2aBuow9vvQEnDkmPHGUd7YqNHkhK50LHz43XA7idmWuu8n
 9UeQ==
X-Gm-Message-State: AFqh2kpIgUjPSYPLxxzFJ5xXoM+gepwshiJdjyEJjLVdqZrQXxJwVf5W
 4DxvPn+ZktHIu549vvxhOjGPvSfzmsS8GBRK/4G+Cw==
X-Google-Smtp-Source: AMrXdXv2MoppONOGqdkEyjBeLdrqw13w0NYOWT7wBhK8e7avYxRNdmcM3IIRBOYC1g+YVx+mjNlKZtZYHggZh7NKnBY=
X-Received: by 2002:a17:902:b902:b0:190:e27b:b554 with SMTP id
 bf2-20020a170902b90200b00190e27bb554mr5183912plb.148.1673537560308; Thu, 12
 Jan 2023 07:32:40 -0800 (PST)
MIME-Version: 1.0
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
 <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
 <Y7/Z5dvADG6AspV3@phenom.ffwll.local>
 <8a154783-b433-c9b8-bfe5-286dde1258e9@suse.de>
 <Y7/kw+JdGCHJdptI@phenom.ffwll.local>
 <c4f8ffde-2226-cc1f-a5a8-d7462b92cb24@suse.de>
In-Reply-To: <c4f8ffde-2226-cc1f-a5a8-d7462b92cb24@suse.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 12 Jan 2023 16:32:28 +0100
Message-ID: <CAKMK7uGFHMiAKHMHioUa-Gvc9LhWnCeapzpiWoymiRyBEQG1Xg@mail.gmail.com>
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 12 Jan 2023 at 13:15, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>
> Hi
>
> Am 12.01.23 um 11:45 schrieb Daniel Vetter:
> > On Thu, Jan 12, 2023 at 11:24:13AM +0100, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 12.01.23 um 10:59 schrieb Daniel Vetter:
> >>> On Thu, Jan 12, 2023 at 10:04:48AM +0100, Thomas Zimmermann wrote:
> >>>> Hi
> >>>>
> >>>> Am 11.01.23 um 16:41 schrieb Daniel Vetter:
> >>>>> This one nukes all framebuffers, which is a bit much. In reality
> >>>>> gma500 is igpu and never shipped with anything discrete, so there s=
hould
> >>>>> not be any difference.
> >>>>>
> >>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>>> ---
> >>>>>     drivers/gpu/drm/gma500/psb_drv.c | 2 +-
> >>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma=
500/psb_drv.c
> >>>>> index cd9c73f5a64a..9b0daf90dc50 100644
> >>>>> --- a/drivers/gpu/drm/gma500/psb_drv.c
> >>>>> +++ b/drivers/gpu/drm/gma500/psb_drv.c
> >>>>> @@ -429,7 +429,7 @@ static int psb_pci_probe(struct pci_dev *pdev, =
const struct pci_device_id *ent)
> >>>>>            * TODO: Refactor psb_driver_load() to map vdc_reg earlie=
r. Then we
> >>>>>            *       might be able to read the framebuffer range from=
 the device.
> >>>>>            */
> >>>>> - ret =3D drm_aperture_remove_framebuffers(true, &driver);
> >>>>> + ret =3D drm_aperture_remove_conflicting_pci_framebuffers(pdev, &d=
river);
> >>>>
> >>>> This does not work. The comment just above the changed line explains=
 why.
> >>>> The device uses shared memory similar to other integrated Intel chip=
s. The
> >>>> console is somewhere in a 16 MiB range, which has been stolen by the=
 BIOS
> >>>> from main memory. There's only a 1 MiB memory range on the device to=
 program
> >>>> the device. Unless you want to refactor as described, this call has =
to cover
> >>>> the whole memory for now.
> >>>
> >>> Uh. So it's maybe not so pretty, but what if I just call both functio=
ns?
> >>
> >> That's ways more ugly IMHO.
> >>
> >>> That way we get the vga handling through the pci one, and the "make s=
ure
> >>> there's no fb left" through the other one. Plus comment of course.
> >>>
> >>> Otherwise we'd need to somehow keep the vga stuff in the non-pci path=
s,
> >>> and that just feels all kinds of wrong to me.
> >>
> >> With your patch applied, aperture_detach_devices() does all the work o=
f
> >> removing. I'd add the following internal functions:
> >>
> >> static void aperture_detach_head(bool is_primary)
> >> {
> >>      /*
> >>       * lengthy comment here
> >>       */
> >>      if (is_primary)
> >>              sysfb_disable()
> >> }
> >>
> >> static void aperture_detach_tail(bool remove_vga)
> >> {
> >>      if (remove_vga) {
> >>              aperture_detach_devices(VGA_PHYS_)
> >>              vga_remove_vgacon()
> >>      }
> >> }
> >>
> >> And call both of them at the beginning/end of
> >> aperture_remove_conflicting_devices() and
> >> aperture_remove_conflicting_pci_devices().
> >>
> >> You'd still need to primary argument to
> >> aperture_remove_conflicting_devices(), but there will be no code dupli=
cation
> >> with the aperture helpers and the purpose of each code fragment will b=
e
> >> clearer.
> >
> > Yeah I don't want the primary argument. Aside from this one case here i=
t's
> > not needed. Also by pushing this special case into the one driver that
> > needs it we keep it contained, instead of spreading it all around.
> > Inflicting a parameter on every (and in total we have a lot of callers =
of
> > this stuff) just because of gma500 does not seem like a good idea to me=
.
>
> Unfortunately, vgacon and vgaarb require a PCI device. I don't like the
> proposal, but maybe it's the best for now. So go ahead if you like. I do
> expect that this needs additional work in future, however.
>
> Just some more thoughts.
>
> Grep for drm_aperture_remove_framebuffers(). Within DRM there are really
> just 10 drivers calling this function (vs. 12 callers of
> drm_aperture_remove_conflicting_pci_framebuffers()). In fbdev, there are
> many callers of the PCI helper (~40) and apparently only 3 for the
> non-PCI one. The other drivers are panels, USB, MIPI, etc and don't
> interact with the system framebuffer. Compared to the overall number of
> drivers, we have surprisingly few 'traditional graphics cards' in DRM.

This is largely historical. fbdev is from the 90s, when we had the
huge explosion in largely pci graphics cards, because that was the
place where all the growth and hence drivers were. 80% of these
companies/chipe all died within a short few years.

kms otoh had the huge growth in the 2010s, where there was the tail
end of the SoC mobile explosion, so that's where we have tons of
drivers. If you look at staging there's a pile more fbdev drivers for
SoC, but many of these never got beyond the "vendor hacked some stuff
together and shipped it" stage. So that's probably why they lack
polish like fw -> driver handover (most of these just booted directly
to the driver in real products).

> Another thing is that gma500 and the other 9 drivers simply don't bother
> to get the framebuffer range. They should be reworked to fetch the
> configured framebuffer from the device and release that region only. The
> practical impact is close to zero, so it hasn't happened.

I think that's ok, because trying to figure out the real fb means you
need fairly complete hw state readout (otherwise there's no
motivation), and i915 is the only driver that ever really did that.
Just for fw driver removal "nuke everything" gets the job done.
-Daniel

> Best regards
> Thomas
>
>
> > -Daniel
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
