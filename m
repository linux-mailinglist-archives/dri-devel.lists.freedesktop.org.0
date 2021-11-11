Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0B444D99E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 16:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E676E523;
	Thu, 11 Nov 2021 15:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826EF6E523;
 Thu, 11 Nov 2021 15:54:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB+yx2mZPXeQ8bT9eN29knO+RabbuQojH/0qHWVAGJ7xyqlnzdiDoGD+iDJpPvRKlmbOVslZ2INp0QvzCnSzJQngV/uk4HG8/Sia6ioVfPz7ZJvmMwUOT9tMbvzKaWneUTfnNRF6SB8XhRaX5kIOIbegbwj/axN1z+XJINzZkQe8nOMK6eD3MiyNbD6/dYFpEaTwTPQG3GNBhphDzCid78dS1A0pc0UQkERA/ePbod/o+cFmrYTRuoQ+QC4oDF0CUDuHaZzBKF71eZ9vpV8lDBB0++iRINxkKMaxl/bduPuRztTghePx5ZoAohXHW/8CVIVUo6QSUicyRQRzh3JRkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZBANV0z44y6CNyphVxNOf4iWJhXCZFa0Rc/feNLuVnY=;
 b=b+3IKdAB6LyzYgUqJoTGkuIAJiuitigVfXW9JVRQHZZUApNQodPjO/WfKClFmFoUrJyHBTE6LwDbStIR6xaHyl52XIj+S9bYhqA4Jnw/cbrAi6ZelrkUVj+obu4arTa4f8+ygmj5fR2aI/Hri8lZH6/7zpgbQ4coYOHAxx9/3vFPoF/VmjiqFUrMJjNOkKf8yGOV7pGuQKvUqXM8Bp+gL0Fft4mqMYLGlmV1Z2wdjIk+/7NpQJ2OXQ2gOrdjQlGdVI2dadaIMnhpoEKbmuttQLO5UEdpOpEREnpWqjFUeNXmRJ7tUIpJi+5lULkxZdsVej4Ca8hPENlakyyYckAHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBANV0z44y6CNyphVxNOf4iWJhXCZFa0Rc/feNLuVnY=;
 b=OGb5LVFLjTD2Mv9QZKoCJUWv74v6BlH5JfDNdvaTCcbSuhjoQmYGln7zSjtthCmFBjsYUv5vNlMcS8iADvLbDNnK8DsRJ9j22OFOjJFFyDw9LQdDXQMh9IZLNbI74NambeWVez8+53hBsfwdkWkvv1wSdnkrxSFCFUvcQ1IrUPY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM5PR12MB2342.namprd12.prod.outlook.com (2603:10b6:4:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.18; Thu, 11 Nov
 2021 15:54:16 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::710e:dfc2:4247:8568%12]) with mapi id 15.20.4669.019; Thu, 11 Nov
 2021 15:54:16 +0000
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <YS4nlkpjeitiwFy1@phenom.ffwll.local> <YS4oMrFTj0+wmMbY@phenom.ffwll.local>
 <BL1PR12MB5269292A3E9E6014043C280E84CD9@BL1PR12MB5269.namprd12.prod.outlook.com>
 <CAF6AEGsELL5WmxJKqyfF69OnVaK6+SnAREvjtFSHBZrm3Gdp7g@mail.gmail.com>
 <YYo6U6D2dxQ7Y6Gn@phenom.ffwll.local>
 <CAF6AEGvGQP-6eNevDyS9sXg+6qOKMrG7h5rwhKO=v8L5mQOiUA@mail.gmail.com>
 <YYuVyRlAATYO4ptP@phenom.ffwll.local>
 <ec8352f1-e473-683b-ecc6-9969c50c4bac@gmail.com>
 <YYvH+3jNqhzxhlG9@phenom.ffwll.local>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <05f786c5-e902-1bb2-77e5-f25fbc509814@amd.com>
