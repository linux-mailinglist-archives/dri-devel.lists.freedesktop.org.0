Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3527A371F15
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A546E131;
	Mon,  3 May 2021 18:00:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995096E103;
 Mon,  3 May 2021 18:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnoqaV2j9+gb0BW8iksUzFLz+++7p+B/s9Pmhcjka1GQFwU01g5wCEmHP7gyFxKDKjYOGS66baju/LLp5vJKIOsOl58tPW1IBoFp7XuuTAsfdAOL6PavLLoP7uq0/gbhfUzdPpLhhzaRQXhofRh8lmDzZCYMpBRZir3NbB9Q+BmMSXonpIXA31C21qm+upaoRfi+fAsYF3ewLhds0HXNTICxs2XR8O1oEJ53y/2RybLBRDcSCbtysckehEYNrPynEmNBjtNuXg91WiFe2yRN+Ti6ehmSmnEd1nRw8XjQAkGDfHHvsxQMjYSKlDnN1wqmlQkUfciMgFVldZQ9a4n41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFhOACKuY7/REWVtqUuvE9D/YdB5TT3C12EUTnCiGjE=;
 b=nE+CyK/r3VbBWBrzdgju3mg4xiWqlg7i1Kj7nqLBejIy5wshQo8tDlxiFPUChlsslNhj9bM2q/SXvTpZgm5/+/HDL+DRAcHPImmcJt+MTb51LbGkPg2RQOrX9PFqOxmQqPBInFUD4i67ATFGpALMb5hNHjyrzFvNnn0KUCpqklMKZsG6XkJWreODVLApYHZYagNJwI+xH2Uy+7tib1AdHMm21LQc02mRzKl9Tj4q7FgTY1+3e2bbRmQtDAveAq+KmkL/3QTZ+ZBgQzWb4htuAOqzrMP/xMxP7HRNSIlcJLYJFB9hWMDc+CevR2ddwXmt7GhG4g53lOXBlLgYdj+ClA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFhOACKuY7/REWVtqUuvE9D/YdB5TT3C12EUTnCiGjE=;
 b=Wi/Qekr44oFveSrYm5a+BlArWMoQhpe3arENRbHQiGw0JQr6pWMjN4QSxlPn1E1iBWHorAJM1hM6O73exjfakySudao9OXkxOGlBrj1DFwZuegxmv/HsCgeKGoDFzFEnxglKaIGExjE4V3EfA+pmGuAkJS8qiZEzyEKGSABqtn8=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4447.namprd12.prod.outlook.com (2603:10b6:806:9b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Mon, 3 May
 2021 18:00:50 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 18:00:50 +0000
Subject: Re: [PATCH v5 06/27] drm/amdgpu: Handle IOMMU enabled case.
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-7-andrey.grodzovsky@amd.com>
 <CADnq5_NtyLBon0Tk_BHh=XOprMPrAcKf8LN8b-bdmy1-D1Uzhg@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <b5f136f4-c788-1a2a-1074-6f679977512b@amd.com>
Date: Mon, 3 May 2021 14:00:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CADnq5_NtyLBon0Tk_BHh=XOprMPrAcKf8LN8b-bdmy1-D1Uzhg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:8db:36bc:53f4:eb99]
X-ClientProxiedBy: YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::7) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:8db:36bc:53f4:eb99]
 (2607:fea8:3edf:49b0:8db:36bc:53f4:eb99) by
 YT1PR01CA0038.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.39 via Frontend Transport; Mon, 3 May 2021 18:00:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0fb741a-7785-45c4-e868-08d90e5d6294
