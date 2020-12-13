Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C852D9404
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 09:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E486E103;
	Mon, 14 Dec 2020 08:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030586E0E7;
 Sun, 13 Dec 2020 11:34:10 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id jx16so18594130ejb.10;
 Sun, 13 Dec 2020 03:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=32JDNSeqhHqyIaOh/qzFvhnj5b/m+w8QZFr6dtEN8Bw=;
 b=dTA8b5OUH5yKZKYvrwD8FPaAH1qo6ziTqTgli2eWV/QQwwjrj5RItxhiVtWCYn5J4r
 iU5u2+H3CEqrvgOG4ifSiMinjtA03OpWth2tg99EZKrbp/XHweTnJDEVAsFXw8BEi/2k
 62/n48qL7LWG8Lg/TWLV8Ekvi2YV2XdqZDT6dMQ7h03xg9aGRIuNRGCnlY5Zc5d3YnN9
 nNHTJNN2xuMH7nQvu9FSiVhtrlE/Mw87dMJ3GteW8ox/7IYneqfAWtuLpskhNM3GN80O
 a83qBHYHs8rA5sz+ldeezNiCzs60YSlz4P6KTdIerqBLo/hvBarQx+UVsAPAPvEcyL2G
 H9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=32JDNSeqhHqyIaOh/qzFvhnj5b/m+w8QZFr6dtEN8Bw=;
 b=Ck0Cn1qqvBjr+N11sftvWCp9BIMwJCdbpZVZz9Z1PefgVc7WMTkxPdMDV4aItIJcVb
 BZXK6XGYAd0YTmKswUIOPGiZxcit+XNdhDUJ/70mT2bz5OT1tg9XgGav3SGqiQzjYgl2
 Ak3Aqa3MIYxWKKS1qopVDn81QHUqgkWXIuA0UrUHWyKDHkOznG3GELZ2a/z5+JH+8TLb
 QIgNVWkEdyDj7HCEWYDK2AR2pI4vlw1WXFhkPq/X0m+8zG8+Ka6mrQtuHiRevc/zZgzD
 LJT92kurTej1HvM/OqaaiTgaqdR0+6nsjS18TpVR75xg9SLb2t2VREBD//+u6DYODPW2
 VLSQ==
X-Gm-Message-State: AOAM531pYDkum6j3ULoeYBtulLA4J5WsRneqtnHqnddfAmUEMbsOuwTq
 2wqpUeoatNJjIaLzN+iNRMc=
X-Google-Smtp-Source: ABdhPJy0f+aRaj1FvtAzME5ZsGleR5z0tMVYyWtlz18MxubIwHyo0udN2mZLmYeJ/0XwIck0k7j0dQ==
X-Received: by 2002:a17:906:85cf:: with SMTP id
 i15mr10621618ejy.373.1607859248729; 
 Sun, 13 Dec 2020 03:34:08 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id r21sm1242331eds.91.2020.12.13.03.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:34:08 -0800 (PST)
Subject: Re: [patch 22/30] net/mlx5: Replace irq_to_desc() abuse
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.769458162@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <02be0e10-f2b5-7cbb-3271-4d872616ffd4@gmail.com>
Date: Sun, 13 Dec 2020 13:34:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.769458162@linutronix.de>
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
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en.h      |    2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c |    6 +-----
>   3 files changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
