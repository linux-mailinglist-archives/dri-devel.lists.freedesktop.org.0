Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214F529F62
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 12:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B982310F563;
	Tue, 17 May 2022 10:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15D010F7BB
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 10:28:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TV4wDUWzrw2yNBKhl4yKHXf4FI74H/bNqbYWZUfyQj4YqHFBNycxciJoa6XWXM1wK5rYNmayL9ilZu6mLYIeY3QfqmGAMUTI+MPBjRYCx+1IhquXtTF31WQ96LQxHMw7HdbUDOxmvq7rzFhEzI/0pBr4TxYsKa1LxVqimWRr7ug1AyJi3H/oZ+cR4nwi0dMiO1+J+jhCYRlCGTz57mWRabDOz0YIzHhdFBAff/AoWPa5A6FgINvDaeDGAqzMw7PzFEOjckFsjagLCrUITlrTjcfdqxv3/eoKs4hCTzhO37RKWdLPhv9edkC+Zsja1A/C3GIayuAQpM81kvpbDOFo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0ivsWog2EmFbn6oPyW6bRN75ury/1332yOzmq7q6CY=;
 b=GLikXK4/uzz7V0PHWYEgCO5wsqiztGGPqiSORMpop0K8EUyD3L87piD5zkDo5fmKujxeUKMXktUVx0XbE0nn3P5t1PA9CkgZZxw4BNOP43kI5MlmjDdxlXhnfctvhzeSDqnhvnNKrirNN5sP8UdkwqdHp2OwUUumOVpM4/6+Di4Sw28VoiWvICtBVvT87vx+kGOr3jkusNhjLQQ7dF34vpZ0Ycsg6yc5ANY8J+l9Y4yC1m7v8yrv1hUJUNQU/r854ChY+e5l1yUJiFR+5ZCFYuxSzzYq+C0RxDOhzAL9ntqm9Imm3BUzlItYITW5apAHMtSU5Gh+aR/AVXx6JhHwNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0ivsWog2EmFbn6oPyW6bRN75ury/1332yOzmq7q6CY=;
 b=y3qJuGm5BUBmdD84bqPvW9UrS/UXGb3P8kP83jHuzhqc+oJ13KEbOsiWxQBerdfSABaCebZN9mgd4HSzhE5oAOMcaKmVw3RMTjWfpQdQLw1zV/yc8ON3iMYM/xk/EPShcH051askHZyYUuGOGwBJrCw7uip1ZNXTHrUKaWn/sX8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1495.namprd12.prod.outlook.com (2603:10b6:910:e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Tue, 17 May
 2022 10:28:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7146:65ee:8fd3:dd03%4]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 10:28:24 +0000
Message-ID: <a249c0c4-ee6c-bfb0-737b-eb6afae29602@amd.com>
Date: Tue, 17 May 2022 12:28:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Tackling the indefinite/user DMA fence problem
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220502163722.3957-1-christian.koenig@amd.com>
 <YnJQs1iusrBvpuMs@phenom.ffwll.local>
 <a01c7703-f7f7-f8ce-f80e-632a6fdcbbbe@gmail.com>
 <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Ynkg81p6ADyZBa/L@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a7cb83a-0339-477f-479a-08da37eff928
