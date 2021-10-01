Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E541EB36
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D308B6EDEF;
	Fri,  1 Oct 2021 10:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 972 seconds by postgrey-1.36 at gabe;
 Fri, 01 Oct 2021 09:45:45 UTC
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292206ED9F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 09:45:44 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.69.177; 
Received: from localhost (unverified [78.156.69.177]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 332230-1500050 for multiple; Fri, 01 Oct 2021 10:29:14 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211001074041.2076538-1-lucas.demarchi@intel.com>
References: <20211001074041.2076538-1-lucas.demarchi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove IS_ACTIVE
From: Chris Wilson <chris@chris-wilson.co.uk>
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Fri, 01 Oct 2021 10:29:14 +0100
Message-ID: <163308055415.8412.14215483004176995847@build.alporthouse.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Fri, 01 Oct 2021 10:52:45 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2021-10-01 08:40:41)
> When trying to bring IS_ACTIVE to linux/kconfig.h I thought it wouldn't
> provide much value just encapsulating it in a boolean context. So I also
> added the support for handling undefined macros as the IS_ENABLED()
> counterpart. However the feedback received from Masahiro Yamada was that
> it is too ugly, not providing much value. And just wrapping in a boolean
> context is too dumb - we could simply open code it.
>=20
> As detailed in commit babaab2f4738 ("drm/i915: Encapsulate kconfig
> constant values inside boolean predicates"), the IS_ACTIVE macro was
> added to workaround a compilation warning. However after checking again
> our current uses of IS_ACTIVE it turned out there is only
> 1 case in which it would potentially trigger a warning. All the others
>   can simply use the shorter version, without wrapping it in any macro.
> And even that single one didn't trigger any warning in gcc 10.3.
>=20
> So here I'm dialing all the way back to simply removing the macro. If it
> triggers warnings in future we may change the few cases to check for > 0
> or !=3D 0. Another possibility would be to use the great "not not
> operator" for all positive checks, which would allow us to maintain
> consistency.  However let's try first the simplest form though, hopefully
> we don't hit broken compilers spitting a warning:

You didn't prevent the compilation warning this re-introduces.

drivers/gpu/drm/i915/i915_config.c:11 i915_fence_context_timeout() warn: sh=
ould this be a bitwise op?
drivers/gpu/drm/i915/i915_request.c:1679 i915_request_wait() warn: should t=
his be a bitwise op?
-Chris
