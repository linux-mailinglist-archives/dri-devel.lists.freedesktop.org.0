Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71080CB6E3F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 19:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF6310E815;
	Thu, 11 Dec 2025 18:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H4GNx7bj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011043.outbound.protection.outlook.com [40.107.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A7810E815
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 18:22:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krXs1ZLmy7/LXBDXCpSRW/v9NqXRQbZdFQWfOj6GFwGGJufaMUtxXnxmXo8dYwcObHi5wzYvvFpuMPO86tGVhkiYVuWaGiwXaOz04RKLJV1N2qUFijzxaMK7MRPty3//amYhP81ug7lj2ILngxYP/rdZ+cQN77y/lrFf19K3G/8287sA4ZQl54KyA0eYL1iH/ZQx2wka+GswdEihUwgPzcGrzDTZiG5Cg31BAcX8ryoEE+JBheth5AWOgnZrcQPQC96qe52kR2FUySpgOyayitC6ScFSNdWo4RUW/7HdnKqizGuR8oaMoicmd+rlFRizqHBKvO0M0fUzNjdtTogQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SOJPzGE5azBxa+ps+T633ITW+fno33JrzmgG+5VwdU=;
 b=LyJmDL4OZbP8dJANGNCEP1GuNkrYXfrDkI+bhcwftxA2y5MfyI+zSx/8Os0HNm9XqGg7FHO8ckTVw5m99+1cZhSVr87nDOO+mlrnQle5E/I0c3sgMgvNqaO6Pwbq3kOHkp9F/HxYWXxxOtvyXfnSzMjpphWHdDZk6XKbIMa6HfTDX11kv1o7K25rHyIbOXR60biTHadiz6t/5X+utr3y+kVqQ5f75AMNufwyFYBjw2xzf+Zjul3JeaRp4P2RTYqBklcFC/DvZZELmtxQbH3z9pDReQ4W7yz9CxgCkZRczUTEGlXQveBDGkgFbLt/RJNEZkeFGmyEE2qbGfCgprlVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SOJPzGE5azBxa+ps+T633ITW+fno33JrzmgG+5VwdU=;
 b=H4GNx7bjF5u2XPZs1Y62Yw6+1AF9IKiMFw2a1nT+lHb6d7oRi3JuTyF1qeJBF9ucFFfeeRsABLZ9iKbM5+FwMSWkuHifDpV5X/TkppksmhqebXQZZxuzArgkbhLrzxsF+Re1Eypf8hbTG59JByO7R5Tly2/PlyS8qM/qajstSNA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH2PR12MB4039.namprd12.prod.outlook.com (2603:10b6:610:a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 18:22:22 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 18:22:22 +0000
Message-ID: <a77c3b39-49e2-481f-af53-70b5fbe58ffd@amd.com>
Date: Thu, 11 Dec 2025 12:22:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 0/2] Get real time power input via AMD PMF
To: Lizhi Hou <lizhi.hou@amd.com>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org, ogabbay@kernel.org, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shyam-sundar.S-k@amd.com, VinitKumar.Shukla@amd.com
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251211175802.1760860-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0203.namprd04.prod.outlook.com
 (2603:10b6:806:126::28) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH2PR12MB4039:EE_
X-MS-Office365-Filtering-Correlation-Id: a88f19ac-1790-4e58-9b4f-08de38e23a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU1zRzUrWU9obmJBTC9kdUpMenJ4Q3VXT0pBQTVoc2pJckc1c25mM09XZEdn?=
 =?utf-8?B?enBpMzJaTnhKVHRobVhsZk5uL0pvc3ZLYTVuOXkxMThxZXZyV003dnBBeng1?=
 =?utf-8?B?cnIxN3YrbktMbWN0cmxVMFR5S3ljYWgyR3UvWFpLcUJla0NzL1EzUEowc0pE?=
 =?utf-8?B?bHM3amx2ajlLcUd2Wk9tVkV3MUpxUzlYbjFJZ2pRQzFqODJSSUJkZkYvQ1cr?=
 =?utf-8?B?aTZrL2xOQXVRRjZFSnIxMkIvcGo1bW5oRVFXakFkck9SV1poMWxtTiszL2Mw?=
 =?utf-8?B?bTFnYk02Zk0zOXlMWjZnWko0dE5qaWtFR1JXTDI5cERuVHE1clpBK0JyNWJm?=
 =?utf-8?B?eGY1d0tObGUzaWdTWDRKbGFsTXRhcG1yTVdzS2t6ckJ0WDRiU0hHbXVJR2RX?=
 =?utf-8?B?ZmNMd1FWVXo5SXFsamtTR3lodEpIMmRTdXNHN1dKbFhFT3loU3M1ZWhUY0tt?=
 =?utf-8?B?THNuSUFNVEtCVkpQUW1VTkpoblZiWGZwYXNXbnRydnFWdEdYQXF6cDcxb0JY?=
 =?utf-8?B?V0tzSjlHRUJ3OWIrQm9tNkNMOTliWWV1d0dwcVE0WnQ2eWIwaWNwYUhXa3RO?=
 =?utf-8?B?T0dXM2RUc00wQlVtaFN2VXU3VUdWaHBDazcvL0dRNDVBa3lPelo4bHFuTFFI?=
 =?utf-8?B?Zk45NlM2SWkvR2hURlRqbzU3Z2U0aXV4L0lGZzd1cEk0ZGhFWVN6ejllYTNn?=
 =?utf-8?B?Q3pxN09aVUt0N01UaGI5MlVJRWo5R1MzUHpLdWRlYVQ3RndZNjVrSllNaG5K?=
 =?utf-8?B?dEQvU1YxWXBMY1lXTjlkMkF6YUptQmF2ZmhwdHlOWldvVkJ1NzUxMmxpb3dV?=
 =?utf-8?B?Y2hyK1ZlZ0tkRW1jd0VML1JMajFjVG5hOFJaSkV1QjlTdS9IV3lCeDFxbVl5?=
 =?utf-8?B?Yjlzc0laMEQrdklCUU1HYVhETml5K0FQREtjaHVPOUdJQVprVHBVRlRwdmNG?=
 =?utf-8?B?aWVYVzQwOVBZdStiZ0dsQzFCRzJPNFJWRHVjallUUlQ3WW9UWnBXSG5mdks2?=
 =?utf-8?B?RlUxYVU3eStwS0NpS3AxYXl4dHJDaTd4WGtLanZaaEhyUjVyWi9jcytPSkZ1?=
 =?utf-8?B?SnZHSWIwL3JvQWFBdTRuWXpFMFYycmoyQkpXUUJSZkI3ejNjOHI1Q3J6TXY1?=
 =?utf-8?B?cFRQN0lJNDVZMTUzOUlZREtmUkdXTHF0SS8vRUF1YlZSbWpJQ2hPR2ZoN1BU?=
 =?utf-8?B?aDl6SGRjbzl0TkZTaWNWOTI4UjMzeTB1ZDNTK1JkSXVJTUVhbUtQMnVNY2Vy?=
 =?utf-8?B?NnNDY3lCMXVJUlpLT2hXMXdZRG9BSDgzaXA4TldwK2hrbHBCSWpudlgwTDN5?=
 =?utf-8?B?Nlh3cGlxMFNCSGJGbzVNT3lPd2lsWDBrT09hazlpTm93YjNxN1hWNWFwNG05?=
 =?utf-8?B?dUZnUEwxT2RuRXdwTnVVVXlEVjRGVVF6bU9STUNobVgvb1J2Ui93cTNtaFNV?=
 =?utf-8?B?ZjdOVTFTdG0wanhVZUxnOVJ5cFJ6RHFISjE1UWlUUjN1bzI1SFVyTnpLZm1G?=
 =?utf-8?B?NUtZbHhWZGxNQU9kc2tFQjlCbUZPUUJRV2J1WURtY0RjeUF6NFoyRVdoK1dm?=
 =?utf-8?B?SXh2RUFyZUQ5aDRvYWhaZmJwcTAxU0F0TFFaVWZuMy9QeTZmSVJHdHAveFZ6?=
 =?utf-8?B?aEVWSEtCOVA3N0swbHNFTzJFd01pRlYxY2ZmK0RXU3dXYjIrTkFsc3BqRkJh?=
 =?utf-8?B?SEdDaWxEdFJ5N2srTGZYdDZBTTdHTVNZZWY2bVNiYXR5eU1jdWNHSXBiSFgx?=
 =?utf-8?B?bTFGakNtOVRUNHJSWjFnS2dwSldBL2JlVUZuUnNQamFmRSs4UVdQYmVRd0pK?=
 =?utf-8?B?Q0ZZMDlzdkNVdE9CalpQQlVpMmx3aEcva1FCOEJQTEZFaTVTdUdYQ0V0aUZz?=
 =?utf-8?B?ZFM4NUgrU25sa0QyRHYrQmpUVzUyTVdEck5DOTBja3RqaVJxR3FkUWJKTzY2?=
 =?utf-8?B?cjJOdytlR3BoMDRWaEtYYzU3aDhubUJscmRwWU5ycGV6R243aVpTeVplSUhh?=
 =?utf-8?B?V0FzTnE3OHNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blhESXJHZjl4RHpXVS9uWFhmc2QzUVVaUlJYWFdnNzdmbkVDelVHYy9vNDUv?=
 =?utf-8?B?emJ4UzlCTEtPcnNUOGRBOCtCNU5OdHdTcHZHMW00b0piZmx3R1dEdWRvTFpO?=
 =?utf-8?B?WVpZTzFVNmhZWUVKNHZUV1FuWCswMUxqTXlTQW5OTHdtOEYrY0RDc2Nxdi9w?=
 =?utf-8?B?bmVyTDVKNVNCYzZxRnJmVDl0STcvYm55N1hJd2tvVG9jZHo5Wm9jYWsySTVH?=
 =?utf-8?B?aTlzZDVCMzM3cW1jWU1XMkZWNnNCUGd3dHdGemllTVNlK1h5VVE5L2lRV1Nn?=
 =?utf-8?B?czlxSjl2K3BqMVNhcHVKZ3lHUXNIcHJ2bW5CaTF4K1lndXpzbUpWMzc5MEtt?=
 =?utf-8?B?eGkwZHNkRElEM2xjYzd3RmZXZkF3dElxV055SmVVNDNrK1lGOUxkOHcwcHc0?=
 =?utf-8?B?N1A5QXJYeWtMbWZ6V0VvWGEzOS8rYlZ6YzNtWmhrc1NvcTJtbWl4S2p4UC81?=
 =?utf-8?B?alFLRHlmTWdDZDJubHk0MFhnNStqYkZ0djFwVzMvTy9QMEJMSlUwWGNsM3BN?=
 =?utf-8?B?OVFKVnNyOWtDQXVUK3pvWk1TTWJTelNQWmxnV3dCeDNjWDZEMEY5TTN5WmpO?=
 =?utf-8?B?ak9SKzJMblprR0FFS0dta05aQWNXMm44NEsvbURtZlJPMGFWSENzQzdyUmow?=
 =?utf-8?B?aWtDZXpXYk5peE1DMC9kYWxGTkZieVREclVCZzk0SWpHRENXcmp6ZHpWR25S?=
 =?utf-8?B?NHh4THZUeVBqRUZNOG5VenZlN25hU1o3dWJraGxIWTN3aUtleVNiVWJFWkN0?=
 =?utf-8?B?R0V6RG9vaXNYR1dQSGh3QXU5WlYxZGRMcDExQlQyVkMyVFR2ckhBdzUzTVh3?=
 =?utf-8?B?aTQ0bEdvOE54NXljcTgweEd3UDJOcU40QzkxN3lEWDJRL0RYc1NGWGdCZDdF?=
 =?utf-8?B?MDVRYWZNVVRvZkdwRVRNWmVYV0J0VmVSejJJaFhPUFExd3hvb0pQY2Y0SFBB?=
 =?utf-8?B?d2ViSy9zdktlVTJoRlA0YTRENU1IOVcvV3BZZ3lkNnpNS1Z5ZmpucU5OS2Z5?=
 =?utf-8?B?dzduZk9CZ0NYUSs4Mmg3ampHaWt4REN6eUtjRjFYN1lyT2NSV1Vwc08vQjVX?=
 =?utf-8?B?ZXVDT21FeDZCU3c5cDBFbURWMjVDTFJWODFxSUdJL21QQm5Uczk5Y3cvSXN6?=
 =?utf-8?B?cjBtK29HZkR0SmlYVFZVNHQwT2RXeDFCNmI3UFBwVXJQdlQ3WVFIZXdBOUJR?=
 =?utf-8?B?aWwxSHN3RWcvRCtwYlk1bDRkY25nandvTDhtT2JBc3hSMWlkMmNTeWhqWmZq?=
 =?utf-8?B?WFZ3MU4zTXZkWVJrM2ZWUE1HZ2ZVMkgzZmRrc3Q2UDZEVFkrUnJpdTE2V3JZ?=
 =?utf-8?B?MHdTLzNLNzdQeHBxWTdvU0o3Wjd1b1cxbHNBQ1JQUlVSSG5XZzFmay9PTU5w?=
 =?utf-8?B?eUlIbVdWUm82cUxyOGhLbHREZG1UMjJPTWp1OHVad2hDRytlaWVla3NZRFcw?=
 =?utf-8?B?WEdLNDdJKzZnQmNMOHkyREJObWorcjdXTjdCaXROeUtHeFdZbEd0bDdad3lj?=
 =?utf-8?B?TlZhcWZuV2hlMGU2WnN1b3JMK20rOFJzaTJIVmdBNEY5YTR4dmU5MG0wcGtU?=
 =?utf-8?B?SUhaQlppYXNBa0dqVWtqOGlNY0IreDNiS3FyeXJZK2tvaVd2UVdHSVZzRG8w?=
 =?utf-8?B?dVU5MXdJV2Q5b29BcldUSUpjVWFpZ0h4dEtndkk4SERvM2hGdENCbmgyTlFK?=
 =?utf-8?B?R2VnR3RYSzRSMkp3dEN0WWJFdHJTSlZ1TFEvcW50NDREN1paTlZzWjFkRDJk?=
 =?utf-8?B?bFpWNWNmNHVnWDJQTVN2blFBNmpBL0ppU1R1TWNLanNNUEQ0bVZicTA5YVM3?=
 =?utf-8?B?dkdJNjIzbENwa2ZuMGNmWGhMWERHeU1Dd0RxeHp4MDFjU2Fzc0hCNkVGRWli?=
 =?utf-8?B?YVhaWUR0bHU1cEpsS3pqRHBhUUNhUFBMZFNLSGI0UUFVQ1ZsNVhuNDRHakpC?=
 =?utf-8?B?MnZqR083QWY4YUlIWElvNDNxWGs2UXhzbmc1ZldLTjU4cXR1RTFXbzlLMThD?=
 =?utf-8?B?RElicVZXeDlFT1hhZDk2QldEYzdSaTRwRDlHWEwzb3FldWYzNUY2aU9hTGMw?=
 =?utf-8?B?YXJRbnAvdCt2dEJXd2JWSlVRQk9DRkFOUldINGhSU3UxaFJhY2EwRXp2MXRF?=
 =?utf-8?Q?+EvPRHAZirri3wxF39o0BA5fQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a88f19ac-1790-4e58-9b4f-08de38e23a18
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 18:22:22.3224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vs4zlbvQMEdGD4BHVPymw2TVWIxIZQS7PalBYh0B86LVuJ2fLekdMv1/uexAzhV+o/S3aoEV4lUnCmwXtrBbcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4039
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

On 12/11/25 11:58 AM, Lizhi Hou wrote:
> Adding new NPU metrics API to AMD PMF driver is pending because of
> lacking real case.
>    https://lore.kernel.org/all/d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com/
> 
> Create xdna driver patch to fetch real time power input via PMF API.
> Here is an example output with xrt-smi(1) tool.
> 
> # xrt-smi examine -r all | grep Power
>    Power Mode             : Default
> Estimated Power          : 0.563 Watts
> 
> Lizhi Hou (1):
>    accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate
> 
> Shyam Sundar S K (1):
>    platform/x86/amd/pmf: Introduce new interface to export NPU metrics
> 
>   drivers/accel/amdxdna/aie2_pci.c        | 29 ++++++++++
>   drivers/accel/amdxdna/aie2_pci.h        | 18 ++++++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
>   drivers/platform/x86/amd/pmf/core.c     | 75 +++++++++++++++++++++++++
>   drivers/platform/x86/amd/pmf/pmf.h      |  2 +
>   include/linux/amd-pmf-io.h              | 21 +++++++
>   6 files changed, 147 insertions(+), 1 deletion(-)
> 

Do you have a preference on how this gets merged ? Should it go through 
drm-next or platform-x86-next?

I suppose whoever is going to have more development layering on top the 
next cycle it would be preferable to put in that tree.
