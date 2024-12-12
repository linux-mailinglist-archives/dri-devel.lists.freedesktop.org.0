Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E67739F000B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 00:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D35910E14F;
	Thu, 12 Dec 2024 23:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gSwEDwUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7549E10E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 23:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734045863; x=1765581863;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8RkAiN7aafpa/YU5vNB2TjsIPY9KF58x80E0z5e7j6Y=;
 b=gSwEDwUgzcbfmWLnaXMaWqI9gGik2tnYxYOP/mqs2t6xGBFMLTUAVMV0
 kB+I1a3i2xIFBAzMnjaUA+QBuNEe5yRtmBSgEDMV1oc5gtyUIbxQStBYk
 /dQDlEBG0uV6GYnttGUoZXOm/e+UnkKAgqiRFT5ZrQ4bcfFRS/+tcs1xd
 /R5GNiFAFBbvyfRxu1Sx6FTcoggxvOJK5CrxCxkPHwHQyASv4FBrKvAl3
 Q6zhY0HA9OpAKkH5w6vbx+y9aH4Dpk4gazi0tc1MZsHa4N/yYZmARKGy0
 SUvdNVxeGDxdMreW/PTLhKRUUaPfWBS313bRvw95Cg+7MnfY0+Cm7DU9I w==;
X-CSE-ConnectionGUID: jtQNpl3tQ7iQth3laHIcLQ==
X-CSE-MsgGUID: KG0E/ErcS9OhWd19cbKIrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="52013614"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="52013614"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:24:23 -0800
X-CSE-ConnectionGUID: g3JkOje5RZSvpXvSxtNrQA==
X-CSE-MsgGUID: 1J/Q+r1AT4qnxv1vEFkYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96443567"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 15:24:20 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>, Thomas
 Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas
 <javierm@redhat.com>, Simona Vetter <simona@ffwll.ch>, Dave Airlie
 <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/3] fbdev: Fix recursive dependencies wrt
 BACKLIGHT_CLASS_DEVICE
In-Reply-To: <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241212100636.45875-1-tzimmermann@suse.de>
 <20241212100636.45875-2-tzimmermann@suse.de>
 <09edb59a-527a-4ddb-bfaf-ea74fb5a3023@gmx.de>
 <88ce6863-4458-47cb-9b28-274c91bd8764@app.fastmail.com>
Date: Fri, 13 Dec 2024 01:24:14 +0200
Message-ID: <87frmstrhd.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 12 Dec 2024, "Arnd Bergmann" <arnd@arndb.de> wrote:
> On Thu, Dec 12, 2024, at 19:44, Helge Deller wrote:
>> On 12/12/24 11:04, Thomas Zimmermann wrote:
>>> Do not select BACKLIGHT_CLASS_DEVICE from FB_BACKLIGHT. The latter
>>> only controls backlight support within fbdev core code and data
>>> structures.
>>>
>>> Make fbdev drivers depend on BACKLIGHT_CLASS_DEVICE and let users
>>> select it explicitly. Fixes warnings about recursive dependencies,
>>> such as [...]
>>
>> I think in the fbdev drivers themselves you should do:
>> 	select BACKLIGHT_CLASS_DEVICE
>> instead of "depending" on it.
>> This is the way as it's done in the DRM tiny and the i915/gma500 DRM drivers.
>>
>> So, something like:
>>
>> --- a/drivers/staging/fbtft/Kconfig
>>         tristate "Support for small TFT LCD display modules"
>>         depends on FB && SPI
>>         depends on FB_DEVICE
>>    +    select BACKLIGHT_DEVICE_CLASS
>>         depends on GPIOLIB || COMPILE_TEST
>>         select FB_BACKLIGHT
>>
>> config FB_BACKLIGHT
>>            tristate
>>            depends on FB
>>    -	  select BACKLIGHT_CLASS_DEVICE
>>    +       depends on BACKLIGHT_CLASS_DEVICE
>>
>>
>> Would that fix the dependency warning?
>
> The above is generally a mistake and the root cause of the
> dependency loops. With very few exceptions, the solution in
> these cases is to find the inconsistent 'select' and change
> it into 'depends on'.

Agreed.

> I actually have a few more patches like this that I've
> been carrying for years now, e.g. one that changes all the
> 'select I2C' into appropriate dependencies.

I've done that for BACKLIGHT_CLASS_DEVICE and some related configs years
ago, but there was pushback, and I gave up. Nowadays when I see this I
just chuckle briefly and move on.

Occasionally I quote Documentation/kbuild/kconfig-language.rst:

	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

If kconfig warned about selecting symbols with dependencies it would be
painful for a while but eventually I think life would be easier.

BR,
Jani.


-- 
Jani Nikula, Intel
