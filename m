Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAF7C481C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 05:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498C610E3C8;
	Wed, 11 Oct 2023 03:05:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B0D10E3C7;
 Wed, 11 Oct 2023 03:05:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQK0307AUiujDEqQLdcv7WsCkXAJWK2oxf1UM5oUVro4jkptNL637XbVk9fzT494X0eMgPVxALX7IoGzfRvGu9A+LabHFt2TRuckCoOsuMTUTALGykuvwqgQSBpIryf1JQIZ+RK5ZX4u99F9rCeROC0PBaS6R8+6xA17bX3iY6M8DHwxUM91Myw1g+G6kgshMhhYev1LV4afPZJgcM6TnnwfkGQBDGrDUwmPGbCYEMNTmdjsYKIzak/5Q2Hi0l0zAIyYVYOIkSfzN1ZRDOKZdAledrU/BNUzD2zoaHAh02qr52yMq1cnlq9qPuRPzTSPvy0oGGRYJFeiTmnjaDKkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cesph+ILlzU1AJ0od7iW4Z2zHZCclv5aFlADRaVh7gs=;
 b=dyhuS6UeJXNU5Z22THhNx91V/SuCcPMrTqcPMV0+KsWG9XZhshHWg0r/sId23peN4wAZ/CQS3MP0QOkRbaVjxZeSTtVhJ7u+jPlksGxSPLBC4VrSwMhTYfqdkjrXYG9Y5WfPkhqrwTSDQ0w2wVa1HPKgc/mo4z/huL9hppTJ8OdQCLCqgAeGnqu121pwtpiq+K5QYjv+ZF+jNuwNZG56NUOp+QldIzPnGqUfwMF8QcWPf+Z1ZFVtxeyBriM26hDJSVZkoKx/bniXP5svtU2nUIbODdyMPsulNgr6bwSugyHQHQOftvXytTvhp60YH0onUHk8Y7C9CiMOesvjtHYq5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cesph+ILlzU1AJ0od7iW4Z2zHZCclv5aFlADRaVh7gs=;
 b=ImRGzRyoqyCihOK1hZvAA0UK/akOORaQCbMyuuQsptw1TRUslur8ARf9VPUx+aWM56fC0AAMN+cjndF5Q2q1GzxpxEs0kjZ7wXATDSuCk6GlNM0C9sxUGjNKRQR/4E1cxxl2vKkQVR+JqRDE4fxL+mXS4WbTOq7wPOZNJW4tzzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Wed, 11 Oct
 2023 03:05:38 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Wed, 11 Oct 2023
 03:05:38 +0000
