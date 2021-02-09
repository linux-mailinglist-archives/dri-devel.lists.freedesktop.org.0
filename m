Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B44314BF9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 10:46:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223016E05D;
	Tue,  9 Feb 2021 09:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B4E6EAB3
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 09:46:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 190so2461428wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Ju6wGyHCZByWP3ZMeukOjUaKSgrsw0dAl14yZh1uAK8=;
 b=D/9zfBchYBTLAvgf+PGgSekGQD0M/4l/9l83kRFhUp3J4/C3dSemwdZSqQbE+N4/kq
 HVHrZEPULQNLTAngCp2xyMne3jqWO7mYhLMXoKrDzeLIYsX5hs2igGJVWkb/x8eySNQ0
 IaEd/TzSWSZ0McCVygvfHYoauiTsvapCffLi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Ju6wGyHCZByWP3ZMeukOjUaKSgrsw0dAl14yZh1uAK8=;
 b=FSK8A4fL1dTe+GDQC5ELtbXrD+eOuw6JoAt/6Z/ateUM7wFFHGllnStSh2ZXdnxZF1
 e3rejWMsw2HqBT9J7nzaB5rdPZGudyF2mmtKj/HIu4/aMEG48zoO9iEZhUjjTdilP066
 +jM8ijRTUf6dCIAMGIxooEBwjdV3UelPkdh8zc9cpkS7HaVqJImz+1ndhI9FBOD8IDCJ
 9bF1leZdN1xIiphSNWfBQ40jy+9rjFh6Mfg9QOHTskSbpl5opHmxIrTOGkqbJnxkzHRW
 z0wD21q/cpaZEnOPwSdcvpXWuEB9WA6E02E58Qj7CzkuYSJfixoJy5ybkY09EXiC8pUr
 8e3w==
X-Gm-Message-State: AOAM533L08mrz76QUyE02D2DY55d7KCbHs5Ek4wOgyEdBMMYjvVMTXTK
 Ihy7EX2k3RePVIqPHutmny8Feg==
X-Google-Smtp-Source: ABdhPJz4CpxwqvCQGKgoVpekGnT7LZPcXrOlC6rgdlhrXieHXE7RcCNQL+neF8PDxW53549K99x+kQ==
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr2615120wmi.148.1612864011480; 
 Tue, 09 Feb 2021 01:46:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t6sm3472742wmj.22.2021.02.09.01.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 01:46:50 -0800 (PST)
Date: Tue, 9 Feb 2021 10:46:48 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
Message-ID: <YCJaCD6cAZEhDJTm@phenom.ffwll.local>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <3f7efc21-f2fb-73a9-216c-aa1e531e35a0@amd.com>
 <53b95e8b-4079-2bd1-46e1-df15b2fdd2cc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53b95e8b-4079-2bd1-46e1-df15b2fdd2cc@gmail.com>
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>,
 christian.koenig@amd.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 09:27:03AM +0100, Christian K=F6nig wrote:
> =

> =

> Am 08.02.21 um 23:09 schrieb Andrey Grodzovsky:
> > =

> > =

> > On 2/8/21 4:37 AM, Christian K=F6nig wrote:
> > > Am 07.02.21 um 22:50 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > > Clarification - as far as I know there are no page fault
> > > > > handlers for kernel
> > > > > mappings. And we are talking about kernel mappings here,
> > > > > right ?=A0 If there were
> > > > > I could solve all those issues the same as I do for user mappings=
, by
> > > > > invalidating all existing mappings in the kernel (both kmaps
> > > > > and ioreamps)and
> > > > > insert dummy zero or ~0 filled page instead.
> > > > > Also, I assume forcefully remapping the IO BAR to ~0 filled
> > > > > page would involve
> > > > > ioremap API and it's not something that I think can be
> > > > > easily done according to
> > > > > am answer i got to a related topic a few weeks ago
> > > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Fwww.spinics.net%2Flists%2Flinux-pci%2Fmsg103396.html&amp;data=3D04%7C01%=
7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3D6eP0nhS%2BZwp1Y54CwfX8vaV3FTWbW8IylW5JFaf92pY%3D&amp;reserved=
=3D0
> > > > > (that was the only reply
> > > > > i got)
> > > > mmiotrace can, but only for debug, and only on x86 platforms:
> > > > =

> > > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.kernel.org%2Fdoc%2Fhtml%2Flatest%2Ftrace%2Fmmiotrace.html&amp;data=3D0=
4%7C01%7CAndrey.Grodzovsky%40amd.com%7Cb159d3ce264944486c8008d8cc15233a%7C3=
dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637483738446813868%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;sdata=3DQBF9J%2BVIRUkUTTjvNoZR8NqFNt8CpHkcknH2qKX7dd8%3D&amp;r=
eserved=3D0
> > > > =

> > > > =

> > > > Should be feasible (but maybe not worth the effort) to extend this =
to
> > > > support fake unplug.
> > > =

> > > Mhm, interesting idea you guys brought up here.
> > > =

> > > We don't need a page fault for this to work, all we need to do is to
> > > insert dummy PTEs into the kernels page table at the place where
> > > previously the MMIO mapping has been.
> > =

> > =

> > But that exactly what Mathew from linux-mm says is not a trivial thing
> > to do, quote:
> > =

> > "
> > =

> > ioremap() is done through the vmalloc space.  It would, in theory, be
> > possible to reprogram the page tables used for vmalloc to point to your
> > magic page.  I don't think we have such a mechanism today, and there are
> > lots of problems with things like TLB flushes.  It's probably going to
> > be harder than you think.
> > "
> =

> I haven't followed the full discussion, but I don't see much preventing
> this.
> =

> All you need is a new ioremap_dummy() function which takes the old start =
and
> length of the mapping.
> =

> Still a bit core and maybe even platform code, but rather useful I think.

Yeah we don't care about races, so if the tlb flushing isn't perfect
that's fine.

Also if we glue this into the mmiotrace infrastructure, that already has
all the fault handling. So on x86 I think we could even make it perfect
(but that feels like overkill) and fully atomic. Plus the mmiotrace
overhead (even if we don't capture anything) is probably a bit much even
for testing in CI or somewhere like that.
-Daniel

> =

> Christian.
> =

> > =

> > If you believe it's actually doable then it would be useful not only fo=
r simulating device
> > unplugged situation with all MMIOs returning 0xff... but for actual han=
dling of driver accesses
> > to MMIO after device is gone and, we could then drop entirely this patc=
h as there would be no need
> > to guard against such accesses post device unplug.
> =

> =

> > =

> > > =

> > > > > > But ugh ...
> > > > > > =

> > > > > > Otoh validating an entire driver like amdgpu without such a tri=
ck
> > > > > > against 0xff reads is practically impossible. So maybe
> > > > > > you need to add
> > > > > > this as one of the tasks here?
> > > > > Or I could just for validation purposes return ~0 from all
> > > > > reg reads in the code
> > > > > and ignore writes if drm_dev_unplugged, this could already
> > > > > easily validate a big
> > > > > portion of the code flow under such scenario.
> > > > Hm yeah if your really wrap them all, that should work too. Since
> > > > iommappings have __iomem pointer type, as long as amdgpu is sparse
> > > > warning free, should be doable to guarantee this.
> > > =

> > > Problem is that ~0 is not always a valid register value.
> > > =

> > > You would need to audit every register read that it doesn't use the
> > > returned value blindly as index or similar. That is quite a bit of
> > > work.
> > =

> > =

> > But ~0 is the value that will be returned for every read post device
> > unplug, regardless if it's valid or not, and we have to cope with
> > it then, no ?
> > =

> > Andrey
> > =

> > =

> > > =

> > > Regards,
> > > Christian.
> > > =

> > > > -Daniel
> > > > =

> > > > > Andrey
> > > > > =

> > > =

> > =

> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/amd-gfx
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