Date: Thu, 11 Nov 2021 10:54:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YYvH+3jNqhzxhlG9@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::31) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
Received: from [IPv6:2607:fea8:3cde:5100:b4d9:3834:93f4:d8c4]
 (2607:fea8:3cde:5100:b4d9:3834:93f4:d8c4) by
 YT3PR01CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:82::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Thu, 11 Nov 2021 15:54:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c0fbc7-f080-4c2b-23e3-08d9a52b83a9
X-MS-TrafficTypeDiagnostic: DM5PR12MB2342:
X-Microsoft-Antispam-PRVS: <DM5PR12MB2342973AE739FBEFE4C3AEC4EA949@DM5PR12MB2342.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RzpRoKZllQp4tKYHiTopVXRuLfGG+VdCe/h864O14ACtWaQaJgLVeFaVNxGbwrzIAJr8jMxuQwQVJ1SccCe8Oc/BlgPbOr04OJ71lUGfWFQj+tY4aEjg6FEPtmo5Ucm7ctRdANMY+7uQJnef/dHlRrnmyaniZTmDZEWdIcuD6AtpIr1n/EPSAPGDzXmhW+rhGKfqyejfmGpHDmtTjvs/kDimCJJ7WzF545i0vYsxNakWhDlLwGvSJrmZnt8iazWF4d90b6z3OfgrF/he/98+7YMbBdJdCAHYwtT/E2ELGHi/dD+GGqUymLMUZ/2ocYgzYtyQAxqYuf+pYgHExQUkQFxam8/Vvczugp2JbtAzNG570/rvO3HSqqa//6k3EWMbxl6Pqw749WpHK/1dzmVsA0nWQisw9qTibrHOaoiqjGE8qf0ANmwYXtNMGqMt5nOY/ZsWHtlAlEl+w8a62QNI3PQHEIf12K8ds5xzFIgBA95wbaj/ARIDiLXpZBKXa+VTmEGWZWaB8cJ+9X1irbTNrsoJ2HksJoIYfhPvatc6TP+CQ+ajA1cG0QlgIyADxnQDHtbBGgFmd7a1tjNuPfhR7YyIYgzhz1xDcukDLTXNgfTT0ETu89i9nvjjHxmDSKbbMsevMPSvaAPCxvpLk3njfHp+OUOJ1ij5dbqxG897trZhFiEvUJwBHcjaEZ56wVt8IY61SsC5jYvs4nbTgCxF3woNYZDaJcwjr7RqSwC846MoYggWgIblzOoWlsZ1IWO/BZA+9I6aH7xz8KJSTTqJ5lmWIgEkpBHgIXHDwCAmeVRhbPQxoEeutprC+llt5orj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(30864003)(2616005)(66556008)(2906002)(5660300002)(66946007)(54906003)(53546011)(66476007)(110136005)(6486002)(36756003)(8936002)(316002)(8676002)(186003)(38100700002)(31696002)(508600001)(44832011)(83380400001)(4326008)(45080400002)(4001150100001)(66574015)(31686004)(966005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3lPOHNCbTY2Tk5aTmFzVDBHTENQWjFkMDZ3Q1hucmw5dkk2cnhiTko2bmtJ?=
 =?utf-8?B?akpiNjZQUlB3VWczc2g2VDRLS1A3OWlSNDQ0a1NUdWdOSXgyMGR0UHAyL1Jh?=
 =?utf-8?B?YTd1N1k0YUJWVEUveW9MQjdlOUcyMllFcjd5UEFmaWFsV1ZhUzhIMSswdXRy?=
 =?utf-8?B?S0FRc0xURXNiQlBxb2JiRWlpMVpKMTM2YXdIOEZQS1lBY3ZTaDZ3NldQS0dh?=
 =?utf-8?B?TE0vSUtNSmxOYjdoTXFGQ1NuZ0Q0Y1ZCbHlQZ1RpbHNNSGxGc0llcXpUS1Jx?=
 =?utf-8?B?YkkwRUFzQ1BOdmgrU2NsQXhXd2Z0Zkk5VWhHRUpCK1lRTzVvWnd1MWRhMllZ?=
 =?utf-8?B?cEZmOUQ1L0JLL0VBZnBucVhOSHJRUUpyaG11cmpBT0lBNm90WEpEcmtoNS81?=
 =?utf-8?B?MUhRdTZ3K05qdFRpVldsbmJMTE1uSGhyQUF4YldtRzQzYXNCQW5Xd3R2eHJI?=
 =?utf-8?B?VXhvL2pqNUw4T2VqQUpyL05YeDVRUjdzaFpRZytuME5pVEl2UHgxSzZTV1lk?=
 =?utf-8?B?eWIvNEo5M0E3YzROenJxWk1QOTFPeENyQVBLOFMvM0o0K2YrdjEzQzZvY2M2?=
 =?utf-8?B?bG5KOXFoT01xRnBQbmxROTBSQVdaME1BNjNwbUtYV3UwM3RVL1J0STJwbmRM?=
 =?utf-8?B?U0Q0dFk0Vk0rc2dRYWcrc0hVUEN2eVJZZGQwamNWcExNZmFpQVA3R0hSNHo1?=
 =?utf-8?B?a3d1OUVWbFV6WjMySWxUcGx6bC9nZVdxeWtDWkxvQVFldWRQTHVVbnZDWW1U?=
 =?utf-8?B?NG15RTRjNW4vK3l4TXh1OGhXZnpicS9VaGY0cmNmbVFWOTZLbE9yTzU0TFRJ?=
 =?utf-8?B?SDJYZmFIcThtOFh0VTcxSE1IeWY5bWRNNDB5TDNGY3BMKzh5Y0NqMjVvVlpH?=
 =?utf-8?B?ZGNNdnRNbjNScmV3RVNJZWdvN1ZJVktBdXRaL0xJVW43MmY1UjFYSHFLenQ5?=
 =?utf-8?B?RmMzVjVTdy9XNk5zOWlESkhMQ2lQWnZqdklXeXhLZlNSOVBaTTAyeFpSQ1Av?=
 =?utf-8?B?anFwRStTZ2xOS25zbWYza1k2c2V5VmJCZ2NjU3Y1MHhQR1FjVExnTXJKSys1?=
 =?utf-8?B?eU9BREhBbGRTcVJwZmlwK1lBc2RJd0p2dGdzbjlMWEt1UERzOUlvTEs2b2dQ?=
 =?utf-8?B?UDFpVkNSQVhWTXMwYitCdDU1MkZXZzFGelVWaUlNMzJDY0p1U0VxOHdwVUtj?=
 =?utf-8?B?ZDl5R1MvcFllU2VhSjNUVFhhdkNXS0dwRjE2L1c4N2o2SGZ2RXNzdXBYN0RJ?=
 =?utf-8?B?bHY5SCsyQ0tHWDcyaENucjB5MkR1RHRNOVdWVVA4RlZ5UU5EYlJLK2VGNC8v?=
 =?utf-8?B?UElRWjJHczNieHdZOE5DUCsxUmo2V2xqOXN0YlZYVTFxN3E1czc3SmI3Um15?=
 =?utf-8?B?NkZPS2xmelZmcXRySWluWFRtNUI0blFkQnNScnZMM3hzdVZWY2JpTkR6NGI4?=
 =?utf-8?B?TEg1Nit3aVVINlJxTDI3MWtQaFBjWEpYMGRIZTFEbnhmbFZVM2JrV1JiVlha?=
 =?utf-8?B?cGl5TGtSRVVtSTVLMC9WQURCR2F4Q2xjM3NnKzRWOHpQeWhNSlArb3lHMU41?=
 =?utf-8?B?RElTUUwwN253SUVqNVhGWlFReVJxZ2Zjek1XaVBCVzRzOFV2UENKVmUxMkU0?=
 =?utf-8?B?cGF3WmNtWFJkWmtWaE0xeTVhS2hRRjNQV0M3UFlMdnp2L0lPampBZStEZUFT?=
 =?utf-8?B?UmpCSHJRQ2xyakk5dE85ZC8xeVN5R2hCVFpHd3lTb1F4SmFxSHRjalI0UmR4?=
 =?utf-8?B?eUJub2dMVGVwTHd3YU5rS0h4MWZIQ1VoNTZnR1gvN0FsRDJuVUpJNHVpRUp0?=
 =?utf-8?B?YzlJditQRUMwRnhwR1k1SDQ4dWUzRUJqL3RSUEdDOW1WQ29CZExTNmozV2xx?=
 =?utf-8?B?aGZGa1o5YlkwQkJhYkZXZWdqOVVtQTdTVVdRQlFrZEoxQ2hwdm5yd0dqQXpG?=
 =?utf-8?B?ZWgyS1JJMFZSK2VqZnRZT0NSLzNyd2hmWlRlT01sUG9XbkJ6bnNWY1U4OVVK?=
 =?utf-8?B?K2VlZnNza2JMYVB2NWJmb3BQdm1pSHltSm92bmFmRkt6T2JRZmVabVhqR2Fs?=
 =?utf-8?B?SUh2SlowOWNMUTY5eVJZR2UwMFRUbEI0ZVFKampqUE5WbXdTcWtaaVRCdUlX?=
 =?utf-8?B?WTIzUUplamdDekRtU1VQZ0x2bHZZN20zbldjeWdONFJnQ2hEZjB1MGY2ejND?=
 =?utf-8?B?WWV6SGtNZ3NFUXNvcE1heHAvSys0NGhGcW5vMVZmb3k0cUE1eTJaNGNTNTU4?=
 =?utf-8?Q?HSomTkZIQXRKvVgYhyMQ1zOV4R141eKweYnwdxXTyk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c0fbc7-f080-4c2b-23e3-08d9a52b83a9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 15:54:16.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4GqFgvGv9Qa4PgX5ryrGwZ9Hj+cagxUqHvsEOGgu2l9OsHy6BQIM1Zu/i8z4w/ItajdutZ+GS+xu7048t5392A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2342
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Chen,
 Jingwen" <Jingwen.Chen@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-11-10 8:24 a.m., Daniel Vetter wrote:
