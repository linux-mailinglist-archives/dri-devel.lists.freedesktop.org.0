Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3441DC682
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 07:12:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AF889D5B;
	Thu, 21 May 2020 05:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3526089D5B;
 Thu, 21 May 2020 05:12:50 +0000 (UTC)
IronPort-SDR: V/+khkqMhXdEa3AgZXVAAhljrHFoFZN+YBC9Fr81dVV2ZcdFPo6VMJcpOx1j1Lx3WD6p4RHzAj
 bcSKYZcAdeTg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2020 22:12:49 -0700
IronPort-SDR: 1+aeESCg0A8D9JqPL0qTtJDd4Ad+TXzKQeUY9P5kWnku0vEbSjY63Ri7xq87wAvB2KCvfBs8e0
 teGd/3lzNneg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,416,1583222400"; d="scan'208";a="289599519"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.99.66.154])
 by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 22:12:47 -0700
Date: Thu, 21 May 2020 10:42:46 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2] drm/i915/hdcp: Add additional R0' wait
Message-ID: <20200521051246.GB8571@intel.com>
References: <20200520064602.GA20133@intel.com>
 <20200520130808.44095-1-sean@poorly.run>
 <CAMavQK+1f1DUJmCeUa5GvOLUBKiXtXH04VZtStqWmhXGazQD-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMavQK+1f1DUJmCeUa5GvOLUBKiXtXH04VZtStqWmhXGazQD-g@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-20 at 15:50:15 -0400, Sean Paul wrote:
> On Wed, May 20, 2020 at 9:08 AM Sean Paul <sean@poorly.run> wrote:
> >
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > We're seeing some R0' mismatches in the field, particularly with
> > repeaters. I'm guessing the (already lenient) 300ms wait time isn't
> > enough for some setups. So add an additional wait when R0' is
> > mismatched.
> >
> 
> I think my guess was wrong and now suspect this issue is fixed with
> "drm/i915/hdcp: Avoid duplicate HDCP enables".
> 
> While this patch probably still has some value in cases where R0' is
> slow to update, I don't have any concrete examples where it helps.
Sean, completely agree it will help to authenticate the slower hdcp sink,
as this is not breaking the spec too. But could we please introduce extra
delays when we encounter such needs?

As you mentioned, We already have a 3 * 100 mSec,
where spec says HDCP sink should keep the R0' ready after the 100mSec
from aksv write.

-Ram
> 
> Sean
> 
> 
> > Signed-off-by: Sean Paul <seanpaul@chromium.org>
> >
> > Changes in v2:
> > - Actually add the delay in R0` wait (Ram)
> > ---
> >
> > Apologies, v1 was generated from a forward port from the CrOS kernel and
> > patch got confused and put the diff in V' wait instead of R0' wait.
> >
> > Pay closer attention, Sean.
> >
> >  drivers/gpu/drm/i915/display/intel_hdcp.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > index 2cbc4619b4ce..3c2d8c0a6da6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> > @@ -743,6 +743,9 @@ static int intel_hdcp_auth(struct intel_connector *connector)
> >                 if (!wait_for(intel_de_read(dev_priv, HDCP_STATUS(dev_priv, cpu_transcoder, port)) &
> >                               (HDCP_STATUS_RI_MATCH | HDCP_STATUS_ENC), 1))
> >                         break;
> > +
> > +               /* Maybe the sink is lazy, give it some more time */
> > +               usleep_range(10000, 50000);
> >         }
> >
> >         if (i == tries) {
> > --
> > Sean Paul, Software Engineer, Google / Chromium OS
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
