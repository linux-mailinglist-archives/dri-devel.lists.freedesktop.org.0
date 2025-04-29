Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D2AA0DEE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 15:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A1C10E499;
	Tue, 29 Apr 2025 13:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="sXDGQe1K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com
 [95.215.58.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C8510E49B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 13:54:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
 s=key1; t=1745934837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10AMgIZT0Rv1ZZbzCxlqVb5gUSHFv8lux2lqcz435Rc=;
 b=sXDGQe1KcJryzSamz/Dj8Rr0w2Glv5tl9jm+XJBTPdmGZ6cC/TRZ++eBpJaYZKZWTCYTdd
 QLy3vDfQnpIArMSWrnKZ3DZ09qsMCGx2piZORLrbuXmlCXRp78fUXcfKgT7cgCpELsk7D6
 +F5QkWg0YCA6UJb3S3aVepyOtPYTvTWbv/hdNp2sk2SkusWGdSQss2y8j9xvzEZrLGNvmW
 30EiL7My124SHTqTKhFCaKoH6IGLnBWV0J2HzZCb6KRaF04rq8zHqu30SVHdmdw+JgGxah
 UflWIkn2nSbtoaJm6UgNIUTyWQVGmbMVoAObbKb1mZXj50UyV7PUFKMuxVODEQ==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, 
 airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
 apw@canonical.com, joe@perches.com, dwaipayanray1@gmail.com, 
 lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, tamird@gmail.com, 
 Petr Mladek <pmladek@suse.com>
Cc: Aditya Garg <gargaditya08@live.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, 
 Asahi Linux Mailing List <asahi@lists.linux.dev>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
References: <20250428123132.578771-1-pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data
 in reversed host ordering
Message-Id: <174593483342.171975.1813917421417975137.b4-ty@rosenzweig.io>
Date: Tue, 29 Apr 2025 09:53:53 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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


On Mon, 28 Apr 2025 14:31:32 +0200, Petr Mladek wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
> 
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
> 
> [...]

Applied, thanks!

[1/1] vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering
      commit: 37eed892cc5ff36aeee59bb78f6aa417a44030a9

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>

