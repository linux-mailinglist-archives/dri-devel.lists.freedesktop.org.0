Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D071CE0A6
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 18:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77636E507;
	Mon, 11 May 2020 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93C6F6E506;
 Mon, 11 May 2020 16:37:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnWlkfYLQWlbeGl0pMMFKHh756s5tngp10DWYt/iUlt0zJqVYOJ011oqjnY91L/MIeDFzaYuk6jL7fQh1oaFa66Zqky85Oua11wfokytNGKvp2yJeuP3Tagxf+ppPnShylAaDZ7NpitbwcAqFnVGUxKYhvZSokA0F3UAlif73auCyP8YBd8T+BQaTPwSdkYqy6sru0KAwDyQlKxeHfPpaYveSuGNw5Q0KiOOxJ/cYg6ao9SE+9wZkEjgPldMvr9+K5d+MYVlJxzx6zRH8MvEWbmchLGBd/aNtVNkXs7sDB0n14wozdbmMPpbzEKBdVwN7op7KADDNWrdWzHW+sjQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jShbg9DxL0NQNKeKtDBah76O2Vl/LheV099i2fLR0s8=;
 b=oSonHdknoXdcWMCUvx5EweLPa3fKAVfcw1PeX9VRjhPkD4VmET4U3vak3F7azbitIfzbVnjK0fbf6z0Fo5day/C8r+45RwrMJfCZJuO2zoLOjBS+aPAprUdiiQxRlC+PiLxSlwuauQvlnirHjyc852R4Z46U7Pyxo1RKnovLMNIFayaQ4hzFgMkWB6j/zRICoDMVT/JXxk0hiJOTs54QAssTr/YbQM4Mmjdl8iMNMA/PCpAwzf30vovgfdlpQsX85xePCmcbTGQ0SgPoVhVxrKPyye5E69CA2tm7Ole9JMLXwP72tGhw3B5DcfinC+PQEKKl2pZaAkCsm4b3bOS7jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jShbg9DxL0NQNKeKtDBah76O2Vl/LheV099i2fLR0s8=;
 b=oj4UUeAK7LdQNYQ4vCT5YZJnJxHdGSZd7Io11pki0MnqiDZ55uX43m5w9maGBnO91/6PhtwT9PrlFc2TjehHQjLQVhNE2mpRVPMuUEaTvNteh46z9LU2TIGpjLRojLBBrdIgE7+8kPfTKZIAE+0iDGv+nfJZOIEp/w9qxqhlNks=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4340.namprd12.prod.outlook.com (2603:10b6:5:2a8::7) by
 DM6PR12MB3034.namprd12.prod.outlook.com (2603:10b6:5:3e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.29; Mon, 11 May 2020 16:37:43 +0000
Received: from DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df]) by DM6PR12MB4340.namprd12.prod.outlook.com
 ([fe80::943d:4dcf:f18e:5df%2]) with mapi id 15.20.2979.033; Mon, 11 May 2020
 16:37:43 +0000
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511122600.0adb4494@eldfell.localdomain>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <cfbcc3b6-a680-8087-2c95-0c70b328be9b@amd.com>
Date: Mon, 11 May 2020 12:37:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <20200511122600.0adb4494@eldfell.localdomain>
Content-Language: en-US
X-ClientProxiedBy: BN6PR1101CA0024.namprd11.prod.outlook.com
 (2603:10b6:405:4a::34) To DM6PR12MB4340.namprd12.prod.outlook.com
 (2603:10b6:5:2a8::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3ee0:2de:518e:c2b6:c65f:3122]
 (2607:fea8:3ee0:2de:518e:c2b6:c65f:3122) by
 BN6PR1101CA0024.namprd11.prod.outlook.com (2603:10b6:405:4a::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Mon, 11 May 2020 16:37:42 +0000
X-Originating-IP: [2607:fea8:3ee0:2de:518e:c2b6:c65f:3122]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 11069a70-37e3-40c7-f622-08d7f5c9a0b6
X-MS-TrafficTypeDiagnostic: DM6PR12MB3034:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3034B39C3FFC6AE1A4FD7663EAA10@DM6PR12MB3034.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p9sMRf3lHdITgKeUVkeQfS14Q4FDtXeNL3IGyerGP7+Ez3qTPAZtWvZ3E/tLm8Z55NrNUbZ3lUP99fu36xekHdgw4b6R3ge2LE92ETGtADHo0cGUoeaPzK6/4Mk7qMZfkrpk+XOH17oxRCxm3Owi7rtY/3EmGPsc4oqex+MbwnGbhdsa9u/uiQb7BusT9ZK9gYMy0+QEU7GMCOpQBDpvM0nMk4864Nk0/6X2oGubAFdm1uTp8m55sQQ+0PICgip/QGXKbBI0ukXg0deS/kkA6Ylqizy/Gh1ou/lW2ssHul8BkRlJq2IHz5+HNORCm1bD8vlJgUxdr10rpU9ATKv5Q3Zf13Aw745SVi9IMd5GZzZRXNAu3eLWZTsUOREHqzuEGqour0amtFdxoJT0j8w/LnVmvDOQdQJHeLHOBtIpj0ELVEy1iYASuJQK1TFV2rL4m2VFFMwvxj/e2CPbly0+Yc3QJL2i1TGIkGcOJJflc/Rlo5P0DVkjmggL+ikqYNm9WQCX/yelJMSaAhRl/u0Pb7MJ/cm3nmgz5bTxQrnMTSGAmoPtMnQ+o9PO3i1K/6wlxbZf4hi3T7Gz1HwoNwLIPGAvbOZQYgutbmZRbqgR7Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4340.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(33430700001)(4326008)(186003)(16526019)(53546011)(2906002)(2616005)(36756003)(166002)(33440700001)(8676002)(5660300002)(316002)(6486002)(52116002)(66476007)(66556008)(966005)(478600001)(6916009)(30864003)(66946007)(31686004)(31696002)(45080400002)(86362001)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rYxll+kYoyRYLH8GtNaAnRcfYN6yHQLz8fPMXFPA50hwBNGc1kDfbHbCI3tFsOPlfbnYVdYW7Eap9oHE2RY6IsyYr0xtnwGOshNluWtJywYCJ/LRg6N2fRgdOkVcTMWjS1twmAlXk3+vou+XTjDnAppyeUY9xrniPO7bhSlC6GZmoVO0AncWhTaQfSbrh0K3dxQFqXA70K4fGVc9qg9xwySvnkKS/mW/vGvrOZYoyCoEZF73DrwK1HoNbXnNZ8UtD06tDP1jMysiX6NDhwzfilCekVnqvL1mcUFkwXfwitvh0sOMnY1cr4H+r+ApmEa2vgxtMPTF3dHAA3AhuNssztAm8zvYGe9Twp7ziBwq3wERPg13s7WTOvxsyFxqQH1j7paA7/GzWze8+gj1NL2qQc9cZijCXzEFF1I44oledQDXhAjHjwF6R4R7A8QrHYtQupCQ7lif6vutmLeuXdhdDPbPNEuhx9ZXP2TLWV1CmFc5PK2+JzhwWVjL4oWeXdDSzp2xfjjaHiMgbzdxgCZ8lraUvBx3wez0KmMJgZmmNSQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11069a70-37e3-40c7-f622-08d7f5c9a0b6
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 16:37:43.1712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOmkS/fY0B/D5YPg9ceDUqYt4n9lAKolG00soAmrYEVqZjIFw4KJTfmL2ggEbnYJuGXUQt8C494QXNUzAQviEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3034
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ckoenig.leichtzumerken@gmail.com
Content-Type: multipart/mixed; boundary="===============0147255197=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0147255197==
Content-Type: multipart/alternative;
 boundary="------------8500007F3D27C20DBDE023C8"
Content-Language: en-US

--------------8500007F3D27C20DBDE023C8
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 5/11/20 5:26 AM, Pekka Paalanen wrote:
> On Sat, 9 May 2020 14:51:44 -0400
> Andrey Grodzovsky <andrey.grodzovsky@amd.com> wrote:
>
>> This RFC is a more of a proof of concept then a fully working
>> solution as there are a few unresolved issues we are hopping to get
>> advise on from people on the mailing list. Until now extracting a
>> card either by physical extraction (e.g. eGPU with thunderbold
>> connection or by emulation through syfs
>> -> /sys/bus/pci/devices/device_id/remove) would cause random crashes
>> in user apps. The random crashes in apps were mostly due to the app
>> having mapped a device backed BO into it's adress space was still
>> trying to access the BO while the backing device was gone. To answer
>> this first problem Christian suggested to fix the handling of mapped
>> memory in the clients when the device goes away by forcibly unmap all
>> buffers the user processes has by clearing their respective VMAs
>> mapping the device BOs. Then when the VMAs try to fill in the page
>> tables again we check in the fault handler if the device is removed
>> and if so, return an error. This will generate a SIGBUS to the
>> application which can then cleanly terminate. This indeed was done
>> but this in turn created a problem of kernel OOPs were the OOPSes
>> were due to the fact that while the app was terminating because of
>> the SIGBUS it would trigger use after free in the driver by calling
>> to accesses device structures that were already released from the pci
>> remove sequence. This we handled by introducing a 'flush' seqence
>> during device removal were we wait for drm file reference to drop to
>> 0 meaning all user clients directly using this device terminated.
>> With this I was able to cleanly emulate device unplug with X and
>> glxgears running and later emulate device plug back and restart of X
>> and glxgears.
>>
>> But this use case is only partial and as I see it all the use cases
>> are as follwing and the questions it raises.
>>
>> 1) Application accesses a BO by opening drm file
>> 	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS
>> 	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
>> 	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?
>>
>> 2) Application accesses a BO by importing a DMA-BUF
>> 	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the
>> 	      imported dma-buf's file release
>> 	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for
>>                all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to
>> 	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.
>>
>> 3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we
>>     force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.
>>
>> The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the
>> described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere
>> mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ?
>>
>> Patches 1-3 address 1.1
>> Patch 4 addresses 2.1
>> Pathces 5-6 address 2.2
>>
>> Reference: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388177520&amp;sdata=xg3zrilEwSCR7icmkKVVzZwiI11XvmGR%2Bca8nOWBiDM%3D&amp;reserved=0
> Hi,
>
> how did you come up with the goal "make applications terminate"? Is
> that your end goal, or is it just step 1 of many on the road of
> supporting device hot-unplug?


