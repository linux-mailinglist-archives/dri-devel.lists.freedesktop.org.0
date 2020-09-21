Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D527353A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 23:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058786E598;
	Mon, 21 Sep 2020 21:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84CD66E598
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 21:53:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99CAC147A;
 Mon, 21 Sep 2020 14:53:25 -0700 (PDT)
Received: from [10.57.50.108] (unknown [10.57.50.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBDDA3F73B;
 Mon, 21 Sep 2020 14:53:23 -0700 (PDT)
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
To: Will Deacon <will@kernel.org>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
 <20200921175717.GF3141@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
Date: Mon, 21 Sep 2020 22:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921175717.GF3141@willie-the-truck>
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, narmstrong@baylibre.com, khilman@baylibre.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-21 18:57, Will Deacon wrote:
> On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
>> Midgard GPUs have ACE-Lite master interfaces which allows systems to
>> integrate them in an I/O-coherent manner. It seems that from the GPU's
>> viewpoint, the rest of the system is its outer shareable domain, and so
>> even when snoop signals are wired up, they are only emitted for outer
>> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
>> indeed get coherent pagetable walks working nicely for the coherent
>> T620 in the Arm Juno SoC.
> 
> I can't help but think some of this commentary deserves to be in the code
> as well.

Sure, if you want.

> Do you know if this sort of thing is done for other SoCs too, or is this
> just a Juno quirk?

Yup, this is a "Midgard working as designed" thing. Juno is the coherent 
example I have to hand, but off the top of my head I believe some of the 
Exynos SoCs can also use their GPUs coherently if a switch is flipped in 
the interconnect to change routing between the CCI and a direct-to-RAM 
path; I expect there are probably further Midgard examples that I'm not 
aware of. Then there are definitely coherent Bifrost GPUs like the 
Amlogic S922/A311 that prompted me to revive this patch, which we 
currently drive in "Legacy" mode and thus behave the same way as Midgard 
(Bifrost's "AArch64" mode realigns Ish and Osh with the rest of the 
system, and instead invents a new "Internal Shareable" value in between 
Nsh and Ish to represent the shareability between cores within the GPU 
for which Midgard hijacked Ish).

Robin.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
