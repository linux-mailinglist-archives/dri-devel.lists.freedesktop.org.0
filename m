Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291FA558E2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 22:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1595110EA90;
	Thu,  6 Mar 2025 21:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DPAkEAi0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8545A10E82E;
 Thu,  6 Mar 2025 21:35:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RluzDb3xeJORSiMzHr07zhJZLoKd41kMn1tTqs/4uyHrY5wh5BDJcQYH7J6EANinsJHR2xlggKbYlraWXQTr8Rx50ReJBPaijVL+LldoGccOuLyi3yT8mQJRAXsHt6g9cPkO4JkcLP6N+NNlGKyXypDb0LVo5zfqgiTeN38Vvs9I2RveROsYlBg98WEtu2rlTPcnsm+Lyo84AglyUo1daWDdw9Sx4UKZX9ROoX7ZjiWvL4b7ZS+Y0aRJ6Aj+5ewZYmIKiMLSEVyhE0znxXcPFKHUThZDxnYMqEUFwvaWjWgz5lLkZRvLD4bJNSXB36wbo2onlt/8JIkEhrah8OFUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pn6jEMHE7pX1hICPrSB/rsGfEDgzoENU7ftj8ws6rvY=;
 b=ui3SVNyZpXHq+LuUBfi3nw/7qD4oKOMf6wRYPmEITtAu7pa4UlnGFNX5TY6XJ05gFqxpUwO2xOmDB4BkuCFFfo8VVh8h5B4X+8NpQdpwlctxwTHH/V/b82+jik+faMsTp8O8n0fNqAF6/+83w7zS2VVZtko1/IpBmTJYi7MDOVgQN/KsI+Cf5KtTSqGLlweX4m/275x0DoBpzD8yZoNxKouU8wUImBiGSz+jTZ1dXXUHdArjnYdHoHKmtvMT5Gusg/D2nOprmggYq3HtQ0YjrhTgS/4nmqr1Njh3hjokP4AJvlOwidAEFpYCzSG/Tq6N/Eo69+xl2c6acm3qZkWUSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pn6jEMHE7pX1hICPrSB/rsGfEDgzoENU7ftj8ws6rvY=;
 b=DPAkEAi0hC0Dcdav8bPdfldExJp1YUPrcTOAkSrXPX83/FpldKEVIr6txYkNcjzkLSyt6xWQSnMb2kaK5Btx9eOZBx3Oj8xOPlAUDtZGVLnxQXzq3MwSQrRxmFKURQrFHhHFxgI2N7muWTuZgEqsf0pLmKBsDwk8h77Ow//IdxD5dml09QVhbU30+Gvn5kXO45hEumGI/O8S8+t3wwdjZqgZezqwkZFjf96V9krABOgF4lyLtKgK+eUSWIikHHPX+lzhbeQC60mDFlGBvjxZl5oK/PhkUBQNzuN86QskDjIobiB2zojKdRWZmPPLuOWvwmk4/KXL7Oidac2vZacdFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA1PR12MB7272.namprd12.prod.outlook.com (2603:10b6:806:2b6::7)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 21:35:14 +0000
Received: from SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868]) by SA1PR12MB7272.namprd12.prod.outlook.com
 ([fe80::a970:b87e:819a:1868%7]) with mapi id 15.20.8489.028; Thu, 6 Mar 2025
 21:35:14 +0000
