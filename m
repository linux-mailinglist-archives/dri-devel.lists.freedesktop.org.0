Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FBE455504
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 07:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4AE6F3A0;
	Thu, 18 Nov 2021 06:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2076.outbound.protection.outlook.com [40.107.101.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57AD86F3A0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 06:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDoOc+88VcCGGWbn8/yfmcHeNcRhjI0OGmeS64zR2+KXy2z+7AbfTRDxH7ImnnLf69ux9IivhytBzObRTZUA7AYZ0mqd8Nr8a3RlGYKDyv58ps+IfK6OUA7W1Ow9FNxi+zZ48aPcZRb70YptT1J/u4qPRRmpTT7FSdF/eiY6QE2KM4c0SfUxzzy9ukyXKPNPVrHB1ZKJlezXqLN9gCLUgw3QlOqKFaGbXh5mKYWdWBTrJ5+oDiF9YcNzpO6HlK0oR/Qae/CFMOgehunhwR++N2btjR7UQ+DD2ziw5XjV/fNsV4xWkOASeqTNTKmLM5an3MKI3IAHf78rNKt5s/2fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho6imcWi2ghSObNuUeUgk9TUehbiceKWImEos//YPhQ=;
 b=Ps24WoW0Ao1ePhBc1x+cK0Ig4kwZaQWlZQneAvOqi1N49URiZz63OwgYluLj90BiJcMLTg5CT6PdpGzrxTn6JnbkOeymmv7ZiK7hN/VmgH1md7hTLoF5MxH2d5KY3I8Cew5qniNuOKrfCplhrebyh2Q56ngwBf8DE3PbcOxaO2qT4FaljgeodO2aCxG0m905aVOQe8ZbUsTEmzIRREvjxfpf5yVD4KBEbq7ggY6SpFkaEmBvOmLHFCnGY8HZvTCq+WMRQDkCex2WRcIzjo0IfAv3xANAD6PiHukBjQWVIuNSftO4nVRLDCZ1mrEPnDWT4QUSuClQ4Dg164urJqf8Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ho6imcWi2ghSObNuUeUgk9TUehbiceKWImEos//YPhQ=;
 b=vWIeu2q1cnQb9Bz7DojnTunWP+ofe43xDuKjlmZJEqdQklR73/PsQaaLhOxjHGAXsGZZD5q/jikw100S4Nt31FxTPjgNM94K4IjEj9vTl7EmnQk8c/cP62IQqMHWOIFCvtSXrh1pVXBkY0qMRcHEczhmow/Uyz8ln43beiBiRLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2492.namprd12.prod.outlook.com
 (2603:10b6:907:8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 06:59:38 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 06:59:38 +0000
Subject: Re: [PATCH] drm/scheduler: fix
 drm_sched_job_add_implicit_dependencies harder
To: Rob Clark <robdclark@gmail.com>, Steev Klimaszewski <steev@kali.org>
References: <20211116155545.473311-1-robdclark@gmail.com>
 <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
 <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
 <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
 <CAF6AEGs1hmS7hNC+OOvy=eHjvYhk=GLFX5T9iHWO=PUvGxNyDg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c34a3580-044e-d43d-6e38-2c6e44ac4788@amd.com>
Date: Thu, 18 Nov 2021 07:59:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAF6AEGs1hmS7hNC+OOvy=eHjvYhk=GLFX5T9iHWO=PUvGxNyDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::26) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AS9PR04CA0084.eurprd04.prod.outlook.com (2603:10a6:20b:48b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 06:59:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d851d427-008b-4f5f-9b58-08d9aa60fc67
X-MS-TrafficTypeDiagnostic: MW2PR12MB2492:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2492AC88F5942AC379353F02839B9@MW2PR12MB2492.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PKJhnkICKqrzxYzgbGrDPvOVnA/nOh5h8dzOxJu+PoOaz1SzTzxB3J+lEivqlyftzF0Pg63N8b4pMzOG77ZEYky1B+0y/LlXVKKEA7BlXcn7s4PUByEhhjqH833GqSE/Q7+Ei4ikq9kPt4U3nSUjL1RT8z0NxbjMLDanVt3CeK7Upj4iNoKVa/xbR83wzHk3KmdOJSw7fUNlsdGeh32AqK7cme/xxN9NzhuQD/HgRjtbXSujX9OXBuq9QSDkcMrXb5fXVwgABh+0F/GsVBkinmEnjYlgPDylVovlbnOBCAv21GF4cXWxqWlXxjzlB5/qgopJDGsN9ihZmSUwjyi2UOBC1b+w06wqQB7ot+MQWXJyHJnM68l+gIvSNLWOmz7gMM0TPgr18owyL3l13GHpVYboagtyFG/UaLIQLFZ4Gvv1tukUfMMk5oETttst26sUw+TH6TbHK24fm8kJsHupNQMYZTaOJalLHX5ytrqaX5AxY+SSMS8PesA3/okqPQ1yc7KNcPMB3yLYCaX+TlBceqWD5Log320c0HYTlDnpWPnW406JKMs6NQG7MqOqQ7Q/2Dbj1X31ibeGHNPwR8hQAjYeJgZdI1cT1gV/Oa4rCjC7XL357PuyTdD5jlfsy+0y1DBM/VCoFwIi7mav1Rf+HESdROUAW++e4wlhYiLR26nS1goWXc0jecSIb2mFiLqPnHo2N8eG55yAVYMv2WHdxRyWr8aPe1paqWG4LuEczPudDhak/dbdXQLXxT+O8m/4OyXB9sOvR63s4Ro7xa0wxzKQ1ug++9cfwnjiuw0Jqnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(8676002)(4326008)(26005)(31696002)(2906002)(186003)(86362001)(508600001)(31686004)(38100700002)(36756003)(6666004)(66556008)(8936002)(53546011)(54906003)(956004)(2616005)(66946007)(5660300002)(110136005)(316002)(16576012)(6486002)(34023003)(148693002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmtuLzhhN3kxbHlCSm1uTnYwTXhyVkxzWkEwODBZeS9QL3V1WlhjeHJPS1Fj?=
 =?utf-8?B?MXRSV3pxK2dlcGRnT3pvLzhUUEV5d0gxWTRRVE1DQ2M1SE5meGpQQXU3aVlW?=
 =?utf-8?B?b2Z1REpqQU9GRi9rQ2hsZUZPWTROeUQzVEF6aU1iRGRFeXN6T1B2UTgrZFhq?=
 =?utf-8?B?c0JDMDNaRWN2NnFyRlVYMzQrNzJOdnZNWUpzTFpWSEpVcEFPQXV0ZHFMWjhK?=
 =?utf-8?B?ODVlWTR6bUZCME1SenJZNEZDZUZMWXd6ZUdPazBRSTRLU0xCS2JyVzIrd0FZ?=
 =?utf-8?B?TWtKNllQclVTR1ZyM3R0QXVwbnFXekpaRGZ0UEVMMWR5cGVhdGcySm9Za1dU?=
 =?utf-8?B?Vkc2MEw5dyswTDRRUzYvSS8wVHpYTEEvblgxN1FDR3JIVFUrVmpaNm5ReUw3?=
 =?utf-8?B?aDlDajZWcE42SkVzcmtMWkZUc2JtdEtUWU02U245ZFRId0EvMmlSclh5REpX?=
 =?utf-8?B?dGRsZC83NVlsYzRuNDRxalBBVGRUaXVaYzFPTzJUVEwvYjB3NXU0T2pJN1JE?=
 =?utf-8?B?Um9SYm1pdjU0d1dabk5YMTBIWlZwa001SVdIbE5JcEp3bUpWanBhNWd2Q2Rx?=
 =?utf-8?B?bGttMjRCUGRYWk55VXVCcXNaVVBSU3U1azJtb3l5V0ZlRGFHRTZhQ3JKYWE5?=
 =?utf-8?B?bFRjL1ZENllMTGs3b1UzT3ZFT2ZPUkFUMWloSUFoVHdJd2NySEZSVE0rei8y?=
 =?utf-8?B?eDhrQzZJWS93SHg3Y3ZwKysyWGJ5M001bTZVWitGZ2p4VXRyVHk2dmJnblRE?=
 =?utf-8?B?U0ZMdEorYTl5SWRHWVkwSEVRNGJucEFMdEZmZUZPSkQzb3pHRFVwS0dBQmxC?=
 =?utf-8?B?VUVkc2p5ekxUSU03S3dDUWZFKzVYUWlUTWRhUUlmYWZld3FpdS9RR25ScFFM?=
 =?utf-8?B?TDNEdnViTm8reEw0TWREREtrc2x5ZmFSQ2hoOWlkN2h0RElQVUt2L3hHRXlE?=
 =?utf-8?B?dlJZbnFoeCtpREMxS283NW5rTVhXSVNKMjlHOGF1Y0tDWHZkcGNlTUwyQ3Jm?=
 =?utf-8?B?dFJhcEVQMlNxcW13SW1RU3h4enY3enN5bHhHeFh4WU4xUlJSRVlGMmtjdW1P?=
 =?utf-8?B?dVNoMEZVaVlDdW1JWitmblJ6UVpVNHE0NGM5N2Z3TUtJTmRuRlA0QVkzSXk5?=
 =?utf-8?B?dVF1UFAzczlFNmIrR2s4eENnRDhRTnhWSmd1eG9rbmY2ekhaMWxKcUFUUjBC?=
 =?utf-8?B?OW5ZSkxOcXBNdlBzbGlhelpSRUd2NlMxQkc1dDlOWXNkR3lZOXJSZmJBdUFi?=
 =?utf-8?B?VzhVVWhFeHREMUdnSE9tNFJBMzY1TXJ2K0xGSi9td2NOTFdpWCtEMWtCQXJB?=
 =?utf-8?B?Q1Q0eHFneTFYWlJNRVhPRWVSRCtyMEQ1WWdtV3hRREE5V3dlWDVnZFRBKy85?=
 =?utf-8?B?QmJrdm1lZG40UzBJaWdQdXZLem14dCtHajd3UDNhWEd3bDVvRnVscWhyalRQ?=
 =?utf-8?B?akZGSmFGN202RVpaeU4yd01LVHZVd2o0eHBTR1Q4UlNHNVM5QXNPZ2tpV0s3?=
 =?utf-8?B?R0pEZHR4NjRVa2FkZHArMXc3TG8xMWF1Zkx6MTFuaWxVa29Gd2QzNTAxcU9O?=
 =?utf-8?B?eU84YXF0TTJLQnd2SUd3ZzJsV0x3YlhKRVlWWVBZYjQyRTNIUitJUTVZVUpB?=
 =?utf-8?B?QWY4bzVUMHlYSHpLZjZrNzNQayttK2lFWFdmZzBhSVR3TWNsdkphMEh4aTJI?=
 =?utf-8?B?WlZzSTAxdUFPU2g2eExlQlRtRXZVRVIxWExMMlh3NFoxVXp5K2hhVStiR0Yv?=
 =?utf-8?B?RFkzQjRuVXZVRWNZbmh3dTRDZmxtNEJORFFtaitmNkQyeDlmM1NXVFNZWDZE?=
 =?utf-8?B?azNVM21kMW1nMWNoamJaM0J2eU96SkNZZFVTSWFISTRHWWVSYVF0ZFA1OW9v?=
 =?utf-8?B?K0ZtamxaV1VycHhDeTc5Z0x5VmF2WjVSdnEvdkhiQzd3T0IydzZTVFVpbFBL?=
 =?utf-8?B?TlovSGlWQjAwSDBKQnVKeHk3N1RpRnNTclV6YmJ1R0VBeFJJc2t1djlHSy9W?=
 =?utf-8?B?THY0R2I5aER1aXBzdjNrUEhkNGprZHM0eEI1WVhjdzZWdlY5OHp0ekk2eXkz?=
 =?utf-8?B?T1R1dUF0UHpoaDNFR05OVGVDTEVJSDJEQjBOc01LRENXa0ducVlzb2xPWEU1?=
 =?utf-8?Q?/ddw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d851d427-008b-4f5f-9b58-08d9aa60fc67
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:59:38.0245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rh5oZ5reA5hZgyQHqap8wRkYUc7AhBsD0ik+WFYQOA+nw07jECzzl9SZlVdJe1Ky
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2492
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.11.21 um 04:09 schrieb Rob Clark:
> On Wed, Nov 17, 2021 at 5:23 PM Steev Klimaszewski <steev@kali.org> wrote:
>>
>> On 11/17/21 1:27 AM, Christian König wrote:
>>> Am 16.11.21 um 19:30 schrieb Amit Pundir:
>>>> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>
>>>>> drm_sched_job_add_dependency() could drop the last ref, so we need
>>>>> to do
>>>>> the dma_fence_get() first.
>>>>>
>>>> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
>>>>
>>>> Tested-by: Amit Pundir <amit.pundir@linaro.org>
>>> I've added my rb, pushed this with the original fix to drm-misc-fixes
>>> and cleaned up the obvious fallout between drm-misc-fixes and
>>> drm-misc-next in drm-tip.
>>>
>>> Thanks for the help and sorry for the noise,
>>> Christian.
>>>
>> I've run into this splat on the Lenovo Yoga C630 on 5.16-rc1 - are these
>> 2 patches (which fix it) going to be heading to 5.16 or were they
>> targeted at 5.17?
> these should be for v5.16

Yeah, they are already queued up for -rc2.

Regards,
Christian.

>
> BR,
> -R

