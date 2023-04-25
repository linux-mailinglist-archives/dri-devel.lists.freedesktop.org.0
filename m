Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCF6EE830
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 21:25:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D510410E186;
	Tue, 25 Apr 2023 19:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC32410E137;
 Tue, 25 Apr 2023 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682450749; x=1713986749;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=HOAC/vLL0DpnjM4KLA7wvfcyNWTRHuEgYKkZK8Nx2kI=;
 b=kNvccJVVGHKHevQWppfa4YergCEPahdaiP0vzIVo5vmlQbTwaQQtGjm3
 YljgW0RO60ymByPZaUJ1m77aL10DZ03LePG1dLINlnR1qPN77Ve/CDJwh
 kfGJQWe0ZcaEcZh5FT6Ol0ikwl79YQC2Whn5nCeAb1EvY7/09cPvO1xRB
 /3HNURj6qTlRfaM7POxWSjjCVjNcHO3AHzksJWEXDANzbCzSTO9MnPykS
 j9W+t6q7FH+2u+Az2KwuhxELYhd1knKx/Dpf9hoj77PsXkwX9PuSlhOWx
 Oyet1K5bDrP7fJqpNgtKdyPisHB7RD34YIM9PVLcdyGIULT3Wb0dUz4h7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="331099931"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="331099931"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:25:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="726240109"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; d="scan'208";a="726240109"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.59.107])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 12:25:26 -0700
Date: Tue, 25 Apr 2023 21:25:24 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v8 6/7] drm/i915: Replace custom intel runtime_pm tracker
 with ref_tracker library
Message-ID: <ZEgpJN6GzSK/w4TV@ashyti-mobl2.lan>
References: <20230224-track_gt-v8-0-4b6517e61be6@intel.com>
 <20230224-track_gt-v8-6-4b6517e61be6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-track_gt-v8-6-4b6517e61be6@intel.com>
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
 Andi Shyti <andi.shyti@linux.intel.com>, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Eric Dumazet <edumazet@google.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Tue, Apr 25, 2023 at 12:05:43AM +0200, Andrzej Hajda wrote:
> Beside reusing existing code, the main advantage of ref_tracker is
> tracking per instance of wakeref. It allows also to catch double
> put.
> On the other side we lose information about the first acquire and
> the last release, but the advantages outweigh it.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
