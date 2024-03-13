Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC18787ACFA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 18:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED82D10F26B;
	Wed, 13 Mar 2024 17:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2IzD9uJW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B4CD10F26B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:22:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRkEsddjhpjpXmscIfzkury0LXw+pum1V1xs/cXERa3dPmutAdVyb6SGyllTfuLfEcIzTBTCaXsxCU8/p/DzV6J7KvxQKSqSjffaViY3sYIqvSyyRG0Nz2SFekLkhKOuqbItvB4r8wgTZeOhqczhjaJ0QBUZjBSkRaxyCrdJdn6ZTMvFRn3Q/DTEoAKIJ+qDf26xYh5DxYmJZ6eDRYpC3IkG1RxPmK2EHYRLTUmKkeaCBXVb5m1rwaY4kETssDbnoisot0XkcIcj+MdNL5zBRAjliUqO6Qb+W52DzzNoY3DekqG08IYfchtL6UVdjyuCSWtW/TJS32ikeTR7Z8/LpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ry+5TzENfEc01mVINZaZ4GhQbBOI2I0IrQ5OIr8gTZs=;
 b=CCdwyAf5/aha8zhfv4FMdRoFExmuFYw9dYcZn/8UY55fuPT8Iklb4Q7ApmEARlJDnFYi7IUQTtCnGsA5AiLv3hv/VEQ/zv8qfn29sASpYp2HETDuMoR8Ap7uN8zSHl6f03A188TwfAXU8IAgL2Ne76JgYBesu0ZfhBwx7IVzxADgnKWcH7sJ1N24RAXvuoNW6rpRrF5p5lF29BdUbCW1ZSWPuzkK2DkyotWWl+ad7kBa1Uw9KYQIuC/yaF2e9Fb3WTcaGEdMk/4Nhji6tZEWv1SQkhUt9knIatgYwk/LU+OXv/GuijrEWsNyQZaqr+G+pdFINj9G73paqhcsPnlJBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ry+5TzENfEc01mVINZaZ4GhQbBOI2I0IrQ5OIr8gTZs=;
 b=2IzD9uJWEvQ8B9rLzzZX0MtyjD9mq94Z9d+BSDd6/R6gDdFMew0dxe7JmFghVUJnwmzY8BFp0xbponbONz08ZJp8I6vQMyYPPswdypMXfrJ/SLThMrxEuAg5DL+qdNE3D3Dn+zOmsXMObrEUM1hGh8RI3Lfyq0f7RaFTGyP+TjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 17:22:52 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 17:22:52 +0000
