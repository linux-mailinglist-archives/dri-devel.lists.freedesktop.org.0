Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38172AFF562
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 01:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCD710E103;
	Wed,  9 Jul 2025 23:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XXER4PP+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7353210E0EE;
 Wed,  9 Jul 2025 23:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFaLvHXmdkJcmkB4GUC92R9x9BpIB7feU2duTvfDIdygk+Fn0KXKWyydwoPUHDB4EdWM/jepkoHxtf8tIFfGsJnFJXke5U10eshKftpxA5kMWQiA8zfDcQOmW4mTXpofUPdMs9b2gL0bNXgj8OVTsOyekDcGUu+dc7RKXkRbhl40ZoeJnqrYIxA2EV4r65pKuyJC3dnnQDFe3CM0JXHxqI49V8ywygzmFz7GhdO/7JVLH3qn2chWaFtKqP/dHyMjcgESvaaNAqqKjidpZrhgOrSqjFB780JPq21ZcUy3AHhlDFPVU9c3MytRzmDg5TJ9ineKe7mNr1TK2p2qcLEDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m9XweSOcd5hAUUvXCyCEeuy0rtHdz+vVrgHA1JiaLPg=;
 b=vqo8t1yAoZiadyQIz3SGad2RZAisswMUqMZk/fQBR0B9HnnlTMMZoMn8mT09B/u+6WXNwDxjDH7YihbUhxXrdwAHKquLoVLyn/Z2RjGZA+OjpvfKpkPZMZ7Mj7gWDGz16GHoVo9VNrZatnoiGYe0ROyZmP/wN7Ns+fQHbZ9mTbckAvtlX/EEHiduIPGXpiRJCDLZDbVANZFQgTejHn4LWUrg5E6GlKcwhaf5ysNgxTzOdUuNxQy9ZDomPCu7hogPhMiTVG8PXp0FPjXHevREE65YiCpDmcl9h5W7QylA13dNNA3LLFVWCKMSEcQzBoDYzP2FtvgaWk5dYmhUOaUjIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m9XweSOcd5hAUUvXCyCEeuy0rtHdz+vVrgHA1JiaLPg=;
 b=XXER4PP+2DboOkdgp4FsryR7l/WXR2C9evMk6Al30BNZ+9h2RObqsToWn5CYcl2pLIQ/cNo9IiHzK/DHCq0r+iWiGWjhcgKKaeMMNx5Ob4X6sJ6SJp7/qRnzyHk6D5PEGq0qT+R9wAm5LE6I22p9nVgqiwC6uFPf/nXzUOATWVNrcS6bY7DzRfaP0DsXi/808E2Owpl+UL7QpdJ79ofS4d5NVw3E+Xbiy35NeTxh+7JbFNvm+j91KyrAILjuZr1yUChO3KpVa7F+wf47mpvC3FFEp6J86SEZQh1LOARu30VHYUETlAYeEuisgm/Yojh3bWL7uP6i2u3/APKw1WY48w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.26; Wed, 9 Jul
 2025 23:26:58 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.8901.028; Wed, 9 Jul 2025
 23:26:57 +0000
