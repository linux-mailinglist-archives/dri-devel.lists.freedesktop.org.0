Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF6DA8B7BD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 13:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F0C10E09F;
	Wed, 16 Apr 2025 11:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="puiDoXJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9727710E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 11:34:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrhDan/DWjgb/p9kcVLJfEbC6K0kF7fwNm2qFOLIen9QtW3BZlhmB5B1hmY6LbZMqAJZBMulUAYyAUnoCwGq2Vy2xwqmTAG/S75r3TbZmuBpcGKdbKyND0hVUsSQW/I7Y2Kv3UbI6R8eUIgo/1dIwxH7o+WMfgzgrU8XR3fYk6SRQfBRCMuLPEEGkHt9DrhrScoKBnCODY9BuaEltisz8YNfZnZEaoudYxnzlXCCNdE4r9OYuXNSzUN8NhNcskJftGbklAHg/omnG8KeLD8Jwg7jGe9/6JiPoa2SsbS1WpTruPlK1EzGiaAksdiHQZZPUG7mcElzyoU+cm00Bu3JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKypGie2LB3bL/62Lmj75G7QabkXPZ+fYHxNEvcderk=;
 b=RC+bEJxCvc7FBEiLzbR/Cv2oINyZEFNFFqGriFgTpvsEIQm5aZw55OEHusY8L9KcOvrnhmgzjkK/j0hlRhbb51oLnkx8z4cNBRrYk1VBxkB25qBWLYySYBjiZPIDqzu4u4Fy11FQ3LxyAQssPnubTiRguK9sQtybmhgmmxtgTgEENFt2QsBXUcWOTQwqctM7lqzVsnQ/ukdtYSb4W948focfZO8atUr8IjYQ03JAaAJiHAa9bMmzK0VhDWvb5dZs99/1JjHVpYp/Q8Okxl245c5oqSxxqYqSnZ++xljLamESQL7KYc47C1SNAwP8vMvP3OuD8WV+9DWkN+CMMFVPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKypGie2LB3bL/62Lmj75G7QabkXPZ+fYHxNEvcderk=;
 b=puiDoXJnF0lh/BHzrtxVqrxjb7kSHl0POwjlkUzZ3uKkKL1UNvtcY8ahlEr/TmjUJuU+p0Ux1Pn0/L3vJwaA0BYE7N0yD9XKfVpHuZtmGS1I6eE282q9M2Ovob2ymKiJ+PEv5poaosqmfLoLyiNEpM43o8GR4gS9XYdU7Rnx0pE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 11:34:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 11:34:40 +0000
Message-ID: <536596bf-8f5b-462b-add7-a203b6cd1e46@amd.com>
Date: Wed, 16 Apr 2025 13:34:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: heaps: Set allocation orders for larger page
 sizes
To: Juan Yescas <jyescas@google.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org
Cc: baohua@kernel.org, dmitry.osipenko@collabora.com,
 jaewon31.kim@samsung.com, Guangming.Cao@mediatek.com, surenb@google.com,
 kaleshsingh@google.com