Message-ID: <1354ae92-e348-9ad6-daf7-4a9f3ea18c37@amd.com>
Date: Wed, 13 Mar 2024 18:22:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20240307221609.7651-1-hannes@cmpxchg.org>
From: "Sharma, Shashank" <shashank.sharma@amd.com>
In-Reply-To: <20240307221609.7651-1-hannes@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::20) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 46925f70-fab0-4e84-dcc9-08dc43823673
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdNn4IIq0hsVc6JfG3Q7hs//FD+HcDe804vv+OZ/Swptv880b9sT5RAiF6DhnT8zXdXtSl8KLb2cjRXQdMyPmK5k1F3QdsfzpLjh4bqHiZZJrWSmwe4a2vm9YDXmZmSYdiEFI30OHpXbfiY75CmI75sI4hZhYofqpS+U7dW4HO9dq7+UaMGdVLGQpJtqESsmRLdFQI0Ea6ClbqBYTeMXzh9ZF/uUa+cFRWfBtMKR2Twi4cJj9DY+Ii5+1Y9RnO7tSaSefiniDHF8787Kcqc2disliM9sL0WdtaVTgGryGb8E/OERVD1l6tYT93bJXCMFGauvJeTHa/HAeun12B1Ng67wIsCKRPclNFRarDXmqEjNG2y84t+6WHB7guvZOQ/rtwZmxZHl4k5Zy5kI8nFYWILnqNun10slNEz50vSWHEVJbEEfEKdscLlcob6Fjeu9MZGQAD11ybFnZDHmOPd0x83A+J5Ekru++wHLeTXzm4bSu5qUPDcsdMrDS/AtL7wrvoQm9sT8Oz9GrHls+goS99U+4AJJZ5oJAYj5H/rhjaldCMbFufQeoKgEXi0W+HAzJalOeEPrGJBNQJYoux6+VlwnR7W+iw34ZN+i8uIA7E4KtoSLDVUkX4RL5hj96wiRKS+nHfbAxbWt6SgvhVOvqXabKmZUKoG5zZnMg6Iu2vE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNNbFgxSEx0SFFpdndyZDA4Qm1JSnN6cGpKQUtGR1diL3NVMkpDekFlZEh0?=
 =?utf-8?B?QUdNK1MzaitaaElidys5TGMwN3JuckpUYXJvVFNlZXpZeS81QlBNUFBVSUNK?=
 =?utf-8?B?OGh6Q3pCZUpZMGZ5QXhxR3pRUktBVUYrME14VEI0a0lRSkQ1SksyWnRVRFdH?=
 =?utf-8?B?ZWRDbTd5aUFmanZmbHcyUG1TcWZHV0QwWDFOOUVIZTFLSmQxWngyb1VLUmV1?=
 =?utf-8?B?VmJMTG55aXQ2Yi9RcEEvRVA0OUZtTmZMY25uNkFRRVhBM1lJZ3B3L1g4K1Bu?=
 =?utf-8?B?Uk5vbXU4N2lCNWpaY2pzT0NjRHpaVWMyM0hpS0tDOTdKa2Q4eUJ5TTFENmR3?=
 =?utf-8?B?Y0xCdEo5clZjQUFISksreEsyRURmV09rMjI4azRxUVNYVVliTzVjRDNVbUVh?=
 =?utf-8?B?TXlNL0ExNm1NTnBoSkZ3SmFodXl3Vnk5RDQ3NTBOVzU3ZkFIaW8wU3c2Y0VC?=
 =?utf-8?B?clV1elZENGFra2xHYXFQanYyaDhvbkgya2hlRFNJS2MzL1had3dPcWxiZnhK?=
 =?utf-8?B?dlJsL0xFbnVPWU5SVXk5R2xCWTN6QTBsalRTWEM0SG9UeGtVeFJ1ckhtcjZJ?=
 =?utf-8?B?ZEZUcFdJV2FFTEJwSzRrRjFHSVBHUVZ2UldDVEU2dFhzRklvZDc4SEwwUHBh?=
 =?utf-8?B?dUx1VEN4bFVweklRVm5VM0hsb2JTMUtubXNoSk1KNFBiSXJvb1M2eGo1VHFX?=
 =?utf-8?B?R1M1QVZlMGlub2NFRWw2OWZYUEFwdWp3MUJvbm0wRHY5WGdWaHpoaU1ldTlZ?=
 =?utf-8?B?ODU1ZURVZjhzdW5IK0VUM05MRzh4eDdTemszZHREbHk2dkVlNUViTm5pR3Ir?=
 =?utf-8?B?QlAxdUJ5elljcG82SzlEYk5uWVA4ZjhtOGRSdW9hYnlocGZxVG5hZnljbVVa?=
 =?utf-8?B?RFFXRFlrTldXWW5kYlVEN0hFWVZzc2RLSmRSei9nbVNYRjhvSjBzTjQzaGFH?=
 =?utf-8?B?dFdQZGwwYnRRUTBQeno0Zm5nMXMzclRyemcvUnZsMlhiZjV4UGUzWmFwaG05?=
 =?utf-8?B?NFVlNXV2SkpNZlQ4Skg1TUlwbzZFUVVSVVdWaWR2MEorM1M3cjNPSEdiQXFv?=
 =?utf-8?B?dktyTFo1bmt6VEc3UkRnRXdXYTZxNSsvcC9ZS1U1UWhieXB3ZE5NUjdOSTZo?=
 =?utf-8?B?bXFSYUhnT3VsNFNUZjNqaU5PWnB5WFlxTnFVRjFaUGQyREVCdFd6TGcrbDV6?=
 =?utf-8?B?ZExQOUJ4N3RRRnJMa2xhNVByMFJjOEtDV2hhbFE1OGh6SGt0T290QjZmYVJy?=
 =?utf-8?B?Ry9UN2JxSkxzRnVFVXJsNHdKaVpUNXhTb29EMjh2bExkelF5dG44Z2crVzZl?=
 =?utf-8?B?WFhLYXhEbU9mSnhFN0ZKc1N2dWg5UnhkNGluOHBLM0hsUGhhamFrU2lBU1Vo?=
 =?utf-8?B?eUQ1SlBEOC9zUkdVbStWNFkwamVqeGxQSDlQYXhGcEgxQUhMdXZ4VitldDJX?=
 =?utf-8?B?TmhKRmxYN3FzMitQSFFKbEovVmg1YS9tOE8xMmNVdEp5Qm51cld4bzFuYURD?=
 =?utf-8?B?K0hGVTlrbHNpdUlKOGgvRFJNM2ViUmw1OVRWRFJRemM5T0JLdnpJcWNLOUlG?=
 =?utf-8?B?NVZERmN5ajhLaVlFL0pjY0h5VjZIVXlIM1ZaVXhISkcxQnNEVTh6aDhHbW5v?=
 =?utf-8?B?R2RyQmd3czdBdG9BdSs3UGpjd1ZnV25OSkRoRWE1dVZTRUNQZndFOXkxQ1dq?=
 =?utf-8?B?ZDVNMkJaUVROcmphNm5ldGFpaWI5RXM3SzR5MW4vNi9LNVQ0N1NpTmYxZ05E?=
 =?utf-8?B?c3pSTlNGclpmdSt2cDlTaXorMEFEK2ZwRmk1TVplOWpXQ015TldWdjhSMys3?=
 =?utf-8?B?RXJvVEpmNXZIQWQ1VkVyWVdlMURTSjN1WnFaS1VHNm1vU25meE9wZE4xRkVT?=
 =?utf-8?B?Zk1OQWwwc0JTbHppWktXaWZpelZnM1R4QXhkWmRQTFM0QjhuMWRJMkl2Rm1o?=
 =?utf-8?B?eWZGSWZXWkY1L0hIMlNJOGQ1R0JYMXRWdWtrQy9uUWFscjgzZ1YwcGE0YTM1?=
 =?utf-8?B?WnVsem5lN2JJbTNua0NRWmpuWVVXTm1IYXc2dEpUTEwzTUdLSmVSS1FPMXBU?=
 =?utf-8?B?TWdVTGFTRHh1L09kR3N4U2puNnBPRngrL3FITjVvd2pGTHpYMFNzQzRrbTZ2?=
 =?utf-8?Q?8KIuHIZwa4QhSnEdW8vVF1//z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46925f70-fab0-4e84-dcc9-08dc43823673
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 17:22:52.1285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1Em51ue/TXy6FR+MB2aB1x1x/hZXtPSSTne37wBDXOqO2Qqu32uvjVom3kzYEncXtiiac9ic3HMnq/aiC5mLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

