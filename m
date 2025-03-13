Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBDA5FE24
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 18:40:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A4010E265;
	Thu, 13 Mar 2025 17:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GGCd10d6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC12F10E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 17:40:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 09997A4775A;
 Thu, 13 Mar 2025 17:34:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAB2C4CEE3;
 Thu, 13 Mar 2025 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741887607;
 bh=sMoNdhw6t/4fHOZ+BhebHKDBcl6WdAFfIhyLwLa/Hkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GGCd10d6DJFDskZH7cd22tyTItzmlWKzWIwb0SFAmTXTetera5PQFqBxDXXLLQr/z
 fDVe9v3w4oAiq6crPpThJoEsVJexkHR40L8P/VpK5clc/46wzB5kprHDzZX86B3PBK
 PRSNQB996nmnBpQQCHGTn8nsPspZUrnBdphVK2UewpTMWpP3rr44HTKWkQCo91/Uxd
 GRdya4V+9rksEpmkyEcwjwtvusQjKxo5gGxTy+v5wxd+I6Qex7ReYW0QZOnC5EqvCu
 tPDSoDMTb0NrQnSHWfDLy6L6MxQ9W9cZnidxb3cakSP20C12L8rKpZCP8UJJLb4RJT
 ttM8iTwgBZkVg==
Date: Thu, 13 Mar 2025 10:40:04 -0700
From: Kees Cook <kees@kernel.org>
To: Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>,
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Message-ID: <202503131035.A5FEBE32@keescook>
References: <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
 <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
 <Z9Kb8zMJgmSP-rgD@smile.fi.intel.com>
 <PN3PR01MB959780176C0B16C36FBD59C3B8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9KdzZUxs3vlwp0Z@smile.fi.intel.com>
 <PN3PR01MB9597A8F02423B9E4C585F5EBB8D32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9K36SRz7Ja_AyQb@pathway.suse.cz>
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

On Thu, Mar 13, 2025 at 11:48:32AM +0100, Petr Mladek wrote:
> So I am fine with this patch:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> 
> 
> Now, the question is how to get this patch into the mainline.
> 
> Normally, it would make perfect sense to queue it via the DRM tree
> because drivers/gpu/drm/tiny/appletbdrm.c is a new driver...
> 
> But this time there is a conflicting patchset which is reworking
> the entire lib/test_printf.c file, see
> 20250307-printf-kunit-convert-v6-0-4d85c361c241@gmail.com
> And it will likely be ready for the next merge window as well.
> I am going to review it right away.
> 
> It is even more complicated because the patchset converting
> the printf test module to KUNIT depends on another changes
> in Kees' tree (moving kunit test modules to lib/tests/).
> So it might be easier when it goes via Kees' tree.
> 
> And it might be easier when even this patch goes via Kees' tree.
> 
> My proposal:
> 
> I suggest to separate the fourcc_pointer() test update
> to a separate patch and add it later after the merge window
> when things settle down.
> 
> I mean to send the vsprintf.c, checkpatch.pl, and doc update
> via DRM tree together with the new appletbdrm.c driver.
> 
> And update the selftest later when both DRM tree and KUNIT
> update reaches mainline.
> 
> How does that sound, please?

I'm happy to do whatever makes this easiest.

If patch #1 here were rebased onto the "kunit move" tree:
https://web.git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=for-next/move-kunit-tests
then I could just take it there?

-Kees

-- 
Kees Cook
