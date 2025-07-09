Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D84AFDF38
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 07:26:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC9010E713;
	Wed,  9 Jul 2025 05:26:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+6qXd6n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F4410E713;
 Wed,  9 Jul 2025 05:26:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HscJX15jetx1okgbss3acgT/We1A6A8C3MBTLSuGSKb7Y6ENsIxGtgZP2h0e+OQHyCaZk7qDSw/GJ5zw879l9WJSsWHlzX4wUg+YL5XQT7ytMgNrld0YEBxrhmZRknVgjKXUsLMs3bQMIgHEKXCCS2gO1lSyhAp2nsv7x8sSeuVrw2BeILAua9HntEsn349Bg3biVJ9DiGMPLuD004XuWkLWOZUH68B/nZjkFYh/0UUidzfxzvQ8/CfHnNCnI5Prc9kzWF+aUSEIZ99pkL8KVBy3mzfJrzvqI+e5hH7maZ/LvZdAtVI21flbPMZsADFE2ddgoSWhtvJVoR2XJnYV5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=189+Jz6x1x8lZbkQsc2s0/ljhQ/5iKLzeEGy5D8lQSE=;
 b=myCjEFcAL18kNwqxrDUHTVFkIVlPpKdfH+5yebp9LsmPpyW+wQiuqEyfuYzCAPZscXKKr7jLKz7G8tyZJqbTJqChRk2Ml6oTCDlEZRbHo8KbsbgFgzouNnBVQJXPACzLynrsmPsBF7pxRn7i1dq1Js6MI+D4qOPY7NAw8mK7wlOv4mUWUfcdl6wVTAazCE+Zh8oKuiWizhSOAjQ/dEHiZ4eQf0+UgzSaG2DC2zbnH2UmnfONZy6NEGXwqn8q7SokJ7/ExJ58ykbV/t8+i7XZy3KMF1CEloeyuwqyoiVZlkufwp4Kt9qUFjoVCzkPN6QwCTJun7IjTlbc4TjEQibplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=189+Jz6x1x8lZbkQsc2s0/ljhQ/5iKLzeEGy5D8lQSE=;
 b=Y+6qXd6nt4ZjskHkdQ00WvfyQASExMLDiBNsO2ZQUL8MJzy1251NqzoKzNf+/LDyOuUm4UIjjzJ/Bg6cQ9edlh70MQ79kLf3o0NwwuTbbyaksozA0r4okg7pYSJItyCWUXD8oOz941h+JyWe30tz8zmKn7mpt2EQ6rXIaUKjzkTeIMudnFgUcHkv20sKcL//jjltF+z7ohL/PC9KgcuT9MEsbYHzZYWZeloSGbwL7a/w5bKI0GCad4jkniG0X0hR0hDMLwH9MX8uBd1fP82qBUP5wB4EphEcq6d/tUdHtfMtXUVMmCPHASBZSoHv9saNSHS11y69pdDlQ4+cuX8sgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 05:26:04 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%4]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 05:26:04 +0000
