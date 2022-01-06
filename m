Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D5486A5E
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 20:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635B910F10D;
	Thu,  6 Jan 2022 19:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3269510F10A;
 Thu,  6 Jan 2022 19:13:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSKY+/YTxjvvh8lw4p4Qx7mV2vmF9fZCimxJW5l3lpSJLsDuY5Avo7sKaV2xpy19TjkwAwbdUKQhfEHS+QFZe/WmgkkOJYoVMomDG8OfhoIWZ3H2quPvoKF63X9ThnZiqH10jDKsY3BtLX6avJy6LgL8OnVIcP15GfrF+rqDLi+xus3cDaL50gEw//YwlToAp26spUCWqX0eKk+gdAuGmP0q+Xk/eLcdRi2KatO59N/jmeoEWzVpirqfm+6NV3ZH0KqHWZUt1A91jZaimHoCy17LGhDze9MYg/35sGuSgP4JwFJqN0GblF1IybG8EZKAKT7RUZq4ByZDjDNW277vzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qewXOUDLdetFOCDL6BjiVx3BxjhJrLDmjyQZHAN/UQY=;
 b=aJerXyQ80NhHUkcP96EOpNqlEWbncc9V5oti59CpQyrfifCckNzIamw2EFtwFo/pnF8UtBY7l4GhVbpjf3bf+F3K07+lfp/xvB4W1WCVmN27+lPaBre0UXuc9lAuXkih7wCgqjqRCN76T1JYCjnr6FMpFhzItAM+XKW+UkB4QK4tBxfeg23uZiHOchnxy4vl9ivv5jepZJzF1mv/Zf13IDREGmtcsj8fOEpniNlheAF5xOjlVRdfS2SdqnuLtZ3B3Ymjje86/GrNV6+AijcJPO/WQArBz1PhLlEjrrAq2iFGaalC502/EmcTdAWyOPRS128IF1Z2/cjyriXzsyT8bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qewXOUDLdetFOCDL6BjiVx3BxjhJrLDmjyQZHAN/UQY=;
 b=ogN/NTfn3Qezxw58tU0tVdEaPCHf8XRXncHoQ522gd0SwrO/AsCNPGAYAkzmcFH25YJTdSPOqMinkUIe7m1Glkwr+nzwdZP+bHa4Hk/lEFZ11XgPpVC/ORj8NERCm/Axrw8Yw4oJX1JWRpf1OLLeKW1rneSCC9z8VSHi1aU5zQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4466.namprd12.prod.outlook.com (2603:10b6:5:2ae::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 19:13:48 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4867.010; Thu, 6 Jan 2022
 19:13:48 +0000
Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection
 for SRIOV
To: JingWen Chen <jingwech@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Liu, Monk" <Monk.Liu@amd.com>, "Chen, JingWen" <JingWen.Chen2@amd.com>,
 "Deng, Emily" <Emily.Deng@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Chen, Horace" <Horace.Chen@amd.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
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
 <23bebf13-c622-7c61-af88-0e0970b90389@amd.com>
 <a74c1198-6027-6a0f-55a8-24227c868704@amd.com>
 <c41f0294-fd64-cf16-8c22-994a7a2ed157@amd.com>
 <821c0b66-8c9c-9dff-a328-bfbc2233d4ef@gmail.com>
 <eecdf721-bdd1-0bc1-70c0-29bc8b844d68@amd.com>
 <b23a5387-7bb1-ef1a-82f5-a012cc530203@amd.com>
 <1f876e45-964e-3796-b7b7-24a7ac40fa90@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <a40beb3f-5ace-1932-8918-18c10339afdc@amd.com>
Date: Thu, 6 Jan 2022 14:13:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <1f876e45-964e-3796-b7b7-24a7ac40fa90@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::12) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98e83d4e-5d32-4662-5fd1-08d9d148aaa2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4466:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB44667B1632E9613E27A82A07EA4C9@DM6PR12MB4466.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jd6evu89D4v5hw3zzkprCWLVgEz+jU2idUsIjn2mpJ6dZPr8Ks+qxbz+QA1FyM32HOk/Y/zuVuxsJth+qj5JVQLavVmCZnj0ek4v5MzdoHP+wmJLAsmH21FX8HiNg2BdN6Mi15AnrsXaIA+lNQDLiQVOcZD300E7eWltTmOdbgFj5EzOVtlit7XcSqQ5qiLNFM+vZA3vMAYodf47SHVyBqImYiWsekzdcJhORyvAGzSfnJS38gfykY9VSDyT5lfFhVG0hTlqn5AcZKLRBxDiwdkleSJuHL3mgHEo9/q5MsDF5DvrBMA9Qo9PBJL/FJLEufzkoROXbt2B60Yzx6zmqcYiaTDXGYr9iM3tGpiUiy6ZNCnWEerQGE6Aboi9C/B/+e3KBs3ovlpxjOrJfbdfAlePlJV4o8VlQJOxnaNqCTBemFX8KyrOR0GJ+qMgMtP5nBw+G5QSSE4X5ee4oIBlvpahe3IXpSBkN7Io+WKwhjlvnDxi7N1XjPnFF2QpHrTzbUo5QuJs5VvhWemJI7ySNx0EyIgZNb7gZm9fcQvfDivQ0LiRI4JMrDV3F8Oh8UEZuN+iLvdviSReO/YOrL3d2pJUp87Z2OefhxJ8yEeRtqZg7gvYqmh2y0vFTZnKXX6Fp/nqtHtk5Qt7JjmbmC7r2J7tqvFuNTqSxiwYllvgV5xdTioFMN7wUwlam8MAoWcNpzFgLkERamyU56AQzGacbA0rIIO4XJ/3LxP/rQQEq3NA0IAS7PVsy9CBCBt5tjFM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(6512007)(5660300002)(66476007)(6636002)(86362001)(31696002)(508600001)(4001150100001)(316002)(36756003)(4326008)(8936002)(2906002)(110136005)(8676002)(66556008)(66946007)(44832011)(2616005)(66574015)(53546011)(6506007)(186003)(31686004)(30864003)(83380400001)(6486002)(921005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZjWTljcmVZVERQSXhMWUo3ZGVNWDZrSUZvMkZCS0dHcjczN3poRml5cWZU?=
 =?utf-8?B?Ykx4WTY5RFpacjFnYmFvay9iU0k5dUtvL2ZFdDErMWRWcGZ5YVM3MGNiemNs?=
 =?utf-8?B?UDd5N05OVERyOW1NMTZVOXVXam1RcjNmZkJjakczZ0VxNTlkOXJySVdMdVUw?=
 =?utf-8?B?N3FZbzJZTWt4aDdRMFF5MFFaaDlPZFhFZWh2aFBKanJ2b0hhZEErSlRBQWxX?=
 =?utf-8?B?Ni9kS3NueW8xU1hFaVZKVFZ2NDRDcHRyYW5PaGErTHZNanlHWEtxNzhsVy81?=
 =?utf-8?B?WW1qSEJkclI3WTFDYUFHN1BlN3RlUjE1OHNhWlBSa0hzUmpXNzhlaXdxeElQ?=
 =?utf-8?B?K2orZjlsYVZkT2o4dnUwdzRuZS82MVRJUm4wa3JRQm9JSzV4RnBKbG9KTE9T?=
 =?utf-8?B?eGZGR25Hd1Z0eGlTajRTVzY3Ty8rWTdoTWhMM2RDRWZObktld1JkQW55Vjl2?=
 =?utf-8?B?VzIxWVBoeHVDUnNMSnN4bjVjK0piNlFJd1lNd1d3djZFeHZmUTMvZ1Y3YVJN?=
 =?utf-8?B?N09IallNWk5TbVBTUEYrWHVsVGhJZ1RDTzI5NURQVWlOaGFQMmFrMkw4a0FQ?=
 =?utf-8?B?Z0xJM3FBajA0N0U4RjFtWU9FUWpQY1I2RlZmTk9aUVJUU29mRnRCSWNHaDR6?=
 =?utf-8?B?cWhoa2FsVUlFQURDbngwclliOTIrMlluYmVCY01VSEF2Z2JIb29WRnlxN2JM?=
 =?utf-8?B?L1ZSZHFyaXh1R0JQUENvS0NJSHFzZW5hbThjZHA3UUJ6MDY2Rjg0MkxMNitL?=
 =?utf-8?B?NUtxc0N3ZklJcjZ6UEdCckhWY2hMOGRmQTBLZE1mWGR6eS85S2ttR2cvS1Zr?=
 =?utf-8?B?bXM0UTlvb3B2YXBZajRKM0lVNUNkSERPeVRrSDgyVWxZK3pxbFdicFhsTFJ3?=
 =?utf-8?B?VHEvU1dYUDhCTG1SVDZUakk2WmJ2OEhwT2R3L2IrcFlvc2ZvdjJjWnRZN0cv?=
 =?utf-8?B?eFRXTnh0dm5jdHdCcVZYU21BcVJFTFpyendpOXBtTENPNFZobXZCRUhhN2hl?=
 =?utf-8?B?QjJzNTd3dGFLK0VzMXpSQnNYSDFYendSRHhmTysvMXNra0o5TXl0ZHpKN1ov?=
 =?utf-8?B?MjFLaG44OXA3ZFh2ZTZnTy9RalhUNW1CK1hERU0yNFRPcHBZbzFxTSt4VmpZ?=
 =?utf-8?B?YnJMampwbGpkYTgrd0djaitrbDkxNWx5NnR3U21yMjgxYVpMbmpKWU1oTk54?=
 =?utf-8?B?dW9Kczg3dXlucU5vQUFNcnhTZ21rWC9tWUpIYWVtR1pMbFRjUHJIdHNSLytF?=
 =?utf-8?B?SXJ6OVpMMnlpbW42STNoS09jQ25yTkhOQkNGdzEvYWI1VDZtdGNheUZsWlFT?=
 =?utf-8?B?V25VQlh3OXZjait5UTBkcHV4Tm5lUTVlbStpTU1sT0JHYW91N1ltbGdsV1k4?=
 =?utf-8?B?bGZZTnFIN2I2SjZxV2lOWEc2aWNIV0xnN1liRU9mVHRIZjRpN0diZzFxZm83?=
 =?utf-8?B?RUIvZVljTG5jbWFkQjFOelRUemlBaklmemdldHF5VHJuNnNlOVZxQWN6L1ZR?=
 =?utf-8?B?eGNSNjBtVWFyL1VQaE01TDR5cDZhYWIybnNRRlFWYWVpaTMwQlo4dkxBd1Zs?=
 =?utf-8?B?RnRBTVB4aUhQQnlFRkU4WFdaUEFFTDF4dmlRUnZyKzFIZXlWS0d0enFNNHV1?=
 =?utf-8?B?V1ZZa0VGL2xLTGs3QlJEc1VqUzE0NnlZVVdtekhORnJPNDl2Rm53RG55OHlG?=
 =?utf-8?B?YmJoRnU1cE4vdnpwNlRHRy81MDVKMEFYZ1ZBTzRFZHVwbVJQSWJoeVk1czF3?=
 =?utf-8?B?SzVTSU1rTHRLZGsxekdFQXJKcW5QK0NKVFFsU2ZsNVNWZGtMMTRMUGxlRTdr?=
 =?utf-8?B?M1lXQm45d2FpYitpa1hUTnJFbDd6WGJ6Qi9oWi9tZ2dENFJnMlRIWW0wN29O?=
 =?utf-8?B?bVBoYjdOYUM3QnNuYXhYWkhRcnZscms1OTd0NXZUWnJQYnViRTFJOWdpRjJI?=
 =?utf-8?B?OG85K2d2Q0M4cVB1YkVSR0YzNGwxQXBmTlRYbDRad01lcmtuN1FHcVRKTjhM?=
 =?utf-8?B?WHlheUFwUGlWcngxblR3d2hzRFlFanlibXRXa0tqZHlhRWtkRUxHSjh4VHkv?=
 =?utf-8?B?MFhUOHlIdlhKaXNZZmtHWGgxdlBIVnZGWlpucTM3RzgxSDhPUytSUjM5ZmZp?=
 =?utf-8?B?TUdBcDFDaFI0a1dLaHVFOVcwODYxR1JxbHdjeWQrSEJkNTdMVXVwUnVvYlg3?=
 =?utf-8?B?MEl0MWh1My90dWlhOUg4WFpzVzZqaXBPQTFQMUt1bFh6S2Y3OGxHK0FzQU9i?=
 =?utf-8?Q?iow8l+qrhdBai3dxbeYKBENhGdvMnK7zlg3CvxLZk0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e83d4e-5d32-4662-5fd1-08d9d148aaa2
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 19:13:48.2129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eQSgl6DdNGB755aQS8wub0vki79uUOL6HAuox748BLdgkJ6y6jEAtWgfveMMnxuz2QM4Z7NvniKIUS/2cL+dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4466
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


On 2022-01-06 12:18 a.m., JingWen Chen wrote:
> On 2022/1/6 下午12:59, JingWen Chen wrote:
>> On 2022/1/6 上午2:24, Andrey Grodzovsky wrote:
>>> On 2022-01-05 2:59 a.m., Christian König wrote:
>>>> Am 05.01.22 um 08:34 schrieb JingWen Chen:
>>>>> On 2022/1/5 上午12:56, Andrey Grodzovsky wrote:
>>>>>> On 2022-01-04 6:36 a.m., Christian König wrote:
>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>> [AMD Official Use Only]
>>>>>>>>
>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>
>>>>>>> Then we have a major design issue in the SRIOV protocol and really need to question this.
>>>>>>>
>>>>>>> How do you want to prevent a race between the hypervisor resetting the hardware and the client trying the same because of a timeout?
>>>>>>>
>>>>>>> As far as I can see the procedure should be:
>>>>>>> 1. We detect that a reset is necessary, either because of a fault a timeout or signal from hypervisor.
>>>>>>> 2. For each of those potential reset sources a work item is send to the single workqueue.
>>>>>>> 3. One of those work items execute first and prepares the reset.
>>>>>>> 4. We either do the reset our self or notify the hypervisor that we are ready for the reset.
>>>>>>> 5. Cleanup after the reset, eventually resubmit jobs etc..
>>>>>>> 6. Cancel work items which might have been scheduled from other reset sources.
>>>>>>>
>>>>>>> It does make sense that the hypervisor resets the hardware without waiting for the clients for too long, but if we don't follow this general steps we will always have a race between the different components.
>>>>>> Monk, just to add to this - if indeed as you say that 'FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long'
>>>>>> and there is no strict waiting from the hypervisor for IDH_READY_TO_RESET to be recived from guest before starting the reset then setting in_gpu_reset and locking reset_sem from guest side is not really full proof
>>>>>> protection from MMIO accesses by the guest - it only truly helps if hypervisor waits for that message before initiation of HW reset.
>>>>>>
>>>>> Hi Andrey, this cannot be done. If somehow guest kernel hangs and never has the chance to send the response back, then other VFs will have to wait it reset. All the vfs will hang in this case. Or sometimes the mailbox has some delay and other VFs will also wait. The user of other VFs will be affected in this case.
>>>> Yeah, agree completely with JingWen. The hypervisor is the one in charge here, not the guest.
>>>>
>>>> What the hypervisor should do (and it already seems to be designed that way) is to send the guest a message that a reset is about to happen and give it some time to response appropriately.
>>>>
>>>> The guest on the other hand then tells the hypervisor that all processing has stopped and it is ready to restart. If that doesn't happen in time the hypervisor should eliminate the guest probably trigger even more severe consequences, e.g. restart the whole VM etc...
>>>>
>>>> Christian.
>>> So what's the end conclusion here regarding dropping this particular patch ? Seems to me we still need to drop it to prevent driver's MMIO access
>>> to the GPU during reset from various places in the code.
>>>
>>> Andrey
>>>
>> Hi Andrey & Christian,
>>
>> I have ported your patch(drop the reset_sem and in_gpu_reset in flr work) and run some tests. If a engine hang during an OCL benchmark(using kfd), we can see the logs below:


Did you port the entire patchset or just 'drm/amd/virt: Drop concurrent 
GPU reset protection for SRIOV' ?


>>
>> [  397.190727] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.301496] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.406601] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.532343] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.642251] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.746634] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.850761] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  397.960544] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  398.065218] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  398.182173] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  398.288264] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  398.394712] amdgpu 0000:00:07.0: amdgpu: wait for kiq fence error: 0.
>> [  428.400582] [drm] clean up the vf2pf work item
>> [  428.500528] amdgpu 0000:00:07.0: amdgpu: [gfxhub] page fault (src_id:0 ring:153 vmid:8 pasid:32771, for process xgemmStandalone pid 3557 thread xgemmStandalone pid 3557)
>> [  428.527576] amdgpu 0000:00:07.0: amdgpu:   in page starting at address 0x00007fc991c04000 from client 0x1b (UTCL2)
>> [  437.531392] amdgpu: qcm fence wait loop timeout expired
>> [  437.535738] amdgpu: The cp might be in an unrecoverable state due to an unsuccessful queues preemption
>> [  437.537191] amdgpu 0000:00:07.0: amdgpu: GPU reset begin!
>> [  438.087443] [drm] RE-INIT-early: nv_common succeeded
>>
>> As kfd relies on these to check if GPU is in reset, dropping it will hit some page fault and fence error very easily.
> To be clear, we can also hit the page fault with the reset_sem and in_gpu_reset, just not as easily as dropping them.

