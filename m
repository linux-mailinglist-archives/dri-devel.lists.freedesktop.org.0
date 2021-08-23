Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 818673F5299
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 23:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2666289B9E;
	Mon, 23 Aug 2021 21:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C15E89B9E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 21:11:19 +0000 (UTC)
Received: from maud (unknown [IPv6:2600:8800:8c06:1000::c8f3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: alyssa)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FC031F416C0;
 Mon, 23 Aug 2021 22:11:14 +0100 (BST)
Date: Mon, 23 Aug 2021 17:11:09 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH 2/3] drm/panfrost: Use u64 for size in lock_region
Message-ID: <YSQO7exgqnk0ZLJT@maud>
References: <20210820213117.13050-1-alyssa.rosenzweig@collabora.com>
 <20210820213117.13050-3-alyssa.rosenzweig@collabora.com>
 <71392001-a5a9-fee2-79a5-91df55ba3081@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71392001-a5a9-fee2-79a5-91df55ba3081@arm.com>
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

> > Mali virtual addresses are 48-bit. Use a u64 instead of size_t to ensure
> > we can express the "lock everything" condition as ~0ULL without relying
> > on platform-specific behaviour.
> 
> 'platform-specific behaviour' makes it sound like this is something to
> do with a particular board. This is 32bit/64bit - it's going to be
> broken on 32bit: large lock regions are not going to work.

Oh, my. I used the term as a weasel word since the spec is loose on how
big a size_t actually is. But if this is causing actual breakage on
armv7 we're in trouble. I'll add a Cc stable tag on v2, unless the Fixes
implies that?

Thanks for pointing this out.
