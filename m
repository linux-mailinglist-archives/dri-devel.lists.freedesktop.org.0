Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DAEA265D6
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 22:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118AF10E00F;
	Mon,  3 Feb 2025 21:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OpNXxv7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855BB10E00F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 21:40:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A8EDD5C6698;
 Mon,  3 Feb 2025 21:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF4FC4CED2;
 Mon,  3 Feb 2025 21:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738618835;
 bh=VYCbSdXLJAo0G5h51wpv/9glXHCBiN/zrDRBjbCoWgM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OpNXxv7wPskYIU5W1eX6NnJLBl9y4p/m1YIgi6u+hJqquXLM4DHQz+4ySgmhL14y3
 FX1KbBbFGhTgUO9fr1dBr+jN90QSjDZbBvkz6hycOreX69tirmXklt+sZKgJGYY6ji
 BcnBwGLIWIJeJTKlAoiidN21nS2Zjt+osBSpzKiYW+goEX+YzVSYaWadb/cezrfwY6
 ahbgk1UhBIAtxcr8eBb8CDZmsDX81t2ikcJvoLw/yvvcpBswVQdqPdMINQZKDq+F8v
 65TlIA5wt98F22A8CuOgAAlljmsCDJbzfV8VX92WSMQMST9bNMHCPaqDMLmM/IMLJh
 byH70SFvb9EIw==
Date: Mon, 3 Feb 2025 13:40:33 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Salyzyn <salyzyn@android.com>, Tim Murray <timmurray@google.com>,
 Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
 kernel-team@android.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Salyzyn <salyzyn@android.com>, Dave Airlie <airlied@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, russ.weight@linux.dev
Subject: Re: question about firmware caching and relying on it
 (CONFIG_FW_CACHE)
Message-ID: <Z6E30W9aEh2tQOkw@bombadil.infradead.org>
References: <CAPM=9twyvq3EWkwUeoTdMMj76u_sRPmUDHWrzbzEZFQ8eL++BQ@mail.gmail.com>
 <CAHk-=whRBX0aQq1J5S5nHXE2GvXnQ5z+cqu=iTY9xU34kvYMzw@mail.gmail.com>
 <2025020347-chewy-paradox-ce71@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020347-chewy-paradox-ce71@gregkh>
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

On Mon, Feb 03, 2025 at 09:19:59AM +0100, Greg Kroah-Hartman wrote:
> On Sun, Feb 02, 2025 at 12:54:07PM -0800, Linus Torvalds wrote:
> > Greg, Luis, can you explain that odd uevent message / netlink issue?
> 
> There was reports from Android devices that the uevent was causing the
> system to wake up from the netlink messages that were sent when going to
> sleep and so it would get caught in a loop and never actually go to
> sleep.  I can't remember any more than that, maybe Mark can recall the
> specifics and dig up the Android bug reports for it?

Nope, the only thing that my spidy senses tells me is that it would be
great to know if the uevent flood was caused by the uevent flood which
caused the same udev duplicate messages to load modules per-cpu. Linus
had a nice fix to make these idempotent via commit 9b9879fc03275ffe
("modules: catch concurrent module loads, treat them as idempotent")
on the module load path, so I'm wondering if uvents could likely could
trigger floods to delays suspend.

Provided Mark Salyzyn hasn't moved on (from commit 030cc787c30e
("firmware_class: make firmware caching configurable") it would
be great if he could enable the FW_CACHE and re-test. At the very least
hopefully kernel-team-android can redirect this to the appropriate folks
to verify.

One of the reasons to *not* want the fw cache is for firmware images
which are *huge*, like those which may be used on remote procs. But we
we already have an internal FW_OPT_NOCACHE and remote-proc stuff likely
already uses request_firmware_into_buf() which uses FW_OPT_NOCACHE.

  Luis
