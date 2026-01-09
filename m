Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1ABD0C6A6
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 23:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7EB10E270;
	Fri,  9 Jan 2026 22:11:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FAPuOo/R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011048.outbound.protection.outlook.com [52.101.52.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DBE10E0F6;
 Fri,  9 Jan 2026 22:11:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YGLfLUEDTia+tXLmJynhs8ioKd9nWlJ9Z/HBMe4XdSa8id7sswlm0+cEi/mtALOiZg2+KGDtyBg8qWJ8ksjEGAAmP9eS9dcKQ6PIA3qYNpYJem3pUXhkfQU8+gQqzsPkrBG1+cVW9b5edOrWyfuXQN/WIsdYKrmflbXtQRYJA6Yw2QZAg/gwUOfWQipkwjpG33RYi23iakVJWwZpBl7EOTz9FNQ8ovm34ga3xzVhOXN8gM8Rcur2pftJRf/DstaCdKeG6XnJEIUmYThcEhoOE4GwyIZFaBn0y/LsgASzTrwO7oxjeTwmhVPZEpTDN7z0BQnhoydLVYUXnky3xjREMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoDg5vb8nhYPfc7Hyg5Pm7TWZg8oXgf6lUGmqVXvXsQ=;
 b=zB/btfOcMr+4zLCtDVqZ3HbajBLV6lk5RN46IlHK++h4qgeWfYoV0KXNDqbUjQ6jdgB/q9RBUBwNIuElvn1eJ+g7HaWHCy9wBkUnm8rMa8o9RAZ2B8IQPZMYhJ30NHNkACkBpK8wVdV5WyP/euk3VXKGmz/ujo/k3M+VxRNy/zVjV0n8XMYnqBvRQySRMLsluFSFZspdUJU2eO2LM+g7K1Yq0bHGCXkSZlJeQfgIAdcruJvhNSy2oJJbAY3HutqvPCpZy03dORTY6M104tA1h4tprGhRxf2T/kSzgISfHPYihQNnx85iGwLRXs2CUk8/RDS5lr6G87JBuPXyfOt5pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoDg5vb8nhYPfc7Hyg5Pm7TWZg8oXgf6lUGmqVXvXsQ=;
 b=FAPuOo/R9tdH6nw3rwljeXBwkNCu2NGIxfixVZaNMZ1zQGkjrkSauKQzNuclN9C+/z384HrfyZE4EevZGDIF0V72N5+HYFzYrNDfFAHiAFxQneMPM+7QMDfgCqQxKHMM7MwMegzVbozstc7O25DGP+yb7uAr3tiKtudPvkvks9n5+XkCQlan1CDEkOZnxZzfqTa635cnD3w7yxGBueB7sfXsgyYBkPeVj1ahshBUS3EvGFcW0TpdDm4trLxqLhZfPh7GUhiq3KA76w91xPeVITV4O2Yox8wb9lL3OF5I54uzKCVu7EAmRlXU2chIIIZZQSApRErImXeuqvNNsUv1vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 22:11:38 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9478.004; Fri, 9 Jan 2026
 22:11:37 +0000
Message-ID: <5c9f17ce-7174-4e74-92d7-8249f309f756@nvidia.com>
Date: Sat, 10 Jan 2026 09:11:32 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
To: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
 <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
 <aWFe9S2DGwfD2smO@lstrano-desk.jf.intel.com>
 <B8B15539-F97A-4D6B-BF58-FC75397C429F@nvidia.com>
 <4485ba83-a8c7-478f-953f-78d66e84d730@nvidia.com>
 <18E78790-4996-4151-821B-8A1D784A3F7D@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <18E78790-4996-4151-821B-8A1D784A3F7D@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: ffbbb180-d461-49a7-ef9c-08de4fcc0f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUNvVTMza0EvQjB3Q2k0dFNQKzdTcmkxdlE1TkNpbzE1MWtXOXcycXI1Y3JB?=
 =?utf-8?B?YzJvK3MreEIwaWxQSzlSQ1lOb0V1MGtHWU9VTmlCeno5djk2WVY0c2YvVTBy?=
 =?utf-8?B?ZXVaREVTTW1LTjczUDBydWxVcVBnK1RqUFdjaGkvL2F2T1Vla0VPY01nM01u?=
 =?utf-8?B?WnVhUUcrTzE1NGxla3c2MXpPdUxTSTNvczRDNmhJbGorZGNGTzVoOU9nNlpB?=
 =?utf-8?B?NjVRQTFzeEtpd2xqUWo4akRpbU94SVhjd092ZDN4aVJta3FQRGRyejRGNzdj?=
 =?utf-8?B?TEtvSlhXQlRaZmFiejJuQWE0dUZVRmxiSVl3amI3VUloZnV3VjhEMW8zT2Rr?=
 =?utf-8?B?U2hLSHVPT2dRdFZMczE5bVZjWjVpVEJqQUdBZkthKzY3Skp1dFlrcWZnTld4?=
 =?utf-8?B?YmllL29MVk1MUVZzcmgxdDB1VFBPWHl4LzBlNC8zVllHdmhiK1ZvdGU5VnZH?=
 =?utf-8?B?RVk0NHV6RHJXQitPUTdDZ2pidWRzUU4xRW5BSmJOOGN6QkJDdTd5bll2eFU0?=
 =?utf-8?B?LzVYQWtwL0c2bWdsa3hQSjlqQUl4WXNrd2Q5bmdUS1FlNGl3cU9VNUkxNDRE?=
 =?utf-8?B?aWVBbVR0a1pmTXNBcGR3aHgzMi9qNWFYcDh6TkYzejFUeXFRZ0hhQzRzdS9j?=
 =?utf-8?B?Qjg2Q2F5NXlDRnE1SEp3RXRGZmdFUUJKUlJxK0EwcmdzcGJBdXhmdFEvckcy?=
 =?utf-8?B?UG1BNVNGR1BFNUFtQmZjYS9xRmRoeGVkRjgxaHd3eno0VXJMSjkzemhYSkxZ?=
 =?utf-8?B?UFpYV0JzY2ZrVC90NjZGRmpGNVQ4ZnczUUpQOStHY0FYZjh2NDRybEdvNWRm?=
 =?utf-8?B?MTVWLzE4emRpWHBUdUlSbU9DNnJuMGRZZmh2OExhdUFENkRCc1BhV05YaVds?=
 =?utf-8?B?MmlrYWRJQlZpQzJCaDdNbG9Mekc2em0vQnQyUUI3aXBvSFo5NUxyZENWb0w2?=
 =?utf-8?B?NkVPY3pValh0ZnJWa1NLN0RxdHZwOFR5L0t3S2JXZWpoNHluekQ0NmxZME0y?=
 =?utf-8?B?MnZEMnBtWlE4K1BUWExmWExFZW43WVc0SG5KaThVTk5RckMvS05qamZXQk5W?=
 =?utf-8?B?MzgyOUwwcXBTT21KaUpUNUlTYUVtUXQ4VkZkaENPR0dxeUtobnp6a0ZrT1J1?=
 =?utf-8?B?REZHd0dwZ2FhZHRoV0Z0NE9sanZwTDd4cWM2cDQ3S0tCditNVWg3UGtobG5V?=
 =?utf-8?B?S0Vpb0l4Sm4zdmRiYlhwbkx4TzlkajB2WXliSkpYMlNQcG9jWThwSlgxR3lK?=
 =?utf-8?B?WUtDWkhqd21MN0dERGhyYjRKclhQSTRSOHIvQ2xhTHhYWlh5TzR0REZKdzlo?=
 =?utf-8?B?Um1rS21QQ1RIZ2kvTkFyS1liek9jMk42SEVPakZBUXAzZXlsZnR5Ynh6M2pU?=
 =?utf-8?B?aEM5eHNRK2NPM2dXOEtxRUE4UGVDUDZkVDhDWTJzWlhGblhnMkszdWRVOWtp?=
 =?utf-8?B?QlRnR1FvMGI0aURBKzBjRTViUi9KVkYzdW03cUZBdzBmVThkYVRMMWJjQTBY?=
 =?utf-8?B?WGFZeVE5a3BKbjhLYzhpZW1ZbmM4akVFa3JwQ2NxeWlYN1RTdG5ySXRGZXYz?=
 =?utf-8?B?STNEd2lJb21FTEtsOTAxem4yMXVzSlFQdTcrMTYrUVZqd0lxdXZZNVdEU0lJ?=
 =?utf-8?B?NkJKa1I3Vk5FTDRhRzc4a3AvOXU5OWUvRkdLazQ5OTBOTXR4c0NlS3NlZEM5?=
 =?utf-8?B?eVN0aGJoZGh2b3pDM09JYlRIQm5xME5YVW01Rk1NMWdYaU00NmNBTjJZZlJO?=
 =?utf-8?B?MDZ3K3I0akdqSU1qNGVROXUvd0k3YnFsaCt3OHNKblBFMU9UTXVUTFFza1Zv?=
 =?utf-8?B?OEZoSU9vOEJOTnBoM1ZnbU9UQmgyNU5HN3FyKzlRdkZsbWZQVldTQVZWQm90?=
 =?utf-8?B?NHFuRjlsUVRqODVYTkpObkFGVHJYQ3VEdGhoNkc4eXUvcEptWUl2MXRJNTYy?=
 =?utf-8?Q?ufr6LCZR7z6+XUZkgK1QN9M97vF210Dy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUtkaXhyWTJSY3J3K0plOEdhUm5kTXY0R1JXWmY2bjlaOERIVXNWR2tEaGJK?=
 =?utf-8?B?blhJQlBzeFhzeUxpQ2dQakxickZQcTZuTDRWUit2TlpNSXlPdlJqdHRjbzNS?=
 =?utf-8?B?b2V0NXNRTlZQT1BjQzVzZGVpZEVIUGhiTm9odHU2cnJnRERQRFV6aDdVZ3hD?=
 =?utf-8?B?MkZCcmQ2N1Z3R1R0My9LeFhUQnNkVkw3OG0xM0VPczMzRG5RS0ZObFUvMmZ2?=
 =?utf-8?B?WjVKY21nSmF1d0IwSDVnK2JsT3h6b29Eb3VDNXdOR3p6RmNvLzZMSjFaa0FF?=
 =?utf-8?B?SWRRdmVRQ1hvZHNiL0x6eEd4Tm5tUUdIQ2ZkM2E5amZvTXpnb2N2NkhoYmdV?=
 =?utf-8?B?TDNZVGF4c0ZRQnJQalBHVzFZaTVIN3BENVAxdTNOcE9MT2FjdFl0RWlSRlBv?=
 =?utf-8?B?SmN1aG9BU1I3NU8vanZyM1liejlxelpDTUsrNjlNMWFycldxSDlzUFZybGNQ?=
 =?utf-8?B?dlcveExRNXNaa2J0bGdXUFB0QytaWnJRTnZuOFlUYTByd1ZFQjZwWC9JSHQ5?=
 =?utf-8?B?cFVPQjNYeTVoVGRFTXpXYnpkMlRHYjZlMnlTczRDd3BWLzU2eVBEc01QckVr?=
 =?utf-8?B?akJicHc5SnhoaEZnSnBRWlAvZXpqS1BxZGZKOExNUzBCZTBIN2p2NENsMWVK?=
 =?utf-8?B?alN6cERyUzdxSHh5VHZEYTRkTHhVa3pyN1NUVGs2Q1Zmd1IyYzdLczEwTjVI?=
 =?utf-8?B?SW9sb2owSE5MR3RhYkFYeHRFVXg4aXVwN2dtbzJENGZha0tsYVlIamRiVVF4?=
 =?utf-8?B?VXNnS1FQdzdYR0RJa3dQZGRsT1REZ0YwZ3Z4b2RVcERKZGpjbHpZU094UFVI?=
 =?utf-8?B?VHp0MDdJOTlrc1A4RkxUQmhaejVjM3dGVFNmT3NKSWJqYnZrRjR2VWRob3pt?=
 =?utf-8?B?T2NhbGcrVHc0WFdITHJjeEVVNGl3aDZMUmZDMkpIcElSWUVSWDFqZ1BVREYz?=
 =?utf-8?B?b1lQV2lLWnpWb2M1N0xROFB6N1o2NGVCSU8xR0NuQ05Xc2lsNWJGcWR3QnJz?=
 =?utf-8?B?VzJsUThNcVlSZ1l2YTRGZkhCNjkyTElvUnhjSjR5VCtGQW05aWxucEp4RW1J?=
 =?utf-8?B?UFV6ZC9EVXVHNlg5TVJveTBZRDd6RXlwbS9SYXVVZzJpMHpSMzByMUVuMnJx?=
 =?utf-8?B?SkhxelhjN055WGVXVjQ2SXdiS1Q2Ym1Wd2ZDZzIxUWZEWml2Wms1Qkx0dW90?=
 =?utf-8?B?VHJNeWtOM3JOZjRLeURFVnBUT0NaVUF6WWhjQTFhWFo0OG9lK3MwQjRZRFhv?=
 =?utf-8?B?blhCeVRYakZSQ0tWMklZSE5KbWJRM21aeldJUEJxWUJSTGVhbUtmb0FTdHRn?=
 =?utf-8?B?MU9pcHhJWE1XWUI4TCszUDdzam9STjlnQ0hyQXI4bWJsalArZ0pMNUJMNnFo?=
 =?utf-8?B?NWJxcW02dkpUSkFyYUdqU3ZReVprdFVtSHVvQWlZVjN2SjlsWlFjTk5MSk81?=
 =?utf-8?B?aXM2NGptMGRqN3ZFRzEreWl2b1Q0eEQ2bGJuRnVoakQyY2hDWWFkbk5OTWhU?=
 =?utf-8?B?TTlwSXkzL1podGNibUd1d1FCekFuWTRxWjYyOUFJSmQ5MWVTK1drYXl4WVpC?=
 =?utf-8?B?Ykw1QjQyVEM3U3gxU2VRVTlsR3NRd2RCd0tUTEVlRGV0OW8rUk9GdEVWL00w?=
 =?utf-8?B?TklBY0grVmhrYVhNWTRJci9BOWZBcTFrMm1DbHhOTVhYbC9kNTNVK0xkNkdt?=
 =?utf-8?B?c0o1SnYrQ3BlSW42UTh0ek5lUEVtUVZkcXFvcDJoamE5dmE5MFJlNlJaVE5M?=
 =?utf-8?B?TmJzbUVCV29wN1poVXJJMFJtSDVKOEVzcnlRV2xHMU10a0FlVDVYUWxkV1hK?=
 =?utf-8?B?NUMvSjUrZm9LSmQvUjNlZE9vajFWMjFQcSs0ODlnenQvekVPcWhRdnd3U1Ew?=
 =?utf-8?B?L2MrR1ZvZEtnb0ZIeTNURWtLUHNweVcrdjZTdmtiQkJnY2VQM1B1bEl0dW5X?=
 =?utf-8?B?TU5GSHpTOFVDcHhCZTV6NlhBdi9YV1hHMnMrbllUMkpQUXZYaG9PNFYzcHFo?=
 =?utf-8?B?WUNHa0k3VlV0WDBNRThCNUc2UitmOTRWbFNUZ29NbUJaUHkva01tVU1oWEtG?=
 =?utf-8?B?S2Z1a016RXVkTk5ZYjFQOHp6Mk1qSHBsNWVIUmd6eXFWSFRJWDJac3dhRGp1?=
 =?utf-8?B?cEtXQkQyWEFaRlRiOHJ6c293K2NvUE9OY2ROd0RVbFJoVTZqRDB2c0lZQ2tw?=
 =?utf-8?B?M1pSS1pKY3Vya0JMTjAwM01oampMU0cwRjNjUmJxYWNSNHlRTlExRThsYURi?=
 =?utf-8?B?enFxTWNRS1d1eU5VSWtxc2VuR3lxZ0dZMXN3MzZSZXp3MjhaakJ4R2wrL1Q3?=
 =?utf-8?B?T0JmR3g5ejE4bi9qa3VuUjNoY2lzVyt5anlkVGVNbXBhTUx2ZDAyVVNaeXRX?=
 =?utf-8?Q?opIS5SmvuVjsjj3WH8tT2e1s1BEqc7hS8KtGOwpOETLlq?=
X-MS-Exchange-AntiSpam-MessageData-1: pg9iwkBxuBLv7g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbbb180-d461-49a7-ef9c-08de4fcc0f14
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 22:11:37.8970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AL5EhAxtdwdxsFdruGABHPcaFrDNFj1QviuWa0ArghUbStD014TkEBngI0E1pWgeXaWRztRVl24DHuuy0sZ2sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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

On 1/10/26 07:43, Zi Yan wrote:
> On 9 Jan 2026, at 16:34, Balbir Singh wrote:
> 
>> On 1/10/26 06:15, Zi Yan wrote:
>>> On 9 Jan 2026, at 15:03, Matthew Brost wrote:
>>>
>>>> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>>>>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>>>>
>>>>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>>>>
>>>>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>>>>>>
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>>>>
>>>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>
>>>>>>>>>>> Split device-private and coherent folios into individual pages before
>>>>>>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>>>>>>> pages.
>>>>>>>>>>>
>>>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>>>>> --- a/mm/memremap.c
>>>>>>>>>>> +++ b/mm/memremap.c
>>>>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>>>>  			break;
>>>>>>>>>>> +
>>>>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>>>>  		break;
>>>>>>>>>>
>>>>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>>>>>>> which checks the folio order and act upon that.
>>>>>>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>>>>>>
>>>>>>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>>>>>>> by asking drivers to undo compound pages.
>>>>>>>>>
>>>>>>>>
>>>>>>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>>>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>>>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>>>>>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>>>>>>> split the folio, so I’m leaning toward moving this call into the
>>>>>>>> driver’s folio_free function.
>>>>>>>
>>>>>>> No, that creates asymmetric page handling and is error prone.
>>>>>>>
>>>>>>
>>>>>> I agree it is asymmetric and symmetric is likely better.
>>>>>>
>>>>>>> In addition, looking at nouveau’s implementation in
>>>>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>>>>>>> which is never split, and passes it to zone_device_folio_init(). This
>>>>>>> is wrong, since if the folio is large, it will go through prep_compound_page()
>>>>>>> again. The bug has not manifested because there is only order-9 large folios.
>>>>>>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>>>>>>> from a free order-9 folio? Maintain a per-order free folio list and
>>>>>>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>>>>>>
>>>>>> The way Nouveau handles memory allocations here looks wrong to me—it
>>>>>> should probably use DRM Buddy and convert a block buddy to pages rather
>>>>>> than tracking a free folio list and free page list. But this is not my
>>>>>> driver.
>>>>>>
>>>>>>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>>>>>>
>>>>>>
>>>>>> I don’t disagree that this implementation is questionable.
>>>>>>
>>>>>> So what’s the suggestion here—add folio order to folio_free just to
>>>>>> accommodate Nouveau’s rather odd memory allocation algorithm? That
>>>>>> doesn’t seem right to me either.
>>>>>
>>>>> Splitting the folio in free_zone_device_folio() and passing folio order
>>>>> to folio_free() make sense to me, since after the split, the folio passed
>>>>
>>>> If this is concensous / direction - I can do this but a tree wide
>>>> change.
>>>>
>>>> I do have another question for everyone here - do we think this spliting
>>>> implementation should be considered a Fixes so this can go into 6.19?
>>>
>>> IMHO, this should be a fix, since it is wrong to call prep_compound_page()
>>> on a large folio. IIUC this seems to only affect nouveau now, I will let
>>> them to decide.
>>>
>>
>> Agreed, free_zone_device_folio() needs to split the folio on put.
>>
>>
>>>>
>>>>> to folio_free() contains no order information, but just the used-to-be
>>>>> head page and the remaining 511 pages are free. How does Intel Xe driver
>>>>> handle it without knowing folio order?
>>>>>
>>>>
>>>> It’s a bit convoluted, but folio/page->zone_device_data points to a
>>>> reference-counted object in GPU SVM. When the object’s reference count
>>>> drops to zero, we callback into the driver layer to release the memory.
>>>> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, which
>>>> is then released. If it’s not clear, our original allocation size
>>>> determines the granularity at which we free the backing store.
>>>>
>>>>> Do we really need the order info in ->folio_free() if the folio is split
>>>>> in free_zone_device_folio()? free_zone_device_folio() should just call
>>>>> ->folio_free() 2^order times to free individual page.
>>>>>
>>>>
>>>> No. If it’s a higher-order folio—let’s say a 2MB folio—we have one
>>>> reference to our GPU SVM object, so we can free the backing in a single
>>>> ->folio_free call.
>>>>
>>>> Now, if that folio gets split at some point into 4KB pages, then we’d
>>>> have 512 references to this object set up in the ->folio_split calls.
>>>> We’d then expect 512 ->folio_free() calls. Same case here: if, for
>>>> whatever reason, we can’t create a 2MB device page during a 2MB
>>>> migration and need to create 512 4KB pages so we'd have 512 references
>>>> to our GPU SVM object.
>>>
>>
>> I still don't follow why the folio_order does not capture the order of the folio.
>> If the folio is split, we should now have 512 split folios for THP
> 
> folio_order() should return 0 after the folio is split.
> 
> In terms of the number of after-split folios, it is 512 for current code base
> since THP is only 2MB in zone devices, but not future proof if mTHP support
> is added. It also causes confusion in core MM, where folio can have
> all kinds of orders.
> 
> 

I see that folio_split_unref() to see that there is no driver
callback during the split. Patch 3 controls the order of

+		folio_split_unref(folio);
 		pgmap->ops->folio_free(folio);

@Matthew, is there a reason to do the split prior to free? pgmap->ops->folio_free(folio)
shouldn't impact the folio itself, the backing memory can be freed and then the
folio split?


Balbir
