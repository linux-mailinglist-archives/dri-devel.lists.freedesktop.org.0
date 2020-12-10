Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6C82D6ADA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 23:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCC36EB91;
	Thu, 10 Dec 2020 22:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2246EB8E;
 Thu, 10 Dec 2020 22:57:09 +0000 (UTC)
X-Gm-Message-State: AOAM531wzZ1XhmfyVP9RsfOK4frUz8Ig55UIGYOQJhKwL/8QJg4MvRCC
 xsg3o+aE3+CUkbSiS/5FZOsyO5ohFWFelICDcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607641029;
 bh=CumYBB9xVU4mI+ysFQ9GC3xvipGC4R7OnFI2Gfa5FNQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NX100t6gCQytNa7OiazwnNywlnnE3MGA+EwIsG1KwPo3g9YIMvMkZenkX6DPjonLX
 LgiB+WhmPpHDqq68su5+am2qlFC3dPRt63g4quEmvydBolDCLPaFApKatvOjZ8QpSh
 t8DP63zX380Hmbe21aY/TXXZZVUGRRb9HCRBFVBeJscvK+q7L14Fm/b/rqKNPyMDp7
 LGbf/bPcWcrfMi1ra6Q9AGb5RMSUk/KMDinLe6YXNtA4nslj1hondib08OcOsoqaUl
 R8VDvstTAeLsboQByXDyHliDd1PrRisKjrGFVbj5XTLtWTbNK+FOWwSfjLDaWtlE1h
 FDGHWjLjPHW1g==
X-Google-Smtp-Source: ABdhPJyKMB0fAO5ccR1ON7eKp3wop/g844H0Em6KIAw65vcwOioEZudsqFxyo2xMX2ascC0HxcRxz5ivmcQz5wtwB24=
X-Received: by 2002:a17:906:c20f:: with SMTP id
 d15mr8477099ejz.341.1607641026526; 
 Thu, 10 Dec 2020 14:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.473308721@linutronix.de>
In-Reply-To: <20201210194044.473308721@linutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Dec 2020 16:56:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK4bVyqyT9ip9A5P7gQQwDt1HMksjkCe6bwHrBCGrZYug@mail.gmail.com>
Message-ID: <CAL_JsqK4bVyqyT9ip9A5P7gQQwDt1HMksjkCe6bwHrBCGrZYug@mail.gmail.com>
Subject: Re: [patch 19/30] PCI: mobiveil: Use irq_data_get_irq_chip_data()
To: Thomas Gleixner <tglx@linutronix.de>
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
 Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Saeed Mahameed <saeedm@nvidia.com>, netdev <netdev@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, xen-devel@lists.xenproject.org,
 Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 PCI <linux-pci@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>, Juergen Gross <jgross@suse.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 10, 2020 at 1:42 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Going through a full irq descriptor lookup instead of just using the proper
> helper function which provides direct access is suboptimal.
>
> In fact it _is_ wrong because the chip callback needs to get the chip data
> which is relevant for the chip while using the irq descriptor variant
> returns the irq chip data of the top level chip of a hierarchy. It does not
> matter in this case because the chip is the top level chip, but that
> doesn't make it more correct.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org
> ---
>  drivers/pci/controller/mobiveil/pcie-mobiveil-host.c |    8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