Just as an effort to improve the current situation where we have 
unexpected random crashes following device removal.

>
> Why do you want to terminate also applications that don't "need" to
> terminate? Why hunt them down? I'm referring to your points 1.2, 2.2
> and 3.


Because when those applications do exit and since they hold a reference 
to drm device through their open device file descriptor or dma-buf file 
descriptor we end up in use after free situation where during pci remove 
we already released everything but now last drm_dev_put release callback 
is trying to access those released structures. Any way, as you and 
Daniel pointed out forcing termination is a bad approach.  Seems we need 
to actually keep all the drm structures around until the very last 
device reference is dropped while in the meatime returning error code 
for any new IOCTLs and rerouting any  page fault to zero page.

Thanks  for the detailed response.

Andrey


>
>  From an end user perspective, I believe making applications terminate
> is not helpful at all. Your display server still disappears, which
> means all your apps are forced to quit, and you lose your desktop. I do
> understand that a graceful termination is better than a hard lockup,
> but not much.
>
> When I've talked about DRM device hot-unplug with Daniel Vetter, our
> shared opinion seems to be that the unplug should not outright kill any
> programs that are prepared to handle errors, that is, functions or
> ioctls that return a success code can return an error, and then it is
> up for the application to decide how to handle that. The end goal must
> not be to terminate all applications that had something to do with the
> device. At the very least the display server must survive.
>
> The rough idea on how that should work is that DRM ioctls start
> returning errors and all mmaps are replaced with something harmless
> that does not cause a SIGBUS. Userspace can handle the errors if it
> wants to, and display servers will react to the device removed uevent
> if not earlier.
>
> Why deliberately avoid raising SIGBUS? Because it is such a huge pain
> to handle due to the archaic design of how signals are delivered. Most
> of existing userspace is also not prepared to handle SIGBUS anywhere.
>
> The problem of handling SIGBUS at all is that a process can only have a
> single signal handler per signal, but the process may comprise of
> multiple components that cannot cooperate on signal catching: Mesa GPU
> drivers, GUI toolkits, and the application itself may all do some
> things that would require handling SIGBUS if removing a DRM device
> raised it. For Mesa to cooperate with SIGBUS handling with the other
> components in the process, we'd need some whole new APIs, an EGL
> extension and maybe Vulkan extension too. The process may also have
> threads, which are really painful with signals. What if you need to
> handle the SIGBUS differently in different threads?
>
> Hence, mmaps should be replaced with something harmless, maybe
> something that reads back all zeros and ignores writes. The application
> will learn later that the DRM device is gone. Sending it a SIGBUS on
> the spot when it accesses an mmap does not help: the memory is gone
> already - if you didn't have a backup of the contents, you're not going
> to make one now.
>
> My point here is, are you designing things to specifically only
> terminate processes, or will you leave room in the design to improve the
> implementation towards a proper handling of DRM device hot-unplug?
>
>
> Thanks,
> pq
>
>
>> Andrey Grodzovsky (6):
>>    drm/ttm: Add unampping of the entire device address space
>>    drm/amdgpu: Force unmap all user VMAs on device removal.
>>    drm/amdgpu: Wait for all user clients
>>    drm/amdgpu: Wait for all clients importing out dma-bufs.
>>    drm/ttm: Add destroy flag in TTM BO eviction interface
>>    drm/amdgpu: Use TTM MMs destroy interface
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 +++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 ++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 ++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 +++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 +++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 +
>>   drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 +-
>>   drivers/gpu/drm/qxl/qxl_object.c            |  4 +-
>>   drivers/gpu/drm/radeon/radeon_object.c      |  2 +-
>>   drivers/gpu/drm/ttm/ttm_bo.c                | 63 +++++++++++++++++++++--------
>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 +--
>>   include/drm/ttm/ttm_bo_api.h                |  2 +-
>>   include/drm/ttm/ttm_bo_driver.h             |  2 +
>>   16 files changed, 139 insertions(+), 34 deletions(-)
>>
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388197434&amp;sdata=Unqh9pySrEsPeAFLxzmI0deAlPF29%2FfXLMdSl8Jsvgo%3D&amp;reserved=0

