Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC08B06F6F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 09:51:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CC010E6D0;
	Wed, 16 Jul 2025 07:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UcUE5AsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CD210E25F;
 Wed, 16 Jul 2025 07:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9WLf/d0SuwvEQQxQ49xsfYua1msSP24hSx7PC+HUCC13onh6lRsUe4vsXFe8wDI0qmVSlXvGrfjhrpRmNqaoWMRscbUWG0bWRlBCBgXE9P5JwzJFoT34UaFeZkl27mfKx7cqVVeS8ASMCaVGf0ynR9BT98DkipTarGMlj7IWl4ey58YnpJXcUDe/AfOqE7R/cUkoeIgxsHnV/PtdZDcSVBRXGlfyMLTNTD1xwQKE50jFixdsEkTeatvlEuxbA2vEamq4GhFZkukT/iT5My21WaDKe+woLnXbkDLLU2iwdYwlTyTXswqgqTyg8NzhUAtgWgZ1Hjow4mk8c7X7JDfdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R68wxKNOdlV74/sVXoEfr2LZFjTcIBAhRgc/C5yxs3Y=;
 b=Dz1hGx+zFqkO2cO/O2LTPIOSQEHdM46z3PpvKq/VDmmxxwPXzbSBibZhRGi1Iv1iphpfvW8I5BDYFGpFa9u18I0uH0vbkNWTYs3Km3rl28cwgX6bP6TFTRhAUs1JH8fkmP3P49XhrTl6lwfSxi2gtJ1jTb9zSODshSBasyiMavkJEqrFJQk8F0lHwkj55uEFc1FzZyJCP+uDESPjOCiBPGBSrp3dNEVQq4RSvsSsskDeCWl9hoWcUkBRyfwsNZ0wCg9rUUt8SkwzkGwdILd8aSBrP4PXvaHjxzcC2z2sXRnZg6s1Mj7yVfH9E3wxb+G3ByRwWMXO+2fCF48k4BNdPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R68wxKNOdlV74/sVXoEfr2LZFjTcIBAhRgc/C5yxs3Y=;
 b=UcUE5AsYYQRBp9nxMpgs7Uez7p58YWC4wGigRBgbDlSEjZJVsxciRvy8cHuAwspA6whEyqEB1mfEI+/7mPkuBwjytMePqhib/JgRhKiAavA8YtFnjf501YcYze6U3DfUjJBraIMO0Lt+FWpj+FRU6sffAodF+IdbBfIHnsrk5T4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA5PPF8BD1FB094.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 16 Jul
 2025 07:51:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.033; Wed, 16 Jul 2025
 07:51:46 +0000
