Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449C5ACBA92
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 20:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2675D10E2B8;
	Mon,  2 Jun 2025 18:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YR8cHuWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3310E2B8;
 Mon,  2 Jun 2025 18:00:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bczJu3IhuHjLXCHLNUjCDXIMxX7Tthehs/2qElLK98i6w6CxZlXj8Oe3pPeD/SdSFZdwmrOrqxXG6U5ifGylX8EYdWcZGDof1xO78NJR2pTw7qSN9Nc5hZLiDLRzOkT2FE4dxyfuqRYBs3uiM8nTVYwsZn0Dn+rtuWheVD/hUIudPgI4SxqmxofPy7qB9pHbT3zsrbY+SpYtvBTpYwEzo8vLuNKRx6QRiyWn7LOY0x9hf4UjgIRIAgVaaqsrgMLpWZsG0mySMapNEUm3h1HyGa4TRYMYlwRf+hK7XCzqEcWWQSeERKfXOzFCtX3QzLnUUtstlBLEPWLHnId8+vcTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQqzf/PVtswIrtEssx6UxwUK9V7XsIJBl8vh7ff7XVo=;
 b=Ua1bE6HkVYGraU8eDhC3HUe6RsBLLWXlKQhJovLeQiz5exkamuBrQW77rPRrge7cnvxKYjGDRLd8MBurCpZts//cvoztsOTePeDHfRn1vEpYDXJF+2XJ4csUuBejkOuFRQh8bKmJEwVCFimPDaOWiWfv8UONJwh0lHWFFzZmXsNyUNR3TWE5+veRYwWW0WA3oZ9MmNcGGfasVaUdZNOGMFPMsGNrJqbCKyszW9CVMUmdhc4c7o6u0JgFZ4GEA/d15GC9242dA2QariApG1Fvv6Oc0lZ8OntTcWeTSQ1PMVo3yycGjQ4dr6ajcvckh0u1+R6fUBvTZ9c//ZbhoE2PuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQqzf/PVtswIrtEssx6UxwUK9V7XsIJBl8vh7ff7XVo=;
 b=YR8cHuWyoTOJy2Irj6byPqzp7ZetPZNc+qIewur/E/9uRuhGAW0ScIFmx+HwAU48tb9/5wtW6h+HKRdMGAzfgi/IBX4Sj0sJnNlesriiYSXNRwoX+UbGMThVQSzux7ZNbQB7UD7TF3/6d3f1Wcq6beJb8b6HJrgrhH7Vx1IucSQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 18:00:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 2 Jun 2025
 18:00:27 +0000
