Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC1B492B8
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 17:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C367910E544;
	Mon,  8 Sep 2025 15:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fjGUbC0x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2079.outbound.protection.outlook.com [40.107.95.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD79A10E53E;
 Mon,  8 Sep 2025 15:16:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2rA6MJDlvnaUJ+wdp6UPa2QbpTU7yKlMfYlAkatcUBT00PQc5K0PtiKzbYLCRR0kJAL/6qwJgLVi27WOTz+EugC3Wgl/YEJX5kyfVL9GV9kdAvF3Bs+6FRly36m3MBdJT5jaTneNzd/pp+x2JFbhEnTcR3Mkj5q/WwDB3ehK/Azqhu1tKGUc3P5poFJmEAv4M5JkuZYMKUitK3spsQNTRJsoIqKOkp5aYWcbTCWbbOlf8jMJymedkF9OW+2jZt0bpgeUUbH9N22mllejbjmSpxYdTGkpMz4GuelsH9WtZU/zoHqc4NBObvDUBCucv0YCSqVs/ojQ0s94cTYkc5z9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRpvRjpSepUL/E8TlQNOX/ni3yh448D++8PVuv/zItI=;
 b=azFHZR2+CrbUmu6qMiK3zJzX4g3kLQcTHgGr9nJeT+3w3exIJ6gtLyoiH4RsmHo1AYSEOtkBf+vpC0b75XQy1xNexzdzzhEBqSJ5EQU1WnzKWdqx3cjmfZOWfa/XTnVy2EFnQkuVekBHGAypG0R9yyLDBOVVCd6trDHhbgoOnVHrwp6JtvB38PybKKXI0VF1RNBC9zGbNW3bc0n3hyw4aXHLPmBk82WJ2Yx6fe+J4FeQZwCJmgNA44p3etqKIpz8dX/r1CIHq4XuT5m0fTa9eealvBYLfWJb+YZEpHRKmceDevzg22VJYUCt7bu59EJdzyklmdUsWfMqyHTB+XFoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRpvRjpSepUL/E8TlQNOX/ni3yh448D++8PVuv/zItI=;
 b=fjGUbC0x+30vcOKwCQyNKtJnBNrS4jgFOXkFlYKY+ORB5nals2tZU2g2ZFjZopV+3kYMqITNqsihuJnr2YxRrLmtV+QG4oeqRQG6Th5dAYlXr56GuVbwSiojFECCWpibwWH/vMp+N3JrxcR0wafo+hKngpwT8r38fXENCSB51+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 15:16:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.017; Mon, 8 Sep 2025
 15:16:08 +0000
Message-ID: <c14bb417-276c-471b-9737-0f814af69d06@amd.com>
Date: Mon, 8 Sep 2025 17:16:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Switching over to GEM refcounts and a bunch of cleanups
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250716160555.20217-1-christian.koenig@amd.com>
 <c5830530bafa9806b9e1b0604d87f7907f651c82.camel@linux.intel.com>
 <5a9c2c36-d1b2-4871-b84a-7372aa547399@amd.com>
 <1f13c0b6-fdbb-4364-a32e-4344f8526464@amd.com>
 <fd34b897a3223346518d3fe009772996eb25c90b.camel@linux.intel.com>
 <d3f60146-39d3-458f-8271-cfcec1c92254@amd.com>
 <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c14a919a352742d6344f34455de6aa1e535ecc70.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:52e::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cb0056b-5d13-4907-6e89-08ddeeeaa2d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlpwZFlTYlpXUVUzK01PZndIeHI1UTFqMEY5UGlXT2VrMmxuaDVOcWgzMVI5?=
 =?utf-8?B?VzRJNm40V1YvaXdudjIvTkw5cEp2T3gvZExQcElLMEFwaWVkUTlqN0lMSTMx?=
 =?utf-8?B?UzdpM3QyQmlVaUFST1BEZ3p5TTY0QVNZc2Y2N0xmTHhFY1dVTEZBaElrVzRr?=
 =?utf-8?B?YnpxZjVtY3lBVWxoNU1SeVExaTRFMGJhMkFMc2ZZd3J3TllrNE9MNFZMSFhu?=
 =?utf-8?B?aGxncnNkZ2ZNNzJPSU9VM0tWTUhjd2NURElHclAxbUZneHpEVVlnRGhFQllD?=
 =?utf-8?B?TWQvSkdxdDZmZG91N3JSdDhhbjNoSi9FdHB0NGZ5MmUwaWRkOWlIbVpjNDlU?=
 =?utf-8?B?ZXRQZGkydStBNFJyaHk3eTB2ZFkzREJETWVhaDh5VDdHNUlvODVMTWIvcFUr?=
 =?utf-8?B?WlhDL3ZxR2lxbTNNQjlkbjVMYk11cTlaK2h4eEw0bEpMa3JtTWI2SzZlS0w3?=
 =?utf-8?B?TzhPOHJTVFQ4TmxPZGFOZVIySGFZQlZ3aDBiNUl1dFUyeVRtMGU2UUFhUzR1?=
 =?utf-8?B?NExRT285MHJtd1liUEo2WWhOR041WWhqSE0rdG43RWZ5eStSd0h2WVRoeCt4?=
 =?utf-8?B?a0pha0lRb3UvSkUzL1lYaDU0NWl6cEE5ckpFYjV6K1hFejd3QUkzMkVXKzBF?=
 =?utf-8?B?RDIwTXJob3VTeXRoNnZpQmUxL1lKZ2Y1TTRiYm1MLzNxMEFQUEc0a1Y4UTdk?=
 =?utf-8?B?cUtJYVpHQWFySXRMVVFlb1pRNHRNSjNwTGxjcjM3bVl6QmNVM3Fyc2JrQU9l?=
 =?utf-8?B?YnJmWENhRFdpZmttRzRIL0E1K29HRXVPY3NTYXRJbmZNU3RWVUp0Yy9rLzFW?=
 =?utf-8?B?b2I4ZjFnVDJsY3BmbWU1M2txbExUOFlaYS9QY3NDejdFb2R2andaeVV4UnVK?=
 =?utf-8?B?dG9ZZDE5b3VhMThkK1N0S1A4SzR3RjJJTjNCNjhzcjllbUJjQW9XWS9EcEFx?=
 =?utf-8?B?bUk2YjVEdVI2cmxhM3J2UVhYelU5aGM0REpQcjZOYkk3NGg4dklreXZobFZa?=
 =?utf-8?B?TFlkdUJZdnhSY2czL3RDNVUxdzFDSjBLVWl3YTNNTHdEeC9HZ0lJbFcwN0xq?=
 =?utf-8?B?N2N3SExDa0lYV0lwbVpwVkU2cTVrUm96VlJEeGo0b2JGNkE1YUp5dHMwSW9P?=
 =?utf-8?B?S1d5V2VkQnpWdkh2R2Riem04Ymhsd0dYeUVsQUppdUVmd2t4ZmIyTzgrVCti?=
 =?utf-8?B?Zlg4OWVuYm5pZnlkeThtSjhKNk5HaUN1dHdZTXlDUEIrUFdBTFA2b0MxbjIz?=
 =?utf-8?B?R25aYWMveTg0RGFQbE82TzdNcHhpaGczcS9JL0hjT3FPWjdjSGszcnRaMXZ3?=
 =?utf-8?B?eUdNSjJyQjVlRzZpcm1nVDNEenFZSWpXVUJRdlNVT21jTkFhMVhWUWU4UXRw?=
 =?utf-8?B?SmFIcnNGK2d4WDAydjZFV2U1TldkRnN3MW8zcDRMaHhwbk45MFBqVTJ2WWZK?=
 =?utf-8?B?WE1qVlJMOURCNkVSYlc2eEtGWlNYU3pzcENPZEVvUlNjWE5aVkJWd2F6WE9R?=
 =?utf-8?B?Rkd5OFArQmpZNjlCWUE2emRhQWJDdGRTQnRMMXFPSUZ1bjk1RGV2aXZVODQx?=
 =?utf-8?B?ajhFTGhkTjFWa3g1TlZiZnlacWVRdldGaGdGOGpNeDM2NHFXM3FhdjluRXFl?=
 =?utf-8?B?NzRkMkNPZEhsODJTRm5aMklmZU9EL2xnODRRNEV2d0VWT255MHF2RDByOUJL?=
 =?utf-8?B?a0tPSThGTGk5L2c4akJvM3hHOUZDUzVpbS9tT1JZYWEzVHRZY3h1NTF2b1lK?=
 =?utf-8?B?bWhsTTRVaXhTOWViSU5YbXJCa1Y2NnVYRTVOVUkxQ2JYRTl5c2dUazJMb0t3?=
 =?utf-8?B?bTZzS09VZ0FkSnh6bzR6NG9FcFVYc0hLWnhDN2IwM1VDTGNIR0tpTEdQMDU2?=
 =?utf-8?B?NVZEaEprSXVyVHZ5UlExRm5aRVFicnkyTVJ2d3hkckJsWXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RitqZng0OHFsTEhRZFAwbXFFK1BWRWthdXRnaU5pT0xrTWtQNHNsRTM0UGlh?=
 =?utf-8?B?M0hYT1kxeGF4UHl4Q1M3STdja2NuSno5dmtCcFE4U2xmTjlmbFp1MmxQRTk4?=
 =?utf-8?B?bzhUL0tDcDh5UFRBbTJkb2F1Ump3eTUyL0dSN1NtanhXVHBRV3RndEljOFFQ?=
 =?utf-8?B?SXUyL2J5TlRsSkwwZXRQYTVMQjZCUmFDRkdyUlNVY3AwZFpXSmJhaEFIZHN4?=
 =?utf-8?B?bjdEeUk3VC9BYWNCa1JQRjdLNk1NamoyaE12bC8rZDFDdzB1a1h1cysvY3Zz?=
 =?utf-8?B?TDJqUjlGVkU0QlZyWkFuVUNRQ2RyRWxnaHdhRmZaTTFNUmNhYVYzeE15bmh6?=
 =?utf-8?B?UFEyM1phRGZ3Q1o3c3dZbmtrSTVQeG52Q3BMYm9TMkx1Tk9lYXBmUVd0OWI3?=
 =?utf-8?B?bmo2RmtKdXJkZmZTVjdNOHNRdU5Gd2ZHSjF2TVFCZmtzZllWTm5QYzFqSjVS?=
 =?utf-8?B?RXM1aXVoeno2YUp2Z3BLN0toZ3RZbUN2U01HWlgyKytlUys4eWVvU3REUFZD?=
 =?utf-8?B?UUNDeFBLalh0U1hiY1c2M1U4VUw1QUxXYUFsUFdCUGhmNzdZOHVxZmhRcUM5?=
 =?utf-8?B?enBITUYvaEJhWE9WM2RoZUhDQUE4QnpWdWJkV0t2b056eFZodkFpRnB6RGU0?=
 =?utf-8?B?bWRqODhvVUhqMS8ycThYR000QmpJQ0NadktrY3ZFbklHMlFHUGIzb0FzODQ5?=
 =?utf-8?B?QjNidmI2WU5GMFd3QWFWZTdsTkFzdytIY2Npc3ZUbFBSU2pjQ0RrQUdnUVR4?=
 =?utf-8?B?cmFqU0dWZ3ZsUnpaWDZvT1FlSVZxWkRNL012enBJcjJhS2s5VC9GdCszWEt0?=
 =?utf-8?B?VzBTK1pRYmxvSFdhK2JlNHk2NjgxMEw1L3hPUGdZeGg1Y0RRN0thTE5DeHZB?=
 =?utf-8?B?QTUwTE42TEtlMkhtdWdWUmg3UG1oeks1aFBMdTFjK1JKYUF0bGdrWFljeE1l?=
 =?utf-8?B?Q1d0NEljZDU5UU94MmxVSXNaZzVBWktIYzVzRkoyVVRiTHZPK01IRGhjUTBQ?=
 =?utf-8?B?ZHJOZUFYL2czM0tVeXg5L0Jqbm5sRFNaYXBEVW4wbzV2dkt5Uko3ZmRBMXBZ?=
 =?utf-8?B?MkM4RVVpSGxpT2gxaXBpUStpSkc2N29SeUxoS2JKZUMyU2Z4c1l4MGRpeU1I?=
 =?utf-8?B?aFBxOFg1emc4cmpib0pBcmgydE1sOVUyMmNRN1dyOHBqTWpjWnErMVBOdm5W?=
 =?utf-8?B?Skc3ZGRVQ3l1Q1RRZHYvMWNmVW5Va3BPT2NvTlcxN1VKUVhqRC90d3NUbUd4?=
 =?utf-8?B?T1VYVjlXVkFhd0EzWTlab0RGcHdrYlJaYVJkdGxyaVV1U3VaRStHN2hjSDBD?=
 =?utf-8?B?UitPbDNNODhXUDlRQzdHQzlaWksrVUF6VmVxeklTTi80dDdKWmx4b2RIaHBG?=
 =?utf-8?B?L0pnci9JclZKelJDVmgxNDlsbnRLVENGaVphMGl6UFBCclIrdEJ2ekNkMTlI?=
 =?utf-8?B?RzR3MjN2YlBCZWp0V3Z3S1QrcUx6clNtSG4zcU5kTVRBUE84T1FUVHRoNyt6?=
 =?utf-8?B?WEQxQVkxU0Y3NnR0Z0RIczN5ekRSRXlNbTc1SE5lZEM2bFlUdUdRanVyMGcy?=
 =?utf-8?B?aTVzVThpa3M4eDMvNnh5OVhjeEFicDZUdk1sRjNnWTJkNGJ6VFBGVVU3eVE0?=
 =?utf-8?B?UUZXSnpHR0RaZkdlc2U4N3FHQ3pUZmhJT2NLN2dwalNTaGhINnBYb0pvMVBt?=
 =?utf-8?B?UjBOdVU1cXB2aHpmSjhmUjZxNDVXTU1sdVFFRUtGdE5lSzkxbEd5M3dCcUlJ?=
 =?utf-8?B?eU5pS2pIK2cwdC95c2RtdURWdloxL3Q4eGpmbkt4Tm9wMG5odUs1K3FHL3o4?=
 =?utf-8?B?SnlmYktkM21FWG1Sd1V2M1FQWjNjQW95NFVTUHBjMW5CcFk4WWVUMll0MDZB?=
 =?utf-8?B?SVZScEtEWnRkaEVnZFJwN1JFU01YUFhlL2F0L1BIWk0wUityU1ZkVVBFMEJO?=
 =?utf-8?B?Qm1MMVB3MEt2cUlzTVVYa08xdjZtc0JZSEVoaHVrZ3c2OHVocWVXTXF0VGwv?=
 =?utf-8?B?SUJkSStJQ2RjOGd3MmcxSGRPenVDb3Y5Q3BVNHA5N09BVEwwZ3l2aW1COFMr?=
 =?utf-8?B?ODF2QVBDa2pscU1MQzhicmJGZlJrQTFZbjlIWHJLcFc1cUQvTnVuaWVia01t?=
 =?utf-8?Q?eLXhE2TQ8S9zX4LUan7GV4Ct/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb0056b-5d13-4907-6e89-08ddeeeaa2d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 15:16:08.0242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QZZTA+gtxYpLK1JKb8NFMezYbVk3aR08Rz3hnATjEW4f5AOJJRL+17fci1CXfqz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
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

Back to this topic again :/

On 22.08.25 10:51, Thomas Hellström wrote:
>>> We would still need some form of refcounting while waiting on the
>>> struct completion, but if we restricted the TTM refcount to *only*
>>> be
>>> used internally for that sole purpose, and also replaced the final
>>> ttm_bo_put() with the ttm_bo_finalize() that you suggest we
>>> wouldn't
>>> need to resurrect that refcount since it wouldn't drop to zero
>>> until
>>> the object is ready for final free.
>>>
>>> Ideas, comments?
>>
>> Ideally I think we would use the handle_count as backing store the
>> drm_gem_object->refcount as structure reference.
>>
>> But that means a massive rework of the GEM handling/drivers/TTM.
>>
>> Alternative we could just grab a reference to a unsignaled fence when
>> we encounter a dead BO on the LRU.
>>
>> What do you think of that idea?
> 
> I think to be able to *guarantee* exhaustive eviction, we need
> 1) all unfreed resources to sit on an LRU, and
> 2) everything on the LRU needs to be able to have something to wait
> for.

Yeah, completely agree.

> A fence can't really guarantee 2), but it's close. There is a time-
> interval in betwen where the last fence signals and we take the
> resource from the LRU and free it.

Correct, yes.

> A struct completion can be made to signal when the resource is freed.
> I think the locking restriction in the struct completion case (the
> struct completion is likely waited for under a dma-resv), is that
> nothing except the object destructor may take an individualized resv of
> a zombie gem object whose refcount has gone to zero. The destructor
> should use an asserted trylock only to make lockdep happy. The struct
> completion also needs a refcount to avoid destroying it while there are
> waiters.

Exactly that's the problem, as far as I can see we can't do that.

See imported dma_resv objects needs to block waiting on the dma_resv lock in the destruction path. Otherwise we can't cleanup their mappings any more.

> So what do you think about starting out with a fence, and if / when
> that appears not to be sufficient, we have a backup plan to move to a
> struct completion?

Well we need to start somewhere, so grabbing an unsignaled dma_fence reference sounds like the best plan for now.

Regards,
Christian.

> 
> Thomas
> 
> 
>>
>> Regards,
>> Christian.
> 

