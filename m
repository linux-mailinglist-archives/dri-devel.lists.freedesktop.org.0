Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D53EB6383E4
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 07:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA7010E702;
	Fri, 25 Nov 2022 06:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9592110E702;
 Fri, 25 Nov 2022 06:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W58zkEQtOkW1sRXOUioTHjzLef2HRzHEDbl9LeNZeuGD0JP02so522yP64Xkn/myMiq6K8zOYakeani2Jexytay/pPej/YKbZKZ5D/THe70llJ4HfDwiANlJI1B0LCTMMI9irTUHdIVDqxOZQwwCGGamWmZOVHTfup6xUjDjs1d9MfToix8NHwrjTqqyyRDADo5XSyzcZMJRYUPwtnW6TMeq0i7oV7/feSbxIRV/V0LteEaySIS1axCL2jpt3X2crmK2jioUyYVZcVfSR+hTv0PTrYofb5ZkB1Au2jR7mWHkLjiAtATGS6KoSp+udq2f7b0Om86JIE6X3TmtLfI0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0o4KylARXsV73ANh/x04NeETKDDYGXpArYFpfS10s4=;
 b=Fzj7n3vuJaxo+b9tPUWYtt9wqLlCIOOxTN5dAOUnwjRAV4KTBA8Spl1x0vsVXuageh+GnDyZSbuv1lj6w1L8oN7RtsawzMs8SZnfHyvf1bENbKnz1JI1G4NvXrLtIHM6fm29YjfDK0RKx+nxNaphaUShgrNksBZz0wANQq062/VHdI9IC7IzeNTuc0lEvZUTuBgdj/QK3IuF7nZVdhT7va2EHvEzkJcbxfdPSgw1N3na47oBhpoU0HNnMfKfLNy7+bQsQ9QvuBsvyK67nplTbB6p9jBRtq5jiGOfoy+8ejAerUsexhn3a7JpvBOXjzy1QbOEjCGcm2nipoIxr570Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0o4KylARXsV73ANh/x04NeETKDDYGXpArYFpfS10s4=;
 b=v9OfMb0uyvW8NkU3HLu5Vfq15vgcXZIdThQCProcJiB7KHNrGNTjkjIF/IhznnhzYtMLMdEmAhpt4B8u1fN42p8khJAwJslXHxePW91mwpwBiQyGNj9hOTKb7emopMW9b6cXsurPhioC0989VujgK2IcZq5MYTnoNf9TTwF2t+M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4621.namprd12.prod.outlook.com (2603:10b6:805:e4::10)
 by MW4PR12MB7335.namprd12.prod.outlook.com (2603:10b6:303:22b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 06:12:57 +0000
Received: from SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f]) by SN6PR12MB4621.namprd12.prod.outlook.com
 ([fe80::f67c:12b7:6290:3b5f%3]) with mapi id 15.20.5834.015; Fri, 25 Nov 2022
 06:12:56 +0000
