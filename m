Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C8A77DE3A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3971010E31F;
	Wed, 16 Aug 2023 10:12:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FD710E319;
 Wed, 16 Aug 2023 10:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkhsnb68pc4h8N4oLJkrMTAPxi4yTYCWCoWrEVWEKSwTUu/sK2Mb409xrZITJ9VXlohMpap0n8S4GI6bUSlTVMo1uBAa6ZUk6TrTGPb0LqMJ4v4SnGC39cBUrYyMclbr19RAOgYccJZtnBm7XP6VfiTG03QZzQ9pl9UEVn2qi6HPk4KX4B5U5bgFZ33hhm6R01/QYtUYuVwvzzlB5sq5GEJG8iRXKuso9biW9XMtZuG/bxc3paXSxx0ZheKNkgO+W2Tnmri1MdgfRfMORVlzDfOHInTVfBLcsvVg5sRnMzinKAkUAQ7aJjdx9frm8pa2XCiReKF0uNM1JYVPsLj8lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18eHTZCtj+ZYwB8OqEl+pOl5t915gZqSXjV71TyqvgY=;
 b=mN8TfS9G+MdwXgQIyGS11sT/JBYz8MTp9crFUdkNYPWSlhC0SqFCNzZDx5txTA3snRuTA9sPy01y49lk0xTEilb+Vg/BTaxY0q0+xC9O6AFC+5U90ZOG0wwQWnQk8RzUYh7E1A0jE04AEqdGZbuUUOvn0fQARbXnvIqKEJhovlk9/I/prBczNWz1VONxKEhFlwsAhknqIIv3Px/HvhzxobkBDgeCVjr0STu6Slqi6hytFJopmMOyonBYMdsOKV5yiYFPwYRLVR2CVpEvYhryNzc8lodhJ3dXuL2tO2qwoAXW1joefsBBIEEcvEU/xARqdoRP+6Vaciyj3CdvnzXKnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18eHTZCtj+ZYwB8OqEl+pOl5t915gZqSXjV71TyqvgY=;
 b=aijwC8lB+aMkxD9o/xpJDT7XfhS0zWi+oytT4zmeDCk9SSHlrS0o8wl+32MDcBgBVCGb88ps6RINj0ok5+81qDg/Yz/WHmfZBEDcBOV5yXx625nuLmBV6iANgbITtcIJsKWW0mnSAR7jORVh4d0MtXoo5WXGCyTx2QdyGcHAK+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DS0PR12MB7779.namprd12.prod.outlook.com (2603:10b6:8:150::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Wed, 16 Aug
 2023 10:12:01 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::dc06:ffb3:46ec:6b86%3]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 10:12:01 +0000
Message-ID: <96501138-ac3f-ec94-efca-aa642aa64a00@amd.com>
Date: Wed, 16 Aug 2023 12:11:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] drm/amdgpu: Rework coredump to use memory
 dynamically
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230815195100.294458-1-andrealmeid@igalia.com>
 <20230815195100.294458-3-andrealmeid@igalia.com>
 <55088d5f-b241-8121-4ac5-e3b0c7cc53c5@gmail.com>
