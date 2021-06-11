Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57713A4218
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 14:38:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1556E135;
	Fri, 11 Jun 2021 12:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 743FA6E135;
 Fri, 11 Jun 2021 12:38:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehOKAAITAvVFUpyxeHtfshvvduzVtI3bsRDUgzwRQnHDvpvuJKl2hPDTvyjjvYTEWUJmqbB9kz4fA2/ql0VtWBuUbVx6DF+XIieL2DF07i0ADri1AJHkDFDe9fE1lYpjOpb3NAndQtiAQEe+wFOLoLYBLAiEOazEvUJGGRQqnuYCxNkIz5jTApyd0f1blTQ/tSKwABM/K0oAAw0+MGTW8OI9z8WscoiWdE3Z/td8YUVK7I/7K92lnFm38Z+KmoY+pGdrt1lUdHh4SqWd4QxYf0BpdDspIZRVLBbQiRH70HXHEcr5q0ZF9x8zV9RK1T6dqW2mhnzbFVjLqFVIpX+sSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPr80usmpXUBwyEq5tKH+J4Emf0ZVB0iE0mNOKG4Nqs=;
 b=fiL6SOCdAWpo44lTBBeCKoyfVdf5+vy667z3AJSkseFjNQCZi87Li6yn1ZbbJ7+ihkyh4g1teT4Om5KK15P46WIvIiVrcjEO76Iyr5ns4euh3Dg1eBHgy1GiIQwO+BjKCMeeynhEMCFXc6LrnA39mz0p0uOPPO5kdwQpyr7fOrwbBdfu/hCQJT1THPXcgO+rWdEtK1Qj2Hg0GAo4KWsc7vpd0IXd1BA7o0YNMzmdJJFHYiycMzMrdNdHTnU5sDZ4Dal8EwxalYCrEvaGkLbh5mg6ITHiM1mj41lzj2IER76TJfLq5xPX6bjz3GCTDy3PZZu4+1VqeA5gz1Ellcr1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPr80usmpXUBwyEq5tKH+J4Emf0ZVB0iE0mNOKG4Nqs=;
 b=SdFifw5A0TP0JB5f4Q6dJhmMdyGV/OyxUa4L3qVPTdRPRCSCqLHuG2jMJQlXz/TJkAUPy81MaLBYZvO/7XA4xooimbelQND4nDxl8D21H0MVoe8vl1OByAzXYIjxin3p6QhOtY1L7d87Xnxdu5zDfy6xvOf7N0vQtciHAnAsw6Q=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3887.namprd12.prod.outlook.com (2603:10b6:208:168::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Fri, 11 Jun
 2021 12:38:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 12:38:25 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <202106092200.08088.linux@zary.sk>
 <081b7908-9a1c-fef1-2b82-4b794f612c9b@amd.com>
 <202106101950.28723.linux@zary.sk>
 <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
Message-ID: <4b4248d8-b708-3832-7fe3-2a9fd2c2311e@amd.com>
Date: Fri, 11 Jun 2021 14:38:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d4e5042c-3981-02b0-4b9e-fa2c8e373be4@amd.com>
Content-Type: multipart/mixed; boundary="------------791DDC96CB4812DCBF48AE5B"
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1]
X-ClientProxiedBy: PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::27) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1]
 (2a02:908:1252:fb60:bd94:4b9a:99c4:4bc1) by
 PR0P264CA0279.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 12:38:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90e4ece1-a3b1-40fe-eca3-08d92cd5cded