Message-ID: <0cac0f51-9c93-4f5b-9abf-760835af1f01@nvidia.com>
Date: Wed, 9 Jul 2025 15:25:57 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 02/11] mm/migrate_device: flags for selecting device private
 THP pages
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-3-balbirs@nvidia.com>
 <59a5d9ed-36db-4799-849b-7bbd885465d1@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <59a5d9ed-36db-4799-849b-7bbd885465d1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:a03:331::27) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3a519c-51d1-424d-14ad-08ddbea91952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dk5zNVJBdEVCUm82bHRJNkgxaTYyYVc4SUE3bXdBeUkyUUVBTlpleVRUcm1J?=
 =?utf-8?B?STlBMjVpaG9nUVVTRkRHMTY0T3g0OWFaT0NQVC92cEZQVUxBand1RzFZaEd4?=
 =?utf-8?B?dExNVUdybGJ2MHZWa3gvMjN2QXEvbG95cndsYUxjcktTUG8zcVhZRWZnbVYv?=
 =?utf-8?B?aFQ3dHpmSGJMRDZ1bitrakpmbFRRZzRGdHM2blZyN2RoODJJeXhHUHFSODVr?=
 =?utf-8?B?Y1BxQ2ZHTEZtZmJqOGtiV3ZqK0V5OUd1MzV2OC9WN2FmNjhURStzZUVYZ2tx?=
 =?utf-8?B?bFlFK1ZBVEhURXVWSlNSYlpvVjhyVzVKbFJYeDVGcVJkRUt0M2FsVmNSdUF2?=
 =?utf-8?B?VW8vaWR4ZkdYVnRBVWE3U01xTjUxeEhUWGhkeXFpZFBka1VVMFlqdllJcE5r?=
 =?utf-8?B?UG1ZcnFzQ3prZWs2M05xYW5TYmZsc1p6WVU5SWFVN01FU3cxQXlVTitQSWVR?=
 =?utf-8?B?QmxTODdUeENUd2I5aFlQbjZQSWNlMEsrbnF6UWcydUxNVTdwdmRuRFQ2QWFW?=
 =?utf-8?B?WmdJUm5jdnpMQVhPRUpMQldYRXZ3VE9rc0ZxK0psNXd2aEVlWVRLZktUcnZy?=
 =?utf-8?B?S0JFZGFJMm0raWxBVFlwU01FYVNhL1JLeEZERXJNVjBmMkRTTDJQY2xFRG9l?=
 =?utf-8?B?ODA4UU9POFhzSmFNbU5tejU0dDJvQ3RlWUhqaU9BS3NWQkhHRXcvZklieEJU?=
 =?utf-8?B?U1pyakliUS9hdzl4YTJNUjRLbDA3SGNPSmt5MnFEbjhSK1p2QmRSbFZGZ2Fx?=
 =?utf-8?B?clVzUUFNNVpwL3ZDc2ZqZ1lzUWs3Y2ZSaHVKKzRSZTJSYW15M2hiNURkekFC?=
 =?utf-8?B?Q05hVTVYNldvMkhmN2phaWRjSHA2ZWtTbGYwK2o3bGVwTVdyTzFtMy8zN0lh?=
 =?utf-8?B?SXlzdE95d0Y1cmxNaWVaNHVNaFNyT1UvNExMOCtCd2tsdWV0bU9wUFJlRDN6?=
 =?utf-8?B?NU9Sb2RqdzQwcStXTFlsTFZZY3FFQzJqMUJETFlnZk9ORFJHUWlmd1ZKd2VS?=
 =?utf-8?B?OS8yY01udm1VaHZhNjdwWWN1WTZPTlB3QktJclg0YjJ1dTV1NjNBVXhiSG1P?=
 =?utf-8?B?b2RaeXovdzRSUkQ2S3VDTVRMN3p6a2pyZXNjWE9jUUl2cWdwL2VlVTYyYlhq?=
 =?utf-8?B?S1pyWWZ0TU5hVEZwQnEwcy9Jb0RyQUNtVHEvajBaV2U3UDRLeWRLMEJOTVJM?=
 =?utf-8?B?blBiMTNMNmsxTFBubWN1dy9FWm5XVlpTQnIxelVjRHpQeHVtT1Q2bGZGbE52?=
 =?utf-8?B?WmEwOEhkKzNROWh3SDlZQXIxUGwzVEl4aU5QNHU0S2wxQlFralRsWWVqbGdP?=
 =?utf-8?B?U0ZWSDczb0pSR2tKR01aNHlrcnRCMHZpd2RyV3c1OEppL0dwdjdMT0tyWkVz?=
 =?utf-8?B?Vk54OUp2eGVoTkk5L0grckdma2Q5Q2NtT0U4dzRROVE5bXNCZi9iN1FUSlUv?=
 =?utf-8?B?WFpyQUx6U2dqQWFqYXZaSnoveFFTY3NuUzNQRWIrNGVRL3Z2Z3I0Q1EyVlRr?=
 =?utf-8?B?b3AwdmZYcVJWZ1NKaTh0RzIxM2dqak9WV2U2ODBXMXNBV3lISW5SZnZDa3h4?=
 =?utf-8?B?dk81STVCSjdrSmRvL21qK09ZVGRnRXlSMVlHTGcyMFZBN054Y0xuaC9PSS82?=
 =?utf-8?B?M1pUQVVwWFJvSWc3enJVQkJtZW4xNkhJaEZLVkdNQVJTazFmZC9zZkV1Y1pR?=
 =?utf-8?B?Zko1V0xLekY5U3Q2czE0aHdRLzIybitXTE5sYlRLUTFKMUFuMTNUK3QwY1Q3?=
 =?utf-8?B?Z0hENmpBUmxtdHBnYVBZSlFXUlY1NHBzYVZJQ2N2SGo1K1kybkNHYVZMaGtF?=
 =?utf-8?B?OERlTlliQ3Mva0NNdi9vVzNsVFFwR3FnZ3BnWmkyVW1PNUs3YkFmS05BanJK?=
 =?utf-8?B?VUlxTWNWOHg0VHA3UFk3dk1xMmdLK3ZTNjd5SmszR210RTZjakNxQmQ1bDNG?=
 =?utf-8?Q?SqgaQtbrUe8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXlqZDMyZkcrYmZOLzJzTTUvSSs3QjBxaTFIeUF1VndBNFNZQzNYTDRoN3hk?=
 =?utf-8?B?RDA1cXptZzVadytSSmtFbnRCWjZNL2RFZVkvQk5aYzlPa2xJa09JajlMWURz?=
 =?utf-8?B?K3p3UHBLeW5yWjVDNXVZVHY4UUFNOXY4SEZJM080Y0FyNmdmMXd3ZnY1SE1H?=
 =?utf-8?B?T1ZqVjRGNEk4Z3p4Vkw4ZWRINFg2MkZ1eTEzandpdHkrWVE4NDQ5b2wvTzg4?=
 =?utf-8?B?OWlTQkZXWGNjUUNMN283aG9Ga01PTHFwdFRvTHgrRUR2NlVXRWgxUUQ3OTlX?=
 =?utf-8?B?TXU2c3pGZVZGbXA2Y1p0OGphOUhyaEpKT3F4QnlHWEd6dTBSZ0tyM1FuNito?=
 =?utf-8?B?UnFCWXpwSmdSaHQzamxheFEvdHhka3pLT3kvS0tJdEdMc1dXa1d0UFpzdTFs?=
 =?utf-8?B?WWRzaUZzVUh6QVVOcWxQejVLbjhtR0NBeEg5WXQyWGlpVTN4R293c3NlK2tF?=
 =?utf-8?B?UlFWaGVTbjJ4cWV3NjZ6a0c4YzZkRTV5UUYvRUU3bTl2WmJ1eGNXNmY2YlA4?=
 =?utf-8?B?YmQvaDhJa0RDcXFWSTFyZ0VIRk10N1FpNkJiaS9GNEJqODNrR3NIamprNUt5?=
 =?utf-8?B?MzNoQ294UXMxVjdXeTNzMUJDdldEaFF4ZTV6NlhIeUVOSWxQdGEzam1tcjVl?=
 =?utf-8?B?ZCt1OUN4SGllZ1phSy8yU041SlhXV0h5azhpaUppb0FITzg1ZWpTSXhvMmxr?=
 =?utf-8?B?eHNsM2FPM2xGMXdad08rQkVJT05tdExESURMbHN0NnJtYTFucmFHQnBnejZy?=
 =?utf-8?B?RTVDdUh4bCtLUlZLZGtuNFE5U29lcDNDWnFiNEVDazBMYzlqbVBpdWlVNlRE?=
 =?utf-8?B?SFlodG1uZzZRVzQyNEVoaW96SW1jTkEzNkJDdE56TmFJUGJ3UnNONWdEbGoy?=
 =?utf-8?B?dzVmckVORGs0cXRWcWd1ZVBEMHJjZkZYME05WXcwdlpEaE9EeHA5MXFPU0Qv?=
 =?utf-8?B?Z1hZUlBYUm5wb29TZUh4cG1YWjZxdXc4L0VGbFVRblNZbWVqYmJXa3UwSjA3?=
 =?utf-8?B?SlF2cjNDb2krRWZwRXZnMDZVM3lTRzVuR2x1ZTFYY1IvQjJHY3hLaGhySVdp?=
 =?utf-8?B?MWFlbWREZ3hxbGRMeE5LL2Nqd3ZpMVBsbERmMzdDY0NZUURJUGRJTUlZKzJV?=
 =?utf-8?B?Vi9pdmUvK3ZHYXVYdlRCdHBoUWliNUM4U3NwY1RvZnNuaFgxbDZnQm5vRjQ0?=
 =?utf-8?B?eTNhdDdiTFV4L0VEZmRXdkZHU2RFaTFBaGtNR25zalNJc2dJanlwNmlDQVpw?=
 =?utf-8?B?VHFUSjV3RmRlYTJabGduNVhNUkkxNSsxa0RCYk1oK1hzSXZvWVhpT25MZGpn?=
 =?utf-8?B?KzdWakczaVNXSEVBOVJjYVN5cVN4VzZPQ3J5U2lPdUdJTG40ck5tUE9kY29S?=
 =?utf-8?B?MnI5RzV2SGhNV0VlQzh3RWp2MGtpV241VDdPUmtYblo0Mis1dnljVWtvM3Yz?=
 =?utf-8?B?eXFuUGE2am45QVd1NGIwREE1Tlk1L1BYVGNwV2VtcGVUOTZJYTlOQXRqVnpH?=
 =?utf-8?B?anpSTitPUG1INE1qcUpkZ1Fvc2lQaHdBUFY1YlFKSFFTaW52aTNpU04zMnBQ?=
 =?utf-8?B?STU2R2tRcGZaVGgyT3RxUDZuZGpqeEFTL0RzSm1OLzkySmdhYmRYOHhLUzd1?=
 =?utf-8?B?d01CZDh5ZG1CZjJBdm1ka0YwUlBEMmxEMlY2NnNjU0QyVndud0FNQTNHZG5H?=
 =?utf-8?B?L0xoYVFueEttSnhRQkQ4azhvanlLaGZFVTNWUXRDcGhKcTVzWmVvZUlkOVJP?=
 =?utf-8?B?emh5UzUrZVBsK3R5Nmt3ZHNGTDg2eld1WCtTZEVXZWpTc21vbWlhV0t4V0lY?=
 =?utf-8?B?YTBtM1JUQVU0eE5uaXhkVGFWaE02YkRpaXlSejNoVDNNelQvRXltaEI2bldX?=
 =?utf-8?B?eHNPaGR0MHJkNkdIRGdlODQyakRhTjhzeXl4cDNhb3BFRHBhaGVQSkliM1ZL?=
 =?utf-8?B?aFhRdENZZGVsMWtpd2NZQStHbEhWMHYrdUJiVjlEUlBTYWRGRUN3ZUV6Y1ZT?=
 =?utf-8?B?QXNxaFk0SEtCUUhhZlk1R0tKVTVITnNRVVdOOFlXSWF1UHByQzFyS29ZbFpB?=
 =?utf-8?B?NFQzckFXZnhnaEZNUGEwVWFQOE5XL2tTVnhlK2dWYXZqT2NWNVp1ZDRtdFk2?=
 =?utf-8?Q?fAwofATU3W7Q/Qn4j9Od/GHmD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3a519c-51d1-424d-14ad-08ddbea91952
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 05:26:04.1705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8bgjI7jJ9cwcVjl0/rwVNygeOJHuTevGI9Rf3ueLwF3Brdpq6XaD6vOb3//ZGdw06lsnl0kPwZcNtssvhBYhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
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

