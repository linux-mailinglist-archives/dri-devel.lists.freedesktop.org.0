Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907BE7627D9
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 02:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAC910E0B7;
	Wed, 26 Jul 2023 00:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1DA10E0B7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:47:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 76FE26166F;
 Wed, 26 Jul 2023 00:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5F9C433C8;
 Wed, 26 Jul 2023 00:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690332433;
 bh=Wl5oBCsN+Rpuig2vlDDIl7wkx5DAqU7N9LpCXvvXqaU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tg2/mzATAsk2JQ0uYNT3N+GHenozvBgwCi5f4JqKBrUuAG9hn9CkOh1PBed16pjnw
 /+7KKpB/o60eGaGYvknDV1QoKFEpah9DpJ1b9dIUklCyhc0mP+mJ3ZxibWx8ciQstT
 rVQfH4ZZEWFWoPDVdydQQB9JFM/5JKe4g5kVpJGeyL11/FMYc/S69r9DsK+G2JyNjk
 o38r2xCRsC4a1uex6J70uX+oRoJnGsGYOvIYly5yvpmE/he4ykCc4IxsOI9jliSauJ
 3J0YBUclGBfQLxzzUgGSdzYhmdHFF7b/GcsQGDOCUfbo6qapiupE3r/DdNEYaUKFev
 T8loQZuGRMA9Q==
Date: Tue, 25 Jul 2023 17:47:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: Unexplainable packet drop starting at v6.4
Message-ID: <20230725174712.66a809c4@kernel.org>
In-Reply-To: <ZMBf3Cu+MgXjOpvF@debian.me>
References: <e79edb0f-de89-5041-186f-987d30e0187c@gmail.com>
 <ZMBf3Cu+MgXjOpvF@debian.me>
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
Cc: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>,
 hq.dev+kernel@msdfc.xyz, Linux Regressions <regressions@lists.linux.dev>,
 Linux Networking <netdev@vger.kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Eric Dumazet <edumazet@google.com>, "Linux
 regression tracking \(Thorsten Leemhuis\)" <regressions@leemhuis.info>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Linux Intel Ethernet Drivers <intel-wired-lan@lists.osuosl.org>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Paolo Abeni <pabeni@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Jul 2023 06:50:52 +0700 Bagas Sanjaya wrote:
> This time, the bisection points out to v6.4 networking pull, so:
> 
> #regzbot introduced: 6e98b09da931a0

Ask the reporter to test 9b78d919632b, i.e. the tip of net-next before
the merge. It seems quite unlikely that the merge itself is the problem.
