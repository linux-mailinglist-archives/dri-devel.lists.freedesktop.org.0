Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9C62CD624
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 13:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966896E9AF;
	Thu,  3 Dec 2020 12:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 429206E9AF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 12:54:06 +0000 (UTC)
IronPort-SDR: O4eL6sXBYW5FPu4CgtTNVZgxCTxLzCNX4qMYpm0vVfszJqSoo2LJR9kCjVFmhgwxtGMTA0+9un
 Fizb5bJp5DRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9823"; a="153012880"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="153012880"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 04:54:05 -0800
IronPort-SDR: u/ZzMiE6b+dhj9SHs1bfz6iOvmo6Alof09j1Nwdr8V6CvUMLSPMAD2AMFOY9b4burfPVVnCsN7
 JPPU3+rZLT6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="346224350"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 03 Dec 2020 04:54:02 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Dec 2020 14:54:02 +0200
Date: Thu, 3 Dec 2020 14:54:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: Fix drm.h uapi header for Windows
Message-ID: <20201203125402.GH6112@intel.com>
References: <1606816916-3724-1-git-send-email-jpark37@lagfreegames.com>
 <1606816916-3724-2-git-send-email-jpark37@lagfreegames.com>
 <f1432016-4a83-8cc6-a5cd-6e0d74b9e156@daenzer.net>
 <CAKMK7uF=St1Uf_smL3HLi458cKfyOYM27FUX5+vjG5qSSD3Jnw@mail.gmail.com>
 <2dbbc3dc-4df8-9ca4-4dce-808df0b24950@daenzer.net>
 <CABjik9dprmMzvmiu8XDPL+x9a7mbbOfPVAfbtAd1Sv74HxVSdg@mail.gmail.com>
 <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uFQcyKRb90FiWFGf3pqotMmLvsTDf9yc7m1Or1tYkdOOA@mail.gmail.com>
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
Cc: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 James Park <jpark37@lagfreegames.com>,
 James Park <james.park@lagfreegames.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 02, 2020 at 11:25:58PM +0100, Daniel Vetter wrote:
> On Wed, Dec 2, 2020 at 8:48 PM James Park <james.park@lagfreegames.com> w=
rote:
> >
> > I can avoid modifying drm.h by doing this to drm_fourcc.h:
> >
> > #ifdef _WIN32
> > #include <stdint.h>
> > typedef uint64_t __u64;
> > #else
> > #include "drm.h"
> > #endif
> >
> > And this to amdgpu_drm.h:
> >
> > #ifdef _WIN32
> > #include <stdint.h>
> > typedef int32_t  __s32;
> > typedef uint32_t __u32;
> > typedef uint64_t __u64;
> > #else
> > #include "drm.h"
> > #endif
> >
> > But now I'm touching two files under drm-uapi instead of one, and weird=
ly.
> >
> > If we're trying to cut ties with the drm-uapi folder entirely, the stuf=
f ac_surface.c need includes the AMD_FMT_MOD stuff in drm_fourcc.h, and AMD=
GPU_TILING_* under amdgpu_drm.h. Is there a better spot for these definitio=
ns?
> =

> The drm_fourcc.h maybe makes some sense (I think in some places mesa
> uses these internally, and many drivers use the modifiers directly in
> the main driver). But the amdgpu header should be all ioctl stuff,
> which should be all entirely in the winsys only.
> =

> Also kinda disappointing that drm_fourcc.h includes drm.h and isn't
> standalone, but I guess that sailed (at least for linux).

Isn't the only thing it needs the __u32? I would think we could just
replace those with unsigned int (DRM_FORMAT_BIG_ENDIAN already assumes
int is 32bit it seems) and drop the drm.h.

Or are we're worried something already depends on getting drm.h via
just including drm_fourcc.h?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
