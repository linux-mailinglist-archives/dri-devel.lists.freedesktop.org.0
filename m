Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CE6CB92FA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 16:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D24610E90B;
	Fri, 12 Dec 2025 15:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BBoBbRlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA2D10E908
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 15:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdVnGvan2Ge933MERg6prWK0jlr9X/xvUQh5DnhTSmNYEJQTKhGshFkB4MZOo+dmH0+0ICzi91azwgZq9wzUIp44Bt4qVzqneTK32W91T28EFiZplRLe08HeTgWp6ha++HpiPZm4cYLREztbESY2D16Lnxox4KcbXMOBDJdmP0ZoyVBA1s9uZUwKD+EAWsEVVhMyrbNobn5mckSIlNQDgRGmKae+cPd542iNPlKBAwHzfCU4Joamesa5N+Bm1Kgt69jzLRNsHocxyQ0syddUaMTmm6HTuWoIv5eLaYa24ZofFzuaEf8JBpOvQH9WAlPXvIQETAORiA5TatOzQZ8NNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WK6tzHUzieEP3OLoDFiDvpborYR+ZhSnHoBORuGQ0eI=;
 b=T8JyKzCBy/KoXUYf+w4il4iVexxAhJnsRw7WyZ5u1MpoRw5D6WvJl/eVrlZcygJRojvKk2/dWeelLcCZ/vM0RgiVJLNnLAOYCV5Y+D/QM+c02BQsyLopy4kVw1Uh6KGQ2q6C458/DlJVSs8IRSBhV2pNnSe2dBE2R2E7O+cFm+K35BpWrsiaX1Wuuquua22aqveJCzxaKGHFlJyT3phd0lzg4M5akBhEm+CSn8iux3ZZ4siTi9jlsfK/j5j2zTQ3T6m6OFEFiLJCe8Ng/h8NpCoKhbBpabFJw/JVaWlwAkR7pAtD5cBCJ+xmN1hlKxmoEgWVZ982PxaIeIxzlc6XBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK6tzHUzieEP3OLoDFiDvpborYR+ZhSnHoBORuGQ0eI=;
 b=BBoBbRlpe9E2aEuUnjElXzNCgBdV+SEz+S58YAo14Yw+6239yVCIA25ePXI5clzNkU2MLWdX3Ax+DuPeuqH6K13VLghkrs6PAy/KVQyCP6LBDLb0dhFhmwbEWO8XRQt5kud1O4Q5VWY53aIk0krKwy8OmRqVnQFiqvAjwHW3Ij0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB8221.namprd12.prod.outlook.com (2603:10b6:208:3f0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 15:49:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 15:49:20 +0000
Message-ID: <792385a7-ac0f-4e39-a6e7-3b09bfe0b4e7@amd.com>
Date: Fri, 12 Dec 2025 16:49:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/19] drm/amdgpu: independence for the amdgpu_fence! v2
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-12-christian.koenig@amd.com>
 <e426d618-3d6e-4d93-b6fd-4c5e1b11d9f2@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e426d618-3d6e-4d93-b6fd-4c5e1b11d9f2@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:408:ee::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB8221:EE_
