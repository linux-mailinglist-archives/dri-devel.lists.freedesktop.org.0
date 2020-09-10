Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A13F264566
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 13:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C678289FDE;
	Thu, 10 Sep 2020 11:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B982189FDE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 11:38:59 +0000 (UTC)
IronPort-SDR: sly+ku1pOt8FVoNmBRz9B2CGaetdq5duXUkD1CqNptXFcT+DdIxn/A/SdLLkXJ3JXqoT1ngS6S
 +g/N0+SxO2kQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="220071960"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="220071960"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 04:38:59 -0700
IronPort-SDR: G4NrXfpKu5BhDI7dqdRON0Quf2QqpH2D2vSTCqMNSKVZBvgPboyyocX2NwnBUkbZP1CXvHV+YD
 6+103JoRHTEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; d="scan'208";a="341898286"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 10 Sep 2020 04:38:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Sep 2020 14:38:55 +0300
Date: Thu, 10 Sep 2020 14:38:55 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: per-plane LUTs and CSCs?
Message-ID: <20200910113855.GX6112@intel.com>
References: <20200909105727.f5n5c6zudx2qyz2f@fsr-ub1864-141>
 <n5uMyyDW2WrhtODRwgsqla2mU-pP-gLV4vHHoIZzjvmzG17epyoBjSh8HxIcnaPAwIlRQZ7Aj7cuUz_iby97UlRMw-WAOss7k0oPQD8YPaQ=@emersion.fr>
 <20200910081836.GG438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910081836.GG438822@phenom.ffwll.local>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 10, 2020 at 10:18:36AM +0200, Daniel Vetter wrote:
> On Thu, Sep 10, 2020 at 07:50:59AM +0000, Simon Ser wrote:
> > On Wednesday, September 9, 2020 12:57 PM, Laurentiu Palcu <laurentiu.pa=
lcu@oss.nxp.com> wrote:
> > =

> > > Hi all,
> > >
> > > I was wondering whether you could give me an advise on how to proceed=
 further
> > > with the following issue as I'm preparing to upstream the next set of=
 patches
> > > for the iMX8MQ display controller(DCSS). The display controller has 3=
 planes,
> > > each with 2 CSCs and one degamma LUT. The CSCs are in front and after=
 the LUT
> > > respectively. Then the output from those 3 pipes is blended together =
and then
> > > gamma correction is applied using a linear-to-nonlinear LUT and anoth=
er CSC, if
> > > needed.
> > >
> > > Currently, downstream, we have all those CSCs and LUTs hard-coded int=
o a header
> > > file. Based on the colorspace, range, gamut selected for the output a=
nd/or
> > > plane input, we pick up the right CSCs and LUTs from that header file=
 to
> > > configure our pipes... I guess this solution does the job, userspace =
doesn't
> > > need to care much about how to generate those tables. But, it's also =
not very
> > > flexible in case there is an app smart enough to know and actually ge=
nerate
> > > their own custom tables. :/
> > >
> > > Looking through the dri-devel archives, I've seen that there was a te=
ntative to
> > > implement a more or less generic per-plane LUT/CSC solution but it di=
dn't make
> > > it in due to lack of userspace consumers...
> > =

> > Apart from full color management mentioned by Pekka, are there other
> > use-cases for these per-plane props?
> > =

> > One thing I can think of is that some drivers annoyingly only apply the
> > per-CRTC gamma LUT to the primary plane. I think it would make more
> > sense to not attach a gamma prop to the CRTC and instead only attach it
> > to the primary plane to make that clear. But I guess that would also
> > break existing user-space?
> =

> Uh, which drivers? This would be a driver bug (and there's been plenty of
> those where the cursor has the wrong color temp and fun stuff like that).
> We need to fix these driver issues instead of lamenting in userspace that
> it's all kinda broken :-)

Quite a bit of old hardware simpy couldn't apply the gamma to the
other planes. But hopefully that is no longer the case for any
modern hardware.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
