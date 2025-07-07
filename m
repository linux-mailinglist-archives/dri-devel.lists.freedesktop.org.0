Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EAAFB3A1
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 14:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35710E16A;
	Mon,  7 Jul 2025 12:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HIF0cr7H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3C410E16A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 12:53:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D77AA53F83;
 Mon,  7 Jul 2025 12:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40CB1C4CEE3;
 Mon,  7 Jul 2025 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751892817;
 bh=0zsqKpFLkYF347gg9OTLh6+35fp5gqeJ2+m+BHifrMQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HIF0cr7HzgvyPWG+D8fDA1gPhCAnxkqTfy4qJPVPcrOKTNs9DIvtfeHsCWT19Gyzs
 eW1O1nTjYUS6rC5OArn1Z3OVAPqaE5GfKiWFsCknewCCCeMNMyvZGdvkahHpbp28Il
 xvY//YUpRNKRZGxtw4Y/x/qV2t+dqE6XVq/V+WDZ4iNTZI0VjpCc2E35vbXlLsvhiK
 +zXvpferAZle6lYYrBPRRFh3L639hm+MhLT7edA3nwjB+VmQwiiw72rmZw3YdzjIbX
 A5J/EpNprXRvKAeuhtOEfJUiROsU2bScq5YMnmsTPyklIhg/KpWtMczFAwyWreAKxW
 osGkmuWcUFrDA==
Message-ID: <4ef523a2-48b3-45e9-94da-7811e1bfae76@kernel.org>
Date: Mon, 7 Jul 2025 14:53:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] agp/amd64: Check AGP Capability before binding to
 unsupported devices
To: Andi Kleen <ak@linux.intel.com>, Lukas Wunner <lukas@wunner.de>
Cc: David Airlie <airlied@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>,
 Ben Hutchings <ben@decadent.org.uk>, Joerg Roedel <joro@8bytes.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ahmed Salem <x0rw3ll@gmail.com>, Borislav Petkov <bp@alien8.de>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 linux-pci@vger.kernel.org
References: <b29e7fbfc6d146f947603d0ebaef44cbd2f0d754.1751468802.git.lukas@wunner.de>
 <aGbaNd3qCK3WvAe-@tassilo>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aGbaNd3qCK3WvAe-@tassilo>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andi,

On 3-Jul-25 21:29, Andi Kleen wrote:
> 
> I suspect these days it would be also reasonable to drop it this old
> hack.
> 
> If any of these old chipsets are still missing I would rather adds its
> PCI-ID.
> 
> There will be certainly not any new unknown ones for these old CPUs.

Right, I plan to submit a patch to disable the probing of unsupported
devices by default. I'll likely even do so today.

But that is not entirely without a risk of regressions and atm this
is causing a regression (breaks flicker free boot) in 6.16-rc# .

So I think we should move forward with Lukas' fix dor 6.16 and then
my patch to disable probing of unsupported devices by default can
be merged into linux-next .

Regards,

Hans

