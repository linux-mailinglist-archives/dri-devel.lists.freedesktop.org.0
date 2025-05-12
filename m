Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D83AB3F4B
	for <lists+dri-devel@lfdr.de>; Mon, 12 May 2025 19:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0903210E065;
	Mon, 12 May 2025 17:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nYv0WdtI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6CE010E063;
 Mon, 12 May 2025 17:38:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o+tB9kZ32wM4WkQ4H9SZ5ZEMzszs/wpJnJm76gzFJi6QCgiDQ68w/InXcLNBaLPwZwD6PVo1XFkb7wmSZwa761TNxLNmcDfdJMprPjLfb3sn+ByyF7ijEnh8i3ANXeP/MCxXhKKQukkrYIHME8bYwfnAXUsr/EU8G5g0cV+CpD2v6MBiFrj+dtSIv8IAkTRxI5vYZhtsV8gBuxUUHk0lqdqiY+hVFfukfrvQnmy7ZNM9oG8WFBB4hXz6PBTivBBnDLn9tqkOuR4FNypLR09JPNpNZ0fRSA9KgbZMQX8qwM0JEHRr7SdGRse1So9WYXcXhq8dawiHCa6ai1Re6ksxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ik+WeFvNKNIEIvXHsbpVbrhRaHZY442mEnxkeY8tzxw=;
 b=RSaLJh0CplwkTQS2xg5ZhfgdlsClTcrdtDDX8cdL6M2uhb5SyKy5/R/kWhbn8Lim/1JTQkW8xd2xTETN946DC5ValcIi7rB+FwsrPCmOqu51I+VzWKLHgK+jNpdyF9ih7twi+7m87YqvVmU1D9d4GKEkMah6LP29LY8fIIEtIqEfaoa+eua1xCyeeeiBwnJpdHK6gsu7eGCH5J+UB7n51PEXsOX8GvFO/ZQu8Ofsg/qeDtvCyQTp9RDT7k9yJOYVv+tI1/suO+iK3fA/PlVGEdUop7eTs19/k873QZNIj2w3LjqzD3JXEVa85V2eJjEQLoSSYRL2Ksi+B+5uKGFhFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ik+WeFvNKNIEIvXHsbpVbrhRaHZY442mEnxkeY8tzxw=;
 b=nYv0WdtILMFXE5zi5dywIlcxU+ljZz3Wx80htqPbiH7V4dofrrk4riE3hq3ceQ6YqDP7Pf6f9Z1yhX0xfNHC42xccwH5gh32D5aWEakumV8/X20fyCoSEBIgT8BIqrp+6X8fSoOTe+Rsiw1nkPro6KIhhrv3uvXVk41Vd9PSXrE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA1PR12MB7173.namprd12.prod.outlook.com (2603:10b6:806:2b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 17:38:12 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8722.021; Mon, 12 May 2025
 17:38:12 +0000
Message-ID: <c1f3aec6-aa50-4a86-b44c-5db16a37a14d@amd.com>
Date: Mon, 12 May 2025 11:38:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: remove code duplication on dcn401
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, harry.wentland@amd.com,
 simona@ffwll.ch, sunpeng.li@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250430142549.829861-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250430142549.829861-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8c::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA1PR12MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: 854d1db0-810f-4bec-1b34-08dd917bc478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkFnQ0pEakRpbktQZzJCVXFPMmpnV2dBWDR3bnRpbUU0bUU4WnNsOGl6VDZa?=
 =?utf-8?B?VllEeFFVdFRLTUp1OWxZVDI3WEd3MVRuL3RQQ2pFTFZsOFBqR1dBZVhyN09q?=
 =?utf-8?B?c2ZjQmlpb0c2MDV0b3VINkQ3OVdYZlFQQ1ZWYU9Oa2xXVmxYV1ZyTTF1dnFT?=
 =?utf-8?B?Y2pxVGt6YldRVEsrT1pUMG5ieFZLRHZaRUZZQUNBU1IxQWpvQWxhRndFSXJD?=
 =?utf-8?B?c1o1d3h5b3NKbWxOZS80V3hkZ2MyaGxndWFhOFpJUW1hZ21DL3RuazJ3RitV?=
 =?utf-8?B?NWI5YXlKSjRXeElXUmdsVnNXSjY5azdZbkJwckdGRVdWcHZMSG42RnVBV0dE?=
 =?utf-8?B?WnlCSXdISGF5anEvLzA2Q2lTVlhiOEJGVEI3UkxBWVpIUTRUdldFaTJQK2Zk?=
 =?utf-8?B?ZGVuN08yaG9LbHVDaEdHbkdveWsraGFDdGtBSHBWUHNwd1c4TjIxRHltRFBt?=
 =?utf-8?B?K0NSbzlmVGFOOE81YXUxWUZtOVpSZUJrQnlVT1ZZUDZUY254c2FDS2JOMVJo?=
 =?utf-8?B?cVc0TG9DdFhBWTFMaVQ5bW5ObUsvc0NnT3JjTnlHRG51bVpuODREa201SU5r?=
 =?utf-8?B?dFRISzZ3WWlaSHRPd2s0eG5WTDFMeGczOGo4WkFmbnVNYVU2MTR0a3Rqcmhu?=
 =?utf-8?B?ZkNON1Ftc1ZhaUZnV1g5bnVEc1JNU2V0T1VvNWlZYWcxK1BrR0RkTy9jekd1?=
 =?utf-8?B?SG04dzVOMWo3dDBDL0wrcXFTOFZxTy9DK3k5V1BXSzU4d2RJVmVhUjZKcnVZ?=
 =?utf-8?B?Rzg5ZDR3QVVZMGFtUVloWElTREpKV1dzSXo1c1N0cXYrakJiMjBucVBEaFJM?=
 =?utf-8?B?bEh6NFc0a0ZUUHB3OVEyNnFJUkpLaWJuZG84WGdGdzIzYUtaR0RrRFFReGxS?=
 =?utf-8?B?eVk1bDVmbE5TSHJQanBRQnVTeTc5bWpuYXF0Tm9Wa3BMOERJSmw1eEk1Vm52?=
 =?utf-8?B?UjVvWjhsUVlxTDBVZ3FqaUthMmlBUVZ6dGhjY0VTcEllR1U2dy9odVNaSWJr?=
 =?utf-8?B?V1ArclhaZTkyMEVFd3Y0WXk0Yk9FbUdlbFNwWFplbFM4Y3JrR28zbE9GdlZ0?=
 =?utf-8?B?RFNFcm5TTXc4VldLeTJPb1Zzd1RCUHRzZXV4UDZXTE5nWE1Hb3Nrc2g4NUxX?=
 =?utf-8?B?MjdCWTRXNVZvZndKLzZBSEYrZmxHalhzb1dua0tId1MybTJSUThIbGdvQ3RP?=
 =?utf-8?B?YkN5dEY2Q2lDQmxZd3owbnlMM1BMUnJZVnJwOUxqQ0ZmK0RUMlVkVGQxZlNt?=
 =?utf-8?B?aCs4UmVIQjRkOE02K0E4R3Y1YmkyazdNWjFCTHdnNjdFTG1WaVQ1Qys4cFhB?=
 =?utf-8?B?MllMWnJIYy9HdHEvU1NmV3Q2RS9ac2hXRlNoZHdONTFtR3VyYzM2MzNQbUVU?=
 =?utf-8?B?L015RjRkYnMvandYaE9YYnRuZkdqTDF0bEo5MmU5aFMxeUVIVWRqbTZ4SXU5?=
 =?utf-8?B?TWQ5a1BmODE2MU5tRHVydTk3QTZJdTNPTFFuYzNBRFY3R01ON0ZQQW1uOVlE?=
 =?utf-8?B?b0R0MDlZU25QSnp4ckR1UStMTlA3MzBLVVlmS2Q3aVVSVmllQ2dkay9KQ0V6?=
 =?utf-8?B?bVlBY0J1dWp0QXo4dUZqWGY2Mk5wcTdtZGphSXBFZmYyWkMrc3RpeVlvT2Qy?=
 =?utf-8?B?eksrb00zelU2K0JpL0JSMlNkTjYrOGl1bUlDczNMYkJSeFFGdFM2K3J3RmNk?=
 =?utf-8?B?Nk1jWTNqQjlvUFlRdHU1NzEyTWF3SlVGeGdvaU1MamZmZUhETFNrU1N2ZkNP?=
 =?utf-8?B?NzlZbkcwNm5IcmdadStiZVZ6a2gvRFduNE1rODBtTmZiN0ZwYVliZGVIRHZs?=
 =?utf-8?Q?G6LoigxQUcMwGe2lcMxktBSIC8f26mxhBydS0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERqZi9MNXc1RzVkOHB5T2RYc3NhYWFKL1l0OVhtVDVGYW5oeTVOZUp6VC8w?=
 =?utf-8?B?OXBTWTRuZ2p1Uk4rcGVtSzFyaWZHR1IyOWhRVFBoRTliaHV6M3laeDR6L2pH?=
 =?utf-8?B?cklGVGpDZ3RXaXBXYlMxcVdseTE5KzFydkY0aWYzUVl4Y2V3NDhaSk83SWVI?=
 =?utf-8?B?cFc1VjVZWWtCM2trdjZ6dXBNNWhkaUpwdVg5dmVQQUZGcjJFVWNzUFYweldo?=
 =?utf-8?B?amhGbXAyRk41UWVOQTdiRGdXeGpXbkRFY0ZaSisvdDBneGtIb1FVS0p2UnhE?=
 =?utf-8?B?WW5yN3ZVU0djZU1XQk03M2Q0YXBTMG9XVmdtWE5Gbi9JZUlxN3NIblFRazFh?=
 =?utf-8?B?aElKN0JuOWVtbGxydGRramt5UTdlak0zQ01zSERWb2pucGI4c1pBcFo4Q3FB?=
 =?utf-8?B?Tld6YTBodS81MzJ5SjZVSExxZDhKSDk0UFo2NDBDRTA2dTB4K3pUc0o3SXk1?=
 =?utf-8?B?NEJjVkFyY253anYxWktkS05meFdidzIzRzVFNnRNaE1SYnhMdE1tUS9qdjdM?=
 =?utf-8?B?RFJLRDBMdmNqbEJzSk4rb3dZUnFxeTdnbkV2R0JkVmRqWDN4NHYvMzNXZVNQ?=
 =?utf-8?B?NEpYU2NzNmE5TUdRUTErYlpPSU9oYXhMN3JKK3ZLNW9XY1h4YlBNZXZaaFI4?=
 =?utf-8?B?NmFldE9MbGNlN0NhaHJKbHUrbml0NWVFdVFaeUQvcXJFL1NwTHNubThxbCtl?=
 =?utf-8?B?UU5xL1hRd0VCSWpjSmcwZWhIblk2eVNCeC8rVE5tcVNOcExMbzZQSTVmTk1I?=
 =?utf-8?B?OVN2YWY1T2JZQS9QM3RRNWVCTkRkdUdCd09GWGdYNmhpTWpWRmpxSkY3QUsx?=
 =?utf-8?B?dG9sZDR1TnM3TWYrWjhBK1FsbVIxUGkxamxZVHJzdUE0RUpjbGdxVnh5RDh5?=
 =?utf-8?B?SUtLa2l6bWF5ZkdGbDBFL2FPYzlWNkJzb0svLzlDZVdielAzUjlveDh1dHcr?=
 =?utf-8?B?ZzhEMEErUjJUZFZocWhPUFg4NWtyQTN2bDN0TlV4UDl6bTBuVDM0WmlsWVhQ?=
 =?utf-8?B?SWRsWDdhb05VOEJ2Wk5SUWt0VUFMVEROeUJpWHl2TVY3bmNDMUNwZEN0c1dn?=
 =?utf-8?B?NDhOY3doL256OTNvbjRzQzdhZWliZVhWQTJqNUpGNnlxdGZzNGZBTTJkYjJP?=
 =?utf-8?B?SVZiOVBFWWxSZGh1d2RmcWxIWGNyZ1JqYUxRZkRQODBaZG8rUFUxQUQwUjNT?=
 =?utf-8?B?RzZQaHB5SWZMUUJ0OFBUSWpzWHp5ME5NZmhTQStIdWdnM1RKU1VJOFEvVEV0?=
 =?utf-8?B?RXJ1bzNVMGpXd2R4VHBjWllNYlRoNStwcm9CTnBIYjJhUk5UTGRTQUhJN0RJ?=
 =?utf-8?B?RnFJQ2pWei9VVCtEcTl3ekl3MElWVjY0WXRpOVI1bDZFdnEwWEVjYzhYNi8v?=
 =?utf-8?B?eCtuYStyenowbU1Na2lkSGdmc21mUkFwV1JQSkFhZTdONHF4SURaYmdDbGZv?=
 =?utf-8?B?Z0o3YmFySTVxamNjMjN5emlmdDBueGZuVHhYVFphTTh0aG9wSDN1OFl0VEFV?=
 =?utf-8?B?WVVrUFlCTHFDK29SRTBrQ3I2TmduMnBrT0xGVmxYbmpibnAzZzRQREJodXdC?=
 =?utf-8?B?WFNCRGdyeis2V2sxNXQrcTJPc0F4eml4RVJjbklxbXRKazIwcHBweGtaNkFF?=
 =?utf-8?B?RUdBbVIvTHBVdDlaZU1ReE9IcnJvcm14WVErL09aVENmVDlyV1RydjN2aVJh?=
 =?utf-8?B?OWR1clVSd2xkSTd3YnhXVk4rL2ZmeHIvOVdFOHIrdFZuYkk0RlNrSVNML3Jm?=
 =?utf-8?B?b0w1dFNEZWVCSWxsRTJLVU1QaWxkZC9FdFZwYVJFZmplZkFVcUVMY0NaT3RJ?=
 =?utf-8?B?MG1rQjFFTkRpTzhTZjhCZWszMDhOMHVUaGh4WmJxUllpSWc0ZDhsZTh3dmxx?=
 =?utf-8?B?clVocXd5ODRaYlhZWllhUFZFSlBrZ20rcFFyekxLN2xvWWNLWjI5bk42a3RE?=
 =?utf-8?B?MjVXQUFGUi9HMVZrVkdwbmxRbGFQK2lYeWE4T1RIMXAvV3Qzc0lXekVZZ3ZX?=
 =?utf-8?B?aHFkcWZ4SktFanBqK0tBZVI1dkwrWFVjdVZqcS9yQlRRVE9XU3Y0dTJRZW5a?=
 =?utf-8?B?RndpdmovdDRMbk5GRlVESERsUjR1eTJ5cUk2KzVxRDNEcC9NRW9wK0VHTmt5?=
 =?utf-8?Q?y7wUcdnxAfiQwi24ZCZbLkqmW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854d1db0-810f-4bec-1b34-08dd917bc478
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 17:38:12.1904 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVJoc7KoAw4JN6JxE7LzMR5UoahJYbgv5iDrPJn88fpX6ii21uBbP8skbAMNlAeznuTXT9ZCNJwhiGlfPjGVhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7173
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

Hi Melissa,

The patchset looks good to me but there is WIP dcn401 code, meaning 
dcn20 and dcn401 are different.

I will check how to refactor code so this patchset can fit better.

Thanks

On 4/30/25 08:20, Melissa Wen wrote:
> Hi,
> 
> I've been examining dcn401 code to figure out what is causing a wrong
> cursor gamma on HDR issue reported in [1], and I found unnecessary code
> duplications during this inspection. I don't have the HW, so I'd
> appreciate if someone can validate this series (if it makes sense to you
> ofc).
> 
> This series basically adds some hooks to dcn20 base functions that are
> usually used in other hw versions and reuses those functions on dcn401
> so that we can reduce many lines of code and also increase the coverage
> of bug fixes by avoiding the kind of issue of [2]. Better for debugging
> and maintainability too.
> 
> [1] https://gitlab.freedesktop.org/drm/amd/-/issues/4176
> [2] https://lore.kernel.org/amd-gfx/20250430141156.827763-1-mwen@igalia.com/
> 
> Melissa Wen (5):
>    drm/amd/display: add hook for program_tg
>    drm/amd/display: hook up program_tg for dcn401
>    drm/amd/display: remove duplicated program_front_end_for_ctx code
>    drm/amd/display: remove duplicated post_unlock_program_front_end code
>      on dcn401
>    drm/amd/display: remove duplicated program_pipe code on dcn401
> 
>   .../amd/display/dc/hwss/dcn20/dcn20_hwseq.c   |  40 +-
>   .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 436 +-----------------
>   .../amd/display/dc/hwss/dcn401/dcn401_hwseq.h |  10 +-
>   .../amd/display/dc/hwss/dcn401/dcn401_init.c  |   5 +-
>   .../drm/amd/display/dc/hwss/hw_sequencer.h    |   4 +
>   5 files changed, 45 insertions(+), 450 deletions(-)
> 

