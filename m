Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E8BC5031F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 02:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB010E061;
	Wed, 12 Nov 2025 01:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V+z+PaYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FE710E061
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Nov 2025 01:22:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C448143B2C;
 Wed, 12 Nov 2025 01:22:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0AA7C116D0;
 Wed, 12 Nov 2025 01:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762910545;
 bh=8/VZ+Pk/P0ERSzhincVBgh2q/b+XJHdh5AweNfrSb6U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=V+z+PaYFSEegQbz2sIv90WFvfwnTwzaKfAEoJxj4Iud8QJbhPr3scWC5OBttLucJ3
 U/IY6GAVE9/wz90Rbi4M6sN/B0B0ryuqF6r6WOGO/lQWVTbMSU5IaieOh7NsvgzJFV
 X6fwRXWFIboRJvLjM8EfccXuIkYs1Ch2SHXYHQWlt19BSODk32Kh1Qdkwl297yZSoz
 ONFZ9dihyNO09wQzcSqr5QrqYsc0R/f8wvXUlG4spynFr8cvOCykT15iwdjNQ0WJqG
 PAkeJAg0U+TCt6BKu6KJFzEFONFKqJh7Pqo1AtSDXwYyELJT2srDydnHAO438kV92S
 B+KrhG7K7YAQA==
Date: Tue, 11 Nov 2025 17:22:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Simon Horman <horms@kernel.org>, srk@ti.com,
 Meghana Malladi <m-malladi@ti.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH net-next v2 7/7] net: ethernet: ti: am65-cpsw: Fix
 clearing of irq_disabled flag in rx_poll
Message-ID: <20251111172223.6c3b24a4@kernel.org>
In-Reply-To: <20251109-am65-cpsw-xdp-zc-v2-7-858f60a09d12@kernel.org>
References: <20251109-am65-cpsw-xdp-zc-v2-0-858f60a09d12@kernel.org>
 <20251109-am65-cpsw-xdp-zc-v2-7-858f60a09d12@kernel.org>
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

On Sun, 09 Nov 2025 23:37:57 +0200 Roger Quadros wrote:
> In am65_cpsw_nuss_rx_poll() there is a possibility that irq_disabled flag
> is cleared but the IRQ is not enabled.
> 
> This patch fixes by that by clearing irq_disabled flag right when enabling
> the irq.
> 
> Fixes: da70d184a8c3 ("net: ethernet: ti: am65-cpsw: Introduce multi queue Rx")
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

This looks independent from the series, it needs to go to net.
-- 
pw-bot: cr
