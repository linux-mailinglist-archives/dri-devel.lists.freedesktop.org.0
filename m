Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC348527A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 13:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6811510EAA1;
	Wed,  5 Jan 2022 12:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DDC10EAA8;
 Wed,  5 Jan 2022 12:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTP4g2QmsXaO5ad3aFuPThCQTcjgd6EOpKOvrJw0VDDmJxyBfWprpRnAX/4r2ugqGSZR2mrAoV7vAp2xxY3DWzHUlOGVE7jQv42pkuKrvzQZ6efaUPmuKx5goGbFERS9HjiaVjC9zb7O92tJDSJUFqeV5q47ULJh71BFvRGmmDLQvMckePBKv0A96Qt7Xpji/ZHd1hD84jjPqf77xT32iWNf7lUcXt8RD5Vda8XyasnzZRC4yFYpsPB2wW9y0njezKkkODvQeAyXeP9UVoqdzz8X8VTCNVF/SSuLFi62jtSG6eSshccExxHNx3WFXk5sEkBiApCfjSuOZ1VJfxF4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Roa1ryOpyi5BWgY19h5QC82poXiJPWnYOUsdzOVKCWM=;
 b=LW8ifYcO2JW3SpdRS+iEAYooLIt0nt/OJFtWOVeFn+rL0OUI6NIfLQ18zHGud89m3T/cfWrpuXLtb/4G6mnGw8S1q2rXAP2nB6N8IREBZHiXfkhYO7hvtH69otezI1MnRqrLCWpekcmbjue0gXLaPPqpN+4wem+2UCvmYWb11SCcnLxo0i69jC5XcQrtkYqhofDG3neRP8QABY7TB3jfRSR+BaUwErdCEI+Lmv0m1uHlorsFJjyU3whEYM4CfKxr4KhQI1flSS3K2SsDXdKtqRYwih4gCWeHi2433j/6JeAvywlc2NnoLtFiCuYjGzpaIo7anhXTNHGbhFmpS/8Z5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Roa1ryOpyi5BWgY19h5QC82poXiJPWnYOUsdzOVKCWM=;
 b=zB3gdBZOF2jitKpyZhWQ9PPRaKkZhsMHi3LKS3IQ8kPWCRyyx4ZUcVmSjh7IV6mlTc8zgDQvnGc4Z62AdxaoNfQKwRbVAG7qYwrN8HcihiQwUml5FNmtlGiPl9/vRiu5HDLim8WUazLU3/fYgfqplgT/cS5JHc8fiWHdgYZCHYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1152.namprd12.prod.outlook.com
 (2603:10b6:300:7::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 12:31:34 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.017; Wed, 5 Jan 2022
 12:31:34 +0000
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
To: "Lazar, Lijo" <lijo.lazar@amd.com>,
 Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
Date: Wed, 5 Jan 2022 13:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9P194CA0008.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::27) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a48590e3-2da0-4a04-d33c-08d9d0474f1b
X-MS-TrafficTypeDiagnostic: MWHPR12MB1152:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB11529EB46C6CC619F2ABC964834B9@MWHPR12MB1152.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2CVlX6VAAMXa8vKk+IvsgMffqjTdw4Sal9oLsgDDJAmuiYXLi3OGw0CvKwjnxmqGJTYGXpXPPr0vl5xDCv2+eZxJ4qDefWLrZjAOQA1kGXmlxxmxXdU+igM6KijgE8NPWubGNwMc8oatwjuxAWSWcpKROpqheE5BxGXi4i9A8KX3ryKfbZKPN80TsHh0p1R4QZmYWK4ZkDPXqx+VyEXo8gZ+atUpI0m5vZPMH3VYsYyZXf6iwhyuRd4QvA+wa0MzeL780ZzO4uF+hu9EAEah1lsRjSw3bi/XA8+C2KzrtLsSj17bJmqPWmUeDzBqL5KxdfppLC/zy1vs8lnyDfu5f38C4xGh7lVOfySDYlUuwFHLut1CNCVCFINaqVxbV4PwxyMA3q5B66js+vVWUOQx8zgKV12d5ptpi3wvVJdQ2rlaJTvtr9cE2OUMcZIVcWbezHTEbJpraImW240WoGBuTzpDPsqrw2dv4bLIMOufcmR0GDEzqJTTx5HFfnckKGmsNqDbZuaZR1BCn+jX+RXRf2IGioYrLfF8FZYK//8+ZTFtzroqBJoVh48A+WP797xU9lpXbiMYzgHa6NmoYlUvUwg06bQ8B/8BjIF1+4BUEhDVjMTYkttKCsNmlykjd6zRZsIFDPeP/mJqlmhWhuq58iOWB08bgUXf/ENu1MnisvsdE5dI/xgaKfpTSSuRzNwusBU14oD6ZrsIGtrYQiPifOGEiTd5OIcRSchNVfC126U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(38100700002)(31696002)(2616005)(6506007)(53546011)(316002)(6486002)(508600001)(186003)(83380400001)(6512007)(110136005)(66946007)(2906002)(31686004)(66476007)(86362001)(36756003)(4326008)(66556008)(5660300002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWd1UUNmVzhBMjBrdDNJaTNGSzBpdUVhTDJyeDF1RWU1QkVPMnpIVEJYNSt1?=
 =?utf-8?B?VUNnK21XNnFTVEoyZTQwMFltVVFFNmZ4MW9GZkdyUS9IT3JxbVIrNnZrV25O?=
 =?utf-8?B?dmEwLzVoYUE1UC9LY1dqd3I0K1FkUmpmVFphRGd2NnY1dCszRm0wTEQ4cGpt?=
 =?utf-8?B?YUdmWE5GZEN5NVg2RjhHOUFkRjJ4cENYSTVWaEtWcHZnU3ZUWm0rak01U01D?=
 =?utf-8?B?ODk2a3pDTHoraFFJZmh2eXNRWXBLd2VDRVZaL0xWRzE0emEraGFjcThDUllr?=
 =?utf-8?B?L1ZjbWhqbS8xdmtKcm9SZzFOL1FZWW1OeHB1eDJsUG1vK3N0RktVQnJKMkpm?=
 =?utf-8?B?cWpISEk1cFBRYWVKbmQxNEMydDFFYnBDa2lxTkJpY1NDZ0pyNkJUZ3dLZkRm?=
 =?utf-8?B?c2FxS3V4eVFXQlZqeVQrTFpqMEtwd0JUNWJ0K3NxeThDZDdrTSs2bWdGdDg4?=
 =?utf-8?B?aWloc0VwNG9WTnVWNWo2SFZSa0ZoU0hWUEVUWGU0SVJ4eE15cFZlbW9talZu?=
 =?utf-8?B?OVYrSlk3WTVQQVBma01KdlkrSGRRTnFvOE5nNldSL01XcEFLbDZ2RzVDbWRh?=
 =?utf-8?B?emZTb3lxa0w0bDJyd1VmTkNTaDgxSU1qdHZ0TXU3Yit5NTVzY0dyVU9jTFRW?=
 =?utf-8?B?TEVsTDMzZUNYVU9TSGF1emFOQ2l6MmE3ajFkZCs5N3F1R0piUG13NDhnbUlx?=
 =?utf-8?B?cnJDMTVrMnh1aDNnN1hqQ3Q4VEtyUExKaWJQYmJFcjhScmZ4VkxFQTB5Mkt4?=
 =?utf-8?B?VTI2SFVZaFg2U3hOY3RaaFhFWGJvOS9YMkhJb3Q5Y1RBQVN2dDNBSVZpV1Y3?=
 =?utf-8?B?ZFR4bVk3OFZsb2ZBcVRTRDgzcWo1WDJxa1UzUXNkY01mODJqdW43a0xyTGRQ?=
 =?utf-8?B?T1B0WFI0L1hPTlVLZ0pvdmNEWmNRVWhIV2JBUmNoWmhQZ1NVdEkyVXdsSWFm?=
 =?utf-8?B?ZUxYV1FlQWhPcXFLdWdiQ1JrQXl3NzU4MFRTT2FtRXdjRmRPcnFGa0lwaGlu?=
 =?utf-8?B?c1phbVZZQW1WK21zOXdRQ0tNUWh1eDFlQlRsZ2NtUVNkRmxPRDk1dk9vbFA1?=
 =?utf-8?B?MEVYZjYxZFpEZnY2Ly9jSE5hNXVlKzF0WTJFM0hZZTc3ZXNjNzNaQnhNL1BT?=
 =?utf-8?B?UFNjZjZYa2hxajNlUk5vdUN0V3UvRzN6bzl1K1h4QmlGQ1A3UFJmYUM5WXFR?=
 =?utf-8?B?SSt5L0VFQTRIME9sODZ5TldDMjcrQzBGS0M0TDlETkhLL0oybEhqRFAvWVYr?=
 =?utf-8?B?blNQYlhTSDlhMk8wYzgzcEtnRzBFYkVRSFBQMlp6YkFQWE1LQVgxUWl5aWNL?=
 =?utf-8?B?VFBVdEVSL0RYTnBqZk1BY2ZoN01VYWcxQTYrc1V4NTFKbDVidVVsZzF4U3hp?=
 =?utf-8?B?aW8yUXRVVk5CbXdBOVRUT3lCRUtTRTRyUVZXZ2RaR1NURTFsVmRGUTBlM3hk?=
 =?utf-8?B?K3NsZXZCemdJTjc4UVV5NGtDaTJkRm53ZERSdU9VUnBQVDIrWmpLWU1lcmJG?=
 =?utf-8?B?VmNmZDdPNnFxb2c5V0FiQmFKbnRTWW9JM2NvMjhRZG9lZ0dnWDJ6K3NCYi9y?=
 =?utf-8?B?SWcrS3VPSUlKVC8rMy9NTUhBTHRiejlJQmlSWkFSMWZXeC93ekZsMjFXeWtG?=
 =?utf-8?B?K3JlOHpUYXBxSnJhUS9qSjJicWhyZS9EWDk3WDhvQnNwbHpDME11SFdGbUd1?=
 =?utf-8?B?WDNqek14ZldaSG1VeCtQL3NPMEdPcU1PaUlzMUNCUG9YRlVHS3hJdUR0Rm0z?=
 =?utf-8?B?ZEp3L1dGU0xZWklrVG40OE5tU2ovK0w1eWpuNTZUT0dXTVdHWS8zTzNUWXdI?=
 =?utf-8?B?Tld5YjN5U2NXeEwxOXNhZGxuRXNrZjhuYVgyVTBRbmREK1dQemJ0MVdNVnAv?=
 =?utf-8?B?VFlEZ2xUYy9MU3g2dVI5VlAycnpYK2l2MzhXTllpTVR0aE1IMXJrS0tDTmZR?=
 =?utf-8?B?TmpxWHY3MzhhcHErWGU3ekl6Z0Nsd3htMHhOZHhOeGlJdVUxTWV5WlBKWlVZ?=
 =?utf-8?B?THJBNnRuUUYycmM5MnRadGFFcmtmRHhRQkRLOWZaaFlwakIwYXZBcFh1N0VV?=
 =?utf-8?B?U3pHUzhJd2MzQTdrZjdNNXBTeDVsZkFDTENWbGc4Zmk4UVpaWTIySWxaTTk5?=
 =?utf-8?B?NGpjei9kaGYyVEh2V0pkR1h5LzU0dVduVzdxMlRoSFJWSlJ5YVN5WERrelVY?=
 =?utf-8?Q?2kAgGPxOKJlUwMlg6f/6AEo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48590e3-2da0-4a04-d33c-08d9d0474f1b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 12:31:34.0770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mv2XbvYhf4nAkQCnGdyFcPaGU9HGpVCNfnK/5uc4xbLIRCCeK28Izqhs/d6xSFDx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1152
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
Cc: horace.chen@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 05.01.22 um 10:54 schrieb Lazar, Lijo:
> On 12/23/2021 3:35 AM, Andrey Grodzovsky wrote:
>> Use reset domain wq also for non TDR gpu recovery trigers
>> such as sysfs and RAS. We must serialize all possible
>> GPU recoveries to gurantee no concurrency there.
>> For TDR call the original recovery function directly since
>> it's already executed from within the wq. For others just
>> use a wrapper to qeueue work and wait on it to finish.
>>
>> v2: Rename to amdgpu_recover_work_struct
>>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  2 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 33 +++++++++++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  2 +-
>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> index b5ff76aae7e0..8e96b9a14452 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1296,6 +1296,8 @@ bool amdgpu_device_has_job_running(struct 
>> amdgpu_device *adev);
>>   bool amdgpu_device_should_recover_gpu(struct amdgpu_device *adev);
>>   int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>                     struct amdgpu_job* job);
>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>> +                  struct amdgpu_job *job);
>>   void amdgpu_device_pci_config_reset(struct amdgpu_device *adev);
>>   int amdgpu_device_pci_reset(struct amdgpu_device *adev);
>>   bool amdgpu_device_need_post(struct amdgpu_device *adev);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 7c063fd37389..258ec3c0b2af 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -4979,7 +4979,7 @@ static void amdgpu_device_recheck_guilty_jobs(
>>    * Returns 0 for success or an error on failure.
>>    */
>>   -int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>> +int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
>>                     struct amdgpu_job *job)
>>   {
>>       struct list_head device_list, *device_list_handle =  NULL;
>> @@ -5237,6 +5237,37 @@ int amdgpu_device_gpu_recover(struct 
>> amdgpu_device *adev,
>>       return r;
>>   }
>>   +struct amdgpu_recover_work_struct {
>> +    struct work_struct base;
>> +    struct amdgpu_device *adev;
>> +    struct amdgpu_job *job;
>> +    int ret;
>> +};
>> +
>> +static void amdgpu_device_queue_gpu_recover_work(struct work_struct 
>> *work)
>> +{
>> +    struct amdgpu_recover_work_struct *recover_work = 
>> container_of(work, struct amdgpu_recover_work_struct, base);
>> +
>> +    recover_work->ret = 
>> amdgpu_device_gpu_recover_imp(recover_work->adev, recover_work->job);
>> +}
>> +/*
>> + * Serialize gpu recover into reset domain single threaded wq
>> + */
>> +int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>> +                    struct amdgpu_job *job)
>> +{
>> +    struct amdgpu_recover_work_struct work = {.adev = adev, .job = 
>> job};
>> +
>> +    INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>> +
>> +    if (!queue_work(adev->reset_domain.wq, &work.base))
>> +        return -EAGAIN;
>> +
>
> The decision to schedule a reset is made at this point. Subsequent 
> accesses to hardware may not be reliable. So should the flag in_reset 
> be set here itself rather than waiting for the work to start execution?

No, when we race and lose the VM is completely lost and probably 
restarted by the hypervisor.

And when we race and win we properly set the flag before signaling the 
hypervisor that it can continue with the reset.

> Also, what about having the reset_active or in_reset flag in the 
> reset_domain itself?

Of hand that sounds like a good idea.

Regards,
Christian.

>
> Thanks,
> Lijo
>
>> +    flush_work(&work.base);
>> +
>> +    return work.ret;
>> +}
>> +
>>   /**
>>    * amdgpu_device_get_pcie_info - fence pcie info about the PCIE slot
>>    *
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index bfc47bea23db..38c9fd7b7ad4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -63,7 +63,7 @@ static enum drm_gpu_sched_stat 
>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>             ti.process_name, ti.tgid, ti.task_name, ti.pid);
>>         if (amdgpu_device_should_recover_gpu(ring->adev)) {
>> -        amdgpu_device_gpu_recover(ring->adev, job);
>> +        amdgpu_device_gpu_recover_imp(ring->adev, job);
>>       } else {
>>           drm_sched_suspend_timeout(&ring->sched);
>>           if (amdgpu_sriov_vf(adev))
>>

