Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E98AB2026
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 01:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759EC10E052;
	Fri,  9 May 2025 23:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VcFRwd55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA59C10E052;
 Fri,  9 May 2025 23:00:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 663A85C6F08;
 Fri,  9 May 2025 22:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E500C4CEE4;
 Fri,  9 May 2025 23:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746831638;
 bh=l1b0hhH0EUld+vdPUV/LGnnuFlGIRsgXz3uXBFxHD4A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VcFRwd55yeYXX36OuTVZ+BcvfXXKRbfWm9AZhozhiJ37pke8B1fpPAl1ZnmQaoDpH
 rt+kLeH0DFbTA8stPvgp/7G/kA1j1LdwAhxkheGYKyClF3Egg6q2rpMjCnRZxVw6kJ
 RhdHOI+Ci2a6WIFwGp4hq4c8hOfDsw5gGCbBrBrzHndKCskoq0zErWwK/V63+4Ghlc
 /WPK0e6zgEw280Hq62opyXw1AyNq3vbZoCQAPCUAIvCnbFRRFf3w8nrTzpU6tWv7Tf
 W/NI5KSCHb82TXaeYXuRn1SCXE82KCcBHSjzFP8UwpuWqX+d1FIIOO8Xwja/Su7DPv
 WsCowc11iv4TA==
Date: Fri, 9 May 2025 16:00:36 -0700
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
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Jani Nikula
 <jani.nikula@intel.com>
Subject: Re: [PATCH v9 00/10] ref_tracker: add ability to register a debugfs
 file for a ref_tracker_dir
Message-ID: <20250509160036.50d629f9@kernel.org>
In-Reply-To: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
References: <20250509-reftrack-dbgfs-v9-0-8ab888a4524d@kernel.org>
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

On Fri, 09 May 2025 11:53:36 -0400 Jeff Layton wrote:
> This one just fixes a typo in the ref_tracker_dir_init() kerneldoc
> header. I'm only resending so the CI will pick it up.

We got a bunch of:

[    0.457561][    T0] ref_tracker: ref_tracker: unable to create debugfs file for net_refcnt@ffffffff92da4870: -ENOENT
[    0.457561][    T0] ref_tracker: ref_tracker: unable to create debugfs file for net_notrefcnt@ffffffff92da48f8: -ENOENT

[    0.973191][    T1] ref_tracker: ref_tracker: unable to create debugfs file for netdev@ffff888004d0c5a8: -ENOENT

[    1.150784][    T1] ref_tracker: ref_tracker: unable to create debugfs file for netdev@ffff8880053fc5a8: -ENOENT

[    1.660680][    T1] ref_tracker: ref_tracker: unable to create debugfs file for netdev@ffff8880085f95a8: -ENOENT

in the CI at boot. Presumably init_net and loopback.

https://netdev-3.bots.linux.dev/vmksft-net-drv-dbg/results/113741/vm-start-thr0-0/stdout