--------------8500007F3D27C20DBDE023C8
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/11/20 5:26 AM, Pekka Paalanen
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200511122600.0adb4494@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">On Sat, 9 May 2020 14:51:44 -0400
Andrey Grodzovsky <a class="moz-txt-link-rfc2396E" href="mailto:andrey.grodzovsky@amd.com">&lt;andrey.grodzovsky@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This RFC is a more of a proof of concept then a fully working
solution as there are a few unresolved issues we are hopping to get
advise on from people on the mailing list. Until now extracting a
card either by physical extraction (e.g. eGPU with thunderbold
connection or by emulation through syfs
-&gt; /sys/bus/pci/devices/device_id/remove) would cause random crashes
in user apps. The random crashes in apps were mostly due to the app
having mapped a device backed BO into it's adress space was still
trying to access the BO while the backing device was gone. To answer
this first problem Christian suggested to fix the handling of mapped
memory in the clients when the device goes away by forcibly unmap all
buffers the user processes has by clearing their respective VMAs
mapping the device BOs. Then when the VMAs try to fill in the page
tables again we check in the fault handler if the device is removed
and if so, return an error. This will generate a SIGBUS to the
application which can then cleanly terminate. This indeed was done
but this in turn created a problem of kernel OOPs were the OOPSes
were due to the fact that while the app was terminating because of
the SIGBUS it would trigger use after free in the driver by calling
to accesses device structures that were already released from the pci
remove sequence. This we handled by introducing a 'flush' seqence
during device removal were we wait for drm file reference to drop to
0 meaning all user clients directly using this device terminated.
With this I was able to cleanly emulate device unplug with X and
glxgears running and later emulate device plug back and restart of X
and glxgears.

