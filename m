Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0618F609F3D
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 12:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C3C410E340;
	Mon, 24 Oct 2022 10:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202A110E348
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 10:42:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E4VWa7o0uwg2p2jUrtAcHOR8E06/cTIgPhbGpWdJ5Q+22hRAMVY61zlxpUHGNYUFgLiWrXV7jATKvxTix0Dz++qrl7uafX0sh9abVABCBG64TPaOgBucCidxKO23LxJHEYzflqzmjrxScmJTV4nS+9UlGYFWI5TsoSragykU9Nunoc1nfHT0CDlKw5C0lWIsLOEnUBhXYls/Mf8DFgfRJpid+7+WXw3XMOCcH33K9WNrdcaHZEebUsrIUB33C2HWrDX3y13UfJQ+Gwte2tmggJIAUylZekvfv7gov7n4TsD/FkCm7SPwd12CxdQgRKUxL/8D773geaAcB3w4O5+mDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6AeeIx/8PMwIgB0JVP+672PFr3xIoEnt4b1wqxEphI=;
 b=laes5sUAIu5GyUkM5lvgYu5u2SHjE0PS/4NipBx7yacGEhyOghLMxinBhT8js2kgSVrITEllH8aEdelEBzGaUsORwKOmY1H8FBVnUXVbYTn9Y9w0ANHb0T/oCKOVR4yR/sMZe/WupO7NQOuQGnhgO5dTWi9SgBGjfZ+XVVUx5B0pIJcCPKp7Nbskl9dCAqQBuNTCb48XG0Tfgi760TpPQRMBiukrXxY9yH1TaFeVxOHzKyianZth6zwEdvz8Z8Xi72gdVdGUxuk00+BYJc/RqdQdCFl/uR367pDy5RdU9FkKPUVKIiHbJw1DyfcDPaEig3dEeAiagKmz8fxUkZ/OyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6AeeIx/8PMwIgB0JVP+672PFr3xIoEnt4b1wqxEphI=;
 b=Csh9jXOtcLLlQdApbLsaVmGQMu/ZQZ6zY+8OSiei6NP0cKyi1ip47puDrNFtcYMXTPEarj7BqBAHeVVXtB/b++zmOJPa5hEvG/mjOAbH879zxMTlaaN9z+1pxRr6mzoa1rgMZ4CsixHEyIUYXeYSbrx5W6pnpNv3xet6WCcGnHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4381.namprd12.prod.outlook.com (2603:10b6:806:70::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 10:42:32 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 10:42:32 +0000
Message-ID: <cc300dfb-93dd-9bdf-540a-07a3891d863e@amd.com>
Date: Mon, 24 Oct 2022 12:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH] drm/scheduler: Set the FIFO schedulig policy as the
 default