X-MS-TrafficTypeDiagnostic: MN2PR12MB3887:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3887EF9A5BD6EBE277E8E26983349@MN2PR12MB3887.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kDaH+MTfH7KRhIYyZ5T2s+AwRUkEwww5kuhAZvrrs8cykG1rrGlU8gGxhIDAHPUr94uaMwSqf2FQabU35HqmnpSlvUxTjhe2qAlyPVcCkMEa8Menco0NihF3x8vURFdEc8ql6qreqzq6a+XID3QrRJNCEwOmZC/wp/APK0KvvheTkAxnmiak5mbjzMBzvxCVZ455NvmNNmCYIRY4J1iS19J/dq7OvbRmK1EqNoRKLJB5x3o6EQ9mlZORZqNnZRKdd8Cc47BLL7lVYH8NV+A4Cyn2Lppec8IDgy3ThGf45pz/R1TdGSMXL5ltZmh1mxWl2/cbgb2HoqzSobPL6frW2N5U8ytrz870AlKCT0SfcI5M9omHEZ71lqTyr51E3vseiFiHOeIJZXh3r7VxbC9PvK32aQNEN7aJrD+cWcs32/vN0G4aaoVHN95bQtEAm2P8un9K1SDZFI4IbKlRO2xDobjP3ZmsQ+7Ihao+owhTMh01NgTISs8lcYbwW9cgx53lKb1f2kTwArQIUAdjunurP7OSg/0dAaWl8jsePbLCAxFRiVOr9h/TiERKqcfFqSlElFl7lr0JbQHKKkyXkTg7MxMwhfyI68h0o4ICdzFoKaOZvAB5CdLbWTO0caNyofhrYHgr532fcygFN1dRSJqf7JLlY00fw9eGnDllRU6M7uOwhgLn3sxeAUDrZOzMfTAz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(16526019)(31686004)(6916009)(66476007)(36756003)(8936002)(6666004)(186003)(66556008)(83380400001)(33964004)(2616005)(8676002)(66574015)(235185007)(38100700002)(6486002)(66616009)(31696002)(2906002)(4326008)(86362001)(478600001)(316002)(5660300002)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNycUJTbWxNNjlmbGlld3gwMmRMMmwydXB6dm53aEV5ei90d2YzdWI3bndo?=
 =?utf-8?B?QVNaZU9OQVN2ZGE5bFp0WHlzZUhnU1BXQWVnWDQ5MkU3SmtjalRTbkh1VUJy?=
 =?utf-8?B?b0IwMGRyVTJQMnYxdSt1UThMdWt6dG9LS2g5UGMyU1NNRm02YlFFelRLYkVm?=
 =?utf-8?B?SldIRmpsUUpsREM2WmFJR1RHdkpLZ0h4THRBNzYxUENOMGJTTW1zUTRMdkht?=
 =?utf-8?B?aEdzWGc4TlNXVy9aTjlZYmxRR0d5K2RJTjB3UFo5WUloWXAyM3dISVloemxv?=
 =?utf-8?B?WExXSUdRdjltUkRSYWZoaUxVT1BpcXA5MkJwQ0p1VlJlVkM3bzl2eXJXNWN0?=
 =?utf-8?B?OEptS244RWozTlJHekJsaWZGOEFUUXlLVEFhSnVsRGdRcEQzNS9WVnFvV01J?=
 =?utf-8?B?ZVpKd1hzTE1LL2h0ODJWQjl2TGdSR3kzYVdSSTFaZkk2SXBmK0ZBZ2xJREpG?=
 =?utf-8?B?V2NIaElKWkR4eE5XS2pXNzMxTUR6R1R4N1k4YUhpUC9KaHY0algvZTVsb3FH?=
 =?utf-8?B?c2V2djUrK29KTG1tVm1tZEFBSmtsTFc0N1drZDZPWnFCWVlWQXoyelpOOXpI?=
 =?utf-8?B?Kzh4elFlSVFJaFp5MW1lRnRXbnRBeWE5NjEyTTk4ODdUMXZodEFBSER2NUdB?=
 =?utf-8?B?Ukg5VklyL0VZRVFYRElkMmFQeXZCWjZ5VW1jZDBSeG1SSWk5dmVQYUI0ZWMv?=
 =?utf-8?B?aGNvL2w2a1BmMXNxbUhQTzRpKzJiTXNqeCt3eVZJSmRuVW9RMFpIengxdlBH?=
 =?utf-8?B?NmRpek5Bcm9iUFN1WjlRNzFzRFh0V0E2K0wreU92ellhc09wSU96V0RMdUpJ?=
 =?utf-8?B?d25VQ2FKU3RJOGYyMkdmdVhrNFZ1bXBCOUN2eWlJbEIzVkVYN1praThIdEpR?=
 =?utf-8?B?YjdrNEhNV0dZKzZBakc5M3UyUm9DUm54UkE3WG8rU1VaYldzd3dXK0NkbU45?=
 =?utf-8?B?NTVoUHRCSmY1N01BRjVxMW1VTXM5QmwyVTF3QkY4SEY5dkIyK3FnV0RzMWZh?=
 =?utf-8?B?S0xNdHErM0NJTmRNZzZMdXVlUUhEY1lSUVZxaUFyV2RmcEp0bUlUdlg2Ynpi?=
 =?utf-8?B?OWNiWS9iTGlpMjFWcDJVNkVZc3BCVDRSQ1NwWDlNUU1VdS91RTA3b1VQSHZD?=
 =?utf-8?B?ajdCTU15YkJhdHEydGJzS0p4OXVCZjgzUVMzV3pvb3MzRlZ2blJ1aWVSNFAx?=
 =?utf-8?B?aS9QajFsUmFBVDJBM2lKZURraGJFa1BRWFBxMDJTZ2FHY05XK3E5OFhmRDZR?=
 =?utf-8?B?MjVtb2kvSXB1eG9FRjFIQWcrcWRRNDlSQ1BwNFhkYmxOSFg1M0dLWWVYN2x5?=
 =?utf-8?B?RjRHdlJESzNKa2hiUlJwU1k4S0JkelljQ2l0QXdpQVA3a1JIUGE1TTdoOE9N?=
 =?utf-8?B?ck9yK01ZU2hWZXk0cnlGN3kydEdrZkRSWkpHQVc3cGNwZXJQYmtGb0czSnhN?=
 =?utf-8?B?c3NlaXNrNFZKUlRoeUw1dUxHeXdVUTJwVmZaZEZJZHB3Ulc1eTJGYnE5aXRr?=
 =?utf-8?B?VWc4akhlMlJsSDhrZS8wN01tY0ZCU1dVY2hCNHkxT3pkektrZVRsWUVBRWNq?=
 =?utf-8?B?d3pvY1hDU2FKRHJhbitwUVplQU9TMDY3bjhEemszR3dnZDRPM3hhb0xESVNs?=
 =?utf-8?B?S2JlZ3hDY0N5WnlrazZMdkdTc2ZLbkxuTE90cVhLdjBYSTF1dndTbUpNYko4?=
 =?utf-8?B?YU1EVXZLa2R6KzBuZHJodmdEZUs5SjdmbENKUUZ3OUhZU1NoT2lTNk9xR21X?=
 =?utf-8?B?WWQwSjRYQ016T29Vdk5KdUpNcDRacm5jTW9rVHQxekRZM1V2WGtJWVdmM29r?=
 =?utf-8?B?RCtmWEcxOXlYeUJ0citMcUlJcG5TZ0FRV01ISkxaU3NXZTB4dktIS1N2c20w?=
 =?utf-8?Q?O04WYUyYulW0E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90e4ece1-a3b1-40fe-eca3-08d92cd5cded
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 12:38:24.8391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tg2xnplvD3QlBWZ7o3+AW8NLtATwIObCaTPfejWSAcdpGwS69az/cOnZuIMY790j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3887
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------791DDC96CB4812DCBF48AE5B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



