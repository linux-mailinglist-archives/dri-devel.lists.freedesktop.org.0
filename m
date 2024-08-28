Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86622962AA8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE0610E553;
	Wed, 28 Aug 2024 14:46:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="37Yg1mV6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABA210E552;
 Wed, 28 Aug 2024 14:46:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqGWyELoAZpUzQSAbMN/FePBYdfAOt3xkUo+F2otaEfIi1LDyiVEWdWY8en07h0zWyP7XUZjqXiHIF3YUcCul4qEfBBsB1Pk6MQRAtvghDPaC6aU3uV47DYCdmY+bGQ+ZnG0frKp1rs2hKcg3GgW+Bv/ZOC2R2XOXw1RmXALO5jLt7SNSFO0TqzXj9SxBCgGoVCGDoZlqHbBNot5fWUMRhvARvZ/CME7dZULmzzgr9KaqRWFiorhQLjLE6TD17urWORz+XfQ/oJ89Xg9E77GgOf/DGytoaPt9AkrnY26RrVceZ6pi/Q/n8Eg2BulTdrT4al+slh86qHlMhn+7Z9hRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DeX7P1zW95kKARcddSFh2w1Jk9RtXuzhL0NCkKOdpxU=;
 b=A73CuY82SFXH7MjN/QVjdP0wspPBLANB8zeeIRYpL0okjcvMEUvrWwkpTWYH47MXkGQB0EjjkWwIEmuHKCXnxCOQiDyi3T6sgpcYxFJmQQEve0jJuWUFXdFtKs9mXbVMyFGEqL28f6IAGGnr6Tifd2B6y9FWUqghy1T7qaw+MYJdSFrek9WWkhUsB+plwdooldj9ilWCUuraZQsSWoYlXygsukM9oLihEZdt6/zgBOrHRTiVlZA4hsiqAFqojMWqxFlsTYKyYfaFnKjLenwk0ozNENGdtjpHv8JKLwVVdAbfNrnILY6+sgFyNMrlVYDxnBjAWxa9ZufXvVgERiMdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DeX7P1zW95kKARcddSFh2w1Jk9RtXuzhL0NCkKOdpxU=;
 b=37Yg1mV6wNYAyonM3lZsWgqkyGxG0WAm4Ap+e0POuKhepuIEboQYrzyn0ntY88wbdhfDnbCbyok9t38jxam3CTmVel/8uol4HuX8gm7ApFLaeUI7hv0kOfgpR0zdVEXaErPyAtSpj9s/SBiYgkyWANlmnn9NYXCe0f5gbyqai38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL1PR12MB5970.namprd12.prod.outlook.com (2603:10b6:208:399::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Wed, 28 Aug
 2024 14:46:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7897.021; Wed, 28 Aug 2024
 14:46:31 +0000
Message-ID: <c1d455a7-f682-43ac-8bbd-af0727954d5d@amd.com>
Date: Wed, 28 Aug 2024 16:46:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, thomas.hellstrom@linux.intel.com, matthew.auld@intel.com,
 daniel@ffwll.ch
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL1PR12MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: e881b5d9-2b85-438e-58f0-08dcc770345f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dVYxSW95MzJNdXpSbmJmdjEyMWloZE54ODRsaXVDWVVyc0RmQ1Y4bkJSc25I?=
 =?utf-8?B?ODFGcFpXZDVFaFRtYmNzSHhtOTM3WXhUWlZzSHFaY21HdTlKanFjRk9rQnVx?=
 =?utf-8?B?SGhUQThjN3dlb0JRUDVPdStJekg5cWtDY21GWkF2d2UwRjQvcW5mZlZINEhD?=
 =?utf-8?B?cEZXVHpSY2Q4WE1pUkhENnpielg5TEZaM1JseGlCS095U3YyTkFqMXRaNkhJ?=
 =?utf-8?B?OFJMekFkWlVNOHE5TEdIVVpvc2tYbkh2OTQ1STFyZE0rSzhYSUZ2aWZIQXRj?=
 =?utf-8?B?c2lBSldKRE9PUFVmeHd5QW41L1RQTDNZcFh3SWc4eXh5cmtPRXRkUUNnZHNu?=
 =?utf-8?B?dWs5S3pJZ3RsUkdFVFY5M0hCNkFGeWdpOG44alBsZXBkWmxvSGNxUXRoRklw?=
 =?utf-8?B?MUZTVVdJUlNaTG1EdFdpekRMUGJrKzMyeWg3N1RSdWVTVHpXeWN4RVFmR2Ji?=
 =?utf-8?B?ZGNZc3hTVW9zSFVUbjNkMHcxeHAyTFBReks3ZXdlNkJjMXhjTDBZR05SZURJ?=
 =?utf-8?B?aTRnSWVUaXg4MFBncURSOWxBc3Jkb29BTUdwNjlVcmNONUQ4OStEWGFRNW1n?=
 =?utf-8?B?dk5vNXhJVm5JRGhRaXpCa0EwSW5iTml4U3lMSXd4QmJCTWRaWmhRZ1N5bDVD?=
 =?utf-8?B?NFU5ZHkxOFRuVXlVOGppUTc4TGI2ZXAzTDhDVUZIejdFbytiSUhEWVlFdmMz?=
 =?utf-8?B?RC9vbkNkeWxxcWlReCtRVnpsR0FvZzFrSlVjNjZNNEQ5SE1RZmJWWXl4bnFv?=
 =?utf-8?B?WXJpMXg0cHRTZUxpM3h0amEvWGZ0VWdjMUZCc3djUThZYTNkbXBQUHZrZ01l?=
 =?utf-8?B?c0NQTFMyeFJyL2pKKzBTTlZVaHFkUXVqRnA2RmVuSWxZRXc3Z08yT0Z6bTdn?=
 =?utf-8?B?c1lFTjk0N1B0ZkNYcno1UVNESkgyMVhDOG02RUFNanZvZVVXVlJkVnNGSm96?=
 =?utf-8?B?bjZvTWphdFIyV203U1I4eWRDWHVYdTk3eEdaMk1leTN3UlU4QnpvZ0dWenpP?=
 =?utf-8?B?SFZCVlZoL0wzT2JmMFh5UHVyOGhVVnN4SnQxdEdPZC9nUURiaFRGMW1OcGFM?=
 =?utf-8?B?T1dON05BUGV5TmY4YVh5ZHFxUTFaSlVtWnR4L0Y2UGxEdmgvdDFJbFYvRzdo?=
 =?utf-8?B?R0l6eTIzTGl3QUFiRHA3WklJUzFZWkx6eU9ndnNRNnYySzhwLytkNUk1d0Fs?=
 =?utf-8?B?T0d0VlUwWWk4TVVVSzRzNFNUYytNcGdIMnljR0t6T0VBUGt6VWdGUk8zZ3VG?=
 =?utf-8?B?S3gxeDFrV3MrMjV4MlkyaWZPdTFXbmYyTmpnUXFvaFpDZ29FcjJyYy8zbEZH?=
 =?utf-8?B?eG1ON0ovSkpZckp5Wmc2My9zZjhleGRGaWI3R1VadXhLdXEva0NwU2hwYVJF?=
 =?utf-8?B?NDBhTnI0SzBMZXVWdk43STZtTHVYMTJiWUFkRGpnZ2t1MDhjUTJDeTdndi96?=
 =?utf-8?B?OTMvaUV5b0I3UGJWZmRsd0FxMFQ4Um1CRkNXczJYdjJzV2pMdWFrVG4vMjBJ?=
 =?utf-8?B?TnQ5TW5IRUJJSUpsNTRGcTBSQmhsdHQzYnppVGFKajJDUHFodk5FbEU5TkQ0?=
 =?utf-8?B?MnlhVjdTblJwRUJzbzNreUNlRmdKZkxzVWh5SlJKdEF3cktlS1ZpZjUwcE03?=
 =?utf-8?B?dXY3elFaUWhKdW5OODI4ZTdjc2RIODFSNTUxR3lQcklCRW9YSkdUWGZMclN4?=
 =?utf-8?B?UHkyKzhSTDlENjNZZjM5bkhLaUFPYzMzL04rZ3o1SUVZY2FIMmM5RkR2dVBi?=
 =?utf-8?B?SmlydHFZaFlHZTZIMzVwb2g5VGJTc083TDA5eHc3c3NaMElaM0ZlRUdlcVZ2?=
 =?utf-8?B?SWVjUm8rRjc1UHFOZDFpZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?di9zRVlKWUJ3bGRXQ2IvL0grZ1BtV3JOd2NhYy9WTFQxVURRZ1RQRVVXb3Vp?=
 =?utf-8?B?QmNyMUthRzVuY1VIOC9vWm1UdjVYTi9TYW5vSHU4ZzQwQVlYT1NRK0NMY0tr?=
 =?utf-8?B?eVRhV1pmMCttL1VaM3k4ZUlWU0tqdW1iQTRYTU5PbnBKYWVZQXFaTlJHVHV2?=
 =?utf-8?B?aWxDYTZRbEpyT1dmQXNPd1A5SWlzaGVNdE8wZzlqWGp2ZDMzc2E1bFIrbmhO?=
 =?utf-8?B?QjBhWDRuMDdSRnBiMDFvRjBOTDNqVEJ5T2NEbkR1UGlTNVBrTW0wenpSYzBp?=
 =?utf-8?B?R01KZ1VYZGpwMU91QjRUTndIVVpiL25qVTNVVWFVY3h1bjh5WUVOb09jYlZY?=
 =?utf-8?B?Y2d6bWd3ckJ1Z1JVZVczMTJ0alp5VmhVb29wUkhTVjRrQTBIOUFRMm1SRTQ4?=
 =?utf-8?B?ZDhNTnBta1UxTkUyU1hENnVYR3JselpvaGU2Zlk1RDhNcUNab2U4dVNOSmY1?=
 =?utf-8?B?ekMyTklEZ1FLVmxJRXpUVWF2Mys3dnl5QUIvVjNaU2JnOGJuN05yakp1bllD?=
 =?utf-8?B?SlZubWk2ZktRZWREN1ZIVU5UMlUwQ1hPNUl5R1VPZ1Mxc3AxNWhyeXRFVnpv?=
 =?utf-8?B?bk1meEpuYTBqajFqTFplcWpDOTQ5K0VVK1RvdktJd2dYZWRWNEFlS3djL1Z3?=
 =?utf-8?B?YVlwQUcwYzdTdVlwWUhwRFcvemxxT2N3YTVBQlVSOUlwZGVwcmQ4UmZiazRi?=
 =?utf-8?B?REswTjhNSlRlSlBFS01RbmY2eDNnWi9PUXMzQytKMGZhZmJuYVZzZW5RTXVE?=
 =?utf-8?B?bHNwYjgrcGFRZ0l1T25zQXBGUFQwMmFSVU1IRXAwS0lXYkZIVDVIZ05MWDVx?=
 =?utf-8?B?VG4yYTlJczhzV0U2ekwvNmJ1QWpZd1Z5dzJ2TDZubkdFVmFjS2YyYldmejRX?=
 =?utf-8?B?UFdxbnhJSjVwM3FWeXQwczU2UHZvbmozZkx6U1Y3cUFjSDd1Mlhib0JTS2Zn?=
 =?utf-8?B?WnRlMW1Tbk91aUI5aThzTWkxY3Bid1FDK0RyYUdDRXhzQkErSWM3ejlvL3p4?=
 =?utf-8?B?eTl0Z01FUjc5RmFPc2h3Z21VcGRRR0o4d0hSMzlub2ROOCtUYUlqZUlqemhm?=
 =?utf-8?B?ZFBnRFdhbTBsZVMrMGErN1gwdGFPUXRwNklLRHMxWUhJU3JpMGtLQzZXQ09k?=
 =?utf-8?B?a20wNGowWlkwaG5tbmxnU21XQ0JjSzFqY3Fwb2p0cHN3R0hQdVZVOFlyMmRy?=
 =?utf-8?B?REpkN01DOXVXVDFKdk12QmJQWXhYbmJyc0UrWlQ5amhkTG8vMW1yc2RvVERv?=
 =?utf-8?B?MUY5RlVFU3JiTVU0WmRIR25sL1h0M2pJZnNGSFhOQXFCd2cyeWJVMGpIVnU1?=
 =?utf-8?B?Qyt4R25NMjZiRERhZmRqUit3THFsUzJISTh5TGRTOE45YnJoSWVyZjRyMitz?=
 =?utf-8?B?SmFjNHM3YlpMUklBbzBNcXp0aXhJVS90UGNwZWQzY2JUS2tnZ2k2ditKYjU5?=
 =?utf-8?B?ZkNTNUw5R3FjOUt4ZGhsZC8za1NKYmQzWmV0c0hiVmo5MWhVVjZpazA0ZE1S?=
 =?utf-8?B?bFpEMjJJMzBWVTNUaFp4Yk0xM0xtbFIxaVdmWnJmUmVsUW04VEw0M1BPUHU0?=
 =?utf-8?B?dEd4TFhyNTFEQ0c3SUtXYndidmZWRElJVGpqY3Y4eHREQ254ZUE3eEtlbEFM?=
 =?utf-8?B?OFNjVEFRL1pPZVFhWENYWEdQR0FuVURZajRxdi8vYlhTU0FhQzkwRWxWZHlk?=
 =?utf-8?B?alZpZEkwNXJVTUxBaHVLVjBLaXRTWHFuanRDQmk3cjM4ZGZ6eEpvR0s5Y2Rn?=
 =?utf-8?B?RjlWRzg0TkFyc1BMQWtpeXBHbUpkcmRsK1NUYlVEVWNuQ08rdEg3UThyemV0?=
 =?utf-8?B?bUdPbmJhczZzVzdrMlFKZVVwd3ZpUGFFR2xxRWpGaDcyc1VYbGpMeHNGa084?=
 =?utf-8?B?aHdwTFp3SDdOUUhSZEM2NHVYUldHanVERDEyclhRMGpJWFg1c21DeW9udzZl?=
 =?utf-8?B?T1lMaTBzYW1jZ0ZqUjJBRHZtS2pUbFFiYk84czFoMXpPaU1tSXV3STRoVWpC?=
 =?utf-8?B?Rk1sbFE1TzIwdnlxYTNpcjlBVWhuNWZ6M25WR05IRlA4UUdGVG55bjJyZmF3?=
 =?utf-8?B?ckpQVERTTG1CcTNEeHIvcWh4OU5zOUYxak0vTFF5VDJGcTluWUQ4T09rUVMr?=
 =?utf-8?Q?N3EE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e881b5d9-2b85-438e-58f0-08dcc770345f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 14:46:31.1950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x5vdxwH57jLfDf3rKE97xnUTqCYd7+u7RfwpknffUhRAlcfZuRVUWc9Ojsjcjw+M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5970
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

Am 28.08.24 um 16:31 schrieb Daniel Vetter:
> On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
>> +		if (!ctx->mmap_locked) {
>> +			/*
>> +			 * XXX: HMM locking document indicates only a read-lock
>> +			 * is required but there apears to be a window between
>> +			 * the MMU_NOTIFY_MIGRATE event triggered in a CPU fault
>> +			 * via migrate_vma_setup and the pages actually moving
>> +			 * in migrate_vma_finalize in which this code can grab
>> +			 * garbage pages. Grabbing the write-lock if the range
>> +			 * is attached to vram appears to protect against this
>> +			 * race.
>> +			 */
> This one is really scary, since it means the entire migrate pte trickery
> is essentially completely busted. Grabbing the mmap write lock just means
> you block out pretty much everything interesting from concurrently
> happening.
>
> My gut feeling says we need to figure out what's happening here, because
> this looks a bit too fundamental to me.

I think I have at least a high level understanding what's going on here, 
Felix and especially Philip should know more of the details.

In general grabbing the mm_lock to protect PTEs from changing is 
completely nonsense. The mm_lock is to protect the VMAs and *not* the PTEs!

Even with the write side of the mm_lock taken it is perfectly possible 
that PTE change. It's just less likely.

We run into multiple issues before we figured out this important 
distinction as well.

Christian.

> -Sima
>
>
>> +			if (vram_pages)
>> +				mmap_write_lock(mm);
>> +			else
>> +				mmap_read_lock(mm);
>> +		}
>> +		err = hmm_range_fault(&hmm_range);
>> +		if (!ctx->mmap_locked) {
>> +			if (vram_pages)
>> +				mmap_write_unlock(mm);
>> +			else
>> +				mmap_read_unlock(mm);
>> +		}
>> +
>> +		if (err == -EBUSY) {
>> +			if (time_after(jiffies, timeout))
>> +				break;
>> +
>> +			hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
>> +			continue;
>> +		}
>> +		break;
>> +	}
>> +	if (!ctx->mmap_locked)
>> +		mmput(mm);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	pages = (struct page **)pfns;
>> +
>> +	if (ctx->prefault) {
>> +		range->pages = pages;
>> +		goto set_seqno;
>> +	}
>> +
>> +map_pages:
>> +	if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
>> +		WARN_ON_ONCE(!range->vram_allocation);
>> +
>> +		for (i = 0; i < npages; ++i) {
>> +			pages[i] = hmm_pfn_to_page(pfns[i]);
>> +
>> +			if (WARN_ON_ONCE(!is_device_private_page(pages[i]))) {
>> +				err = -EOPNOTSUPP;
>> +				goto err_free;
>> +			}
>> +		}
>> +
>> +		/* Do not race with notifier unmapping pages */
>> +		drm_gpusvm_notifier_lock(gpusvm);
>> +		range->flags.has_vram_pages = true;
>> +		range->pages = pages;
>> +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> +			err = -EAGAIN;
>> +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
>> +		}
>> +		drm_gpusvm_notifier_unlock(gpusvm);
>> +	} else {
>> +		dma_addr_t *dma_addr = (dma_addr_t *)pfns;
>> +
>> +		for_each_dma_page(i, j, npages, order) {
>> +			if (WARN_ON_ONCE(i && order !=
>> +					 hmm_pfn_to_map_order(pfns[i]))) {
>> +				err = -EOPNOTSUPP;
>> +				npages = i;
>> +				goto err_unmap;
>> +			}
>> +			order = hmm_pfn_to_map_order(pfns[i]);
>> +
>> +			pages[j] = hmm_pfn_to_page(pfns[i]);
>> +			if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) {
>> +				err = -EOPNOTSUPP;
>> +				npages = i;
>> +				goto err_unmap;
>> +			}
>> +
>> +			set_page_dirty_lock(pages[j]);
>> +			mark_page_accessed(pages[j]);
>> +
>> +			dma_addr[j] = dma_map_page(gpusvm->drm->dev,
>> +						   pages[j], 0,
>> +						   PAGE_SIZE << order,
>> +						   DMA_BIDIRECTIONAL);
>> +			if (dma_mapping_error(gpusvm->drm->dev, dma_addr[j])) {
>> +				err = -EFAULT;
>> +				npages = i;
>> +				goto err_unmap;
>> +			}
>> +		}
>> +
>> +		/* Huge pages, reduce memory footprint */
>> +		if (order) {
>> +			dma_addr = kmalloc_array(j, sizeof(*dma_addr),
>> +						 GFP_KERNEL);
>> +			if (dma_addr) {
>> +				for (i = 0; i < j; ++i)
>> +					dma_addr[i] = (dma_addr_t)pfns[i];
>> +				kvfree(pfns);
>> +				kfree_mapping = true;
>> +			} else {
>> +				dma_addr = (dma_addr_t *)pfns;
>> +			}
>> +		}
>> +
>> +		/* Do not race with notifier unmapping pages */
>> +		drm_gpusvm_notifier_lock(gpusvm);
>> +		range->order = order;
>> +		range->flags.kfree_mapping = kfree_mapping;
>> +		range->flags.has_dma_mapping = true;
>> +		range->dma_addr = dma_addr;
>> +		range->vram_allocation = NULL;
>> +		if (mmu_interval_read_retry(notifier, hmm_range.notifier_seq)) {
>> +			err = -EAGAIN;
>> +			__drm_gpusvm_range_unmap_pages(gpusvm, range);
>> +		}
>> +		drm_gpusvm_notifier_unlock(gpusvm);
>> +	}
>> +
>> +	if (err == -EAGAIN)
>> +		goto retry;
>> +set_seqno:
>> +	range->notifier_seq = hmm_range.notifier_seq;
>> +
>> +	return 0;
>> +
>> +err_unmap:
>> +	for_each_dma_page(i, j, npages, order)
>> +		dma_unmap_page(gpusvm->drm->dev,
>> +			       (dma_addr_t)pfns[j],
>> +			       PAGE_SIZE << order, DMA_BIDIRECTIONAL);
>> +err_free:
>> +	if (alloc_pfns)
>> +		kvfree(pfns);
>> +err_out:
>> +	return err;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GPU SVM range
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @range: Pointer to the GPU SVM range structure
>> + * @ctx: GPU SVM context
>> + *
>> + * This function unmaps pages associated with a GPU SVM range. If @in_notifier
>> + * is set, it is assumed that gpusvm->notifier_lock is held in write mode; if it
>> + * is clear, it acquires gpusvm->notifier_lock in read mode. Must be called on
>> + * each GPU SVM range attached to notifier in gpusvm->ops->invalidate for IOMMU
>> + * security model.
>> + */
>> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>> +				  struct drm_gpusvm_range *range,
>> +				  const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	if (ctx->in_notifier)
>> +		lockdep_assert_held_write(&gpusvm->notifier_lock);
>> +	else
>> +		drm_gpusvm_notifier_lock(gpusvm);
>> +
>> +	__drm_gpusvm_range_unmap_pages(gpusvm, range);
>> +
>> +	if (!ctx->in_notifier)
>> +		drm_gpusvm_notifier_unlock(gpusvm);
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migration_put_page - Put a migration page
>> + * @page: Pointer to the page to put
>> + *
>> + * This function unlocks and puts a page.
>> + */
>> +static void drm_gpusvm_migration_put_page(struct page *page)
>> +{
>> +	unlock_page(page);
>> +	put_page(page);
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migration_put_pages - Put migration pages
>> + * @npages: Number of pages
>> + * @migrate_pfn: Array of migrate page frame numbers
>> + *
>> + * This function puts an array of pages.
>> + */
>> +static void drm_gpusvm_migration_put_pages(unsigned long npages,
>> +					   unsigned long *migrate_pfn)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < npages; ++i) {
>> +		if (!migrate_pfn[i])
>> +			continue;
>> +
>> +		drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate_pfn[i]));
>> +		migrate_pfn[i] = 0;
>> +	}
>> +}
>> +
>> +/**
>> + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
>> + * @page: Pointer to the page
>> + * @zdd: Pointer to the GPU SVM zone device data
>> + *
>> + * This function associates the given page with the specified GPU SVM zone
>> + * device data and initializes it for zone device usage.
>> + */
>> +static void drm_gpusvm_get_vram_page(struct page *page,
>> +				     struct drm_gpusvm_zdd *zdd)
>> +{
>> +	page->zone_device_data = drm_gpusvm_zdd_get(zdd);
>> +	zone_device_page_init(page);
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SVM migration
>> + * @dev: The device for which the pages are being mapped
>> + * @dma_addr: Array to store DMA addresses corresponding to mapped pages
>> + * @migrate_pfn: Array of migrate page frame numbers to map
>> + * @npages: Number of pages to map
>> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
>> + *
>> + * This function maps pages of memory for migration usage in GPU SVM. It
>> + * iterates over each page frame number provided in @migrate_pfn, maps the
>> + * corresponding page, and stores the DMA address in the provided @dma_addr
>> + * array.
>> + *
>> + * Return: 0 on success, -EFAULT if an error occurs during mapping.
>> + */
>> +static int drm_gpusvm_migrate_map_pages(struct device *dev,
>> +					dma_addr_t *dma_addr,
>> +					long unsigned int *migrate_pfn,
>> +					unsigned long npages,
>> +					enum dma_data_direction dir)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < npages; ++i) {
>> +		struct page *page = migrate_pfn_to_page(migrate_pfn[i]);
>> +
>> +		if (!page)
>> +			continue;
>> +
>> +		if (WARN_ON_ONCE(is_zone_device_page(page)))
>> +			return -EFAULT;
>> +
>> +		dma_addr[i] = dma_map_page(dev, page, 0, PAGE_SIZE, dir);
>> +		if (dma_mapping_error(dev, dma_addr[i]))
>> +			return -EFAULT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mapped for GPU SVM migration
>> + * @dev: The device for which the pages were mapped
>> + * @dma_addr: Array of DMA addresses corresponding to mapped pages
>> + * @npages: Number of pages to unmap
>> + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
>> + *
>> + * This function unmaps previously mapped pages of memory for GPU Shared Virtual
>> + * Memory (SVM). It iterates over each DMA address provided in @dma_addr, checks
>> + * if it's valid and not already unmapped, and unmaps the corresponding page.
>> + */
>> +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
>> +					   dma_addr_t *dma_addr,
>> +					   unsigned long npages,
>> +					   enum dma_data_direction dir)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < npages; ++i) {
>> +		if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
>> +			continue;
>> +
>> +		dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
>> +	}
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @range: Pointer to the GPU SVM range structure
>> + *                   failure of this function.
>> + * @vram_allocation: Driver-private pointer to the VRAM allocation. The caller
>> + *                   should hold a reference to the VRAM allocation, which
>> + *                   should be dropped via ops->vram_allocation or upon the
>> + *                   failure of this function.
>> + * @ctx: GPU SVM context
>> + *
>> + * This function migrates the specified GPU SVM range to VRAM. It performs the
>> + * necessary setup and invokes the driver-specific operations for migration to
>> + * VRAM. Upon successful return, @vram_allocation can safely reference @range
>> + * until ops->vram_release is called which only upon successful return.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
>> +			       struct drm_gpusvm_range *range,
>> +			       void *vram_allocation,
>> +			       const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	u64 start = range->va.start, end = range->va.end;
>> +	struct migrate_vma migrate = {
>> +		.start		= start,
>> +		.end		= end,
>> +		.pgmap_owner	= gpusvm->device_private_page_owner,
>> +		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
>> +	};
>> +	struct mm_struct *mm = gpusvm->mm;
>> +	unsigned long i, npages = npages_in_range(start, end);
>> +	struct vm_area_struct *vas;
>> +	struct drm_gpusvm_zdd *zdd = NULL;
>> +	struct page **pages;
>> +	dma_addr_t *dma_addr;
>> +	void *buf;
>> +	int err;
>> +
>> +	if (!range->flags.migrate_vram)
>> +		return -EINVAL;
>> +
>> +	if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram ||
>> +	    !gpusvm->ops->copy_to_sram)
>> +		return -EOPNOTSUPP;
>> +
>> +	if (!ctx->mmap_locked) {
>> +		if (!mmget_not_zero(mm)) {
>> +			err = -EFAULT;
>> +			goto err_out;
>> +		}
>> +		mmap_write_lock(mm);
>> +	}
>> +
>> +	mmap_assert_locked(mm);
>> +
>> +	vas = vma_lookup(mm, start);
>> +	if (!vas) {
>> +		err = -ENOENT;
>> +		goto err_mmunlock;
>> +	}
>> +
>> +	if (end > vas->vm_end || start < vas->vm_start) {
>> +		err = -EINVAL;
>> +		goto err_mmunlock;
>> +	}
>> +
>> +	if (!vma_is_anonymous(vas)) {
>> +		err = -EBUSY;
>> +		goto err_mmunlock;
>> +	}
>> +
>> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
>> +		       sizeof(*pages), GFP_KERNEL);
>> +	if (!buf) {
>> +		err = -ENOMEM;
>> +		goto err_mmunlock;
>> +	}
>> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
>> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
>> +
>> +	zdd = drm_gpusvm_zdd_alloc(range);
>> +	if (!zdd) {
>> +		err = -ENOMEM;
>> +		goto err_free;
>> +	}
>> +
>> +	migrate.vma = vas;
>> +	migrate.src = buf;
>> +	migrate.dst = migrate.src + npages;
>> +
>> +	err = migrate_vma_setup(&migrate);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	/*
>> +	 * FIXME: Below cases, !migrate.cpages and migrate.cpages != npages, not
>> +	 * always an error. Need to revisit possible cases and how to handle. We
>> +	 * could prefault on migrate.cpages != npages via hmm_range_fault.
>> +	 */
>> +
>> +	if (!migrate.cpages) {
>> +		err = -EFAULT;
>> +		goto err_free;
>> +	}
>> +
>> +	if (migrate.cpages != npages) {
>> +		err = -EBUSY;
>> +		goto err_finalize;
>> +	}
>> +
>> +	err = gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, npages,
>> +					     migrate.dst);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
>> +					   migrate.src, npages, DMA_TO_DEVICE);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	for (i = 0; i < npages; ++i) {
>> +		struct page *page = pfn_to_page(migrate.dst[i]);
>> +
>> +		pages[i] = page;
>> +		migrate.dst[i] = migrate_pfn(migrate.dst[i]);
>> +		drm_gpusvm_get_vram_page(page, zdd);
>> +	}
>> +
>> +	err = gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	/* Upon success bind vram allocation to range and zdd */
>> +	range->vram_allocation = vram_allocation;
>> +	WRITE_ONCE(zdd->vram_allocation, vram_allocation);	/* Owns ref */
>> +
>> +err_finalize:
>> +	if (err)
>> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
>> +	migrate_vma_pages(&migrate);
>> +	migrate_vma_finalize(&migrate);
>> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
>> +				       DMA_TO_DEVICE);
>> +err_free:
>> +	if (zdd)
>> +		drm_gpusvm_zdd_put(zdd);
>> +	kvfree(buf);
>> +err_mmunlock:
>> +	if (!ctx->mmap_locked) {
>> +		mmap_write_unlock(mm);
>> +		mmput(mm);
>> +	}
>> +err_out:
>> +	return err;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a VM area
>> + * @vas: Pointer to the VM area structure, can be NULL
>> + * @npages: Number of pages to populate
>> + * @src_mpfn: Source array of migrate PFNs
>> + * @mpfn: Array of migrate PFNs to populate
>> + * @addr: Start address for PFN allocation
>> + *
>> + * This function populates the SRAM migrate page frame numbers (PFNs) for the
>> + * specified VM area structure. It allocates and locks pages in the VM area for
>> + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocation, if NULL use
>> + * alloc_page for allocation.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_struct *vas,
>> +						unsigned long npages,
>> +						unsigned long *src_mpfn,
>> +						unsigned long *mpfn, u64 addr)
>> +{
>> +	unsigned long i;
>> +
>> +	for (i = 0; i < npages; ++i, addr += PAGE_SIZE) {
>> +		struct page *page;
>> +
>> +		if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
>> +			continue;
>> +
>> +		if (vas)
>> +			page = alloc_page_vma(GFP_HIGHUSER, vas, addr);
>> +		else
>> +			page = alloc_page(GFP_HIGHUSER);
>> +
>> +		if (!page)
>> +			return -ENOMEM;
>> +
>> +		lock_page(page);
>> +		mpfn[i] = migrate_pfn(page_to_pfn(page));
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @range: Pointer to the GPU SVM range structure
>> + *
>> + * Similar to __drm_gpusvm_migrate_to_sram but does not require mmap lock and
>> + * migration done via migrate_device_* functions. Fallback path as it is
>> + * preferred to issue migrations with mmap lock.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
>> +				    struct drm_gpusvm_range *range)
>> +{
>> +	unsigned long npages;
>> +	struct page **pages;
>> +	unsigned long *src, *dst;
>> +	dma_addr_t *dma_addr;
>> +	void *buf;
>> +	int i, err = 0;
>> +
>> +	npages = npages_in_range(range->va.start, range->va.end);
>> +
>> +	buf = kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
>> +		       sizeof(*pages), GFP_KERNEL);
>> +	if (!buf) {
>> +		err = -ENOMEM;
>> +		goto err_out;
>> +	}
>> +	src = buf;
>> +	dst = buf + (sizeof(*src) * npages);
>> +	dma_addr = buf + (2 * sizeof(*src) * npages);
>> +	pages = buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
>> +
>> +	err = gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_allocation,
>> +					     npages, src);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	err = migrate_device_vma_range(gpusvm->mm,
>> +				       gpusvm->device_private_page_owner, src,
>> +				       npages, range->va.start);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	err = drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, dst, 0);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
>> +					   dst, npages, DMA_BIDIRECTIONAL);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	for (i = 0; i < npages; ++i)
>> +		pages[i] = migrate_pfn_to_page(src[i]);
>> +
>> +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +err_finalize:
>> +	if (err)
>> +		drm_gpusvm_migration_put_pages(npages, dst);
>> +	migrate_device_pages(src, dst, npages);
>> +	migrate_device_finalize(src, dst, npages);
>> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
>> +				       DMA_BIDIRECTIONAL);
>> +err_free:
>> +	kvfree(buf);
>> +err_out:
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (internal)
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @vas: Pointer to the VM area structure
>> + * @page: Pointer to the page for fault handling (can be NULL)
>> + * @start: Start address of the migration range
>> + * @end: End address of the migration range
>> + *
>> + * This internal function performs the migration of the specified GPU SVM range
>> + * to SRAM. It sets up the migration, populates + dma maps SRAM PFNs, and
>> + * invokes the driver-specific operations for migration to SRAM.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
>> +					struct vm_area_struct *vas,
>> +					struct page *page,
>> +					u64 start, u64 end)
>> +{
>> +	struct migrate_vma migrate = {
>> +		.vma		= vas,
>> +		.pgmap_owner	= gpusvm->device_private_page_owner,
>> +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
>> +		.fault_page	= page,
>> +	};
>> +	unsigned long npages;
>> +	struct page **pages;
>> +	dma_addr_t *dma_addr;
>> +	void *buf;
>> +	int i, err = 0;
>> +
>> +	mmap_assert_locked(gpusvm->mm);
>> +
>> +	/* Corner where VMA area struct has been partially unmapped */
>> +	if (start < vas->vm_start)
>> +		start = vas->vm_start;
>> +	if (end > vas->vm_end)
>> +		end = vas->vm_end;
>> +
>> +	migrate.start = start;
>> +	migrate.end = end;
>> +	npages = npages_in_range(start, end);
>> +
>> +	buf = kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_addr) +
>> +		       sizeof(*pages), GFP_KERNEL);
>> +	if (!buf) {
>> +		err = -ENOMEM;
>> +		goto err_out;
>> +	}
>> +	dma_addr = buf + (2 * sizeof(*migrate.src) * npages);
>> +	pages = buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * npages;
>> +
>> +	migrate.vma = vas;
>> +	migrate.src = buf;
>> +	migrate.dst = migrate.src + npages;
>> +
>> +	err = migrate_vma_setup(&migrate);
>> +	if (err)
>> +		goto err_free;
>> +
>> +	/* Raced with another CPU fault, nothing to do */
>> +	if (!migrate.cpages)
>> +		goto err_free;
>> +
>> +	err = drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
>> +						   migrate.src, migrate.dst,
>> +						   start);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	err = drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
>> +					   migrate.dst, npages,
>> +					   DMA_BIDIRECTIONAL);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +	for (i = 0; i < npages; ++i)
>> +		pages[i] = migrate_pfn_to_page(migrate.src[i]);
>> +
>> +	err = gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages);
>> +	if (err)
>> +		goto err_finalize;
>> +
>> +err_finalize:
>> +	if (err)
>> +		drm_gpusvm_migration_put_pages(npages, migrate.dst);
>> +	migrate_vma_pages(&migrate);
>> +	migrate_vma_finalize(&migrate);
>> +	drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages,
>> +				       DMA_BIDIRECTIONAL);
>> +err_free:
>> +	kvfree(buf);
>> +err_out:
>> +	mmap_assert_locked(gpusvm->mm);
>> +
>> +	return err;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to SRAM
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @range: Pointer to the GPU SVM range structure
>> + * @ctx: GPU SVM context
>> + *
>> + * This function initiates the migration of the specified GPU SVM range to
>> + * SRAM. It performs necessary checks and invokes the internal migration
>> + * function for actual migration.
>> + *
>> + * Returns:
>> + * 0 on success, negative error code on failure.
>> + */
>> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
>> +			       struct drm_gpusvm_range *range,
>> +			       const struct drm_gpusvm_ctx *ctx)
>> +{
>> +	u64 start = range->va.start, end = range->va.end;
>> +	struct mm_struct *mm = gpusvm->mm;
>> +	struct vm_area_struct *vas;
>> +	int err;
>> +	bool retry = false;
>> +
>> +	if (!ctx->mmap_locked) {
>> +		if (!mmget_not_zero(mm)) {
>> +			err = -EFAULT;
>> +			goto err_out;
>> +		}
>> +		if (ctx->trylock_mmap) {
>> +			if (!mmap_read_trylock(mm))  {
>> +				err = drm_gpusvm_evict_to_sram(gpusvm, range);
>> +				goto err_mmput;
>> +			}
>> +		} else {
>> +			mmap_read_lock(mm);
>> +		}
>> +	}
>> +
>> +	mmap_assert_locked(mm);
>> +
>> +	/*
>> +	 * Loop required to find all VMA area structs for the corner case when
>> +	 * VRAM backing has been partially unmapped from MM's address space.
>> +	 */
>> +again:
>> +	vas = find_vma(mm, start);
>> +	if (!vas) {
>> +		if (!retry)
>> +			err = -ENOENT;
>> +		goto err_mmunlock;
>> +	}
>> +
>> +	if (end <= vas->vm_start || start >= vas->vm_end) {
>> +		if (!retry)
>> +			err = -EINVAL;
>> +		goto err_mmunlock;
>> +	}
>> +
>> +	err = __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, end);
>> +	if (err)
>> +		goto err_mmunlock;
>> +
>> +	if (vas->vm_end < end) {
>> +		retry = true;
>> +		start = vas->vm_end;
>> +		goto again;
>> +	}
>> +
>> +	if (!ctx->mmap_locked) {
>> +		mmap_read_unlock(mm);
>> +		/*
>> +		 * Using mmput_async as this function can be called while
>> +		 * holding a dma-resv lock, and a final put can grab the mmap
>> +		 * lock, causing a lock inversion.
>> +		 */
>> +		mmput_async(mm);
>> +	}
>> +
>> +	return 0;
>> +
>> +err_mmunlock:
>> +	if (!ctx->mmap_locked)
>> +		mmap_read_unlock(mm);
>> +err_mmput:
>> +	if (!ctx->mmap_locked)
>> +		mmput_async(mm);
>> +err_out:
>> +	return err;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_page_free - Put GPU SVM zone device data associated with a page
>> + * @page: Pointer to the page
>> + *
>> + * This function is a callback used to put the GPU SVM zone device data
>> + * associated with a page when it is being released.
>> + */
>> +static void drm_gpusvm_page_free(struct page *page)
>> +{
>> +	drm_gpusvm_zdd_put(page->zone_device_data);
>> +}
>> +
>> +/**
>> + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page fault handler)
>> + * @vmf: Pointer to the fault information structure
>> + *
>> + * This function is a page fault handler used to migrate a GPU SVM range to RAM.
>> + * It retrieves the GPU SVM range information from the faulting page and invokes
>> + * the internal migration function to migrate the range back to RAM.
>> + *
>> + * Returns:
>> + * VM_FAULT_SIGBUS on failure, 0 on success.
>> + */
>> +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
>> +{
>> +	struct drm_gpusvm_zdd *zdd = vmf->page->zone_device_data;
>> +	int err;
>> +
>> +	err = __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
>> +					   vmf->vma, vmf->page,
>> +					   zdd->range->va.start,
>> +					   zdd->range->va.end);
>> +
>> +	return err ? VM_FAULT_SIGBUS : 0;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
>> + */
>> +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops = {
>> +	.page_free = drm_gpusvm_page_free,
>> +	.migrate_to_ram = drm_gpusvm_migrate_to_ram,
>> +};
>> +
>> +/**
>> + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map operations
>> + *
>> + * Returns:
>> + * Pointer to the GPU SVM device page map operations structure.
>> + */
>> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
>> +{
>> +	return &drm_gpusvm_pagemap_ops;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the given address range
>> + * @gpusvm: Pointer to the GPU SVM structure.
>> + * @start: Start address
>> + * @end: End address
>> + *
>> + * Returns:
>> + * True if GPU SVM has mapping, False otherwise
>> + */
>> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end)
>> +{
>> +	struct drm_gpusvm_notifier *notifier;
>> +
>> +	drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
>> +		struct drm_gpusvm_range *range = NULL;
>> +
>> +		drm_gpusvm_for_each_range(range, notifier, start, end)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/drm_gpusvm.h
>> new file mode 100644
>> index 000000000000..0ea70f8534a8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
>> @@ -0,0 +1,415 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef __DRM_GPUSVM_H__
>> +#define __DRM_GPUSVM_H__
>> +
>> +#include <linux/kref.h>
>> +#include <linux/mmu_notifier.h>
>> +#include <linux/workqueue.h>
>> +
>> +struct dev_pagemap_ops;
>> +struct drm_device;
>> +struct drm_gpusvm;
>> +struct drm_gpusvm_notifier;
>> +struct drm_gpusvm_ops;
>> +struct drm_gpusvm_range;
>> +
>> +/**
>> + * struct drm_gpusvm_ops - Operations structure for GPU SVM
>> + *
>> + * This structure defines the operations for GPU Shared Virtual Memory (SVM).
>> + * These operations are provided by the GPU driver to manage SVM ranges and
>> + * perform operations such as migration between VRAM and system RAM.
>> + */
>> +struct drm_gpusvm_ops {
>> +	/**
>> +	 * @notifier_alloc: Allocate a GPU SVM notifier (optional)
>> +	 *
>> +	 * This function shall allocate a GPU SVM notifier.
>> +	 *
>> +	 * Returns:
>> +	 * Pointer to the allocated GPU SVM notifier on success, NULL on failure.
>> +	 */
>> +	struct drm_gpusvm_notifier *(*notifier_alloc)(void);
>> +
>> +	/**
>> +	 * @notifier_free: Free a GPU SVM notifier (optional)
>> +	 * @notifier: Pointer to the GPU SVM notifier to be freed
>> +	 *
>> +	 * This function shall free a GPU SVM notifier.
>> +	 */
>> +	void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
>> +
>> +	/**
>> +	 * @range_alloc: Allocate a GPU SVM range (optional)
>> +	 * @gpusvm: Pointer to the GPU SVM
>> +	 *
>> +	 * This function shall allocate a GPU SVM range.
>> +	 *
>> +	 * Returns:
>> +	 * Pointer to the allocated GPU SVM range on success, NULL on failure.
>> +	 */
>> +	struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm);
>> +
>> +	/**
>> +	 * @range_free: Free a GPU SVM range (optional)
>> +	 * @range: Pointer to the GPU SVM range to be freed
>> +	 *
>> +	 * This function shall free a GPU SVM range.
>> +	 */
>> +	void (*range_free)(struct drm_gpusvm_range *range);
>> +
>> +	/**
>> +	 * @vram_release: Release VRAM allocation (optional)
>> +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
>> +	 *
>> +	 * This function shall release VRAM allocation and expects to drop a
>> +	 * reference to VRAM allocation.
>> +	 */
>> +	void (*vram_release)(void *vram_allocation);
>> +
>> +	/**
>> +	 * @populate_vram_pfn: Populate VRAM PFN (required for migration)
>> +	 * @gpusvm: Pointer to the GPU SVM
>> +	 * @vram_allocation: Driver-private pointer to the VRAM allocation
>> +	 * @npages: Number of pages to populate
>> +	 * @pfn: Array of page frame numbers to populate
>> +	 *
>> +	 * This function shall populate VRAM page frame numbers (PFN).
>> +	 *
>> +	 * Returns:
>> +	 * 0 on success, a negative error code on failure.
>> +	 */
>> +	int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
>> +				 void *vram_allocation,
>> +				 unsigned long npages,
>> +				 unsigned long *pfn);
>> +
>> +	/**
>> +	 * @copy_to_vram: Copy to VRAM (required for migration)
>> +	 * @gpusvm: Pointer to the GPU SVM
>> +	 * @pages: Pointer to array of VRAM pages (destination)
>> +	 * @dma_addr: Pointer to array of DMA addresses (source)
>> +	 * @npages: Number of pages to copy
>> +	 *
>> +	 * This function shall copy pages to VRAM.
>> +	 *
>> +	 * Returns:
>> +	 * 0 on success, a negative error code on failure.
>> +	 */
>> +	int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
>> +			    struct page **pages,
>> +			    dma_addr_t *dma_addr,
>> +			    unsigned long npages);
>> +
>> +	/**
>> +	 * @copy_to_sram: Copy to system RAM (required for migration)
>> +	 * @gpusvm: Pointer to the GPU SVM
>> +	 * @pages: Pointer to array of VRAM pages (source)
>> +	 * @dma_addr: Pointer to array of DMA addresses (destination)
>> +	 * @npages: Number of pages to copy
>> +	 *
>> +	 * This function shall copy pages to system RAM.
>> +	 *
>> +	 * Returns:
>> +	 * 0 on success, a negative error code on failure.
>> +	 */
>> +	int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
>> +			    struct page **pages,
>> +			    dma_addr_t *dma_addr,
>> +			    unsigned long npages);
>> +
>> +	/**
>> +	 * @invalidate: Invalidate GPU SVM notifier (required)
>> +	 * @gpusvm: Pointer to the GPU SVM
>> +	 * @notifier: Pointer to the GPU SVM notifier
>> +	 * @mmu_range: Pointer to the mmu_notifier_range structure
>> +	 *
>> +	 * This function shall invalidate the GPU page tables. It can safely
>> +	 * walk the notifier range RB tree/list in this function. Called while
>> +	 * holding the notifier lock.
>> +	 */
>> +	void (*invalidate)(struct drm_gpusvm *gpusvm,
>> +			   struct drm_gpusvm_notifier *notifier,
>> +			   const struct mmu_notifier_range *mmu_range);
>> +};
>> +
>> +/**
>> + * struct drm_gpusvm_notifier - Structure representing a GPU SVM notifier
>> + *
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @notifier: MMU interval notifier
>> + * @interval: Interval for the notifier
>> + * @rb: Red-black tree node for the parent GPU SVM structure notifier tree
>> + * @root: Cached root node of the RB tree containing ranges
>> + * @range_list: List head containing of ranges in the same order they appear in
>> + *              interval tree. This is useful to keep iterating ranges while
>> + *              doing modifications to RB tree.
>> + * @flags.removed: Flag indicating whether the MMU interval notifier has been
>> + *                 removed
>> + *
>> + * This structure represents a GPU SVM notifier.
>> + */
>> +struct drm_gpusvm_notifier {
>> +	struct drm_gpusvm *gpusvm;
>> +	struct mmu_interval_notifier notifier;
>> +	struct {
>> +		u64 start;
>> +		u64 end;
>> +	} interval;
>> +	struct {
>> +		struct rb_node node;
>> +		struct list_head entry;
>> +		u64 __subtree_last;
>> +	} rb;
>> +	struct rb_root_cached root;
>> +	struct list_head range_list;
>> +	struct {
>> +		u32 removed : 1;
>> +	} flags;
>> +};
>> +
>> +/**
>> + * struct drm_gpusvm_range - Structure representing a GPU SVM range
>> + *
>> + * @gpusvm: Pointer to the GPU SVM structure
>> + * @notifier: Pointer to the GPU SVM notifier
>> + * @refcount: Reference count for the range
>> + * @rb: Red-black tree node for the parent GPU SVM notifier structure range tree
>> + * @va: Virtual address range
>> + * @notifier_seq: Notifier sequence number of the range's pages
>> + * @pages: Pointer to the array of pages (if backing store is in VRAM)
>> + * @dma_addr: DMA address array (if backing store is SRAM and DMA mapped)
>> + * @vram_allocation: Driver-private pointer to the VRAM allocation
>> + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mapping size
>> + * @flags.migrate_vram: Flag indicating whether the range can be migrated to VRAM
>> + * @flags.unmapped: Flag indicating if the range has been unmapped
>> + * @flags.partial_unmap: Flag indicating if the range has been partially unmapped
>> + * @flags.has_vram_pages: Flag indicating if the range has vram pages
>> + * @flags.has_dma_mapping: Flag indicating if the range has a DMA mapping
>> + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact allocation based
>> + *                       on @order which releases via kfree
>> + *
>> + * This structure represents a GPU SVM range used for tracking memory ranges
>> + * mapped in a DRM device.
>> + */
>> +struct drm_gpusvm_range {
>> +	struct drm_gpusvm *gpusvm;
>> +	struct drm_gpusvm_notifier *notifier;
>> +	struct kref refcount;
>> +	struct {
>> +		struct rb_node node;
>> +		struct list_head entry;
>> +		u64 __subtree_last;
>> +	} rb;
>> +	struct {
>> +		u64 start;
>> +		u64 end;
>> +	} va;
>> +	unsigned long notifier_seq;
>> +	union {
>> +		struct page **pages;
>> +		dma_addr_t *dma_addr;
>> +	};
>> +	void *vram_allocation;
>> +	u16 order;
>> +	struct {
>> +		/* All flags below must be set upon creation */
>> +		u16 migrate_vram : 1;
>> +		/* All flags below must be set / cleared under notifier lock */
>> +		u16 unmapped : 1;
>> +		u16 partial_unmap : 1;
>> +		u16 has_vram_pages : 1;
>> +		u16 has_dma_mapping : 1;
>> +		u16 kfree_mapping : 1;
>> +	} flags;
>> +};
>> +
>> +/**
>> + * struct drm_gpusvm - GPU SVM structure
>> + *
>> + * @name: Name of the GPU SVM
>> + * @drm: Pointer to the DRM device structure
>> + * @mm: Pointer to the mm_struct for the address space
>> + * @device_private_page_owner: Device private pages owner
>> + * @mm_start: Start address of GPU SVM
>> + * @mm_range: Range of the GPU SVM
>> + * @notifier_size: Size of individual notifiers
>> + * @ops: Pointer to the operations structure for GPU SVM
>> + * @chunk_sizes: Pointer to the array of chunk sizes used in range allocation.
>> + *               Entries should be powers of 2 in descending order.
>> + * @num_chunks: Number of chunks
>> + * @notifier_lock: Read-write semaphore for protecting notifier operations
>> + * @zdd_wq: Workqueue for deferred work on zdd destruction
>> + * @root: Cached root node of the Red-Black tree containing GPU SVM notifiers
>> + * @notifier_list: list head containing of notifiers in the same order they
>> + *                 appear in interval tree. This is useful to keep iterating
>> + *                 notifiers while doing modifications to RB tree.
>> + *
>> + * This structure represents a GPU SVM (Shared Virtual Memory) used for tracking
>> + * memory ranges mapped in a DRM (Direct Rendering Manager) device.
>> + *
>> + * No reference counting is provided, as this is expected to be embedded in the
>> + * driver VM structure along with the struct drm_gpuvm, which handles reference
>> + * counting.
>> + */
>> +struct drm_gpusvm {
>> +	const char *name;
>> +	struct drm_device *drm;
>> +	struct mm_struct *mm;
>> +	void *device_private_page_owner;
>> +	u64 mm_start;
>> +	u64 mm_range;
>> +	u64 notifier_size;
>> +	const struct drm_gpusvm_ops *ops;
>> +	const u64 *chunk_sizes;
>> +	int num_chunks;
>> +	struct rw_semaphore notifier_lock;
>> +	struct workqueue_struct *zdd_wq;
>> +	struct rb_root_cached root;
>> +	struct list_head notifier_list;
>> +};
>> +
>> +/**
>> + * struct drm_gpusvm_ctx - DRM GPU SVM context
>> + *
>> + * @mmap_locked: mmap lock is locked
>> + * @trylock_mmap: trylock mmap lock, used to avoid locking inversions
>> + *                (e.g.dma-revs -> mmap lock)
>> + * @in_notifier: entering from a MMU notifier
>> + * @read_only: operating on read-only memory
>> + * @vram_possible: possible to use VRAM
>> + * @prefault: prefault pages
>> + *
>> + * Context that is DRM GPUSVM is operating in (i.e. user arguments).
>> + */
>> +struct drm_gpusvm_ctx {
>> +	u32 mmap_locked :1;
>> +	u32 trylock_mmap :1;
>> +	u32 in_notifier :1;
>> +	u32 read_only :1;
>> +	u32 vram_possible :1;
>> +	u32 prefault :1;
>> +};
>> +
>> +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
>> +		    const char *name, struct drm_device *drm,
>> +		    struct mm_struct *mm, void *device_private_page_owner,
>> +		    u64 mm_start, u64 mm_range, u64 notifier_size,
>> +		    const struct drm_gpusvm_ops *ops,
>> +		    const u64 *chunk_sizes, int num_chunks);
>> +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
>> +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
>> +
>> +struct drm_gpusvm_range *
>> +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fault_addr,
>> +				u64 gpuva_start, u64 gpuva_end,
>> +				const struct drm_gpusvm_ctx *ctx);
>> +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
>> +			     struct drm_gpusvm_range *range);
>> +
>> +struct drm_gpusvm_range *
>> +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
>> +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
>> +
>> +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
>> +				  struct drm_gpusvm_range *range);
>> +
>> +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>> +			       struct drm_gpusvm_range *range,
>> +			       const struct drm_gpusvm_ctx *ctx);
>> +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
>> +				  struct drm_gpusvm_range *range,
>> +				  const struct drm_gpusvm_ctx *ctx);
>> +
>> +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
>> +			       struct drm_gpusvm_range *range,
>> +			       void *vram_allocation,
>> +			       const struct drm_gpusvm_ctx *ctx);
>> +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
>> +			       struct drm_gpusvm_range *range,
>> +			       const struct drm_gpusvm_ctx *ctx);
>> +
>> +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
>> +
>> +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, u64 end);
>> +
>> +struct drm_gpusvm_range *
>> +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 start, u64 end);
>> +
>> +/**
>> + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
>> + * @gpusvm__: Pointer to the GPU SVM structure.
>> + *
>> + * Abstract client usage GPU SVM notifier lock, take lock
>> + */
>> +#define drm_gpusvm_notifier_lock(gpusvm__)	\
>> +	down_read(&(gpusvm__)->notifier_lock)
>> +
>> +/**
>> + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
>> + * @gpusvm__: Pointer to the GPU SVM structure.
>> + *
>> + * Abstract client usage GPU SVM notifier lock, drop lock
>> + */
>> +#define drm_gpusvm_notifier_unlock(gpusvm__)	\
>> +	up_read(&(gpusvm__)->notifier_lock)
>> +
>> +/**
>> + * __drm_gpusvm_range_next - Get the next GPU SVM range in the list
>> + * @range: a pointer to the current GPU SVM range
>> + *
>> + * Return: A pointer to the next drm_gpusvm_range if available, or NULL if the
>> + *         current range is the last one or if the input range is NULL.
>> + */
>> +static inline struct drm_gpusvm_range *
>> +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
>> +{
>> +	if (range && !list_is_last(&range->rb.entry,
>> +				   &range->notifier->range_list))
>> +		return list_next_entry(range, rb.entry);
>> +
>> +	return NULL;
>> +}
>> +
>> +/**
>> + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a notifier
>> + * @range__: Iterator variable for the ranges. If set, it indicates the start of
>> + *	     the iterator. If NULL, call drm_gpusvm_range_find() to get the range.
>> + * @notifier__: Pointer to the GPU SVM notifier
>> + * @start__: Start address of the range
>> + * @end__: End address of the range
>> + *
>> + * This macro is used to iterate over GPU SVM ranges in a notifier. It is safe
>> + * to use while holding the driver SVM lock or the notifier lock.
>> + */
>> +#define drm_gpusvm_for_each_range(range__, notifier__, start__, end__)	\
>> +	for ((range__) = (range__) ?:					\
>> +	     drm_gpusvm_range_find((notifier__), (start__), (end__));	\
>> +	     (range__) && (range__->va.start < (end__));		\
>> +	     (range__) = __drm_gpusvm_range_next(range__))
>> +
>> +/**
>> + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmapped
>> + * @range: Pointer to the GPU SVM range structure.
>> + * @mmu_range: Pointer to the MMU notifier range structure.
>> + *
>> + * This function marks a GPU SVM range as unmapped and sets the partial_unmap flag
>> + * if the range partially falls within the provided MMU notifier range.
>> + */
>> +static inline void
>> +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
>> +			      const struct mmu_notifier_range *mmu_range)
>> +{
>> +	lockdep_assert_held_write(&range->gpusvm->notifier_lock);
>> +
>> +	range->flags.unmapped = true;
>> +	if (range->va.start < mmu_range->start ||
>> +	    range->va.end > mmu_range->end)
>> +		range->flags.partial_unmap = true;
>> +}
>> +
>> +#endif /* __DRM_GPUSVM_H__ */
>> -- 
>> 2.34.1
>>

