Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBD32D7162
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B4F6ECB3;
	Fri, 11 Dec 2020 08:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1811 seconds by postgrey-1.36 at gabe;
 Thu, 10 Dec 2020 21:04:21 UTC
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4DF6EB57;
 Thu, 10 Dec 2020 21:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=noa+454Phd4GD+cflUApEkbCBzQWdQM9xVdZ/BdtqiE=; b=ommLdATmScZCO3Nr0B0IKtaBD0
 EKrjnXBUtbfueazgUtm6VU6b3S0wYy6KVx4WAtwNJ/AqnjHK72Gy9Jsmxppzw/gnUhc4xUowZeQ7A
 VcHLuqMKttCxw8ez7I7uwmRr5QxGnTAmGxi8uXmfqMPsZhh7JjrJm5C+6KJYTWYREg/IlUxXKnLyU
 oiYCxI5xB8TP98NfY73pg38uPmgt4JkWMiii1mD9wV9ZT2fBKdzZ4FLSmo62RegEoh6XSnUbSd6AH
 TQacvQpLTj7RMyXxinaZaJU5rRKy+bJdREoJnd68m2upWyg2kGwzuZR1wf8InfiqQYZmWP3SPWvYA
 gjpGnwDw==;
Received: from s01060023bee90a7d.cg.shawcable.net ([24.64.145.4]
 helo=[192.168.0.10])
 by ale.deltatee.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <logang@deltatee.com>)
 id 1knSdJ-0002Fm-25; Thu, 10 Dec 2020 13:33:50 -0700
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.255887860@linutronix.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <3526d997-a629-9843-7060-78d9e0a487c5@deltatee.com>
Date: Thu, 10 Dec 2020 13:33:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.255887860@linutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 24.64.145.4
X-SA-Exim-Rcpt-To: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 jgross@suse.com, boris.ostrovsky@oracle.com, leon@kernel.org,
 saeedm@nvidia.com, linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
 kuba@kernel.org, davem@davemloft.net, tariqt@nvidia.com, Zhiqiang.Hou@nxp.com,
 m.karthikeyan@mobiveil.co.in, linux-pci@vger.kernel.org,
 michal.simek@xilinx.com, bhelgaas@google.com, robh@kernel.org,
 lorenzo.pieralisi@arm.com, lee.jones@linaro.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, tvrtko.ursulin@linux.intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 wambui.karugax@gmail.com, chris@chris-wilson.co.uk,
 pankaj.laxminarayan.bharadiya@intel.com, daniel@ffwll.ch, airlied@linux.ie,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 jani.nikula@linux.intel.com, linux-s390@vger.kernel.org, hca@linux.ibm.com,
 borntraeger@de.ibm.com, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux@armlinux.org.uk, linux-parisc@vger.kernel.org, afzal.mohd.ma@gmail.com,
 deller@gmx.de, James.Bottomley@HansenPartnership.com,
 linux-ntb@googlegroups.com, allenbh@gmail.com, dave.jiang@intel.com,
 jdmason@kudzu.us, maz@kernel.org, peterz@infradead.org,
 linux-kernel@vger.kernel.org, tglx@linutronix.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE,NICE_REPLY_A autolearn=ham autolearn_force=no
 version=3.4.2
Subject: Re: [patch 17/30] NTB/msi: Use irq_has_action()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Fri, 11 Dec 2020 08:16:08 +0000
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
 Saeed Mahameed <saeedm@nvidia.com>, netdev@vger.kernel.org,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 linux-s390@vger.kernel.org, afzal mohammed <afzal.mohd.ma@gmail.com>,
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



On 2020-12-10 12:25 p.m., Thomas Gleixner wrote:
> Use the proper core function.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jon Mason <jdmason@kudzu.us>
> Cc: Dave Jiang <dave.jiang@intel.com>
> Cc: Allen Hubbe <allenbh@gmail.com>
> Cc: linux-ntb@googlegroups.com

Looks good to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

> ---
>  drivers/ntb/msi.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> --- a/drivers/ntb/msi.c
> +++ b/drivers/ntb/msi.c
> @@ -282,15 +282,13 @@ int ntbm_msi_request_threaded_irq(struct
>  				  struct ntb_msi_desc *msi_desc)
>  {
>  	struct msi_desc *entry;
> -	struct irq_desc *desc;
>  	int ret;
>  
>  	if (!ntb->msi)
>  		return -EINVAL;
>  
>  	for_each_pci_msi_entry(entry, ntb->pdev) {
> -		desc = irq_to_desc(entry->irq);
> -		if (desc->action)
> +		if (irq_has_action(entry->irq))
>  			continue;
>  
>  		ret = devm_request_threaded_irq(&ntb->dev, entry->irq, handler,
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
