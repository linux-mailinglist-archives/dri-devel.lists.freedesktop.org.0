Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1906FACD5A3
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 04:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3F0B10E262;
	Wed,  4 Jun 2025 02:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cb1ohwlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4974F10E262;
 Wed,  4 Jun 2025 02:29:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 74D6961127;
 Wed,  4 Jun 2025 02:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327BFC4CEED;
 Wed,  4 Jun 2025 02:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749004191;
 bh=bPqB4UZU6V2fT7jBdDYxwFtvGjfygIA1UIxiMxSiYi4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cb1ohwlpgzrn2LhpNWN9eSYPo632mfVce3z+QmIb31Ycm7qWykyjpbyuBRd8porrQ
 DN6aG/r6DntLjj7aAMoCw8yzFKlQ5Y+t5nt8SXZd2gIWdE4whVNA68hyTmeQrU4V+B
 ZBMVPfrJGmN5LEZcQm13UliqEQEm+7aBIZWm2lbyZ7T61I+Puj37un75lo9qyq4TND
 bC0rdTS64c9HmoIix8EU+KFY9lm9DdWV1vsq3HEHMScaeRst7JXJDpvhdzBb8m1TU7
 r0IsZPBrLEbM2GtVExYC/BNRT2AjA9skoeRlT92Z+JszUNQUPf3VO245g1s1+N6muI
 v+M/uhmVxT38g==
Date: Tue, 3 Jun 2025 19:29:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
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
 intel-gfx@lists.freedesktop.org, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v13 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-ID: <20250603192949.3a7fc085@kernel.org>
In-Reply-To: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
References: <20250603-reftrack-dbgfs-v13-0-7b2a425019d8@kernel.org>
MIME-Version: 1.0
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

On Tue, 03 Jun 2025 07:27:11 -0400 Jeff Layton wrote:
> For those just joining in, this series adds a new top-level
> "ref_tracker" debugfs directory, and has each ref_tracker_dir register a
> file in there as part of its initialization. It also adds the ability to
> register a symlink with a more human-usable name that points to the
> file, and does some general cleanup of how the ref_tracker object names
> are handled.
> 
> This reposting is mostly to address Krzysztof's comments. I've dropped
> the i915 patch, and rebased the rest of the series on top.
> 
> Note that I still see debugfs: warnings in the i915 driver even when we
> gate the registration of the debugfs file on the classname pointer being
> NULL. Here is a CI report from v12:
> 
>     https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_148490v8/bat-arls-6/igt@i915_selftest@live@workarounds.html
> 
> I think the i915 driver is doing something it shouldn't with these
> objects. They seem to be initialized more than once, which could lead
> to leaked ref_tracker objects. It would be good for one of the i915
> maintainers to comment on whether this is a real problem.

I still see the fs crashes:
https://netdev-3.bots.linux.dev/vmksft-packetdrill-dbg/results/149560/2-tcp-slow-start-slow-start-app-limited-pkt/stderr
I'll hide this series from patchwork for now. We will pull from Linus
on Thu, I'll reactivate it and let's see if the problem was already
fixed.
