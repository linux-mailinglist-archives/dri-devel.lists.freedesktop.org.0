Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A057D389C3E
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756C6EE9D;
	Thu, 20 May 2021 03:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC26F6ED9F;
 Thu, 20 May 2021 03:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cpp8IFVOZX0frhmQrfNpfxkpWE1q2NJEelqYs9I8Ek6BihvQDMYjSqvU5INA9+1KIRsrPmDciV4p7VAP0zN9jcIYo7hsb+HG1hd7j5aht0QzY50siO3F/zxCUL2l/QZFgwGavqphmz3XzQUtXdcKgRWPk8O5cXN+nBdrRRBjTS07ZNUZGmV8MY24rCmXWRiwe0nRSIPJmekFOieiF1erm9f/F7APgiZw6bb3gCBRKkDPSWyukXhgHkL10Guiog17rUq85IxdpGxHGw++SmcV9c1SJ8glE+ayjB6K5P1cmEx8dYdhKndpL+JQR5FAscY55Qdizmrx5XR6akidKArrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIHZ/LAg73LpLD/L/Qh2T015TFK5j8aeAMJ5CSEoZ6c=;
 b=CPYYfPOwHwmRph0EuevTGeruzOCnfgJXXi8D9eVARY/Snj5ijV4dv44ogt3U5zDL5n2ZySlfxf1VLqugVxz88HT/QunaJJL4Dg+nQGMzT31VvmpEAzdrGqah46deC4uY3IwnaHW4d5Dr8dYdc3U24Ubb+hiIKSHADzTwPRhTEIsODlgDvAAgMw5T6t2HlvopM/lIwTmctdGK6Kk1kiKyjOvVeq0pUqgQTAw3eSqY+yB2HuqQo5xMNkdzoCnyaE4DqPwuCpFt0R0uW806c6U7CqITO5UkEDzyKptLTujQ/F9tpDns/3Wk2AFGdnUGhdfojbldlFvIVmWgMeTjmNHvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIHZ/LAg73LpLD/L/Qh2T015TFK5j8aeAMJ5CSEoZ6c=;
 b=w0WI+SzRwmT6RN+7OWos3GKkItBNL5eUtBigmF2OgDeshTIAhIzuhIhBWGI66XFnKcOU0RUO8HhPnTbdYHlKXirozhdP7B9pGuxqPabOlUvTUzOZmf5prXWWGxUwJERMUteUHHT6aIBBUbK86LQJavxa958dH24+sww0hjqzlXE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2350.namprd12.prod.outlook.com (2603:10b6:802:24::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 20 May
 2021 03:58:20 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:58:20 +0000
Subject: Re: [PATCH] drm/amdgpu: Add early fini callback
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch,
 Harry.Wentland@amd.com
References: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
 <20210520032057.497334-1-andrey.grodzovsky@amd.com>
 <ab262224-fd1d-31a2-72cd-54174fba17ae@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <db5851f2-cf19-4c29-5f17-ecd3fb050845@amd.com>
Date: Wed, 19 May 2021 23:58:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <ab262224-fd1d-31a2-72cd-54174fba17ae@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:9c48:15d0:c2cd:c6e0]
X-ClientProxiedBy: YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::23) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:9c48:15d0:c2cd:c6e0]
 (2607:fea8:3edf:49b0:9c48:15d0:c2cd:c6e0) by
 YT2PR01CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Thu, 20 May 2021 03:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 746fedd9-676f-4721-c06b-08d91b438165
