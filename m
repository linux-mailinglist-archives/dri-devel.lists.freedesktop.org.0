Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDE8A4E27B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4D510E611;
	Tue,  4 Mar 2025 15:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NA+8gknZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C291810E616
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741101062; x=1772637062;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=t4HzfKpGGFlBoc1Etl+XJPQBVdf5gNOWugu+47JC6ps=;
 b=NA+8gknZtbkbgENAk3NdH5G55Ac4lTQhrrHEy4TKSa1kkd21lGRdITZr
 RltbrMCHRIwaUI6DhPnE3Ikr2X2cdF3U/QFefm9DubcTddkCVbG5CW0K/
 EVzJOeJn590H/eHAj3bfTgeYRxUy7Iq110Yz0rELG16r6Vi6CojxNDpvY
 JbCq5CqI9KBkmBRTmPWCNmj0h0oN2WHqBlFkD+oErgS3uy3Ay+9k16VKZ
 260etIN0SqS1O+pfTxQ+gAZh4ftpaP+EWeq9/eIPeHNKxBrK2VZSWwTB3
 cq+UZ1tC3f3UKXtZLspdTwh6bPKCzp6hEn5xppINH8KVwc40aJm6dZApJ A==;
X-CSE-ConnectionGUID: zs/Gg3lvSq2pF4AajBzf+g==
X-CSE-MsgGUID: E1X0LB8wR8agWEMXBMygfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41931906"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41931906"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:11:01 -0800
X-CSE-ConnectionGUID: 6VMaghNlR+GiLz6Ur7XksA==
X-CSE-MsgGUID: 2BOmcNboQNCQyeNL4RJSHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="149187083"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:10:56 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Aditya Garg <gargaditya08@live.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Atharva Tiwari <evepolonium@gmail.com>,
 Kerem Karabay <kekrby@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan
 Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] drm/tiny: fix printk format string for 32-bit
In-Reply-To: <05EAF4F2-7DFB-4C80-8D2A-054BCD7A126D@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250304142711.621330-1-arnd@kernel.org>
 <05EAF4F2-7DFB-4C80-8D2A-054BCD7A126D@live.com>
Date: Tue, 04 Mar 2025 17:10:52 +0200
Message-ID: <87bjugzv9f.fsf@intel.com>
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

On Tue, 04 Mar 2025, Aditya Garg <gargaditya08@live.com> wrote:
> Hi
>
>> On 4 Mar 2025, at 7:57=E2=80=AFPM, Arnd Bergmann <arnd@kernel.org> wrote:
>>=20
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> A size_t must be printed with the %z modifier instead of %l:
>>=20
>> In file included from include/linux/device.h:15,
>>                 from include/linux/usb.h:19,
>>                 from drivers/gpu/drm/tiny/appletbdrm.c:19:
>> drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_send_request':
>> include/drm/drm_print.h:589:54: error: format '%lu' expects argument of =
type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned i=
nt'} [-Werror=3Dformat=3D]
>> drivers/gpu/drm/tiny/appletbdrm.c:170:17: note: in expansion of macro 'd=
rm_err'
>>  170 |                 drm_err(drm, "Actual size (%d) doesn't match expe=
cted size (%lu)\n",
>>      |                 ^~~~~~~
>> drivers/gpu/drm/tiny/appletbdrm.c: In function 'appletbdrm_read_response=
':
>> include/drm/drm_print.h:589:54: error: format '%lu' expects argument of =
type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned i=
nt'} [-Werror=3Dformat=3D]
>> drivers/gpu/drm/tiny/appletbdrm.c:211:17: note: in expansion of macro 'd=
rm_err'
>>  211 |                 drm_err(drm, "Actual size (%d) doesn't match expe=
cted size (%lu)\n",
>>      |                 ^~~~~~~
>>=20
>> Fixes: 0670c2f56e45 ("drm/tiny: add driver for Apple Touch Bars in x86 M=
acs")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> =E2=80=94
>
> Its the duplicate of:
>
> https://lore.kernel.org/dri-devel/20250304-appletbdrm-fix-size_t-specifie=
r-v1-1-94fe1d2c91f8@kernel.org/

Pushed this one to drm-misc-next.

BR,
Jani.

>
> as well as
>
> https://lore.kernel.org/dri-devel/20250304135456.429407-1-jani.nikula@int=
el.com/
>
>

--=20
Jani Nikula, Intel
