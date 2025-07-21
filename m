Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4033FB0C439
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 14:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9067D10E38D;
	Mon, 21 Jul 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="UUFJ51Px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836BC10E534
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 12:41:04 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bm0PT1F3xz9sx5;
 Mon, 21 Jul 2025 14:41:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1753101661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMJLOJ0R5F3m1DSwSS+iZ1f9XSAGcsFTMlW3q9ZwYaQ=;
 b=UUFJ51PxBcd10uEUQjGirIUvWUMrN+JUu8kLCUy7I/WDHECl/WgQEshxk/xbb3UaxRxqKj
 RNT4eCKWmApn5rZ7xJg9WGwzOmlm0ISRG9ezr0i7j3eJ4/JZVu62jwooZ39qI78k42j4pE
 W+6set+RpdWAIUSbbenkJnt8H3LfkZ85/m8GziH6W4hQ8ikvxOutcV2M4fmujAS0tvetoc
 M41nmdbV13GTGljbsoNM1MQHjL4MSeBicZA2Nk6LeaFcnFuM+7/2gdmVirF0H9BMFL+JTW
 6I9d47GMByTCdkbpVupYmcdjK8uQKE7uRdCqNx6XMVgZ8h1SdEbLbVRlNX1T0w==
Message-ID: <b83050e6-a872-4b94-a85c-b888103e1452@mailbox.org>
Date: Mon, 21 Jul 2025 14:40:57 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] drm/i915/display: Allow async flips on planes with no
 framebuffer changes
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Xaver Hugl <xaver.hugl@kde.org>
Cc: Naveen Kumar <naveen1.kumar@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian.wick@redhat.com, jadahl@gmail.com
References: <20250707154121.74969-1-naveen1.kumar@intel.com>
 <aHAg2J-uFLLWINqp@intel.com>
 <CAFZQkGwKs04zJ0y2VuwVJkiKH6Z00dZoYGroWS6R=Qux_n0iJQ@mail.gmail.com>
 <aHu_SsrCUJTzPhmd@intel.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <aHu_SsrCUJTzPhmd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: n58c55s14gsjihs74oegmidqcq94oemd
X-MBO-RS-ID: df8948e7ee1dcd72e2b
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

On 19.07.25 17:52, Ville Syrjälä wrote:
> On Sat, Jul 19, 2025 at 02:16:22AM +0200, Xaver Hugl wrote:
>> Am Do., 10. Juli 2025 um 22:21 Uhr schrieb Ville Syrjälä
>> <ville.syrjala@linux.intel.com>:
>>>
>>> On Mon, Jul 07, 2025 at 03:41:20PM +0000, Naveen Kumar wrote:
>>>> Allow asynchronous page flips on planes that either lack a framebuffer or
>>>> retain the same framebuffer, as long as no plane properties are modified.
>>>>
>>>> This avoids unnecessary failures in async flip paths when the update is
>>>> effectively a no-op, improving compatibility with some compositors.
>>>
>>> IMO what we want to do is make the drm core filter out all the garbage
>>> from the commit. That way the driver would only see the planes that are
>>> supposed to actually participate in the async flip.
>>
>> That sounds like a good goal, but I think it'll need some extra care
>> to avoid regressions. For example, "no-op" pageflips must still
>> trigger pageflip events, and affect the refresh rate with adaptive
>> sync.
> 
> Not for async commit via the atomic ioctl. That's where I'd want
> the filtering.
> 
> For sync commit nothing can really be filtered by the core code
> because side effects must be observed, and only the driver knows
> what all the side effects are.

I agree with Xaver.


In general, the DRM_MODE_PAGE_FLIP_ASYNC flag should affect only whether or not a plane assignment can take effect outside of vertical blank. That's true even with VRR. Current UAPI is that any commit with any state for a CRTC (or a plane bound to it) must trigger a refresh cycle on it ASAP with VRR.


With DRM_MODE_PAGE_FLIP_EVENT, an event must be sent even for "no-op" changes, or user space may get stuck waiting for the event.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