On 7/8/25 23:41, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
>> Add flags to mark zone device migration pages.
>>
>> MIGRATE_VMA_SELECT_COMPOUND will be used to select THP pages during
>> migrate_vma_setup() and MIGRATE_PFN_COMPOUND will make migrating
>> device pages as compound pages during device pfn migration.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   include/linux/migrate.h | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 61899ec7a9a3..b5e4f51e64c7 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -167,6 +167,7 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>>   #define MIGRATE_PFN_VALID    (1UL << 0)
>>   #define MIGRATE_PFN_MIGRATE    (1UL << 1)
>>   #define MIGRATE_PFN_WRITE    (1UL << 3)
>> +#define MIGRATE_PFN_COMPOUND    (1UL << 4)
>>   #define MIGRATE_PFN_SHIFT    6
>>     static inline struct page *migrate_pfn_to_page(unsigned long mpfn)
>> @@ -185,6 +186,7 @@ enum migrate_vma_direction {
>>       MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>>       MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
>>       MIGRATE_VMA_SELECT_DEVICE_COHERENT = 1 << 2,
>> +    MIGRATE_VMA_SELECT_COMPOUND = 1 << 3,
>>   };
>>     struct migrate_vma {
> 
> Squash that into the patch where it is actually used.
> 

Will do,

Thanks,
Balbir Singh