> On Wed, Nov 10, 2021 at 11:09:50AM +0100, Christian König wrote:
>> Am 10.11.21 um 10:50 schrieb Daniel Vetter:
>>> On Tue, Nov 09, 2021 at 08:17:01AM -0800, Rob Clark wrote:
>>>> On Tue, Nov 9, 2021 at 1:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>> On Mon, Nov 08, 2021 at 03:39:17PM -0800, Rob Clark wrote:
>>>>>> I stumbled across this thread when I ran into the same issue, while
>>>>>> working out how to move drm/msm to use scheduler's retire +
>>>>>> timeout/recovery (and get rid of our own mirror list of in-flight
>>>>>> jobs).  We already have hw error detection enabled, and it can signal
>>>>>> quite fast, so assuming the first job on the list is the guilty job
>>>>>> just won't work.
>>>>>>
>>>>>> But I was considering a slightly different approach to fixing this,
>>>>>> instead just handling it all in drm_sched_main() and getting rid of
>>>>>> the complicated kthread parking gymnastics.  Ie. something along the
>>>>>> lines of:
>>>>> So handling timeouts in the main sched thread wont work as soon as you
>>>>> have multiple engines and reset that impacts across engines:
>>>>>
>>>>> - Nothing is simplified since you still need to stop the other scheduler
>>>>>     threads.
>>>>>
>>>>> - You get deadlocks if 2 schedulers time out at the same time, and both
>>>>>     want to stop the other one.
>>>>>
>>>>> Hence workqueue. Now the rule for the wq is that you can only have one per
>>>>> reset domain, so
>>>>> - single engine you just take the one drm/sched provides
>>>>> - if reset affects all your engines in the chip, then you allocate on in
>>>>>     the drm_device and pass that to all
>>>>> - if you have a complex of gpus all interconnected (e.g. xgmi hive for
>>>>>     amd), then it's one wq for the entire hive
>>>>>
>>>>> _All_ reset related things must be run on that workqueue or things breaks,
>>>>> which means if you get hw fault that also needs to be run there. I guess
>>>>> we should either patch drm/sched to check you call that function from the
>>>>> right workqueue, or just handle it internally.
>>>> Hmm, ok.. I guess it would be useful to better document the reasoning
>>>> for the current design, that would have steered me more towards the
>>>> approach taken in this patch.
>>> Maybe this was because you worked on an old kernel? Boris did update the
>>> kerneldoc as part of making gpu reset work for panfrost, which has this
>>> multi-engine reset problem. If that's not yet clear then we need to
>>> improve the docs further.
>>>
>>> AMD's problem is even worse, because their reset domain is the entire xgmi
>>> hive, so multiple pci devices.
>> I'm pushing for quite a while that we get something like an
>> amdgpu_reset_domain structure or similar for this, but we unfortunately
>> don't have that yet.
>>
>> Maybe it should be a good idea to have something like a drm_sched_domain or
>> similar with all the necessary information for the inter scheduler handling.
>>
>> E.g. a workqueue for reset etc...
> Yeah I think as soon as we have more stuff than just the wq then a
> drm_sched_reset_domain sounds good.
>
> But if it's just driver stuff (e.g. the xgmi locking you have in amdgpu
> reset comes to mind) then I think just a driver_reset_domain struct that
> bundles all that stuff up seems good enough.
>
> E.g. on i915 I'm also pondering whether some of the fw requests should be
> processed by the reset wq, to avoid locking headaches, so I don't think
> hiding that work too much in abstractions is a good idea.
> -Daniel


