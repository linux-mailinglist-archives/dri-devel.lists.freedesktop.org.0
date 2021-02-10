Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889E316420
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 11:45:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E976EB34;
	Wed, 10 Feb 2021 10:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740126E20B;
 Wed, 10 Feb 2021 10:45:10 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23831758-1500050 for multiple; Wed, 10 Feb 2021 10:45:04 +0000
MIME-Version: 1.0
In-Reply-To: <20210210075929.5357-1-anandx.ram.moon@intel.com>
References: <20210210075929.5357-1-anandx.ram.moon@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gem: Add a check for object size for
 corner cases
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Anand Moon <anandx.ram.moon@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Date: Wed, 10 Feb 2021 10:45:06 +0000
Message-ID: <161295390650.6673.18431407043692596805@build.alporthouse.com>
User-Agent: alot/0.9
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
Cc: Anand Moon <anandx.ram.moon@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Anand Moon (2021-02-10 07:59:29)
> Add check for object size to return appropriate error -E2BIG or -EINVAL
> to avoid WARM_ON and sucessfull return for some testcase.

No. You miss the point of having those warnings. We need to inspect the
code to remove the last remaining "int pagenum", and then we can remove
the GEM_WARN_ON((sz) >> PAGE_SHIFT > INT_MAX). These are not emitted for
users, only for us to motivate us into finally fixing the code.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
