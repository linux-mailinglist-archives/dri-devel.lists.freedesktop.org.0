Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104B5A5E22
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00AC010EABE;
	Tue, 30 Aug 2022 08:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org
 [IPv6:2001:67c:2050:0:465::102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A056D10EABE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:31:45 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4MH0s80D27z9sTX;
 Tue, 30 Aug 2022 10:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1661848300;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cciwq9bubl6F4EMF5CWg1/Kyd+zEZgJ2VABZZ0kyyvM=;
 b=vhdYkel35P44it+fzTBWVWNLt7Mc90gjDg81ZZ//HBSmEtu73A/4lv9qz9RUr3GvpurK7f
 GykUVtm55zTWibjm1y50dMpFf+PGGAhyA2SJI/5fM25Tr1w5R5SmJdrGfyb3fca4D8Fb/l
 0RbReEJqMasl7Lb1ULFTio7RDy1h48WfSLNa1LosxF+iToZyroB0zZVsM7iIoo6lRARaSW
 4I/Zn+GTzD5xzkKRXpsdwnTXQVx2NS0bOVrwTlO9VAV062zC8N2g7zEQdgqyhNIwHPFRwM
 +Fpv+VrHBgwrtvWmrPKVmdbsBppoXUsd5mbVdzkN0iXzFzTSxLabJ/fOYfB9Jg==
Message-ID: <318188b5-3078-14f3-83a3-8eeda995f425@mailbox.org>
Date: Tue, 30 Aug 2022 10:31:38 +0200
MIME-Version: 1.0
Subject: Re: drm: document uAPI page-flip flags
Content-Language: en-CA
To: Pekka Paalanen <ppaalanen@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20220824174459.441976-1-contact@emersion.fr>
 <20220826115355.668e13ca@eldfell>
 <ASSNOUe9wtsXskZjVlf1X4pl53T7pVE0MfEzkQ_h4cX0tjnF7e3cxpwGpRNPudmIHoRuW4kz_v1AeTpXgouLpTYcI8q-lPTzc1YMLR8JiJM=@emersion.fr>
 <20220830111626.77307042@eldfell>
From: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <20220830111626.77307042@eldfell>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yggiy4mroc757puuu33tcgc4kd1p6yye
X-MBO-RS-ID: 936581fdbb750d1e32c
X-Rspamd-Queue-Id: 4MH0s80D27z9sTX
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-08-30 10:16, Pekka Paalanen wrote:
> On Mon, 29 Aug 2022 15:37:52 +0000
> Simon Ser <contact@emersion.fr> wrote:
>> On Friday, August 26th, 2022 at 10:53, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>>>> +/**
>>>> + * DRM_MODE_PAGE_FLIP_ASYNC
>>>> + *
>>>> + * Request that the page-flip is performed as soon as possible, ie. with no
>>>> + * delay due to waiting for vblank. This may cause tearing to be visible on
>>>> + * the screen.  
>>>
>>> Btw. does the kernel fail the flip if the driver does not support async?
>>> Or does it silently fall back to sync flip?
>>> Asking for both legacy and atomic APIs.  
>>
>> Atomic doesn't support this yet, so it's pretty much TBD (see Ville's reply [1]).
> 
> So atomic commit ioctl will fail with EINVAL because userspace is
> giving it an unrecognized flag?
> 
> [1] is interesting. Apparently the atomic async flag will only be a
> hint, "make it tear if possible". That seems fine to me.

To me it would seem better for the driver to return an error if the async flag is passed in, but the driver can't actually do an async update.

Otherwise it's tricky for a Wayland compositor to decide if it should use an async commit (which needs to be done ASAP to serve the intended purpose) or not (in which case the compositor may want to delay the commit as long as possible for minimal latency).


>> For legacy, it seems like drivers do what they want. AFAIU, i915 will reject
>> (see intel_async_flip_check_uapi etc), and amdgpu will silently fall back to
>> vsync (see the `acrtc_state->update_type == UPDATE_TYPE_FAST` check in
>> amdgpu_dm_commit_planes).
>>
>> Maybe one of the drivers is wrong here and should be fixed?
>>
>> [1]: https://lore.kernel.org/dri-devel/YwiB%2FxQf6Z6ScU+Z@intel.com

-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

