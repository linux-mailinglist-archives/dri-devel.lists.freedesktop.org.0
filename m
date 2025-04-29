Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDBEAA3C0F
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 01:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8E410E14E;
	Tue, 29 Apr 2025 23:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CgDlLGqh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2036110E09B;
 Tue, 29 Apr 2025 23:26:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0DD314424F;
 Tue, 29 Apr 2025 23:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A5A7C4CEE3;
 Tue, 29 Apr 2025 23:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745969200;
 bh=gLU5bTmzAEhOlzZzVyqUxAhX9otof8GitmxtEhirTV4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CgDlLGqhAl5Lj7X309PtgVdI8yxsnCfWAIkUGfGdUTqbplV+WJrwhgPq1i9qoIkMG
 4rLDFaLuwQRW4dBOpQJ+1pFF2FNId/8VJIRU6F/6UKb1J7qlrJbgW+p1VLvfiWiC1I
 p2CkcgNAkF66dmwhYdJfkEF8JIv1XeCQ1aWlXgu8Od8OmD/WW9BSKG8VrIVcxOYWAY
 BEqza099VlJKRlWHwm0YpYF+yRFru9oM0Q268xgsA8bt2Mrt5ihKNjaoDsG6b75iOF
 81qav3ACB6GizH+rN9BmgSOcjN8Vs8fXGYVe+dYkrBJYYhBjTug/6u8eqrHrdgFL40
 98DJ6F7KdYMxg==
Date: Tue, 29 Apr 2025 16:26:38 -0700
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
Subject: Re: [PATCH v5 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-ID: <20250429162638.0a8ff24d@kernel.org>
In-Reply-To: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
References: <20250428-reftrack-dbgfs-v5-0-1cbbdf2038bd@kernel.org>
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

On Mon, 28 Apr 2025 11:26:23 -0700 Jeff Layton wrote:
> This one is quite a bit of a change from the last set. I've gone back to
> auto-registering the debugfs files for every ref_tracker_dir. With this,
> the callers should pass in a static string as a classname instead of an
> individual name string that gets copied. The debugfs file is given a
> name "class@%px" The output format is switched to print "class@%p"
> instead of "name@%p".

Nice, I like this version!

Since it applies to net-next now I can point out various (transient)
build issues :)