X-MS-TrafficTypeDiagnostic: CY4PR12MB1495:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1495005AE825314F923D984F83CE9@CY4PR12MB1495.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4522vSlcgdxdsdqriF7s9LYCisJTzxHC7qK65SFWXcFzHQDLA0Njq8gc6HKteIrOEsM2QOPC96+msa5D1M8eM1eOCEk2sKsZLnCe1DaZ0EAUbbeudrJdbGjJG91Tg55Vn4FDPE//BJo2cU0XjbWQWNfG6bWwbAGre/7vnMzz04zKU3ytsfMYiouJrBcSo68dwWERJ8dmeyw/VFbdqvmKar1VIMgtLR6CuEh4JE7f+GHypZ38vLZMDrbj8SbZA+qGctumXOLf2AaS2yFPWaRd6JOQab092ysdau1vwHq6k0A7S2Chf7a3Y1W7yc35uuc4HJhSbGHRm6Fm9dHwpZVc005zuR2w0uomjWpnxKpUJCq/b9yqmPL6WGcsl8NC7PSrHYrR/mwfJCQHf9EXjVVzaWwiQ3KkTS1I7YYzE9Bds6KLIWvQikt4MEAGdT0IXCJoMiEBiqLAINF05AzMayNc717KU+3aFwoVR0PRNZCvrzazCigElHtIhz7Upnpl7qVB4aDgqOr2fG5aHWh8m5H+1gSROl8IjrTIDpq9V7rJjQHqZLVvPenqj4COr/EriBgPGuyiSxqPTBB8v/GWMYbpCAmukU/grU/AGRYZgM0ZQqJAr0+cXOBcmSP6a/1obMjArcg3bzRdK+9J56MCipElLj/cNNRq6NdPJV/H3/fHsL+kxMFsfVhh62yikOyeB5LozsmkwPkKF60EeYFGjggZz2RobakcOAbCoPBeYfKLbwcOEeywGedIYjhpHEddZQyvJwkE9jwjd4fz3iEVoh1JwJk/9Fkxj8g+IeHNSgfOtKCAv1LyYsKiGWNGlUYoBV0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31686004)(66574015)(2906002)(186003)(66946007)(8936002)(6666004)(83380400001)(66556008)(6486002)(316002)(966005)(26005)(4326008)(38100700002)(36756003)(8676002)(2616005)(5660300002)(30864003)(6916009)(6512007)(6506007)(7416002)(31696002)(66476007)(86362001)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkFHeGJCUC9UOWVDRTRvUmJiUVBMN0tMOWZVN0s5Q0FJWVVvdVRCNzNFSTUv?=
 =?utf-8?B?OCtZV0tva0dYNVFHUitxQ09udFZBRXZFejZZQ2o0UWJ5M3ViREhLMUV4bHpE?=
 =?utf-8?B?d3g2MlpQM1JMaVpsekswR3ZybmYvenk2cGp4aElvVWE5NFNTSzQ0dkZxVEVZ?=
 =?utf-8?B?bDJINUc0dmIyMzk5TDRmMUw5Rk9YOW1GeWNxNWp2RVlpbFdUQXp2YXYxRXpI?=
 =?utf-8?B?ODJhODFVeEVsYzE4UGN2SitxR2h4YXRrU0J5Ym9qaHliQStVbTJXZGhKVXJH?=
 =?utf-8?B?Qng1OGdvR0dtWVpkelA4K2R1MGdUUjl5d1RHOSs5cDdvUzQ0SFg2dzF6eUR3?=
 =?utf-8?B?c1pvNGNxSU5zS21KSFRmc2tzYWdXRmZyT1NzQzI5dlk2eC9oWmN6RERrQTQ1?=
 =?utf-8?B?S2lQMVE0eHlxaFQ4dFUxWmRtT1RZOFI2NWRFd3Ztc0JmTXdidTZrY29IWUla?=
 =?utf-8?B?aldKYWhLOGErQkFuK0dtdHlYQ2NZSjJHZ2pqY2R2cHBqNUZ0eEYwdnpTMjFP?=
 =?utf-8?B?T0t5dTJvQlJsbzhKbUNuc0xuMWhsdGptdmROaW1YdzdPdHJ4eG95Vk1oelQ3?=
 =?utf-8?B?czRkaklwRHQvRjZuUTB2dEVQRXpBZ0xOZ1RHOURiUFEyU2RtQ3pJSHBnbzlE?=
 =?utf-8?B?eEhnT1ZPcHd0azk1TlcxdVVUajV5UzNMc1JVcjFweDRiYmg0Y3hqM01nTXZN?=
 =?utf-8?B?YVFGV1J3OWVyb29EejYrSk1OOENPL3hCN0JDdVBUUk9MZnNwZ25CY1pEWG52?=
 =?utf-8?B?VmFHdzhHR1BnTmZiSFJiTmxxR2lyREgvcTB6WVdGSlFVNllZTXpqRXNkVXlu?=
 =?utf-8?B?MFJEMDRKaG9VY3g0N3NOUnd3U2VrYXFrQ1ZYNk5QMzdLaEdQZGVIWFBHdk1H?=
 =?utf-8?B?RmZCcm82Tk1VaGpwbzhsYTlHRlA0QjhFS2w3SUlKV3huTW5FUllDbjRGZkFC?=
 =?utf-8?B?a1RTanpBazl5S0JXczViSjN5a0xnWU5NV01CZVRCUWpueFJwRkVGZktyNEJE?=
 =?utf-8?B?MWZUaWwzc0lVVnN2SDNXc2c0Z0c1M2pLRmZuZEo0bE5TRkc2aElWRmVZNDRq?=
 =?utf-8?B?MnB3a05Qcit3aW5VRlRjUkhLeDBOQVR6d0tqWEZpRGdEYWUvTC9CRE1XTWRz?=
 =?utf-8?B?WTBUc2NHYzFTeWhpL2J3Z3VXTGVsRWNzaU5hWTd1ZjZHRHQzNHVWa093Q0ta?=
 =?utf-8?B?TW1mblltZXhjQUdHNEd2UmJtK0lTVjRUZnptQVRsc1paclRYNXVocVhVQmt6?=
 =?utf-8?B?MVBQS3IvTHBUSklZbklFZEI2d2dTc1l5aFg4WnBMNlpLd1NhcFZOTDZBTGpU?=
 =?utf-8?B?aCtmdGJQU2NUa09hZTRQeElRM2txbWJEKzEzRnVXNVRlVUIvL3Voc1d3cnps?=
 =?utf-8?B?SFkyV09aRlJ4N2RWSllFRkd1R2ZLMm1SL2hpUkFScWRzK05ZRE5MYUFoa0xY?=
 =?utf-8?B?K2ZUdHVzM2d0NXN0Q1hjU2tEeWF3akNXdERmUEZHQi9mblpBdUVHdXpseUFZ?=
 =?utf-8?B?dTdvMmdFczdrNmVkVmdRK0gwWTdyaFdBUndMQndSNDBZd2NaL2czSFc4cEpQ?=
 =?utf-8?B?OEFMNjk0KzNmQTFRNDUvK2t0NnlySVgvME40R01wTVlTU2NBdHdweDZqcUJo?=
 =?utf-8?B?OWthd0g4OFU1ZCtxVTJSRExKUGo5S2djRmVvUnhiY1RwcVB3b0daUTFOb3ZO?=
 =?utf-8?B?dzFLSmhzYStIWWg3VGVrWHhTdUE2cnpwcmZUMXRaRHlLUTY5MHU4K2VyTEpn?=
 =?utf-8?B?RTBMSG91eFhRdFcxbUYrdHZxOGN0VXR2RzB0SkVKb2E1SER5eUplUzQzZktS?=
 =?utf-8?B?MjVYRUpoZ3hLZExDd0x4TWVsdGtQdnpkckJ0d1krbHZCd0ZicVErTUVicVRs?=
 =?utf-8?B?bWhQUnJBOCtyc0ZkOFp2azRJeXZDUUp5dW1US0NOZHY4aUFWNzdqYkVVa3Nk?=
 =?utf-8?B?QkovSVlDNHRyZkZCcnVzeE9kSkgyOU9EQnZNNFpVZDlqRFArdVo5RlNVS1dT?=
 =?utf-8?B?c1oyV2dsdHhZVVQ0eDRWSjk0SzZmSGZ5SEw1Tk55UWVHdlloVTBFYVBrRHA1?=
 =?utf-8?B?TGphTFRrOUpTcUVzRjVGWEl0RkdxUUwrN0w3SUFXLytMNElYUXI0U2xtd0l6?=
 =?utf-8?B?aDE1THdSVlJJQlVRRVhnWGx1Mjd1cXFCME1IV0tydVJuclRNRDhHb2d5em95?=
 =?utf-8?B?K3BxZ0h6VFhzNDZYQ2NaQWlzenJ1bE80R2FOczk3U1o3MEd4QU91dmZRczRo?=
 =?utf-8?B?WTFqMkdHZTBpQk5wWDBSTnczMWVIbmNHczhyYVRRZ2pMZjRaeGQ0TzdnNEZu?=
 =?utf-8?B?SU8yaWNBT3ZYdk94Zy9wQW9PQ3JXYmdJZ0N2M043QWliMW8zU3F6QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a7cb83a-0339-477f-479a-08da37eff928
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 10:28:24.7755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMJBpKqFNdPidC1+8mAwGcLUOZmGY06d7gdq2O+UwV0WkkBWzrjZfmtG1IQYqFoO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1495
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
Cc: tvrtko.ursulin@linux.intel.com, sergemetral@google.com, tzimmermann@suse.de,
 gustavo@padovan.org, Felix.Kuehling@amd.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 maad.aldabagh@amd.com, jason@jlekstrand.net, alexander.deucher@amd.com,
 skhawaja@google.com, sumit.semwal@linaro.org, daniels@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.05.22 um 16:10 schrieb Daniel Vetter:
