Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E247E6CBC86
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 12:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DED10E478;
	Tue, 28 Mar 2023 10:29:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::622])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C167410E478
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 10:29:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lw7MN82NQAPZDlnvI6E/rvg1nbrF00O8L89Orwp6I2Je9P/JTsO7rvUTwW+I7qVyS9vB8Z0MQRXLIbT3nzD1wMACubqjFpBwPj9WMVUoy29Jz+U979hXvFjWK6sBv+M4lERcOMGmN1YvT8RxXWB5x8qF432r4FRBm9DyQcrBIwBfVy4cnGldZZZETuPSaZiBgn1vypEZJ4IiIe0Q5F6UQOToF0Z8mk7/D0iy3KoQGGqYKXbBqT+6oBvTtTdgTneyKqH0KKXDavgojSp7sOsJ+FNItAa9R//Q/D/lDeFpxVM5oGHP+/jlgb0B1HRIp0LHIXbHgAu37dEXZQM7zSrx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkcO1Mt5jbWwDzofN11lpKPH+vWWTOwY2qGVespJIcs=;
 b=hp3aB+dViYIxEax/azf/5/cHiTbkbap26qyJ5M0iXGBSHG97ku/DiIBwKEIMIhV6yp3XZjY193q6XHB5Do3cm7e67CH9Kpbb6MzlhMjLtQJEx3Kn4szTfFUXFWGcUkD9XW32hddXHYDabhrZUz5nwnXt5aUlwM+J0e/b28bFm5ecX/u3GP961b4pCH5BRdRUa8bXet1YKxCR+j9dqIJuT2JK56tmLDRH3HNc2j9W55nADTfxsZljF3/5Rp077gy3Su+5i1SAOLGKVyBRevV7rzlEOGN+riLDSB+aCAyeGDTTn+QzK3LnBO/6Ms5wtx+SI5mQhbkkjn+SN8FzSU+0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkcO1Mt5jbWwDzofN11lpKPH+vWWTOwY2qGVespJIcs=;
 b=G4xhCH+RMC6ytaJKYmPA0O0BII/4yXU4Cm2Txusv6lwSmpPOuZHw0td1gxh+ep8ukdeTZXi/BoLW8qp3Nutl0z0f6b9lwq0anEoZONoSy2lC5YD7U5Ko7t+5zuFN6kODuaALcUyn7XuOuc8BiyPIUF788wuwnnG2P9MpO8rlXBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB7360.namprd12.prod.outlook.com (2603:10b6:303:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 10:29:49 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6222.032; Tue, 28 Mar 2023
 10:29:49 +0000
Message-ID: <420fd11e-8a3e-54d1-8e9f-119507f7af48@amd.com>
Date: Tue, 28 Mar 2023 12:29:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
Content-Language: en-US
To: Danilo Krummrich <danilokrummrich@yahoo.de>, daniel@ffwll.ch,
 Dave Airlie <airlied@gmail.com>, luben.tuikov@amd.com,
 l.stach@pengutronix.de, Bagas Sanjaya <bagasdotme@gmail.com>,
 andrey.grodzovsky@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <e3e07282-136f-5239-96ae-4aeb2d3c95d7.ref@yahoo.de>
 <e3e07282-136f-5239-96ae-4aeb2d3c95d7@yahoo.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3e07282-136f-5239-96ae-4aeb2d3c95d7@yahoo.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af6818a-5a53-4de2-75e0-08db2f775bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8bEfSKEGg94AlA8BG1KXqS9u4LddFbUbutpN5xPVwBgzvwJbdd2c8Ked8NLOwi6L5aPUUgBLjfML+/K5d8QzfgJL5LpdImLAOnXYROqlgSsMMjzLAqcwLt/DRWnjmGk76jVbHN4MFlgYdu97M91C2qzQUFPB0c/zHEo7j6ex5F2Vz6J8zvXjgRFqnsCIY34EJ4gwdXgjJK32ftbAPLj5yatfGfuG5kigG8dUoo7DZHSDIhZ/2OIwOiaaftsGgQNwvJA0ik39r83KVP5IjJPqK1wfSkAvLkz2kOfYe5jGWejBKJIHqaLiaUg6d5u0N5pcHMgkG/02i4FQwM7c8FkFS7XX+4IZZZn1SQ94Lcjj2zp8es436yzj5h20ktSSuRq9vCfMdaBltx6INNfDNDEDJZou/B6X353vXzxsPcjtTx83XUH42T5o2YlYKAq/yratO7Xzlv034dYb50QiHfYmkT5vC1VQSKdOXGepkOcrMegK900p0WFv4e3YaAkJ88egYWH6h2hcVN2pmyF5JFSteHXAbd/mM5+S7gX+HCTla8uiylmKmseAsZRo4Yf14cgFZe+E6Bgj4gJjH8EZ69lVMJCotFzOhVlmyWrO11t2plyW1eroxVl7YLqbEGKEBYSdot27iDroKK33l/CwWxUPPLE6aHcXV7pmXg7CF3oQ8u6yplc7obkIH/Z2IvCl8Vp8A2/PhIBdaxDRv+kjrWUJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(38100700002)(186003)(41300700001)(8676002)(31686004)(31696002)(86362001)(66556008)(66476007)(6506007)(26005)(6512007)(6666004)(5660300002)(110136005)(316002)(66946007)(478600001)(6486002)(8936002)(36756003)(83380400001)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEN5eXdCc0JoUHIxdEgzTW9TeCtJK1Z3OExQQkp4SjFPWEJqeGxKUVl2aFJN?=
 =?utf-8?B?L0JxRnR2WjgxV3U3K1IyN0JpSjNVOFBteFVjRjI1M0toSXBzRFdjamRyOVhI?=
 =?utf-8?B?UnZjVXhyT2RYd01hQk1ZM1dCMHBna0xWMmwzcXlkbFRobWo4azY0Y3BpKzU2?=
 =?utf-8?B?bjJ6WDNiWkpWY0J6cGQweVpmQVZOclR6MHJaWUczZ1ZHUm9uTHQ4QjkyQXhI?=
 =?utf-8?B?U1NzNmhrUUtka09tK0hERytaVGlHalNibU0wL3pjSE8rUUUzWG1wSUR6eURB?=
 =?utf-8?B?cEtzQVVFTWlhK1crM3F2anJtNytKQ0Q4M0dqcTIxUTF2aGR4cjNHZE1wWkts?=
 =?utf-8?B?OTd4T08zYVdhdU4wMjlROU8xRVAwSGhLaXM0U2lGak5ETWNuSjNGSVRjZmVB?=
 =?utf-8?B?RTFKUzdZL3BsUmtYMDdxYVJOUU9HVGpGKzQ1OFFENWRrQVZoZEFaR2dRVFVr?=
 =?utf-8?B?SXN4RFhSZ1pDUHAyMEhNTmZ1NTFRZ0dJOG9JK3hzNTVJWlI5UVZEZWw1TGdI?=
 =?utf-8?B?dDMwZThUdm9YVWtEeitKT2FSalkwTzBlRHFmZDVwSEYzTTBOOXpOZHNpVDlP?=
 =?utf-8?B?WGlkL0dCWnVtblVzRytlRGYzY2E1UzlZTm1CeStCOVRiM2tJaWlZQy9lSlcy?=
 =?utf-8?B?WTNQRmlJWDNvY1Qrby9PbllURE5jV010d2dRMXZOaSs5M3EwamZpUFJsNW1L?=
 =?utf-8?B?d0NmMVFKU3lsNG93aVhGTlRRd0ZaS1NUV21UclJqTTFWRVh4QklJU1BFdUIz?=
 =?utf-8?B?aDluN2E1UXl4TUVyY2hxZzF5V3RQUGhvNWNwRncvekt1Z3YrS3B3cVR2Rkhp?=
 =?utf-8?B?a3dNWFl0dElud1ZvQ2VNY01wREhpeW5NWXpra09GR2Q3eHF4dnh2SFJGVnBZ?=
 =?utf-8?B?V2h4YXVsY1p1SDNrU3A1MlBMQkNYYkZVOHo1cStsTzRLODV4WHRvQTIvR1h5?=
 =?utf-8?B?enk0aCt1V3JTdFpWZEJRT0JLMXE0ZXVoK1hKODZwbzFrWXFjY3RJakdocmV2?=
 =?utf-8?B?Z2dxOGhVTSsxRVFCM3N2YlFzUXVGZFVwaytaeVJUd2FFYVllZkpHTWd1TzFw?=
 =?utf-8?B?Sld6V1dtVm8zNHFETFgxMk9kSHI1dmR1VVhnVVdJMklRWms0Z21jV1ZvMC9T?=
 =?utf-8?B?TWg1a0lteXVYUHJoV2gySlVzRnZrWkdJMHZ3WlU2dkRmS0tNRklYUnp3OGV4?=
 =?utf-8?B?QWZEdHNJb3JWWjc1WEdJT2tMaS9sdEFjeDNGbEpuYXVDSUdqREl6SXZnUWNx?=
 =?utf-8?B?dUNQak53U0laQ2RBZU1TdEJlMjByODNvVXlQRzFrWGc5N1JoUzFab0FIeGlY?=
 =?utf-8?B?M1ZTS1dlekFpNC9PZitxQVlqNTZzKzFnMGgvM2NTVUt6aXNLcnVhY2p5L2tJ?=
 =?utf-8?B?QnRMNTE0TDM3UGdtRGJCb1J2OERiQ2hNS25QNDBiZWswR2prOG90cHhYWlJE?=
 =?utf-8?B?MGNEQk84SGpqNDc4YWtTWnNwWHNQaTdhRTBRMnpIanQzVUZYc25JUzN6S2NZ?=
 =?utf-8?B?Qk8xNi93encvdC9TNjdmS1JpUjBTNHFhR05ydXZYTnFnU1ZGOTJUajNzRm1T?=
 =?utf-8?B?ZHlOUXlRcEFIYW9CS1V2QS9jcm8yVmxoOHIyT0tkM1c4dW82ekNDMTlFczd5?=
 =?utf-8?B?OUY2ZjYwaGJUdmJ5NmhjU2lXUGR4SUtyS0R2L05IUmZlQ2J4SjQ4M3p5SlUy?=
 =?utf-8?B?Snd6VytucXpJbkFXOTdmMmp4QWFtNDdOTUZkN0RMKzlBZzY4SFFVVFlqZnpQ?=
 =?utf-8?B?NVFXN1BxNnhWME9ZbkpLQmZraWttZVk1NkVGR2dGUFVYL2dudmxrSTlyN0x5?=
 =?utf-8?B?MEUvOFBnQjB1NDlmMUMyWmkxNlc2Ym80SmxpRURtdVNObEZKZStYK1NQQUli?=
 =?utf-8?B?d2Z0UjNsOW1URUhQN1BvUU5jaFg5T0FPRGJpMW03VC9jUHhzdnh4WUJqQUFk?=
 =?utf-8?B?Nnl6VHVSTThkZzBicmZoVTljcC9pZWNkTlNsYmM2TUdYN3V6dU5vUmdTYWJJ?=
 =?utf-8?B?RDJqaFRBYmwvWjVmVWhLOXJIZ3p3amw4MHBCTDB6TXJWczZHSFFmdE1weE0v?=
 =?utf-8?B?cGFsRzJDdU5GanU2MG1vQVJFeGh4ZGwvSFNXM3VQWGpSTkxOMm04RHpFYjNC?=
 =?utf-8?Q?yxKA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af6818a-5a53-4de2-75e0-08db2f775bcb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 10:29:49.3033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRRxKv0zHyUzB/KHRLcAvupPWsV8rmF/C8oywd13Ra6K+173sdWUcw202hEt3In8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7360
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

The same strategy was suggested before for amdgpu and reverted as well 
because of running into the same problems.

No idea how that slipped, Andrew reviewed it and IIRC he was also the 
one who reverted the initial approach for amdgpu.

Instead of letting the scheduler sum that stuff up proactively we should 
take care of that re-actively when the fdinfo data is queried like 
amdgpu does as well.

We should probably revert that patch for now and then discuss how we can 
do this in a generalized helper.

Regards,
Christian.

Am 28.03.23 um 02:54 schrieb Danilo Krummrich:
> Hi all,
>
> Commit df622729ddbf ("drm/scheduler: track GPU active time per 
> entity") tries to track the accumulated time that a job was active on 
> the GPU writing it to the entity through which the job was deployed to 
> the scheduler originally. This is done within 
> drm_sched_get_cleanup_job() which fetches a job from the schedulers 
> pending_list.
>
> Doing this can result in a race condition where the entity is already 
> freed, but the entity's newly added elapsed_ns field is still accessed 
> once the job is fetched from the pending_list.
>
> After drm_sched_entity_destroy() being called it should be safe to 
> free the structure that embeds the entity. However, a job originally 
> handed over to the scheduler by this entity might still reside in the 
> schedulers pending_list for cleanup after drm_sched_entity_destroy() 
> already being called and the entity being freed. Hence, we can run 
> into a UAF.
>
> In my case it happened that a job, as explained above, was just picked 
> from the schedulers pending_list after the entity was freed due to the 
> client application exiting. Meanwhile this freed up memory was already 
> allocated for a subsequent client applications job structure again. 
> Hence, the new jobs memory got corrupted. Luckily, I was able to 
> reproduce the same corruption over and over again by just using 
> deqp-runner to run a specific set of VK test cases in parallel.
>
> Fixing this issue doesn't seem to be very straightforward though 
> (unless I miss something), which is why I'm writing this mail instead 
> of sending a fix directly.
>
> Spontaneously, I see three options to fix it:
>
> 1. Rather than embedding the entity into driver specific structures 
> (e.g. tied to file_priv) we could allocate the entity separately and 
> reference count it, such that it's only freed up once all jobs that 
> were deployed through this entity are fetched from the schedulers 
> pending list.
>
> 2. Somehow make sure drm_sched_entity_destroy() does block until all 
> jobs deployed through this entity were fetched from the schedulers 
> pending list. Though, I'm pretty sure that this is not really desirable.
>
> 3. Just revert the change and let drivers implement tracking of GPU 
> active times themselves.
>
> In the case of just reverting the change I'd propose to also set a 
> jobs entity pointer to NULL  once the job was taken from the entity, 
> such that in case of a future issue we fail where the actual issue 
> resides and to make it more obvious that the field shouldn't be used 
> anymore after the job was taken from the entity.
>
> I'm happy to implement the solution we agree on. However, it might 
> also make sense to revert the change until we have a solution in 
> place. I'm also happy to send a revert with a proper description of 
> the problem. Please let me know what you think.
>
> - Danilo

