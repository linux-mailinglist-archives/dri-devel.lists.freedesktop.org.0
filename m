Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E2262E51
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 14:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5B46E1F8;
	Wed,  9 Sep 2020 12:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A8F6E1F8
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 12:08:39 +0000 (UTC)
IronPort-SDR: Iwl5WR8A2kZMxQM19lbgVZ6DVrufQG+9tx6sa78vqBhJMOGVgKRCbKw8bvX5V2Tml85o2A3GQG
 QaYHMX8L6/Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="222519214"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="222519214"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2020 05:08:38 -0700
IronPort-SDR: 9cxFj3RUQgk5FjzT8W4RE51B+9h4XAtAaSIcKY7Q+rPYRQzO94hwuyucphFcaUvq4rGjf2kzR8
 nE/+gA8i/z5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; d="scan'208";a="304479669"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Sep 2020 05:08:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 09 Sep 2020 15:08:35 +0300
Date: Wed, 9 Sep 2020 15:08:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
Message-ID: <20200909120835.GJ6112@intel.com>
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
 <20200908155208.GF11405@pendragon.ideasonboard.com>
 <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 05:05:48PM +0100, Kieran Bingham wrote:
> Hi Laurent,
> =

> On 08/09/2020 16:52, Laurent Pinchart wrote:
> > Hi Kieran,
> > =

> > On Tue, Sep 08, 2020 at 04:42:58PM +0100, Kieran Bingham wrote:
> >> On 06/08/2020 03:26, Laurent Pinchart wrote:
> >>> When creating a frame buffer, the driver verifies that the pitches for
> >>> the chroma planes match the luma plane. This is done incorrectly for
> >>> fully planar YUV formats, without taking horizontal subsampling into
> >>> account. Fix it.
> >>>
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboar=
d.com>
> >>> ---
<snip>
> >>>  	}, {
> >>>  		.fourcc =3D DRM_FORMAT_YVU444,
> >>>  		.v4l2 =3D V4L2_PIX_FMT_YVU444M,
> >>>  		.bpp =3D 24,
> >>>  		.planes =3D 3,
> >>> +		.hsub =3D 1,
> >>>  	},
> >>>  };
> >>>  =

> >>
> >> I wonder when we can have a global/generic set of format tables so that
> >> all of this isn't duplicated on a per-driver basis.
> > =

> > Note that this table also contains register values, so at least that
> > part will need to be kept. For the rest, do you mean a 4CC library that
> =

> Yes, the driver specific mappings of course need to be driver specific.
> =

> =

> > would be shared between DRM/KMS and V4L2 ? That's a great idea. Too bad
> > it has been shot down when patches were submitted :-S
> =

> =

>  /o\ ... It just seems like so much data replication that must be used
> by many drivers.
> =

> Even without mapping the DRM/V4L2 fourccs - even a common table in each
> subsystem would be beneficial wouldn't it?
> =

> I mean - RCar-DU isn't the only device that needs to know how many
> planes DRM_FORMAT_YUV422 has, or what horizontal subsampling it uses?
> =

> Anyway, that's not an issue with this patch, it just seems glaring to me
> that these entries are common across all hardware that use them ...
> =

> (the bpp/planes/subsampling of course, not the hardware specific register=
s).

See drm_format_info() & co.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
