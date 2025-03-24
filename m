Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 874E8A6DACB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:05:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB1010E147;
	Mon, 24 Mar 2025 13:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lHe7x68U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF29C10E202
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 13:05:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2aLCFAubDHlAbnbSI8EukzPqX12/cTa1nXPzpB8L5wnpPCHBQN1gxCzoMJzFk4SKyD11HR+s5ioANdGKmdP5VT961AWctOUK+7BRaqcyreu/RtzPq6YM3h+kIu5HSaFXoWxnPq4wfSKuXG/QSxkhD4EoXt3oIF9zv3ut81FgUmBH0nqM+IiQ1r5reX9QIYFrobEs5wWsdeQF5cBQukqgi22/vsAMrN9ptKpqAhnXqThbKbtdQsReffawNOKeolUo2uEIrh3RoLpIoMQk5GqOQGAVBI9inNMtiCdRLC4Uq/twLUJJkx+VboD6youKRwmIvFNTmGxQn8jUnAnDU0GMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpwJfsdpXLPsrJqQa/YdiIFkaLoFsUo22hbuD0pZeos=;
 b=ljqJ8/OQcw8e2jifxhaeAio5vDEFLgfbM0UXLSOjYbvVpfKzNPkEi2WUm/ZJtJG3yradklPnV2g8jL0JzgCRAcLys1EzchOW1/ObGoZhZPRLSSch0ObbOB0IkQtYt2KZY/e1wmopR03yH26JAWCCnqpldR2TlNdBOMZ4AiA4bU6NY33vaCAQzYZLQ/KPfiwv6MjMgd1L0/qwRJTSOQ/ucOAcG9a04GKkP1J2zfPYa58ay6IoSp0PX8KS2O6QdDv6WrKR1snSgxzsQJC1XHVKG6PySc8vbu8Y/lMO8otvm5QypFnZRX4a8JfJcZTmXcHNg4jWJRoLS6su9mOMB95q9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpwJfsdpXLPsrJqQa/YdiIFkaLoFsUo22hbuD0pZeos=;
 b=lHe7x68U+43J33RIC8CQZ9dG0iBS/tN7VLbhz64qxWitYWoon2vOBru/+/yweWxYnmbVKFDBUQl/ba2ynG9iXsP3h8SwLKos1S0LcHDhPZMd53URYA0d6hwqQplp+5OPum6O9yrzDEk9uFFINzBGTBtH2K+5gYjJhQieIFwwy0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5733.namprd12.prod.outlook.com (2603:10b6:510:1e0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Mon, 24 Mar
 2025 13:05:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Mon, 24 Mar 2025
 13:05:30 +0000
Message-ID: <e21e75a6-76a4-4202-bdff-bec73755229a@amd.com>
Date: Mon, 24 Mar 2025 14:05:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] drm/gem: Change locked/unlocked postfix of
 drm_gem_v/unmap() function names
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250322212608.40511-1-dmitry.osipenko@collabora.com>
 <20250322212608.40511-2-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250322212608.40511-2-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c69a2a-2ec5-442e-8396-08dd6ad48ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3MxZXJaZVJOQkhCWHh2THpQZ1dkaHlWeUVQcDJEcnBRTzV2aWhTSE0yNnh0?=
 =?utf-8?B?aDFCemdzeTlweDhZcEtJNHp1YzRzM3V0ZjMrMXlpOGRTOUJCN1U0L2pHWlNP?=
 =?utf-8?B?bkkrVFFyUTNWRGQ5ZXBqRFRHcFptSlNaTmw2ZHhuOCtMS2ZieW9LTWgrYWRS?=
 =?utf-8?B?V25JRGhHbDdFL09UbTBVeFVLS3pXKytIN1hMUTdvUWJ0U2ROY1VRMjk0UkdG?=
 =?utf-8?B?OCtFaVQvZVlMUDFVeWlPS0dEcmVSa0s3TmxCc1gyZlQvNUwrLzZxSHhhKy9F?=
 =?utf-8?B?Q2hjOWFSdjVobUw4WlFmZWpqZDRrNmlrLzFaUy9wRGM0UWdLS1BKbjI2NGtH?=
 =?utf-8?B?VHU5Y2pvbjMvaGsrRjQ2cUxyMHlKMHpBQllYMTFEMFdUYVRBR3YvZ20wUE9W?=
 =?utf-8?B?RHJKSmVxejYzV0kzRWdpRTZJYmROVnI5WUkyc0gwWXlrK1BYM2N2OVlmZWR2?=
 =?utf-8?B?Tjl4a2hrRXpUdlkyY2Q0c0M2Y2FPeDBzR3JKZU5yWlJhSGx3Zy9mK1Z2cUg1?=
 =?utf-8?B?NExTcXR0OEh5ME5lWnpPeVQ3NmhPWFpobmJ6MFdQK3lFRGRJOXhxMVlnMS9Q?=
 =?utf-8?B?eEdRTWdST2s2OFN5clZrZVkzNUNCNW5uWVFZSGc0VzczRTVkZ09XbEY2Zmg1?=
 =?utf-8?B?V1BiaW9iZmtIa25aaXdzQ3VkNStiTGIxakwzSVBPOERDSmJpNkxCNjdRZWJR?=
 =?utf-8?B?clFmQXlhWDN1dVR6ZXhiUDdjbWNkaUFTcTc4cjkxVm1mdG1scjRuN2QvZWFU?=
 =?utf-8?B?TzN3bkhrZFErZWNFeSs4MzFodU9GSVcvdFJ3RHdRYUFaZHZCVG9DcUN4Z2hO?=
 =?utf-8?B?dFgvY0FOTEJHVGE1WWxHVHRTM2duOXVkV2tWUXdKQzNsbEtkQWpibDV2Q3Rl?=
 =?utf-8?B?TE1SUUpCRkdjUnN3STRTRVZGalVYd09CQndhZEx4ZVBENUVCdEM4ekNjaFYx?=
 =?utf-8?B?dGdNakUrNkJ5YUpWZk91RXBKazhjeUhHY3RmTUdKWUttdkp0SThFdXhmVWZy?=
 =?utf-8?B?K2k3ellMSU9rSldPdWR5VTF0b09mUDJpWm9UUWx5SVdUcTNTdDFGUk0reXlB?=
 =?utf-8?B?UTdBRGlUY1pkT0dqTDYyK3ZkYlRyYlA2bXJtMVFzYXlEdzVRbDNidEV2K0I3?=
 =?utf-8?B?TFNkNU10RDVLdGRGcXpoVG4zYy82dnhmQnhHT1pHN1FJVVhMOWxwK0pqbUtC?=
 =?utf-8?B?SUMvT2l5OFB5alkwYkRDYmc2VnArOXIwZDNDZEQyNHRHb25hdmd5dVBYTWUw?=
 =?utf-8?B?eExSdzdnMFhaWmJUVEF2eG13anVadGI4aXhIUXpTRGVrb3V1cnFmczJVYTFn?=
 =?utf-8?B?VmZDZ0lMSWhuMjNidTh0cjRybzlONE9aRXlTNEtiSnU5cXJ2OHZkVE5HM1A2?=
 =?utf-8?B?MllTdDdpVG1xcVZSdCtkNDdFWHFDTmp6OFVqeDRKQU00elZNZ1BZSXV6OUc5?=
 =?utf-8?B?YzllVDROVURoZlpWaUxmd1gwcUxEQThwN2MwYlM0WHVGMWZiWWFqZ09Wdi9q?=
 =?utf-8?B?VFYrVnU2elF4Qk5ucmhac1VHZ3FwMWhrU0FsOUorR0pMYk50b2RqeVhWTWZY?=
 =?utf-8?B?enE0NndnWE9ISzZMaFR0NXhpTi9wM0NnOWlnNG83NHhJMktXRHVXd21PaE40?=
 =?utf-8?B?ZklaMnJuT1Y0Tk1FT0hWUXQwYW1ydW1LWGZvM0Y0VHVna3ZYeXFWS2ZsNUFR?=
 =?utf-8?B?QWptazN3dXo1SkN0cVNmeDltWkdvcWFSdEYxdndIelUvWVNMN2dQdlBQSlZP?=
 =?utf-8?B?Q0hxQ1kvWDVPaG5kNHk2NlFNeVNEMnlsZGZtemNQSVZjNit1dzJiVGVPekVM?=
 =?utf-8?B?Nm9GNnlObmI0bHM1RmptNGx5U1Q0TFVWTU9QTFlSaithVXp3VGE3OFZHcGph?=
 =?utf-8?B?aDZyYWNXRklJWDFNaGJMOXMySFFPaFNKS3pJZmwxUmxRbGxsTGMzRmZER3FB?=
 =?utf-8?Q?nHF/83bIltA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVFUOUpGemZCSXZwNVFMcW5jMDBhN2NLbDFOaWxVQlVjZldKbzRZMm9RTTRw?=
 =?utf-8?B?akZmc0R1ejE5dU16aXZ6NkorT2FQaVB0NEdKSXJwWngwcXYydExHNWx2bGRP?=
 =?utf-8?B?QWtLSno3aVNDV3VkOGU4SEVrNm4wQVZxL1MxckdNRVpFbzYwRGQzNC9uUzho?=
 =?utf-8?B?K0UvNDFDSU5sakhMMjg5U3dQREZMVlNGY1VPY3ZBQUdUKytKSFdaOTllUWJn?=
 =?utf-8?B?dG41U2x3aUJZVDhMcHRwWHZLR3cwU2trZkRuR2c3ZUJpZ2pFSlBWNWo3anBz?=
 =?utf-8?B?RUwveW9EbE5taXVUTEU4VmJZakRxQTVsWVBkRGlhRk9qaGpxZVJpRmk5UC9w?=
 =?utf-8?B?Rlk4d1pqN04wRnBlUUgrcG1yZnFmT2JPT1V5cUoyTXo3ZUhwNVg1NGtveHNO?=
 =?utf-8?B?VktodC9rTTZpd3ZIRmlCNG43Z01tLzhyZG5nTHFLelF3YlRleVdYbytOejJt?=
 =?utf-8?B?VW95QzNCVVdRU0tjZWR0aXAvMkZHRGJmSCtja0MvNFNTVXdyRzBWSW1LS1Ax?=
 =?utf-8?B?TGZYOCtLaW8xMHlpek9zR0ZZNzJiNnQ0Zys5RW8xWkVJOEpzY3d6ejhwbWpL?=
 =?utf-8?B?WEI2TFMvTTd1WnJkbnc1bFNNOWhBc2lhVnZsNkY5N0RWNTErbzFDWDhqeEY2?=
 =?utf-8?B?anF5WHBrTHdXdzJrNGhTTlNUTTVWK2t5dDRJMHFsNnVSNG9Ic0FndTRlUHVt?=
 =?utf-8?B?OTFVZUpFb0xpYW03MkpuRFBDcGNzNVVGanZKdTAyMWpMbjZZWGJWSGF2YTdp?=
 =?utf-8?B?R25uR3NKTmpNamJtWFBuK2VyZ09QNVRMRmRVVm9SQkw0akpmZXNzdXA0ckds?=
 =?utf-8?B?YmdwMlQrOGozY0VrWnloRTVndXhldzZLZkh4YjdsWkVsRzZiSEowUFA0NGpi?=
 =?utf-8?B?a1k3TXhMMEpTcE5kQnNNZ00xTm1zL1Z2RXBJSjduT0J4OXQzcENyOEFNbFFp?=
 =?utf-8?B?dG8zYTIvbmsxRnA5RzQ3OTY1QU16eUUrRk40aUdncTFjMXNDY0greTQ1bGtW?=
 =?utf-8?B?RmJxdDBxRXMvRG9QbzVCVDRaK1czQVlMcGk1Q3g3aXl4U3ZkTnBKV2x6Wk4w?=
 =?utf-8?B?ZEltK2xvMVRJdlNGRXJYTFBmaDJkczJPbE5VNitsRWJLQTVpVFdRSFJNOUp5?=
 =?utf-8?B?MWJCQnE2eklWemlxT0NsdjBYak81bUlvWEJrNlJGeDNudEZrbmNLTjEzczcw?=
 =?utf-8?B?SjdRbCtNNGRQY3BmR0VqU3VMcVJLTHBjVjNoTWE1cEFvRjRWNzFvZ2UxSWYy?=
 =?utf-8?B?NUZMS1FpZ01KVUl3Tms2dXl1MCs3UC8xZUtpQWkzZGFoa2dxNEFHMHorbURS?=
 =?utf-8?B?ckMvSHp3UThCL05MUldwN24zcjBWWDFuYktycGgyUVV0ZDFKYVdaK0hTY2Zq?=
 =?utf-8?B?UDRaajRuL0U2NXBsc2txTnFWRUprWTRHVUxaMy9qRmRPZmI3d0h4aTZjR3VS?=
 =?utf-8?B?VUtlUDF5QnNRMjFSZXplZGQxNDdWVHkwaUhLdmsyeGlxcWs1VDN1bzVOZ2ZE?=
 =?utf-8?B?REtWemNaTmM1UkhPVmVxSGFpT21NQkVxKzlNTHZEalB4V2pabFk4UFZLZ1NY?=
 =?utf-8?B?T29sMVNpL0w5azJPMVByRDJUcFhCTVA4VTE2QUVRdTlYbmx1SS9oSndHUW1s?=
 =?utf-8?B?VURtVEVIVlFGbHV1SUEvdjlrQWtSMnNnNUdoUDZkL2VpUEY0VWJPK2FpcUJG?=
 =?utf-8?B?YVNPd2FPTkZtYWI1b00wRFROUG5yZm0waGdxcUY0UXpST0JSS0RnU0V3bXhm?=
 =?utf-8?B?ZlJOWkNheFFNYWZnT1FyNUI4TjlJMUFqZlNpVzZFM0dRenpKa0JuRVBCODJF?=
 =?utf-8?B?S0doZnJyQzVMZnEvcytVL1phRzEzODFPN2RHaHczeUxHQzl2R1l4RGQ0VjM3?=
 =?utf-8?B?dVUrUGhaeW03b1I4YStHNEVGZmcyWWcyN1ZIS3BqcExZbEthdU5UeXMxZGd2?=
 =?utf-8?B?VjJUbG00WHZLVFVKeTZ1WWQ2REhUWUVhN2lTQzJ0Zkt5SE5yMzF0Z1RmSUNC?=
 =?utf-8?B?MHAxaXh1Mk4veHpyWXZ6enMrSWJobmVCN2swWTdRVmRzSkJkMXA3R3Z6OEMy?=
 =?utf-8?B?L2x3bVJlUjFWRHFKZitBZzdzc0kydXhoZkhhZThoSTFzbmZsTjdmNzNUa3pV?=
 =?utf-8?Q?CCsuyHcvCd+1bQ78E8cHmyjVb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c69a2a-2ec5-442e-8396-08dd6ad48ddd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 13:05:30.4047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDdIx0eHQIf1+llsABww3YiosBNMCVc8tSrqYjkG0WRJ5geUQXSxbRuWTmP0VmoR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5733
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

