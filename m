Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F270F298AC2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 11:52:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A516E0E4;
	Mon, 26 Oct 2020 10:52:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5D46E0E4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:52:11 +0000 (UTC)
IronPort-SDR: npFnM+FYBUt2Q67tzP889aZBY/3nkrx2unnSMDVEBTXyuJ+5W8XA3g1HUPzX+/VNw6hKYiciPq
 EiRGLwJxsDZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9785"; a="252603654"
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; d="scan'208";a="252603654"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2020 03:52:10 -0700
IronPort-SDR: 9VM8gFPPVdRnDHQT1EKd82g/JSPGnXl5R2UxvM2UnzHHjjepkNt8BUmZk4/G3fs3aZ4pkmgmAQ
 Wp8TLBlHCxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,419,1596524400"; d="scan'208";a="360333777"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 26 Oct 2020 03:52:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 26 Oct 2020 12:52:07 +0200
Date: Mon, 26 Oct 2020 12:52:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] Implement .format_mod_supported in mxsfb
Message-ID: <20201026105207.GI6112@intel.com>
References: <96f62304bad202e4f920d2f4ed62c485@abrecht.li>
 <20201025155201.GA25070@bogon.m.sigxcpu.org>
 <CAKMK7uEX38yzJGy6PWBs-L375kUGAPQK7SMPjT8Ze+3oKk38Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uEX38yzJGy6PWBs-L375kUGAPQK7SMPjT8Ze+3oKk38Mg@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, dl-linux-imx <linux-imx@nxp.com>,
 Sascha Hauer <kernel@pengutronix.de>,
 Daniel Abrecht <freedesktop-linux-dri-devel@danielabrecht.ch>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 10:05:17AM +0100, Daniel Vetter wrote:
> On Sun, Oct 25, 2020 at 4:52 PM Guido G=FCnther <agx@sigxcpu.org> wrote:
> >
> > Hi Daniel,
> > On Sat, Oct 24, 2020 at 04:59:16PM +0000, Daniel Abrecht wrote:
> > > This will make sure applications which use the IN_FORMATS blob
> > > to figure out which modifiers they can use will pick up the
> > > linear modifier which is needed by mxsfb. Such applications
> > > will not work otherwise if an incompatible implicit modifier
> > > ends up being selected.
> >
> > Since this got broken by the switch away for the simple display
> > pipeline helper (ae1ed0093281939b80664a687689f12436c0e874) could
> > you add a fixes tag?
> =

> mxsfb is also missing setting the allow_fb_modifiers flag, without
> which all this modifier stuff won't work great.

drm_universal_plane_init() automagically adds it if a modifier list
is passed in.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
