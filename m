Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98BAB8692
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 14:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D244C10E272;
	Thu, 15 May 2025 12:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r3Z9fEq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFB910E272;
 Thu, 15 May 2025 12:39:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHD2IqB/DuixG7gCq9KlbEFJVm4XzifejDTr+WB2AxKm5Uxs2r5DTP+SS6veOkxLmrS+pyKVGAwpuLrRfQAtomqMQWNSJqHnX5sNgx0A+xVQ1qCH09pdMaAQkArpn7KON3nHMNjVfi9xM7Q6lU3P9p+GoDLm/bvy4cAIqTNcTS9IufK6/FS6WR0WoLS1UVtOQWIHIzQtpJcPQAHlpTZjf4a3/VOYvq/yuIM3Cv+dTz9PVMovx2C2ZTGAysKrjSpD4t5MMzWhwjmXS8rtkMCb2truF0CxN9qvphj45B+eNez7qnunHeD43XjRbLDzCoz2tGbHeDj1wcGAOngvlligfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjrmGE9qNX5rWkOTVmLnrwRTQ/VtudqPYnhnZCTBrMo=;
 b=wCM2YdCVzwuhgvSsFnRQP4Eys8/S/iHmk9+nqtyg7ptOnFxKio0NGdqDvPtzhh0nG9gl1e/HZM0ny+/XJN7Kqmn1DVrYJdh5wyac5OWKN89BAsvOaDRR3kGz2M0g9gjxTBWXKquEJH/1rRrFiWxJiSq60w8pp2rtPtssmmZtXU7f8UfVY87PSBQHQL0FWhHZ1gJ9ZAh3gc1FgUv0OnHtvOgJPHO8/hgxMkcn7BxuxOTTl9F3HfI+AQ1TXFdNht+MU7LPEpMg15tIWL7m8Wla0uugPSp2JYAlGQ7h28fCIz8ixkBdCNa5ZMnbEQngsB2r+wqHG88GDhUdhDsow+bqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjrmGE9qNX5rWkOTVmLnrwRTQ/VtudqPYnhnZCTBrMo=;
 b=r3Z9fEq6Bb/CoyjUdanI5YtDwOX5tqMZl21ydzlDFTeZuFmiaSjmaXEC30H6Yk5Iv19TPFclL2ASGdtDgrDPyue2gbrbq+vHjRQ7dTQ1Mco6xGHiM0YA0s1C79gH3+jnM5gXemGj4hY4nv7zr2lcnkY5smnBElH4qlIFfWv9x8c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB9243.namprd12.prod.outlook.com (2603:10b6:a03:578::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.24; Thu, 15 May
 2025 12:39:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 12:39:33 +0000
Message-ID: <7fa0a034-80ae-45c9-84bf-9841f9b28a93@amd.com>
Date: Thu, 15 May 2025 14:39:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/scheduler: signal scheduled fence when kill job
To: phasta@kernel.org, "Lin.Cao" <lincao12@amd.com>,
 dri-devel@lists.freedesktop.org, aamd-gfx@lists.freedesktop.org
Cc: haijun.chang@amd.com, zhenguo.yin@amd.com,
 Danilo Krummrich <dakr@kernel.org>
References: <20250515020713.1110476-1-lincao12@amd.com>
 <74e69f8c-a918-478d-b3f1-24c405abbb71@amd.com>
 <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5c1f021f4aa808f2cd5d8da76e40662ba10b97d6.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB9243:EE_
X-MS-Office365-Filtering-Correlation-Id: 893accb8-86d9-4292-2c3d-08dd93ad8b73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VCNGQzaGF2MUZxWVRCZFRiMlJ2VjgreE0waUVjRFN1b1hDZHBEd2Jvenk2?=
 =?utf-8?B?emMrWDMvajFjSlhPczgwN3BSZUlRWmZwaUJVRHpLc1NvVUhSMGcybUhCUEhW?=
 =?utf-8?B?K3RlM0dqeTVPTElscmdVZDlHTUl5MnNwbE04cFl5TWhwMVpmWmE0RlVRNkhJ?=
 =?utf-8?B?MUZLc2hTcVo4Q3lhVG9UcEF5UEJoZURQS3ozQWxQclU4eGgvYlQxRXRTNkdp?=
 =?utf-8?B?Z2drOXBsdWxHVlhEOTlVU1ZxWmRlVk5QNXQ4b2VnOVFjNjFiYW1VTC9iZEtY?=
 =?utf-8?B?OGpNemFGa2xTWnM5NVpIcHRTNnYrTkhxamVxMDlla2Z0Zk9aRVRwUjVZK2Vi?=
 =?utf-8?B?YmwrV1M1S0ZWSFUycCtuRVNETDVxVm04aTBSaVdOYlJkSitLa3ltUWVzZTZt?=
 =?utf-8?B?Z3AwOUlaUEVuaTZwR05FRVF3aExXcDdLb2VheHVhcTA1enpMenJ0eURpVzdX?=
 =?utf-8?B?T0ZUM0FxcWtRQnpmQ1psZmRKZHd1SjNIdEZZVWdHZVpBaXVvaDVqRHcwRXJG?=
 =?utf-8?B?b1g3TWp6Vk9Ia0JtcUUveGdEM1AxTlQ1dzI0WWJhYndIVGVkWVV2YUxKanFK?=
 =?utf-8?B?Nmk4ZEJpT1BwVERtaTBoUU9PL241M0dHa2RnWkZ6dGdPd1d2OWZ0S3NvLzFm?=
 =?utf-8?B?V3hGWGdJb0V2cEF0RFdSbUo2RDZ3NlFtdWtLYWpaNzIzNWc4a0RmYkNuQ3RK?=
 =?utf-8?B?Y09pWC9ubDRXeWQ4OFdMUEw1T1ZuTFBDVldBNXg2RTY3TkRIaFlkM0ZjSFh6?=
 =?utf-8?B?RVBrdjJ2b0lCN1hvazJzWUE1TDVVaytDbkNCUkIwVmh3bGhNZWJmZ3Q1U1BL?=
 =?utf-8?B?QXFKeDNpdm1LWEZFQk1NKzBOdUdIeTRaMVkzckI1U090ck44ZzhGWS9Vd1I4?=
 =?utf-8?B?NUsvZ2d1UmNYQk0wbFNEVmo3UU9sNFRjc285ZzZBaGlBdkFRa0puYmpzUWQ5?=
 =?utf-8?B?TkZXVDViTk5OV3NCQW0zZmdwbS9tSXdXVnozOFBnNUF3Nk8xZys4L0ZxMzky?=
 =?utf-8?B?bi9PRDVxK0JOOUFpN3ZjSU9vdUl5VmkrZWVSbnRPczZrL2pkb1hxUnV1eFFV?=
 =?utf-8?B?QmtveFBUeEFzMFQ1Z2lQaEdEZllBcXkxMXhNVkVmTjhJQ1dwdXZRVHZ2Z0ps?=
 =?utf-8?B?eUQxNkxGb1RzVmNGUlNBZzlwaGNVYnRDZVY4eXRZbThvTmVpWUt0SFdEclRK?=
 =?utf-8?B?bW9mZ0N6S1JqU1hmL05vU1RteHJkdm1ueWpWNTdYdkJZY3FLMktBaEk1ZW8x?=
 =?utf-8?B?RUptbkt0SVhsNHRDNmJ2dldIR3Q4Z3JDWDZSU1VDK3Uyb1NGR2NoTStXQVJX?=
 =?utf-8?B?Z1NrSGtkbzNwV3ZoWEFwMFVTaGpoeHhlUGN4dVF5MmVVOVVnd0I4SkEzWEJZ?=
 =?utf-8?B?WjVmN1lDVlFPT1ZxYnpmbEZYd1A2dmVERmIrdXB0cjVzVlZGeVVDQXc0cmFp?=
 =?utf-8?B?NUszbll1QW9sbkNQN1JwdGp0azlJS0xxRFBNUFV3OFNCeDJMZUVzcERrcktJ?=
 =?utf-8?B?T2R4TVJRVVhLRUNwZXBoeUpQVHRwbTFycTVXV0JYTTk3K05KS1VqaUFuYkhM?=
 =?utf-8?B?UDZ4blhyWkV6V0taZTFXMVlCdlRqaDhQNEZacEdzdG40RVpacnY3TVdJSEpa?=
 =?utf-8?B?c3ZsYnVZbEhkejRqMm9tK3FEZGh0a0F1NFI2Y09UTU5tNUNFOUNjMlhWZk96?=
 =?utf-8?B?V0xTN0d3OS90VTlWYWdOcXByTWp2enQwaUdmcCtKajZVWlF4WkExSmZPUlR1?=
 =?utf-8?B?bjJaVmZxdE1TVDRwNEpnaUxNZSt6L3ZOaUllSTFZa1NocUh3QTdkK0lXcTI0?=
 =?utf-8?B?YkN4elB6dHhkT2lzNjhEQ1Vtd2x1TzQyUkYxYzh1VEJtK3dvVWJJLzVha2t5?=
 =?utf-8?B?NEZrSDNRQUtCZFI0ZUI1cGFXZFlqQ3B5SnoycFUyUDUwU1pOdXUvdkRGMEJK?=
 =?utf-8?Q?21RzDMjY0m0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmZPbEhkKzJYT0lVblhKb1lJQ1AzaXFLcWhqa3ZDRjBSWkxFZnRQZ1RNS0dp?=
 =?utf-8?B?aGxFZ21RKzJWN2R4MGR1enZxMEI4emtSb1BDVlc1M3ovRC9zcWo1M3lRblB5?=
 =?utf-8?B?dllWdEU4ZHZTanR1L0N3WEcwS00wZ2VvTnh2UkRvNGs3YTFucDJDQnlOandH?=
 =?utf-8?B?SXI2aEFyem9pSy9LcEsvcnN6TGl5d0lwbjdDMCtJOVhXRkU0dTRFa0lVeXlY?=
 =?utf-8?B?RGhpYVZIUlNLWWlLbEVsc0J0OFFaWVYzTGZMN0R2UWx6dTVSRk5iUUNMUHdL?=
 =?utf-8?B?MEFhS3Q3a09CeGNSWDJHMmUwNCtyTk9WMm5jWURYY3k2aE4zTzdmdFYwT2F3?=
 =?utf-8?B?ZjNnWGlKLzZMNHdnYys5YlUwaXBRMG1rS1dMR0tkb3hrU0pIYTM2SEpFTFZV?=
 =?utf-8?B?dGJONnRHdzQ5cm5rSmNySEZHUklxNURHOUlVbWRIaWprbHlsbFIxTnFrK2Ni?=
 =?utf-8?B?VllmSUNSVU1CMm1JaHE2dGR5WTc2M0Z6Y0tUc1dQbzhYWHB2bUtLaU9TWnds?=
 =?utf-8?B?SnRYeHRrdTZvVkQxTjZzNHkzdi92U0RzQUgreHdIUG5rd0R5d0gwRFVidzRH?=
 =?utf-8?B?YlZrTU5Od0R1MTF1eXc0Ylg3djdEaEt3U1JJUENXNnhuT3JBczczYkU1RDBF?=
 =?utf-8?B?dWNPQktxeVh5bU05U2pFSS85Ujg0YWd2N0FMRVgzR3AxVk1BdHRodnlia25p?=
 =?utf-8?B?SnMwUHp5ZldVUzdic21aYXhwQWM1emRMTUFsdkE1ZlFzQ3EyL2Z6dVU1ZHA4?=
 =?utf-8?B?c283LzVzUmJLT2tsN1p4R0VQZzJ1ZmdDWEIrcHp2TEdCUVM3NGk5S0VtUCt5?=
 =?utf-8?B?U2hCTlRjU1ZhZmE4RTdwNHEvcHBmYTlGdzh1YXhrNnVwZmlzd0xLR29VanlN?=
 =?utf-8?B?UDZSOXVncXF2L1pqd1N5ZHlMQ2NrTGRmUUxxRDMvUnRtZDJMS3M5MGhhdVYx?=
 =?utf-8?B?bG1RS0Q5RDVlbHFqSHJOVEtHMDU4Tk1nSVlFWlpTUlBlbVEraG54eGx6b2Q4?=
 =?utf-8?B?M1l1eFN0N0lieW9tcFhRNzRWamw2b1A1RmVJUDFMT2V3WEExNzVVOWFsNlZH?=
 =?utf-8?B?Rm50M051RUJPb0VpZ2RjeDdnV3lTclFnanY3OHBmUTlpY1RIRjBBOEtGQVcw?=
 =?utf-8?B?eThwZU1aR3V6UmlNNjJNM3p1WWc0UTRaVWtBSEx6R0thU0p6aXVicFd2cHZE?=
 =?utf-8?B?cmo3TjhqQWN4L3NQcFh4OEMwYVNRVFlaL0RJRjI3MDl1S0R0VlhaOTFpK1p4?=
 =?utf-8?B?VVpXNllld1ZvdmE5d3M1RTBBZXdvRWR1N1FlM3hacWw1MnhJdFJKQndXWk5o?=
 =?utf-8?B?TWxFbkM0WEluazk3cHhsZjdjeDRoazhVdWtBZXdzY1Yvbi9PdmorU3dXaVZZ?=
 =?utf-8?B?Mzk0UGE5QjhMOUR0bXc1YTlQeTBwOXZiSnVsRytlbk80SzVSMUpBLzExRkt2?=
 =?utf-8?B?TytVME9NYnVBNi9RK2dLdFE1ZHlMZ0k5R1JhZTdyby9CVXA4WDN4cWNlWDk2?=
 =?utf-8?B?ZHJIYnBFS1pkNVBYcy9sWDNVbno0Ui9NK0JERmJPMmhmZWdUMWRuM3R6VDFF?=
 =?utf-8?B?K2loREpEcS9PUzFYZXlmKzdlbUJDQVRCS0lHaHEyT0lrczlCdWhyWWt0N2Zy?=
 =?utf-8?B?cmZDRnFVdmhhMG9zODR1NVRUSmNEcGYxYmdNNm91dG55S0RUSjBYZFlKQ0RU?=
 =?utf-8?B?NC9Ubm5paXFtYzFmTGZTT0V6WXRKd1IveE1PaGYwNngzUzkwcmVXdlhySTZS?=
 =?utf-8?B?eFZRU1pBZGZRdGJUNWNocVRHWEU5UjREYzQySzlTNnRXOEdYOVVZOW4vRnd4?=
 =?utf-8?B?NGFrOWx2YXFwbnZLemVkcXltcG8rZU9CVVRhR0VLdXRnOFMrRUNOUnlTOWVq?=
 =?utf-8?B?b0c1eFJIVWhRN3BYbCtoczhCOERQMVBUUENBYm9sbXZQQi9DdjZVL1dONnB5?=
 =?utf-8?B?L1RybFBkY2diNzdiUkVqUDBETWV4UzFwS0ZmalFDRmhwM1NBcmp2cjJFbFRt?=
 =?utf-8?B?NHlsZ2Ezb1dKUjViRUlPellmaC9kZ09wY0Z5OW83NXN1c3kxb3V1bC9rNzc5?=
 =?utf-8?B?TDBRWEs2bUNWNU00ck5TeUpySWI3VnI3U2dCb2NOVGxvTThOc1ZmcGpCR092?=
 =?utf-8?Q?aIfjJvAJVK0lHk5ldBQdT/bWq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 893accb8-86d9-4292-2c3d-08dd93ad8b73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 12:39:33.6246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qCz02Ke5P8qpaAHXsr70vAcl28uTEjI3qGPgrs5hgp1Lgsj9wXgewjLuMif6w1y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9243
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

On 5/15/25 11:05, Philipp Stanner wrote:
> On Thu, 2025-05-15 at 10:48 +0200, Christian König wrote:
>> Explicitly adding the scheduler maintainers.
>>
>> On 5/15/25 04:07, Lin.Cao wrote:
>>> Previously we only signaled finished fence which may cause some
>>> submission's dependency cannot be cleared the cause benchmark hang.
>>> Signal both scheduled fence and finished fence could fix this
>>> issue.
> 
> Code seems legit to me; but be so kind and also pimp up the commit
> message a bit, Christian. It's not very clear what the bug is and why
> setting the parent to NULL solves it. Or is the issue simply that the
> fence might be dropped unsignaled, being a bug by definition? Needs to
> be written down.

The later, we simply forgot to signal the scheduled fence when an application was killed.

> Grammar is also a bit too broken.
> 
> And running the unit tests before pushing is probably also a good idea.

And maybe even writing a new unit test for that.

Regards,
Christian.

> 
>>>
>>> Signed-off-by: Lin.Cao <lincao12@amd.com>
> 
> Acked-by: Philipp Stanner <phasta@kernel.org>
> 
>>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Danilo & Philipp can we quickly get an rb for that? I'm volunteering
>> to push it to drm-misc-fixes and add the necessary stable tags since
>> this is a fix for a rather ugly bug.
>>
>> Regards,
>> Christian.
>>
>>
>>> ---
>>>  drivers/gpu/drm/scheduler/sched_entity.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index bd39db7bb240..e671aa241720 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -176,6 +176,7 @@ static void
>>> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
>>>  {
>>>  	struct drm_sched_job *job = container_of(wrk,
>>> typeof(*job), work);
>>>  
>>> +	drm_sched_fence_scheduled(job->s_fence, NULL);
>>>  	drm_sched_fence_finished(job->s_fence, -ESRCH);
>>>  	WARN_ON(job->s_fence->parent);
>>>  	job->sched->ops->free_job(job);
>>
> 