> On Mon, May 09, 2022 at 08:56:41AM +0200, Christian König wrote:
>> Am 04.05.22 um 12:08 schrieb Daniel Vetter:
>>> On Mon, May 02, 2022 at 06:37:07PM +0200, Christian König wrote:
>>>> Hello everyone,
>>>>
>>>> it's a well known problem that the DMA-buf subsystem mixed
>>>> synchronization and memory management requirements into the same
>>>> dma_fence and dma_resv objects. Because of this dma_fence objects need
>>>> to guarantee that they complete within a finite amount of time or
>>>> otherwise the system can easily deadlock.
>>>>
>>>> One of the few good things about this problem is that it is really good
>>>> understood by now.
>>>>
>>>> Daniel and others came up with some documentation:
>>>> https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html?highlight=dma_buf#indefinite-dma-fences
>>>>
>>>> And Jason did an excellent presentation about that problem on last years
>>>> LPC: https://lpc.events/event/11/contributions/1115/
>>>>
>>>> Based on that we had been able to reject new implementations of
>>>> infinite/user DMA fences and mitigate the effect of the few existing
>>>> ones.
>>>>
>>>> The still remaining down side is that we don't have a way of using user
>>>> fences as dependency in both the explicit (sync_file, drm_syncobj) as
>>>> well as the implicit (dma_resv) synchronization objects, resulting in
>>>> numerous problems and limitations for things like HMM, user queues
>>>> etc....
>>>>
>>>> This patch set here now tries to tackle this problem by untangling the
>>>> synchronization from the memory management. What it does *not* try to do
>>>> is to fix the existing kernel fences, because I think we now can all
>>>> agree on that this isn't really possible.
>>>>
>>>> To archive this goal what I do in this patch set is to add some parallel
>>>> infrastructure to cleanly separate normal kernel dma_fence objects from
>>>> indefinite/user fences:
>>>>
>>>> 1. It introduce a DMA_FENCE_FLAG_USER define (after renaming some
>>>> existing driver defines). To note that a certain dma_fence is an user
>>>> fence and *must* be ignore by memory management and never used as
>>>> dependency for normal none user dma_fence objects.
>>>>
>>>> 2. The dma_fence_array and dma_fence_chain containers are modified so
>>>> that they are marked as user fences whenever any of their contained
>>>> fences are an user fence.
>>>>
>>>> 3. The dma_resv object gets a new DMA_RESV_USAGE_USER flag which must be
>>>> used with indefinite/user fences and separates those into it's own
>>>> synchronization domain.
>>>>
>>>> 4. The existing dma_buf_poll_add_cb() function is modified so that
>>>> indefinite/user fences are included in the polling.
>>>>
>>>> 5. The sync_file synchronization object is modified so that we
>>>> essentially have two fence streams instead of just one.
>>>>
>>>> 6. The drm_syncobj is modified in a similar way. User fences are just
>>>> ignored unless the driver explicitly states support to wait for them.
>>>>
>>>> 7. The DRM subsystem gains a new DRIVER_USER_FENCE flag which drivers
>>>> can use to indicate the need for user fences. If user fences are used
>>>> the atomic mode setting starts to support user fences as IN/OUT fences.
>>>>
>>>> 8. Lockdep is used at various critical locations to ensure that nobody
>>>> ever tries to mix user fences with non user fences.
>>>>
>>>> The general approach is to just ignore user fences unless a driver
>>>> stated explicitely support for them.
>>>>
>>>> On top of all of this I've hacked amdgpu so that we add the resulting CS
>>>> fence only as kernel dependency to the dma_resv object and an additional
>>>> wrapped up with a dma_fence_array and a stub user fence.
>>>>
>>>> The result is that the newly added atomic modeset functions now
>>>> correctly wait for the user fence to complete before doing the flip. And
>>>> dependent CS don't pipeline any more, but rather block on the CPU before
>>>> submitting work.
>>>>
>>>> After tons of debugging and testing everything now seems to not go up in
>>>> flames immediately and even lockdep is happy with the annotations.
>>>>
>>>> I'm perfectly aware that this is probably by far the most controversial
>>>> patch set I've ever created and I really wish we wouldn't need it. But
>>>> we certainly have the requirement for this and I don't see much other
>>>> chance to get that working in an UAPI compatible way.
>>>>
>>>> Thoughts/comments?
>>> I think you need to type up the goal or exact problem statement you're
>>> trying to solve first. What you typed up is a solution along the lines of
>>> "try to stuff userspace memory fences into dma_fence and see how horrible
>>> it all is", and that's certainly an interesting experiment, but what are
>>> you trying to solve with it?
>> Well, good point. I explained to much how it works, but now why.
>>
>> In general I would describe the goal as: Providing a standard kernel
>> infrastructure for user fences.
> So on that goal the part I fully agree on is that drm_syncobj can (and
> should imo) be able to contain userspace memory fences. The uapi semantics
> and everything is already fully set up to support that, but maybe with
> reduced performance: Non-aware userspace (or when you don't trust the
> supplier of the umf) needs to block when looking up the fence, and the
> dma_fence returned will always be signalled already. But that's just a
> mild performance issue (and vk drivers paper over that already with
> threading) and not a correctness issue.

