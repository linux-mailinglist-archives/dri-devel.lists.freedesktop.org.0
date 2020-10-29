Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4528329F0CA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 17:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4E76E8C5;
	Thu, 29 Oct 2020 16:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAC06E8C3;
 Thu, 29 Oct 2020 16:09:16 +0000 (UTC)
IronPort-SDR: GshIsFz7iXT2lx4YavL1l+YlrqKdK0DonX08zXtHmiIEmTJU1euglN/LeWbgHj5J7igKRtpYal
 N5+TUZfUYE2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9788"; a="165873838"
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="165873838"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 09:09:15 -0700
IronPort-SDR: 6lHAkU2uMm9i+6B5nevJE3AdPH/wGl+0ItOdqeMRDuc1klGvub8wLCUkCz+geWYxLjJaCZPV8O
 er5kIXRwj3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,430,1596524400"; d="scan'208";a="362145339"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 29 Oct 2020 09:09:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 29 Oct 2020 18:09:12 +0200
Date: Thu, 29 Oct 2020 18:09:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [Intel-gfx] [PATCH] drm: Silence zero EDID carping
Message-ID: <20201029160912.GE6112@intel.com>
References: <20201029110030.9959-1-chris@chris-wilson.co.uk>
 <20201029140746.GD6112@intel.com>
 <160398728309.7048.13594460258034679908@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160398728309.7048.13594460258034679908@build.alporthouse.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 29, 2020 at 04:01:23PM +0000, Chris Wilson wrote:
> Quoting Ville Syrj=E4l=E4 (2020-10-29 14:07:46)
> > On Thu, Oct 29, 2020 at 11:00:30AM +0000, Chris Wilson wrote:
> > > We have a few displays in CI that always report their EDID as a bunch=
 of
> > > zeroes. This is consistent behavioud, so one assumes intentional
> > > indication of an "absent" EDID. Let us treat is as such by silently
> > > reporting the zero edid using connector->null_edid_counter, leaving t=
he
> > > loud carp to EDID that violate their checksums or otherwise return
> > > unexpected illegal data upon reading. These are more likely to be
> > > inconsistent bad connections rather than being intended.
> > =

> > I don't think null_edid_counter is actually used by anything.
> > So apart from wondering why the mode list has turned strange
> > is there some way I can still see from the logs that the
> > EDID has become all zeroes?
> =

> The ones in question, it's every time we read the EDID it comes back
> zero. I am betting that transient everything-is-zero rather than
> spurious data is rare enough not to worry about.
> =

> An alternative would be to pass the log level to the bad_edid dumper, or
> just make it debug for even gibberish edids?

I suspect debug should be good enough for this. The user is probably
going to notice some problem with their display resolution if the
EDID is bad/zero, so we should still get the bug report.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
