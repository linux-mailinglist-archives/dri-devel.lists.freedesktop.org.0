Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BD3461605
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 14:14:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEE96EDF2;
	Mon, 29 Nov 2021 13:14:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCC86ECB2;
 Mon, 29 Nov 2021 13:14:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="223189455"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="223189455"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 05:14:40 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="459143628"
Received: from keyanli-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.249.254.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 05:14:38 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <180f069a-bf29-cf05-c9f9-5b1737ec5664@gmail.com>
References: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
 <4fd0eee6-342f-fb31-717c-901440f38c35@gmail.com>
 <58ca11648ab29d96b84640760d2acc3ac2d39d19.camel@linux.intel.com>
 <e4d8e272-8175-4298-f227-240febc0bda0@gmail.com>
 <ee128e237dbc2b6b2341b49ab07661c1f1b65e0b.camel@linux.intel.com>
 <180f069a-bf29-cf05-c9f9-5b1737ec5664@gmail.com>
To: Christian König <ckoenig.leichtzumerken@gmail.com>, Thomas Hellström <thomas.hellstrom@linux.intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH] dma_fence_array: Fix PENDING_ERROR leak in
 dma_fence_array_signaled()
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163819167565.18436.3361321032268102014@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 29 Nov 2021 15:14:35 +0200
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
Cc: linaro-mm-sig@lists.linaro.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Switching to my @linux.intel.com address)

Quoting Christian K=C3=B6nig (2021-11-29 14:55:37)
> Am 29.11.21 um 13:46 schrieb Thomas Hellstr=C3=B6m:
> > On Mon, 2021-11-29 at 13:33 +0100, Christian K=C3=B6nig wrote:
> >> Am 29.11.21 um 13:23 schrieb Thomas Hellstr=C3=B6m:
> >>> Hi, Christian,
> >>>
> >>> On Mon, 2021-11-29 at 09:21 +0100, Christian K=C3=B6nig wrote:
> >>>> Am 29.11.21 um 08:35 schrieb Thomas Hellstr=C3=B6m:
> >>>>> If a dma_fence_array is reported signaled by a call to
> >>>>> dma_fence_is_signaled(), it may leak the PENDING_ERROR status.
> >>>>>
> >>>>> Fix this by clearing the PENDING_ERROR status if we return true
> >>>>> in
> >>>>> dma_fence_array_signaled().
> >>>>>
> >>>>> Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-
> >>>>> array container")
> >>>>> Cc: linaro-mm-sig@lists.linaro.org
> >>>>> Cc: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >>>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> >>>>> Signed-off-by: Thomas Hellstr=C3=B6m
> >>>>> <thomas.hellstrom@linux.intel.com>
> >>>> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >>> How are the dma-buf / dma-fence patches typically merged? If i915
> >>> is
> >>> the only fence->error user, could we take this through drm-intel to
> >>> avoid a backmerge for upcoming i915 work?
> >> Well that one here looks like a bugfix to me, so either through
> >> drm-misc-fixes ore some i915 -fixes branch sounds fine to me.
> >>
> >> If you have any new development based on that a backmerge of the -
> >> fixes
> >> into your -next branch is unavoidable anyway.
> > Ok, I'll check with Joonas if I can take it through
> > drm-intel-gt-next, since fixes are cherry-picked from that one. Patch
> > will then appear in both the -fixes and the -next branch.
>=20
> Well exactly that's the stuff Daniel told me to avoid :)
>=20
> But maybe your i915 workflow is somehow better handling that than the=20
> AMD workflow.

If it's a bugfix to a patch that merged through drm-misc-next, I'd
always be inclined to merge the fixup using the same process (which
would be drm-next-fixes).

In i915 we do always merge the patches to -next first, and never do a
backmerge of -fixes (as it's a cherry-picked branch) so the workflows
differ there.

Here the time between the fixup and the previous patch is so long that
either way is fine with. So feel free to apply to drm-intel-gt-next.

Regards, Joonas

> Christian.
>=20
> >
> > Thanks,
> > /Thomas
> >
> >
> >> Regards,
> >> Christian.
> >>
> >>> /Thomas
> >>>
> >>>
> >>>>> ---
> >>>>>  =C2=A0=C2=A0 drivers/dma-buf/dma-fence-array.c | 6 +++++-
> >>>>>  =C2=A0=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)
> >>>>>
> >>>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-
> >>>>> buf/dma-fence-array.c
> >>>>> index d3fbd950be94..3e07f961e2f3 100644
> >>>>> --- a/drivers/dma-buf/dma-fence-array.c
> >>>>> +++ b/drivers/dma-buf/dma-fence-array.c
> >>>>> @@ -104,7 +104,11 @@ static bool
> >>>>> dma_fence_array_signaled(struct
> >>>>> dma_fence *fence)
> >>>>>  =C2=A0=C2=A0 {
> >>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct dma_f=
ence_array *array =3D
> >>>>> to_dma_fence_array(fence);
> >>>>>    =20
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return atomic_read(&arra=
y->num_pending) <=3D 0;
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (atomic_read(&array->=
num_pending) > 0)
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return false;
> >>>>> +
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dma_fence_array_clear_pe=
nding_error(array);
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return true;
> >>>>>  =C2=A0=C2=A0 }
> >>>>>    =20
> >>>>>  =C2=A0=C2=A0 static void dma_fence_array_release(struct dma_fence =
*fence)
> >
>=20
