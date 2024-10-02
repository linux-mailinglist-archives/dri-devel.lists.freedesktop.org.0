Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 949CC98E11B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 18:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1BC10E63F;
	Wed,  2 Oct 2024 16:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Nk1uVEjx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BC010E639;
 Wed,  2 Oct 2024 16:43:36 +0000 (UTC)
Received: from [192.168.1.37] ([90.11.132.44]) by smtp.orange.fr with ESMTPA
 id w2RossPGwzmbmw2RosTOhn; Wed, 02 Oct 2024 18:43:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1727887415;
 bh=WiQ9rEm/MZNLKkSTulKn+at0cQ54EY5swCihzKM4b7w=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Nk1uVEjxNTz97srXuWkEodHCeQDwJawSXbdJvq5E/vPJTLAYPRquOSfnBP7DgGfKu
 Q+bNgdy0tcgJ4C691IEakEnP/Y0h2zGS967JAbTHRgaVjqH5YkvughNSgJwDs6Prpg
 xe+h5LhyU2SFgv/thSpC3VTQhGlbKPkrq2wvM/GhGlIS4f7qJwhgb1aRBPDDeQGCwu
 jBFZsUmP8sbCggKvqXDRa4POJt5uEZqUzzrjwtPJfoWtqrNUxRu7zf7sOKFM8A5/vc
 lWokM0gjw65+gRqxNHZNh6uq3ybg2nGvgzwos/Xg9RdZqhr3TCt1mU/XEg15vC8mZe
 JDVFKeqRkXQmg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 02 Oct 2024 18:43:35 +0200
X-ME-IP: 90.11.132.44
Message-ID: <86f6269f-e367-4192-ab71-5d82b1c88309@wanadoo.fr>
Date: Wed, 2 Oct 2024 18:43:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/backlight: Remove a useless kstrdup_const()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <3b3d3af8739e3016f3f80df0aa85b3c06230a385.1727533674.git.christophe.jaillet@wanadoo.fr>
 <875xqdy42v.fsf@intel.com> <3c793f42-6cd1-40e7-a3f2-556b6e5b4094@wanadoo.fr>
 <87cykiu3hk.fsf@intel.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87cykiu3hk.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 02/10/2024 à 13:51, Jani Nikula a écrit :
> On Tue, 01 Oct 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>> Le 30/09/2024 à 09:48, Jani Nikula a écrit :
>>> On Sat, 28 Sep 2024, Christophe JAILLET <christophe.jaillet@wanadoo.fr> wrote:
>>>> "name" is allocated and freed in intel_backlight_device_register().
>>>> The initial allocation just duplicates "intel_backlight".
>>>>
>>>> Later, if a device with this name has already been registered, another
>>>> dynamically generated one is allocated using kasprintf().
>>>>
>>>> So at the end of the function, when "name" is freed, it can point either to
>>>> the initial static literal "intel_backlight" or to the kasprintf()'ed one.
>>>>
>>>> So kfree_const() is used.
>>>>
>>>> However, when built as a module, kstrdup_const() and kfree_const() don't
>>>> work as one would expect and are just plain kstrdup() and kfree().
>>>>
>>>>
>>>> Slightly change the logic and introduce a new variable to hold the
>>>> address returned by kasprintf() should it be used.
>>>>
>>>> This saves a memory allocation/free and avoids these _const functions,
>>>> which names can be confusing when used with code built as module.
>>>
>>> Okay, I'd rather revert your earlier commit 379b63e7e682
>>> ("drm/i915/display: Save a few bytes of memory in
>>> intel_backlight_device_register()") than add this.
>>
>> Hi,
>>
>> that works for me. Thanks and sorry for the noise.
> 
> Will you send the revert?
> 
> BR,
> Jani.
> 
> 

Will do.

CJ
