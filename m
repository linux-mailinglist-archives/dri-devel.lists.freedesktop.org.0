Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B64840F9
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 12:36:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA0B10E242;
	Tue,  4 Jan 2022 11:36:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2054.outbound.protection.outlook.com [40.107.101.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA2710E242;
 Tue,  4 Jan 2022 11:36:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcEzXO8ImDAypksRDNC3FGa9eyNW673s0pR1kJ+D/gx4bQP901hNsXQYsz2seIDNr3OTiyJZ3MACwRjbT/bQHiXMvk+io/c9fKsJFVqEJjDqwF9d59CSViUiY+RMTcPnBtMDk3uDhoCib40Oz3Vm1S8A+QblBzNXVqhUPAhbBTquF+C7OU8VbJXzZb2ehxyTYigPQ6uh8QwnGqlFcMo7bZTxGgLxx4LS4ohEiNrSP5ehnGNQkpfFDWSiIvu3PZVZB8/ZPQp3GwxN/Vw3cgYEzY44GCLXCtN5yTy+CEifbNkkERB1EUSnbmzLPpTm0KDIwhE8W++xVzfnrbDJjTbXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jd1kxD+zdYjEmTO3+rYAdJm0aM+0iUm71vQMqERxYLg=;
 b=CtjMD8eKFKB8/gKBjh1K9xlOruRp+l/pwZsKc6hcsSb+7DBpyUlhljMZRslLvcFjtpVPga9AxxckDr4fX8J8fxQF8w0si9MYV8AUt38bPR9zn978XcM909fXkl8hKLa4FVVHtaazwOgYVLH3Y+1bj+/MN+3hCh43I26cr7tIhF1NmCFxjpcHMyA0uq8pWaAn1lwsiivp3cubxCPT8gqs91Jgycv+tam31QCDZdCURHUuzWXkOqvrAq+EumtPScSJuAqjFceEDCD83pph72ZDdHSKbgKv4zWPq1ahLIjDWNDx0rfVlUXXzZTeCPq2JS5PV/XCU4Dcw1MoNG3eUAZdyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jd1kxD+zdYjEmTO3+rYAdJm0aM+0iUm71vQMqERxYLg=;
 b=284IM4NaADbGcLPvmt+W0LNNOMf74E8ddeyvS6cpyeIRsopfj7FMJHablVZV4RtRejKbS5Cmdr297IXi0Pci+2N67IEvIwWKAZISPhUdCs4dVOx9hPe1kMkB+iQblA06pzd1BbsQWDeTKd+Zlun4MAxZ0nI1zqgR36C4Iu22NTM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1534.namprd12.prod.outlook.com
 (2603:10b6:301:10::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Tue, 4 Jan
 2022 11:36:19 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4844.016; Tue, 4 Jan 2022
 11:36:19 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: "Liu, Monk" <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-1-andrey.grodzovsky@amd.com>
 <20211222221400.790842-4-andrey.grodzovsky@amd.com>
 <9125ac3a-e578-6b34-1533-7622ec0274f1@amd.com>
 <BL1PR12MB5269AE1B82F1D07433B95B59847E9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <PH0PR12MB5417F12B403B8181D5CD03988F7F9@PH0PR12MB5417.namprd12.prod.outlook.com>
 <cc8e296d-360d-9a2f-85cd-f47d55581e99@amd.com>
 <f5ba0a69-1cae-7d8b-bfe7-4e4400e9c32a@amd.com>
 <2dee6f65-9ca9-a332-7206-f24021fb4c44@gmail.com>
 <b5a31f18-262d-951e-2530-bdb0738e5033@amd.com>
 <20363a4e-b282-232d-34d0-14867bad4931@amd.com>
 <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
Date: Tue, 4 Jan 2022 12:36:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <BL1PR12MB5269922395096810CC79E66D844A9@BL1PR12MB5269.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR04CA0062.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::12) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bddf208-7623-4a11-91ba-08d9cf766ccd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1534:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1534C6FCC8BAF36F158CDAAA834A9@MWHPR12MB1534.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XKjbx9+qZarYlIr3VtuFqVb3nGfS+sKJpKKdA+QJMQ3VzrzKlubTCrWwSdIPQTRvwfdsqrTlDeJfJ+cR9xcRw3Yq/elf7KSVJChlUVxdTWlYXJTM2eP67NQQImIEjrxF588mSokXuWOSlgPhWl8gdToaeUhv78KBB3iuq3bfPkr36pSpEmoeYt4Gl1f6wYaDEAMKVpJBrijanDnjwp+BNGJi68nWf5T96W0ObiUx0YmmZfp9ssmUSYty/iymnYWQo7mJsmm1ebCtlDwzaWOWQMEYtWxz9nV2KfoCT3BEl2acp0vmIeerZ3oHEF9HM8jYaJUYcdQMsYA4eOoU9gRJ/Tb8f1A0cwKrGfNhVOgquiIt4ivQMXM+bV5/0ZuQuCP7bq8pB6de5Ve8U1/j7rByJU+Re4WJiimzqHmtMpwokhjZ5I5Lipmy5V9MBBTdQwD5mgs40yxrr4c9OtYX4KcIBltFUN536RYgs9/BsXB7qkAhJl1+nq/ljXagcLpm4J7jzP9GeJcQWUn09vxLclp+xCsBZfPwm4LmQSnaJm8f5g79vzYFD8qH8p5Z2uLlFlRixXEAve5mUI+DRgWYO04HuelYteuXFymrmxJlimqM3H+We73A/K+rPqjJVBNiWMwrI+uinqvpETN9BlOrCxQuPb/TuwGWXf6abraODDskjO4zU0kOpN/R3b/9+XtWSNFfq21BVqmaPiVT4AGjGVuimFycZgubby+h5riX7mJ0fZjBRTCJN6tWgj75IU+iM0ZVVU+QT+cLmtzpZlZwdbcYTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6506007)(8676002)(36756003)(5660300002)(53546011)(508600001)(86362001)(31686004)(6512007)(2906002)(110136005)(6486002)(4001150100001)(31696002)(6636002)(66574015)(921005)(66556008)(8936002)(66476007)(83380400001)(6666004)(4326008)(186003)(66946007)(316002)(2616005)(30864003)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VhRGZQaDJJMzFtOHhEd05taWpwNjhvRHRFcWF3eWVtN0ROU0NQV0luZFlE?=
 =?utf-8?B?VVFGVWJSRWoybG5iZWhsWExhc3cyblYxVDVIeTJLRnRrdXE3KzhVc1NWUDJQ?=
 =?utf-8?B?K0RkZ3FYd2VMM0hJQVl4ODMvRExYZi9wLzk0VFpQcEFYSDhwMm5xVFBJUFpm?=
 =?utf-8?B?eEpBVVF2MXpLTGhQVUkvNmZaa0JyNWhkTSsyVUNmTzgyd0RRaGlFZWJVTVZt?=
 =?utf-8?B?YU1DZkJqOVVQblZCbWpodFZXZDhOL24wVUZVem4rbzRFbGVqS09iL2Fkc1gz?=
 =?utf-8?B?T2tuS1Bxei9kbGJTd29YYnFrcHJxb29GRGdQZXRTK1hsWm5IRm9jWEZGV2Nw?=
 =?utf-8?B?UHdpVGpHOTZvaGk4OXIwV29IZlFFR0t2cjVaZlN2OFVCK2NoSFBKeGExVVRK?=
 =?utf-8?B?ZnpST3NYQnpubnVUTDNhc1BWcm1MU3NreitMZjlaYVRhZ2J6dVpMV3ZmVG5D?=
 =?utf-8?B?MTE0MmdRS3pWR29hVmhjQ3lIWHVtSHNZc01JRmxpSVhXcktjNnJYNGh4bWlv?=
 =?utf-8?B?bWloanQwVTZ5SCtWZ0N4QTloZTlvNUN6Y0Z4MjBXVklEcXVSbjE1dXk3VUZE?=
 =?utf-8?B?RWRva1VYU2dtK1FIZEF0dWt4UzF4SnN4RGhNOVZ3LzNOdmRjNDFYWWIvbWlQ?=
 =?utf-8?B?Q1YrSUZPV1QzcmhHcVEvV216djQwNXFFN3ZYTml3WlR4ZG5pcE1wajhzWUxj?=
 =?utf-8?B?SFJtdU0rQVgrWlhmMURPMnRvYUY4dXhOYVhsajNlUXBtaCtuWjB4SkFjd2hi?=
 =?utf-8?B?Q015bVBQekN0Z0p2UGY3N2c0MWZxTFQ4a0xSN1Z2RWplM2U3S011MllNeXlk?=
 =?utf-8?B?amlSclpucDFneUhDTUJUOXVuakFkK0ZNSGNjMkswWWVXdTNucy81bVU2YTh0?=
 =?utf-8?B?eGZhZEx6R3p6d3NvZXMxMVVoZkY0N3lhbGErRnJFcXl3T0RJS3BabkFZaktG?=
 =?utf-8?B?WUJod01qOWRibm5XcnkyUnlVY2dySzlqVTBtMXhpUkJwMjNhckt0amNwUFhC?=
 =?utf-8?B?VkRqS2Y5aXZiNVpXS2J3N3RTd2JHTGF2Z1k1RkxlenNic0RxTzZJZXdRNTRD?=
 =?utf-8?B?NmlqaW9kTFVnQ0R1T0ZaMmFENnltblU0U2lNdlBub2VERFZ0aXJpeVF3R2ZC?=
 =?utf-8?B?c1AyNTZtVEFWV054OWxjZ0ticXJEaFZtVjZhQ05nUXlrd2M0MFZ2SEZIeFZB?=
 =?utf-8?B?VUhET21LY014ZnZFei9aZEdkcDVLQ3BtcmFpSXQ4UnV2d1FocFdJRXl6QlBz?=
 =?utf-8?B?aVNKNFhsZVRBeWg1QkpaZXdTVElKWFQwajJJTmtPeW9MblB0eHZPNWNtak1B?=
 =?utf-8?B?c05yaDJqTW1NRFhHN0pEQ1VaTTZDYm11b01yVWFxTEUwWHNoQVU2dmVibU0x?=
 =?utf-8?B?QS9MM0pBRDZCS0F2dmpkdldSYWJXV2tIcDM2V0JmeDJUV0hDYzdkSVQ5eS85?=
 =?utf-8?B?TzRFUHJMNWg2cmdpSUNsL3BQVlo1M1ZhRGE1RUJSOFdzQWJRQ3I2Tjd6cXhO?=
 =?utf-8?B?c3d5bjhJcEl1MVFmWklpbm5Gd3EwUmhQcS9uMys0SThTRlZiYmJwOE5hV2VU?=
 =?utf-8?B?MkQ5Sk9mdHVSVFV1c3crZHl4SHErcy9pNllmd0JUWHZ6dHJxamxnOUtYaCsy?=
 =?utf-8?B?WGdsWjI3NlB2Um5iNE1BUmJyZFRWaXV2MjloY1V2MVZlc3Y5YzA4R0NpOTFM?=
 =?utf-8?B?YUNQVkFydFVlejhrTENGcmJZRFdhMGtDQnpQM3hkL0oydTlNVXZUNXl3M05Q?=
 =?utf-8?B?a0hqY2wyY3FLaFVLQUhMMHhmbjFEY0hVK0RiWkFVTWE3UC9abGp1SlU4cU85?=
 =?utf-8?B?NVNvR1VueHo1UkQzbFFGcDh5RENCRFdwalJIYXR6elg5aHFGeklVOXVNZFY4?=
 =?utf-8?B?Ykp5T1IrTkNrYnQwMGZ6Mk11bjh1UHZTd1BaOU16WGt6bk50RFdVNnpmVXFz?=
 =?utf-8?B?NGFsZlNieHBhRUVBalRNeS9aaU04aTNCU1lWV29RYXNNSDJPWHlNajdrdDRU?=
 =?utf-8?B?NnhVSmhMVUlTR21XYTQxcDZLS0NUNmtLTHVPeUxYS3oxV0g3WWVONjNXRWgz?=
 =?utf-8?B?YUV2NDBIUVNreUhURXplcWR4NzdPMWp2b0dTSzlsSzVKNjQyLzdvdjFlQkdx?=
 =?utf-8?B?RVBYbUhTcktPRzYyWVIvdzY4WWlydHQzZjVMTU1aT0JVZ2FqajhZT0pwS0Jj?=
 =?utf-8?Q?iDevz4ILljF/X3W/0FMM9CQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bddf208-7623-4a11-91ba-08d9cf766ccd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2022 11:36:19.1575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gd84xvDb9eiFoPU7np7E6eYH2ea7tJ0uIsXsnfXL9C77oxQ1vTUfxr6DLeioeWPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.01.22 um 11:49 schrieb Liu, Monk:
