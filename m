Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE7B37D449
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 22:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB0D89D30;
	Wed, 12 May 2021 20:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BC36E50B;
 Wed, 12 May 2021 20:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPviHPh5oE/r2EaPpevpVZ10bMI96bE0kwAHyguhiPKhVFNZP4MlsNyCsE+meVz+JJ5b1XH30RA7dJ1uf3CzHH1ERcua1HJnAzZnMK0eQ/+FytO75GzLLU+CQgv2110uCFjJFVxbHJD6BeBWXuS6g60pof5HIt1OsE1bcW+xbn9wP1QaK2hEWH2lD62XjCGeWR8U15A/df0DIE0EcJolk1z78eVoARb2Qo6P7ftRQjo9dnokyvr2wkhYw3mKw36puTtfyRrgeRhvt4PkJAIO1ME4ljhtijbcoo9jSJlJVefkgwv5H9WMuPFwYJBiXmyW7G2l9qbV1l3xHsPAaOKLKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKlgjTnyV25BjTSARJfnvSzOT3450XEOaEKVfXKgy4E=;
 b=Q+NN8wlOGOSyK+/wzwqztlwcDkEf19PviS4P01yhamOWV02HItYssbvvuK/jLLDapaRfLdkO8VIx3knzjktATgFRYEhp3S78AHPnrfhOMdwwht9AQC4CixxgGvspV062S8bQfHRzvB/EwrNiOzyJ5A3lTu4DeoXD5x98BEuc0LcO0NxvrPpcQydHw3VTpaA3f6DWXtBPTDGsQ1Vc38RKXRESfo3IlZtk+/6C3WLp1dFmm64VhEewb0xg9P3wnQWWC5MzwoFPZ+5vU6aydYnMy7FxCQ/2K2gv130dlFlkLmLYFNfohlw44QwUqywJSWdsdaEslifsUdBaHBPWVxyNdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKlgjTnyV25BjTSARJfnvSzOT3450XEOaEKVfXKgy4E=;
 b=elV9aY3W/7fhXx5jkb4XdvlJDvMMYk326E7jkT23YUB+xyaDN2g61FvVfxR51+mD/VtqZyp3upxyBk5DmHYSXUpetLFsNt14SP+t+5yz15GyrYXsE6pI98IbfwsxliW6NQ0RR55IvBnrUCWr4HzOEWjlqEAT+c6oGXf655nfHEg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2751.namprd12.prod.outlook.com (2603:10b6:805:6c::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 20:38:10 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 20:38:10 +0000
Subject: Re: [PATCH v7 03/16] drm/amdkfd: Split kfd suspend from device exit
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch,
 Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-4-andrey.grodzovsky@amd.com>
 <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <1bd1f32b-2705-b08c-2998-196a34fee7de@amd.com>
Date: Wed, 12 May 2021 16:38:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:3876:5646:9034:63b2]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3876:5646:9034:63b2]
 (2607:fea8:3edf:49b0:3876:5646:9034:63b2) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Wed, 12 May 2021 20:38:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd329df1-cab5-4f7a-4563-08d91585db5e
