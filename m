Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592D0C6C858
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 04:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D1A10E55B;
	Wed, 19 Nov 2025 03:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S13X6mPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B69410E55B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 03:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ+aS1QVFjE9O25WNm1vLgJt2H3tfPYPkH1+nY1oQJPY1XYmKQ1HB8vx7FbTF8b22/+mXPkCxdr2Owi97ji/m5xt2xkryGDMmligwtXrFJeWrVWwJQIaXjmeFG0EvPrpg2/Qr8rheLOboXiYnXSHwN81GeoDBYPCwLJnEVDiXr6DEWaLiVQ03RsanCCClM1V9CkKvuWf8DRk+J2Ize7Wf9StA7j9d8wwGTtf/P4htXnr0AM9c2bvQS0AudK8bpaOCwXlTnOIffdD3BxBIO1hHtEcbZ4O3OlJLwPbFyGifj7TDK1j6+cvb1CMGNVaQU8tlUQYEn4oW9sABHlLDH2fSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xB/9wySgYbErYHK0icE0Muyj0ZOWvPbpgb+BkdCYkE=;
 b=VLUBnTTpQCX798S9PWesdFUcsJG0xbEnnIF8E5saTRp+TtsrGYoc49HJSUptsPlHlyY0iPWdYV4A7+Y6sYja53Lw8dp3m296YTJVx3ArCG8BhMLdA4He557CE3JmA5W7wgpaR/mguH+MxqJCUlk20EVGN0E03QfVHLx1H4eZHtbZJGYmIHMqlKe7BkESW9QfarFJqqV4UP2PbIajenSench+5bBXAsKr04mlF3AJ4J2i0cVAvIv3k6qgGPbY4ylVT8USP2H9qd63juoPvRRnmoUVY3D3Ntv2nCl/hoZA498PyhewM+9zYx09XrHh1kYvrIwglFNayc/Zbtpmoxfp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xB/9wySgYbErYHK0icE0Muyj0ZOWvPbpgb+BkdCYkE=;
 b=S13X6mPbAayCHwy9RouMrWuQYpvj/mCG8ma2FKhUH2QDN5X6T5QXp/JJQm8eLgZWWlHzwaLL/jhbK3p22hAy/LLyCNaBypeL0+iT+WeqHWepxUJFrTqrG/heHxzYntyG5oV5Burhg6BT34wyNFhDwmaGfQ0VYp7YUIgIdaeAsCzm92EjRbMFyicBLeNGbBPaN/uJHi5Ftdjegh05TadLkxk9iwgtjHHfpeIfY0sxnrr3kvHz9YCEI79r0E1XLvvGRfbUlgeErS1IwiAFUDi5mhg6ZtYoJQG0XQR2NPCrQoXtvW4zDJ2HNQ1gS2J1IOIeJfOwMHNyk7mzv2v/aJRGJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 03:08:01 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 03:08:01 +0000