Message-ID: <78151115-2003-4adf-afa5-5e41667ee658@amd.com>
Date: Wed, 16 Jul 2025 09:51:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/amdgpu: Reset the clear flag in buddy during
 resume
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: alexander.deucher@amd.com, stable@vger.kernel.org
References: <20250716074127.240091-1-Arunpravin.PaneerSelvam@amd.com>
 <20250716074127.240091-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250716074127.240091-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0105.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: b223be19-8875-4b82-95bd-08ddc43d9cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZDlXTnpBYkZnVVVNbXlrK3JaaWpURytQN3VsVU5pSE9RMVJBbS93ZTJWbzNH?=
 =?utf-8?B?SDRybnFicE5SY0FyNGxzc0JDT0s2eVlnMWxNaGlZQXdwVlJBVlNwenZlWmNB?=
 =?utf-8?B?K2NlRXBTdlFXeUJkT096Y2pzM090ZXczWXI5b0QzbHZOeWxwY1FKenl5WXJs?=
 =?utf-8?B?bGR3bnRGeW5sbmdUa2VqK2dUbU1sdDhxVEpaR2QrREZ0L094NFZaOTQxdDFB?=
 =?utf-8?B?RlFrS1JGT1NjZjZDQ0NvOGo4bVV1ZWxtZFZmT01kNnd0NSt6dGs4T3lBMUhR?=
 =?utf-8?B?cU1MdjE2MHFkWDhkZGNDeWV6THNobzFrNnpuV1BxMDdXa1JZTUlEYkdPcSti?=
 =?utf-8?B?V1poaU9YNjB3M0I5SGFDT0V0L0R4QTR4dm56Z2Z4RGZzNlAzOVBlRmY4TTVh?=
 =?utf-8?B?czB2RVVHajR5NEQwWGk3bTdlY3VVaDVTa2VuYUdqUkUrSkEzODRKd0lmME1S?=
 =?utf-8?B?THJ3b0VxVFA2bklsZmVzcjh1d21Vc0M5akprTTV0SHhtNHA3cjhVK3c0NnhO?=
 =?utf-8?B?V0c5dDBIMXpLUWJSdzRVY25iUlRwQ1Z3RDFaaWlhTk1xNS9IS0laQXB2Tmww?=
 =?utf-8?B?THpTV2FFVlJDdjd6VUtqcThSd0lTT2huL0pNaktla3hEV3NyeDNmYzdyVWI1?=
 =?utf-8?B?dzAxQ3A3Tm9KejBiSjJIUmxTaHFBdU5SNjJGM01zV3ZLbUgxVEovelFZNlgr?=
 =?utf-8?B?bmdQNmtBZW1WQmhCblFnZndHdng4TlQyaDVRT2ZOOURXSmxGTFNHTTFTNFJN?=
 =?utf-8?B?ZnBMY0t5UHNzMjNlOUtKUjlUMkdncEFwaTJXZktIcTNMQjIrVXBRSE0vdm1X?=
 =?utf-8?B?akw2MTlnWDM2QVdZYmU0WjhzZ0t6NkRqSEFzNmtlTHRtaHhUejBnaSttakVt?=
 =?utf-8?B?ZktMVCtScEJSUVZKWXFDNGpyYUdGZmJCdHhleTgycW14SVFRQXFaa3A4Y0FH?=
 =?utf-8?B?R1IwdFJKRGQ2eDdmamNrbnR6UXltbEhvbi9YRGEwMVFScXVEeXk5L3kyUDdJ?=
 =?utf-8?B?bzVJT0NNd2pZc2NEdGk0eEtCYjV3cEkvaUJwaWlWZERGWUNZNXViTktOZ2Vi?=
 =?utf-8?B?WG1HS2J4ZUFzYlM4TlM5Z2VJK1NFRkFySWhMWCtDcHBmWWVoNzRrU3ZtL2kv?=
 =?utf-8?B?QVAyTnk3MG5tNmQ0Mzh5djNzYU5MenFicEJBNm8za3JzZEVEV2llOUI2SU45?=
 =?utf-8?B?M1lLK0ZYTkdCVVR6cUFmQ3BrSHhBWTNjN1EzQ3hQLzF4TERua1gzL1JaOWJV?=
 =?utf-8?B?eTgydWZYNThpMXNFLzNUNUJtU3hMaUhicWJZbHQ2Y2R1QmxKcVI5eFhCcS81?=
 =?utf-8?B?dzA5L01FQVVYOXYxWWJKWGtQdHl3d1BmQmQyNHU2WVVkVUdBYnFGTW5sc25Q?=
 =?utf-8?B?ZXVaZnFZblJiY0VTVzIxeHdpQlVRb21ROWJhQzlrWmtrNllNcDFiTWoxOUg2?=
 =?utf-8?B?Rkd2SlBIVWhaYzUranhMb1VVNXZZUCtjY3U4QWNyaktGaGFBdTBaUVZXOHRm?=
 =?utf-8?B?UUxVSlVXY2lSU2NFajAwaFFKYVFRdGphajFBTUFkc0N5azJZWkR6WFg4M3VF?=
 =?utf-8?B?OXFwNWI4UTI5ZkFHbCtaMlpESk5idnBQMTNUV3IxVUNJQm5uajdjMnF5aE9h?=
 =?utf-8?B?cFNubkNUcytxSjFjcm5PQWxrK1pxRGpNbFpvYTFBa1ZwSEVWOC9Ta0RZeUNF?=
 =?utf-8?B?NnczNFpqUVVzazFVZjRzbjJNeFcybWg5cVJWQnhnNXhYTDhuQVpCSzJKOVQy?=
 =?utf-8?B?b2x4cUlRU2h3K0dic1hQN2JxY3VibUFFQ09YY2xQYTFPK3hUMFF6WTNBTlN4?=
 =?utf-8?Q?otKH5qEP9x45zYLoMkrvkhUHxnQAH/EpGyvzk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXN5WWVRem9DZy85c2Jlc2dsczB2RktXZTY5Y1dFbHkxR0FSRlRLRlJOVm5p?=
 =?utf-8?B?dUdFUW9zMWE4eEowbE5idExqRFd1ajNZR2RXSS9BTVlvbjhIWUUvc3BDd1dG?=
 =?utf-8?B?cms3SUdGdXlRNThBcUJTaXFoNGI2SUI2a0NCTGlSWEtOY0FaNFlrb3RXV25B?=
 =?utf-8?B?cHNHVVRpMUkzbEc2Y2dCL1Z6ODZvVmpVSnNrbG5ybGtzSzZZWkZpY3NhVC8w?=
 =?utf-8?B?S0tXM0o5VE9WTUdnN2p5Z1ZaVjBWMnB2WlQrMjB6MUVmaEhjSlpLcjV0dFhO?=
 =?utf-8?B?K3FBOWpiZjBzQmFKNEpseWdkSVJIMVVIN1htam56VW9WVHMxN3pJWE9abWpK?=
 =?utf-8?B?eW5DSlZnZjBOU3c1Tnk4c0JlN28yZWdjeXh2VnNJNVNOcGU3YXhneGtySGNR?=
 =?utf-8?B?VFZyMlhMRVBwalFOZWpYVDh5Ui84RlJFeXRaVkxoNnFtM0F0ZllBY2p4VEt3?=
 =?utf-8?B?VWdlMHFFN09neXozZEhadFVDSk5VRWF3WEdhakExdnRzOW5aMDZXRU1lOUp4?=
 =?utf-8?B?VFpvTUdld1Y0MmhYT3ljR2VYTEYyQVdTdVhmUGxFdi9ub0Fzc1VENVdvRUR0?=
 =?utf-8?B?eWJMWHpPbkZBenpxb2RVSXhlVVIrdTI5aCtyQ1pqbG4yK05iRi93enFseTlR?=
 =?utf-8?B?K3RqSjJpZFhLZEFWbitCc2V2Zm12TERYYnoxMHFzU3ZiZHZieWFpdWZ5elVo?=
 =?utf-8?B?OVE4RnY4cHdtZ1JEanZvVmRQdm1QMCs1SkVlcmJxK3Q0dXhEcG5lL1BISmJ4?=
 =?utf-8?B?ZXNxWmZ1U252ZmErcCtNYXVTaGtONDVIRU1GajVHL25xU0JmL0E3S3c1bk9Y?=
 =?utf-8?B?RnA3T1Bnc01XZWRyYnc3cGFyS0t0SnJ5NUdmaVlGNmxMcTE2bjVkeC85U1Vj?=
 =?utf-8?B?ZFdoRnVIRXh4ZVNsUm1LSEMzRDVMMEJPSEtLWEtyd0NBQ0xVeStkT0JVQXJ6?=
 =?utf-8?B?bEdiaEJ5WnhtZHJER1VoemxDa09ydW5rL3U5b1Boa0tzL3F4VGFDSnB4K2Zi?=
 =?utf-8?B?cjFqRllaS3VhY2x1QUk3UWlWWXFXTDdnWXVpWVdRWDVLMUhaWWYwNGx1QXo3?=
 =?utf-8?B?MS8yWVNiUElxK3hXZG9zRCtYQXloNmRESjl5aUxHWnd1TjhkU1ZpVEpYL2Vn?=
 =?utf-8?B?L2xZUmM0T29ydFE1MkNWT3FDQXJpdnFrL3NPbU5rQWFoWUorMUpwRU5hRVVi?=
 =?utf-8?B?SVhtVFZWNzBtV040MHFUWU96SUMveXRiWm1nWnlnQkxTaXlrU3FEY09GakRa?=
 =?utf-8?B?UDhka3ZvQS9hTDN3WTkyRzdVRW84WnlLc3NFcnFTSnVRdDNvRTMzVkNpSnl6?=
 =?utf-8?B?ZzlTdTdnZXIvRlZ0ZGw5cTAwZkpQMFMzcjVDbHlPNU5vQk15WmFaVnd3M2Q3?=
 =?utf-8?B?Z3JlZDJYbjZhS0lreGQzZGQxNEROdWhRQnBoS1l1N3I2eTIvY2VuNVhWZVhY?=
 =?utf-8?B?OVQ1cTRESmdoNzhBMDhaL2htVTRuMk9Jb3F3bysyZnJnT0VqT0ErRDN6S1Fv?=
 =?utf-8?B?NnVseVRIUCttUmJYVTRxQzlUZXhSZzQ1aUh5b0h2M0U2cEprZi94S050S3pz?=
 =?utf-8?B?cTM2UjByc1RQM0ZMWVZaKzNkQ0N0Q0FEenZKbzIyQnlLQTNYS2JScE5yRWdw?=
 =?utf-8?B?MEIvaytKMms3Tk1vbDFzT0wrZDhJRFpwS3BTeEtKSEFySXE0aUFYT0c4MnhB?=
 =?utf-8?B?OUJIZTFEeFdwU0hzbFpzWFBSY3BhQW9jOFBxQ0tyQVJrSVorb3NqYmc0QUt5?=
 =?utf-8?B?K0tySVhENHVtZmhER2x5RVZGQ01kRXR4TlJuTitFYmtuVnlLZi82eWExZk4r?=
 =?utf-8?B?cTZVOFRlem9kZ3k5QWJ3R3hUN2M2SEdMU3E1NzQvUUlRdDZwc2hkSHNDMXVm?=
 =?utf-8?B?N3VtcVVseXcxNUZuU1dhdEIraUVFTzVYS1hNUHBzRHc3ZkJ6UmlYOVFEaE5E?=
 =?utf-8?B?TjJYbkJXTExUd0RqeXc0T0NaSmptRTVpcVQ5KzB0M2RlWlVuenVSZkRCTnA0?=
 =?utf-8?B?VExDVDFFbk5qaTNPTFZqamNETDZIaTJCbmVEUkIvSnlBdUlwWGNUYTdkZ3Vu?=
 =?utf-8?B?cmppd1A3RE1jdWNKMnE1NEJINzNwZmZmcGlhQmlrTGZPRzRxYlQxN3JsdXI2?=
 =?utf-8?Q?/zMgdiBp3evCwCOrQUM+pzxHN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b223be19-8875-4b82-95bd-08ddc43d9cc6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 07:51:46.1837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWsV275mdvRQg4R+naqVwnV2GgwDA2vV9cJdETs9Whwwyg54/p7ioEzhQDImG7xM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094
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

