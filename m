Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C976CC13D34
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 10:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4339910E16F;
	Tue, 28 Oct 2025 09:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t3WzHDtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013045.outbound.protection.outlook.com
 [40.93.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17A610E16F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 09:32:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/arccEiprIwm00K5d+SZ/uc10ZDqohw623Bj3T5JndyKMTU0Th+jpQfgeBhmL5YaR6vU88QsYqHw1RS4BgQ/LucGMlwtLLpd/HAC35LnIAp73zwP6tE1+Qbwo0lMsa3CL1emP4bLiO6XJaSGlvgHwGanZr4RqNS24Pb+WelVdgEEs5jiLU3jNJ1AnA/44LBFcPjBRIh5eUVoHBq7f8sF7M+lPQX/g8GX57pu5S3jxNOGbyUj+BdVtllfoTLzRBuhK3SUhjaKYJndyQZXQIbFGFnS9fOkRzt3Lbjetka+d5FfJ1VBdq8H86OfYWRbDez6VoDuLl3ZywM7Py2z0dyTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQ7AoOjYFZOGL5fPAQPHD4Ndj7ep1FjVGInLu8c9YFo=;
 b=wnz6q44DN9z7/bSkg9vEENQcEnGbhObBrwKhYnE9NkgFH4Rq5IEGo9DqRH0teTzzv1a77sCSwfoe2YTLgw+bgh5kDUx4n9e40U6aFvxWTY5r+7E7pdXxC9bnYGFarVDI2m67gvHIrftAivL1bUxAmTyWdO4Q6LUC4tACKSFEtzIqJFlXpCpPvOwx2UlPQ7NIl+JeKzFc4+ExdWhAvX+6Z2494uQZ9HQqzkVkubMOWG+zFOSp5tccwvcXtYUZBLzaa4nm6yvX/LGrTa/TUq0bNjFdEMDAOhYZvcwkXZ2wpshvTa+ID1TTwr8bcnzDOjgEdWkLrOBSTNdicx+7sWza2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQ7AoOjYFZOGL5fPAQPHD4Ndj7ep1FjVGInLu8c9YFo=;
 b=t3WzHDtB5bpd6ewN99T0Uh3caMzca5ABtVqMF6EEINLVbALzkuU5/Ms2yZeN1NmWz1ik5cmvM/XZKhju5AifAO/g5d7f2/o6LGjs+/KhIvoWL0nmr48XBwmAwJYNSJn/VyNgSRgwxvUip2g+8EPrCf/FNvplqu7+I7OHlXyrw6h/W2lJHb1uaBJyaPiMWlgW14F/GCQQJ+rHR4TbJ61pxHbUeNY1Ejh2x6VwPjx4BqaiUrpzlOxIoKyabNzoxKlLsQ5ttKKXsULgucerQlprB4g/2rwGfDuSvPFbki+/nchP5KyLuiI5imLvXC1MIu3YqS92JOEJ5CNX6yRB2grIFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 09:32:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 09:32:33 +0000
Message-ID: <2c3f4af6-6f52-4912-ae4d-531c6ec9f75a@nvidia.com>
Date: Tue, 28 Oct 2025 20:32:25 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: Zi Yan <ziy@nvidia.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, David Hildenbrand <david@redhat.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <20251019081954.luz3mp5ghdhii3vr@master>
 <62073ca1-5bb6-49e8-b8d4-447c5e0e582e@nvidia.com>
 <97796DEE-E828-4B12-B919-FCA2C86756DE@nvidia.com>
 <debc988e-45cc-481d-b688-a5764647f3e5@nvidia.com>
 <D00196E8-E812-41CF-A2F8-A38251161ACA@nvidia.com>
 <3d58b839-a24a-4481-9687-3083541b80a1@nvidia.com>
 <8D530774-F2CE-444F-8453-529821F30E4D@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <8D530774-F2CE-444F-8453-529821F30E4D@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0020.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 0265f383-73da-471d-58d5-08de1604ec2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDZHRzZBNTVOb1J4cm56NFppY1paNGI1SjNOcENiMkxHSE5BaUdzNEZoL3pG?=
 =?utf-8?B?TDVtU2lCcFpDZ3N4ZUhuQVFyTUliN0YrTFJldFBOQVFxZS9IVW1qRlJwaTVM?=
 =?utf-8?B?TnQwRDNMZWN5SUFNUExMT1dtY3kzaXZFb2UyM2ZTM2ZnZHNYRFgxZ2VqYWIx?=
 =?utf-8?B?d2dtSGlrZnJaVy81VHJyUlhHcHhjSVMwVy95aUZRdmNmeWlzRWRLbWc3c1ht?=
 =?utf-8?B?Lzl0WDU2ZE1TS0ZXZkx2U2syd2x2eFYxTHFhemw3OU50cVJWa0JMN0VVT2dM?=
 =?utf-8?B?ZjFNYThuWldHdHpJQ3BzZklrU296cjBoK1Z1b0RhUFJvUERyL3lvaWlPbE0v?=
 =?utf-8?B?d0hRcTFUdEJMLzdhdURVZURpU2lDSldsZm8vbktOQkVUR1pmdG4vTG44dk10?=
 =?utf-8?B?eXpxelhhVzZhdi95YnNBYVVRTHhjM1NBWFVaVWlJOGhjRWZ4dVl2ZEhlNXA2?=
 =?utf-8?B?ZDduNGg0RzlpMlVlV0t3RXhQVzJzWEdjQjJ6ekFpVlBDbmtSRy9Yd09GZXNC?=
 =?utf-8?B?eDVEb1lLTkZWNUtDMk9UQnR5OVNVMFdBUnc2SVU5S3ZaSGNYNHlOVHlKL3ph?=
 =?utf-8?B?Snd6YjROV28wck5OWENueXlrbXozdGd6NWFwQzVxcDdXZFQrKy9QL25WUkk5?=
 =?utf-8?B?R0hFVFJ4VzdCWHE3NFpLMXRSZDlsZGdmckxNWHp5Z0RIVVZWZjZ3YzUyN2tZ?=
 =?utf-8?B?UUQrZUdaMU0vVXNCTTNlR210Z3dwZFY0dDkxeUhRNmcvb3BaWG1iLy93RHlp?=
 =?utf-8?B?dE8zN2diT1RqUkxJZWxXdWdvK2h1K2ZJMEFIcU9USjZrN0E3T0Z1OFNzTEtM?=
 =?utf-8?B?QW5nMm1INm90cERqNE0wRGZvSGJCcldBWGtwTlhCN3UxU01hRXQ3VFJpL2M0?=
 =?utf-8?B?MnZpaUREeXpoSWt4SVlDTkt2eHBDSWRLL2VKQTVObjNzaCtjdXZteWltOFlt?=
 =?utf-8?B?NEU4SUhCcHlHOXhqaldzYzRMdHJ5MENlVWx4N1RBWHREK01XOTJJa2lqL1dB?=
 =?utf-8?B?eGFxQzZubUQzNy9FeGJPVjl3dk56aFhuR05UQ2RFL2N0RWgvQk90ZTVHRXpl?=
 =?utf-8?B?TVZyS0ZscTZzYnd2NkxKaVRoZFZnWFcvaUUyME5pMlVmS0lFcEh3YVVxQjVp?=
 =?utf-8?B?b3dtd3RZcXlTblVUemxCa0ZoR0F5eiszeVRlWGJERlFsUHFveEZCYWRSN2FY?=
 =?utf-8?B?TTZ6UHVZeUx1SDQrMEJZVnhJRzNUTEwxbzRlWmtxaTdWRmJCRTVmaFpuVm80?=
 =?utf-8?B?MDJEU21wb3E4QnVQbjVhdVFEWUZ2a0tNQkFLU1grTEhUNGcwU1JIdWZWaVBt?=
 =?utf-8?B?MTJ2TEEvVm4xZ0huSFpKWFJ4RjhLWmo5WUw2TmtwTU5HblppMnd6ZHpnbDcz?=
 =?utf-8?B?T25RdG12Vkd3cFJQT2JrOWE4WTdDVkNTdTdCbHFLMWNVQ2dRUE04ZXdMbzZZ?=
 =?utf-8?B?QmJlSndtUVQyUkJSdGFJY1FETHZ3QzFsUUlSK2w1SWRlZEhKOXVST3hWVzFI?=
 =?utf-8?B?clFXT2hIeEdJUy9MZzhDSXpWN3Z1TkVWZk5PamFWMmhDUGwrdzZhdkV6THFJ?=
 =?utf-8?B?dklKSDA4N0hVWk5mUVBnU2I3NkxKT285Lzc5Ukw0YW80QjFBdzUvQzJEZG1p?=
 =?utf-8?B?bUNGQXFMbHFnWUlqczVHc2FZL00wVG56NEsxbGJLNzNXZFMzWlZNLzgvNmp1?=
 =?utf-8?B?bGxZdWtSTTVFZUoyUXlUMkdIYnpvbFNmY04yVEtOSHBGYnlSWDU0QjBudm5o?=
 =?utf-8?B?aGt1Y3AyTE5ZSVVQNjVpdklIbzZkT28zNm52c2dYRzk5Q3MxNE1zZmVsK0RG?=
 =?utf-8?B?WDkxTzN3NTMzRTNoeXFwY2hNbGJHbndjSUVyNmp2a3RzZzBncERQaWE3azJz?=
 =?utf-8?B?Vkxjcm1iT0t1KzNoaDgwOFVlSHllcmd3OVYvTXdVaERFcC9YUjJ0dUYzR25J?=
 =?utf-8?Q?Cp3wvXq4CF23Q5xKSezwa64MyfmN5txq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2J5SkhGV2czYTh0cGMrc1BaTVBKaVVwZXNtVTFteU9mWWdlSHQyMHNXeTZB?=
 =?utf-8?B?SlRUOXBwZzJxWGRpZHIzNVp2OEVLTjFWYjliOUNUNDdDaHlBNXE5L3grcFc4?=
 =?utf-8?B?b0RrY0wrUUhqc1ZNc2gzRzFMTVFzQmppeTVyWDI4cmNscE81YUVkV0FGSjRH?=
 =?utf-8?B?Ym1oaHpWaDk3TzdkQzk0eWtpaGo1NEV4aXBEWGZRdDRwUTdBWXZaenRic09Q?=
 =?utf-8?B?ZkJNbCtheEVMejVaSDIxNFVxMXdGMkx5ejBFRG5iQ2Q4Vkxrcnp5UjV5Q2py?=
 =?utf-8?B?eTJ5bHg1V3B6VktXakJFdkx2aUV6WGNGSlYrcEIvUnRtY2szTDlDdGdDdmN3?=
 =?utf-8?B?OC9XcHAySEVXamx4TC9LTmVqWi9KcndUZGRnRDArZmhUR25Hc1d3L0VudlND?=
 =?utf-8?B?eWc0NURObW85WVFFQ2pHTXVsSGlMUmtNc1RzSS9lRTIya082VUFXRVYzZ3Nr?=
 =?utf-8?B?ckE3MWxqa1BYVWZxdlNaS0tuajNtSUFIMXRqT3JkVGxJQ1U3VHJScy8wNFZk?=
 =?utf-8?B?dWp5ZU9MUXBmWjA3SG1FUWN0cWRqV3ZGdGh2Q2dMOWFJL0NUOExmb2VuU2JI?=
 =?utf-8?B?NFJFTUZKRmQ2Q1JDdkhJRXRValRJYXF5T2N3ekNCUWY0UnB3NmF3THQ0MFNp?=
 =?utf-8?B?VGp0cTJqZ3U2cGlGYWtTZGljM28zLy9KdllBSldVazRQNml1MDcxK2hNbkpR?=
 =?utf-8?B?Q0pZdytOMFp5aVNTOC8vVnJDR3BGQVhsM0drcnNEOFlZdnhhTGVoS1lSSFR1?=
 =?utf-8?B?MDFDdTRGcWoydS9mQVlSZUJZMlY1QjRFb01mSXBmNTI0dTN2TWVPbUpZWm40?=
 =?utf-8?B?ZUdVUW81TVRUOTc1eFVuUFovS0hSV1ptakZ4ekw1MnJkU2NSa2tNdUFrbHFx?=
 =?utf-8?B?OVd2Vm9YalQzdmswRGJXZmhHV3lqdjhNRjBraVJkWWFzUFhsanZDVTg4NDNm?=
 =?utf-8?B?QkRScEtBbno2a3Q0c1M3SC9sd1RPTjNLZDhNWDFYYUY3YXd1THZDTW9ONjBW?=
 =?utf-8?B?QWVCN05hV296UVYvMFZIa09sU1ZCeFpXdjZUN0dsZXNlZXJWNHJxNUZUYXBq?=
 =?utf-8?B?cUtXWmNaaks5ZTRQdFJLVk8ySElxZWJJODFQanBXOEpkR0I2dHZHTFNrVENn?=
 =?utf-8?B?R2FXSWpsWHdPdmN1bzFoY0NXOUhuTGkwdjdOZ0x1bzNXY0pmcU1tODFYWkV4?=
 =?utf-8?B?UVNxK0NYZGIxMzZyK0RtY1FTQnduYXY2dzFFQWVVR1A1UFVReTVYVWdkNXl1?=
 =?utf-8?B?QmxQRGl5NVhhWWZDblQzZDduemJXMDREbFI3UnVpYVEwVnpQb21hbENac0xV?=
 =?utf-8?B?UDBOS1dwWUdzd3BzNk9mQkRXWXpaQ0NIK2Y0elNhWE5mczlMU2kvSk85aWFY?=
 =?utf-8?B?c1pUVDNieDJQVXNUNTBucERQSHhzN2RpOFpzR2YxbEFxbk9rS0RHajlXeHps?=
 =?utf-8?B?Wm1pcXUrdkVGQXN1dXJCYzBNRDk3UEhSd0NuOUgvdHNVbG9tYU5TeXdnc0hj?=
 =?utf-8?B?azZNTDJtNDJYMFFZeE9UK0xSdG5tWndtdzNUaVhLaThKZkhwNWpTOEkybjBX?=
 =?utf-8?B?M1hwZ2E5RjdMM245QXhoNWNzejJOazh1TENSNDB6U29qZmQ2dGhjN3FOQ0J2?=
 =?utf-8?B?NVJzRDZSYXBxNmlOQkJpZlh5U1RJMEl2WS9xN0k3MG15U2R5b2ptQnNwd291?=
 =?utf-8?B?VjZnbDh1K3lOanEyNUdiaS9KWVpRVkhVS2RPb3ljdFlXY20xUk5jMWtPRlRu?=
 =?utf-8?B?WStTdHVZSE84dkYvU1pqbTJBdlJMcFhCMi92eVVlSWNqRXQ0RWZyRTFTYnlk?=
 =?utf-8?B?b1VZWTI4L3pJWmlkenAwbzVlbGk4RUtqSmlMaXJvbDBOM05QaC9kMnpFS1pE?=
 =?utf-8?B?b2lnR1NvcDE1UWVtSE52UXViV1p1NFZvMk15N0NsVzNGbXJydmJ1ZW1ldkhB?=
 =?utf-8?B?OURJTmczS2UycVp2VUdVQnUydVh2NmNQZVFNRGdZTVo2Y1hyKzhHNytCdUZx?=
 =?utf-8?B?cHovV0piMmdhQlFFMExKTXZqb0JpSG52SUZMdm45bXpHVTh6c0xvK3BPSnZx?=
 =?utf-8?B?NTR2REt3WXpVWWwvVHJVazBqUjRDSUo2alovQm9BcEFYNDVQWllqL2xkZ2Zm?=
 =?utf-8?B?SCtWMkZqLzRocVJZaFJrRjFZVFBGY1pGQ0lJMndDZ0cwdVlpUnV1d0h0U2Z1?=
 =?utf-8?Q?bF5aTqsO0FTWto2FCf8kewSq2YPa8yLT8DgAD7TQOcMa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0265f383-73da-471d-58d5-08de1604ec2c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 09:32:33.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJhQXJ4SVoHXA+7CoLPPtYF0lYeEg2HAogK9Z75wYVZxvblCknPKgv6CW39eAXCjHOKSK9W3oG15CpA4KPgNPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478
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

On 10/23/25 02:26, Zi Yan wrote:
> On 22 Oct 2025, at 3:16, Balbir Singh wrote:
> 
>> On 10/22/25 13:59, Zi Yan wrote:
>>> On 21 Oct 2025, at 17:34, Balbir Singh wrote:
>>>
>>>> On 10/20/25 09:59, Zi Yan wrote:
>>>>> On 19 Oct 2025, at 18:49, Balbir Singh wrote:
>>>>>
>>>>>> On 10/19/25 19:19, Wei Yang wrote:
>>>>>>> On Wed, Oct 01, 2025 at 04:57:02PM +1000, Balbir Singh wrote:
>>>>>>> [...]
>>>>>>>> static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>> 		struct page *split_at, struct page *lock_at,
>>>>>>>> -		struct list_head *list, bool uniform_split)
>>>>>>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>>>>>> {
>>>>>>>> 	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>>>>> 	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>>>>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>> 		 * is taken to serialise against parallel split or collapse
>>>>>>>> 		 * operations.
>>>>>>>> 		 */
>>>>>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>>>>>> -		if (!anon_vma) {
>>>>>>>> -			ret = -EBUSY;
>>>>>>>> -			goto out;
>>>>>>>> +		if (!unmapped) {
>>>>>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>>>>>> +			if (!anon_vma) {
>>>>>>>> +				ret = -EBUSY;
>>>>>>>> +				goto out;
>>>>>>>> +			}
>>>>>>>> +			anon_vma_lock_write(anon_vma);
>>>>>>>> 		}
>>>>>>>> 		mapping = NULL;
>>>>>>>> -		anon_vma_lock_write(anon_vma);
>>>>>>>> 	} else {
>>>>>>>> 		unsigned int min_order;
>>>>>>>> 		gfp_t gfp;
>>>>>>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>> 		goto out_unlock;
>>>>>>>> 	}
>>>>>>>>
>>>>>>>> -	unmap_folio(folio);
>>>>>>>> +	if (!unmapped)
>>>>>>>> +		unmap_folio(folio);
>>>>>>>>
>>>>>>>> 	/* block interrupt reentry in xa_lock and spinlock */
>>>>>>>> 	local_irq_disable();
>>>>>>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>
>>>>>>>> 			next = folio_next(new_folio);
>>>>>>>>
>>>>>>>> +			zone_device_private_split_cb(folio, new_folio);
>>>>>>>> +
>>>>>>>> 			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>>>>>>> 			folio_ref_unfreeze(new_folio, expected_refs);
>>>>>>>>
>>>>>>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>>>> +			if (!unmapped)
>>>>>>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>>>>>
>>>>>>>> 			/*
>>>>>>>> 			 * Anonymous folio with swap cache.
>>>>>>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>> 			__filemap_remove_folio(new_folio, NULL);
>>>>>>>> 			folio_put_refs(new_folio, nr_pages);
>>>>>>>> 		}
>>>>>>>> +
>>>>>>>> +		zone_device_private_split_cb(folio, NULL);
>>>>>>>> 		/*
>>>>>>>> 		 * Unfreeze @folio only after all page cache entries, which
>>>>>>>> 		 * used to point to it, have been updated with new folios.
>>>>>>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>>>>>
>>>>>>>> 	local_irq_enable();
>>>>>>>>
>>>>>>>> +	if (unmapped)
>>>>>>>> +		return ret;
>>>>>>>
>>>>>>> As the comment of __folio_split() and __split_huge_page_to_list_to_order()
>>>>>>> mentioned:
>>>>>>>
>>>>>>>   * The large folio must be locked
>>>>>>>   * After splitting, the after-split folio containing @lock_at remains locked
>>>>>>>
>>>>>>> But here we seems to change the prerequisites.
>>>>>>>
>>>>>>> Hmm.. I am not sure this is correct.
>>>>>>>
>>>>>>
>>>>>> The code is correct, but you are right in that the documentation needs to be updated.
>>>>>> When "unmapped", we do want to leave the folios locked after the split.
>>>>>
>>>>> Sigh, this "unmapped" code needs so many special branches and a different locking
>>>>> requirement. It should be a separate function to avoid confusions.
>>>>>
>>>>
>>>> Yep, I have a patch for it, I am also waiting on Matthew's feedback, FYI, here is
>>>> a WIP patch that can be applied on top of the series
>>>
>>> Nice cleanup! Thanks.
>>>
>>>>
>>>> ---
>>>>  include/linux/huge_mm.h |   5 +-
>>>>  mm/huge_memory.c        | 137 ++++++++++++++++++++++++++++++++++------
>>>>  mm/migrate_device.c     |   3 +-
>>>>  3 files changed, 120 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index c4a811958cda..86e1cefaf391 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -366,7 +366,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>>>>
>>>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
>>>>  int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> -		unsigned int new_order, bool unmapped);
>>>> +		unsigned int new_order);
>>>> +int split_unmapped_folio_to_order(struct folio *folio, unsigned int new_order);
>>>>  int min_order_for_split(struct folio *folio);
>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>> @@ -379,7 +380,7 @@ int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>>>  static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>>  		unsigned int new_order)
>>>>  {
>>>> -	return __split_huge_page_to_list_to_order(page, list, new_order, false);
>>>> +	return __split_huge_page_to_list_to_order(page, list, new_order);
>>>>  }
>>>>
>>>>  /*
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 8c82a0ac6e69..e20cbf68d037 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -3711,7 +3711,6 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>   * @lock_at: a page within @folio to be left locked to caller
>>>>   * @list: after-split folios will be put on it if non NULL
>>>>   * @uniform_split: perform uniform split or not (non-uniform split)
>>>> - * @unmapped: The pages are already unmapped, they are migration entries.
>>>>   *
>>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>>   * It is in charge of checking whether the split is supported or not and
>>>> @@ -3727,7 +3726,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>   */
>>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		struct page *split_at, struct page *lock_at,
>>>> -		struct list_head *list, bool uniform_split, bool unmapped)
>>>> +		struct list_head *list, bool uniform_split)
>>>>  {
>>>>  	struct deferred_split *ds_queue;
>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>> @@ -3777,14 +3776,12 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		 * is taken to serialise against parallel split or collapse
>>>>  		 * operations.
>>>>  		 */
>>>> -		if (!unmapped) {
>>>> -			anon_vma = folio_get_anon_vma(folio);
>>>> -			if (!anon_vma) {
>>>> -				ret = -EBUSY;
>>>> -				goto out;
>>>> -			}
>>>> -			anon_vma_lock_write(anon_vma);
>>>> +		anon_vma = folio_get_anon_vma(folio);
>>>> +		if (!anon_vma) {
>>>> +			ret = -EBUSY;
>>>> +			goto out;
>>>>  		}
>>>> +		anon_vma_lock_write(anon_vma);
>>>>  		mapping = NULL;
>>>>  	} else {
>>>>  		unsigned int min_order;
>>>> @@ -3852,8 +3849,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		goto out_unlock;
>>>>  	}
>>>>
>>>> -	if (!unmapped)
>>>> -		unmap_folio(folio);
>>>> +	unmap_folio(folio);
>>>>
>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>  	local_irq_disable();
>>>> @@ -3954,8 +3950,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>>>
>>>> -			if (!unmapped)
>>>> -				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>> +			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>
>>>>  			/*
>>>>  			 * Anonymous folio with swap cache.
>>>> @@ -4011,9 +4006,6 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>>  	local_irq_enable();
>>>>
>>>> -	if (unmapped)
>>>> -		return ret;
>>>> -
>>>>  	if (nr_shmem_dropped)
>>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>>
>>>> @@ -4057,6 +4049,111 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  	return ret;
>>>>  }
>>>>
>>>> +/*
>>>> + * This function is a helper for splitting folios that have already been unmapped.
>>>> + * The use case is that the device or the CPU can refuse to migrate THP pages in
>>>> + * the middle of migration, due to allocation issues on either side
>>>> + *
>>>> + * The high level code is copied from __folio_split, since the pages are anonymous
>>>> + * and are already isolated from the LRU, the code has been simplified to not
>>>> + * burden __folio_split with unmapped sprinkled into the code.
>>>
>>> I wonder if it makes sense to remove CPU side folio from both deferred_split queue
>>> and swap cache before migration to further simplify split_unmapped_folio_to_order().
>>> Basically require that device private folios cannot be on deferred_split queue nor
>>> swap cache.
>>>
>>
>> This API can be called for non-device private folios as well. Device private folios are
>> already not on the deferred queue. The use case is
>>
>> 1. Migrate a large folio page from CPU to Device
>> 2. SRC - CPU has a THP (large folio page)
>> 3. DST - Device cannot allocate a large page, hence split the SRC page
> 
> Right. That is what I am talking about, sorry I was not clear.
> I mean when migrating a large folio from CPU to device, the CPU large folio
> can be first removed from deferred_split queue and swap cache, if it is there,
> then the migration process begins, so that the CPU large folio will always
> be out of deferred_split queue and not in swap cache. As a result, this split
> function does not need to handle these two situations.

It leads to more specialization for LRU and zone device-private folios.
I looked at giving it a go and ended up with some amount of duplication, with
taking the lock, freezing the refs and then prior to that finding the
extra_refs with can_split_folio()

Balbir Singh

