Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0688C3D8B
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 10:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CBF10E505;
	Mon, 13 May 2024 08:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWikODse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B091B10E505;
 Mon, 13 May 2024 08:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMpV09grsRKSAN9tmbj2W4xeuh/ws4GJgLxPwHXPAaiWH5EcWHATlZ8z5GuhkRw6Iw3UvXK4y6eEWUa/EYZcqX7P4Ok77et+QNDmgE611YgofEtrtXFytgxh6+JJRuyhFLJ6PZYa7EWB6Ro4goPz7UTAvn6KoQKUTD5FjKPBFQXTZ/n3ayn3GdrHGhSNbaZasaPutMKRuLYNAp1o0XNL6QPzdcot43PaYREjiLXP0713fwX6h8RuSnapHgmgdEb52qxkFg1o7s0klhOkyrsOuPtGaYifwQBTV9KcTUdhMxaXOghrEkiJcZ83+3BNLR9M5y1bUajIm/WSAANxRqSKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svoHXyXexgZXvl0jIboJ1QPkbaEpEtgIw9s1bGmGs3g=;
 b=kJxDtDSW/cCQ6PRNdsfBUOgtMKmeVqiymDCu2tjy7e4TFsvF1k4N8JDviTyVmS0vmPp+lxag//ortc/AqFaVRp9vi8s49v5LnC0eEj5d+gx+IaMq6UYMHTrddvUtTWKSCZr8C97wo24gDln6J9FdWEtAXUrtnh/TH4CjSWlEBcXGVdqtZUGZuwg9SK3Qte8b1AMTxp+jaDWQwgS/t/7vfVsW3wTagCpOMMxs+gJxJ4FDFZAqrLuEKJ9xyhaigUICvZn57I0d1piLcOS1suS0FoAnyd+dbGyAvMRQPNbPR667bn3KRTHKN2BMnKjasx7gwaQKAr2d5CyDneSwa0YRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svoHXyXexgZXvl0jIboJ1QPkbaEpEtgIw9s1bGmGs3g=;
 b=NWikODseycYklMy3kgYh3l4R2H9FfBjzkffLNtVRErp5sEBLVhhUpa0JJ9hitTM5yF3jIJN1yWoCkT9s7ns3bd/MErLqL728dOC7wiCwJ7Y1UM9HVQcWMJRpCJ6acKNly/WBQRcKZ3QPnJEBOmqfiZ3MeO8rG9xgv4MwzQIH3mUDH2Y1+GNitWbtRUGD5sVjZQLsLP/n4LDjgyywcbq9UVY6a00FJSFuvgTdXka/G4hO57mdENmdIwW/GRf6alL+xssEWlpkHBlGuoqLggzcJWRYcgY5RbLf/9Ew9Sta6hRpNIgcgXqozai+wV4fXUGzbw8Uml8QuGCmlXGb2+2OaQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BL3PR12MB6617.namprd12.prod.outlook.com (2603:10b6:208:38c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 08:50:10 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ae68:3461:c09b:e6e3%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 08:50:09 +0000
Message-ID: <0c6af8ed-3cd5-4037-a232-3f697d448573@nvidia.com>
Date: Mon, 13 May 2024 09:50:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document python version used for compilation
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20240512-python-version-v2-1-382870a1fa1d@linaro.org>
 <68e05c6f-d0ed-efea-6eef-a9ee008c6c24@quicinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <68e05c6f-d0ed-efea-6eef-a9ee008c6c24@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BL3PR12MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: c9de67bc-949a-4a6e-8a25-08dc7329b1cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|7416005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1hFTisySUtydWdZTS9PNEtPTE9tTUNFeS9tTVF0ak1mN0c5QlczUHg3TmJh?=
 =?utf-8?B?VWMzbjRJcnlRZ05PUWFhS2ZrR3JJcGV2Y1lwTGpLa2xMRUpjSG1LR3l5M1Q3?=
 =?utf-8?B?WGRwZGFTTFRSRU9ack1zbmN5SjJvNXdOeXZKUnJzaVUwdjVrV2NxbUpkRDMx?=
 =?utf-8?B?VEg4eHNZbVlTT0g2YS90N2NaZUVPZUxGL2lkUEgwaDZQL1QrVE8zdmFDeXZK?=
 =?utf-8?B?V0VkTDVEZ1B4T2pOdzl2bm9SeDdNckdFMW5xT1hkN1pTaTlneXVkOEJCWDlz?=
 =?utf-8?B?K3NNYmNya1NDdjA1bWdRamNmNkVFdkFUWlNndjhjQ0ZjUmtjVTFwWldlT1ZI?=
 =?utf-8?B?c21KckxSTjJSLzJQVEJ1N3VFenpXM3JhMGxuVFVCMW84cUVkTVNybEZyRWVK?=
 =?utf-8?B?SUh2Qklaclhrd3RyMG9BdHBIRUZjRUY0WkJmaGdFc0s3bll0V1BLcjJJREkv?=
 =?utf-8?B?MkpYYmhpWHF3Q0RrMWZTRnZaOFI4bDZFYzlrZFExa0RRbEhYcnpYOTMwcFZ2?=
 =?utf-8?B?dkFLWEgwbjRqeG5PWUdhak54RnpacllqS2I5RlVOaG4wSE4wdkd2aUdzN0Ry?=
 =?utf-8?B?Qk1WcVN1NlZRQ2U1QW10WFdDSjBKUHlPblFNSXYzNklQaHpscUVQcFgvSFll?=
 =?utf-8?B?akVlOWFsY1huM3IzaWV0M2VZcm10UkZsQkpkRzJGemc3SjVvQzdXN3FpSXUx?=
 =?utf-8?B?TDFGRllWY3U3cnkzT05jVVpQT2VKeTVHQ3ovSitBYmg5MmZSK3BzWWJCd2pE?=
 =?utf-8?B?by9rdS83dnVuTzE3aXBUSnlBbnYyR0xscjVVT1ZQclowR0RWTk1RZjlTWDhs?=
 =?utf-8?B?R2dudHRsVy82NytEd01UaTJHY2p0NHZwdDZpS1E1TGVlZHRRRm5tVmFYbDNh?=
 =?utf-8?B?Q1gyT29ZYm1PRXkwM2F3SWZSY2tjWmdFbHFBa2NHZ241NVFFMkJUQ1dQY1J2?=
 =?utf-8?B?UFNLamlRU0ptY3RFeVBFOTRCc3BxaUh6eHhMWWtJN1RSamlMQWlocU5VK1RE?=
 =?utf-8?B?Z2svT2hrbS9CSGtoMmk2Qmwxbk5oT3VVOXkrSDFzQnQ5QTFocWdRUDkveGJF?=
 =?utf-8?B?dGtpbkx5N0JHeXR4dHl6THd2MjhGRkhKQmhITmNZTkE1U3huRjY1Q29xNHdH?=
 =?utf-8?B?RkgwUnFXL21IQThhd3JTa1UrdldydWRpMFo5ZWhKdUFWTjIzSHMxTWI0OFpl?=
 =?utf-8?B?TzhRTmxLUnpZbVdCL0VMS3oySzlETjFwZnZKb2xvNy9Rd1Q0K0ZscWlyTUZZ?=
 =?utf-8?B?akwxTldtd3M1ZnR1NC9oOEdGSmtKWmZqa2RXazN5NmJCdG1NcWFTNDN1d0pQ?=
 =?utf-8?B?ckNCcFVwRlA2WUVwcDdLeko4eEVCZWlQKzU3cXhNbmR6VTE1TWlUeVIycCt2?=
 =?utf-8?B?d24xSitaQ2RsZ2RVS0hBMHIrUkFGeU84eXdDbld0N0lWbUMrQ25QUDQ0bFlo?=
 =?utf-8?B?TkFVcC9zMW9kUW9ZSzFnKzh3ODV5VUFOUFQ3MTJOVks1UWwxbUo0Y2dvVUp2?=
 =?utf-8?B?d1dJSDJOOXJaRWV0K0pmVGFDb2haWFVxMTExUjhOY2xmMlRjMGwwQmZKc0tp?=
 =?utf-8?B?S2NvbXF5WEhjS2UzZVNBWnRqZ29ZTXN2QUNjMDE2WWhyOHZEMUdsTzVOZGpG?=
 =?utf-8?B?UkZiNS9lQ2MrN3U1bFpWdGVhV2g1OXNYY1UzZ0ZSOEtyL1hkcUIxc1l4U2lp?=
 =?utf-8?B?bUE0bk5EdFlBWk1IS0hybEd4Y0h4TWxGRTFBM01SKzRXMXMxWnN2U0tBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5444.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjBXMDdFa21kMWpDcytSSDFxV1FGelZyS2VMYnY5Njh0ekE4S0tNNU1wYndk?=
 =?utf-8?B?V05YZUhqamR1eEJGR3R4MHRIc3dMTWtTUjVqYmhiSGRJVTFYWHhOdkt0c3pa?=
 =?utf-8?B?eVVrTmhMeEhYc1JUT3lmNnBHbjIxcEFTVkVOT09PanNDYzhNK3ZPbVJSdEk1?=
 =?utf-8?B?cmpjdC9xZWErTFhwMTBoaVBndi9Ed3hLYmZYeTdmbk9hWmp6UWp2Q0h2aVlU?=
 =?utf-8?B?bWo0bzhUTnlxWU8vaWE5THBEeCtUbGFNSThxcHUxWGw5SlF1MytXZzFkQWpp?=
 =?utf-8?B?TjFBZDJLSkRRY1BJY3NPcElVNHV2V0JNaTZ4RG5vSnQwZVIwSGpxK1NWa0Qv?=
 =?utf-8?B?cHVGVU10NEhURWZzOVVlSWJZZUY3MDdOblVDQ1dHWXBrdnlYa0F6VCtWYm5O?=
 =?utf-8?B?Z3pSZDhKTmJibDZKVjFqZ3Y3L1hvc2hnOTQ1TWdHRVVGV3IwMjNyNVBrMTFB?=
 =?utf-8?B?Sy9Oam1zME0xalBnR1ZNYm05VjZLQ1pZUEVGOXBVZEc5YkR1d0hCOG5ndXk5?=
 =?utf-8?B?czFHMWVkWjhianVwY1I2Ry9IVDkrVzBEUEdrQ09qUThyeXMzcWd5U25pSUhT?=
 =?utf-8?B?Tzh1aThSN3p6Z3o3U29sYnd0dG52VFFvM0hBbUswa2hKWGdRUzQ5eWswbWdo?=
 =?utf-8?B?ZEh6Z2lnRksybFB2Tnh6anJSb2c2ckxKd3dVNFo1ZjVWWTN2TUg1c3puREs3?=
 =?utf-8?B?V0tOY2lwY3dNM1F4MGs2OHU0bVdZcCtVVFB2STdTNDFRQ3BnN0ZwNzFZV2VY?=
 =?utf-8?B?QkJNS2xQMTJsUDFMVG9mSDQ5M05nSzVJVDdNQkdoRncyWnA1OXFtWFFzaFV1?=
 =?utf-8?B?eDJQemNhRUhSRFZndjRYUzRxd2R3TWorR1R3Y1Q4blQ2cVZCdjl3NCtOTnJn?=
 =?utf-8?B?MjZsWjhHemFxUC8reFNRM0h6aDFqMnQ5U28rd29QOTk3WEFtZlN2MDRwZGtk?=
 =?utf-8?B?bEdKL1dvY0o1QTA3Z1ZRaVdjZzlhdThSMGo4bGxlYmxWM1U2SmxQeTRFRXBu?=
 =?utf-8?B?UnBzRUYzWFQ0L2U0cHYwMTV0dGNaWHh4YjVadjFJN0I2Mkx4MkpzWk9ENmlD?=
 =?utf-8?B?MCtMRHBnaGZuZUpZeG9odG4zcWE1MDE2cktwTEJFZSs2Q3Q2dmhYL0hWbDhy?=
 =?utf-8?B?Z0k2NTFNL1VLKzQ3ejZTWlhKR3RpZEtnRjMvd2dNLzlxMVNuampBYUVBUFlS?=
 =?utf-8?B?bUZtL2V5dUM5NlR1ZGt6LytqcTNSUFp6T2pMTHp0aDlPWk5yUXdpL0xmclp5?=
 =?utf-8?B?NU9SWFAvN0hCbjBMSlNndVZXckV5SUxVSGtqclVwaE9rVzFnZzcwK1hkdHI4?=
 =?utf-8?B?Z1FSelNhSUFnOFZoNkhEWS9kSThEakI0TWwxQ1lJa0dvZ3E3YTIvRFJ3Y2hW?=
 =?utf-8?B?emdLY09xb2I1dW0wZ0ltMllpdkN6S3hGZUsraytvemJJUHpmcS9BcG9IU1dX?=
 =?utf-8?B?ZEJmcm43MmpxM2wyZWhQamx1RlRvd3FoeXVuMmFRdXJncU5YMXEzdmNpbkhx?=
 =?utf-8?B?Y3JIY0hYY2J2bEpyTThBNnhUM2VVdFRoeUY0QVVONVlaYWJIZlhwRDNjUlIv?=
 =?utf-8?B?YUtBQ1prMWxiQi9qRCtSWjFBL3FtZWh0QTRVSHF0cytBYVFDSGNtbWFKSC9C?=
 =?utf-8?B?UENLZlJId0F4MlBZS1poRFNPbGo3WW9XSlBpWE1Ealc5ZlpOaCtNOEVhendm?=
 =?utf-8?B?aXBMK05UWG5WMnVrWWFBRzVra1BKVWorNkJXS0RFK08rb1RVY2dWcERHRWF1?=
 =?utf-8?B?T0s5Z3ZBemFwdGdFTFhzeUJ5VHczZ2dPWHAxL2lIZlpJWHg4RVdTTHNTbzZP?=
 =?utf-8?B?clUvMkFxVnpjWUFseURsMW1EVHFTdUMrMEtqbjM3eXlKNHFTcHhyalNtM0hG?=
 =?utf-8?B?V29ieU9tNEpBSFB3Z0QwYjk2cUFOQTk3eEJkSUxCOUdEMUdEYUhZNnZBRDBE?=
 =?utf-8?B?eXhBakRsRURCdVY4MittK05aUE5GcWJweXl2RWpydUNQYkFZbjF2bmRjcHc1?=
 =?utf-8?B?bUkyRmR3dDFQS1JGTjdwTit3NE1oa2tNYWUwZThObTV3UmtRR0tPTytOVEE0?=
 =?utf-8?B?dmRTR2Y5L3VaZHNXaTlGWDlmNGdkQktzSG1senl4Wjd2WnhoU09IWllFcVhH?=
 =?utf-8?B?K09mRk9zYTFETkZVdlBWWWV0Y1JNRGpWeEZlcHc3MGE2L3czd3dSaldUNDl3?=
 =?utf-8?Q?CPqYTDXReiSEm/lxjVDGSUI43EfMAxGq4Jyc/ov581Nr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9de67bc-949a-4a6e-8a25-08dc7329b1cf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 08:50:09.6190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yvG/xQuA67Pvg+PhhJkqWXxe18K43Corw0Cdc2pju05KAl7wlseVHSvCxD+HshJYoTDzz+O37X/6zrweWhGHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6617
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


On 12/05/2024 00:52, Abhinav Kumar wrote:
> 
> 
> On 5/11/2024 3:32 PM, Dmitry Baryshkov wrote:
>> The drm/msm driver had adopted using Python3 script to generate register
>> header files instead of shipping pre-generated header files. Document
>> the minimal Python version supported by the script. Per request by Jon
>> Hunter, the script is required to be compatible with Python 3.5.
>>
>> Python is documented as an optional dependency, as it is required only
>> in a limited set of kernel configurations (following the example of
>> other optional dependencies).
>>
>> Cc: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>> Depends: 
>> https://lore.kernel.org/dri-devel/20240507230440.3384949-1-quic_abhinavk@quicinc.com/
>> ---
>> Changes in v2:
>> - Expanded documentation for the Python usage.
>> - Link to v1: 
>> https://lore.kernel.org/r/20240509-python-version-v1-1-a7dda3a95b5f@linaro.org
>> ---
>>   Documentation/process/changes.rst | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
> 
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


Thanks! I made a request to update some of our legacy builders and so 
hopefully they might be upgraded to a newer version. Anyway ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