Message-ID: <4a146953-3cdd-4ac7-a215-3ddadd6364eb@nvidia.com>
Date: Thu, 10 Jul 2025 09:26:50 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 05/11] mm/memory/fault: Add support for zone device THP
 fault handling
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
 <20250306044239.3874247-6-balbirs@nvidia.com>
 <3098c728-c4a7-4559-8213-2bca7971fda7@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <3098c728-c4a7-4559-8213-2bca7971fda7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0004.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e8a3a0-6406-43d2-4335-08ddbf401922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3dVRGZ5cDM4LzhBY29SYVFwbHgvenVtMy9JWWNvdVNZQ29qU3lxR254dWtm?=
 =?utf-8?B?VE0rRTQ5QnJvelovK3FkdVZidEZpeE5nbVJUKys5YVZPRS9ybmloWXEyYXV2?=
 =?utf-8?B?RXF0VnkySmwySTcwUmNTcVdyTHN5SlMwdTdqRlVwL1psQjZtMU5NcXVmY2Ey?=
 =?utf-8?B?dE1vU29zYTIxZjBaTkFCOUd1Sm40emM4ZWRDbGdORXorQXZXem5Ca3FjUVoz?=
 =?utf-8?B?U0plYjBDODRwb0Z3dU55NGVrcFh0M3JOU3J3cTZrZzdCSzdxTU42bi9ZNGs0?=
 =?utf-8?B?WHZjNFpkeWNyL3dzcmxkc3djSmwvUXNXK0RBa2VrSjZCbURhUUEwS2lKdmlC?=
 =?utf-8?B?NmQvMFRxWnlvcHUwcnA4cjF2ZWFoYWFSanRXbVNid3pvWlMyb3RBbytrZ2Rq?=
 =?utf-8?B?MzdpYUgrdVd5VnphZXNLcDVEL1lzVHZJNU9xVDVPUDM3enZ2STlQTUZnc0pG?=
 =?utf-8?B?Q0V3a3N0ZUMzOGhaVjlFcmtDaEYwaWluOWVEYlJldUdSTGhKZm5oL0U0enkx?=
 =?utf-8?B?cHFjb0tNV3FiMVI2RUJIY0xwdEdNVlBJbVRrdzlCZHBzQjVDejN2cktxQjRu?=
 =?utf-8?B?TEFrOXFsTkpVdnlCY09QTkJtOFZzTnNhbFlUbVBaUHAxay83VUNJempvVHo4?=
 =?utf-8?B?TmNjZWNMZlM3WmowZTNUREZPd3k5SEhxZThVRzZWTm5idlJ5MFdxWXhHM1Jq?=
 =?utf-8?B?RjdKZlVBYkZvbXB1MDVuNGE4cFBoYTdqSTNoUTF4UnNTclN5WitUTDIwZjhN?=
 =?utf-8?B?czQza1VQdE9TZ05Pa2tZRlpFV1VaV0ZkT1JqdHo4c1F4SjIrV09Sb3BFemZW?=
 =?utf-8?B?ME8rd0tmZXN4RU9wMTN1SEgrcDNZT0JQQjB5SlV5aW5qTHBpajhKcDJOTnpy?=
 =?utf-8?B?UUVXT0x3dkQvOEJ5ZUFkU1Aya25oUjR5bkFzZDFmcjBGa3JGdTI2SHQ2MDI2?=
 =?utf-8?B?aU1NNmJvbk1XQTlhRHduMVBaaW00U0VTTU9aTDV0Mjg2aVFzd2Z0Mkw2SjdF?=
 =?utf-8?B?V0xLTDI1RnVYOEJvNmlFdEw3S2ExODZqYmtveDUvQUp2dFlVUS9ML1FscUt5?=
 =?utf-8?B?bEY4OFp1VlVENVBDRWxzdzdpbXdIeXFzaVlSOTExSkpidUo2RW5NRmJINEhm?=
 =?utf-8?B?NVhveC81Z3VWREw1UFp5Z0tzWEIwc25WOFlmcFE4aGFzdkt2VFZmcGJROC8w?=
 =?utf-8?B?cENJSXMvWGRaR2w2Q2w3Ky9PV2lWcEJXTGpaTFZWOGx0TDJZUU5mTzhYYUxa?=
 =?utf-8?B?RVExQ0Z3LzhMSytEa3hrRjJHbWk1alQ3ZFUzdTg4QVN3RWFnazRLS210ZkNP?=
 =?utf-8?B?SW1VUmRLejREMU5tQmw2WjY0Z3NkTWJuWllBNnBQbzduRXJ0WGs3ZlUrcE42?=
 =?utf-8?B?Z3pIOFNHSlVacFcxY2FldWh5dEFIcVdvSDVNOExMcnpmL2VLSHFTUExuZXJH?=
 =?utf-8?B?RTlVMkNzZGxEdHNoMmdkVEw5djZCWURSQ0pVeko2aHNYNi8xTFJSVzJkVUUr?=
 =?utf-8?B?YmE3c2VORXFnSCtydTBTTlU5QlRxVGtVRkFCR2RYQ2wyaXpvYkR4Z1pKYzRC?=
 =?utf-8?B?Yk1QQU11RkFQbHpFZDlRNENVNDAwNENPZ1FWWWloMUZKS1k3Wld5SEdyZ0Fr?=
 =?utf-8?B?bGxISUVwYnVNMllIZjBMZERocUplTVprLzMxakNPajVJU3AwdlVzdlN2RWlt?=
 =?utf-8?B?bUdBOGxzQTZLcnNxVUc4enorMDUyR0M4dWZ3WldGM0RRVTRjY0RDcDY0UXhV?=
 =?utf-8?B?SGZVRjBMYmcycUowV29LNEsveDFrTU9TeXh2YUN5a09lYzNKb21YcVhUT0JT?=
 =?utf-8?B?MDc4MlZQWUVaTGtRWmdYRXd5THk5dnhsTG96Vllpd3poOTlxV3R1cXgyR05M?=
 =?utf-8?B?Z3dQUy92a0UxQ3RjbVpybE9NZ1pmUkxDN2tqUVlBYzJxczh3UlQxaXc1RWhn?=
 =?utf-8?Q?Yn5Nxj1iO6Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pJa05TUFVRN1VCbGZucnFmTjdveDI4QnVRZU5ZbWxoajBFOVFPS0lmSkZR?=
 =?utf-8?B?N2Zua3dBUHkyd3lNODZKbzh5OGxSTFJNS3RsRXArbHl3VlU3eHhjUmNFcEQz?=
 =?utf-8?B?eUg1R056eDk4S0JFVGhMaUhSVVBMNlVpM0dXbVlabkxacmdoYWJYbVk3ZE9s?=
 =?utf-8?B?alcrRWhwMjBRMFh5RVdaWnNFQnNWM2FsWXdvb1AzU2pMVkhaYzZhYklIZjQ4?=
 =?utf-8?B?VFdVcmZoN2tBRENoY2YzVGhEbnZoZjk5N3A2NHkyVTlWaWYwL0tTT2hZZ3hL?=
 =?utf-8?B?S2tKOUUvamRyc1R5b3NvTUdnN1hrdUF6U0NWVGRCQ3dPZEFTcUZxYWd5dGE0?=
 =?utf-8?B?UlJoUGczWUxQeVBXU1pkNWhSUFpOb3ZqUHZpRnZFcXA2U3RHTEw3S1pMZUNs?=
 =?utf-8?B?T011WDhHVjdJRWZCVDduT0FlTHFtQUd4bW1pL0UzRENoUmw0YzJJWXdwUWJm?=
 =?utf-8?B?ZUxQb2xaUnNIOWx6Z2JMNnZxY2l2SFZ3Q0t5b2VtOGpqSjlBNFdjWHBjeTNw?=
 =?utf-8?B?MVgyZlJUeEFmSm90bWJ4Ry9OT3orcWdFU1NkUHNLSW5YRVZiQjFhL1E2SUJG?=
 =?utf-8?B?eHJpOElsN3B5WDBySjhTL3ZoY3U0MWhNL0pja1JsRnlacmZDNjlIckI4L21M?=
 =?utf-8?B?ZUgwYWpaTzh3OEJsS0FNWnUrNmREWDhzOGZXeTRMcE5Ca1UwM3JpVVBwb0JF?=
 =?utf-8?B?VFhQS1FRMm0xWkJ2YU1OMExEaWkyUXdDVWhOWk1qRGtDS3ZHKzQ4QkZjVmNL?=
 =?utf-8?B?RmdTVUFmeWp4SXN0VExKbHhRaDBHaFZoaE13RXdlLzVXRnZPaTdtUEY3ZEtp?=
 =?utf-8?B?SVF5dmtVWnlIc080U1FsTHN0YUdmeDYyTjlhekV2WUY4R0N2OWdDdDB4VlZq?=
 =?utf-8?B?UnBraWlPNmg5QWdyMmpZQWlTTHhhUHloMXRRdDN6YUI0SWxuNHh6bUFRYi9S?=
 =?utf-8?B?anhYRHptUHZFdXptOXlLRHZpdjVMRjFJRlYxa0U5Y01SUFU2T0Y5eWJCUXlW?=
 =?utf-8?B?Rm0xRXVRTk1CemlCVFlVdEUxVVRRa3BTdzJMNjM2L3ZPQWFHc2IvRHlnMGp1?=
 =?utf-8?B?emFKSG1TSUlBR0l0dy9xSmVBRGpTZk9lTndxNDcwUFN4Q29DRmg0a0pub2hV?=
 =?utf-8?B?ZmJ0OEFvdWNnY3k2T3p0eTYybEtCOXNRdUR2TnAydGlJVkpGRVQzbndsNE9F?=
 =?utf-8?B?TytBazhRbjJuNkxZM25obktmUFFESTFVQ1cvUnpwMVQxM1l0U0ZsYzRBbzFv?=
 =?utf-8?B?RjM2Y3BHTTdxQTdtVUMrTXA0aGdDZ3MxUHU5aGZCaWxQNzAyTDdtSnFUc3ZI?=
 =?utf-8?B?K25UQXZybm1zU3dKVFRibE83bEJtSklJN3ZmOUhMTzF3c3IzKzNVT3E2YnBj?=
 =?utf-8?B?RE4zT1NsUkkxNDdUQmNPcldWTWZEbk5RMnBuREFLVHFoU0M4TFRZelk2ODVv?=
 =?utf-8?B?WG1aUGpPZjhIU0hDUithQnVMTmJlMCtFNlpjajRJT0FxeVdGYkU0L1orUndw?=
 =?utf-8?B?VSt2bkEvS3FDOXpXWUcxQmVXa0FRTnQ0Q0VNSy81N293ZFBtUm9kUDZva2FI?=
 =?utf-8?B?WjZscTdpV0VSeVcyMzBJazU3UmJtVTMxVXk2WHQrblQ0YXJqMy9hTHdHTHFI?=
 =?utf-8?B?MUtLQU5VQXR2UkZmb2d2Q3ZweTNQQUxVa2RTd0hDekREa3oxaVdsdmNTV29o?=
 =?utf-8?B?c05xTlRXZGt3dThyTm5xK2czZXRaaEZheTFLVzhZNlV5bnB3eGYxL3ZCS09t?=
 =?utf-8?B?b2NsV1MvYkdqY1BuU1JUbHU2aFM1bHVsZ0srbkV2UkNQZHYvRDB6L2ZRZFVT?=
 =?utf-8?B?MVJteTArSHA2dFljTDlzY0tINkJRWHVQWEwyclZ3Y1hLdzBrcCtuMUJDOUxv?=
 =?utf-8?B?Rm4zYjRyM1AzZVBmRlBrbVBvQmZvNk1haDlMZFFVa3BXeHhwWGZpdTZUU1g0?=
 =?utf-8?B?WEo0MSs1TWNRKzVEY1lZQ3hUdTlrd0tiYUZzdENVMW92SS8zRmNTOEV0MTJV?=
 =?utf-8?B?SGJlZ0Z3YnZOci9ZK21GSlJmbjVWenR4RkZ0UWgxRnVLTkhIbkR4N2hZeG1X?=
 =?utf-8?B?UFdaN1ZHUHFvY3g5eDdVdTFyNDdRV0hOMFpXLzhPTUQrY2NUWXZjZlF4UTFh?=
 =?utf-8?Q?wiyM2qX1QdHl8T+tpjiPvJSFk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e8a3a0-6406-43d2-4335-08ddbf401922
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 23:26:57.8667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd2fnJgsRt3H55pJ92ttrE3u+2WugJrX38Fw4r4mcZ2VDUDhmBu5bxIeRN8t72I58/vLpmEFTYIEBnUaeTGnqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136
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

