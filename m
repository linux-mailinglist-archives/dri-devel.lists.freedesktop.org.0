Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD15B4D6E
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 12:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFA610E3FC;
	Sun, 11 Sep 2022 10:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18EE10E3FB;
 Sun, 11 Sep 2022 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662892290; x=1694428290;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=55mhbOuv9VSmK0zVkWFv2UkRhlG7d+Yu5JeYFMu/0n0=;
 b=oDoH3Yiboq3HkgFSryEgZISXT6mJPXkvMbNOsbvYy5QCZ9lvlWkm0bUv
 Bn1TXChA5midrg/hGU+rbZZ9edBLgjaZiPkchGgkkj6mfMav7WAQFrSdU
 /mW1Sgi2D9r2WNHYfJejxN4J18RAkY3CHUvkneaP9J8W02Z3MJiSaw4n9
 qt05KxdAMe2g/HPhdA5KFwTLpfcqDeUdxy4L10bB/8OnEYhnphefvNin4
 n5S2kgEwzTHiWLbxbmwoi1ku85k6m/vaLJR+5U0lbWwOpaOChnC8Ta/tZ
 x6bMrIsfDYpJGzcLpwDb9xnl9luhQ2uVXNdbtFj/zYN7vA1Y/5RZwehNe g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="359436390"
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="359436390"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 03:31:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,307,1654585200"; d="scan'208";a="677741240"
Received: from dasegal-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 03:31:25 -0700
Date: Sun, 11 Sep 2022 12:31:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH v10 1/9] overflow: Allow mixed type arguments
Message-ID: <Yx24+WqhMcM8Zyc6@alfio.lan>
References: <20220909105913.752049-1-gwan-gyeong.mun@intel.com>
 <20220909105913.752049-2-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909105913.752049-2-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, mauro.chehab@linux.intel.com,
 andi.shyti@linux.intel.com, keescook@chromium.org, jani.nikula@intel.com,
 ndesaulniers@google.com, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 andrzej.hajda@intel.com, dlatypov@google.com, matthew.auld@intel.com,
 airlied@redhat.com, mchehab@kernel.org, vitor@massaru.org,
 nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kees,

On Fri, Sep 09, 2022 at 07:59:05PM +0900, Gwan-gyeong Mun wrote:
> From: Kees Cook <keescook@chromium.org>
> 
> When the check_[op]_overflow() helpers were introduced, all arguments were
> required to be the same type to make the fallback macros simpler. However,
> now that the fallback macros have been removed[1], it is fine to allow
> mixed types, which makes using the helpers much more useful, as they
> can be used to test for type-based overflows (e.g. adding two large ints
> but storing into a u8), as would be handy in the drm core[2].
> 
> Remove the restriction, and add additional self-tests that exercise some
> of the mixed-type overflow cases, and double-check for accidental macro
> side-effects.

I would split in two different patches the check_[op]_overflow()
helpers with the tests.

Overall they look good though.

> [1] https://git.kernel.org/linus/4eb6bd55cfb22ffc20652732340c4962f3ac9a91
> [2] https://lore.kernel.org/lkml/20220824084514.2261614-2-gwan-gyeong.mun@intel.com
> 
> Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Gwan-gyeong, can you please add your SoB here? And you don't need
to 'Cc:' yourself.

Andi
