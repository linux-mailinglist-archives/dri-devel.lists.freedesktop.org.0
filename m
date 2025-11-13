Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF35C55EDD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 07:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CCB10E2AA;
	Thu, 13 Nov 2025 06:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="pQvrJLS0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92F110E2AA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1763015585; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=Nm8/08dZj5jahSzMqOZOKZcwHuLbQSEhvJSn1qCuYaw=;
 b=pQvrJLS0F6nLiNE6vAqSz0gQ2B52+cWwdQUqak+VX1CypU4Zg4Om9KXg3T+Qg2NvoQFZl7+CKYhR3qq4A89X2/qwKIrVOSvI19I1IB3UiKWxAANROK0mTIo9fCrJCspInH3qOE9yR8VBGlOzbJ+B8MqO/JcMNsnAc5CxpEwjzTM=
Received: from 30.247.129.79(mailfrom:xueshuai@linux.alibaba.com
 fp:SMTPD_---0WsIgOJQ_1763015582 cluster:ay36) by smtp.aliyun-inc.com;
 Thu, 13 Nov 2025 14:33:04 +0800
Message-ID: <29f0cddc-3c23-4ab1-92d9-8c9918ddc187@linux.alibaba.com>
Date: Thu, 13 Nov 2025 14:33:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Initial DMABUF support for iommufd
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-kselftest@vger.kernel.org, linux-media@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Will Deacon <will@kernel.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Matt Ochs <mochs@nvidia.com>, patches@lists.linux.dev,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Xu Yilun <yilun.xu@linux.intel.com>
References: <0-v1-af84a3ab44f5+f68-iommufd_buf_jgg@nvidia.com>
 <aQ4x7UiMMCB0m0dH@Asurada-Nvidia>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aQ4x7UiMMCB0m0dH@Asurada-Nvidia>
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

Hi, Nicolin

在 2025/11/8 01:52, Nicolin Chen 写道:
> On Fri, Nov 07, 2025 at 12:49:32PM -0400, Jason Gunthorpe wrote:
>> This is on github: https://github.com/jgunthorpe/linux/commits/iommufd_dmabuf
>>
>> v2:
>>   - Rebase on Leon's v7
>>   - Fix mislocking in an iopt_fill_domain() error path
> 
> I have verified this v2 using the branch above, by drafting a QEMU
> patch for dmabuf on top of Shameer's vSMMU v5 series:
> https://github.com/nicolinc/qemu/commits/wip/iommufd_dmabuf/
> 
> With that, I see GPU BAR memory be correctly fetched in the QEMU:
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 0", offset: 0x0, size: 0x1000000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 2", offset: 0x0, size: 0x44f00000
> vfio_region_dmabuf Device 0009:01:00.0, region "0009:01:00.0 BAR 4", offset: 0x0, size: 0x17a0000000
> 
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>

I tested with your QEMU branch and this v2 branch, and observed
the following:

**QEMU successfully maps the BAR regions via dmabuf:**

vfio_region_mmap Region 0008:01:00.0 BAR 0 mmaps[0] [0x0 - 0x3ffffff]
vfio_region_dmabuf Device 0008:01:00.0, region "0008:01:00.0 BAR 0", offset: 0x0, size: 0x4000000
vfio_region_mmap Region 0008:01:00.0 BAR 2 mmaps[0] [0x0 - 0x3fffffffff]
vfio_region_dmabuf Device 0008:01:00.0, region "0008:01:00.0 BAR 2", offset: 0x0, size: 0x4000000000
vfio_region_mmap Region 0008:01:00.0 BAR 4 mmaps[0] [0x0 - 0x2e41efffff]
vfio_region_dmabuf Device 0008:01:00.0, region "0008:01:00.0 BAR 4", offset: 0x0, size: 0x2e41f00000

**IOMMUFD backend successfully maps the DMA regions:**

iommufd_backend_map_file_dma  iommufd=303 ioas=2 iova=0x30000000000 size=0xb90000 fd=306 start=0 readonly=0 (0)
vfio_listener_region_add_ram region_add [ram] 0x30000b91000 - 0x30003ffffff [0xffcae8b91000]
iommufd_backend_map_file_dma  iommufd=303 ioas=2 iova=0x30000b91000 size=0x346f000 fd=306 start=12128256 readonly=0 (0)
vfio_listener_region_add_ram region_add [ram] 0x2c000000000 - 0x2ffffffffff [0xff8ac0000000]
iommufd_backend_map_file_dma  iommufd=303 ioas=2 iova=0x2c000000000 size=0x4000000000 fd=307 start=0 readonly=0 (0)
vfio_listener_region_add_ram region_add [ram] 0x28000000000 - 0x2ae41efffff [0xff5c7e000000]
iommufd_backend_map_file_dma  iommufd=303 ioas=2 iova=0x28000000000 size=0x2e41f00000 fd=308 start=0 readonly=0 (0)

