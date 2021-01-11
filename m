Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D915A2F1AB7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 17:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164876E106;
	Mon, 11 Jan 2021 16:17:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1312E6E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 16:17:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id i9so364884wrc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 08:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PFfOMnMUvCXZoGavvI7jgp9lu2mi/boaKsLt1jdkV5Q=;
 b=EnIeQoYvAkibxFcvyJbtZ9bpK2Itc2GTfUajOD6SpjxbVmmI2paMOrA8cUULohQmjc
 1vgCyorUpj99XRl7OG2YCL2xD5TxCYL9bHKRdIrQwp9Go5dhe4fHOjrMlgcmj/XfLx0U
 +2iFUWYFCXCPCs47IzfHLNxFBtXc+vz5MDUPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PFfOMnMUvCXZoGavvI7jgp9lu2mi/boaKsLt1jdkV5Q=;
 b=QbQi6HsuWMg6aiFXtgHObaGeGARIKj5nhVxyOXIPYOFHGnn+ond8MkxA1NiprpanZ4
 MnqvS9oG7HHWSRMq7Nr4oSJmF9zxTbcdk+IkhxANOyDpNlCIFPFjFlX51LQguJAKvvua
 uTrVdkI/PZU9fSOOagyC1QDcpOGJq030UZsqttm/azGTqoOeCPVeyHQfp2DuOIjHDPh4
 tBLDX/M95Kv+emP/VeLqbd1FdAsrn+lsueRwZuRr3lBl+P+3iH80VZHc2+FiMchEHV3E
 8GtZedIW57SzFOsmDu3JhjeVmjyI98I8maNhYsjD/ACDxk+wD03+lLVQbm1F01w+Oau9
 KJrA==
X-Gm-Message-State: AOAM531pasKD1sPaPuqIsEHQQyq+w08J9wY6rs8g7cJdnHrseiIbdMBK
 wBIXv+w/0Y129tXKYJksBVARmg==
X-Google-Smtp-Source: ABdhPJwDp8ZDAsTmKngfRKZUOq0MlyK+j4rc7OjdUXUG2+CLLcdyU6ZUE4TltnrNJUedJtb2wvaf1g==
X-Received: by 2002:a5d:6502:: with SMTP id x2mr17306933wru.254.1610381842727; 
 Mon, 11 Jan 2021 08:17:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h9sm323464wme.11.2021.01.11.08.17.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 08:17:21 -0800 (PST)
Date: Mon, 11 Jan 2021 17:17:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
Message-ID: <X/x6EP1HE/sjQla0@phenom.ffwll.local>
References: <20210105182309.1362-1-christian.koenig@amd.com>
 <X/dN/YFtnVAIllds@phenom.ffwll.local>
 <ffa9d7f2-fe68-fb6a-8422-82b8949dbe1e@gmail.com>
 <X/hs1Rvm57zGPU8y@phenom.ffwll.local>
 <d066b08c-756c-bbef-0f30-d8c68ef92dbf@amd.com>
 <CAKMK7uGcRM8E0hYZeJCUuON7+uZnyEVtwU0HrNwhoWcw9V2uNA@mail.gmail.com>
 <42d82248-0bec-ea1c-8d6e-d032a2e53c43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42d82248-0bec-ea1c-8d6e-d032a2e53c43@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Huang Rui <ray.huang@amd.com>,
 Borislav Petkov <bp@alien8.de>, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 11, 2021 at 11:16:13AM +0100, Christian K=F6nig wrote:
> Am 08.01.21 um 16:53 schrieb Daniel Vetter:
> > On Fri, Jan 8, 2021 at 3:36 PM Christian K=F6nig <christian.koenig@amd.=
com> wrote:
> > > Am 08.01.21 um 15:31 schrieb Daniel Vetter:
> > > > On Thu, Jan 07, 2021 at 09:08:29PM +0100, Christian K=F6nig wrote:
> > > > > Am 07.01.21 um 19:07 schrieb Daniel Vetter:
> > > > > > On Tue, Jan 05, 2021 at 07:23:08PM +0100, Christian K=F6nig wro=
te:
> > > > > > > Drivers are not supposed to init the page pool directly any m=
ore.
> > > > > > > =

> > > > > > > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> > > > > > Please include reported-by credits and link to the bug reports =
on
> > > > > > lore.kernel.org when merging this. Also I guess this should hav=
e a Fixes:
> > > > > > line?
> > > > > I'm not aware of a bug report, but the reported-by/Fixes lines ar=
e indeed
> > > > > missing.
> > > > This one here:
> > > > =

> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flore.kernel.org%2Fdri-devel%2F20201231104020.GA4504%40zn.tnic%2F&amp;data=
=3D04%7C01%7Cchristian.koenig%40amd.com%7C3aede203348b4f32ea3108d8b3e224ec%=
7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637457131179258488%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;sdata=3DbHVw4lj1f8g4ohVTeuKNkb0LAbLwY6N4KWortr3VtAo%3D&amp;=
reserved=3D0
> > > > =

> > > > Or did I get confused, and the above is yet another bug?
> > > Yeah, but that was just reported by mail. The bug tracker I've saw was
> > > opened after the patch was already pushed.
> > Still good to give reported-by credits for mailing list reports and
> > link to lore.kernel.org for the report, that's not just useful for
> > bugzilla reports.
> =

> That's indeed true, but I was distracted by the fact that drm-misc-fixes
> wasn't up to date :)
> =

> Going to add that earlier next time.
> =

> > > > > BTW: Any idea why dim add-link doesn't work?
> > > > Hm we occasionally have fun with email parsing (it's hard) and espe=
cially
> > > > python changes in how encodings are handled differently between pyt=
hon2
> > > > and python3. If you have a specific example I can try and take a lo=
ok why
> > > > it doesn't work.
> > > It just looks up and doesn't seem to do anything. I'm not familiar wi=
th
> > > python so I can just describe the symptoms.
> > I meant tell me which mail (patchwork or lore) and I'll try to
> > reproduce and see what's maybe up.
> =

> It doesn't seem to work in general. E.g. any patch I try I just don't get
> any progress in over 10 Minutes.
> =

> Maybe some server is not responding?

Uh dim add-link pretty similar to dim apply-patch, it takes the mbox on
stdin and does only local git stuff with it.
-Daniel

> =

> Christian.
> =

> > -Daniel
> > =

> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > > And maybe some words on how/why stuff blows up.
> > > > > Just a typo. I've forgot to remove two lines in radeon while reba=
sing and
> > > > > still had the symbols exported so never noticed this.
> > > > > =

> > > > > Christian.
> > > > > =

> > > > > > -Daniel
> > > > > > =

> > > > > > > ---
> > > > > > >     drivers/gpu/drm/radeon/radeon_ttm.c | 3 ---
> > > > > > >     1 file changed, 3 deletions(-)
> > > > > > > =

> > > > > > > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gp=
u/drm/radeon/radeon_ttm.c
> > > > > > > index d4328ff57757..35b715f82ed8 100644
> > > > > > > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > > > > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > > > > > > @@ -729,9 +729,6 @@ int radeon_ttm_init(struct radeon_device =
*rdev)
> > > > > > >             }
> > > > > > >             rdev->mman.initialized =3D true;
> > > > > > > -  ttm_pool_init(&rdev->mman.bdev.pool, rdev->dev, rdev->need=
_swiotlb,
> > > > > > > -                dma_addressing_limited(&rdev->pdev->dev));
> > > > > > > -
> > > > > > >             r =3D radeon_ttm_init_vram(rdev);
> > > > > > >             if (r) {
> > > > > > >                     DRM_ERROR("Failed initializing VRAM heap.=
\n");
> > > > > > > --
> > > > > > > 2.25.1
> > > > > > > =

> > > > > > > _______________________________________________
> > > > > > > dri-devel mailing list
> > > > > > > dri-devel@lists.freedesktop.org
> > > > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04=
%7C01%7Cchristian.koenig%40amd.com%7C3aede203348b4f32ea3108d8b3e224ec%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637457131179258488%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3DpHzuAsJcXf5HlAfJ7wYYc%2BsizZhSLBGWXBhCyVNRCfo%3D&amp;res=
erved=3D0
> > =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