Message-ID: <4eb9c2af-566c-4791-93ae-19f787af0b55@nvidia.com>
Date: Wed, 19 Nov 2025 14:07:57 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mm/huge_memory: introduce folio_split_unmapped
To: dri-devel@lists.freedesktop.org
References: <20251115084041.3914728-1-balbirs@nvidia.com>
 <5e864bfe-6817-4ec5-819f-9648a23abfa3@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <5e864bfe-6817-4ec5-819f-9648a23abfa3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::33) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: ee154e7f-5bfc-4d7d-e92e-08de2718d96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXV1THVCRTlrS0tXWXE2bERJVFU3eC9BekVIdTdQaGtoK1FKZmx5QUZmMGs0?=
 =?utf-8?B?RnpmNmM0NTFCMkFVdWhDNnlOTnBwN2V3ZWJNSzZQekltOFY4MDd1cEwxR0J5?=
 =?utf-8?B?dmFhMWFTbzNycW9sWG9xa1NUR29JVHJOL3lxb1RpQVplc0ZNQUsydjROWXkv?=
 =?utf-8?B?NFpPaGwxNk5pQWVMRVdpUmpzTHJ5Q3hmdTd6em92NmlFNGtjcHF5eVdwY1lG?=
 =?utf-8?B?dXlsSTdVeGxnYy9HaGJnSCtWSlN6cnVvbHkrc3E5NlcwVGZ4Nm8ybDNHV2dZ?=
 =?utf-8?B?UHExbHhkcUhlTzc0Nk9NcFlXZk9LcHFoU2c2NVBFdzVSeHBDUEo0K0FwdXpn?=
 =?utf-8?B?dWczdUkvT0s3WkhzZTgyT1Z5cFpVdHFJZjl6ZW5qc3p4ZzVFeGV0S2RMdEE0?=
 =?utf-8?B?cGo1V2t5UGR0UlF4S0p5V1AxRDNGcnRySUtWb1RBSlc4RDdqWWNIeVpGMS9N?=
 =?utf-8?B?ZVRrQXlXbnA4UWRUZ0RhbnRzVkU3cUZwVHRRbkE0a3VxMk1SaTZKUE5VNXVS?=
 =?utf-8?B?RW1lQ0tWS3JsbUYyTjloT01GVTJnUFE3MlY3VlBETXQrOVNlam5NS1dzOHVP?=
 =?utf-8?B?bGdsZENSdmlMM3hXNEVsdkdEcks3d244UmNmRzJFSm9qVFJNRVU3U1FkMkFa?=
 =?utf-8?B?cEdBQUR1QzdZUSswalY3S29CZm5BaVlqNGkvUm5oMVBVejVPb0dTSUlwdTFz?=
 =?utf-8?B?eE94TzMyUngzRWtQRUJZVko4akVUZ0JZbzJzb1pnenlSdGJ2d0dWYll3WEhh?=
 =?utf-8?B?WUxkVG1PTTR2S1V2VlZCQjBRejhSc1l1VnA5Z2dqNEVMZCtCZXZvNFBPVTRn?=
 =?utf-8?B?M1lTVy90am9YdXpDbi9BaGpLY25FekFHeW5WQWc4MnBTQ0ZFZmJJdTJ5YUdG?=
 =?utf-8?B?NVFGS1BPQ1JXMk8zNkwxVENrUnVtSzJ1M3dIUFAxZzRPamRtaE5vZ2piQ284?=
 =?utf-8?B?NHJ1WC9oYjFWZWQrUm1EQnN1MXNMUmRGT1owWmEyMkFqMTZDQlhGNUJDNnh4?=
 =?utf-8?B?L1I1OHpqNVRSRDVndTgzQWY4UHMyK1dEMXVZbkN0ZHpBOWVSWjhCWnpUQm5F?=
 =?utf-8?B?UzNMMWNqK0s3SUIzaGlWamNXS3V0ZlRQUHp1b25EZ2h1amp5NUs1UW0wM2Nq?=
 =?utf-8?B?WGZXNHVVTVBqK1dnbXZuQ0xlNEpndlhLbnQ5RHhJallENVVHQ0hhdFc1NXNQ?=
 =?utf-8?B?RkhIMEdTUkZHd1ZmeW5HbGZsdkdacFpwU29lNHgzOG9hb2tkM29wczZ1dTBE?=
 =?utf-8?B?R0FKK2t6dFBxMUFLVU8xaGNicW1DZUlhUUlCMHpaZGRsY05oUVVBZ0E3OXRG?=
 =?utf-8?B?anY4aThMUkNndHUzeE9YWHM5aituTWc1YzE3SDZLVG51NmNMdWlxNW41TEJu?=
 =?utf-8?B?RU9xZzZtWHRFQ0VOZTJ5b0NCcENmdVZwVWpRcXBuMVdKRFBQelk0d3NxTTVO?=
 =?utf-8?B?M0pNdXpzcUtMRUF5RnU3cmt1NlB5aHNmOTJZbTlrMDd5OU54d09abEgxWElB?=
 =?utf-8?B?SzVKcks4YWh0UXJXUkRsV2pBQjY4YVB2dFQvRlBIQThKTld1NDhVZk43aEZR?=
 =?utf-8?B?aTVCLzFPV3pDdDB1eXdCNE9zR0d2bk1wVGp5Mnp1WWNQWTArZlF0cHplcWhK?=
 =?utf-8?B?UmZxWmxQMmMyQXpXWTgwUitXVmx6cHE1MEwyVkQ2eWdKZ3U3cjF1Vkp2RElI?=
 =?utf-8?B?TkxkOWFXTXVVWjRZc1k4T2l1dEtBajM4a1BrM2ZRSndBWk5kTGxGQ1dkaWto?=
 =?utf-8?B?RDZkU1V2SjBieC80L0JiNmc5M3UrUndsazh1dmlSNllyWTh0a2NDSXFyRnBP?=
 =?utf-8?B?TXIrakNVOTllZlJ2NW4yWEFLNnhtL1VwR0lsc2IrcG9jV0VDeHRJNlMzYzdU?=
 =?utf-8?B?bjgwU3V1TFBqSlpaRTZaVEZkaWR1TmhkdVlnVjRqNGVwODRUL1hJRGtqQkN5?=
 =?utf-8?Q?enag77CyOg4U1CPwgB99OiKCPlHDOixM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnR3b1d6Nm9nTzI4eUpSSzI3bkNiMlFiamtXaVhPVFg0RHBHSTE2REJDT1ZZ?=
 =?utf-8?B?QWVmY01hVWVZWXlpcjFLMmpSeXJXc29QeVNzSzE5RU90S3Vlc3A3TGRWSlow?=
 =?utf-8?B?T0Q1NDNFQmhSZTRGejFTalhnTTBVZGJONUwwMm5PTTl5Z0ZkMG9PTnlPTGMr?=
 =?utf-8?B?c25IcXgrVWhvYUVDRWR5M29ZdVpTeFVKM2RtcTg3WDVTaDBaRTUzRElXaUFS?=
 =?utf-8?B?Q0pQUUdoTndlRkdTaDlYamI3ZXZhMGNHdHZSN1NXR1dEc0prR1hpM2RPWmNF?=
 =?utf-8?B?d040TzlkUS95ajRVaVVuTXlGZ1lORU9iQUtUUldqUW5XeXgvNUFyZjdWVUV3?=
 =?utf-8?B?ai96cTkrdXpUYzJ0K1VUdzI5dHRBMW9nK01GeGRYL2pCRmZxUGprMlFJOWVk?=
 =?utf-8?B?SDF1YU95bC8xUlFDOFh1cHJhS3ZSb2NxbVVqS2NxeVMzSU13RDBTdmdzcVll?=
 =?utf-8?B?dDR2VHNlVnJ3Vk9RQnpDbkxKSkZ1NFFhQUdVVGt5bThwM0MzZWZ2YTNvbEVy?=
 =?utf-8?B?V2Rsb2l3S045R1FVTVlqR2gyS05TdkZXcXExVU94RnNpa1k0SzZhSG1oVEtn?=
 =?utf-8?B?RmpOeHZWQUdJcitJcVNEWDd2NVNLczkzZkFCcTNtZm0ydndwU2R1cUcxblJh?=
 =?utf-8?B?Wmhtdk9Dc1F4K1A0OWhFcWx3OVRsN0krM3VSNDhYRVBDbGM3Z0wyT3djWXNH?=
 =?utf-8?B?T0dXN1hkYnZVc0J0bUdNcStnaWh1TWFMd3pxa01mZ01YLyt4RXhsQjNYR1B3?=
 =?utf-8?B?cGFjbWVhaldkZ25jSjIwTUZhQVY4UDRJTFRVS0ZXMWFaSGRxSG1QREVIdWJX?=
 =?utf-8?B?bjBnLyswMHlwUGM1MUJ0NEdRY2VsZjEvcGM2NlpseHJPUnVpVEtEVmRBd05I?=
 =?utf-8?B?eE5nYmRmOVpJN09UbmVnTkwyQ1hOSjRRT0thWmNrZ1dVQkg1ekVWL2FocDJ4?=
 =?utf-8?B?bVR1amhQeFJpMzZJcmN1c0lrN21BL2hEckk5YjVEZHoveXZxeVM5WHRQRFBS?=
 =?utf-8?B?MUwvRm0zdWJyVHRLMVowMWp5b3I1NEYzUGU4eTduMEVHTTZnZ1J3YWJuY3J0?=
 =?utf-8?B?UTdld2dhaU9qSStIdEVSUEE0Tk9HV04zRDN3N3FKSGQvN2FoSUhkY1lYSnI1?=
 =?utf-8?B?YTZTaHg3MDJ6NXB0U3FjMWZUcGZwYnptd3NlUTZSdWhXNWMrL1pqSGZxZTRM?=
 =?utf-8?B?V2NVMTZWNVZiZXM3VEdMNDlIZzNaQUQwd0hPbkgrYTJnd3VnVkxLSXNnSW1m?=
 =?utf-8?B?UHY3MzBaT0ptQnZLN2ZKQ2w1TjFsek9qT3ZxY24vcXpadVp2aGJaQlZCN2Nq?=
 =?utf-8?B?eUFQaW9qd3lNRVNNSklSb2IyQmtMdVFTL0F2THdBaGVzU1VLL1d6VTVaSlNV?=
 =?utf-8?B?cENyU0UzRXJWZjlSVlVjL1FUbGtLRlFRcnVpalBtTm83aC8zMTVudCt1VHpT?=
 =?utf-8?B?bDcyYk9tR0V4RUpGWTlJa0h0QXVKRlJnenlGZlN2OVdsWUVYWUwwMkVsSzd5?=
 =?utf-8?B?RUFPY2VSRXJZZVhOU2lwSUI4S3FqNTFGZnYrQVY5SndvcnROQnVRZGpsT3Y2?=
 =?utf-8?B?NGlwaGJjU2FpVHZZOUYrdHg5RjZKWnlVbGwya2tBN0dXUmZSYXBHRHBxeEFH?=
 =?utf-8?B?Mk1qbmF5bGZrNlVydTBlR0VrZTRQcGxiQk9rRHVybnJnOHZlZUZFcW9Ram82?=
 =?utf-8?B?V3FyMVgwUmZoYS96c0svMmhqdk12MWZQa25JSGgyREt3L29IRVlRUnBUNkZB?=
 =?utf-8?B?YjZrb0lqNHFKT1RnaW1zWTR6aFhRbDd6V0ZPR2VrdXNJQ1MxcnU4N2dGSnQ1?=
 =?utf-8?B?YllRMUVDdm5abzZwNG5nck5NQ0MxZkNXbTdyREZvdHVtSG91UWdHc1ZXRlpa?=
 =?utf-8?B?cTJ0eURDeTYxSTBPS3RaemN3OHNTNGpSbTM5SXMybXBSRk1GcHNyZWhUU0sw?=
 =?utf-8?B?MDFxWVVCaGhrWmlzTmpSa1J3Q0lBekV2VkxGcWM1QjQxdEh1V0ZuWjdqTkp3?=
 =?utf-8?B?dEppSXRFbjZJS2l4THllRkMySVh0eTN0Rk9mc21oZCtHRStvMGpWeXhadS82?=
 =?utf-8?B?TitjdjlwWHo2UnpLV2pOamtuWCtKbyt4eWhkY3R2ZVRva1ZQbCtpVm9NNlVD?=
 =?utf-8?B?T3JqOFRqZ3BPd0ZJT2NnYTNkZFdNYzRIdTJOS3l5ZkppYkNmcnZvTk9NclJO?=
 =?utf-8?Q?E2x9YkcTkCSuRTR+G3O1ODvlr3Z1+tSTe1HIErkq6KDP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee154e7f-5bfc-4d7d-e92e-08de2718d96e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 03:08:01.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p3w5CVZ6ZDbDovsdtUlV0DrY2r4LOpRNOz4Aed63UBiDF+MMB3QzVRE8b5t4khnom21NtWunaO+SN2onCJLSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344
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