Message-ID: <93d781b4-53d8-4fd9-8b2e-1b1a03c896cc@amd.com>
Date: Wed, 11 Oct 2023 08:35:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] platform/x86/amd/pmf: Add support to update
 system state
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, hdegoede@redhat.com,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com,
 basavaraj.natikar@amd.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
 <20231010125917.138225-9-Shyam-sundar.S-k@amd.com>
 <0345caec-ccbc-4c54-a095-4fcef24fee25@amd.com>
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <0345caec-ccbc-4c54-a095-4fcef24fee25@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::15) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e9e06f5-9e7c-4d40-7670-08dbca06f1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZcOpH0jWKdQqdvWpQfd8XhQaLlYPdoKlmgonOqic4LbcyQSGi+WiC73W3bj19TxzIeqbPFZRFnoehD0pYV9tIwJEpU+HWsn5aZs2AB52ECF4Go52ajCCtmFM3evMB2+ndVg/Igy5xVCuBMZ9EJmTjNUd6gWBSXYymjXYYD+rsSq9BJVk8pIgMJImtjcsyTaZcOB8+4VagLXXj/MkOcpwBy70pM/OtpM5EW0cbxIWn+bN9TrIWAwSqGwdoQ406Si+3WYe1AdgxmFOVpb7joJj8VEW8y9y3T28Ao7hQbwPGzc/YgA26fyRngZGzVixDDQ1peb5dzbv25khepnGG9s3xEhlDvWpqXprNHs5Z+AEReLIUqkJwOGHVFriT74ioF2daY2NUtYbANBHzhrIUdIRCx6lQ5orKMP4omqRM7/j4S8tolSGCgI7f7+gySKEYxlY+5B92yqM35PjsO27kQtCAZ0HmgEkpBQE2SSPykukcck/wAq5FL2RFzKbqxjdRAOKZJLfAKonIwKTNRm49lQEShoapMciamC+JiV4u7Nh+Oepd76PRVE59lzHGfmviq52hDEmABBOTk+B77U20iux2LsjPvbZ5OznX/pd98/6bRM3HRJuhH917caobv1yAWbq3UQTULvdkCSSINydNVQ27GCEDVMZu3dmSwTD7gpzRAM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(31686004)(6512007)(6506007)(2616005)(6666004)(53546011)(41300700001)(5660300002)(15650500001)(36756003)(2906002)(7416002)(4326008)(8676002)(8936002)(6486002)(478600001)(31696002)(921005)(316002)(66556008)(66946007)(66476007)(26005)(86362001)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0l5WFh3M29XTFJtWnlwUFB3TThkRXB4bHJaUlhjNkxDaktxb1pyWU1KU3Uw?=
 =?utf-8?B?ejk4dWZXSk84bGVPanlJZ0FSRW1mNk15NXZROGVwMk5UQWFpeWNjRi9DQUxT?=
 =?utf-8?B?Qml4Sjk5ZllWVWpZRDdQeTc5MXJzQlJBbFlaVkdQaVNXZEhWYjNYeVkzakUr?=
 =?utf-8?B?bXJDTDNvYWV4UG8rNlVOQ0tSSzZmblQyQk5SOFR0a0pCb3RQZ2lXa28zNW84?=
 =?utf-8?B?OGt6VnFzMnAyOHZzV2hVKzYzNDdnVXgvRjZ6eXU2YUJxSjIzZGlBN3RjY2ZB?=
 =?utf-8?B?Q0RHVmFRRlVUWW50RDFzR1RCeWw4SkVIdWpuNEQvM1g4bWtyOG1yaVdnZXV1?=
 =?utf-8?B?YmVaRStTNFJuMXhleWRURlhpamdEdXpOaHdXSjBmNC9NNDJLMlVMb1dhaGpt?=
 =?utf-8?B?ZWZhSUx5N2lYL242cmNhT2l0bUdlNThWeU9qVFhmT1hySGZYRE1wWURZV1BH?=
 =?utf-8?B?ZVpVOFZ1RHJRK2pZK0xOR0lrUUdaZkRZaG9tMDQ1NDEyYVJUUExmVjNCQldo?=
 =?utf-8?B?WUdaN0lTaFg5c1lldjJZT0ZHTFVWNVFUdzQrL0xBdGlteVVMUWt0amt6QmVG?=
 =?utf-8?B?a1FRN1pQb2ZkUGpEL0w0OVdrV0tldExXSWZob09TcCtSWHdVU3MwSUN3V2lU?=
 =?utf-8?B?MldkU3BKNUJ1cE1VSFAxMUVmNnVsa1dmcVB3MkhhNkVhT3V5STFGd2p0MVdD?=
 =?utf-8?B?NGpzT2JkSkQvTHlXbEpKeGMxamozdDNROFpqUzRKb0h2WGNGNy9IY3ptSlUw?=
 =?utf-8?B?NGZvbHUvSDFEY2NQVFFuaW1FbkFwTGRPU0t0eDNnRGI5V0xVRWxobWQzOUFx?=
 =?utf-8?B?U0h0THMyeEdkTURtZnlTU3o4NjlyL1F0NXdlYk0xSXhCTlFUTWZ4aWhFNlI0?=
 =?utf-8?B?YjZybEFTakhJY2FZZ3RqZktWdk9jeDNZYlZsMkllOHNGREYwVHFCdlk2VGxL?=
 =?utf-8?B?bzhoaG5MRldsS3cra1BzNGMxTW5wZng1MGlqZlQvVEJKWExzWnFJUXJBUm5j?=
 =?utf-8?B?S3FNTE1tRE5qUktJVG91bnp4dFZIU1ZtaGNvR09oRERHS3B0Um9wOTNxNlNF?=
 =?utf-8?B?MCs1QkJzRzNsaUhoMnAxY1QzbGRrVEVaOWFLTTZoRXIxQWUwU3U1STE2K0xw?=
 =?utf-8?B?TU1vMEhWeUd3eW1yc0MxbEZFbGdYbmh2QzlmNTc4Nk1uYnZodk5KYjgvcGtM?=
 =?utf-8?B?WE9oTnFoVEFSRFI3eXdZcEpOSVlPN2grWFZhUkk3QjhMWVUxeXdxNVgzTVpM?=
 =?utf-8?B?MDFYWEEvTGlhNlVyZm9iNWprQ2FEL2NnMnpJM2xQa09jYkZWRHNuWU9rR09k?=
 =?utf-8?B?UmxFVW5NcElYVGFYbm5PeHh3aHVnSjQ4SklqYTllQ3FpVmYrVytEMHgwZFA4?=
 =?utf-8?B?VFFPL1p4dnAzZWhlU2dkWG5lT3Rtc3lvUmZiREZnTkJ0ZGpOTzZKaGlKNlNw?=
 =?utf-8?B?MXRPaHNOZmlUdXBjclROVkppWHVyb3dWbjhjMzZOL1R1emRFd1FtRTJqd0dr?=
 =?utf-8?B?dlltcTB3MjJEeVlBSUJVK2R1cDV4dUM3UXBsTWhEbTZCVVVnSHZFaHFGckZp?=
 =?utf-8?B?SFlPZm9rNW1PUmZrektzOUNTblRXKzREb0tsb20xaWQvSWVnL29UZTFTZ3FD?=
 =?utf-8?B?ZnhxbDJ6SmRGZUZyZ056bWFhWVlSaTIxRzBFdlVCZW54eFJVeTJ6c1BsbzJq?=
 =?utf-8?B?R2FrbTFHVlpKd3ErMFUrOTV5QkJUdmJ0Z0VXbjFzQWFZT0JzNDlmUXRzTVhC?=
 =?utf-8?B?MWRkeFMwbm84YWZoRVBHL3hGUXVDSkw1Zk50Uml1azhENEhoQ3pOSnlacjZL?=
 =?utf-8?B?a1RxTlFwNmhrRnFCdzd2RERsSDBDM25Za1dsaXRIY3Znc3ZFWUt4QVFpN0xO?=
 =?utf-8?B?YWp6aUtkV0tvN2pmTmIvSVc4WUJ6TlI1MWFwNjQwQjVKS25DbE5ld2pLWHlD?=
 =?utf-8?B?OUVmZGdzZ0FJWE4zK2RzMVpjRUVQem5La1lTeXpJc2piRmtxMENmcVN6QkZj?=
 =?utf-8?B?RFBoN1BYS1Y3ODl1Sk5PeG1KMG5zakVLOVNNQS9vVUNJajZleXFDQTRrc3hP?=
 =?utf-8?B?WDgxQ1ZGNWgyelV0QlpQS0JsRjZ4c0x0QWVzK2JXcjR2ekluWFJlTloyUi9y?=
 =?utf-8?Q?EPZAEl02NSaVd+LZh62xsOY/C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e9e06f5-9e7c-4d40-7670-08dbca06f1e3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2023 03:05:38.3403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvhJRYstuz+uPIkdC/sPQ27FuRDheB1eXCw6ZTOBUwj/4NVwlq6isFRJwBzVwoCQckBmd6XdDPLX7qPmxLz3dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192
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
Cc: dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Patil.Reddy@amd.com,
 platform-driver-x86@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/10/2023 9:33 PM, Mario Limonciello wrote:
