Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F261D1255
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 14:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F156EA0A;
	Wed, 13 May 2020 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A256EA09;
 Wed, 13 May 2020 12:09:56 +0000 (UTC)
IronPort-SDR: lJls5fi9HRErEgCCecoOEroWtsoO/3+OtZ0tS4k8UkDKMbhGcVTzhWDHWwxyJ+Hbv8HO3XYvi1
 /aE3b5vACcwQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 05:09:55 -0700
IronPort-SDR: iPomKz0JiXr+ia67onKATzn/Cjd/v7hlbXshnG+YuLvG74r1VECzZ1bK83vpz+yO/wrxzj+rY4
 l6c/dQY/rZ4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="306770142"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 13 May 2020 05:09:53 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 May 2020 15:09:52 +0300
Date: Wed, 13 May 2020 15:09:52 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915/display: Set
 TRANS_DDI_MODE_SELECT to default value when disabling TRANS_DDI
Message-ID: <20200513120952.GA6112@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
 <20200117015837.402239-4-jose.souza@intel.com>
 <20200130172502.GH13686@intel.com>
 <2c578720445cfb0a036502b7dba94f1ebd2e8ca0.camel@intel.com>
 <20200131112054.GK13686@intel.com>
 <3efe08f0-4ba7-8702-d28b-827d118a6b34@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3efe08f0-4ba7-8702-d28b-827d118a6b34@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 01:58:47PM +0530, Sharma, Swati2 wrote:
> =

> =

> On 31-Jan-20 4:50 PM, Ville Syrj=E4l=E4 wrote:
> > On Thu, Jan 30, 2020 at 08:07:07PM +0000, Souza, Jose wrote:
> >> On Thu, 2020-01-30 at 19:25 +0200, Ville Syrj=E4l=E4 wrote:
> >>> On Thu, Jan 16, 2020 at 05:58:37PM -0800, Jos=E9 Roberto de Souza
> >>> wrote:
> >>>> TGL timeouts when disabling MST transcoder and fifo underruns over
> >>>> MST
> >>>> transcoders are fixed when setting TRANS_DDI_MODE_SELECT to 0(HDMI
> >>>> mode) during the disable sequence.
> >>>>
> >>>> Although BSpec disable sequence don't require this step it is a
> >>>> harmless change and it is also done by Windows driver.
> >>>> Anyhow HW team was notified about that but it can take some time to
> >>>> documentation to be updated.
> >>>>
> >>>> A case that always lead to those issues is:
> >>>> - do a modeset enabling pipe A and pipe B in the same MST stream
> >>>> leaving A as master
> >>>> - disable pipe A, promote B as master doing a full modeset in A
> >>>> - enable pipe A, changing the master transcoder back to A(doing a
> >>>> full modeset in B)
> >>>> - Pow: underruns and timeouts
> >>>>
> >>>> The transcoders involved will only work again when complete
> >>>> disabled
> >>>> and their power wells turned off causing a reset in their
> >>>> registers.
> >>>>
> >>>> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> >>>> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> >>>> ---
> >>>>   drivers/gpu/drm/i915/display/intel_ddi.c | 1 +
> >>>>   1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
> >>>> b/drivers/gpu/drm/i915/display/intel_ddi.c
> >>>> index 32ea3c7e8b62..82e90f271974 100644
> >>>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
> >>>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
> >>>> @@ -1997,6 +1997,7 @@ void intel_ddi_disable_transcoder_func(const
> >>>> struct intel_crtc_state *crtc_state
> >>>>   =

> >>>>   	val =3D I915_READ(TRANS_DDI_FUNC_CTL(cpu_transcoder));
> >>>>   	val &=3D ~TRANS_DDI_FUNC_ENABLE;
> >>>> +	val &=3D ~TRANS_DDI_MODE_SELECT_MASK;
> >>>
> >>> Feels a bit early since IIRC we still leave a bunch of other stuff
> >>> enabled/selected here. In fact we don't seem to be clearing the DDI
> >>> select
> >>> anywhere at all? That one I would be more suspicious of than the
> >>> mode.
> >>> But maybe we should just clear both somewhere? I would suggest it
> >>> should
> >>> be when we clear the port select finally.
> >>
> >> We are clearing DDI select, in our code it is named as
> >> TGL_TRANS_DDI_PORT_MASK/TRANS_DDI_PORT_MASK.
> >>
> >> For TGL in MST mode we clear DDI select in the block below for MST
> >> slaves and then in intel_ddi_post_disable_dp() for MST master as
> >> instructed by Display port sequences.
> > =

> > Ah. Hmm, so that can't be it then. Bummer. I guess I would still feel
> > a bit safer if we clear the mode select alongside the the DDI select
> > for the master. Since the spec says the DDI select must remain set for
> > the master there must be something still going on, and so I worry that
> > something might not work quite right if we change the mode
> > prematurely.
> =

> Hi Ville/Jose,
> =

> We are still observing
> =3D>*ERROR* Timed out waiting for ACT sent when disabling
> =3D>FIFO underruns
> Do we need a change disable sequence?

My crystal ball is foggy today. If you want to know whether there is a
mismatch between the spec and code you're just going to have to read
both and compare.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
