Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCF74371C6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 08:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313A96E546;
	Fri, 22 Oct 2021 06:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2070.outbound.protection.outlook.com [40.107.243.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6666E5A1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 06:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=To5eSQJwx3tDexH4IGJAGGmQoWZ0Zhr0Z/qGUAzg8sxpFVWExtY9ARPZzVAsmEb7YFWG+dgv3QEs3zZyfalfKNXtI62FNfCOivGeH7Vyl0agOweoeaHj7VieL2w3J+Ra0xRkRzrYKWx+53pXA2iNHKlAcoHYOTQG27/48Pspb6peBSJwZjBqG6kAu7dhJQxpqvbqb+6XLcYBXYFV9UGT/M7J9YrArIoDSe/p/ASGyr24eWh4cwBeWshHGn3VNWZLU2giA9hM2uE7qyIStz3+o88FfZuhkDOp1lHDuJwAE5rWD5xkyngbUSpHhmOIf8Mit9iMX7z4V1dFUo5FI9guyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Se1Qbu+Y9mhJc7XsX5Lcq06IkY3UNG3vMXR5kUf3UXA=;
 b=JdnBpsisu57qm3LX/ZwHTYN5suuRnS6cXJJaPWMBmN6Pqwx+Bt7oaZ9AUiHDKUSKzxbnIIYJKYsxQ35UzhhxNv9WPZ2aGH2aGf5KogmGiQZRp5uN6G0NFWB6tVQfkRKJEBLmLVfIZS07E52QVwdfPonjivl1Mx4MzcjY6at87La8ADgvtUdaiDSGiHk4uSGFnsJuQ4BE/vjBtMlyTmkQKmaize1/2ARXR6tgnZBlBH8aLWUtZZs1mwB4ts6SAA4DyUDShFP22bBPX9roz/EtYxxPM9NIDZVTIixXWQ5zb8V8oSDRO9nYjV5Rx3OOUqOrfvp65fmWcyGOw7hgmKuNbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Se1Qbu+Y9mhJc7XsX5Lcq06IkY3UNG3vMXR5kUf3UXA=;
 b=qSPFE+wHb75l7NZmdCWL3YIOi2swaDQUYgrt0jHns9jy4/mYIoqDXk9L96ByNaTLo5pOYnIRQfRAh9GNVjDcUI77ymg3CFUi9Qir9X9ykdIJjlE3Ba+3hR7X0wKWBE6le5tvBDBKRfzf4Ywr20+s0j1z86REz0MaT7TfPQ5lADA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1487.namprd12.prod.outlook.com
 (2603:10b6:301:3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 06:32:53 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.018; Fri, 22 Oct
 2021 06:32:53 +0000
Subject: Re: [PATCH v2] dma-buf: heaps: init heaps in subsys_initcall
To: John Stultz <john.stultz@linaro.org>,
 Shuosheng Huang <huangshuosheng@allwinnertech.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Liam Mark <lmark@codeaurora.org>, 
 Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <20211022014850.22933-1-huangshuosheng@allwinnertech.com>
 <CALAqxLXNMvaT3OU3Y-aYkH+KJA_g1QSOZNJHqvzt21WPy=6UJw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <776ec196-08dd-4308-4484-b6ef91d3d4e9@amd.com>
Date: Fri, 22 Oct 2021 08:32:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CALAqxLXNMvaT3OU3Y-aYkH+KJA_g1QSOZNJHqvzt21WPy=6UJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR06CA0256.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::7) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:9826:b15:8db5:7240]
 (2a02:908:1252:fb60:9826:b15:8db5:7240) by
 AS9PR06CA0256.eurprd06.prod.outlook.com (2603:10a6:20b:45f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Fri, 22 Oct 2021 06:32:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a8d3968-44bf-4f5c-3eb9-08d99525c676
X-MS-TrafficTypeDiagnostic: MWHPR12MB1487:
X-Microsoft-Antispam-PRVS: <MWHPR12MB14870949DA9C8327F0C2826383809@MWHPR12MB1487.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpWgp4DTC4YfDL/5c3UCXbaf/i6Uu3ahrQ+PZ2133DrmSQHxziyfxEEAYOasggC+vRPm4Ax/9nPp/cf5gQboPpkMzKPeR3lTR54G+W9F/Eu9AdoV9UbcypljqGfH9dI99GUVDuHrDiQ1A0gXzbBdF9+rZUCWO5Y7pDKPvk6Uh3dG5GLXs4uQ2r487W780cyNUHW+xVbuOumrafMM5Mw0jgzsgMgkTxVFeNlcRVcwrBvOecQbdtLob6lSTquXWCWIpVqDIA60PV8qxfPx7Q+nr8zrM1VyAmKySY103tJkbq6KyypcvPWJ5m03mGlZtULY3PH2WlusxiJezejZkuM2YG+J3FeUG9mDnEk99okr9qIywNxs5QjvSPNVlPiWDhiNMKwsZosJ9rk8Fw84g8GROJkNMSV3v/xurwI2OltKwMThMuIYIxUcHmLwhtSmQAFCyzLg3F319sInAK+6EH8Jr54HRhFPzNXgAlHj56tug9fRMaXuEC21NFf6YJZLwJJ9CCgNtgldBzLaQ2X/ywrLP+pvDLymNj95v9ysFzyaFDUAsEw+Zhocn9GSCXmEKl8PKf+2IHEQbBS5avOGEhShABaw0i1Ll4ZQZrEjz39q/wH3cXPAEo57elLIsuorsLkqEISYSEHeABHpqA2DE3TMRNEznB131skkCOrdmdtD0Ae2IOm+OTiE74dZ3fSXxCkzua7QsjQXhxAxn1Gf3jzoORWNEpDLvz0np/CxpPxLUhY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(66946007)(8676002)(316002)(6486002)(2906002)(4326008)(2616005)(6666004)(8936002)(186003)(5660300002)(54906003)(53546011)(110136005)(508600001)(31686004)(31696002)(38100700002)(36756003)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3lPK3NSdXZjUXJZbTB4a05xY1VYaDhITVd3eFNHSUN1aU1HSTQvMFhyYjQ3?=
 =?utf-8?B?KzVTckhYaU9xOFFjQitPeThhSnA1K0ZzU2ZjSmRwekRtVjdWekVWcUFGeFFy?=
 =?utf-8?B?Z1N2b2tqZ01ZZjlOeXFXUXVQMGJ4VStyZmFBODBkSTNxVzBZYVpMNVR6SnR2?=
 =?utf-8?B?UlVkbnZURXNHOFJzYmV6WDF2ellzNjU0ZGt0NTM4OE93aEE5SDF3czNBN1dI?=
 =?utf-8?B?UHpaQ3Q3V2twaU9qMlJGdU13VEFyMFZiUEgyVWNRUkVaS240cndsblo5cmVS?=
 =?utf-8?B?K3NwTFNTMU5FQjVuYVVUR3hwRGtBazhFdy9aZnFUR2diWU1rWUtrdmwwZ2d1?=
 =?utf-8?B?S3hXUllkRVAxWGk4N0h4UXhuakMwckFwNExrWHkzWVZZTXBWK0doczg0VXNC?=
 =?utf-8?B?TVArc3JQLzdHWTlmbUlic3NVOHQyNGM4WUZiT2tVemJ2UTFzRHdMOEtkc3B5?=
 =?utf-8?B?ZXEzNGFjZmRXcVVqb3BQelpSUGpTSFRKaTFwMzFiUEx1WkRvQmNNL2hNQjMr?=
 =?utf-8?B?bk53ZWhRanIwaGQyOFRpc2RsUEtObSs1Z2g5Q0lmLzErdERBZ0VaMmpSYTV0?=
 =?utf-8?B?TWFocWFGcmxSZ0xhZG9pQzRRaWpnTnVqRjhIRTg2K1RkZmN5M2pIRHhIVkYz?=
 =?utf-8?B?YXBoRUNLVk9WVFNrVFZ2blcxTWh2Yk9JSnRGT21aVzFTWnNvTU9Wck5Md2Jy?=
 =?utf-8?B?TUw0YldMZmVRbnpTVmYzZG1ySENjSGlxNDQwdEpZOXlxNEdyK0x4TURMQ0VV?=
 =?utf-8?B?MjRYYVNrRE9GWFRsaWhSbVRBMUNwYzVsTGdOczRyTWJOT3FVVDc2ZitOR0pW?=
 =?utf-8?B?Q05GdCtGMDF2bTVHU2F4QVFwZlcwSjVVZDFlRkpqeFZJdEdXS040MVIrTHVh?=
 =?utf-8?B?cTEyZlUxN0Q1aGFFbjRtekN6SjVaWDdBRXpZQ1lNMlE4aVpORkVOaldVUmRH?=
 =?utf-8?B?M3ZXWTVUYWloR21GWFVTcTMxR09SZWFLTFN4bUNvVDROeHJ5eVA1RDRTY2hV?=
 =?utf-8?B?YjBabXZzY3M0K2N0SVh6RGRNNUJWcUtIVnU3T0xLMUtucjBGTVRBTDVTNnlD?=
 =?utf-8?B?ZzMwNDV2ZFdFL1BuZng5RkFjSFRHYnAyYjU0SVN0S1o1UkwwWVlTL29WVzc3?=
 =?utf-8?B?akhLL0xlazBNRmZ6M001ZnAvU0IreFk3azkyTFRYUk15OHZRcnRxMGZyVHRz?=
 =?utf-8?B?MC9vdXB4MVA0T1pzUGpISU9jNk9yZTdsdTlsUTdZU3dENTE4U29QRnNORVRy?=
 =?utf-8?B?TCsrY1k2SndCVzI5SW1ITThXeWl2c1FMbHd2VElONmRQMEdwQVdTemRXSTJP?=
 =?utf-8?B?VnE2T1RJTWZmWnVIUWs1aFgzU2szbTlWMk5KdEZseThtcXJpdXZIb0JCTmxr?=
 =?utf-8?B?WjFxYUd3WlFteFN0d3dUQVR5RGFwZXptU01xTXVWWEtCbm85ZHJUa2JrUUlm?=
 =?utf-8?B?Ymc4S2ZIM3FwM2xYU0E4OUxwR1VEZENBak9DRVdma3JKWTk4QTg4TUJPOGJ3?=
 =?utf-8?B?MmZ1MDZydzZwYVFLeFNMY2tYTnZkMVE0ZUVYYWFic3JNM1Iyd2NzM2hobllW?=
 =?utf-8?B?M09mQkMybEtRQy9uRlY2MFp6cjRHalN4THdWdEF2bG9sdEF6NUJYS1d2YUN6?=
 =?utf-8?B?Nml4SHVVNjFVd3RjKzRFT1cyeU1KR0J4d2R2M1dqVUhRU2NHbkg3am8xZVZo?=
 =?utf-8?B?VXpDQ2grR0FxWXltUktjNDhjSjVnenhMMk42enZOWFhZR0VKY2dqRHJvcmt1?=
 =?utf-8?B?Wk9QVXNPOVRJVnZKcXR4K0x3TXF1V0I0d0V3N1doZUVwaVJLZ0pwL1NNSFRD?=
 =?utf-8?B?bVpqS3Z3bDFGTFR5WkI1Z1J6QlZpZjYwd04wTGFuZCtvdTI3M0dKd3F1dU1s?=
 =?utf-8?B?VEZFNStuNWN2c2twZ0RjNTBtY3NzaUR0aE8xMHR5WVE0eGZ2c1RkWXBwYzdQ?=
 =?utf-8?B?Y25Kc1VIa0ZZcUhqTW1VM2ZrMitZR1gwRWRtdldPSWd6Rm5NVlE3QUFja3U0?=
 =?utf-8?Q?EFdNb+HsKza4eD/aGSzn521+ZWeZGc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8d3968-44bf-4f5c-3eb9-08d99525c676
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 06:32:52.9710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1487
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



Am 22.10.21 um 04:56 schrieb John Stultz:
> On Thu, Oct 21, 2021 at 6:49 PM Shuosheng Huang
> <huangshuosheng@allwinnertech.com> wrote:
>> Some built-in modules will failed to use dma-buf heap to allocate
>> memory if the heap drivers are too late to be initialized.
>> To fix this issue, move initialization of dma-buf heap drivers in
>> subsys_initcall() which is more earlier to be called.
> Hey! Thanks so much for sending this out! I appreciate it!
>
> So the change looks pretty straightforward to me, however, the
> rationale for it is where we hit problems.
>
> With the upstream kernel, there are not yet any modules that directly
> allocate from dmabuf heaps. So in the context of the upstream kernel,
> the reasoning doesn't make much sense.

I was already wondering which driver does that.

> Now, I know folks have their own drivers that want to allocate from
> dmabuf heaps, but those haven't been submitted upstream yet.
> So maybe can you submit those patches that need this along with this
> change so it would make sense as part of a patch series? It would be
> trivial to justify including this patch then.

Yes, agree. This patch here alone has no justification to be upstream.

Regards,
Christian.

>
> thanks
> -john

