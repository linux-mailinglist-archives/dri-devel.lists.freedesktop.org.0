Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6EA790088
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 18:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12C910E7D6;
	Fri,  1 Sep 2023 16:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD7D10E7D6
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 16:10:44 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id EFDC06607295;
 Fri,  1 Sep 2023 17:10:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693584643;
 bh=xm24ESqm1RO6+fKIYOARVlz8ilc4rRJ3mTR98imDo7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e15dix3kPQ0eWg2wGInwWlLH9POkt9jhOyBuBBnqQxm265aHG8yXh3b/A34xFz5H0
 5485mDqgWFd4ldzDr5p42+2KbIpHaKC0ve79lvHqIvc+AvX2XVInF1lHuHt38sfm+l
 4RScSb/RREdD1wCGv08y7yhFhkYRfRQzERudcpb5wyyfLxuCzj3nuu+UiZyAjy5mF/
 0BU7kJbnA/YkzOfCrD3defEkMxx1mBvFNAXNtTiXcjx8H2YnWDHeQFWzaRpPviz1AR
 oLT237VVMnh4lkn8awVEiHm9b4J9QJGY0fsJkHsTA2KhFlDAX303odCWtDrnp9O5dv
 1t1Kxwesrelxw==
Date: Fri, 1 Sep 2023 18:10:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 02/15] drm/panthor: Add uAPI
Message-ID: <20230901181039.417c9753@collabora.com>
In-Reply-To: <20230809165330.2451699-3-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-3-boris.brezillon@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  9 Aug 2023 18:53:15 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> +/**
> + * DOC: MMIO regions exposed to userspace.
> + *
> + * .. c:macro:: DRM_PANTHOR_USER_MMIO_OFFSET
> + *
> + * File offset for all MMIO regions being exposed to userspace. Don't use
> + * this value directly, use DRM_PANTHOR_USER_<name>_OFFSET values instead.
> + *
> + * .. c:macro:: DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET
> + *
> + * File offset for the LATEST_FLUSH_ID register. The Userspace driver controls
> + * GPU cache flushling through CS instructions, but the flush reduction
> + * mechanism requires a flush_id. This flush_id could be queried with an
> + * ioctl, but Arm provides a well-isolated register page containing only this
> + * read-only register, so let's expose this page through a static mmap offset
> + * and allow direct mapping of this MMIO region so we can avoid the
> + * user <-> kernel round-trip.
> + */
> +#define DRM_PANTHOR_USER_MMIO_OFFSET		(0x1ull << 56)

I'm playing with a 32-bit kernel/userspace, and this is problematic,
because vm_pgoff is limited to 32-bit there, meaning we can only map up
to (1ull << (PAGE_SHIFT + 32)) - 1. Should we add a DEV_QUERY to let
userspace set the mmio range?

> +#define DRM_PANTHOR_USER_FLUSH_ID_MMIO_OFFSET	(DRM_PANTHOR_USER_MMIO_OFFSET | 0)
