Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC2D32CF3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2680210E8AC;
	Fri, 16 Jan 2026 14:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JHn9hny+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E4F10E0A3;
 Fri, 16 Jan 2026 14:45:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BE0CE41708;
 Fri, 16 Jan 2026 14:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2066EC116C6;
 Fri, 16 Jan 2026 14:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768574738;
 bh=dLIP3yuCXQig06JmGi7Dt5CFTqwxB/97u4nRMJ/85o8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JHn9hny+KZc4fD/9N3/yGG4Ed/hhHgyo20Xlcfi6MQ0Tz8Px4xYfrMnWeTFClUuk8
 00EV1D5wpqvfLr0GiQqLHyQcyukMIVymVzBr7dJCpGoIs5JGJ4g4MAMNMBZDsazQuO
 3bfpoDTbahXMz2Ln32On0kIkEny+5/uDL7Cww21E=
Date: Fri, 16 Jan 2026 15:45:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yury Norov <ynorov@nvidia.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
Subject: Re: [PATCH v5 3/6] kernel.h: move VERIFY_OCTAL_PERMISSIONS() to
 sysfs.h
Message-ID: <2026011629-recognize-municipal-2a89@gregkh>
References: <20260116042510.241009-1-ynorov@nvidia.com>
 <20260116042510.241009-4-ynorov@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116042510.241009-4-ynorov@nvidia.com>
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

On Thu, Jan 15, 2026 at 11:25:06PM -0500, Yury Norov wrote:
> The macro is related to sysfs, but is defined in kernel.h. Move it to
> the proper header, and unload the generic kernel.h.
> 
> Now that the macro is removed from kernel.h, linux/moduleparam.h is
> decoupled, and kernel.h inclusion can be removed.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Yury Norov <ynorov@nvidia.com>
> ---
>  Documentation/filesystems/sysfs.rst |  2 +-
>  include/linux/kernel.h              | 12 ------------
>  include/linux/moduleparam.h         |  2 +-
>  include/linux/sysfs.h               | 13 +++++++++++++
>  4 files changed, 15 insertions(+), 14 deletions(-)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
