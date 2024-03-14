Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 437FA87C048
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 16:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B79B10E9E1;
	Thu, 14 Mar 2024 15:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0Zo9v+Sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47C510E9DF
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 15:32:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IDJLvC8Ll4+kfG4vJJeu31Hjm2MbL01649HdnpISHgk0mA18RuoTgufyVbGFlmV0gnSJUrA0pHV5tF0lxWPuSSCRL0bdScks4TkML0PPPxtirI0q7GUlKxT4Sfx576QrpRuo2LRn5l7StCLG81bgFlmiu845y8L18ZG7VFcNtNKCL/cuExkUIBmh0L9ddq9S6TkUG96J6Nv1T25+6IS3P+gjriDtPmDh1YUlBDjqx1tQFXpn8XXDlhSqbZV2EAGCDH48m2xR351W5jK6yNEcLhF6WD149Ojwc/YaLMUd220lTz9qlkGSp387RQGGmjA3U5EzyiU5g91PRNHIGyADOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KgIuByTNjXZjJ5rHLu8nrOSx+Ey7roKELvI9XNYouik=;
 b=XzNSa2PeK1OwrV/qaJ5bGaXR2CNtbLxi1lvA13uoGLe+sOv6fl6mP7LxqakK98JsqqQXl8u+ukXY802Qup94U0cvd6GA+gPkhYtEHrN8Yncp9egaUHdyyvvh/47K4bghINFOvpXBHPkT9G/UVyJrZ1NdjxrQwhLyfb/oLZvYBs4gTN6HZrvniMSNwvhwrvsLnoJKffCWqvyaZ4WCeDZZMhAl0h6OhN3x8oP0dG/emZmnMvI5L6Ttan5VX3rW7/+bERVRSy3KhQjI1cgJX3i0RVx0y2yFrNKQIWgnumULm8O8RY0Qu9+j/Ofk0025G9jPSddIEc+5mTKuhkt4wZlEQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KgIuByTNjXZjJ5rHLu8nrOSx+Ey7roKELvI9XNYouik=;
 b=0Zo9v+SlelZ0BIF98hxLZRy9tJtiv/aPAA0gA+w+IyhLCE3ijwQAiMKh/QMgsxHi1wo2jb+JRHtDVVCaIXSmmouwBMcPpIPcza2GLms2Vy2TFp+cIfqmaffDX8hkFHdl3N4rJHWFw1c6djhU2J7WT2JESdvcZs2tBqAkXWolMkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 15:32:39 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::966b:7f50:4f07:3c8b%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 15:32:39 +0000
Message-ID: <6686c546-735f-90d9-9f2d-37d9343e7b0b@amd.com>
Date: Thu, 14 Mar 2024 16:32:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/amdgpu: fix deadlock while reading mqd from debugfs
Content-Language: en-US
From: "Sharma, Shashank" <shashank.sharma@amd.com>
To: hannes@cmpxchg.org
References: <20240307221609.7651-1-hannes@cmpxchg.org>
 <1354ae92-e348-9ad6-daf7-4a9f3ea18c37@amd.com>