Message-ID: <1a620e7c-5b71-3d16-001a-0d79b292aca7@amd.com>
Date: Fri, 25 Nov 2022 11:42:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] drm/amdgpu: add mb for si
Content-Language: en-US
To: "Quan, Evan" <Evan.Quan@amd.com>, =?UTF-8?B?5p2O55yf6IO9?=
 <lizhenneng@kylinos.cn>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel.daenzer@mailbox.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20221118074810.380368-1-lizhenneng@kylinos.cn>
 <ecd9d251-8941-b2db-71b2-e4ac06f860a3@amd.com>
 <800a1207-8ff6-4cfa-60f3-6ff456874890@mailbox.org>
 <4adc40d1-e775-c480-bb35-23fe9c63e05e@kylinos.cn>
 <DM6PR12MB26196C35AC2F28FD50ECCAF0E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <4ac1b046-b3bc-6090-f03a-eb6352f52a5a@amd.com>
 <71571bdc-8310-502f-77b5-954f5efbff91@amd.com>
 <DM6PR12MB261978DE4F13F3DB548509C3E40E9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <DM6PR12MB261978DE4F13F3DB548509C3E40E9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::6) To SN6PR12MB4621.namprd12.prod.outlook.com
 (2603:10b6:805:e4::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB4621:EE_|MW4PR12MB7335:EE_
X-MS-Office365-Filtering-Correlation-Id: 861fae6d-132e-4a9a-2ca3-08daceac1861
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RIzMX1huE3xwsuiPISwu4Z0A1X8z4o1QDtNKIA/PXnJTI/AQ7lva0Idj/GbNOjfYRSZizXjGPUD3PH0fgqIY7gmh+NuiF8MrEVueg9Vm9Zzf30Z9m/BuWBRxqUx5YAbqtE6lAKA9MM+5+YBZ5xOo4h78MFf8ZJcDCWBX3mF+RBfdIYwr6wEqNc7kcJOg5vrh0GPKCRaUgfgtvicWlOmweLNPU241QZ53k/4rZqiLZqITmsjEo/qeWf5YoBD5OIJ4hGo/AKMdRUpgBzcCF8LUtcbZKpWX4Qr951jOZom28BHK8fo9aP+YMMsYxNQ/ucKJ11SyRQPiIUg3td6+7Hd6BLGfXviExrf1LVEL+cALZJzVK1E8/k3IQpDXZWSK+aG+E5S0PoMdgninuzEnwzrBwVpoUWBHmdvoXtZ7bWqhI5MtRI+z9aro25gz+T33GVLpk6HO8qrIgwoEEHmxgqeM+1ng8sVSW9Aty0JO9h23totqqGgiZm8vjHkF7EAJndKim6QCto59kGHWCDS5dcSHz4yaQjdxUdkG2cMZjDpUkQ0fdRxwEeqATyJs1bM+eCRjH9vsS3scU5UzqadLWmdZYVryGQGXCBdbsBCH3KvB+9JJuMYhZIguT1RqRJqRYqQKRxH+t1w1NEln2jrlVKdYFOTYowMQKEonRDRDXbJtYIVjRR4OGEuqLhZ61K0yEQXh+ycY6EmBK44IjsoyM0ODR/9mnCl3hqlLUhqZ5w71m6lpY2aYShOZQxoe/wXlnJQp/Pyxs7vZEWS35C+d3BJ60g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4621.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199015)(316002)(31696002)(110136005)(86362001)(54906003)(6636002)(8936002)(41300700001)(66946007)(4326008)(8676002)(66476007)(83380400001)(36756003)(66556008)(186003)(66574015)(2616005)(38100700002)(478600001)(966005)(6486002)(6666004)(53546011)(6512007)(6506007)(26005)(2906002)(31686004)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXAzTFJhNGZheHludW4vUVZyUTZ5Nm9yc0dMbzBhNU84YVF5dW95UVN0VWlo?=
 =?utf-8?B?MEl1VXZUcFFMYzVJR2Y5aVBwSHJVT1FpQmUydnpQTmFNem9oSzQ4K2xudXlD?=
 =?utf-8?B?QVo1azIvUkZSZHlxZG5raVMyMFpSU090c3RnZUsyWTQ3RFYvQy9VenZuUk1C?=
 =?utf-8?B?RVpMa0svMWN4RXRyaUN6UWl6ZmtQNjdkNnF0QzMzb2JiaENjcWZ0VG11ZUF6?=
 =?utf-8?B?bE45ckNxKzRDbDc5VXQ2WnhLS2NzSmZoTTJQa0JNbjd1SWFJUHpWK2gwWS9y?=
 =?utf-8?B?dU12Mk55ZDEwWE9Oa1ZGdVlkclo3WTF1VjBwR3hmZmprTVkyTVkxU0E1SXdo?=
 =?utf-8?B?SmJhNkpBWGJpRTJZK3JhQkRzNk5GYWF0c0MxOWZNZkZRU0VJT0R1SUhGZk1k?=
 =?utf-8?B?a3JZeFg5b1ZPZWlwR3IveUYvTlBGVXNZYjAxWExDNVMxU2haQmtEa2UzNzB5?=
 =?utf-8?B?eTA3QWZZUGxicUVMWEZSbjgrSjNCVEJ0S0ZJdkh2Z0NZQy9SVVVHaUh2YitF?=
 =?utf-8?B?ZmlRMFlSVlpXRGh4M3dqbFphQUVSMzg0S0txZDY2RWxWS2FvWDBsdmNjU3Uv?=
 =?utf-8?B?SWhKTkluMWliamp3b2tQUUpwVXFGaGQ0ZHliSSs0QWIwUk9DVk9PWXd3QjJ1?=
 =?utf-8?B?VjlNSUdMWlZkQ2JjRXB3UFg0QVJIYks5dkcwUE9MQVdoWWpoMHVFTDBmYWg0?=
 =?utf-8?B?R3dPcmN2Y0dCT25YOEpsTmV2MVNiNDNIcUNRZUVLM25DdjlZR3dPZDBiTzRP?=
 =?utf-8?B?WW4yMzlPYmNDczk2bFJ1bE5ZUWxEcHFiUGF3b2xlOWJhc0JMdGdlRXlQQ29n?=
 =?utf-8?B?ZGR5YWhJa0lBZ0Q2a3IrSlczU2xWeFdDZHpHVk1keE9yKzZkbEZvdVpwNytB?=
 =?utf-8?B?aUhJUWFMTXpLcms0b2NSY3N5cDVscmMvOHNlaXhNTlRqYXA5dWE1a2xydmpP?=
 =?utf-8?B?M2ZMdi9TalZCa1JjeXk3RVVmanl5WG0vWnFYVjl5NlVaS0VkUjlrbG9FRW9C?=
 =?utf-8?B?YitjTE53VXlKZ0VnOG9EQnBhWGVnM1l1L0JlR0R6V2ppaEVnSkkxVkZxbjZV?=
 =?utf-8?B?M0d4M1BaVEd1OXdKL3U1Y0E0SmpKQnRHSXJrSk1HNzFtZFlLdTJBd3oyQkl1?=
 =?utf-8?B?ZGpSUkZpRUJLVjN6ZnBXZ3JGeVFNV25LbHpXWlNOejRwemVnN1ZoVGlDZmNy?=
 =?utf-8?B?SXZRMEpYdTZqK3IvMkN5VkcyamxZOHo5VEMyQ0YxNHlaSVVtS2ZIRVZORU9P?=
 =?utf-8?B?YmZ5S05aSWkrbStxWUFWZW5VMzRGQkVuTFEwN1lJWnFYVExaVEdoalFQQklt?=
 =?utf-8?B?Y0J2R2lMNVNRblhwTGtTQW5DUzFHQlRGQXdMbjN3ckZzSE1SRml3d24xMGxW?=
 =?utf-8?B?TUZHTE1XMzJqbVkvaFp1YlBjMEs3Nm50SmpZT2JNbWJhd3kwcElRb0syRzh3?=
 =?utf-8?B?OUROdStSUUppTTVOYzAwd20yd25qbGhHbm0rL0VCaG9mYzJEQkN5NXZSN2ti?=
 =?utf-8?B?aFRFS1JGM05zL1FIZ0liMXhGd0MrcU1HSEEwUnh5anZCWTJrTDBkc2cyRWFa?=
 =?utf-8?B?Qy9SejZOV1k4TXdTZHhhVFhnellsQ05udVFMSEExcTFHbXdYZmROQmRrbHFZ?=
 =?utf-8?B?TEN6TWlBTUJSTHVrOUlLYTA4cTgrdVhoT1lISTN1V3Ezd0crUFJLOWtPTk51?=
 =?utf-8?B?Q2thOE4xdWxpeUhqNkEzdi9CMWlCbXFmZTh5NmVTN3AzNkVOWkI1L0lLMmtY?=
 =?utf-8?B?eTZqN1RDbWQ3Q2lyTVhzKy9aQ0RELzY3VlFuSExxVUZrNlRtNjJKdDNtTnZj?=
 =?utf-8?B?dkdqUG11Ulc5NWFWTUFvcGxUWWREekd2dEVEclJyNHZFVG50cGhnZkYzaEEv?=
 =?utf-8?B?NVd6S1BRVTJpWG1uNDRWVlhtaWRQTTNVY1h3eHpjTTJ1RlVIVDVCSFE0VVFk?=
 =?utf-8?B?TjR4TGp3cmpKVklRV3lHSUVUVkQyVmY2UW1jVVAwQ3VXbnc5TFJXaDRBRVpF?=
 =?utf-8?B?Tld0R0pLcFM1Q3ZFMGNJc3ozcDBiRUpsaUJ4b2ZkendyL1lOTjl2VkZSc0kw?=
 =?utf-8?B?c1NCbGVueEpUR1h3RjJQYmt3eE5nVGh0TUVudVppNGNCSGNJaXVoNUlrWG1R?=
 =?utf-8?Q?LRRD6tGaqUUiabVPfOb9xtl/O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861fae6d-132e-4a9a-2ca3-08daceac1861
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 06:12:56.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+dqE16UpV2vM8ljDSlbNWwQo8A0p24Yruc9bqWRGwW6v7DE+16szIthNeivaVo7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7335
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/25/2022 7:43 AM, Quan, Evan wrote:
> [AMD Official Use Only - General]
>
>
>
>> -----Original Message-----
>> From: Lazar, Lijo <Lijo.Lazar@amd.com>
>> Sent: Thursday, November 24, 2022 6:49 PM
>> To: Quan, Evan <Evan.Quan@amd.com>; 李真能 <lizhenneng@kylinos.cn>;
>> Michel Dänzer <michel.daenzer@mailbox.org>; Koenig, Christian
>> <Christian.Koenig@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>
>> Cc: amd-gfx@lists.freedesktop.org; Pan, Xinhui <Xinhui.Pan@amd.com>;
>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
>> Subject: Re: [PATCH] drm/amdgpu: add mb for si
>>
>>
>>
>> On 11/24/2022 4:11 PM, Lazar, Lijo wrote:
>>>
>>> On 11/24/2022 3:34 PM, Quan, Evan wrote:
>>>> [AMD Official Use Only - General]
>>>>
>>>> Could the attached patch help?
>>>>
>>>> Evan
>>>>> -----Original Message-----
>>>>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf
>> Of ???
>>>>> Sent: Friday, November 18, 2022 5:25 PM
>>>>> To: Michel Dänzer <michel.daenzer@mailbox.org>; Koenig, Christian
>>>>> <Christian.Koenig@amd.com>; Deucher, Alexander
>>>>> <Alexander.Deucher@amd.com>
>>>>> Cc: amd-gfx@lists.freedesktop.org; Pan, Xinhui <Xinhui.Pan@amd.com>;
>>>>> linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.org
>>>>> Subject: Re: [PATCH] drm/amdgpu: add mb for si
>>>>>
>>>>>
>>>>> 在 2022/11/18 17:18, Michel Dänzer 写道:
>>>>>> On 11/18/22 09:01, Christian König wrote:
>>>>>>> Am 18.11.22 um 08:48 schrieb Zhenneng Li:
>>>>>>>> During reboot test on arm64 platform, it may failure on boot, so
>>>>>>>> add this mb in smc.
>>>>>>>>
>>>>>>>> The error message are as follows:
>>>>>>>> [    6.996395][ 7] [  T295] [drm:amdgpu_device_ip_late_init
>>>>>>>> [amdgpu]] *ERROR*
>>>>>>>>                    late_init of IP block <si_dpm> failed -22 [
>>>>>>>> 7.006919][ 7] [  T295] amdgpu 0000:04:00.0:
>>> The issue is happening in late_init() which eventually does
>>>
>>>       ret = si_thermal_enable_alert(adev, false);
>>>
>>> Just before this, si_thermal_start_thermal_controller is called in
>>> hw_init and that enables thermal alert.
>>>
>>> Maybe the issue is with enable/disable of thermal alerts in quick
>>> succession. Adding a delay inside si_thermal_start_thermal_controller
>>> might help.
>>>
>> On a second look, temperature range is already set as part of
>> si_thermal_start_thermal_controller in hw_init
>> https://elixir.bootlin.com/linux/v6.1-
>> rc6/source/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c#L6780
>>
>> There is no need to set it again here -
>>
>> https://elixir.bootlin.com/linux/v6.1-
>> rc6/source/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c#L7635
>>
>> I think it is safe to remove the call from late_init altogether. Alex/Evan?
>>
> [Quan, Evan] Yes, it makes sense to me. But I'm not sure whether that’s related with the issue here.
> Since per my understandings, if the issue is caused by double calling of thermal_alert enablement, it will fail every time.
> That cannot explain why adding some delays or a mb() calling can help.

