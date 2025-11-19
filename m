Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8EEC6EF3E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 14:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90CF210E60F;
	Wed, 19 Nov 2025 13:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HLOS6+CO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38C410E60E;
 Wed, 19 Nov 2025 13:40:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ueUzjXapfcmhps8zSWXawucYlzn7EnpkguIxqmkqf5G1NS348TFF6delmrYi9gMnklt1H7gbwhtqX7CQ8WT12xXlvmBf3ZvTOfC6JCXLkQjCFEt6vYugYBghASMh1ZFXhng+oHXlX0VtzvHFe+wcp9SHOVehFsz8Cw0tze98U/UJ/nyi2oqs7kYr4D7eGjMZCS87FMaN4kQa3aG6E0dojCkB8iFNveNakkVykf1gCjuZxm7H7Bxj2EMQA3SbevtGoFDQ7D7kM8+8nqkKA4A5X5GzEDgcYphZ5Ty2jbpnxocWX0NPOLN6V0TL00661OEJILIRVm8jBc3+hvwVf/SeWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQWmLAXZECOus/mmUajP0H1dVYnT3QUc3pQTJg74JpE=;
 b=hF7xzH8eRz0nIIJTMAx/T6aViYm578m6j3CRUqOVFOvE69/HnUkxG8ReeKZVPGiKJmQkLEMkalhR+/KDDZI3Ft2dkuYU+/EWItXTL29h9DXkeu9tpMtobwOTaZYvdU5BNw9pZFXjPDiPHxfcJswZXOE7LqsTLgoSqxLZR9DP51VINVuy+sDF3/oFE0PQJy5TXVF7x161DkT2jH3UH18oVcB17DAEcSvIPbxIxC/WigT5uSTpgCjuJu4shtqTX52JepxGO/4OUMjTjMaZuBvgfk5C+8ddVERQQOmVkzy+DGr9ehYWT6nKyoPKzg6sM1FCejYETuQ6iYSMVUq5tOOH/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQWmLAXZECOus/mmUajP0H1dVYnT3QUc3pQTJg74JpE=;
 b=HLOS6+COWXU6bQo3u85u0nYH5ME9rGqt6TiR7cIKYVvbHhGoYCnR2kNKwLcCOARaBxAkEYPB4hat/Cp5Gr8nFZFvW2HiKnkXIBNXj8LeOcTtDlqJYpca5d/2Xirt/jZPvgGrqQEp6vQuNbxCt5fDIQEnKPCQa0JSzD+uRZy0aPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DS7PR12MB6007.namprd12.prod.outlook.com (2603:10b6:8:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 13:40:01 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 13:40:01 +0000
Message-ID: <a055bb72-6cd7-430e-8f41-8c6aa9e93e2a@amd.com>
Date: Wed, 19 Nov 2025 19:09:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][RFC] memleak on xe load & unload on PTL
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c1245e1a-2856-83e6-69ed-1ddead4ad3d0@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:271::14) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DS7PR12MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: f97925ae-cd9c-4c93-a7af-08de27712376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmVDUlZzbUlGTHNxYmxYWkxGRTVZLzc4M1FtK0lsSmZVNkpzMEZkYk5WTUVx?=
 =?utf-8?B?WUxNaEdTdjFvWklVUEFGRzBOckhhNERKbnVmVXhMYURMd1dwZXdWZmNkNUEv?=
 =?utf-8?B?TVZ6ck1Na3d4MWx0ZVRUeVQ5aDViNWM2TkJvUTBNVi8ydGJMdElTRU1XTndL?=
 =?utf-8?B?ejZlNldKLzR0d3ZDUXFtdUZVNzBVak1IUkRaV3JUMUwxMlVhSzFPM1lMWWI5?=
 =?utf-8?B?Y1FHTWJnNEltaE11M3k0RGZBOXJmTmxiU3RsTmxOQ1F5d1FOREYxSHBjTFZR?=
 =?utf-8?B?RHF0NlhhczZDMUtabGVQZTgwMDczSlhMRjN5Y0xiWGJIdkJIUGJyZmJwMkUx?=
 =?utf-8?B?bjlGeG5oWGc3U0RvaFFRckVVS0JPSVJnZTRQWnF4bUxYVlpkMS9ZV2t6a1k4?=
 =?utf-8?B?YXo2S0tuMWwwQzI3elh2QWNkYkYzZmlZZnlvdjZMbkZhSEZnTlg2Z0pZcGl5?=
 =?utf-8?B?R1lhTUdqVEhRM0xlV2cvMW83N1RtL2NuOTFVRUpKUk5DNG94d0VhRHRieWxT?=
 =?utf-8?B?bzY1dlFQVVl0U1Frbm9yc3BkbUdzZmhqT2VraHdtMGZnQmgvdUNGTFFDcHlz?=
 =?utf-8?B?WEhVVy9jUWdnU0lHUUlJRDhqYi9UeldCbmlrVXM0MUlWT3lLN3AyMHhSNHh2?=
 =?utf-8?B?aW9PNGhnOUIxY2ROTjkySkJ3dTBMNWlnL0hIRGRSZFBUT042eXZ6bnJsVjdh?=
 =?utf-8?B?R0dya1NBUDV5cGhQRE43WUtGWE1EVS9tZ1hJZ00rWVdQSGNham44dW11Z2Fp?=
 =?utf-8?B?V1A4c3ZXanMwa3dxQjE1STNtdU1yN3MydHV3M3dJYmZhQzc2K3hFL01qTC9Q?=
 =?utf-8?B?ZHdZWjE3NXhXZWJUSGErd21lVU1RMzJYbndWM0tHQUExamNlcVBoZ2NucjB0?=
 =?utf-8?B?K25MamJwbnVoWDhnbEJEQ2ZoaFNYS0xUQmp4cHprTW9NckpXam9OWE5EMHBk?=
 =?utf-8?B?amxzZTBZTTgwdGh2S2Q4R2M1QUk5bFUyZ1FOS1dacHAwTzFOR2RiYmtSV0xO?=
 =?utf-8?B?S1NoN1dpN3E2ZkppZzYvVFhMU1l1V0YvL0syWDRidmY5cEF5Y1lXSnFOcW1U?=
 =?utf-8?B?MzdxYmx5WWJBakNZbVAyeWRKVENZTjJhdEExTmFXandzTDlSU1hBM0FxQ2xr?=
 =?utf-8?B?MEJuck9aV3JZYlpjV2RqSURFQ0JWMlU5UWppeHZDQit2RmRxS0s3NGJZRHhQ?=
 =?utf-8?B?eDVDbUxRUzRmZWZhUlFOaUVrOGxjM2RCNnpubHNJeng4SnlTUWJ0c1JrbkJV?=
 =?utf-8?B?ZlVWOVJYdUNHWXQ5UUhOM1U5cHZzYnFvaUkwVHpFY1RpNW5OQlM4aHNNSGRM?=
 =?utf-8?B?STMrT1EwVFdZbENNU09TSDF4YS9xQndCbDVhRFM1dVJRTUMyaDVRVGhNeTk0?=
 =?utf-8?B?VmdHTERVdWo5YWU5THBlZHNDY3lkRkQySkZZNzZuZHFzdzBCMFNGVEptNEJ2?=
 =?utf-8?B?MnczZWI5TEFqY0hvT242cE1IYmQ2SEw3SEN0Um4wb1VOR25IOTFKUzhxYjVa?=
 =?utf-8?B?cE1VSHRzZ2pNMGh1WmVJMW1HVWtzU0JpdWxyK3FPMG9oQmJyWHh2Qk1ic1Js?=
 =?utf-8?B?Szd2Uy9wNXR3RlNvY29yb1lZbS9pdlJHMXpHcE1qbFNFQ2VUcEk4VmZ5K3A4?=
 =?utf-8?B?QnNOclJ0NTJIWkVBd2JWL1ZzMzVaeWpTRlpiMTVOUGVpU2RjTHZwaDBKUStB?=
 =?utf-8?B?bnJyS3pEZ2pmN0tuK0VWc3NDVGlrM1NuQ29BZnJ2WHIrTkpPaWdqcUJkMFQ0?=
 =?utf-8?B?b2huaEFTdEM2dDNXbXN1MTBPdzk1OHJWdWpZVndPRFpneVVHeWRxS3F6cDkw?=
 =?utf-8?B?SnkzR0VHK1dWUnR3L1pvUUs3L2p3YVVpQytOS0N0RWkvcGF1akVxZEZlRzhX?=
 =?utf-8?B?andSSmRhcncxRlA2RTJ4bFh6bUZGUWdsV3BjY0xlZ2ZUNXA3ZjYyOFFKVldj?=
 =?utf-8?Q?/1lztqA5kWE8z0V+87dgmB/v0+0oUZFg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdNK0hBK1psN1NHTm9KU1NNOEpZL3BYdlhwOStTOUFJWTdFdlZzdlU4VXBK?=
 =?utf-8?B?SEF5Yit3d0NyaDE1cEJoYjFpQ2xhTGtsZjYvdUJXSWJYYTg3WWZwcytEVmkw?=
 =?utf-8?B?enBaRkJWRHdVV0FPbE53VlYwNlNpOUJRZTZ0a0dPRkN0ZjZtUHFSc1hMeEgy?=
 =?utf-8?B?ZEM0OGpQMUg0c3gwTG9hZmtDNjIzYkVDYTY4VEhveVlaazY5bHBMSm9wRGhX?=
 =?utf-8?B?RUxjZTlEZE53L2IzSWVZdUJlRVR0RDFnd2hYVFpGR1JOU1BvWG84dk1jRkll?=
 =?utf-8?B?RjRhUTN3bURaK3VLSXUzTm1pV1RjVzA1VnBXQ2ExVWJoV2ZPNGlSc0pPT3hU?=
 =?utf-8?B?UG4zcVhrNXlGTGwvU3VtYWI3NGhxV1dRRW81cVhKdEMvbE1aK0tJY0plU1Rn?=
 =?utf-8?B?Mlh0MWkzb2lWbHB0Zy8rRmFXRVl3K1p5N3pNbHRjeElrWThvQVJGTDREOTE3?=
 =?utf-8?B?V2R2TWVBdGxBNUtWSDNKZWxVT0RMV0ducVA0VzFjOGJDMGNLRDNBNGdnTUFn?=
 =?utf-8?B?T0tmb2VOMnQ0cHdLSzdGS3NEcUtYdEdzT1AxckRmQ2JKRlFONkpLRjlPUDRV?=
 =?utf-8?B?SzVQeEdXUEpLbWdTNHZMUXFmY0wyQ2JLYnluMTV3SHVkL3BBRXA3T3JRZW0x?=
 =?utf-8?B?SkljVEM4dWVlSWc1ZkxJM0ZBSzdmeDlBSFVHeDNkQlhVbjdzMUFEY05NSGlz?=
 =?utf-8?B?dmhreGp5bEt3bldZOFk3cDZGM2JUT1RzWFFpQldsbi9ZOVNReXpjK055cENB?=
 =?utf-8?B?R2Z3MVcrY1hBK3RXaU5SOGJQL2YrS0RPclNJODJ2REJWdUdJaUlzdGMyZ1Zx?=
 =?utf-8?B?aGlxSUdFaTJSOTkwOGlnTkJFU1BIQTRqWTczTDk3RGEyL2lhTmpNbjVBOGc1?=
 =?utf-8?B?ejJST05NNGo4TVF6OXpkOXFCSjRKTEh2NzNSMEJKRi9teHNFQTJtdW9ETENu?=
 =?utf-8?B?dkhLL3pyT1RneGdnV1hOTFJ5Q08rOUszcVBLbUxnYVN2NHBHV015SjBYbEhw?=
 =?utf-8?B?WlZIbG1CUlB1RXFxQ3JsYmx4bFI0V0RESldVanpNa0l5WGVlYy9WVFU1Zk1B?=
 =?utf-8?B?OEFtVW5OdzJOL1ZTcUw5Tkk0bUNoSUEva2ZGdjdOWVdKelA0WTJsWWRVN21u?=
 =?utf-8?B?T1B6Tjl2elIxRFVKa1lyK2E4UTdTUVMrZkhudTQxL05zM0psaU0zcS8vaW9i?=
 =?utf-8?B?VDQzMndKVkJCV2MyTHV5NVhuY3I2ek9GZEdFbkdYeVZrTkdQakYrVEhKb1VK?=
 =?utf-8?B?c3JleFEwOFZSeGxpYXBFa0dpVEZwaGVaZTlaYzA2NlQwVUdHNCswazByZ3ZP?=
 =?utf-8?B?QzVVKzAwVDlmZTFnNUt2MUpxZUF3Unh1KzMwS2VqNjVHUE05Z2lFYUJNWklP?=
 =?utf-8?B?ZHVrZE03NTRGemF1OXdUR3FsNDdZUlZpZU9kZmwzaEJJaTlXTU5PVTBhRmIw?=
 =?utf-8?B?SE9zZGJoY0RodiszamlCV1pTZjFrckt1aCs4YjlkZGNwSjdCZE9sR3BEMStI?=
 =?utf-8?B?V3U0aGN4NnlkR3czY1FhZmhKSnhhMXAwZmFwSGNJM0ZCaW5pcUZNcGxyMW5u?=
 =?utf-8?B?ZklMYU10Ni9DZVFGV3Ara1I2eEVEQ1BuWG5hOTdZRHhwM3dhYlB2bzV0Yk9Y?=
 =?utf-8?B?ZWhvNlZXeVRoNk4yUTBUNWZNdUxjT09mUy9Hc242cHBHN0hYdUdFREdoTlNr?=
 =?utf-8?B?OS9aNXFscFdsTUxtY2s5c0djRnk5UElGaVhEbHUrRnA1d01CQ0RXUUhjaFZ1?=
 =?utf-8?B?UkFlR3VjaHpyU3gyQko0MUZiZFBDMGMvTmRQOXFqU0lld05NK2lIb1ozbWdq?=
 =?utf-8?B?VnpJR1lXYWZSeEFWUDE2dU1RV2tPSXJrelo1RVIveUltOGtXek1Cb3dkRmdi?=
 =?utf-8?B?NFF1NjNZS0tWaWxZclI5YVF0emRFN013NUs4VVZwQ1hxekE5VUpMS1pHazhj?=
 =?utf-8?B?bzUrbTJrTy9ldEV6WUI2Qi82NUVBM3BFa3JNVHlBazZXNlNMbWJKUktFczdV?=
 =?utf-8?B?d2g4MDBqNjcyVWJndEF3WVlUMnRnQkhGbnFSR3ZWb09CY1BmME5RYXltSXhC?=
 =?utf-8?B?WnpROVYwSmtNZHdDdTBSblVzWVBndCszN1NaT1MwNlhOVHo1bDloR29qYjMw?=
 =?utf-8?Q?OHcdCCkHmVYZ09QcK438XAdjh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f97925ae-cd9c-4c93-a7af-08de27712376
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 13:40:01.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXsc/bPY/4BLftH7Da/wB/6gDp9zjr79nT1f4fYVj6YlJj60lqxCmeO6EedCIpUulHaUofRKF4cbm50uCufpyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6007
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

