Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D986F42E1
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 13:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D3910E361;
	Tue,  2 May 2023 11:36:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2087.outbound.protection.outlook.com [40.107.243.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5F7E10E361
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 11:36:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ghRFwIkFCCjjxFOHiBgSccnHdhp4aYchXRpa8wWvqGyYtA5hH1YetxejBdgG4e6MYcxDep3f78IF7fbjzN31kL3XlaXG73uTMWMstFePIk4Ny290zgrisZudQ+CCyJqgwu3ZlknejCYi1D0zqzfA6Audg2Cz6At98tBkKTWif1olA7/XHV7PlOQgh0g8cSqXjxflmAJsyfwUPx6rt2F+AqP4C+iT3gQ/ErG749fU7uIV2VhBCkQUrPAT2tTgshl9iCt+Vg7mmhPBjXRBo/ELRwBgACZFHvLT7heiwQ0dk0DiJ48dhD2Rjnbxx2F44xs8GhdhO4mEu731gF+HnJk+UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eg67Y63cmdTHqNS2e7DcrLRW+Z3dGMAmH3/amUsIFnI=;
 b=ijbrcFg8MqhZidzwlqAH3OlKjhyg2IlA6QUq9xt/9HXfALEK36L/dLfYit/FN1/hfCkZFm0XjVbghXHRHjv6EFmNlueQjC6PaH51Nqh4sn8T+hF8oLQ3rzcz1HQGURVBU8EhJFLARXax5DxRyMnbeUUTMcMPwelMYz1XyYTDGoleaAw4AecWkbivuPIPLuBw9Hb7uzxm0GloERz0O4bJlhCVUmRjNSFv3NC1E7xKNikXO76T4Gk4j7p7iIwTuiS6UrzE7QPp3OWtXm0g2ifR+OXc630r82IjhKj9vwQo03/I/d36FK0Ax46Xmtbf0U9tm4aM5YLQg9KOzuEZpQL83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eg67Y63cmdTHqNS2e7DcrLRW+Z3dGMAmH3/amUsIFnI=;
 b=I+yy6ZsNJ2IhjcbFgXqJ7k69FlbwG1oJjrP5nbNUWD9lq+dpDjcT2aQElEXyZVrDXhiHu4NhBAdn4uATyQous00XdWiPP2apOKLX++95br1EYiq46pxjxoZwa+e3rMnJdDw542loq/pO7RdPhM/wC+1FVzF9H7fBUi1dZl3zgj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB5981.namprd12.prod.outlook.com (2603:10b6:8:7c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 11:36:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::d2f8:7388:39c1:bbed%3]) with mapi id 15.20.6340.031; Tue, 2 May 2023
 11:36:11 +0000
