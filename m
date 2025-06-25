Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71970AE856A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 16:00:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F61F10E732;
	Wed, 25 Jun 2025 14:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bQVXiu61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B4E10E6DD;
 Wed, 25 Jun 2025 14:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YN19Ytua0n9sXbYZ4GaLbWqOZLDQFjTgk+HCevJalRTeD33Fpz/t+6o/pL0QGWI19WQxS6EtKpalETVE0x0XVp2m9eK8Di9rz3e4Cz6pdI3d1SPr4JexU8Ua8z+FM32OlJG1/CXSr25TrY8KHK1uM837utQgVGEisq6uS1QqKnZzHGuwvG2wl7IK2vFAKR17GaXhX8m3kV5y60d6r2ajg3kC1oZcXId07x/4RT6B7aL8lbBR/N2o0XMCHg75TrR6VPD4KSGioBa59fJTBAqzhTu/cxQ8WkNbcied46Ur8tZgqmD48i81Hw+Udf6PX68nJxFgZMpTxetj8Tk065J/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+s3Y6PNS/J46iISUY96T7GBJWf9AYH5+XreSaR63yA=;
 b=oN/wiPbpF5ZXqGOEPJL1/JusIK2ydfnHWB/tz0dc1Pz12jPlf/O/JuafHgbKJhi7YUsdu2V0P+p0SiaOWqo4Y9dJiONXJl5NdvT0wA16Mic5rCz95bd1ZlWiU0YGE72BlaqJKYqrDbIh2Su0WQvTQoFhw2LI+q9KAD31jJL+E+d17pGUl+Sz9uwSpNmA49Wy37hPknW4EVyRdAoBaSwO89s9cPY4mH3cFZQtOn3hUBGOQdl0AHReE8dZje0qTyJOr8gp8ndwhvo6GfB3VcqQ3pl6vkV1M1BLkV0W6dQpb+4D1FxCQGRDOXMtpDFM3rWylhbhax7iOx5GkGyWu4XhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+s3Y6PNS/J46iISUY96T7GBJWf9AYH5+XreSaR63yA=;
 b=bQVXiu618EXxpff7XdONE2arYrfXJS2DJ3J2KNETZAIttqPCh167jrVCriMmoPuqkqdfB9++Jx6fw1+99cPVlVCljB42+YhvPsQA2ylC3lE8kF/0qkrCANxlHxThX8CETxSt51Ofgzl2B1WfURiq5jluro/DMXVX+2ZZcinFlTQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 14:00:24 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 14:00:23 +0000