On 7/9/25 00:40, David Hildenbrand wrote:
> On 06.03.25 05:42, Balbir Singh wrote:
>> When the CPU touches a zone device THP entry, the data needs to
>> be migrated back to the CPU, call migrate_to_ram() on these pages
>> via do_huge_pmd_device_private() fault handling helper.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   include/linux/huge_mm.h |  7 +++++++
>>   mm/huge_memory.c        | 35 +++++++++++++++++++++++++++++++++++
>>   mm/memory.c             |  6 ++++--
>>   3 files changed, 46 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
>> index e893d546a49f..ad0c0ccfcbc2 100644
>> --- a/include/linux/huge_mm.h
>> +++ b/include/linux/huge_mm.h
>> @@ -479,6 +479,8 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
>>     vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
>> +
>>   extern struct folio *huge_zero_folio;
>>   extern unsigned long huge_zero_pfn;
>>   @@ -634,6 +636,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
>>       return 0;
>>   }
>>   +static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
>> +    return 0;
>> +}
>> +
>>   static inline bool is_huge_zero_folio(const struct folio *folio)
>>   {
>>       return false;
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index d8e018d1bdbd..995ac8be5709 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1375,6 +1375,41 @@ vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf)
>>       return __do_huge_pmd_anonymous_page(vmf);
>>   }
>>   +vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
>> +{
>> +    struct vm_area_struct *vma = vmf->vma;
>> +    unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
>> +    vm_fault_t ret;
>> +    spinlock_t *ptl;
>> +    swp_entry_t swp_entry;
>> +    struct page *page;
>> +
>> +    if (!thp_vma_suitable_order(vma, haddr, PMD_ORDER))
>> +        return VM_FAULT_FALLBACK;
> 
> I'm confused. Why is that required when we already have a PMD entry?
> 
> Apart from that, nothing jumped at me.
> 
> 

You're right, it is not required

Balbir Singh

