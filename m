Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95E491C3E7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 18:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C6610EC89;
	Fri, 28 Jun 2024 16:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nEL1phH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2C4110EC84
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 16:42:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1E990CE4213;
 Fri, 28 Jun 2024 16:42:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57651C116B1;
 Fri, 28 Jun 2024 16:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719592927;
 bh=KowZk1jQy1Io4XMkPQkUk3h3DaEtKMWS+HxwXGTr01o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEL1phH9XyJOO3v5dFvk1S+J59xlUQRD8neWizW6JlnwyBnug2Weefv24q6bhf95i
 MhJi3bl2YjtM8xZk8U9WUvau7ojskQzgheACXDON+bH3NKQAn9wXIJPMCkj7/9bGDf
 R4UbdFho4lINQQtH5ChOH8HsTK811XPOD+LD6FmH9tYWQGwsUnyAuAJZ1SHvD1/zxC
 qCZ9dyykQhO/2OKHN0U1BCDGqGVpGlzwCawRLy9UAV91om/bWQO0aKBPH3k9JFpEjH
 6BfpIoKU2FK6V3/TI+77El/aFCx9qvSMlxwjTWOO4nwtAudMQWkn8emj4920X/MgVI
 Zi51CngzY6Q5A==
Date: Fri, 28 Jun 2024 09:42:06 -0700
From: Kees Cook <kees@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Uros Bizjak <ubizjak@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-hardening@vger.kernel.org
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <202406280938.2D7BB97C@keescook>
References: <20240625123954.211184-1-jfalempe@redhat.com>
 <202406260906.533095B1@keescook>
 <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06899fda-de75-4d44-bda5-dcbb3e35d037@redhat.com>
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

On Fri, Jun 28, 2024 at 09:13:11AM +0200, Jocelyn Falempe wrote:
> It is present in the kdump log, but before all the register dumps.
> So to retrieve it you need to parse the last 30~40 lines of logs, and search
> for a line starting with "Kernel panic - not syncing".
> https://elixir.bootlin.com/linux/v6.10-rc5/source/kernel/panic.c#L341
> But I think that's a bit messy, and I prefer having a kmsg_dump parameter.

Yeah, I totally agree: it should be easy to access the panic reason. I
just wanted to double-check that from pstore's perspective there wasn't
any "new" information here that should be captured somehow.

Thanks!

-- 
Kees Cook
