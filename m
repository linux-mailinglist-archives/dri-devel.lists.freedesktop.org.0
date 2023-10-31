Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD22C7DD289
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 17:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A34710E56B;
	Tue, 31 Oct 2023 16:46:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C50D810E56A;
 Tue, 31 Oct 2023 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698770762; x=1730306762;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DS/xWHPP6PUPRe6jGmuy1RmrlBE0hFPJDlqPlmO/FQ0=;
 b=gA3NChDukgb0bAIe6RgkNQ1+Tzoe9QY0N4pvIKv+PD7V4pVdRs7Mfe0R
 u6B60OsNCeOAqgRd4516nKDJCIBEguTanZvrQ+alUMedo7+R3D9P+J/Hz
 07kAwnispBR0XgiBMjv4hGDs1403hE98Eo9TC++qVGHY7W+pkqcOobSJo
 SjxJPH22NZKk8/FsLQlHz9UKRECsM4cZAzsI/6LqpOCT8cKzE3z7TN2PV
 LJO4cRkLUrvXZyFX9OX/7/Tcq0XgfCM4YOSZ267gAhwP1iotLpLXMl+mQ
 WsffcraoOHsvr5xqhcJQBnf0UNourSH+cBHZIQ4ovvdD0xIAfewm14/rD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="391200627"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="391200627"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="795644839"
X-IronPort-AV: E=Sophos;i="6.03,265,1694761200"; d="scan'208";a="795644839"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.59])
 ([10.249.254.59])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 09:45:58 -0700
Message-ID: <ab8f30452540171447118d64931e66da96b6e85e.camel@linux.intel.com>
Subject: Re: [PATCH drm-misc-next v7 4/7] drm/gpuvm: add an abstraction for
 a VM / BO combination
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Danilo Krummrich <dakr@redhat.com>, airlied@gmail.com, daniel@ffwll.ch, 
 matthew.brost@intel.com, sarah.walker@imgtec.com, donald.robson@imgtec.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 faith@gfxstrand.net
Date: Tue, 31 Oct 2023 17:45:56 +0100
In-Reply-To: <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
 <20231023201659.25332-5-dakr@redhat.com>
 <4a51c1cd9e2435332e033f9426bac8fae1c21c60.camel@linux.intel.com>
 <980754a3-7f5a-465e-88a9-62a40c82cae8@redhat.com>
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

On Tue, 2023-10-31 at 17:39 +0100, Danilo Krummrich wrote:
> On 10/31/23 12:25, Thomas Hellstr=C3=B6m wrote:
> > On Mon, 2023-10-23 at 22:16 +0200, Danilo Krummrich wrote:
> > > Add an abstraction layer between the drm_gpuva mappings of a
> > > particular
> > > drm_gem_object and this GEM object itself. The abstraction
> > > represents
> > > a
> > > combination of a drm_gem_object and drm_gpuvm. The drm_gem_object
> > > holds
> > > a list of drm_gpuvm_bo structures (the structure representing
> > > this
> > > abstraction), while each drm_gpuvm_bo contains list of mappings
> > > of
> > > this
> > > GEM object.
> > >=20
> > > This has multiple advantages:
> > >=20
> > > 1) We can use the drm_gpuvm_bo structure to attach it to various
> > > lists
> > > =C2=A0=C2=A0=C2=A0 of the drm_gpuvm. This is useful for tracking exte=
rnal and
> > > evicted
> > > =C2=A0=C2=A0=C2=A0 objects per VM, which is introduced in subsequent =
patches.
> > >=20
> > > 2) Finding mappings of a certain drm_gem_object mapped in a
> > > certain
> > > =C2=A0=C2=A0=C2=A0 drm_gpuvm becomes much cheaper.
> > >=20
> > > 3) Drivers can derive and extend the structure to easily
> > > represent
> > > =C2=A0=C2=A0=C2=A0 driver specific states of a BO for a certain GPUVM=
.
> > >=20
> > > The idea of this abstraction was taken from amdgpu, hence the
> > > credit
> > > for
> > > this idea goes to the developers of amdgpu.
> > >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 335
> > > +++++++++++++++++++++--
> > > --
> > > =C2=A0=C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c |=C2=A0 64 +++--
> > > =C2=A0=C2=A0include/drm/drm_gem.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
32 +--
> > > =C2=A0=C2=A0include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 188 +++++++++++=
++-
> > > =C2=A0=C2=A04 files changed, 533 insertions(+), 86 deletions(-)
> >=20
> > That checkpatch.pl error still remains as well.
>=20
> I guess you refer to:
>=20
> ERROR: do not use assignment in if condition
> #633: FILE: drivers/gpu/drm/nouveau/nouveau_uvmm.c:1165:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!(op->gem.=
obj =3D obj))
>=20
> This was an intentional decision, since in this specific case it
> seems to
> be more readable than the alternatives.
>=20
> However, if we consider this to be a hard rule, which we never ever
> break,
> I'm fine changing it too.

With the errors, sooner or later they are going to start generate
patches to "fix" them. In this particular case also Xe CI is
complaining and abort building when I submit the Xe adaptation, so it'd
be good to be checkpatch.pl conformant IMHO.

Thanks,
Thomas




>=20
> >=20
> > Thanks,
> > Thomas
> >=20
>=20

