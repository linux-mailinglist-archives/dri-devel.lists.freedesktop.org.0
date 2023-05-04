Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7758D6F698B
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 13:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA44410E04F;
	Thu,  4 May 2023 11:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::610])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4301A10E04F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 11:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL2dba9QD/ElSqup4hMrvGe6bgrDxBmHUaYHo8fs1SGoz7Fazxq0TXwUhwzPUwlyBW0OBqgvQ3MriprWxu43jAkgbHi9CtP9zq05j3fhuYSpB+9sE1cpK+C6r8YSEPEcxV+CcFOH69pvLK6WORzh0UezSgbRgPlmvmlsdwkXMy0RjTedH2hsr+mEfm5VmSk5IIosotCDbqmG2mAit18RQWSfF2UXz0/+rPuVuTEXALX7rcyCQ48PgQPHo5gfsHlwczXrO5tu+I4P130t2p9s7UFcxHSq7l+73vVp5iy0QAhcvnKxLh9yiKcw+ZTYKgVGWBWZ2Yds4Eh84OuJCZVCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxPhIyQHu6yHow/IVs4zuWUpXfckem+ZNQ/vhg+k1g0=;
 b=ZJXpplT11n1cUKDiCnGKsFoNO942g/z5xJ3QFGRL48IMW7QzMDwgip6CE1E6r8jTjrITux44o8mDEjBYTxbF2lqNhmSZhTHGXZYIb+8LD7B3qQZUmGNRAOTWQS0lfDmc17yv/rGHxleKwHQ38vFx1cW6FfFcLzbqw0ObvLEFe/GOCjeuyA9JAord5ZDTs5J3RLrHHkoTQgWgmyzzLYUTOG8EpJqlt2IXpmf1+vu/JK24eOPcVZanzIZkDsIH36XPY7XqFyX5pn27QRma4F0gfv43duIMc5DIARTfmsLy9uNJWGUfbWNgoOlBqvWldqPjR2QRoPKSTxXci9NW1OqYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxPhIyQHu6yHow/IVs4zuWUpXfckem+ZNQ/vhg+k1g0=;
 b=nECkh/TsiyY6AeePHeYzw8XbL7WiZAMliWSY7Pvq4K75RKkKD+4kZ1LyaChYsY2owlk5UCxh8lrsuPZYOhDZrTi5+X/wFRnJVDpX9Kl2rNhG1IS9px2c2pmFl0hML/4Cr13+rH2rMIXlVstmgsvvjDyPHwwpxQmDuRAAoAR6AOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5727.namprd12.prod.outlook.com (2603:10b6:408:17d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 11:08:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 11:08:08 +0000
Message-ID: <032b90ad-e198-5d7f-2880-2e8ae20dc7d3@amd.com>
Date: Thu, 4 May 2023 13:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20230502131941.5fe5b79f@collabora.com>
 <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
 <20230502144132.6a9e1bb5@collabora.com>
 <20230503101624.5dbae57c@collabora.com>
 <f1c16424-e4cb-19a3-4854-40ead9d59d9c@amd.com>
 <ZFM6hElmnFsBwyOi@DUT025-TGLU.fm.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZFM6hElmnFsBwyOi@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5727:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df00cae-156c-4788-0257-08db4c8fd734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pD1ME7K7lHH/rj6QIXGgLLhmt4fSarBTg3Ur7rZVJ6cw8WzoUYiN/kCwQ9WXKqNt+GbY/htg8iLZTbeTiq33XuFKj9aQXfVmxPwe5tS4ZG3lwfhgp8X14tnrh2eA9GC4rQky56us+6k52hth8MHxwKffoPOqKPwLjbQSv4VHeeAERIkHuJN/aQRKpvPVQCiDrlOPqYSajm3TwboGomJdQW8MnEpxWn4MQx3zikfzGW0wIOWfsMjf5Tz4YW8I6S5uCd1F3BQzMordgSLog5gpDDsQ+gUV9hSQLrT6UF6Yy+sTNqzbxEtutXarB1qoXh/wXe6Ma6QXv/CQRwYgh5sPGxAnKH0ByWxx5XNQUEp4t65qOQeMkhrL3Q3gX5u/RrxCudY0bq9PqjGC4RgfNYQl769iXQRPrKM2/XzKHe1wlVx1OlCGTkx44uDEVqH+yqG50YTQlqPivcDUXvUyxMV6INZnVPHCRsBk33if2v2WiyVH1csgRKl4YFncG+5LRMambYaDhTZ43mr3akmmZPTO7BuwxEC4OLfjJXJHRPz4Zb2kFkBmBBLHf7JtfNNpER60NfGmIbW8Df65JSB7T9GIYwJ/uN0y5Y7jAtjBNmHe8SA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(366004)(396003)(376002)(346002)(451199021)(83380400001)(31686004)(36756003)(31696002)(86362001)(38100700002)(478600001)(186003)(2616005)(66574015)(966005)(6666004)(6506007)(26005)(6486002)(6512007)(2906002)(54906003)(5660300002)(8936002)(41300700001)(8676002)(4326008)(66946007)(6916009)(66476007)(66556008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFlcGpNVzV6d1Z4MXFSbFIxTEZXU0RBa0FkUmFqdGVUUE1mbTJVd3N3UzlH?=
 =?utf-8?B?dGl5ejB1S01ad2dHSzVuZVY4N1hLK2FpOStpNVdqcmhBbkU0TXdqeVIwekth?=
 =?utf-8?B?RTNHaElxOWg4dk45bVQ4N1JzWlU0OFlGZTZuWi9kcE05VjNqVzNKUy9ldjVQ?=
 =?utf-8?B?eHh5UVVESXdsTkg2OE83cjdCWFlmVkFpQ0szWm10N3pNQnpyOFp6U3N3dEMz?=
 =?utf-8?B?T0lIOXZaczVWbFdUek1qWi8rQ2hNZFM4YjhCT3hxdCtXTm9jZXptMXJ5cFpN?=
 =?utf-8?B?ckdlMUkwa2I1cGRhR1hYN0JqbjUvb2g1SE1FNXg2eUtHNzJRYkQ2Wk9iOXRy?=
 =?utf-8?B?LzlCNGVsYjJFZThqTm9hb0hxOU5lRWpVMmt3ckVVbDVnWldwRmhGOWFkWGRp?=
 =?utf-8?B?UEJ6SnBDcnZCUzZxOExuNXBLaDF4MWdhS3A2UTJVNkswem93eGZNeFBiTS9v?=
 =?utf-8?B?WCswbDdBWUNHQnRxSEVENCtiOStaU3Z0WFhIQUoxWUJ2SG9ORU5ZWmFYT0xM?=
 =?utf-8?B?V1R3NHdtN1VpSjUxZXgyT05ldjc2aG4rVXZFWnJYS0NCMHJ3Z1BZSC9XZFZ1?=
 =?utf-8?B?eWZja240SXVtNE9EdWcvRVVPYStFRkoxR1lyWEl4N3hCcHdSMjZpT1o3WnJB?=
 =?utf-8?B?NzBZa0VjYTlRM0JKL1pxdFM0cjZjMWVpUHhCL1kzMjBiUW9ldVl6bnlLZGVU?=
 =?utf-8?B?K0lRODJjVk83a2IxYVFYOUcwUm1ML3lGRURzSmwxaEFBVkp4bXBac0grYnVw?=
 =?utf-8?B?TkhrQy9MSG9ldGp0aCtKd0hZRG91Y2J6b0NuenVlbE44YTduS2dVSnNhZ1Rh?=
 =?utf-8?B?bVBVTmNEOWdEVFlhbThDZ3BNZU00UTNLZW96M3dYVi90S04zQUVJUEJGQzJS?=
 =?utf-8?B?Y3pHbHNHRFNlTWIrUnlrRTJnOHptelFUbk5MWUhFeDltenJQNDhKdGo5Tm5P?=
 =?utf-8?B?amRlTUcwQ0tMMlRua2xubTM4WU1ybFFUSGR5U3ordVoyTXNYMURlQS9oUjlH?=
 =?utf-8?B?dGdvWjBOY0NCc1R4Z3lCeHI0MEM3dmxDMDBWZHFjQ0tkMEVMai9rMDRzN2Nr?=
 =?utf-8?B?Q1dLUzE2TXpTV0Q1ajJvOVZ6bVBLYTBwTFErMHoxVnYyTnlQTnhEUVN6cGtw?=
 =?utf-8?B?b3FjeHVBc0dGVDRLT25ibzFrN3VJRC9oME9CWHorYnJQdnJ2L2FqZVVrdnZo?=
 =?utf-8?B?Rzg3cFBld2hGNGZpYmtvbm40bDdIOUZTNm1RU0pGTGdXd2htRmpSUytLWENo?=
 =?utf-8?B?dk5Pd1Rra1d5NGNjZU91WVJ1TDRCQVdicktHNUtIQTlVRGpJNm9sOWhUTUlE?=
 =?utf-8?B?dWUyOEhjRFVGeW9ZL2dDcFlhbU1tSFkxUnI0eFVsdmZzdHY5MmlDMlN5M2Jz?=
 =?utf-8?B?YVJXdFk2OXFLaVRhNG1JQXM2NVhScTRKRU02RUgxeWYrenFqdXRNMmtpVklE?=
 =?utf-8?B?Q0NOK3NiTVd1WmhlVG1rZDMzcnZoL2pQbjdrWjBORjhLd0V4cEFROTFydmoz?=
 =?utf-8?B?SUxZRDRxOW1jSjBBOTNZbmZPNUd4MlhLckVLdjIwNE9tN1gxd2JLdHgzcDJ0?=
 =?utf-8?B?aUw2NjJBTjBucUJjYXhZR1FtTC95aE9Bd29NYlhMdkJlSGpmbzdZOThXbGdF?=
 =?utf-8?B?Zm1Yd0tMVituSUV2Qm01a095ODVlZ2Q2MTlqZkpsK2FMbGxDM1l5WFdORGpH?=
 =?utf-8?B?RXNaVnJUWVZUNXhhalBRVTd4Ui9hZENsMVRhRS9KNGRtR2xpNWxSU3Zsb3dH?=
 =?utf-8?B?Q3dKRTRCL0hTeVJYeUtlZDBYZ2lVNXI4VHJTSEFIMXRVVjh1b2lTTmxmSHky?=
 =?utf-8?B?Z0FHcTk5RHpVVlcxdFJpd1oxTDRrTXZ5MURVMHBqYlQ1L1JEVHBJNGUxZUhE?=
 =?utf-8?B?M3RDLzMreWtja0o0MzZncVpqM2NCUnp3ZDZ1WFFPdHBoeGV0eDdnSHZVMHVy?=
 =?utf-8?B?a01CZllGUGp6RTZHTThESjVpd0tjYzV5TWFoQm1MakNGQThCL2FzUURPZzJl?=
 =?utf-8?B?SXEvYUI3RlMvWDM0SmFsbFdOWjFKMkdlamNaL0ZlZkFSdHB6UUxKdFUvbDk3?=
 =?utf-8?B?bWt4VHpPQS9YbDI2MEFZL01vSFhvNDNpdGozTU9qQWx0MzhnY3MwSmMreGxo?=
 =?utf-8?Q?d9wA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df00cae-156c-4788-0257-08db4c8fd734
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 11:08:08.1213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDjrfTEBrD71R1sgN/+MbjyXA7ibJR0EV2R2cCqERj7Gn45pPspy/JKtTbqIq4HN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5727
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.05.23 um 06:54 schrieb Matthew Brost:
> On Wed, May 03, 2023 at 10:47:43AM +0200, Christian König wrote:
>> Adding Luben as well.
>>
>> Am 03.05.23 um 10:16 schrieb Boris Brezillon:
>>> [SNIP]
>>>> To sum-up, we shouldn't call drm_sched_{start,stop,resubmit_jobs}().
>>> After the discussion I had with Matthew yesterday on IRC, I
>>> realized there was no clear agreement on this. Matthew uses those 3
>>> helpers in the Xe driver right now, and given he intends to use a
>>> multi-threaded wq for its 1:1 schedulers run queue, there's no way he
>>> can get away without calling drm_sched_{start,stop}().
>>> drm_sched_resubmit_jobs() can be open-coded in each driver, but I'm
>>> wondering if it wouldn't be preferable to add a ::resubmit_job() method
>>> or extend the ::run_job() one to support the resubmit semantics, which,
>>> AFAIU, is just about enforcing the job done fence (the one returned by
>>> ::run_job()) doesn't transition from a signaled to an unsignaled state.
>>>
>>> But probably more important than providing a generic helper, we should
>>> document the resubmit semantics (AKA, what should and/or shouldn't be
>>> done with pending jobs when a recovery happens). Because forbidding
>>> people to use a generic helper function doesn't give any guarantee that
>>> they'll do the right thing when coding their own logic, unless we give
>>> clues about what's considered right/wrong, and the current state of the
>>> doc is pretty unclear in this regard.
>> I should probably talk about the history of the re-submit feature a bit
>> more.
>>
>> Basically AMD came up with re-submission as a cheap way of increasing the
>> reliability of GPU resets. Problem is that it turned into an absolutely
>> nightmare. We tried for the last 5 years or so to get that stable and it's
>> still crashing.
>>
>> The first and most major problem is that the kernel doesn't even has the
>> information if re-submitting jobs is possible or not. For example a job
>> which has already been pushed to the hw could have grabbed a binary
>> semaphore and re-submitting it will just wait forever for the semaphore to
>> be released.
>>
>> The second problem is that the dma_fence semantics don't allow to ever
>> transit the state of a fence from signaled back to unsignaled. This means
>> that you can't re-use the hw fence and need to allocate a new one, but since
>> memory allocation is forbidden inside a reset handler as well (YES we need
>> to better document that part) you actually need to keep a bunch of hw fences
>> pre-allocated around to make this work. Amdgpu choose to illegally re-use
>> the hw fence instead which only works with quite extreme hacks.
>>
>> The third problem is that the lifetime of the job object was actually
>> defined very well before we tried to use re-submission. Basically it's just
>> an intermediate state used between the IOCTL and pushing things to the hw,
>> introducing this re-submit feature completely messed that up and cause quite
>> a number of use after free errors in the past which are again only solved by
>> quite some hacks.
>>
>> What we should do in the GPU scheduler instead is the follow:
>>
>> 1. Don't support re-submission at all!
>>      Instead we can provide help to drivers to query which fences (scheduler
>> or hw) are still not signaled yet.
>>      This can then be used to re-create hw state if (and only if!) the driver
>> knows what it's doing and can actually guarantee that this will work.
>>      E.g. the case for XE where the kernel driver knows the contexts which
>> were not running at the time and can re-create their queues.
>>
>> 2. We can provide both a wq to use for single threaded application as well
>> as start/stop semantics.
>>      It's just that the start/stop semantics should never touch what was
>> already submitted, but rather just make sure that we don't get any new
>> submissions.
>>
> I pretty much agree with everything Christian has said here and Xe
> aligns with this. Let me explain what Xe does.
>
> 1. Entity hang (TDR timeout of job on a entity, firmware notifies Xe that a
> entity hung, entity IOMMU CAT error, etc...):
> 	- No re-submission at all
> 	- ban the entity
> 	- notify the UMD
> 	- cleanup all pending jobs / fences
> 2. Entire GPU hang (worth mentioning with good HW + KMD this *should*
> never happen):
> 	- stop all schedulers (same as a entity in Xe because 1 to 1)
> 	- cleanup odd entity state related to communication with the
> 	  firmware
> 	- check if an entity has a job that started but not finished, if
> 	  so ban it (same mechanism as above)
> 	- resubmit all jobs from good entities

As long as you can do this without creating new dma_fence objects for 
the hw submissions everything should be fine.

> 	- start all schedulers (same as a entity in Xe because 1 to 1)
>
> The implementation for this in the following file [1]. Search for the
> drm scheduler functions and you should be able to find implementation
> easily.
>
> If you want to use an ordered work queue to avoid the stop / start dance
> great do that, in Xe the stop / start dance works. I have extensively
> tested this and the flow is rock solid and please trust me when I say
> this as I worked on reset flows in the i915 and fought bugs for years, I
> still don't think it is in the i915 because we try to do resubmission +
> crazy races. Because of that I was incredibly paranoid when I
> implemented this + tested it extensively.
>
> I'll post an updated version of my DRM scheduler series [2] on the list
> soon for the WQ changes, plus whatever else is required for Xe.
>
> So my take from this discussion is maybe with a little documentation, we
> are good. Thoughts?

For XE what you describe above basically sounds perfectly fine to me.

I strongly assume when you re-submit things you just tell your hw 
scheduler to pick up at the place it left of? E.g. set a read pointer 
and write pointer of a ring buffer appropriately?

Christian.

>
> Matt
>
> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/blob/drm-xe-next/drivers/gpu/drm/xe/xe_guc_submit.c
> [2] https://patchwork.freedesktop.org/series/116055/
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Boris

