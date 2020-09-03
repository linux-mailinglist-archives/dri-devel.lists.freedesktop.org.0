Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586A25BDCF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 10:50:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510C76E824;
	Thu,  3 Sep 2020 08:50:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727066E107
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 00:36:35 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id q1so596150pjd.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 17:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HGMI5u4+l1Tf8c3EflpFySIPH+tLFZrWho9A072B+v0=;
 b=qgcnAVz2b4GXO/VBcwehnbBCJoiAynRLxeE3+nye4S4BoYiqiqTXyMoS3G6dTjEKQf
 284LZRFd8PY6eYGp7XuTedUOp7736rLJ/+V6O5AktcwvdCP1c39H+PPC99bdJz73T9CF
 1R9ZxkolF4OVEUqGU7omTvZ2PfnI1OB/JFANYAiIHhkJvNZl4bW6LLnpH08Gc3j5kl6o
 DSfSCPldBfiTSR6BnmyRijG0Q90cnMTDeW0Xv0E4ZAuHhneO9TtBoBhMLmuX2g3EQxy+
 6yXIdNa6tIDgHuR/6vSX1krPHhQqIWZtk8NLORXxahxAqxdwk9OJxiYrP+nQqPwDpBgY
 4RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HGMI5u4+l1Tf8c3EflpFySIPH+tLFZrWho9A072B+v0=;
 b=uW0PnQoizyDY4t1/iGsg5aEsyx//mPQsTzyB+ETmplRYRk+brVxhZZnoz0jDhCu0wK
 9uwA8KF17/9qlvzkdXXco+YxGq7fv7a7GCIOR8P1nsdi8HMWAXfiA0JRHvuKikvwBHsq
 041582M8R+Yod3O3jzaXCNZzxtw5G9vO3hJPOLQfAcZG9v2wVh52Ser4XqNOthMmBXlg
 1cNT3RKBWAKWGHW8AafvPytJ6YWtxDVH19QrSF+CQQ6UxwNNq06hilrst//6Vt69UNgC
 Dm2Fv1PVe/F6OhwkG1H8kFNzSPp+sfl/I86RUJNduIje1j4p7IordF6aRcJyqKS//s/M
 9dpA==
X-Gm-Message-State: AOAM531tKpwzmKhEJiPoPAgxKddpXOqLb4T4MlPFAD1uRnUJlUVl0DRD
 Z/dRAmzII7auIZHo4sLfxys=
X-Google-Smtp-Source: ABdhPJzcRRxLsfp4XqFjuW94MrfAQ6bEtGHcjZM+ap6oC7YZYhrZlOWHN8FProfCj+k0eWx0IzfuiA==
X-Received: by 2002:a17:90b:408b:: with SMTP id
 jb11mr389883pjb.164.1599093394840; 
 Wed, 02 Sep 2020 17:36:34 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q127sm740851pfb.61.2020.09.02.17.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 17:36:33 -0700 (PDT)
Subject: Re: [PATCH v11 07/11] device-mapping: Introduce DMA range map,
 supplanting dma_pfn_offset
To: Nathan Chancellor <natechancellor@gmail.com>,
 Jim Quinlan <james.quinlan@broadcom.com>
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <20200824193036.6033-8-james.quinlan@broadcom.com>
 <20200902215314.GA881878@ubuntu-n2-xlarge-x86>
 <CA+-6iNzc38OAL7TGxobpODKXOD1CW-VFNU0rK9Z043QfR3MfsQ@mail.gmail.com>
 <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6922bc0b-1849-2f2f-ec2f-fe9f0124dcfc@gmail.com>
Date: Wed, 2 Sep 2020 17:36:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200902223852.GA1786990@ubuntu-n2-xlarge-x86>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 03 Sep 2020 08:50:07 +0000
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
 "open list:REMOTE PROCESSOR REMOTEPROC SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:ACPI FOR ARM64 ACPI/arm64" <linux-acpi@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>, Len Brown <lenb@kernel.org>,
 Ohad Ben-Cohen <ohad@wizery.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Yong Deng <yong.deng@magewell.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 open list <linux-kernel@vger.kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/2/2020 3:38 PM, Nathan Chancellor wrote:
[snip]
>> Hello Nathan,
>>
>> Can you tell me how much memory your RPI has and if all of it is
> 
> This is the 4GB version.
> 
>> accessible by the PCIe device?  Could you also please include the DTS
>> of the PCIe node?  IIRC, the RPI firmware does some mangling of the
>> PCIe DT before Linux boots -- could you describe what is going on
>> there?
> 
> Unfortunately, I am not familiar with how to get this information. If
> you could provide some instructions for how to do so, I am more than
> happy to. I am not very knowleagable about the inner working of the Pi,
> I mainly use it as a test platform for making sure that LLVM does not
> cause problems on real devices.

Can you bring the dtc application to your Pi root filesystem, and if so, 
can you run the following:

dtc -I fs -O dtb /proc/device-tree -f > /tmp/device.dtb

or cat /sys/firmware/fdt > device.dtb

and attach the resulting file?

> 
>> Finally, can you attach the text of the full boot log?
> 
> I have attached a working and broken boot log. Thank you for the quick
> response!

Is it possible for you to rebuild your kernel with CONFIG_MMC_DEBUG by 
any chance?

I have a suspicion that this part of the DTS for the bcm2711.dtsi 
platform is at fault:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/bcm2711.dtsi#n264

and the resulting dma-ranges parsing is just not working for reasons to 
be determined.
--
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
