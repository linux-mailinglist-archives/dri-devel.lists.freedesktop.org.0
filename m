Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990F6A45D38
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 12:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BFF10E255;
	Wed, 26 Feb 2025 11:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gl6OP3A+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5CE10E231;
 Wed, 26 Feb 2025 11:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740569619; x=1772105619;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bj8u/VTfvEKSVadoM6eWhJguZpmIx7UFV9zPkjdjO6o=;
 b=Gl6OP3A+DzkiGozxjtjsnv4b/z/RP8Vp6EmLmQiWEO8R3jCDpD1ehZq9
 opQYK6AwuVq5c+8/aZFe2jdsq/WmXAbM2yJzr1+t9Ta1dS3vOWjPhVWvn
 +Kq3qxUJj0iSs8T3ap5LHtb5/ls7vODlhD6oXjQnsNgFiE7oqpdSU4X/b
 ImkrFXnXCKtKomLqbqSZjM5nHEp3OjOTOZZ6HOhV6XkJ+DiJdg8aMHpNu
 SbJ6OnzBJ3m9tjK6S/hYpe8oeHAYlnOkqWCPvwNh+Ujz3Jw50TLXWjcZ2
 v0jv/H+k7cDx465MVztq1TEZryj5fyoJ9crVGGkX2YygkuT0oOsObbyQV A==;
X-CSE-ConnectionGUID: lgZRT8l6S9igTm4xAd72tw==
X-CSE-MsgGUID: fRr9QSHKS2Gh5zBXMT8wlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="66781898"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="66781898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:33:38 -0800
X-CSE-ConnectionGUID: TJihvrrsRgeQybRZ0yeiSA==
X-CSE-MsgGUID: 5L4ZB8/RTCS7cCKbWuK2zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="116680184"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.74])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 03:33:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Andy Yan <andyshrk@163.com>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Sandy
 Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, sam@ravnborg.org, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>
Subject: Re:Re: [PATCH 2/5] drm/rockchip: stop passing non struct drm_device
 to drm_err() and friends
In-Reply-To: <f5dc475.a51e.19541d449c5.Coremail.andyshrk@163.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1737644530.git.jani.nikula@intel.com>
 <f42da4c9943a2f2a9de4272b7849e72236d4c3f9.1737644530.git.jani.nikula@intel.com>
 <2c0a76c3.618c.19497bb4329.Coremail.andyshrk@163.com>
 <87plkcbfp0.fsf@intel.com>
 <730ee1d4.f63.1949b97fc99.Coremail.andyshrk@163.com>
 <21d7745d-8fcd-484f-b1f2-82fd87dc8079@suse.de>
 <f5dc475.a51e.19541d449c5.Coremail.andyshrk@163.com>
Date: Wed, 26 Feb 2025 13:33:30 +0200
Message-ID: <87plj53ppx.fsf@intel.com>
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

On Wed, 26 Feb 2025, "Andy Yan" <andyshrk@163.com> wrote:
> Hi=EF=BC=8C
>
> =E5=9C=A8 2025-02-26 16:33:21=EF=BC=8C"Thomas Zimmermann" <tzimmermann@su=
se.de> =E5=86=99=E9=81=93=EF=BC=9A
>>Hi
>>
>>Am 25.01.25 um 04:53 schrieb Andy Yan:
>>>
>>> =E5=9C=A8 2025-01-24 19:43:07=EF=BC=8C"Jani Nikula" <jani.nikula@intel.=
com> =E5=86=99=E9=81=93=EF=BC=9A
>>>> On Fri, 24 Jan 2025, "Andy Yan" <andyshrk@163.com> wrote:
>>>>> Hi=EF=BC=8C
>>>>>
>>>>> At 2025-01-23 23:09:09, "Jani Nikula" <jani.nikula@intel.com> wrote:
>>>>>> The expectation is that the struct drm_device based logging helpers =
get
>>>>>> passed an actual struct drm_device pointer rather than some random
>>>>>> struct pointer where you can dereference the ->dev member.
>>>>>>
>>>>>> Convert drm_err(hdmi, ...) to dev_err(hdmi->dev, ...). This matches
>>>>>> current usage, but drops "[drm] *ERROR*" prefix from logging.
>>>>> Frankly, I prefer the original version of the log.
>>>>> It is a platform driver, so it should use its own device.
>>>>> It is a driver that works in drm subsystem, so it's better to use "[d=
rm] *ERROR*" prefix when logging
>>>> If you need to do struct device based logging that is not the same
>>>> device as the struct drm_device dev member, you need to use dev_err()
>>>> and friends. You can't and must not use drm_err() and friends.
>>>>
>>>> It's as simple as that.
>>>>
>>>> The current drm_err(hdmi, ...) usage is simply abuse of the macros, and
>>>> must stop.
>>> Perhaps when you initially designed this macros, you intended it to acc=
ept only drm_device,
>>> but your code implementation didn't enforce this restriction at the beg=
inning.
>>
>>C'mon. Are we really arguing about type safety now?
>>
>>Patch 5 adds a little getter function that does the type check on the=20
>>function call's argument.
>>
>>
>>> If that's truly what you intended, I suggest just reverting this commit=
 that converting to use these macros[0],
>>> as neither drm_err nor dev_err can maintain consistency with the origin=
al log of this driver.
>>> Alternatively, as suggested by Sam  in the initial submission of your p=
atch 5 years ago,
>>> there should also be a macro similar to drm_dev_info(device *, ..).[1]
>>
>>DRM code tends to keep a reference to the drm_device somewhere and=20
>>fetches it if necessary. For this patch, it should be possible to fetch=20
>>the DRM device from struct rockchip_hdmi easily. Just do
>>
>> =C2=A0 drm_err(rockchip_hdmi_drm_dev(hdmi), "...");
>>
>>This would resolve the problem without new logging functions and keep=20
>>the "[drm]" prefix to the messages.
>
> Yes, this keeps the "[drm]" prefix to the log messages, but it also chang=
ed hdmi
> device from drm device in the log messages.
> For more efficient debugging, it is preferable for log entries to explici=
tly specify which device generated them,
> especially in DRM systems where multiple devices(bridge/encoder) may be p=
resent."
>
> And I'm ok with this PATCH. However, I would also like to know your and J=
ani's opinions on whether we can consider
> adding an API similar to drm_dev_info=EF=BC=8Cas Sam suggested before. Of=
 course, this could be left for future implementation
> by others.

I'm not at all thrilled about adding loads of variations of drm specific
debug macros. They just multiply.

The way around that would be to use _Generic() to allow passing either
struct drm_device (which would use drm->dev) or a more specific struct
device to be used for dev based logging. I'd be supportive of that.

However, this patch series is a dependency for implementing generics at
a later time. I'd like to start here instead of piling on more work.

Furthermore, there's been talk about drm display object based
logging. The generics could later be expanded to allow for example:

	drm_err(connector, "Fail\n");

to translate to:

	dev_err(connector->dev->dev, "[CONNECTOR:%d:%s] Fail\n",
		connector->base.id, connector->name);

This would simplify a lot of connector based logging. Similarly for
other objects.

BR,
Jani.


--=20
Jani Nikula, Intel
