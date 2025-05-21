Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 146CDABF1CB
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 12:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E268510F779;
	Wed, 21 May 2025 10:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MYZ0ue7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387D710F00E
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 10:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZisvHNSQsCnsfDy5zOPbmuEO+5phzVjgUl3vNlfHqww58thTzp4r4ONOf1aq/TwqTIFRuUpV9y7WV0L6Vhv8lONQkX8zWieWWUI4BJjJe8g15TGQZPozlraHXIn6WaRnv20LVPSWOIdF0TqDaJggE/M+zdJl7BZfUk8/28rpOdKz/3uE2Xtf1NE38a+Urew2NJziGPvfxojchHlLrjLcZtvOejfPTnPDIjbPJf1Rd2npzq+RW3MvCCsrbmPPkKpC7exukaUFNe+lOMza+mWK7W7uPDRSJAuc+pmrdkQTK2XFGpFB5l1kHJfI3XQP3LKXz7E6MXm5k9gDAJsHD3hLDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSj+c5lPmj6muCOiAfCFoZhlWvgIYz1/3+uU0Csg/is=;
 b=G+DDpo15KdT+TPTO+QD534mWPpDIsLtxs7B/EkCKbOC7y4SooEpf6GBRWvR9DQmMtrjxf0sbnms0Zyk8bOaaumBVDGI8IuPnUEQzNYkeb2I7q6avyBC4YceqrxoOtaO4t1NnixQJ9UT0AsFrC2TjF8gVyomNjpOZLk1ZGOHhQrYQJ9r95BBWCUJL2mXIrtEV64xX3us6gDU1DyykLcH741BsMlKEHFnxOP7CcsKIRPiJ2t+kOsAiyGdeoC8S6TXjYPnbq/XeaJC+eMGRVczL+WtOi/UFn3EnsW/1c30nUjFoLLOW9z0DaJi1HnisajfL/F+iYPMzvS4xNvOdNpdPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSj+c5lPmj6muCOiAfCFoZhlWvgIYz1/3+uU0Csg/is=;
 b=MYZ0ue7cT4FYLWQLKbHp2rMsRAz98VTyyTjI9Dg35VfF8sfEhCbF8ATOOBugikt9RE7uzhc6A0DJd9A1fiIE2pVAzV5Q0axXq+0tzdbW7CtOX4GN2eZRfZuawPoIPVi/AhhOAPx5TdNrjasr0lRFTJsZ0k83xQ7jZbHuG26Sn/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by SJ1PR12MB6337.namprd12.prod.outlook.com (2603:10b6:a03:456::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 10:41:14 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 10:41:14 +0000
Message-ID: <d2599cc3-9ed1-4c20-9072-a38e1c3e2b0b@amd.com>
Date: Wed, 21 May 2025 20:41:03 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
To: Zhi Wang <zhiw@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "seanjc@google.com" <seanjc@google.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "yilun.xu@intel.com" <yilun.xu@intel.com>,
 "linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lukas@wunner.de" <lukas@wunner.de>,
 "yan.y.zhao@intel.com" <yan.y.zhao@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "leon@kernel.org" <leon@kernel.org>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
 "zhenzhong.duan@intel.com" <zhenzhong.duan@intel.com>,
 "tao1.su@intel.com" <tao1.su@intel.com>
References: <20250107142719.179636-1-yilun.xu@linux.intel.com>
 <371ab632-d167-4720-8f0d-57be1e3fee84@amd.com>
 <4b6dc759-86fd-47a7-a206-66b25a0ccc6d@amd.com>
 <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050> <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <20250513130315.0158a626.zhiw@nvidia.com>
 <8bc605ad-54ad-4d3a-9547-caa9d15887f2@amd.com>
 <dce6c363-20ea-49b2-9cd1-9cc5e697162a@nvidia.com>
 <20250515195330.1d63be34.zhiw@nvidia.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250515195330.1d63be34.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SYBPR01CA0079.ausprd01.prod.outlook.com
 (2603:10c6:10:3::19) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|SJ1PR12MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 352799e8-c4b0-4672-d76e-08dd98540226
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2tobzZkSTVYanRhM0FMbFJhUUw5cGxscTUyR2hpTlhiTm1uNXk2SXE0U0V6?=
 =?utf-8?B?ZUozNzVHNTUzbkJWRlVrU2NQUVE2NUh2SkQxbEpiYXVKRTVZbzFXRzQ3ZzdM?=
 =?utf-8?B?dk9HOUpEU1dvRXhYQTJvZzRNcDc0K1VIT09LUEZhS0E2bWxPaWxPQ0NxblRV?=
 =?utf-8?B?bHBRYmoxZi8vZGFWM1BBNFJ4WWE5L2lGSHVuVk55RG5XNHQ4R3FtN3JtSDRQ?=
 =?utf-8?B?VG54NUFDNXFNSEwzVWVpS0tNdWNJR25MQ3RzeDZiSjRDeFRBWmlQU0ZsRk5z?=
 =?utf-8?B?MkYrc2hsbFY4by92REFuZG1CekVsMmpHNDd6QmdJbC9oaVBPNzR3bVRIaGc4?=
 =?utf-8?B?cmo0QmVYMDdWRE02WWc5WDE3T2RRVWEwZDZhSkl6NjUray9td1ZHQWNTeXhT?=
 =?utf-8?B?OGtreFllbXNLam5PSGJranFWUXh0Q3JCWjhFVDNhRENmV3NTWXd3TlpIWHBJ?=
 =?utf-8?B?b0dqTk1XMnNsTU5IdmFJK1ZoM1dBZGNEZ1R6KzIzRnkwM1Z5RTlQQkg4d2M3?=
 =?utf-8?B?aUdRZjNFanBTay9wQy9LNUxCUmY5Vjc3dFlSeTZTRGJ3Sjg4VHRodmpHeUNi?=
 =?utf-8?B?RjNaR0kvcU1kUTlFZEFDN1N1M1BIUjFVM3BaK0tueVVyN25ZSjhlSGIvQW93?=
 =?utf-8?B?YjNKR3pneWlScDJjakdtQ3NOMGtYQmE1SXA0anNUYUpHUzhEUGZWbjRDVjMx?=
 =?utf-8?B?OE9oNzQwOW1iNkk4azFqNzJLUXJ4NXprNU9MZUJ1UStkNWp1S3R5OVB3cjE4?=
 =?utf-8?B?Y25tN1cyekNBMTdPdXpqZ2VxZytIdklTR0s2dmUvbTR0MkZhdjVHSTR5VEl1?=
 =?utf-8?B?eHRTV3BjNjFyMmlSSzdvS0lVenlPV2ZCcnprVkgzeSs1cCtHYWtwSDFBUTdO?=
 =?utf-8?B?MXFReThNQ205OGJaUUtWOGVRaWlyWkZWS2lnTFpaOTlFV1d6Mngvc1I4ZEUr?=
 =?utf-8?B?S0E2allaellHWnNNc2ZGRERXWE1kVUc3RytlWUtnbCtlREtNU3JPVXBIMUVE?=
 =?utf-8?B?QjlKdTdYcGFrS280RjZZc1daV0dlbXNIcHhtU1ZnY0FQanNEWGl6QkZWN2kw?=
 =?utf-8?B?R0xZK0VMZmZyTTJEWnZOTmpnbXNMcW1CUVBLMWk4alJnNlg1QzMzNDEwM0x5?=
 =?utf-8?B?Z2ZQYjBsRlhCZG15NGV2OVpWYkp5TnM4SE5VRE4zL3hUcjlaYkNRdStRcy9r?=
 =?utf-8?B?Q2ZWZDAxbWN2bFpyNUluclpGMmJvRE8wdmNiKzZsTWJqUWl3eUJyck55eGRX?=
 =?utf-8?B?Tkt1cEpJUHE0Qk5Falp0YWlMMjQ4QU11VDUwZS93RzVLMnZQaE5XVEV6clhv?=
 =?utf-8?B?UDExYlJ1NzdxVHZ6elk4dDZJYWlhb0FBNzJIK2N4SzYxb0pRWVBxRE9aYkR3?=
 =?utf-8?B?aTVQb0xZOTNiZUlKVUJyQ2kwRWVvbGtUNW5uMHd2Mm9WbVhtZkk5S3JERzFQ?=
 =?utf-8?B?R1o2UXVyQ0FuWW1kUlNzbTlmNXhnMjJUUjVkS1pQM28yNmk4cm9uOHN6OHVZ?=
 =?utf-8?B?OFBMVTBwZVI4QkxFQk9ydXduaHdNN2pPQ0w4cVZ4a1dtQjdsWVlBd1RvYkk3?=
 =?utf-8?B?T2pjbUkwZVBjaiticWUwUkVaLzYzTGM5TGZDeFdxMThac2t5dkRVQVRSNU5W?=
 =?utf-8?B?bXdoWW5FaHhQMGdGMEYyUHNtdmd6cWY2eEtaOUNDSEUyVlFGUlZGS1FSTU8v?=
 =?utf-8?B?bUFMNjJYN05DL0EwVVhLM3BhdXlOUWUxdm1ocHRzNTRpRjJ6aUVhM2dQVUJY?=
 =?utf-8?B?WjZTK0d3ckYzMjVNVlhPclhmQUcvbDduc0VZbTl1NEVqMjlOdysvM2Y1MW8r?=
 =?utf-8?B?bnZseG5PSCt4czkyTFArSXJCc29SK1NjcnJmNWNiMzdMV0pleld0K0o2S1ht?=
 =?utf-8?B?Q1Y3Q1lZUGhvMjI2U0RjMGVuejVURUlFdEI1MEx1bSsvS0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGQ5T2NqYVV2WGl6SEJpWmlyUTRoVXNkVWcxOXpWMjIwNUhSMlFiTTNNNlZS?=
 =?utf-8?B?dG9UNFFmY0F3NU1PMEdQem5mRjFtVTVEYVVySDdCSGVuNG51MkMwRytPR0Yy?=
 =?utf-8?B?MURLRy81UnVqT283bEVTUjRsRlkyS2VSeWFpT01wbTFTZEM3bmJWMzBoUHRR?=
 =?utf-8?B?T1pxV2RiUTR6TDlFZ3daYWkxQ2JBd2hLNlQ5Y2RMZ0JmUUNhSW1GR0JPS2lS?=
 =?utf-8?B?VmptU1FZZDRCL0FNdjJjdktKODh4ajl0ZEZKUDloaTlDL0JBeWFWazh4Unlt?=
 =?utf-8?B?WXM2TEtRL3d2dzAvMTQxR25yM0xrcWh0R2VhSTY5NlVVYVVOUTdweWQyVEdR?=
 =?utf-8?B?VUc2N3BBZXJiWmh6KzZQVUMyOGxXMm95VUQ1QVFlS25wOWhpYm00WkZjSU9s?=
 =?utf-8?B?MG9STyszaWhYZGhyNmphUjJxM01sc3d1bm5zTjgvcUsvZUJmWG15dDJTR2Z3?=
 =?utf-8?B?bkI3ZUU2eE92ZWlEUWdjKzN6ZjIvWEJPbGFOSEtXM3NzTzI2cVdNWjBPVVZx?=
 =?utf-8?B?WmpUY2QvbTI5c3FEcFlxNWF3M3pIRkprQ09yZEVlUDBxWUJaQUpJWUxYdmJS?=
 =?utf-8?B?ZENtb1FNSEZHQ3dJcEpCcFJ4THgwK0hPZlRZcy91WkE5T2diOFNpQ3hnTHpk?=
 =?utf-8?B?andOQ2dhamxCRnQ0a3BsL3Z4K09odzl1SUljQzh6SG1xTk50SFB5R2I4amtL?=
 =?utf-8?B?aHNZeXdOaDhjQjYxdWJ1dHZQaFdxZEtYYWJaTVBkenMyL1pOaXAvQU04dXFL?=
 =?utf-8?B?R215MkNuck93clg4TU5qYzM2RDNzOG9PdlZjM0dKTFJnN3Zrc0daT2NJTWlh?=
 =?utf-8?B?cXNSMWhKM3NpUjJPQXBIbWZmSXFrc1ZLTmhZdkJvYXJYTEFveGVVOFRoN3Zv?=
 =?utf-8?B?QkxlTlpPM2kvd0hzMVZHc1BJZGxZYXkyVVJRbXhmVU1JM2l5QXhHUGdWZWdI?=
 =?utf-8?B?cE4wdk4wc21Da1RMWW05dDlld3lVTDE0aXZwMW9DQ09LVFJqR3IySlBna3Bh?=
 =?utf-8?B?VTNrMFNzTUd6Rm1wdW84ZlJ6TFNhaWk2Z3ZHUjMvNFpHSjNYQnhCMEdIUmd3?=
 =?utf-8?B?OWNaQUEyWGVwVzZ3OTRFN1hHcWxua0kzdWVzMVQ5T3NIVkdFbFlrcmpYMFBj?=
 =?utf-8?B?dVRVcCtkYWxSNWlldDdPWXkwM21UZjB3Wk8xVlo2UUY1emZIS3I4REdXK1h6?=
 =?utf-8?B?SkZPS1JCKzVEdFpqUFRoWk5YVmF6cHQvc3hpTzEvNFloWU8zWG53akJuQkJP?=
 =?utf-8?B?NVhXVXJyZk14YTBlL2gxRkd1VXZLdEIyOXdCcWRxOHJVY0RmZVFDTC85VEhz?=
 =?utf-8?B?SnBsSUxBbTl0ZXYya0YzUEtwRVlLRjdsak5aM3RkRjZVRXkxWTY2WGh6NVkr?=
 =?utf-8?B?Qi9MSnd5ckVOQjI1TytobDVCRUYrUTBIa3pabXNOU1BzTzc2Z3VsNFNpZi9l?=
 =?utf-8?B?Y251R1Zjc3YxK0Z1TmtFalZHSllsSHBUNlNkUzRyRGZnTzJJbTFPZHZaRGlH?=
 =?utf-8?B?OUlicEhtMTMwdTZlY1VvUy9BOWtLSDJiR0pWa2xGdHNCYTJLNldia2l3K0l2?=
 =?utf-8?B?MGdHaVZoTHVUZEJ1azR6NjE5ZWlYbWpXa1U5VkplMm9JaEZ2Zi8rSklTemhk?=
 =?utf-8?B?d1o5enZ1MjUxRUVQWDFKZjA1UWNKTG5RYkhVVUFzSWZTc0w1eWx2TEtGS1pF?=
 =?utf-8?B?dWdGckI4V0xDeWErSXZMNnFxcTZlaTIzTXZRK1NiWWZsWm40amtEVFpwQXhn?=
 =?utf-8?B?Z3VhQUVlQTRmUjY2a3FOcU1UN2pCYTFVVnZYSm5rc0lscjdrTndFVWdKNFVM?=
 =?utf-8?B?RlNFRGpYTXhaeE4ycEpQKzZUejV1NzdSM2pzK013M0hkMmJYY3BGUGo5L3ZN?=
 =?utf-8?B?UE1wTW1lQWE0eVlmZXBtemN1eTB4cnpzd2oxUWc1VHNUSnVaSmlvSEZ6dmJV?=
 =?utf-8?B?MGtQQk42RFJjaWxIQTkrdVlTb0VGbkFnekdMY1hkcTdPS0tNSzMyWUhWZ0pK?=
 =?utf-8?B?OVpiR2pMSHlld2RoelB2M05xc0xKNEkzY0hvZldkQ1l0L1dYTnBCRVZnYksx?=
 =?utf-8?B?ZU9rVEFrQW1VSWJxYlFLRU1wSjE3bnlnQlJZaVZLbStQR2xBN2FLdnVDTG02?=
 =?utf-8?Q?dnZJ/eyhGwonLH7nj8oa2lBxB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352799e8-c4b0-4672-d76e-08dd98540226
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 10:41:14.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DaxeTQP6wpVNX+bLaqTN1AXScBxyNg+pvNLeI5tuvX6y5Q7Sg2k4OQEkN10YwEgbZrUOhdwMRGe1+5/N2MSa0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6337
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



On 16/5/25 02:53, Zhi Wang wrote:
> On Thu, 15 May 2025 16:44:47 +0000
> Zhi Wang <zhiw@nvidia.com> wrote:
> 
>> On 15.5.2025 13.29, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 13/5/25 20:03, Zhi Wang wrote:
>>>> On Mon, 12 May 2025 11:06:17 -0300
>>>> Jason Gunthorpe <jgg@nvidia.com> wrote:
>>>>
>>>>> On Mon, May 12, 2025 at 07:30:21PM +1000, Alexey Kardashevskiy
>>>>> wrote:
>>>>>
>>>>>>>> I'm surprised by this.. iommufd shouldn't be doing PCI stuff,
>>>>>>>> it is just about managing the translation control of the
>>>>>>>> device.
>>>>>>>
>>>>>>> I have a little difficulty to understand. Is TSM bind PCI stuff?
>>>>>>> To me it is. Host sends PCI TDISP messages via PCI DOE to put
>>>>>>> the device in TDISP LOCKED state, so that device behaves
>>>>>>> differently from before. Then why put it in IOMMUFD?
>>>>>>
>>>>>>
>>>>>> "TSM bind" sets up the CPU side of it, it binds a VM to a piece
>>>>>> of IOMMU on the host CPU. The device does not know about the VM,
>>>>>> it just enables/disables encryption by a request from the CPU
>>>>>> (those start/stop interface commands). And IOMMUFD won't be
>>>>>> doing DOE, the platform driver (such as AMD CCP) will. Nothing
>>>>>> to do for VFIO here.
>>>>>>
>>>>>> We probably should notify VFIO about the state transition but I
>>>>>> do not know VFIO would want to do in response.
>>>>>
>>>>> We have an awkward fit for what CCA people are doing to the
>>>>> various Linux APIs. Looking somewhat maximally across all the
>>>>> arches a "bind" for a CC vPCI device creation operation does:
>>>>>
>>>>>    - Setup the CPU page tables for the VM to have access to the
>>>>> MMIO
>>>>>    - Revoke hypervisor access to the MMIO
>>>>>    - Setup the vIOMMU to understand the vPCI device
>>>>>    - Take over control of some of the IOVA translation, at least
>>>>> for T=1, and route to the the vIOMMU
>>>>>    - Register the vPCI with any attestation functions the VM might
>>>>> use
>>>>>    - Do some DOE stuff to manage/validate TDSIP/etc
>>>>>
>>>>> So we have interactions of things controlled by PCI, KVM, VFIO,
>>>>> and iommufd all mushed together.
>>>>>
>>>>> iommufd is the only area that already has a handle to all the
>>>>> required objects:
>>>>>    - The physical PCI function
>>>>>    - The CC vIOMMU object
>>>>>    - The KVM FD
>>>>>    - The CC vPCI object
>>>>>
>>>>> Which is why I have been thinking it is the right place to manage
>>>>> this.
>>>>>
>>>>> It doesn't mean that iommufd is suddenly doing PCI stuff, no, that
>>>>> stays in VFIO.
>>>>>
>>>>>>>> So your issue is you need to shoot down the dmabuf during vPCI
>>>>>>>> device destruction?
>>>>>>>
>>>>>>> I assume "vPCI device" refers to assigned device in both shared
>>>>>>> mode & prvate mode. So no, I need to shoot down the dmabuf
>>>>>>> during TSM unbind, a.k.a. when assigned device is converting
>>>>>>> from private to shared. Then recover the dmabuf after TSM
>>>>>>> unbind. The device could still work in VM in shared mode.
>>>>>
>>>>> What are you trying to protect with this? Is there some intelism
>>>>> where you can't have references to encrypted MMIO pages?
>>>>>
>>>>
>>>> I think it is a matter of design choice. The encrypted MMIO page is
>>>> related to the TDI context and secure second level translation
>>>> table (S-EPT). and S-EPT is related to the confidential VM's
>>>> context.
>>>>
>>>> AMD and ARM have another level of HW control, together
>>>> with a TSM-owned meta table, can simply mask out the access to
>>>> those encrypted MMIO pages. Thus, the life cycle of the encrypted
>>>> mappings in the second level translation table can be de-coupled
>>>> from the TDI unbound. They can be reaped un-harmfully later by
>>>> hypervisor in another path.
>>>>
>>>> While on Intel platform, it doesn't have that additional level of
>>>> HW control by design. Thus, the cleanup of encrypted MMIO page
>>>> mapping in the S-EPT has to be coupled tightly with TDI context
>>>> destruction in the TDI unbind process.
>>>>
>>>> If the TDI unbind is triggered in VFIO/IOMMUFD, there has be a
>>>> cross-module notification to KVM to do cleanup in the S-EPT.
>>>
>>> QEMU should know about this unbind and can tell KVM about it too.
>>> No cross module notification needed, it is not a hot path.
>>>
>>
>> Yes. QEMU knows almost everything important, it can do the required
>> flow and kernel can enforce the requirements. There shouldn't be
>> problem at runtime.
>>
>> But if QEMU crashes, what are left there are only fd closing paths
>> and objects that fds represent in the kernel. The modules those fds
>> belongs need to solve the dependencies of tearing down objects
>> without the help of QEMU.
>>
>> There will be private MMIO dmabuf fds, VFIO fds, IOMMU device fd, KVM
>> fds at that time. Who should trigger the TDI unbind at this time?
>>
>> I think it should be triggered in the vdevice teardown path in IOMMUfd
>> fd closing path, as it is where the bind is initiated.

This is how I do it now, yes.


>>
>> iommufd vdevice tear down (iommu fd closing path)
>>       ----> tsm_tdi_unbind
>>           ----> intel_tsm_tdi_unbind
>>               ...
>>               ----> private MMIO un-maping in KVM
>>                   ----> cleanup private MMIO mapping in S-EPT and
>> others ----> signal MMIO dmabuf can be safely removed.
>>                          ^TVM teardown path (dmabuf uninstall path)
>> checks this state and wait before it can decrease the
>>                          dmabuf fd refcount

This extra signaling is not needed on AMD SEV though - 1) VFIO will destroy this dmabuf on teardown (and it won't care about its RMP state) and 2) the CCP driver will clear RMPs for the device's resources. KVM mapping will die naturally when KVM fd is closed.


>>               ...
>>           ----> KVM TVM fd put
>>       ----> continue iommufd vdevice teardown.
>>
>> Also, I think we need:
>>
>> iommufd vdevice TSM bind
>>       ---> tsm_tdi_bind
>>           ----> intel_tsm_tdi_bind
>>               ...
>>               ----> KVM TVM fd get
> 
> ident problem, I mean KVM TVM fd is in tsm_tdi_bind(). I saw your code
> has already had it there.

Yup, that's right.

> 
>>               ...
>>
>> Z.
>>
>>>
>>>> So shooting down the DMABUF object (encrypted MMIO page) means
>>>> shooting down the S-EPT mapping and recovering the DMABUF object
>>>> means re-construct the non-encrypted MMIO mapping in the EPT after
>>>> the TDI is unbound.
>>>
>>> This is definitely QEMU's job to re-mmap MMIO to the userspace (as
>>> it does for non-trusted devices today) so later on nested page
>>> fault could fill the nested PTE. Thanks,
>>>
>>>
>>>>
>>>> Z.
>>>>
>>>>>>> What I really want is, one SW component to manage MMIO dmabuf,
>>>>>>> secure iommu & TSM bind/unbind. So easier coordinate these 3
>>>>>>> operations cause these ops are interconnected according to
>>>>>>> secure firmware's requirement.
>>>>>>
>>>>>> This SW component is QEMU. It knows about FLRs and other config
>>>>>> space things, it can destroy all these IOMMUFD objects and talk
>>>>>> to VFIO too, I've tried, so far it is looking easier to manage.
>>>>>> Thanks,
>>>>>
>>>>> Yes, qemu should be sequencing this. The kernel only needs to
>>>>> enforce any rules required to keep the system from crashing.
>>>>>
>>>>> Jason
>>>>>
>>>>
>>>
>>
> 

-- 
Alexey

