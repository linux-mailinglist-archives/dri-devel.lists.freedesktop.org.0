Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A348A96B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 09:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6436510F59C;
	Tue, 11 Jan 2022 08:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F5E112E4C;
 Tue, 11 Jan 2022 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641890080; x=1673426080;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=/0aU31xYzg/+MRAggb+53/jr584NfLEiehXMq2Y4qUw=;
 b=hfYnCvKsktU7JBFP49jte+/G19+B82SbaWjuZ6XnO0YjO+YOElOeNs0i
 nWJaDqX1e3P4u2ENR5NGIRlL6P+K0BZxFnnR+AEizf/QSYbdIzS+k01Ft
 QhlST/HgL+RMilpw0NtrgBSqnTVxZCCcuy2dxzSXZ4EBDyFI6wYg5JAID
 0W5CKKpVQ3C9+1i1UTEdN1o3GAoBD0zMFjiW2b+LPAy0UIGd2XRzeyVwg
 lceQsg7qaYT8r7ddQ2fhwXfePP7WbOLQruekKTMjrmojG2U6ogo/xymyq
 ZQyQit7VuMnC4ci6ysVTOlUpQME2r6ExJPmEhdHR8HvGU0i+lsFxmdXtj g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="306787857"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="306787857"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 00:34:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="690920830"
Received: from sjobrien-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.25.241])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 00:34:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 3/3] drm/atomic: Make private objs proper objects
In-Reply-To: <YdxYNV9AhlvHxibp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20170712155102.26276-1-ville.syrjala@linux.intel.com>
 <20170712155102.26276-3-ville.syrjala@linux.intel.com>
 <87tueoj4bw.fsf@intel.com> <YdxYNV9AhlvHxibp@intel.com>
Date: Tue, 11 Jan 2022 10:34:34 +0200
Message-ID: <87y23m8ycl.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jan 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Dec 31, 2021 at 03:23:31PM +0200, Jani Nikula wrote:
>> On Wed, 12 Jul 2017, ville.syrjala@linux.intel.com wrote:
>> > From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> >
>> > Make the atomic private object stuff less special by introducing proper
>> > base classes for the object and its state. Drivers can embed these in
>> > their own appropriate objects, after which these things will work
>> > exactly like the plane/crtc/connector states during atomic operations.
>> >
>> > v2: Reorder to not depend on drm_dynarray (Daniel)
>> >
>> > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
>> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> #v1
>> > Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>=20
>> Stumbled upon an old commit
>>=20
>> commit a4370c777406c2810e37fafd166ccddecdb2a60c
>> Author: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Date:   Wed Jul 12 18:51:02 2017 +0300
>>=20
>>     drm/atomic: Make private objs proper objects
>>=20
>> which is this patch.
>>=20
>> > @@ -3050,8 +3043,7 @@ struct drm_dp_mst_topology_state *drm_atomic_get=
_mst_topology_state(struct drm_a
>> >  	struct drm_device *dev =3D mgr->dev;
>> >=20=20
>> >  	WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
>> > -	return drm_atomic_get_private_obj_state(state, mgr,
>> > -						&mst_state_funcs);
>> > +	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(sta=
te, &mgr->base));
>> >  }
>> >  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>>=20
>> I don't think this combines well with...
>>=20
>> > diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_=
helper.h
>> > index 177ab6f86855..d55abb75f29a 100644
>> > --- a/include/drm/drm_dp_mst_helper.h
>> > +++ b/include/drm/drm_dp_mst_helper.h
>> > @@ -404,12 +404,17 @@ struct drm_dp_payload {
>> >  	int vcpi;
>> >  };
>> >=20=20
>> > +#define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst=
_topology_state, base)
>>=20
>> ...this in case of error pointers that
>> drm_atomic_get_private_obj_state() may return.
>
> offsetof(base)=3D=3D0 so should work in practice.

Returning zeros is fine, but error pointers are another matter.

BR,
Jani.


--=20
Jani Nikula, Intel Open Source Graphics Center
