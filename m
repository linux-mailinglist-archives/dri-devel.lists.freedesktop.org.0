Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0B93BDA5C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 17:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470F6E0C5;
	Tue,  6 Jul 2021 15:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8EE06E0C5;
 Tue,  6 Jul 2021 15:39:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04E3106F;
 Tue,  6 Jul 2021 08:39:26 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 793C53F73B;
 Tue,  6 Jul 2021 08:39:19 -0700 (PDT)
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Christoph Hellwig <hch@lst.de>
References: <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck> <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
Date: Tue, 6 Jul 2021 16:39:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706140513.GA26498@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 xypron.glpk@gmx.de, Tom Lendacky <thomas.lendacky@amd.com>,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-06 15:05, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
>> FWIW I was pondering the question of whether to do something along those
>> lines or just scrap the default assignment entirely, so since I hadn't got
>> round to saying that I've gone ahead and hacked up the alternative
>> (similarly untested) for comparison :)
>>
>> TBH I'm still not sure which one I prefer...
> 
> Claire did implement something like your suggestion originally, but
> I don't really like it as it doesn't scale for adding multiple global
> pools, e.g. for the 64-bit addressable one for the various encrypted
> secure guest schemes.

Ah yes, that had slipped my mind, and it's a fair point indeed. Since 
we're not concerned with a minimal fix for backports anyway I'm more 
than happy to focus on Will's approach. Another thing is that that looks 
to take us a quiet step closer to the possibility of dynamically 
resizing a SWIOTLB pool, which is something that some of the hypervisor 
protection schemes looking to build on top of this series may want to 
explore at some point.

Robin.
