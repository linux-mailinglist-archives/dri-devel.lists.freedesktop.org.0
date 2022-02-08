Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF554AD9E5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272E910E44E;
	Tue,  8 Feb 2022 13:31:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1234A10E322;
 Tue,  8 Feb 2022 13:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644327106; x=1675863106;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=emLhjuFtiNvDf0ssl1nHQzlNU530Eeh8fTVjVghjVug=;
 b=a3230jJTcg8XTz+HE55S0RMA9CgFp6Qq1UU5EdF+QM93ngtzJ0oU/4dE
 QkW3IW4AvV5qmWDt7sOJJohVM7xeR1xsbROs7JklMARxy3ENasZJLhQLh
 wpEEQpKJDtBhzGrRukgj/XVeQuhCDsgK9dcJEwhZe1D/sGEdVbOFHBQVu
 7DT4l3Iq794aA+4NbMZfB+Nsjezw3MOtby5l83wxm7meG5YL/j53j5UH+
 OLMxR+AyotOnulEaVhrQBA4PG/UhimSRDrHvcYy7HA4A7jLFCgc3E4OoG
 OJDbQzfVH0R5EfsVTnbWmr9czgv1mGGrDo9VHknA89Fus23kK69/Jwtof g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="236352411"
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="236352411"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 05:31:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,352,1635231600"; d="scan'208";a="621904495"
Received: from ijbeckin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.19.63])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 05:31:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 5/8] drm/i915/dp: rewrite DP 2.0 128b/132b link
 training based on errata
In-Reply-To: <YgJoWUYRVjJDQFq4@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1643878928.git.jani.nikula@intel.com>
 <bda92c2540e661c39613167b53b5e5388a57a730.1643878928.git.jani.nikula@intel.com>
 <Yf0P8kLCFcotNVkl@intel.com> <87k0e5ra3h.fsf@intel.com>
 <YgI6Pxspeg2yNr2s@intel.com> <87fsotr1zi.fsf@intel.com>
 <YgJoWUYRVjJDQFq4@intel.com>
Date: Tue, 08 Feb 2022 15:31:41 +0200
Message-ID: <87bkzhqybm.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 08 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Feb 08, 2022 at 02:12:33PM +0200, Jani Nikula wrote:
>> On Tue, 08 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.=
com> wrote:
>> > On Tue, Feb 08, 2022 at 11:17:22AM +0200, Jani Nikula wrote:
>> >> On Fri, 04 Feb 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.int=
el.com> wrote:
>> >> > On Thu, Feb 03, 2022 at 11:03:54AM +0200, Jani Nikula wrote:
>> >> >> +
>> >> >> +		if (timeout) {
>> >> >> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
>> >> >> +			drm_err(&i915->drm,
>> >> >> +				"[ENCODER:%d:%s] Lane channel eq timeout\n",
>> >> >> +				encoder->base.base.id, encoder->base.name);
>> >> >> +			return false;
>> >> >> +		}
>> >> >> +
>> >> >> +		if (time_after(jiffies, deadline))
>> >> >> +			timeout =3D true; /* try one last time after deadline */
>> >> >
>> >> > Is there a reason we can't do this just before drm_dp_dpcd_read_lin=
k_status()
>> >> > so we don't have to pass the timeout status from one loop iteration=
 to
>> >> > the next?
>> >>=20
>> >> The point is to check one last time after timeout has passed, like you
>> >> suggested in previous review, and I agreed.
>> >
>> > Sure but why can't it be something more like?
>> >
>> > timeout =3D time_after();
>> > read_status();
>> > if (bad)
>> > 	bail;
>> > if (timeout)
>> > 	bail;
>> >
>> > I think we have it more like that in wait_for()/etc.
>>=20
>> I was going to fix this, but then realized the "one more time" really
>> only makes sense if it includes updating the signal levels and training
>> set and then checking the status. I don't think there's point in "one
>> more time" only covering the status read.
>
> Hmm. Yeah, I suppose that is true. We can't really know when the sink
> updated the status so checking for the timeout just before that might
> have the same issue as checking entirely after the status check.
>
>>=20
>> I've got the loop set up such that the flow is natural when entering the
>> loop i.e. I'd rather not have the adjust in the beginning with some if
>> (try !=3D 0) check.
>>=20
>> Or am I missing something?
>
> Nah. I guess it's best leave it the way you have it now.

Thanks. Sent v3, but realized I'm still missing the intra-hop stuff.



--=20
Jani Nikula, Intel Open Source Graphics Center
