Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75D3BF5DA
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 08:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85AAA6E0A0;
	Thu,  8 Jul 2021 06:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA8EA6E07F;
 Thu,  8 Jul 2021 06:56:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F29P46aJAt9qxXbiu/x7XkqQY7o7OdnTYoHeU2CBs+Lk6i26uFm1U5DQWbiT8+NA4OvLreg42zQzuChsIRV8fTmZU8YsEt3+iZc4bf3kT/qcoxOBfm6JkHtzMQHQ0HZ+wzZKM8B/0v3M/hzTd3K2GhSYb3R8ElV1Q5wuDidomRj8Th0n8ziZdDfxYB7GLOnl/ABGYmSBw3TKHCE0qOi6NMmYjgjqx1BUrgV02Vu8sNRg1/YKwlSS4Fc0tHPeUFqf66bqguQ3la7RJbXg5fjG510J6sU0QXOrN69qudpkgeQaeBdeHLWsBMMpR+3+xashWv90LfaPTD6hSwl8RBZ7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWAxcANHTuYR6ldgJjwoLeY/rPBGP6isuhws0yA/N+M=;
 b=ksES6qxCE9iLigOmLzzM8N37ARaBtAsHY3XPwXCGSJTf14Rz5oyWkXdwSgAoeCX2nOXdYBo8yI0NnAJjpVU3fXF+XKe5ZafMSgadLxG1EE05xpIY0EZynAchTWmuAhACv7TThZiTxqVBNyLeinJUKYgmtoFVc5sICt+TRWDhQwUuAVkYbIuYe14JXRJEAGzqNMcKjmDBW5vcRchA+k/3fA/7irMbLkj7omMVMNJQWaJui/hPLaaSNWNeacFU3YOfhOZ1lAv6dbCjuaqQl+uOO2BvrxZSZZA5fV0grRwq9kp8bayFJeBYXh/eeDK2UXksMJ5iCGKPjv/CQx7TAUi+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWAxcANHTuYR6ldgJjwoLeY/rPBGP6isuhws0yA/N+M=;
 b=SKWLTMZE2vj+taNYLAw24VLpZY6yyOevS7LA1sjGFGrYJpqCPao1QmbnPjHCMG7S1KJOfKSCxF5MJITKjJBtfT0sI5f8aykJSopx+x/GSOgx92RndNjwR3yeiHJl6Ct/vd2XzDrif422fKAJAopwE8rJwoZcM6iwaljfy0Gi+W8=
Authentication-Results: anholt.net; dkim=none (message not signed)
 header.d=none;anholt.net; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Thu, 8 Jul
 2021 06:56:13 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4308.022; Thu, 8 Jul 2021
 06:56:13 +0000
Subject: Re: [PATCH v2 01/11] drm/sched: Split drm_sched_job_init
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210702213815.2249499-1-daniel.vetter@ffwll.ch>
 <20210702213815.2249499-2-daniel.vetter@ffwll.ch>
 <a5c5647e-e0ce-cc6d-c473-685679739051@amd.com>
 <CAKMK7uGTSe9FZCup=6D2G3MWGuxoUiV3Qjau-pQyaqOAX8OTug@mail.gmail.com>
 <8387b5f8-a5f6-fc2d-48e6-4bb0768ac642@amd.com>
 <CAKMK7uFu7V0QzsbMGPJPnMjXOB7FrKB_d+oDwkFMVaEvgy5EOQ@mail.gmail.com>
 <7933a995-0c95-9339-5385-a24681f6df3a@amd.com>
 <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b4824514-4ffd-a5f0-9bbc-d89cdd4e7b50@amd.com>