References: <20250415171954.3970818-1-jyescas@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250415171954.3970818-1-jyescas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0407.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: d57cf645-35bd-4a45-71f7-08dd7cdaad37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjJQV3VJL2xnTWx3YzNVTkhCbTBxTUM0Q1VhZkFqUUJRV2ZNVkhIVU85UUJN?=
 =?utf-8?B?RXVXQzZNZHllVFA4c0ZLeHVnaWtsaXAybnBSNk55cUNIUDdpQWw0Q3BoN0Uy?=
 =?utf-8?B?UDMvUVNFNy9qejRiT3U3V1Exb1dPb2lTVjdmcVZxZ3gzemk4dGV0SmNDYmdV?=
 =?utf-8?B?YWEyUVNFSStFNVZXVlB2T3p2b0V0bjBXOU91anRrbXUwT0RrMW9xOGs1VXVE?=
 =?utf-8?B?WVVQTnI5MlEwOEh0bzJLaWQ2bzVZbU9XbFByeWI0V3lIUFhrMDlRbkhDNTV0?=
 =?utf-8?B?eHNhY1V2SExoR09TTzNSSzVXaWxBbTU2YTR4RE5VRnA1ZjJSWWFJcFVoNlhN?=
 =?utf-8?B?d3dqSWFkNjI2YTB3RmhRSlhzRXpMN3hnSjZpcGNwZnRKd3o0YlBlMHdrbS9n?=
 =?utf-8?B?MjBiYzYzUTU2MVZNaUlkdFh4T25hR2grQWdlMFJjWGRIU2VTUllIZ011bEg5?=
 =?utf-8?B?OEJoR3hWY0pWTGRoajdxZnkzTFFwN0ptN0JsWDdvN29pQ2NmWHFqN1EwVEhQ?=
 =?utf-8?B?TFBzaVgvenZWbzNyQVJSUU1IUU1Oc0dJdVh2THBjT1Y5b05RS3o4RmpxUlBP?=
 =?utf-8?B?ZFhxV1RkM3FBdW96NUMzNFFBb2ZFMThmdnZZNGFGOGMzaEdGdG5ETTZyT2c0?=
 =?utf-8?B?TTREdVpSQ2hjUGRpMG1FMmpWb2VPTHFheU4ydUM3OEhJaGVoUHgvMnBTcTJ4?=
 =?utf-8?B?NEtKWWlFZzlsVEoyZWdIdU83cUpZUGd6RFY4UFg1b1BMc0V0TC9ob2svZHJn?=
 =?utf-8?B?NmpqNHplMXJXV2h4T0cwWXhJelRBZ2VtQXN5RFF5UFhWK0VnbFprZitoRVRC?=
 =?utf-8?B?cmFGWVVPSDJnSjU3UTBXWFhFOE5sK0hLdzVkT2FnbTJQbThXdFhsOWxyTnN2?=
 =?utf-8?B?R2c1bndDdU0xZ2cwSndyY0VQR2srdzZTVTg5S0dYVUMveGNuQks3THlVM01I?=
 =?utf-8?B?emVmeXVMUUhzbGh5eVdURGp0Qm1BOG05VEJOUFFRRGRibXM3UkNWZXI4Tlps?=
 =?utf-8?B?QkVHZk9GdDF3cjZscGJOdEY3cTNjK01ScVJpcjB4amd4NG5ONC9TNkxWZXVO?=
 =?utf-8?B?ZnJiTHVoRU9KeTk3VmZRWmJZd2dwRnZUVlRUT0cxZWdONDBRbVpkRUJuRlg1?=
 =?utf-8?B?c0ROM2ZrcmhlaHYzcXJKRzZTUUN6eVFOdCtlODM1RUlGVzBLRG5kTnJLS1o0?=
 =?utf-8?B?MG16SXhPWGRMOXNoMlNoa0hTNGJ6SHZPY0swbmNjeHhMZm80cW1nbmJBTCtP?=
 =?utf-8?B?b1BVbkRSK3FQS1ZwUUxWM2wrbm9OckxCOE1wNFloallTSkliRW1BRndmVDNM?=
 =?utf-8?B?aFZjZDNXTlhUaHJISTdMdVpocm1CRy9EWitBT3l2cVkvUVVXbnJ2aE9McEJX?=
 =?utf-8?B?NksrZFlHcDZaRVhhRWQxd3paYXRCcEFlaVZKL2JUWERJQlovbUFXQzZBdURF?=
 =?utf-8?B?bHMzYWlmMkZqK0xmckVhQVh4V054R3BaYW10cmpPSlFXcjZLZHIvTGhaTFph?=
 =?utf-8?B?TUVidStGNEJZaW9CbkUvVHk3OTlob2ozcEw3dkhKY01WRnQzWTFxNmRiWldy?=
 =?utf-8?B?RkI2UWpKTzVVMjJjVjN6a09vQXI5YTJlUWZtaFFhYlBSMnB2ZGorQ295MHA2?=
 =?utf-8?B?LzZ1bnM1ZkRwZ3h5ZzNLUlh5emRDcGUzZzVQb2JLVlJpUlcrMW45cGVRaHpN?=
 =?utf-8?B?MCtubEZLMi9MSnZJMDVKSlcxODlBaHk2Tzl0czNuVWFPWlFaQ1JmZjNBdG4r?=
 =?utf-8?B?OExoTVNhQzNxL2hFUU5lQmJqVXY3NUEwVXdLblh3MVdxc1J0cW1VN2JvOVNB?=
 =?utf-8?B?TDhnWGNvZ0xFR3lkWW8rcDZhV2RQS3dPbUg0Rk5NNG9iVTZraFlwOE5kMUk4?=
 =?utf-8?B?R2FLVWlob1VlVlZaMno0T2FUdGFWbXFBME5nbCs4c0hMelBCREVvR2NsSVFQ?=
 =?utf-8?B?emM5Y1FBcmp6WGJENzRtT2c3YU9NT0JMbXU0WHhTNHNWMUlUbHQyOEhnaU1p?=
 =?utf-8?B?eW10ZzRCNzJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sy9uR2ZvdkwxZjkxU1JDaE5ZWmFORy94MFF3dHRXMDBKU2xKZHhVN3ptNFh4?=
 =?utf-8?B?bEdOV2pXeEhnbmRpcWYvRDdJVjZGdXNIaUdEeUJHdHptRS9PSVlxNS9hUlU0?=
 =?utf-8?B?OHBxUlc2QTNWb0hKY2FmZTJIWkpkdFVKaXVGNUJ5QXN3UnBnTmNER0R3OFpT?=
 =?utf-8?B?SEZMV1picUkyNDFhd3lJenFHakR3dkV2MTRpZjRvNUVGK01DMFBNRXF6NGdU?=
 =?utf-8?B?a1BEMmp3QUU0NWlBTHpFMVljM1NESEY4NzAzWnVyOW5aOUtnOTdUYlUrQmtD?=
 =?utf-8?B?djFLaWFJM2tvZUQwMWF0M2xvSUhwUmU1SnRXUkVuK1RWZ1luUmFUTFFRZ2xy?=
 =?utf-8?B?Q3Q3M2ZObFQ5NzBXOEtWVzYvSFZ6cGxwSTNDeitCQ29jRHU2bjRHZmI1Qmhz?=
 =?utf-8?B?OCswSmYvdnlzTXo1VlEvNExwS0JjSUlVcTBlYjc4T1NuU05VMjhoaDEzYjV1?=
 =?utf-8?B?dFZkNk13U1ZlNnRvTUZnQzFONDR3Z3FNSzR6c2s4dWExbndWcVhZM1M1WFM2?=
 =?utf-8?B?aVNoWlpRYkFDRDV1Q2hoMTNRRnA3N3RSYlp6cW42dWJXMWFjWGdyU3lEU2w1?=
 =?utf-8?B?aitRa09jb2JUai9Ca2s2SFZsajFYeS9FNHo3V1pOQ2dwL2FsZ0pkY1E0eUVU?=
 =?utf-8?B?RUFsbE8xeUdtZWdibTdwbXNmVGN5V0J3b1RGUEJ0R3V3bzd3Uy92Wi84QUUy?=
 =?utf-8?B?OXFwMEt6ZDNGK0ZUNFVBZlJaTzJvbDZlL2twcGhJeGVhbk5nQnFSanBRL2NN?=
 =?utf-8?B?V1BLcDF6Z3dRLzRNbG1KdEtlR3VJMThyOTY0U3I4R2dGSWFtdm9BS0xHbkdj?=
 =?utf-8?B?M0g3dnlVQmdkWEdjNkpoY0ZXQmRvby81TlpaY1JtZUk3dHQ0WDQ1dHdZN1ZJ?=
 =?utf-8?B?WkRza25rZTZPdDlOYXZ2K2h4T0tpdXNHN1ZuMWZJNmQzcjVBbEYzYjFmRWhT?=
 =?utf-8?B?QzBxcktaRnZjQXBLMGc1aVMzaHQ1WU15a3NiaStHMDlMSkI3aXFkeWpCTnZl?=
 =?utf-8?B?T0J2WU50bWJmRG4yR05qOWpGUExMQ0FUaDhGbWRTcmQyNjZnVlFxZW9VSVFz?=
 =?utf-8?B?dFhmVVBQOFdIUnRQRUlVM3haVCtocU00dlBnSUZRc2RWeFdUeGZtbUszbUY0?=
 =?utf-8?B?bytma2lhblUvM2xVU2N3dUQzL2hNWVl6MXFOK0VtYVg4a0lqSUcyL3o0L0o3?=
 =?utf-8?B?ODFycVFIQkJDanVjeU5nN09ER0tFcmhHMW9hTDE4WExqclBlSEJCSE80TWEx?=
 =?utf-8?B?cll1czhxS2xKd3Z1WXNEeU9EcEd3WHZlQk15NjllVE9Pa1FxdnBvT3l3OUNX?=
 =?utf-8?B?OWJkN2dBWmVXOEVGV095N25Zb3NRTjFheUJhcFVha0F2NlUzelFxT2gxTTk1?=
 =?utf-8?B?UXlubFV2NFM0VVFHZWl0Y0o3dytnVlVUYVFOTVl1UDRocHYvT3VodVNYUG12?=
 =?utf-8?B?ejVvZTV3djNYQytKVTQ4NWkxYTVFdVBNNXBzamh1WVFwRElDWkFnbHRGQ015?=
 =?utf-8?B?WHJMN3FsbzBRWjBQRngzU3JsdkV5aGZhQVMzRVJwQ0d2WE1WbURsZnMwMU85?=
 =?utf-8?B?NGt3OGlLMlJXR0xOcTA4OHhoM1dIOTRLQkxoUDE1YjM1c3loZGYvT3ZtN052?=
 =?utf-8?B?MVNOcDA0SVpuUS9aaWVybzlUNGV3U0w0ODJKWlgza1NCNlBqSDU0cVp4Ti8z?=
 =?utf-8?B?VVd2VFVCS3BEeE5kbzVjdnpMNXc4WUQrcXowSGV5UzBPcnBMMDF4MGVIUkE4?=
 =?utf-8?B?dWhYczFxcVJPczUvTGhNdlhQWjZwajNKQndERWEra2FmTWJCVWovTXY0OVJN?=
 =?utf-8?B?MGFOaE5wSkdhcEJJZWhyd1JidC9OQ1FGYldRMmNyT2lSUElWWm5DUXNOc1Fq?=
 =?utf-8?B?bmhQelhQejl1bytVS1ZTSDlRUXBQSVdDRnNyUjUrcmE4akpyTVhCVjhTYkc1?=
 =?utf-8?B?Q0pHVG8rMHNDaDBsdk9lQUZwL2JXYW5yaWpjR2JVYmVCNkJPN1ZCQUdXYkU3?=
 =?utf-8?B?R1gxWE1QYytIOW9OaHZSS3l4VkZVRndwUThYKysxT010Q29QUWJWYmJUMGtI?=
 =?utf-8?B?eVNPR0xHNXJ0OG1FeW1MOHBFamlQbGFRUVhqb2xpYWpDK1B4VVpRQ1lIRGwv?=
 =?utf-8?Q?kXGaM4Nse7eWHYfjjyBrwYKm1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57cf645-35bd-4a45-71f7-08dd7cdaad37
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 11:34:40.8946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hRZKUxjHabdHiZAA441as4fqBQ1/qKnO3QUJmaVeRmWQCSM4+xygXcRw0GDtS9nJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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



