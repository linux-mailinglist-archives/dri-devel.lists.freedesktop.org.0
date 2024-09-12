Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C119E976A7A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2024 15:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577A510EB79;
	Thu, 12 Sep 2024 13:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MM7/2yr4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4328510EB79
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 13:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726147551; x=1757683551;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=xITUTQRl45ipox7CJz4yV6/g4MnIuHZA5arLXxNw0d4=;
 b=MM7/2yr4SZihDHUhMeOOdPC8xcTEbkBDIYgUVoPgMCs3z+dqa5V4Eh0k
 IHimXa8lggwYdKzvS/jcnugxClNEcVEBMO2R65kbbQ7PBP3NqdTujzaoe
 H1SAnwOa6yIflqta2/QWnK7RHl9sttnMfKjKkEG3MQHWkhJuTLV2lxuai
 37P8wVcbSVdgExBgdOkl2y3nc/Hx85dANuLmMd/swahXHzqH8pUx6Mxs2
 2tQq93oA0HyPBQxu5IaptIjSgzM7O0ca6m3e3UUWaTrKKzOs9jivSCTrr
 JTyIGnoYoIGpqt1Qj32jzb5qvwZ2dTX96YC/kgyPrsdIUvd56OwjWM2Sa A==;
X-CSE-ConnectionGUID: NoUcd+7sR8CBygAFNFfOlg==
X-CSE-MsgGUID: g3aZ7xKgTmmEhtVuiQGKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24822065"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24822065"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:25:50 -0700
X-CSE-ConnectionGUID: +CKDuMijSYue4qvW/tYUVg==
X-CSE-MsgGUID: JIG+0YWCTMOhzOyUEBe6+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67328839"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:25:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Tejas Vipin
 <tejasvipin76@gmail.com>, Laurent.pinchart@ideasonboard.com,
 patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/gma500: replace drm_detect_hdmi_monitor() with
 drm_display_info.is_hdmi
In-Reply-To: <1d16c1ae-2e27-4daa-b8a6-5eab179ef551@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240911180650.820598-1-tejasvipin76@gmail.com>
 <b0f77fcc-5d84-4727-9a17-9d1f1e2c5b76@suse.de> <87o74ti7g5.fsf@intel.com>
 <87ldzxi71s.fsf@intel.com> <988bb389-13e6-4465-ab37-3ed94ecee9be@suse.de>
 <87y13xgqj3.fsf@intel.com> <57016d01-4525-4685-b029-41e03b0abbda@suse.de>
 <87bk0tgll7.fsf@intel.com> <1d16c1ae-2e27-4daa-b8a6-5eab179ef551@suse.de>
Date: Thu, 12 Sep 2024 16:25:44 +0300
Message-ID: <87mskdf1gn.fsf@intel.com>
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

On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 12.09.24 um 13:25 schrieb Jani Nikula:
>> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> Hi
>>>
>>> Am 12.09.24 um 11:38 schrieb Jani Nikula:
>>>> On Thu, 12 Sep 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>> Am 12.09.24 um 10:56 schrieb Jani Nikula:
>>>>>> Moreover, in this case .detect() only detects digital displays as
>>>>>> reported by EDID. If you postpone that to .get_modes(), the probe he=
lper
>>>>>> will still report connected, and invent non-EDID fallback modes. The
>>>>>> behaviour changes.
>>>>> The change in behavior is intentional, because the current test seems
>>>>> arbitrary. Does the driver not work with analog outputs?
>>>> Not on a DVI/HDMI port. Same with i915.
>>>>
>>>> That's possibly the only way to distinguish a DVI-A display connected =
to
>>>> DVI-D source.
>>> That's a detect failure, but IMHO our probe helpers should really handle
>>> this case.
>> How? Allow returning detect failures from .get_modes()?
>
> Something like that, I guess.
>
> For the specific problem it would be enough to read the first 20 bytes=20
> of EDID data on DVI connectors and test the digital-input flag bit=20
> against the exact connector requirements. drm_probe_ddc() could do this.=
=20

Just a quick reply on this particular point:

I'm very strongly against doing partial EDID reads. It's all geared
towards EDID block sized handling. And you can't do checksum checking on
the 20 bytes. It would be a maze of special casing, something the EDID
code could have less, not more.

BR,
Jani.

> Non-DVI connectors would continue to read a single bytes to detect the DD=
C.
>
> For more sophisticated problems, it would be good to introduce an=20
> intermediate callback that updates the connector state. So the probe=20
> logic would look like:
>
>  =C2=A01) call ->detect to read physical connector status
>  =C2=A02) return if physical status did not change
>  =C2=A03) increment epoch counter
>  =C2=A04) call ->update to update connector state and properties (EDID, e=
tc)=20
> get new connector status
>  =C2=A05) call ->get_modes if connected
>
> The initial ->detect would be minimal. The ->update, if implemented,=20
> could do more processing and error checking. It's result would be the=20
> connector's new status.
>
> On a side note, I've recently spend quite a few patches on getting the=20
> BMC output for ast and mgag200 usable. Something like the above logic=20
> would have helped, I think. Because with the current probe logic, I had=20
> to implement steps 1 to 4 in ->detect itself. The result has to maintain=
=20
> physical status and epoch counter by itself. [1]
>
> Best regards
> Thomas
>
> [1]=20
> https://gitlab.freedesktop.org/drm/kernel/-/commit/2a2391f857cdc5cf16f8df=
030944cef8d3d2bc30
>
>>
>> BR,
>> Jani.
>>
>>

--=20
Jani Nikula, Intel