On 11/19/25 07:36, David Hildenbrand (Red Hat) wrote:
> On 15.11.25 09:40, Balbir Singh wrote:
>> Unmapped was added as a parameter to __folio_split() and related
>> call sites to support splitting of folios already in the midst
>> of a migration. This special case arose for device private folio
>> migration since during migration there could be a disconnect between
>> source and destination on the folio size.
>>
>> Introduce folio_split_unmapped() to handle this special case. Also
>> refactor code and add __folio_freeze_and_split_unmapped() helper that
>> is common to both __folio_split() and folio_split_unmapped().
>>
>> This in turn removes the special casing introduced by the unmapped
>> parameter in __folio_split().
>>
> 
> I was briefly wondering: why can't we just detect at the beginning of the __folio_split() that the folio is unmapped (!folio_mapped()) and then continue assuming the folio is unmapped?
> 
> The folio is locked, so it shouldn't just become mapped again.
> 
> But then I looked into the details and figured that we will also not try to remap (replace migration entries) and focus on anon folios only.
> 
> I think we really have to document this properly. See below.
> 
> [...]
> 

Your observations are correct.

>> +/*
> 
> Can we have proper kerneldoc?
> 
>> + * This function is a helper for splitting folios that have already been unmapped.
>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>> + * the middle of migration, due to allocation issues on either side
>> + *
>> + * The high level code is copied from __folio_split, since the pages are anonymous
>> + * and are already isolated from the LRU, the code has been simplified to not
>> + * burden __folio_split with unmapped sprinkled into the code.
> 
> Please drop the history of how this code was obtained :) Focus on ducmenting what the function does, what it expects from the caller, and what the result of the operation will be.
> 
>> + *
>> + * None of the split folios are unlocked
> 
> 
> Looking into the details, I think this function also does not
> 
> (a) remap the folio
> 
> (b) call things like free_folio_and_swap_cache()
> 
> Which locks do have to be held by the caller? I'd assume the anon vma lock and the folio lock?
> 
> Would this function currently work for anon folios that are in the swapcache?
> 
> And I assume this function works for ZONE_DEVICE and !ZONE_DEVICE?
> 
> 
> Please carefully document all that (locks held, folio isolated, folio unmapped, will not remap the folio, anon folios only, etc).


Something like this below?

/**
 * folio_split_unmapped() - split a large anon folio that is already unmapped
 * @folio: folio to split
 * @new_order: the order of folios after split
 *
 * This function is a helper for splitting folios that have already been
 * unmapped. The use case is that the device or the CPU can refuse to migrate
 * THP pages in the middle of migration, due to allocation issues on either
 * side.
 *
 * anon_vma_lock is not required to be held, mmap_read_lock() or
 * mmap_write_lock() should be held. @folio is expected to be locked by the
 * caller. device-private and non device-private folios are supported along
 * with folios that are in the swapcache. @folio should also be unmapped and
 * isolated from LRU (if applicable)
 *
 * Upon return, the folio is not remapped, split folios are not added to LRU,
 * free_folio_and_swap_cache() is not called, and new folios remain locked.
 *
 * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
 *         insufficient reference count or extra pins).
 */

