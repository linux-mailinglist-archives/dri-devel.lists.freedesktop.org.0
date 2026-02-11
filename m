Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFuZGhlwjGluoAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:03:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2DF1240FE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0944510E145;
	Wed, 11 Feb 2026 12:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mZOuA7Y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FD310E145;
 Wed, 11 Feb 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770811414; x=1802347414;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0PVnu6077kn/sHrMX4M1V4c92Bf0gx2QSofA7b0udz4=;
 b=mZOuA7Y1c1V7xo5vOo/VN41NFX+dGoObDBjB6NIst8TOOYHVhCcw+dzh
 LClgvdzWFlsJrlVp2YDusl9yp8Z8r7bvJwXd0zx/Nbj3n/WowaKTT2YFU
 PVu5tp7LF0oraqB32DDLlP+cgn45xA8hrm7ofzgUTKVoS2dYLs0ymyrYi
 YpVPA1r3yGapuUHHZzXakul5lY4FPNQmArIJeaMf3cx7Dxl89ZJpwdxjr
 gJmlCRNnID93trQUlZCEevJfgkerBk6KdciccW7NTMmEWiifLa+ksqhRI
 ntkPYiPi5JTOoY6y0nEaf/Q4+5qTRGaZGMS8T1klArFjgTVkdm4dJS/93 Q==;
X-CSE-ConnectionGUID: Md+YAGQYTmqAMAEv7kL5og==
X-CSE-MsgGUID: AyRtLBUgSHOFc9f57qoO0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75805444"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75805444"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:03:33 -0800
X-CSE-ConnectionGUID: nrv8QZY2T4ScCuaTUH+7dw==
X-CSE-MsgGUID: t2K0X/OLTZSViwWVnL8H+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216735823"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 04:03:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Kaushlendra Kumar
 <kaushlendra.kumar@intel.com>
Subject: Re: [PATCH] drm/i915: free _DSM package when no connectors
In-Reply-To: <fcef7bb595e9197eec717a3876d8bc0c869a4b25@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109032549.1826303-1-kaushlendra.kumar@intel.com>
 <fcef7bb595e9197eec717a3876d8bc0c869a4b25@intel.com>
Date: Wed, 11 Feb 2026 14:03:27 +0200
Message-ID: <b6b359780b7b46802feff0f1db18f63aed8adab1@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: ED2DF1240FE
X-Rspamd-Action: no action

On Fri, 09 Jan 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> Subject prefix "drm/i915/acpi:"
>
> On Fri, 09 Jan 2026, Kaushlendra Kumar <kaushlendra.kumar@intel.com> wrot=
e:
>> acpi_evaluate_dsm_typed() returns an ACPI package in pkg.
>> When pkg->package.count =3D=3D 0, we returned without freeing pkg,
>> leaking memory. Free pkg before returning on the empty case.
>
> Fixes: 337d7a1621c7 ("drm/i915: Fix invalid access to ACPI _DSM objects")
> Cc: Takashi Iwai <tiwai@suse.de>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.14+
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.



>
>> Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_acpi.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm=
/i915/display/intel_acpi.c
>> index 68c01932f7b4..e06f324027be 100644
>> --- a/drivers/gpu/drm/i915/display/intel_acpi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_acpi.c
>> @@ -96,6 +96,7 @@ static void intel_dsm_platform_mux_info(acpi_handle dh=
andle)
>>=20=20
>>  	if (!pkg->package.count) {
>>  		DRM_DEBUG_DRIVER("no connection in _DSM\n");
>> +		ACPI_FREE(pkg);
>>  		return;
>>  	}

--=20
Jani Nikula, Intel