Date: Thu, 8 Jul 2021 08:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAKMK7uE3bd2whKVBA4uWmzKBp7fjcVKexVFc=TB+ZRxdYT7VNg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3PR09CA0026.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:bc19:c1e3:6307:7e3e]
 (2a02:908:1252:fb60:bc19:c1e3:6307:7e3e) by
 PR3PR09CA0026.eurprd09.prod.outlook.com (2603:10a6:102:b7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Thu, 8 Jul 2021 06:56:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 218a8314-0dba-4716-0d96-08d941dd7975
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946FB980CF72D64DC97957A83199@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZzVGO5siALgo1oEvSoVJYbMmKk7cpk1DsF8+dI+R5SIaGWjMYHePxUPpQXgFNgsA9F5rcq1dOyhGBY1xh8+kFAofimTeOg91PdHY47kXO54jsHX4bfvApMuLUy/Xg4dUI4hsJqSsExU1HVbvEqeX5V48hfWskdXER/vqFRyr8hxrcQ/evs87mL3KMmSNc58UcsRR6jODnq9+z1sKi8o7ct6Q9EkGBlHZjPsmJMvmUncV4rahL/1BTJWhZoZ24SjQl4RKPvRdzX+lyqiAS1BZkP7pxtf7tHJrvPRiKHBWnA4m2s208ZEMZkJ2BFQMN7ClY9LKhxJMXXH7Y4e/WZVpnUEsccmoC1sDysx0d/sbusHJWuClT6cMuC8aMn+uaqnTycMSkdDmV2xNOfAt6nktJysifFASnSw1HzhgFF9JSfRKIjXNjL10FqYS3YKu5yFP+p/3Kf1yGPh3ZAopbTGfrs27KZtl4k+LQT5udGIHh0q7cCgXUJrr5mzOVAh+sQ6boD149NTicG87U7x268BGFtXbHTJVq5W3WM9hCxQiL8ZA6La7zJTVnTdUJmIfbcf5hcT4q8S7tx8aApiPtEkWskvVMWXfDmQRs9dQyPSbaGpfBsaQz47vlwrByK+ZDo/PdtlqvUuCKA0RwNRCO8uIZDAxXk4Q02RWzUr3b6Ysa5w3C44JjErhnlAu+sKFcg1Xx0j/xcCeMPfIzHtGZWA9ajMMbdWaHTeqUdnPrG7KIupmIZd/bqc7g3PtvV++oVSE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6666004)(6486002)(83380400001)(8676002)(54906003)(66946007)(66556008)(66476007)(31686004)(38100700002)(66574015)(498600001)(2906002)(6916009)(31696002)(186003)(86362001)(4326008)(7416002)(2616005)(7406005)(36756003)(30864003)(5660300002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBxOG1leXRwb05vdWh6MWlia3V1UWxpTVlDVDJwb2Q1TjV4Y1pPcjVwcVpv?=
 =?utf-8?B?cmJ4OFZnSnJyc1lZRHVEcUh6cEJHenR4eExtclIxSm9ZMzlUbzhxdUlDd3M5?=
 =?utf-8?B?dk92SEdCdjJ2WGVtUlpHRGgyTkU3dVVPSEs5RU9IdGRJcXBLaXNpMmFDQ1Bt?=
 =?utf-8?B?VWxWTitWZnNIRlhjazIrRWhuL2hnVE1BM2VtOEcvak9CTnQvTG9qK0xmT2pM?=
 =?utf-8?B?L3JtMnhSRlBVc2tGMUJWbm9iT3JxNXhlVXY1WHpxaXZSdDdaUmlVMDI2aHov?=
 =?utf-8?B?eGxRWVI1YmdsNTJXN3hEZThKaDh3MVFNM0JNdXZlN2JOSGZYMld6R1VpQW9I?=
 =?utf-8?B?WWtVWWFVNDNBeGNpaGhpNDd3dCtBaDdvOGR4K1lxUkg1R3FzeWp3bnphTnZD?=
 =?utf-8?B?elFvWk1rZXJScDNkRkIyaFJWQ3lTMzRmQkFqcGJhWnNNMTU4dzVHUkJvcklI?=
 =?utf-8?B?UlZ0a09JWTRkcXgxVkl0WExQWmxhNlJSUWtuaXMrMEFPMkQweERWb0RKeXE4?=
 =?utf-8?B?Y2tOSWZSZmpXVFhhTUd4MFV0VWRQdGNySkVRVEFtaXJGd2t1b3M0STF5N2Yw?=
 =?utf-8?B?MmpsYlRGRUVtSUhwcml3Mklqa3RmTTJPdCtSSlFwYlYySzNMSnZoWGNieVNs?=
 =?utf-8?B?ZUFERGw4N1J4RHJYVWcxck9HU2dTbTVUNUFtYlNjeFNMbEJ0cDQvMERtSHlN?=
 =?utf-8?B?V055TkpLckpYVllXVnlpK2NXTlBpMGljVTJSSlRWTWlxZS9oWDFKTzVoRmNq?=
 =?utf-8?B?d2ZybnZ6ZjVnRjJNZ0YzNkwyOElwK2xDbGpBaGVna3ltYkgwMytnNXJmTXFw?=
 =?utf-8?B?blJ4NnZOMlNrMUc0OElnaTlGWFhXeUFSVlk4ckp1cTRwKzhGd3oxeVloNWhN?=
 =?utf-8?B?dmpmMTVMblVZVVgzeWFyelBGTXNUUDNiOFlBNkIyRTNXV29WSWdqVEVSV1FC?=
 =?utf-8?B?ZDVSYkFhUXpxSUE0Rmw0VkNhVmZ1VnI3TFliTGhVOUpHU3QyazdJTFhsZHdq?=
 =?utf-8?B?c0FzdTllazNUUWtmUWtnYXVqdGg3WmlCcnZITFU2UTVIK3dxWkNway9NWW53?=
 =?utf-8?B?S3IyZjg2Vlp0MC9PWGRlb3p4cnRhNkRSQ1p4THdNNlRBVWJ2eCtIWkdvOUtx?=
 =?utf-8?B?Q3ZNeUVHQmNlVEFROWNmTmdoaFF1cGFvTnNPYTlGUkswZXB1aHp3SCtYb2sx?=
 =?utf-8?B?dWR6bXBDZmt0LzJ5c055V05sd1VYTnRMNDZFMWtHYXZaQStUL0xxOUVPdU9k?=
 =?utf-8?B?UXNMVW4wdTdCdUZOTTJZYVNHelpNV0V2VXNDSWNoZC81ZFFUVEM1ZGFSVkJJ?=
 =?utf-8?B?YVlIUjN6MWw2QWxHL1V5QW1jQ2lvSXVIa09VSm5PK0pza01FSFZoRTM3UGJX?=
 =?utf-8?B?bm1rekliellPWUZRS2kvS0Nnb3dSMUhFUXZSTURlSzRJSGlkbFh1RDlCdVR5?=
 =?utf-8?B?RjBVeExRbDZzd0VpOW9wVnI1SzlmMGNIQmlUYklDd2xnNEJ1NFlaai9TSTFh?=
 =?utf-8?B?d0NTcmRaSDUvQlA0U3VLcDNtK0JHZUJJQ2lma01tSXlaNytuTEl2Nit6WWRX?=
 =?utf-8?B?TVFkTmlwMXlMWmxoK0x2cmlpMkh1OU1wZTdMblROeElRUkN6R0ZDSTBYaXZ5?=
 =?utf-8?B?S2ZZZmdhQlc4N0EyZEJzRzJrSHRYUzFJcXhPN3RUMmhYaHU1dXNlU2RhNTFZ?=
 =?utf-8?B?Ky9nZzJqU0x1WlJNZEV3VHdKZGdXdmFCTXFPenBGaG91R0dFVERGWVNoL0hK?=
 =?utf-8?B?V2FkWXFwWXJTWjdiNjc4N25jQ0hXeHozS2RqKzZwdTVsL1kzeE5QdXlLb1hL?=
 =?utf-8?B?S0dCZ1VRS1l2N2J4MVMrQS9pc2dGc3l3UUtHb3hFaExRWFpJSysrVkxGOEdH?=
 =?utf-8?Q?p+0qozmz41ylx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218a8314-0dba-4716-0d96-08d941dd7975
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 06:56:13.4166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXBUHkJ1Mq8PlBwwa/zU1+Qxer7NFG7DHImV8qnrfXqeGt1te7m3Qj8lSZBHJ3qv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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
Cc: Emma Anholt <emma@anholt.net>, Adam Borowski <kilobyte@angband.pl>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sonny Jiang <sonny.jiang@amd.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Lee Jones <lee.jones@linaro.org>,
 Jack Zhang <Jack.Zhang1@amd.com>, lima@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Steven Price <steven.price@arm.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Dave Airlie <airlied@redhat.com>,
 Dennis Li <Dennis.Li@amd.com>, Chen Li <chenli@uniontech.com>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Kees Cook <keescook@chromium.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Kevin Wang <kevin1.wang@amd.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Nick Terrell <terrelln@fb.com>, Deepak R Varma <mh12gx2825@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.07.21 um 18:32 schrieb Daniel Vetter:
> On Wed, Jul 7, 2021 at 2:58 PM Christian König <christian.koenig@amd.com> wrote:
>> Am 07.07.21 um 14:13 schrieb Daniel Vetter:
>>> On Wed, Jul 7, 2021 at 1:57 PM Christian König <christian.koenig@amd.com> wrote:
>>>> Am 07.07.21 um 13:14 schrieb Daniel Vetter:
>>>>> On Wed, Jul 7, 2021 at 11:30 AM Christian König
>>>>> <christian.koenig@amd.com> wrote:
>>>>>> Am 02.07.21 um 23:38 schrieb Daniel Vetter:
>>>>>>> This is a very confusingly named function, because not just does it
>>>>>>> init an object, it arms it and provides a point of no return for
>>>>>>> pushing a job into the scheduler. It would be nice if that's a bit
>>>>>>> clearer in the interface.
>>>>>>>
>>>>>>> But the real reason is that I want to push the dependency tracking
>>>>>>> helpers into the scheduler code, and that means drm_sched_job_init
>>>>>>> must be called a lot earlier, without arming the job.
>>>>>>>
>>>>>>> v2:
>>>>>>> - don't change .gitignore (Steven)
>>>>>>> - don't forget v3d (Emma)
>>>>>>>
>>>>>>> v3: Emma noticed that I leak the memory allocated in
>>>>>>> drm_sched_job_init if we bail out before the point of no return in
>>>>>>> subsequent driver patches. To be able to fix this change
>>>>>>> drm_sched_job_cleanup() so it can handle being called both before and
>>>>>>> after drm_sched_job_arm().
>>>>>> Thinking more about this, I'm not sure if this really works.
>>>>>>
>>>>>> See drm_sched_job_init() was also calling drm_sched_entity_select_rq()
>>>>>> to update the entity->rq association.
>>>>>>
>>>>>> And that can only be done later on when we arm the fence as well.
>>>>> Hm yeah, but that's a bug in the existing code I think: We already
>>>>> fail to clean up if we fail to allocate the fences. So I think the
>>>>> right thing to do here is to split the checks into job_init, and do
>>>>> the actual arming/rq selection in job_arm? I'm not entirely sure
>>>>> what's all going on there, the first check looks a bit like trying to
>>>>> schedule before the entity is set up, which is a driver bug and should
>>>>> have a WARN_ON?
>>>> No you misunderstood me, the problem is something else.
>>>>
>>>> You asked previously why the call to drm_sched_job_init() was so late in
>>>> the CS.
>>>>
>>>> The reason for this was not alone the scheduler fence init, but also the
>>>> call to drm_sched_entity_select_rq().
>>> Ah ok, I think I can fix that. Needs a prep patch to first make
>>> drm_sched_entity_select infallible, then should be easy to do.
>>>
>>>>> The 2nd check around last_scheduled I have honeslty no idea what it's
>>>>> even trying to do.
>>>> You mean that here?
>>>>
>>>>            fence = READ_ONCE(entity->last_scheduled);
>>>>            if (fence && !dma_fence_is_signaled(fence))
>>>>                    return;
>>>>
>>>> This makes sure that load balancing is not moving the entity to a
>>>> different scheduler while there are still jobs running from this entity
>>>> on the hardware,
>>> Yeah after a nap that idea crossed my mind too. But now I have locking
>>> questions, afaiui the scheduler thread updates this, without taking
>>> any locks - entity dequeuing is lockless. And here we read the fence
>>> and then seem to yolo check whether it's signalled? What's preventing
>>> a use-after-free here? There's no rcu or anything going on here at
>>> all, and it's outside of the spinlock section, which starts a bit
>>> further down.
>> The last_scheduled fence of an entity can only change when there are
>> jobs on the entities queued, and we have just ruled that out in the
>> check before.
> There aren't any barriers, so the cpu could easily run the two checks
> the other way round. I'll ponder this and figure out where exactly we
> need docs for the constraint and/or barriers to make this work as
> intended. As-is I'm not seeing how it does ...

spsc_queue_count() provides the necessary barrier with the atomic_read().

But yes a comment would be really nice here. I had to think for a while 
why we don't need this as well.

Christian.

> -Daniel
>
>> Christian.
>>
>>
>>> -Daniel
>>>
>>>> Regards
>>>> Christian.
>>>>
>>>>> -Daniel
>>>>>
>>>>>> Christian.
>>>>>>
>>>>>>> Also improve the kerneldoc for this.
>>>>>>>
>>>>>>> Acked-by: Steven Price <steven.price@arm.com> (v2)
>>>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>>>> Cc: Lucas Stach <l.stach@pengutronix.de>
>>>>>>> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
>>>>>>> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
>>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>>>> Cc: Rob Herring <robh@kernel.org>
>>>>>>> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
>>>>>>> Cc: Steven Price <steven.price@arm.com>
>>>>>>> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>>>>> Cc: David Airlie <airlied@linux.ie>
>>>>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>>>>>> Cc: Kees Cook <keescook@chromium.org>
>>>>>>> Cc: Adam Borowski <kilobyte@angband.pl>
>>>>>>> Cc: Nick Terrell <terrelln@fb.com>
>>>>>>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>>>>>>> Cc: Paul Menzel <pmenzel@molgen.mpg.de>
>>>>>>> Cc: Sami Tolvanen <samitolvanen@google.com>
>>>>>>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>>> Cc: Dave Airlie <airlied@redhat.com>
>>>>>>> Cc: Nirmoy Das <nirmoy.das@amd.com>
>>>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>>>> Cc: Lee Jones <lee.jones@linaro.org>
>>>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>>>> Cc: "Marek Olšák" <marek.olsak@amd.com>
>>>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>>>>> Cc: Sonny Jiang <sonny.jiang@amd.com>
>>>>>>> Cc: Boris Brezillon <boris.brezillon@collabora.com>
>>>>>>> Cc: Tian Tao <tiantao6@hisilicon.com>
>>>>>>> Cc: Jack Zhang <Jack.Zhang1@amd.com>
>>>>>>> Cc: etnaviv@lists.freedesktop.org
>>>>>>> Cc: lima@lists.freedesktop.org
>>>>>>> Cc: linux-media@vger.kernel.org
>>>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>>>> Cc: Emma Anholt <emma@anholt.net>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 ++
>>>>>>>      drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 ++
>>>>>>>      drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 ++
>>>>>>>      drivers/gpu/drm/lima/lima_sched.c        |  2 ++
>>>>>>>      drivers/gpu/drm/panfrost/panfrost_job.c  |  2 ++
>>>>>>>      drivers/gpu/drm/scheduler/sched_entity.c |  6 ++--
>>>>>>>      drivers/gpu/drm/scheduler/sched_fence.c  | 17 +++++----
>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c   | 46 +++++++++++++++++++++---
>>>>>>>      drivers/gpu/drm/v3d/v3d_gem.c            |  2 ++
>>>>>>>      include/drm/gpu_scheduler.h              |  7 +++-
>>>>>>>      10 files changed, 74 insertions(+), 14 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> index c5386d13eb4a..a4ec092af9a7 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>>> @@ -1226,6 +1226,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>>>>>>>          if (r)
>>>>>>>                  goto error_unlock;
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>> +
>>>>>>>          /* No memory allocation is allowed while holding the notifier lock.
>>>>>>>           * The lock is held until amdgpu_cs_submit is finished and fence is
>>>>>>>           * added to BOs.
>>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> index d33e6d97cc89..5ddb955d2315 100644
>>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>>>>>> @@ -170,6 +170,8 @@ int amdgpu_job_submit(struct amdgpu_job *job, struct drm_sched_entity *entity,
>>>>>>>          if (r)
>>>>>>>                  return r;
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>> +
>>>>>>>          *f = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>          amdgpu_job_free_resources(job);
>>>>>>>          drm_sched_entity_push_job(&job->base, entity);
>>>>>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> index feb6da1b6ceb..05f412204118 100644
>>>>>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>>>>>> @@ -163,6 +163,8 @@ int etnaviv_sched_push_job(struct drm_sched_entity *sched_entity,
>>>>>>>          if (ret)
>>>>>>>                  goto out_unlock;
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&submit->sched_job);
>>>>>>> +
>>>>>>>          submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>>>>>          submit->out_fence_id = idr_alloc_cyclic(&submit->gpu->fence_idr,
>>>>>>>                                                  submit->out_fence, 0,
>>>>>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> index dba8329937a3..38f755580507 100644
>>>>>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>>>>>> @@ -129,6 +129,8 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>>>>>                  return err;
>>>>>>>          }
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&task->base);
>>>>>>> +
>>>>>>>          task->num_bos = num_bos;
>>>>>>>          task->vm = lima_vm_get(vm);
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> index 71a72fb50e6b..2992dc85325f 100644
>>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>>>>>> @@ -288,6 +288,8 @@ int panfrost_job_push(struct panfrost_job *job)
>>>>>>>                  goto unlock;
>>>>>>>          }
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>> +
>>>>>>>          job->render_done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>
>>>>>>>          ret = panfrost_acquire_object_fences(job->bos, job->bo_count,
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> index 79554aa4dbb1..f7347c284886 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>>> @@ -485,9 +485,9 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>>>>>       * @sched_job: job to submit
>>>>>>>       * @entity: scheduler entity
>>>>>>>       *
>>>>>>> - * Note: To guarantee that the order of insertion to queue matches
>>>>>>> - * the job's fence sequence number this function should be
>>>>>>> - * called with drm_sched_job_init under common lock.
>>>>>>> + * Note: To guarantee that the order of insertion to queue matches the job's
>>>>>>> + * fence sequence number this function should be called with drm_sched_job_arm()
>>>>>>> + * under common lock.
>>>>>>>       *
>>>>>>>       * Returns 0 for success, negative error code otherwise.
>>>>>>>       */
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> index 69de2c76731f..c451ee9a30d7 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>>> @@ -90,7 +90,7 @@ static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>>>>>>>       *
>>>>>>>       * Free up the fence memory after the RCU grace period.
>>>>>>>       */
>>>>>>> -static void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu)
>>>>>>>      {
>>>>>>>          struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>>>>>>>          struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>>>>> @@ -152,11 +152,10 @@ struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f)
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL(to_drm_sched_fence);
>>>>>>>
>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>> -                                            void *owner)
>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>>> +                                           void *owner)
>>>>>>>      {
>>>>>>>          struct drm_sched_fence *fence = NULL;
>>>>>>> -     unsigned seq;
>>>>>>>
>>>>>>>          fence = kmem_cache_zalloc(sched_fence_slab, GFP_KERNEL);
>>>>>>>          if (fence == NULL)
>>>>>>> @@ -166,13 +165,19 @@ struct drm_sched_fence *drm_sched_fence_create(struct drm_sched_entity *entity,
>>>>>>>          fence->sched = entity->rq->sched;
>>>>>>>          spin_lock_init(&fence->lock);
>>>>>>>
>>>>>>> +     return fence;
>>>>>>> +}
>>>>>>> +
>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>> +                       struct drm_sched_entity *entity)
>>>>>>> +{
>>>>>>> +     unsigned seq;
>>>>>>> +
>>>>>>>          seq = atomic_inc_return(&entity->fence_seq);
>>>>>>>          dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>>>                         &fence->lock, entity->fence_context, seq);
>>>>>>>          dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>>>                         &fence->lock, entity->fence_context + 1, seq);
>>>>>>> -
>>>>>>> -     return fence;
>>>>>>>      }
>>>>>>>
>>>>>>>      module_init(drm_sched_fence_slab_init);
>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> index 33c414d55fab..5e84e1500c32 100644
>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>> @@ -48,9 +48,11 @@
>>>>>>>      #include <linux/wait.h>
>>>>>>>      #include <linux/sched.h>
>>>>>>>      #include <linux/completion.h>
>>>>>>> +#include <linux/dma-resv.h>
>>>>>>>      #include <uapi/linux/sched/types.h>
>>>>>>>
>>>>>>>      #include <drm/drm_print.h>
>>>>>>> +#include <drm/drm_gem.h>
>>>>>>>      #include <drm/gpu_scheduler.h>
>>>>>>>      #include <drm/spsc_queue.h>
>>>>>>>
>>>>>>> @@ -569,7 +571,6 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>
>>>>>>>      /**
>>>>>>>       * drm_sched_job_init - init a scheduler job
>>>>>>> - *
>>>>>>>       * @job: scheduler job to init
>>>>>>>       * @entity: scheduler entity to use
>>>>>>>       * @owner: job owner for debugging
>>>>>>> @@ -577,6 +578,9 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
>>>>>>>       * Refer to drm_sched_entity_push_job() documentation
>>>>>>>       * for locking considerations.
>>>>>>>       *
>>>>>>> + * Drivers must make sure drm_sched_job_cleanup() if this function returns
>>>>>>> + * successfully, even when @job is aborted before drm_sched_job_arm() is called.
>>>>>>> + *
>>>>>>>       * Returns 0 for success, negative error code otherwise.
>>>>>>>       */
>>>>>>>      int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>> @@ -594,7 +598,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>          job->sched = sched;
>>>>>>>          job->entity = entity;
>>>>>>>          job->s_priority = entity->rq - sched->sched_rq;
>>>>>>> -     job->s_fence = drm_sched_fence_create(entity, owner);
>>>>>>> +     job->s_fence = drm_sched_fence_alloc(entity, owner);
>>>>>>>          if (!job->s_fence)
>>>>>>>                  return -ENOMEM;
>>>>>>>          job->id = atomic64_inc_return(&sched->job_id_count);
>>>>>>> @@ -606,13 +610,47 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>      EXPORT_SYMBOL(drm_sched_job_init);
>>>>>>>
>>>>>>>      /**
>>>>>>> - * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>> + * drm_sched_job_arm - arm a scheduler job for execution
>>>>>>> + * @job: scheduler job to arm
>>>>>>> + *
>>>>>>> + * This arms a scheduler job for execution. Specifically it initializes the
>>>>>>> + * &drm_sched_job.s_fence of @job, so that it can be attached to struct dma_resv
>>>>>>> + * or other places that need to track the completion of this job.
>>>>>>> + *
>>>>>>> + * Refer to drm_sched_entity_push_job() documentation for locking
>>>>>>> + * considerations.
>>>>>>>       *
>>>>>>> + * This can only be called if drm_sched_job_init() succeeded.
>>>>>>> + */
>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job)
>>>>>>> +{
>>>>>>> +     drm_sched_fence_init(job->s_fence, job->entity);
>>>>>>> +}
>>>>>>> +EXPORT_SYMBOL(drm_sched_job_arm);
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * drm_sched_job_cleanup - clean up scheduler job resources
>>>>>>>       * @job: scheduler job to clean up
>>>>>>> + *
>>>>>>> + * Cleans up the resources allocated with drm_sched_job_init().
>>>>>>> + *
>>>>>>> + * Drivers should call this from their error unwind code if @job is aborted
>>>>>>> + * before drm_sched_job_arm() is called.
>>>>>>> + *
>>>>>>> + * After that point of no return @job is committed to be executed by the
>>>>>>> + * scheduler, and this function should be called from the
>>>>>>> + * &drm_sched_backend_ops.free_job callback.
>>>>>>>       */
>>>>>>>      void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>>>>>      {
>>>>>>> -     dma_fence_put(&job->s_fence->finished);
>>>>>>> +     if (!kref_read(&job->s_fence->finished.refcount)) {
>>>>>>> +             /* drm_sched_job_arm() has been called */
>>>>>>> +             dma_fence_put(&job->s_fence->finished);
>>>>>>> +     } else {
>>>>>>> +             /* aborted job before committing to run it */
>>>>>>> +             drm_sched_fence_free(&job->s_fence->finished.rcu);
>>>>>>> +     }
>>>>>>> +
>>>>>>>          job->s_fence = NULL;
>>>>>>>      }
>>>>>>>      EXPORT_SYMBOL(drm_sched_job_cleanup);
>>>>>>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>> index 4eb354226972..5c3a99027ecd 100644
>>>>>>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>>>>>>> @@ -475,6 +475,8 @@ v3d_push_job(struct v3d_file_priv *v3d_priv,
>>>>>>>          if (ret)
>>>>>>>                  return ret;
>>>>>>>
>>>>>>> +     drm_sched_job_arm(&job->base);
>>>>>>> +
>>>>>>>          job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>>>>>
>>>>>>>          /* put by scheduler job completion */
>>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>>> index 88ae7f331bb1..83afc3aa8e2f 100644
>>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>>> @@ -348,6 +348,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>>>>>      int drm_sched_job_init(struct drm_sched_job *job,
>>>>>>>                         struct drm_sched_entity *entity,
>>>>>>>                         void *owner);
>>>>>>> +void drm_sched_job_arm(struct drm_sched_job *job);
>>>>>>>      void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>>>>>>                                      struct drm_gpu_scheduler **sched_list,
>>>>>>>                                         unsigned int num_sched_list);
>>>>>>> @@ -387,8 +388,12 @@ void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>>>>>>>                                     enum drm_sched_priority priority);
>>>>>>>      bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
>>>>>>>
>>>>>>> -struct drm_sched_fence *drm_sched_fence_create(
>>>>>>> +struct drm_sched_fence *drm_sched_fence_alloc(
>>>>>>>          struct drm_sched_entity *s_entity, void *owner);
>>>>>>> +void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>> +                       struct drm_sched_entity *entity);
>>>>>>> +void drm_sched_fence_free(struct rcu_head *rcu);
>>>>>>> +
>>>>>>>      void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>>>>>>>      void drm_sched_fence_finished(struct drm_sched_fence *fence);
>>>>>>>
>

