Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A321B42E60
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 02:48:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21F610E220;
	Thu,  4 Sep 2025 00:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f4a+Hk3X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC29410E220
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 00:48:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9AA3944A9D;
 Thu,  4 Sep 2025 00:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F46C4CEE7;
 Thu,  4 Sep 2025 00:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756946929;
 bh=/eZokcjTYsgn7x3TN1nV0vQhMpWaAhi7YQj4lS/oW5w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f4a+Hk3XTjiN/mfxv9pyjGmIzHB8EyWE1g9mMRhBYpyErEFM2eLS2RLCNLZ9m+flb
 usBL3tioZb1jmbnGl2cnprJzZgY+7pXdM1pTdJM/l7LSADXMr8lVMlXEjMiGbORW+l
 ylL1uOUITFWfR5Vf2cQlWFj287PPpY3SnuOoIUMARaFXEEbDEiJfG2mlCm55uL15H7
 EeIpGd0/dS2PeLYfhNQl8FVow1ttEyNVHftFywOVWIkdDwukIuF755hy2naOdqX4iN
 mT+GB2IWk5KvmNBlsutFJjAZgnVXN8wIkBAU7y8uonErOB31WtsIKKO8H9zXSHUUsF
 U/aLizS4FgT5Q==
Date: Wed, 3 Sep 2025 17:48:47 -0700
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
Subject: Re: [PATCH net-next v2 1/6] net: ti: icssg-prueth: Add functions to
 create and destroy Rx/Tx queues
Message-ID: <20250903174847.5d8d1c9f@kernel.org>
In-Reply-To: <20250901100227.1150567-2-m-malladi@ti.com>
References: <20250901100227.1150567-1-m-malladi@ti.com>
 <20250901100227.1150567-2-m-malladi@ti.com>
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

On Mon, 1 Sep 2025 15:32:22 +0530 Meghana Malladi wrote:
>  	if (!emac->xdpi.prog && !prog)
>  		return 0;
>  
> -	WRITE_ONCE(emac->xdp_prog, prog);
> +	if (netif_running(emac->ndev)) {
> +		prueth_destroy_txq(emac);
> +		prueth_destroy_rxq(emac);
> +	}
> +
> +	old_prog = xchg(&emac->xdp_prog, prog);
> +	if (old_prog)
> +		bpf_prog_put(old_prog);
> +
> +	if (netif_running(emac->ndev)) {
> +		ret = prueth_create_rxq(emac);

shutting the device down and freeing all rx memory for reconfig is not
okay. If the system is low on memory the Rx buffer allocations may fail
and system may drop off the network. You must either pre-allocate or
avoid freeing the memory, and just restart the queues.

> +		if (ret) {
> +			netdev_err(emac->ndev, "Failed to create RX queue: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = prueth_create_txq(emac);
> +		if (ret) {
> +			netdev_err(emac->ndev, "Failed to create TX queue: %d\n", ret);
> +			prueth_destroy_rxq(emac);
> +			emac->xdp_prog = NULL;
> +			return ret;
> +		}
> +	}
>  
>  	xdp_attachment_setup(&emac->xdpi, bpf);
