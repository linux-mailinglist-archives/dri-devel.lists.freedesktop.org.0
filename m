Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E1729CE3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F0A10E6AD;
	Fri,  9 Jun 2023 14:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5936D10E0A3
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wi/RXUl41fOnqZan1nUCIzXe75fDSP33UwyLaLTFGYyK7KR7OG9XNXjYrWqGlHHTuacpNc7KV5WrK4xCMDHFi92rDaD6C/U082J2sEkGRfty5r9iysjysNOiLLnkbrw4CbTHVUwQv1UqcTkCoCGzshi4daVK65BfynfBz+7QkAcjNzAOAinmO7VboFA1bxWEyxQE3AlYBVYYIIzrhdKkbrlmIqf1X6BNdW2jAyYYaSXMoZSYSdR8EVan5jPg8TsbH8z6WmYdufTJ5Tg7l+IsfwHBiUSgUNFavtm34H1Sok3IPeg12EeTdIGYjpDnc+td+oOZY9XNUiVAmFh2sKsEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct9lzQPPEnVgfIsaFOx/xytuNmF4Fro5H9QDHkizN4o=;
 b=YM1tJdILKsIgkNXCZZydG9A4ODZ0JPA83ksHb0gLhIrZXDT7HnZmdK1KO3hg2E/1eB/Tpt2AWfCtn4C+F/DHq6F2C30eh3rsHNKhnnl6G8yqE+3Yhtm78UCW/JVLDv4GjGgjWBUInEeaCqtP2CMb/XbwRxls+/PiSzQ7l4vtBlJoHXgAqJC4yIp6w0DAEPico6XV4wOsKTKeBTY3km11eKdNQdMRTgNSpa+ieetvkZ6IOD06hCpeA6d0e2Lwmuebng2S/G3HILjJFA3s4e/q0u2zhbL/SBMy5dfjBpR3NahrNaUwcpCnPx8HMis5T3Y9Ia9592sFkbf2wtoynOpQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ct9lzQPPEnVgfIsaFOx/xytuNmF4Fro5H9QDHkizN4o=;
 b=PfrBYZsuJQx1IjVo/Ke4A/XkH+ZEBxaf550FKRwsfqrTNk0UMBxe4lJoTFGYoCaOad/Cz6FqB5raD8CfCELlG2qink+4803ghqrThzvhYsAMTK1er/L3f5nUR/qeavCY45nulsfYb3y+pBlAO2Jbp6XESY1FPVa5rGgJCcpc+/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CO6PR12MB5475.namprd12.prod.outlook.com (2603:10b6:5:354::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.42; Fri, 9 Jun
 2023 14:29:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::6729:a735:9814:97ea%6]) with mapi id 15.20.6455.039; Fri, 9 Jun 2023
 14:29:41 +0000
