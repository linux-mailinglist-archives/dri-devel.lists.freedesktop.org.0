Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 933F01375DD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 19:09:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BDE96EA7D;
	Fri, 10 Jan 2020 18:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A4D16EA7B;
 Fri, 10 Jan 2020 18:09:49 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jan 2020 10:09:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,417,1571727600"; d="scan'208";a="212339355"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 10 Jan 2020 10:09:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 10 Jan 2020 20:09:44 +0200
Date: Fri, 10 Jan 2020 20:09:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Harry Wentland <hwentlan@amd.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/dp: Add current maximum eDP link
 rate to sink_rate array.
Message-ID: <20200110180944.GL13686@intel.com>
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
 <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
 <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
 <CAEsyxyjMsCU8rzyO0GewU_-uV5+UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com>
 <bae132f3-73e6-5004-c9a9-adb632338268@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bae132f3-73e6-5004-c9a9-adb632338268@amd.com>
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
Cc: mario.kleiner.de@gmail.de, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 09, 2020 at 04:26:19PM -0500, Harry Wentland wrote:
> =

> =

> On 2020-01-09 4:04 p.m., Mario Kleiner wrote:
> > On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher <alexdeucher@gmail.com
> > <mailto:alexdeucher@gmail.com>> wrote:
> >
> >     On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner
> >     <mario.kleiner.de@gmail.com <mailto:mario.kleiner.de@gmail.com>>
> >     wrote:
> >     >
> >     > On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher
> >     <alexdeucher@gmail.com <mailto:alexdeucher@gmail.com>> wrote:
> >     >>
> >     >> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
> >     >> <mario.kleiner.de@gmail.com
> >     <mailto:mario.kleiner.de@gmail.com>> wrote:
> >     >> >
> >     As Harry mentioned in the other thread, won't this only work if the
> >     display was brought up by the vbios?=A0 In the suspend/resume case,
> >     won't we just fall back to 2.7Gbps?
> >
> >     Alex
> >
> >
> > Adding Harry to cc...
> >
> > The code is only executed for eDP. On the Intel side, it seems that
> > intel_edp_init_dpcd() gets only called during driver load /
> > modesetting init, so not on resume.
> >
> > On the AMD DC side, dc_link_detect_helper() has this early no-op
> > return at the beginning:
> >
> > if ((link->connector_signal =3D=3D SIGNAL_TYPE_LVDS ||
> > 			link->connector_signal =3D=3D SIGNAL_TYPE_EDP) &&
> > 			link->local_sink)
> > 		return true;
> >
> > So i guess if link->local_sink doesn't get NULL'ed during a
> > suspend/resume cycle, then we never reach the setup code that would
> > overwrite with non vbios settings?
> >
> > Sounds reasonable to me, given that eDP panels are usually fixed
> > internal panels, nothing that gets hot(un-)plugged?
> >
> > I can't test, because suspend/resume with the Polaris gpu on the MBP
> > 2017 is totally broken atm., just as vgaswitcheroo can't do its job.
> > Looks like powering down the gpu works, but powering up doesn't. And
> > also modesetting at vgaswitcheroo switch time is no-go, because the
> > DDC/AUX lines apparently can't be switched on that Apple gmux, and
> > handover of that data seems to be not implemented in current
> > vgaswitcheroo. At the moment switching between AMD only or Intel+AMD
> > Prime setup is quite a pita...
> >
> =

> I haven't followed the entire discussion on the i915 thread but for the
> amdgpu dc patch I would prefer a DPCD quirk to override the reported
> link settings with the correct link rate.

We could consider adding a standard function for reading the receiver
caps and applying the quirk there. I have a feeling that putting it
into drm_dp_dpcd_read() would be a bit too low level since it would
prevent reading the non-quirked raw data easily.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
