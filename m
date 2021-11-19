Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8FA457098
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:25:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334B56EABB;
	Fri, 19 Nov 2021 14:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42D36E214
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:25:20 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="258213113"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="258213113"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 06:25:20 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="455450099"
Received: from sgconnee-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.21.83])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 06:25:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm: check drm_format_info hsub and vsub to avoid
 divide by zero
In-Reply-To: <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <1635429437-21718-1-git-send-email-george.kennedy@oracle.com>
 <YXqt46TPL9tUZCL1@intel.com> <YZdxFvGkBPXrtoQ7@phenom.ffwll.local>
 <YZd2VI820CUGrMjv@intel.com> <YZd8tpDN9lsq0ZbZ@phenom.ffwll.local>
Date: Fri, 19 Nov 2021 16:25:08 +0200
Message-ID: <87a6i0jk8r.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: airlied@linux.ie, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, George Kennedy <george.kennedy@oracle.com>,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Nov 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Fri, Nov 19, 2021 at 12:03:00PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Fri, Nov 19, 2021 at 10:40:38AM +0100, Daniel Vetter wrote:
>> > On Thu, Oct 28, 2021 at 05:04:19PM +0300, Ville Syrj=C3=A4l=C3=A4 wrot=
e:
>> > > On Thu, Oct 28, 2021 at 08:57:17AM -0500, George Kennedy wrote:
>> > > > Do a sanity check on struct drm_format_info hsub and vsub values to
>> > > > avoid divide by zero.
>> > > >=20
>> > > > Syzkaller reported a divide error in framebuffer_check() when the
>> > > > DRM_FORMAT_Q410 or DRM_FORMAT_Q401 pixel_format is passed in via
>> > > > the DRM_IOCTL_MODE_ADDFB2 ioctl. The drm_format_info struct for
>> > > > the DRM_FORMAT_Q410 pixel_pattern has ".hsub =3D 0" and ".vsub =3D=
 0".
>> > > > fb_plane_width() uses hsub as a divisor and fb_plane_height() uses
>> > > > vsub as a divisor. These divisors need to be sanity checked for
>> > > > zero before use.
>> > > >=20
>> > > > divide error: 0000 [#1] SMP KASAN NOPTI
>> > > > CPU: 0 PID: 14995 Comm: syz-executor709 Not tainted 5.15.0-rc6-syz=
k #1
>> > > > Hardware name: Red Hat KVM, BIOS 1.13.0-2
>> > > > RIP: 0010:framebuffer_check drivers/gpu/drm/drm_framebuffer.c:199 =
[inline]
>> > > > RIP: 0010:drm_internal_framebuffer_create+0x604/0xf90
>> > > > drivers/gpu/drm/drm_framebuffer.c:317
>> > > >=20
>> > > > Call Trace:
>> > > >  drm_mode_addfb2+0xdc/0x320 drivers/gpu/drm/drm_framebuffer.c:355
>> > > >  drm_mode_addfb2_ioctl+0x2a/0x40 drivers/gpu/drm/drm_framebuffer.c=
:391
>> > > >  drm_ioctl_kernel+0x23a/0x2e0 drivers/gpu/drm/drm_ioctl.c:795
>> > > >  drm_ioctl+0x589/0xac0 drivers/gpu/drm/drm_ioctl.c:898
>> > > >  vfs_ioctl fs/ioctl.c:51 [inline]
>> > > >  __do_sys_ioctl fs/ioctl.c:874 [inline]
>> > > >  __se_sys_ioctl fs/ioctl.c:860 [inline]
>> > > >  __x64_sys_ioctl+0x19d/0x220 fs/ioctl.c:860
>> > > >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>> > > >  do_syscall_64+0x3a/0x80 arch/x86/entry/common.c:80
>> > > >  entry_SYSCALL_64_after_hwframe+0x44/0xae
>> > > >=20
>> > > > Signed-off-by: George Kennedy <george.kennedy@oracle.com>
>> > > > ---
>> > > >  drivers/gpu/drm/drm_framebuffer.c | 10 ++++++++++
>> > > >  1 file changed, 10 insertions(+)
>> > > >=20
>> > > > diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/d=
rm_framebuffer.c
>> > > > index 07f5abc..a146e4b 100644
>> > > > --- a/drivers/gpu/drm/drm_framebuffer.c
>> > > > +++ b/drivers/gpu/drm/drm_framebuffer.c
>> > > > @@ -195,6 +195,16 @@ static int framebuffer_check(struct drm_devic=
e *dev,
>> > > >  	/* now let the driver pick its own format info */
>> > > >  	info =3D drm_get_format_info(dev, r);
>> > > >=20=20
>> > > > +	if (info->hsub =3D=3D 0) {
>> > > > +		DRM_DEBUG_KMS("bad horizontal chroma subsampling factor %u\n", =
info->hsub);
>> > > > +		return -EINVAL;
>> > > > +	}
>> > > > +
>> > > > +	if (info->vsub =3D=3D 0) {
>> > > > +		DRM_DEBUG_KMS("bad vertical chroma subsampling factor %u\n", in=
fo->vsub);
>> > > > +		return -EINVAL;
>> > > > +	}
>> > >=20
>> > > Looks like duct tape to me. I think we need to either fix those form=
ats
>> > > to have valid format info, or just revert the whole patch that added=
 such
>> > > broken things.
>> >=20
>> > Yeah maybe even a compile-time check of the format table(s) to validate
>> > them properly and scream ... Or at least a selftest.
>>=20
>> I really wish C had (even very limited) compile time evaluation
>> so one could actually loop over arrays like at compile time to=20
>> check each element. As it stands you either have to check each
>> array element by hand, or you do some cpp macro horrors to=20
>> pretend you're iterating the array.
>
> Python preprocess or so seems to be the usual answer, and that then just
> generates the C table after it's all checked.
>
> Or a post-processor which fishes the table out from the .o (or just links
> against it).
>
> But yeah doing this in cpp isn't going to work, aside from it'd be really
> ugly.

Kbuild does have support for hostprogs which are typically used in the
build. The obvious idea is to use that for code generation, but it would
also be interesting to see how that could be used for compile-time
evaluation of sorts. Kind of like compile-time selftests? And, of
course, how badly that would be frowned upon.

git grep says there are only four hostprogs users in drivers/, so it
certainly isn't a popularity contest winner. (One of them is
"mkregtable" in radeon.)


BR,
Jani.

--=20
Jani Nikula, Intel Open Source Graphics Center