But this use case is only partial and as I see it all the use cases
are as follwing and the questions it raises.

1) Application accesses a BO by opening drm file
	1.1) BO is mapped into applications address space (BO is CPU visible) - this one we have a solution for by invaldating BO's CPU mapping casuing SIGBUS 
	     and termination and waiting for drm file refcound to drop to 0 before releasing the device
	1.2) BO is not mapped into applcation address space (BO is CPU invisible) - no solution yet because how we force the application to terminate in this case ?

2) Application accesses a BO by importing a DMA-BUF
	2.1)  BO is mapped into applications address space (BO is CPU visible) - solution is same as 1.1 but instead of waiting for drm file release we wait for the 
	      imported dma-buf's file release
	2.2)  BO is not mapped into applcation address space (BO is CPU invisible) - our solution is to invalidate GPUVM page tables and destroy backing storage for 
              all exported BOs which will in turn casue VM faults in the importing device and then when the importing driver will try to re-attach the imported BO to 
	      update mappings we return -ENODEV in the import hook which hopeffuly will cause the user app to terminate.

3) Applcation opens a drm file or imports a dma-bud and holds a reference but never access any BO or does access but never more after device was unplug - how would we 
   force this applcation to termiante before proceeding with device removal code ? Otherwise the wait in pci remove just hangs for ever.