> On 10/10/2023 07:59, Shyam Sundar S K wrote:
>> PMF driver based on the output actions from the TA can request to
>> update
>> the system states like entering s0i3, lock screen etc. by generating
>> an uevent. Based on the udev rules set in the userspace the event id
>> matching the uevent shall get updated accordingly using the systemctl.
>>
>> Sample udev rules under Documentation/admin-guide/pmf.rst.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> 
> One minor nit below.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> 
>> ---
>>   Documentation/admin-guide/index.rst   |  1 +
>>   Documentation/admin-guide/pmf.rst     | 25 +++++++++++++++++++
>>   drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
>>   drivers/platform/x86/amd/pmf/tee-if.c | 36
>> ++++++++++++++++++++++++++-
>>   4 files changed, 70 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/admin-guide/pmf.rst
>>
>> diff --git a/Documentation/admin-guide/index.rst
>> b/Documentation/admin-guide/index.rst
>> index 43ea35613dfc..fb40a1f6f79e 100644
>> --- a/Documentation/admin-guide/index.rst
>> +++ b/Documentation/admin-guide/index.rst
>> @@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to
>> your liking.
>>      parport
>>      perf-security
>>      pm/index
>> +   pmf
>>      pnp
>>      rapidio
>>      ras
>> diff --git a/Documentation/admin-guide/pmf.rst
>> b/Documentation/admin-guide/pmf.rst
>> new file mode 100644
>> index 000000000000..6985bb5b9452
>> --- /dev/null
>> +++ b/Documentation/admin-guide/pmf.rst
>> @@ -0,0 +1,25 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +Set udev rules for PMF Smart PC Builder
>> +---------------------------------------
>> +
>> +AMD PMF(Platform Management Framework) Smart PC Solution builder
>> has to set the system states
>> +like S0i3, Screen lock, hibernate etc, based on the output actions
>> provided by the PMF
>> +TA (Trusted Application).
>> +
>> +In order for this to work the PMF driver generates a uevent for
>> userspace to react to. Below are
>> +sample udev rules that can facilitate this experience when a
>> machine has PMF Smart PC solution builder
>> +enabled.
>> +
>> +Please add the following line(s) to
>> +``/etc/udev/rules.d/99-local.rules``::
>> +
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0",
>> RUN+="/usr/bin/systemctl suspend"
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1",
>> RUN+="/usr/bin/systemctl hibernate"
>> +        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2",
>> RUN+="/bin/loginctl lock-sessions"
>> +
>> +EVENT_ID values:
>> +0= Put the system to S0i3/S2Idle
>> +1= Put the system to hibernate
>> +2= Lock the screen
>> +
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h
>> b/drivers/platform/x86/amd/pmf/pmf.h
>> index 20f3e16b0a32..67f11113d5a7 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -73,6 +73,7 @@
>>   #define PMF_POLICY_STT_MIN                    6
>>   #define PMF_POLICY_STT_SKINTEMP_APU                7
>>   #define PMF_POLICY_STT_SKINTEMP_HS2                8
>> +#define PMF_POLICY_SYSTEM_STATE                    9
>>   #define PMF_POLICY_P3T                        38
>>     /* TA macros */
>> @@ -440,6 +441,13 @@ struct apmf_dyn_slider_output {
>>   } __packed;
>>     /* Smart PC - TA internals */
> 
> I know that Ilpo had a comment about this in an earlier version that
> there is a "__" instead of "_".  I know this is intended behavior for
> consistency with internal usage, but maybe it's worth having a comment
> somewhere mentioning it's intended behavior?  I'm not sure where.
> 

