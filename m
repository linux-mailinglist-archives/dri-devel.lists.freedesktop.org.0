Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4D86D5780
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 06:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C074C10E0A5;
	Tue,  4 Apr 2023 04:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6838A10E0A5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 04:31:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X7E8H8pyKVgvBHYrINilCkx5oxRBRXWo8QSY95EgE9jeObhm3zmL+fEtnAFi4kh4YyGueeR+4Fed0n66CZNthu1rhnl1vNsao8HxV68FIrd39j0FwIOwZeH4Qg9dLzDqrcvmsR6+/I3PIRweAkkZ4UJSMguls/R0zDjt8XjHpz8CVF7AevdlSKyfUy/XfxOQV4sjxWLt7exVwcIh8TuV82ekSt00uaF7Yc+cBSL9s1b+n34KsGeevATR9tZYOIqEkP9k4I4Z+o94MkT6aWz/GaX36FDp/yhSHVnmBG0xSuFagNkf9SPHZ/BHTUn/X/pfxgZLYd1wOnhwxPNcF8qcYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Js8iHiOjHKKo44/xToeryeuYB/quKWpvgCCctppFjLw=;
 b=BKuTkla4nLIGqWAdQWBgMfZVc3fFuijGbHOP2IJ62Bo1S8mFUi4771+AFAu0ThYK5JPfxN6exX3BO9vNJrXbxyDfnDbRPKcOvJrJRABeXzd3blzaNdOrNu4LGcNC3o54vhFIAbPk7mI5pcl1j+cQ7z1xdyugFAa3R4i9RSFpD/l1qY2O45cRAcwTwV7Ys8dic6oy0u6bhGTmjrDuVinfMmMVtF+ebh4WsIqnOjWxZoJlS7gQq7odAcSwwoSasOzVkClh2qyyvc7RQwY6mKpxk+kstQRsUsLGH/yVNQ66rAZczrKM5FHnJ9nXctXkSCuDbivL0ZWFAG90mIgRl7L9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Js8iHiOjHKKo44/xToeryeuYB/quKWpvgCCctppFjLw=;
 b=Rkp3kZMt/zqZM0AzaY5cC18Rv49r5Soqn3J7lXCYWG2YA+0M/E+sCYgoMu+YaUlRdiOYwoUfIKMDAnEHM/VAgVpWNNd86GZ+/wJGlNbxlfGPLmaW+kL0HJdjheLhftCyM9D8Dk6LZ57sVgd0E4/SdFW1PCxx7Efo9KISlf+ktLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DS0PR12MB8072.namprd12.prod.outlook.com (2603:10b6:8:dd::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.30; Tue, 4 Apr 2023 04:31:38 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 04:31:38 +0000
Message-ID: <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
Date: Tue, 4 Apr 2023 00:31:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Lucas Stach <l.stach@pengutronix.de>, Danilo Krummrich <dakr@redhat.com>, 
 daniel@ffwll.ch, Dave Airlie <airlied@gmail.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, andrey.grodzovsky@amd.com,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
In-Reply-To: <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::12) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DS0PR12MB8072:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e221a7a-e18e-442b-6f4d-08db34c57adf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q9ZClNb9T37PpVnPzfxAMwZD0BVzKPXAZxhr6uO/0jg581zOiWWQ/nJwRnFfnXxQWwDRPWmAdlhbE+crYtCbWgioOQva0v+BrwsIPXuZLtsrhoKF+yVssmng0jij5xVLuIcbMU27ZhVfUwELWIYXXtweXtAsa1CGJWgzAm58fIk1CZWe79UmJl1ORDhFcO6UwUV9U9ZV/qhkMDWXMeMhpZNrRnO+n0XEU+kVYI9HcXr41LI6MH5lnrN6+jo3a70Gv//dfIolmhtGk1qNxIxaT4Vzk3fgpkj0PMNJamlN9HK7pwOrXy6kvQDkBjXxjKMe2eVUgESooU9sPf6xsJp+YEnNBd1xPXdmhC2WBxkWeRkb+2e7ncQswEtWxImcix73F3U10fDhOZTl3BsSSNnJ0FZfWDHpy461uKM8hPy7fglGAXN1NSFyxP8ibjltP1PYI/wq94jnw0IKLKO84EI0CLrc2CAE0XWdJXDnMMw4tO6AjG1+NQbntTxO911S2rr8xl2T2zQLl3eZoGJNVEhHRBTbX+1lFLnawa+43NCYeGiok432hLzZ7c95kBTFu4r4g7S2L0YZPxH0WEZMEqcr3uA/aMT3Qc9zeD5nuOSOWv0raXROnAxeDlsxPPcGLBTkCFzisVIwSdlMfyel7wcJtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199021)(41300700001)(8936002)(110136005)(316002)(5660300002)(31696002)(86362001)(38100700002)(26005)(66946007)(44832011)(8676002)(31686004)(66476007)(66556008)(478600001)(2906002)(83380400001)(6486002)(2616005)(186003)(6512007)(36756003)(55236004)(6506007)(6666004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21sWm55OW12MlhaN1RqMkl6OXNmSXFaRkQxQ0ZyaFpDendoYzk4Rk84STky?=
 =?utf-8?B?Y2RqZmlSUTJCU1hmM0lXbUxhMlRyTlJXN2YyMTBqRE45QWpNdE1weTVPVUtw?=
 =?utf-8?B?M0YybStjQXRPcWpJZU92aXpDU3ljYzhlRHUwRUxBckpEY1RqNUdhQ2tqU0lp?=
 =?utf-8?B?TnFVZFJmaFRweS9qMkRDYSszK050SHMwVy9UZ0plMGdoYTM3dzNkM0laOW5T?=
 =?utf-8?B?eVhnRXUxNFpUVmtMVW9vNnZsbGZiS084WXJBWjRjbzMybnVra2M5dzc4WmRY?=
 =?utf-8?B?S0lnN1BXUkYzSlRFRTNjUjNFdnh5L1FXQXdpTGp4ZFVOTSt6NisyanV3OGlX?=
 =?utf-8?B?ZTA2dFBRaFh1ZlRLa25ESi9LUUdmQTR3VFhYSVFrY0t2SzBWYnFIYnhzMlVk?=
 =?utf-8?B?UUEvejZONFkvWVMxSGtmaU1UaDVFN2hqMU1NTkVTMHBqYXVlWVFWNVQ2cTdl?=
 =?utf-8?B?VHUxdHNFVC9ZMkxHdDZKU0hyMjJhdUZOb0dGa0gvVnNRZ2JZZ0RPUzZ2MkRz?=
 =?utf-8?B?TXB5NGlxVk0wUE1XZlU2YnViMWVOSlJjcEhkbUZ1MWdOK0lSQ0FIMzAwMG4w?=
 =?utf-8?B?a0YzR0ZVMGIwYks3ZUd5Zy9OSnlxaFIwU2ZDWnp2QjhqT09WQnZQZFlabTYw?=
 =?utf-8?B?UVZFQ3lyMVRjVEJmdHM1ejNqR1dCbnJSVFZhbjdwZlBZRmVjcWNpd2I5bUt5?=
 =?utf-8?B?ZUlrRWszWkdtQzA2Tnh6a21TdFE4L3FFdHBiNTY2dm9ULytmMnB2UXJKMWdL?=
 =?utf-8?B?eXkrS0JHRTQxbmdFcDJlcEYzZkR4RlMvWHl3QWxYL1pYQWVrODZJd05ES3V0?=
 =?utf-8?B?YmcwbUJpSXo0UnhrRm1GelNVTDdLUGZaNWhFNE1KZ09yK3RvUXpXaElmazRh?=
 =?utf-8?B?NkwrSWYwR2VScnhxUmk3RjRlYUVJYlVWWDMvSlRid080WVpwTXE1dWwwQ0Uw?=
 =?utf-8?B?VERGRCtoVGlsUFhQaEVDN09NeG1FTlBMWk5OM0lnMUwzSGsyZXAySlhqbGVK?=
 =?utf-8?B?THU4TnZpWjQyNGxLSjBUeWZwazN6RmZEYU5Bc3BNd1ZYUFQvSm5kMXZZNTZl?=
 =?utf-8?B?NmRSSmh1Q3Y1RUY0OGxCR3ZkZnNKY2tzZ0NxU3dCdlAvS1FIVkFqb0ZNcTdj?=
 =?utf-8?B?Y3kyZnZFUzRFaW1zdURQc2hhdXNjSUw3eGhIdUhyWEVhWGczbUpndGV2TGJu?=
 =?utf-8?B?TDVXS1pMZnQ4SUpzd2ZpOE0wU1hRNzlIVW1CQkV6aEVuT2MvMnBPUFVuTXJo?=
 =?utf-8?B?c3hMdnovMDdrQVVYSE8zZHhpQnZtNG5KSWxkVzNHTG1yalc3SXNoc21sbXFO?=
 =?utf-8?B?WmdqYVBNRS9lemxZOVI3OUUrQ0xYd2IvNGZOR0J5bW0rWExwZWVaMDExWDNF?=
 =?utf-8?B?RUM3WXJCMWdEbVZoUnF1WHJUcmVHOHdMaDZJT3dEWWo2UUpDbHRZOW9zYi90?=
 =?utf-8?B?ckNqdG1DR0FDemFzMU1yM2xOTzdEVEgwbkdHQkoxZUlTTlAvbnVWam5TWE1E?=
 =?utf-8?B?WjY2Wi84OE9CM2xONFRUMjZzVlF4OExTR2JqQ0cvNzFCeDNVU210ZDZMck5R?=
 =?utf-8?B?ZVVnSDVPeVluZUpNOVA1bXRuaTdPZzNUZDY5MmFjSkI2eFNJL1FYblBLR2Nv?=
 =?utf-8?B?TUFsMU9lODZLQUFjUTFtbjRYdXFLVmR2TDdHdmg1SXZvdmdlOC9xaklvMFd5?=
 =?utf-8?B?ZkZpQnZPQ1IxY2RKU3k5NDExdGpTY3JzWk1RWWptdlk0SHh5aEEyazI5NVVD?=
 =?utf-8?B?dXpkb29ScFlwMjVGUlI0VUhwbGM2ZlpndVlPRXZhUHRoc1gyYnUwVG9lRFVt?=
 =?utf-8?B?WWVwejc3d2Q4TGhHWGc2MWU5Z0F2bWpMZW9pa3JRWTBNWFRtNGZZaW5teThU?=
 =?utf-8?B?TVJndlhBTDF2ODBQUlRnRjJyTWIwaGh5SmhsK0kvOTh0MGlGSjNRRDA0N20w?=
 =?utf-8?B?aHJyMFJKYXhxaHhGNmZpMkNvMFVsZTNjN0srMXlFWi96a1B5RVUrcUx2aVJ1?=
 =?utf-8?B?RzNLajliV0xFZ0ZpbjF0RmdiRytjNlJaMGFZc2NYNXF5Tk5mODdveDRxczEv?=
 =?utf-8?B?YUR6Yi9kTXc5NnJ2MHBjOXdjbkZsak82TnR6WnR0dWtNTmF2WDVvVnpEcG5P?=
 =?utf-8?Q?gAolJmzBMZji8Y8hOHo77gJj/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e221a7a-e18e-442b-6f4d-08db34c57adf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 04:31:37.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EE+j4wcntX1HkjJG6tfnBOe6YyaFYyI9cds824z4vJHSjJ0OvGE+s7tsSYbpZZ2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8072
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

