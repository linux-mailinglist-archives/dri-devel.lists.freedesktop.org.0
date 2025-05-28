Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5200AC72EB
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 23:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DDE510E6CA;
	Wed, 28 May 2025 21:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="j66ZH4aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2179F10E190;
 Wed, 28 May 2025 21:47:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE6475C5AC5;
 Wed, 28 May 2025 21:45:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD22C4CEE3;
 Wed, 28 May 2025 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748468851;
 bh=nuz0o0BGLyrSP915wdaM0jKsDNSUMxNsELda8wm1SiE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=j66ZH4aCk4nt9Y7OjMFjdnQMYLSLJMVrWU0QsR4oGgbTZ68S1L4GrjKy6xWyVy9qW
 m1+IbaRuOnK3v9IbtKihJs9DuSa8gErD5IKcIROVkl8B9pK8lMdajwomDUFJ6bocKd
 1FaPOwGScP+rnGVrBM8c0nILi8KSX9F05IuRF4aaP+wcxnENgqIH/75miinJbkkyiJ
 iz4iyKGe5e9y5OadzWnHU7gGjas47wXMZxVIQL62OB9nXnr1ZO8Xd7XDH0/oTv7cxo
 CoutemBqrTnC8bdFs56x2TExoIQ7ZGeiVVtzPQ4SInq1P1Mcx9giiO21NXTRLLZ+uA
 qAjhxgb6V7SwA==
Date: Wed, 28 May 2025 14:47:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Kuniyuki
 Iwashima <kuniyu@amazon.com>, Qasim Ijaz <qasdev00@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>
Subject: Re: [PATCH v11 00/10] ref_tracker: add ability to register a
 debugfs file for a ref_tracker_dir
Message-ID: <20250528144730.57741830@kernel.org>
In-Reply-To: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
References: <20250528-reftrack-dbgfs-v11-0-94ae0b165841@kernel.org>
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

On Wed, 28 May 2025 10:34:32 -0400 Jeff Layton wrote:
> Changes in v10:
> - drop the i915 symlink patch
> - Link to v9: https://lore.kernel.org/r/20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org

Hm, I reported the refracker warnings at boot on v9 :
   ref_tracker: ref_tracker: unable to create debugfs file for net_refcnt@ffffffffb73a98f0: -ENOENT
   ref_tracker: ref_tracker: unable to create debugfs file for net_notrefcnt@ffffffffb73a9978: -ENOENT

Did you decide against fixing those? 
Or did they creep back in?
