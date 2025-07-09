Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E5AFE36A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 11:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BCD410E76A;
	Wed,  9 Jul 2025 09:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kiSrtyps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2084.outbound.protection.outlook.com [40.107.93.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2C1010E16F;
 Wed,  9 Jul 2025 09:01:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HZzBkBJVMUdxoDcAyB3QKjE7XbtJmpDcL2ak4+bqbRHnriRn2SXp74fJCfP7jFgwxj3mgvrRYhMeS/gQTDTegyfO9gaBCI+0Qb3Ll4sQk5Y1u5l4We1w8jsKknDDtDTF+sBGt5ttrpg5LeJ/Hb87HYO098p2Va2Gp1s0FQtC1znzLva/jDEnADbsMewqA7DIwibfOdiHOmTOpdqdphbW9q05OVjkvXgGqMGFlL7DXKcwsw7crq2r7fvEAc/k2v2ECZ9mNcs13+iPPkfHfsGzxeqHh3J6GzPW48GXN+l/O8puEIuZ2b5Ran593lrLZDsjrEC6faM/976yn4xITCQEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Qw2C5pj9HOm+FgYyWg/6wW+uVHmByGVUFEtUbLPtcg=;
 b=HLtsvUZMne59Ms5Hh/zKThg9nDSVkYD2+08aFyeyZIFSXtVCY9vjE+Hnbb+AnWk2Z42GGzN7t66TqDH0ny3MdelCqyg9lco5yt4+vvFd5vr7AU2+FhW0XAn8RVRsub7RwJWxlxUeugVU1jTGCx8w91qkvTm7fZBuZiUbjLMuN30cHvDcZtRT0djun3ysJ+oFc2Ebd1qJLSWPhZ3AFOK2VPci3evtf5P4uXjBy4iIsGPtB+Ut+ahI7hul2denUeiAai4HkT5rr1m59IBica2zqm6KGdFaMDVhdoU7yD50l6qZXUlMhz4gEm3PLWgjOChpoG65V6CDAoYok3vDI5xrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Qw2C5pj9HOm+FgYyWg/6wW+uVHmByGVUFEtUbLPtcg=;
 b=kiSrtypsDVUJ9e6J+iKRUqxIhUFFW9mR/xw1DUrcdx1HLtJhI3NRAF5hMgKjO8SetmeBmnRBZfnwfEUARt2D+PzWHfbAtUUPccm7PXB7ktHwbtFrzflAO7re1+W+TyJURIOdiq2/IE3AEk7NyIqQhndpCY+Wcwu+IMWLcmR8hvw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 SJ1PR12MB6195.namprd12.prod.outlook.com (2603:10b6:a03:457::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 09:01:36 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8880.023; Wed, 9 Jul 2025
 09:01:36 +0000
Message-ID: <d9ccf4e8-afed-4206-8f5e-b9e2bc02dae0@amd.com>
Date: Wed, 9 Jul 2025 14:31:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "McRae, Geoffrey" <Geoffrey.McRae@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
 <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
 <5878b6eb-7961-4ffb-aebd-601868163de6@amd.com>
 <103de0a1-22bd-4389-9f5b-c1283497387c@amd.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <103de0a1-22bd-4389-9f5b-c1283497387c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::27) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|SJ1PR12MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: de79b21b-b60b-4523-338f-08ddbec7356c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUNnUzgzQm9FZHJqQzdtdXRiZnpMbitMNlVhazk3RlZWZ1hXK0ZjbHFPT0hr?=
 =?utf-8?B?T2Z2a2JIZHBnelVSZ2JPM0RJcFplcHhlY0NtZWVXVGl3UjZkSjZ0WDAzamI0?=
 =?utf-8?B?NFNDcE53Ymo1Q1ZlS0xtS0Qxd2FLL0xkeU85b2JmY3h0Yk5kbnl6YXYzRkFh?=
 =?utf-8?B?amI2U1BSL2crN3V1YmJSdm9Mek9Eek9HcFBPeUZ3Z2pGRDc5ajlTcHl2LzVB?=
 =?utf-8?B?VTNyYmJZTmR2OCt0a0hJeUk3V05TWXlMeDl5S0JKNmxjRUdDZzdPT0J3K1ZO?=
 =?utf-8?B?UDIvZDA5aWNNTW5KNG1qTzAwa2RCTHNZK3ZrTVgxVEZ3aEhEb0Q2UlJtalFV?=
 =?utf-8?B?a1B4bW9JRDFhYm1oKzhYc1FvT3hOakRFMUZIYnMrUnVYZi94d29scXVmMEFx?=
 =?utf-8?B?c0RzVjhVNkdRaU9rSm9Dekl5eGdEUURUa2xGRFVyWWRoZW4xeGpPMTFFYThH?=
 =?utf-8?B?ams1OGh3cEZoRjRXSUtWMGt5S2ZpSEd1M1VyR2FwTURJazNPblV6N21wdVAv?=
 =?utf-8?B?VWdyalladU5Da1NMbUVCdUlrbjFiOFpyZ3JaaDV6TkJjYTNzQXQ1NlkwQ3Iy?=
 =?utf-8?B?RzBteElxQzFiWExTNzQ3czFzVVZHUUNKUGJIaXlKcnEwVkNuZzVMdlFBeHBh?=
 =?utf-8?B?UTlTbFdhaHRnMnBkVTNaT3ZOazl1czdBd01mOHVPQXFxb29lam4xNUM3N3VP?=
 =?utf-8?B?RTNKbmdVZUU4WGhtUUZ1REJVa1pkQWo2YXNvZ1hENjBKWHJMOGdmN2ZQbmdP?=
 =?utf-8?B?bVl6Wk0xdDFHWkQrRzdOakdET0RzRldsWUZ5azQxWWNtRk5QMENiZzFwdDdD?=
 =?utf-8?B?VHhxOWs3MkhuVXpTQWl6c1paaWJtdGx6ZWlEc1V6K251VGRmWjRFTjJia1J3?=
 =?utf-8?B?ZjdGNWtTUHMxd3d2eDRXTHlVTkxtYS9nTExBdDNwUTFQaWdpbFJ4TlRnZFpO?=
 =?utf-8?B?OXhoNkpBUU9rak0xSldSb3VvNTREODlSLzVqazJQWUVCaTBCd25Jd1U3eHZ4?=
 =?utf-8?B?bVZTZUgzS2pNWnRYVnk1VW01UFIxZW5aYVRFaGhTOC9Pa1BiREFNc2NHY2JS?=
 =?utf-8?B?UEZxUWFTUktnMTV4ZmZiK1BXbTdjVHJDZElJb3dram9XZm1RODFzVDlmU1Av?=
 =?utf-8?B?SnFDeTFOcHlUcVdtY2hRZE5PZHgxUTY1MDUwQ1FmUURPakF4OWZsbzdCV3pF?=
 =?utf-8?B?NVd6Z1N3cDQrV2FObkRNb2xoeHdFb3VxMWRHUjMyTXlSUWY4QXZETlNJTnBv?=
 =?utf-8?B?ZWFSRVNGWGgrNWhUZkNwUFhZYlVrcVBmSktoSmNSV2drWENtUHNPdVcrMHlq?=
 =?utf-8?B?bTNQODBUUklEdnJJTnJNT3ZRU0kxb2ZYbTk1ZSt4ZUtuTmhneGt6QllCTmN6?=
 =?utf-8?B?WjlkNmxLT2ZSaC9qeEdSOW1veGl1RTlyREpXVXVZOG1YdXNSL25Lc0tIYk9X?=
 =?utf-8?B?TStrTkxDNVVwSkpZZkhmckI0T0YvQXNNaER4Qkt4U2ZQMWl1VnN3NVNEWjA2?=
 =?utf-8?B?WHJPcWcxZ3dORlBMNmR2TjdBSFYrbkNRcFZJa0R4Vk85bnEzY2pTeElLZnFi?=
 =?utf-8?B?SGRSQTVtWk9lOS82OFJGR2VnRWlxMkxnYzZyWDNVc2tIOGtnY0xES0pLaHdS?=
 =?utf-8?B?QXIxOUdnSkpobjNQcmlSQWZHSXNFYzNoY080bDRJYldaTmNBREpyTE0xcGxy?=
 =?utf-8?B?a0x0cm1zM1lhM0N1K2xVL3JpclFIamFESTc4TlltbmgyMHY2WmxiWHc0UUxW?=
 =?utf-8?B?TFVHZ2dWQ3ZuQzNpdjFjd3EyQ2hZdnlDd0RQUGdncTlUSmZnWWxNTXV2UU8v?=
 =?utf-8?Q?Wm8NtxkKRPNTsJP0JY2/YrvNj5OHM+w2ZRGuI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWVobXExa1ZHZ0pmem5aT2pMcW52a3pRcllXVU51Sis2aWVXMEJBcXIydWt1?=
 =?utf-8?B?Z2RYM1c4M3VVMzlicGdWNzV0QUc3and1TzVqZGJvTXloTXRLNlNoWmE0OFZ1?=
 =?utf-8?B?NWE2SVJCa0Y4UGhZblI5cDNBWjZSZStXekxXT2xLSjN1TzJoQ2NQaksvamV2?=
 =?utf-8?B?VTRjdDJpSHF4eDFoL0lnYThMR1c5QS8wYk1IUTVBbEE5K0Q5aEQ0UVFRZWpa?=
 =?utf-8?B?V285bHlTZ2ZqWFFEa21ucmpzRitSc2ttOU5GTCtuQnc4S3paVjllclpjSlpP?=
 =?utf-8?B?VXJLRWNVYm1tN0Qzc3dGUGdGdElKdTJnYlJnVUFLL2dBUWtFMm0vK1l4VzJj?=
 =?utf-8?B?cFZUOU9NRjZNaHpKVXRYT01BOHV4UmhqM3kwSkFWaUd2NkxOVmI1c3BKZVJ6?=
 =?utf-8?B?bDVLbW16dk9TbzViUGx5UUp5ZS92UFZKT05OMW9IQm5sOWFuak9ER3ZZbzIr?=
 =?utf-8?B?UTBiTGxKbEVQakxqWEs5cUlvMmRIZ0xyVUhkNlpvRE1BbVd4SGFlQ2hTRGpw?=
 =?utf-8?B?TFRTa3YwYU5FRHF3YlNsaEdqYXVoRVRhSnB1T1IzYlFxbWZNQnJGSGVFNkho?=
 =?utf-8?B?ZnZPb0NSdmdvNEdISEw4L3Fyc0c5clFDMm9qYVgrMGFveDIyZDZKQXdsVy95?=
 =?utf-8?B?OFB2Nm1QNUVPSkN1bHFXL1V1anpSWmVzbkRiTENCWEhlSmttTU9wUWhCMHZC?=
 =?utf-8?B?UXI3MlhCT3Y0Q29QblBZaHVneVVNeklVQ2FPZ2xIYlFENDhNYkM5QVJ5bUdF?=
 =?utf-8?B?ek5JSldlS0lnME9YVnRwcUJ6OFZkTjBWbU4vNEF5bjhiOWhwUHNOdnBCeFox?=
 =?utf-8?B?QTU2R2pKZ3h6M2pFcU81RzFpYWtxZW04NHVtL2NtWm9RdFRXNWtGMWFqbDh6?=
 =?utf-8?B?OW1TZFZZbE5PL3BENFJUZnJQaVQzM0ZVZ1REVUdJQ0Jnc3NUMm02MzFkaHdB?=
 =?utf-8?B?ZWhLU3owQU5SeHp3R3hzMk0yU0JSbHRsV2JsSWY3WlZIZ0p4QloxbG0yTzRM?=
 =?utf-8?B?MDF2emRYSUZ5d1hkUHo1L1pKOEdoL1ErcWNZOVR4SWdoZ21wc29TUWRYWmFt?=
 =?utf-8?B?eDhBKzY1QjJKNGQxRHNmOVJNd3JCdVVJM0w1ck9wMFlyK1NCdVBoMDQwUm9Z?=
 =?utf-8?B?bGNyeStTTGlCVTdpQ1g3K2RuTThBWGhsNE00YnN3dFVhZS9JYkpVNnlmQmZR?=
 =?utf-8?B?ODZ6K1pOcE1pemNBMjJGeVNiTWtsK0R1czJsZ3dCRlJTT0s5UlJQRmpxRncy?=
 =?utf-8?B?djF6SHdOVDNkNWVtalZ4QkxwMXR1U1J3bU1PblBaTGl3WkVaVDBra0FURE41?=
 =?utf-8?B?UmZkUU1WM094VnU0SmV6Q3diTnZBdGhwOG9YcHpNV0NwaksyT28rRXRjNWVP?=
 =?utf-8?B?WE9jWENBUisxSEwyNStDdUk2MmJCQ1Fha1lpbjhZVlRKUkE5Q0VXcmFvYUZ5?=
 =?utf-8?B?d2dHWnB5T3lrc015YnZYSUlWc0VONGtRemN2d0FNdVN0cW5haHNjbXd0YTla?=
 =?utf-8?B?VzhqSlo3N3R5Q0kyMW1WRGprSTBZRnBTbzAxUVhNMFRsODgrbEJ0NTgvYnp5?=
 =?utf-8?B?eU56L203MFhrYjRyR1JmSFZtYnNrWEx3NHdocFJkY2NiZGMxajB5NXRoVXd0?=
 =?utf-8?B?dVFYZTN0aDNJdVNIeFpCclZLWEZNUGZJSEFVQmM2Sm54QnQ2bTJuWEJrd0R3?=
 =?utf-8?B?VGVSek80SjJ5ek1Pb1N5Tit2aWp2WTZyU3pmSXRyL3N5YThtQXgvV1dLVzEv?=
 =?utf-8?B?VXBUZGZzMkZWakxjM2EvdnN6OHpJWjdOYlpoQ3YwSWpWKzU3RS9vUVNVQWpB?=
 =?utf-8?B?cWh3RC96aFZnMTVmN1U4aDJqOTZpUDNublk0c05XRWtSOE9SVHdhZVhYenIx?=
 =?utf-8?B?a0xsNUZyQTZ5b3g4UkRCd2d0TDAvRSt5bWFjWXNQZnlmNnkxZGcvNlM3dmhu?=
 =?utf-8?B?THRSWStJZHQ5YkdzZytxRURWdUpoQUM1WThBL0RJZkdPTGpJM2FDL05KNnN1?=
 =?utf-8?B?aXNqUEtiZ0dCM0tseXU2NEZYMUlmUGtBRUhpUWFDeDBOR2oxMGptK3d4OURt?=
 =?utf-8?B?TTdMellXTDFjbWhRZmpKa0haSjFhTFpoc0xoc1RRdFYwWitvVE5Kb2xLU1BS?=
 =?utf-8?Q?UpO0Uvv5eZczS9PG1k9SxsnSJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de79b21b-b60b-4523-338f-08ddbec7356c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:01:36.3278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HZXj0Ydh6JpvSK+hN7YnvG4EocaLl5GtnFOQ70sVf2zv/iNRRnx0JF+GgyV8zrn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6195
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



On 7/9/2025 2:09 PM, Christian König wrote:
> On 09.07.25 06:56, Lazar, Lijo wrote:
>> On 7/8/2025 8:40 PM, Deucher, Alexander wrote:
>>> [Public]
>>>
>>>
>>> I seem to recall -ENOTSUPP being frowned upon for IOCTLs.
>>>
>>>
>> Going by documentation -
>> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html
>>
> 
> Good point.
> 
>> EOPNOTSUPP:
>> Feature (like PRIME, modesetting, GEM) is not supported by the driver.
>>
>> "Note that ENOTTY has the slightly unintuitive meaning of “this IOCTL
>> does not exist”, and is used exactly as such in DRM"
>>  
>> Since KFD ioctls could eventually be supported in drm node,
> 
> That's certainly not going to happen.
> 
> We are currently in the process of deprecating the KFD IOCTLs and either using the existing DRM render node ones or coming up with new IOCTL/additions to the existing ones.
> 

I really meant to convey this to justify using drm documentation as the
background for picking error codes for KFD ones also. At least for any
new error code returns, definitions will remain consistent across both.

Thanks,
Lijo

> Background is that some of the KFD IOCTLs have design flaws which are unfix able.
> 
> Regards,
> Christian.
> 
>> it seems
>> better to go with ENOTTY.
>>
>> Thanks,
>> Lijo
>>
>>>
>>> Alex
>>>
>>>  
>>>
>>> *From:*McRae, Geoffrey <Geoffrey.McRae@amd.com>
>>> *Sent:* Tuesday, July 8, 2025 5:13 AM
>>> *To:* Koenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix
>>> <Felix.Kuehling@amd.com>
>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com>; amd-
>>> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
>>> IOCTLs
>>>
>>>  
>>>
>>> [AMD Official Use Only - AMD Internal Distribution Only]
>>>
>>>  
>>>
>>> I am happy to use EOPNOTSUPP but I must point out that this is not the
>>> pattern used across the kernel, the standard is to use ENOTTY, which is
>>> also the default that fs/ioctl.c returns when no handler is present.
>>> Userspace tooling such as strace and glibc specifically expectect ENOTTY
>>> to indicate invalid or unsupported IOCTL.
>>>
>>> ------------------------------------------------------------------------
>>>
>>> *From:*Koenig, Christian <Christian.Koenig@amd.com
>>> <mailto:Christian.Koenig@amd.com>>
>>> *Sent:* Tuesday, 8 July 2025 5:01 PM
>>> *To:* McRae, Geoffrey <Geoffrey.McRae@amd.com
>>> <mailto:Geoffrey.McRae@amd.com>>; Kuehling, Felix
>>> <Felix.Kuehling@amd.com <mailto:Felix.Kuehling@amd.com>>
>>> *Cc:* Deucher, Alexander <Alexander.Deucher@amd.com
>>> <mailto:Alexander.Deucher@amd.com>>; amd-gfx@lists.freedesktop.org
>>> <mailto:amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org
>>> <mailto:amd-gfx@lists.freedesktop.org>>; dri-devel@lists.freedesktop.org
>>> <mailto:dri-devel@lists.freedesktop.org> <dri-
>>> devel@lists.freedesktop.org <mailto:dri-devel@lists.freedesktop.org>>
>>> *Subject:* Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported
>>> IOCTLs
>>>
>>>  
>>>
>>> On 08.07.25 06:22, Geoffrey McRae wrote:
>>>> Some kfd ioctls may not be available depending on the kernel version the
>>>> user is running, as such we need to report -ENOTTY so userland can
>>>> determine the cause of the ioctl failure.
>>>
>>> In general sounds like a good idea, but ENOTTY is potentially a bit
>>> misleading.
>>>
>>> We usually use EOPNOTSUPP for that even if its not the original meaning
>>> of that error code.
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com <mailto:geoffrey.mcrae@amd.com>>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>> index a2149afa5803..36396b7318e7 100644
>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
>>>> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>>>         int retcode = -EINVAL;
>>>>         bool ptrace_attached = false;
>>>>   
>>>> -     if (nr >= AMDKFD_CORE_IOCTL_COUNT)
>>>> +     if (nr >= AMDKFD_CORE_IOCTL_COUNT) {
>>>> +             retcode = -ENOTTY;
>>>>                 goto err_i1;
>>>> +     }
>>>>   
>>>>         if ((nr >= AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>>>>                 u32 amdkfd_size;
>>>> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
>>>>                         asize = amdkfd_size;
>>>>   
>>>>                 cmd = ioctl->cmd;
>>>> -     } else
>>>> +     } else {
>>>> +             retcode = -ENOTTY;
>>>>                 goto err_i1;
>>>> +     }
>>>>   
>>>>         dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr, arg);
>>>>   
>>>
>>
> 

