Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB8A18C891
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B816EADE;
	Fri, 20 Mar 2020 08:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEEC6EAC1;
 Fri, 20 Mar 2020 07:06:37 +0000 (UTC)
IronPort-SDR: ohF3ns62e8Ewr2Xkt7GANYEJ1kEqzOW2//wFN7hniyX5PH1pI61iD8ftfdXST1hu6xCzMBxIbK
 gnlYTghFxT4A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2020 00:06:36 -0700
IronPort-SDR: qQTFLsdf6C7DljdvIuIQN6Y1afZcxjIFlDqm5oREhf3SQKLv3Q8zMsPRwvvsQ2xfMB1iJdT5ye
 7yUiw7Egm94Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,283,1580803200"; d="scan'208";a="356328149"
Received: from sxu27-mobl2.ccr.corp.intel.com (HELO [10.254.214.109])
 ([10.254.214.109])
 by fmsmga001.fm.intel.com with ESMTP; 20 Mar 2020 00:06:26 -0700
Subject: Re: [PATCH 3/8] iommu/vt-d: Remove IOVA handling code from
 non-dma_ops path
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <20191221150402.13868-4-murphyt7@tcd.ie>
 <CALQxJuuue2MCF+xAAAcWCW=301HHZ9yWBmYV-K-ubCxO4s5eqQ@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <46bf21e2-bb3e-1c1e-8dae-2c5bd8c5274f@linux.intel.com>
Date: Fri, 20 Mar 2020 15:06:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CALQxJuuue2MCF+xAAAcWCW=301HHZ9yWBmYV-K-ubCxO4s5eqQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:25 +0000
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 baolu.lu@linux.intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/3/20 14:30, Tom Murphy wrote:
> Could we merge patch 1-3 from this series? it just cleans up weird
> code and merging these patches will cover some of the work needed to
> move the intel iommu driver to the dma-iommu api in the future.

Can you please take a look at this patch series?

https://lkml.org/lkml/2020/3/13/1162

It probably makes this series easier.

Best regards,
baolu

> 
> On Sat, 21 Dec 2019 at 07:04, Tom Murphy<murphyt7@tcd.ie>  wrote:
>> Remove all IOVA handling code from the non-dma_ops path in the intel
>> iommu driver.
>>
>> There's no need for the non-dma_ops path to keep track of IOVAs. The
>> whole point of the non-dma_ops path is that it allows the IOVAs to be
>> handled separately. The IOVA handling code removed in this patch is
>> pointless.
>>
>> Signed-off-by: Tom Murphy<murphyt7@tcd.ie>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
