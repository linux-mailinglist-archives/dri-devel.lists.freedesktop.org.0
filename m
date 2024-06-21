Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1475912184
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 12:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83810F13E;
	Fri, 21 Jun 2024 10:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JhW7pzto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5C210F13E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 10:06:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 88E6C6251A;
 Fri, 21 Jun 2024 10:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C0BC32781;
 Fri, 21 Jun 2024 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718964389;
 bh=1GKLKGeRzQY51YWSHCRfEazQ3RSI3b+fO3L2sCeLnXA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JhW7pztoxJCkRjT1yLv7ThPWJWQqRkYgeFtNV8D6Vdr6R+6/OsZQDo4FBdUype8Sh
 d318Thsws/swtFoXoebuAHdHMkwwdtZSYGGuZG+ihlFwVWLMbg/l8UsIL/rKKjrNpt
 cLzKuxr9b6bPx1Z8lvJhPdGXgA3aACBsG82RZ+hIe1YR0TuVxRFELRYv+7QWnNzBag
 RgVdmEQ7cOA4bzMw7jw9eFjm210ABRKiCqEayJ+0zjHURsdUbTsYSIQzWa0YaWdr5w
 f2P9Av5rlyYQxEdk8NM/NN3GBJUI1PLV3X+sGnN4acoHbJQvpAoQHk10kHGtmO6Adr
 qlkHePqiX3OZg==
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Nuno Sa <nuno.sa@analog.com>, 
 linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
In-Reply-To: <20240620122726.41232-1-paul@crapouillou.net>
References: <20240620122726.41232-1-paul@crapouillou.net>
Subject: Re: (subset) [PATCH v12 0/7] iio: new DMABUF based API v12
Message-Id: <171896438479.273533.11227587889239181030.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 15:36:24 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Thu, 20 Jun 2024 14:27:19 +0200, Paul Cercueil wrote:
> Here's the v12 of my patchset that introduces DMABUF support to IIO.
> 
> Apart from a small documentation fix, it reverts to using
> mutex_lock/mutex_unlock in one particular place, which used cleanup
> GOTOs (which don't play well with scope-managed cleanups).
> 
> Changelog:
> - [3/7]:
>     - Revert to mutex_lock/mutex_unlock in iio_buffer_attach_dmabuf(),
>       as it uses cleanup GOTOs
> - [6/7]:
>     - "obtained using..." -> "which can be obtained using..."
> 
> [...]

Applied, thanks!

[1/7] dmaengine: Add API function dmaengine_prep_peripheral_dma_vec()
      commit: 5878853fc9389e7d0988d4b465a415cf96fd14fa
[2/7] dmaengine: dma-axi-dmac: Implement device_prep_peripheral_dma_vec
      commit: 74609e5686701ed8e8adc3082d15f009e327286d
[7/7] Documentation: dmaengine: Document new dma_vec API
      commit: 380afccc2a55e8015adae4266e8beff96ab620be

Best regards,
-- 
Vinod Koul <vkoul@kernel.org>

