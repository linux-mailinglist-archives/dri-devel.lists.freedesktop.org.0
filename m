Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DB11C954C
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685586EA25;
	Thu,  7 May 2020 15:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AAD6EA25;
 Thu,  7 May 2020 15:44:53 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21140661-1500050 for multiple; Thu, 07 May 2020 16:44:30 +0100
MIME-Version: 1.0
In-Reply-To: <20200507153600.314454-1-jason@jlekstrand.net>
References: <20200507153600.314454-1-jason@jlekstrand.net>
Subject: Re: [PATCH] RFC: i915: Drop relocation support on Gen12+
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158886626795.20858.1870213936656066157@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Thu, 07 May 2020 16:44:27 +0100
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
Cc: Dave Airlie <airlied@redhat.com>, Jason Ekstrand <jason@jlekstrand.net>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jason Ekstrand (2020-05-07 16:36:00)
> The Vulkan driver in Mesa for Intel hardware never uses relocations if
> it's running on a version of i915 that supports at least softpin which
> all versions of i915 supporting Gen12 do.  On the OpenGL side, Gen12 is
> only supported by iris which never uses relocations.  The older i965
> driver in Mesa does use relocations but it only supports Intel hardware
> through Gen11 and has been deprecated for all hardware Gen9+. The entire
> relocation UAPI and related infrastructure, therefore, doesn't have any
> open-source userspace consumer starting with Gen12.
> 
> Rejecting relocations starting with Gen12 has the benefit that we don't
> have to bother supporting it on platforms with local memory.  Given how
> much CPU touching of memory is required for relocations, not having to
> do so on platforms where not all memory is directly CPU-accessible
> carries significant advantages.

You are not supplying them, the kernel is not checking them [as they
don't exist], so there is no material benefit. The only question is
maintainability.

How confident are you that you will never use them and rewrite the
media-driver? The code exists, will be tested, and can just as easily
expire with the rest of execbuffer2.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
