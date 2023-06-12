Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 212E772D4BC
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 01:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645C110E0F0;
	Mon, 12 Jun 2023 23:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ED210E2CA;
 Mon, 12 Jun 2023 23:04:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3938161F4B;
 Mon, 12 Jun 2023 23:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45BDC433EF;
 Mon, 12 Jun 2023 23:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686611043;
 bh=VGVC+n+rB8PnKBUWaIKBuLjDMui58ZeepT338bJUEDA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gpxX/k65SlYeODpEyApi4SJsxFJS2jUwsIE2D6l13Y3fCKyersZkyiHrmX6DHCuG4
 MsBBN36qvguFG4zIhfw6UNAwWGwrlI1zOyxxEPGp24MBEaQPQv0gr7C1OjM+Zgp7En
 eBuGMzml76Ve/YoEy8GpSHvrvP+rvl386UyywuHdoaZF9ByoJP7U+QgJ/ICFqhl8vk
 KO6sKIzG1seKoOO4+wvOL3AoBaHp0Y/o1yHKVV/mCxZRIDNZdGDmRU67V7gN2uzQCv
 Yoa8QYBljpLLa/8+ZS91ah44KKWBjnq4zsX0Jsb6sFjDsxNd7JKmrgIqET4DGqyCqU
 pzBmIbc+0GcDw==
Date: Tue, 13 Jun 2023 01:03:59 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] drm/i915/gmch: avoid unused variable warning
Message-ID: <20230612230359.swzobgrc5asfnolw@intel.intel>
References: <20230612124408.521325-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612124408.521325-1-arnd@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Mon, Jun 12, 2023 at 02:43:59PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_PNP is disabled, the mchbar_addr variable is only written but
> not read:
> 
> drivers/gpu/drm/i915/soc/intel_gmch.c: In function 'intel_alloc_mchbar_resource':
> drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: error: variable 'mchbar_addr' set but not used [-Werror=unused-but-set-variable]
>    41 |         u64 mchbar_addr;
>       |             ^~~~~~~~~~~
> 
> No idea why this showed up now, but it's easy to fix by changing the #ifdef to
> an IS_ENABLED() check that the compiler can see through.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

applied to drm-intel-next.

Thank you,
Andi
