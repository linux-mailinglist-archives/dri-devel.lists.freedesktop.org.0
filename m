Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94621AE1040
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 02:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E794A10E1B6;
	Fri, 20 Jun 2025 00:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XuMA59iR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A87F10E04E;
 Fri, 20 Jun 2025 00:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B1BCA60052;
 Fri, 20 Jun 2025 00:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63888C4CEF1;
 Fri, 20 Jun 2025 00:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750378421;
 bh=HASUCIL9ulPvLyn3zTulpno8DS94ekxO6WW6pn7Y6ms=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XuMA59iRXoC4OrMM44QnuZF3MM/WJnbYjB9BPDvZrFYPEQ2kNMfGGZz8JnDY/c2jR
 1812O2iaojg/6koDslMtFlbJTkD6pX5PHKzvjnu0Ldzv8FgnmaBwlvrtyPBeK5Nz8+
 4/xGmDQnJdjmDVnSj0NIkYBcgp/ONwgujOTQKUeheJhkYL1b7qGBQ5w/aNckMIwpoy
 kYCYvrKl06oYl/cQEvtnauN2Bt2d6rcACroXBXug0KA2slmpMOipopx+fM7Y42e4DV
 HxGADf3EBYFtDKsqKN5RZqHJ5AxLgqSC/9BUGkF5qZEDKwthDsxRb1++jgCKXvbh5U
 QUzHbwlfGzhCA==
Date: Thu, 19 Jun 2025 17:13:39 -0700
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
Subject: Re: [PATCH v15 0/9] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-ID: <20250619171339.1bf28dc7@kernel.org>
In-Reply-To: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
References: <20250618-reftrack-dbgfs-v15-0-24fc37ead144@kernel.org>
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

On Wed, 18 Jun 2025 10:24:13 -0400 Jeff Layton wrote:
> For those just joining in, this series adds a new top-level
> "ref_tracker" debugfs directory, and has each ref_tracker_dir register a
> file in there as part of its initialization. It also adds the ability to
> register a symlink with a more human-usable name that points to the
> file, and does some general cleanup of how the ref_tracker object names
> are handled.

Thanks Jeff!

I'm going to apply this based on v6.16-rc2 and merge to net-next.
If anyone would like to also pull into their trees the hash will 
be 707bd05be75f. Happy to create a branch if necessary, too.