Am 15.04.25 um 19:19 schrieb Juan Yescas:
> This change sets the allocation orders for the different page sizes
> (4k, 16k, 64k) based on PAGE_SHIFT. Before this change, the orders
> for large page sizes were calculated incorrectly, this caused system
> heap to allocate from 2% to 4% more memory on 16KiB page size kernels.
>
> This change was tested on 4k/16k page size kernels.
>
> Signed-off-by: Juan Yescas <jyescas@google.com>
> ---
>  drivers/dma-buf/heaps/system_heap.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> index 26d5dc89ea16..54674c02dcb4 100644
> --- a/drivers/dma-buf/heaps/system_heap.c
> +++ b/drivers/dma-buf/heaps/system_heap.c
> @@ -50,8 +50,15 @@ static gfp_t order_flags[] = {HIGH_ORDER_GFP, HIGH_ORDER_GFP, LOW_ORDER_GFP};
>   * to match with the sizes often found in IOMMUs. Using order 4 pages instead
>   * of order 0 pages can significantly improve the performance of many IOMMUs
>   * by reducing TLB pressure and time spent updating page tables.
> + *
> + * Note: When the order is 0, the minimum allocation is PAGE_SIZE. The possible
> + * page sizes for ARM devices could be 4K, 16K and 64K.
>   */
> -static const unsigned int orders[] = {8, 4, 0};
> +#define ORDER_1M (20 - PAGE_SHIFT)
> +#define ORDER_64K (16 - PAGE_SHIFT)
> +#define ORDER_FOR_PAGE_SIZE (0)
> +static const unsigned int orders[] = {ORDER_1M, ORDER_64K, ORDER_FOR_PAGE_SIZE};
> +#

Good catch, but I think the defines are just overkill.

What you should do instead is to subtract page shift when using the array.

Apart from that using 1M, 64K and then falling back to 4K just sounds random to me. We have especially pushed back on 64K more than once because it is actually not beneficial in almost all cases.

I suggest to fix the code in system_heap_allocate to not over allocate instead and just try the available orders like TTM does. This has proven to be working architecture independent.

Regards,
Christian.

>  #define NUM_ORDERS ARRAY_SIZE(orders)
>  
>  static struct sg_table *dup_sg_table(struct sg_table *table)