Am 10.06.21 um 19:59 schrieb Christian König:
> Am 10.06.21 um 19:50 schrieb Ondrej Zary:
>> [SNIP]
>>> I can't see how this is called from the nouveau code, only 
>>> possibility I
>>> see is that it is maybe called through the AGP code somehow.
>> Yes, you're right:
>> [   13.192663] Call Trace:
>> [   13.192678]  dump_stack+0x54/0x68
>> [   13.192690]  ttm_tt_init+0x11/0x8a [ttm]
>> [   13.192699]  ttm_agp_tt_create+0x39/0x51 [ttm]
>> [   13.192840]  nouveau_ttm_tt_create+0x17/0x22 [nouveau]
>> [   13.192856]  ttm_tt_create+0x78/0x8c [ttm]
>> [   13.192864]  ttm_bo_handle_move_mem+0x7d/0xca [ttm]
>> [   13.192873]  ttm_bo_validate+0x92/0xc8 [ttm]
>> [   13.192883]  ttm_bo_init_reserved+0x216/0x243 [ttm]
>> [   13.192892]  ttm_bo_init+0x45/0x65 [ttm]
>> [   13.193018]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
>> [   13.193150]  nouveau_bo_init+0x8c/0x94 [nouveau]
>> [   13.193273]  ? nouveau_bo_del_io_reserve_lru+0x48/0x48 [nouveau]
>> [   13.193407]  nouveau_bo_new+0x44/0x57 [nouveau]
>> [   13.193537]  nouveau_channel_prep+0xa3/0x269 [nouveau]
>> [   13.193665]  nouveau_channel_new+0x3c/0x5f7 [nouveau]
>> [   13.193679]  ? slab_free_freelist_hook+0x3b/0xa7
>> [   13.193686]  ? kfree+0x9e/0x11a
>> [   13.193781]  ? nvif_object_sclass_put+0xd/0x16 [nouveau]
>> [   13.193908]  nouveau_drm_device_init+0x2e2/0x646 [nouveau]
>> [   13.193924]  ? pci_enable_device_flags+0x1e/0xac
>> [   13.194052]  nouveau_drm_probe+0xeb/0x188 [nouveau]
>> [   13.194182]  ? nouveau_drm_device_init+0x646/0x646 [nouveau]
>> [   13.194195]  pci_device_probe+0x89/0xe9
>> [   13.194205]  really_probe+0x127/0x2a7
>> [   13.194212]  driver_probe_device+0x5b/0x87
>> [   13.194219]  device_driver_attach+0x2e/0x41
>> [   13.194226]  __driver_attach+0x7c/0x83
>> [   13.194232]  bus_for_each_dev+0x4c/0x66
>> [   13.194238]  driver_attach+0x14/0x16
>> [   13.194244]  ? device_driver_attach+0x41/0x41
>> [   13.194251]  bus_add_driver+0xc5/0x16c
>> [   13.194258]  driver_register+0x87/0xb9
>> [   13.194265]  __pci_register_driver+0x38/0x3b
>> [   13.194271]  ? 0xf0c0d000
>> [   13.194362]  nouveau_drm_init+0x14c/0x1000 [nouveau]
>>
>> How is ttm_dma_tt->dma_address allocated?
>
> Mhm, I need to double check how AGP is supposed to work.
>
> Since barely anybody is using it these days it is something which 
> breaks from time to time.