Exactly that, yes.

>>> Like if the issue is to enable opencl or whatever, then that's no problem
>>> (rocm on amdkfd is a thing, same maybe without the kfd part can be done
>>> anywhere else). If the goal is to enable userspace memory fences for vk,
>>> then we really don't need these everywhere, but really only in drm_syncobj
>>> (and maybe sync_file).
>> Yes, having an in kernel representation for vk user space fences is one of
>> the goals.
>>
>> And I was going back and forth if I should rather come up with a new
>> structure for this or use the existing dma_fence with a flag as well.
>>
>> I've decided to go down the later router because we have quite a lot of
>> existing functionality which can be re-used. But if you have a good argument
>> that it would be more defensive to come up with something completely new,
>> I'm perfectly fine with that as well.
> Yeah so stuffing that into dma_fence already freaks me out a bit. It is
> quite fundamentally a different thing, and it would be really nice to make
> that very apparent at the type level too.
>
> E.g. to make sure you never ever end up with an umf fence in mmu notifier
> invalidate callback. You can enforce that with runtime checks too, but imo
> compile time fail is better than runtime fail.

Well, I see arguments for both sides.

There is certainly the danger that we have an umf wait in the mmu 
notifier, but then lockdep will scream "bloody hell" immediately.

On the other hand when I make this a separate structure we need to 
maintain containers for both variants, especially a chain implementation 
for drm_syncobj. And here I don't have lockdep to keep an eye that 
nobody does anything strange.

