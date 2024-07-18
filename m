Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C1F934BE3
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 12:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CBAD10E76D;
	Thu, 18 Jul 2024 10:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kgnbuTrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2052.outbound.protection.outlook.com [40.107.94.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99DD10E677;
 Thu, 18 Jul 2024 10:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVsIc2b9UHdWl4/V5otc8L8JfCFjITauQbcroGDIzo4MDsQQz7eYXvjL5Cw2tzOa52dIPv5yZ2PutFlxYjS4OKKGKALDGKxdRCevFuL6FICCIVATqvKoQ0VsbOSLaE9+HdrR7grS9J4qLx3SQLBiGKyKQFlYG65qMHBJ/TapBxN69TP9VcutpE865AWol0qedhspL9NQO1gk1HXFRapL/DYfMcna6UeHvm+Xew10TS1TDsTvfjejf9vkhN+Ce8SgFdmtC9KPMaemeVlf28+Tvo6MzoqqINCW47+rE6OBKYTUGMZjgcS0YD+O5kBm7XRjWI/hGPiABOp5po3JAnRF/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq3S1S55PVlm71Kn3z9+4RWNl0Ly3tkNHz5AhKcSEtA=;
 b=nZzHkHvlHc/WKdUtSm5WnI+j1Vwmi4ISkO4unbvLTB4nxBM/Oz2iw58hAx9Khp6rJTGKYed3rGIrmB6LJDRhsHFYQnwRaiu2gwJ6iSpIkwtLWozVPqcwZ92j75aVRuH/Jv5b6hctRjYgnA1aCGixzr4UWULHHaItugf17s7L8Ro9b7IXmahRb6Cx8/dr51uFOFj97d6kPidvdc/0d8YGHOS8KkzfHKSgAhZBrEGnDFWCCR+WJsas75WroEVOsbvkjNqIdIKZzBUYDHzdTJUzUv3eyTHomT0bGNC9+fSexYZtwGWsAntoDLzpwEbToXV2q9jTXoSj4jNwQO6emT1tNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq3S1S55PVlm71Kn3z9+4RWNl0Ly3tkNHz5AhKcSEtA=;
 b=kgnbuTrjSSxYy3Fz+pirNT+DhMUd6UbHwVp+sweXQLDQ7Q0znaDvGX3Sv4tyrlYcNK8ThQxtLtRSFvalMaGzPgK/FP12N7CL99mtXve4ON80uEwhXVZ4h8HaNjwV8SmZf3OrG3AowoZh1ERFOW2lXCBw11Mx5WDGQQl90UNpgvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 10:47:13 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:47:13 +0000
Message-ID: <f4a9f8ba-2f34-4376-953a-254145ccd22d@amd.com>
Date: Thu, 18 Jul 2024 12:47:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] drm/amdgpu: Add address alignment support to DCC
 buffers
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com
Cc: alexander.deucher@amd.com, frank.min@amd.com, marek.olsak@amd.com
References: <20240718103243.1241392-1-Arunpravin.PaneerSelvam@amd.com>
 <20240718103243.1241392-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240718103243.1241392-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d8b4af9-0b9e-45d0-ed60-08dca716fbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2swYVRkZytleFZta3ZUYVM5Nk93MytaWXE2TDlZRXF0UnhRblpIWm1Qdy9L?=
 =?utf-8?B?T3NZVFNqMEJtTEVhc0JCcDV4WDJRYnM4VmlCMGtRU2Zad2NoaERHQUhsNjU0?=
 =?utf-8?B?ZEY4bmE5cEswWEozL3lza0l6YkNKNXBwMzlxTm9JeDdqTlJMUkNiMStYeWFz?=
 =?utf-8?B?QVVlZCtVMnlNUm0wTEZEa1NPb21FZE90alZzVmczQy9TMitCWU5SM25vNW1x?=
 =?utf-8?B?SnJ0VGFpT1B0U2VCM0FadlNRVzhyTVBrdEY5TUw4YWNpTWYrbnN4aWlQRHZh?=
 =?utf-8?B?Ni9vMnhlMkg1VUFIcHRWeitaQ3p3RVZ3a0ljY2FldGpuK3VUSkJ5RHhLZ1hQ?=
 =?utf-8?B?Q1pvbUFFV3VvUk5IQitXbUZyNmRUT3pzNkRrRzlybW00NlhEd09SQks5ZlZL?=
 =?utf-8?B?akkyYm9JMGJtRFpjUzVaY0J6OWJyblVDUzJEUmpveXIrQW5MWGdiVHFoek5p?=
 =?utf-8?B?ZTlxaER5K0FzRzVsMUZyc0dzYlFoaFJzWk9VckNjU1dMSDVWeHl1cXE5Z2Ft?=
 =?utf-8?B?MTNyYWJvejM0UUx5dGkyc25MTkdRYWgvNlNaQ2dKUWo2ZHNoSHNOUGtvSHIy?=
 =?utf-8?B?U2NFVjk0Wnkrd2NRKytNUEU0UWcxK1FOMERUaTJQNGZNOEUvdlYrcWloL3hL?=
 =?utf-8?B?MDhsTmFMdVJaWUEyUXc1SE1CcXRQNkdhUWQ2OTVsZzE5Q2t2bGhuNkY4aXhS?=
 =?utf-8?B?V09venFmSjRtNG0vWVg3NkkxVVRYOUthUVhNKzJOVzFZQkVhM213VVJVTXRq?=
 =?utf-8?B?Um5UaXZ1eHFwY3JiTVNPZDhoSElHVkNsOCtVUG9sZDlDWXo4eE9oUEVsRnkr?=
 =?utf-8?B?MkUzRVBBSjEyZmhkMC8vdDNFQVhlYWZkeWR5MHRqNUhRcU5sZDdqaG55anhY?=
 =?utf-8?B?a2xxY2JRL3NHZUFwRkxHM0orT1pCZ1Njb3NTWU8yejhSeGxXOVJiNkVIK1hQ?=
 =?utf-8?B?dTdSN1VtN0lpVXJDaDYyZDdTNkNBSHRzanU3b21vb2RFS0J4QmlvU3hLekVl?=
 =?utf-8?B?WDBpbHJNMy9qNFZUdnpSSVN0OVRkcnRMRDlCdlZPRFI2OGRnSW9KMGxwb21J?=
 =?utf-8?B?eFBPNDBTMGhuTDhLRk45RTFnWXNXMXdyMVA4RmpQMWRDVnZjK0VyZXkwaERi?=
 =?utf-8?B?ZlFQRG5HRnNhV0hLVnI3UE40clhWTHp3b3FXa2FuVTNPZnVwbG9TdzBlcVFX?=
 =?utf-8?B?M0VQalllakgvM0RPbkdPd0tzVTJDN3FFRWVqcnB4bmd4UkRhYWVQQzhJOXli?=
 =?utf-8?B?NUppN3BRNFlnaVYwTENBY3RIaklCOUowRzM4TVRlK0Jyc2NyQ2RVS3hidFpm?=
 =?utf-8?B?U3RKUTloL24zUjM3UkcxejVoSXpTU3I5MmVVTituSWRWY0R6QktlRU5oLzZU?=
 =?utf-8?B?cG5WY3lUeEFqZWdKNnFXdmExbDB2UmlBMXBsV05iOWxvdkRxVU55ZTQ2MUZa?=
 =?utf-8?B?bWJnTTZzWUFHK1I1aDcvS0hiSG8rS1N3VXpTcGxySE50aExyUEFMeHd6WWNm?=
 =?utf-8?B?OC9pWmNhQ0Z6b0RvSVRIOVU2V0lQZFhJVW5CMGRLb21YTVY4djY0Vmx3SnlE?=
 =?utf-8?B?YkdIZ3diNEtkN1hZaDFzUDcrRVo0NkZ3SmFHZ2VHb0d2cEJXeVQ5L21tN0Ux?=
 =?utf-8?B?NE9UMGNWK2FNRGdvSmFzTjNJYmRCVldGREkwbjl2WVJxNnVXV2E4STNLQ2V4?=
 =?utf-8?B?a3A4Z3MrRjJ3c3NmK1pqM0t2VXVhaHZWSVVoK3k0WmJQTWswK29SNVQvOVow?=
 =?utf-8?B?ZDN6bTdTMGxnRjZVL0U1d1F4QXV3YXFGY0doMXV5eFIyN2FpVHVlR1ZRd2M0?=
 =?utf-8?B?ZStJTk5xOUtkSnZNTmVmZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjRXY2swNEdwSUNZblBBSkRoUG1HRm51bHBGdW5tWllGd2xHclJHZlRuc1Y2?=
 =?utf-8?B?Y1BrazRyWHJ1YWphOE9ETEY2RXNCSVI4TU9Rb1B2Y1NNRTVrRVRVejVRUDNG?=
 =?utf-8?B?OGVqdDY1SGE2UmdLRms3eUJJT2NSMEphZ0ZmVy9JVHNkR0tHWmFEam5tdU43?=
 =?utf-8?B?RjdCTlVxT1ZBay8vWUQ4RHNEV0FXbjBOWnFCSDNUbExxSlBpMTgvcFdKbEJC?=
 =?utf-8?B?NUJSRkd2N3FOaWk3TEVuQ2krK3BmNCs4YTNWWUtyS3NTK3RYaDA1dk4xQnFK?=
 =?utf-8?B?R01HZjdMZWhic3ArejkyNG5HVjRDY0RRS1RvMTRRNGJNbkFBZEw5N2lyRGlU?=
 =?utf-8?B?aXE3YVdOT3J0OG4waEFJa1dRRUpyYzBpdE1PSTJJN3RGL0pFVXpaYTc5QTNZ?=
 =?utf-8?B?dFVTZHMvaENma2lzb2lUc0pqb05TbGx5c0RpenpEU2F1V0lubGNzQkNSbGdl?=
 =?utf-8?B?NDRITloyZit6YVI0QWxseCtjN041MWo4MzJzVGMxcFF1eWhlVWFCU2tQSUhG?=
 =?utf-8?B?OFhFZnVxdlJ3cFQxcDJOVUo4MmRVMVd6SEVEUzhLaHNZem0rVFluejBRaXVC?=
 =?utf-8?B?Z24zeGd1Ry9FRGpNaUlmY3ZoVmdvK3MxYUU3MlpHYml6U2FpVHdHR0VxMVA2?=
 =?utf-8?B?b0FxeEl6Qm5jeGJUUGV0OWJHRjJldFV0R2pVYnlTeGNkdENwS0dpUUsyRTRQ?=
 =?utf-8?B?L0NtVGlleW05STVCcEpsZEQxdzltYi8wdm5RSitYQkE5WGJtUmY2Z2tuTXdP?=
 =?utf-8?B?OW8xL2FxODZRY3VWUXlpNGNSSWwwdS9rZVpnRWlTQjFpRHM3a1RFVXIvL3BE?=
 =?utf-8?B?dWcrdWNaQlY1MnpqMXljbGZKeGhScDNKYjlMclVkYlJDaEhBY1ZjS3ExcjlK?=
 =?utf-8?B?T05yeDE1SzBOVGw3U0JwUGYrZ1d5enRxTk1zWnNyb1UwWmx0eVFXNEhLYU53?=
 =?utf-8?B?V1NYM3piK0Jiak9PVHE1RjJ6eTY0RlhWeDhzTnNnYXV3UXdNbWVTQmNVbW83?=
 =?utf-8?B?UFI2OTEzcytERHp5LzI1U1lqTjlDczUzZ3c3ejRqNlJQZHJFcWU3ZWxnZERq?=
 =?utf-8?B?VjNWOTN6TXQwSTFIaHFma2VWV0dQQVlDRkdiL0ZYMmJ6Njg4cjZMdzE0cTdv?=
 =?utf-8?B?emMybi82OTFvcElQZUp1RElseGNOUkhIRUw3OHFWQ2V3MVFYV0RKdjVQUUEz?=
 =?utf-8?B?WmV3SHUxYWRTSVhnWUZZWjZZdzYxYWs1eGVVVGw2TTRCOUNEMUM2SkhVQ1hF?=
 =?utf-8?B?bGs2V0VaQTBHdXZKMXRIQlg1d0lRelNyOFlTVmJMTUo3ajAzS256aUkxY1Nn?=
 =?utf-8?B?Q1hyemZuZk9qLzFGTmJVTWt2QUtrVnBKUUxLVHZUN0FOd0ZRbkxnSXFobjhy?=
 =?utf-8?B?cVRBcHJLMk03OUZSdk9TOGpFSkdXOVhKY3JibkZKKzBNbU1ybzlleU82QnBi?=
 =?utf-8?B?VUlOUGxwL2FLejhQZkMvSjlGblArMG4ydjdSMzlHMDl6eW5kQlBlMGFCZ2t3?=
 =?utf-8?B?UXRaMXR3Y1BXcmNzZzNHMjliRjJHQVQzUU9YRXg5aVNWcXhlUTQ1RUl5Rmt1?=
 =?utf-8?B?bkFvSFUxNnR1TXYyM2JTaTEyK01LM1hBeDlld3NSSUtBZzQ2Q05HL3JETURC?=
 =?utf-8?B?M1ZjdUlaZFZPZjZTTnM1YmYyK0pMZzQ1emFWeEs3aWY0SHBLQTBnbTJwRGQw?=
 =?utf-8?B?NUgwWTl6RmV4aVE0MmxpdzBRM3lDRTFUM0ZBd3B2cktqYmI5MmlydW05cmVz?=
 =?utf-8?B?RU5sOEgxbkJ5R1IrdVEzY0VwWHVtNjRXMFEwUHpMeitkNTV5OHMxck1NQkNW?=
 =?utf-8?B?OWdYaTZzWmhsNkREY0hFdU1FaXo2RkVFYWErWUxSUlcwYmZjdSt3dXhqYWRZ?=
 =?utf-8?B?TUt1eElLYjFYb0JEVHNBcU9BVVZad3QvM0dQcnRKck9lUXV6SlFjdFVxZEJZ?=
 =?utf-8?B?cHNaVTZxcnVLVk5BZ3MySEZhbm9ZZEJVN21kb0VhVGVPZ0xzMXdLbnRMYmRB?=
 =?utf-8?B?Z1lnNFlhVXhQbGVUREo3WTNXanZCVGZjdGUrNHN3eFloaTMvdnlxM0s4d3lS?=
 =?utf-8?B?amdJZkVpQVV0ZXhKQ05YNEVmb281RkY0MGRVT2JpY3k0V3VYamFFV3FZdEd4?=
 =?utf-8?Q?1R4Y=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8b4af9-0b9e-45d0-ed60-08dca716fbbc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:47:13.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mweFG1xLfo6ZLBbHImkVVSsChL/ERZO0tsXSOgaSd0mRqYzKSB5nj4syTPYQeOed
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070
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