Message-ID: <c128d6d1-560d-4b97-b448-f7bdff464602@amd.com>
Date: Wed, 25 Jun 2025 10:00:20 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: disable CRTC degamma LUT for DCN401
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250511213847.61930-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250511213847.61930-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0187.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:110::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: a56f1605-3690-47fc-1220-08ddb3f0a0e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djh3TE9mSThuU1hMdG5DbGZmdmpaS1VDbktTd1dBOTdVTm9uMlFTSWZMcS9W?=
 =?utf-8?B?VHppUEdjdWo5UHZJVGk0Tzl5UkJMNjRsSTNQaUZkMjlUNGIwZVdnVm1WejBj?=
 =?utf-8?B?NlRWYWRhZ1IxZXV5bVhBcDkvM3Q0WnNyU3pSbjh3Y2RTOGhWTnk1UGVTei8z?=
 =?utf-8?B?WW5yZk11RXVON0xTQmJPWTcwRUNIdElOUlREMmZ4R09aYW1iVlp6QWdYdGZo?=
 =?utf-8?B?UkJkbkpUMEpybTJkVW1IRU5UL3ZEbjl6N0xVTStiemdmWWdhcVA4T2ZyS0ZL?=
 =?utf-8?B?a3hDUnQyNm9GMURDd2hxYzRtMUxTTyt2djVlWGJlZ0lqNmRYbVdsS2pvYndG?=
 =?utf-8?B?WUhXS0hGMzZrMWJVMHk1cFZBTU9CeS9acWZFblUxRlJVU3FmSE1GbkMwNWVL?=
 =?utf-8?B?YnRTRGhnamM5N1BVUEMxODZWdU1TaEFmTHhPSHRVOWIrQ0RwRkQ2T29Ca0tj?=
 =?utf-8?B?djVzSkwyNUJtMHVYTVowR3R2NjRRbW9maXYvSXN2M1pIVFBieXNjazk0dWRy?=
 =?utf-8?B?enZFNUFMQUQxRXczaUcyc0xwdnFPcGVmUWh1dVBjL3BOUWdLYWRPL09ETS9x?=
 =?utf-8?B?a1ZIZ0Q0RWxRN1liZjBTRy9Jazhia244TU1sbGYvTnN2dlBDaUNDVWxBbWFh?=
 =?utf-8?B?bVhrUG9HVG5OM083UXFZZ3BKNkhIMzJsZFlIZmF6emczSVlMY2V5ckNLaEhj?=
 =?utf-8?B?ZXo5b3ZVZ2pHMEFXUkFaem1aN1N1UjdEa2srSXljYXNpSjZrTFhMVXZubzNn?=
 =?utf-8?B?R2hJWFBBY1BFMk0rSVpMZ0ZuTFk5TmQxZStsS1Q3MS9ETEszRHdxdkJoKy9S?=
 =?utf-8?B?M0dDOG5tSGxuQ3QrMTV1MFYwL1ZIckVzZWYzSlRrQURmWWVnVHNjcm1hYjhm?=
 =?utf-8?B?eDFZczdqWjQ0WW1wU3RRaWZuVjVnZVJZK0VpV0ZkUVgrZ1Rvc3RwRVVZMm5Q?=
 =?utf-8?B?ZXlCOWpQd2dyd0hBay9FS3g3c1NTWHJOd3JyYzhZVUdXRkkzdE1JZHJZU01Z?=
 =?utf-8?B?bHVlKzRHdTJ4SjlRWjZTaGdQWk1HWGMxYUFmay9hbHJTL2FvbHltdXE4cUJK?=
 =?utf-8?B?VlFySkJmSWtoVS94clZEUm91MllUUzJCaHhnRTZrUEc2dW5NeW5nRmZ1VU1a?=
 =?utf-8?B?YU8xMGpoWEVhVUo3R3AyRXRBVDNiaGtnMHl6UFVJalNMOTNGeEF1dlg0U1B2?=
 =?utf-8?B?S1EwaGJ4RURLbm0zR0xlVVYxZjAvb1BtQlFvOEJ1SWlsNjRZSmt5NUxiYnRs?=
 =?utf-8?B?blJMUVZJQ1lUNm91UDlnczdXY01JTnJmSjJZMmRUUnZaUG9yaWdxcG1tY2p3?=
 =?utf-8?B?aDRSMEU0bmQ3d1ZmeVB6OGZIZjh5L1B0ZUk5Zm1iMDlXL2V5UE1Wb1cvdEYw?=
 =?utf-8?B?VU03dWRKTVRkM2ZCZ2V4KzVHUmhvRXVCTlUzMjIrczJKMm9IN1ZTemM4UUsv?=
 =?utf-8?B?OFdFQUgwS2U3Vis4dlZ5RnRmKzJIZU93L05FUUhTTkV6c2dUK0dwYjNOMHJt?=
 =?utf-8?B?LzV2RUJzLzhGczJkQnFKQzBXMXlQNWJzbHdUOCsweTFUekF6ejBTZVVXK0xl?=
 =?utf-8?B?ZFhiS1dJL2d4bzMvNURYRnIzeWwrSFExcXZQQ2NFWWl2alA1R0psNHQ4Nmdk?=
 =?utf-8?B?NWg2UTBtV2ZybmEzU3dTd3dSNmhyWUVFM1VlUEZUbzhoY0Rpc3ExMVhnNXBt?=
 =?utf-8?B?MVNyNHBCcmR5S2tyRjF3a290OEsyYkI1QmxObllocnlINTI4MzFkdUwzRWlu?=
 =?utf-8?B?WGxhNDREWGkrb0RxeXFVaVBMdGxoWFdjTmt6Nnlpd3NQOFNUOXE2VmFsOVV0?=
 =?utf-8?Q?iNkfTh0LafvVs8S5y1MaPDT4Dtdu0YH5FE7zI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHUzQWUzZit4R0VKYnhnWXd2WmFjVThNdDhjK3JLYjFyamhyYWxjOEZyZkZi?=
 =?utf-8?B?VU9NYTJPSmhTNmo2Mi9oNXV3TUhpaE5zOVZ1MWZMRE5Zb051cUpWbGljQTZJ?=
 =?utf-8?B?U3I2ZUJCNzlxWG9iNzZySmRYUHlkdTRLc0dGWGZUZjBickI4UTJUZDA3ODFy?=
 =?utf-8?B?TVEzbCt3clFpbkdPeCtKUnZzNG4xUlJ1QS92RmlONUNMcUNTK0llMmt1RmJQ?=
 =?utf-8?B?ZnFObzYxOHJBbFVWUk94NGRmTVgzT1RHZTVjTWIvMjkxbWhiek1QRU5SWkh4?=
 =?utf-8?B?dWtCcmFjSnRGNEFnTXVRWHRuejVlSGo2WGlUVXZZZ3ZkbnlFTVZvaFpvOTJv?=
 =?utf-8?B?WkllRDZkTjUrQXBBSXAxTUpYdnZkMVpkMXFKRVI3VmVZeCs0QlVCYktNL3FR?=
 =?utf-8?B?aGE2ajNudjR2eG1DUWxrUlZ6YURhdHdSZHlDMjgxVUFDODl2Q2RjbW9lUkJX?=
 =?utf-8?B?RTRsUzhBRUVabVBBV3RnUlcxeTR6UGZHQ0ltdmovaTZVNEEwbGFYek8rWmkx?=
 =?utf-8?B?KzM0aWpoa28zTUtIZzJpVmZROXd2ZjJvOUhJZjJnSWE2cFQ0cFhqYUc5NzYw?=
 =?utf-8?B?WTNQNDUwdHR1OHVDUzR6U2QydjVxNG4zaWtYNUxPL3NseDBCUXgrRmxLLzJ4?=
 =?utf-8?B?UHRUVkl5a2FlNDVkUFhZTWVRYmo5UldUSUNmM2dEQytWK1g1d2pCZmhvNGtl?=
 =?utf-8?B?YjI2TnhuU2lRcTV1bCt4TzRxcFoxUjh0UFhrWWxGOFZWN2lHeDBGRDBZcktS?=
 =?utf-8?B?Vm11ZUdtLzRkU0t1WmY1bzYxVlQzSWMvM3M3TzkrdWxLK1NkY0N0Q3QvbThR?=
 =?utf-8?B?TENKZUt3cU9CNWlCUUpyYzVvQ1hBYy82bytwNWNGRCtHVU0zYk9qWmkwTjNp?=
 =?utf-8?B?U1NlT011TEx0ak5DZmcvdVc5Y2hUUTQ1emVJYnRyTy9FU1d0MkVzZThlNmp3?=
 =?utf-8?B?dkF1MnpwWHoyZ1lzc1pvRDJYeFppblZESTdDTDNpR1poeXpwSFlwRk5yYlhV?=
 =?utf-8?B?Wk55V2NSU3dqS25SWmxiVW05Mjk4YnpDdjBSNDl1ZlpyNDZKOEFNU2pqM3Ix?=
 =?utf-8?B?Sm5CV3dmVWVrQ3JHc1BuVFI4TUlPQktpNXh4T1lPcGxma3pqMjhZNy9lLzJS?=
 =?utf-8?B?M0dSaG44amhpN0ZGdk5OeUREcGZRS1V0c3Aydnl3bkl4NzZQUG9qd2Q1U1lo?=
 =?utf-8?B?Z01pYUxKVmNrK211RFF4Q2hsWUovTkRTbzR6YlgvK2ZBSnJpbDZ3aWNsZDhU?=
 =?utf-8?B?YXNuMk1KSTFscVE0akRNRnRHdmVNZTBmUkNYa1RGdjN6Y3d5KzhqZzdCRFRm?=
 =?utf-8?B?b2ZaM3JUc3ErcW5rWHdPK3BEUXlaakUyNDlIUUlkbHhveTdGelI2ZnNqVjhw?=
 =?utf-8?B?c04xT1RRTS83MENtOUlMTjFqendlTGg1L3hJazNUU29wSDNONUJPUnZqSGo1?=
 =?utf-8?B?QmV1azIxU3BoaUp0RFU4cWJwa3BHZCszS2dCeElIeHZLdmhmWFBaRDhOYkp1?=
 =?utf-8?B?SksvMGViWUJBaVU1aHpLUnAwNENvWHBka1Y3TytQaDVxM3krQmMzYTM1Tktn?=
 =?utf-8?B?RE1DUmNSZ2pvYzkxVEJRdktOakphbkF4YzBLbmlTTUZSYitraW94TUw0RUhu?=
 =?utf-8?B?T05LUlRDVFMzMjNURkFwa3R3eGdzTS9PZ2RZeEd1TFUyOXJocTZ1VEVUSjZl?=
 =?utf-8?B?WGpFbGRMMDBLNkFrZC93VU02aEF6Ky9XemZVOUhGWGZ0elBYbDNkdVBVVjQz?=
 =?utf-8?B?NmVpMUh5eE9JU0VpN21FN3JzcVdMSlVjZGJHb2x0U1pBcnR3dEkvSUxKTlhE?=
 =?utf-8?B?TnFoMHpxNEtuZGVFOWc2MzdCYno0WEF3MzhwRm5Ecnd5MHBqSWhEUmQwTHEv?=
 =?utf-8?B?S01lN0NuQXErWXF1TTZZT0hRemsxOXNCT1J4Tmt1ZUlHUVZYY2ptKzZyQzFo?=
 =?utf-8?B?aHduaXIrK1BBSEluc3VQSk9NSDVWcm9Vdm1JL3ZGeElremhjL0c2S0NmQjBV?=
 =?utf-8?B?ZXJhOStWNFA3bmtEa255QnV2Z0pvQlUvQTNmNXR4VkNwRGxQWDFMRUVaNmNh?=
 =?utf-8?B?enNHZFViU3RFTHBzcnNUOEQzUE5wNExxdjN0MTAxZW11ZS91OEJucW1yYzBU?=
 =?utf-8?Q?DRoyTS4zXj3EU1zyvsRv9cRwC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a56f1605-3690-47fc-1220-08ddb3f0a0e4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:00:23.1161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZr9WWxtUHboNuBEjdaKAPWGyoLl2tqziooyVUjF8l4qG05XgN1QgS3RKwcuKz7ysc6R1GzzlVvUh+3wwzhmAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220
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



