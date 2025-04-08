Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63962A817FD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 23:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8950310E779;
	Tue,  8 Apr 2025 21:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IlQyI0FK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5962310E77F
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 21:56:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 436884A20A;
 Tue,  8 Apr 2025 21:56:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DE3C4CEE5;
 Tue,  8 Apr 2025 21:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744149374;
 bh=OTZrr+zk1sHLCa1IYfnHV4rS71qGoOP4KYZHUFdAbco=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlQyI0FKNPRPp7/aXA4fkERdNYSc+09TXkoLf1rg0P7MISrmluByVwaJi9wy04ErW
 A1iIeu3i6l5BKEodhDvt60zc0j1/YG/BZvCo597dGXM8bjnDDryM/ekjsmp5kI3/Ze
 TqOPEUJ3b1yB++So+1hlqDvprb6c8ceNjrvJfjqFHMg95RGyxBMOcAFtNC53TgoASD
 K/Tgd+bBBngSmX6CKgSI1HHl1Fzi6Zz1a4gwHfRoODKuvInAsjYLOXzYTp7W2/FZDq
 HntaMDvptwwmtSn3clnodsbBGG30a+5M/dqCS2322RlyY1yx/b3HHrKNyueVLM1n5P
 VPg7tQ1QQ6t1Q==
Date: Tue, 8 Apr 2025 14:56:11 -0700
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
Subject: Re: [PATCH v4 2/3] printf: add tests for generic FourCCs
Message-ID: <202504081456.745ECB546@keescook>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB95973AF4F6262B2D1996FB25B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB95973AF4F6262B2D1996FB25B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
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

On Tue, Apr 08, 2025 at 12:18:32PM +0530, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> This patch adds support for kunit tests of generic 32-bit FourCCs added to
> vsprintf.
> 
> Acked-by: Tamir Duberstein <tamird@gmail.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