Content-Language: en-US
To: Luben Tuikov <luben.tuikov@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
References: <20221022010945.95560-1-luben.tuikov@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221022010945.95560-1-luben.tuikov@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0743.eurprd06.prod.outlook.com
 (2603:10a6:20b:487::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ed0f90-b65a-4d0d-bf73-08dab5ac7475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FV8FG4jMxq5Ilhc9Cos/8ClA5HSlYG3v7QoMg+GrVxypkDHPyMLXQMTJveBsaJUKHKa6N/t1l3z2ndPP2jOyYhLMLHwMNz4OehS7mWykduyDSZ351ULvgo6FRnUYjB/gP3/tR+POy7VUCOjGmC420CH7UpNKa3SaknkUTnRzD3Pl/LJJhZqki7AX+yr6tjvaikPkmk37VoWGBwVCFqy4eogOW/3ubKUAhbGsrXYhZ3Y2Y9OgAo99Ad8Ern8WDj/6+B72fRknMk4YdybmPxf8VNy1KwCxDJlSsTypACC8bnJ54cOu/lA3udHkzdKOBYvvXIlTgORnhhuTokrVpjKhJ4xt/ZiLVHpXf2rhYTzUfok5+Vra2LtN0r+4kiiUxwpsgH6FTgrvE0IysZs7Zsk/cQEOfo3g0mAjoGUvXzLHl4c6dGcnN+jNQg0FOPq7nHiE8NX+4Xh+9WgX+KMNPK4ubbuTH27TiSSLSzNhR1SoER3pKmZtsKVptPYI2k7dTGjuS+jlvZpiUw9d/kLkbrxPyl80Tkzu4jxDZnBuAGu9FFOrK3RXtpaCsSzBb0L4khZBeJAMxFt0ZFxiF7KxmRoW3UuLfHbyJezZhEvXd+/jVMTU68T0/U13QckWgHJCWelqkMO/jKqatCiGuRVvUdtlKLwNDR9NhdX+5ibB6EktEczv8jTVrCkALalLFYR9LpGO5HsO6gD8zIimRJacMXxq3om63Qx9d1uqkmsP9/uYqqddtZx11QT2reh0N4uJgAlyBu8SQExwAnnEmXzvCYZzeB/9uueBDIOM8v+QBWiu6NA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199015)(31686004)(6512007)(316002)(26005)(110136005)(36756003)(66476007)(4326008)(8676002)(66556008)(86362001)(31696002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(6666004)(478600001)(6486002)(6506007)(83380400001)(66574015)(38100700002)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajBkVXBUem5Ma0VYaUEvN0FkOU5SRnhieVIzY0xRWEFvbXpTU05Ob0xVdFlI?=
 =?utf-8?B?SG5vMEJreUZyaEYyV2ZNTTRyK0lEV1Vkb2VCVWtpUWFxWFNBMFk4azRGSFF6?=
 =?utf-8?B?dGwzSkdncjNxUnNSTXVMamxtdHlMZ2hxWVN6NUpGcUd3ZFAxYzBzTFJ6MDFF?=
 =?utf-8?B?K3NXa2hqa0s0QnFQejJWRHFOREN4STZ3NDZPTDFNbVlXdlYxWWZCZGhralJv?=
 =?utf-8?B?ZDUxZmp1UDh1V2RsM2x0Umc0RVNCOG42R3VjSzV2NU14MXBVSStDY0plNThr?=
 =?utf-8?B?ejlsekx6enc4Z2lpaTdsL3BwTi9zYmtHeER2eWVPRk5uajdCeFVqQTFhRTdE?=
 =?utf-8?B?TEJobHloa0hINFFDZU1lRTdPMllhWlo5WUlMNlB0WTNmS2NGaVU2SGhoM1pO?=
 =?utf-8?B?N3Z1MER2cTJLU1VaQzdDK1lCbjlZU2xPVnN2bVJkbEtJZ3ZvUHl4ODlyYVB3?=
 =?utf-8?B?TFoyZVZHWWtaSkJ4THIxT2hJRDhvenduKzNVZDFLaUVDckFsOGxnK3J1Vlhr?=
 =?utf-8?B?TmNKWnN4YktQRGJKbWNQcjM3b0hWbVJWazdJWGo3NTRZUDJlUzlyTXE1djNw?=
 =?utf-8?B?YjBPQVRxcmQxWXZBNWRmOTZ4dUplQVdPVXlrZU9DUmtrbUhGc28vS04vUmhx?=
 =?utf-8?B?VHZIZXZGU0NSU3pCUEMyWTNaSDJqOHltMDZ0LzJHa0xzL3l4M2JRamNqTzdU?=
 =?utf-8?B?ZVBLVjI1TlI0bUd1VGMyTThGbHp2NzFzajBwYjF5Z3dTaWN2bldBZW1PNmIr?=
 =?utf-8?B?R1RNR3F1cXAvbXVrVG5GdGlnc2tKWjJOMmUvMVd4cEo5ZHRocWMvWjhsQUlX?=
 =?utf-8?B?VU9pQW5BMEROK1R4SVZRdk8vR1RTZXlWL0tDUmtNUVZ5VmdVbDA2OU1QOVBv?=
 =?utf-8?B?WVVlYWJmRFh5U0puSXBkTGNFZUdVVzNSQ0NTQmdlNFp2ZDBTVTJ1YTdHTTdM?=
 =?utf-8?B?R3pCUHlXbHdsYWdscnJhU0hQQW9KSDNSczU3YzgwNGttOW5RVm1abTF4NXNR?=
 =?utf-8?B?d29IT2JBRDBiMDZOUTZnRXI5VkpvQnlWSzlORjJIbngvYnJSVThXM2lOdng1?=
 =?utf-8?B?TStHeUZmbkxNN0RyRjNKZTlpZEtkem03MkFpWWlEYzQrdUg4c2YxYXVsQnJh?=
 =?utf-8?B?TWtBVkxuQ0oxUVV5WTJTdWhHQ2NTQ2tzNkh4MlJ2UU9Sd1M1ZFpHUUFwSnE4?=
 =?utf-8?B?VVJJdTVrTVh6Q2F3ZDlucWJYUU5vSWM5VGVHby96U2xJK2JRYUdBb0JrMGtz?=
 =?utf-8?B?VVlrUzB6dXV3cy9TbXJBUHRIUzJKSmVBd3VOVzFERVNwcGNoOU1pZmx0bktz?=
 =?utf-8?B?N0ZQSXlSZldST0w0clJ0UjJnWS9uZGhwQVV5dDVIL2pRdTJSU3dtVjFnY3RG?=
 =?utf-8?B?ZURtQm5MdFB1RWwzdTZ2cm9Fd3NVdmU3Z2RzdzVlUnkrUGo4WWY4dGg2cGhP?=
 =?utf-8?B?T3FnbS9TL0pHNGhvZDA0RkczczRneWlWZGNISXNVVlB0WFBJZVN1NGl0TWFM?=
 =?utf-8?B?WURjT0RlQ1Y2Z2VpSmNYMWFNTngzeDFtTnBSNEFQNXRDSjRmQzZkclRjcmxJ?=
 =?utf-8?B?WmptaFBFVzFUMDZEZm1Pa0xrNkdYamtqRE4xTDNWMmVUczh2MFNmU2VLY0R5?=
 =?utf-8?B?VlU3QzR3cjRXSjA4SDJGOUprWVpvNzlFZlZKbU52bTRYbThKSjJ6dGpkV3lQ?=
 =?utf-8?B?Z0llQnZENjNhZzlCZkdnQlQweWhEeG1kZDRJdVVhMFRmRG1SUDYvVldNTGVq?=
 =?utf-8?B?eGtzQ1E4TDJWdmNUWGdrNE5nQ3d4T205Mzc4QURuYXNGelVaU1FaU2NVSHhI?=
 =?utf-8?B?a0dleGlQUVFRYThtN3d6ekdYZ1BzMkd0UXlPeGt1c3VyRnR1TVJVNFVCYXBF?=
 =?utf-8?B?REhXL2dKRXVSZnFteGNVeEhwcVZXekdVN1VKY1NSd0RBcDc1NkkrUFNOaXls?=
 =?utf-8?B?SkRKN2lDZzhhVk5ZTC9jT2VsTG9MeDd4ZkVqd3phcG5YNDI4TENGVC9RbWd3?=
 =?utf-8?B?VUwxUzJZQktOejdXbWVhQkJjWmp2UVUzbWdNQm9MUjJlcW5Pc2VMblJCK2xt?=
 =?utf-8?B?eW9YUmhqS0NPVUp5WDF4d0FXWlE5dlV0emx5NSt3R0hRdmFPU09PeUxTanJI?=
 =?utf-8?Q?6L76s5/RWnlc2s0/w35KYsm0o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ed0f90-b65a-4d0d-bf73-08dab5ac7475
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 10:42:32.1253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXGPTRufcIkjkbGli2x9SYWT/sMx6quS0jn3vUp1xJZX7JrHQ+cfwqOi+PNLHiyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4381
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.10.22 um 03:09 schrieb Luben Tuikov:
> The currently default Round-Robin GPU scheduling can result in starvation
> of entities which have a large number of jobs, over entities which have
> a very small number of jobs (single digit).
>
> This can be illustrated in the following diagram, where jobs are
> alphabetized to show their chronological order of arrival, where job A is
> the oldest, B is the second oldest, and so on, to J, the most recent job to
> arrive.
>
>      ---> entities
> j | H-F-----A--E--I--
> o | --G-----B-----J--
> b | --------C--------
> s\/ --------D--------
>
> WLOG, asuming all jobs are "ready", then a R-R scheduling will execute them
> in the following order (a slice off of the top of the entities' list),
>
> H, F, A, E, I, G, B, J, C, D.
>
> However, to mitigate job starvation, we'd rather execute C and D before E,
> and so on, given, of course, that they're all ready to be executed.
>
> So, if all jobs are ready at this instant, the order of execution for this
> and the next 9 instances of picking the next job to execute, should really
> be,
>
> A, B, C, D, E, F, G, H, I, J,
>
> which is their chronological order. The only reason for this order to be
> broken, is if an older job is not yet ready, but a younger job is ready, at
> an instant of picking a new job to execute. For instance if job C wasn't
> ready at time 2, but job D was ready, then we'd pick job D, like this:
>
> 0 +1 +2  ...
> A, B, D, ...
>
> And from then on, C would be preferred before all other jobs, if it is ready
> at the time when a new job for execution is picked. So, if C became ready
> two steps later, the execution order would look like this:
>
> ......0 +1 +2  ...
> A, B, D, E, C, F, G, H, I, J
>
> This is what the FIFO GPU scheduling algorithm achieves. It uses a
> Red-Black tree to keep jobs sorted in chronological order, where picking
> the oldest job is O(1) (we use the "cached" structure), and balancing the
> tree is O(log n). IOW, it picks the *oldest ready* job to execute now.
>
> The implemntation is already in the kernel, and this commit only changes
> the default GPU scheduling algorithm to use.
>
> This was tested and achieves about 1% faster performance over the Round
> Robin algorithm.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Cc: Direct Rendering Infrastructure - Development <dri-devel@lists.freedesktop.org>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 2fab218d708279..d0ff9e11cb69fa 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -62,13 +62,13 @@
>   #define to_drm_sched_job(sched_job)		\
>   		container_of((sched_job), struct drm_sched_job, queue_node)
>   
> -int drm_sched_policy = DRM_SCHED_POLICY_RR;
> +int drm_sched_policy = DRM_SCHED_POLICY_FIFO;
>   
>   /**
>    * DOC: sched_policy (int)
>    * Used to override default entities scheduling policy in a run queue.
>    */
> -MODULE_PARM_DESC(sched_policy, "Specify schedule policy for entities on a runqueue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin (default), " __stringify(DRM_SCHED_POLICY_FIFO) " = use FIFO.");
> +MODULE_PARM_DESC(sched_policy, "Specify the scheduling policy for entities on a run-queue, " __stringify(DRM_SCHED_POLICY_RR) " = Round Robin, " __stringify(DRM_SCHED_POLICY_FIFO) " = FIFO (default).");
>   module_param_named(sched_policy, drm_sched_policy, int, 0444);
>   
>   static __always_inline bool drm_sched_entity_compare_before(struct rb_node *a,
>
> base-commit: 16d2a3f2ad1d2b95bf9122c910c63b0efe74179d