The attached patches adress 1.1, 2.1 and 2.2, for now only 1.1 fully tested and I am still testing the others but I will be happy for any advise on all the 
described use cases and maybe some alternative and better (more generic) approach to this like maybe obtaining PIDs of relevant processes through some revere 
mapping from device file and exported dma-buf files and send them SIGKILL - would this make more sense or any other method ? 

Patches 1-3 address 1.1
Patch 4 addresses 2.1
Pathces 5-6 address 2.2

Reference: <a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388177520&amp;amp;sdata=xg3zrilEwSCR7icmkKVVzZwiI11XvmGR%2Bca8nOWBiDM%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388177520&amp;amp;sdata=xg3zrilEwSCR7icmkKVVzZwiI11XvmGR%2Bca8nOWBiDM%3D&amp;amp;reserved=0</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

how did you come up with the goal &quot;make applications terminate&quot;? Is
that your end goal, or is it just step 1 of many on the road of
supporting device hot-unplug?</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Just as an effort to improve the current situation where we have
      unexpected random crashes following device removal.<br>
    </p>
    <blockquote type="cite" cite="mid:20200511122600.0adb4494@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">

Why do you want to terminate also applications that don't &quot;need&quot; to
terminate? Why hunt them down? I'm referring to your points 1.2, 2.2
and 3.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Because when those applications do exit and since they hold a
      reference to drm device through their open device file descriptor
      or dma-buf file descriptor we end up in use after free situation
      where during pci remove we already released everything but now
      last drm_dev_put release callback is trying to access those
      released structures. Any way, as you and Daniel pointed out
      forcing termination is a bad approach.&nbsp; Seems we need to actually
      keep all the drm structures around until the very last device
      reference is dropped while in the meatime returning error code for
      any new IOCTLs and rerouting any&nbsp; page fault to zero page. <br>
    </p>
    <p>Thanks&nbsp; for the detailed response. <br>
    </p>
    <p>Andrey</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20200511122600.0adb4494@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">

