Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61715AA3C18
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC2910E469;
	Tue, 29 Apr 2025 23:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HNDWABjU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D8A10E469;
 Tue, 29 Apr 2025 23:28:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1857DA4A7C5;
 Tue, 29 Apr 2025 23:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64247C4CEE3;
 Tue, 29 Apr 2025 23:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745969284;
 bh=fAlX+Lt5V+LaI4Cx7JCgzZ4OfSfzgUpstMeIReZB04I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HNDWABjUCuxF00cC9YWvNiQ8OU5jvdWg7bBD0p3gIf9J642Uy2Xim02rHkhS9VZ55
 q+1jSQoOhuKJftYcrZKtOSRXeaEKhl6VF6o011qWYpTnu6fZqDL+fBNu55L08bPL6s
 m49lLVHGUd7VCHkZ/e2AwphSTC6dhHGpCwxmo0Zvt1DN4kcNmG8k6S/3KCmdRP/2aR
 PTOvyNbPaSr2Oo7IKUBGmF2iLhwoIBs3FWWuh+7wy5qx+nEzyooPzsq/aiT1Se0tYJ
 bjNcm0koXh2cRD0BaZpsgReR2g4kDY9uKuTDrld0C+7ca3NphgWr436tLmK4bOqPh0
 jSxjiNEpPgJoQ==
Date: Tue, 29 Apr 2025 16:28:02 -0700
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
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v5 06/10] ref_tracker: automatically register a file in
 debugfs for a ref_tracker_dir
Message-ID: <20250429162802.1cfc3965@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-6-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
 <20250428-reftrack-dbgfs-v5-6-1cbbdf2038bd@kernel.org>
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

On Mon, 28 Apr 2025 11:26:29 -0700 Jeff Layton wrote:
> +/**
> + * ref_tracker_dir_debugfs - create debugfs file for ref_tracker_dir
> + * @dir: ref_tracker_dir to be associated with debugfs file
> + * @fmt: format string for filename
> + * @...: arguments for the format string
> + *
> + * Call this function to create a debugfs file for your ref_tracker_dir that
> + * displays the current refcounts for the object. It will be automatically
> + * removed when the ref_tracker_dir exits. The filename must be unique. If
> + * the creation fails then the pr_warn will be emitted.
> + */
> +void ref_tracker_dir_debugfs(struct ref_tracker_dir *dir)

lib/ref_tracker.c:374: warning: Excess function parameter 'fmt' description in 'ref_tracker_dir_debugfs'
lib/ref_tracker.c:374: warning: Excess function parameter '...' description in 'ref_tracker_dir_debugfs'