Message-ID: <2ffc513c-2d11-4b76-b9c9-c7cb7841e386@amd.com>
Date: Mon, 2 Jun 2025 20:00:20 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: amd-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
 <d483076a-b12f-4ade-b699-ee488df298ba@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d483076a-b12f-4ade-b699-ee488df298ba@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P223CA0040.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 799a69ea-82d0-4391-9dcd-08dda1ff5b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1RKVzdnbmdNWFcvV3h4bjJzMnhwOUJvVnZnQTJBeEtuc1lYTzJ5Zk1IeUtj?=
 =?utf-8?B?MjgySTI1djRYZW5WVTJ1YW5iSGsxanpnOEFaaTNLSmIraHBUMjNoVGpVNFZ0?=
 =?utf-8?B?SzlJN1ZxV0dOUzhycUhrbm9UQkV4dlRnYldZaU9iNVM5ZDVlLzcybjIzNFEy?=
 =?utf-8?B?b25GMXhoNGpmUFJvRUtueEYvUnJEdmtXS0h3aGNaQ0RHdmRvbHBBSi95alhZ?=
 =?utf-8?B?WWtPeVlqaUtaRnFkQThTN29jWnFpSjRCZUYzbkFiZ3h3a1JnSkNEWjNxZVox?=
 =?utf-8?B?Y1d4SjlTTUQ2c1lMVVd2cTVGMURsVUxrTTVCSGFXT04rVEk3bEdXSFNIQ3pi?=
 =?utf-8?B?dlR2M3VKZi9ab0NRdS8zeGxQVG91Q2pmN3FDVjF2bW5uYnVEVkJnL2NrMU5G?=
 =?utf-8?B?ME9xSzBFdUJQMjlrdHpySVJSYmZWcy8yRm1GZVU4S0NiTFU1dEtmMGxrTWRs?=
 =?utf-8?B?UTd4TXNQQ0NQMnZvOW5PQVEyYm9PSmRHR0U5NkhMM3lqYVN4bkpncThQcEp6?=
 =?utf-8?B?dyt5OS80OVBmaVBXYldLL01GbDU1bzFrQVZEaUJCVUFCSFRRZG1WT3JhT2xU?=
 =?utf-8?B?Rkc1cy8yeStnaVRWMmk5akhCNmpsd0lubE5QWHJzOXFyS3ozN3Qvb1VUWURh?=
 =?utf-8?B?UnRXZ29ZZ1RmTkxlN1ByNVJndHhGYXMzNEFHcU1mbno3elg4TVlTOE5xcTZo?=
 =?utf-8?B?SkUrVnBXK3p4Ukc4NTJVWHk4d0QwV1RSUlI0ODdFTkF4Yk9QaElMNjBEQ3hQ?=
 =?utf-8?B?aGFnV3RXWkRDaGdUWGZWeXZIaElLeU1lSnk2NUpSdVhBSzl0cTRFSDV5K1lH?=
 =?utf-8?B?WndPN0ZTbjdjRUUwUERzNytrZm4xQi9uM2VuWVh6T3YvY2FtOXVITkpxTXlL?=
 =?utf-8?B?aDN3R2c3N1UxQUQvODMxQmd5akE2M3EyaGtsN25TQTNUMGJzYVZqemg4UWpr?=
 =?utf-8?B?WWVyMWVPci9TaXQ4QWZ3SEdjUkMyQ0VJbTlEdHRMQkthZWFrRXFHMkM4UkVD?=
 =?utf-8?B?NkZPYlFRUU5DNit5cjVwbWhtaDdVWjZqaFA3NklqUncxR3E4aEQ5dGhrcFBF?=
 =?utf-8?B?MkREbDV3ZmdGaHEvRGFkYTRlVUYzRHd2YThDTjBNaGZBNFYyaVVoR1JiZ09q?=
 =?utf-8?B?M3ZTQkk4UUV6MFZGQTZKclZOaFNZSzRNQ1lCZG9tUzRwWDZCNklXMTRmUGdh?=
 =?utf-8?B?alhTbVFaODF4ZHpsaHRFTjJJdkRuejl0blJFblhwSHA3YWNJK3E1SDdPaVVa?=
 =?utf-8?B?dkptb05yNTl2MEJsdEFrcFhPdzhzc1l0clpjY0NmeExWT3JQSmpxRktQSjl2?=
 =?utf-8?B?aUJIOGZCUFJ3Mmpnbk9LVWdPbmZrSTFJSytyTm12QVR3KzFWMmtEeUt6U3dt?=
 =?utf-8?B?bStYUjU3b3JHOHF3NGpCc0NBVDVETk55ZWg0dDN4MW9RL3BjdG45V2dNQjBm?=
 =?utf-8?B?dUlIbDhISXFsNjM1MTQ2ZHd0bFJjdStNa09tdWgwdWlyYW55K2FJMXQrTlBj?=
 =?utf-8?B?a2pEcU5SK2t1Q2pvZWRlN3RHQ3loN3JvSjJxcWxreEN1SDNCUXkzNVJJU0VT?=
 =?utf-8?B?UERUSzhwUHNkbHQycm5rbVVvNWd0ZUpkcXNFMGk1azRuYm5aaWdjaWVsM0Qz?=
 =?utf-8?B?RXR6SHVoR29lUVEvczBvbXc1VmZCM0R2bHo2QytRbFN3WlZDazBOcFFCdUlB?=
 =?utf-8?B?bERUMU95VEN0MmtkYWFuOE9qVDlvTk5ncGVUdlF3cHNJeVk2QlpyV2xSWFRE?=
 =?utf-8?B?TGlUeFFFV1V2ejNQSlNzeTV3QUZERnhDbWhqQXFnUVBTZ29GcWpyc1ZNMnBM?=
 =?utf-8?B?OFdlbVg3d1FQQWtKelVZVlZhRXpGeUo5WUFIWG1Jc3ZMSmY5dUxqTkZMajZH?=
 =?utf-8?B?Z2IycHRwZExWQUlMQnlJbEhaU2N0eVg0S1ZTTkpZUk5FblBvUkFPUGlHaU5I?=
 =?utf-8?Q?u1815bdExJ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L05qcHpBa2dKT1FwN1ZhVGRNWURXZGtlSzZDaDdnZVJYWC84dVY2UnU0dUxH?=
 =?utf-8?B?dm5rTWxkUWJVL0JXc2RMWWtFVWZRdFI5ajZsQmVhSWJIbjBvQVVzekhWT3V2?=
 =?utf-8?B?V1Q2T2FmU3p1Y0JYbXA5bHJWL2oxcG8vT0lkTkdEazBaNUc3czI1VXB0M25K?=
 =?utf-8?B?M3ZTNVlXQmV2eXdDTXBDeWwwNFZ0YWdZNkxEc3phNmlCT2dweWU3dlFtNUJK?=
 =?utf-8?B?TndUTEV3ajBQaHpLNk1paC9tV0Q2cGkxbHpXRVB1YmxtRkY5ZW1LWmQ4czBR?=
 =?utf-8?B?MURaemVSNEozMkhzckl2M1JvMXBRZ1NoczNzTXc5RVhTaTRSRDk5YnZTNTEx?=
 =?utf-8?B?NjN1eGczOXBqUmZjbFY4ODlqd2p1d1BBbklsR0I1YTA0Q3RqU05wTnczNlAr?=
 =?utf-8?B?dml5ME5KQkdyWTNiVi9XUndMRTRVN1FRSk5xdDl4RTNxSjRFRnJHZ2E4a01L?=
 =?utf-8?B?WWR4YVkwa2VqOXduZWpjVi9yaEJ4UWhMQys1eldPaC9OaVJocjk0SjNkUjVz?=
 =?utf-8?B?Q2JkN1I2SE5UYWZIdkdmdWk5T3BkM3BiM2NFY3JydnYrNUlEZ1k4U0lHTDJX?=
 =?utf-8?B?KzkrbmFyaSs1NDB0M1k3VGFzdW1YcjRCWW9NVG9rK1BsT2wvczZzbEJmSE5u?=
 =?utf-8?B?RUVwOXE2RTNPWEF5UU5ISDdDdkV0c2xBNVpCanJsb3k3MFg4V2Y5TEplb3ZF?=
 =?utf-8?B?VTlhcXZ2RHZDemswaDRMZCtBMDh3TElmaXljMENEVVpybU1JWXpWa0srK2l1?=
 =?utf-8?B?enowRW0yT2R4WldvZTNncWROZ3B3TmhobHNYRUFZS1lENitQOXRFcGhhN1RM?=
 =?utf-8?B?VGx3SldQRUNaS1FqaWZYTG5oVVF4d05hL1lEME0vVWlVVGhSa1Z3OXg3ckNa?=
 =?utf-8?B?V3VJdEV3NFlpVStlSnFYSm5Yd2hocjU5R1JWT2M3ZG9SVVlzL3Q2VU1TSmh0?=
 =?utf-8?B?QlVrU2pvMkp0d1RRUUU2WXIyVUF1aENzZ0VySitLK3NMK3AvWFR3T2FwM0Jl?=
 =?utf-8?B?VlEvNzVtQTRHTTJ2Y09TM2ZONzVNQlFSV2VRQ3d2Q2tXS3dxekxSK21YN2Y1?=
 =?utf-8?B?VDJnaFFLU0FOdnZvaVBrWkJNd2FhdWEydXVNYzAwK3h6L0dqSjFZM2tud1B6?=
 =?utf-8?B?SGdBYjN2eUJMTjltT21ENk5OVFFSMnFWUzYxd014TzRKM1c4TUNwaHdWeGhY?=
 =?utf-8?B?N3N5K2lHMDBxOXloWFYrWWFGZ1JoSS9sMzJMelA5YU85aGo2cTNZSUpiNWNB?=
 =?utf-8?B?alBmQXZqSjdSajdUQ01WRFFaVmZ0d1ArOXBHSHp5a01TbjFQYkRJY1pWUnBS?=
 =?utf-8?B?c1JnaG45bWlybXp3U0xmaVg0TjNNM2hyeURGUS9KMDlGdjduY0RYbW8wYTBI?=
 =?utf-8?B?NG5COVA2cmlzN3Y5RExQZUg2YTdMaUN4SVk2LzBpTHZvUENMLzFVdnhkMVF4?=
 =?utf-8?B?dWhWTkN3dStmN3pseUZPUkFMMVdIYmF0YzJjKy9QcFU2T3MwNlNLSU9TRWtT?=
 =?utf-8?B?amNFeU53TVYwOEhraEluNFVQdVAremNhRW01Sm1xMk1iVm5oYkZ1Ni9DNitG?=
 =?utf-8?B?eXBRaHQvTFA0OW5ia3dTRzVHTlhHdGJlK1dSeGordUlQR2s2OGdSVkkwS2l4?=
 =?utf-8?B?S1pOeVlWZkVKUGlqSThOSzhCbTRoQUVld3ova2lwRXFlV21uci9SbDI3UTll?=
 =?utf-8?B?WEx0dXh5OE5MM29Ka0ZoeE40Zkh2SzcrbW9ZZURrbXdVUmhzY20xOVBaYk1W?=
 =?utf-8?B?aTNFdXpaOTAwWGZiaGJvaEl4RmNzRDNKQm5ndTc0T09iZm0zV0tJMTJSbnl2?=
 =?utf-8?B?a3EwMDNGckhjbVRIU21VcURhWkU4b2JuSUN5ZEtQcG11L0ZaSy9aNW56MkU5?=
 =?utf-8?B?MFlhWXF0SmJCYmZneUFsSmt3NUpPcEhuTkRlVEttQ1dSWFhSenNRdTdwQXNE?=
 =?utf-8?B?NDZDV05hSXhFdEd3Q2ZMRVpBUCttYmJjdlV2UXFqa2sxR2pTNzlDRHBpRW1a?=
 =?utf-8?B?cXNGYTU1cSt5cnAvRWJOT0lTZW5MSzhmQ052NVc2M3RsZHZPSlVCdmo1aHN5?=
 =?utf-8?B?dytEVnJFUkpMc3RjcE1VTE44U2ZEM3piZVFteVNPRjZvSHE5bzBKTzRhM3M3?=
 =?utf-8?Q?m1bmMGs8gzCNjMDRUTPzJvT4n?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799a69ea-82d0-4391-9dcd-08dda1ff5b30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 18:00:27.6815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2/vBjW2pTR1LrTP1owa/9GIeqrc/k09eUjpLWGgImDJswSBdWWyncmD7Mj3lq95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
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

