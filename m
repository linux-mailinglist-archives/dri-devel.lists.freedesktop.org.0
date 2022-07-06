Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F3756955D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 00:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4910E443;
	Wed,  6 Jul 2022 22:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984D410EA69;
 Wed,  6 Jul 2022 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657146854; x=1688682854;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y009AxbqUawkHpqJbAAqpzeVgeaxIAMYGS73GgQJgqg=;
 b=FAS0ULx99j5UwtSYOg1+JfMFyTg0lHnwg8jMP3JSKyhudxQfP5mklele
 tp8cBXwD8VvQMl2T8RgC1HRJM7N7p1UPT5GCCb+2aLHUzDhNai/UdL1MM
 yO/zBhs39SFXdkXrAadOuWG1s7GODgNmZ1G4Y9k5zWGdagx3yVung/KHl
 W+rb1PWmEg0z6gX+HUoWpVyHEYw/cuFijRgaAEhLbNd6jGqVzgh6/lKUu
 A0FbjvVfZSSeLBYE0FTEEGY9MEAQ0kZFmmS8lKI7SCBfoPLQL3KuETcWe
 GNcdhaNsR3A6CjFtywEwwNnrdL01COd/XuppG1/dpBP6sYWxU40sIC2Vi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10400"; a="347867222"
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="347867222"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 15:34:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,251,1650956400"; d="scan'208";a="650868414"
Received: from mropara-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 15:34:11 -0700
Date: Thu, 7 Jul 2022 00:34:08 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH] drm/i915/gem: Really move i915_gem_context.link under
 ref protection
Message-ID: <YsYN4OMKanJMPcjv@alfio.lan>
References: <20220706152924.73926-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706152924.73926-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Stable <stable@vger.kernel.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 DRI Devel <dri-devel@lists.freedesktop.org>, Andi Shyti <andi@etezian.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Mark Janes <mark.janes@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

[...]

> @@ -1265,10 +1264,15 @@ static void i915_gem_context_release_work(struct work_struct *work)
>  	struct i915_gem_context *ctx = container_of(work, typeof(*ctx),
>  						    release_work);
>  	struct i915_address_space *vm;
> +	unsigned long flags;
>  
>  	trace_i915_context_free(ctx);
>  	GEM_BUG_ON(!i915_gem_context_is_closed(ctx));
>  
> +	spin_lock_irqsave(&ctx->i915->gem.contexts.lock, flags);
> +	list_del(&ctx->link);
> +	spin_unlock_irqrestore(&ctx->i915->gem.contexts.lock, flags);
> +

yah! this can't work from a worker.

Andi