Message-ID: <5c4f4e89-6126-7701-2023-2628db1b7caa@amd.com>
Date: Tue, 2 May 2023 13:36:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: drm/sched: Replacement for drm_sched_resubmit_jobs() is deprecated
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20230502131941.5fe5b79f@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230502131941.5fe5b79f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0222.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|DS7PR12MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e9436f-fdde-426f-6464-08db4b016dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vlP+9rtLeVFiDLU9P090jhL6LipPNZPK1sNKjRwXV/LDagAzH6sFintcgflRHm8OFC5DixG19Ij5H78HTx7R9P4h802yJdDrRBt1C3/mIWvxvlRREQfh1tpw+jRiRSUSGtHrXt8bMIpQN/CL4bH+5IKCd+f/04iOtX/B9KGRb27NkUW8oZF2A1y7RYeN2Swvivov2GhkPNDfW9sbGTOEoAHePNpTcOSNTxaT7h8eFEZZvzno6RVNnhP7b2aXs1SUsgSas6/e8esrUXb3ROxUbZulc7t9hBDVpD4KrdUWR+/pOISYeqE13/jHeojJUHcGj9tfyBy96gqgXbH7W5dwS0UghZWP8wYys+9rpL6SfmShT2D4Kw/xhPU29Vldrpy3n9lwhqWLF4w60+WXWoc0Gzna55OJ1Z3mn0+9KY7VuAktQgfShRnHwVCH3NSdXXGnhm3TZIbmRAsj75scxyAL7gWi31qd5IAG/r4S1+7FbftYxyGviVvrZw92DwkMaBEdINgI1eKmnIVt0729EJ/kidR4tFo7R6bO80LwUuieLyW0nCZon83lFOCDYAK7vzxwRgsEENzD9rJjOhURGMSwIFP3bl7efZG507FR1ulXdk+n78sJMSrPuKcd9k73OKwl1IxHIM1k1xZasx1lAvvqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(4326008)(31686004)(316002)(6512007)(6506007)(8936002)(8676002)(31696002)(86362001)(5660300002)(478600001)(186003)(66946007)(54906003)(110136005)(83380400001)(2616005)(66556008)(41300700001)(6636002)(36756003)(2906002)(6666004)(6486002)(38100700002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHlUR0tuZnpuaHdjeUEwaUsvNVo4OHp6aTA1bEpOM1BXejI3M0d5Ymg5TXdH?=
 =?utf-8?B?cEVNNVdwbDNZMmhTM25YUzFzZHZJeXVsVHU1SWNMMDcwajh6NVowUDBoRGtl?=
 =?utf-8?B?aVd6TjV1UC85M1ZzVm9VQURXN1E0RnJJVVRPMmlGYTlJb21XMjlPaW9CMUF5?=
 =?utf-8?B?M1RhZG52a0lpS1VCKzhSbFZDbTVLM0YrMGhoNys2WFVxMVlwcU04R1FCdkZX?=
 =?utf-8?B?RmNoMkhDblJxTWcwZmx0bUprbjlOdjhEZUVWcWpFZ2hrVXEzTytSeTVab2xy?=
 =?utf-8?B?MUp6SGJiak5qbE85MG1lY1pmV3VZRU14cUhFKzRpSWREWmEwOGZ1VW9scVNH?=
 =?utf-8?B?aHBGVXNhWFVXRjRkKzZxQTVxRTV1QmFOUkRuNlkwejRmYkV0ZVZNUnlWY2Nx?=
 =?utf-8?B?enBpblZVVUZzYmtZTzZzcHhjL2EzMFloSTBTT0ovNU9yRkVYY0NsS210VlFk?=
 =?utf-8?B?dmp1TzNKZDhvdmo0ZzYrbk05RkVMR2dHdVBrNmxEandHeGhzdS8vRzBOZ01C?=
 =?utf-8?B?UDFic2sva1h4Y2sxUmdmaThyOHlybzFTdUkrMzRFZVpyanFDMUl6OHF1SHZk?=
 =?utf-8?B?ZkYrYk9GT0J6S3JTVExtQmg1bmw3T3ZyS3pmQ3cvWFBMVGlXY2hxTlVLaWZM?=
 =?utf-8?B?QmZKcFB4L3NXL3dCOHF3SkJ4dWYxZDBPd2tzQXdOOEZneTQ5Yk9pYjk1TGlH?=
 =?utf-8?B?dUltVXpMQjZzMnMwZGFxMC9Wdyt6eUlmWGdCZVg2SW1OQk9aeDJtUzhBVlJv?=
 =?utf-8?B?WmhpcXBhcXNrS1llSjd6QVRxaktUOFlsYlJKWFNnU0NzR1BybnJVN0s0T2hF?=
 =?utf-8?B?TlAyKzRJbG5zYzhwY3AvYzJGb1pBWDIrcVk5YnkrSkY0Mm14WVVlcWVqSytO?=
 =?utf-8?B?K29pT0VXdWdRb1ZzVzQwUm96Z2gxRVFJOWJ1RW5BNkx4M3dHM25nYVNFSUZD?=
 =?utf-8?B?WDRVQTBiMjlyTmdtQ0pRZ1ZQT3QzV3puemJQL1EzckhJRE5FcjhqdjdFVDlZ?=
 =?utf-8?B?cDZVdTU2cG1Ma0R5Rks3STVCdlJCZWNoVytTNmZCZGdaUEhtcWRwUnpuZ2dq?=
 =?utf-8?B?ZUx3a0I5blJlZFNNVnEzcENHR1dyRXlrVTZobmp1ZEQ0Z25tVHpaMXlnM2hp?=
 =?utf-8?B?eXBTWjA0SkVNZ3RVcDlOMFpXcVF4U2NyTzhueFJkMXh4eS90YytlcXRYc0Ji?=
 =?utf-8?B?NytkYnN2ai9Sa05ELzVSd1lvYm9BRnUyekpia3gwckg2Um81UkhTV2hpYWhj?=
 =?utf-8?B?UFJ1dXF4R3pXQU9XekhHTExBTzBMaUh2OUhYemFPeFl2TENZb2x5UmV0SHRi?=
 =?utf-8?B?Y0lTOXNTZkdPTWRubFV5ZEc5MnJvRmtWZ3A0eHdkRG8zLzlGUk5EMklWbFY2?=
 =?utf-8?B?YWwrbHEyVnZiTE5FM01hYWQ4VTNuSzY4d2UvYlVBLzRHTmhNV2FzakVmMk03?=
 =?utf-8?B?bXVoNnBzdVdrWWlPc2lUR05admxjUVU4OEFyMFQzY09yRHJUamtyMVVVZFgy?=
 =?utf-8?B?UzZLRkQvejc4VUdaNXlVSWpraCtpMkJzRVNJZ2Zrb0M1OFRrcnRZR3JFRzBU?=
 =?utf-8?B?ME93NUVpTEhOcUNNSnF0dUVYdEgvdjdFay9idGZWS1FXUXJyUE5SRXNMVHZr?=
 =?utf-8?B?S0lDczY2THloMDFoQTJGb1JZSTQ3VUYwOEJaaEM0TjlRQ0JpQm9jQ2wvVko1?=
 =?utf-8?B?V0UwdUFpTks0TG9jMW4yeXJJQ2d1dnRXTlZnZ0NCWHJCVUtNUXVpamE1U1NU?=
 =?utf-8?B?bCtFdmk4N1RxWWNGM1JUWXpGcm9GUWZCWGZzN2o4dWNKVHhOditKaG5ZTG5l?=
 =?utf-8?B?bS9SSDRQR2VVTndFL1M5c1Y5eDU5dVNLZUk4bjd0MGQ3U3VPQ2kvTGZWY01w?=
 =?utf-8?B?NmpZUk1KMVMzUzJzYzZBWW91QXBxSFBSeDJJOWhxMU0wNmNtbzZoZjV0STNK?=
 =?utf-8?B?ZTU2bGJrZnRtNldNRlN3UVhrc2FPVTBhQ21QSm9tN1VaUkdYOFgyZXBKWTlY?=
 =?utf-8?B?d0JUU1RWYVk2WGtoOTF3Tkl4ckpyWmF4WngxcjUvVDZMaWxQNG9INXNBa1hN?=
 =?utf-8?B?MlNSYjlBQ3Y0MFJwRFFnSjNIeWFUL1YrMG02VzNqbThxWFRRL0h3aEMvQzQ5?=
 =?utf-8?B?QzJyVDB0L2hPQ1ZQMW9Xa3lKY0JIRjhEemZkRll0VytObENaUFpveFYyZlJi?=
 =?utf-8?Q?9KX/GgHDX0TQDY4djEig+1c0u+ue8+ZHeArmcNPYtkcA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e9436f-fdde-426f-6464-08db4b016dda
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 11:36:11.5071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ltuEkQpDQFqVJ6EhFHeTz6kvxMCBp+369kuuJf3bgjC5rvB2wkdCKqma6Sewg2Ep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5981
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Am 02.05.23 um 13:19 schrieb Boris Brezillon:
> Hello Christian, Alex,
>
> As part of our transition to drm_sched for the powervr GPU driver, we
> realized drm_sched_resubmit_jobs(), which is used by all drivers
> relying on drm_sched right except amdgpu, has been deprecated.
> Unfortunately, commit 5efbe6aa7a0e ("drm/scheduler: deprecate
> drm_sched_resubmit_jobs") doesn't describe what drivers should do or use
> as an alternative.
>
> At the very least, for our implementation, we need to restore the
> drm_sched_job::parent pointers that were set to NULL in
> drm_sched_stop(), such that jobs submitted before the GPU recovery are
> considered active when drm_sched_start() is called. That could be done
> with a custom pending_list iteration restoring drm_sched_job::parent's
> pointer, but that seems odd to let the scheduler backend manipulate
> this list directly, and I suspect we need to do other checks, like the
> karma vs hang-limit thing, so we can flag the entity dirty and cancel
> all jobs being queued there if the entity has caused too many hangs.
>
> Now that drm_sched_resubmit_jobs() has been deprecated, that would be
> great if you could help us write a piece of documentation describing
> what should be done between drm_sched_stop() and drm_sched_start(), so
> new drivers don't come up with their own slightly different/broken
> version of the same thing.

Yeah, really good point! The solution is to not use drm_sched_stop() and 
drm_sched_start() either.

The general idea Daniel, the other Intel guys and me seem to have agreed 
on is to convert the scheduler thread into a work item.

This work item for pushing jobs to the hw can then be queued to the same 
workqueue we use for the timeout work item.

If this workqueue is now configured by your driver as single threaded 
you have a guarantee that only either the scheduler or the timeout work 
item is running at the same time. That in turn makes starting/stopping 
the scheduler for a reset completely superfluous.

Patches for this has already been floating on the mailing list, but 
haven't been committed yet. Since this is all WIP.

In general it's not really a good idea to change the scheduler and hw 
fences during GPU reset/recovery. The dma_fence implementation has a 
pretty strict state transition which clearly say that a dma_fence should 
never go back from signaled to unsignaled and when you start messing 
with that this is exactly what might happen.

What you can do is to save your hw state and re-start at the same 
location after handling the timeout.

Regards,
Christian.

>
> Thanks in advance for your help.
>
> Regards,
>
> Boris