On 6/2/25 17:25, Tvrtko Ursulin wrote:
> 
> On 02/06/2025 15:42, Christian König wrote:
>> On 6/2/25 15:05, Tvrtko Ursulin wrote:
>>>
>>> Hi,
>>>
>>> On 15/05/2025 14:15, Christian König wrote:
>>>> Hey drm-misc maintainers,
>>>>
>>>> can you guys please backmerge drm-next into drm-misc-next?
>>>>
>>>> I want to push this patch here but it depends on changes which are partially in drm-next and partially in drm-misc-next.
>>>
>>> Looks like the backmerge is still pending?
>>
>> Yes, @Maarten, @Maxime and @Thomas ping on this.
>>
>>> In the meantime, Christian, any chance you will have some bandwith to think about the tail end of the series? Specifically patch 6 and how that is used onward.
>>
>> Well the RCU grace period is quite a nifty hack. I wanted to go over it again after merging the first patches from this series.
>>
>> In general looks like a good idea to me, I just don't like that we explicitely need to expose dma_fence_access_begin() and dma_fence_access_end().
>>
>> Especially we can't do that while calling fence->ops->release.
> 
> Hm why not? You think something will take offence of the rcu_read_lock()?

Yes, especially it is perfectly legitimate to call synchronize_rcu() or lock semaphores/mutexes from that callback.

