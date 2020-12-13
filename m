Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E22D9401
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AFD6E0EA;
	Mon, 14 Dec 2020 08:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D3789C6E;
 Sun, 13 Dec 2020 11:36:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id r5so14131788eda.12;
 Sun, 13 Dec 2020 03:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yO3vpR//yJ3KukN+tPfw/ullrK0O2qQE7kKjDuWCMp8=;
 b=c6i+ahBjD9/Rh0qH45as2/C0d/Lv5nDMeI06jod3TPucN2QtiguKTRZxCznQ+jpaBW
 gvv5i+HN/z0qVNmozmLuRxtFAJ9V7+Ekywb7P9Eyni0NfuaKlPKyK+aL+VAfVSMYk6ET
 IsS0+k2gRUdseUfqRF/UdU5bAlwQl7B5WJwI1REXIqN2aaNIVtttoMQkfvNoRFm/NQ/2
 CwmCf0DUfVLjwlDCo2/HXyzoa2xfU2BeyMBSUUM5MgQ4udzSF7fTqhAJZgUGdY3OmduU
 Wly23cmVni7LPdYQgfxlnoj5hfppXocENHNXxV4IuuZv3YXWmfxmP1sbgWNiQqwcc5pM
 VImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yO3vpR//yJ3KukN+tPfw/ullrK0O2qQE7kKjDuWCMp8=;
 b=hJOqVsi9FOlINwjFM4Q/Ey8KYm6YzO2B+c8dvRkuJ+t+QQd4i+abIel22QFoYvEkeL
 /JePbp4BTcQLGj5v8rwRHSG6EuXMUE1G6bIagkrG+UlzHu0/vzfF/wPeBAOlYpzSEYtu
 LUIEwOwbGA2kP0CLI4E8XGXbHYVigw7Sibhj2/IPOvbuOYPmctim9XeycWgysX8LZpUm
 MF/r7mjeTxQskgZdIY+bYMAfXEuuXGLdoBodP/Pl1z74V/FKo1yTcCQ016K7Jaaac008
 luwbRkQG3ka6NXAhDFi42nFB74oe1/HSWTF3Z8z7to5dI6mR6MsAXu3ENWECAZsYHSGl
 hlzg==
X-Gm-Message-State: AOAM531MOS6gXWQv7MiEzCAaoqKF452GXMgwEaKSLs/AnW+b7kiLd+nV
 zfgip8IrOa7ztmodk1RLVh8=
X-Google-Smtp-Source: ABdhPJzH+/aSvmgK74NOHKHONm6dhSpADhiv/j9gb2Z3Pv7veSPcdPhRE3SKaG8WhajpgAcAsGPlGw==
X-Received: by 2002:a50:a6c9:: with SMTP id f9mr20130904edc.158.1607859364213; 
 Sun, 13 Dec 2020 03:36:04 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id ef11sm11222266ejb.15.2020.12.13.03.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:36:03 -0800 (PST)
Subject: Re: [patch 23/30] net/mlx5: Use effective interrupt affinity
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.876342330@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <f0a01d6e-0333-e929-eabb-28cb444effe0@gmail.com>
Date: Sun, 13 Dec 2020 13:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.876342330@linutronix.de>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 14 Dec 2020 08:17:40 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, intel-gfx@lists.freedesktop.org,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, Will Deacon <will@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jon Mason <jdmason@kudzu.us>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 linux-ntb@googlegroups.com, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/10/2020 9:25 PM, Thomas Gleixner wrote:
> Using the interrupt affinity mask for checking locality is not really
> working well on architectures which support effective affinity masks.
> 
> The affinity mask is either the system wide default or set by user space,
> but the architecture can or even must reduce the mask to the effective set,
> which means that checking the affinity mask itself does not really tell
> about the actual target CPUs.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -1998,7 +1998,7 @@ static int mlx5e_open_channel(struct mlx
>   	c->num_tc   = params->num_tc;
>   	c->xdp      = !!params->xdp_prog;
>   	c->stats    = &priv->channel_stats[ix].ch;
> -	c->aff_mask = irq_get_affinity_mask(irq);
> +	c->aff_mask = irq_get_effective_affinity_mask(irq);
>   	c->lag_port = mlx5e_enumerate_lag_port(priv->mdev, ix);
>   
>   	netif_napi_add(netdev, &c->napi, mlx5e_napi_poll, 64);
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
