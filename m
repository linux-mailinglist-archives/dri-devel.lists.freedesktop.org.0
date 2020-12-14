Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA632DA266
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 22:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99526E17A;
	Mon, 14 Dec 2020 21:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B07D6E17A;
 Mon, 14 Dec 2020 21:13:11 +0000 (UTC)
Message-ID: <0f8eda3bbed1100c1c1f7015dd5c172f8d735c94.camel@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607980391;
 bh=Pzvi/5ISTUEc02BC83hB6nniQmkTHPAhNCBBNcfKAUY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=Ks3P3xnvXkJSp+uh7CcZoik6MJkEKtx2PvE0VYPE/pepC3FjT65YOm45Ebhka542Q
 KDRZnMtG6PVk8azMh03nN0D62HLqcKsXaM3NGfl0cnBfDn4M/eCG3Bapi5UEiWJojE
 Wz5xGjdq/ndTqDY7tNprPuvOQMJrfpTrREHq07hUDedim+JiPcYSm9y/a+CVpdgIGp
 tK5qViUVIaC1nIaet1VMQYFfwNA6Uv7knO5wHsw+J306Af6r5YPeiXS/tptiFYTABJ
 2yXmYvRm101qHL41Iu7+0L42D5JI7GLbb235mT9lCcvuGwm/DUlfBNloCq8GKc5F9/
 KjhGS5BzrCEJg==
Subject: Re: [patch 22/30] net/mlx5: Replace irq_to_desc() abuse
From: Saeed Mahameed <saeed@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Date: Mon, 14 Dec 2020 13:13:07 -0800
In-Reply-To: <20201210194044.769458162@linutronix.de>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.769458162@linutronix.de>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
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
 netdev@vger.kernel.org, Will Deacon <will@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-s390@vger.kernel.org,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 intel-gfx@lists.freedesktop.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2020-12-10 at 20:25 +0100, Thomas Gleixner wrote:
> No driver has any business with the internals of an interrupt
> descriptor. Storing a pointer to it just to use yet another helper at
> the
> actual usage site to retrieve the affinity mask is creative at best.
> Just
> because C does not allow encapsulation does not mean that the kernel
> has no
> limits.
> 

you can't blame the developers for using stuff from include/linux/
Not all developers are the same, and sometime we don't read in between
the lines, you can't assume all driver developers to be expert on irq
APIs disciplines.

your rules must be programmatically expressed, for instance,
you can just hide struct irq_desc and irq_to_desc() in kernel/irq/ and
remove them from include/linux/ header files, if you want privacy in
your subsystem, don't put all your header files on display under
include/linux.


> Retrieve a pointer to the affinity mask itself and use that. It's
> still
> using an interface which is usually not for random drivers, but
> definitely
> less hideous than the previous hack.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>  drivers/net/ethernet/mellanox/mlx5/core/en.h      |    2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c |    6 +-----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en.h
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en.h
> @@ -669,7 +669,7 @@ struct mlx5e_channel {
>  	spinlock_t                 async_icosq_lock;
>  
>  	/* data path - accessed per napi poll */
> -	struct irq_desc *irq_desc;
> +	const struct cpumask	  *aff_mask;
>  	struct mlx5e_ch_stats     *stats;
>  
>  	/* control */
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -1998,7 +1998,7 @@ static int mlx5e_open_channel(struct mlx
>  	c->num_tc   = params->num_tc;
>  	c->xdp      = !!params->xdp_prog;
>  	c->stats    = &priv->channel_stats[ix].ch;
> -	c->irq_desc = irq_to_desc(irq);
> +	c->aff_mask = irq_get_affinity_mask(irq);

as long as the affinity mask pointer stays the same for the lifetime of
the irq vector.

Assuming that:
Acked-by: Saeed Mahameed <saeedm@nvidia.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