On 2023-03-28 04:54, Lucas Stach wrote:
> Hi Danilo,
> 
> Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
>> Hi all,
>>
>> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity") 
>> tries to track the accumulated time that a job was active on the GPU 
>> writing it to the entity through which the job was deployed to the 
>> scheduler originally. This is done within drm_sched_get_cleanup_job() 
>> which fetches a job from the schedulers pending_list.
>>
>> Doing this can result in a race condition where the entity is already 
>> freed, but the entity's newly added elapsed_ns field is still accessed 
>> once the job is fetched from the pending_list.
>>
>> After drm_sched_entity_destroy() being called it should be safe to free 
>> the structure that embeds the entity. However, a job originally handed 
>> over to the scheduler by this entity might still reside in the 
>> schedulers pending_list for cleanup after drm_sched_entity_destroy() 
>> already being called and the entity being freed. Hence, we can run into 
>> a UAF.
>>
> Sorry about that, I clearly didn't properly consider this case.
> 
>> In my case it happened that a job, as explained above, was just picked 
>> from the schedulers pending_list after the entity was freed due to the 
>> client application exiting. Meanwhile this freed up memory was already 
>> allocated for a subsequent client applications job structure again. 
>> Hence, the new jobs memory got corrupted. Luckily, I was able to 
>> reproduce the same corruption over and over again by just using 
>> deqp-runner to run a specific set of VK test cases in parallel.
>>
>> Fixing this issue doesn't seem to be very straightforward though (unless 
>> I miss something), which is why I'm writing this mail instead of sending 
>> a fix directly.
>>
>> Spontaneously, I see three options to fix it:
>>
>> 1. Rather than embedding the entity into driver specific structures 
>> (e.g. tied to file_priv) we could allocate the entity separately and 
>> reference count it, such that it's only freed up once all jobs that were 
>> deployed through this entity are fetched from the schedulers pending list.
>>
> My vote is on this or something in similar vain for the long term. I
> have some hope to be able to add a GPU scheduling algorithm with a bit
> more fairness than the current one sometime in the future, which
> requires execution time tracking on the entities.

