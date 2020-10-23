Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA3029796D
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 00:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41D6E839;
	Fri, 23 Oct 2020 22:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504056E839;
 Fri, 23 Oct 2020 22:52:07 +0000 (UTC)
IronPort-SDR: PH9r20ZImY//Cl8eOWUNd7oZRDH9XyN+F7CTSJaYmGxlFoystp9s4Di9j0m9OKXsYAbHt+7M9p
 PiJ/EsVDe3Jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9783"; a="167862143"
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; d="scan'208";a="167862143"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 15:52:06 -0700
IronPort-SDR: 3lB6R6crZpjscfm5YpA2kGymX/e+mbbGX0VDo7rGavBni8rIb7r4fUmcuyarurRwngJCcjWlme
 uTrtK2h0XRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,410,1596524400"; d="scan'208";a="359738119"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 23 Oct 2020 15:52:01 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 24 Oct 2020 01:52:00 +0300
Date: Sat, 24 Oct 2020 01:52:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: Don't create the IN_FORMATS blob when the driver
 does not provide .format_mod_supported()
Message-ID: <20201023225200.GF6112@intel.com>
References: <20201023203957.3255-1-ville.syrjala@linux.intel.com>
 <wusQ8YNZOE_lHaJ5e15M4lmDPxrD2HiUYKJN5Sh6bcZC-Ly-IzqOPeU9OSmC1X4ftuMbwhJpHRnpDQDnp6Z5-bHrONqzOyS8sdKYxN-TFTY=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wusQ8YNZOE_lHaJ5e15M4lmDPxrD2HiUYKJN5Sh6bcZC-Ly-IzqOPeU9OSmC1X4ftuMbwhJpHRnpDQDnp6Z5-bHrONqzOyS8sdKYxN-TFTY=@emersion.fr>
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
Cc: Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hdegoede@redhat.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 10:03:50PM +0000, Simon Ser wrote:
> On Friday, October 23, 2020 10:39 PM, Ville Syrjala <ville.syrjala@linux.=
intel.com> wrote:
> =

> > From: Ville Syrj=E4l=E4 ville.syrjala@linux.intel.com
> >
> > The code responsible for creating the IN_FORMATS
> > blob is broken when the driver doesn't provide a
> > .format_mod_supported() hook. It just copies in
> > the format list, but leaves all the modifier information
> > zeroed. That would indicate (in a very silly way) that
> > there are in fact no supported format+modifier combinations.
> > That is utter nonsense.
> =

> Should we WARN_ON when the driver enables allow_fb_modifiers but
> doesn't populate format_mod_supported?

.format_mod_supported() was supposed to be optional IIRC.

But now that I look at it, it looks like only these
drivers are lacking .format_mod_supported(): exynos, mxsfb,
tiny/cirrus, tiny/gm12u320.

There is some other oddity going on with sun4i which sometimes
uses modifiers sometimes it doesn't. No idea what is going on there.
But it does have .format_mod_supported() at least.

So I guess if we can get exynos, mxsfb, and tiny/* to implement
the hook then we could make it mandatory.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