I missed to change here.  I have changed at other places too.

>> +enum system_state {
>> +    SYSTEM_STATE__S0i3,
>> +    SYSTEM_STATE__S4,
>> +    SYSTEM_STATE__SCREEN_LOCK,
>> +    SYSTEM_STATE__MAX
>> +};
>> +
>>   enum ta_slider {
>>       TA_BEST_BATTERY,    /* Best Battery */
>>       TA_BETTER_BATTERY,    /* Better Battery */
>> @@ -471,6 +479,7 @@ enum ta_pmf_error_type {
>>   };
>>     struct pmf_action_table {
>> +    enum system_state system_state;
>>       u32 spl;        /* in mW */
>>       u32 sppt;        /* in mW */
>>       u32 sppt_apuonly;    /* in mW */
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c
>> b/drivers/platform/x86/amd/pmf/tee-if.c
>> index 92879ae4f8f0..c08ef13a1494 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary
>> actions sampling frequency (defau
>>   static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77,
>> 0x3fb8, 0x524d,
>>                           0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85,
>> 0x43);
>>   +static const char *amd_pmf_uevent_as_str(unsigned int state)
>> +{
>> +    switch (state) {
>> +    case SYSTEM_STATE__S0i3:
>> +        return "S0i3";
>> +    case SYSTEM_STATE__S4:
>> +        return "S4";
>> +    case SYSTEM_STATE__SCREEN_LOCK:
>> +        return "SCREEN_LOCK";
>> +    default:
>> +        return "Unknown Smart PC event";
>> +    }
>> +}
>> +
>>   static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
>>                    struct tee_ioctl_invoke_arg *arg,
>>                    struct tee_param *param)
>> @@ -42,9 +56,23 @@ static void amd_pmf_prepare_args(struct
>> amd_pmf_dev *dev, int cmd,
>>       param[0].u.memref.shm_offs = 0;
>>   }
>>   +static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16
>> event)
>> +{
>> +    char *envp[2] = {};
>> +
>> +    envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
>> +    if (!envp[0])
>> +        return -EINVAL;
>> +
>> +    kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
>> +
>> +    kfree(envp[0]);
>> +    return 0;
>> +}
>> +
>>   static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct
>> ta_pmf_enact_result *out)
>>   {
>> -    u32 val;
>> +    u32 val, event = 0;
>>       int idx;
>>         for (idx = 0; idx < out->actions_count; idx++) {
>> @@ -113,6 +141,12 @@ static void amd_pmf_apply_policies(struct
>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>                   dev->prev_data->p3t_limit = val;
>>               }
>>               break;
>> +
>> +        case PMF_POLICY_SYSTEM_STATE:
>> +            amd_pmf_update_uevents(dev, event);
>> +            dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
>> +                amd_pmf_uevent_as_str(event));
>> +            break;
>>           }
>>       }
>>   }
> 