On 16.07.25 09:41, Arunpravin Paneer Selvam wrote:
> - Added a handler in DRM buddy manager to reset the cleared
>   flag for the blocks in the freelist.
> 
> - This is necessary because, upon resuming, the VRAM becomes
>   cluttered with BIOS data, yet the VRAM backend manager
>   believes that everything has been cleared.
> 
> v2:
>   - Add lock before accessing drm_buddy_clear_reset_blocks()(Matthew Auld)
>   - Force merge the two dirty blocks.(Matthew Auld)
>   - Add a new unit test case for this issue.(Matthew Auld)
>   - Having this function being able to flip the state either way would be
>     good. (Matthew Brost)
> 
> v3(Matthew Auld):
>   - Do merge step first to avoid the use of extra reset flag.

You've lost me with that :)

> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Cc: stable@vger.kernel.org
> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3812

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c   |  2 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h      |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 ++++++++
>  drivers/gpu/drm/drm_buddy.c                  | 43 ++++++++++++++++++++
>  include/drm/drm_buddy.h                      |  2 +
>  5 files changed, 65 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 723ab95d8c48..ac92220f9fc3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5327,6 +5327,8 @@ int amdgpu_device_resume(struct drm_device *dev, bool notify_clients)
>  		dev->dev->power.disable_depth--;
>  #endif
>  	}
> +
> +	amdgpu_vram_mgr_clear_reset_blocks(adev);
>  	adev->in_suspend = false;
>  
>  	if (amdgpu_acpi_smart_shift_update(dev, AMDGPU_SS_DEV_D0))
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 215c198e4aff..2309df3f68a9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -155,6 +155,7 @@ int amdgpu_vram_mgr_reserve_range(struct amdgpu_vram_mgr *mgr,
>  				  uint64_t start, uint64_t size);
>  int amdgpu_vram_mgr_query_page_status(struct amdgpu_vram_mgr *mgr,
>  				      uint64_t start);
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev);
>  
>  bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>  			    struct ttm_resource *res);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index abdc52b0895a..07c936e90d8e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -782,6 +782,23 @@ uint64_t amdgpu_vram_mgr_vis_usage(struct amdgpu_vram_mgr *mgr)
>  	return atomic64_read(&mgr->vis_usage);
>  }
>  
> +/**
> + * amdgpu_vram_mgr_clear_reset_blocks - reset clear blocks
> + *
> + * @adev: amdgpu device pointer
> + *
> + * Reset the cleared drm buddy blocks.
> + */
> +void amdgpu_vram_mgr_clear_reset_blocks(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
> +	struct drm_buddy *mm = &mgr->mm;
> +
> +	mutex_lock(&mgr->lock);
> +	drm_buddy_reset_clear(mm, false);
> +	mutex_unlock(&mgr->lock);
> +}
> +
>  /**
>   * amdgpu_vram_mgr_intersects - test each drm buddy block for intersection
>   *
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index a1e652b7631d..a94061f373de 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -405,6 +405,49 @@ drm_get_buddy(struct drm_buddy_block *block)
>  }
>  EXPORT_SYMBOL(drm_get_buddy);
>  
> +/**
> + * drm_buddy_reset_clear - reset blocks clear state
> + *
> + * @mm: DRM buddy manager
> + * @is_clear: blocks clear state
> + *
> + * Reset the clear state based on @is_clear value for each block
> + * in the freelist.
> + */
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
> +{
> +	u64 root_size, size, start;
> +	unsigned int order;
> +	int i;
> +
> +	size = mm->size;
> +	for (i = 0; i < mm->n_roots; ++i) {
> +		order = ilog2(size) - ilog2(mm->chunk_size);
> +		start = drm_buddy_block_offset(mm->roots[i]);
> +		__force_merge(mm, start, start + size, order);
> +
> +		root_size = mm->chunk_size << order;
> +		size -= root_size;
> +	}
> +
> +	for (i = 0; i <= mm->max_order; ++i) {
> +		struct drm_buddy_block *block;
> +
> +		list_for_each_entry_reverse(block, &mm->free_list[i], link) {
> +			if (is_clear != drm_buddy_block_is_clear(block)) {
> +				if (is_clear) {
> +					mark_cleared(block);
> +					mm->clear_avail += drm_buddy_block_size(mm, block);
> +				} else {
> +					clear_reset(block);
> +					mm->clear_avail -= drm_buddy_block_size(mm, block);
> +				}
> +			}
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(drm_buddy_reset_clear);
> +
>  /**
>   * drm_buddy_free_block - free a block
>   *
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..513837632b7d 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -160,6 +160,8 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>  			 u64 new_size,
>  			 struct list_head *blocks);
>  
> +void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear);
> +
>  void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>  
>  void drm_buddy_free_list(struct drm_buddy *mm,

