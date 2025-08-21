Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F357B2FA49
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8592510E99B;
	Thu, 21 Aug 2025 13:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cAuuQtHA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177E210E99B;
 Thu, 21 Aug 2025 13:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B770345C02;
 Thu, 21 Aug 2025 13:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E081C4CEED;
 Thu, 21 Aug 2025 13:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755782765;
 bh=GWr+idq2vaOWrsPIEOyMjKzrWGN2V2+JkSn81+Be6FI=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=cAuuQtHAn/7egNIc19ldb8tRH8UyXm6XziXRA7p6tjIp1YFgjgSzstXYiPxJMeBlR
 y0ZtDnkLsIih2GtXr7bW34h/beKsqWBFnhiYtQZMolplYGXrv5Q9uD9nrdj5/orf9B
 GVu2Fa9KRdmHvEjMw2vOIk0/b3kPE1N+wuu9FLCesrbz5JmjhVz+kPpOMd132qNnMn
 iXtRCJu5LGtV72fKfUTFiB1s9WbTXzhWkJe+iQz33J1liO5K9c+fAXKBYMsI+y8s26
 sgXnEgXgwH98e+/xOEGAELa8MCTAKgamEoeXbQKsHjQReH5+gY4OXKOb1b3Ea+iCP8
 L2FbaDIv0JkHQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 21 Aug 2025 15:26:02 +0200
Message-Id: <DC851M0PQQT4.298DSVDC1RKB0@kernel.org>
Subject: Re: [PATCH v2] gpu: nova-core: falcon: align DMA transfers to 256
 bytes
Cc: "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250821-falcondma_256b-v2-1-83e8647a24b5@nvidia.com>
In-Reply-To: <20250821-falcondma_256b-v2-1-83e8647a24b5@nvidia.com>
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

On Thu Aug 21, 2025 at 6:49 AM CEST, Alexandre Courbot wrote:
> Falcon DMA transfers are done in 256 bytes increments, and the method
> responsible for initiating the transfer checked that the required length
> was indeed a multiple of 256. While correct, this also requires callers
> to specifically account for this limitation of DMA transfers, and we had
> for instance the fwsec code performing a seemingly arbitrary (and
> potentially overflowing) upwards alignment of the DMEM load size to
> match this requirement.
>
> Let's move that alignment into the loading code itself instead: since it
> is working in terms of number of transfers, we can turn this upwards
> alignment into a non-overflowing operation, and check that the requested
> transfer remains into the limits of the DMA object. This also allows us
> to remove a DMA-specific constant in the fwsec code.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to nova-next, thanks!