Danilo,

Using kref is preferable, i.e. option 1 above.

Lucas, can you shed some light on,

1. In what way the current FIFO scheduling is unfair, and
2. shed some details on this "scheduling algorithm with a bit
more fairness than the current one"? 

Regards,
Luben

> 
>> 2. Somehow make sure drm_sched_entity_destroy() does block until all 
>> jobs deployed through this entity were fetched from the schedulers 
>> pending list. Though, I'm pretty sure that this is not really desirable.
>>
>> 3. Just revert the change and let drivers implement tracking of GPU 
>> active times themselves.
>>
> Given that we are already pretty late in the release cycle and etnaviv
> being the only driver so far making use of the scheduler elapsed time
> tracking I think the right short term solution is to either move the
> tracking into etnaviv or just revert the change for now. I'll have a
> look at this.
> 
> Regards,
> Lucas
> 
>> In the case of just reverting the change I'd propose to also set a jobs 
>> entity pointer to NULL  once the job was taken from the entity, such 
>> that in case of a future issue we fail where the actual issue resides 
>> and to make it more obvious that the field shouldn't be used anymore 
>> after the job was taken from the entity.
>>
>> I'm happy to implement the solution we agree on. However, it might also 
>> make sense to revert the change until we have a solution in place. I'm 
>> also happy to send a revert with a proper description of the problem. 
>> Please let me know what you think.
>>
>> - Danilo
>>
> 

