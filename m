Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF698D282
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 13:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC0810E6FE;
	Wed,  2 Oct 2024 11:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="De8iypiH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027B110E6FB;
 Wed,  2 Oct 2024 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727869918; x=1759405918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=gBJSjm8Db5ChqVbRHc3AT32deIpUrD8cF2ddm3npVBo=;
 b=De8iypiHVa6sjROcjOiCXdSJKVWBzAttl1S3v0SqmNR0Ga0C2eKuAltz
 j/MU7Yh20zgdg9x7IA/3ayrIG7AoEoVk2P49eFVGl4N8321FiA5RrSKre
 sP2f//vufWEiikvdeSlHDptZDixqJDalVmSZi9ScBEaqKv8fZ/24NpiTv
 KRTif1auJo8Dbr8kvMw4wMuLkeqDKtA1thJdi8c9TD70MD8CHsKmMkohy
 9d0LfbgR/L8QodYa15bpiN5vjBVDxYyGjNF2AV13Of23An875oztm79Js
 73Y0GD+cPj22Eu3Quo4iNJGhxBt1zxG+csHB8zqAlarqcvV7+gKlvTfgs w==;
X-CSE-ConnectionGUID: 96ESm/ZzRmStI+nM2gYXpg==
X-CSE-MsgGUID: hytD/tPoQH6vjzxFxvqTCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27183781"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27183781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:51:57 -0700
X-CSE-ConnectionGUID: /nWU2SiwQfmHzvSdPW9YxQ==
X-CSE-MsgGUID: TkUQETggSUKh9cmze5nP7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78507107"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 04:51:54 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/backlight: Remove a useless kstrdup_const()
In-Reply-To: <3c793f42-6cd1-40e7-a3f2-556b6e5b4094@wanadoo.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
 <875xqdy42v.fsf@intel.com>
 <3c793f42-6cd1-40e7-a3f2-556b6e5b4094@wanadoo.fr>
Date: Wed, 02 Oct 2024 14:51:51 +0300
Message-ID: <87cykiu3hk.fsf@intel.com>
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

On Tue, 01 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wro=
te:
> Le 30/09/2024 =C3=A0 09:48, Jani Nikula a =C3=A9crit=C2=A0:
>> On Sat, 28 Sep 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> =
wrote:
>>> "name" is allocated and freed in intel_backlight_device_register().
>>> The initial allocation just duplicates "intel_backlight".
>>>
>>> Later, if a device with this name has already been registered, another
>>> dynamically generated one is allocated using kasprintf().
>>>
>>> So at the end of the function, when "name" is freed, it can point eithe=
r to
>>> the initial static literal "intel_backlight" or to the kasprintf()'ed o=
ne.
>>>
>>> So kfree_const() is used.
>>>
>>> However, when built as a module, kstrdup_const() and kfree_const() don't
>>> work as one would expect and are just plain kstrdup() and kfree().
>>>
>>>
>>> Slightly change the logic and introduce a new variable to hold the
>>> address returned by kasprintf() should it be used.
>>>
>>> This saves a memory allocation/free and avoids these _const functions,
>>> which names can be confusing when used with code built as module.
>>=20
>> Okay, I'd rather revert your earlier commit 379b63e7e682
>> ("drm/i915/display: Save a few bytes of memory in
>> intel_backlight_device_register()") than add this.
>
> Hi,
>
> that works for me. Thanks and sorry for the noise.

Will you send the revert?

BR,
Jani.


--=20
Jani Nikula, Intel
