Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A99C62F819A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 18:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBE56E0CA;
	Fri, 15 Jan 2021 17:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805DD6E0CA;
 Fri, 15 Jan 2021 17:08:45 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 23609212-1500050 for multiple; Fri, 15 Jan 2021 17:07:55 +0000
MIME-Version: 1.0
In-Reply-To: <161072980241.18103.11713889922046524226@build.alporthouse.com>
References: <c742707e-eb6d-6a22-3006-52dc3bf458d8@gmail.com>
 <161072980241.18103.11713889922046524226@build.alporthouse.com>
Subject: Re: [PATCH] drm/i915/userptr: detect un-GUP-able pages early
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Jinoh Kang <jinoh.kang.kr@gmail.com>, Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Date: Fri, 15 Jan 2021 17:07:53 +0000
Message-ID: <161073047349.18103.16410031184146072179@build.alporthouse.com>
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Chris Wilson (2021-01-15 16:56:42)
> Quoting Jinoh Kang (2021-01-15 16:23:31)
> > If GUP-ineligible pages are passed to a GEM userptr object, -EFAULT is
> > returned only when the object is actually bound.
> > 
> > The xf86-video-intel userspace driver cannot differentiate this
> > condition, and marks the GPU as wedged.
> 
> The idea was to call gem_set_domain on the object to validate the pages
> after creation. I only did that for read-only... I did however make mesa
> use set-domain for validation.

Hmm, I remember a reason why we wanted to be lazy in populating the
pages was that we would often be called to create a map that was never
used. So the additional gup + bind was measurable, and we would rather
just have a probe.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
