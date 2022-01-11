Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1BC48AC07
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:58:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C45112378;
	Tue, 11 Jan 2022 10:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6D310E6DA
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:58:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHqiK7ad9Rz5ej1nsECrUuwn1FdeGZhEti7Bcwjs7uN6F0w4hLf0fc+nYVxc6q771fn7hTltQlruXRrDJWpJr8rA+TrR+t811hKfqKAk+7Mo/tOYEspqwx6xoo68mefDCldQGXwGQtD52RGa4tSZ7kNTDue/Jth66OWo0Im/8FDccxozZ1o1U4M90je/8CT+NW7YhULJcLhh3LR5c9YxNTjgm6sYvuX6vOpILHjHJKLKJbYhyadieYJlb4RSi3dTldMshN6cwveicsof9Ms0r9pXmL1/kp/L7mx4D2dP1ZuA7Vf+gxIUXHxVbuMbmf2WEApw+IgtWXCM0lbRKf8RfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3unp/5wOd4dihVnbB/4hILuzXCwxtOjSZJr2VmymYzo=;
 b=I+G5t7iJjioNDKN0N67I2XYLsdHkI/dckvU3pSsYctWSveNFnmAkwh3Fk1xBTQB8LCfWMdk8ubdMg4poc01BD553cQ6mVaHzmuGUfJx2snNTXx5HgQmL4m+dgplCvvsnVcvip6OuIplpFDiIH4b/TEqavIjbXEbo2PlCDR7m6k7onRPAnnhAJhgDcgDQTaxuqT69wZHmBgb+k4B6KSHfWJVgQeVTjmNGQihCx44ePTic2ifqcYf6a+01rgnPr4r7DVzgfbXl3qPabWH+e5E0GfUHdN/DTarOA//kK4emU0gxULmeFQpXZNe/21/SXHWk2wLGpwQjqN6CCDfQGNBMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3unp/5wOd4dihVnbB/4hILuzXCwxtOjSZJr2VmymYzo=;
 b=WA7bX0xbU6zMAFtoWQSK0qQUH/RDY2Vq1+QWPCW3EcTYOU5e9MY3WARgWSAskLHUCxcfltfQWa8lr3brKoBx1BfAVL5mjPD+FmVrpZpV4SjkAtdNMnq1m0q98pF6jdZLPpWEcLDMiDVClssDANWTqTyBuy1b66NbgToliqEwe6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW2PR12MB2425.namprd12.prod.outlook.com
 (2603:10b6:907:f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Tue, 11 Jan
 2022 10:58:22 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::b4d6:f148:3798:6246%7]) with mapi id 15.20.4867.012; Tue, 11 Jan 2022
 10:58:22 +0000
Subject: Re: [PATCH] dma-buf: Move sysfs work out of DMA-BUF export/release
 path
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hridya Valsaraju <hridya@google.com>
References: <20220104235148.21320-1-hridya@google.com>
 <49b29081-42df-ffcd-8fea-bd819499ff1b@amd.com>
 <CA+wgaPMWT0s0KNo_wM7jU+bH626OAVtn77f7_WX=E1wyU8aBzg@mail.gmail.com>
 <3a29914d-0c7b-1f10-49cb-dbc1cc6e52b0@amd.com>
 <CA+wgaPOmRTAuXiSRRmj-s=3d2W6ny=EMFtroOShYKrp0u+xF+g@mail.gmail.com>
 <CA+wgaPO81R+NckRt0nzZazxs9fqSC_V_wyChU=kcMqJ01WxXNw@mail.gmail.com>
 <5a6bd742-10ca-2e88-afaa-3744731c2c0c@amd.com>
 <CA+wgaPPdCMPi1t+ObyO4+cqsk7Xx3E=K5BOPM37=QAviQDAfmw@mail.gmail.com>
 <CAKMK7uGRUrP+0PcY-yxTweb_K_QacHJchgPoa0K9K_kwGO+K3g@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <934ac18c-d53e-beeb-48c1-015a5936e713@amd.com>