Cc: dri-devel@lists.freedesktop.org
In-Reply-To: <1354ae92-e348-9ad6-daf7-4a9f3ea18c37@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::12) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 560e07fa-28b8-429d-0005-08dc443bfb7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4UNljv9XcW7bBjk8jC+myl11FSnRYA5N3i1+ObwnxIJYWzAOmgka3j+Bns5USXEnWxQQPCROZpJnFctxFLlg0je4wf/U4MpaqFiNqoVL1M3RCNQkNRXpPgYVZ90XUa2JrbM6uek3SfXI34RJP18bSiyrWiPFyy6QJTXUw6Bq5dNMJM5py1yiJeLZK4y1cTF489XxDvRRXw6fryh+vyLgYjT5TlfTJ6bchmxQ9Ww5UXYrr7iANKslglMbiGVnCyfb7GuGuRB6Ob8nyHCMJdbx88yz7ULfDxls5+PNgUSFY51W+gfYwp/Zsh2bokI6Um8rAKugXyr6UGrAjYFvo0ozzPIrDkixnOUxac46S9YBHgw78eds/mVAcICs//DeN1J+hIBAB2BQO32j9qejVZdiDYhLX53GOmFPdElDFcdCyE2n3mO6KB5n1hUiBERFcc6b91R6SJTvdkk9nJ0L+asIl0Kstjf2R2gKv0I5RuM9W+98e81VFIUUSqcCGfSwSa+xGNVsnT9ylQz+1pK5xzQVm51HUdrlnpO1nD4J+tOfpLKhubN2ZIrjzgSItnnRmKk+T/OhpqKv8+qhHzaryVrBLr1L7Y7V+VAXZGCsFsAnI2BdgymUhaK15hA+SKQlwkkQRBjMMTFampA8z3FInsqcOuibeoQdX6yx4mq7TZq6DiU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnlSb1IwVDFjbnpncE9PbUFXRjZiYXhXdG9KMkJGWEVrLzQ3ZnpOaUtMUTRQ?=
 =?utf-8?B?Y0d1Tkc3NnVqU0htL2JTSklDT0dCUmlMSmRhWVpmMTBMbEZSNE9hazZkS2tV?=
 =?utf-8?B?Sys4akRkcTlGdmdySmNYSldMRnI4ZHpacTdPYjZLTmJ0dXNONGVrbUZtdXpr?=
 =?utf-8?B?UlhyK3NpU3o0WkYyRkpnK0hVT1VRT2NPU0wxSlVwTGtvRFNHZHc2c0Jtcm5Y?=
 =?utf-8?B?WHVIWW02VW0zQ21UR2c4cjMyQitXNUMzNWVBMzh0d2I4NkQrQW93cTQ0eFVX?=
 =?utf-8?B?dGlYeVR0NkVpRnk2QXZFeDZ1NlVGMmNpMTFzdSsyY3B3NXZaUk1CNU5SYmpU?=
 =?utf-8?B?OVhlcFZ0MkVxVTZjNVFmeE9ZUC8yYTJINUlDdnpHSENqdTA2aGJ1ditGVlpk?=
 =?utf-8?B?UDNqQTFyNG9kWVRWOTBMb1ppRG5pdC9rQ2xTSzI1aUNHZFBxNnd0aGJiajQ1?=
 =?utf-8?B?WkpOQy9BNzVudGg4dHVvTmJ2RjFCTUV5N01WeVNHTHFDb3hrTEg1YkwrSUtX?=
 =?utf-8?B?RFF3N0JYZy9ZU0RGZlVKTTVBaVBqOFJBSnhBV3doYVoxS1dCQnJZcGhDdk9L?=
 =?utf-8?B?TzhNaXZWM3R6SGMrbHFreTFHdjBBOTdLWlMyaGtuZVF4MnVhTUY0dDBOa3V3?=
 =?utf-8?B?QXgvenVBYzk4Tmk5c0l2K25ZVmpXcXRWVEsyWk9YY3VOTG85YjV4UVI3QVVK?=
 =?utf-8?B?TnRidlYzUmMwUWx5aVFReHRHSmVwUnY3U0Zmald4TCtOU0p6a25yRzZYNUc4?=
 =?utf-8?B?ZXkxaURZN1NvdUVzSWwvTjFGM016KzZ2MzVJMzRyNXRzcWtvNVY0S1dWK0Rj?=
 =?utf-8?B?MGRUcy82M1NoaFlOYWpmN2I3eDUvNFZ2aUdrQUF4eDA3blN4cjJSak4vQkRw?=
 =?utf-8?B?V0tSSnBwdlhVczZ3OHhiTTlMUzZ6OStMc3FOcWxVWDBDdDdEMFg5Y2dFdmF3?=
 =?utf-8?B?WFNPQUxRSGV2UmR5M2FxTmc5ZGxHVEtDek5kRTNwcThhWEI5QS9WK0dUWlFI?=
 =?utf-8?B?Z3lWOHJFK0d3RVVTeVdhbGw5c2U3TkFna0p5TWc5L3k1ZUhkbmJ4UW1SYTEy?=
 =?utf-8?B?MytmazVMR0pDQTVBOWkwYTNHdzBWOVprMGdoUW40NjhHOTA5eENqRHdERHdH?=
 =?utf-8?B?OFROS3VYY2QxbVI4NGNyYVMwNFJzcTh3alZYT3VuVkk3YUpjNVl5OTVqL3ll?=
 =?utf-8?B?VWU5MExDN2NDTUlBSnRTdmV6NEljYVd4YXI0Rm1meTBCdUpBQU9Bam5kSUJY?=
 =?utf-8?B?L1VVSytKdHI2TnU2QTFkaS80eUFTUWJtR2djUmpPSGJNU0pndm9UY2IzRVNn?=
 =?utf-8?B?cU5XdFMxaW04cndyMThmV2FiRHlheCswUm0wUWNXMUo4dlA0NXBZZGlJSEVa?=
 =?utf-8?B?RW56ZUlZcHlWYitJSE9aL1p5L3BONURIL0NSMERpbHJyYUF0QVZLNjM3NUpX?=
 =?utf-8?B?dEgwWUkzTzRTKy9RVHkyOE4zWFo4RHJUQThnR1pBdzB1NVZPbStuYmNmZWpu?=
 =?utf-8?B?emtQcHNreFZxN2FkREJDNjRHMVZVWTlXTFZaMFFYY3pja2JYV1NoSUl5bTdL?=
 =?utf-8?B?Y3UwWm5SMytndkdRdkRxZ0xmZStMSURGZllGVi8wRXRIK1R0WjMwQ3YrczZK?=
 =?utf-8?B?N1V4c016M1JhU1BZeDhKaTBnV3NxV3YxaWhRdTM3TmsxYkZ5b2M4YmhlelJp?=
 =?utf-8?B?WUVsK25VWEdGN3E4dGo4Q3lNQjNMOFFJQ0NHcHRJNDhIcGw5UURVQ2poT05X?=
 =?utf-8?B?VmtWR1hJVy85bHU2c3FPR0txT3JwRk9rK2RuL3FhMU44aGo5OWZUV3dkSkM2?=
 =?utf-8?B?eVR3a214bnJGTVJnN2d0NktCUHQyNzdzWFg5d2l2NFdzRk1PZk9ZVWE2ZWpB?=
 =?utf-8?B?ZSsxSFRydmJ1TFpqVCsxVE93S3JhZzlHakdtQnpyM2s3MERMRWdaaGwwMzdt?=
 =?utf-8?B?Y01EcFhuMExwRW5Oa2Z4eXB3akVQYi9SZU93VFY4UTBBZXpBT25MUFd1S1RP?=
 =?utf-8?B?dVpyQU9hMDNrMUl2aEI1YjJYZ2VXMk1xZ2owd0JheUlhVHBTK3o2UGhqR3Ev?=
 =?utf-8?B?UUpTVU4rVjVmcjVvUmtMYkk4T2pDMVlNZUpmUHVNd0V1U05JQWx3cTlVVVVn?=
 =?utf-8?Q?XjOWtV7DV0AJ35HapN1sFSkDg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560e07fa-28b8-429d-0005-08dc443bfb7d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 15:32:39.5922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oFRFT1owoE1PDW/ZjhfpYR1xIAKcG7qqy3/42/hAzi8xapPp6Y4r/4+tZk2E0/Es5aHS8ojjzyw2R/RdGF7LSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017
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