X-MS-Office365-Filtering-Correlation-Id: b6c61a9a-c959-47e5-fece-08de399603af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZkxRMnJMaktTZmhCTDUxd0k4UThtT1J5Mkl3S0c4UkhhSStMVVlaVDZOVWs0?=
 =?utf-8?B?ZXczakd0OFZaSVhWeG8rUWJyWXkrQ2N6bXowVHU4U2lCVmJBUGZOUDVXUUhq?=
 =?utf-8?B?QmRJQUZrZ1FQSkNtT0c5Q1RUeVoxMzlpUG9DVldaMFhmU1R6ZmFia200Y25U?=
 =?utf-8?B?c3JxQTFjWFdJTndTMlhSK3RmM1BYVzBBSjB6YVd6N1pxR0N2czF1MEYwQWRH?=
 =?utf-8?B?QmNaRHk2NStsb2xCU0VSZ3NHZHJhV1hiK25SR2tINURacTBWS2J5ODFncTY0?=
 =?utf-8?B?NnlPS0UrV2FnUStRMjErOXlSenhoZFY0ZlFZMU5oSW05V29FL1dHZUdsbjVJ?=
 =?utf-8?B?bStUdlhES1NuOUlEeFQ3bTNXeXdFZkN6aTRJOEVQYjZNWlgrVEIwR1RNcWZt?=
 =?utf-8?B?MVNScGFFS0I0aEF0QW5QdmVRSTc2VmRsOXI2TFFYOWlNNncvc0pNbG5jZksz?=
 =?utf-8?B?cmVrd2hlbWx5K080c0VMMnFXOFZ1Wi84QXFWai9oN3VOeG4wMEtNQTNtQklK?=
 =?utf-8?B?MXFSQ3NWNndVck5NamNWTlZYSmNtaU5YQ3g4ZExJVHBXK2NMU3NFY09OdDNR?=
 =?utf-8?B?TlRXeCtKYjQvaERJSXdDeXNXNUJEUUJqRW5STFNvTUpmeHpiNzJkQk1BZEJk?=
 =?utf-8?B?QWNKNEVzWHJzWU5QQ1NWRDN2SkY1NDlGMWZkVUlaUElESWo2Qk9scHJYczEz?=
 =?utf-8?B?bzJoR0ZRbW5wZGRGbndYV0F2UUxBd2ZrOEVqek5Uay9sbzFVbTlKQ2lITS94?=
 =?utf-8?B?ZDZVamdicHQvSktZMzZiTmdzbUZnRmdzUlNMNXNWRW5ZdHh5c1pVZ0dlM1dn?=
 =?utf-8?B?RUx0bExtSms3bzdEN0djUTcyeUFaYXBGN2YwZ09GV01GeXhIYVAyU3BuYVhH?=
 =?utf-8?B?cy8zTzZYd2NMSDlBUkxoRWpGMUU3UWdKRk1hSW56eHR5dFZBOWFuclBaS3Ri?=
 =?utf-8?B?TnZsZ3BCdzVlcng2dytFVlJPek5yKzhyL1kyaG5KSnRBRFdyMkR4My9xNFIv?=
 =?utf-8?B?MkE3RjhUdWVaczdqYmtYcVV4UjFOZ2czVGtZa2RzU0l6R0x3Q09ZSkt2NSta?=
 =?utf-8?B?Zi9EMVplcGUvbmNMeWR0alRveCtWeVV3SUVvZHZuRWtDeEFsRERPZ2lrZFZ5?=
 =?utf-8?B?dXlWbGY1ZmtsRTNNaWkrbER3ZVR5WEtuNGFEWVB6KzdabXUyS2pIVmNnb0pN?=
 =?utf-8?B?YSszak1WYzJ0K2VDZW41SUpxTzkyVjBoWEw1MGJCM1hiY29mSVRJOC80elBa?=
 =?utf-8?B?MEN5cDF6eVNKdGthcXM1VHc1UVdDYmZYRWYrUkZjTXlSOUZHL25GQklzcFBy?=
 =?utf-8?B?LzZsVWd1TXpPSWh1YmlvdlhSZFhXdEp0TUhXU3lnV3JOWnRianV4dUgzdU1v?=
 =?utf-8?B?N2VLZkIrd2t6cHhldTFkTURxTDR5NWFDM1NaelBUOW1nZnZvNjh2c2l6WmtQ?=
 =?utf-8?B?d3FHRlh0Rzc0RzVvRHd3VEVlL0dTS0NXVW1TQTJYZnVIbEgzalZibE1CMmZP?=
 =?utf-8?B?UW9VT0lFT2JKV3NtcUd1L01hUloveUdYSGhoMTQ5M202OTU4MGdlOUtnWC9P?=
 =?utf-8?B?TGVYZmNyOUF1ZjIrazZrY1prMTFjYjlrMXh3YlhvUVFLNVdOd3hyZThIaDJL?=
 =?utf-8?B?NzdVT0xaTkVZa2Vraityb2NpY0VWeTJ5M2tmc2RlL3IydXpXS0JGdjV4TUFu?=
 =?utf-8?B?cDdtOUlPSllIRGxKQ2lIMUt4bG45ejM0UDlKOHpseXUrUVFvQ2xsUlE5Y1NK?=
 =?utf-8?B?Z0MzTU1IdVY5akpNZ2pVcEZhRlV1aTBTbTBYZWd0Uk43UHFSVjdpTEgyS1c1?=
 =?utf-8?B?VXUyc28xV3pPZU02L1FpNGsrSW9jVzNnb05LSUNHb3VGa2h5VW45d0R0VVYx?=
 =?utf-8?B?UTJtRVhLNXZlTzU1Tk9UWDFuTGtEMW5pOUppMlZweXZJaFFVUHBIcVk2UVll?=
 =?utf-8?Q?CrOiGVzMxHFgVXPoWayhdYqflDra59D0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnQ3WEtQSmxDeTEzSk91a0NSdTVTUnlWTzkrK2JWNEs1ajh4YXdpYUlJcERh?=
 =?utf-8?B?U2ZWRW9ZWFA0TXNmWGw0UWIxMnFwNnVubmZTTlM3azUzTUp5bGQvM1R5bnRK?=
 =?utf-8?B?eURjUm04Q1gwSkZJS2pWVXZCclovZThGUHh2ajhUcTNmTVRYOGFrNUJCU1Ax?=
 =?utf-8?B?SnMyYUQwK0pSelRZZFNEY2xCd1BnTS9XWmZqY3RKVStrVFBTRnJzUDA5a1lw?=
 =?utf-8?B?MkNXTkxEQkg2UzhqMjJNMGFCa1dpRGhBcmRTbkx1SHNmbnFwcXJVNTVRTVNC?=
 =?utf-8?B?ZHNmbkc4L3B2RG5Kb0VmVG8yUFI4c0lPQmkvayswTVRXWnhOeXpjeDFqSkdL?=
 =?utf-8?B?d1FIMmdTUDE1WkRBTEQwNHlPYXIzbXpIUDNVb2Y5SldvbkxJeHlVYldOOG9E?=
 =?utf-8?B?VVptTWVQelBVWjVmcGFqcWhnMW1SRVVpdGVuT2FjQWRsTlQxdU91ZWlsUXIv?=
 =?utf-8?B?bTNqSUN3V0VCdmFXOEpoWTdLWDNKQVYxMmNLa3RCYXExK21QYStlTGFqTklG?=
 =?utf-8?B?SUVlMGRGdmM3bEZlUSszL2pFcGdXLzR2bllCY3BCcE5FR1Nua1g5MURnZ1F5?=
 =?utf-8?B?QWc2VjFHNjhaWE1RazM0eTArTC9EdkpTT0kxZWFSYS93dDJJamlUbkxiODdF?=
 =?utf-8?B?MGhGS3Fua1BDWURhaXpwZXVES3lvNVNXYUFVeWxFaFlPdmlIem5tbDlzYzI2?=
 =?utf-8?B?b3Y0T2RkTzd3WVpUSWtRT1kwSktVVTRpNVdneGZuWFdxY091L0V3SnZHMnNH?=
 =?utf-8?B?TU5oT0dJQ0VOT3loRHg4b3BXMktwS056cVJRSzhlRDNVQndJdk1uNk9FQ2Y3?=
 =?utf-8?B?b3lnMmt2QlVkRkJSb2NoVE5MUlU3d09ZVVo5My8wZklwWVpMWTVkUkRWZDNB?=
 =?utf-8?B?ZXpvTUNlM1FBK3NiZ2xjcXBnNzZicUtGQnZ3SFlKTGxIM3RPVUhwclozYUlS?=
 =?utf-8?B?MytLVFRYeEUwM1IvTFB0anVrUExFODhOcjZJbnF5S2RVUTNFYVRkOXkzU2RO?=
 =?utf-8?B?RXdGS1Z5ZTVoUFdObXF6RkZieWxIQm1XQzJKaGFTbXRGS0VuN3NnT0krbUJW?=
 =?utf-8?B?TnlJNC9PTWtYazU2QXNOVGV5Z25RL1NBNkxuWUQ1cm9NYS9ma0NWYjUzWm5x?=
 =?utf-8?B?TlBkbXJZSTNVblExRlF5TzF4L2dPV1hhVVN1bmNtMENtVVp0MTJkaG1nbmQ1?=
 =?utf-8?B?cy9ZeG9SeFBPNEdHZCtvaFJTQlltVWhXRUhxZXByZVB4OUkwL25KQjRFZGFj?=
 =?utf-8?B?VTBUYXRmb2kyTE5XL3d1Qyt4QVJDS0Y5ZzQyMU1OeEc0N3BCaU5tOFl3dDJ4?=
 =?utf-8?B?UDU5VmRicGttNnNLN0tNZWNGeFhRNDRDdWVHdS9HL1V5V2RJdzVCV1VKQmdk?=
 =?utf-8?B?TStpR0tUZ2Z4d0FjTERFSzBWeVpGYVFudU5MVlJZY2lRd2YxSllXNzllVUJR?=
 =?utf-8?B?Nkl3MnNKWFNvdnpoVSsycGx1RnN1eU1OK1h4M1BHd0h0SHo3c29zVjlHaDVZ?=
 =?utf-8?B?MTFOeVhhTlZsRlVOWFc0eGhHeENSakhCb0x0TGI5MzZEakRpVTlwRXY1dEdr?=
 =?utf-8?B?Rk9uZUhXcXc4cmxBV0xNNDJUK1B3UHRSZHp0OGVYN3JzNEdDRzVPRHFJZE4r?=
 =?utf-8?B?ajFKRll2cDcrMVZ1ZFZ5Tm1ZcjF3THVKN3c5aFNNcjVvY0V5bFpsLzh0dzF1?=
 =?utf-8?B?ODZadHBaNytWajNuN3VaSmRLcTJaeTg4bU0rOE84RWg3c1JlSGhqNFFMc2NT?=
 =?utf-8?B?a09kQ3NNWktQZTlEa29LSS9kYTZSTEEzZEVjMUtDR0VqSkFxd3B1RGkyUTZX?=
 =?utf-8?B?SkVZUW8weFNQVGhrSGZPeVpOdk9qRUNJdlZKcUxURktZamVmNlFFa2FEZ01V?=
 =?utf-8?B?ZWtKQXZGRlN3My9JQ3QzdWVOcUlmZmorOFVEaE1wczRyalo0SnlCUnUrMmtj?=
 =?utf-8?B?UmdqRzh5UEVjMjZyZ252a1YxVWlhcmljTWVrVlh1aW8zdHRHL1VQZW02d0Jn?=
 =?utf-8?B?MUpjZkFMemlENnJpdzVkLzU3NVVhOHR5ck83ZllkUE1FM21ycm4wbSt6M1BO?=
 =?utf-8?B?dW1vRFZnS0NIazVocURkTjdxMndYOXc2SGdmT1lIRHFmUnJjVzBSVXFkODh5?=
 =?utf-8?Q?954jVct5zoA7wDLjNnGR35eoW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6c61a9a-c959-47e5-fece-08de399603af
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 15:49:20.6749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GWyMXhHq337Jxz6/5EsfUKoHXj56kVyliaER7OCRjD/bku9Kjr3wsA81z3Ge3rJO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8221
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

