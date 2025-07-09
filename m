Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB674AFEBB2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 16:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB9C10E05D;
	Wed,  9 Jul 2025 14:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NamG7SQz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0810E05D
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 14:22:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 94858613B1;
 Wed,  9 Jul 2025 14:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6623FC4CEEF;
 Wed,  9 Jul 2025 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752070952;
 bh=RuYtf+o/prZlkiX+R1ATPE24ug38zrQkLBU6YbtB9gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NamG7SQzyQWJ5KWdWWQHeVwsQhVqWV9f1070NVbepNAVaJWziLWvw4WxtupUVj5AY
 nuKJgYBWeMXoAm/HtGW1fkcZLHjaGk6CQsHImC0C5QwSHqsmT/sknOo5FNWalDWTl4
 RoIWCU5yClKHjTKMGDEfc4wzk6g+wccEpjZe4+bz0dsQeolEG7j3eZioyxg9MPKdZm
 9vAPQZ6b0De2Rp/z8XNoJe6moCn5k7qm+d72v7Zl3yIKew+sB6/nEvwPefnoC3jmBi
 xwwD6e2JbKdag1hgELjSnKJd6l/L+HPlswWndrbN71xXbznIqSyMhHFdlp5tRoZH/a
 wh0WrBv/dDi3Q==
Date: Wed, 9 Jul 2025 16:22:27 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>, 
 Wolfram Sang <wsa@kernel.org>, Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v4 0/3] Fix STM32 I2C dma operations
Message-ID: <2o7ptcsi2akaphtofm57ok7te7qdxrchygpeqmdjaiushfjffs@5k47ncrcrgxk>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
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

Hi Clement,

Thanks for following up on the reviews.

> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer

I applied the two above in i2c/i2c-host-fixes. I'm not sure we
need the "Fixes:" tag in the first patch, though, as we are not
fixing a real bug. But I'm keeping it there for the time being.

>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

This one depends on the previous two to be appliex, so that for
now I added it in i2c/i2c-host-next. I will place it in the
proper branch after the weekly pull request.

Thanks,
Andi
