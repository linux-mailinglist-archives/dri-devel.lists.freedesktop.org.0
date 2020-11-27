Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CFE2C675B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 15:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AD46EDD0;
	Fri, 27 Nov 2020 14:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BE96EDD0;
 Fri, 27 Nov 2020 14:03:03 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23133898-1500050 for multiple; Fri, 27 Nov 2020 14:02:59 +0000
MIME-Version: 1.0
In-Reply-To: <20201127120718.454037-126-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
 <20201127120718.454037-126-matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 125/162] drm/i915/lmem: Limit block size
 to 4G
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Date: Fri, 27 Nov 2020 14:02:59 +0000
Message-ID: <160648577933.2925.4507576113226252282@build.alporthouse.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matthew Auld (2020-11-27 12:06:41)
> From: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> 
> when allocating pages to lmem object of size 4G or greater
> we allocate memory blocks from buddy system.

Any lmem object is from the buddy system.

> In this scenario
> buddy sytem can allocate blocks that can have size >= 4G and
> these blocks require >32b to represent block size with these
> blocks we run into an issue with sg list construction because
> sg->length field is only 32b wide.

Just say the when using scatterlist, the maximum segment size is 4G. In
fact, we can ask sg what the backend maximum is, and use that as our max
order.

The only question is whether this merits a flag, or we just assume that
the buddy allocator is only used for objects and so always presented via
sg?
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