Date: Tue, 11 Jan 2022 11:58:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAKMK7uGRUrP+0PcY-yxTweb_K_QacHJchgPoa0K9K_kwGO+K3g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0066.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::43) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d34cd5dd-c035-4299-2fd7-08d9d4f1486c
X-MS-TrafficTypeDiagnostic: MW2PR12MB2425:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2425B5F382E17881B410E82A83519@MW2PR12MB2425.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 182tacim0FSFoweBgr2X0QMGPy+4adR9Me9dESbaBxWb6wc6Z+Fuj4cGKYzMQ8gLwx5QPm9Z4UY1ewwj1M9a+Vs9sRwvBTqEcIV+dAkoQm/cKZr7WZS4ddWo3dHK/1QYxqt2Vk46soyJN3grOsZ7pvZO4NBx+yqOS4C2Dy9YeLaCRrjXrieQ0bPJ8XBoDjL4eaJz6Ekjre3c2TR1EgrYtn3g+mdatBaaowmPlsjBA2huyt4cz2DjKuaGRM25Trkv14Su/TlueNQ8GdATT8I5TNToRPvgnbNZ3MqdLauEuqmXhLwSVunNOZcE/+hrrQrfSkpTgyl/F59XKlhxcMGJ/49p0SZD7iJhdRgEzAdC5KNwFTJ/CLbWuclMqPRFLNeCFWI1JO9U6h+rq9Qfie7KTHamRHp9oQET6dwl8L3j860v3A5u0qfobndAjT5VUvwxcyBoXcqLjK0Skl6gunfvAm338Bc5sUZTlw8lkfhlz83v2hELnzsKP1wzQB6EVBqvg8wdXluuq/gUu61oTEuJV58Zqco2kRf5wWGDOpIBr5+bYRoh0Pyx0Zsfh1Ix8BOpyALFqu74bYLSKnuejXmc74jH6G5oAEPbkxlyY7lrAgTMIkGlhZ1JO0JXAL2rDV4HHhzxIyVaDZvw0zkRLiqwUGWr7KVEqufzdIlWuycGqlNfNbjxqE2R/8CEAiyMVeWHJ4BzvJSaqEW2x3T2v0hgc3yN2iI9oJXd4LNM9RzpvSSbXKIgYSV8J81rePMewa6vaRfyrWD5+2WrpIephfAw9FizRkyjzo0YStpTDjQ5EnvRgskCMtTuM7scfBHV9f7KLkEzDFLlczZYkCG8XGVYOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(31696002)(316002)(6486002)(66946007)(2616005)(110136005)(36756003)(54906003)(86362001)(6512007)(2906002)(6666004)(31686004)(5660300002)(4326008)(83380400001)(186003)(38100700002)(508600001)(45080400002)(6506007)(53546011)(66574015)(26005)(66556008)(66476007)(8676002)(966005)(8936002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZJSUdSSkRpMGVhSGdmcWtyYUZhNDhSMlNzM0hOcHIvekpLMTA5a1B5UUFG?=
 =?utf-8?B?bHFiRGJ0SFNTZGI4SUxMTkRTTGtsdTArdDZrUHgrVEZDV1oyQ002NzFldkU1?=
 =?utf-8?B?dEVMd1A2c21EK0RvTVo5bmVNOEF4cXpTUnM2QzduSVpFQjVPcFFnV3R0WTNF?=
 =?utf-8?B?RUU3amhTdmVXeW9iMmtCRWptaXI3UXY2NG1DZ0pSV0dGY0lPUEVqMzlSdUJo?=
 =?utf-8?B?U1VzSUFkWXRjV3E4aGZWRW55eklmOHBQcDF3MFJLeVJBQ3BGYTBvaHM5N1dn?=
 =?utf-8?B?cHU3aWRFaDUrVFJyNjJxOWI0QWR6NlAvRTN4Mllzcm9rQ0JiOHNzcDNnMi9r?=
 =?utf-8?B?OFdWUm84L3NZanlwZnVRMnJOMEs4UXgwUm9rK3VaK3V4Q1ZRSm1ZR3ZXVUw1?=
 =?utf-8?B?ckpGS2hHeHFTKyt1OSttMlg2WE8wUjQ0Q1Z3N0lYcEVvZE0zcVkvd3BMS3B4?=
 =?utf-8?B?dmRHL0JSRG5KSjhWMmpBc1kwekV2eDhiRERhdFdRRERsam5vYTA2dnVUTFZC?=
 =?utf-8?B?aWFmK1d5eUlabEcvZms4Z09jV3ErdWRRNVh6ak5ybmo1Zmo5ckg1VXFyMG1K?=
 =?utf-8?B?MHZibTVkZllPNEFWbGV3aTk0NVN6aTVqdjc3OTM5bnplaU5qUTZRbUljWVlX?=
 =?utf-8?B?cXJPRUZnQmszNDhzN0Y3SFJ6TWVzd0tHekY5Rzg5M00wNXdIOGRDRGlIVEg0?=
 =?utf-8?B?bWVWLzRQV2RyRjVyWUxFcmdzdHNnNnlLU1JvaTJvOG5HaUR3RG90VyszZDd0?=
 =?utf-8?B?V0hpUGlySVpIbjdOYUFvVHB1bE81R0V5ZFhwMEhDbDVjblEwVkdMWTgyQy92?=
 =?utf-8?B?TnhhbHg4UmpLMkZVNXdVbkQzeXNzMXFZdjlCVHRtMUpkb1RQTi9QVVpyOGV2?=
 =?utf-8?B?WDdGb2NaMmF5dHF3Qndwck11dnd5MFhtQXdwNE9yNFRHL3VYemdYS3BYQ1dt?=
 =?utf-8?B?azN1dEZxdlUyUjlFR2pScjlSS1lyVldJV0dOTnZTdFAyU09rT0pvK1gvS1ZQ?=
 =?utf-8?B?VWk2T0tTMTExL2xnTk9iYkJxMFQxcWo1QURvbTlsNG9McmQvcTZIOG03SDVR?=
 =?utf-8?B?djFIVVFuSVNVTFcwV1ZoK3J5dUJFeElTWFRNaW4xMDJFb1RiSTlWVE81YURS?=
 =?utf-8?B?YTRvOVhIN1hQNytFRERlRGdkQTJFSjlwRU51T0oyYVJzUlRlSU9ITEZXNi9H?=
 =?utf-8?B?ZGtMdVNMOFBwbkZYZWpESHNGYlAyalBOVWhxWW9ia25LWGxwSXVZcUdwOElP?=
 =?utf-8?B?TEY5VkFWSHdiM3R1SFV5WXhyZzY4SW5YUXpmU0twN2hDdlQzTXlScnVFYlZK?=
 =?utf-8?B?T2ltb2hlMWdOTCtUMnU0Y1ZYdmVLWjcvck5aYkV0cWR6cm1GOGRvWlpqWGNE?=
 =?utf-8?B?MUpZbkk2YVBTR0w2Uk9nRmVWY1lEZ0czM3hTYjJLc2J0VjNpdVJzWHJObHo0?=
 =?utf-8?B?SGR5bzJQa0hueFY5TXRUdHpYMDdLZUxwbnhSTVVVNjZyK1hOUDZNdkRubDlK?=
 =?utf-8?B?MVVuUE9HZGZtM05weGVtRks5S2o4UmhhRFBIalV5WEM1ZklYK0VGa0ZyY1Bx?=
 =?utf-8?B?Y0hDNmJSUE9GMjRReG5QYUp2eVlOb3gxcVloYzk3bnNDWitHOHdSM0ZiM0dz?=
 =?utf-8?B?d3drbUdONnBJR1pwb2liODF6SVZRQ3FRc3I5anhLNWFlbjBuaDdmV054ckJt?=
 =?utf-8?B?WCtqZGxTejNsakZRb2NxbVh5NklRRGdUK1B1QVdSeWhLUGtBN2tqaDV6RTN1?=
 =?utf-8?B?UEtLQ014cTB0TzVLTnNVREdIVG5INkZ3SUR3cHFIaDhkaTh3SmxvS1B6SGlJ?=
 =?utf-8?B?MzU0L3ROaFVPU2ZIOHNyRE5BM3o3SjJrRHZFRjNRTVdIcFBjUmJZSkd4RXJz?=
 =?utf-8?B?RXJaZHJPZkxIRVB4KzNoSkNRRS9JZmZzZlIyTE9MbHVXYjdyRW1Nd0lRb2pp?=
 =?utf-8?B?OXRLQ0JsOFZQeFd3STgzbmdQT0NqeGZLbnluUFQ3ZVlRR05CcW14dHIvek9L?=
 =?utf-8?B?NnV6M250b1p3NDNFOEppNkk1WVRCcjErKzJNamxnMmlXck4xZHBMRWMyRE5x?=
 =?utf-8?B?RUlHWEZCRnhPQjd3cEExSmhFcmJiU0tvZkorc2pxbzBpaG5Cdzk4Qm9VUVNi?=
 =?utf-8?Q?tpiY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34cd5dd-c035-4299-2fd7-08d9d4f1486c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2022 10:58:22.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1p7NQRbu/KUEDS8CEB58JSnRWxv0SsgrirGTeyuNfak03GzcqJatFI11uZWDkmkF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2425
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, keescook@google.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tjmercier@google.com, linaro-mm-sig@lists.linaro.org, kaleshsingh@google.com,
 surenb@google.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.01.22 um 09:35 schrieb Daniel Vetter:
> On Tue, Jan 11, 2022 at 7:02 AM Hridya Valsaraju <hridya@google.com> wrote:
>> On Sun, Jan 9, 2022 at 11:28 PM Christian König
>> <christian.koenig@amd.com> wrote:
>>> Am 07.01.22 um 22:25 schrieb Hridya Valsaraju:
>>>> On Fri, Jan 7, 2022 at 10:17 AM Hridya Valsaraju <hridya@google.com> wrote:
>>>>> On Fri, Jan 7, 2022 at 2:22 AM Christian König <christian.koenig@amd.com> wrote:
>>>>>> Am 06.01.22 um 20:04 schrieb Hridya Valsaraju:
>>>>>>> On Thu, Jan 6, 2022 at 12:59 AM Christian König
>>>>>>> <christian.koenig@amd.com> wrote:
>>>>>>>> Am 05.01.22 um 00:51 schrieb Hridya Valsaraju:
>>>>>>>>> Recently, we noticed an issue where a process went into direct reclaim
>>>>>>>>> while holding the kernfs rw semaphore for sysfs in write(exclusive)
>>>>>>>>> mode. This caused processes who were doing DMA-BUF exports and releases
>>>>>>>>> to go into uninterruptible sleep since they needed to acquire the same
>>>>>>>>> semaphore for the DMA-BUF sysfs entry creation/deletion. In order to avoid
>>>>>>>>> blocking DMA-BUF export/release for an indeterminate amount of time
>>>>>>>>> while another process is holding the sysfs rw semaphore in exclusive
>>>>>>>>> mode, this patch moves the per-buffer sysfs file creation/deleteion to
>>>>>>>>> a kthread.
>>>>>>>> Well I absolutely don't think that this is justified.
>>>>>>>>
>>>>>>>> You adding tons of complexity here just to avoid the overhead of
>>>>>>>> creating the sysfs files while exporting DMA-bufs which is an operation
>>>>>>>> which should be done exactly once in the lifecycle for the most common
>>>>>>>> use case.
>>>>>>>>
>>>>>>>> Please explain further why that should be necessary.
>>>>>>> Hi Christian,
>>>>>>>
>>>>>>> We noticed that the issue sometimes causes the exporting process to go
>>>>>>> to the uninterrupted sleep state for tens of milliseconds which
>>>>>>> unfortunately leads to user-perceptible UI jank. This is the reason
>>>>>>> why we are trying to move the sysfs entry creation and deletion out of
>>>>>>> the DMA-BUF export/release path. I will update the commit message to
>>>>>>> include the same in the next revision.
>>>>>> That is still not a justification for this change. The question is why
>>>>>> do you need that in the first place?
>>>>>>
>>>>>> Exporting a DMA-buf should be something would should be very rarely,
>>>>>> e.g. only at the start of an application.
>>>>> Hi Christian,
>>>>>
>>>>> Yes, that is correct. Noticeable jank caused by the issue is not
>>>>> present at all times and happens on UI transitions(for example during
>>>>> app launches and exits) when there are several DMA-BUFs being exported
>>>>> and released. This is especially true in the case of the camera app
>>>>> since it exports and releases a relatively larger number of DMA-BUFs
>>>>> during launch and exit respectively.
>>> Well, that sounds at least better than before.
>>>
>>>>> Regards,
>>>>> Hridya
>>>>>
>>>>>> So this strongly looks like you are trying to optimize for an use case
>>>>>> where we should probably rethink what userspace is doing here instead.
>>>> Hello Christian,
>>>>
>>>> If you don't mind, could you please elaborate on the above statement?
>>> The purpose of DMA-buf is to share a rather low number of buffers
>>> between different drivers and/or applications.
>>>
>>> For example with triple buffering we have three buffers shared between
>>> the camera driver and the display driver, same thing for use cases
>>> between rendering and display.
>>>
>>> So even when you have ~100 applications open your should not share more
>>> than ~300 DMA-buf handles and doing that should absolutely not cause any
>>> problems like you described above.
>>>
>>> Long story short when this affects your user experience then your user
>>> space is exporting *much* more buffers than expected. Especially since
>>> the sysfs overhead is completely negligible compared to the overhead
>>> drivers have when they export buffers.
>>
>>
>> I do not think we can solve this issue from userspace since the
>> problem is not due to the overhead of sysfs creation/teardown itself.

Yes, thanks. That's the important information I was looking for.

>> The problem is that the duration of time for which the exporting
>> process would need to sleep waiting for the kernfs_rwsem semaphore is
>> undefined when the holder of the semaphore goes under direct reclaim.
>> Fsnotify events for sysfs files are also generated while holding the
>> same semaphore.
>>
>> This is also not a problem due to the high number of DMA-BUF
>> exports during launch time, as even a single export can be delayed for
>> an unpredictable amount of time. We cannot eliminate DMA-BUF exports
>> completely during app-launches and we are unfortunately seeing reports
>> of the exporting process occasionally sleeping long enough to cause
>> user-visible jankiness :(
>>
>> We also looked at whether any optimizations are possible from the
>> kernfs implementation side[1] but the semaphore is used quite extensively
>> and it looks like the best way forward would be to remove sysfs
>> creation/teardown from the DMA-BUF export/release path altogether. We
>> have some ideas on how we can reduce the code-complexity in the
>> current patch. If we manage to
>> simplify it considerably, would the approach of offloading sysfs
>> creation and teardown into a separate thread be acceptable Christian?

At bare minimum I suggest to use a work_struct instead of re-inventing 
that with kthread.

And then only put the exporting of buffers into the background and not 
the teardown.

>> Thank you for the guidance!
> One worry I have here with doing this async that now userspace might
> have a dma-buf, but the sysfs entry does not yet exist, or the dma-buf
> is gone, but the sysfs entry still exists. That's a bit awkward wrt
> semantics.
>
> Also I'm pretty sure that if we can hit this, then other subsystems
> using kernfs have similar problems, so trying to fix this in kernfs
> with slightly more fine-grained locking sounds like a much more solid
> approach. The linked patch talks about how the big delays happen due
> to direct reclaim, and that might be limited to specific code paths
> that we need to look at? As-is this feels a bit much like papering
> over kernfs issues in hackish ways in sysfs users, instead of tackling
> the problem at its root.

Which is exactly my feeling as well, yes.

Regards,
Christian.

> -Daniel
>
>> Regards,
>> Hridya
>>
>> [1]: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20211118230008.2679780-1-minchan%40kernel.org%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C261f37c211bc4abe857b08d9d4dd4fd7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637774869282278924%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=tqWiJAZxpOpk5QrzuisMwt1e9esI1q0npaMHevsQCwI%3D&amp;reserved=0
>>
>>
>>
>>> I think in that light adding sysfs was rather questionable to begin
>>> with, but that change here is a complete no-go if you ask me. You are
>>> adding complexity to the kernel for something which should probably be
>>> optimized in userspace.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Thanks in advance for the guidance!
>>>>
>>>> Regards,
>>>> Hridya
>>>>
>>>>>> If we would want to go down this route you would need to change all the
>>>>>> drivers implementing the DMA-buf export functionality to avoid
>>>>>> uninterruptible sleep as well and that is certainly something I would NAK.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> Thanks,
>>>>>>> Hridya
>>>>>>>
>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>>>>>>>>> Signed-off-by: Hridya Valsaraju <hridya@google.com>
>>>>>>>>> ---
>>>>>>>>>      drivers/dma-buf/dma-buf-sysfs-stats.c | 343 ++++++++++++++++++++++++--
>>>>>>>>>      include/linux/dma-buf.h               |  46 ++++
>>>>>>>>>      2 files changed, 366 insertions(+), 23 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>> index 053baadcada9..3251fdf2f05f 100644
>>>>>>>>> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
>>>>>>>>> @@ -7,13 +7,39 @@
>>>>>>>>>
>>>>>>>>>      #include <linux/dma-buf.h>
>>>>>>>>>      #include <linux/dma-resv.h>
>>>>>>>>> +#include <linux/freezer.h>
>>>>>>>>>      #include <linux/kobject.h>
>>>>>>>>> +#include <linux/kthread.h>
>>>>>>>>> +#include <linux/list.h>
>>>>>>>>>      #include <linux/printk.h>
>>>>>>>>> +#include <linux/sched/signal.h>
>>>>>>>>>      #include <linux/slab.h>
>>>>>>>>>      #include <linux/sysfs.h>
>>>>>>>>>
>>>>>>>>>      #include "dma-buf-sysfs-stats.h"
>>>>>>>>>
>>>>>>>>> +struct dmabuf_kobj_work {
>>>>>>>>> +     struct list_head list;
>>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>>>>> +     unsigned long uid;
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/* Both kobject setup and teardown work gets queued on the list. */
>>>>>>>>> +static LIST_HEAD(dmabuf_kobj_work_list);
>>>>>>>>> +
>>>>>>>>> +/* dmabuf_kobj_list_lock protects dmabuf_kobj_work_list. */
>>>>>>>>> +static DEFINE_SPINLOCK(dmabuf_kobj_list_lock);
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * dmabuf_sysfs_show_lock prevents a race between a DMA-BUF sysfs file being
>>>>>>>>> + * read and the DMA-BUF being freed by protecting sysfs_entry->dmabuf.
>>>>>>>>> + */
>>>>>>>>> +static DEFINE_SPINLOCK(dmabuf_sysfs_show_lock);
>>>>>>>>> +
>>>>>>>>> +static struct task_struct *dmabuf_kobject_task;
>>>>>>>>> +static wait_queue_head_t dmabuf_kobject_waitqueue;
>>>>>>>>> +
>>>>>>>>>      #define to_dma_buf_entry_from_kobj(x) container_of(x, struct dma_buf_sysfs_entry, kobj)
>>>>>>>>>
>>>>>>>>>      /**
>>>>>>>>> @@ -64,15 +90,26 @@ static ssize_t dma_buf_stats_attribute_show(struct kobject *kobj,
>>>>>>>>>          struct dma_buf_stats_attribute *attribute;
>>>>>>>>>          struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>>>>          struct dma_buf *dmabuf;
>>>>>>>>> +     int ret;
>>>>>>>>>
>>>>>>>>>          attribute = to_dma_buf_stats_attr(attr);
>>>>>>>>>          sysfs_entry = to_dma_buf_entry_from_kobj(kobj);
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * acquire dmabuf_sysfs_show_lock to prevent a race with the DMA-BUF
>>>>>>>>> +      * being freed while sysfs_entry->dmabuf is being accessed.
>>>>>>>>> +      */
>>>>>>>>> +     spin_lock(&dmabuf_sysfs_show_lock);
>>>>>>>>>          dmabuf = sysfs_entry->dmabuf;
>>>>>>>>>
>>>>>>>>> -     if (!dmabuf || !attribute->show)
>>>>>>>>> +     if (!dmabuf || !attribute->show) {
>>>>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>>>>>                  return -EIO;
>>>>>>>>> +     }
>>>>>>>>>
>>>>>>>>> -     return attribute->show(dmabuf, attribute, buf);
>>>>>>>>> +     ret = attribute->show(dmabuf, attribute, buf);
>>>>>>>>> +     spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>>>>> +     return ret;
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>>      static const struct sysfs_ops dma_buf_stats_sysfs_ops = {
>>>>>>>>> @@ -118,33 +155,275 @@ static struct kobj_type dma_buf_ktype = {
>>>>>>>>>          .default_groups = dma_buf_stats_default_groups,
>>>>>>>>>      };
>>>>>>>>>
>>>>>>>>> -void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>>>>>>>> +/* Statistics files do not need to send uevents. */
>>>>>>>>> +static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>>>>>>>>      {
>>>>>>>>> -     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>> -     sysfs_entry = dmabuf->sysfs_entry;
>>>>>>>>> -     if (!sysfs_entry)
>>>>>>>>> -             return;
>>>>>>>>> +static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>>>>>>>> +     .filter = dmabuf_sysfs_uevent_filter,
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/* setup of sysfs entries done asynchronously in the worker thread. */
>>>>>>>>> +static void dma_buf_sysfs_stats_setup_work(struct dmabuf_kobj_work *kobject_work)
>>>>>>>>> +{
>>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata =
>>>>>>>>> +                     kobject_work->sysfs_metadata;
>>>>>>>>> +     bool free_metadata = false;
>>>>>>>>> +
>>>>>>>>> +     int ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>>>>>>>> +                                    "%lu", kobject_work->uid);
>>>>>>>>> +     if (ret) {
>>>>>>>>> +             kobject_put(&sysfs_entry->kobj);
>>>>>>>>> +
>>>>>>>>> +             spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +             if (sysfs_metadata->status == SYSFS_ENTRY_INIT_ABORTED) {
>>>>>>>>> +                     /*
>>>>>>>>> +                      * SYSFS_ENTRY_INIT_ABORTED means that the DMA-BUF has already
>>>>>>>>> +                      * been freed. At this point, its safe to free the memory for
>>>>>>>>> +                      * the sysfs_metadata;
>>>>>>>>> +                      */
>>>>>>>>> +                     free_metadata = true;
>>>>>>>>> +             } else {
>>>>>>>>> +                     /*
>>>>>>>>> +                      * The DMA-BUF has not yet been freed, set the status to
>>>>>>>>> +                      * sysfs_entry_error so that when the DMA-BUF gets
>>>>>>>>> +                      * freed, we know there is no need to teardown the sysfs
>>>>>>>>> +                      * entry.
>>>>>>>>> +                      */
>>>>>>>>> +                     sysfs_metadata->status = SYSFS_ENTRY_ERROR;
>>>>>>>>> +             }
>>>>>>>>> +             goto unlock;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * If the DMA-BUF has not yet been released, status would still be
>>>>>>>>> +      * SYSFS_ENTRY_INIT_IN_PROGRESS. We set the status as initialized.
>>>>>>>>> +      */
>>>>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>>>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INITIALIZED;
>>>>>>>>> +             goto unlock;
>>>>>>>>> +     }
>>>>>>>>>
>>>>>>>>> +     /*
>>>>>>>>> +      * At this point the status is SYSFS_ENTRY_INIT_ABORTED which means
>>>>>>>>> +      * that the DMA-BUF has already been freed. Hence, we cleanup the
>>>>>>>>> +      * sysfs_entry and its metadata since neither of them are needed
>>>>>>>>> +      * anymore.
>>>>>>>>> +      */
>>>>>>>>> +     free_metadata = true;
>>>>>>>>>          kobject_del(&sysfs_entry->kobj);
>>>>>>>>>          kobject_put(&sysfs_entry->kobj);
>>>>>>>>> +
>>>>>>>>> +unlock:
>>>>>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +     if (free_metadata) {
>>>>>>>>> +             kfree(kobject_work->sysfs_metadata);
>>>>>>>>> +             kobject_work->sysfs_metadata = NULL;
>>>>>>>>> +     }
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> +/* teardown of sysfs entries done asynchronously in the worker thread. */
>>>>>>>>> +static void dma_buf_sysfs_stats_teardown_work(struct dmabuf_kobj_work *kobject_work)
>>>>>>>>> +{
>>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry = kobject_work->sysfs_entry;
>>>>>>>>>
>>>>>>>>> -/* Statistics files do not need to send uevents. */
>>>>>>>>> -static int dmabuf_sysfs_uevent_filter(struct kset *kset, struct kobject *kobj)
>>>>>>>>> +     kobject_del(&sysfs_entry->kobj);
>>>>>>>>> +     kobject_put(&sysfs_entry->kobj);
>>>>>>>>> +
>>>>>>>>> +     kfree(kobject_work->sysfs_metadata);
>>>>>>>>> +     kobject_work->sysfs_metadata = NULL;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +/* do setup or teardown of sysfs entries as required */
>>>>>>>>> +static void do_kobject_work(struct dmabuf_kobj_work *kobject_work)
>>>>>>>>>      {
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>>>>> +     bool setup_needed = false;
>>>>>>>>> +     bool teardown_needed = false;
>>>>>>>>> +
>>>>>>>>> +     sysfs_metadata = kobject_work->sysfs_metadata;
>>>>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED) {
>>>>>>>>> +             setup_needed = true;
>>>>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_IN_PROGRESS;
>>>>>>>>> +     } else if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>>>>>>>> +             teardown_needed = true;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * It is ok to release the sysfs_entry_lock here.
>>>>>>>>> +      *
>>>>>>>>> +      * If setup_needed is true, we check the status again after the kobject
>>>>>>>>> +      * initialization to see if it has been set to SYSFS_ENTRY_INIT_ABORTED
>>>>>>>>> +      * and if so teardown the kobject.
>>>>>>>>> +      *
>>>>>>>>> +      * If teardown_needed is true, there are no more changes expected to the
>>>>>>>>> +      * status.
>>>>>>>>> +      *
>>>>>>>>> +      * If neither setup_needed nor teardown needed are true, it
>>>>>>>>> +      * means the DMA-BUF was freed before we got around to setting up the
>>>>>>>>> +      * sysfs entry and hence we just need to release the metadata and
>>>>>>>>> +      * return.
>>>>>>>>> +      */
>>>>>>>>> +     spin_unlock(&kobject_work->sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +
>>>>>>>>> +     if (setup_needed)
>>>>>>>>> +             dma_buf_sysfs_stats_setup_work(kobject_work);
>>>>>>>>> +     else if (teardown_needed)
>>>>>>>>> +             dma_buf_sysfs_stats_teardown_work(kobject_work);
>>>>>>>>> +     else
>>>>>>>>> +             kfree(kobject_work->sysfs_metadata);
>>>>>>>>> +
>>>>>>>>> +     kfree(kobject_work);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static struct dmabuf_kobj_work *get_next_kobj_work(void)
>>>>>>>>> +{
>>>>>>>>> +     struct dmabuf_kobj_work *kobject_work;
>>>>>>>>> +
>>>>>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>>>>>>>> +     kobject_work = list_first_entry_or_null(&dmabuf_kobj_work_list,
>>>>>>>>> +                                             struct dmabuf_kobj_work, list);
>>>>>>>>> +     if (kobject_work)
>>>>>>>>> +             list_del(&kobject_work->list);
>>>>>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>>>>>>>> +     return kobject_work;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static int kobject_work_thread(void *data)
>>>>>>>>> +{
>>>>>>>>> +     struct dmabuf_kobj_work *kobject_work;
>>>>>>>>> +
>>>>>>>>> +     while (1) {
>>>>>>>>> +             wait_event_freezable(dmabuf_kobject_waitqueue,
>>>>>>>>> +                                  (kobject_work = get_next_kobj_work()));
>>>>>>>>> +             do_kobject_work(kobject_work);
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>>          return 0;
>>>>>>>>>      }
>>>>>>>>>
>>>>>>>>> -static const struct kset_uevent_ops dmabuf_sysfs_no_uevent_ops = {
>>>>>>>>> -     .filter = dmabuf_sysfs_uevent_filter,
>>>>>>>>> -};
>>>>>>>>> +static int kobject_worklist_init(void)
>>>>>>>>> +{
>>>>>>>>> +     init_waitqueue_head(&dmabuf_kobject_waitqueue);
>>>>>>>>> +     dmabuf_kobject_task = kthread_run(kobject_work_thread, NULL,
>>>>>>>>> +                                       "%s", "dmabuf-kobject-worker");
>>>>>>>>> +     if (IS_ERR(dmabuf_kobject_task)) {
>>>>>>>>> +             pr_err("Creating thread for deferred sysfs entry creation/deletion failed\n");
>>>>>>>>> +             return PTR_ERR(dmabuf_kobject_task);
>>>>>>>>> +     }
>>>>>>>>> +     sched_set_normal(dmabuf_kobject_task, MAX_NICE);
>>>>>>>>> +
>>>>>>>>> +     return 0;
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +static void deferred_kobject_create(struct dmabuf_kobj_work *kobject_work)
>>>>>>>>> +{
>>>>>>>>> +     INIT_LIST_HEAD(&kobject_work->list);
>>>>>>>>> +
>>>>>>>>> +     spin_lock(&dmabuf_kobj_list_lock);
>>>>>>>>> +
>>>>>>>>> +     list_add_tail(&kobject_work->list, &dmabuf_kobj_work_list);
>>>>>>>>> +
>>>>>>>>> +     spin_unlock(&dmabuf_kobj_list_lock);
>>>>>>>>> +
>>>>>>>>> +     wake_up(&dmabuf_kobject_waitqueue);
>>>>>>>>> +}
>>>>>>>>> +
>>>>>>>>> +
>>>>>>>>> +void dma_buf_stats_teardown(struct dma_buf *dmabuf)
>>>>>>>>> +{
>>>>>>>>> +     struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>>>>> +     struct dmabuf_kobj_work *kobj_work;
>>>>>>>>> +
>>>>>>>>> +     sysfs_entry = dmabuf->sysfs_entry;
>>>>>>>>> +     if (!sysfs_entry)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>>>>> +     if (!sysfs_metadata)
>>>>>>>>> +             return;
>>>>>>>>> +
>>>>>>>>> +     spin_lock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +
>>>>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_UNINITIALIZED ||
>>>>>>>>> +         sysfs_metadata->status == SYSFS_ENTRY_INIT_IN_PROGRESS) {
>>>>>>>>> +             /*
>>>>>>>>> +              * The sysfs entry for this buffer has not yet been initialized,
>>>>>>>>> +              * we set the status to SYSFS_ENTRY_INIT_ABORTED to abort the
>>>>>>>>> +              * initialization.
>>>>>>>>> +              */
>>>>>>>>> +             sysfs_metadata->status = SYSFS_ENTRY_INIT_ABORTED;
>>>>>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +
>>>>>>>>> +             /*
>>>>>>>>> +              * In case kobject initialization completes right as we release
>>>>>>>>> +              * the sysfs_entry_lock, disable show() for the sysfs entry by
>>>>>>>>> +              * setting sysfs_entry->dmabuf to NULL to prevent a race.
>>>>>>>>> +              */
>>>>>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>>>>>>>> +             sysfs_entry->dmabuf = NULL;
>>>>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>>>>> +
>>>>>>>>> +             return;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     if (sysfs_metadata->status == SYSFS_ENTRY_INITIALIZED) {
>>>>>>>>> +             /*
>>>>>>>>> +              * queue teardown work only if sysfs_entry is fully inititalized.
>>>>>>>>> +              * It is ok to release the sysfs_entry_lock here since the
>>>>>>>>> +              * status can no longer change.
>>>>>>>>> +              */
>>>>>>>>> +             spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +
>>>>>>>>> +             /*
>>>>>>>>> +              * Meanwhile disable show() for the sysfs entry to avoid a race
>>>>>>>>> +              * between teardown and show().
>>>>>>>>> +              */
>>>>>>>>> +             spin_lock(&dmabuf_sysfs_show_lock);
>>>>>>>>> +             sysfs_entry->dmabuf = NULL;
>>>>>>>>> +             spin_unlock(&dmabuf_sysfs_show_lock);
>>>>>>>>> +
>>>>>>>>> +             kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>>>>>>>> +             if (!kobj_work) {
>>>>>>>>> +                     /* do the teardown immediately. */
>>>>>>>>> +                     kobject_del(&sysfs_entry->kobj);
>>>>>>>>> +                     kobject_put(&sysfs_entry->kobj);
>>>>>>>>> +                     kfree(sysfs_metadata);
>>>>>>>>> +             } else {
>>>>>>>>> +                     /* queue teardown work. */
>>>>>>>>> +                     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>>>>>>>> +                     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>>>>> +                     deferred_kobject_create(kobj_work);
>>>>>>>>> +             }
>>>>>>>>> +
>>>>>>>>> +             return;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     /*
>>>>>>>>> +      * status is SYSFS_ENTRY_INIT_ERROR so we only need to free the
>>>>>>>>> +      * metadata.
>>>>>>>>> +      */
>>>>>>>>> +     spin_unlock(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>> +     kfree(dmabuf->sysfs_entry_metadata);
>>>>>>>>> +     dmabuf->sysfs_entry_metadata = NULL;
>>>>>>>>> +}
>>>>>>>>>
>>>>>>>>>      static struct kset *dma_buf_stats_kset;
>>>>>>>>>      static struct kset *dma_buf_per_buffer_stats_kset;
>>>>>>>>>      int dma_buf_init_sysfs_statistics(void)
>>>>>>>>>      {
>>>>>>>>> +     int ret;
>>>>>>>>> +
>>>>>>>>> +     ret = kobject_worklist_init();
>>>>>>>>> +     if (ret)
>>>>>>>>> +             return ret;
>>>>>>>>> +
>>>>>>>>>          dma_buf_stats_kset = kset_create_and_add("dmabuf",
>>>>>>>>>                                                   &dmabuf_sysfs_no_uevent_ops,
>>>>>>>>>                                                   kernel_kobj);
>>>>>>>>> @@ -171,7 +450,8 @@ void dma_buf_uninit_sysfs_statistics(void)
>>>>>>>>>      int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>>>>>>      {
>>>>>>>>>          struct dma_buf_sysfs_entry *sysfs_entry;
>>>>>>>>> -     int ret;
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_metadata;
>>>>>>>>> +     struct dmabuf_kobj_work *kobj_work;
>>>>>>>>>
>>>>>>>>>          if (!dmabuf || !dmabuf->file)
>>>>>>>>>                  return -EINVAL;
>>>>>>>>> @@ -188,18 +468,35 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>>>>>>>>>          sysfs_entry->kobj.kset = dma_buf_per_buffer_stats_kset;
>>>>>>>>>          sysfs_entry->dmabuf = dmabuf;
>>>>>>>>>
>>>>>>>>> +     sysfs_metadata = kzalloc(sizeof(struct dma_buf_sysfs_entry_metadata),
>>>>>>>>> +                              GFP_KERNEL);
>>>>>>>>> +     if (!sysfs_metadata) {
>>>>>>>>> +             kfree(sysfs_entry);
>>>>>>>>> +             return -ENOMEM;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>>          dmabuf->sysfs_entry = sysfs_entry;
>>>>>>>>>
>>>>>>>>> -     /* create the directory for buffer stats */
>>>>>>>>> -     ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
>>>>>>>>> -                                "%lu", file_inode(dmabuf->file)->i_ino);
>>>>>>>>> -     if (ret)
>>>>>>>>> -             goto err_sysfs_dmabuf;
>>>>>>>>> +     sysfs_metadata->status = SYSFS_ENTRY_UNINITIALIZED;
>>>>>>>>> +     spin_lock_init(&sysfs_metadata->sysfs_entry_lock);
>>>>>>>>>
>>>>>>>>> -     return 0;
>>>>>>>>> +     dmabuf->sysfs_entry_metadata = sysfs_metadata;
>>>>>>>>>
>>>>>>>>> -err_sysfs_dmabuf:
>>>>>>>>> -     kobject_put(&sysfs_entry->kobj);
>>>>>>>>> -     dmabuf->sysfs_entry = NULL;
>>>>>>>>> -     return ret;
>>>>>>>>> +     kobj_work = kzalloc(sizeof(struct dmabuf_kobj_work), GFP_KERNEL);
>>>>>>>>> +     if (!kobj_work) {
>>>>>>>>> +             kfree(sysfs_entry);
>>>>>>>>> +             kfree(sysfs_metadata);
>>>>>>>>> +             return -ENOMEM;
>>>>>>>>> +     }
>>>>>>>>> +
>>>>>>>>> +     kobj_work->sysfs_entry = dmabuf->sysfs_entry;
>>>>>>>>> +     kobj_work->sysfs_metadata = dmabuf->sysfs_entry_metadata;
>>>>>>>>> +     /*
>>>>>>>>> +      * stash the inode number in struct dmabuf_kobj_work since setup
>>>>>>>>> +      * might race with DMA-BUF teardown.
>>>>>>>>> +      */
>>>>>>>>> +     kobj_work->uid = file_inode(dmabuf->file)->i_ino;
>>>>>>>>> +
>>>>>>>>> +     deferred_kobject_create(kobj_work);
>>>>>>>>> +     return 0;
>>>>>>>>>      }
>>>>>>>>> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
>>>>>>>>> index 7ab50076e7a6..0597690023a0 100644
>>>>>>>>> --- a/include/linux/dma-buf.h
>>>>>>>>> +++ b/include/linux/dma-buf.h
>>>>>>>>> @@ -287,6 +287,50 @@ struct dma_buf_ops {
>>>>>>>>>          void (*vunmap)(struct dma_buf *dmabuf, struct dma_buf_map *map);
>>>>>>>>>      };
>>>>>>>>>
>>>>>>>>> +#ifdef CONFIG_DMABUF_SYSFS_STATS
>>>>>>>>> +enum sysfs_entry_status {
>>>>>>>>> +     SYSFS_ENTRY_UNINITIALIZED,
>>>>>>>>> +     SYSFS_ENTRY_INIT_IN_PROGRESS,
>>>>>>>>> +     SYSFS_ENTRY_ERROR,
>>>>>>>>> +     SYSFS_ENTRY_INIT_ABORTED,
>>>>>>>>> +     SYSFS_ENTRY_INITIALIZED,
>>>>>>>>> +};
>>>>>>>>> +
>>>>>>>>> +/*
>>>>>>>>> + * struct dma_buf_sysfs_entry_metadata - Holds the current status for the
>>>>>>>>> + * DMA-BUF sysfs entry.
>>>>>>>>> + *
>>>>>>>>> + * @status: holds the current status for the DMA-BUF sysfs entry. The status of
>>>>>>>>> + * the sysfs entry has the following path.
>>>>>>>>> + *
>>>>>>>>> + *                   SYSFS_ENTRY_UNINITIALIZED
>>>>>>>>> + *            __________________|____________________
>>>>>>>>> + *           |                                       |
>>>>>>>>> + *     SYSFS_ENTRY_INIT_IN_PROGRESS      SYSFS_ENTRY_INIT_ABORTED (DMA-BUF
>>>>>>>>> + *           |                                                     gets freed
>>>>>>>>> + *           |                                                     before
>>>>>>>>> + *           |                                                     init)
>>>>>>>>> + *   ________|_____________________________________
>>>>>>>>> + *   |                         |                   |
>>>>>>>>> + * SYSFS_ENTRY_INITIALIZED     |       SYSFS_ENTRY_INIT_ABORTED
>>>>>>>>> + *                             |               (DMA-BUF gets freed during kobject
>>>>>>>>> + *                             |               init)
>>>>>>>>> + *                             |
>>>>>>>>> + *                             |
>>>>>>>>> + *                 SYSFS_ENTRY_ERROR
>>>>>>>>> + *                 (error during kobject init)
>>>>>>>>> + *
>>>>>>>>> + * @sysfs_entry_lock: protects access to @status.
>>>>>>>>> + */
>>>>>>>>> +struct dma_buf_sysfs_entry_metadata {
>>>>>>>>> +     enum sysfs_entry_status status;
>>>>>>>>> +     /*
>>>>>>>>> +      * Protects sysfs_entry_metadata->status
>>>>>>>>> +      */
>>>>>>>>> +     spinlock_t sysfs_entry_lock;
>>>>>>>>> +};
>>>>>>>>> +#endif
>>>>>>>>> +
>>>>>>>>>      /**
>>>>>>>>>       * struct dma_buf - shared buffer object
>>>>>>>>>       *
>>>>>>>>> @@ -452,6 +496,8 @@ struct dma_buf {
>>>>>>>>>                  struct kobject kobj;
>>>>>>>>>                  struct dma_buf *dmabuf;
>>>>>>>>>          } *sysfs_entry;
>>>>>>>>> +
>>>>>>>>> +     struct dma_buf_sysfs_entry_metadata *sysfs_entry_metadata;
>>>>>>>>>      #endif
>>>>>>>>>      };
>>>>>>>>>
>
>

