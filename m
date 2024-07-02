Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5339B924B07
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 00:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A8C10E698;
	Tue,  2 Jul 2024 22:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="udoeiUia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2662F10E698;
 Tue,  2 Jul 2024 22:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+oxTSSdZwv+UuaWkkLuhqR4w8qk02qD4cr483Kkf16w=; b=udoeiUias1syre/FNjNSV2LlOi
 heheL/iANLz0Za42q9f2KhqGNygo/K8s08JOpW7ExTbEGg1Tx87+RytELdg0s03fVrlq48InWKabC
 ofU02ALaGSbeKJ/ZuWBTX6xnGwRU1BMJi0fIbgWkTMYxMptN5MqfXos9KvjKeENIWligzvIC/4rrh
 Jghrr4RGeIDKvycKMO9wUaCS4dVV/pg2pnvarMog9hg202kJvZEXceRc8RXJRpQiRcZTFQNLfHmM1
 qtxqou8o+j1HG0RiBJFsCauDsY28Tpdl5yY9r1ABkkTarBxDiDTgBvhHQZ7aBMuxS21v+UHLOwjM5
 HNKHgruQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2
 (Red Hat Linux)) id 1sOlZS-000000086Vo-48mn;
 Tue, 02 Jul 2024 22:01:54 +0000
Date: Tue, 2 Jul 2024 15:01:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com
Subject: Re: [PATCH v9 00/53] fix CONFIG_DRM_USE_DYNAMIC_DEBUG=y
Message-ID: <ZoR40nWmpEV2Ly_6@bombadil.infradead.org>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

On Tue, Jul 02, 2024 at 03:56:50PM -0600, Jim Cromie wrote:
> This fixes dynamic-debug support for DRM.debug, added via classmaps.
> commit bb2ff6c27bc9 (drm: Disable dynamic debug as broken)
> 
> CONFIG_DRM_USE_DYNAMIC_DEBUG=y was marked broken because drm.debug=val
> was applied when drm.ko was modprobed; too early for the yet-to-load
> drivers, which thus missed the enablement.  My testing with
> /etc/modprobe.d/ entries and modprobes with dyndbg=$querycmd options
> obscured this omission.
> 
> The fix is to replace invocations of DECLARE_DYNDBG_CLASSMAP with
> DYNDBG_CLASSMAP_DEFINE for core, and DYNDBG_CLASSMAP_USE for drivers.
> The distinction allows dyndbg to also handle the users properly.
> 
> DRM is the only current classmaps user, and is not really using it,
> so if you think DRM could benefit from zero-off-cost debugs based on
> static-keys, please test.
> 
> HISTORY
> 
> 9/4/22  - ee879be38bc8..ace7c4bbb240 commited - classmaps-v1 dyndbg parts
> 9/11/22 - 0406faf25fb1..16deeb8e18ca commited - classmaps-v1 drm parts
> 
> https://lore.kernel.org/lkml/Y3XUrOGAV4I7bB3M@kroah.com/
> greg k-h says:
> This should go through the drm tree now.  The rest probably should also
> go that way and not through my tree as well.

Can't this just be defined as a coccinelle smpl patch? Must easier
to read than 53 patches?

  Luis

