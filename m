Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5C99D45E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 18:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD610E1DC;
	Mon, 14 Oct 2024 16:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BDUxPsA9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4919410E1DC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 16:12:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 90126A4255D;
 Mon, 14 Oct 2024 16:12:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C84DC4CEC3;
 Mon, 14 Oct 2024 16:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728922340;
 bh=CNQKNS7OhsQgnN3fePRrd6scDroWpGznlODW8JB/rec=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BDUxPsA9L/tXK4xVJHmoEmiHMhF05lzzvEw5BaHrKJidOno/mDRQglK3Fn2YQN5nm
 UaflyB9fO0ZxoswFXKanc+t1PPSOWY66b1WLR0PqOfrae26m5G588HOobH40SM6vIk
 nYZkd+UupLCYD181WsoUU+F2O4sForXKsM1eBJ0p0GxgqgVCB0J2/I996Cuw+8sxn+
 udTz6qtNytrySRZmC5rD4uvIIqIQ3dE2sdUA2KwSHn5UYdwpOBvFGJPpknEKhAIHI1
 6fPU0VL1tvpXVfxSi/akK5wkMypAKPUYcfxmgK6JGobUyibD4B71jKp16DbAlu8IQb
 OJ3hORCcAYxhw==
Message-ID: <4c33a9ad-fbdb-42ca-aff7-e50420c1347e@kernel.org>
Date: Mon, 14 Oct 2024 11:12:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI/VGA: Don't assume only VGA device found is the boot
 VGA device
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Luke D . Jones" <luke@ljones.dev>
References: <20241014152502.1477809-1-superm1@kernel.org>
 <CADnq5_PCHZtmGN4Frknz+10xVMypwpDuW7_kYbTmvihcayCPew@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <CADnq5_PCHZtmGN4Frknz+10xVMypwpDuW7_kYbTmvihcayCPew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 10/14/2024 10:45, Alex Deucher wrote:
> On Mon, Oct 14, 2024 at 11:25 AM Mario Limonciello <superm1@kernel.org> wrote:
>>
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> The ASUS GA605W has a NVIDIA PCI VGA device and an AMD PCI display device.
>>
>> ```
>> 65:00.0 VGA compatible controller: NVIDIA Corporation AD106M [GeForce RTX 4070 Max-Q / Mobile] (rev a1)
>> 66:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Strix [Radeon 880M / 890M] (rev c1)
>> ```
> 
> For clarity, the iGPU is not a VGA class device.  The "primary" should
> not have any dependency on the VGA PCI class, but I'm not sure how
> exactly the kernel handles this case.  In this case, the primary
> should be the iGPU which is not a VGA PCI class device.

I think if this code change to vga_is_boot_device() causes problems for 
anything older we'll probably need to add some helper that counts how 
many PCI VGA class devices are there on the system and change it to 
something like:

if (multiple_vga && !boot_vga)

> 
> Alex
> 
>>
>> The fallback logic in vga_is_boot_device() flags the NVIDIA dGPU as the
>> boot VGA device, but really the eDP is connected to the AMD PCI display
>> device.
>>
>> Drop this case to avoid marking the NVIDIA dGPU as the boot VGA device.
>>
>> Suggested-by: Alex Deucher <alexander.deucher@amd.com>
>> Reported-by: Luke D. Jones <luke@ljones.dev>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3673
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/pci/vgaarb.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
>> index 78748e8d2dba..05ac2b672d4b 100644
>> --- a/drivers/pci/vgaarb.c
>> +++ b/drivers/pci/vgaarb.c
>> @@ -675,13 +675,6 @@ static bool vga_is_boot_device(struct vga_device *vgadev)
>>                  return true;
>>          }
>>
>> -       /*
>> -        * Vgadev has neither IO nor MEM enabled.  If we haven't found any
>> -        * other VGA devices, it is the best candidate so far.
>> -        */
>> -       if (!boot_vga)
>> -               return true;
>> -
>>          return false;
>>   }
>>
>> --
>> 2.43.0
>>

