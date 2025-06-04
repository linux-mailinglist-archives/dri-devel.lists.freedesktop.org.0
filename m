Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3481ACDA3A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 10:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B22510E0A7;
	Wed,  4 Jun 2025 08:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="c2XXD3+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1895510E0A7
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 08:48:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVT1xzHorrlHvu6FGC5KNypT6WRff/BpiPwqzXuSmqnLJ7cyqrTJgScyoD163mVnWKsec8U2ATNDoa1lYBx22pQ64HhS7xFDdIGii06D94g1TkJVKit9hstPfSVny4vPXDbvhVpN8FxCZDxYsaHcxLyAJ+teBVqf7XITvSZBLH17IaeIrsDXL1W37LHkaJRY2jodahs0IRW+Ti6i/jurXK8kJyfoju1EGBsslG1Z5wdB1kGg7fLU1QhPiphIFMqXbVS+i+FesaYanPVW1KpmpapUbRPb0f08ZK+5Yn4g/JJEHomOS3BJPFexCo1apubjptZEYhRH2W0GIG9NikcOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0i/uKTmfV/AG4Pg3wStfZl6CX5XmBBy0j0Ao2hQlc0=;
 b=jj/GH0ZnvK2RuVIR0WNIgpNBIzWHd97OWMUPsHHEEJhPhrjIdmxo/pXYHaG3xzwCj6FzlsFkKjqks8P2MrGdIXNCD2r6mPh1mR70Tv7KvoclRzwoI/wsaeipXdTQh79FvXvIG7w5c0XN4atpC7jDu6xrI7Vt6BwA8OwfOypyJxQ/dlGFNxPGnJokuG5CuXEbWV2XxphAofnJH1CyMfuelGHuyFi+YfJO3T63WXvlrBEgkpcxsduuMMMPYXnlttAHPuH3b5asbVZ4G0NuEJuxctFpEDQrZ6oLfInhC2yngKDjNkFTi2E3pK26J8l0Vu1CNAmJk4zczT00DR4Qk4NCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0i/uKTmfV/AG4Pg3wStfZl6CX5XmBBy0j0Ao2hQlc0=;
 b=c2XXD3+ssnOSAa8k4ZIJP5r/lyyydB/fMoqGvsSrMDF8KgVd+JY+hjNlnSaSVR2FK3lGe+R8qdfuGeknJDWgXyW/XhhKsRZFuqcNaPUVTzK6uSWjh++0/y9HNn10TXtrdmSwDHpcSIH7ZeXrHr+ozbCSUsHwNLHeuZXj1FYbTh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB9054.namprd12.prod.outlook.com (2603:10b6:930:36::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 08:48:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 4 Jun 2025
 08:48:50 +0000
Message-ID: <c7807610-54ab-42e2-8350-b98212c7be39@amd.com>
Date: Wed, 4 Jun 2025 10:48:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/ttm: Increase pool shrinker batch target
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20250603112750.34997-1-tvrtko.ursulin@igalia.com>
 <20250603112750.34997-3-tvrtko.ursulin@igalia.com>
 <b5ddbaf7-9f74-49d7-a45f-ed73ed5df0ac@amd.com>
 <4c41a65e-de43-45c9-b672-88a2760a1a75@ursulin.net>
 <232yojrnpypalgnajli7gfviqgq6vjowaxfsnieaa77akylruz@u4al2d5hsnc5>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <232yojrnpypalgnajli7gfviqgq6vjowaxfsnieaa77akylruz@u4al2d5hsnc5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0149.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB9054:EE_
X-MS-Office365-Filtering-Correlation-Id: d372720a-b978-414e-4578-08dda344a085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WWZGM1h2eUl5MXJ6TGZ0VGRhZ21GV0tBZThoeVYzck5Nd1QySmNOYnhUTDc5?=
 =?utf-8?B?S0NXRDlPNFhFUndycFFDOGQ0TndjYmJIYzJXeEFDMGFaeFlpRjR0cmNMZi9k?=
 =?utf-8?B?MlJvWCs1bkFlblo1bWJ6VXFWSW0yc2gyYWVKMnVhbnhlUG1YZWdXT1kyZEtR?=
 =?utf-8?B?VGhWb3duWG9zNlJqdEsvczVGUnljRGw2a0dUMnI3M09Ib2tHWFR0UWo0TllJ?=
 =?utf-8?B?UDY3UFNJV2FpYXpFUjZuZWRTRjA1YW1ob0RnOEc1Z0JBdWMrRUM3dVJKb2FD?=
 =?utf-8?B?UWE4WlQvNXBIdUJZQ2FCb3VFMXkzR2M4aUhpeU5WUVQ2ay81UzRxU2tkYzhZ?=
 =?utf-8?B?dUQ0UVhnQmJmYlFoUms3eEk1aTdyaU41clFzV2VYNHArSW9KNndLS2d5OGpC?=
 =?utf-8?B?NEdkQU9LNEJjM0hha29icVJ0dWNzL0VBM0dvbmMrSXlwdDVONlc2QVBOaXN4?=
 =?utf-8?B?czdrVG9tRVhCVzVnR1pnUDBLY0thNitnMVlaT2Y5TERDOTRoeUJ1TFliUjg5?=
 =?utf-8?B?VmZDN1JrK2RLZUp2WGxFVmM4c0ZQa2ZQaWRGaHdTd0pRUnZSRzk3dlB3V0Fl?=
 =?utf-8?B?N3o4OXVzUTFseFQrMWNUTkZaK1JvOEkyRU1qL2N2TjhQemdGRXpLb01CZm5N?=
 =?utf-8?B?R1ppUWxocHVud094VVh5VnJhM05KSHQ5dHhvZ2ZGUVpaeFh2NFpvSlZIdXlp?=
 =?utf-8?B?Mld5MkhlaDdMYUltWWRzbk5COXlGblVEV1BDeWJRTDBGekNhMzl6czcxOUxL?=
 =?utf-8?B?Vi9nOTZpckQvbHRRNDNqTjlGY29idlhrUmZhVkNHbEFpZS8vSXNNcDNWZ3di?=
 =?utf-8?B?WDF0MERNdVhJUXVWMGxjb3YwSnVYY2dza1VLMFgrTGtJc3hwUGh1YWxYbU40?=
 =?utf-8?B?UVMwMEtoSVc3bVduRXVlM2tQZFJqaFpLM2thakpyN0liQUk0R3VLZTlZZzls?=
 =?utf-8?B?VDhCbHhoMFNOK0lOeGU2R0F1Y0xnN3RJbUNCRUhBUFpCVXVaSE9TMDcwd29G?=
 =?utf-8?B?dTdtU0FyaE5ZalBPVDhOTDEzN0kzb0RIRVN2QUxiMzJIald4S09WQUVFMG9U?=
 =?utf-8?B?TDV2R1lHVmd3YnA1dTBFVi9kaWpLTDJoLy9ZOUY3R0NWQ2t0QytJSU9MRzFp?=
 =?utf-8?B?Q3lLenRLd1BMdllSOVI0cE4yRVpoSm8wOFg2ZXFEa2dnSDk1Unpod2t1YUZN?=
 =?utf-8?B?YnA1dEdUendBVFJwblRrTzE5UFRXcXZraGsyci9kbUxaUlR4RThKbWxEZXlR?=
 =?utf-8?B?ZUJLV1J1QlMxVzVXcDF0OWdKMlVMS0xzWFVKS1BKZkZON3MrU2s1MlF2cFZn?=
 =?utf-8?B?M3piYkNSQzdHeFZMZ2RCYks3ME1JZ2ZYbmJhenRZdit3SGlHNklMNXZKMm5X?=
 =?utf-8?B?eFRoQ0lKV0h2dk4yaHp3WmFRMzhDQnREY0VSUVJpeXdOdTA4bURITzNkVVpo?=
 =?utf-8?B?dVdOdmdqeXhFZDFPNE9hZnp4WHlXVGhyN0Z1bmZLaUozRTQ0anF0bmlDazVX?=
 =?utf-8?B?Q25oY2ZialFKZWZCNWc2cjhZT01xL3RidDJ2bk4zOUdQZzQ4Z1VtdThXZVdH?=
 =?utf-8?B?ZTRPVjhRMXVXb1BTazhadXB3YTdOZHdiSGpOTGc4amdobi81bVRQdHNWT3Bq?=
 =?utf-8?B?NFlzYjd3Z1VkaDNBY251eVNYR0d3UTJKS09STWJQcFVwcjFPZWd5ZitiVkJP?=
 =?utf-8?B?ZkVJYjZCWkNZQ2RMOFFybDZnR2wvdklsWWwrdnBMRERQWldzM0k3ckYzTHNT?=
 =?utf-8?B?RnJQdUltREVlNkVoaXJKY1N1MnlrakgrTXRRK1pJQmxWN29kdTNReVV1eG5x?=
 =?utf-8?B?dXM2d2tYWlJVbk5zOUZrb0NmbThnSE94VUg0REZSTlBnQ0twSFZQalp6bWQx?=
 =?utf-8?B?NjNxR0k4ZUNNN1pua3pmejViQi8zM0VEV082Qm9nUHhpSm8xZkpRTjhGcFdD?=
 =?utf-8?Q?MwJLySfoP2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWpOd01PV2tCaWJaUGJSOFNYaWNINWh4WWcvRUMyTGdBS05vWDY5ZmZrNGs3?=
 =?utf-8?B?QWxTNGNOenhWUmZIOVhlaFBiVGJuZ2dFUVIvNjZpWGYrbVRKZ2dJclcvOWZa?=
 =?utf-8?B?K25Za1dxMG5NelV6bTRpUHlCUFJKUkx1TGdOZmN6a2RHZzBsV0VvaGNlbHpa?=
 =?utf-8?B?YVZsUjJZK3h0NXJUbjkvdkVDM0lNdi92ZHIxVzl0ZkhSTXFJOXlwQlVXSXdB?=
 =?utf-8?B?Sk5yL3ZCNDRyWUNvVkV2L1dUd0pCRlVtVUc3SnZ0cXZ4OWhWcmRGb1l2QytD?=
 =?utf-8?B?YWh4T3NyY1NUUllhSVk0bzFuSmxyWUdEMU1tN1VuRTBNeUkxUFR3TkhheWF0?=
 =?utf-8?B?ZkhFemFHL3p1OTBCbVpjRHRUUjRtemp2bFRiTTdZa1NoTzk1dFRBcmpkbWw3?=
 =?utf-8?B?alcrZ2h6UFBhcDdEOVB1MVlKRVpuRXRDbkJhNDAwTk1kWm13K2FoS25zUUJQ?=
 =?utf-8?B?N1dEUnh5ZW5xSFBjc2xsSnNSSjh1QmR6ell0OHUxQWVDQnE2RkNkR0FTQTlO?=
 =?utf-8?B?dnpxZWhtTW5ocmd1S1pFTm1uRnRRa3pWeEFRNnhrMWkzY1MwYUVrQnhLWlNC?=
 =?utf-8?B?VHFxRWV2NDRmdHlQck1sVWg2dkNCcHZoKzlPeDV5YlBJOXlQWHBIdHd0NkFz?=
 =?utf-8?B?M1hacG1vK0lva3NDbDd3cVhNckRiVSt4dUpiMUcrRUxlSEsvaGQzWnRsTlJQ?=
 =?utf-8?B?N2hjNUNLTHFZVWdTYWlwOFkyTFpQa3VCN1pGeVBNbXRSYnVRQXZBQmo0UEFP?=
 =?utf-8?B?N3pnN2FLdUl3ZGFqVVBNekt5RjZDRU5UZnFYVFNhb1RyZzB6T0JvRndIb3h5?=
 =?utf-8?B?VER5VFZPbzFJVHJFaW1JamxqaVp2UERWb051S2xsL2RRMEZVRk9qVCtac004?=
 =?utf-8?B?M1hvTEdMZGFOSUkyVnhlMFFha0FWZ3VlbnJVQlVGM3d4eGk2MEVUMlAyelVX?=
 =?utf-8?B?RmNSeGxYbjZBRFFPdVVRQ2J1REtxalJPQi9RK1FEcTBEWWdtOWZLQ1pDUGpS?=
 =?utf-8?B?RWkyZTV0amxRaU9Uc1BsNUhvU3lpUUJKSVFFOWJtSW1BZkN6YW44cU9ienlL?=
 =?utf-8?B?WWMwUXBYZ1FkamNIVnRZeGZYOXZmaXRRZlBaUmJQMWtmYWkyMm8wM2R6K01u?=
 =?utf-8?B?U3dmTjg4UTFncEJwUSs1YytGM0VLYkRJQnRGcS95NE9KVTdZMFRSeGRKbm1n?=
 =?utf-8?B?OG9HSXJLUmgrZ1Rhd1A1ZjUxZ0IzZDFvK2t1NGZUUHFhamxiaTdDSW5CWlAw?=
 =?utf-8?B?SVI4QlFIMFdXd0xwZ0VxNHo5Tm1lMURMN0ZPT0w4QUIxRCtHTHQ4RmFwVnFi?=
 =?utf-8?B?WmxMak80ak92U3VGWThLQTkyMWd2QUh2WncxVTNWdjlYVlhubE9CUFFYZWgw?=
 =?utf-8?B?NU9KeGFLeFRtWHpDQ1Fad0xFZS94TCszTGpZbTMvc0lLY0J0Z0xHdU9LRGJR?=
 =?utf-8?B?c3B2UG4yNldFcmlXM0Y2aW55SDhxYzNaOGxGUnFlRzQyNllISldhbXJTRk9m?=
 =?utf-8?B?N0lVamw2MDRmWHFoT29TZmJTTDczdGc1cStDeUV5MnRDVldJdUQxaklRQUIv?=
 =?utf-8?B?bld3Q3IyOXFmT3FzUldoM2hLcmhRd01Ub3M1eDkza0JpdUxsbkVvSmpLaTdV?=
 =?utf-8?B?cnI1QkIwWGlYYzVQazNqdjJJNXp1TUJTWW5SRUlNWnhLNCs5MzhwbTlVejRZ?=
 =?utf-8?B?amhHTC9UT05pOUc3cElUb0xYaXZQTXMxSitpdWJOM1Yzc1FqQXRpWEVuNWFJ?=
 =?utf-8?B?RkJXd0c1N1lVNTgzRDdwNEVjRVA0c2RweUdCN0dIRkN6bDV6Q2NvY1RxYkZC?=
 =?utf-8?B?b3FrbTREazAyMnpmcUVENUc5SUpGc1lNY1ByOXRKcE1IdlFsaE1DRjAxY3R0?=
 =?utf-8?B?KzZZZ2ZUalRKbHFDVmdDZnpZakxGMzRtYmx2bjBCanBwR1NkcHBRTHJmSDEz?=
 =?utf-8?B?MzdMRmF6U2xpbWVrMW1LREZLVG1FR202aFNpMnZncmNxVmtEYWszcTlMM0ls?=
 =?utf-8?B?cStCa3U3K1BWUDZSdnNhL0ZDcXdzaGpLWCt2M3MveURwNHNnWjJjWkQ4dm81?=
 =?utf-8?B?ZHZNWk00VHZJUW9HYk8ways5ZEFzaWEyYncvSndLYmVNeFMrdGEvQkVlYXRM?=
 =?utf-8?Q?xUpO3bOBXJ5PNYe6EHsJCTRse?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d372720a-b978-414e-4578-08dda344a085
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 08:48:50.5810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJ5J0Qp4M9T65XVwL2Rc/Py7ulMXdncostyYVJeBGGKAJVA7Zy3OIoxlnRCWLf+u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9054
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



On 6/3/25 20:26, Lucas De Marchi wrote:
> On Tue, Jun 03, 2025 at 03:47:20PM +0100, Tvrtko Ursulin wrote:
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> index c060c90b89c0..e671812789ea 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>> @@ -1265,10 +1265,16 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m)
>>>>  }
>>>>  EXPORT_SYMBOL(ttm_pool_debugfs);
>>>> +/* Free average pool number of pages.  */
>>>> +#define TTM_SHRINKER_BATCH ((1 << (MAX_PAGE_ORDER / 2)) * NR_PAGE_ORDERS)
>>>
>>> To be honest this feels random. But I can't come up with a better idea either and it still looks better than the default as far as I can see.
>>>
>>> So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> to the series.
>>
>> Thanks!
>>
>>> Should I push it to drm-misc-next or do you now have commit rights?
>>
>> I should be able to, think I've tested it already once.
> 
> this is defined inside an ifdef so now our kunit tests are failing with:
> 
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/ttm/tests/.kunitconfig
> ERROR:root:../drivers/gpu/drm/ttm/ttm_pool.c: In function ‘ttm_pool_mgr_init’:
> ../drivers/gpu/drm/ttm/ttm_pool.c:1335:30: error: ‘TTM_SHRINKER_BATCH’ undeclared (first use in this function)
>  1335 |         mm_shrinker->batch = TTM_SHRINKER_BATCH;
>       |                              ^~~~~~~~~~~~~~~~~~
> 
> Maybe move it to the top of the file or before the ifdef... ?

Oh, good point. I totally missed that this defines is in between the debugfs functions.

Yeah probably better to move the define to the top of the file.

Regards,
Christian.

> 
> Lucas De Marchi

