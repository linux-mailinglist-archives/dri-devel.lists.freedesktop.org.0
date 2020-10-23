Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BB7297242
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 17:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C880A6F8A2;
	Fri, 23 Oct 2020 15:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC466F8A2;
 Fri, 23 Oct 2020 15:27:28 +0000 (UTC)
IronPort-SDR: uaHRmnx/2D/TaEF+JpUVJEwEzGYDTPke3K0mtnuQXioW1CEp9EgfUT2kL/Rx7EKMgzALrV4S1P
 29WdPnqaDyEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="147548066"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="147548066"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 08:27:24 -0700
IronPort-SDR: 3Fs3y3ZJZi0vPaN4bVpebT2ToW8yu8kA2stZvwxqC8hZLdCQutq5ILFGxS4BUnBmIQduJc3YGW
 NJgbDW3n3DPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="321768874"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 23 Oct 2020 08:27:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 23 Oct 2020 18:27:19 +0300
Date: Fri, 23 Oct 2020 18:27:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [Intel-gfx] drm_modes: signed integer overflow
Message-ID: <20201023152719.GV6112@intel.com>
References: <47527cdb-2eda-b5a3-d77c-3855b91a0b61@infradead.org>
 <20201022101423.GI6112@intel.com>
 <BaLsmzqZNUi-nVbYiLstRgspKGlLahAI8vM2_NPfos2PxM0N9lycj-Zn5TdqNtEHB-jeWgmzw9EHJxq4H5552tVi4bAZXTLnP0y1QsTPFtY=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BaLsmzqZNUi-nVbYiLstRgspKGlLahAI8vM2_NPfos2PxM0N9lycj-Zn5TdqNtEHB-jeWgmzw9EHJxq4H5552tVi4bAZXTLnP0y1QsTPFtY=@emersion.fr>
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
Cc: David Airlie <airlied@linux.ie>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 03:14:20PM +0000, Simon Ser wrote:
> On Thursday, October 22, 2020 12:14 PM, Ville Syrj=E4l=E4 <ville.syrjala@=
linux.intel.com> wrote:
> =

> > On Wed, Oct 21, 2020 at 08:13:43PM -0700, Randy Dunlap wrote:
> >
> > > Hi,
> > > With linux-next 20201021, when booting up, I am seeing this:
> > > [ 0.560896] UBSAN: signed-integer-overflow in ../drivers/gpu/drm/drm_=
modes.c:765:20
> > > [ 0.560903] 2376000 * 1000 cannot be represented in type 'int'
> >
> > Dang. Didn't realize these new crazy >8k modes have dotclocks reaching
> > almost 6 GHz, which would overflow even u32. I guess we'll switch to
> > 64bit maths. Now I wonder how many other places can hit this overflow
> > in practice...
> =

> Can you provide an example of a full crazy >8k mode?

These are two extreme cases:
        /* 216 - 10240x4320@100Hz 64:27 */
        { DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 5940000, 10240, 1243=
2,
                   12608, 13200, 0, 4320, 4336, 4356, 4500, 0,
                   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
          .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_64_27, },
        /* 217 - 10240x4320@120Hz 64:27 */
        { DRM_MODE("10240x4320", DRM_MODE_TYPE_DRIVER, 5940000, 10240, 1052=
8,
                   10704, 11000, 0, 4320, 4336, 4356, 4500, 0,
                   DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC),
          .picture_aspect_ratio =3D HDMI_PICTURE_ASPECT_64_27, }

> I'm trying to get
> a fix for my user-space [1], and I'm wondering if int32_t is enough
> after dividing by mode->htotal.
> =

> CC Pekka, just FYI (I think Weston has similar code).
> =

> [1]: https://github.com/swaywm/wlroots/pull/2450

What's with those 1000000LL constants? Are you storing
clock in Hz units?

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
