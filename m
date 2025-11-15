Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B40CC5FE6A
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 03:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B803A10EB66;
	Sat, 15 Nov 2025 02:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="N/KGtDLO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012000.outbound.protection.outlook.com
 [40.107.200.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486A410EB66
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 02:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEeHBu6dhuDWhnQfudQ64airGSI02oIQLPTNttBbnVRsIZdkizBhl8Lc36jpsfq/SSRFAUlTxfDn+oktLbs4ekk0WomNER6MslytXqs9/KZb0ok/Kn/hgMoZwqr8U0A7GkLuRuvd9YMN6m4K5SjZquhzrlIbWsR/vuDBupm6OC3hVBhTNdu5vpPVtDyYywroMLHSXuY8I/LpjJIa2edPwf5LD7kOfcersgb7zLac8BCcXnioUWq+6ifisQizHxYQ8ekHuyeBn4LbojQVYjdRRJVJIulF9vndZtzq4nHnuVp7g2tvPm2A3XlEgkzU2AZBMT+juzz2ocluwPTiV123IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUvIKwbH5aMDuvquUN2Cp312DnGy4BW/53MryHzXFHY=;
 b=ydRY0LDuPBTckxzvZPfJxQ3ed7UaumA38ycIdeLfNuErBecpHsNxop8ISgGX1np28pgP+lIlDqzWPIWdbOQPyKvV+7h5ayEu/65ftiCVs3RIS4mlIK5Vk9LNRvyrMOzMCIvzzHi+XaLIQRdJgpXajZXsxE9rVTvHVMR8jYldACbEb9qjx/YZgnTQL7dZX/sEmTWyV3lPmtTDgvpyF/WdnIab3gJXAhDdgotxiZPCOjAQyNYbY9gsNKkEbJffFMWM1N153z275tWem20uiu5JIWY67zGb0E37l8cAW19lEbIVM7GI7Qewo/OVoqJYtx/EjE8IpDohn6Joq0Xr17rkZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUvIKwbH5aMDuvquUN2Cp312DnGy4BW/53MryHzXFHY=;
 b=N/KGtDLOmmDW8JyT6TPJsDYBqHBTBs/Q1JaT6y1EzVNzC4TWxoV/TLdkmfVdkASNHXFUUbOvz9P6G8vTobjgMatxerZaimMXjXqRv6etrr3wUk1TrQgEs+vYcuKleZTwh4vmVB4/oDtlBKXf0uifyNDYHRkQdbo1PBjzJ5w2QyF5PMWWSgXzNEZa6xIZ+Af2OGFnS3coRbIukyv+BQYHr7YyVfIBTa5nt+iLffHoxoOWoiMPnC/aH/Gbc0ASy+p9UhUQ5Q9da5Wd9JiP00j9CCrwOgTvLilz0Vu6kdqduJfUjvUHNMJC86cIfC7/SIYO0ypds0XA4D4P+81gBQpHtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH7PR12MB9256.namprd12.prod.outlook.com (2603:10b6:510:2fe::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 02:33:33 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:33:33 +0000
Message-ID: <c1d57140-fc6f-460a-b017-6662778aeaf7@nvidia.com>
Date: Sat, 15 Nov 2025 13:33:24 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
To: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <202511151007.F1gixfc8-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202511151007.F1gixfc8-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::13) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH7PR12MB9256:EE_
X-MS-Office365-Filtering-Correlation-Id: cb628673-d8d8-434a-7eca-08de23ef5ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LytERjlGN3kxaldteTMyTVMyekh5a3RNRHhKQStYcjU0amo1OTBJajBBa2d6?=
 =?utf-8?B?VU0wYnhYRXY3MWo5eGpjU2dDRGFPUmtlUzIreWVZUGxja01ibzhGdjM3czRr?=
 =?utf-8?B?czd2ejUxSGREaVlYNko5Wkc3TG14SmN0T0k0WDVZQ0JYc0dSUU5kYjhUN2JD?=
 =?utf-8?B?Z2RENGtMOVg0NGJqVDBDTjdvZU1HQ3AzQ3dtaFluMm81clNMeGxJL0huRUdr?=
 =?utf-8?B?am1OR0pzV21LenBHWklaZFFxTy8zWllndjUyZGdxWUZ3WHZlaGFPaU5jWnIx?=
 =?utf-8?B?QWV0UWtEYmJWVEloQ1ZkWWVJVUQ4ZWRHaHVhTFF4V0NGQzBpV0NtTUlsQ2Y3?=
 =?utf-8?B?QzJyekhQcCtLS0NucEM4ZWxNMXhoSGY2OVdXdnFOTStqU1VaemJTd0tmbmFL?=
 =?utf-8?B?bUV4eFpEcmtqR2lNVGIwdENuUkl6Z1k2RlhBL0pHcFgrNkNsVUtOSklhYVl3?=
 =?utf-8?B?Tkx4REJjOHdhc1lEZ3l2WWliN3pUeFI3bVEvSXIxK3hGa2ZTZXFKbDZUTDcw?=
 =?utf-8?B?dG9COUJldHpkUUtERUtKUG14bVl5Vzk2TlJCYUtSZTVZTG0yV25BV0xMMzUz?=
 =?utf-8?B?Zmxia0FoSXZDMG0wNXdiUGZjaGdoSjdJREpJclRmVWxOSDZFVHpkdWN1VlVk?=
 =?utf-8?B?VzZuQkI3ejhQRlFJekNVdTh3dnlJcFpnRW4zaFYwZUYxNjBhMnBpQlNMNjZE?=
 =?utf-8?B?UWZoYy9TZ2NTcUJSUlZxYTU5eXFPN1ZHMi9WakM5SzdHMGxUUS81Q21keEJK?=
 =?utf-8?B?T2luTjVqVTRidUtuM0ZPRGh2MkNhMEkvOGZuRStnN1RMWGZYUUNpb2tna3JK?=
 =?utf-8?B?NjBwcGF5Z3QvUGcrNkt4dldEUnoxMzhnVWNGdjY5bGZkQUxwVG5oMmtxNmQx?=
 =?utf-8?B?MmFlelpuM2o2N3hMMDVNd3Bxai82cHk3bnd2b1Q0WXpWRlc0cnE1V2hPMWE2?=
 =?utf-8?B?OWdQcEtXamVzZmlhK3ZtU0RzOWh2UE5aK0t4c3BKbndidEFnSStGcFp1K05S?=
 =?utf-8?B?RHVUZ1Nway9jT3NQT2VkdXhLS2ZSa0d1ZEQ4TUFGRC91OFNWQ3hYaC85ekJq?=
 =?utf-8?B?M1E3enE4aUVCZFVNRzhJR2F4U056QVJzN1JSWFZpZmdhTFh4VE11czhFMEl5?=
 =?utf-8?B?RlVtUmh3UnB5K3JLLzlQaEM1dnF5RElsdndVeUJ4NW90N29iemwrL3BDc0hq?=
 =?utf-8?B?RGpFazcwTHNvK0wwdE1lcUNoY0VselQ1V295WmdkdFVvRFhzT1dLWWFQaFVX?=
 =?utf-8?B?cUc3MTQ0SjV2QUVLdmhaSnJ4ZkpiS3hwNTErL0lHUTQ0YUhRejRWMGpvSU5S?=
 =?utf-8?B?VUVYejUwSjVGWnRCU0JxNURzTTJXU3pSbzhDMTRTSFRmUDFnMUZQUjFGYVNF?=
 =?utf-8?B?TzgzVmRCbWFkYTZTNDhJNE44V0JFbEt6TGVoUlRLK1ZCVkJsczZ0eFU3dTk3?=
 =?utf-8?B?UkZ5UWlBUGY2SEM5U01LSHlnbHdCSDBGZk90eEl4SHVycUZ0eVhGc29UTUpv?=
 =?utf-8?B?MGFLMEs4YUNSL0RmY094VWRTSDNiRlZLci9xNXBIcDNKWUJ2MGd1Q3k1Nkph?=
 =?utf-8?B?WFM3RG9qRzRoTXFDTC9sUTRGSGc2Zkh1M0VSVytPeUV2YVpxZ2ZsRUk0anM1?=
 =?utf-8?B?d1haSzlQL1kyRFZwTnJIVHhMSFEvODE1TVdRSkZVS2taZ0JqUDFSU2NtSUdZ?=
 =?utf-8?B?cElDNFZEUTZLVXU2UDFlNzhTcFBKbk5CUHVXcktYc1NVQnZPei82d3RIcnpR?=
 =?utf-8?B?dTAzWjlCR1k4a05pQkI0cW9naTVLOXdFa0pNSGE4UmhRbkNvSG56RFhLckJy?=
 =?utf-8?B?K0VSM3g5bVU5cnNSMUFVQzloSXR6OXRNMHRRbXdROVYyODFZUjIzR1diVk1T?=
 =?utf-8?B?RXV0bFl4VkwxdHRFamdrZlJ1Z3JBYU5SZXNNQWo1YnZIamVHUER4MDl0OUtD?=
 =?utf-8?B?eUVVQTlOcUFGSHA1TmJ4VXI1aUVnTnFFanVRbEVkS0ZCNXI1YzFKNWJtN3ND?=
 =?utf-8?B?NjdnZTVZekVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUUxQklRT0pJM0wvUjVuZXM1ZUhHNXNhL2k3eWc5OW5NaXZVeThmaGVaRHN3?=
 =?utf-8?B?Q0luREM4SGJHd0ErclAwTTFlUlVRV0lUVHptbEJoK3lXSFlmYjk5UUxMUlph?=
 =?utf-8?B?SVFZTUtoMGthSzE4cHdJV3E5d2J3eVl3bHJnQ0ZoTGtuTUZZSGtualI1MmRB?=
 =?utf-8?B?bFNFeGZtZGpleHJHOFp2dXE1ZXgzVzFqMldMS3RQdlRJaWJoTHgxT2tGOWRv?=
 =?utf-8?B?UUhDNUtLRGhhU3NmaTR1VFlhM29ob1Z0VlR2K2dZK2ZsSGhEeUZIb0o0Umxn?=
 =?utf-8?B?dEdURnNQUzdaRUE3VWFUelltdkNwNDF0b1V0MksxYlQ3UHNHYnRXK2YxL0Nh?=
 =?utf-8?B?RHZIMk5EVlVXT1JZcUJuTmNaWHM5NkhpaldHc2JoZWVpTStPaVFIYTdpT0Fa?=
 =?utf-8?B?OTluZ2ZDYlYrcVFnVTR2VDR6VVVlWEpHaWdLNXA3eGQxSEtoUm03cjc5b0oy?=
 =?utf-8?B?b214RDB3OGhGSm9OMklNUUlXaGJHeGZZSEkwNWtmaTQxN2o2QWN2QnFvMUpP?=
 =?utf-8?B?L1lHTE15b3FpeE5LN2JLcStXOE1QOWdnaXd2c25weDdEU1NrbEdkUTZiUm9H?=
 =?utf-8?B?bkRVVWxUYmJ0VWZEaDlqVE5EK1dFRFdPNHJmZWhicXlZaUFOUElIZEZDMFZn?=
 =?utf-8?B?VWdLUWY1aFl1eEZkSjhDbW5WRTNxUGc3S0RhcVhnNGRyRThpb1IySC9lZ0l5?=
 =?utf-8?B?ekJkWmVwSW92UXUxRzRkN01FUitrb0NxUWxJVHFSdlR2aUxYUmhvZ1JaKy9i?=
 =?utf-8?B?VnJUcHU1Z3Z0OTZPYVUvcWN1b0tQVC9kbFJONExvbk1vZ2t2Z1ptVmxTNnU1?=
 =?utf-8?B?Z0ZQcGxaeUpTdlk2b3dzL3lJTklUQ0xMZFRWaTZ6akhsZnZLT0JaNUZDbDA4?=
 =?utf-8?B?RUlldytMdUh4QnU3SVRBTlk3Nm1xL24waDhURHRXNGlQV3YweTJ1ek94TTc5?=
 =?utf-8?B?MEJTUU1YZzVkZHZEcXdTWExTYWJLRUpuSWc0VnhIUFViemVzSzhHWURUdGhj?=
 =?utf-8?B?d2U4d3ZHaHRNdS95bzF6b2FsTUFQaDlMb3dIUXMzS1FmaG5KY2NXSFRCcVNP?=
 =?utf-8?B?Z25xdFp6RDk4YTN3ZE9VK3Z4VFIrRCtGQ0ttYnNvY1p6bzZhOWNHVUxUUFlW?=
 =?utf-8?B?b21iUzVVbTBtV0NzbDM3UUI0NkJxUjNpbFc2NlA5QjBXb1V5M0F1bC8rL0dQ?=
 =?utf-8?B?M2xKOXFYV3FVUHcrbnBEUWJKWWJYbU5nOG1lRDdUNmx1L2V5ZmZITnpzME9w?=
 =?utf-8?B?NUFRWk5TT0RucURZck41em4waGdSMHJsVUxQRGJEYnZlN25lcWI1UGZNV3Fw?=
 =?utf-8?B?NE9VLzh6NER0T0dWYTgzaTJ1djFTVUYvK2JXUWQyYzhoM0hXTXZxK1B2OXlQ?=
 =?utf-8?B?aVRneWc0ZVRLZVVxclExMDAzYTBHWGxxbHNkYTNkcUlGYlZmSW5NVUhFSTlP?=
 =?utf-8?B?T3hoWnQyYldYRUpnWW9mUUFLcWJiNjgvTDRrcllJWW95aFJhVjNUOWNmWnQv?=
 =?utf-8?B?dVlBU3NQTXNuMElrcVdCdUdqQm1qb2V1ZHpTRkwvQTNJK1k0QVE0TG5sL0k3?=
 =?utf-8?B?YW41SEtJQUZJY2l3VC9KUHkwTlovaFM1dDA2QXhMRmQ5S1A5c1FiQmR0YS9Z?=
 =?utf-8?B?S0xJWW9OMWxUY2crSzJ3ci9YVmhWRnNRR2RkT1FIa1o5OUJlZFZXcE9DWjJI?=
 =?utf-8?B?Q0lhSFkvUDE1NldRNmVzUnZBR1BaeFIxcVEzQkNwanhwZVJ5OWZrenREMEdq?=
 =?utf-8?B?ZUVIamVXVUZ2empFU1pBTlNNWVVvcXpySWxRN01XeEJjSjY4anpMakp0RHFI?=
 =?utf-8?B?YVA2WXVFWjl3RGF4OFRWL1E1Zm5mUTNHN2xMbENBLzRnYnJJcWlmY3hhanVa?=
 =?utf-8?B?bDRGQk8vUjh5VEhkRWhQb0x5bmMxc1JxOEtIek1SdWhRbGI3WWlxUXZpdzVI?=
 =?utf-8?B?ZVpCVFZOS0swT0N3UUlBL0N6TEsxY1JpUlZmbjRoUEY2S3laeU1YTElZZ1Yx?=
 =?utf-8?B?YjBEbUJzRWVwUVQyeEtXYW5USGI0cXdEb2liaDE4eVU1MmNXU0dBYVZWdi9v?=
 =?utf-8?B?VzhuK2Y1M0lUd29tUW03YVl3Q3VEZnRNbGJ1dVBrY3ZQZ3oreENyZDlVTllC?=
 =?utf-8?B?WmFPaG85dDl4TzFzbHcrTnkvU1lwZVR5TmNiYVd2a3dNMUxBZEpFRDRSUVRK?=
 =?utf-8?Q?d16C8Q/2neXXxomKmhEOilnTsl6wKqu2dQPqgllQLiFK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb628673-d8d8-434a-7eca-08de23ef5ee0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:33:33.0398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PKrpQiHjOICJjqh5g/pE1aDejU7fOOMhvw2esvVxb4Oj43j7qXJ3wWCLloll2x7e9lSf319JLL8QDptxnrj4cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9256
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

On 11/15/25 13:15, kernel test robot wrote:
> Hi Balbir,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balbirs%40nvidia.com
> patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
> config: arm64-randconfig-002-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151007.F1gixfc8-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511151007.F1gixfc8-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511151007.F1gixfc8-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> mm/huge_memory.c:3751:6: warning: variable 'nr_shmem_dropped' set but not used [-Wunused-but-set-variable]
>     3751 |         int nr_shmem_dropped = 0;
>          |             ^
>    1 warning generated.
> 
> 
> vim +/nr_shmem_dropped +3751 mm/huge_memory.c
> 

[...]

Thanks for the report, I'll send an updated version after I investigate it

Balbir
