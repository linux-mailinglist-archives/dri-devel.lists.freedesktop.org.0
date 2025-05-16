Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91634AB9E1F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 16:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9510310EAC8;
	Fri, 16 May 2025 14:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sQLneyBE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C6210EAC8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 14:04:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEm1wGA80XDli72E7AsN3cRwapz6/ZaihOUbiAeytf38lStg9MyuB8GOmlt/HlMv7XsN+xceqB1xZQ+dj1HK2fEJxEjAJlIzSzNrdOJA8ujcnzLKxETi//7wu9ynxUFndDJ4EofQZOwG//PlQbILkWYiq5X6zR2xR9TH5VlguLPaWZtvmi8Nw16DTy5MpNmZ2N+Z7xo29F8HvlgpPdwiya+yX32Mf0qVx7mWI3y3sVnVnCn6MeCWg0DIy+zrgHcEz2lQI/yuufllR1jNOdtpmN8E0MSS9REGoIF6cD0PD85eDvbHAMmPeM1UPhDrczLWGjLwkqs6EVmKRRTyEOPQ6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo6UzatNf73yIJKrWZ17DB1S1eQGg+5JEAUWBkaF1QE=;
 b=E5z0Q2ugEM/ZQk6d/oE+ZmMVhj3+224u8C3mS0Np4wZQ6oF7V1cS5hrrkt1iQMw9oG78cSYn79rX+GhghJbaN90PnE7tuumIU6Std/F5UyEiWx9FpyWqQK8tZBGB7Um2FsFph3L8F1kHnpBiYrH4tdpC18crFvBpFEiWDHL+DHg7MOuKz57A/s4I+G0n17giFTA4819i1OcIt6tNe9gA+3TydM+Hz7RnXX9VB6odzeNOkfgl2VtNKvw8qK78whAlSHkhALaBrnNz+Epbm6y5jBfpPkBQtDWIOCot+Q4F3J+6GYLVJ+bQ13OFlckggpQwSaVgUohK7S5AbPNM6P6hgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo6UzatNf73yIJKrWZ17DB1S1eQGg+5JEAUWBkaF1QE=;
 b=sQLneyBEFonrcX/zUH/EEktMVZesCftu45MYZMT0rU1iELD75P6dsivSpwAyWgiVQqy8xvp2W/VKVqQnpJ6fWupPBzOSDcG0qUt945Pt090qyiDoJ4sxCk5S4P7ttNG72v9trYBLo3pd+ImwILTs7bw8ii9dH8sd1GlIBjNDU5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6337.namprd12.prod.outlook.com (2603:10b6:a03:456::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 14:04:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 14:04:02 +0000
Message-ID: <31ee0be4-d6e5-49a7-8db2-bbcc895db575@amd.com>
Date: Fri, 16 May 2025 16:03:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Make pool shrinker more responsive
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20250515205751.37268-1-tvrtko.ursulin@igalia.com>
 <d4892d91-7562-4391-93fe-4b2ec159bb69@amd.com>
 <b453ccd4-b783-4314-8cc0-ed372d833ff1@igalia.com>
 <d3afe944-9a5d-4cf2-83ab-f32da4d59464@amd.com>
 <991d0b4c-dc74-4864-9560-f2b04f551550@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <991d0b4c-dc74-4864-9560-f2b04f551550@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0062.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c6c28e-ad77-40e2-6242-08dd948282df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cER0cmM2WHhoeVRlYVNuVnlNY3FXMXhBQktVTDkvb3cyWFZuMm1jejF1VW1p?=
 =?utf-8?B?cnA3WHB6QTJSUEtmN2pzbWZ0akVIcDU0YUdrRHRjcGdBY1MxM29pZEUxMVor?=
 =?utf-8?B?a04rY2RPVndVSDF6MHJzWHZZNXFWQStwaUErZExtVno5OUlhR01mSS83blVU?=
 =?utf-8?B?aXBSeXBIdW0ya1pRcDc1ai9ON1p1MjhDZjY3T0NOTWV1Z3kydnNXSmtzdjBM?=
 =?utf-8?B?MFJjTEZLMWFWMXN6WGtlaTZ0NGNSeStDK0RMamRQT3BPb0dsRnFOMlB0OWVi?=
 =?utf-8?B?bGF2K1Yxd25seitrQlp2blNpTnFkdGFmZXVLbURDVXFaRForZ3lNNkdCOXZK?=
 =?utf-8?B?bU9GdmRkTHRiNyt6NmRkQnRESVkvN2RneXEwVUkzZkNXeFJ5RzlaOEsyTHFN?=
 =?utf-8?B?UDN2UEptY29RSVpmNGEwRGJ3UGV3bVdwK1ZsVm84SktpUGpkWDZFQ3Zyc05C?=
 =?utf-8?B?cTFvSC93SDdNT1JHTzB3c2NwYzA5VlR3NnlBTnN5aUVZRTFUME03amdvU0hx?=
 =?utf-8?B?YTBtVEJGZWE1SkxmVFQ5SnhJb04xRnRTMVlnT21Mbm9vTWdnZVNGTlpEaWhl?=
 =?utf-8?B?NWZTWUl0NmhFMVFxUU85dVlvK0dYM2cxbnVSQ29PTVNvYkVrV2J6TkRlWEdR?=
 =?utf-8?B?WkZxd0s1YVhYYUVsT1ZpeXF5UUM2M0x2cVpNNnpHcnlKTTBac3IwN3NELzM4?=
 =?utf-8?B?V0tGaWJFam8xTERSWVVOWUlHRmwwVE1ray8xWXNqbFZ3S1ZabFJzbld4Qjh0?=
 =?utf-8?B?R2hxRC9iZ2dSUWNvaU5MUURxZVNTdFEwdGd2MkdST1hlRXFnS0tOb0hLMWty?=
 =?utf-8?B?cllIdUhaNDFLNkE3WGZ3RkJVdkJJRkdsZzdTVTEvclRTcktJNWQrckwzQ2tv?=
 =?utf-8?B?dzI3SXF3aVhBZzM2blhaUUx1NElvc25CZHQ0QzN4dFFHVFFxK010K2V6MmM3?=
 =?utf-8?B?dFI5MkluL1FtWFE4U0xnTzhsRXRJNHovWVlvM2FjKytTS2l1OFVCN3gycW9p?=
 =?utf-8?B?NHB5UFJRcStTSThSUC9xOUVkSzY1K1pkcW9FN0N1cExCOEs2WE02Y3NYQ01p?=
 =?utf-8?B?SUR4bWZNWXVYRis2SFdhS1p5WjZqaGk4MHFzT09XS28rK2g1ODNYNDl5ZlNT?=
 =?utf-8?B?MzVtVm16TmNTZXRmdTRhOUxiYTBTNCs5V2dROEgwT2VjS3FOdFpTSGhIU1Iy?=
 =?utf-8?B?c2g3b2lQQzlKM0psdm1TUCtHeTMwOFpOZzdPeEJSbFRyb1lEUXAveVd1NGJK?=
 =?utf-8?B?c3JzQXQzY0xmZ2xPWFhtOGVKU0d3VUhUVEQzb1ZITjNqZ2hPbURqQzBIeUo3?=
 =?utf-8?B?NitIVVFsaDIrRXdYSnJkL1hiY3BYUjIrS1B4RnNkSytVajZwQlNMR3pUS1Fh?=
 =?utf-8?B?em50S2xUVEpEMlZYdGVqOFBQaDNuRGNpSnlvWEtNSGg1Y2dHUDNCc0Q5d1B0?=
 =?utf-8?B?OXFOeXZTbjBFRFIrRlByVXVaVkluVGJuSUx5bzVmalVuV2p1U004a0ZiRDY0?=
 =?utf-8?B?aGQwZjFoZGptWEl1TjJlUEJST05uR204Q2ZpTEswWTdUang0a3pSTUJ0R0tT?=
 =?utf-8?B?VVFsVVVvbmJWTHBXMnFjMmtIK0taOS9ycW15NC8yVS82aHJxY0YzSUlJUzlH?=
 =?utf-8?B?Z09XTHlZdk9WVXFKaFBwaitLczZjYUFBWjNheE0xYXNBVDZqYkV1emhKYlFQ?=
 =?utf-8?B?eGJjb0UvWFNHRXBvMEgyTWRRY1Z1RUxvdnNSWUR0Vnl1Yy9Kc2diclpEZXkz?=
 =?utf-8?B?bE10b1pPT3d4Y2VYZi9xTENvT2hUM0gvVEYrQlZHWnRRWUk4ZCtzb2ErYzA3?=
 =?utf-8?B?NEdyVzhZa2lmOGRwSlJPTFNCQlVCc2hkRTlRYm5tN2xmdlVOTTR4bFBUc3Uy?=
 =?utf-8?B?WXRGejRrTnF5UG5ubXVrRTZWckZhWHkwUE9XUnNNcXhhVGdGWVNLcEUyeEF2?=
 =?utf-8?Q?GK8IHDAklpg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVEzQnBIbmxJUDAxZVE5Mnd4UldoUVZaaVN0L293dG5heVpDVGYwUW5PRGF3?=
 =?utf-8?B?eEZtSWJTbmorbnpQSGFSVW1qQW1pUzBoblR6bW9oT1RIYm9FTy9nVXRlNmFS?=
 =?utf-8?B?N1BjbGZ1cVdiTTBTMWptRTBEaExlZTJsZHRtVllCMUVQSGxpaWFzVFg5RURl?=
 =?utf-8?B?UW1kbnRKb2VFS1BoNFBua3h4ODFoUkh5UGJTOUJpaUJmbXgrc24xV2RtSmNO?=
 =?utf-8?B?VitVemNJTnRYMk1OT1BlaE1wVkVqY292THBkRWkwSFFDZktnME0rZU1kdEtK?=
 =?utf-8?B?UFgzaGdmUndyQkxuZ2ZpTU5uMHc3YVNWTXJyNGREODZSeTVhRHhXZGVDNnh2?=
 =?utf-8?B?MTA4ZC81SXk1aHZCajQ0WWxSeU05M0tPQ3pzTzkrcmNFaEFaMnQ0NUlKUldy?=
 =?utf-8?B?dWJoSzRuTmw4QTJ1OFJBbFMyR3ZkN2E0dmx5QUZJdk5mSlFDdUliRHptcUR1?=
 =?utf-8?B?RW5zQUc3N0NlazlyeVBZZTQ5VTd4RStLK2pUM3NDNHB3RWZGYUNQUEVCVjVQ?=
 =?utf-8?B?SVJQdTFMVk10TXNsR0NVVCt4NnF2c2dxeDMxbWNJakFtd3FTQi9udW55RzVT?=
 =?utf-8?B?QUoxWnVmUE1qSnN2bGJndWNTdTVhdys1SHE5NUZFTksrZTNHVml1VGJRYVZE?=
 =?utf-8?B?aUlFTFFnVko0ZUZ6dzRZTXVoMml4ck9xTDdKNFByUlEyYnpOUE9WeEpSckY5?=
 =?utf-8?B?SkJUUmZscFlPN1hoMXMwSm11TU1VYUNibFNXazlxSFNtYTNkV3RoWTJyK0VF?=
 =?utf-8?B?QWJjUHE3emFCTHlLR2d4aGphNHRqN05kbU1CL0NOa1VOQUhSNzBoMVI1dVZm?=
 =?utf-8?B?U1hhMldCdEVMTlA4T0hlckRjTDRVU292ckxBdmc1YUR3RnFCVUk4TWJFQTRO?=
 =?utf-8?B?Qldhekd4R1VLZUpnaWtWOERYUUovTFNCUURUQlpsSmlsYmpHNTA0Z1Nsc3pR?=
 =?utf-8?B?dnFQd0h1dkhpZkp1a2V4dWxqdmFTd2JjTGJob1FBTFJ0RVAzcW1OMmVvaVl5?=
 =?utf-8?B?SmQzNlBhRFBiQXJybUhoR3RibWcwTXV3TEc1TndxNTNrSjMyS0ZJQ1ZPQjBD?=
 =?utf-8?B?OVN5d29sN29ZZUVrZXFXczYzVk1JTmp2VSt1Z3NicFFISzZJdWF3VHJpYnl5?=
 =?utf-8?B?cXhoYVJ0c2pKYVlKN2ZHc1ZDNWdNTmpsa2piZ0VvdDdxOWF5Zmhpci9IcG8x?=
 =?utf-8?B?b21zUVdLei9peklCbXBTU0JaOWpjMENneGp2d21JeW1UdnFFR0U3cDVtMU9n?=
 =?utf-8?B?bkFzNHROczVFRFlLYWViMFlGaVdRUHU0OExLT09BcDZYNDZEY3k4SWZ4dE1M?=
 =?utf-8?B?NlBhVWs1dHhjN1NKajJLdWZRZnNFc0RzMnN1LzBabFFxWHBPM0c4QllUbDBN?=
 =?utf-8?B?UTg1dHhENmdiMno3TkpiMHFHN0d0VWVEK0FmQVVIQjlnbklWcXRKUzJyQWZo?=
 =?utf-8?B?bzJJaHlwdmlwMjQ1RzdwS1BZNTF2S3RaSGFweWJmOFViekh1dm95N2dqUXpp?=
 =?utf-8?B?RTB2cGJhNjJ1bXkwVXYxenNoK25GQUdheDJHNGY3dE9QVEt3Sy9hQkNCb1J5?=
 =?utf-8?B?ZVpHVVg0K3QrQS84YnlRRngwM2w0UHlXM2J4MXZmbjcxSHlpSWcwNXMxRXlt?=
 =?utf-8?B?YkpaMi85YmtuYkF4ZkdFRFZDTEVTRVdUWTB0bjFwYU04aUZtdFVnL3JZKzVv?=
 =?utf-8?B?YWdMRUtJdThoamljVWliWmpOdnFLV2hYa1h3ZVFzaGRZSWZlZy9aS3llQllM?=
 =?utf-8?B?MEwzd3R2YTU2c240VkdLQVp5VmZiMi9nbVJuZzlSQUwyZ2VVT3dZNzlNUWdO?=
 =?utf-8?B?dGcyWFJoc0k1VU9qUUU1R2hLTUZBOWhZMFFSenhQMzd1ajVMVDVNNlpsOWhL?=
 =?utf-8?B?Vit6MENCRTA4eG1PdTFIRDI3ZjRoYUtKQTRhcG9mUlNWQzVBSlE1N1FUWFhP?=
 =?utf-8?B?OUthemc4ZkZ3WWl1cjVBUTAyVTZBOVRPZnlGUkhCVHZXK1JFNnV0YUJqcnZw?=
 =?utf-8?B?YzVSM0M4THg3TEh1clo1ZC9xc2JrMk1Mcjd1aTJXTm5yNWhscFZUSHFDb05M?=
 =?utf-8?B?eWZsQUhhdWl3RUNUTGM1a2k3TWcvdW5HR1N5eXh1T0V6RjBIQzFxRTdGc0ZJ?=
 =?utf-8?Q?3WtPct+GtpRhQNd+jiaxgPEDE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c6c28e-ad77-40e2-6242-08dd948282df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 14:04:02.2113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lWT3yxvlIQNmiU5Q2KSThoXGNuaDbiIT3+JZl2uQ5I83MjgnG8zQkecKHz2DXB5t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6337
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

On 5/16/25 15:41, Tvrtko Ursulin wrote:
>>> But because TTM shrinker does not currently update shrinkerctl->nr_scanned, shrinker core assumes TTM looked at full SHRINK_BATCH pages with every call, and adds and decrements that value to the counters it uses to determine when to stop trying the TTM shrinker and move to the next one.
>>
>> Yeah that was intentional as well.
> 
> What was the reason do you remember?

Uff I think it hat something to do with fairness between the different pool types.

> 
>>> Therefore the exit condition can trigger too early in relation to the number of shrinkable pages in TTM pools. Or it can require too many calls to ttm_pool_shrinker_scan.
>>
>> Oh, that is indeed problematic.
>>
>>> Depending on the distribution of freeable pages per pools.
>>
>> No, that should be completely unrelated.
>>
>>> This patch:
>>>
>>> 1. Fixes the TTM shrinker to correctly report shrinkctl->nr_scanned.
>>
>> No it doesn't. The nr_scanned for the TTM pool is not related to the number of pool types scanned.
> 
> Not sure what you mean here.
> 
> Ttm_pool_shrinker_count() reports in number of pages which shrinker core then uses to set nr_to_scan. But as ttm_pool_shrinker_scan() does not update nr_scanned the core shrinker logic is foiled. If that is by design I would like to understand why.
> 
> But as nr_scanned is currently not updated at all, it is obviously not related to pools, or anything really.
> 
> And in my patch it is still not related to the pools. I made it report the number of _pages_ scanned to align with ttm_pool_shrinker_count() and what the shrinker core expects.

Exactly that's the point, you are not using the number of pages scanned, but rather the order of the pool type. And that is clearly incorrect.

>>> This way the break condition in shrinker core works correctly.
>>>
>>> 2. Makes TTM shrinker actually scan as much as the core requested from it (respecting shrinkerctl->nr_to_scan).
>>>
>>> This avoids only scanning say one page when shrinker core asked to scan 128. This reduces the number of calls into the TTM shrinker from the core to free same amount of pages.
>>
>> That should be easy, you just need to adjust the while loop in ttm_pool_shrinker_scan().
> 
> Yes I think this part would be simple on its own.
> 
>>> 3. Tunes the batch size away from the default 128 (SHRINK_BATCH) into a value based on the median size of the TTM pools.
>>>
>>> This ensures that on average TTM shrinker tries to actually free _something_ more often than it does now. Otherwise it can happen to try a few pools (depending LRU order) and give up, while the freeable pages are actually in the pools not yet looked at. By tuning the batch size it ensures that on average more pools are looked at.
>>
>> That doesn't make sense. The number of pools looked at is completely irrelevant for the shrinker.
> 
> Nr_to_scan the shrinker core asks for is default at most 128 pages.
> 
> This means TTM shrinker can look at the few small order pools, find nothing, and exit.

No, that is not what the code does. See here:

        do
                num_freed += ttm_pool_shrink();
        while (!num_freed && atomic_long_read(&allocated_pages));

We scan until we find at least one page to free or the global allocated pages counter says that we don't have any pages to free.

Looking at empty pools actually doesn't make much sense, so they are just skipped until we find the one which contains the pages.

> Shrinker core may then call into it again to try again. Or maybe it can even move on the the next shrinker (away from TTM) if the distribution of free pages between pools is right.
> 
> The exact behaviour here will depend on whether TTM shrinker starts respecting nr_to_scan and reporting nr_scanned so it is a bit premature to discuss in detail until those two are settled.

Then it is probably a good idea to separate that.

> Anyway, by tweaking the batch_size from 128 to 352 we can make the same effect in fewer iterations.
> 
>> We should just look at all pools round robin until the number of objects/pages the shrinker wants to free has been freed.
> 
> I thought that was what the patch does.
> 
> Although on a second look I think am missing an exit condition for the case where requested amount cannot be freed.
> 
>>> Now mind you I looked at this two months ago, which is when I first sent this patch out, but haven't went through this today again, it still makes sense to me. So I am curious why you think it totally does not. It looks obvious to me it is not respecting the contract with the core so I would be surprised if I was missing some obvious gotcha.
>>
>> It sounds like you are assuming that the pool type structure are the objects to scan and we abort when we have scanned a certain amount. But that isn't true, we abort when we can't find any page to free any more.
> 
> Maybe I am blind but AFAICT it currently exits as soon as it frees at least one page:
> 
> static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>                         struct shrink_control *sc)
> {
>     unsigned long num_freed = 0;
> 
>     do
>         num_freed += ttm_pool_shrink();
>     while (!num_freed && atomic_long_read(&allocated_pages));
> 
>     return num_freed;
> }
> 
> Or you mean from the point of view of the core shrinker? Again, that one is complicated since it currently always decrements total_scan by SHRINK_BATCH. And total_scan is set to at most half of pool pages. So it can scan order0 find nothing -> total_scan -= 128, order1 find nothing -> total_scan -= 128, etc, and it soon accumulates a false positive large number of scanned pages and exits from TTM shrinker if freeable is low, but actually shrinkable pages are in the high order pool it did not even get to try.