Hello Johannes,

On 07/03/2024 23:07, Johannes Weiner wrote:
> An errant disk backup on my desktop got into debugfs and triggered the
> following deadlock scenario in the amdgpu debugfs files. The machine
> also hard-resets immediately after those lines are printed (although I
> wasn't able to reproduce that part when reading by hand):
>
> [ 1318.016074][ T1082] ======================================================
> [ 1318.016607][ T1082] WARNING: possible circular locking dependency detected
> [ 1318.017107][ T1082] 6.8.0-rc7-00015-ge0c8221b72c0 #17 Not tainted
> [ 1318.017598][ T1082] ------------------------------------------------------
> [ 1318.018096][ T1082] tar/1082 is trying to acquire lock:
> [ 1318.018585][ T1082] ffff98c44175d6a0 (&mm->mmap_lock){++++}-{3:3}, at: __might_fault+0x40/0x80
> [ 1318.019084][ T1082]
> [ 1318.019084][ T1082] but task is already holding lock:
> [ 1318.020052][ T1082] ffff98c4c13f55f8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
> [ 1318.020607][ T1082]
> [ 1318.020607][ T1082] which lock already depends on the new lock.
> [ 1318.020607][ T1082]
> [ 1318.022081][ T1082]
> [ 1318.022081][ T1082] the existing dependency chain (in reverse order) is:
> [ 1318.023083][ T1082]
> [ 1318.023083][ T1082] -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
> [ 1318.024114][ T1082]        __ww_mutex_lock.constprop.0+0xe0/0x12f0
> [ 1318.024639][ T1082]        ww_mutex_lock+0x32/0x90
> [ 1318.025161][ T1082]        dma_resv_lockdep+0x18a/0x330
> [ 1318.025683][ T1082]        do_one_initcall+0x6a/0x350
> [ 1318.026210][ T1082]        kernel_init_freeable+0x1a3/0x310
> [ 1318.026728][ T1082]        kernel_init+0x15/0x1a0
> [ 1318.027242][ T1082]        ret_from_fork+0x2c/0x40
> [ 1318.027759][ T1082]        ret_from_fork_asm+0x11/0x20
> [ 1318.028281][ T1082]
> [ 1318.028281][ T1082] -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
> [ 1318.029297][ T1082]        dma_resv_lockdep+0x16c/0x330
> [ 1318.029790][ T1082]        do_one_initcall+0x6a/0x350
> [ 1318.030263][ T1082]        kernel_init_freeable+0x1a3/0x310
> [ 1318.030722][ T1082]        kernel_init+0x15/0x1a0
> [ 1318.031168][ T1082]        ret_from_fork+0x2c/0x40
> [ 1318.031598][ T1082]        ret_from_fork_asm+0x11/0x20
> [ 1318.032011][ T1082]
> [ 1318.032011][ T1082] -> #0 (&mm->mmap_lock){++++}-{3:3}:
> [ 1318.032778][ T1082]        __lock_acquire+0x14bf/0x2680
> [ 1318.033141][ T1082]        lock_acquire+0xcd/0x2c0
> [ 1318.033487][ T1082]        __might_fault+0x58/0x80
> [ 1318.033814][ T1082]        amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu]
> [ 1318.034181][ T1082]        full_proxy_read+0x55/0x80
> [ 1318.034487][ T1082]        vfs_read+0xa7/0x360
> [ 1318.034788][ T1082]        ksys_read+0x70/0xf0
> [ 1318.035085][ T1082]        do_syscall_64+0x94/0x180
> [ 1318.035375][ T1082]        entry_SYSCALL_64_after_hwframe+0x46/0x4e
> [ 1318.035664][ T1082]
> [ 1318.035664][ T1082] other info that might help us debug this:
> [ 1318.035664][ T1082]
> [ 1318.036487][ T1082] Chain exists of:
> [ 1318.036487][ T1082]   &mm->mmap_lock --> reservation_ww_class_acquire --> reservation_ww_class_mutex
> [ 1318.036487][ T1082]
> [ 1318.037310][ T1082]  Possible unsafe locking scenario:
> [ 1318.037310][ T1082]
> [ 1318.037838][ T1082]        CPU0                    CPU1
> [ 1318.038101][ T1082]        ----                    ----
> [ 1318.038350][ T1082]   lock(reservation_ww_class_mutex);
> [ 1318.038590][ T1082]                                lock(reservation_ww_class_acquire);
> [ 1318.038839][ T1082]                                lock(reservation_ww_class_mutex);
> [ 1318.039083][ T1082]   rlock(&mm->mmap_lock);
> [ 1318.039328][ T1082]
> [ 1318.039328][ T1082]  *** DEADLOCK ***
> [ 1318.039328][ T1082]
> [ 1318.040029][ T1082] 1 lock held by tar/1082:
> [ 1318.040259][ T1082]  #0: ffff98c4c13f55f8 (reservation_ww_class_mutex){+.+.}-{3:3}, at: amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
> [ 1318.040560][ T1082]
> [ 1318.040560][ T1082] stack backtrace:
> [ 1318.041053][ T1082] CPU: 22 PID: 1082 Comm: tar Not tainted 6.8.0-rc7-00015-ge0c8221b72c0 #17 3316c85d50e282c5643b075d1f01a4f6365e39c2
> [ 1318.041329][ T1082] Hardware name: Gigabyte Technology Co., Ltd. B650 AORUS PRO AX/B650 AORUS PRO AX, BIOS F20 12/14/2023
> [ 1318.041614][ T1082] Call Trace:
> [ 1318.041895][ T1082]  <TASK>
> [ 1318.042175][ T1082]  dump_stack_lvl+0x4a/0x80
> [ 1318.042460][ T1082]  check_noncircular+0x145/0x160
> [ 1318.042743][ T1082]  __lock_acquire+0x14bf/0x2680
> [ 1318.043022][ T1082]  lock_acquire+0xcd/0x2c0
> [ 1318.043301][ T1082]  ? __might_fault+0x40/0x80
> [ 1318.043580][ T1082]  ? __might_fault+0x40/0x80
> [ 1318.043856][ T1082]  __might_fault+0x58/0x80
> [ 1318.044131][ T1082]  ? __might_fault+0x40/0x80
> [ 1318.044408][ T1082]  amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu 8fe2afaa910cbd7654c8cab23563a94d6caebaab]
> [ 1318.044749][ T1082]  full_proxy_read+0x55/0x80
> [ 1318.045042][ T1082]  vfs_read+0xa7/0x360
> [ 1318.045333][ T1082]  ksys_read+0x70/0xf0
> [ 1318.045623][ T1082]  do_syscall_64+0x94/0x180
> [ 1318.045913][ T1082]  ? do_syscall_64+0xa0/0x180
> [ 1318.046201][ T1082]  ? lockdep_hardirqs_on+0x7d/0x100
> [ 1318.046487][ T1082]  ? do_syscall_64+0xa0/0x180
> [ 1318.046773][ T1082]  ? do_syscall_64+0xa0/0x180
> [ 1318.047057][ T1082]  ? do_syscall_64+0xa0/0x180
> [ 1318.047337][ T1082]  ? do_syscall_64+0xa0/0x180
> [ 1318.047611][ T1082]  entry_SYSCALL_64_after_hwframe+0x46/0x4e
> [ 1318.047887][ T1082] RIP: 0033:0x7f480b70a39d
> [ 1318.048162][ T1082] Code: 91 ba 0d 00 f7 d8 64 89 02 b8 ff ff ff ff eb b2 e8 18 a3 01 00 0f 1f 84 00 00 00 00 00 80 3d a9 3c 0e 00 00 74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 00 00 00 53 48 83
> [ 1318.048769][ T1082] RSP: 002b:00007ffde77f5c68 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> [ 1318.049083][ T1082] RAX: ffffffffffffffda RBX: 0000000000000800 RCX: 00007f480b70a39d
> [ 1318.049392][ T1082] RDX: 0000000000000800 RSI: 000055c9f2120c00 RDI: 0000000000000008
> [ 1318.049703][ T1082] RBP: 0000000000000800 R08: 000055c9f2120a94 R09: 0000000000000007
> [ 1318.050011][ T1082] R10: 0000000000000000 R11: 0000000000000246 R12: 000055c9f2120c00
> [ 1318.050324][ T1082] R13: 0000000000000008 R14: 0000000000000008 R15: 0000000000000800
> [ 1318.050638][ T1082]  </TASK>
>
> amdgpu_debugfs_mqd_read() holds a reservation when it calls
> put_user(), which may fault and acquire the mmap_sem. This violates
> the established locking order.
>
> Bounce the mqd data through a kernel buffer to get put_user() out of
> the illegal section.
>
> Fixes: 445d85e3c1df ("drm/amdgpu: add debugfs interface for reading MQDs")
> Cc: stable@vger.kernel.org		[v6.5+]
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 46 +++++++++++++++---------
>   1 file changed, 29 insertions(+), 17 deletions(-)
>
> This fixes the lockdep splat for me, and the hexdump of the output
> looks sane after the patch. However, I'm not at all familiar with this
> code to say for sure that this is the right solution. The mqd seems
> small enough that the kmalloc won't get crazy.
Yeah, MQDs sizes are within range (so far :))
> I'm also assuming that
> ring->mqd_size is safe to access before the reserve & kmap. Lastly I
> went with an open loop instead of a memcpy() as I wasn't sure if that
> memory is safe to address a byte at at time.
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> index 5505d646f43a..06f0a6534a94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
> @@ -524,46 +524,58 @@ static ssize_t amdgpu_debugfs_mqd_read(struct file *f, char __user *buf,
>   {
>   	struct amdgpu_ring *ring = file_inode(f)->i_private;
>   	volatile u32 *mqd;
> -	int r;
> +	u32 *kbuf;
> +	int r, i;
>   	uint32_t value, result;
>   
>   	if (*pos & 3 || size & 3)
>   		return -EINVAL;
>   
> -	result = 0;
> +	kbuf = kmalloc(ring->mqd_size, GFP_KERNEL);
> +	if (!kbuf)
> +		return -ENOMEM;
>   
>   	r = amdgpu_bo_reserve(ring->mqd_obj, false);
>   	if (unlikely(r != 0))
> -		return r;
> +		goto err_free;
>   
>   	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&mqd);
> -	if (r) {
> -		amdgpu_bo_unreserve(ring->mqd_obj);
> -		return r;
> -	}
> +	if (r)
> +		goto err_unreserve;
>   
> +	/*
> +	 * Copy to local buffer to avoid put_user(), which might fault
> +	 * and acquire mmap_sem, under reservation_ww_class_mutex.
> +	 */
> +	for (i = 0; i < ring->mqd_size/sizeof(u32); i++)
> +		kbuf[i] = mqd[i];

memcpy is safe to use here.

With that change, please feel free to use: Reviewed-by: Shashank Sharma 
<shashank.sharma@amd.com>

- Shashank

> +
> +	amdgpu_bo_kunmap(ring->mqd_obj);
> +	amdgpu_bo_unreserve(ring->mqd_obj);
> +
> +	result = 0;
>   	while (size) {
>   		if (*pos >= ring->mqd_size)
> -			goto done;
> +			break;
>   
> -		value = mqd[*pos/4];
> +		value = kbuf[*pos/4];
>   		r = put_user(value, (uint32_t *)buf);
>   		if (r)
> -			goto done;
> +			goto err_free;
>   		buf += 4;
>   		result += 4;
>   		size -= 4;
>   		*pos += 4;
>   	}
>   
> -done:
> -	amdgpu_bo_kunmap(ring->mqd_obj);
> -	mqd = NULL;
> -	amdgpu_bo_unreserve(ring->mqd_obj);
> -	if (r)
> -		return r;
> -
> +	kfree(kbuf);
>   	return result;
> +
> +err_unreserve:
> +	amdgpu_bo_unreserve(ring->mqd_obj);
> +err_free:
> +	kfree(kbuf);
> +	return r;
>   }
>   
>   static const struct file_operations amdgpu_debugfs_mqd_fops = {
