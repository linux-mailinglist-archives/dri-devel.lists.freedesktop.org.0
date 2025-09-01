Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D53EB3E7F0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2B610E004;
	Mon,  1 Sep 2025 14:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tIboGu5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C46210E004;
 Mon,  1 Sep 2025 14:54:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 33DF8601D9;
 Mon,  1 Sep 2025 14:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC04C4CEF4;
 Mon,  1 Sep 2025 14:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756738455;
 bh=+C5Bfpn7pkSAzJAPd79k3zy0HrYGm4sseH/iJN98pq8=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=tIboGu5YUtuRLwVqEac/KyozuKsBRXAWzP0iFvJfZxSZ+yYASdWLvowDU8mx2LsCB
 O57O/tbujOtlfok0JorsPLzkQgPeWXMZEX6Zib1uw2UFXPu0zZgojxmduOfxclfLyH
 4OdZy4T81y4yQ/jdaGTmi3Zum8b98DbzZpIjId5kixuq+AvBPvpPW3dVnVONA3NLfr
 DZcXhBLhyO/XA9IjQvzUf3uatr3Ejp2XsouiNlA/tgG1f4GWfSOLyzoAjXET6qsjov
 XiQ+ER+LFr5Atwmd4/FL/AhFpQU0WUKhJWIR+dT24k1xb7cneroUDnjraijLuSzw0+
 eTtq4nw+jYZrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 16:54:13 +0200
Message-Id: <DCHJT462NSWC.RGNMTKZY295P@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250830133255.62380-1-dakr@kernel.org>
 <DCGNTYLUDMUD.2OVROKOZ97QWP@nvidia.com>
 <DCHEFFK24WF2.2RGNO3JUNLCUR@kernel.org>
 <DCHHNSM1VS76.3ET66BZWUXCOM@nvidia.com>
In-Reply-To: <DCHHNSM1VS76.3ET66BZWUXCOM@nvidia.com>
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

On Mon Sep 1, 2025 at 3:13 PM CEST, Alexandre Courbot wrote:
> On Mon Sep 1, 2025 at 7:41 PM JST, Danilo Krummrich wrote:
>> On Sun Aug 31, 2025 at 3:50 PM CEST, Alexandre Courbot wrote:
>>>> +    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
>>>> +        // Unregister the sysmem flush page before we release it.
>>>> +        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, =
|bar| {
>>>> +            self.sysmem_flush.unregister(bar);
>>>> +
>>>> +            false
>>>> +        }));
>>>> +    }
>>>
>>> Maybe I'm overtly cautious, but this method can be called from a large
>>> part of the driver, leaving the Gpu device in a half-unbound state. The
>>> `PinnedDrop` approach had the benefit of not allowing this.
>>>
>>> One way to solve the problem would be to make this method `pub(in
>>> crate::driver)`, so other modules cannot call it.
>>
>> pub(in crate::driver) doesn't work, since hierarchically it's a sibling.=
 :(
>
> Argh. TIL.
>
>>
>> However, I can add a doc-comment to make it a bit more obvious.
>
> Would it also help if we made `Gpu::unbind` take a
> `pci::Device<device::Core>`? That way, driver functions that only have a
> bound device could not invoke it.

This was my intention, but somehow I typed Bound.

> (also, should we make the argument a `device::Device` instead of a
> `pci::Device`?)

I think it makes sense to abstract the specific bus device, since long term=
 we
also want to support tegra.
