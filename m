Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB9C24FDA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 13:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5810EB23;
	Fri, 31 Oct 2025 12:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F4P8ZEDm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011004.outbound.protection.outlook.com [52.101.52.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B8510EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 12:26:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzlmPRH2+4NQyrVJHT4TaremDrRnkEL542mqrtcRjIo+Tm+YN0kJsp0aedXEWQY/qOoJhtyF8fiSFeaFjN0NuResd/3b4pVcNDsfA3ZohFHM1tIec27538f6n75BwPXdwQ88xoCyHaxiU6Fvzeb/vJa3f7HiuozRGT9UTNi+qiwt/bAY4QIoxBWuMA9rLANsSKhTpEslvu2ekwwP183Jn71YZf1jlvT9EBwY9JkxWqavsjCGddqe0UAzv03lLK3l/v97c7cKD1tEJgf1JDYKw7Js4VnFJuApd/cVb8uTT+Wz9XJ7ol318ex+/D19cIzUopWJlCUJlqIwUsAjwBRVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xYPudzhUHgpM70N6sxlO7ghhLabLbOuLSQrBPApUD8=;
 b=d0XqwhUnJZGFPq8CpnDfYljEIoIdWLVKX1/jM+tXLpZ3Q/tcpPj4u2ti4MvMckhqQdbF+RZ99JbHFn5irtZ2YSgVhIIDXn2dO0Fbvuhbeg7/PGZ9AgydyZjTQOxLQ7zAGHxk60GBOoMZnBwpUC44o9x8Yy71SAaldet1P+ggeFtc+mgoDGmJxcl+tVI8+BJ1pAb1Lxc/m93KfTtA2/MC31OoSg+N7TGAodmduHapU/FyZozJIXkvUnhRqyr71PcRiEURBeqbQ+PXWZtfidv8zhgKtiWU1n4fT9qrM69g/FWsu9AFSW8GUCb+RTqs2zht7x2nFIqe+KVWYuUPDufMUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xYPudzhUHgpM70N6sxlO7ghhLabLbOuLSQrBPApUD8=;
 b=F4P8ZEDmu0RqeXd4RN7sarHHSSWAU05InWqd4BtXhvBYq9FU8gCxM4j5r9wzC/hE3JnolNCdUpKUIMApRds6S2txEl7HfkZx1UDfUQ5wblc5qwnAFRIoSNc13v0CstBmuULmXRTQhYSVKbLTFDfXnBt8lCuQwuQc8wbItbgrUOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8882.namprd12.prod.outlook.com (2603:10b6:a03:537::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 12:26:05 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 12:26:04 +0000
Message-ID: <50f3743f-8b83-42de-87c8-1c7d52df3ab0@amd.com>
Date: Fri, 31 Oct 2025 13:25:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: Tvrtko Ursulin <tursulin@ursulin.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251031090704.1111-1-pierre-eric.pelloux-prayer@amd.com>
 <411190d4-92d7-4e95-acac-b39afa438c0f@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <411190d4-92d7-4e95-acac-b39afa438c0f@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:408:e2::28) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8882:EE_
X-MS-Office365-Filtering-Correlation-Id: 78b1c3dc-15a4-49e6-80b2-08de1878a89c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cndxWlBnS0Ftd29HQmlFaHpFN015dmtVREIxOFlscHZZZVRTaS9zWVc0ZG9W?=
 =?utf-8?B?dUMwMXZJM0dvbVNrZ0MxU21NeDZUNG81cllXbkp1K2xmM3pzQmhNdWlXc0lL?=
 =?utf-8?B?R0ZwVHdrLzJlenNndjlyWGZkUzNlTzJNcG81Qmk4bjVvM2VuMXpPR1dEVEd5?=
 =?utf-8?B?SkdLMWxTSTgvTjhjbG5rUUUxU2tOMTk2Y0NVdmVMUzhVQVZKeWdEK0xvazAx?=
 =?utf-8?B?eWZRY241eFNuZDllNHFNU1lSdU8xb1d4Ulo2QVgvUTRxdHVJREpZcndrWXg1?=
 =?utf-8?B?MHpnaVVURm8vdUpuL1o0eHVaWGhuMm5uK3Z3RDJYcCtpZmV4aVhGc2hDWkxx?=
 =?utf-8?B?d29ORWw5akljNjZLb1FvTGYrcFp5aDF2VHN6c1JCWkVIdUgxM05sa0cwdjJW?=
 =?utf-8?B?MjZWSW5wVS92V3k2NWJMY1RuVmh4Q3dUbFB6MlVCYW90SkM3a1NyS0JXT2ds?=
 =?utf-8?B?Y3poeTc3TExIa1A1WWV5dHUvUFJCWGk2aXVnNE1pc2praDNrSmt5S1NvMlc5?=
 =?utf-8?B?eTQ3c0xzQVZkZ1FGVm1MTXo1eGxwYkFZdE1FMk9CbFlNZVowS1g1ZjVHMnBV?=
 =?utf-8?B?QnJFdXo4WlhYOWJmRWpZL21iVWYzR080akRGZEZ6a2tuZjlMNHJMUS83OWts?=
 =?utf-8?B?ZERDNzE1N244UnkydEJOM2dONE5CbUxWUDE2dTdnSlpTQTNsYnNEeFV2a1Z1?=
 =?utf-8?B?S3hWbXNuaFBONWpjN0tjUml5VDRXSDNqY2U0c29zaFg0SW5OekVCZHJGRVg0?=
 =?utf-8?B?MVFQSzVObFBpSTJWNWxXczg4MW1WLzNpWUJWL1NSMHJwc2pBaEU3aVRjWUJa?=
 =?utf-8?B?TmE1UHgxM1lqREV2TWZXS1BucFRvSkdLQ1BnRjFzaUxvcGxRNVAzRld5SmQw?=
 =?utf-8?B?bEt4Sm9IZTlSK0E3RzJRT0NYME9WbUJlY2xBZHVHbVVWeEV5V0k4SUovVnh6?=
 =?utf-8?B?ZmEvMUY2ajNpTzZUNmk4NGNZT3hQU2ZyMExnellLME8reGNWUFk2V1FoWWov?=
 =?utf-8?B?d0l0ekxqSlQ5d2Jhby8wWGlscUZLOU1BdWtnWFhEOXZ0enRXWjAyQkh6bXM1?=
 =?utf-8?B?SWlubUNvY28yWkJGcjB2MEFhd1VWUEhEaUlodXM0TnBOTzZoNHdqOGtacEVo?=
 =?utf-8?B?VXJKdDB3RVRudTBPUUpJTTJQVlp3RmFrWGdSU3FRSmZxQnVVMnFrWUJQL010?=
 =?utf-8?B?SCs2NWg5aERadDlaQW5WclN3bXFKeE0zNENmbHBZci9yVlBGeGd5QVpqeTcz?=
 =?utf-8?B?TGRBdzJGOFRIWWgyNGc1OFkzNDZIamV6bEhudmNVMHFTcWpVSzFXTi91aVdV?=
 =?utf-8?B?ZjFBd2twUnJvOVRFSnAwNEVTUmYxUUVqMm9OM1ppYmdycXd1UG81WlV3Q0h5?=
 =?utf-8?B?engybGhnd1pGTnRoRFpBWkY3Q2tJMlJIVHprR1BQb2MyT3A0UTRheEV6MVdN?=
 =?utf-8?B?eEh4eWg5SEU1NGFNSHVLN1F1dmJoNTVKN3hXcG1MUmhiYTdQQkZXNzJIRXl1?=
 =?utf-8?B?ek5ndExiOThrNGxsOHpjZE1rTVEvdVp1UENKc1BQaW9VSkR2S3ZJUGtYL0xY?=
 =?utf-8?B?S0pwL2hCTDU5bXBmaFJxTUlJTTlQMnh1aEJkdzFRc1FGSS80L0JjeWlFZjJE?=
 =?utf-8?B?b3ZuUi9oZzUvRkZLdFo4LzBidlFja1J0Z3pWbWpWTXNDUEdJM1IvcGgvd0Fl?=
 =?utf-8?B?dzFVczVxVWN6Y3VLVDhkU3MyY1BJdWxJUWxBKzd0aUpLSk11OFJ5L1FQWTFi?=
 =?utf-8?B?elBZY3dGdG1tY2hHaE9STkVNVkJPWjYvWFlZSW9RcFF3bEliSzNkb09JbG5k?=
 =?utf-8?B?Uy8wenZ1dFhtVkpLMzdyZ252eG5IWEZJaUovTWVTcmJZdkduUmI4ek9VdkpC?=
 =?utf-8?B?dFhGWEVRT0RYSkRUdWZIa2lXY1ZhdCtwRDN6ank5bDlZSDQ4S1ZEVHRiWHNi?=
 =?utf-8?Q?QKRdbdIRvcAgWQMIU0EXHHa4/QAyP7dG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTVRSGtSMlAweGg3Sk9xR3pUTHVFZHFxLzZ0TGlRUHFPVnl1Ums2WWdDRHBh?=
 =?utf-8?B?UmYyVVJqMkhmNHhYM0UrZTRGcEt6d215K0VlZnVIUW5BVGlwWmZLRHp4NDlu?=
 =?utf-8?B?ZFFlV0JCSEdlaU94ZFozVzlia282MW42VEN2c09tb3hHSSt5aU9KNXIrQXFX?=
 =?utf-8?B?OWJ1U3R1cGNadTREY0dkYlk3ZUg3R0ZrWXpZZURtUUM0clJTUDZPY05pNmFB?=
 =?utf-8?B?SVRyZzFvN1RvMjVwcXJhL0l3V2hNYThaUk5aQm11UmNVMDJIM3J0NEtScGhm?=
 =?utf-8?B?V1BtUTVUamRybXpSaG1DL1pZZ1psU0Rad3F3eHhIRjAveXZVa3hMeE1mQUxm?=
 =?utf-8?B?WE9ZRzg5U3pKcU91SjhQUWFRWWlMU0hXaWhkb2tHQ3czbUFENXRjc3hvV2p0?=
 =?utf-8?B?WEYrenpZVFlTNWxLS20wR0tLTTdVV05tYW4rcXhPelIxTk1kTFYwMFM2RGc5?=
 =?utf-8?B?S3NlKzRwTEc0RzdvUzN2QlIwNnljM3M2SW1Ybkw0YlI5cjhWOTBPVDQ3R0VN?=
 =?utf-8?B?ZmhLM1RFbjIxWDFsNHRJTmtLUTRqbitJT2o5M3V4NEkwOFhEeFdGSllWeHEw?=
 =?utf-8?B?cWYxWlVLTmVXaCtXM3pydHQyY0FvMWhpVlYwbE4yRjNmd2kxeEVVdUR1ejE5?=
 =?utf-8?B?eTJlcno5SHRMOHBiRXdXY2tzaCszbG8rdDFjT09hSXUwWXZXRnRHZnFxSHpp?=
 =?utf-8?B?LzBhYUlHbE5xdWl6L1JnVytvTFMxZElOa2k4SHE2eEE5SnBiUFl4bVlMWG1L?=
 =?utf-8?B?ZC9rWFNLZjUwL0hZN0l0WTZZYkVkS3pua0NuWUFJUTZLQ3JLeGZQL21Tcy80?=
 =?utf-8?B?TGlhbndGNzVQUG85TVl6aDl3bVdROXpxWEVqYy9iMzAvZDRGd1NKb0YvMktP?=
 =?utf-8?B?WVRob1VBc1k2aGpobHAvdGR5LzFXMjRjRnp5em9VZktQL240RWc3WlpjaVJs?=
 =?utf-8?B?NUxVNjBqdUt1L0VHald6K1M3eXNyVHVibG8vbzZ6WVJja2FaUERiVVZNSTd4?=
 =?utf-8?B?cXJPbldkMmVwR0pTajhNMkF3OEQxY2ZNcERLbUwwTEV0cGpqblprRlNtSmlv?=
 =?utf-8?B?enhyMVJzM3hjZGQ2RFh0bG5ndW5LcDNaRkkzQzJiS1JIT01XOFY3QVpqLzFs?=
 =?utf-8?B?R0ZIZHBsOVlkMmtKUW5sOXFtVzAweEZXTTV4OFRQQ3ptTG40YUdlbEkzV2E5?=
 =?utf-8?B?MmF3S0lmdW9VT3N1UzRQd2paUk80WVhoeldGem55emFYOWpITDM1T3Vwb0Zi?=
 =?utf-8?B?N3o5VHVmYkd5WDJzWHFWdFA2alptZFZZeFdmaEF1N0tsRDB0SnJGem1KVXAx?=
 =?utf-8?B?KyszNkUxL1ZTamFubTIvZzBuK0hueEoxbG9QWllrR2tHMmdqZmtFOGRZQXd1?=
 =?utf-8?B?cXlBY2xkdm90UUVlM2x6UTZYL0paZUNyVURUK2F2K0pOMEVTU1RnclpSRHhS?=
 =?utf-8?B?VWxHb1Y2dHVYZFlQZVNTMWNjOXkveEpVQjVIZThIVDZOdVdHZDZqZmlGamdU?=
 =?utf-8?B?cm9uUGRYOHo2aG91VnUwcEpVbnR2MlFVMm5rWW5jaEVmTWgzeEdDMUwxT055?=
 =?utf-8?B?NmpiQlRiQ1Y1NFJQOVpTRmlXNmtUUyt0ajlxME9TZUZRUEYzemtUc1F0M0Rz?=
 =?utf-8?B?aHptMEtsRC92cmdkUEJwQTZ6WDI3aHJlczFQZDR3MFBLM2MvTktLL0NqVTdx?=
 =?utf-8?B?R3ZiVzhhbXNTYXg4ak9mYVRsTlRKUWdpZFJaUUd2UFdXeWNEZTVOMFhaZ2dI?=
 =?utf-8?B?eFFqV3BmTzJqeUxyV1B1REtkQklHbWlhSVFMbW1ORmV1aE9ZZ3RISWtSOWZU?=
 =?utf-8?B?U3JUaFVRdHNHZm5DOGtrUmJhclN2eWZ4VTl0RndvOGhnNkVrLytWQVNIeWo2?=
 =?utf-8?B?RDNHeUtPVWpvQjZjc0ZWS0ZIc3llaFRSd3VXUFluMXRTSWtyNDIwOVVlamh3?=
 =?utf-8?B?Y3NHMlJsNElRYi94ZWNvVFAwbVphQS84QzZTOUkvZW1aNjR3QzVxdi9pRzJp?=
 =?utf-8?B?Vlo2TXk4NzdEbjlhbkZCZysvUkFoTjRNeHMvSks2UjJyQVplTmVMbHBvMEJC?=
 =?utf-8?B?TVhLU1EwRzdIbjU4UGJISnlJY2hvVy9UNmdLQWFydEdubG5WUjlZeklORVFW?=
 =?utf-8?Q?pSCKEgyKGKyqJyyavsfvI4sCm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78b1c3dc-15a4-49e6-80b2-08de1878a89c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 12:26:03.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujwhLLZPSuIbw5Vm3NL+C5GG2Tzo3HiUPowf3zPl6O8vMEQgbUe3SKc+4/FiHIDb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8882
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



On 10/31/25 12:50, Tvrtko Ursulin wrote:
> 
> On 31/10/2025 09:07, Pierre-Eric Pelloux-Prayer wrote:
>> The Mesa issue referenced below pointed out a possible deadlock:
>>
>> [ 1231.611031]  Possible interrupt unsafe locking scenario:
>>
>> [ 1231.611033]        CPU0                    CPU1
>> [ 1231.611034]        ----                    ----
>> [ 1231.611035]   lock(&xa->xa_lock#17);
>> [ 1231.611038]                                local_irq_disable();
>> [ 1231.611039]                                lock(&fence->lock);
>> [ 1231.611041]                                lock(&xa->xa_lock#17);
>> [ 1231.611044]   <Interrupt>
>> [ 1231.611045]     lock(&fence->lock);
>> [ 1231.611047]
>>                  *** DEADLOCK ***
>>
>> In this example, CPU0 would be any function accessing job->dependencies
>> through the xa_* functions that doesn't disable interrupts (eg:
>> drm_sched_job_add_dependency, drm_sched_entity_kill_jobs_cb).
>>
>> CPU1 is executing drm_sched_entity_kill_jobs_cb as a fence signalling
>> callback so in an interrupt context. It will deadlock when trying to
>> grab the xa_lock which is already held by CPU0.
>>
>> Replacing all xa_* usage by their xa_*_irq counterparts would fix
>> this issue, but Christian pointed out another issue: dma_fence_signal
>> takes fence.lock and so does dma_fence_add_callback.
>>
>>    dma_fence_signal() // locks f1.lock
>>    -> drm_sched_entity_kill_jobs_cb()
>>    -> foreach dependencies
>>       -> dma_fence_add_callback() // locks f2.lock
>>
>> This will deadlock if f1 and f2 share the same spinlock.
> 
> Is it possible to hit this case?
> 
> Same lock means same execution timeline

Nope, exactly that is incorrect. It's completely up to the implementation what they use this lock for.

>, which should mean dependency should have been squashed in drm_sched_job_add_dependency(), no?

This makes it less likely, but not impossible to trigger.

Regards,
Christian.

> 
> Or would sharing the lock but not sharing the entity->fence_context be considered legal? It would be surprising at least.
> 
> Also, would anyone have time to add a kunit test? ;)
> 
> Regards,
> 
> Tvrtko
> 
>> To fix both issues, the code iterating on dependencies and re-arming them
>> is moved out to drm_sched_entity_kill_jobs_work.
>>
>> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> Suggested-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>   1 file changed, 19 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>> index c8e949f4a568..fe174a4857be 100644
>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>   }
>>   EXPORT_SYMBOL(drm_sched_entity_error);
>>   +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +                      struct dma_fence_cb *cb);
>> +
>>   static void drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>   {
>>       struct drm_sched_job *job = container_of(wrk, typeof(*job), work);
>> -
>> -    drm_sched_fence_scheduled(job->s_fence, NULL);
>> -    drm_sched_fence_finished(job->s_fence, -ESRCH);
>> -    WARN_ON(job->s_fence->parent);
>> -    job->sched->ops->free_job(job);
>> -}
>> -
>> -/* Signal the scheduler finished fence when the entity in question is killed. */
>> -static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> -                      struct dma_fence_cb *cb)
>> -{
>> -    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>> -                         finish_cb);
>> +    struct dma_fence *f;
>>       unsigned long index;
>>   -    dma_fence_put(f);
>> -
>>       /* Wait for all dependencies to avoid data corruptions */
>>       xa_for_each(&job->dependencies, index, f) {
>>           struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
>> @@ -220,6 +209,21 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>           dma_fence_put(f);
>>       }
>>   +    drm_sched_fence_scheduled(job->s_fence, NULL);
>> +    drm_sched_fence_finished(job->s_fence, -ESRCH);
>> +    WARN_ON(job->s_fence->parent);
>> +    job->sched->ops->free_job(job);
>> +}
>> +
>> +/* Signal the scheduler finished fence when the entity in question is killed. */
>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>> +                      struct dma_fence_cb *cb)
>> +{
>> +    struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>> +                         finish_cb);
>> +
>> +    dma_fence_put(f);
>> +
>>       INIT_WORK(&job->work, drm_sched_entity_kill_jobs_work);
>>       schedule_work(&job->work);
>>   }
> 