Message-ID: <44b581cd-5d3e-4a6e-a96e-12579af8a28d@nvidia.com>
Date: Fri, 7 Mar 2025 08:35:06 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 04/11] mm/migrate_device: THP migration of zone device pages
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org, 
 akpm@linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <20250306044239.3874247-5-balbirs@nvidia.com>
 <3dc94555-ae24-407f-8ac3-277b911de5d9@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <3dc94555-ae24-407f-8ac3-277b911de5d9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To SA1PR12MB7272.namprd12.prod.outlook.com
 (2603:10b6:806:2b6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB7272:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d91d00-d724-4025-eea4-08dd5cf6c816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBRczhzRW83REVjdE5RRnFTRkh6WHQ2aDRYOFBsNGMzbjdweUZyR1JRV0ZE?=
 =?utf-8?B?aGo2d05XTEZDNmZjN05mQ29BcHg5cURSb1R0QktsWjNNQi9sVmRnRmpEU0xR?=
 =?utf-8?B?R1AvaENycHhCS3hvdUhXbklzNFlLemdiZmZXQ24rSTB6cGdLVXlIcVp1WU92?=
 =?utf-8?B?cU9uQWdXc2lPZUNKaU5TZ1NDcS9rcFVDUWJ1WVd5dnZHUEFtN3BxZUtFdmJK?=
 =?utf-8?B?emNKMENRK1lrTVFpdmppU3VWNDQ3eXVNY2tpempxVEFIMVpycDZpN3BXNFhv?=
 =?utf-8?B?TlZmUGdEQmZjSlhBeDJTWnQySHFDNVIyaitYS211cFkrYUFVeWgya1c1dGZJ?=
 =?utf-8?B?emtHZUYzZCtrcDFwL2RzdlVPUnZ6K09Xa05IMjVxKzk2QXMvamhkVlU2RjN4?=
 =?utf-8?B?emJLSlkyMUEvRkFoM2pSU0hlbTFXT0tVUUIwTTNxVSs5WHZkTVlCNGdXZUVU?=
 =?utf-8?B?bzJpdXVDVmNyRGM1WUMrS0JFa2hBOWY5WnQyNCsxQ1VaK3V4ZktHU2xxMm5x?=
 =?utf-8?B?UitieVZ2UW85d1drUE80T1A3WGEwaVJROHRKbFZ6TmhSc2VuYlRDWjJCWFR3?=
 =?utf-8?B?bkxVQ2VoTHJmWFZ3LzI4VExoRlRqc2lhSW5RdDNCcXZqTXB1NkluNU5TYjRV?=
 =?utf-8?B?N053bDJPRi9FM0ZOb2dPRU1zalFUQVNTVkp3RWFxM3JVOFI1VmRJMnlNWHpw?=
 =?utf-8?B?dWlhdFd5RUlHem1oc0U3MmNseHpHT2JqaTV4SmYyWmp5eDNDdTRXcDdzek9v?=
 =?utf-8?B?RURpMlIyNHgzK1R0TjBZeENTUXJuZzRpbkhEaEdpTXBkbngvS3BZM2tXZkFH?=
 =?utf-8?B?NmlmVkswRmo5SnBIcXh4T0Q0S2VZdDFoUU9RckQyL0E4TE56alB4R2FhUU1J?=
 =?utf-8?B?bm84Z3hSaEVaMlEvVitoeGU4cUFkUlMyam9tSWFTamNTVGNMZnM4eXArRkFV?=
 =?utf-8?B?RmZTSkdWR1Nlc3YzeTJlTEl5SFI1SjBuSXhmbENLWC85dkhtclZCbGlkUy8v?=
 =?utf-8?B?cFJwY3N2NHNKOEg1bU1GV3pPY2RXY1lIb3VWSC9LcTFSK1BxMEZzVGRhWkVn?=
 =?utf-8?B?VG5tTm5OdzI3WDFOZGlRK2NqWWFzQmVpWFpSTzlicmVGZzc0Um1kMHFiVTRL?=
 =?utf-8?B?SnRLcXNkK1JRRGVmUjVIRG5sZjg5dTBKWURxa2I0VTVjNDI1VGV4cnIzcmJq?=
 =?utf-8?B?UG5BQkhqeVhiZERCMlVHS2VaSEdyNUFMNjNac1VMUFRtR1k1aUhEMjU2TW5Y?=
 =?utf-8?B?VFFVd0ErN0dqZTYzZkFjUkJ2c3gvRFJOWWUzTkVsUlVPR2ZmQVJ4YzBsOHc4?=
 =?utf-8?B?N2VTS3YxbGE3OEROVHB5Y0UxaHN0ZXpZVmxQbHVSZGJtQmNoQk5mdDZyVm5z?=
 =?utf-8?B?UDMzRTBJTUZ4dHRBSTh1QTVOYXBWV05aWkhhQjhBa3V6MFowWDdRMnlkOFNG?=
 =?utf-8?B?SklFdExyUk4zcnorOEJPRnZiTk0wYnlzY0IxZXVSOVlpZklFYXc1VnZodFRQ?=
 =?utf-8?B?TWg4dHhKbnhZbXlUVlhNbzl2cUQ1UUlZbHl2VkNCcDBQUDJGbDRjU3Q2OUtM?=
 =?utf-8?B?MHZ0Rm9vcldadXI5UDFmODQ5UmVJekVSNXh2OVNXRkprNnlsQlhPWXE3QlJt?=
 =?utf-8?B?UlVNa0o2WDNNcGxobDlMTk5GT0Vxc2lieEk4c050RHNNU2JVbHdJOE5CYi9D?=
 =?utf-8?B?MjV4WUl4KzdkRkJmTGFJUjA3T2FBb3gvY3NoRDIzRC91YUl3RkpjY3ZjL1Nj?=
 =?utf-8?B?QVIxbTRxcEt2Wm9zUXl6dFV1TGpQRW1BMjlsQUc4WWF3bjh1emFQMXlpMjU0?=
 =?utf-8?B?TCtqS0VtbjkyaG5wY3lXRnY5WlZ0dm1lZTVqd0FwOWNOOUlhcnRXSmF1Rml0?=
 =?utf-8?Q?MuAHyeezsvoe3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB7272.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWRsTjdxbThweTErZFd5UXB1K0tGL0FoYVk3UTduZGVtdEtBN3dLa2RLRm1s?=
 =?utf-8?B?b05TVU5TNlpPS2dod0RpZ0RKUm5STkE3TWQxQ2Zzd3RHdGtJdG16TklqOWZX?=
 =?utf-8?B?c1VMRTlaUVRmTjBYaU9RMXFOb0hVU0lCMkFubDk1ZzNkakdJSHdNQTgyS2Rj?=
 =?utf-8?B?c0dKQmNGQ1FTSEtheU8wVk54aXZnVE9yRTNzOC9XWmxVVTJ2VXJKanc4Vnph?=
 =?utf-8?B?WEhIRDNoWjFFQWllUzJsZ2RXc1RVNmY1K05ObnZqRlJ4NDUwR0M5aDhWSTZT?=
 =?utf-8?B?U0xBeXpxZDVGdnpiK0R0VU91SWlLOUZ2NEdPL0g4SlpDUzBKQ2hoWGdOU1ZN?=
 =?utf-8?B?eW9QbHhNcys4dHJTdkhaS3lhb2dJRk8vWm4xRkJZRTBCWWQ3YzV5M0lWL01S?=
 =?utf-8?B?MjA2U3RyMDRVaFhqbkZLam82a21WSmh0aDVqT3hwZkRuam55NjN4RGsrZUdY?=
 =?utf-8?B?aWYzd1RaSzVFV1VzN0VXbUdJZVAyZVF4eG9PbFkvanVCQy9vMzRkMldMVUIv?=
 =?utf-8?B?S2RLYWE1UUR3NHZ6TDVLYTJsdDJRNWZ2ZGR3UllpR1dUcElBd3pPN0dOQlJD?=
 =?utf-8?B?YlQzbzhtbVZtMzNQWGVFTnJRZGRIck9jMmlBUXlXaG9ZblVpMndqay9LNDlo?=
 =?utf-8?B?N2l6dDRZWFdibmcwN0t1ZUJ0aXZWd0NzTWJtU3I1UjAyQ1UyNUtCeUVqTDNx?=
 =?utf-8?B?RFY4UXBrWUJYRWtudjk5UWJNbW1yZmZhbkJuaHBpYVZMSXNtbHljRWN3UWd1?=
 =?utf-8?B?YitMa1Q2SXcvUVdkcHhGbnNjN1RudzVMajFhd1BjSEp5dlQwUlBFaGpxT2RI?=
 =?utf-8?B?NHY3VXk0dG1KV1dxeXNxRzdHZjdmYmhreE9uV25HWlZyVThKSGtMbVRkdjRF?=
 =?utf-8?B?TmxwRVB1RmROQ2NPRFlmeFlSYWJkaDZWeFhWNnZZYWtCSUp6ek5rYWVyd1hG?=
 =?utf-8?B?aCtwajRjRnQzUzBPK0ZXZ2NQbXlpOHYrblRYSkQxZXpYRlNweC9vdTV2V0F5?=
 =?utf-8?B?R0NrandPTDZRRUliVmptZG5WdVBrck5OM0diTnR0dnE0US9zdmVGZGljOFBv?=
 =?utf-8?B?SzNrb3A5L2psU2x0NDA4YW9udTZwK010LzlFWkdOT01kSlU1MHoxbmpMbTFQ?=
 =?utf-8?B?dk1JL0dTQWVmOGxmT29vcHFobzBaU2tRVStId1ZpeTM1MHJGSW5IbitQTFlp?=
 =?utf-8?B?bUtlOUEvZTlGdVo2aGdlR2tQWTVvblNKWW91emZhQ1JseWZmd0RKVFNmSWZj?=
 =?utf-8?B?SnFiekFWVVhlY29acjdKUmJrbTlQb002UTdDSlJudGdPTkUyQ1YxUFN0ZXlo?=
 =?utf-8?B?VjBMSHczd1RGK05iOVEwV1RabmU1T1EwQ2d2LytDRXMyWlo3cG1KVzc5WlZy?=
 =?utf-8?B?MVBId2xjbERxVC9rRDBUMEdDMHdzNytCM0NkRWNSL0hvSnFqVVpubjA2L0pD?=
 =?utf-8?B?SUgrL1lPUWRRUms5SU1kUUxpQjd6NExLSGRpcWcrajljRzZUdXhFL080dDZn?=
 =?utf-8?B?cnBjZ0gvTjRzUXhMbCtJaVlaM2RWTVdrcyt5OHV6WUw4aWhsRlZNZXlvQUhN?=
 =?utf-8?B?MmJmRUdHOTcyQ1NOVlZkZXRYaFh1YlV6cVErSjZWS3pKc1duNHdJYis0RnA5?=
 =?utf-8?B?bEowdkRPYlZPU0JJVEpGYlJSVTF0aC9JdFEwYzdTZk9iWjVwOXU2dUJvcHA1?=
 =?utf-8?B?Uk43SGUwemxtejN1dUltZjdsSjUxWXBtZnkwSGF1MW5lTDNGUjBSeHl5YnA5?=
 =?utf-8?B?NXk2RE5sL24xai9Ma2VUTVRYT1oyMEZ2OFk4YSt2UUdmVFFNWUhXVkZEcmNZ?=
 =?utf-8?B?QmtuTnhDek1yTDZjMi83TlFUZm9lTVkwL1B3azByd0FScWpSUCsrTXpqbUsr?=
 =?utf-8?B?L2kzUVppUXREWC81aG9wcTdSNWx0UzlENkNvejVCUzF4NTVjUVdxeUhUOENQ?=
 =?utf-8?B?L2RXaGpaaUdpUmJXL0hXa3FweWFQcU5ETTB1MFhWdGNHRWZwRVpITjhHZVUr?=
 =?utf-8?B?MFN6YWxDelhUM2Zmd3RNTkpYSkltK1d5SVJuZWxydmJkR1daZURxWWhRUEl6?=
 =?utf-8?B?akpJOXNaZkxFa0R5YkxocVNmWXJpbVhYU1dsMCtkOWJxSkgwV054bWJwc29n?=
 =?utf-8?Q?dPZlGPLYlyP1gBVpJVqPTd4nA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d91d00-d724-4025-eea4-08dd5cf6c816
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7272.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 21:35:14.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAtgKozYZE1Fke9aEm3xHEcwz+zRknYh3EjPw/VnMVaNheRbGOQN/eoBmbx2reL1yWzXhTRhztnMiD7yd/K/ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
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

On 3/6/25 20:24, Mika Penttilä wrote:
> Hi,
> 
> On 3/6/25 06:42, Balbir Singh wrote:
> ...
> 
>>  
>>  			/*
>>  			 * The only time there is no vma is when called from
>> @@ -728,15 +1000,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
>>  					migrate->pgmap_owner);
>>  				mmu_notifier_invalidate_range_start(&range);
>>  			}
>> -			migrate_vma_insert_page(migrate, addr, newpage,
>> +
>> +			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>> +				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
>> +				nr = HPAGE_PMD_NR;
>> +				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
>> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
>> +				goto next;
>> +			}
>> +
>> +			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
>>  						&src_pfns[i]);
>> -			continue;
>> +			goto next;
>>  		}
>>  
>>  		newfolio = page_folio(newpage);
>>  		folio = page_folio(page);
>>  		mapping = folio_mapping(folio);
>>  
>> +		/*
>> +		 * If THP migration is enabled, check if both src and dst
>> +		 * can migrate large pages
>> +		 */
>> +		if (thp_migration_supported()) {
>> +			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
>> +				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>> +				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
>> +
>> +				if (!migrate) {
>> +					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
>> +							 MIGRATE_PFN_COMPOUND);
>> +					goto next;
>> +				}
>> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> 
> This looks strange as is but patch 08 changes this to split and then
> migrate.

Yes, in the series at patch 4/11 split migration is not supported. That support
needs additional changes to be fully supported and comes in later.

> 
> 
>> +			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
>> +				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>> +				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
>> +				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
> 
> Should there be goto next; or similar here also, we are not migrating
> this src?
> 

Yes, will do, but generally it just falls through, but the additional checks below
are not needed.

Thanks for the review!
Balbir
