Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB993A425
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 18:06:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B10110E11C;
	Tue, 23 Jul 2024 16:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U8Hx6A/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3331910E11C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721750804;
 bh=7ywyqkkF5MqKA00APXlJ4HjoUAu4Qg1q3SKV80O1gZw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U8Hx6A/SoskBj3aYoyWmsy797rA3qThdPClB/SD4Tj583SBwF9s7P2vfR4UGlyULr
 OxKNwWb1g4kvM0ixW1L96RHj1a9suG6QYvonJhTVgLSehhOLXY1m+ZKSDSr26Vkgvm
 rcdkTN43AeB3yemf2ZaTeiyv4tu24gXZBCE9sJbRV2DvbPjn0NfmGDVpu+W0bUSSta
 Yt8bAYeYWkL2qmQnUf9/1U6mml3OdQGGrlmhI5p2Z0+8MftudQRcfx/JqUemX9gckL
 OAhiUbQ7bO2jn/gFHaNJ8hJoyjzV06tzqrDl9FpQpetOplXmKpbkQgAXSeBQaJrJ5Y
 fUxIWvt8uBuWw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0197C37804D4;
 Tue, 23 Jul 2024 16:06:43 +0000 (UTC)
Date: Tue, 23 Jul 2024 18:06:42 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, ojeda@kernel.org, Danilo Krummrich <dakr@redhat.com>,
 lyude@redhat.com, robh@kernel.org, lina@asahilina.net, mcanal@igalia.com,
 airlied@gmail.com, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] drm: panthor: add dev_coredumpv support
Message-ID: <20240723180642.73502856@collabora.com>
In-Reply-To: <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <fe84a028-01a8-4987-b1b7-141fb76d263c@arm.com>
 <4344B22F-D859-4C64-A351-69FFB5208362@collabora.com>
 <edda856e-3102-495a-8cc6-b79f5f114833@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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

Hi Steve,

On Mon, 15 Jul 2024 10:12:16 +0100
Steven Price <steven.price@arm.com> wrote:

> I note it also shows that the "panthor_regs.rs" would ideally be shared.
> For arm64 we have been moving to generating system register descriptions
> from a text source (see arch/arm64/tools/sysreg) - I'm wondering whether
> something similar is needed for Panthor to generate both C and Rust
> headers? Although perhaps that's overkill, sysregs are certainly
> somewhat more complex.

Just had a long discussion with Daniel regarding this panthor_regs.rs
auto-generation, and, while I agree this is something we'd rather do if
we intend to maintain the C and rust code base forever, I'm not
entirely convinced this is super useful here because:

1. the C code base is meant to be entirely replaced by a rust driver.
Of course, that's not going to happen overnight, so maybe it'd be worth
having this autogen script but...

2. the set of register and register fields seems to be pretty stable.
We might have a few things to update to support v11, v12, etc, but it
doesn't look like the layout will suddenly become completely different.

3. the number of registers and fields is somewhat reasonable, which
means we should be able to catch mistakes during review. And in case
one slip through, it's not the end of the world either because this
stays internal to the kernel driver. We'll either figure it out when
rust-ifying panthor components, or that simply means the register is
not used and the mistake is harmless until the register starts being
used

4. we're still unclear on how GPU registers should be exposed in rust,
so any script we develop is likely to require heavy changes every time
we change our mind

For all these reasons, I think I'd prefer to have Daniel focus on a
proper rust abstraction to expose GPU registers and fields the rust-way,
rather than have him spend days/weeks on a script that is likely to be
used a couple times (if not less) before the driver is entirely
rewritten in rust. I guess the only interesting aspect remaining after
the conversion is done is conciseness of register definitions if we
were using some sort of descriptive format that gets converted to rust
code, but it comes at the cost of maintaining this script. I'd probably
have a completely different opinion if the Mali register layout was a
moving target, but it doesn't seem to be the case.

FYI, Daniel has a python script parsing panthor_regs.h and generating
panthor_regs.rs out of it which he can share if you're interested.

Regards,

Boris 