I suggest we keep the drm_sched_reset_domain as a base struct to hold the wq
(and possible something else cross drivers in the future) and then embed 
it in a derived
driver specific struct to hold driver specific stuff like
the XGMI lock you mentioned.

Andrey


>
>> Regards,
>> Christian.
>>
>>> Also there might more issues in drm/sched ofc, e.g. I've looked a bit at
>>> ordering/barriers and I'm pretty sure a lot are still missing. Or at least
>>> we should have comments in the code explaining why it all works.
>>> -Daniel
>>>
>>>> BR,
>>>> -R
>>>>
>>>>> -Daniel
>>>>>
>>>>>> ---------------------
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 67382621b429..4d6ce775c316 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -764,6 +764,45 @@ static bool drm_sched_blocked(struct
>>>>>> drm_gpu_scheduler *sched)
>>>>>>           return false;
>>>>>>    }
>>>>>>
>>>>>> +static bool handle_timeout(struct drm_gpu_scheduler *sched)
>>>>>> +{
>>>>>> +       struct drm_sched_job *bad;
>>>>>> +
>>>>>> +       if (!sched->has_timeout)
>>>>>> +               return false;
>>>>>> +
>>>>>> +       sched->has_timeout = false;
>>>>>> +
>>>>>> +       spin_lock(&sched->job_list_lock);
>>>>>> +       bad = list_first_entry_or_null(&sched->pending_list,
>>>>>> +                                      struct drm_sched_job, list);
>>>>>> +
>>>>>> +       if (!bad) {
>>>>>> +               spin_unlock(&sched->job_list_lock);
>>>>>> +               return false;
>>>>>> +       }
>>>>>> +
>>>>>> +       spin_unlock(&sched->job_list_lock);
>>>>>> +
>>>>>> +       if (sched->timeout_wq == system_wq) {
>>>>>> +               /*
>>>>>> +                * If driver has no specific requirements about serializing
>>>>>> +                * reset wrt. other engines, just call timedout_job() directly
>>>>>> +                */
>>>>>> +               sched->ops->timedout_job(job);
>>>>>> +       } else {
>>>>>> +               /*
>>>>>> +                * Otherwise queue it on timeout_wq and wait for it to complete
>>>>>> +                */
>>>>>> +               ... more typing needed here ...
>>>>>> +       }
>>>>>> +
>>>>>> +       if (sched->free_guilty) {
>>>>>> +               sched->ops->free_job(job);
>>>>>> +               sched->free_guilty = false;
>>>>>> +       }
>>>>>> +}
>>>>>> +
>>>>>>    /**
>>>>>>     * drm_sched_main - main scheduler thread
>>>>>>     *
>>>>>> @@ -787,6 +826,7 @@ static int drm_sched_main(void *param)
>>>>>>
>>>>>>                   wait_event_interruptible(sched->wake_up_worker,
>>>>>>                                            (cleanup_job =
>>>>>> drm_sched_get_cleanup_job(sched)) ||
>>>>>> +                                        handle_timeout(sched) ||
>>>>>>                                            (!drm_sched_blocked(sched) &&
>>>>>>                                             (entity =
>>>>>> drm_sched_select_entity(sched))) ||
>>>>>>                                            kthread_should_stop());
>>>>>> ---------------------
>>>>>>
>>>>>> drm_sched_fault() and the sw timeout handler would just set
>>>>>> sched->has_timeout and kick sched->wake_up_worker.
>>>>>>
>>>>>> And since we handle the timeout case after
>>>>>> drm_sched_get_cleanup_job(), we know that all of the successfully
>>>>>> completed jobs have already been popped off the list, and won't be
>>>>>> unfairly maligned.
>>>>>>
>>>>>> BR,
>>>>>> -R
>>>>>>
>>>>>> On Tue, Aug 31, 2021 at 6:29 PM Liu, Monk <Monk.Liu@amd.com> wrote:
>>>>>>> [AMD Official Use Only]
>>>>>>>
>>>>>>> Okay, I will reprepare this patch
>>>>>>>
>>>>>>> Thanks
>>>>>>>
>>>>>>> ------------------------------------------
>>>>>>> Monk Liu | Cloud-GPU Core team
>>>>>>> ------------------------------------------
>>>>>>>
>>>>>>> -----Original Message-----
>>>>>>> From: Daniel Vetter <daniel@ffwll.ch>
>>>>>>> Sent: Tuesday, August 31, 2021 9:02 PM
>>>>>>> To: Liu, Monk <Monk.Liu@amd.com>
>>>>>>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Chen, Jingwen <Jingwen.Chen@amd.com>
>>>>>>> Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
>>>>>>>
>>>>>>> On Tue, Aug 31, 2021 at 02:59:02PM +0200, Daniel Vetter wrote:
>>>>>>>> Can we please have some actual commit message here, with detailed
>>>>>>>> explanation of the race/bug/whatever, how you fix it and why this is
>>>>>>>> the best option?
>>>>>>>>
>>>>>>>> On Tue, Aug 31, 2021 at 06:35:39PM +0800, Monk Liu wrote:
>>>>>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/scheduler/sched_main.c | 24
>>>>>>>>> ++++--------------------
>>>>>>>>>    1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> index ecf8140..894fdb24 100644
>>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>>       sched = container_of(work, struct drm_gpu_scheduler,
>>>>>>>>> work_tdr.work);
>>>>>>>>>
>>>>>>>>>       /* Protects against concurrent deletion in
>>>>>>>>> drm_sched_get_cleanup_job */
>>>>>>>>> +   if (!__kthread_should_park(sched->thread))
>>>>>>>> This is a __ function, i.e. considered internal, and it's lockless
>>>>>>>> atomic, i.e. unordered. And you're not explaining why this works.
>>>>>>>>
>>>>>>>> Iow it's probably buggy, and an just unconditionally parking the
>>>>>>>> kthread is probably the right thing to do. If it's not the right thing
>>>>>>>> to do, there's a bug here for sure.
>>>>>>> Also why don't we reuse the function drivers already have to stop a scheduler thread? We seem to have two kthread_park now, that's probably one too much.
>>>>>>> -Daniel
>>>>>>>
>>>>>>>>> +           kthread_park(sched->thread);
>>>>>>>>> +
>>>>>>>>>       spin_lock(&sched->job_list_lock);
>>>>>>>>>       job = list_first_entry_or_null(&sched->pending_list,
>>>>>>>>>                                      struct drm_sched_job, list);
>>>>>>>>>
>>>>>>>>>       if (job) {
>>>>>>>>> -           /*
>>>>>>>>> -            * Remove the bad job so it cannot be freed by concurrent
>>>>>>>>> -            * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>>> -            * is parked at which point it's safe.
>>>>>>>>> -            */
>>>>>>>>> -           list_del_init(&job->list);
>>>>>>>>>               spin_unlock(&sched->job_list_lock);
>>>>>>>>>
>>>>>>>>> +           /* vendor's timeout_job should call drm_sched_start() */
>>>>>>>>>               status = job->sched->ops->timedout_job(job);
>>>>>>>>>
>>>>>>>>>               /*
>>>>>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>>       kthread_park(sched->thread);
>>>>>>>>>
>>>>>>>>>       /*
>>>>>>>>> -    * Reinsert back the bad job here - now it's safe as
>>>>>>>>> -    * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>>> -    * bad job at this point - we parked (waited for) any in progress
>>>>>>>>> -    * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>>> -    * now until the scheduler thread is unparked.
>>>>>>>>> -    */
>>>>>>>>> -   if (bad && bad->sched == sched)
>>>>>>>>> -           /*
>>>>>>>>> -            * Add at the head of the queue to reflect it was the earliest
>>>>>>>>> -            * job extracted.
>>>>>>>>> -            */
>>>>>>>>> -           list_add(&bad->list, &sched->pending_list);
>>>>>>>>> -
>>>>>>>>> -   /*
>>>>>>>>>        * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>>        * their HW callbacks or remove them from pending list if they already
>>>>>>>>>        * signaled.
>>>>>>>>> --
>>>>>>>>> 2.7.4
>>>>>>>>>
>>>>>>>> --
>>>>>>>> Daniel Vetter
>>>>>>>> Software Engineer, Intel Corporation
>>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.
>>>>>>>> ffwll.ch%2F&amp;data=04%7C01%7CMonk.Liu%40amd.com%7C298815bea18f4fbf76
>>>>>>>> b308d96c7f7a8b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376601170
>>>>>>>> 51194614%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
>>>>>>>> CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QzgCU7%2BPdA0aWL5%2BJLg
>>>>>>>> KeKbGaMMGqeGI9KE0P0LXlN4%3D&amp;reserved=0
>>>>>>> --
>>>>>>> Daniel Vetter
>>>>>>> Software Engineer, Intel Corporation
>>>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cbf8af1e8a797474bd5c108d9a44d664b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637721474618053495%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=irN0l%2F8L7X9A8BRNAIYmOO4jMI1ZLeFGHPLYanVOMOA%3D&amp;reserved=0
>>>>> --
>>>>> Daniel Vetter
>>>>> Software Engineer, Intel Corporation
>>>>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cbf8af1e8a797474bd5c108d9a44d664b%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637721474618053495%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=irN0l%2F8L7X9A8BRNAIYmOO4jMI1ZLeFGHPLYanVOMOA%3D&amp;reserved=0