It's only a gut feeling with no clear evidence for one side. If you 
insists on a separate structure I will go down that route.

>>> If the goal is specifically atomic kms, then there's an entire can of
>>> worms there that I really don't want to think about, but it exists: We
>>> have dma_fence as out-fences from atomic commit, and that's already
>>> massively broken since most drivers allocate some memory or at least take
>>> locks which can allocate memory in their commit path. Like i2c. Putting a
>>> userspace memory fence as in-fence in there makes that problem
>>> substantially worse, since at least in theory you're just not allowed to
>>> might_faul in atomic_commit_tail.
>> Yes, that's unfortunately one of the goals as well and yes I completely
>> agree on the can of worms. But I think I've solved that.
>>
>> What I do in the patch set is to enforce that the out fence is an user fence
>> when the driver supports user in fences as well.
>>
>> Since user fences doesn't have the memory management dependency drivers can
>> actually allocate memory or call I2C functions which takes locks which have
>> memory allocation dependencies.
>>
>> Or do I miss some other reason why you can't fault or allocate memory in
>> atomic_commit_tail? At least lockdep seems to be happy about that now.
> The problem is a bit that this breaks the uapi already. At least if the
> goal is to have this all be perfectly transparent for userspace - as you
> as you have multi-gpu setups going on at least.

Question here is why do you think there is an UAPI break? We currently 
wait in a work item already, so where exactly is the problem?

>>> If the goal is to keep the uapi perfectly compatible then your patch set
>>> doesn't look like a solution, since as soon as another driver is involved
>>> which doesn't understand userspace memory fences it all falls apart. So
>>> works great for a quick demo with amd+amd sharing, but not much further.
>>> And I don't think it's feasible to just rev the entire ecosystem, since
>>> that kinda defeats the point of keeping uapi stable - if we rev everything
>>> we might as well also rev the uapi and make this a bit more incremental
>>> again :-)
>> Yes, unfortunately the uapi needs to stay compatible as well and yes that
>> means we need to deploy this to all drivers involved.
>>
>> We at least need to be able to provide a stack on new hardware with (for
>> example) Ubuntu 18.04 without replacing all the userspace components.
>>
>> What we can replace is the OpenGL stack and if necessary libdrm, but not
>> (for example) the X server and most likely not the DDX in some cases.
>>
>> The same applies with surfaceflinger and to some extend Wayland as well.
> So for perfect uapi compat for existing compositor I really don't think
> stuffing umf into the kernel is the right approach. Too many little
> corners that break:
>
> - the in/out fence mismatch every

