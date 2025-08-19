Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69078B2C723
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 16:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7F4510E0C3;
	Tue, 19 Aug 2025 14:36:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TaO+KUqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C5210E0C3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 14:36:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6CEAC61428;
 Tue, 19 Aug 2025 14:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAAFC4CEF1;
 Tue, 19 Aug 2025 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755614161;
 bh=BiHe/FguZmNKLQFvQErwkmhZShCmEsuov9mR9CCAK10=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TaO+KUqTMSIodh39ZJ/nPQgGEHgwsyFzbEZITzVRRHFdJkJK4wIirxXwoU5f/8FQv
 d8Y3m/ELPmUqtK4bLDl+zd56vViPX8vjh1VTrX5aJz4/G8pIZ3tVEU7eMS1PHiTBJG
 exWybiL3Eh9a1r3RSw6SLJoOlFWlnT4AwvgYWibYapB0qPiaS3L1kJQb6/6NHjT2e0
 nz5kWH0P8sLmQrwe8zFJASoFkeNpVKcr9BduukCOTNWYgKL49J1xuwIKHSd/OiNVGe
 ntHEdK6OnQ4AvIbZF8fGt6SWosAGX4WIkxpQ64bc+7gRCD7ZplQ82Nd85ofT02gzPP
 dRF1C0SzgUveA==
Date: Tue, 19 Aug 2025 07:35:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next 5/6] net: ti: icssg-prueth: Add AF_XDP zero
 copy for RX
Message-ID: <20250819073558.2c996b6d@kernel.org>
In-Reply-To: <20250818112424.3068643-6-m-malladi@ti.com>
References: <20250818112424.3068643-1-m-malladi@ti.com>
 <20250818112424.3068643-6-m-malladi@ti.com>
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

On Mon, 18 Aug 2025 16:54:23 +0530 Meghana Malladi wrote:
> @@ -1332,6 +1350,13 @@ static int prueth_xsk_wakeup(struct net_device *ndev, u32 qid, u32 flags)
>  		}
>  	}
>  
> +	if (flags & XDP_WAKEUP_RX) {
> +		if (!napi_if_scheduled_mark_missed(&emac->napi_rx)) {
> +			if (likely(napi_schedule_prep(&emac->napi_rx)))
> +				__napi_schedule(&emac->napi_rx);
> +		}
> +	}
> +
>  	return 0;

I suspect this series is generated against old source or there's
another conflicting series in flight, because git ends up applying
this chunk to prueth_xsk_pool_disable() :S

Before you proceed with AF_XDP could you make this driver build under
COMPILE_TEST on x86? This is very easy to miss, luckily we got an off
list report but its pure luck. And obviously much more effort for the
maintainers to investigate than if it was caught by the CI.
-- 
pw-bot: cr
