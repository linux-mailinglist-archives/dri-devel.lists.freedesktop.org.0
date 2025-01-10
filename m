Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8ECA08A9D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 09:44:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C2C10E14C;
	Fri, 10 Jan 2025 08:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A3ce7/Rz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F5610E14C
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 08:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPx+RiJuIQ6wLhNwSd0JIkyZDXPbfZYKoE4+/BA+j9ekNRJJI96+iznybVTgRZkGjiW21VqzbmXFd4Tpo1hrzx8ozI+LIyw7q0gbpuANcZ/I9x3w1nBIGWDrlRffGNKtd+RVP3VRjKRwMADvfdfmeN5Kd2yuJJBfev94uP1Va6JEiozFcglm7r8Ox/khzaQ3L4V1SjNXCnpRDjgwkm6qMxB/MW/x4+5Kd2NiFe+4+AbQAuTph0TsqzlUs8gJM+tCDc3vq2jLaZpUQ42Q8qHrHYwWrtstCj5hIglTTPvdW6dpbBmN2bVownRTQeYQ8Mh/DyqEEDHDJPJAgqKAz3ZOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/V8pTqcz7i1ENG/O/v7nf0GHPaFJ2/9Uhks2uZQ3Khc=;
 b=rW6EXJRUqy5iBdTLvYCdaKujgLRflWUwe3pkH2a9dinZCfYOHCX/Y5pRg91JV8U1Phd6WcUDX06IgymSIWvVHhymQhGHdSxxu692BOWaQQPlhwrYa3YUf0eFq9Tw6rTFeQyubewoAIYZXyRCsymoNQyzQ9/0i8Clk5Hte2AIKwjFeHeMDAcj9kHBLZ0jzh+5zMnFsu9057MUX2TGBbVf1oTxu0DpdiKMNlQ9wLWExKwgFLhZwUkdvtVbbIblW1G+LS00SknZ63mefPHj0sygH00FHlkVSIU3ZXW/hq+Y3Si3bk2Fcx1XCnthY5u8SdTpVnxUQy7azCd+6p0mEdBfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/V8pTqcz7i1ENG/O/v7nf0GHPaFJ2/9Uhks2uZQ3Khc=;
 b=A3ce7/RzLWskyl5wLP1/qMK/IRqOZX1mTIN/yfhKwcaaJmM9v0wkcemesj0mNhWZyV41s7bW9bEK2eiNxovmJEnA6nb11C4Ncg5YsTHB4B2APPW6yWBhLiPAp3vLto22vu1W5aWkcJYweMNF+OXl9zSsLxSx14MG2IroJr5Cg+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6340.namprd12.prod.outlook.com (2603:10b6:a03:453::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 08:44:37 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Fri, 10 Jan 2025
 08:44:37 +0000
Message-ID: <3c47ea32-eeb3-47f1-a626-5868457469ab@amd.com>
Date: Fri, 10 Jan 2025 09:44:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADnq5_PAG662SODmS8cSg7jcyh8ZQRgcWMtgjx5RZbuUE7j3Og@mail.gmail.com>
 <6a17b4f1-5b5b-4226-b3c3-4dfa3f3c3811@amd.com>
 <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADGDV=Vfnqmdn9Hdo9e3Av66NeZD1j1iijsEnP8Dqwakey5epA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0380.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6340:EE_
X-MS-Office365-Filtering-Correlation-Id: 53168455-7dc4-4747-a3f3-08dd315303a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUVuMW91d2M4c0JOZ3NkWko1ZHQwWnJxZEtEczR1c0srZHNmblN2S1VCYWtr?=
 =?utf-8?B?K2hER0V1S1VibS9EbjFrK28yZGNhbEtOMXYwN0d1cWdkWHV6V2dUZjkzZXJn?=
 =?utf-8?B?dnNZbWpTdkE4d3BDK2ZEQTVQQ2gxRUZSclJJN1VYUkFXcGdCL3R1NnFSbFF5?=
 =?utf-8?B?NGxIZ1NZbEhBSjZLem4vdnBhNkErcmh3TWhIcnZtOCt3clpvbWIzTCtOMnhr?=
 =?utf-8?B?eHd2ZVRaVitlbW1mQ2wvSFBMM2d2TXRWeGhMOVBnOEJ6WjBFS091ZUlyeDRF?=
 =?utf-8?B?bjVtRlZyT0g4blZUVEp0S3RURGc0MkFYcEFib2ZRUlNwL2h3RG9mNWxFeHk1?=
 =?utf-8?B?eGw1YStsTkdEZmowdGM4R3FmcjlSd3Q3L0RmcFZ5Zytobmx3d3VDeEkvTzE1?=
 =?utf-8?B?N3lRQUo5SE5VQUdHVnNUUGk2OWtzemY5Y0sralJJMGhIUnRCVWxocTd4Ulcx?=
 =?utf-8?B?L284M05mVStRUVlPOWRWdUIyRTZJVDBFZVYrcGhMck12QmFyRUYxbDk5ekZk?=
 =?utf-8?B?VFd4NHJmdEU2SjRhSEJnVmNWdGZId1U5SUVtT0FaV3BTK2JuWEtFdjRTczdF?=
 =?utf-8?B?UDVDM3hPckpRVjVrQmFJYnBzSG9JWVhraHIwajlRa2xVS1FpREp0dUkyTG9U?=
 =?utf-8?B?UG1NUDJtWWdzbUpwRmlRRHBnamh3c2tRUUNaUnJZaFhqaDYrR0RtSTFDSkZY?=
 =?utf-8?B?TlpqRkhNU3RSZWFGMDNXU2JvNnY5MHYwM2VMdWs5a01iT2o3SkFlVGVuc3B0?=
 =?utf-8?B?TTczMzUrczBLeVczcVYrZjE4OGhCSmFIbmJTalo1YkdsL3daN29jMlhqYktv?=
 =?utf-8?B?VGVlcGw0MXhEZ3ZuYTUycHZDdVZUQ0Uxc2dkcy9SeXNrNFVodCs3ZXJuZ3FZ?=
 =?utf-8?B?MGhlWG1ZRkd2eDZjMkQ0M0UvMG5EQjBPY25TSDk0NkpFVm93R09jR3Nzc1Zw?=
 =?utf-8?B?WDR2NUd6clBFRHIwc0VZREk4eDd3R2hYWVhYSE1QUWhidmZ2UW9KWTRkK1FM?=
 =?utf-8?B?eWNIdVFFKzNKOWluMEdKRDk2Vi80SDBqTXJyeTFVaWlRdXRXb1hxdGJrV2NT?=
 =?utf-8?B?ZHlSVG5YaTlqc0NXSm5qQlpyQmJiTXhEZ2o1RXNIellMeC9vUEJUTnY0UzEz?=
 =?utf-8?B?Rnl4R3Z0V1RoZUVPb0l5UDVBTFR3d0pXOTFNK0l0emlBMS9FOWMya3cvMFhC?=
 =?utf-8?B?eGhEbHBmNUZuSUF1MXpnZ1dzbEo2NmZqbUFGMUw0ZkNyMGNUNml1MnFOMHA1?=
 =?utf-8?B?N1RiVTdqRHNkWTZDWFBhclZDS2ZjRHNFRExiK0haRWxSbU0zRXJ5REUwa0tV?=
 =?utf-8?B?b0E1K0I3WGhFR1lmWXJvdjg5L0dsRHpUYTZmajZLekhvUTN5OEhVeTFOQUo4?=
 =?utf-8?B?Q2lwV2JFVkwrSDRBQjIvaGplaGZicnpQS1gvQlpmUG5qOVR6NWJ4cVljMDYr?=
 =?utf-8?B?KzNUT1BxeEpEcERseXVIeWgvbGRvcElLaGpjaUxqWWo2WHN6ZGY3N2syYTdo?=
 =?utf-8?B?RnRuT0c2Ti9jeWxnZndIRm1mWjdFQU9WTXRXWGZ5MWJtS2ZXdUVlWTJkeFBP?=
 =?utf-8?B?MXR2ZE4vZWxEcGVBdVZ4YWxhYW45SDBVSXovemw5ZnpEbzBLc0J4Wk1wVXRO?=
 =?utf-8?B?eENxZzJBWFdrNDFUVkU2TGhZNERQbStWcnFkYmJHU04zalBxWjRvRHNzcmJW?=
 =?utf-8?B?NmNTY3RjNlpjZERxQVcxMDkzbUF3c1BIR2RJTHB6cFFuaUlZcUpwZi9paVlP?=
 =?utf-8?B?VU5nZ2huQVhKblEvVUdoU2pHYjlIUCtyUTFGOTA5VHNhSFZuTHIyRVgrZ1Ew?=
 =?utf-8?B?dDNkSTlZaDJ0TDZEQ2tDK1NMR1ZMT25uakhiT2d1TzlkUlNxRXA0WTJnVkNT?=
 =?utf-8?Q?wJbUU8eLrcj1r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWVxandZSC9MNlpzbDkrRExITEpmSnhtSlpXVnFraVo3WkdKSFNmRGlMWjJS?=
 =?utf-8?B?Y3hqMEdoODRCVSt2M05xMXIvckdtVjQvSUpxNlV3ZXYwNTlaQjlYbUpPVWxP?=
 =?utf-8?B?VWNsQzNXZVVDN1lxRkpHajQ5OWg0WDBZTElncldpdGh2OSsxQ0tCVXJXczhD?=
 =?utf-8?B?Tk1wWFMrR3JEQVMvTGRtUVc4Qm1HallBdEtETUlVQXBISmxZUDRTQWM4VTBW?=
 =?utf-8?B?bGVwUDllTmlWOUpBNlI4L2FneStBNk1oMkFzcmEyMkxQNkpDV3NZZzFJQ2E2?=
 =?utf-8?B?UXh4bXNRTXY3MXJ1b1QyS00zT2VQck1VSXFYbFltbVgwQU51elBWYTdOeGRH?=
 =?utf-8?B?SEczM3Bvallsb09pMXgzWUZXY3hITDVkaW1yQmxFYUFHb0RVdkhjSmpLNGY5?=
 =?utf-8?B?T092eUNETnVBN2hrdVBRVzRCQVdzV3N4eGdpU2dtQU5ZcGppaGVoblE4V1Ji?=
 =?utf-8?B?QzQwQWpIVERPRERPbEhVTEJEMWZsUnFtN1hsU3FjcDBCc1Z4Rm1Jb0VrSUZB?=
 =?utf-8?B?K2kwU1RsUmZBNjY4Uk1VdFlYODRlWmFVdVBKVU5hOFZtc3NDYk9WUXZDTW9C?=
 =?utf-8?B?QjlxUlR3UXdsd1ZKaVBIT283MHVQT0RGZHc4RjRPODc4MnFJQkd4VXg4NmtM?=
 =?utf-8?B?NVdhMVhDMytWTjJ0YVNrUHROcUZnanVtMlIzK0lvbnNJZjM5Z21ZeDZ0Ykx0?=
 =?utf-8?B?azlCTnVJaXBGY0p2eFQ1RUFITFEvSWNKMHRNN2ZsMUlCMlJMRDVQcGdvOWRC?=
 =?utf-8?B?YzRyN0tSZUY1M0d1MkdwRndGMHdjSWZYbU44Z2NDdERlTTdxUU45cDF5RFM3?=
 =?utf-8?B?azQrcWlIV1gxZkhRM2xWWVcxMHFabXNpM3ZYbU5XdFBoeld2YkF1VVViOXpP?=
 =?utf-8?B?ZXVDeHpCZjROMFVQZWMrbGpRL0Q0Q3YwY1ozUUVIVUtsRlkxR3RGRHR6SDJR?=
 =?utf-8?B?eVRtL2wzNkRYSUZIdk56SGJHMFlUUDhKZlFMV0s3L2dmbnRnSUthNVBHa3lS?=
 =?utf-8?B?bXljNXAzU1R3S3o4eCsyOU5makFXU2NzOEF1aUVOMS80Qy96eDJpeTBvYllx?=
 =?utf-8?B?ZXpucGJ3MHh5d3lBZlNTenJ1TWVzbTd2a0ErVDdZNGpxTXc2dVlnSzZQUmtG?=
 =?utf-8?B?ak9TalpJTEdpbzFwTksvYjhoTnVRWWU1YVd1dUM0L25TWVBHdld1dkJPUjBw?=
 =?utf-8?B?NjYrWHRLdDQ4RUdlVkVLM2xYbk1nZjRlL3J0Q0lkNUN4NXhQRFFtdzNLbW1O?=
 =?utf-8?B?VWtsR1gvRnNEcXFRWG1mRlFrYWRhUVFnaTBud3dZektoNHNuQTBQYlFwOUky?=
 =?utf-8?B?QXhZK0xBa0pHbGxWTmNvOXlYajQ5cVdmNTY0bllLRU0zeXdUWUh2Q0l6ckVP?=
 =?utf-8?B?bnpHSHFhSHp2bHNwV1JRdzA2cmpHd1NwYm05czlJOUNGeWlzQkx5ZVNoOFND?=
 =?utf-8?B?dmJZclRWcCtkTnloc3JxN05COER6QVEzbnpOYmNGd1R6Y3BEc0FaY0lydEJG?=
 =?utf-8?B?N3pnblQ1Rnk0QWplSDc5bEpDVzVnSkx5SUlXeE5BQ3E3Y3FCa0ZtWmJMY2lk?=
 =?utf-8?B?b0I3L3VwZDl3Zkw5SUZpWlBBdjg4UTd4cys0RlQyRlNNWU1tUzh6N1hLZzRC?=
 =?utf-8?B?SnVvWG4yTEc4cHgwWDhqdVVncWVBK0ZhaWV1TitzaEU0Ny9YMWxQalVrV29h?=
 =?utf-8?B?SkYvOU5pL3k3SEwyd0hQT20yZy9VKytmbVl5YTlWcFVUVEZZc2M2VTFFZnA0?=
 =?utf-8?B?aWxwVW9hMHZHMHBjeHM1cis5YjlXbXBoLzlTOEY1NmpsMENXSUVoR2xBdDRP?=
 =?utf-8?B?aHcwQmdBTk1GNWZaTUVQRlhETHYwWGUzWEt2b2VrUHZGYUdqNHVLWFhUNjVU?=
 =?utf-8?B?VS9hZ0tIS2RFd1dlWDc2WGpkejd3UVl5UTNXVE9sMEpiVVZLejMzYlJGRjB2?=
 =?utf-8?B?UzA0ZkUvQW5BbFpaUmhNUFhkVlNSdUZXN2YwQ2ZIMmxGcmZmQXZYZGFuUkRR?=
 =?utf-8?B?R29idHVILytNRklBZ1ZCSWpncE53cW5mL0cxVEJkNTc0c28wSmtZdW1TbWxO?=
 =?utf-8?B?UFJIVlJCZDRhblFkbklzL1F1d0FVbDlpajVWY0JueFlSeUprUVNPVHBqeHhy?=
 =?utf-8?Q?VA0d2rNcYafC3snX6brKO/Fll?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53168455-7dc4-4747-a3f3-08dd315303a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:44:37.1824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DOFWdZFKmM7VQymGhWKNVjd+L+UBb7Q6FnQMiFUPuOJOtCxEBlpcR74QlYX1Gg/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6340
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

Am 10.01.25 um 08:37 schrieb Philipp Reisner:
> [...]
>>> Could this be due to amdgpu setting sched->ready when the rings are
>>> finished initializing from long ago rather than when the scheduler has
>>> been armed?
>> Yes and that is absolutely intentional.
>>
>> Either the driver is not done with it's resume yet, or it has already
>> started it's suspend handler. So the scheduler backends are not started
>> and so the ready flag is false.
>>
>> But some userspace application still tries to submit work.
>>
>> If we would now wait for this work to finish we would deadlock, so
>> crashing on the NULL pointer deref is actually the less worse outcome.
>>
>> Christian.
> Hi Christian,
>
> Today in the morning, when I woke up my workstation, I was greeted
> with a black screen, on which I still could move my mouse pointer. The
> OOPS happens at resume time, not at suspend time:
>
> ...
> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not ready, skipping
> Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not ready, skipping
> Jän 10 07:58:14 ryzen9 kernel: BUG: kernel NULL pointer dereference,
> address: 0000000000000008
> Jän 10 07:58:14 ryzen9 kernel: #PF: supervisor read access in kernel mode
> Jän 10 07:58:14 ryzen9 kernel: #PF: error_code(0x0000) - not-present page
> Jän 10 07:58:14 ryzen9 kernel: PGD 0 P4D 0
> Jän 10 07:58:14 ryzen9 kernel: Oops: Oops: 0000 [#2] PREEMPT SMP NOPTI
> Jän 10 07:58:14 ryzen9 kernel: CPU: 2 UID: 1001 PID: 4961 Comm:
> chrome:cs0 Tainted: G      D    OE      6.12.5-200.fc41.x86_64 #1
> Jän 10 07:58:14 ryzen9 kernel: Tainted: [D]=DIE, [O]=OOT_MODULE,
> [E]=UNSIGNED_MODULE
> Jän 10 07:58:14 ryzen9 kernel: Hardware name: Micro-Star International
> Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
> Jän 10 07:58:14 ryzen9 kernel: RIP: 0010:drm_sched_job_arm+0x23/0x60 [gpu_sched]
> Jän 10 07:58:14 ryzen9 kernel: Code: 90 90 90 90 90 90 90 f3 0f 1e fa
> 0f 1f 44 00 00 55 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8
> e1 38 00 00 48 8b 45 10 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8
> 01 00 00 00 f0 48 0f
> Jän 10 07:58:14 ryzen9 kernel: RSP: 0018:ffffa52510cf7758 EFLAGS: 00010206
> ...
>
> Can we conclude that "the driver is not yet ready with it's resume"?

Take a look at those messages right before the crash:

Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.2.1 is not ready, 
skipping
Jän 10 07:58:14 ryzen9 kernel: [drm] scheduler comp_1.3.1 is not ready, 
skipping

That is basically a 100% certain confirm that an application tries to 
use the device before before those compute queues are resumed.

Can I have a full dmesg? Maybe the resume is canceled or aborted for 
some reason.

Or we have a bug in the driver that we forget to resume the compute 
queues and only do that on demand later on or something like that.

> Can you point me to where I could add instrumentation code to dig deeper?

Let me take a look at the full dmesg, something really fishy is going on 
here.

Thanks,
Christian.

>
> Thanks,
>   Philipp