Am 22.03.25 um 22:25 schrieb Dmitry Osipenko:
> Make drm/gem API function names consistent by having locked function
> use the _locked postfix in the name, while the unlocked variants don't
> use the _unlocked postfix. Rename drm_gem_v/unmap() function names to
> make them consistent with the rest of the API functions.

I usually prefer keeping the function which people should use for new code without a postfix, but that isn't a must have.

Either way patch #1-#3 are Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_client.c                 | 10 +++++-----
>  drivers/gpu/drm/drm_gem.c                    | 20 ++++++++++----------
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c |  6 +++---
>  drivers/gpu/drm/drm_internal.h               |  4 ++--
>  drivers/gpu/drm/drm_prime.c                  |  4 ++--
>  drivers/gpu/drm/lima/lima_sched.c            |  4 ++--
>  drivers/gpu/drm/panfrost/panfrost_dump.c     |  4 ++--
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c  |  6 +++---
>  drivers/gpu/drm/panthor/panthor_gem.h        |  4 ++--
>  drivers/gpu/drm/panthor/panthor_sched.c      |  4 ++--
>  include/drm/drm_gem.h                        |  4 ++--
>  11 files changed, 35 insertions(+), 35 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index 549b28a5918c..f1de7faf9fb4 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -174,7 +174,7 @@ EXPORT_SYMBOL(drm_client_release);
>  static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	if (buffer->gem) {
> -		drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
> +		drm_gem_vunmap(buffer->gem, &buffer->map);
>  		drm_gem_object_put(buffer->gem);
>  	}
>  
> @@ -252,7 +252,7 @@ int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>  
>  	drm_gem_lock(gem);
>  
> -	ret = drm_gem_vmap(gem, map);
> +	ret = drm_gem_vmap_locked(gem, map);
>  	if (ret)
>  		goto err_drm_gem_vmap_unlocked;
>  	*map_copy = *map;
> @@ -278,7 +278,7 @@ void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer)
>  	struct drm_gem_object *gem = buffer->gem;
>  	struct iosys_map *map = &buffer->map;
>  
> -	drm_gem_vunmap(gem, map);
> +	drm_gem_vunmap_locked(gem, map);
>  	drm_gem_unlock(gem);
>  }
>  EXPORT_SYMBOL(drm_client_buffer_vunmap_local);
> @@ -316,7 +316,7 @@ drm_client_buffer_vmap(struct drm_client_buffer *buffer,
>  	ret = drm_gem_pin_locked(gem);
>  	if (ret)
>  		goto err_drm_gem_pin_locked;
> -	ret = drm_gem_vmap(gem, map);
> +	ret = drm_gem_vmap_locked(gem, map);
>  	if (ret)
>  		goto err_drm_gem_vmap;
>  
> @@ -348,7 +348,7 @@ void drm_client_buffer_vunmap(struct drm_client_buffer *buffer)
>  	struct iosys_map *map = &buffer->map;
>  
>  	drm_gem_lock(gem);
> -	drm_gem_vunmap(gem, map);
> +	drm_gem_vunmap_locked(gem, map);
>  	drm_gem_unpin_locked(gem);
>  	drm_gem_unlock(gem);
>  }
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index c6240bab3fa5..27778e5ce0c0 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1216,7 +1216,7 @@ void drm_gem_unpin(struct drm_gem_object *obj)
>  	dma_resv_unlock(obj->resv);
>  }
>  
> -int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
> +int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map)
>  {
>  	int ret;
>  
> @@ -1233,9 +1233,9 @@ int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_gem_vmap);
> +EXPORT_SYMBOL(drm_gem_vmap_locked);
>  
> -void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
> +void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map)
>  {
>  	dma_resv_assert_held(obj->resv);
>  
> @@ -1248,7 +1248,7 @@ void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>  	/* Always set the mapping to NULL. Callers may rely on this. */
>  	iosys_map_clear(map);
>  }
> -EXPORT_SYMBOL(drm_gem_vunmap);
> +EXPORT_SYMBOL(drm_gem_vunmap_locked);
>  
>  void drm_gem_lock(struct drm_gem_object *obj)
>  {
> @@ -1262,25 +1262,25 @@ void drm_gem_unlock(struct drm_gem_object *obj)
>  }
>  EXPORT_SYMBOL(drm_gem_unlock);
>  
> -int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>  {
>  	int ret;
>  
>  	dma_resv_lock(obj->resv, NULL);
> -	ret = drm_gem_vmap(obj, map);
> +	ret = drm_gem_vmap_locked(obj, map);
>  	dma_resv_unlock(obj->resv);
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL(drm_gem_vmap_unlocked);
> +EXPORT_SYMBOL(drm_gem_vmap);
>  
> -void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map)
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>  {
>  	dma_resv_lock(obj->resv, NULL);
> -	drm_gem_vunmap(obj, map);
> +	drm_gem_vunmap_locked(obj, map);
>  	dma_resv_unlock(obj->resv);
>  }
> -EXPORT_SYMBOL(drm_gem_vunmap_unlocked);
> +EXPORT_SYMBOL(drm_gem_vunmap);
>  
>  /**
>   * drm_gem_lock_reservations - Sets up the ww context and acquires
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 0fbeb686e561..6f72e7a0f427 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -362,7 +362,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>  			ret = -EINVAL;
>  			goto err_drm_gem_vunmap;
>  		}
> -		ret = drm_gem_vmap_unlocked(obj, &map[i]);
> +		ret = drm_gem_vmap(obj, &map[i]);
>  		if (ret)
>  			goto err_drm_gem_vunmap;
>  	}
> @@ -384,7 +384,7 @@ int drm_gem_fb_vmap(struct drm_framebuffer *fb, struct iosys_map *map,
>  		obj = drm_gem_fb_get_obj(fb, i);
>  		if (!obj)
>  			continue;
> -		drm_gem_vunmap_unlocked(obj, &map[i]);
> +		drm_gem_vunmap(obj, &map[i]);
>  	}
>  	return ret;
>  }
> @@ -411,7 +411,7 @@ void drm_gem_fb_vunmap(struct drm_framebuffer *fb, struct iosys_map *map)
>  			continue;
>  		if (iosys_map_is_null(&map[i]))
>  			continue;
> -		drm_gem_vunmap_unlocked(obj, &map[i]);
> +		drm_gem_vunmap(obj, &map[i]);
>  	}
>  }
>  EXPORT_SYMBOL(drm_gem_fb_vunmap);
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index b2b6a8e49dda..e44f28fd81d3 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -179,8 +179,8 @@ int drm_gem_pin_locked(struct drm_gem_object *obj);
>  void drm_gem_unpin_locked(struct drm_gem_object *obj);
>  int drm_gem_pin(struct drm_gem_object *obj);
>  void drm_gem_unpin(struct drm_gem_object *obj);
> -int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
> -void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
> +int drm_gem_vmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
> +void drm_gem_vunmap_locked(struct drm_gem_object *obj, struct iosys_map *map);
>  
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 4b8c6075e46a..d828502268b8 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -707,7 +707,7 @@ int drm_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct iosys_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	return drm_gem_vmap(obj, map);
> +	return drm_gem_vmap_locked(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vmap);
>  
> @@ -723,7 +723,7 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, struct iosys_map *map)
>  {
>  	struct drm_gem_object *obj = dma_buf->priv;
>  
> -	drm_gem_vunmap(obj, map);
> +	drm_gem_vunmap_locked(obj, map);
>  }
>  EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
>  
> diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> index 825135a26aa4..7934098e651b 100644
> --- a/drivers/gpu/drm/lima/lima_sched.c
> +++ b/drivers/gpu/drm/lima/lima_sched.c
> @@ -371,7 +371,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
>  		} else {
>  			buffer_chunk->size = lima_bo_size(bo);
>  
> -			ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
> +			ret = drm_gem_vmap(&bo->base.base, &map);
>  			if (ret) {
>  				kvfree(et);
>  				goto out;
> @@ -379,7 +379,7 @@ static void lima_sched_build_error_task_list(struct lima_sched_task *task)
>  
>  			memcpy(buffer_chunk + 1, map.vaddr, buffer_chunk->size);
>  
> -			drm_gem_vunmap_unlocked(&bo->base.base, &map);
> +			drm_gem_vunmap(&bo->base.base, &map);
>  		}
>  
>  		buffer_chunk = (void *)(buffer_chunk + 1) + buffer_chunk->size;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
> index 47751302f1bc..4042afe2fbf4 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_dump.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
> @@ -209,7 +209,7 @@ void panfrost_core_dump(struct panfrost_job *job)
>  			goto dump_header;
>  		}
>  
> -		ret = drm_gem_vmap_unlocked(&bo->base.base, &map);
> +		ret = drm_gem_vmap(&bo->base.base, &map);
>  		if (ret) {
>  			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
>  			iter.hdr->bomap.valid = 0;
> @@ -228,7 +228,7 @@ void panfrost_core_dump(struct panfrost_job *job)
>  		vaddr = map.vaddr;
>  		memcpy(iter.data, vaddr, bo->base.base.size);
>  
> -		drm_gem_vunmap_unlocked(&bo->base.base, &map);
> +		drm_gem_vunmap(&bo->base.base, &map);
>  
>  		iter.hdr->bomap.valid = 1;
>  
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> index ba9b6e2b2636..52befead08c6 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -106,7 +106,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  		goto err_close_bo;
>  	}
>  
> -	ret = drm_gem_vmap_unlocked(&bo->base, &map);
> +	ret = drm_gem_vmap(&bo->base, &map);
>  	if (ret)
>  		goto err_put_mapping;
>  	perfcnt->buf = map.vaddr;
> @@ -165,7 +165,7 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
>  	return 0;
>  
>  err_vunmap:
> -	drm_gem_vunmap_unlocked(&bo->base, &map);
> +	drm_gem_vunmap(&bo->base, &map);
>  err_put_mapping:
>  	panfrost_gem_mapping_put(perfcnt->mapping);
>  err_close_bo:
> @@ -195,7 +195,7 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
>  		  GPU_PERFCNT_CFG_MODE(GPU_PERFCNT_CFG_MODE_OFF));
>  
>  	perfcnt->user = NULL;
> -	drm_gem_vunmap_unlocked(&perfcnt->mapping->obj->base.base, &map);
> +	drm_gem_vunmap(&perfcnt->mapping->obj->base.base, &map);
>  	perfcnt->buf = NULL;
>  	panfrost_gem_close(&perfcnt->mapping->obj->base.base, file_priv);
>  	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
> index 5749ef2ebe03..1a363bb814f4 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -112,7 +112,7 @@ panthor_kernel_bo_vmap(struct panthor_kernel_bo *bo)
>  	if (bo->kmap)
>  		return 0;
>  
> -	ret = drm_gem_vmap_unlocked(bo->obj, &map);
> +	ret = drm_gem_vmap(bo->obj, &map);
>  	if (ret)
>  		return ret;
>  
> @@ -126,7 +126,7 @@ panthor_kernel_bo_vunmap(struct panthor_kernel_bo *bo)
>  	if (bo->kmap) {
>  		struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->kmap);
>  
> -		drm_gem_vunmap_unlocked(bo->obj, &map);
> +		drm_gem_vunmap(bo->obj, &map);
>  		bo->kmap = NULL;
>  	}
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 4d31d1967716..446ec780eb4a 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -840,7 +840,7 @@ panthor_queue_put_syncwait_obj(struct panthor_queue *queue)
>  	if (queue->syncwait.kmap) {
>  		struct iosys_map map = IOSYS_MAP_INIT_VADDR(queue->syncwait.kmap);
>  
> -		drm_gem_vunmap_unlocked(queue->syncwait.obj, &map);
> +		drm_gem_vunmap(queue->syncwait.obj, &map);
>  		queue->syncwait.kmap = NULL;
>  	}
>  
> @@ -866,7 +866,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *group, struct panthor_queue
>  		goto err_put_syncwait_obj;
>  
>  	queue->syncwait.obj = &bo->base.base;
> -	ret = drm_gem_vmap_unlocked(queue->syncwait.obj, &map);
> +	ret = drm_gem_vmap(queue->syncwait.obj, &map);
>  	if (drm_WARN_ON(&ptdev->base, ret))
>  		goto err_put_syncwait_obj;
>  
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 2bf893eabb4b..13c312ca07ae 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -537,8 +537,8 @@ void drm_gem_put_pages(struct drm_gem_object *obj, struct page **pages,
>  void drm_gem_lock(struct drm_gem_object *obj);
>  void drm_gem_unlock(struct drm_gem_object *obj);
>  
> -int drm_gem_vmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> -void drm_gem_vunmap_unlocked(struct drm_gem_object *obj, struct iosys_map *map);
> +int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map);
> +void drm_gem_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
>  
>  int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
>  			   int count, struct drm_gem_object ***objs_out);