I have no idea how that ever worked in the first place since AGP isn't 
supposed to sync between CPU/GPU. Everything is coherent for that case.

Anyway here is a patch which adds a check to those functions if the 
dma_address array is allocated in the first place. Please test it.

Thanks,
Christian.

>
> Thanks for the backtrace,
> Christian.
>
>>   I cannot find any assignment
>> executed (in the working code):
>>
>> $ git grep dma_address\ = drivers/gpu/
>> drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c: 
>> sg->sgl->dma_address = addr;
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address = 
>> &dma->dma_address[offset >> PAGE_SHIFT];
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c: dma_address = 
>> (mm_node->start << PAGE_SHIFT) + offset;
>> drivers/gpu/drm/i915/gvt/scheduler.c:   sg->dma_address = addr;
>> drivers/gpu/drm/i915/i915_gpu_error.c:  sg->dma_address = it;
>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address = (void *) 
>> (ttm->ttm.pages + ttm->ttm.num_pages);
>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm->dma_address = 
>> kvmalloc_array(ttm->ttm.num_pages,
>> drivers/gpu/drm/ttm/ttm_tt.c:   ttm_dma->dma_address = NULL;
>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address = 
>> &__vmw_piter_phys_addr;
>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address = 
>> &__vmw_piter_dma_addr;
>> drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c: viter->dma_address = 
>> &__vmw_piter_sg_addr;
>>
>> The 2 cases in ttm_tt.c are in ttm_dma_tt_alloc_page_directory() and
>> ttm_sg_tt_alloc_page_directory().
>> Confirmed by adding printk()s that they're NOT called.
>>
>>
>


--------------791DDC96CB4812DCBF48AE5B
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-drm-nouveau-check-dma_address-array-for-CPU-GPU-sync.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-check-dma_address-array-for-CPU-GPU-sync.pa";
 filename*1="tch"

From 5370102729c6ecb280712c40b92ff7b9f58c6e1e Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Date: Fri, 11 Jun 2021 14:34:50 +0200
Subject: [PATCH] drm/nouveau: check dma_address array for CPU/GPU sync
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

AGP for example doesn't have a dma_address array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 085023624fb0..1a52590f5303 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -551,7 +551,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 	if (!ttm_dma->pages) {
 		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
@@ -587,7 +587,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
 	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
 	int i, j;
 
-	if (!ttm_dma)
+	if (!ttm_dma || !ttm_dma->dma_address)
 		return;
 	if (!ttm_dma->pages) {
 		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
-- 
2.25.1


--------------791DDC96CB4812DCBF48AE5B--
