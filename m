Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266B4ACD5BD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 04:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0819610E025;
	Wed,  4 Jun 2025 02:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cVDEXVN4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CD5210E025;
 Wed,  4 Jun 2025 02:38:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6385A4A015;
 Wed,  4 Jun 2025 02:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BABC4CEEF;
 Wed,  4 Jun 2025 02:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1749004705;
 bh=5LknMU9rKRcy1V8M/qjdNcpnPrDlru7bTCB1snpWuss=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cVDEXVN4YyJdlsmQA7dMICujsUpBPH9NR59vj/MT7X38O3W19IporL5kJnoQbOUHA
 77NxCWDe7rZ7oSLnFLw+ZRQwr7FrU1jVQXkj2y7U8Vf04ON3mgM3kZjN+s/VbvWKTJ
 s0oSTLtTonnbwNwB6PH7Uo6bXB5WUapfie4/rQ74=
Date: Tue, 3 Jun 2025 19:38:24 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jeff Layton <jlayton@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Krzysztof
 Karas <krzysztof.karas@intel.com>, Kuniyuki Iwashima <kuniyu@amazon.com>,
 Qasim Ijaz <qasdev00@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v13 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-Id: <20250603193824.f0ba97cd26e7ed4152a91921@linux-foundation.org>
In-Reply-To: <20250603192949.3a7fc085@kernel.org>
References: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
 <20250603192949.3a7fc085@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 3 Jun 2025 19:29:49 -0700 Jakub Kicinski <kuba@kernel.org> wrote:

> > I think the i915 driver is doing something it shouldn't with these
> > objects. They seem to be initialized more than once, which could lead
> > to leaked ref_tracker objects. It would be good for one of the i915
> > maintainers to comment on whether this is a real problem.
> 
> I still see the fs crashes:
> https://netdev-3.bots.linux.dev/vmksft-packetdrill-dbg/results/149560/2-tcp-slow-start-slow-start-app-limited-pkt/stderr
> I'll hide this series from patchwork for now. We will pull from Linus
> on Thu, I'll reactivate it and let's see if the problem was already
> fixed.

Ah.  I dropped the copy from mm.git.