X-MS-TrafficTypeDiagnostic: SN6PR12MB2751:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB27517491B7C9F82BF5A706D3EA529@SN6PR12MB2751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d9GaA+dKlXx8oq3t/+TqilpIbBPIWz8s32071wf3Y9GgQ/75aVLu7LmhHi4TDzbgITmD1qguvtdS1m2A/9y/I0smMgX11dvK/eOgudRcSzuTprSVopsRBxip8PemBIo1eGjWHw7yO0OJXiVogamdV9EXmlITFupk4g/3ccY6Rs1cpCU83JS9tHzz/EqhE6a16Y6O08YEryMzXR1ZNmsrWggbpD1vs78Zkfw0xF10TM80Wp3v8GNxJTLXyxMkHajLU+UGofx6X9Iw5j8YRdwQMpa0/5UU+VeCzszZRmqMORWL9Sr9xlXErw60vY/Yc7MtX1vCJAzXO0KBV4ct+hzTBDnJuIJhr64afVzmSCWn5HhiOeH2qEEd2+t9c48IHqQIIBfDo60cEtikKG+9psstk3YifP8LfM6g3s8bnw2C7m/Xu8r9po9HyKBU1Ae2weHZ6gtFvLv7mp5Iq7j7Y3XUanzZKF66Yyj9QOZfHu8B6CBmyLXKshAdOjPXEYPD/sdaNd3BbRfN4LrrvlT5ted3emQlNy2LxAKd2EVzRHAf6jzXWDePofDDc4LSkfy+VeDC8UN+5yhSGKT0AhLHn3R5e9M+hjU/mtQtiotKLY5liblBGLts9570iMjqbhVC00WK+MNoZqn0jrk5PhVCHljDtHxxJrgSLoNOPvRvca3WY5ix1l5bcCw/y0+qL2BGDK64
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(44832011)(2906002)(186003)(53546011)(83380400001)(36756003)(6636002)(5660300002)(66946007)(2616005)(4326008)(16526019)(66476007)(52116002)(86362001)(31696002)(8676002)(66556008)(31686004)(478600001)(8936002)(316002)(38100700002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MzBPWSsxWWxMTGRDUHIwWkFFdTVhRUVlWmFmWklnUEYwVFVONEQzbndoOHhk?=
 =?utf-8?B?dmFLcXg0UkZoWS8rKzZObjE1eWZMbUJpc0ZmaVNvS1o2MmFISFhYbzdYa3lw?=
 =?utf-8?B?Y3prTXg0cXdTNDZFVExBTzZHeGFDVVovd2lNWk0vaElqaXhVSUNUMUNBTjgr?=
 =?utf-8?B?UUhJeEp2a3dMVGRDZ3h5RlJpZ1dpSzlxejA5U2RJQ21EM0E3Yy9yV0cwSHhC?=
 =?utf-8?B?alhMT3FadUxQTXpzdTRSdjJrOXp0UEFrQ0lhYXZDN0hsV0FvMHhwOEVOWmc2?=
 =?utf-8?B?YWtkZTllT0hLNzVBSFhRMm1wZURHb0N1N1pDTXBmd3h5NkN4M0FSTW1sQkhv?=
 =?utf-8?B?M0lsU0ZUQlhhSHJsVEowQ281d0ZEbTJlQ1pYTDNsYkRJcDdlbXl5YmpBdzBa?=
 =?utf-8?B?TlFxOHZGR3lYNklwSVZ0TVU3bEoxS21sM0xIek8zUlBWTFRxZUxoRUp1Ukwy?=
 =?utf-8?B?eWlmS1hlSVZpUllWZzM2aEpHV1M0UzdmTFJJWVVuaDJFSG85cTl1K09vN1R1?=
 =?utf-8?B?bHBBTnZHLzY3RDJCQ1g0cUdJdVFvUFBNc0tBd0QvZnRLY0JHNmRmK1d2YkNi?=
 =?utf-8?B?SW5LVzFWTW1WcVR5TllaMVhyRE5hUFExVkhFNDhLbWtabnhxVjRRWFNuM2Jn?=
 =?utf-8?B?YmF6S2cvczgxR2ZDMFNHTHVRaFl3QnpXZ1RLRDFIZk0zS1dIVENzRWRIcjNJ?=
 =?utf-8?B?ZC8zVW9mNE02aWpYZlMxdGRuUmp6bThnQXpRNEhSaTZaOUdoYXhGRWhjM3F0?=
 =?utf-8?B?eE1DVWFJa25HMEIzV2JJS3J3L2I4cjFmcFUvTVVjNXJNaHowakNYR1NjZ0xL?=
 =?utf-8?B?UWVqa01xbXlxY2JvaUJmZVNJS1p2S1M4b0ZxZE5pK0JKMHM4M0ZpMFdXUkZG?=
 =?utf-8?B?Y0IvOFFkdllNUnpDL2lnN2UrN0tyYXVoSTRndXlaNlh2bTh6VStlWkFBS2pn?=
 =?utf-8?B?aG5Kd0U2OW0zYmhTeVRCN0ZjM05VYXdQSXdOL25UUm5pdys4UzVaT2hQWmN5?=
 =?utf-8?B?USthOUw1STU2akhkUDNCYTFsaFV1LzBMZTNDTlNyV09KMk9wS0ZzcUM3M0Jl?=
 =?utf-8?B?WENyVlRURUtxdXcyUGRycmdtWHBLN2h5cHFyb05jNkFkNVlnN283bWtzMGxP?=
 =?utf-8?B?bStiUm50MWM0VnNaZTBwelNoN2NrMk5ST20vNXpLZW4yNlFXT29vRnkxM1R3?=
 =?utf-8?B?MTcwQmZyWGltTXlvQ2Npc2M0bG1LSTJ3bGdHTTRwMDFvMTdvdmxyTE1zYlBO?=
 =?utf-8?B?dTZCVklBR21qZjhVcGlBZ2JaZE1SMW1aeGhSbU5SYm1UNEFwd0FueVFXalRQ?=
 =?utf-8?B?Zk1raVA3c0pXKzZmT2Z6cWk3dUczRVVtdWplMWdQcUVGbzFkNTkxS1lVYWl6?=
 =?utf-8?B?Z3lHcjBWQ2pCV0w3YUIvZ3hjVW1vcjcvQzdUMFZZekZKc01LZkw5cVJ1V3FF?=
 =?utf-8?B?SUE2a281eTIyR1ZZYk1nNVpBOEl0eDc2QTk4VDY4NEV1Vk12clhEd3Jqa3hh?=
 =?utf-8?B?dm1tMkpNWTBva1BWVXVlQlJEMXBlVzlHKzEwOElYeEJ0RW0yd1kyTHJESTQz?=
 =?utf-8?B?Q0k0L2htOTY4L1d1MCs0U1Uray9IendCUk1MbHB3aGRncFFHVXdqM1d0WFk3?=
 =?utf-8?B?VVNoYWZFODA1aUppWURnelVQZG9nOFY1and5b1o0emlrQmIzSHIzUjlvWmlK?=
 =?utf-8?B?YWxJcC8ydWdLNTdKQzJXRDVkRjh1aUI5RTVaZ2I0QzVaRXVBSVk3V1EzK0Y2?=
 =?utf-8?B?ZWxvMmVGMGNkTG5xYTFlMW4rQWJkZW0ycnRQSDhWd1JVZndKUjhIaEptakQx?=
 =?utf-8?B?WnMvb3ZpOXBoZEl1WjdkSUpKWnY5NURlZUFjbGx6WU5VK1BySy9PSDJQNVBL?=
 =?utf-8?B?WFZsZG9sZDBzQy8zM3UzL3N0RTBZL1J3SSs3YUhxeEJ1Z3c9PQ==?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd329df1-cab5-4f7a-4563-08d91585db5e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 20:38:10.7746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UakmWNtBOaKm0n3b49dgL2rnqekvIOs80f0JrNj9naZjW9ZA0pWQadwNdyB8TBzQZa/ZvgOB65cJtNlm/yKU6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2751
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2021-05-12 4:33 p.m., Felix Kuehling wrote:
> Am 2021-05-12 um 10:26 a.m. schrieb Andrey Grodzovsky:
>> Helps to expdite HW related stuff to amdgpu_pci_remove
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h | 2 +-
>>   drivers/gpu/drm/amd/amdkfd/kfd_device.c    | 3 ++-
>>   3 files changed, 4 insertions(+), 3 deletions(-)
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
> 
> You're renaming this function, but I don't see you fixing up any of the
> callers. Looks like you do that in the next patch. So this patch breaks
> the build, the next one fixes it. Maybe you need to refactor this or
> just squash the two patches.

Will do.

Andrey

> 
> Regards,
>    Felix
> 
> 
>>   {
>>   	if (adev->kfd.dev) {
>>   		kgd2kfd_device_exit(adev->kfd.dev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
>> index 14f68c028126..f8e10af99c28 100644
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
>>   {
>>   	if (kfd->init_complete) {
>> -		kgd2kfd_suspend(kfd, false);
>>   		device_queue_manager_uninit(kfd->dqm);
>>   		kfd_interrupt_exit(kfd);
>>   		kfd_topology_remove_device(kfd);