Are you saying that the entire patch-set with and without patch 
'drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
is casing this GPUVM page fault during testing engine hang while running 
benchmark ?

Do you never observe this page fault when running this test with 
original tree without the new patch-set ?

Andrey


>>>>>> Andrey
>>>>>>
>>>>>>
>>>>>>> Regards,
>>>>>>> Christian.
>>>>>>>
>>>>>>> Am 04.01.22 um 11:49 schrieb Liu, Monk:
>>>>>>>> [AMD Official Use Only]
>>>>>>>>
>>>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>> No it's not, FLR from hypervisor is just to notify guest the hw VF FLR is about to start or was already executed, but host will do FLR anyway without waiting for guest too long
>>>>>>>>
>>>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>> It makes the code to crash ... how could it be a fix ?
>>>>>>>>
>>>>>>>> I'm afraid the patch is NAK from me,  but it is welcome if the cleanup do not ruin the logic, Andry or jingwen can try it if needed.
>>>>>>>>
>>>>>>>> Thanks
>>>>>>>> -------------------------------------------------------------------
>>>>>>>> Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>> -------------------------------------------------------------------
>>>>>>>> we are hiring software manager for CVS core team
>>>>>>>> -------------------------------------------------------------------
>>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>> Sent: Tuesday, January 4, 2022 6:19 PM
>>>>>>>> To: Chen, JingWen <JingWen.Chen2@amd.com>; Christian König <ckoenig.leichtzumerken@gmail.com>; Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; Deng, Emily <Emily.Deng@amd.com>; Liu, Monk <Monk.Liu@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen <JingWen.Chen2@amd.com>
>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset protection for SRIOV
>>>>>>>>
>>>>>>>> Hi Jingwen,
>>>>>>>>
>>>>>>>> well what I mean is that we need to adjust the implementation in amdgpu to actually match the requirements.
>>>>>>>>
>>>>>>>> Could be that the reset sequence is questionable in general, but I doubt so at least for now.
>>>>>>>>
>>>>>>>> See the FLR request from the hypervisor is just another source of signaling the need for a reset, similar to each job timeout on each queue. Otherwise you have a race condition between the hypervisor and the scheduler.
>>>>>>>>
>>>>>>>> Properly setting in_gpu_reset is indeed mandatory, but should happen at a central place and not in the SRIOV specific code.
>>>>>>>>
>>>>>>>> In other words I strongly think that the current SRIOV reset implementation is severely broken and what Andrey is doing is actually fixing it.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>> Christian.
>>>>>>>>
>>>>>>>> Am 04.01.22 um 10:07 schrieb JingWen Chen:
>>>>>>>>> Hi Christian,
>>>>>>>>> I'm not sure what do you mean by "we need to change SRIOV not the driver".
>>>>>>>>>
>>>>>>>>> Do you mean we should change the reset sequence in SRIOV? This will be a huge change for our SRIOV solution.
>>>>>>>>>
>>>>>>>>>     From my point of view, we can directly use amdgpu_device_lock_adev
>>>>>>>>> and amdgpu_device_unlock_adev in flr_work instead of try_lock since no one will conflict with this thread with reset_domain introduced.
>>>>>>>>> But we do need the reset_sem and adev->in_gpu_reset to keep device untouched via user space.
>>>>>>>>>
>>>>>>>>> Best Regards,
>>>>>>>>> Jingwen Chen
>>>>>>>>>
>>>>>>>>> On 2022/1/3 下午6:17, Christian König wrote:
>>>>>>>>>> Please don't. This patch is vital to the cleanup of the reset procedure.
>>>>>>>>>>
>>>>>>>>>> If SRIOV doesn't work with that we need to change SRIOV and not the driver.
>>>>>>>>>>
>>>>>>>>>> Christian.
>>>>>>>>>>
>>>>>>>>>> Am 30.12.21 um 19:45 schrieb Andrey Grodzovsky:
>>>>>>>>>>> Sure, I guess i can drop this patch then.
>>>>>>>>>>>
>>>>>>>>>>> Andrey
>>>>>>>>>>>
>>>>>>>>>>> On 2021-12-24 4:57 a.m., JingWen Chen wrote:
>>>>>>>>>>>> I do agree with shaoyun, if the host find the gpu engine hangs first, and do the flr, guest side thread may not know this and still try to access HW(e.g. kfd is using a lot of amdgpu_in_reset and reset_sem to identify the reset status). And this may lead to very bad result.
>>>>>>>>>>>>
>>>>>>>>>>>> On 2021/12/24 下午4:58, Deng, Emily wrote:
>>>>>>>>>>>>> These patches look good to me. JingWen will pull these patches and do some basic TDR test on sriov environment, and give feedback.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Best wishes
>>>>>>>>>>>>> Emily Deng
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>> From: Liu, Monk <Monk.Liu@amd.com>
>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 6:14 PM
>>>>>>>>>>>>>> To: Koenig, Christian <Christian.Koenig@amd.com>; Grodzovsky,
>>>>>>>>>>>>>> Andrey <Andrey.Grodzovsky@amd.com>;
>>>>>>>>>>>>>> dri-devel@lists.freedesktop.org; amd- gfx@lists.freedesktop.org;
>>>>>>>>>>>>>> Chen, Horace <Horace.Chen@amd.com>; Chen, JingWen
>>>>>>>>>>>>>> <JingWen.Chen2@amd.com>; Deng, Emily <Emily.Deng@amd.com>
>>>>>>>>>>>>>> Cc: daniel@ffwll.ch
>>>>>>>>>>>>>> Subject: RE: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> [AMD Official Use Only]
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> @Chen, Horace @Chen, JingWen @Deng, Emily
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Please take a review on Andrey's patch
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Thanks
>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>> -- Monk Liu | Cloud GPU & Virtualization Solution | AMD
>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>> -- we are hiring software manager for CVS core team
>>>>>>>>>>>>>> -----------------------------------------------------------------
>>>>>>>>>>>>>> -- 
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> -----Original Message-----
>>>>>>>>>>>>>> From: Koenig, Christian <Christian.Koenig@amd.com>
>>>>>>>>>>>>>> Sent: Thursday, December 23, 2021 4:42 PM
>>>>>>>>>>>>>> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-
>>>>>>>>>>>>>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>>>>>>>>>>>>> Cc: daniel@ffwll.ch; Liu, Monk <Monk.Liu@amd.com>; Chen, Horace
>>>>>>>>>>>>>> <Horace.Chen@amd.com>
>>>>>>>>>>>>>> Subject: Re: [RFC v2 8/8] drm/amd/virt: Drop concurrent GPU reset
>>>>>>>>>>>>>> protection for SRIOV
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Am 22.12.21 um 23:14 schrieb Andrey Grodzovsky:
>>>>>>>>>>>>>>> Since now flr work is serialized against  GPU resets there is no
>>>>>>>>>>>>>>> need for this.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>>>>>>>>> Acked-by: Christian König <christian.koenig@amd.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> ---
>>>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c | 11 -----------
>>>>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c | 11 -----------
>>>>>>>>>>>>>>>        2 files changed, 22 deletions(-)
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>> index 487cd654b69e..7d59a66e3988 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>>>>>>>>>>>>>> @@ -248,15 +248,7 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>            struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>            int timeout = AI_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>            xgpu_ai_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> @@ -269,9 +261,6 @@ static void xgpu_ai_mailbox_flr_work(struct
>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>            } while (timeout > 1);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>        flr_done:
>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>            /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>            if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>                && (!amdgpu_device_has_job_running(adev) || diff
>>>>>>>>>>>>>>> --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>> index e3869067a31d..f82c066c8e8d 100644
>>>>>>>>>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>>>>>>>>>>>>>> @@ -277,15 +277,7 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>            struct amdgpu_device *adev = container_of(virt, struct
>>>>>>>>>>>>>> amdgpu_device, virt);
>>>>>>>>>>>>>>>            int timeout = NV_MAILBOX_POLL_FLR_TIMEDOUT;
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -    /* block amdgpu_gpu_recover till msg FLR COMPLETE received,
>>>>>>>>>>>>>>> -     * otherwise the mailbox msg will be ruined/reseted by
>>>>>>>>>>>>>>> -     * the VF FLR.
>>>>>>>>>>>>>>> -     */
>>>>>>>>>>>>>>> -    if (!down_write_trylock(&adev->reset_sem))
>>>>>>>>>>>>>>> -        return;
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>> amdgpu_virt_fini_data_exchange(adev);
>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 1);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>            xgpu_nv_mailbox_trans_msg(adev, IDH_READY_TO_RESET, 0,
>>>>>>>>>>>>>>> 0, 0);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> @@ -298,9 +290,6 @@ static void xgpu_nv_mailbox_flr_work(struct
>>>>>>>>>>>>>> work_struct *work)
>>>>>>>>>>>>>>>            } while (timeout > 1);
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>        flr_done:
>>>>>>>>>>>>>>> -    atomic_set(&adev->in_gpu_reset, 0);
>>>>>>>>>>>>>>> -    up_write(&adev->reset_sem);
>>>>>>>>>>>>>>> -
>>>>>>>>>>>>>>>            /* Trigger recovery for world switch failure if no TDR
>>>>>>>>>>>>>>> */
>>>>>>>>>>>>>>>            if (amdgpu_device_should_recover_gpu(adev)
>>>>>>>>>>>>>>>                && (!amdgpu_device_has_job_running(adev) ||
