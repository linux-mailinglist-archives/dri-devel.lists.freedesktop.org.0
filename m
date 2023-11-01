Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C43C7DDE9D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 10:42:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BF610E68D;
	Wed,  1 Nov 2023 09:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2ED310E68D;
 Wed,  1 Nov 2023 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698831715; x=1730367715;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OoaIkugwOcHNspHG5GL+6xzuR+FtZlARttrxfo5ccek=;
 b=Sbfkoy8I6/7MMZxjmejmEAHcdn+YNuznvrRVZBp2DC96QOhW4xH2pBOU
 LCBNk9m02AOxVZwcaibIFNSSqmNzbtFgC8UBiVJ/YrlrUakVyn3Bs1bzV
 STvixEeZzA7cA9dVCq7EmKWRS7x+PrCAHvFv9s1JYx1n2nS3cvj2A6bEd
 5gQHZUKYH58r2L7Uk8TyZCE+2jxYz3g3iUIPCFiU6q/QabtPftRxQEeK/
 YGUHQid9mrfXaKP/2i+YabTt+3QeXwS0FUAtxbM2ikvP408Qy0c2h6sUw
 oftkZfSDD7CqI+hVtM6WGGI3DIv9NLyuIXR6C6bHNLWx1/krxImqa1hcA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="392326873"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="392326873"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1092297687"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; d="scan'208";a="1092297687"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 02:41:50 -0700
Message-ID: <1043bb3c1156d08015db5478183888892dfeda88.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Wed, 01 Nov 2023 10:41:48 +0100
In-Reply-To: <b09e37f3-33f6-4ea8-876b-f0bee9627ced@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
 <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
 <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
 <b09e37f3-33f6-4ea8-876b-f0bee9627ced@redhat.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Danilo,

On Tue, 2023-10-31 at 18:52 +0100, Danilo Krummrich wrote:
> On 10/31/23 17:45, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2023-10-31 at 17:39 +0100, Danilo Krummrich wrote:
> > > On 10/31/23 12:25, Thomas Hellstr=C3=B6m wrote:
> > > > On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
> > > > > Add an abstraction layer between the drm_gpuva mappings of a
> > > > > particular
> > > > > drm_gem_object and this GEM object itself. The abstraction
> > > > > represents
> > > > > a
> > > > > combination of a drm_gem_object and drm_gpuvm. The
> > > > > drm_gem_object
> > > > > holds
> > > > > a list of drm_gpuvm_bo structures (the structure representing
> > > > > this
> > > > > abstraction), while each drm_gpuvm_bo contains list of
> > > > > mappings
> > > > > of
> > > > > this
> > > > > GEM object.
> > > > >=20
> > > > > This has multiple advantages:
> > > > >=20
> > > > > 1) We can use the drm_gpuvm_bo structure to attach it to
> > > > > various
> > > > > lists
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 of the drm_gpuvm. This is useful for tra=
cking external
> > > > > and
> > > > > evicted
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 objects per VM, which is introduced in s=
ubsequent
> > > > > patches.
> > > > >=20
> > > > > 2) Finding mappings of a certain drm_gem_object mapped in a
> > > > > certain
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 drm_gpuvm becomes much cheaper.
> > > > >=20
> > > > > 3) Drivers can derive and extend the structure to easily
> > > > > represent
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0 driver specific states of a BO for a cer=
tain GPUVM.
> > > > >=20
> > > > > The idea of this abstraction was taken from amdgpu, hence the
> > > > > credit
> > > > > for
> > > > > this idea goes to the developers of amdgpu.
> > > > >=20
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > ---
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 335
> > > > > +++++++++++++++++++++--
> > > > > --
> > > > > =C2=A0=C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c |=C2=A0 =
64 +++--
> > > > > =C2=A0=C2=A0=C2=A0include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 32 +--
> > > > > =C2=A0=C2=A0=C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 188
> > > > > +++++++++++++-
> > > > > =C2=A0=C2=A0=C2=A04 files changed, 533 insertions(+), 86 deletion=
s(-)
> > > >=20
> > > > That checkpatch.pl error still remains as well.
> > >=20
> > > I guess you refer to:
> > >=20
> > > ERROR: do not use assignment in if condition
> > > #633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(op=
->gem.obj =3D obj))
> > >=20
> > > This was an intentional decision, since in this specific case it
> > > seems to
> > > be more readable than the alternatives.
> > >=20
> > > However, if we consider this to be a hard rule, which we never
> > > ever
> > > break,
> > > I'm fine changing it too.
> >=20
> > With the errors, sooner or later they are going to start generate
> > patches to "fix" them. In this particular case also Xe CI is
> > complaining and abort building when I submit the Xe adaptation, so
> > it'd
> > be good to be checkpatch.pl conformant IMHO.
>=20
> Ok, I will change this one.
>=20
> However, in general my opinion on coding style is that we should
> preserve us
> the privilege to deviate from it when we agree it makes sense and
> improves
> the code quality.
>=20
> Having a CI forcing people to *blindly* follow certain rules and even
> abort
> building isn't very beneficial in that respect.
>=20
> Also, consider patches which partially change a line of code that
> already
> contains a coding style "issue" - the CI would also block you on that
> one I
> guess. Besides that it seems to block you on unrelated code, note
> that the
> assignment in question is from Nouveau and not from GPUVM.

Yes, I completely agree that having CI enforce error free coding style
checks is bad, and I'll see if I can get that changed on Xe CI. To my
Knowledge It hasn't always been like that.

But OTOH my take on this is that if there are coding style rules and
recommendations we should try to follow them unless there are *strong*
reasons not to. Sometimes that may result in code that may be a little
harder to read, but OTOH a reviewer won't have to read up on the
component's style flavor before reviewing and it will avoid future
style fix patches.

Thanks,
Thomas


>=20
> - Danilo
>=20
> >=20
> > Thanks,
> > Thomas
> >=20
> >=20
> >=20
> >=20
> > >=20
> > > >=20
> > > > Thanks,
> > > > Thomas
> > > >=20
> > >=20
> >=20
>=20