> 
>> + */
>> +int folio_split_unmapped(struct folio *folio, unsigned int new_order)
>> +{
>> +    int extra_pins, ret = 0;
>> +
>> +    VM_WARN_ON_ONCE_FOLIO(folio_mapped(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
>> +    VM_WARN_ON_ONCE_FOLIO(!folio_test_anon(folio), folio);
>> +
>> +    if (!can_split_folio(folio, 1, &extra_pins))
>> +        return -EAGAIN;
>> +
>> +    local_irq_disable();
>> +    ret = __folio_freeze_and_split_unmapped(folio, new_order, &folio->page, NULL,
>> +                        NULL, false, NULL, SPLIT_TYPE_UNIFORM,
>> +                        0, NULL, extra_pins);
>> +    local_irq_enable();
>> +    return ret;
>> +}
>> +
>>   /*
>>    * This function splits a large folio into smaller folios of order @new_order.
>>    * @page can point to any page of the large folio to split. The split operation
>> @@ -4127,12 +4171,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>    * with the folio. Splitting to order 0 is compatible with all folios.
>>    */
>>   int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>> -                     unsigned int new_order, bool unmapped)
>> +                     unsigned int new_order)
>>   {
>>       struct folio *folio = page_folio(page);
>>         return __folio_split(folio, new_order, &folio->page, page, list,
>> -                 SPLIT_TYPE_UNIFORM, unmapped);
>> +                 SPLIT_TYPE_UNIFORM);
>>   }
>>     /**
>> @@ -4163,7 +4207,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>>           struct page *split_at, struct list_head *list)
>>   {
>>       return __folio_split(folio, new_order, split_at, &folio->page, list,
>> -                 SPLIT_TYPE_NON_UNIFORM, false);
>> +                 SPLIT_TYPE_NON_UNIFORM);
>>   }
>>     int min_order_for_split(struct folio *folio)
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index 46dd68cfc503..05ce95f43ab9 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -909,8 +909,7 @@ static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>>         folio_get(folio);
>>       split_huge_pmd_address(migrate->vma, addr, true);
>> -    ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
>> -                            0, true);
>> +    ret = folio_split_unmapped(folio, 0);
>>       if (ret)
>>           return ret;
>>       migrate->src[idx] &= ~MIGRATE_PFN_COMPOUND;
> 
> This is clearly a win.
> 

Thanks for the review!
Balbir