+ Johannes

Regards
Shashank

On 13/03/2024 18:22, Sharma, Shashank wrote:
> Hello Johannes,
>
> On 07/03/2024 23:07, Johannes Weiner wrote:
>> An errant disk backup on my desktop got into debugfs and triggered the
>> following deadlock scenario in the amdgpu debugfs files. The machine
>> also hard-resets immediately after those lines are printed (although I
>> wasn't able to reproduce that part when reading by hand):
>>
>> [ 1318.016074][ T1082] 
>> ======================================================
>> [ 1318.016607][ T1082] WARNING: possible circular locking dependency 
>> detected
>> [ 1318.017107][ T1082] 6.8.0-rc7-00015-ge0c8221b72c0 #17 Not tainted
>> [ 1318.017598][ T1082] 
>> ------------------------------------------------------
>> [ 1318.018096][ T1082] tar/1082 is trying to acquire lock:
>> [ 1318.018585][ T1082] ffff98c44175d6a0 (&mm->mmap_lock){++++}-{3:3}, 
>> at: __might_fault+0x40/0x80
>> [ 1318.019084][ T1082]
>> [ 1318.019084][ T1082] but task is already holding lock:
>> [ 1318.020052][ T1082] ffff98c4c13f55f8 
>> (reservation_ww_class_mutex){+.+.}-{3:3}, at: 
>> amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
>> [ 1318.020607][ T1082]
>> [ 1318.020607][ T1082] which lock already depends on the new lock.
>> [ 1318.020607][ T1082]
>> [ 1318.022081][ T1082]
>> [ 1318.022081][ T1082] the existing dependency chain (in reverse 
>> order) is:
>> [ 1318.023083][ T1082]
>> [ 1318.023083][ T1082] -> #2 (reservation_ww_class_mutex){+.+.}-{3:3}:
>> [ 1318.024114][ T1082] __ww_mutex_lock.constprop.0+0xe0/0x12f0
>> [ 1318.024639][ T1082]        ww_mutex_lock+0x32/0x90
>> [ 1318.025161][ T1082]        dma_resv_lockdep+0x18a/0x330
>> [ 1318.025683][ T1082]        do_one_initcall+0x6a/0x350
>> [ 1318.026210][ T1082]        kernel_init_freeable+0x1a3/0x310
>> [ 1318.026728][ T1082]        kernel_init+0x15/0x1a0
>> [ 1318.027242][ T1082]        ret_from_fork+0x2c/0x40
>> [ 1318.027759][ T1082]        ret_from_fork_asm+0x11/0x20
>> [ 1318.028281][ T1082]
>> [ 1318.028281][ T1082] -> #1 (reservation_ww_class_acquire){+.+.}-{0:0}:
>> [ 1318.029297][ T1082]        dma_resv_lockdep+0x16c/0x330
>> [ 1318.029790][ T1082]        do_one_initcall+0x6a/0x350
>> [ 1318.030263][ T1082]        kernel_init_freeable+0x1a3/0x310
>> [ 1318.030722][ T1082]        kernel_init+0x15/0x1a0
>> [ 1318.031168][ T1082]        ret_from_fork+0x2c/0x40
>> [ 1318.031598][ T1082]        ret_from_fork_asm+0x11/0x20
>> [ 1318.032011][ T1082]
>> [ 1318.032011][ T1082] -> #0 (&mm->mmap_lock){++++}-{3:3}:
>> [ 1318.032778][ T1082]        __lock_acquire+0x14bf/0x2680
>> [ 1318.033141][ T1082]        lock_acquire+0xcd/0x2c0
>> [ 1318.033487][ T1082]        __might_fault+0x58/0x80
>> [ 1318.033814][ T1082] amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu]
>> [ 1318.034181][ T1082]        full_proxy_read+0x55/0x80
>> [ 1318.034487][ T1082]        vfs_read+0xa7/0x360
>> [ 1318.034788][ T1082]        ksys_read+0x70/0xf0
>> [ 1318.035085][ T1082]        do_syscall_64+0x94/0x180
>> [ 1318.035375][ T1082] entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> [ 1318.035664][ T1082]
>> [ 1318.035664][ T1082] other info that might help us debug this:
>> [ 1318.035664][ T1082]
>> [ 1318.036487][ T1082] Chain exists of:
>> [ 1318.036487][ T1082]   &mm->mmap_lock --> 
>> reservation_ww_class_acquire --> reservation_ww_class_mutex
>> [ 1318.036487][ T1082]
>> [ 1318.037310][ T1082]  Possible unsafe locking scenario:
>> [ 1318.037310][ T1082]
>> [ 1318.037838][ T1082]        CPU0                    CPU1
>> [ 1318.038101][ T1082]        ----                    ----
>> [ 1318.038350][ T1082]   lock(reservation_ww_class_mutex);
>> [ 1318.038590][ T1082] lock(reservation_ww_class_acquire);
>> [ 1318.038839][ T1082] lock(reservation_ww_class_mutex);
>> [ 1318.039083][ T1082]   rlock(&mm->mmap_lock);
>> [ 1318.039328][ T1082]
>> [ 1318.039328][ T1082]  *** DEADLOCK ***
>> [ 1318.039328][ T1082]
>> [ 1318.040029][ T1082] 1 lock held by tar/1082:
>> [ 1318.040259][ T1082]  #0: ffff98c4c13f55f8 
>> (reservation_ww_class_mutex){+.+.}-{3:3}, at: 
>> amdgpu_debugfs_mqd_read+0x6a/0x250 [amdgpu]
>> [ 1318.040560][ T1082]
>> [ 1318.040560][ T1082] stack backtrace:
>> [ 1318.041053][ T1082] CPU: 22 PID: 1082 Comm: tar Not tainted 
>> 6.8.0-rc7-00015-ge0c8221b72c0 #17 
>> 3316c85d50e282c5643b075d1f01a4f6365e39c2
>> [ 1318.041329][ T1082] Hardware name: Gigabyte Technology Co., Ltd. 
>> B650 AORUS PRO AX/B650 AORUS PRO AX, BIOS F20 12/14/2023
>> [ 1318.041614][ T1082] Call Trace:
>> [ 1318.041895][ T1082]  <TASK>
>> [ 1318.042175][ T1082]  dump_stack_lvl+0x4a/0x80
>> [ 1318.042460][ T1082]  check_noncircular+0x145/0x160
>> [ 1318.042743][ T1082]  __lock_acquire+0x14bf/0x2680
>> [ 1318.043022][ T1082]  lock_acquire+0xcd/0x2c0
>> [ 1318.043301][ T1082]  ? __might_fault+0x40/0x80
>> [ 1318.043580][ T1082]  ? __might_fault+0x40/0x80
>> [ 1318.043856][ T1082]  __might_fault+0x58/0x80
>> [ 1318.044131][ T1082]  ? __might_fault+0x40/0x80
>> [ 1318.044408][ T1082]  amdgpu_debugfs_mqd_read+0x103/0x250 [amdgpu 
>> 8fe2afaa910cbd7654c8cab23563a94d6caebaab]
>> [ 1318.044749][ T1082]  full_proxy_read+0x55/0x80
>> [ 1318.045042][ T1082]  vfs_read+0xa7/0x360
>> [ 1318.045333][ T1082]  ksys_read+0x70/0xf0
>> [ 1318.045623][ T1082]  do_syscall_64+0x94/0x180
>> [ 1318.045913][ T1082]  ? do_syscall_64+0xa0/0x180
>> [ 1318.046201][ T1082]  ? lockdep_hardirqs_on+0x7d/0x100
>> [ 1318.046487][ T1082]  ? do_syscall_64+0xa0/0x180
>> [ 1318.046773][ T1082]  ? do_syscall_64+0xa0/0x180
>> [ 1318.047057][ T1082]  ? do_syscall_64+0xa0/0x180
>> [ 1318.047337][ T1082]  ? do_syscall_64+0xa0/0x180
>> [ 1318.047611][ T1082]  entry_SYSCALL_64_after_hwframe+0x46/0x4e
>> [ 1318.047887][ T1082] RIP: 0033:0x7f480b70a39d
>> [ 1318.048162][ T1082] Code: 91 ba 0d 00 f7 d8 64 89 02 b8 ff ff ff 
>> ff eb b2 e8 18 a3 01 00 0f 1f 84 00 00 00 00 00 80 3d a9 3c 0e 00 00 
>> 74 17 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 5b c3 66 2e 0f 1f 84 00 00 
>> 00 00 00 53 48 83
>> [ 1318.048769][ T1082] RSP: 002b:00007ffde77f5c68 EFLAGS: 00000246 
>> ORIG_RAX: 0000000000000000
>> [ 1318.049083][ T1082] RAX: ffffffffffffffda RBX: 0000000000000800 
>> RCX: 00007f480b70a39d
>> [ 1318.049392][ T1082] RDX: 0000000000000800 RSI: 000055c9f2120c00 
>> RDI: 0000000000000008
>> [ 1318.049703][ T1082] RBP: 0000000000000800 R08: 000055c9f2120a94 
>> R09: 0000000000000007
>> [ 1318.050011][ T1082] R10: 0000000000000000 R11: 0000000000000246 
>> R12: 000055c9f2120c00
>> [ 1318.050324][ T1082] R13: 0000000000000008 R14: 0000000000000008 
>> R15: 0000000000000800
>> [ 1318.050638][ T1082]  </TASK>
>>
>> amdgpu_debugfs_mqd_read() holds a reservation when it calls
>> put_user(), which may fault and acquire the mmap_sem. This violates
>> the established locking order.
>>
>> Bounce the mqd data through a kernel buffer to get put_user() out of
>> the illegal section.
>>
>> Fixes: 445d85e3c1df ("drm/amdgpu: add debugfs interface for reading 
>> MQDs")
>> Cc: stable@vger.kernel.org        [v6.5+]
>> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c | 46 +++++++++++++++---------
>>   1 file changed, 29 insertions(+), 17 deletions(-)
>>
>> This fixes the lockdep splat for me, and the hexdump of the output
>> looks sane after the patch. However, I'm not at all familiar with this
>> code to say for sure that this is the right solution. The mqd seems
>> small enough that the kmalloc won't get crazy.
> Yeah, MQDs sizes are within range (so far :))
>> I'm also assuming that
>> ring->mqd_size is safe to access before the reserve & kmap. Lastly I
>> went with an open loop instead of a memcpy() as I wasn't sure if that
>> memory is safe to address a byte at at time.
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> index 5505d646f43a..06f0a6534a94 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c
>> @@ -524,46 +524,58 @@ static ssize_t amdgpu_debugfs_mqd_read(struct 
>> file *f, char __user *buf,
>>   {
>>       struct amdgpu_ring *ring = file_inode(f)->i_private;
>>       volatile u32 *mqd;
>> -    int r;
>> +    u32 *kbuf;
>> +    int r, i;
>>       uint32_t value, result;
>>         if (*pos & 3 || size & 3)
>>           return -EINVAL;
>>   -    result = 0;
>> +    kbuf = kmalloc(ring->mqd_size, GFP_KERNEL);
>> +    if (!kbuf)
>> +        return -ENOMEM;
>>         r = amdgpu_bo_reserve(ring->mqd_obj, false);
>>       if (unlikely(r != 0))
>> -        return r;
>> +        goto err_free;
>>         r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&mqd);
>> -    if (r) {
>> -        amdgpu_bo_unreserve(ring->mqd_obj);
>> -        return r;
>> -    }
>> +    if (r)
>> +        goto err_unreserve;
>>   +    /*
>> +     * Copy to local buffer to avoid put_user(), which might fault
>> +     * and acquire mmap_sem, under reservation_ww_class_mutex.
>> +     */
>> +    for (i = 0; i < ring->mqd_size/sizeof(u32); i++)
>> +        kbuf[i] = mqd[i];
>
> memcpy is safe to use here.
>
> With that change, please feel free to use: Reviewed-by: Shashank 
> Sharma <shashank.sharma@amd.com>
>
> - Shashank
>
>> +
>> +    amdgpu_bo_kunmap(ring->mqd_obj);
>> +    amdgpu_bo_unreserve(ring->mqd_obj);
>> +
>> +    result = 0;
>>       while (size) {
>>           if (*pos >= ring->mqd_size)
>> -            goto done;
>> +            break;
>>   -        value = mqd[*pos/4];
>> +        value = kbuf[*pos/4];
>>           r = put_user(value, (uint32_t *)buf);
>>           if (r)
>> -            goto done;
>> +            goto err_free;
>>           buf += 4;
>>           result += 4;
>>           size -= 4;
>>           *pos += 4;
>>       }
>>   -done:
>> -    amdgpu_bo_kunmap(ring->mqd_obj);
>> -    mqd = NULL;
>> -    amdgpu_bo_unreserve(ring->mqd_obj);
>> -    if (r)
>> -        return r;
>> -
>> +    kfree(kbuf);
>>       return result;
>> +
>> +err_unreserve:
>> +    amdgpu_bo_unreserve(ring->mqd_obj);
>> +err_free:
>> +    kfree(kbuf);
>> +    return r;
>>   }
>>     static const struct file_operations amdgpu_debugfs_mqd_fops = {
