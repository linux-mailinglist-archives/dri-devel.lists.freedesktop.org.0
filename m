Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E163B3D4B8
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 20:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063C410E049;
	Sun, 31 Aug 2025 18:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="AyvTp4G8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A9110E049
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 18:57:22 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFLpk2hh9z9t8J;
 Sun, 31 Aug 2025 20:57:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1756666638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeaRV7P6N6ZM1GcWf6vERJOPSk2++35V6rxs2DnRh5A=;
 b=AyvTp4G89OnGttTR3iXyrULy12IwhQT/Ic6gQMeQbFoYaopOfJyXhZtBQQz3IT/LsYH8cZ
 8F1QvckPLvpDiWHhrclbAO/rmdMqfcScbC9p38mRYvKyViLS6rMKMrm0LKDnJhLZLtUpls
 39ZtBfzxEz40oOYzCDeEyVW4tZIm9LlJf2Kc09sIjH7cIbe/KzOznr6oCQvY7B+rtlaiv2
 x/hWdDDk0bzmgDenKv14zejUDVuMeXezBnGKpShdmnpUzVCI7YfEuOK/RhnKb6TQ+B1ID1
 QNk0LRCLmFvsO792rzGhp8zi5Y1J6+nMkD434D6zfdvtV8vI5CDI/ADbJEutpg==
Message-ID: <8ec996f2-8c2e-4e81-95da-d466120b9723@mailbox.org>
Date: Sun, 31 Aug 2025 20:57:14 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] drm/rcar-du: dsi: Implement DSI command support
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-renesas-soc@vger.kernel.org
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
 <20250608142636.54033-5-marek.vasut+renesas@mailbox.org>
 <4d0f2b7c-d44c-4dc2-9996-3cbbf3bf68b0@ideasonboard.com>
 <ac748c7e-d367-4569-9d9a-ac424c813f14@mailbox.org>
 <3f0fc2a6-6e12-45ff-a153-71661ddd236d@ideasonboard.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <3f0fc2a6-6e12-45ff-a153-71661ddd236d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: cxji3839fhxspsfbuwajhgdhtwdzct3a
X-MBO-RS-ID: ccbe6eb40132fc3cf14
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

On 8/18/25 9:20 AM, Tomi Valkeinen wrote:

Hello Tomi,

>>> If yes, then it might take
>>> much longer until the command can be transferred.
>>
>> Do you know the upper limit , is that one or two frame times ?
> 
> If using DSI video mode and the stream is on, the DSI TX has to
> interleave the commands either to the line blanking or frame blanking.
> Usually this is configurable in the DSI TX (if the chip can do
> interleaving).
> 
> A read command will be the most difficult to interleave, as it takes
> more time with the BTA and reply.
> 
> I think the worst case is one frame delay (next vblank).

I set the timeouts to 50ms, which at 60 Hz refresh should be a bit over 
three frame delays, which should be safe.

>>> If not maybe the
>>> function should return an error if the video stream is enabled.
>>
>> I haven't seen any drivers special casing that, I'd prefer to increase
>> the timeouts. For V3, I'll update the timeout to 50ms , which is about 3
>> frame times.
> 
> If the docs have no word about interleaving the commands and there are
> no related registers, I would guess that it's not supported. If this
> can't be tested, I suggest just returning an error if a command is sent
> while the video is on.
> 
> You should be able to test this, though. E.g. just add a debugfs/sysfs
> file to the panel or dsi tx driver, which does a DSI command, possibly a
> read. See what happens when the video is enabled.

I patched the ili9881c panel and triggered DCS read of its ID via sysfs 
attribute , I could always get valid ID, so I think we are safe here.

[...]

>>>> +    /* Wait a bit between commands */
>>>> +    usleep_range(1000, 2000);
>>>
>>> Why wait and wait a bit between what?
>> The consecutive command transmission was unreliable unless there was a
>> slight delay between the consecutive commands. Hence this delay.
> 
> This sounds like there's a bug in the driver, or the TX or RX hardware.
> Please document the sleep clearly in the comment.
Done.
