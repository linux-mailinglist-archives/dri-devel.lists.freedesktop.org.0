Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4B142521D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 13:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CAE6E847;
	Thu,  7 Oct 2021 11:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 484 seconds by postgrey-1.36 at gabe;
 Thu, 07 Oct 2021 11:36:25 UTC
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C896E847
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 11:36:25 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQ8Fp4Lgmz4xR9;
 Thu,  7 Oct 2021 22:28:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1633606095;
 bh=6XmEiUcJBUQ8ZFQRxDdulMZQn/HEizswWC5HCbgLKv4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=DOGfBEHeWO47bjBBHSHsqxFr8+O8sec9YHMOV06w07chkyLOXFhiy33LfNn5VlWDC
 cKjYQVSHWpXovo4+4sITrz7gih9V9V4AXN2Wcdazpm+o5eAgii7U43m1xogcjaQacD
 qjhiWYCHziZAWNYDXzUAGSREejHv2cc/u5ySDu+uRZC81Uxd2+WmbuUTmnYW0Po+TB
 Sf5ivALvgxG2JTs/QmsZ6tIHV9JvFkIFw91QNK2C7Fl7c8uzlqWsCWXqGN8kCJuve4
 jwITcpfEw9wlw82uh2lulpy0eFqLA76uFzeA8+J4vJxxk8fxUBIynWjzD9Opa3CuYE
 mEmRv4WpkTXKw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Stan Johnson
 <userm57@yahoo.com>, Finn Thain <fthain@linux-m68k.org>
Subject: Re: [PATCH] video: fbdev: use memset_io() instead of memset()
In-Reply-To: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
References: <884a54f1e5cb774c1d9b4db780209bee5d4f6718.1631712563.git.christophe.leroy@csgroup.eu>
Date: Thu, 07 Oct 2021 22:28:10 +1100
Message-ID: <87lf35nkfp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> While investigating a lockup at startup on Powerbook 3400C, it was
> identified that the fbdev driver generates alignment exception at
> startup:
...
>
> Use fb_memset() instead of memset(). fb_memset() is defined as
> memset_io() for powerpc.
>
> Fixes: 8c8709334cec ("[PATCH] ppc32: Remove CONFIG_PMAC_PBOOK")
> Reported-by: Stan Johnson <userm57@yahoo.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/video/fbdev/chipsfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks like drivers/video/fbdev is orphaned, so I'll pick this up via
powerpc.

cheers
