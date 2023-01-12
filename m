Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E046679FA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723310E1A2;
	Thu, 12 Jan 2023 15:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080FC10E1A2;
 Thu, 12 Jan 2023 15:57:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2BBAA62084;
 Thu, 12 Jan 2023 15:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2EBC433F0;
 Thu, 12 Jan 2023 15:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673539019;
 bh=jVnUX1HGL2gh5Pn/FhhNok6HWG0zem3mXf+tFOv4oTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PsM6lFByFZNcJejpqXWxQ75oEuqp47dI16BAXhtaV4bMK8m0zTc57+HOqw8A+Q6gg
 009T5f+JKmgNaj3O8RJ3a8bT5xdCwqCoANeIvSkhbTiAugRd4qlwZoeibQwDfTCSOo
 KrByOMAJdLwSr+JPfsiY0JmEU7u3QdOqFJ0T3nl+4U+0lATl02LC0tai9IuVzjickU
 qFAZ2kloCjPf1MwMpRJJQ1tlgVq7TYrxACs9af/t4WfIL0NEfrNxJU8Zt2Y4y/Z3FX
 2ZsmP/C0LDUzgOaQdpvRkox9ItTl5HyZrCqI9UQ8Ok8Ox48EwvAgmuQWstQnbAUjyz
 Bsdofl/i76t0A==
Date: Thu, 12 Jan 2023 08:56:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] drm/i915: Fix CFI violations in gt_sysfs
Message-ID: <Y8Atycuni0bl8std@dev-arch.thelio-3990X>
References: <20221013205909.1282545-1-nathan@kernel.org>
 <4dcf830e-62a5-837b-7590-ac5395f84c14@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dcf830e-62a5-837b-7590-ac5395f84c14@redhat.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, llvm@lists.linux.dev,
 Kees Cook <keescook@chromium.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Tom Rix <trix@redhat.com>, intel-gfx@lists.freedesktop.org,
 Nick Desaulniers <ndesaulniers@google.com>, patches@lists.linux.dev,
 Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jocelyn,

On Thu, Jan 12, 2023 at 11:08:17AM +0100, Jocelyn Falempe wrote:
> This patch does also solve a kernel crash when reading
> /sys/class/drm/card1/gt/gt0/* on a skylake machine:
> https://bugzilla.redhat.com/show_bug.cgi?id=2154880

Interesting, I wonder what aspect of this patch fixes this because I am
not sure that is an intended consequence of this change but that is
still good to hear!

For the record, this is commit a8a4f0467d70 ("drm/i915: Fix CFI
violations in gt_sysfs") in mainline.

> Do you think it can be backported to stable releases ?
> Conflicts are trivial on top of v6.0 at least.

I had a report from another user of this crash affecting them with kCFI
so it is on my TODO to backport it to 6.1 (6.0 just went EOL) but I am
currently out of the office until next Wednesday so I won't be able to
get to it until then (as I would like to test the backport on affected
hardware). If someone wants to beat me to it, I won't complain ;)

Cheers,
Nathan
