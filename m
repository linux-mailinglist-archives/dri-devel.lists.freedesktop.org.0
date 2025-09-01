Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BCCB3E076
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 12:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B588B10E41B;
	Mon,  1 Sep 2025 10:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WnzzFHsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D95F10E41B;
 Mon,  1 Sep 2025 10:41:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C83041A91;
 Mon,  1 Sep 2025 10:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5BFC4CEF0;
 Mon,  1 Sep 2025 10:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756723278;
 bh=yFIa/AwwszfMyv5NWD+c3BguAhI507kItLPHy2Owv/k=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=WnzzFHsC9cyub01CpDw7RUegQBEBQ72gB/21sGdXg2S5g0Zi8iDiYI9D4e/B6yDhm
 VvsUQ9RWKRMux5EcXAcZyfEIoqWTBo8eplc6ResOD9Dye+IwTjL308GuEsn1IPXDYf
 RyKX5Ut0m8xgqhZWCXwrlSeTQZY1FWojApNvcFmq+cJ5DxiYkTT3XP3YSrRcSTPE0n
 bNm2yLnZTipBiaCO+rsKYHJ8c2l7JziyJN82pmTICrWJXUPQqp7WFC2ID8HfIvWNbs
 c0Qb7v8zOafynNuYPgqUcKXSezzqh8PqYitga2fjPUsMnR9iNFcr4/AGullHVs6+E/
 NE1oF86re3zLw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 12:41:15 +0200
Message-Id: <DCHEFFK24WF2.2RGNO3JUNLCUR@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250830133255.62380-1-dakr@kernel.org>
 <DCGNTYLUDMUD.2OVROKOZ97QWP@nvidia.com>
In-Reply-To: <DCGNTYLUDMUD.2OVROKOZ97QWP@nvidia.com>
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

On Sun Aug 31, 2025 at 3:50 PM CEST, Alexandre Courbot wrote:
>> +    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
>> +        // Unregister the sysmem flush page before we release it.
>> +        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |b=
ar| {
>> +            self.sysmem_flush.unregister(bar);
>> +
>> +            false
>> +        }));
>> +    }
>
> Maybe I'm overtly cautious, but this method can be called from a large
> part of the driver, leaving the Gpu device in a half-unbound state. The
> `PinnedDrop` approach had the benefit of not allowing this.
>
> One way to solve the problem would be to make this method `pub(in
> crate::driver)`, so other modules cannot call it.

pub(in crate::driver) doesn't work, since hierarchically it's a sibling. :(

However, I can add a doc-comment to make it a bit more obvious.
