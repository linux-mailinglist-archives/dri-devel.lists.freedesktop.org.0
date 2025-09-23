Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E353B942AE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 06:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAEF10E067;
	Tue, 23 Sep 2025 04:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pUb+hkSw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012036.outbound.protection.outlook.com [52.101.43.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73E10E067
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 04:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lX0TF9HkVJ9ZGBc5CL/pShGPOY8yUoGqRHPxe7H+zrq98M1XoUWntUiSo48PrppOnTu25yOMTMXJ9UFsL63Ybqr2nuNjawB8+8fihTwGNovD6hma6pTktUvsQlvhwZwsh0PiV4YjSrlyyeNf5N2O85EvhJUfs+zqKkCOo7j/6nB/nQYNBaWLeWT6yUJ++Cpu/QqTqXOqSpr2OZebCYcbFsYJFGjf7g/BG07aEgkqoJNi27dCb3LnhAzS7+O3RhDZ6bgoM9Dof4fHmuwblHvwowzXl0fxIKuyGn+6iX7bvE3A47fL21sNb+xKKJo0O/M7tSm1HS+m1RbzXpTKugeYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+3vGnqTATxCB/QMv1OqdYrjFpJlhkQK3tCcetd10dvw=;
 b=I7iLbZrZ3zRlc7B6A1F2sFZ3oC0BG6ORzrOW8EUQX3BEPtnp6cEpWssHFMEx2CJNAFOgfJCkMWOSYkP54JToFc3o1+6VDI5NhdGyFMxjXXsS3cJEwqGjzGJan7WwXEuG4Zn3oe49Ma2E6JNm/q+Hc4tyRLzquH2Psf67jbIXK6T+SCQxoadjJSc8dIJcWYMlFrtW2HsDUU183ulPp8a5Xl7K9BFlZEmbg+DmahSsh3O7yqmyMlQdPoEN08cAQ7MjcQ+xpED0hGHhJrNdtActoAADTGV8F1+tuqan5LKMBq3vfwwuRT44QF2sSPXC/pmM2lCpmvtpUa4UlPLHKU03CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+3vGnqTATxCB/QMv1OqdYrjFpJlhkQK3tCcetd10dvw=;
 b=pUb+hkSw2P8HV27oP6Gjd4I/a+1xUHFJiSJmSdj73M8sffQk41K7DFPnps3mnySsOvyWZVOJNLFnuTcoMXK8UwNwL3T3pftBwBzDHhuUHBtyYMTtR6WLlXOm+f03aWf2SDKTUwiN7CgsmA9Jf+gS7FGF2Nl78nQ7morlaOd5Ezn04TJgtAwhZhA1SHN6I1MTHteWqApY0Vy2w+mlJNWU3Z52aXbRHZKgFCAXjqToi9qfZRXd2jWt8emTUwr+YjDoUgB0zravX5xtOsMn0WQzIPPPHRyJFgneYM7YCNmCKTMeqjloQNnEpaFmUJXpyAEhRiqxMc0jsFUJwHD0DVRHIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH0PR12MB8150.namprd12.prod.outlook.com (2603:10b6:510:293::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 04:04:56 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 04:04:56 +0000
Message-ID: <901c82e7-0442-4791-b249-b035f8ee428d@nvidia.com>
Date: Tue, 23 Sep 2025 14:04:48 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 04/15] mm/huge_memory: implement device-private THP splitting
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
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
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-5-balbirs@nvidia.com>
 <7987AB89-4E80-4A0D-8736-E95F998698DA@nvidia.com>
 <a77b03b8-508b-4bad-8913-fb825ecd8a0d@nvidia.com>
 <F6F6DB2E-C08B-417A-A8CB-3E759FE2C3A7@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <F6F6DB2E-C08B-417A-A8CB-3E759FE2C3A7@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0066.namprd02.prod.outlook.com
 (2603:10b6:a03:54::43) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH0PR12MB8150:EE_
X-MS-Office365-Filtering-Correlation-Id: ffeb1dab-aac0-4b91-c7cb-08ddfa565afe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cCswWjJYYUl3NjdKZkxkQWgvU3ZqQXBiTEhDT0hvSFpoTU9tZU15OTRHVitU?=
 =?utf-8?B?ZUNvKzZLampyNE9Fa0ZqQmhCdi9zMyt6N3R2Rk5UcElPWUhBcGcvQXp4ZGxO?=
 =?utf-8?B?VTZBbE52aE5wZFgwWDJ5R3ZybktzVUFaYVNyUm5tcklxR2RKa21ObkpaQ0h2?=
 =?utf-8?B?MHp4VExabVdjRjhVb1I4U1JBYTJHMHozTHFiMGZZeW81Q0dLTmxaMGxSczN3?=
 =?utf-8?B?WVNydGdQWXovSGFqNUEzdXFyczVwaUtZLzJlQTJTMS84MFBJa25DS3BER21K?=
 =?utf-8?B?K1QwT2ZKY2tNZHFsSDNvR3M5TzhtbFoxU1RTV3JzamZUUGxXNUk4SWtqTXMr?=
 =?utf-8?B?L2RaL0JnVlMvZFJRWGpLbzk5bHZsYnk1NUxQTlFvTUdLVHBVVzVuWVJUeGhJ?=
 =?utf-8?B?ZE12UEVJUEZMRXFZMVJKbVlIS2tNV2FLV1g5OGdTSnVEWXNXQzVsczdBd0Z0?=
 =?utf-8?B?S081TGwxaFNmYmlrQlRKWFhxVUZ1MGozQWFNTU9SdlpseXFsSkx6a2JubFBq?=
 =?utf-8?B?WXNIdGNwMDVySXRxcm9BV3Qwc3FObCtIQVo2YkZhUERqd2dCb3ZVMlJ4c3pN?=
 =?utf-8?B?WWlHOUVSSHFGcDZGeUhEK0RSNFpyd0orRjJPY2VhTHhzY09ZWGxDSTRiWDM0?=
 =?utf-8?B?OXlsQndqRmo5d01kY3FNekJLbHQwOWRkRlRmN3BDcTBORnBnbUl4cmpwZVBw?=
 =?utf-8?B?RGRSREFWcHJnZzBzSFFVaEhPOUlMRkc1SExiWmxWN25DUlkvQXg4c1U2NnpC?=
 =?utf-8?B?bHQ5STFoZGRpYklIT3NubVVlMTV1TE9SVm1XQ0FNczJ3MTMxa2c5L3ZaNVl1?=
 =?utf-8?B?OTdFRCt0VUZHUXBYaWcrSTlwdXZWQmo0U0lsOHBYWjhWRUhmUFdvMUVUeFZj?=
 =?utf-8?B?aXhBbVpQT3JKWGk5TTA1K1ppbENvTUhxSkh6NFdWSXBHdmp3MmRXcGZlNTJK?=
 =?utf-8?B?bmc0UUVjaDNUN25lYkpoK0MwQWxEbzVMWkpXZnYzb0t5WCttK1BiWi8yWW1O?=
 =?utf-8?B?NHpXTVpzQ2NmWFh2L2tQNHJUN25lM1BpMGl5TkVqbEVOSkJYaVNNdUllbmRR?=
 =?utf-8?B?S05YYTZXekd1LzA0TEhXUjF3dXUvQTNBcndSQWxuZ0RsU0xsdjZxa0xTRGVJ?=
 =?utf-8?B?THhzZzdUZ0FDK3pjaWpIWnY1ditRdEFZejllL1VTTW91c0k1UWRyN0VMTFdW?=
 =?utf-8?B?ekNycU1ibWg0SnE4VzE5bTUvY0M2Qk5iZk95SG54OVJIblh1a2hOV2NxT25U?=
 =?utf-8?B?UzI4ZGdsb0krK09kaEhLZ20vVURqeGRhMERteDZjQVNjTCsxVjBZb3pXbUNh?=
 =?utf-8?B?Ny9VaDgvaUNTNmk4M0NPMDZ2UmdNYVNBQUdLMEd4STg2REZaQkloVk03dUg0?=
 =?utf-8?B?amdIeFc2N0ZRbHFkK1NZZEhidmpUZUJrRm1QcjB1NXZYbFd5MGFHV252dSsz?=
 =?utf-8?B?RUJkMDAwNC9FM3lleXlmOGllbm1wbHhQM0pxQlh2T005RytVclRpekx4c2lL?=
 =?utf-8?B?SmVTWTdUYmtBallEZWhHWlRlOEptMkhTbkhWTUNqRkZQL2RiU2NnUmdTU09l?=
 =?utf-8?B?b2piK2JzQjYyYzZYM0o2em1ibmF3WWhHbXlDVVdtTUhibUVibk93UzJyNFF1?=
 =?utf-8?B?OEEzLzBSZUJ4bmIzRUJjSmtUbkEvSGxlOXQyczg0Z24rdloxd1J4VXJyU3hX?=
 =?utf-8?B?WjYzMjN4SUJhSk5tSlhmbU1YcjBFdGo1eTZMczJuTlFKQkVFWWhGZXlCYkJ1?=
 =?utf-8?B?SGpVTkFsZWlKVmtnVjEza0FqNmhxU3BrS2M0Zi9EdEQwMnIxSS85V0JLVkMx?=
 =?utf-8?B?Q3c4WDBXSVYwc1drNzlva2huM1hneURLbkt3bCttZklRUVo1YXo3MlU1bDBG?=
 =?utf-8?B?aTRHdmRMZzFtZy8zUWYzMGx3eFlreWw2aDVkU3BMdjdVaks2UHNENVEwcnll?=
 =?utf-8?Q?emT4qp3hrmApUPLChn37LyDwkssGSCxA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHlsMEp5YjdtcitiaGRpUnBtRG53K2VxelhVYkE2OFp0UEVmWEJuNGhtZkVk?=
 =?utf-8?B?dXJsSEN5Y0c5RWJNMlpQSFkrRnR0ZnJnUEI0TVovQ2tmb0pTZDFzQVorUHlE?=
 =?utf-8?B?NVBwam1BQWYvN1orME5LbUxZcFYzb1AxU2hmU1VDUWRBWWszaGt6dWxXaVNl?=
 =?utf-8?B?TmVtbjdzSzI0OVczM3R3MWNaa3N4S2ZORXhUdkFoVllDYmplbkdqak9ad083?=
 =?utf-8?B?SnVHSnQzWDlkTVRhbGY5UGFiQUhaMWl6RHBwaHRkb21weTNKVFNkcnQvOWJS?=
 =?utf-8?B?ZnBybCthT2tUQXlDZzZLMGN4K3JxZ3VjdkJ5WmRqT3d0bEltb0kxMHJnU2xF?=
 =?utf-8?B?VjJmbU4vL3NYdE92OFA0a3V1UHJneDhmeElYSFlWanZNa0lkNUtXZzhXSTM1?=
 =?utf-8?B?M0lmVjRQcWFtRlpFdFpzMFE0OXRzcFc0aG5GTlVObS92dzNPcDlRcXM3dzNu?=
 =?utf-8?B?MzdtN3F5RWJHNk9iK1BJZkpNT2JXRk5YOEdYWnVtRzg2V0s5a01vNDZ2K1JX?=
 =?utf-8?B?eDdvU25nMmw2TmV6TFpkdHBKQlA3TklobzJIRnMxWmltbjBnUWdZRDgyNUIr?=
 =?utf-8?B?Q3hnOHo2M0x2N1dmYjVDajlPVWpaRnJpYVJMRVFrUWhHY1gzbkdzT2lieWlV?=
 =?utf-8?B?MHRkamJ2MGsxVEY1SDhvS05MdVd1TGd1eEdyb1VnTVI2cWIrMlhlMzMvSEoz?=
 =?utf-8?B?UkVKcVdJdzU1TWFmZzQwd0FvYVorSG5vc1J6NWEvWWg4SWlhSWx0dkVFSXZ2?=
 =?utf-8?B?YSt0bm96Q29WVmp5dVNVQlJnVXY4aDluNkVDODJUUUloa1QwbTFwanBmNXBs?=
 =?utf-8?B?aGJ4dkl0L1FDQmlrMHlFQk44MWlRTjFhVmpUVDdsWVBYMGl1NHJuTjlpeHh0?=
 =?utf-8?B?QXJqcE1wb1U4T0FxbTlVRVRKVzVHZ0NCK1lPa2l6eVREc1NjK0F0V21VdTNS?=
 =?utf-8?B?NjFzMHllSEREY0k5WFcwbGpRNjJLdlRMRG1vR3hlU2ZrelovZ3hjTFRYcHNa?=
 =?utf-8?B?aHVWdCtoV0xtWFNDbXpoakY2WlE1cXNTRkVIbDFMMndGUmhuclY3ZVZWaXMw?=
 =?utf-8?B?Vnozc2ZnbnRld1VKNXMxUE5md3Z0VUM2eDhSWXBnc2VPMEZTblR0cVJuOGlE?=
 =?utf-8?B?WEtTZ2x4SWJ5RDBpMUhwVTdRNDd4Yk42alZzclR1VStiR3lVSHJpU1BvMkxX?=
 =?utf-8?B?Umo3TnZGR1QyWlRYalN3c2NQN3B0ZGxyRFpRZnVEV3AxQnVKLzZ6MzQyQXhI?=
 =?utf-8?B?WmVGVCtJZXR0Uzk4SEdOTlJHeGJ1dVJMNVpWUnhyeUlKWkRmT25qdWFBei9q?=
 =?utf-8?B?OUcyRHJOZ0ZpdXFHUXR4REdYbHBJQ3JuRlNIMldBemFGbWxlWjhQVjQ5RExF?=
 =?utf-8?B?MUZEQ3N6RWdoZ2JoNG1zaFYybDlCTVptL1U2aWV4MHNBMG9WaHArNzMvbFNO?=
 =?utf-8?B?bSs0M21DRjV6Qzg2V2tobldweEFTVS9hR2VlU0l6MW1qTkV5K3RVVnEvMm40?=
 =?utf-8?B?VGh1RUVnR3pUdXVPT1QxSmRqNE9sSUNPNkFqekM5ZHg4VW90QUh1citmeDBz?=
 =?utf-8?B?Y2E3K3pHRzJUcjhWZkFvL2FkZkpCelJYaDl1MXUrNzhmMWRJdHE5aTJIQStD?=
 =?utf-8?B?TDJ1eEVxSDR3cDlJK1BzdkwwYW1NRDM3cXpYcm1CczkzZlBkQnVvK2lJbElw?=
 =?utf-8?B?ZnlTRTEzeGxPNmQ5M2hua3RQcWgyZnFHdUlsM04wZEFCTkttK2txZ0RMK0pv?=
 =?utf-8?B?Q1FYWlJISi9Ba3A4bFJUM1kzeHByUCtmOVNWenZyV2ZxZ2dSRjVjRk0wc3Rq?=
 =?utf-8?B?RmpPZHlBRlhYaFBmMk1zRkRKb0ZoSmYzUi9jM2tCS0FLN1hhL2FTOTE3K2JG?=
 =?utf-8?B?aVVmdXN3eU4rQ0NJYnc5bWwwY3diRnYzZEQ0Wno4a2lBOTRnR1YzRlBJbHY4?=
 =?utf-8?B?YzR4Mm5OS0tEd0RqeVpNRVdsbG0ram93R0RHTVhONjlpMDV1M3kvazZ6eVNW?=
 =?utf-8?B?YVNxeDNyN0xNcXQzTVhXY0ZNdm5FSUxUSjNhblNqeVBCTlhnMnFFVVl1R1Rk?=
 =?utf-8?B?dUVWTU9HSDdDV3B1cFA1SWpnaXV1WmxlaE1qOUUyWVdldFhqNGZITzBDdVNW?=
 =?utf-8?B?TjIrQnY2aFdUY011UmYvOThsZXhEZHNIUUgzZ04zYUJCV0JNYU5KU0lTOHlp?=
 =?utf-8?Q?OVAyEAaHO5VWvEy9XQlMjqA/jfF0brA/Q1F0xGiF+ezb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffeb1dab-aac0-4b91-c7cb-08ddfa565afe
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 04:04:56.0084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZaFOhO5rpMv8fSF7pHk1rG+DiZ6qhd6yifCu+6ezjpUHEERIxKkRA9ftUy/cQDg7OIsSooBg3XZBbjE5gS8jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8150
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

On 9/23/25 12:09, Zi Yan wrote:
> On 22 Sep 2025, at 21:50, Balbir Singh wrote:
> 
>> On 9/23/25 07:09, Zi Yan wrote:
>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>
>>>> Add support for splitting device-private THP folios, enabling fallback
>>>> to smaller page sizes when large page allocation or migration fails.
>>>>
>>>> Key changes:
>>>> - split_huge_pmd(): Handle device-private PMD entries during splitting
>>>> - Preserve RMAP_EXCLUSIVE semantics for anonymous exclusive folios
>>>> - Skip RMP_USE_SHARED_ZEROPAGE for device-private entries as they
>>>>   don't support shared zero page semantics
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
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
>>>> ---
>>>>  mm/huge_memory.c | 138 +++++++++++++++++++++++++++++++++--------------
>>>>  1 file changed, 98 insertions(+), 40 deletions(-)
>>>>
>>>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>>>> index 78166db72f4d..5291ee155a02 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -2872,16 +2872,18 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>>  	struct page *page;
>>>>  	pgtable_t pgtable;
>>>>  	pmd_t old_pmd, _pmd;
>>>> -	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
>>>> -	bool anon_exclusive = false, dirty = false;
>>>> +	bool soft_dirty, uffd_wp = false, young = false, write = false;
>>>> +	bool anon_exclusive = false, dirty = false, present = false;
>>>>  	unsigned long addr;
>>>>  	pte_t *pte;
>>>>  	int i;
>>>> +	swp_entry_t swp_entry;
>>>>
>>>>  	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>>>  	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>>>>  	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
>>>> -	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
>>>> +
>>>> +	VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd) && !pmd_trans_huge(*pmd));
>>>>
>>>>  	count_vm_event(THP_SPLIT_PMD);
>>>>
>>>> @@ -2929,20 +2931,47 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>>>  	}
>>>>
>>>> -	pmd_migration = is_pmd_migration_entry(*pmd);
>>>> -	if (unlikely(pmd_migration)) {
>>>> -		swp_entry_t entry;
>>>>
>>>> +	present = pmd_present(*pmd);
>>>> +	if (is_pmd_migration_entry(*pmd)) {
>>>>  		old_pmd = *pmd;
>>>> -		entry = pmd_to_swp_entry(old_pmd);
>>>> -		page = pfn_swap_entry_to_page(entry);
>>>> -		write = is_writable_migration_entry(entry);
>>>> +		swp_entry = pmd_to_swp_entry(old_pmd);
>>>> +		page = pfn_swap_entry_to_page(swp_entry);
>>>> +		folio = page_folio(page);
>>>> +
>>>> +		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>>> +		uffd_wp = pmd_swp_uffd_wp(old_pmd);
>>>> +
>>>> +		write = is_writable_migration_entry(swp_entry);
>>>>  		if (PageAnon(page))
>>>> -			anon_exclusive = is_readable_exclusive_migration_entry(entry);
>>>> -		young = is_migration_entry_young(entry);
>>>> -		dirty = is_migration_entry_dirty(entry);
>>>> +			anon_exclusive = is_readable_exclusive_migration_entry(swp_entry);
>>>> +		young = is_migration_entry_young(swp_entry);
>>>> +		dirty = is_migration_entry_dirty(swp_entry);
>>>> +	} else if (is_pmd_device_private_entry(*pmd)) {
>>>> +		old_pmd = *pmd;
>>>> +		swp_entry = pmd_to_swp_entry(old_pmd);
>>>> +		page = pfn_swap_entry_to_page(swp_entry);
>>>> +		folio = page_folio(page);
>>>> +
>>>>  		soft_dirty = pmd_swp_soft_dirty(old_pmd);
>>>>  		uffd_wp = pmd_swp_uffd_wp(old_pmd);
>>>> +
>>>> +		write = is_writable_device_private_entry(swp_entry);
>>>> +		anon_exclusive = PageAnonExclusive(page);
>>>> +
>>>> +		if (freeze && anon_exclusive &&
>>>> +		    folio_try_share_anon_rmap_pmd(folio, page))
>>>> +			freeze = false;
>>>
>>> Why is it OK to change the freeze request? OK, it is replicating
>>> the code for present PMD folios. Either add a comment to point
>>> to the explanation in the comment below, or move
>>> “if (is_pmd_device_private_entry(*pmd))“ branch in the else below
>>> to deduplicate this code.
>>
>> Similar to the code for present pages, ideally folio_try_share_anon_rmap_pmd()
>> should never fail.
> 
> anon_exclusive = PageAnonExclusive(page);
> if (freeze && anon_exclusive &&
>     folio_try_share_anon_rmap_pmd(folio, page))
>         freeze = false;
> if (!freeze) {
>         rmap_t rmap_flags = RMAP_NONE;
> 
>         folio_ref_add(folio, HPAGE_PMD_NR - 1);
>         if (anon_exclusive)
>                 rmap_flags |= RMAP_EXCLUSIVE;
>         folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>                                     vma, haddr, rmap_flags);
> }
> 
> are the same for both device private and present. Can it be deduplicated
> by doing below?
> 
> if (is_pmd_migration_entry(*pmd)) {
> ...
> } else {
> 	if (is_pmd_device_private_entry(*pmd)) {
> 		...
> 	} else if (pmd_present()) {
> 		...
> 	}
> 
> 	/* the above code */
> }
> 
> If not, at least adding a comment in the device private copy of the code
> pointing to the present copy's comment.
> 
>>
>>>
>>>> +		if (!freeze) {
>>>> +			rmap_t rmap_flags = RMAP_NONE;
>>>> +
>>>> +			folio_ref_add(folio, HPAGE_PMD_NR - 1);
>>>> +			if (anon_exclusive)
>>>> +				rmap_flags |= RMAP_EXCLUSIVE;
>>>> +
>>>> +			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>>>> +						 vma, haddr, rmap_flags);
>>>> +		}
>>>>  	} else {
>>>>  		/*
>>>>  		 * Up to this point the pmd is present and huge and userland has
>>>> @@ -3026,32 +3055,57 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>>  	 * Note that NUMA hinting access restrictions are not transferred to
>>>>  	 * avoid any possibility of altering permissions across VMAs.
>>>>  	 */
>>>> -	if (freeze || pmd_migration) {
>>>> -		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
>>>> -			pte_t entry;
>>>> -			swp_entry_t swp_entry;
>>>> -
>>>> -			if (write)
>>>> -				swp_entry = make_writable_migration_entry(
>>>> -							page_to_pfn(page + i));
>>>> -			else if (anon_exclusive)
>>>> -				swp_entry = make_readable_exclusive_migration_entry(
>>>> -							page_to_pfn(page + i));
>>>> -			else
>>>> -				swp_entry = make_readable_migration_entry(
>>>> -							page_to_pfn(page + i));
>>>> -			if (young)
>>>> -				swp_entry = make_migration_entry_young(swp_entry);
>>>> -			if (dirty)
>>>> -				swp_entry = make_migration_entry_dirty(swp_entry);
>>>> -			entry = swp_entry_to_pte(swp_entry);
>>>> -			if (soft_dirty)
>>>> -				entry = pte_swp_mksoft_dirty(entry);
>>>> -			if (uffd_wp)
>>>> -				entry = pte_swp_mkuffd_wp(entry);
>>>> +	if (freeze || !present) {
>>>> +		pte_t entry;
>>>>
>>>> -			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
>>>> -			set_pte_at(mm, addr, pte + i, entry);
>>>> +		if (freeze || is_migration_entry(swp_entry)) {
>>>>
>>> <snip>
>>>> +		} else {
>>> <snip>
>>>>  		}
>>>>  	} else {
>>>>  		pte_t entry;
>>>
>>> David already pointed this out in v5. It can be done such as:
>>>
>>> if (freeze || pmd_migration) {
>>> ...
>>> } else if (is_pmd_device_private_entry(old_pmd)) {
>>> ...
>>
>> No.. freeze can be true for device private entries as well
> 
> When freeze is true, migration entry is installed in place of
> device private entry, since the "if (freeze || pmd_migration)"
> branch is taken. This proposal is same as your code. What is
> the difference?
> 

I read the else if incorrectly, I'll simplify

>>
>>> } else {
>>> /* for present, non freeze case */
>>> }
>>>
>>>> @@ -3076,7 +3130,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>>>  	}
>>>>  	pte_unmap(pte);
>>>>
>>>> -	if (!pmd_migration)
>>>> +	if (!is_pmd_migration_entry(*pmd))
>>>>  		folio_remove_rmap_pmd(folio, page, vma);
>>>>  	if (freeze)
>>>>  		put_page(page);
>>>> @@ -3089,7 +3143,7 @@ void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>>>  			   pmd_t *pmd, bool freeze)
>>>>  {
>>>>  	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>>>> -	if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
>>>> +	if (pmd_trans_huge(*pmd) || is_pmd_non_present_folio_entry(*pmd))
>>>>  		__split_huge_pmd_locked(vma, pmd, address, freeze);
>>>>  }
>>>>
>>>> @@ -3268,6 +3322,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>>>>  	VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>>>>  	lockdep_assert_held(&lruvec->lru_lock);
>>>>
>>>> +	if (folio_is_device_private(folio))
>>>> +		return;
>>>> +
>>>>  	if (list) {
>>>>  		/* page reclaim is reclaiming a huge page */
>>>>  		VM_WARN_ON(folio_test_lru(folio));
>>>> @@ -3885,8 +3942,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>>>  	if (nr_shmem_dropped)
>>>>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>>>>
>>>> -	if (!ret && is_anon)
>>>> +	if (!ret && is_anon && !folio_is_device_private(folio))
>>>>  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
>>>> +
>>>
>>> You should remove this and add
>>>
>>> if (folio_is_device_private(folio))
>>> 	return false;
>>>
>>> in try_to_map_unused_to_zeropage(). Otherwise, no one would know
>>> device private folios need to be excluded from mapping unused to
>>> zero page.
>>>
>>
>> I had that upto v2 and then David asked me to remove it. FYI, this
>> is the only call site for RMP_USE_SHARED_ZEROPAGE
> 
> Can you provide a link?
> 

Please see https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/

> Even if this is the only call site, there is no guarantee that
> there will be none in the future. I am not sure why we want caller
> to handle this special case. Who is going to tell the next user
> of RMP_USE_SHARED_ZEROPAGE or caller to try_to_map_unused_to_zeropage()
> that device private is incompatible with them?
> 

I don't disagree, but the question was why are device private pages even making
it to try_to_map_unused_to_zeropage()>>
>>>>  	remap_page(folio, 1 << order, remap_flags);
>>>>
>>>>  	/*
>>>> -- 
>>>> 2.50.1
>>>
>>>
>>
>> Thanks for the review
>> Balbir

Thanks,
Balbir