Either keep the RCU critical section only for the trace or even better come up with some different approach, e.g. copying the string under the RCU lock or something like that.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>>> On 5/15/25 11:49, Tvrtko Ursulin wrote:
>>>>> With the goal of reducing the need for drivers to touch (and dereference)
>>>>> fence->ops, we move the 64-bit seqnos flag from struct dma_fence_ops to
>>>>> the fence->flags.
>>>>>
>>>>> Drivers which were setting this flag are changed to use new
>>>>> dma_fence_init64() instead of dma_fence_init().
>>>>>
>>>>> v2:
>>>>>    * Streamlined init and added kerneldoc.
>>>>>    * Rebase for amdgpu userq which landed since.
>>>>>
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com> # v1
>>>>> ---
>>>>>    drivers/dma-buf/dma-fence-chain.c             |  5 +-
>>>>>    drivers/dma-buf/dma-fence.c                   | 69 ++++++++++++++-----
>>>>>    .../drm/amd/amdgpu/amdgpu_eviction_fence.c    |  7 +-
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_userq_fence.c   |  5 +-
>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c  |  5 +-
>>>>>    include/linux/dma-fence.h                     | 14 ++--
>>>>>    6 files changed, 64 insertions(+), 41 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>> index 90424f23fd73..a8a90acf4f34 100644
>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>> @@ -218,7 +218,6 @@ static void dma_fence_chain_set_deadline(struct dma_fence *fence,
>>>>>    }
>>>>>      const struct dma_fence_ops dma_fence_chain_ops = {
>>>>> -    .use_64bit_seqno = true,
>>>>>        .get_driver_name = dma_fence_chain_get_driver_name,
>>>>>        .get_timeline_name = dma_fence_chain_get_timeline_name,
>>>>>        .enable_signaling = dma_fence_chain_enable_signaling,
>>>>> @@ -262,8 +261,8 @@ void dma_fence_chain_init(struct dma_fence_chain *chain,
>>>>>                seqno = max(prev->seqno, seqno);
>>>>>        }
>>>>>    -    dma_fence_init(&chain->base, &dma_fence_chain_ops,
>>>>> -               &chain->lock, context, seqno);
>>>>> +    dma_fence_init64(&chain->base, &dma_fence_chain_ops, &chain->lock,
>>>>> +             context, seqno);
>>>>>          /*
>>>>>         * Chaining dma_fence_chain container together is only allowed through
>>>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>>>>> index f0cdd3e99d36..705b59787731 100644
>>>>> --- a/drivers/dma-buf/dma-fence.c
>>>>> +++ b/drivers/dma-buf/dma-fence.c
>>>>> @@ -989,24 +989,9 @@ void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>>>>>    }
>>>>>    EXPORT_SYMBOL(dma_fence_describe);
>>>>>    -/**
>>>>> - * dma_fence_init - Initialize a custom fence.
>>>>> - * @fence: the fence to initialize
>>>>> - * @ops: the dma_fence_ops for operations on this fence
>>>>> - * @lock: the irqsafe spinlock to use for locking this fence
>>>>> - * @context: the execution context this fence is run on
>>>>> - * @seqno: a linear increasing sequence number for this context
>>>>> - *
>>>>> - * Initializes an allocated fence, the caller doesn't have to keep its
>>>>> - * refcount after committing with this fence, but it will need to hold a
>>>>> - * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>> - *
>>>>> - * context and seqno are used for easy comparison between fences, allowing
>>>>> - * to check which fence is later by simply using dma_fence_later().
>>>>> - */
>>>>> -void
>>>>> -dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>> -           spinlock_t *lock, u64 context, u64 seqno)
>>>>> +static void
>>>>> +__dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>> +             spinlock_t *lock, u64 context, u64 seqno, unsigned long flags)
>>>>>    {
>>>>>        BUG_ON(!lock);
>>>>>        BUG_ON(!ops || !ops->get_driver_name || !ops->get_timeline_name);
>>>>> @@ -1017,9 +1002,55 @@ dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>        fence->lock = lock;
>>>>>        fence->context = context;
>>>>>        fence->seqno = seqno;
>>>>> -    fence->flags = 0UL;
>>>>> +    fence->flags = flags;
>>>>>        fence->error = 0;
>>>>>          trace_dma_fence_init(fence);
>>>>>    }
>>>>> +
>>>>> +/**
>>>>> + * dma_fence_init - Initialize a custom fence.
>>>>> + * @fence: the fence to initialize
>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>> + * @context: the execution context this fence is run on
>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>> + *
>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>> + *
>>>>> + * context and seqno are used for easy comparison between fences, allowing
>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>> + */
>>>>> +void
>>>>> +dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>> +           spinlock_t *lock, u64 context, u64 seqno)
>>>>> +{
>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno, 0UL);
>>>>> +}
>>>>>    EXPORT_SYMBOL(dma_fence_init);
>>>>> +
>>>>> +/**
>>>>> + * dma_fence_init64 - Initialize a custom fence with 64-bit seqno support.
>>>>> + * @fence: the fence to initialize
>>>>> + * @ops: the dma_fence_ops for operations on this fence
>>>>> + * @lock: the irqsafe spinlock to use for locking this fence
>>>>> + * @context: the execution context this fence is run on
>>>>> + * @seqno: a linear increasing sequence number for this context
>>>>> + *
>>>>> + * Initializes an allocated fence, the caller doesn't have to keep its
>>>>> + * refcount after committing with this fence, but it will need to hold a
>>>>> + * refcount again if &dma_fence_ops.enable_signaling gets called.
>>>>> + *
>>>>> + * Context and seqno are used for easy comparison between fences, allowing
>>>>> + * to check which fence is later by simply using dma_fence_later().
>>>>> + */
>>>>> +void
>>>>> +dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>> +         spinlock_t *lock, u64 context, u64 seqno)
>>>>> +{
>>>>> +    __dma_fence_init(fence, ops, lock, context, seqno,
>>>>> +             BIT(DMA_FENCE_FLAG_SEQNO64_BIT));
>>>>> +}
>>>>> +EXPORT_SYMBOL(dma_fence_init64);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>> index 1a7469543db5..79713421bffe 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
>>>>> @@ -134,7 +134,6 @@ static bool amdgpu_eviction_fence_enable_signaling(struct dma_fence *f)
>>>>>    }
>>>>>      static const struct dma_fence_ops amdgpu_eviction_fence_ops = {
>>>>> -    .use_64bit_seqno = true,
>>>>>        .get_driver_name = amdgpu_eviction_fence_get_driver_name,
>>>>>        .get_timeline_name = amdgpu_eviction_fence_get_timeline_name,
>>>>>        .enable_signaling = amdgpu_eviction_fence_enable_signaling,
>>>>> @@ -160,9 +159,9 @@ amdgpu_eviction_fence_create(struct amdgpu_eviction_fence_mgr *evf_mgr)
>>>>>        ev_fence->evf_mgr = evf_mgr;
>>>>>        get_task_comm(ev_fence->timeline_name, current);
>>>>>        spin_lock_init(&ev_fence->lock);
>>>>> -    dma_fence_init(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>> -               &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>> -               atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>> +    dma_fence_init64(&ev_fence->base, &amdgpu_eviction_fence_ops,
>>>>> +             &ev_fence->lock, evf_mgr->ev_fence_ctx,
>>>>> +             atomic_inc_return(&evf_mgr->ev_fence_seq));
>>>>>        return ev_fence;
>>>>>    }
>>>>>    diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>> index 029cb24c28b3..5e92d00a591f 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
>>>>> @@ -239,8 +239,8 @@ static int amdgpu_userq_fence_create(struct amdgpu_usermode_queue *userq,
>>>>>        fence = &userq_fence->base;
>>>>>        userq_fence->fence_drv = fence_drv;
>>>>>    -    dma_fence_init(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>> -               fence_drv->context, seq);
>>>>> +    dma_fence_init64(fence, &amdgpu_userq_fence_ops, &userq_fence->lock,
>>>>> +             fence_drv->context, seq);
>>>>>          amdgpu_userq_fence_driver_get(fence_drv);
>>>>>        dma_fence_get(fence);
>>>>> @@ -334,7 +334,6 @@ static void amdgpu_userq_fence_release(struct dma_fence *f)
>>>>>    }
>>>>>      static const struct dma_fence_ops amdgpu_userq_fence_ops = {
>>>>> -    .use_64bit_seqno = true,
>>>>>        .get_driver_name = amdgpu_userq_fence_get_driver_name,
>>>>>        .get_timeline_name = amdgpu_userq_fence_get_timeline_name,
>>>>>        .signaled = amdgpu_userq_fence_signaled,
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>> index 51cddfa3f1e8..5d26797356a3 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_tlb_fence.c
>>>>> @@ -71,7 +71,6 @@ static void amdgpu_tlb_fence_work(struct work_struct *work)
>>>>>    }
>>>>>      static const struct dma_fence_ops amdgpu_tlb_fence_ops = {
>>>>> -    .use_64bit_seqno = true,
>>>>>        .get_driver_name = amdgpu_tlb_fence_get_driver_name,
>>>>>        .get_timeline_name = amdgpu_tlb_fence_get_timeline_name
>>>>>    };
>>>>> @@ -101,8 +100,8 @@ void amdgpu_vm_tlb_fence_create(struct amdgpu_device *adev, struct amdgpu_vm *vm
>>>>>        INIT_WORK(&f->work, amdgpu_tlb_fence_work);
>>>>>        spin_lock_init(&f->lock);
>>>>>    -    dma_fence_init(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>> -               vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>> +    dma_fence_init64(&f->base, &amdgpu_tlb_fence_ops, &f->lock,
>>>>> +             vm->tlb_fence_context, atomic64_read(&vm->tlb_seq));
>>>>>          /* TODO: We probably need a separate wq here */
>>>>>        dma_fence_get(&f->base);
>>>>> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
>>>>> index 48b5202c531d..a34a0dcdc446 100644
>>>>> --- a/include/linux/dma-fence.h
>>>>> +++ b/include/linux/dma-fence.h
>>>>> @@ -97,6 +97,7 @@ struct dma_fence {
>>>>>    };
>>>>>      enum dma_fence_flag_bits {
>>>>> +    DMA_FENCE_FLAG_SEQNO64_BIT,
>>>>>        DMA_FENCE_FLAG_SIGNALED_BIT,
>>>>>        DMA_FENCE_FLAG_TIMESTAMP_BIT,
>>>>>        DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>>>>> @@ -124,14 +125,6 @@ struct dma_fence_cb {
>>>>>     *
>>>>>     */
>>>>>    struct dma_fence_ops {
>>>>> -    /**
>>>>> -     * @use_64bit_seqno:
>>>>> -     *
>>>>> -     * True if this dma_fence implementation uses 64bit seqno, false
>>>>> -     * otherwise.
>>>>> -     */
>>>>> -    bool use_64bit_seqno;
>>>>> -
>>>>>        /**
>>>>>         * @get_driver_name:
>>>>>         *
>>>>> @@ -262,6 +255,9 @@ struct dma_fence_ops {
>>>>>    void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>>                spinlock_t *lock, u64 context, u64 seqno);
>>>>>    +void dma_fence_init64(struct dma_fence *fence, const struct dma_fence_ops *ops,
>>>>> +              spinlock_t *lock, u64 context, u64 seqno);
>>>>> +
>>>>>    void dma_fence_release(struct kref *kref);
>>>>>    void dma_fence_free(struct dma_fence *fence);
>>>>>    void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq);
>>>>> @@ -454,7 +450,7 @@ static inline bool __dma_fence_is_later(struct dma_fence *fence, u64 f1, u64 f2)
>>>>>         * 32bit sequence numbers. Use a 64bit compare when the driver says to
>>>>>         * do so.
>>>>>         */
>>>>> -    if (fence->ops->use_64bit_seqno)
>>>>> +    if (test_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags))
>>>>>            return f1 > f2;
>>>>>          return (int)(lower_32_bits(f1) - lower_32_bits(f2)) > 0;
>>>>
>>>
>>
> 