Hi Michal,

Please send the patch for the review.

Regards,
Arun.

On 11/18/2025 6:05 PM, Michał Grzelak wrote:
> Hi,
>
> just hit memory leak on xe module load & unload:
>
> unreferenced object 0xffff88811b047d10 (size 16):
>   comm "modprobe", pid 1058, jiffies 4297578480
>   hex dump (first 16 bytes):
>     00 6b 4b 2d 81 88 ff ff 80 7e 4b 2d 81 88 ff ff .kK-.....~K-....
>   backtrace (crc 4f169eaf):
>     kmemleak_alloc+0x4a/0x90
>     __kmalloc_cache_noprof+0x488/0x800
>     drm_buddy_init+0xc2/0x330 [drm_buddy]
>     __xe_ttm_vram_mgr_init+0xc3/0x190 [xe]
>     xe_ttm_stolen_mgr_init+0xf5/0x9d0 [xe]
>     xe_device_probe+0x326/0x9e0 [xe]
>     xe_pci_probe+0x39a/0x610 [xe]
>     local_pci_probe+0x47/0xb0
>     pci_device_probe+0xf3/0x260
>     really_probe+0xf1/0x3c0
>     __driver_probe_device+0x8c/0x180
>     driver_probe_device+0x24/0xd0
>     __driver_attach+0x10f/0x220
>     bus_for_each_dev+0x7f/0xe0
>     driver_attach+0x1e/0x30
>     bus_add_driver+0x151/0x290
>
> Issue was reproduced on PTL & BMG, booted with latest kernel from
> drm-tip. Looks like fault was introduced in commit d4cd665c9
> ("drm/buddy: Separate clear and dirty free block trees"), since 
> reverting it
> makes the leak disappear. Also attached RFC patch, which at first
> glance could fix the issue.
>
> Added xe maintainers and the author to Cc.
>
> BR,
> Michał