Content-Language: en-US
From: Shashank Sharma <shashank.sharma@amd.com>
In-Reply-To: <55088d5f-b241-8121-4ac5-e3b0c7cc53c5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::17) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DS0PR12MB7779:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6d39ba-a42e-4780-e050-08db9e413b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZQQopeLMnDYg1Ekri3SqsLl7SpF+TLTLR6DAHfClrDiDfCEKVFJeMuX907fW/IYHZzxiUiqI8L5xRV4Sg1uKokVpiurcaQF8S2zVIkN0S9Pusgf0aXJyZ1IEV5IWcpge6K7aSnWU11cC/6aeVA0GKc0qwLjfhm/mDaKk1s4e9rxgNJV63szAybbR5jqZ0xw5ZiQ8FUmqKUtuSlK2ZPsga9aKjWY0iOzj1vBCPndW6mZrYnnbZmIWQf4PPUyL0++D9FwBwJdLiMNEGFEMzvH/uNGKa84nfAb1eDt4e9ilDiD3VX74ckPLgDdIJ118Ma2Q2ejNLmpAUWONpOg8VFzgT9TCZikeW6RgZMZ0olseSoEmfEJsCBfNceVHYfMLfohJtnuYGPB0nQmGbwnsAePFbvNTQbC8zolHfjU2Jl+1g0ZelMp/rIuZWFR2xGV/zJISjwrACmbAn+VRohunKnSOMndZoRAyDYsDe6BLYByT0JofXhNfYSSSGZZYsbH6HohYluQ+zzNPB0Y4fxKCzB6lg15a/ce4YjsQJF0O0tJ13k8oiATlXgV2bYpewnu0rTOeN4ngAYdw+CbJNE8a7C5nKrCE3TBBtQtmaXjLo0A4SkrYC+4c/Ir80DFOIdHJCehGRyodD/l1xlSVCwLcZ8QFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39860400002)(1800799009)(451199024)(186009)(2906002)(83380400001)(7416002)(86362001)(478600001)(31696002)(6506007)(36756003)(6486002)(2616005)(6666004)(6512007)(53546011)(26005)(5660300002)(44832011)(41300700001)(54906003)(316002)(66946007)(66556008)(66476007)(110136005)(31686004)(8676002)(8936002)(4326008)(66574015)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHN2RzNIbEJQQXk2bXgwTFdrb0dFZlZRVTZHa1hKZS9wb1hmTHV4T0hnbk9N?=
 =?utf-8?B?M3pJellCKzBveGxuKzdIdzFXS2J5aGRnaUVlMHYrcHhyNHRCdm1RYmJ6RXJS?=
 =?utf-8?B?R0xtSGxmcEkzVmpYc2srbHB3TVpIbG56VFJENTVZZmhTblNyZm1SOTY4ZW43?=
 =?utf-8?B?alpwUVVXdS9jRW5FcEUvN0lDN0s1dlR5Z2RmVmpHV2wvWCtFWkp1Ni9qSjdv?=
 =?utf-8?B?S1o2QjF0WW9nWVVOR2N3dFBxZFdhdFJtMGNyUlk1Z2pZWlJRTEZIam5mQ1pG?=
 =?utf-8?B?NnpKSWVkWnd3b2t1WnRkZnpYWjdZWVdUNWNzVTRlbjc4YWkyQWNvSFcvNzQ3?=
 =?utf-8?B?V2lib1dwdXFrVE0rVkxpMlBjbmlmTzZVYUY1a094c21RcU9RczZCa0ZIQWpx?=
 =?utf-8?B?YnkrTUJnUWJHam1LZHZRT3QzVUpoM2VkQ2xEQzFFOVVKTGpHN0dPVkt2MXFy?=
 =?utf-8?B?dXhhbzhKSE10NFJMcUtBVFZSNUxubmNpWUJzTjFKVVVEMVdnbUwwa3VTKzZp?=
 =?utf-8?B?TUFkNFF2SWE3TEJyaEtUR1g0U3JQSnBFMVZkTTdrYllOOWhiU3NZOXFIWk90?=
 =?utf-8?B?SXY4d0FMQS9MOUVWN3VvWDVOUDVOcUYzcDl3ZnNEaHR6RXRDdHJKZmxjbm5v?=
 =?utf-8?B?N1VSbEJFNCtQRjN2SWUvRnREelovM1kxWDlSdFNkeCtuSk8wZGZMR0NRanZp?=
 =?utf-8?B?cVFaTE9STTRmSGxaaXZWWWJQekh4UjNwQ3czcjEvaGFIcEI1ZlZFL3NrdHhE?=
 =?utf-8?B?K0dkL0piNlpQRW1yOEsrSDBENnBrdzRWVG96dnpjVmc3cjRQVEtqRXk5dWl0?=
 =?utf-8?B?N2w0VG9ZaEJsVE5tbVlEMndqTHc2d0Rwd0hKVGR6bFZ0UFBUYzJwTmpZSE91?=
 =?utf-8?B?MG1TSGxReE1DZFBaNnd0OFA2d0FxR2djb0tMQlFTMStLSU5hZk1mZlZEN2c4?=
 =?utf-8?B?UHJTZno1R3FwK1pVWjJ1ZFdEYzZpZS9XVGNtbFBVMGsyL1d2NllOMEFHaENQ?=
 =?utf-8?B?Q05BeTI4MW5yYkJPSXFOSlpPQ0JDQlZTdEcxd2lqdGliNVdsZGFPdFBpMGVF?=
 =?utf-8?B?OFExbVRaZjdOVjh2QTFIMEFHZXNlL3VnTW91SVcvYmR3YWw0UUMwNWdLVWVZ?=
 =?utf-8?B?dnV1a1cxQTlIblZIL2J3Y2ZEQUlZTHE2MUlpTlRQNnFnQjhvSW9CNDBkM21u?=
 =?utf-8?B?cmlaVUo1aGdVU1Nwalc2VWdYaVBRZHFHeFJqQ1NlVms3VmNIVjB0QVJEbFNW?=
 =?utf-8?B?cTZxNlcwTTl4NnEwQXJabDVjb2g5UkdWVi8xQjRUNTJuT3JKdlhiZElXNkYv?=
 =?utf-8?B?YUo4L0VIUlFrTFBUUFNTSFRJWHgreTlJejBRQXZ6TkZId0ZkL2VsNFRZY3o2?=
 =?utf-8?B?U0RFQU9lWGVTM1dkNk9veFJUSStlQ3JjUEpBTE1MRTBLcmE3VTlBZmJ6VFhQ?=
 =?utf-8?B?bG5WYjZiS1NoM1B6NG1HSnVPMGdOdlJCbzcwemVPM1Y5eXI4L2xvaEhRU280?=
 =?utf-8?B?OTkxcEhWYzg1dlBZTkNCOUJBUEpFQlVScXkrRThpbS9qVEI1SU55TGpCbDk0?=
 =?utf-8?B?dGdLcWlLRm5pRHE4SnhVdU4yWG50RmlTU0dZWmwvbkRzcy93YWtLSXhTUytN?=
 =?utf-8?B?MkFUV1JBY1ZDYlR6QmI2VFJaMlhZQk5JL3lXYnIwdW5yVGpVRkpyUFM0MUVU?=
 =?utf-8?B?anB2aUpzVUtpMm9vTTRwU3JHc2pqVW1ka2d4bGhXQ3dFTFQ1OGJSeVdHemFI?=
 =?utf-8?B?bHB1VXV5ZFRyOHFiM1AycXVWWDZSOGxpeWhHZGpmZmhGRE81ZHJJb29ZVSs0?=
 =?utf-8?B?WFlvRnRUcFpoTmZYQXd4V2k2LzlmeXhZY2trUWFoWWdNWUdOUGtuYVBndVJq?=
 =?utf-8?B?Y2pwbmU1VGZUVHZDbnRWc0pRM1FhSzM5TEFhVU5QMlp3RTRPRmg5NnpTQnRv?=
 =?utf-8?B?dzkreFlZTjE0eStMaWU5Wk5HVDNaQUlSRTNLWVl0SW0zN0VCTGQvdllhbC9I?=
 =?utf-8?B?NG5TbjU4MFltbEFuWTlycVRLYk45bERFWTM1OHJrSjdEd0RjUDBqT0xFZmZN?=
 =?utf-8?B?eGxhZCtmNm03NjR5QlRWUG5iRTdtMUhLZEprekJIOFFxOW1wN1EyOEVZR2Y0?=
 =?utf-8?Q?UfiIbhX9/Cx40EbEU8oTvk2VJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6d39ba-a42e-4780-e050-08db9e413b4c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 10:12:00.9355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p8ArSm7Yo5bE0WRjFoyYMvDRB3sh/ooLXH/YJ9lCd8Y9UbVuwXw0kL18HGMdwLLVW6orXHepwsxU4M3RGAWrow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7779
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/08/2023 11:48, Christian König wrote:
> Am 15.08.23 um 21:50 schrieb André Almeida:
>> Instead of storing coredump information inside amdgpu_device struct,
>> move if to a proper separated struct and allocate it dynamically. This
>> will make it easier to further expand the logged information.
>>
>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>
> Shashank can you take a look at this one?


