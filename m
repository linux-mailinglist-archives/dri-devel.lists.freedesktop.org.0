Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A52FA347A1F
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 15:03:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2403C6EB95;
	Wed, 24 Mar 2021 14:02:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3476E9D4;
 Wed, 24 Mar 2021 14:02:57 +0000 (UTC)
IronPort-SDR: eoVd/ucKh54023d3PuxhjFyiM8L7mmFqeexTC7n9BRZUcgcPvCXRjPUxeoacn+ADfII1zAImYS
 ThPHePsEyOwg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="177824816"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="177824816"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 07:02:55 -0700
IronPort-SDR: Lv+37aIFxUOXRI8IuHITv5PQulAuCboftcDEkGkPzbJ8oO+O10ZwqN/XQHz+T+68jS0cGIF/ch
 d+ySLTW+oAXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="408855419"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by fmsmga008.fm.intel.com with SMTP; 24 Mar 2021 07:02:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 24 Mar 2021 16:02:52 +0200
Date: Wed, 24 Mar 2021 16:02:52 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [Intel-gfx] [PATCH resend 2/2] drm/i915/display: Make
 vlv_find_free_pps() skip pipes which are in use for non DP purposes
Message-ID: <YFtGjHEdkMfR3bLr@intel.com>
References: <20210302120040.94435-1-hdegoede@redhat.com>
 <20210302120040.94435-3-hdegoede@redhat.com>
 <YD5Q8mA6y4/qcelo@intel.com>
 <d620fd9d-1685-3b2a-7c3b-a5d5fa6daddc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d620fd9d-1685-3b2a-7c3b-a5d5fa6daddc@redhat.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 23, 2021 at 11:39:09AM +0100, Hans de Goede wrote:
> Hi,
> =

> On 3/2/21 3:51 PM, Ville Syrj=E4l=E4 wrote:
> > On Tue, Mar 02, 2021 at 01:00:40PM +0100, Hans de Goede wrote:
> >> As explained by a long comment block, on VLV intel_setup_outputs()
> >> sometimes thinks there might be an eDP panel connected while there is =
none.
> >> In this case intel_setup_outputs() will call intel_dp_init() to check.
> >>
> >> In this scenario vlv_find_free_pps() ends up selecting pipe A for the =
pps,
> >> even though this might be in use for non DP purposes. When this is the=
 case
> >> then the assert_pipe() in vlv_force_pll_on() will fail when called from
> >> vlv_power_sequencer_kick().
> > =

> > The idea is that you *can* select a PPS from a pipe used for a non-DP
> > port since those don't care about the PPS stuff. So this doesn't seem
> > correct.
> =

> They may not care about the PPS stuff, but as the WARN / backtrace
> shows if the DPLL_VCO_ENABLE bit is not already set for the pipe, while
> the pipe is "otherwise" in use then vlv_force_pll_on() becomes unhappy
> triggering the WARN.
> =

> > a) I would like to see the VBT for this machine
> =

> https://fedorapeople.org/~jwrdegoede/voyo-winpad-a15-vbt
> =

> > b) I wonder if the DSI PLL is sufficient for getting the PPS going?
> =

> I have no idea, I just noticed the WARN / backtrace and this seemed
> like a reasonably way to deal with it. With that said I'm fine with fixing
> this a different way.
> =

> > c) If we do need the normal DPLL is there any harm to DSI in enabling i=
t?
> =

> I would assume this increases power-consumption and DSI panels are almost
> always used in battery powered devices.

This is just used while probing the panel, so power consumption is
not a concern.

> =

> Also this would impact all BYT/CHT devices, possible triggering unwanted
> side-effects. Where as the proposed fix below is much more narrowly targe=
ted
> at the problem. It might not be the most pretty fix but AFAICT it has a l=
ow
> risk of causing regressions.

It rather significantly changes the logic of the workaround, potentially
causing us to not find a free PPS at all. Eg. if you were to boot with
a VLV with pipe A -> eDP B + eDP C inactive + pipe B -> VGA then your
change would cause us to not find the free pipe B PPS for probing eDP C,
and in the end we'd get a WARN and fall back to pipe A PPS which would
clobber the actually in use pipe A PPS.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