On 12/11/25 16:53, Tvrtko Ursulin wrote:
> 
> On 11/12/2025 13:16, Christian König wrote:
>> This allows amdgpu_fences to outlive the amdgpu module.
>>
>> v2: use dma_fence_get_rcu_safe to be NULL safe here.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 63 +++++++----------------
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h  |  1 -
>>   2 files changed, 20 insertions(+), 44 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> index c7843e336310..c636347801c1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>> @@ -112,8 +112,7 @@ int amdgpu_fence_emit(struct amdgpu_ring *ring, struct amdgpu_fence *af,
>>       af->ring = ring;
>>         seq = ++ring->fence_drv.sync_seq;
>> -    dma_fence_init(fence, &amdgpu_fence_ops,
>> -               &ring->fence_drv.lock,
>> +    dma_fence_init(fence, &amdgpu_fence_ops, NULL,
>>                  adev->fence_context + ring->idx, seq);
>>         amdgpu_ring_emit_fence(ring, ring->fence_drv.gpu_addr,
>> @@ -467,7 +466,6 @@ int amdgpu_fence_driver_init_ring(struct amdgpu_ring *ring)
>>       timer_setup(&ring->fence_drv.fallback_timer, amdgpu_fence_fallback, 0);
>>         ring->fence_drv.num_fences_mask = ring->num_hw_submission * 2 - 1;
>> -    spin_lock_init(&ring->fence_drv.lock);
>>       ring->fence_drv.fences = kcalloc(ring->num_hw_submission * 2, sizeof(void *),
>>                        GFP_KERNEL);
>>   @@ -654,16 +652,20 @@ void amdgpu_fence_driver_set_error(struct amdgpu_ring *ring, int error)
>>       struct amdgpu_fence_driver *drv = &ring->fence_drv;
>>       unsigned long flags;
>>   -    spin_lock_irqsave(&drv->lock, flags);
>> +    rcu_read_lock();
>>       for (unsigned int i = 0; i <= drv->num_fences_mask; ++i) {
>>           struct dma_fence *fence;
>>   -        fence = rcu_dereference_protected(drv->fences[i],
>> -                          lockdep_is_held(&drv->lock));
>> -        if (fence && !dma_fence_is_signaled_locked(fence))
>> +        fence = dma_fence_get_rcu(drv->fences[i]);
> 
> dma_fence_get_rcu is not safe against passing a NULL fence in, while the existing code makes it look like drv->fence[] slot can contain NULL at this point?
> 
> amdgpu_fence_process() is the place which can NULL the slots? Irq context? Why is that safe with no reference held from clearing the slot to operating on the fence?

The slots are never cleared. It can only be that they are NULL when the driver is loaded.

I've switched over to dma_fence_get_rcu_safe() where appropriated.

Regards,
Christian.

> 
>> +        if (!fence)
>> +            continue;
>> +
>> +        dma_fence_lock_irqsave(fence, flags);
>> +        if (!dma_fence_is_signaled_locked(fence))
>>               dma_fence_set_error(fence, error);
>> +        dma_fence_unlock_irqrestore(fence, flags);
>>       }
>> -    spin_unlock_irqrestore(&drv->lock, flags);
>> +    rcu_read_unlock();
>>   }
>>     /**
>> @@ -714,16 +716,19 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>>       seq = ring->fence_drv.sync_seq & ring->fence_drv.num_fences_mask;
>>         /* mark all fences from the guilty context with an error */
>> -    spin_lock_irqsave(&ring->fence_drv.lock, flags);
>> +    rcu_read_lock();
>>       do {
>>           last_seq++;
>>           last_seq &= ring->fence_drv.num_fences_mask;
>>             ptr = &ring->fence_drv.fences[last_seq];
>> -        rcu_read_lock();
>> -        unprocessed = rcu_dereference(*ptr);
>> +        unprocessed = dma_fence_get_rcu_safe(ptr);
> 
> Similar concern like the above.
> 
> Regards,
> 
> Tvrtko
>> +
>> +        if (!unprocessed)
>> +            continue;
>>   -        if (unprocessed && !dma_fence_is_signaled_locked(unprocessed)) {
>> +        dma_fence_lock_irqsave(unprocessed, flags);
>> +        if (dma_fence_is_signaled_locked(unprocessed)) {
>>               fence = container_of(unprocessed, struct amdgpu_fence, base);
>>                 if (fence == af)
>> @@ -731,9 +736,10 @@ void amdgpu_fence_driver_guilty_force_completion(struct amdgpu_fence *af)
>>               else if (fence->context == af->context)
>>                   dma_fence_set_error(&fence->base, -ECANCELED);
>>           }
>> -        rcu_read_unlock();
>> +        dma_fence_unlock_irqrestore(unprocessed, flags);
>> +        dma_fence_put(unprocessed);
>>       } while (last_seq != seq);
>> -    spin_unlock_irqrestore(&ring->fence_drv.lock, flags);
>> +    rcu_read_unlock();
>>       /* signal the guilty fence */
>>       amdgpu_fence_write(ring, (u32)af->base.seqno);
>>       amdgpu_fence_process(ring);
>> @@ -823,39 +829,10 @@ static bool amdgpu_fence_enable_signaling(struct dma_fence *f)
>>       return true;
>>   }
>>   -/**
>> - * amdgpu_fence_free - free up the fence memory
>> - *
>> - * @rcu: RCU callback head
>> - *
>> - * Free up the fence memory after the RCU grace period.
>> - */
>> -static void amdgpu_fence_free(struct rcu_head *rcu)
>> -{
>> -    struct dma_fence *f = container_of(rcu, struct dma_fence, rcu);
>> -
>> -    /* free fence_slab if it's separated fence*/
>> -    kfree(to_amdgpu_fence(f));
>> -}
>> -
>> -/**
>> - * amdgpu_fence_release - callback that fence can be freed
>> - *
>> - * @f: fence
>> - *
>> - * This function is called when the reference count becomes zero.
>> - * It just RCU schedules freeing up the fence.
>> - */
>> -static void amdgpu_fence_release(struct dma_fence *f)
>> -{
>> -    call_rcu(&f->rcu, amdgpu_fence_free);
>> -}
>> -
>>   static const struct dma_fence_ops amdgpu_fence_ops = {
>>       .get_driver_name = amdgpu_fence_get_driver_name,
>>       .get_timeline_name = amdgpu_fence_get_timeline_name,
>>       .enable_signaling = amdgpu_fence_enable_signaling,
>> -    .release = amdgpu_fence_release,
>>   };
>>     /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> index 7a27c6c4bb44..9cbf63454004 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
>> @@ -125,7 +125,6 @@ struct amdgpu_fence_driver {
>>       unsigned            irq_type;
>>       struct timer_list        fallback_timer;
>>       unsigned            num_fences_mask;
>> -    spinlock_t            lock;
>>       struct dma_fence        **fences;
>>   };
>>   
> 

