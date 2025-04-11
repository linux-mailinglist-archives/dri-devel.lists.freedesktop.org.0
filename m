Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89EA85FB0
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C52A10EBC7;
	Fri, 11 Apr 2025 13:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="udNK32B9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com
 [91.218.175.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645B110EBC8
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 13:52:47 +0000 (UTC)
Date: Fri, 11 Apr 2025 09:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1744379555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=htRSxpzcUSk2EG+rvrAdFrRy5DjIVpqWMcBJsLxeIh0=;
 b=udNK32B9Gwe/VXLicY65l/ZmWszO3jJdpUozyF4OrUZDdRIuTR40i4LNakPUamEBhD1Thb
 8pvF+QihdTx1slFuvC32ob/oGYmXpzjkB8FWIgYd/4sndl8RZJkz0faD62GGnIPaDwHT6/
 eYyL8s4m7KnkXWDLnmCHWxg+/z23pz0sFFBIuRc6rU5GM2OoAznNjHxya9UlPloi5TXlrx
 kn4+vtFqqb8TJ0rnGBbSmkIts04sGzBJhOXmlQUK2J5OEogsbNeXPksiyvZViLDUY82fDl
 322gTvhsnjD3eYBZFna9zZil17pbQJAn1boRljKlwr0nmrGqTW/bdr2/cabbTw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?iso-8859-1?Q?Adri=E1n?= Larumbe <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 kernel@collabora.com, Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
Message-ID: <Z_kenr95QUq9rFpt@blossom>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com>
 <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
X-Migadu-Flow: FLOW_OUT
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

> 2. Device Lost
> --------------
> 
> At this point we're left with no other choice than to kill the context.
> And userspace should be able to cope with VK_DEVICE_LOST (hopefully zink
> does), but it will probably not cope well with an entire strom of these
> just to get the first frame out.
> 
> Here comes the horrible trick:
> 
> We'll keep rendering the entire frame by just smashing one single reserve
> page (per context) into the pte every time there's a fault. It will result
> in total garbage, and we probably want to shot the context the moment the
> VS stages have finished, but it allows us to collect an accurate estimate
> of how much memory we'd have needed. We need to pass that to the vulkan
> driver as part of the device lost processing, so that it can keep that as
> the starting point for the userspace dynamic memory requirement
> guesstimate as a lower bound. Together with the (scaled to that
> requirement) gpu driver memory pool and the core mm watermarks, that
> should allow us to not hit a device lost again hopefully.

This doesn't work if vertex stages are allowed to have side effects
(which is required for adult-level APIs and can effectively get hit with
streamout on panfrost). Once you have anything involving side effects,
you can't replay work, there's no way to cope with that. No magic Zink
can do either.