> [AMD Official Use Only]
>
>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>

Then we have a major design issue in the SRIOV protocol and really need 
to question this.

How do you want to prevent a race between the hypervisor resetting the 
hardware and the client trying the same because of a timeout?

As far as I can see the procedure should be:
1. We detect that a reset is necessary, either because of a fault a 
timeout or signal from hypervisor.
2. For each of those potential reset sources a work item is send to the 
single workqueue.
3. One of those work items execute first and prepares the reset.
4. We either do the reset our self or notify the hypervisor that we are 
ready for the reset.
5. Cleanup after the reset, eventually resubmit jobs etc..
6. Cancel work items which might have been scheduled from other reset 
sources.

It does make sense that the hypervisor resets the hardware without 
waiting for the clients for too long, but if we don't follow this 
general steps we will always have a race between the different components.

Regards,
Christian.

Am 04.01.22 um 11:49 schrieb Liu, Monk:
> [AMD Official Use Only]
>
>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>
>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
> It makes the code to crash ... how could it be a fix ?
>
> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>
> Thanks
> -------------------------------------------------------------------
> Monk Liu | Cloud GPU & Virtualization Solution | AMD
> -------------------------------------------------------------------
> we are hiring software manager for CVS core team
> -------------------------------------------------------------------
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Tuesday, January 4, 2022 6:19 PM
> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
> Cc: daniel@ffwll.ch
> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>
> Hi Jingwen,
>
> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>
> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>
> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>
> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>
> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>
> Regards,
> Christian.
>
> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>> Hi Christian,
>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>
>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>
>>   From my point of view, we can directly use amdgpu_device_lock_adev
>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>
>> Best Regards,
>> Jingwen Chen
>>
>> On 2022/1/3 下午6:17, Christian König wrote:
>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>
>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>
>>> Christian.
>>>
>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>> Sure, I guess i can drop this patch then.
>>>>
>>>> Andrey
>>>>
>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>
>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>
>>>>>> Best wishes
>>>>>> Emily Deng
>>>>>>
>>>>>>
>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>> Cc: daniel@ffwll.ch
>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>> protection for SRIOV
>>>>>>>
>>>>>>> [AMD Official Use Only]
>>>>>>>
>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>
>>>>>>> Please take a review on Andrey's patch
>>>>>>>
>>>>>>> Thanks
>>>>>>> -----------------------------------------------------------------
>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>> -----------------------------------------------------------------
>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>> -----------------------------------------------------------------
>>>>>>> --
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>> <Horace.Chen@amd.com>
>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>> protection for SRIOV
>>>>>>>
>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>> need for this.
>>>>>>>>
>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>      drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>      2 files changed, 22 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>> work_struct *work)
>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>> amdgpu_device, virt);
>>>>>>>>          int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>
>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>> -     * the VF FLR.
>>>>>>>> -     */
>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>> -        return;
>>>>>>>> -
>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>
>>>>>>>>          xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>> 0, 0);
>>>>>>>>
>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>> work_struct *work)
>>>>>>>>          } while (timeout > 1);
>>>>>>>>
>>>>>>>>      flr_done:
>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>> -
>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>> */
>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>              && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>> work_struct *work)
>>>>>>>>          struct amdgpu_device *adev = container_of(virt, struct
>>>>>>> amdgpu_device, virt);
>>>>>>>>          int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>
>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>> -     * the VF FLR.
>>>>>>>> -     */
>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>> -        return;
>>>>>>>> -
>>>>>>>>          amdgpu_virt_fini_data_exchange(adev);
>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>
>>>>>>>>          xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>> 0, 0);
>>>>>>>>
>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>> work_struct *work)
>>>>>>>>          } while (timeout > 1);
>>>>>>>>
>>>>>>>>      flr_done:
>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>> -
>>>>>>>>          /* Trigger recovery for world switch failure if no TDR
>>>>>>>> */
>>>>>>>>          if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>              && (!amdgpu_device_has_job_running(adev) ||

