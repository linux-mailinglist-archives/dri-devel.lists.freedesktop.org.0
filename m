Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA814B49C6A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:52:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D8410E5F5;
	Mon,  8 Sep 2025 21:52:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H6u59PSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A65810E5F4;
 Mon,  8 Sep 2025 21:52:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1803340015;
 Mon,  8 Sep 2025 21:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F265BC4CEF1;
 Mon,  8 Sep 2025 21:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757368356;
 bh=UjtDIvZYjEWZH3kRKI9614LSSjakj2QKhQXXNwaBl8E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H6u59PSMlbvOILddp3WNHEOz866E9hf3I8aIPPd/b3tAl9UOaJ9JqB9nXZmNPWEyC
 ZBfwsiyRjOL2HFWv/wd4w7kdVGXizhaEUVFi3xTW22Pm2gm5qTyPKy3Ghmx3KmFl1Z
 mGvtUlmCct7ht3TYjNYWupt4vz5mkafScBDxTZQRfU6aPm65zbqHL5ZZi1ZUZooYzL
 RWa7RoSe2SVBeEuWpMK5o72EPxJPrCc67Qd+LhJrKVHtB+CqoD1OOt7st7hAN5+4kR
 h6j55QnMspz2Pk83fm0TsoRwvGdPH2oPQ4Vh4UtwdtgH6+2huzP5yFbtNTWBho5EWO
 wYx3jQwCsiFHQ==
Message-ID: <f33c93cd-92c6-49c9-aa83-9f46841c5879@kernel.org>
Date: Mon, 8 Sep 2025 16:52:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/11] PCI: Put PCIe bridges with downstream devices
 into D3 at hibernate
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>, Denis Benato <benato.denis96@gmail.com>
References: <20250908215031.GA1467002@bhelgaas>
Content-Language: en-US
From: "Mario Limonciello (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20250908215031.GA1467002@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 9/8/2025 4:50 PM, Bjorn Helgaas wrote:
> On Sun, Aug 17, 2025 at 09:00:59PM -0500, Mario Limonciello (AMD) wrote:
>> For the suspend flow PCIe bridges that have downstream devices are put into
>> the appropriate low power state (D3hot or D3cold depending upon specific
>> devices). For the hibernate flow, PCIe bridges with downstream devices
>> stay in D0 however. This can lead to PCIe bridges that are remained
>> powered on needlessly during hibernate.
> 
> s/are remained/remain/ I guess?

Yeah, I'll adjust.

> 
>> Adjust the pci_pm_poweroff_noirq() to follow the same flow as
>> pci_pm_suspend_noirq() by using pci_pm_suspend_noirq_common().
>>
>> This introduces a functional change that the hibernate flow will now
>> call pci_save_state() and unless bus PM is skipped will also set
>> the PCIe device into an unknown state.

