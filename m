Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B4AFF56B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 01:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74DEF10E11E;
	Wed,  9 Jul 2025 23:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dIe7H9gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F0B10E035;
 Wed,  9 Jul 2025 23:34:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wi/wkq+0HIgdSrnpw3WGQ4Qor17Pr9iWnHJA5QDLb+PvRem7/5MoPupj0EAxeQ/wlAIGBqiaiWKPCVHcYGsw8rkUvtCgxKDQZE70zFT5u1YQS/fjj6cas2A4MdWd7Yf2VYglHDnCeCFl6PUHzkyudhBgE9KYjdSWJZ5O5xU22oXp+Kd71GFbvWwKspiWqteliIvqTI2g5uTDylMoMais1fUc2GatVTcQrs3ox4NA5QoBrxd7UDK7QIynLQrqWUlnPKa4PueORNpipIA89cZsu/UK3VXCjaxZhhNZx3DIx8CA1m/xNoj6EiDiTzyv/RY0dDvEUzG7HWQhkZCF9E5yIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VhOLZXtfdJOeaKnrT0uvLescNyFqnR7JH4qciiEzWGM=;
 b=Ey/fe/Js3n+s0QQ5qrI/FFa0lWs5HTA/xqR45o1nan24OzgzmsJ1geZKKTPv6wTfArWS/A41uzuZrsbK5BZJFCTbNRGjj12Dpp7k8UcU2Moe1xQf2cAcfjdfttsteucp5h5Rx3TLjh/tPDA7jMw/msQM2+fzBFKzUs75h70HXEjSYmhpC7FpWKP9OpS1Y18shTr/PLqDV9lFsFr0nCsJyXxSEaunuysHFSS+OID0fp5qmHMDbr6QwZcp3ajGzqsrk4vuUlkeHpMU6W7sDvxiZ6t5Mx9o+OZwqDAmKI9WiDk4T4KAt8yEp51JMiXMT4505wQ9kLf8NIvLfltMy05jAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VhOLZXtfdJOeaKnrT0uvLescNyFqnR7JH4qciiEzWGM=;
 b=dIe7H9gq1NWkwwVr9NUDf3LIrRM15k+xapvr9qObEpw7Zom3uftHEbxvevLpTV8Q75CSGs/4jbANUDRxiHHSHVbOKxGa6AFnFTzglUftB6NvWiRrHFhDaCXr8P47N+AQQXntpvdbXBhS61mRpbIl1dKHKp3FNqgBcrX1Ut/1xc5cBE8wCfMj5ZGAhlkJp9IWTEoiWXUtcHXg1w0QRStlK+yRi6u48b4Bj6ytcnXgaF6RmAd9c2fVOXjycRQfZ7ILcw+KVdVADHei5CCBx3xA9Jrs+xKgcOIwhZRGMv8X2MyPgz3EqrLkRpkLYFitQn9L9w1YzLSUN2pj0qqUSn765g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by LV8PR12MB9692.namprd12.prod.outlook.com (2603:10b6:408:295::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 23:34:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.8901.028; Wed, 9 Jul 2025
 23:34:52 +0000
Message-ID: <5f107fe7-e189-476b-837c-2668a79c9776@nvidia.com>
Date: Thu, 10 Jul 2025 09:34:45 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 07/11] mm/memremap: Add folio_split support
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
 <20250306044239.3874247-8-balbirs@nvidia.com>
 <9e8771ef-e734-4d56-aa20-c3fdba0fd5ab@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <9e8771ef-e734-4d56-aa20-c3fdba0fd5ab@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|LV8PR12MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c075ad-6295-46ca-7d50-08ddbf4133b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDBRUXlhOHp4VVc1ZGZZQWd5MmRmNzdjdk1Zdi9rQXdEQldKS1BkUjhvTGpa?=
 =?utf-8?B?TUtrdGMrT2pDZWR1eUZYNW8xMGJyWC9WOWNVdStvcVcwNWFaTnUwQWdzU1l1?=
 =?utf-8?B?K3FqcTF5Q0pJZytKY1VIcUZmYUUwcFVTWDdCTGRXSXFmWkVVM2E2VkpUdTFr?=
 =?utf-8?B?T1RmaDJnTUt1ajBFSE5Ndm5RMlAwS09Zc201aC80RHdYOEpWV3Jxd054VlNv?=
 =?utf-8?B?SC8vWndDbmdCOThDMnREdTdhcklhbkxlVGp2M1JBNUl1VVVMTjlpUGZuYTRl?=
 =?utf-8?B?TDZiODJBZ0hTN2lUUEM5T3hLTmJuWUovOFIxeUs5b3BaZ1h5Nzh1aGRTdVB2?=
 =?utf-8?B?NnFSWk1xcWc4ZFVuNEIzdkZadEhHTnRTTWtaLzUxK0FjRXVIWkdvVkwzbDhk?=
 =?utf-8?B?K3Vqa1ZIelc3YXQyV3crN09Rd2FUbFB3OVFBdldKMFZaamJPZTlJRXRmeTdN?=
 =?utf-8?B?VWorQkluK0cwNUtMcXdBNjJwaEVTQjEvMXVVTGFpTFdoM0Jqa2FhVklhSmhh?=
 =?utf-8?B?OE9EOUpRSm5talZLN0wxQ29iTWRudlRac0QrSmh0SVRjUFlVRnNadTJuUHJv?=
 =?utf-8?B?UXdTbTZvSkE5T1hOU01XQVNPQzFhTWthRmFnSFRmTDJxb09IZlRjOXdiek1F?=
 =?utf-8?B?aWU0QyswYVhyMStRU0YzV05JUUJPS3JxaXIySGxNWCtTNk5TN0F4RCtxN01N?=
 =?utf-8?B?UWVpaFAyYStOM0xUQktNT0NzeVlTRWZ3UG9FNkJhUnk0SjhRdklLazVMNzlu?=
 =?utf-8?B?d2JHU2VLKzg1dkFjQTNsdjhtYTVORnBmdG1yZ2IzUSs2ZkhGQmZFczJ3Vjg1?=
 =?utf-8?B?Sm1FZjFQbjdjVittNUpnM3VoSkF2bFJ2ZmxxWjhKVDZvNW9td0RSS3YwY3FH?=
 =?utf-8?B?cFhDVTA3T0RkY0FaZjBUMWp2UXVCUTNVMEFwSHVYbjdGcnpMbGR3N3NrbXpF?=
 =?utf-8?B?YzkyOEx5UjhUU09EdGRkV2pIQnVLL3lRNDlLTlBieHFYaTNKZmlCb29ra1cv?=
 =?utf-8?B?eFlSeU83cmxvV3EvUU5nemMvaWVlSGw5NkhMMzhmWDZ2UXZQVUVOcWdZVC8y?=
 =?utf-8?B?V0RXRkhhNlE2MGVHc3hVemlNc1lZR2l6dkMxa2EvOG5YQVVIR0xmZnl0RjI3?=
 =?utf-8?B?dmE1enU3WGVzNVJsaXRVR0lrdWx3WXVPV3VLblFZVjNSRlErODRzdXFRT0Fz?=
 =?utf-8?B?bFVBQ2JrVTg5bW5jTXBKTVNhY3phL1NId1EyUEg0dUVVZ1NVMHhrZ2FnajZi?=
 =?utf-8?B?MkhLRHRQd1dSMmlUODZUZWdzbExFbGhZelN2ZzhsWjdpa3Y1ZWtlcGpvM0Uv?=
 =?utf-8?B?SVlJQTdzeDVRK09DNU1oL2tVZVAxL0dJdXZocnE1cjgwb291UGk0ck4zdnRh?=
 =?utf-8?B?cEVHYm9OUy9sV2ZGUUVvUjBVbXZlNlFCZWRPN1FDNGt5cVA1MDdTQlduYk8y?=
 =?utf-8?B?cVJOaW9HTG1GdUJCSjVOSlB6N3hRWlAyeWUrYWI1TFk3NE9pTjFNR2pmeG5R?=
 =?utf-8?B?MDN2Qm5xbnVTSTBKbXBVWUtWOHExd1RQclRsMnVjN3NKWllQcDJkdTNSZmZM?=
 =?utf-8?B?QkQvUE4yZG0vcWZqeHhRcng3eHorVnVtZVk4bmJ0NTVjQTI1TnYrOWdNZ1JF?=
 =?utf-8?B?Sk9CZUpnVHNNQVFyTkxDN25xeDFabTVqc0Y4U0MxOXFNZGpyazBBdFVkSXo4?=
 =?utf-8?B?WVk5TUk5bXVKeERab0ovM2RIdEJnZllBUzdyNTdMeTJiclIzQ2hxNjFFeGhV?=
 =?utf-8?B?dmtrZ0kzNFVhRnV1MTBZUHgwVitKamdLNFV4THNmdkY3a3V5blZKSDUwMlZt?=
 =?utf-8?B?ZnZvSzE1bk5HM000SUVJdGNQYkQwQW5xSHVQempqUmp6R1J3NG5FQWNQR1Bi?=
 =?utf-8?B?czFVOU5GZ3gyc0pjTllUcStXd2MrdzljYmsyRWtXczI2cFJlNi9ueXRWdy83?=
 =?utf-8?Q?ZxsWmGduktk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azhkRlcxOVV3YVNLeWpudE5FTFljV2lxdTdreEt6NkR0N2ViUHMwRjltdUxO?=
 =?utf-8?B?cTk5RkthK1FFOU9ZWVdkUXN3cGlrUnl4c3hRY2ZZWVdZOWxWZDFoczJQNUVl?=
 =?utf-8?B?cEEvNjNURDRZcGhudnB6REFqelVpbUwxYkdaRFpjTzZSK1A5YWxRMVdRK2dZ?=
 =?utf-8?B?VHVKZlJ0U1ZpUkRwOTRKbmFsRzZZUjFNZldveEVHM2tVSXgxTk8vVXk1Z25n?=
 =?utf-8?B?OXBhVXdDMThoc2JHUzVCc1pyZkx1TVkwQk9LUHJjc2Z5YTkrb0JOc0F5dkth?=
 =?utf-8?B?eVUyRnkwZW1pOFVjcTRVMlNQMXF6allHcTl3TkdyUDVXSEE0SjFYNkdQcWlv?=
 =?utf-8?B?RS9FV0tyekN5K1V1Z2swcGZlMEdwTGJXNHJtNm9Mc2p6dlVOa0VDaVFnNUZh?=
 =?utf-8?B?Sm1sb3Z1WWVIbzZacmZVMkJhRzUvQ3N6ZFNvQ050R09PQU1ERm5xSU9JS3ly?=
 =?utf-8?B?K3MyOHkwOFFISk0zSWtDaExReFFXOVpYK2lZVEUwNUsybkRlQ0ZoOVBpd2tR?=
 =?utf-8?B?c2ZFRFdqaittbjM1bE91U2pJSTlQbXI1c2IwUUtpVlVGc055VFl0ZkVpa1h2?=
 =?utf-8?B?YlNTWjcxL3k2UVFrM2NjTlJKcklPcnNYVGp1M0s4N3RORm9WaFNnMEpiT1Ay?=
 =?utf-8?B?UWptdUdXTnJZK1Q4Vitud0V0cG9md0p5TUpPazdEN3VYUmNwTWVuZjlWNHBm?=
 =?utf-8?B?UWdOSHhCM0xjWFNyd24yblo0cFlGdURlTTIzcVhWd0kyL3d4bjlKcm00Y0xz?=
 =?utf-8?B?bm9POW0rK2IvNFM0OWhVNStzaC8xcTZtSC90VVcxTmJoZEp6cTdHU01STHZU?=
 =?utf-8?B?bUVQM0dVVTRpZWQzRzJ3TmJUcW1zcm5pY0pxRFlLSjkySHk2dFJEN0JNQ3lY?=
 =?utf-8?B?bHZ6ZzlYSDhrUGhwTVNYTjVMc3d1SGZrM1NQWFFGTlRSbVppam5hRDRWSEtq?=
 =?utf-8?B?TkNhMHFlWEVCY1ZmaldBbW5rcUs1Nmx2K3BDSG5TVTM2MUwwYktGRi9aaHY4?=
 =?utf-8?B?RVJhNTRqbyszeHlOOUJBd1l2ZDM4cUpjVG9sMFVRSTNUaEJabTUwaFdEMEZG?=
 =?utf-8?B?a1orb004eXBUZmo3UnRXYmxtZXo2VDVyNzRGQTdRekV5YU1Da0syOGtxU2ow?=
 =?utf-8?B?aVZxUm1QUUtKK21DejlyekFrekVuRjA2N2szT3Vhc3J6c2R2aHpBVURvTWdi?=
 =?utf-8?B?SUFUa3pzMjBKbU8yS2cvcS9VeXZxSkh6MHNqMldQeGtqd054MmNLV3p5U3VC?=
 =?utf-8?B?YnhCUkJIMWhZd0daSENQT3FDbFZhV2k2SkxQTHREbFR4c1o0SVdoRlpXaXRX?=
 =?utf-8?B?N3pIVDFjbGVlaXlsOENHa0dHT0VoM2RtdUVhd0JETno1MDlySXNQKysyU3hE?=
 =?utf-8?B?eFo2dHpZWHJrdTcrVnNYTllxZFlSWEp4dVNkUXhGaDRpMUZOL1grNnp3MkJC?=
 =?utf-8?B?ZHZ6MDJCbkNPYkp0Q1hqRWwrVGRzM1hyUkpSWlpaekpJc2ViT2M3cjJwR1Ns?=
 =?utf-8?B?a29nOTh5d2pMV2ZDdTNuNUVvczlxUWVPTWc4NG1SK1ZYdDMxMWJkVmhTOUZp?=
 =?utf-8?B?OXk1TncwSGlJaHlpVFA3cWVESXhxTzdzNlQzdmVnSDlDbXlzajVTbUtESWFk?=
 =?utf-8?B?dkIrZW1ZVTVjaVhUREJMVUlwMXNQWHhvdGJVaVRRVy9MTDNXR3NyUCtrM1NK?=
 =?utf-8?B?aG9RR0NsQnNLcys5ZWppUitBSU8yU1BGdzBKOWFSeHBPMzRqWGRPQk4vdFlO?=
 =?utf-8?B?OFBxUlh6TjdYK2h0b2IwaDBHWXNUaW5wSmh6bmtTK0JLZkZWWlJVVmEyUkpL?=
 =?utf-8?B?eFRGczIvaSttZUlWc1d2elJJbWpHQVQ1OEQzU3RaUUl4RTJRY0xoaDJNVWxZ?=
 =?utf-8?B?OHU4KysxVzU3aDRmb0NZa21qbHljbjc4bmhpcXBYa3FyMk81aHFaOEM5dENG?=
 =?utf-8?B?KzdNSjBlTm5nU2hoLzc2d2xIcHhsaFJOek51Y2xnaHA4ZWpTa2p5SnJkckQy?=
 =?utf-8?B?RWRiSjA2RWxDWGs4OXV6UnJtZUtHTTZxdHk5V1lUbm9JeXJoU0NHVUwrNEJl?=
 =?utf-8?B?NHlOeFhlc1lGQ3MyeUNPalZjdGRkQllZNDZjcEJmbVBzSUhjY2VmL2dGZWp1?=
 =?utf-8?Q?8fpldGdmqtS/twq+Km4lYG1g8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44c075ad-6295-46ca-7d50-08ddbf4133b6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 23:34:51.9343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6ncP8OFFHAcOmR3OuZ61cXokQf+fXfUqYwZfmR8UJWGbSmk0d0/fT1FMbK2EiCMY2kI0zoYaVduopfV1/l1Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9692
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

