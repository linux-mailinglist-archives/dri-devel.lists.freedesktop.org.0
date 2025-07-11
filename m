Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0CB02541
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 21:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E6E10E3CB;
	Fri, 11 Jul 2025 19:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HT4ThKpf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C89A10E3CB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 19:53:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0F4B1A54F34;
 Fri, 11 Jul 2025 19:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D027C4CEF0;
 Fri, 11 Jul 2025 19:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752263630;
 bh=WYXRyS4t9dECZkBVNQum/0iQ/pFkMEhtJosW4euJws8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HT4ThKpftRIH9FHRwTJoW1isukBW3G2nSZ0IxKIIk+IRuZh4Tm2knlnKlfAONc0qC
 uGhUOEt72FOFm4qBgQKJ1bDfXWQjjPSZrjigiYS6hT3fsdDyNTol9xk2VmXFNHw2ue
 82Ye8tjx80ZjzB/0kkT1gC/Rf2ZPffH0/a+lULxbKzFY6FeDq+jqxpzMU9aqRT5ww/
 AEsC+39cfQbAK6xNh8UZ9XuI5UbNQKeA/2wcWPMafgX3W9SUIIuawhP978QnebGaFD
 qT5Z/qojNXqNm77mwg5ppNPgLotRUdvgfMLGaGrkSg1xUbR8OVZG87/hb7GygbiSmu
 ewjnV3WTvlTiQ==
Date: Fri, 11 Jul 2025 12:53:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter
 <simona@ffwll.ch>, Dave Airlie <airlied@gmail.com>, davem@davemloft.net,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, pabeni@redhat.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [GIT PULL] Networking for v6.16-rc6 (follow up)
Message-ID: <20250711125349.0ccc4ac0@kernel.org>
In-Reply-To: <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
References: <20250711151002.3228710-1-kuba@kernel.org>
 <CAHk-=wj1Y3LfREoHvT4baucVJ5jvy0cMydcPVQNXhprdhuE2AA@mail.gmail.com>
 <20250711114642.2664f28a@kernel.org>
 <CAHk-=wjb_8B85uKhr1xuQSei_85u=UzejphRGk2QFiByP+8Brw@mail.gmail.com>
 <CAHk-=wiwVkGyDngsNR1Hv5ZUqvmc-x0NUD9aRTOcK3=8fTUO=Q@mail.gmail.com>
 <CAHk-=whMyX44=Ga_nK-XUffhFH47cgVd2M_Buhi_b+Lz1jV5oQ@mail.gmail.com>
 <CAHk-=whxjOfjufO8hS27NGnRhfkZfXWTXp1ki=xZz3VPWikMgQ@mail.gmail.com>
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

On Fri, 11 Jul 2025 12:42:54 -0700 Linus Torvalds wrote:
> Were there any other socket changes perhaps?
> 
> I just looked, and gsd-screensaver-proxy seems to use a regular Unix
> domain stream socket. Maybe not related to netlink, did unix domain
> sockets end up with some similar changes?

Humpf. Not that I can see, here's a list of commits since rc5 we sent
minus all the driver and wifi and data center stuff:

a3c4a125ec72 ("netlink: Fix rmem check in netlink_broadcast_deliver().")
a215b5723922 ("netlink: make sure we allow at least one dump skb")
ae8f160e7eb2 ("netlink: Fix wraparounds of sk->sk_rmem_alloc.")

ef9675b0ef03 ("Bluetooth: hci_sync: Fix not disabling advertising instance")
59710a26a289 ("Bluetooth: hci_core: Remove check of BDADDR_ANY in hci_conn_hash_lookup_big_state")
314d30b15086 ("Bluetooth: hci_sync: Fix attempting to send HCI_Disconnect to BIS handle")
c7349772c268 ("Bluetooth: hci_event: Fix not marking Broadcast Sink BIS as connected")

d3a5f2871adc ("tcp: Correct signedness in skb remaining space calculation")
1a03edeb84e6 ("tcp: refine sk_rcvbuf increase for ooo packets")

ffdde7bf5a43 ("net/sched: Abort __tc_modify_qdisc if parent class does not exist")

Let me keep digging but other than the netlink stuff the rest doesn't
stand out..
