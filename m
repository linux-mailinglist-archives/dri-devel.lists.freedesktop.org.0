Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB75AA3C12
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C32710E1C0;
	Tue, 29 Apr 2025 23:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ess5L7vC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0510E1C0;
 Tue, 29 Apr 2025 23:27:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DD9AF5C2821;
 Tue, 29 Apr 2025 23:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C87C4CEE3;
 Tue, 29 Apr 2025 23:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745969226;
 bh=28MtSgjbjXrdZ/jTsaxL32vyuTpnpiiBB72nh4Z88AE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ess5L7vCYQuQNPTszqhQ8yNwaFKuFM7yTi8nS01JB+1uQt/NHg5DISJ7tmQVMFWmI
 19odnC67quc5WilZYhQWCPm+/RhYU3JM6Luwlh7d3p26T19U4qBssbFqzKo9L0NObQ
 cPt2iAmVOBS7BXca6dm/qqYP+VGEF7qbtHhY/qbTfxYEy0/aavQXb+aGIVphQUo0yj
 tPEyn6Ba/DKZgcJpz3sSLajjfvtRwYzdLGOTSBNlknsKRkoGdTFMDhFDLTFOtfBltp
 RkGGEHjXI2YGLcOr07kp5vLD8Nk4keMydMUjBCm7CDzGl3NkxZWyjEHYI3qQ4GSPDs
 L4QyZ2zOKMNsQ==
Date: Tue, 29 Apr 2025 16:27:04 -0700
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
Subject: Re: [PATCH v5 04/10] ref_tracker: allow pr_ostream() to print
 directly to a seq_file
Message-ID: <20250429162704.4729a76a@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
 <20250428-reftrack-dbgfs-v5-4-1cbbdf2038bd@kernel.org>
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

On Mon, 28 Apr 2025 11:26:27 -0700 Jeff Layton wrote:
> Allow pr_ostream to also output directly to a seq_file without an
> intermediate buffer.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

lib/ref_tracker.c:316:12: warning: unused function 'ref_tracker_dir_seq_print' [-Wunused-function]
  316 | static int ref_tracker_dir_seq_print(struct ref_tracker_dir *dir, struct seq_file *seq)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~