Noted, will check this out.

- Shashank

>
> Thanks,
> Christian.
>
>> ---
>> v4: change kmalloc to kzalloc
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        | 14 +++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 63 ++++++++++++++--------
>>   2 files changed, 49 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index 9c6a332261ab..0d560b713948 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1088,11 +1088,6 @@ struct amdgpu_device {
>>       uint32_t                        *reset_dump_reg_list;
>>       uint32_t            *reset_dump_reg_value;
>>       int                             num_regs;
>> -#ifdef CONFIG_DEV_COREDUMP
>> -    struct amdgpu_task_info         reset_task_info;
>> -    bool                            reset_vram_lost;
>> -    struct timespec64               reset_time;
>> -#endif
>>         bool                            scpm_enabled;
>>       uint32_t                        scpm_status;
>> @@ -1105,6 +1100,15 @@ struct amdgpu_device {
>>       uint32_t            aid_mask;
>>   };
>>   +#ifdef CONFIG_DEV_COREDUMP
>> +struct amdgpu_coredump_info {
>> +    struct amdgpu_device        *adev;
>> +    struct amdgpu_task_info         reset_task_info;
>> +    struct timespec64               reset_time;
>> +    bool                            reset_vram_lost;
>> +};
>> +#endif
>> +
>>   static inline struct amdgpu_device *drm_to_adev(struct drm_device 
>> *ddev)
>>   {
>>       return container_of(ddev, struct amdgpu_device, ddev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index bf4781551f88..b5b879bcc5c9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4799,12 +4799,17 @@ static int amdgpu_reset_reg_dumps(struct 
>> amdgpu_device *adev)
>>       return 0;
>>   }
>>   -#ifdef CONFIG_DEV_COREDUMP
>> +#ifndef CONFIG_DEV_COREDUMP
>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>> +                struct amdgpu_reset_context *reset_context)
>> +{
>> +}
>> +#else
>>   static ssize_t amdgpu_devcoredump_read(char *buffer, loff_t offset,
>>           size_t count, void *data, size_t datalen)
>>   {
>>       struct drm_printer p;
>> -    struct amdgpu_device *adev = data;
>> +    struct amdgpu_coredump_info *coredump = data;
>>       struct drm_print_iterator iter;
>>       int i;
>>   @@ -4818,21 +4823,21 @@ static ssize_t amdgpu_devcoredump_read(char 
>> *buffer, loff_t offset,
>>       drm_printf(&p, "**** AMDGPU Device Coredump ****\n");
>>       drm_printf(&p, "kernel: " UTS_RELEASE "\n");
>>       drm_printf(&p, "module: " KBUILD_MODNAME "\n");
>> -    drm_printf(&p, "time: %lld.%09ld\n", adev->reset_time.tv_sec, 
>> adev->reset_time.tv_nsec);
>> -    if (adev->reset_task_info.pid)
>> +    drm_printf(&p, "time: %lld.%09ld\n", 
>> coredump->reset_time.tv_sec, coredump->reset_time.tv_nsec);
>> +    if (coredump->reset_task_info.pid)
>>           drm_printf(&p, "process_name: %s PID: %d\n",
>> -               adev->reset_task_info.process_name,
>> -               adev->reset_task_info.pid);
>> +               coredump->reset_task_info.process_name,
>> +               coredump->reset_task_info.pid);
>>   -    if (adev->reset_vram_lost)
>> +    if (coredump->reset_vram_lost)
>>           drm_printf(&p, "VRAM is lost due to GPU reset!\n");
>> -    if (adev->num_regs) {
>> +    if (coredump->adev->num_regs) {
>>           drm_printf(&p, "AMDGPU register dumps:\nOffset:     
>> Value:\n");
>>   -        for (i = 0; i < adev->num_regs; i++)
>> +        for (i = 0; i < coredump->adev->num_regs; i++)
>>               drm_printf(&p, "0x%08x: 0x%08x\n",
>> -                   adev->reset_dump_reg_list[i],
>> -                   adev->reset_dump_reg_value[i]);
>> + coredump->adev->reset_dump_reg_list[i],
>> + coredump->adev->reset_dump_reg_value[i]);
>>       }
>>         return count - iter.remain;
>> @@ -4840,14 +4845,32 @@ static ssize_t amdgpu_devcoredump_read(char 
>> *buffer, loff_t offset,
>>     static void amdgpu_devcoredump_free(void *data)
>>   {
>> +    kfree(data);
>>   }
>>   -static void amdgpu_reset_capture_coredumpm(struct amdgpu_device 
>> *adev)
>> +static void amdgpu_coredump(struct amdgpu_device *adev, bool vram_lost,
>> +                struct amdgpu_reset_context *reset_context)
>>   {
>> +    struct amdgpu_coredump_info *coredump;
>>       struct drm_device *dev = adev_to_drm(adev);
>>   -    ktime_get_ts64(&adev->reset_time);
>> -    dev_coredumpm(dev->dev, THIS_MODULE, adev, 0, GFP_NOWAIT,
>> +    coredump = kzalloc(sizeof(*coredump), GFP_NOWAIT);
>> +
>> +    if (!coredump) {
>> +        DRM_ERROR("%s: failed to allocate memory for coredump\n", 
>> __func__);
>> +        return;
>> +    }
>> +
>> +    coredump->reset_vram_lost = vram_lost;
>> +
>> +    if (reset_context->job && reset_context->job->vm)
>> +        coredump->reset_task_info = reset_context->job->vm->task_info;
>> +
>> +    coredump->adev = adev;
>> +
>> +    ktime_get_ts64(&coredump->reset_time);
>> +
>> +    dev_coredumpm(dev->dev, THIS_MODULE, coredump, 0, GFP_NOWAIT,
>>                 amdgpu_devcoredump_read, amdgpu_devcoredump_free);
>>   }
>>   #endif
>> @@ -4955,15 +4978,9 @@ int amdgpu_do_asic_reset(struct list_head 
>> *device_list_handle,
>>                       goto out;
>>                     vram_lost = amdgpu_device_check_vram_lost(tmp_adev);
>> -#ifdef CONFIG_DEV_COREDUMP
>> -                tmp_adev->reset_vram_lost = vram_lost;
>> -                memset(&tmp_adev->reset_task_info, 0,
>> -                        sizeof(tmp_adev->reset_task_info));
>> -                if (reset_context->job && reset_context->job->vm)
>> -                    tmp_adev->reset_task_info =
>> - reset_context->job->vm->task_info;
>> -                amdgpu_reset_capture_coredumpm(tmp_adev);
>> -#endif
>> +
>> +                amdgpu_coredump(tmp_adev, vram_lost, reset_context);
>> +
>>                   if (vram_lost) {
>>                       DRM_INFO("VRAM is lost due to GPU reset!\n");
>>                       amdgpu_inc_vram_lost(tmp_adev);
>
