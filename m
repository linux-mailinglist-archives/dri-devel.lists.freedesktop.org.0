Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5AA96B264
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 09:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A078110E4BC;
	Wed,  4 Sep 2024 07:10:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CCLrwJFq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44CAA10E686
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 07:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1725433799;
 bh=bOYHheQLtTJ02XBnSDwChY3fXk4QX4vAA1TWpbq5nkA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CCLrwJFqIaWNJZ5IfeWbdRHu3o760+JopVy1MEPGUMHgWhcdhORvI0qX1SJz3JnSK
 8UUWiKzNdJyTlfW7f7jdlhZ2FVeqdxfyXun3i4wwBUoR0ZqF0l8aPgQOAYsiEzPS80
 tno2vPl5DNlKxURKhhqczYeV+7xHXIhM0oVvuAAZJ3wEm9Kp2c5bj/1UbKQqAXYm4H
 v4xOUFVUdyo6I/CpPnAJhASNxGeeKIWfv2l9R/OnIiq/cFD/RDqaJ8qtWKXY5wroDf
 hrsEUez0K/1btQhToj0RkEf6EObZY/RUGm8OcyUKREywttEeu23X1GhKQq7+19TyJ9
 v1k+3T1J94C6g==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1592617E0F89;
 Wed,  4 Sep 2024 09:09:59 +0200 (CEST)
Date: Wed, 4 Sep 2024 09:09:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, Faith
 Ekstrand <faith.ekstrand@collabora.com>, Daniel Stone
 <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Steven Price
 <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>, Tatsuyuki Ishi
 <ishitatsuyuki@gmail.com>, Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v6 10/14] drm/panthor: Add the scheduler logical block
Message-ID: <20240904090953.77d5b8d7@collabora.com>
In-Reply-To: <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
 <20240229162230.2634044-11-boris.brezillon@collabora.com>
 <Ztdm9EdoguXKxGMV@phenom.ffwll.local>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 3 Sep 2024 21:43:48 +0200
Simona Vetter <simona.vetter@ffwll.ch> wrote:

> On Thu, Feb 29, 2024 at 05:22:24PM +0100, Boris Brezillon wrote:
> > - Add our job fence as DMA_RESV_USAGE_WRITE to all external objects
> >   (was previously DMA_RESV_USAGE_BOOKKEEP). I don't get why, given
> >   we're supposed to be fully-explicit, but other drivers do that, so
> >   there must be a good reason  
> 
> Just spotted this: They're wrong, or they're userspace is broken and
> doesn't use the dma_buf fence import/export ioctl in all the right places.
> For gl this simplifies things (but setting write fences when you're only
> reading is still bad, and setting fences on buffers you don't even touch
> is worse), for vulkan this is just bad.

For the record, I remember pointing that out in some drm_sched
discussion, and being told that this was done on purpose :-/.

> 
> I think you want a context creation flag for userspace that's not broken,
> which goes back to USAGE_BOOKKEEP for everything.

Honestly, given the only user (the gallium driver) is already designed
to do the explicit <-> implicit dance, and the fact the driver just got
merged in the last release, I'd rather go for a silent USAGE_WRITE ->
USAGE_BOOKKEEP if things keep working with that.
