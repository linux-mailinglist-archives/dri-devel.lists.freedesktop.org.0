Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61A89E6F2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 02:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805A0113048;
	Wed, 10 Apr 2024 00:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lgDGr5W+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7BB113048
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 00:39:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 62B4A61B19;
 Wed, 10 Apr 2024 00:39:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05537C433F1;
 Wed, 10 Apr 2024 00:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712709591;
 bh=rPIGcmKkaKL77xy0kE1sS+HitVg+d/OiK8zkBdMTGF4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lgDGr5W+S1Mo/vVh51AzT36WYsN43KOdv2HUfV5OeoOGAeleNf+qD1QCKnVmw0f0U
 KO/r9TUZ8143nBmmM0Qm0kfLSuNPR+q603FcX4WKnZ9O2zPhGlRLyZk9ouI3oEE2u+
 xS4V4CtN5844T1z0xi98+DiGzT+tVt6J9U0tn83SkLMJlJBqb8J70g1FlMh3BnZk1t
 PFyuwjn9p18IQ3bR9TgpM4o/aAIY9pOiY2znYey78v9rqgcBeo9vq8WCC/pnMi2gxg
 TMgOlogCc1vvBqYyXQZzoy3ij/wFam0X+B4vIoxFbJH+PSXVmgCcnY4V7cUgtU0Uy/
 ZcEuE+smnLljw==
Date: Tue, 9 Apr 2024 17:39:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Simon Horman <horms@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>, Ratheesh Kannoth <rkannoth@marvell.com>, Naveen
 Mamindlapalli <naveenm@marvell.com>, danishanwar@ti.com,
 yuehaibing@huawei.com, rogerq@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH net-next v8 2/3] net: ethernet: ti: Add desc_infos
 member to struct k3_cppi_desc_pool
Message-ID: <20240409173948.66abe6fa@kernel.org>
In-Reply-To: <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
References: <20240223-am65-cpsw-xdp-basic-v8-0-f3421b58da09@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v8-2-f3421b58da09@baylibre.com>
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

On Mon, 08 Apr 2024 11:38:03 +0200 Julien Panis wrote:
>  		goto gen_pool_create_fail;
>  	}
>  
> +	pool->desc_infos = kcalloc(pool->num_desc,
> +				   sizeof(*pool->desc_infos), GFP_KERNEL);
> +	if (!pool->desc_infos) {
> +		ret = -ENOMEM;
> +		dev_err(pool->dev,
> +			"pool descriptor infos alloc failed %d\n", ret);

Please don't add errors on mem alloc failures. They just bloat the
kernel, there will be a rather large OOM splat in the logs if GFP_KERNEL
allocation fails.

> +		kfree_const(pool_name);
> +		goto gen_pool_desc_infos_alloc_fail;
> +	}
> +
>  	pool->gen_pool->name = pool_name;

If you add the new allocation after this line, I think you wouldn't
have to free pool_name under the if () explicitly.
-- 
pw-bot: cr
