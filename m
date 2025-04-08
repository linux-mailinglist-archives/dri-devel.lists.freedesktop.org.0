Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E941A817FF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 23:56:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6001710E77A;
	Tue,  8 Apr 2025 21:56:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e0Na17Ig";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4D510E77A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 21:56:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D4F25C4BEB;
 Tue,  8 Apr 2025 21:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413A7C4CEE5;
 Tue,  8 Apr 2025 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744149387;
 bh=pFYXmZR6+jwBdXIM8IMf1ZM5f+SPt+A0Ob1udfXGNgo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0Na17IgV55ORUx7uGu46oo8HnhMwXM27DrVZ6eQvYyDeWnzTw0kxDCu0V8df2oMb
 3//aBTOUv6zxKplp6Ch9BsDLQeciaDmGTG8rNRsbzzr5THFYW/cSx3TQ6EoxmkMNgY
 zsD6BWXFzLH3/ivv4Of4HbaNX2CBGfgcnvgbMcSN67Ux2fDiWARRzmKLkst3HvpK4W
 gDIEMdQ0G3RT/DRsFtvnRPY7XZHnM2kFPGneSM6uBFMXwHOVMJzf8yEmr+4EUgOf3C
 13GQxY7IldGbwPfvw4MZBpDhuYEhdr8ZHNe/QiufQmmJPXZ+Vico/GBq7iiF7uLz39
 B166q0vRRyUHg==
Date: Tue, 8 Apr 2025 14:56:24 -0700
From: Kees Cook <kees@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>,
 Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
 Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
 joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
 tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 Hector Martin <marcan@marcan.st>,
 Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <202504081456.31AF24D2F7@keescook>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Apr 08, 2025 at 12:17:57PM +0530, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FourCCs with various endian semantics:
> 
> %p4ch	Host byte order
> %p4cn	Network byte order
> %p4cl	Little-endian
> %p4cb	Big-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FourCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> allow printing LSByte-first FourCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
> 
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
