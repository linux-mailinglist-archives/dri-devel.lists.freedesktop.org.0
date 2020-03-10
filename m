Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D017F0E8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 08:05:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FDD6E06D;
	Tue, 10 Mar 2020 07:05:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56EC6E06D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 07:05:35 +0000 (UTC)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1jBYxK-0006u3-4g; Tue, 10 Mar 2020 08:05:34 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1jBYxI-0000rW-CL; Tue, 10 Mar 2020 08:05:32 +0100
Date: Tue, 10 Mar 2020 08:05:32 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 15/33] drm/panel-simple: Fix dotclock for EDT ET035012DM6
Message-ID: <20200310070532.7ltpdskupxxtd3me@pengutronix.de>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-16-ville.syrjala@linux.intel.com>
 <20200303073320.2udpokcs2ync4hpy@pengutronix.de>
 <20200303145251.GX13686@intel.com>
 <20200306080257.2v7knpjavace7jw4@pengutronix.de>
 <20200309131843.GW13686@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200309131843.GW13686@intel.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:00:25 up 115 days, 22:19, 139 users,  load average: 0.11, 0.05,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Thierry Reding <treding@nvidia.com>, Andreas Pretzsch <apr@cn-eng.de>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20-03-09 15:18, Ville Syrj=E4l=E4 wrote:
> On Fri, Mar 06, 2020 at 09:02:57AM +0100, Marco Felsch wrote:
> > On 20-03-03 16:52, Ville Syrj=E4l=E4 wrote:
> > > On Tue, Mar 03, 2020 at 08:33:20AM +0100, Marco Felsch wrote:
> > > > Hi Ville,
> > > > =

> > > > On 20-03-02 22:34, Ville Syrjala wrote:
> > > > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > > =

> > > > > The currently listed dotclock disagrees with the currently
> > > > > listed vrefresh rate. Change the dotclock to match the vrefresh.
> > > > > =

> > > > > Someone tell me which (if either) of the dotclock or vreresh is
> > > > > correct?
> > > > =

> > > > Pls, check the datasheet which is linked within the comment. We hit=
 the
> > > > vrefresh exactly if we are in SYNC MODE.
> > > =

> > > It's too much work to start hunting datasheets for all these
> > > and figuring out what's going on in each case. Pls just
> > > inform me which way is correct if you know the details.
> > =

> > How do you know that the clock is wrong if it is to much work? As I said
> > the clock is completely fine.
> =

> htotal*vtotal*vrefresh !=3D clock, so one or both are incorrect.

I checked the values using this equation:
clock / (htotal * vtotal) =3D vrefresh.

Regards,
  Marco
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
