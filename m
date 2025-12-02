Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D75C9CFD5
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 21:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D96510E6B8;
	Tue,  2 Dec 2025 20:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fEd+RkPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D26A10E5CE;
 Tue,  2 Dec 2025 20:58:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3EB0444044;
 Tue,  2 Dec 2025 20:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83552C4CEF1;
 Tue,  2 Dec 2025 20:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764709104;
 bh=zlnGbwpqVuU4WhWs2PTVXFjZ6/OM80jwbLabLxCX6JE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fEd+RkPgbRbzq5T2chlYo2Iy0yT4Tajrpn/YuQ0P074U2Zh3N+y6qKoW3RBlMcBYG
 Aeg5oyrtupAtylJkmisdEy59gw8ideP5bmTYenpsDDazlz5DU6JcpMaFZ1kK8sjsuj
 4Ly/4xMex4gn74OWsf0xBeJw9W1ygB9cKerkqm21df07PuoK3hjh+SCFEuoC10pX3c
 hNG0mDGBzrgVbRH9tUk+gAu055vleHUVtiGhO5J7XgSpIlDJVx4q9peYaqR1KiAwa6
 THnT8D6IjYYgxdkkP7q5gSEniu4WDSjij9S0IoEDnuvKiuHH4NmXnTrpQYGmQcqqOk
 ivaf/ArPeU/iQ==
Date: Tue, 2 Dec 2025 21:58:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-modules@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] kernel.h: drop STACK_MAGIC macro
Message-ID: <3m64k5fagw7hp2duo43t5fldyn6argdjripx3nn6onxbr6xu6w@iwiepyn5krf6>
References: <20251129195304.204082-1-yury.norov@gmail.com>
 <20251129195304.204082-2-yury.norov@gmail.com>
 <d854dadd78a43f589399e967def37a0eda3655c2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d854dadd78a43f589399e967def37a0eda3655c2@intel.com>
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

Hi Jani,

On Mon, Dec 01, 2025 at 09:46:47AM +0200, Jani Nikula wrote:
> On Sat, 29 Nov 2025, "Yury Norov (NVIDIA)" <yury.norov@gmail.com> wrote:
> > The macro is only used by i915. Move it to a local header and drop from
> > the kernel.h.
> >
> > Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/i915_utils.h | 2 ++
> >  include/linux/kernel.h            | 2 --
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_utils.h b/drivers/gpu/drm/i915/i915_utils.h
> > index a0c892e4c40d..6c197e968305 100644
> > --- a/drivers/gpu/drm/i915/i915_utils.h
> > +++ b/drivers/gpu/drm/i915/i915_utils.h
> 
> i915_utils.h is on a diet itself. STACK_MAGIC is only used in selftests,
> please put this in i915_selftest.h.
> 
> I guess also need to include that from gt/selftest_ring_submission.c,
> the only one that uses STACK_MAGIC but doesn't include i915_selftest.h.

Doing this cleanups is a bit out of the scope of this patch.
Given that the patch itself has quite a good consensus, let move
it forward and I can take care of the i915 cleanup once it gets
merged.

Andi
