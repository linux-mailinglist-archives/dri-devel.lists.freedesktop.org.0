Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8D2F2989
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADAD6E04B;
	Tue, 12 Jan 2021 07:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11389E3F;
 Mon, 11 Jan 2021 10:14:39 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1610360078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vdITQROn2Urg2SWnxxpWECg8/2piMq1rysKQi+Js6AM=;
 b=UnYkeRyOrRU1KtT5e+L+fQ3h1X+pI6IQmvvPVQCyBzb6fOAslMZh9kmf6riX6Uc0jR5HAW
 kLM9jzvLqGc+Imjy/0I2rAsMH2VpuQIdJ98CwfEhcoTYCCXiQ/XwFpRt6Jep7zrPxwT0va
 Xwof1xtTH5Z/PeoiWTuI7XI6GZ2R5aGzpohXNnayNbUAXzj5+Rf7t2lNRSQCuUkrunBvvh
 E6YQGrr8aPBg88a1jm3tkQeNaO9yiXQdYW2cQM+bbmj0FEDrh39+sh5VynpFZhESsKImAx
 DwV8ajINKrlorxI1UlTNWgwAXJMXRe809J7/lTBl2XxW6BUf7G/4P1Qx4lUTcA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1610360078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vdITQROn2Urg2SWnxxpWECg8/2piMq1rysKQi+Js6AM=;
 b=X4gUVuzYQlznnJ4rBpJlj0pVo1A0rJo22Rpjt8+XaTFqV54Id4MU7M5oqDy1KDl8a6a4jG
 +hpoSFj00cPTvyCg==
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [patch 02/30] genirq: Move status flag checks to core
In-Reply-To: <20201227192049.GA195845@roeck-us.net>
References: <20201210192536.118432146@linutronix.de>
 <20201210194042.703779349@linutronix.de>
 <20201227192049.GA195845@roeck-us.net>
Date: Mon, 11 Jan 2021 11:14:38 +0100
Message-ID: <87im837pbl.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Russell King <linux@armlinux.org.uk>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, Will Deacon <will@kernel.org>,
 Helge Deller <deller@gmx.de>, Michal Simek <michal.simek@xilinx.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-pci@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Wambui Karuga <wambui.karugax@gmail.com>,
 Allen Hubbe <allenbh@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Jon Mason <jdmason@kudzu.us>,
 linux-gpio@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, David Airlie <airlied@linux.ie>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Tariq Toukan <tariqt@nvidia.com>,
 Marc Zyngier <maz@kernel.org>, linux-ntb@googlegroups.com,
 Saeed Mahameed <saeedm@nvidia.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Dec 27 2020 at 11:20, Guenter Roeck wrote:
> On Thu, Dec 10, 2020 at 08:25:38PM +0100, Thomas Gleixner wrote:
> Yes, but that means that irq_check_status_bit() may be called from modules,
> but it is not exported, resulting in build errors such as the following.
>
> arm64:allmodconfig:
>
> ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] undefined!

Duh. Yes, that lacks an export obviously.

Thanks,

        tglx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
