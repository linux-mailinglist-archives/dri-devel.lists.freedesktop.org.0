Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD25EA07870
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D0610EDF2;
	Thu,  9 Jan 2025 14:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="LmXoI9hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6E310EDF2
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:02:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1736431345; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TOFnev0WThB3dyEh5rcsZCA3lEWnoTEjy873Ln87SnyJXaKTHdXDI4kd32MyY2sMQ1WWWp+qWaAbCB777bKsL+N9lBeuvIMvU3zZFaJ/+FQhd2YiEF+71Dce0TQV5TYeATWciVG4yA61uj7im+7y2YFG6bAavhWfjdbyftBQ8Zk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1736431345;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=AqPozMgSjVLH6AP3cmrFNm9qZULhDayJVAbCvTXanxM=; 
 b=kbTHLTHcsdcwxb1oHLtLziVp2JYaBZQp+4CcXc+2HVLbNx8tvuhYBzXxQ/rivvrbht8X6HXhzs8Zp9DpTWhpjMWK2gi+dXMzHeXyT4ts/LXv0FQ1C6TP9EtrfNSP4vawKTSLd814TOvnOdKLa8i7b4WLIIspawKTf0/+aEdLElg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736431345; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=AqPozMgSjVLH6AP3cmrFNm9qZULhDayJVAbCvTXanxM=;
 b=LmXoI9hbNNCQSYeAKSCSNnXX1Ta1uVYpEopaIoiy67xYeNXryuwktdVxeBTWWu6j
 nOOPTum9mUEHxM9fQhdYymQD6NCtsN5HrS2QRsEHJ/6JtoS3fH1AsEbk2jhWNFwKLkW
 TIR7zPq4gtx+nD60ByCLmXNgNOz9ZpuW3OjE6Ct0=
Received: by mx.zohomail.com with SMTPS id 173643134344060.2223029841831;
 Thu, 9 Jan 2025 06:02:23 -0800 (PST)
Message-ID: <f9cc3954-1f47-40c5-ae7e-7e2c6891d1a7@collabora.com>
Date: Thu, 9 Jan 2025 17:02:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtio: Lock the VGA resources during initialization
To: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>
References: <20241211064343.550153-1-vivek.kasireddy@intel.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20241211064343.550153-1-vivek.kasireddy@intel.com>
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

On 12/11/24 09:43, Vivek Kasireddy wrote:
> If another driver for a VGA compatible GPU (that is passthrough'd)
> locks the VGA resources (by calling vga_get()), then virtio_gpu
> driver would encounter the following errors and fail to load during
> probe and initialization:
> 
> Invalid read at addr 0x7200005014, size 1, region '(null)', reason: rejected
> Invalid write at addr 0x7200005014, size 1, region '(null)', reason: rejected
> virtio_gpu virtio0: virtio: device uses modern interface but does not have VIRTIO_F_VERSION_1
> virtio_gpu virtio0: probe with driver virtio_gpu failed with error -22
> 
> This issue is only seen if virtio-gpu and the other GPU are on
> different PCI buses, which can happen if the user includes an
> additional PCIe port and associates the VGA compatible GPU with
> it while launching Qemu:
> qemu-system-x86_64...
> -device virtio-vga,max_outputs=1,xres=1920,yres=1080,blob=true
> -device pcie-root-port,id=pcie.1,bus=pcie.0,addr=1c.0,slot=1,chassis=1,multifunction=on
> -device vfio-pci,host=03:00.0,bus=pcie.1,addr=00.0 ...
> 
> In the above example, the device 03:00.0 is an Intel DG2 card and
> this issue is seen when both i915 driver and virtio_gpu driver are
> loading (or initializing) concurrently or when i915 is loaded first.
> Note that during initalization, i915 driver does the following in
> intel_vga_reset_io_mem():
> vga_get_uninterruptible(pdev, VGA_RSRC_LEGACY_IO);
> outb(inb(VGA_MIS_R), VGA_MIS_W);
> vga_put(pdev, VGA_RSRC_LEGACY_IO);
> 
> Although, virtio-gpu might own the VGA resources initially, the
> above call (in i915) to vga_get_uninterruptible() would result in
> these resources being taken away, which means that virtio-gpu would
> not be able to decode VGA anymore. This happens in __vga_tryget()
> when it calls
> pci_set_vga_state(conflict->pdev, false, pci_bits, flags);
> where
> pci_bits = PCI_COMMAND_MEMORY | PCI_COMMAND_IO
> flags = PCI_VGA_STATE_CHANGE_DECODES | PCI_VGA_STATE_CHANGE_BRIDGE
> 
> Therefore, to solve this issue, virtio-gpu driver needs to call
> vga_get() whenever it needs to reclaim and access VGA resources,
> which is during initial probe and setup. After that, a call to
> vga_put() would release the lock to allow other VGA compatible
> devices to access these shared VGA resources.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Gurchetan Singh <gurchetansingh@chromium.org>
> Cc: Chia-I Wu <olvaffe@gmail.com>
> Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_drv.c | 40 +++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)

That fixed the problem, thanks! Applied to misc-next.

-- 
Best regards,
Dmitry
