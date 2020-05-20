Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4531DB992
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 18:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6086E872;
	Wed, 20 May 2020 16:35:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81DA16E872
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 16:35:13 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21243549-1500050 for multiple; Wed, 20 May 2020 17:35:10 +0100
MIME-Version: 1.0
In-Reply-To: <618a5a19-c2b1-2939-bb51-5df7e158f5f8@amd.com>
References: <20200519084436.91718-1-nirmoy.das@amd.com>
 <20200519084436.91718-2-nirmoy.das@amd.com>
 <158992896210.6082.4915032891292068718@build.alporthouse.com>
 <618a5a19-c2b1-2939-bb51-5df7e158f5f8@amd.com>
Subject: Re: [PATCH 2/2] drm/mm: improve rb_hole_addr rbtree search
To: Nirmoy <nirmodas@amd.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158999250977.8153.18352421924009419887@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 20 May 2020 17:35:09 +0100
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

Quoting Nirmoy (2020-05-20 17:28:04)
> Hi Chris,
> 
> On 5/20/20 12:56 AM, Chris Wilson wrote:
> > Quoting Nirmoy Das (2020-05-19 09:44:36)
> >> +#define DRM_MM_ALIGN_SHIFT 6
> >>   #define HOLE_SIZE(NODE) ((NODE)->hole_size)
> >>   #define HOLE_ADDR(NODE) (__drm_mm_hole_node_start(NODE))
> >> +#define HOLE_SIZE_ALIGN(NODE) ((NODE->hole_size << DRM_MM_ALIGN_SHIFT) | \
> >> +                              ffs(HOLE_ADDR(NODE)))
> > Fwiw, max hole size of 58b, we would need to stop storing byte
> > extents...
> 
> 
> Can you please explain 2nd part of this statement.

Currently we [i915] use drm_mm with byte-addressing, so 58b is a tad too
close to the amount we actually need to track. If we used page tracking
instead of bytes, we regain 12b to play around with. It makes no
difference to the code at the moment (e.g. we still could not fit within
u32) so there has been no pressure to rewrite the extents handling. But
given sufficient reason, we could.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