Message-ID: <bdbaf9c8-4549-54c1-07d1-af0115206e25@amd.com>
Date: Fri, 9 Jun 2023 16:29:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] drm/sched: Wait for the currently popped dependency
 in kill_jobs_cb()
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230608065551.676490-1-boris.brezillon@collabora.com>
 <bec5582e-2172-cb01-c8b2-283b9aab414a@amd.com>
 <20230609161006.7992a477@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230609161006.7992a477@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CO6PR12MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4c8608-b2ab-48c3-cb1f-08db68f5f646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 62D0IbgKU6SjM+kKptaKeBdWbPB4U9xiqAzUZFUJusjePoOqyghSkB0Ln40+Eb60QMzNIG1z3lmfg7bDl87loZ3lZlLwEORmp87hNP5DoLEtgYMjBxtEnBIyuVWRMi4ErFhoR3eb/2zQxwo2PjJsT6o6s8U4W4YENDaGTFb5J0qO/eiR0G4bJER6A8VTPKTlRzljBB7cN5KH6jPleLYhnicKcKvFOkmmEfJ0ua8Gt5BcG3M/3q9QO7CpvXHcMhbDoZD2Qw/MfE64G8In8NtIY7JJ3mu0RnnCXskHOGdDubfEvG95seFdWG5MMLkTXvTS481hxm0aWdCn2YNVj6KQsrJ2XKD4zruICuUtcnbTAZ0Zhb/7V9HlI+RO+EQtYTxy2h31R9ZQToQnEhp49QvYEtnqk3vaXprftXL8unUfgTWDpha8njfrbnsuc634ce/9ZyS2Hd/5iHS6CQ2voyJqiY3MYP8anG48StXClI8VJlUOlZVOhHQmYPhMkwbuw6oHGno8+j1zsXEg6t1nAQ4Mezxtt/wXKP1yC2jLGeyfZdLnQ0L9IxE3P0wk4K8z1BUmCrxjHivZMaItHNX2L3jLZzGro+Sbv2Pg1Q31kPnaSr2wn7CKoZnhWYfeaYNlH+WgDQR6duiOeULIBBcMh8EVqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(376002)(396003)(366004)(39860400002)(451199021)(31686004)(6666004)(66556008)(66476007)(66946007)(316002)(54906003)(6916009)(4326008)(478600001)(86362001)(31696002)(36756003)(66574015)(6512007)(6506007)(83380400001)(186003)(41300700001)(8936002)(8676002)(5660300002)(2906002)(6486002)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDBickpWMGJHaGNYL00wWmpGSklFV3RMZG14MTlxQ0lnT0V3OGt6SjJkZVpj?=
 =?utf-8?B?Q3VRNWJFWTZoQ0NqSnhNZ2pCbjhjU3pOUHdFRzVvMHFzTmt6T2U2dGhCWElB?=
 =?utf-8?B?UFpXWU1kcUVkQy80UWRwWmdidk4vUTYyUllMa2w1Um45aHNOVndQSWFESXJH?=
 =?utf-8?B?Y3RvMUFzdjBhdTlNa1YrT0FKVjBKbDVyUDhtNVRSS0NIdlhTNVBWZDZiTWl6?=
 =?utf-8?B?b2lXZGl1TDVlK3ZmZy9WYUN0aTlvM2F5SUF1a3ZYVGNEZ3dQcWlkN3BXdFE1?=
 =?utf-8?B?WnlWRzFNUEZYZm9WQVA4UGlYV01GWVJiLzBiU3poNGxJSmxqSHVLTk1lanQ2?=
 =?utf-8?B?Tnc0bm5jNW9ZN29kbHBPamR0T29lRnNTMWVkRHJMVWlqNTNJQ0N1MXJaOGxS?=
 =?utf-8?B?RUtoSjNQd1FwckNpS21IRFNFQk82WktYcEhMeVU5d1Y4TUNCclJiT2t3RVZw?=
 =?utf-8?B?T1F1cklxZTlHMFAydkMvdzcwcGFNczN0d3RrekZSMkZCUHovc0lDWjcrSjBJ?=
 =?utf-8?B?U1VKd2ZycXlSbTdyQjg0dGdpQTRMWk9HblN2SDNxeHFqeU1kK081SWd1ZVdZ?=
 =?utf-8?B?MWtOa2tlWmJCa3p4V2Nsb2h3RjBBbGVYS0EySDFDbXFJRncwcmc0YWloRWxu?=
 =?utf-8?B?NnlrOUY0cXRHOEx0RVE5VTZHTkw1YXhJRGxoVjBtdWt0bUxLOTlKWmNNOEEz?=
 =?utf-8?B?cDJubnVadmdBNFBEcWZWQnNDaTdWVEhIZUpNcDZmZ3BlQ3JCMEYzUWxRSDlF?=
 =?utf-8?B?LzNNcWtzN2lBSy95N0xQTHBsTUdNZmVuV1B6cGRsT0krUUlxOHVsanZVZDRV?=
 =?utf-8?B?SGFDNlpJOUxraVJyUk5FNkoveHNJWXJld2pXbDZJSm02dDkwa2xVSGVNay8x?=
 =?utf-8?B?NkpFV002UTVRUFJCRmtuQTQ3OVlGdnB5bmUrSElkQVM4K1E0Q0ZyWVNHcVEx?=
 =?utf-8?B?Z05yMy8rakZFcGJ0VWdlSlBKcE9UUE5xMmRBWjFIV0xiUm55QllVelc3Q0Z6?=
 =?utf-8?B?YWsrcTBIbS9WNlNmNFEvU0dNL2h3bkV5LzIxSVUrdFcwL3BtcHdlSWluMnA4?=
 =?utf-8?B?Zkw3SGQ1b1RPRTFRL0c4N25LcVVLRStNRVZ5Nk9MK0h0dGd5OGs0QUlUWkdB?=
 =?utf-8?B?dlIxdmhqVUVKd2pxNSt3UWs0ZEZuRk5IdTRHUVhiSERyRkcwWVhkQklYbTZi?=
 =?utf-8?B?MFpya3VadllNeEY0cEJpcW80SU1reGg4UDBFZVY0VllvdEcvcHNLYU15bzFu?=
 =?utf-8?B?UmFjdkswUDM3a0FYd0VNTHJyazA2anpYK3plUmZ0bFl6VVV2SXRnTlQ1amxV?=
 =?utf-8?B?MnFobkhRMEtuUEdkRnZ6UnV1a0lxZ1VLdDR5YzVkOWFEbDlHNmRMUTI4ZTNn?=
 =?utf-8?B?MUZqdzRJMzBuSGNud1NLSVNnWlFrWkEyWUFvNXEzSVJCTm45aVJHeVRaMkZH?=
 =?utf-8?B?RUErWGNkQ0FDUEo0N1ZRY0FxdldNQStkdkcyK0huVElmWlNsVFdMd0ExdkxX?=
 =?utf-8?B?VTU2M3MyUnIwbVExWTgwTEl0KzFGWkJJQUtKbU5rSElQcGl2RTVuOUhyY0tl?=
 =?utf-8?B?cEdvVGljOXI2YjJVVDh2dnFZNFdvT0E3YTYvRE5LcGV0bmFKTFVFaG1iWnVx?=
 =?utf-8?B?SVJKZXY3QXNyRTg3TUpXVDYzdWJtYWtNNVA1R3dnV2twKzBTZlZCV3lXUWF5?=
 =?utf-8?B?S0h6Z3BjWC9ucE04VjlmOG5OcFFzb0o3cXJXZG56U0RsdXl4dm1Wbnd0SmRO?=
 =?utf-8?B?eiszaGJXVFhyOGp5MHIvV1dpbWlON2tMc2p0dEdoeSsxbEFKYUZ5VU5MZlZ6?=
 =?utf-8?B?ZTRXRmMvQVRaWi96S3lFSC9vQ2p2SU83MGZQcjFSZEpwemU3SEpYVGI3Y0d4?=
 =?utf-8?B?cXA0Y2dtSDZqeWxKeWlDVE5TN3pOZkRBcjU2QzBGdzNpZStaaElBSHlvYW45?=
 =?utf-8?B?ZmZjSXJyYVp2ZHZRTFlFdFJHUXI1eWR2a2VDei8xMzlOYzdNUHFha0k5Qkhx?=
 =?utf-8?B?YUpCQ3RYWWE2Zks1MFZJT3l2ZDhzL2dwT2dCRC92cDRiZWpsSnhLcFUwVjhJ?=
 =?utf-8?B?OTFJTHhxNkJQQzlYRVFDVGxGWFJhL2VWZG11YzRYdEFxd0NyL2xtK28wN3Qr?=
 =?utf-8?B?RVM1TXAzSTVIKzZTWllVaGNTUWE1NWdGN2IrUk5HTVNwZ3hOYnBrSHd2UllI?=
 =?utf-8?Q?87R6QGf44/0jWUvsOt4Adhwha50Ee5rn9mEY/LCsxdR7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4c8608-b2ab-48c3-cb1f-08db68f5f646
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 14:29:41.7015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0LAiybaxY8owYZcYDAZrem/HaGNZsIeBZr3zatfk7H8Iq8KKaoEapQXaSL9gVbP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5475
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
Cc: Sarah Walker <sarah.walker@imgtec.com>, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Donald Robson <donald.robson@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.23 um 16:10 schrieb Boris Brezillon:
> Hello Christian,
>
> On Fri, 9 Jun 2023 13:53:59 +0200
> Christian König <christian.koenig@amd.com> wrote:
>
>> Am 08.06.23 um 08:55 schrieb Boris Brezillon:
>>> If I understand correctly, drm_sched_entity_kill_jobs_cb() is supposed
>>> to wait on all the external dependencies (those added to
>>> drm_sched_job::dependencies) before signaling the job finished fence.
>>> This is done this way to prevent jobs depending on these canceled jobs
>>> from considering the resources they want to access as ready, when
>>> they're actually still used by other components, thus leading to
>>> potential data corruptions.
>>>
>>> The problem is, the kill_jobs logic is omitting the last fence popped
>>> from the dependencies array that was waited upon before
>>> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
>>> so we're basically waiting for all dependencies except one.
>>>
>>> This is an attempt at fixing that, but also an opportunity to make sure
>>> I understood the drm_sched_entity_kill(), because I'm not 100% sure if
>>> skipping this currently popped dependency was intentional or not. I can't
>>> see a good reason why we'd want to skip that one, but I might be missing
>>> something.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Cc: Frank Binns <frank.binns@imgtec.com>
>>> Cc: Sarah Walker <sarah.walker@imgtec.com>
>>> Cc: Donald Robson <donald.robson@imgtec.com>
>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> ---
>>> Stumbled across this issue while working on native dependency support
>>> with Donald (which will be posted soon). Flagged as RFC, because I'm
>>> not sure this is legit, and also not sure we want to fix it this way.
>>> I tried re-using drm_sched_entity::dependency, but it's a bit of a mess
>>> because of the asynchronousity of the wait, and the fact we use
>>> drm_sched_entity::dependency to know if we have a clear_dep()
>>> callback registered, so we can easily reset it without removing the
>>> callback.
>> Well yes, that's a known problem. But this is really not the right
>> approach to fixing this.
>>
>> Trying to wait for all the dependencies before killing jobs was added
>> because of the way we kept track of dma_fences in dma_resv objects.
>> Basically adding exclusive fences removed all other fences leading to a
>> bit fragile memory management.
> Okay.
>
>> This handling was removed by now and so the workaround for waiting for
>> dependencies is not really necessary any more, but I think it is still
>> better to do so.
>>
>> The right approach of getting this waiting for dependencies completely
>> straight is also not to touch entity->dependency in any way, but to stop
>> removing them from the XA in drm_sched_job_dependency(). Otherwise you
>> don't catch the pipeline optimized ones either.
> Do you want me to post a v2 doing that, or should I forget about it?
> If we decide to keep things like that, it might be good to at least
> add a comment explaining why we don't care.

Well, if you have time fixing this fully and keeping the dependency 
handling is certainly be preferred.

Regards,
Christian.

>
> Regards,
>
> Boris