**However, the guest kernel crashes during PCI initialization:**

[    1.422280] acpi PNP0A08:01: ECAM area [mem 0x4010100000-0x40102fffff] reserved by PNP0C02:00^M
[    1.422907] acpi PNP0A08:01: ECAM at [mem 0x4010100000-0x40102fffff] for [bus 01-02]^M
[    1.423541] ------------[ cut here ]------------^M
[    1.423905] kernel BUG at mm/vmalloc.c:109!^M
[    1.424240] Internal error: Oops - BUG: 00000000f2000800 [#1] SMP^M
[    1.424724] Modules linked in:^M
[    1.424972] CPU: 19 PID: 1 Comm: swapper/0 Not tainted 6.6.102-5.100_rc1.1.al8.aarch64+64k #1^M
[    1.425647] Hardware name: QEMU KVM Virtual Machine, BIOS 0.0.0 02/06/2015^M
[    1.426201] pstate: 01401005 (nzcv daif +PAN -UAO -TCO +DIT +SSBS BTYPE=--)^M
[    1.426751] pc : vmap_pte_range+0x158/0x2b8^M
[    1.427101] lr : vmap_pte_range+0x178/0x2b8^M
[    1.427455] sp : ffff800083fcf6d0^M
[    1.427758] x29: ffff800083fcf6d0 x28: 0068000040820713 x27: 0000000000004083^M
[    1.428328] x26: ffff800083fcf7d4 x25: 0068000040820713 x24: 000000000000003f^M
[    1.428895] x23: 0068000000000713 x22: 0010000000000001 x21: ffffffbffe801000^M
[    1.429460] x20: ffffffc000040000 x19: ffff0018f9010020 x18: ffffffffffffffff^M
[    1.430034] x17: 75625b20726f6620 x16: 5d66666666663230 x15: 0000000000000002^M
[    1.430599] x14: 0000000000000000 x13: ffff0000c96ccf36 x12: 75625b20726f6620^M
[    1.431189] x11: 000000000000002e x10: 000003bffe800000 x9 : ffff800080341544^M
[    1.431802] x8 : ffff0000c96b8b80 x7 : ffff0018f9000000 x6 : ffff800083fcf7d4^M
[    1.432376] x5 : 000000000000003f x4 : 0068000000000713 x3 : 0000000000000000^M
[    1.432936] x2 : fffffffffe7d1000 x1 : ffff0031fff81380 x0 : 0000000000000008^M
[    1.433495] Call trace:^M
[    1.433689]  vmap_pte_range+0x158/0x2b8^M
[    1.433996]  vmap_range_noflush+0x19c/0x260^M
[    1.434323]  ioremap_page_range+0x20/0x30^M
[    1.434636]  pci_remap_iospace+0x78/0x90^M
[    1.434960]  acpi_pci_probe_root_resources+0x124/0x260^M
[    1.435378]  pci_acpi_root_prepare_resources+0x20/0xd0^M
[    1.435814]  acpi_pci_root_create+0x94/0x2e8^M
[    1.436154]  pci_acpi_scan_root+0x98/0x130^M
[    1.436474]  acpi_pci_root_add+0x15c/0x2f8^M
[    1.436795]  acpi_bus_attach+0x1bc/0x338^M
[    1.437104]  acpi_dev_for_one_check+0x38/0x48^M
[    1.437444]  device_for_each_child+0x60/0xb8^M
[    1.437799]  acpi_dev_for_each_child+0x40/0x70^M
[    1.438148]  acpi_bus_attach+0x234/0x338^M
[    1.438454]  acpi_dev_for_one_check+0x38/0x48^M
[    1.438796]  device_for_each_child+0x60/0xb8^M
[    1.439148]  acpi_dev_for_each_child+0x40/0x70^M
[    1.439531]  acpi_bus_attach+0x234/0x338^M
[    1.439854]  acpi_bus_scan+0x68/0x208^M
[    1.440142]  acpi_scan_init+0xd0/0x2b8^M
[    1.440445]  acpi_init+0x80/0x140^M
[    1.440704]  do_one_initcall+0x48/0x348^M
[    1.441010]  do_initcalls+0x104/0x200^M
[    1.441305]  kernel_init_freeable+0x128/0x2a0^M
[    1.441645]  kernel_init+0x28/0x1e8^M
[    1.441943]  ret_from_fork+0x10/0x20^M
[    1.442231] Code: 97f3ddf6 aa0003e1 b4fffa41 d503201f (d4210000) ^M

Could you share more details for testing?, e.g. QEMU cmdline,
Guest kernel version.

I'd like to compare with my setup to identify the difference.

Thanks.
Shuai