X-MS-TrafficTypeDiagnostic: SN1PR12MB2350:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB23500A2E2459D3763CC014FAEA2A9@SN1PR12MB2350.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5gbu6ibDkVAiuPBm6M9SxdjlO1rVaKN36AT9cSr6i2Ztk7aF1O2gdSAYSZ6aMtAZp3zLIs14T1gWO+3CJ74aPrvDFGTX+k9OROLYl/NnsYo1Gt43ejghCheCOv+iMK5N2lX7WU0Bn3a6onE0Xu/bJszIEUEBPCk3sUcwUs8TXvaFiBEISWUpVAnLW+w6B+MO8ZODNJwBkuGHrYB0XTx2RyzR0xQp0ANWQsIAE0XEQCSV8q6lmKeNDqcLCPZqICkiMEOfev5o8rptXeXo18W/fIZgvrD0vnRp2rKBvP/lGWuyfBVWWDMjwCVyklK9EHxmnLHF2Nq0dObS+EUz1SF84QbJq11qnTpuVMmOp0QdKMLsPTs3iAUzxGwUl190S/ESWxvNgLG1SVGdoTmN3GK6sllEznnSiR/i4I+IGg3itLUtSi1r0HN5H26odc0ervKvZNFmUCwZ8RDwKU63GaZAGfTC32sicWYYTrpN+QaCpujDVsL5ZaiVXul0Gkb2Y+HmaQ9GXKuZPFC7xUyElGrTcNXWqxlv7cMQ5MdjhMUbDakBFiEh2fqnRSvhSk0P/zubhWzqBh5Qk/tEGZ81Rj4mohpKTKothmsr2o8EJo4c+OpHfCoLiaTW+UHBe2wzIk3KDM75gy3IQIxM/C4ahfXLv6i8Pa6+M88SFoh6EyAMc9QAKSGY2SmaMei4ElsUkgr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(52116002)(2616005)(44832011)(16526019)(186003)(31696002)(8936002)(6636002)(86362001)(8676002)(38100700002)(53546011)(4326008)(31686004)(5660300002)(316002)(478600001)(66946007)(66476007)(66556008)(6486002)(36756003)(66574015)(83380400001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHFHSWM3VGI0QnU3OElGVHZ1Qi8xMUxNL25PUmRYU05IL0h4cWlvRkhwcW9U?=
 =?utf-8?B?M0NEciszcG1Tak5vQlNPYjkrL1cwMC8yVEY1UENlTUxxV0FsZDJYN21HeHh2?=
 =?utf-8?B?eFpuQUV3NXorSlFUMWMvZUxzS2l5OGQ2VFhnY3VSMUlQOTIrQ3VUSnlmN29j?=
 =?utf-8?B?MldJNms0RnZMdDZyY0Nac3B4YWQyaFlXWWlSM3d1NlppYm1rYmFZOXdJSytT?=
 =?utf-8?B?VVozeEZKb1NORGJLVUx6d1IyT0lmRnp4WHh4c092SjRhWmdoWGI5Y0xreU90?=
 =?utf-8?B?M2VQbWNRSkRsenFkSlF1ZnNhcTVETlh0TE0wWDEvblZrQi81VUN0cVorbHlt?=
 =?utf-8?B?RFd6aUlyZU45elZ3NENZRUVHVi9rTmtVaXpIaGZRcnNNajRXVWxYeW5FWDVZ?=
 =?utf-8?B?bEtFckI3ZDhkMUdEbCs3L2had3NlVFQwUElnNE1CaXBJV2tiRGlHeitJZG9O?=
 =?utf-8?B?Z3ZPdVRDdHcyU3lMNjVRLzlCZytubjFsd1M3UnpKdHprMlUvQ2FaLzZ3OUE3?=
 =?utf-8?B?UDh4alZYNmxIVnZqaDZYNmNackJMVWplYUJVM1J3dklJUjBpRmRDQVVPSGhO?=
 =?utf-8?B?U0JXdTV5aEd2dlVidzN3emd5UGhEcy9MRzFQMjVYNFUyV3hWUHV1SVU4Tzll?=
 =?utf-8?B?SGRWSlUzUGFYbHhqdWUzZENnUnlUL3BBaHo4YUh5NjIvbi9NWmRLY3AyWm1Q?=
 =?utf-8?B?TEVSc3dMUWZzTUhtRlFJUjZPYmFLaDNJbmFLaUxiSm05R2JnTVpBWTg3bU52?=
 =?utf-8?B?Zzc3Ri9JcU4vZEZNTEk2cGF4MVFtNVlBU0JQeFJlR1RyeFRDeC8vcnlhbTdM?=
 =?utf-8?B?dGFmbnBkVE96akMxbSttSWNGSEZhTFBmemdnWTJmTTlkVWMydVdXb0NyRlZl?=
 =?utf-8?B?TTZpd1pBaWFyb0FuR2x3cFd3N0M5RFp6S0ZDaE9mSy9oU1FnU2oya1pBdTBl?=
 =?utf-8?B?Nks2dUxhdFdiU0tEM0xYc1A3L0VVcmRTR0Y4QXY2bXFoZ1ptaFlhNmtOaG1w?=
 =?utf-8?B?NnhIM3drWUxLQWFxMjhCK3ZBb0JyZlpTYTltZGN1V2dTWi9IbGlaaHhwRWI3?=
 =?utf-8?B?ZllzRmd5Nnl6aEVjZU9Za1ZDUUxrNUZRbi92cGd4dlBmOU15a0psbWhTQ1ZP?=
 =?utf-8?B?Um1QSm5MRlBHcU0zbU1pRmFmUHJSYnFFZlN4NU1zL0VzVXZJb0dEaGVwT1hr?=
 =?utf-8?B?VUxQOXpuUXFEQ2VyZS92TC9ScTBnaG9SQ2xJMXpQemhWSWlpRVpRQ2h4YkpE?=
 =?utf-8?B?dkZIdXpPWVFQZUppVlBhOU1kN3RVQkFpelkwNlEwTkRiWmk3SWtwQzVaL1h5?=
 =?utf-8?B?M1pCUkhLUEM3K2ZuOU4wTmNPTXpmeWNUNkFNUFRIdXh6ZFh0TGNKKzFrVWtk?=
 =?utf-8?B?R0tTTXQ0eC9XeGlKTWpkWlhkSERMQjdVUHhqZEdjRHIyR0d6TUptTnlnRWty?=
 =?utf-8?B?WHpSY2duQ0Q1ZVhLazFib3lsbmNlRk5DNjlUblpLNDlPTjhuQzdtaHN0OVVh?=
 =?utf-8?B?OFBLNmgyQ2ZNMGQ4bFkwSWJER052eDJEcm9vOGlDQXdUWGE5dG5MMEtQK3Qv?=
 =?utf-8?B?OGNNemdjZEtnUXF5SkpROFFUcExjRHZpUlI4VkFCT1V6Wm15bzBFVGY1NWNS?=
 =?utf-8?B?RVFHR2ZNcjJxeC93S0kzL0Y1ekVQaExjdGZVN2VhcEtrdGIyeWp6ejN5MENn?=
 =?utf-8?B?TFZpcHhQYzJpSkczazFPZHpud3lpZUlnWS9ta3hWS0RKR1QyM242dzRIYk5X?=
 =?utf-8?B?UG5iUExsN3dvWnQ0K2FRdzJiSUVidlNBa2Q2Z2VnUDBBQmo2RTB5bm5SRTgv?=
 =?utf-8?B?U21MeHhQYWdTVFZQQmplSSszekZHaXdyNVA0dko5UG1pL1EzYStWemxZQnYx?=
 =?utf-8?Q?/1998IAqvnzVw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 746fedd9-676f-4721-c06b-08d91b438165
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:58:20.0312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LSDSDufrgsSCff9iyucQZSWJlNsVyFNpuyKDd0BgPoh6JIeg+sIQEr0OwTGY+XJU2mrSF36UxhgW83fboN9iOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2350
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-05-19 11:29 p.m., Felix Kuehling wrote:
> Am 2021-05-19 um 11:20 p.m. schrieb Andrey Grodzovsky:
>> Use it to call disply code dependent on device->drv_data
>> before it's set to NULL on device unplug
>>
>> v5:
>> Move HW finilization into this callback to prevent MMIO accesses
>> post cpi remove.
>>
>> v7:
>> Split kfd suspend from device exit to expdite HW related
>> stuff to amdgpu_pci_remove
>>
>> v8:
>> Squash previous KFD commit into this commit to avoid compile break.
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> Acked-by: Christian König <christian.koenig@amd.com>
> See one cosmetic comment inline. With that fixed the patch is
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


Thanks for quick response, updated.
Since this was last commit to review I also pushed the series to
drm-misc-next.

Andrey

>
>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 59 +++++++++++++------
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  3 +-
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
>>   drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
>>   6 files changed, 56 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index 5f6696a3c778..2b06dee9a0ce 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>>   	}
>>   }
>>   
>> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
>> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
>>   {
>>   	if (adev->kfd.dev) {
>>   		kgd2kfd_device_exit(adev->kfd.dev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 5ffb07b02810..d8a537e8aea5 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> @@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
>>   			const void *ih_ring_entry);
>>   void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
>>   void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
>> -void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
>> +void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
>>   int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
>>   				uint32_t vmid, uint64_t gpu_addr,
>>   				uint32_t *ib_cmd, uint32_t ib_len);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 8bee95ad32d9..bc75e35dd8d8 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -2558,34 +2558,26 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
>>   	return 0;
>>   }
>>   
>> -/**
>> - * amdgpu_device_ip_fini - run fini for hardware IPs
>> - *
>> - * @adev: amdgpu_device pointer
>> - *
>> - * Main teardown pass for hardware IPs.  The list of all the hardware
>> - * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
>> - * are run.  hw_fini tears down the hardware associated with each IP
>> - * and sw_fini tears down any software state associated with each IP.
>> - * Returns 0 on success, negative error code on failure.
>> - */
>> -static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>> +static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
>>   {
>>   	int i, r;
>>   
>> -	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
>> -		amdgpu_virt_release_ras_err_handler_data(adev);
>> +	for (i = 0; i < adev->num_ip_blocks; i++) {
>> +		if (!adev->ip_blocks[i].version->funcs->early_fini)
>> +			continue;
>>   
>> -	amdgpu_ras_pre_fini(adev);
>> +		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
>> +		if (r) {
>> +			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
>> +				  adev->ip_blocks[i].version->funcs->name, r);
>> +		}
>> +	}
>>   
>> -	if (adev->gmc.xgmi.num_physical_nodes > 1)
>> -		amdgpu_xgmi_remove_device(adev);
>> +	amdgpu_amdkfd_suspend(adev, false);
>>   
>>   	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
>>   	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
>>   
>> -	amdgpu_amdkfd_device_fini(adev);
>> -
>>   	/* need to disable SMC first */
>>   	for (i = 0; i < adev->num_ip_blocks; i++) {
>>   		if (!adev->ip_blocks[i].status.hw)
>> @@ -2616,6 +2608,33 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>>   		adev->ip_blocks[i].status.hw = false;
>>   	}
>>   
>> +	return 0;
>> +}
>> +
>> +/**
>> + * amdgpu_device_ip_fini - run fini for hardware IPs
>> + *
>> + * @adev: amdgpu_device pointer
>> + *
>> + * Main teardown pass for hardware IPs.  The list of all the hardware
>> + * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
>> + * are run.  hw_fini tears down the hardware associated with each IP
>> + * and sw_fini tears down any software state associated with each IP.
>> + * Returns 0 on success, negative error code on failure.
>> + */
>> +static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
>> +{
>> +	int i, r;
>> +
>> +	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
>> +		amdgpu_virt_release_ras_err_handler_data(adev);
>> +
>> +	amdgpu_ras_pre_fini(adev);
>> +
>> +	if (adev->gmc.xgmi.num_physical_nodes > 1)
>> +		amdgpu_xgmi_remove_device(adev);
>> +
>> +	amdgpu_amdkfd_device_fini_sw(adev);
>>   
>>   	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
>>   		if (!adev->ip_blocks[i].status.sw)
>> @@ -3681,6 +3700,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
>>   	amdgpu_fbdev_fini(adev);
>>   
>>   	amdgpu_irq_fini_hw(adev);
>> +
>> +	amdgpu_device_ip_fini_early(adev);
>>   }
>>   
>>   void amdgpu_device_fini_sw(struct amdgpu_device *adev)
>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> index 357b9bf62a1c..ab6d2a43c9a3 100644
>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
>> @@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
>>   	return kfd->init_complete;
>>   }
>>   
>> +
>> +
>>   void kgd2kfd_device_exit(struct kfd_dev *kfd)
> Unnecessary whitespace change.
>
> Regards,
>    Felix
>
>
>>   {
>>   	if (kfd->init_complete) {
>> -		kgd2kfd_suspend(kfd, false);
>>   		device_queue_manager_uninit(kfd->dqm);
>>   		kfd_interrupt_exit(kfd);
>>   		kfd_topology_remove_device(kfd);
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 9ca517b65854..f7112865269a 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -1251,6 +1251,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>>   	return -EINVAL;
>>   }
>>   
>> +static int amdgpu_dm_early_fini(void *handle)
>> +{
>> +	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>> +
>> +	amdgpu_dm_audio_fini(adev);
>> +
>> +	return 0;
>> +}
>> +
>>   static void amdgpu_dm_fini(struct amdgpu_device *adev)
>>   {
>>   	int i;
>> @@ -1259,8 +1268,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
>>   		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
>>   	}
>>   
>> -	amdgpu_dm_audio_fini(adev);
>> -
>>   	amdgpu_dm_destroy_drm_device(&adev->dm);
>>   
>>   #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
>> @@ -2298,6 +2305,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
>>   	.late_init = dm_late_init,
>>   	.sw_init = dm_sw_init,
>>   	.sw_fini = dm_sw_fini,
>> +	.early_fini = amdgpu_dm_early_fini,
>>   	.hw_init = dm_hw_init,
>>   	.hw_fini = dm_hw_fini,
>>   	.suspend = dm_suspend,
>> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
>> index 43ed6291b2b8..1ad56da486e4 100644
>> --- a/drivers/gpu/drm/amd/include/amd_shared.h
>> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
>> @@ -240,6 +240,7 @@ enum amd_dpm_forced_level;
>>    * @late_init: sets up late driver/hw state (post hw_init) - Optional
>>    * @sw_init: sets up driver state, does not configure hw
>>    * @sw_fini: tears down driver state, does not configure hw
>> + * @early_fini: tears down stuff before dev detached from driver
>>    * @hw_init: sets up the hw state
>>    * @hw_fini: tears down the hw state
>>    * @late_fini: final cleanup
>> @@ -268,6 +269,7 @@ struct amd_ip_funcs {
>>   	int (*late_init)(void *handle);
>>   	int (*sw_init)(void *handle);
>>   	int (*sw_fini)(void *handle);
>> +	int (*early_fini)(void *handle);
>>   	int (*hw_init)(void *handle);
>>   	int (*hw_fini)(void *handle);
>>   	void (*late_fini)(void *handle);
