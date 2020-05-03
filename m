Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C401C2F3C
	for <lists+dri-devel@lfdr.de>; Sun,  3 May 2020 22:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B809C6E247;
	Sun,  3 May 2020 20:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24FE36E247;
 Sun,  3 May 2020 20:30:40 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21101115-1500050 for multiple; Sun, 03 May 2020 21:30:23 +0100
MIME-Version: 1.0
In-Reply-To: <20200430221016.3866-1-Jason@zx2c4.com>
References: <20200430221016.3866-1-Jason@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, bigeasy@linutronix.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de
Subject: Re: [PATCH] drm/i915: check to see if SIMD registers are available
 before using SIMD
From: Chris Wilson <chris@chris-wilson.co.uk>
Message-ID: <158853782127.10831.11598587258154009671@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Sun, 03 May 2020 21:30:21 +0100
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jason A. Donenfeld (2020-04-30 23:10:16)
> Sometimes it's not okay to use SIMD registers, the conditions for which
> have changed subtly from kernel release to kernel release. Usually the
> pattern is to check for may_use_simd() and then fallback to using
> something slower in the unlikely case SIMD registers aren't available.
> So, this patch fixes up i915's accelerated memcpy routines to fallback
> to boring memcpy if may_use_simd() is false.
> 
> Cc: stable@vger.kernel.org

The same argument as on the previous submission is that we return to the
caller if we can't use movntqda as their fallback path should be faster
than uncached memcpy.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