Am 18.07.24 um 12:32 schrieb Arunpravin Paneer Selvam:
> Add address alignment support to the DCC VRAM buffers.
>
> v2:
>    - adjust size based on the max_texture_channel_caches values
>      only for GFX12 DCC buffers.
>    - used AMDGPU_GEM_CREATE_GFX12_DCC flag to apply change only
>      for DCC buffers.
>    - roundup non power of two DCC buffer adjusted size to nearest
>      power of two number as the buddy allocator does not support non
>      power of two alignments. This applies only to the contiguous
>      DCC buffers.
>
> v3:(Alex)
>    - rewrite the max texture channel caches comparison code in an
>      algorithmic way to determine the alignment size.
>
> v4:(Alex)
>    - Move the logic from amdgpu_vram_mgr_dcc_alignment() to gmc_v12_0.c
>      and add a new gmc func callback for dcc alignment. If the callback
>      is non-NULL, call it to get the alignment, otherwise, use the default.
>
> v5:(Alex)
>    - Set the Alignment to a default value if the callback doesn't exist.
>    - Add the callback to amdgpu_gmc_funcs.
>
> v6:
>    - Fix checkpatch warning reported by Intel CI.
>
> v7:(Christian)
>    - remove the AMDGPU_GEM_CREATE_GFX12_DCC flag and keep a flag that
>      checks the BO pinning and for a specific hw generation.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> Acked-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Frank Min <Frank.Min@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h      |  6 +++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 39 +++++++++++++++++++-
>   drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c       | 15 ++++++++
>   3 files changed, 58 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> index febca3130497..654d0548a3f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.h
> @@ -156,6 +156,8 @@ struct amdgpu_gmc_funcs {
>   				      uint64_t addr, uint64_t *flags);
>   	/* get the amount of memory used by the vbios for pre-OS console */
>   	unsigned int (*get_vbios_fb_size)(struct amdgpu_device *adev);
> +	/* get the DCC buffer alignment */
> +	u64 (*get_dcc_alignment)(struct amdgpu_device *adev);
>   
>   	enum amdgpu_memory_partition (*query_mem_partition_mode)(
>   		struct amdgpu_device *adev);
> @@ -363,6 +365,10 @@ struct amdgpu_gmc {
>   	(adev)->gmc.gmc_funcs->override_vm_pte_flags			\
>   		((adev), (vm), (addr), (pte_flags))
>   #define amdgpu_gmc_get_vbios_fb_size(adev) (adev)->gmc.gmc_funcs->get_vbios_fb_size((adev))
> +#define amdgpu_gmc_get_dcc_alignment(_adev) ({			\
> +	typeof(_adev) (adev) = (_adev);				\
> +	((adev)->gmc.gmc_funcs->get_dcc_alignment((adev)));	\
> +})
>   
>   /**
>    * amdgpu_gmc_vram_full_visible - Check if full VRAM is visible through the BAR
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index f91cc149d06c..ace9d61fc512 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -512,6 +512,17 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>   
>   	remaining_size = (u64)vres->base.size;


> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +	    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
> +	     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {

I think you should move this check into gmc_v12_0_get_dcc_alignment.

E.g. here you just check if adev->gmc.gmc_funcs->get_dcc_alignment is 
not NULL.

Then call the function and if it returns a non zero value apply it.

Regards,
Christian.


> +		u64 adjust_size;
> +
> +		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +			adjust_size = amdgpu_gmc_get_dcc_alignment(adev);
> +			remaining_size = roundup_pow_of_two(remaining_size + adjust_size);
> +			vres->flags |= DRM_BUDDY_TRIM_DISABLE;
> +		}
> +	}
>   
>   	mutex_lock(&mgr->lock);
>   	while (remaining_size) {
> @@ -521,8 +532,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   			min_block_size = mgr->default_page_size;
>   
>   		size = remaining_size;
> -		if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
> -		    !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
> +
> +		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +		    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
> +		     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1)))
> +			min_block_size = size;
> +		else if ((size >= (u64)pages_per_block << PAGE_SHIFT) &&
> +			 !(size & (((u64)pages_per_block << PAGE_SHIFT) - 1)))
>   			min_block_size = (u64)pages_per_block << PAGE_SHIFT;
>   
>   		BUG_ON(min_block_size < mm->chunk_size);
> @@ -553,6 +569,25 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>   	}
>   	mutex_unlock(&mgr->lock);
>   
> +	if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
> +	    (amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 0) ||
> +	     amdgpu_ip_version(adev, GC_HWIP, 0) == IP_VERSION(12, 0, 1))) {
> +		struct drm_buddy_block *dcc_block;
> +		u64 dcc_start, alignment;
> +
> +		dcc_block = amdgpu_vram_mgr_first_block(&vres->blocks);
> +		dcc_start = amdgpu_vram_mgr_block_start(dcc_block);
> +
> +		if (adev->gmc.gmc_funcs->get_dcc_alignment) {
> +			alignment = amdgpu_gmc_get_dcc_alignment(adev);
> +			/* Adjust the start address for DCC buffers only */
> +			dcc_start = roundup(dcc_start, alignment);
> +			drm_buddy_block_trim(mm, &dcc_start,
> +					     (u64)vres->base.size,
> +					     &vres->blocks);
> +		}
> +	}
> +
>   	vres->base.start = 0;
>   	size = max_t(u64, amdgpu_vram_mgr_blocks_size(&vres->blocks),
>   		     vres->base.size);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> index fd3ac483760e..4259edcdec8a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c
> @@ -542,6 +542,20 @@ static unsigned gmc_v12_0_get_vbios_fb_size(struct amdgpu_device *adev)
>   	return 0;
>   }
>   
> +static u64 gmc_v12_0_get_dcc_alignment(struct amdgpu_device *adev)
> +{
> +	u64 max_tex_channel_caches, alignment;
> +
> +	max_tex_channel_caches = adev->gfx.config.max_texture_channel_caches;
> +	if (is_power_of_2(max_tex_channel_caches))
> +		alignment = (max_tex_channel_caches / SZ_4) * max_tex_channel_caches;
> +	else
> +		alignment = roundup_pow_of_two(max_tex_channel_caches) *
> +				max_tex_channel_caches;
> +
> +	return (u64)alignment * SZ_1K;
> +}
> +
>   static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>   	.flush_gpu_tlb = gmc_v12_0_flush_gpu_tlb,
>   	.flush_gpu_tlb_pasid = gmc_v12_0_flush_gpu_tlb_pasid,
> @@ -551,6 +565,7 @@ static const struct amdgpu_gmc_funcs gmc_v12_0_gmc_funcs = {
>   	.get_vm_pde = gmc_v12_0_get_vm_pde,
>   	.get_vm_pte = gmc_v12_0_get_vm_pte,
>   	.get_vbios_fb_size = gmc_v12_0_get_vbios_fb_size,
> +	.get_dcc_alignment = gmc_v12_0_get_dcc_alignment,
>   };
>   
>   static void gmc_v12_0_set_gmc_funcs(struct amdgpu_device *adev)

