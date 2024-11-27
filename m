Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEEC9DA71F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 12:49:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D785910E233;
	Wed, 27 Nov 2024 11:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="h9rQkJwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3340710E233
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 11:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732708185; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AR72L5IgYTGl7uCdqoD4e1qTcvQWRmSA9iTZuG+0l0rJJ0KNDB7gB9ChG87qinuYyQZspse5Mjx1B7wbftI0sC4gakzsJRfJVoC5r9yVs8hotaxP6/tIyljwmsZoqXqWxukm+OlCO9+27pCPL1+jtaLEUyXqUm6Z4QpsrFApZK0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732708185;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=upzdM1GFTUfMKKjxZsoEPeNZkHJirkc0OuGxxjm7FAU=; 
 b=kk/9iEkDZTTLqnmKPaSUXeA8fddfNQvkiO4yE/Cm8+xKMhVygJMcKkbJVOyKYUmgMdKb2sgtTezbVyk11xu2wNH9GleXmR31Zi1uwCSvSZemfJdRRp1dv1QfnJOvmz+1UnqIhlsIX4/Dcwy0K+KA0lJPZTjNuRutKc26fofeXus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732708185; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=upzdM1GFTUfMKKjxZsoEPeNZkHJirkc0OuGxxjm7FAU=;
 b=h9rQkJwC6L4o8lxC9AGik/GODrySBbjBqXVcslPDIJjD0FWJDaDBwKpe/40IZfdI
 5xYzBs4yN/VDDvjVIB83Yooj3+ZXERD34atVMmg6RVVOFjW7tYxGnDnj4UASO2d4Ms+
 Ie6VfBc2HRO4lxNZYGuPj+bLmqgYtla2l3gw04Hc=
Received: by mx.zohomail.com with SMTPS id 1732708183184182.55659774222272;
 Wed, 27 Nov 2024 03:49:43 -0800 (PST)
Message-ID: <34ba6dd1-a5a7-4d0e-b3d4-c30c61710137@collabora.com>
Date: Wed, 27 Nov 2024 14:49:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] drm/virtio: Add a helper to map and note the dma
 addrs and lengths
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Rob Clark <robdclark@gmail.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241125073313.3361612-1-vivek.kasireddy@intel.com>
 <20241125073313.3361612-3-vivek.kasireddy@intel.com>
 <a10f9b16-9cbf-4e51-a4ce-a408f792cafc@collabora.com>
 <IA0PR11MB7185AD723F92BAECA4D56E2CF82F2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <250c5b23-86b7-418d-a2df-fd7f1aff63de@collabora.com>
 <IA0PR11MB718536D3A822E95550426917F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <IA0PR11MB718536D3A822E95550426917F8282@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/27/24 09:20, Kasireddy, Vivek wrote:
...
>> Recap of the DG2 problem:
>>
>> The virtio-gpu PCIe accesses in guest are becoming rejected as soon as Intel
>> driver (either i915 or Xe) is probed. My theory is that Intel driver causes PCIe
>> config change that indirectly breaks virtio-gpu PCIe. This problem isn't
>> observed by swapping DG2 card with AMD card. AMD setup works perfectly
>> fine on the same machine with GPU card plugged into the same PCIe slot as
>> DG2 was on host.
>>
>> $ lspci | grep DG2
>> 0c:00.0 VGA compatible controller: Intel Corporation DG2 [Arc A750] (rev 08)
>> 0d:00.0 Audio device: Intel Corporation DG2 Audio Controller
> Looks like the GPU and the audio devices are on different buses (I see the same
> in my setup as well) but you are making them appear as different functions of
> the same device in Guest VM:
> 01:00.0 VGA compatible controller [0300]: Intel Corporation DG2 [Intel Graphics] [8086:56bd] (rev 05) (prog-if 00 [VGA controller])
>         Subsystem: Intel Corporation Device [8086:1211]
>         Physical Slot: 0
>         Kernel driver in use: i915
>         Kernel modules: i915, xe
> 01:00.1 Audio device [0403]: Intel Corporation DG2 Audio Controller [8086:4f92]
>         Subsystem: Intel Corporation Device [8086:1211]
>         Physical Slot: 0
> 
> I am not sure if this a valid config or not. Regardless, the presence of i915 preventing
> virtio-gpu from probing correctly in this situation is indeed a problem that I am able
> to see in my setup as well (with your Qemu parameters, especially the pcie-port ones).
> I'll definitely take a look at this issue next week. 

Great, thank you

>> qemu-system-x86_64 \
>> -kernel linux-guest/arch/x86_64/boot/bzImage \
>> -append "console=ttyS0 nokaslr root=/dev/sda init=/lib/systemd/systemd
>> vt.global_cursor_default=0 log_buf_len=16M" \
>> -netdev user,id=u1,hostfwd=tcp::10022-:22 \
>> -device virtio-net-pci,netdev=u1 \
>> -serial mon:stdio -m 24G \
>> --enable-kvm \
>> -cpu host,host-phys-bits=on,host-phys-bits-limit=39 \
>> -device virtio-vga,max_outputs=1,xres=1920,yres=1080,blob=true \
>> -device virtio-tablet-pci \
>> -device virtio-balloon \
>> -device virtio-keyboard-pci \
>> -display gtk,gl=on \
>> -smp 16 \
>> -machine q35,accel=kvm,kernel-irqchip=split,memory-backend=mem1 \
>> -object memory-backend-memfd,id=mem1,size=24G \
>> -d guest_errors \
>> -drive file=disk.img,format=raw \
>> -device pcie-root-
>> port,id=pcie.1,bus=pcie.0,addr=1c.0,slot=1,chassis=1,multifunction=on \
>> -device vfio-pci,host=0c:00.0,bus=pcie.1,addr=00.0,x-
>> vga=on,multifunction=on \
>> -device vfio-pci,host=0d:00.0,bus=pcie.1,addr=00.1
> Passthrough'ng the devices directly instead of creating a new pcie root port
> enables virtio-gpu to work correctly in my setup. That is, having just
> -device vfio-pci,host=0c:00.0,x-vga=on -device vfio-pci,host=0d:00.0
> 
> instead of the last few lines in your Qemu parameters list makes virtio-gpu
> to work as expected. Could you please try it out and let me know if it works?

Indeed, that worked! With AMD card all GPU devices are on the same bus
and I was re-using same QEMU command without noticing it. Good catch :)

-- 
Best regards,
Dmitry
