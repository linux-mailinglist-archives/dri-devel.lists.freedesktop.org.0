Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C89233F70
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 08:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712E96E9E1;
	Fri, 31 Jul 2020 06:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0116E9E1;
 Fri, 31 Jul 2020 06:53:34 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 000FD207F5;
 Fri, 31 Jul 2020 06:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596178414;
 bh=fNT75IpsFv23vL5vXayzc9tXmlPArXQFzFYd85vUNc4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wHsdC/0fAKiD9YbaIfsbFj8p03yJkr9qnBoWo/Ix5UbCr1RLfihp7pEzhGtHbguq1
 /+FDpBO2nfeS+ZtSS/W9SOgSdCKVKLvWJj7x0Qj3xcRhHThBaXQK9DVnnYL5tnK/Bu
 baaUYQoJUnWUKqyyFkdRXWivQ8nvj9uuW3vAVtas=
Date: Fri, 31 Jul 2020 08:53:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] drm/amdgpu: Prevent
 kernel-infoleak in amdgpu_info_ioctl()
Message-ID: <20200731065322.GA1518178@kroah.com>
References: <20200728192924.441570-1-yepeilin.cs@gmail.com>
 <30b2a31f-77c2-56c1-ecde-875c6eea99d5@gmail.com>
 <CADnq5_NXOiAc7q5gQqF_wwtJD1o6nHjXM4O3gY6EwAQe9iOtXw@mail.gmail.com>
 <8c5cf518-12d2-7495-7822-c7ebf8e61972@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8c5cf518-12d2-7495-7822-c7ebf8e61972@amd.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Trek <trek00@inbox.ru>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peilin Ye <yepeilin.cs@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Leo Liu <leo.liu@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 30, 2020 at 05:09:07PM -0400, Luben Tuikov wrote:
> On 2020-07-29 9:49 a.m., Alex Deucher wrote:
> > On Wed, Jul 29, 2020 at 4:11 AM Christian K=F6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >>
> >> Am 28.07.20 um 21:29 schrieb Peilin Ye:
> >>> Compiler leaves a 4-byte hole near the end of `dev_info`, causing
> >>> amdgpu_info_ioctl() to copy uninitialized kernel stack memory to user=
space
> >>> when `size` is greater than 356.
> >>>
> >>> In 2015 we tried to fix this issue by doing `=3D {};` on `dev_info`, =
which
> >>> unfortunately does not initialize that 4-byte hole. Fix it by using
> >>> memset() instead.
> >>>
> >>> Cc: stable@vger.kernel.org
> >>> Fixes: c193fa91b918 ("drm/amdgpu: information leak in amdgpu_info_ioc=
tl()")
> >>> Fixes: d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
> >>> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> >>> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> >>
> >> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
> >>
> >> I can't count how many of those we have fixed over the years.
> >>
> >> At some point we should probably document that using "=3D {}" or "=3D =
{ 0 }"
> >> in the kernel is a really bad idea and should be avoided.
> > =

> > Moreover, it seems like different compilers seem to behave relatively
> > differently with these and we often get reports of warnings with these
> > on clang.  When in doubt, memset.
> =

> There are quite a few of those under drivers/gpu/drm, for "amd/", "schedu=
ler/"
> drm*.c files,
> =

> $find . \( -regex "./drm.*\.c" -or -regex "./amd/.*\.c" -or -regex "./sch=
eduler/.*\.c" \) -exec egrep -n -- " *=3D *{ *(|NULL|0) *}" \{\} \+ | wc -l
> 374
> $_
> =

> Out of which only 16 are of the non-ISO C variety, "=3D {}",
> =

> $find . \( -regex "./drm.*\.c" -or -regex "./amd/.*\.c" -or -regex "./sch=
eduler/.*\.c" \) -exec egrep -n -- " *=3D *{ *}" \{\} \+ | wc -l
> 16
> $_
> =

> Perhaps the latter are the more pressing ones, since it is a C++ initiali=
zer and not a ISO C one.

It only matters when we care copying the data to userspace, if it all
stays in the kernel, all is fine.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