On that part I need further explanation, cause I hoped that this is solved.

> - cross gpu with different userspace that doesn't understand umf and then
>    just ignores them

Well by stuffing umf into the kernel the whole thing becomes transparent 
for userspace.

So it won't matter that you have a new amdgpu stack which wants to use 
umf and an older i915 stack which knows nothing about umfs.

The kernel will block on command submission as soon as a buffer is used 
by i915. And as you said above as well that might cause performance 
trouble, but is not a correctness problem.

> - compositors which currently assume implicit sync finishes eventually,
>    and with umf that gets complicated at best

But for userspace compositors there is no difference between an umf 
which times out and a dma_fence which timesout? Or am I missing 
something here?

> - same with sync_file, the uapi atm does not have a concept of future
>    fence
>
> So you can kinda make this work, but it falls apart all over the place.
> And I also don't think smashing umf into all these old concepts helps us
> in any way to get towards a desktop which is umf-native.

Yeah, but having an umf compatibility memory management doesn't help 
either to get away from pre-pinned pages.

> My take is still that for backwards compat the simplest way is if a
> umf-native driver simply provides dma-fence backwards compat as an opt-in,
> which userspace chooses when it's necessary. There's really only two
> things you need for that to work:
>
> - a timeout of some sort on the dma_fence, which might or might not kill
>    the entire context. This is entirey up to how your userspace does or
>    does not implement stuff like arb robustness or vk_error_device_lost
>
> - pre-pinned memory management to block out the all the inversions. This
>    is a bit more nasty, but since we do have all the code for this already
>    it really shouldn't be too tricky to make that happen for the fancy new
>    umf world.

Well, exactly that's what we want to get away from.

> You do not need a kernel scheduler or anything like that at all, you can
> do full userspace direct submit to hw and all that fun. Maybe do a
> drm/sched frontend (and then your submit code does exactly what userspace
> would do too).
>
> Importantly the things you really don't need:
>
> - special hw support, even if the only mode your hw supports is with page
>    faults and all that: You can make sure all the pages are present
>    upfront, and then simply kill the entire context is a page fault
>    happens.

Well, that's only like 90% correct.

You can make that work without special hardware support, but from the 
experience with ROCm and very extensive talks with out hardware folks we 
have seriously problems making sure that the hw can't access freed up 
memory any more.

Except for the solution of never freeing up memory the only other 
possibility is to wait between 1 and 6 seconds until a shoot down made 
sure that there is really nobody accessing old page tables entries any more.

In the case of an user space queue with hardware scheduler support and 
HMM the memory would just still be referenced until userspace 
cooperatively inserted a barrier, but that again breaks some dma_fence 
assumptions as far as I can see.

> - special fw scheduler support: Once the memory management inversions are
>    taken care of with pre-pinning under dma_fences, then the only other
>    thing you need is a timeout for the dma_fence to signal. And maybe some
>    kind of guaranteed ordering if you want to use a dma_fence timeline
>    since that one can't go backwards.

Yeah, that not going backward thing turned out to be massively more 
tricky than I thought initially as well.

Alex, Marek and I worked quite hard on relaying those requirements to 
our internal teams, but I'm still not quite sure if that will turn out 
working or not.

> Trying to shoehorn umf into all the old concepts like implicit sync or
> sync_file which really don't support umf works for a demo, but imo just
> isn't solid enough for shipping everywhere.
>
> And long term I really don't think we ever want umf anywhere else than
> drm_syncobj, at least for a 100% umf-native stack.

Ok then I will concentrate on drm_syncobj for now.

What about in driver backward compatibility? E.g. blocking wait in the 
multimedia driver CS IOCTL until umf signals?

Thanks,
Christian.

>
> So maybe this all goes back to the old discussion with had, where you
> argued for the need for special fw and hw and all that to make the old
> dma_fence stuff work. Why is that needed? I still don't get that part ...
> -Daniel

