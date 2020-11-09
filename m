Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B742AC736
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388AE893EA;
	Mon,  9 Nov 2020 21:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B26893E8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:27:35 +0000 (UTC)
IronPort-SDR: G4ArzB3DnVJR8e9umH6mPtmWasb71Ycs8kAFbc9pvtADfsxM3B8ilzzU2NEbR9/uHLifl/g3Oj
 a9CbWSJ1Dh8A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="166364487"
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="166364487"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2020 13:27:34 -0800
IronPort-SDR: jma6qrdlU1lIqPkcfRLpoUxzd2U5PFgWZ+ldkynUFQkjn5OumYy/wfHyCCKkO/AafVwu4LQcHd
 eTwep5gVFHPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,464,1596524400"; d="scan'208";a="327428187"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Nov 2020 13:27:32 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Nov 2020 23:27:31 +0200
Date: Mon, 9 Nov 2020 23:27:31 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
Message-ID: <20201109212731.GQ6112@intel.com>
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
 <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
 <20201109151650.GE6112@intel.com>
 <bec6848c-3ad5-41ca-d424-669a6797b972@amd.com>
 <20201109161825.GG6112@intel.com>
 <dfd0e641-392b-cab2-05d1-ae466ae08ba8@amd.com>
 <20201109164301.GI6112@intel.com>
 <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0179f84-8890-e694-b94c-dbe93605ace5@amd.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 09, 2020 at 09:48:04PM +0100, Christian K=F6nig wrote:
> Am 09.11.20 um 17:43 schrieb Ville Syrj=E4l=E4:
> > On Mon, Nov 09, 2020 at 05:20:17PM +0100, Christian K=F6nig wrote:
> >> Am 09.11.20 um 17:18 schrieb Ville Syrj=E4l=E4:
> >>> On Mon, Nov 09, 2020 at 04:57:29PM +0100, Christian K=F6nig wrote:
> >>>> Am 09.11.20 um 16:16 schrieb Ville Syrj=E4l=E4:
> >>>>> On Wed, Nov 11, 2020 at 06:13:02PM +0100, Christian K=F6nig wrote:
> >>>>>> Am 09.11.20 um 01:54 schrieb Dave Airlie:
> >>>>>>> @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operation_c=
tx *ctx)
> >>>>>>>      	if (bo->mem.mem_type !=3D TTM_PL_SYSTEM) {
> >>>>>>>      		struct ttm_operation_ctx ctx =3D { false, false };
> >>>>>>>      		struct ttm_resource evict_mem;
> >>>>>>> +		struct ttm_place hop =3D {};
> >>>>>> Please always use memset() if you want to zero initialize somethin=
g in
> >>>>>> the kernel, we had enough trouble with that.
> >>>>> What trouble is that? I've not heard of anything, and we use
> >>>>> =3D{} quite extensively in drm land.
> >>>> =3D{} initializes only named fields, not padding.
> >>> Has that actually happened?
> >> YES! Numerous times!
> > You wouldn't happen to have links/etc. to the discussion?
> > I'd like to check them out.
> =

> Uff, that was years ago. Just google for something like "mesa memset =

> hash", there was recently (~ the last year) another discussion because =

> somebody ran into exactly that problem once more.

Found this:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/2071
which does suprise me a bit. Though I suspect =3D{} might
behave differently since the compiler might treat it
more like a memset().

Also makes me wonder about padding in general, because IIRC
the standard allows padding to be clobbered even after
initialization whenever any member is getting written. So
I think technically there is no guaranteed way to clear
the padding unless you never store anything into the struct.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