On 7/9/25 00:31, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
>> When a zone device page is split (via huge pmd folio split). The
>> driver callback for folio_split is invoked to let the device driver
>> know that the folio size has been split into a smaller order.
>>
>> The HMM test driver has been updated to handle the split, since the
>> test driver uses backing pages, it requires a mechanism of reorganizing
>> the backing pages (backing pages are used to create a mirror device)
>> again into the right sized order pages. This is supported by exporting
>> prep_compound_page().
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   include/linux/memremap.h |  7 +++++++
>>   include/linux/mm.h       |  1 +
>>   lib/test_hmm.c           | 35 +++++++++++++++++++++++++++++++++++
>>   mm/huge_memory.c         |  5 +++++
>>   mm/page_alloc.c          |  1 +
>>   5 files changed, 49 insertions(+)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 11d586dd8ef1..2091b754f1da 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -100,6 +100,13 @@ struct dev_pagemap_ops {
>>        */
>>       int (*memory_failure)(struct dev_pagemap *pgmap, unsigned long pfn,
>>                     unsigned long nr_pages, int mf_flags);
>> +
>> +    /*
>> +     * Used for private (un-addressable) device memory only.
>> +     * This callback is used when a folio is split into
>> +     * a smaller folio
> 
> Confusing. When a folio is split, it is split into multiple folios.
> 
> So when will this be invoked?
> 

It is invoked when a folio splits in mm/huge_memory.c. This allows the device
driver to update any metadata it's tracking w.r.t original folio in zone_device_data

>> +     */
>> +    void (*folio_split)(struct folio *head, struct folio *tail);
> 
> head and tail are really suboptimal termonology. They refer to head and tail pages, which is not really the case with folios (in the long run).
> 

Will rename them to original_folio and new_folio if that helps with readability

>>   };
>>     #define PGMAP_ALTMAP_VALID    (1 << 0)
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 98a67488b5fe..3d0e91e0a923 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -1415,6 +1415,7 @@ static inline struct folio *virt_to_folio(const void *x)
>>   void __folio_put(struct folio *folio);
>>     void split_page(struct page *page, unsigned int order);
>> +void prep_compound_page(struct page *page, unsigned int order);
>>   void folio_copy(struct folio *dst, struct folio *src);
>>   int folio_mc_copy(struct folio *dst, struct folio *src);
>>   diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index a81d2f8a0426..18b6a7b061d7 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -1640,10 +1640,45 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>       return ret;
>>   }
>>   +
>> +static void dmirror_devmem_folio_split(struct folio *head, struct folio *tail)
>> +{
>> +    struct page *rpage = BACKING_PAGE(folio_page(head, 0));
>> +    struct folio *new_rfolio;
>> +    struct folio *rfolio;
>> +    unsigned long offset = 0;
>> +
>> +    if (!rpage) {
>> +        folio_page(tail, 0)->zone_device_data = NULL;
>> +        return;
>> +    }
>> +
>> +    offset = folio_pfn(tail) - folio_pfn(head);
>> +    rfolio = page_folio(rpage);
>> +    new_rfolio = page_folio(folio_page(rfolio, offset));
>> +
>> +    folio_page(tail, 0)->zone_device_data = folio_page(new_rfolio, 0);
>> +
>> +    if (folio_pfn(tail) - folio_pfn(head) == 1) {
>> +        if (folio_order(head))
>> +            prep_compound_page(folio_page(rfolio, 0),
>> +                        folio_order(head));
>> +        folio_set_count(rfolio, 1);
>> +    }
>> +    clear_compound_head(folio_page(new_rfolio, 0));
>> +    if (folio_order(tail))
>> +        prep_compound_page(folio_page(new_rfolio, 0),
>> +                        folio_order(tail));
>> +    folio_set_count(new_rfolio, 1);
>> +    folio_page(new_rfolio, 0)->mapping = folio_page(rfolio, 0)->mapping;
>> +    tail->pgmap = head->pgmap;
> 
> Most of this doesn't look like it should be the responsibility of this callback.
> 
> Setting up a new folio after the split (messing with compound pages etc) really should not be the responsibility of this callback.
> 
> So no, this looks misplaced.
> 

We do need a callback for drivers to do the right thing. In this case if you look at lib/test_hmm.c,
device pages are emulated via backing pages (real folios allocated from system memory). Hence, you
see all the changes here. I can try and simplify this going forward.

>> +}
>> +
>>   static const struct dev_pagemap_ops dmirror_devmem_ops = {
>>       .page_free    = dmirror_devmem_free,
>>       .migrate_to_ram    = dmirror_devmem_fault,
>>       .page_free    = dmirror_devmem_free,
>> +    .folio_split    = dmirror_devmem_folio_split,
>>   };
>>     static int dmirror_device_init(struct dmirror_device *mdevice, int id)
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 995ac8be5709..518a70d1b58a 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3655,6 +3655,11 @@ static int __split_unmapped_folio(struct folio *folio, int new_order,
>>                           MTHP_STAT_NR_ANON, 1);
>>               }
>>   +            if (folio_is_device_private(origin_folio) &&
>> +                    origin_folio->pgmap->ops->folio_split)
>> +                origin_folio->pgmap->ops->folio_split(
>> +                    origin_folio, release);
> 
> Absolutely ugly. I think we need a wrapper for the
> 
Will do

>> +
>>               /*
>>                * Unfreeze refcount first. Additional reference from
>>                * page cache.
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 17ea8fb27cbf..563f7e39aa79 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -573,6 +573,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>>         prep_compound_head(page, order);
>>   }
>> +EXPORT_SYMBOL_GPL(prep_compound_page);
> 
> Hmmm, that is questionable. We don't want arbitrary modules to make use of that.
> 
> Another sign that you are exposing the wrong functionality/interface (folio_split) to modules.
> 

prep_compound_page is required for generic THP support. In our case the driver lib/test_hmm.c has no
real device pages, just actual folio pages backing it. When the split occurs, we need to ensure
the pgmap entries are correct, the mapping is right and the backing folio is set to the right order.

I tried copying the pages to new folios (but I can't allocate in the split context), I'll see
if I can get rid of this requirement.

Thanks,
Balbir Singh