From an end user perspective, I believe making applications terminate
is not helpful at all. Your display server still disappears, which
means all your apps are forced to quit, and you lose your desktop. I do
understand that a graceful termination is better than a hard lockup,
but not much.

When I've talked about DRM device hot-unplug with Daniel Vetter, our
shared opinion seems to be that the unplug should not outright kill any
programs that are prepared to handle errors, that is, functions or
ioctls that return a success code can return an error, and then it is
up for the application to decide how to handle that. The end goal must
not be to terminate all applications that had something to do with the
device. At the very least the display server must survive.

The rough idea on how that should work is that DRM ioctls start
returning errors and all mmaps are replaced with something harmless
that does not cause a SIGBUS. Userspace can handle the errors if it
wants to, and display servers will react to the device removed uevent
if not earlier.

Why deliberately avoid raising SIGBUS? Because it is such a huge pain
to handle due to the archaic design of how signals are delivered. Most
of existing userspace is also not prepared to handle SIGBUS anywhere.

The problem of handling SIGBUS at all is that a process can only have a
single signal handler per signal, but the process may comprise of
multiple components that cannot cooperate on signal catching: Mesa GPU
drivers, GUI toolkits, and the application itself may all do some
things that would require handling SIGBUS if removing a DRM device
raised it. For Mesa to cooperate with SIGBUS handling with the other
components in the process, we'd need some whole new APIs, an EGL
extension and maybe Vulkan extension too. The process may also have
threads, which are really painful with signals. What if you need to
handle the SIGBUS differently in different threads?

Hence, mmaps should be replaced with something harmless, maybe
something that reads back all zeros and ignores writes. The application
will learn later that the DRM device is gone. Sending it a SIGBUS on
the spot when it accesses an mmap does not help: the memory is gone
already - if you didn't have a backup of the contents, you're not going
to make one now.

My point here is, are you designing things to specifically only
terminate processes, or will you leave room in the design to improve the
implementation towards a proper handling of DRM device hot-unplug?


Thanks,
pq


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Andrey Grodzovsky (6):
  drm/ttm: Add unampping of the entire device address space
  drm/amdgpu: Force unmap all user VMAs on device removal.
  drm/amdgpu: Wait for all user clients
  drm/amdgpu: Wait for all clients importing out dma-bufs.
  drm/ttm: Add destroy flag in TTM BO eviction interface
  drm/amdgpu: Use TTM MMs destroy interface

 drivers/gpu/drm/amd/amdgpu/amdgpu.h         |  3 &#43;&#43;
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c |  2 &#43;-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  7 &#43;&#43;&#43;-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 27 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c     | 22 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  9 &#43;&#43;&#43;&#43;&#43;
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c     |  4 &#43;&#43;
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c  | 17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h  |  1 &#43;
 drivers/gpu/drm/nouveau/nouveau_drm.c       |  2 &#43;-
 drivers/gpu/drm/qxl/qxl_object.c            |  4 &#43;-
 drivers/gpu/drm/radeon/radeon_object.c      |  2 &#43;-
 drivers/gpu/drm/ttm/ttm_bo.c                | 63 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c         |  6 &#43;--
 include/drm/ttm/ttm_bo_api.h                |  2 &#43;-
 include/drm/ttm/ttm_bo_driver.h             |  2 &#43;
 16 files changed, 139 insertions(&#43;), 34 deletions(-)

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388197434&amp;amp;sdata=Unqh9pySrEsPeAFLxzmI0deAlPF29%2FfXLMdSl8Jsvgo%3D&amp;amp;reserved=0">https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=02%7C01%7Candrey.grodzovsky%40amd.com%7C6f92386d0dd444de4fe608d7f58d5ae9%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637247860388197434&amp;amp;sdata=Unqh9pySrEsPeAFLxzmI0deAlPF29%2FfXLMdSl8Jsvgo%3D&amp;amp;reserved=0</a>
</pre>
    </blockquote>
  </body>
</html>

--------------8500007F3D27C20DBDE023C8--

--===============0147255197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0147255197==--
