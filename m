Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F6551E669
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 12:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC08112602;
	Sat,  7 May 2022 10:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ACF112602;
 Sat,  7 May 2022 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651918909; x=1683454909;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZtsjrH/TyQKKcLqPgkPV7j7osfrEUt2xDvpdmj4zhf4=;
 b=hRQxT+SBJ/leamudwLhdw8j4Yyia3GKfKPclR63fXcsOtRTAxq6a5whK
 ucLK/UOBK5LsBDl0X+4rZqvvORh1wxClr6qNtrmNtOm07YTtlgu3cW0lq
 XZU7+Oafetxt5PQ9iQ9AE4WDW7QcfrCJVHAaKOscF4COUo+gF1zB+9PEx
 B6ImtpxsmzjseHhQL3tvPWBzHO3+Yy2IG+bVRADoeVHaf0dCgkhg4MUEw
 ynZAX5gYLr5qkf3R/GhZhisjSVeWEK3pGDY8U+W15ts2qOUPOiKDBNCEQ
 ft3PCPHqmqNztVsLckCDqtXGaZ8UUwW5hLF8XoTtJUHzIb7hXxBVuxd36 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267530738"
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="267530738"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,206,1647327600"; d="scan'208";a="586452558"
Received: from wdrewek-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.155.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2022 03:21:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 17/25] drm/edid: add drm_edid helper for drm_edid_to_sad()
In-Reply-To: <YnVjbbMz4jvUL5B1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1651830938.git.jani.nikula@intel.com>
 <b3a5a99b1ec07d9b3b2bb9ccfadbf89768213fc6.1651830939.git.jani.nikula@intel.com>
 <YnVjbbMz4jvUL5B1@intel.com>
Date: Sat, 07 May 2022 13:21:44 +0300
Message-ID: <87sfplk5hj.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, May 06, 2022 at 01:10:24PM +0300, Jani Nikula wrote:
>> +int drm_edid_to_sad(const struct edid *edid, struct cea_sad **sads)
>> +{
>> +	struct drm_edid drm_edid =3D {
>> +		.edid =3D edid,
>> +		.size =3D edid_size(edid),
>> +	};
>> +
>> +	return _drm_edid_to_sad(&drm_edid, sads);
>
> No need to check for NULL edid in these wrappers?

Yeah, we do, and CI concurs. *facepalm*.

BR,
Jani.

>
>> +}
>>  EXPORT_SYMBOL(drm_edid_to_sad);
>>=20=20
>>  /**
>> --=20
>> 2.30.2

--=20
Jani Nikula, Intel Open Source Graphics Center