On 2025-05-11 17:22, Melissa Wen wrote:
> In DCN401 pre-blending degamma LUT isn't affecting cursor as in previous
> DCN version. As this is not the behavior close to what is expected for
> CRTC degamma LUT, disable CRTC degamma LUT property in this HW.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/4176
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Sorry, Melissa, for the late response. I though we dealt with
this patch already but it looks like we didn't.

Thanks for the fix and your detailed explanation.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> 
> Hi,
> 
> When enabling HDR on KDE, it takes the first CRTC 1D LUT available and
> apply a color transformation (Gamma 2.2 -> PQ). AMD driver usually
> advertises a CRTC degamma LUT as the first CRTC 1D LUT, but it's
> actually applied pre-blending. In previous HW version, it seems to work
> fine because the 1D LUT was applied to cursor too, but DCN401 presents a
> different behavior and the 1D LUT isn't affecting the hardware cursor.
> 
> To address the wrong gamma on cursor with HDR (see the link), I came up
> with this patch that disables CRTC degamma LUT in this hw, since it
> presents a different behavior than others. With this KDE sees CRTC
> regamma LUT as the first post-blending 1D LUT available. This is
> actually more consistent with AMD color pipeline. It was tested by the
> reporter, since I don't have the HW available for local testing and
> debugging.
> 
> Melissa
> 
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c    | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> index e8bdd7f0c460..db157b38f862 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
> @@ -737,7 +737,16 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
>  	 * support programmable degamma anywhere.
>  	 */
>  	is_dcn = dm->adev->dm.dc->caps.color.dpp.dcn_arch;
> -	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
> +	/* Dont't enable DRM CRTC degamma property for DCN401 since the
> +	 * pre-blending degamma LUT doesn't apply to cursor, and therefore
> +	 * can't work similar to a post-blending degamma LUT as in other hw
> +	 * versions.
> +	 * TODO: revisit it once KMS plane color API is merged.
> +	 */
> +	drm_crtc_enable_color_mgmt(&acrtc->base,
> +				   (is_dcn &&
> +				    dm->adev->dm.dc->ctx->dce_version != DCN_VERSION_4_01) ?
> +				     MAX_COLOR_LUT_ENTRIES : 0,
>  				   true, MAX_COLOR_LUT_ENTRIES);
>  
>  	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);

