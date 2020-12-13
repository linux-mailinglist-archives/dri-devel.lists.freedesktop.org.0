Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F2E2D940A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9CD6E0E6;
	Mon, 14 Dec 2020 08:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5D89EBB;
 Sun, 13 Dec 2020 11:24:10 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id d17so18599254ejy.9;
 Sun, 13 Dec 2020 03:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IW66fMc7VTs1PtxS+22ry7ms1/9mizOXCdVTfKV5hpo=;
 b=bQn+oB1JoyeFOF0nG/mlAluMS+9oNaqRxA17ZBM9Oe3AOE8/JG6goH/EB1c4QkEda4
 T1lTzWqlfslNfkdjp202c07yMWPNGbIBbpqQZ+AzfJmqs+Kgj+dLxGZ+wWZGA5mc0NdB
 BijFlgEZnvzEJb3MGQPxQa2/dgeJuYhDvxuwz6QAxAIoRHfwl22d5quEoZXOhJp6a+qE
 ETivnglunAiRLTbK3ng7taHfwUqrNTJL3Mef8dDWPaAGgN2enm8bDppfomcBBDdM6fOw
 jt/C5/9LwS2YQBDgMwgsJ0z4C3ZaAE2+qiQJ4375nfTotPFrKA5zulfu7Q8I9D/Awk7+
 1yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IW66fMc7VTs1PtxS+22ry7ms1/9mizOXCdVTfKV5hpo=;
 b=VI6IP7jIA2WMmFtaLs+M1xo66x5vorYmtKZy01oO38MLJt9I1yKfAcZEPKnlVYY8US
 Gah5ohuzQHXYPTg9wizi3O+XadDUFtfw1vBZcvbCXyU4mij0FgPMgNZe7VkVGbGCd4LX
 mItg3u+95nE/jSh5y9eItZz3vD8cjbtFEgB2MxbR5/6woXlqlbqlLe0U1W1QXdWkbEV5
 sjAIDuOt1XwkOqIMJ+cwEnwEri3brTaSdCICtOdXU9yVpKyL/pOQg58N9G4ekkqWeHT4
 eeO/vjoSaBEJHy8nmU+NoTTRro42S71n2HtigMgfE19O1SY7t8+ChUwQ9526bEIyzMuW
 Kl3g==
X-Gm-Message-State: AOAM531P1VPLj1qjn/u3k7w8Yl83OEezUwhORsEtYnWAiBVwEbqxuwq7
 tq9SKjyzDgXysu4XPoTesc4=
X-Google-Smtp-Source: ABdhPJynlxi2QKNBVsllMFmw4nuD/o/QttB0CiO5OzyzZ7oeGscU5QYtBXumKqp3eM2r1PK4665luQ==
X-Received: by 2002:a17:906:a2d0:: with SMTP id
 by16mr18015254ejb.207.1607858649230; 
 Sun, 13 Dec 2020 03:24:09 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id de12sm12533753edb.82.2020.12.13.03.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:24:08 -0800 (PST)
Subject: Re: [patch 20/30] net/mlx4: Replace irq_to_desc() abuse
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.580936243@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <01e427f9-7238-d6a8-25ec-8585914d32df@gmail.com>
Date: Sun, 13 Dec 2020 13:24:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.580936243@linutronix.de>
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
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, intel-gfx@lists.freedesktop.org,
 Wambui Karuga <wambui.karugax@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Juergen Gross <jgross@suse.com>,
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
> No driver has any business with the internals of an interrupt
> descriptor. Storing a pointer to it just to use yet another helper at the
> actual usage site to retrieve the affinity mask is creative at best. Just
> because C does not allow encapsulation does not mean that the kernel has no
> limits.
> 
> Retrieve a pointer to the affinity mask itself and use that. It's still
> using an interface which is usually not for random drivers, but definitely
> less hideous than the previous hack.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>   drivers/net/ethernet/mellanox/mlx4/en_cq.c   |    8 +++-----
>   drivers/net/ethernet/mellanox/mlx4/en_rx.c   |    6 +-----
>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |    3 ++-
>   3 files changed, 6 insertions(+), 11 deletions(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks for your patch.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
