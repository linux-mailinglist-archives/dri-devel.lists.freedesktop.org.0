Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A129D8307D7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 15:19:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D6210E11A;
	Wed, 17 Jan 2024 14:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6EF10E11A;
 Wed, 17 Jan 2024 14:18:55 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4TFSfX3cp8z9scX;
 Wed, 17 Jan 2024 15:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1705501124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/04+AUA96JyRGSg7FmQ1Co1hzmApsEtK4+LDUq5qS9I=;
 b=iTM2+qGklqomZrkR34x42hazC6kJ+uog03ScY7x+OSQ+DV8q006tTFpvfLKKULMIBRiWqv
 27EL7iDbCy3fj06IcW2/nA9snnoZ1mVGwxb0sjVItvJfcbcbrPRzmIIMsCtIUdJHx1utqX
 iPGZOTjyAMDlsbbhtmX4sji/Tq5cLiwpnleaR9feX9p53K5sKdyyjMYvrIxhWLdTr/XZMS
 f8kEpLtVb4oZWUy2ygT7u/DRkJRsvxCvHxSRknEkc41Hao6kXYMWU9+9+UEiHAcBWDYEJI
 etDj9lIp3kF4OjJdtUQlYD0Oy4YxpA22IM/DhB6dTh7upk9IVj0HCzWbAKpyHg==
Message-ID: <48824a5d-223a-4ad2-b198-5fcb75a9cfde@mailbox.org>
Date: Wed, 17 Jan 2024 15:18:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Content-Language: de-CH-frami, en-CA
To: Xaver Hugl <xaver.hugl@gmail.com>, Pekka Paalanen <ppaalanen@gmail.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
 <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
 <20240116151414.10b831e6@eldfell>
 <47c6866a-34d6-48b1-a977-d21c48d991dc@igalia.com>
 <CAFZQkGyOQ5Tfu++-cHqgZ9NOJxqxm8cAF5XT18LmisuPAUbXAg@mail.gmail.com>
 <20240117105509.1984837f@eldfell>
 <CAFZQkGzite-CZoJcV80kNPe==OWFZa_cR1x3QRKuLd=HdOFw-A@mail.gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <CAFZQkGzite-CZoJcV80kNPe==OWFZa_cR1x3QRKuLd=HdOFw-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: pgtcyajtxp3yqt1pxr8ffrrr7u18ejhe
X-MBO-RS-ID: f6b5e7383e43717d63d
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
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, alexander.deucher@amd.com,
 Dave Airlie <airlied@gmail.com>, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2024-01-17 13:57, Xaver Hugl wrote:
> Am Mi., 17. Jan. 2024 um 09:55 Uhr schrieb Pekka Paalanen <ppaalanen@gmail.com>:
>> Is it important enough to be special-cased, e.g. to be always allowed
>> with async commits?
> 
> I thought so, and sent a patch to dri-devel to make it happen, but
> there are some
> concerns about untested driver paths.
> https://lists.freedesktop.org/archives/dri-devel/2024-January/437511.html
> 
>> Now that I think of it, if userspace needs to wait for the in-fence
>> itself before kicking KMS async, that would defeat much of the async's
>> point, right? And cases where in-fence is not necessary are so rare
>> they might not even exist?
>>
>> So if driver/hardware cannot do IN_FENCE_FD with async, is there any
>> use of supporting async to begin with?
> 
> KWin never commits a buffer where IN_FENCE_FD would actually delay the
> pageflip; it's really only used to disable implicit sync, as there's some edge
> cases where it can wrongly delay the pageflip. The waiting for buffers to become
> readable on the compositor side isn't really significant in terms of latency.
> 
> If hardware doesn't support IN_FENCE_FD with async commits, checking if the
> fence is already signaled at commit time would thus still make things work, at
> least for KWin.

That's how IN_FENCE_FD (and implicit sync) is handled anyway, in common code: It waits for all fences to signal before calling into the driver to commit the atomic commit.

I can't see why this wouldn't work with async commits, the same as with synchronous ones, with any driver.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