X-MS-TrafficTypeDiagnostic: SA0PR12MB4447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44474FEFEF6A8CEC9818D1B8EA5B9@SA0PR12MB4447.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j7znaItRBoCIsRvMTetUHw5ymsu9+puFGezgrJhSDxJl2QA8IM6VerpU+ZQvuF/c4zgkk3pAsP9OLVVswzvE2u2VIA57uphGdeBg3bcOE8YSc6EMSf6gwEUP/kTyP5WceElu1eVCE33WKf4YExz4rl1ll3/juNKHTcP4UgsMZ6P/IlTKxFX31li3SW2UhclpQhk8JhZ9h8QUOCS8up9bYhvtbqOOLKCfxtgAAeu1KRe9TlGCAx6sDR+BcOtwiAg1+tARtdY+jVOHZtPHYrF8YJdXKaW20797Bmxueyg590EBtiqbiCYrve30nDxsF8azoT/7XhXgFKbiWYIRq/BM7YgxpovMi450k1cRAb0aNqC1OrBEBjAcESgkngFF1fQ2A73huPyexcBH7sTkCFwQR6ca5aXL+eTkwERLOcCB9al+aWEG1YyDSDcdpVOixnAeOU6FxBmAvd4X4Hcz6HK/ywZP9Tik+BHsLg9Pyng1pQ/snGgIR71G6ipcKnK2jRPoITzyjTkew7a7/iXOuoWlbg0xJy2V2FzVsuKEaPZ1tZTuRXu4KYxVKGb/QKS7G5TmdW7I8+tLZxe8pkCXmQAuUuGAeEActVWimTnVKhKUcPTbdPP7lOovAE9ubrmmJVp2BnpIHSHFa+QwgnlkUd1is186ioWmCtPViJDiNu4wZ6qKrFbzzmqROKkzR2nMHZofPyxAg3T8EI//4DEg55iSUtj54OihiH43F5v6nh928qk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(316002)(966005)(4326008)(478600001)(8936002)(66946007)(54906003)(6486002)(8676002)(2906002)(6916009)(36756003)(31686004)(44832011)(86362001)(2616005)(83380400001)(53546011)(186003)(38100700002)(66476007)(45080400002)(30864003)(31696002)(16526019)(52116002)(5660300002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGJBa09MMHFLUVFTc2xRblQ4RHZYWkVDandJQnZqb0pnQThRRWhLbWVQVElC?=
 =?utf-8?B?ald6Z2FOSjRuV0I3Z1RneFlQQTNvS0hIbW1kOGZDUWRLYzhPTlRGTmY2Y1Uy?=
 =?utf-8?B?MU9lNVgwL0p2MFBWNkpwcVVjNmp2SUo4R0kzM25JVmdzU3hpWWQyVXJJZFFS?=
 =?utf-8?B?Z2ZESXc2dDZyNmF1ckNadEg3cmxsdm11cEd3WXdzWFZnbTk5UE9kNzB3SklQ?=
 =?utf-8?B?MzcxNnVuV0t1QXRvV0xJbnV4dHFBaVV2ZmF3MGN0WU0vajBKRzAvcGc0aXI0?=
 =?utf-8?B?WW0vNFdFZFU3N0o0MExiZ043NW9CRFVlSWIxc0FDdkRzT21xRUxQYzVhTjhC?=
 =?utf-8?B?OG56K2hYM0JzSHh3emwzUnJqSFhoNHp6UFhDR2FJWk5ac3VBeEJiL0hSTjg1?=
 =?utf-8?B?VlFGaG1ueUo4MkVDczRGZ2trYktDYlJTeW9iaVBvem1iaWN0QTNoSG4vdVZK?=
 =?utf-8?B?Y2pqNFF4QmUzcnhYOHM4U2tCSEl0aXljTWs2R1BtTGNES0ZzS3pLUUgrdi9D?=
 =?utf-8?B?azdSSHpYcHZ3UUNUK0tLUGhkV3Z3MjBqUjBYQ1B1TVFjTGdteVY4L1hXdEZP?=
 =?utf-8?B?TDIrbXhEcCtZSnlHTnhuM1g5eXFBRWk5Q1RHbWo2bFY0K2JVS0xuMzBZZ0RH?=
 =?utf-8?B?YjFJTFNYU1NnNGV4Skl3VlhNcFBodFpuL1VsSEwxSE1vVWJ2SmhYb0wxK1ly?=
 =?utf-8?B?TC9sMWNlRVozWVU0V29UdkVHYThiYjgxSTA0L1gwdTBnNUlrS0pXL1cyOGR2?=
 =?utf-8?B?NUJ5YndORzNlbXczNUN4K2xqbjlSSUdabUVEbFdBRDVsVFRpS0ZGb21NNzVV?=
 =?utf-8?B?YTZuWlAvaXRQNS92M2VBOTdadEJ5Q1RCbjdGb0lOV0lrUG1TSURiSG14ZkJL?=
 =?utf-8?B?cllldVdaWFB1MDhlbXFkdXE3NC85d3lyUTZMVFNHZUZTUXNZcEtYNmp3THJS?=
 =?utf-8?B?L2xMc0w2L2pkbTQ4R1lpVGkxMjA0RzlYc2JRazNjOHFWRmMvYkl5L3NsNERo?=
 =?utf-8?B?c1pZOGVGL1ZGSlNMNXRQUVh4MkZBZW5PZ0w4SHZVUUdFckJ4d2I3L3luUVBj?=
 =?utf-8?B?a3RWTjdEeGFha3ZXMGkrbW4wSS91Z3FQYjdra09wRkFGdmI2QkZFRHJmVDQw?=
 =?utf-8?B?dm1NVnJ0ODVKMWpzcGEvdkFCVWM4V2FzRmhuV3NzUkozeVFpR1Yybkp2ZElI?=
 =?utf-8?B?akRCVjVSYmFjeTBFWGJRVXBLVjN5UEtINkl0VkhFT2R6cGdDb3U3dEIzVThK?=
 =?utf-8?B?M2l4bHBybkdJRlhzNVpQYlNJd2x4c24zMGxDUTZGY1h2c3JoRlFRV3NZZUZx?=
 =?utf-8?B?dm5nODd0L1hZaHZuYW9CT0FJNnhyNGpWbGtwalRDaWF4STRURU1wdXE0OEs5?=
 =?utf-8?B?OC9lTCsrQkFNRGNTWGRmYlY3bmFOYWcxRUd0ZHRnVlZkb2oydkJsRHZyTEl4?=
 =?utf-8?B?ZGFRSW9wUFhxTjVhejVBRS9kK2RBUGdqeWJnTUNCUmcvQkp0cm1ycTlHZC91?=
 =?utf-8?B?QWFVYm8vdy9GdUxMWnhhaTZYbEtYV1ZWYmRwUElYZFl0OTIwZ1lSVkgzdGZ6?=
 =?utf-8?B?eGZOZjBZbzY0RWRrU3pGbGhGVTlsVllsMzA1L1FNWGtsb3AwZUgzNGlPWFJ4?=
 =?utf-8?B?WXk3TDE5U2F2cmdyNGg4T04zWlFEcmJsbk5EU0EyZmFDN3liWkJBUTVwVStY?=
 =?utf-8?B?STI0QnhkV25vLzhQU095Y2JiWSs1N1NRQXcraGNBdmxIdVloakdjZWJ1czRD?=
 =?utf-8?B?WXMvMC9taVZBSEZZcXBCWk9yQVdQR0YyaDhrRzNOK1hvVS9ZejEyNWxodVhy?=
 =?utf-8?B?OFlQOHM2UkdhclZJRGIvbHBQWlY1a3Y3eERpMzA4ckFYUTVvL0ttTzNDbUt5?=
 =?utf-8?Q?IY+UwNiQ4SUjD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fb741a-7785-45c4-e868-08d90e5d6294
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 18:00:49.9668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dIojfclLxZ2CdDNsMkIfpdC9rAi40bMCKetyyo0Yr/d5ov73E3sEHN5UXYkAeML8vA1J8vGOGczpMp9zmtGcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4447
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-04-29 11:13 p.m., Alex Deucher wrote:
> On Wed, Apr 28, 2021 at 11:13 AM Andrey Grodzovsky
> <andrey.grodzovsky@amd.com> wrote:
>>
>> Handle all DMA IOMMU gropup related dependencies before the
>> group is removed.
>>
>> v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 31 ++++++++++++++++++++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   |  3 +--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   |  1 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    |  9 +++++++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 13 ++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/cik_ih.c        |  1 -
>>   drivers/gpu/drm/amd/amdgpu/cz_ih.c         |  1 -
>>   drivers/gpu/drm/amd/amdgpu/iceland_ih.c    |  1 -
>>   drivers/gpu/drm/amd/amdgpu/navi10_ih.c     |  3 ---
>>   drivers/gpu/drm/amd/amdgpu/si_ih.c         |  1 -
>>   drivers/gpu/drm/amd/amdgpu/tonga_ih.c      |  1 -
>>   drivers/gpu/drm/amd/amdgpu/vega10_ih.c     |  3 ---
>>   14 files changed, 56 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index fddb82897e5d..30a24db5f4d1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1054,6 +1054,8 @@ struct amdgpu_device {
>>
>>          bool                            in_pci_err_recovery;
>>          struct pci_saved_state          *pci_state;
>> +
>> +       struct list_head                device_bo_list;
>>   };
>>
>>   static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 46d646c40338..91594ddc2459 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -70,6 +70,7 @@
>>   #include <drm/task_barrier.h>
>>   #include <linux/pm_runtime.h>
>>
>> +
>>   MODULE_FIRMWARE("amdgpu/vega10_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/vega12_gpu_info.bin");
>>   MODULE_FIRMWARE("amdgpu/raven_gpu_info.bin");
>> @@ -3211,7 +3212,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
>>          NULL
>>   };
>>
>> -
>>   /**
>>    * amdgpu_device_init - initialize the driver
>>    *
>> @@ -3316,6 +3316,8 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>
>>          INIT_WORK(&adev->xgmi_reset_work, amdgpu_device_xgmi_reset_func);
>>
>> +       INIT_LIST_HEAD(&adev->device_bo_list);
>> +
>>          adev->gfx.gfx_off_req_count = 1;
>>          adev->pm.ac_power = power_supply_is_system_supplied() > 0;
>>
>> @@ -3601,6 +3603,28 @@ int amdgpu_device_init(struct amdgpu_device *adev,
>>          return r;
>>   }
>>
>> +static void amdgpu_clear_dma_mappings(struct amdgpu_device *adev)
> 
> Prefix this with amdgpu_device for consistency.  E.g.,
> amdgpu_device_clear_dma_mappings()
> 
>> +{
>> +       struct amdgpu_bo *bo = NULL;
>> +
>> +       /*
>> +        * Unmaps all DMA mappings before device will be removed from it's
>> +        * IOMMU group otherwise in case of IOMMU enabled system a crash
>> +        * will happen.
>> +        */
>> +
>> +       spin_lock(&adev->mman.bdev.lru_lock);
>> +       while (!list_empty(&adev->device_bo_list)) {
>> +               bo = list_first_entry(&adev->device_bo_list, struct amdgpu_bo, bo);
>> +               list_del_init(&bo->bo);
>> +               spin_unlock(&adev->mman.bdev.lru_lock);
>> +               if (bo->tbo.ttm)
>> +                       ttm_tt_unpopulate(bo->tbo.bdev, bo->tbo.ttm);
>> +               spin_lock(&adev->mman.bdev.lru_lock);
>> +       }
>> +       spin_unlock(&adev->mman.bdev.lru_lock);
>> +}
>> +
>>   /**
>>    * amdgpu_device_fini - tear down the driver
>>    *
>> @@ -3639,12 +3663,15 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>>                  amdgpu_ucode_sysfs_fini(adev);
>>          sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
>>
>> -
>>          amdgpu_fbdev_fini(adev);
>>
>>          amdgpu_irq_fini_hw(adev);
>>
>>          amdgpu_device_ip_fini_early(adev);
>> +
>> +       amdgpu_clear_dma_mappings(adev);
>> +
>> +       amdgpu_gart_dummy_page_fini(adev);
>>   }
>>
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> index fde2d899b2c4..49cdcaf8512d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
>> @@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>>    *
>>    * Frees the dummy page used by the driver (all asics).
>>    */
>> -static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
>>   {
>>          if (!adev->dummy_page_addr)
>>                  return;
>> @@ -397,5 +397,4 @@ void amdgpu_gart_fini(struct amdgpu_device *adev)
>>          vfree(adev->gart.pages);
>>          adev->gart.pages = NULL;
>>   #endif
>> -       amdgpu_gart_dummy_page_fini(adev);
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> index afa2e2877d87..5678d9c105ab 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
>> @@ -61,6 +61,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
>>   void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
>>   int amdgpu_gart_init(struct amdgpu_device *adev);
>>   void amdgpu_gart_fini(struct amdgpu_device *adev);
>> +void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
>>   int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
>>                         int pages);
>>   int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> index 63e815c27585..a922154953a7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
>> @@ -326,6 +326,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
>>                  if (!amdgpu_device_has_dc_support(adev))
>>                          flush_work(&adev->hotplug_work);
>>          }
>> +
>> +       if (adev->irq.ih_soft.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
>> +       if (adev->irq.ih.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>> +       if (adev->irq.ih1.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> +       if (adev->irq.ih2.ring)
>> +               amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>>   }
>>
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index 485f249d063a..62d829f5e62c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -68,8 +68,13 @@ static void amdgpu_bo_destroy(struct ttm_buffer_object *tbo)
>>                  list_del_init(&bo->shadow_list);
>>                  mutex_unlock(&adev->shadow_list_lock);
>>          }
>> -       amdgpu_bo_unref(&bo->parent);
>>
>> +
>> +       spin_lock(&adev->mman.bdev.lru_lock);
>> +       list_del(&bo->bo);
>> +       spin_unlock(&adev->mman.bdev.lru_lock);
>> +
>> +       amdgpu_bo_unref(&bo->parent);
>>          kfree(bo->metadata);
>>          kfree(bo);
>>   }
>> @@ -585,6 +590,12 @@ static int amdgpu_bo_do_create(struct amdgpu_device *adev,
>>          if (bp->type == ttm_bo_type_device)
>>                  bo->flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
>>
>> +       INIT_LIST_HEAD(&bo->bo);
>> +
>> +       spin_lock(&adev->mman.bdev.lru_lock);
>> +       list_add_tail(&bo->bo, &adev->device_bo_list);
>> +       spin_unlock(&adev->mman.bdev.lru_lock);
>> +
>>          return 0;
>>
>>   fail_unreserve:
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> index 9ac37569823f..5ae8555ef275 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.h
>> @@ -110,6 +110,8 @@ struct amdgpu_bo {
>>          struct list_head                shadow_list;
>>
>>          struct kgd_mem                  *kfd_bo;
>> +
>> +       struct list_head                bo;
>>   };
>>
>>   static inline struct amdgpu_bo *ttm_to_amdgpu_bo(struct ttm_buffer_object *tbo)
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> index 183d44a6583c..df385ffc9768 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
>> @@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> index d32743949003..b8c47e0cf37a 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
>> @@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> index da96c6013477..ddfe4eaeea05 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
>> @@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> index 5eea4550b856..e171a9e78544 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
>> @@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
>>
>>          amdgpu_irq_fini_sw(adev);
>>          amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> 
> Shouldn't the soft ring be removed as well?

Right, thanks for noticing.

> 
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> index 751307f3252c..9a24f17a5750 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
>> @@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> index 973d80ec7f6c..b08905d1c00f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
>> @@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
>>          struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>>
>>          amdgpu_irq_fini_sw(adev);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>          amdgpu_irq_remove_domain(adev);
>>
>>          return 0;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> index 2d0094c276ca..8c8abc00f710 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
>> @@ -525,9 +525,6 @@ static int vega10_ih_sw_fini(void *handle)
>>
>>          amdgpu_irq_fini_sw(adev);
>>          amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
> 
> Same here?

Yep.

Andrey

> 
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
>> -       amdgpu_ih_ring_fini(adev, &adev->irq.ih);
>>
>>          return 0;
>>   }
>> --
>> 2.25.1
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7C6b1f10b7bfb5491e025008d90b86044a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637553492499443932%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=WagbcvZG9xsaX6cKlMG%2FzMD%2FlYQlUSgxSQjnUHB8Myc%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
