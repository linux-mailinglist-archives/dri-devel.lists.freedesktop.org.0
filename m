Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE701A93FB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC506E852;
	Wed, 15 Apr 2020 07:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F84F89CDF;
 Tue, 14 Apr 2020 14:43:15 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g32so6091525pgb.6;
 Tue, 14 Apr 2020 07:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ISpaCA7mjN5YjkHYISL3HSq+S++mjTHZ6Lu/DzWzgxg=;
 b=f1wl6JySXRwxxtJjjvOaVdSK1D2k/c7LeRlLMcAvouxHm8nuctFxjRB17kG0E3/6G0
 uqQUkiEGVAlHrroZzfkK2ocawUynvmG+8ELztMjnId3Aocg5Zz+49ncAWAV1GK7xOX4A
 iosE90/t3VvqYL2a59b5o+G+0QpoyxopovnWbXjoqV2FbWBiJjXzSR1+AKwuE8JqZSRT
 uPhJ374RYXSM0zkwEOr/Z1QbOGrt+5xt/4s9HjewXxVjpa0fOyaqK+CTzB8v2H4OwHaP
 Y5NECtSoqo49Qb0vLEHsd0+aG27AQBWr5UrNBxbzRtoTgh7i60iBkXQoE8TVSKZ0mYdA
 xt+A==
X-Gm-Message-State: AGi0PuaxNdIDom6vnvsgfO8+prkF49nMP/0nIwD672M9rWE0jVyqKhUE
 sA/JCB1dXicmQCfSZP4vU0I=
X-Google-Smtp-Source: APiQypKYnkcJwA8lBILHDaTEYsu7MMvchjuIIOFNWKTQsueYRWsxR236WZye6IlT0+1XV9h4RXp4Tg==
X-Received: by 2002:a63:ec44:: with SMTP id r4mr21490047pgj.425.1586875395070; 
 Tue, 14 Apr 2020 07:43:15 -0700 (PDT)
Received: from sultan-box.localdomain (static-198-54-129-52.cust.tzulo.com.
 [198.54.129.52])
 by smtp.gmail.com with ESMTPSA id y123sm11056229pfb.13.2020.04.14.07.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 07:43:14 -0700 (PDT)
Date: Tue, 14 Apr 2020 07:43:09 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH v4] drm/i915: Synchronize active and retire callbacks
Message-ID: <20200414144309.GB2082@sultan-box.localdomain>
References: <20200404024156.GA10382@sultan-box.localdomain>
 <20200407064007.7599-1-sultan@kerneltoast.com>
 <20200414061312.GA90768@sultan-box.localdomain>
 <158685263618.16269.9317893477736764675@build.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158685263618.16269.9317893477736764675@build.alporthouse.com>
X-Mailman-Approved-At: Wed, 15 Apr 2020 07:17:53 +0000
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 09:23:56AM +0100, Chris Wilson wrote:
> Quoting Sultan Alsawaf (2020-04-14 07:13:12)
> > Chris,
> > 
> > Could you please take a look at this? This really is quite an important fix.
> 
> It's crazy. See a266bf420060 for a patch that should be applied to v5.4
> -Chris

What? a266bf420060 was part of 5.4.0-rc7, so it's already in 5.4. And if you
read the commit message, you would see that the problem in question affects
Linus' tree.

You can break i915 in 5.6 by just adding a small delay:

diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
index 6ff803f397c4..3a7968effdfd 100644
--- a/drivers/gpu/drm/i915/gt/intel_ring.c
+++ b/drivers/gpu/drm/i915/gt/intel_ring.c
@@ -10,6 +10,7 @@
 #include "intel_engine.h"
 #include "intel_ring.h"
 #include "intel_timeline.h"
+#include <linux/delay.h>
 
 unsigned int intel_ring_update_space(struct intel_ring *ring)
 {
@@ -92,6 +93,9 @@ void intel_ring_unpin(struct intel_ring *ring)
 	else
 		i915_gem_object_unpin_map(vma->obj);
 
+	mdelay(1);
+	ring->vaddr = NULL;
+
 	i915_vma_make_purgeable(vma);
 	i915_vma_unpin(vma);
 }

This is how I reproduced the race in question. I can't even reach the greeter on
my laptop with this, because i915 dies before that.

Sultan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
