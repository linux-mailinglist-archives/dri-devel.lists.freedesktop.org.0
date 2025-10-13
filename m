Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15009BD6AAB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 00:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 419A410E0EC;
	Mon, 13 Oct 2025 22:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NR/EyY1g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012032.outbound.protection.outlook.com [52.101.53.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D36B810E0EC
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 22:51:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JGLYxjw5cz8qBERGWYlYwdMSWvINT+o6CQHzojdk10d4VxV3kP5uH0+29IIsVED3r3d4mFhk+ly4F9CNKTaKz9jSYy4GVkMTStGrQn+I7fVNXlLpXIM5oVl3HcmFqaFOHblcJ8nPDzeuUk47kHoY8hT4yAF2RSvm/INfGyZ9uX3WVnc765EvIMKtlCafKDquZC5B+i3KNZhVCyWZOnT2FlpdUB/+SKhDouo6fB62mgzc5P9E+tSsg1KuRueKh2i4AiBYkIyNkbogX0ymJvPlxnu/kTayu22VF8/3n/N9xqwvvrbMURnyQjrTpGzj2/z1h2CveQwABjtLwsy2P3T6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3SYHxvCTYzvtPBD9qOPSQKXkNgPynvZ5r/OghtiMMk=;
 b=RDy3ronoAwKqy8aKBJGMwoYtrPp4l6e84bxi/xszmEnD0X4RkIA3gxfTF50p+YwrOyh3WqN1n4QIGseACRCiIWrwULy8qB2rjKTFty+iSNVbpllWDn1J5WMKBhoKsmnG6r2hdF4FxPNg6ZzQHNdpXz/XdUxy3zcuO3ifp6fT3dCWs52L8kCQ3iNfWMbXJ3Uf04lKfTpPrcKArOXtHXfNhAjccdmx78ICIUbiR2xOPiy/Yym74ElU87PxWv+PWEr1weO5QhLimkV/l3WKbSVmTuLCot3uorDAJSdpSiRN0fqkrcChrlPGYLoV9oK5U7UvwUzruv7bw7EMeg8bupGHag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3SYHxvCTYzvtPBD9qOPSQKXkNgPynvZ5r/OghtiMMk=;
 b=NR/EyY1gTAYnvnaUaVlnZkQgngKbw1VJWoh+urZOu0Fix7DHXcegQBBPJHwC0DF4tkIQp3JeSQryzTfuaZ3BEOAZFvQBlZpv9lgmnrZmByR0gCkfO01/0Exu3xUiIKuueyX+HWXsLb5rFdwiYkAMVXnsTNLlWja4RwEbpMS3x8ZI98e7F/lI7uOyOryiGJxyQEYfPrlSOgOHOqGtG+Z3p6TENM9Sh6vY8jd2Mgrt5ta7UR8/9s2l49vL3vYpJ6x2b8w2ffnARE7PfdE4yhKqW/074a9FT9fC/opXYFLUKyjemj7dERr7bqIW4jGYT1uzEE/bmp0F50tgnUYyM95Egw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 22:51:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 22:51:00 +0000
Message-ID: <f951e913-290e-471e-9e7a-8af38771f27f@nvidia.com>
Date: Tue, 14 Oct 2025 09:50:51 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
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
 <FB8D8651-639F-4882-9868-7FA0A8B62397@nvidia.com>
 <7213aa5c-7129-4a3f-acbf-ab922f0f6cac@nvidia.com>
 <D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c11cdd-0258-4717-cf7c-08de0aaafac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1BoMnVuSVN2UFYySERtSDB5UjhjMWxBOGJBckRFS1BQVzRUMExsL2FlWXZO?=
 =?utf-8?B?T0Q4T2JPQnBtbDBBcUp5V1RTMjVUQjR0Mjk1M0E2SXl1QnVDWk5tNytDNzVS?=
 =?utf-8?B?WVVBTis5YVpZSG1tUHVKZ3ZTYStHaloxNEJiNmttSDJOSGJqdVMvSnRDWDhm?=
 =?utf-8?B?YWwxaGI5dWwyRkQwQmZqTzR6NTFhbmU3Vnd6clR0SzRXYzJWUGpaOExMZVgv?=
 =?utf-8?B?b1FIaUlFQ0hENmFyRFJsOXlvdUV3RnVQQ0NFaFJBSUlORWhRck5zdVREV2lt?=
 =?utf-8?B?Zm02RjNuOUJFaWhqSENFSHBoeG45WmU5M1gxT3U0cTBJMmlRb3NrcmJqRkhM?=
 =?utf-8?B?T3hrVFE5djJJbytaajRPVUNLTzdIWWxYZ0tDdStPbGNDV0p6ci9PdGNuRHFu?=
 =?utf-8?B?MVhLUVJZMENFakxRZDEyT0JzemVvbXpMVXpXM0dHd0I1T1dMc2s2Z2c5ZGUw?=
 =?utf-8?B?U0JacStRZWx3OEFmVHhpR0wyMW0zditHTit1R2RuWlN6eXMvRFcyQjNITU51?=
 =?utf-8?B?Ym5YcW5kRFJkaUdsdXdtM1RhTzBSLytyWVBFNnFmSGxaT0xmOWhRUmovWWR4?=
 =?utf-8?B?eE91d2JLUEt3ZGMrWUNtWW9HOExvekNVOFEvUGYzdEs2b1RLZDdPRnRnQ0VN?=
 =?utf-8?B?N05FWURhWTNpQzByd05tWU4vZWlndGFQMmZqZFJ0VldPK09aOWpyN1lWLzdp?=
 =?utf-8?B?RHJSVnVKSGwrQTV2Rk1qaXd4cjRYdzNWZ2hhSmpjQlpDNVQ1VXIwNmEzcGxr?=
 =?utf-8?B?RjFubTZZVXRMT0c0TVRQcjN5YmpkUUFDUmxiZlB3VmhhaEdVTGZsTnRPTFlz?=
 =?utf-8?B?NjBrRHYvc05nQWI3YWxvSEN6NnJxbHRIUDc5NU5xVDhoQ3pJSDhrekRGUFRD?=
 =?utf-8?B?N3FFaUM3YkJ2M2J3OVd3K29RNUg2SEtady96UTN5VUNtelZyTHBKN21KdDlQ?=
 =?utf-8?B?L0FDY2p3U3IvNm9FSEdpWFYzaEpta3dURGF3WHEvK2tEUjVqNlpKM3phOEVu?=
 =?utf-8?B?aW9FcVl0RzJCSlpGcldIRnRKdW1QK210WmFPZlpSZUIxNVdNbDFSclVBZjFP?=
 =?utf-8?B?c0psQU5OWWgrMkpiNGZ1L21ZRFlPdHhZVFJJRFZLbCsxMU15Z3FOM00zYi9v?=
 =?utf-8?B?SmhaZnlrcGUyZGdQNFE5b3VodTJlWjFuVk1ZYjRUazZlQnhHR2pzaEJqSUJS?=
 =?utf-8?B?eCsrQjRVa0EwZkdkQ3Vkdk5iOFBuV0ZUTkRwcW1ER3kxTVJYdXU2cGJqQXdk?=
 =?utf-8?B?ZXIyUnl1UnlENVFBc1h6ZUhlWjEvUlRJNGFoUjhuUGxhSktTZG5HVU44L0tG?=
 =?utf-8?B?Sm9LMmtnYjBmWFZyVFVmS2pkc0ZUeFZjV2NhNjliNXp2bThsanEwVWROSmpT?=
 =?utf-8?B?bVFqbVJOR1k3THh2UUxXU21mT2xWcU9TTCs2M0RsZGM5b213TEgxdldUemht?=
 =?utf-8?B?aUtvdGR5dFdaMEJ3ZTF2Rk4wWHZweFR4VURNLzcxVlNsMkNuTC9BQkdwbUtZ?=
 =?utf-8?B?a2J5enV4c2pWZmtWNVBqOHRncFZGdTBKdC9YMU8rR0xLdlBEOTltQ1VDdDVo?=
 =?utf-8?B?K2JaMWtyTFE1UUl5SjQvZ1JVU2FTV1dpKzdLMUZNWVU4L1VEWmpNMklDWFBx?=
 =?utf-8?B?eUU5ajVqTG5vMHpuZUlUeUU4T0R2WkJ5NW9CZjI1YU56aDc3QkRybTkzbURS?=
 =?utf-8?B?NFVGeXYrRHJSdVF6Q1ozVHV0dWVva1JxVG53WXhyRHlzWFc3TGFseXBnc1RU?=
 =?utf-8?B?NkhFSjN2dlFCQUUzTnRKVUtCQVJsL1dxSlJQelNjSm5nZzlaMnpBVDlySDRO?=
 =?utf-8?B?SGpkVmhKdjFQc0xkdXl0eTVCMVNBSXd6dE5uS1FXUXZSZVZGUTk1SlVMUStu?=
 =?utf-8?B?cVhpRUN5SG5XVFhzUkp4dVZ2MzdaaU0zNXU5Ukp6Q0IrWDJQSDRwWlM5RldI?=
 =?utf-8?Q?lfeI6Gt5taSqDi/5RI56LdU0pS8glT17?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXk5N2FSYkhuWVVCcURwT25aUlJkbDZ5dHJuYm1uWTVYZGVXdEJJVk9DZG1m?=
 =?utf-8?B?YWZwUnhXVk9WRlcyU0MvMktNcVRBUjVsUGE0NlRTRnJCTGs2V2hRUXplUlVL?=
 =?utf-8?B?R0g1aEZ4b3ZkODVPeDZOdG5aODlnRnlzb2F5YlpVVzlDMWUwMTlRVjBZVmlO?=
 =?utf-8?B?R2RIdVVZMjJEc3J1VGFSK2VXNWU0Tm9QTkpDYU5EWXBwNDdmZ2ErckJUcjU3?=
 =?utf-8?B?bTAydGM0RnZpVnVFeXJ1M0I5S0VBdk5ncThOTUhsUE5CbjJpelYzZ0sxNGU4?=
 =?utf-8?B?T01WcURlVU5KY3krbWdIMWUwL29uVUtubUVnWVhVVVEramRVSGx5QUJ4cGU2?=
 =?utf-8?B?RkFqanJ4R0kyRmtGYkxxdStYTW4vSVV4RDgrLy9HZjlac2llaHhhSjVSWGp6?=
 =?utf-8?B?VlEwclA3UGt5YmdxQjltNksvL2t1RkVGbkRlSWlFTHo5YmpFVXgvWmZGamxY?=
 =?utf-8?B?Y3ZNMXl5TytzSUlnY0JEY0VCcVZoMjBwRnlLbzZWU1lWT0dsZnlWOTZSL2w4?=
 =?utf-8?B?VjI1QThEMzNlNFdxelkrNjdONFhLZkJjSTJoWWxCT0xTdk90b1paclYxWnIz?=
 =?utf-8?B?U1ZjOTlDVSt1dkZ1Nlp5QUxOaGdkb0VJT3ZRTnVMRC96TTY5WDY1eE0wamdX?=
 =?utf-8?B?YXNjRXpsZndlVkVoUDhxbTBrSXZlRlBxY1N1Q2VEa21GOGliZ0pIQzkrWHY1?=
 =?utf-8?B?ZnRTNVR1b0xYWi9VTHNBV09jTkljM01vYldWK2t6WVhvRzQ0SkJuUm9tNzN5?=
 =?utf-8?B?aUdWUkRXSFU4RUJNanZXeTBOajlkQ3RSTGJtTXpKV3cyNFFpOHVobm01MEhT?=
 =?utf-8?B?RnRzeXhUZGp3dHJsY2xHUHIxZWIyQkxkSzF4K1pER1FCdGoxTFl4a2NRRktF?=
 =?utf-8?B?clYxUjdBaVNGb0xxdElVR2wzN1NURHFqVnc5aEVhSHN0dWVsQnBSV0EzT0gr?=
 =?utf-8?B?eW5TYnJ1THdyeTdra3d1WWhEL1d0M1IrWnNNWFRCTHpXYlJ1dCtKMjlwL2Ft?=
 =?utf-8?B?YjF4SEsvRVdtZGp4TGVjQkd6Q3BQMmpBZVdPbG54emxUTDZJSjlTNm01dFpH?=
 =?utf-8?B?VE5pRE5WN01OeURKazlFYUhpdndLS0hxbEJldWV5TDZ2R1VhUlJGL2d4dFRG?=
 =?utf-8?B?eDFZc3BOamVzdzIvL1FzSUxFUkpzRGRrQlVOaDRzUmc1ZFpsaEtDSjhmNloz?=
 =?utf-8?B?T1gySWRUWjhqWnFFMW94WEl6OTlJL2RwMDhTWi9NbjgxVytPUTh1eFpob096?=
 =?utf-8?B?YmxqOGFQSG5pZmRVVjVjOGFJTFY1NzVWZGd3b1ZJeGNTaDZXbmV4NE1ua0RR?=
 =?utf-8?B?bHhQK25UYnFoRTZvSkh2ZzZnV0FoaHIrdXdpT0FoVTJLRVpSV05ZSFJPVkll?=
 =?utf-8?B?a0taL0RNV25xK2NUWGtnU1VpOVJTeXpNNWMrT2ttVTkzSzdaUm9pcTBwQ0hq?=
 =?utf-8?B?NHJmWjRXdDB6SFAzeFhib213MlBHZUk4NHk1VzVCTDJxd2xqbWdWeVFBdTd6?=
 =?utf-8?B?T0h0Y1lPdEtvbmRLYnlvaDVwRWJmWGpZUUlyRnNSYzZzb0RUVTZqWmRBZEoz?=
 =?utf-8?B?bXJMRXBYbGFnYVY3bVpZaFkyckJvdGZBWjRDRzhTNXJ2UjU2UHNKa2NoSHFV?=
 =?utf-8?B?MFVmMHRPZHErSCt0cnZjWjZ5ZE5acE5lRDQrWE5TOWkvUDg1Q3NTS1lPdkt4?=
 =?utf-8?B?VjFwTlI3ejVDaGF1RGpNSkRqcW9aOHFpQks5Nk9BRUJ5RVBHOW42V2hoeXp6?=
 =?utf-8?B?QUdyV0FxSjh6OStvRWxMeDIxR0tYTXpVU3hwSnpNeXJ3bERxcVpMdFh6ZUF6?=
 =?utf-8?B?bDVxcGJQc1hmRSt3V04rQ0ozY2dlVVA5TmhFRkZ5MXlreFppb1pCcHdWRVFM?=
 =?utf-8?B?V2lrKzhHOXU1bXoyQklodVZqQ016Y3F1Z3RuSDJCTkI1QXJyV3A4NkpCVnJL?=
 =?utf-8?B?ekdaUHBPMjhqTVhOc1orK2FoaVlxS2Y1dkgzQU5mOUliOEdkTGJYU2YranJP?=
 =?utf-8?B?RDYwS0pHL1doRlZpdG01WFJlM1VYTlN0N3NkRnBUL2ZERjBVVUgvUEJzRXls?=
 =?utf-8?B?WVlNZ3g5RDZoSVR4N3lsVnNBV0xXb0thVzFTZ0hFM1lVMDIzYVdBT3ZWRVA3?=
 =?utf-8?B?ZEY2Q2RqcTMxSTRENmpTWDZHai9uazJVR2xjLzkwUUZKLzBIRndCM0tYR0FE?=
 =?utf-8?Q?iFafdJvrOPafGPVnYE7cChvMpaK8JfQ+3WvKt4wvI4St?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c11cdd-0258-4717-cf7c-08de0aaafac1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 22:51:00.2839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnwzJg6iIOsYjLdNHFNEAZuJWcqeSvgPhXyxcA0It0FlBTT+LwKagJZ3usNEP69W1uXsL4DzzTYsCE9n7ilDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652
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

On 10/14/25 08:55, Zi Yan wrote:
> On 13 Oct 2025, at 17:33, Balbir Singh wrote:
> 
>> On 10/14/25 08:17, Zi Yan wrote:
>>> On 1 Oct 2025, at 2:57, Balbir Singh wrote:
>>>
>>>> Implement migrate_vma_split_pages() to handle THP splitting during the
>>>> migration process when destination cannot allocate compound pages.
>>>>
>>>> This addresses the common scenario where migrate_vma_setup() succeeds with
>>>> MIGRATE_PFN_COMPOUND pages, but the destination device cannot allocate
>>>> large pages during the migration phase.
>>>>
>>>> Key changes:
>>>> - migrate_vma_split_pages(): Split already-isolated pages during migration
>>>> - Enhanced folio_split() and __split_unmapped_folio() with isolated
>>>>   parameter to avoid redundant unmap/remap operations
>>>>
>>>> This provides a fallback mechansim to ensure migration succeeds even when
>>>> large page allocation fails at the destination.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>>  include/linux/huge_mm.h | 11 +++++-
>>>>  lib/test_hmm.c          |  9 +++++
>>>>  mm/huge_memory.c        | 46 ++++++++++++----------
>>>>  mm/migrate_device.c     | 85 +++++++++++++++++++++++++++++++++++------
>>>>  4 files changed, 117 insertions(+), 34 deletions(-)
>>>>
>>>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>>>> index 2d669be7f1c8..a166be872628 100644
>>>> --- a/include/linux/huge_mm.h
>>>> +++ b/include/linux/huge_mm.h
>>>> @@ -365,8 +365,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct file *filp, unsigned long add
>>>>  		vm_flags_t vm_flags);
>>>>
>>>>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_pins);
>>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> -		unsigned int new_order);
>>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> +		unsigned int new_order, bool unmapped);
>>>>  int min_order_for_split(struct folio *folio);
>>>>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>>>>  bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>> @@ -375,6 +375,13 @@ bool non_uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>  		bool warns);
>>>>  int folio_split(struct folio *folio, unsigned int new_order, struct page *page,
>>>>  		struct list_head *list);
>>>> +
>>>> +static inline int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> +		unsigned int new_order)
>>>> +{
>>>> +	return __split_huge_page_to_list_to_order(page, list, new_order, false);
>>>> +}
>>>> +
>>>>  /*
>>>>   * try_folio_split - try to split a @folio at @page using non uniform split.
>>>>   * @folio: folio to be split
>>>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>>>> index 46fa9e200db8..df429670633e 100644
>>>> --- a/lib/test_hmm.c
>>>> +++ b/lib/test_hmm.c
>>>> @@ -1612,6 +1612,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>>>  	order = folio_order(page_folio(vmf->page));
>>>>  	nr = 1 << order;
>>>>
>>>> +	/*
>>>> +	 * When folios are partially mapped, we can't rely on the folio
>>>> +	 * order of vmf->page as the folio might not be fully split yet
>>>> +	 */
>>>> +	if (vmf->pte) {
>>>> +		order = 0;
>>>> +		nr = 1;
>>>> +	}
>>>> +
>>>>  	/*
>>>>  	 * Consider a per-cpu cache of src and dst pfns, but with
>>>>  	 * large number of cpus that might not scale well.
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 8c95a658b3ec..022b0729f826 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>>>  		new_folio->mapping = folio->mapping;
>>>>  		new_folio->index = folio->index + i;
>>>>
>>>> -		/*
>>>> -		 * page->private should not be set in tail pages. Fix up and warn once
>>>> -		 * if private is unexpectedly set.
>>>> -		 */
>>>> -		if (unlikely(new_folio->private)) {
>>>> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
>>>> -			new_folio->private = NULL;
>>>> -		}
>>>> -
>>>>  		if (folio_test_swapcache(folio))
>>>>  			new_folio->swap.val = folio->swap.val + i;
>>>>
>>>> @@ -3700,6 +3691,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>   * @lock_at: a page within @folio to be left locked to caller
>>>>   * @list: after-split folios will be put on it if non NULL
>>>>   * @uniform_split: perform uniform split or not (non-uniform split)
>>>> + * @unmapped: The pages are already unmapped, they are migration entries.
>>>>   *
>>>>   * It calls __split_unmapped_folio() to perform uniform and non-uniform split.
>>>>   * It is in charge of checking whether the split is supported or not and
>>>> @@ -3715,7 +3707,7 @@ bool uniform_split_supported(struct folio *folio, unsigned int new_order,
>>>>   */
>>>>  static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		struct page *split_at, struct page *lock_at,
>>>> -		struct list_head *list, bool uniform_split)
>>>> +		struct list_head *list, bool uniform_split, bool unmapped)
>>>>  {
>>>>  	struct deferred_split *ds_queue = get_deferred_split_queue(folio);
>>>>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
>>>> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		 * is taken to serialise against parallel split or collapse
>>>>  		 * operations.
>>>>  		 */
>>>> -		anon_vma = folio_get_anon_vma(folio);
>>>> -		if (!anon_vma) {
>>>> -			ret = -EBUSY;
>>>> -			goto out;
>>>> +		if (!unmapped) {
>>>> +			anon_vma = folio_get_anon_vma(folio);
>>>> +			if (!anon_vma) {
>>>> +				ret = -EBUSY;
>>>> +				goto out;
>>>> +			}
>>>> +			anon_vma_lock_write(anon_vma);
>>>>  		}
>>>>  		mapping = NULL;
>>>> -		anon_vma_lock_write(anon_vma);
>>>>  	} else {
>>>>  		unsigned int min_order;
>>>>  		gfp_t gfp;
>>>> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  		goto out_unlock;
>>>>  	}
>>>>
>>>> -	unmap_folio(folio);
>>>> +	if (!unmapped)
>>>> +		unmap_folio(folio);
>>>>
>>>>  	/* block interrupt reentry in xa_lock and spinlock */
>>>>  	local_irq_disable();
>>>> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>>  			next = folio_next(new_folio);
>>>>
>>>> +			zone_device_private_split_cb(folio, new_folio);
>>>> +
>>>>  			expected_refs = folio_expected_ref_count(new_folio) + 1;
>>>>  			folio_ref_unfreeze(new_folio, expected_refs);
>>>>
>>>> -			lru_add_split_folio(folio, new_folio, lruvec, list);
>>>> +			if (!unmapped)
>>>> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>>>>
>>>>  			/*
>>>>  			 * Anonymous folio with swap cache.
>>>> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  			__filemap_remove_folio(new_folio, NULL);
>>>>  			folio_put_refs(new_folio, nr_pages);
>>>>  		}
>>>> +
>>>> +		zone_device_private_split_cb(folio, NULL);
>>>>  		/*
>>>>  		 * Unfreeze @folio only after all page cache entries, which
>>>>  		 * used to point to it, have been updated with new folios.
>>>> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>
>>>>  	local_irq_enable();
>>>>
>>>> +	if (unmapped)
>>>> +		return ret;
>>>> +
>>>>  	if (nr_shmem_dropped)
>>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>>
>>>> @@ -4072,12 +4075,13 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>   * Returns -EINVAL when trying to split to an order that is incompatible
>>>>   * with the folio. Splitting to order 0 is compatible with all folios.
>>>>   */
>>>> -int split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> -				     unsigned int new_order)
>>>> +int __split_huge_page_to_list_to_order(struct page *page, struct list_head *list,
>>>> +				     unsigned int new_order, bool unmapped)
>>>>  {
>>>>  	struct folio *folio = page_folio(page);
>>>>
>>>> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
>>>> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
>>>> +				unmapped);
>>>>  }
>>>>
>>>>  /*
>>>> @@ -4106,7 +4110,7 @@ int folio_split(struct folio *folio, unsigned int new_order,
>>>>  		struct page *split_at, struct list_head *list)
>>>>  {
>>>>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
>>>> -			false);
>>>> +			false, false);
>>>>  }
>>>>
>>>>  int min_order_for_split(struct folio *folio)
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index 4156fd6190d2..fa42d2ebd024 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -306,6 +306,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			    pgmap->owner != migrate->pgmap_owner)
>>>>  				goto next;
>>>>
>>>> +			folio = page_folio(page);
>>>> +			if (folio_test_large(folio)) {
>>>> +				int ret;
>>>> +
>>>> +				pte_unmap_unlock(ptep, ptl);
>>>> +				ret = migrate_vma_split_folio(folio,
>>>> +							  migrate->fault_page);
>>>> +
>>>> +				if (ret) {
>>>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>>> +					goto next;
>>>> +				}
>>>> +
>>>> +				addr = start;
>>>> +				goto again;
>>>> +			}
>>>> +
>>>>  			mpfn = migrate_pfn(page_to_pfn(page)) |
>>>>  					MIGRATE_PFN_MIGRATE;
>>>>  			if (is_writable_device_private_entry(entry))
>>>> @@ -880,6 +897,29 @@ static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>>>>  		src[i] &= ~MIGRATE_PFN_MIGRATE;
>>>>  	return 0;
>>>>  }
>>>> +
>>>> +static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
>>>> +					    unsigned long idx, unsigned long addr,
>>>> +					    struct folio *folio)
>>>> +{
>>>> +	unsigned long i;
>>>> +	unsigned long pfn;
>>>> +	unsigned long flags;
>>>> +	int ret = 0;
>>>> +
>>>> +	folio_get(folio);
>>>> +	split_huge_pmd_address(migrate->vma, addr, true);
>>>> +	ret = __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
>>>> +							0, true);
>>>
>>> Why not just call __split_unmapped_folio() here? Then, you do not need to add
>>> a new unmapped parameter in __folio_split().
>>>
>>>
>>
>> The benefit comes from the ref count checks and freeze/unfreeze (common code) in
>> __folio_split() and also from the callbacks that are to be made to the drivers on
>> folio split. These paths are required for both mapped and unmapped folios.
>>
>> Otherwise we'd have to replicate that logic and checks again for unmapped folios
>> and handle post split processing again.
> 
> Replicating freeze/unfreeze code would be much better than adding unmapped parameter
> and new path in __folio_split(). When it comes to adding support for file-backed
> folios, are you going to use unmapped parameter to guard code for file-backed code
> in __folio_split()? Just keep piling up special paths?
> 

Adding file-backed would require more code duplication and hence the aim to reuse 
as much as possible. I am happy to aim towards refactoring the code to separate out
the unmapped part of the code as a follow on patch to the series.

Balbir
