Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EA317E0BE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 14:00:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5EEC6E438;
	Mon,  9 Mar 2020 13:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6329089F07
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2020 13:00:39 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 06:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="245336534"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 09 Mar 2020 06:00:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 09 Mar 2020 15:00:35 +0200
Date: Mon, 9 Mar 2020 15:00:35 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH 24/33] drm/panel-simple: Fix dotclock for Ortustech
 COM37H3M
Message-ID: <20200309130035.GV13686@intel.com>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-25-ville.syrjala@linux.intel.com>
 <4320E187-FAA1-4033-A02C-7DA1F9B68A52@goldelico.com>
 <20200303150336.GZ13686@intel.com>
 <CDD5B6AE-6711-4B81-87F9-8DBD067E33BD@goldelico.com>
 <C1BE9158-7D08-44D0-9699-4029806ABDE7@goldelico.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C1BE9158-7D08-44D0-9699-4029806ABDE7@goldelico.com>
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
Cc: Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 08:41:43PM +0100, H. Nikolaus Schaller wrote:
> =

> > Am 03.03.2020 um 16:49 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > =

> > Hi,
> > =

> >> Am 03.03.2020 um 16:03 schrieb Ville Syrj=E4l=E4 <ville.syrjala@linux.=
intel.com>:
> >> =

> >>> I haven't looked into the driver code, but would it be
> >>> possible to specify .clock =3D 0 (or leave it out) to
> >>> calculate it bottom up? This would avoid such inconsistencies.
> >> =

> >> I'm going to remove .vrefresh entirely from the struct.
> >> It'll just be calculated from the other timings as needed.
> > =

> > Ok!
> > =

> > Anyways we should fix the panel timings so that it is compatible to .vr=
efresh =3D 60.
> > =

> > I'll give it a try and let you know.
> =

> Ok, here is a new parameter set within data sheet limits for both
> panel variants:
> =

> static const struct drm_display_mode ortustech_com37h3m_mode  =3D {
> 	.clock =3D 22153,
> 	.hdisplay =3D 480,
> 	.hsync_start =3D 480 + 40,
> 	.hsync_end =3D 480 + 40 + 10,
> 	.htotal =3D 480 + 40 + 10 + 40,
> 	.vdisplay =3D 640,
> 	.vsync_start =3D 640 + 4,
> 	.vsync_end =3D 640 + 4 + 2,
> 	.vtotal =3D 640 + 4 + 2 + 4,
> 	.vrefresh =3D 60,
> 	.flags =3D DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> };
> =

> I have tested on our omap3 based board and didn't find an issue
> so you can insert into your patch.

Migth be better if you send that so we get proper attribution and
you can explain the change properly in the commit message.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