That is not what happens. See the loop tries to free pages from all pools until it finds at least one.

After one page is freed the pool type is put at the end of the LRU, so with each new call to ttm_pool_shrink() we will keep going over different pool types.

See this here:

        pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
        list_move_tail(&pt->shrinker_list, &shrinker_list);


Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>>>>      /* Return the allocation order based for a page */
>>>>> @@ -881,10 +880,12 @@ int ttm_pool_restore_and_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>>>>>     */
>>>>>    void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>>>>>    {
>>>>> +    unsigned long nr_scanned = 0;
>>>>> +
>>>>>        ttm_pool_free_range(pool, tt, tt->caching, 0, tt->num_pages);
>>>>>          while (atomic_long_read(&allocated_pages) > page_pool_size)
>>>>> -        ttm_pool_shrink();
>>>>> +        ttm_pool_shrink(&nr_scanned);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_pool_free);
>>>>>    @@ -1132,17 +1133,21 @@ void ttm_pool_fini(struct ttm_pool *pool)
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_pool_fini);
>>>>>    -/* As long as pages are available make sure to release at least one */
>>>>>    static unsigned long ttm_pool_shrinker_scan(struct shrinker *shrink,
>>>>>                            struct shrink_control *sc)
>>>>>    {
>>>>> -    unsigned long num_freed = 0;
>>>>> +    unsigned long to_scan, freed = 0;
>>>>>    -    do
>>>>> -        num_freed += ttm_pool_shrink();
>>>>> -    while (!num_freed && atomic_long_read(&allocated_pages));
>>>>> +    sc->nr_scanned = 0;
>>>>> +    to_scan = min_t(unsigned long,
>>>>> +            sc->nr_to_scan, atomic_long_read(&allocated_pages));
>>>>> +    while (freed < to_scan) {
>>>>> +        freed += ttm_pool_shrink(&sc->nr_scanned);
>>>>> +        to_scan = min_t(unsigned long,
>>>>> +                to_scan, atomic_long_read(&allocated_pages));
>>>>> +    }
>>>>>    -    return num_freed;
>>>>> +    return sc->nr_scanned ? freed : SHRINK_STOP;
>>>>
>>>> That again doesn't make sense. That we only find pool types which don't have pages doesn't mean we have scanned them.
>>>>
>>>> As far as I can see the existing code was correct after all.
>>>>
>>>>>    }
>>>>>      /* Return the number of pages available or SHRINK_EMPTY if we have none */
>>>>> @@ -1266,7 +1271,10 @@ EXPORT_SYMBOL(ttm_pool_debugfs);
>>>>>    /* Test the shrinker functions and dump the result */
>>>>>    static int ttm_pool_debugfs_shrink_show(struct seq_file *m, void *data)
>>>>>    {
>>>>> -    struct shrink_control sc = { .gfp_mask = GFP_NOFS };
>>>>> +    struct shrink_control sc = {
>>>>> +        .gfp_mask = GFP_NOFS,
>>>>> +        .nr_to_scan = 1,
>>>>> +    };
>>>>>          fs_reclaim_acquire(GFP_KERNEL);
>>>>>        seq_printf(m, "%lu/%lu\n", ttm_pool_shrinker_count(mm_shrinker, &sc),
>>>>> @@ -1324,6 +1332,7 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>>>>          mm_shrinker->count_objects = ttm_pool_shrinker_count;
>>>>>        mm_shrinker->scan_objects = ttm_pool_shrinker_scan;
>>>>> +    mm_shrinker->batch = (1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS;
>>>>
>>>> Since we install only one global shrinker for all pool types, which might contain everything from 1 page till 512 pages, this seems to not make sense at all either.
>>>>
>>>> What exactly are you trying to do here?
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>        mm_shrinker->seeks = 1;
>>>>>          shrinker_register(mm_shrinker);
>>>>
>>>
>>
> 