The side effect of the patch is just some random delay introduced for 
every SMC message

The issue happens in late_init(). Between late_init() and dpm 
enablement, there are many smc messages sent which don't have this 
issue. So I think the issue is not with FW not running.

Thus the only case I see is enable/disable of thermal alert in random 
succession.

Thanks,

Lijo

> BR
> Evan
>> Thanks,
>> Lijo
>>
>>> Thanks,
>>> Lijo
>>>
>>>>>>>> amdgpu_device_ip_late_init failed [    7.014224][ 7] [  T295] amdgpu
>>>>>>>> 0000:04:00.0: Fatal error during GPU init
>>>>>>> Memory barries are not supposed to be sprinkled around like this,
>> you
>>>>> need to give a detailed explanation why this is necessary.
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>>> Signed-off-by: Zhenneng Li <lizhenneng@kylinos.cn>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c | 2 ++
>>>>>>>>      1 file changed, 2 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>>>> b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>>>> index 8f994ffa9cd1..c7656f22278d 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_smc.c
>>>>>>>> @@ -155,6 +155,8 @@ bool amdgpu_si_is_smc_running(struct
>>>>>>>> amdgpu_device *adev)
>>>>>>>>          u32 rst = RREG32_SMC(SMC_SYSCON_RESET_CNTL);
>>>>>>>>          u32 clk = RREG32_SMC(SMC_SYSCON_CLOCK_CNTL_0);
>>>>>>>>      +    mb();
>>>>>>>> +
>>>>>>>>          if (!(rst & RST_REG) && !(clk & CK_DISABLE))
>>>>>>>>              return true;
>>>>>> In particular, it makes no sense in this specific place, since it
>>>>>> cannot directly
>>>>> affect the values of rst & clk.
>>>>>
>>>>> I thinks so too.
>>>>>
>>>>> But when I do reboot test using nine desktop machines,  there maybe
>>>>> report
>>>>> this error on one or two machines after Hundreds of times or
>>>>> Thousands of
>>>>> times reboot test, at the beginning, I use msleep() instead of mb(),
>>>>> these
>>>>> two methods are all works, but I don't know what is the root case.
>>>>>
>>>>> I use this method on other verdor's oland card, this error message are
>>>>> reported again.
>>>>>
>>>>> What could be the root reason?
>>>>>
>>>>> test environmen:
>>>>>
>>>>> graphics card: OLAND 0x1002:0x6611 0x1642:0x1869 0x87
>>>>>
>>>>> driver: amdgpu
>>>>>
>>>>> os: ubuntu 2004
>>>>>
>>>>> platform: arm64
>>>>>
>>>>> kernel: 5.4.18
>>>>>
