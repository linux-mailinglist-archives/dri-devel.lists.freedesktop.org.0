Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416BAB56E58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 04:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E6C210E290;
	Mon, 15 Sep 2025 02:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dXb7Vm7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39B10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 02:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Giw5hU3Z+QWDHSv/sLDrIG6+Fua/CakL2fVZ01cAvjwXoGBZcFhMoIU092+mP6SHxthjbdq/UbC5u7EwzscV/2uYlZzQPE2wAoIdq/uK0QCo0W27YGIbF6UNf9Nh5UJupTOkcQlzjiRadC3nuv8CXIpOAgoX0rGsyPpKRheDhLSuez1m4JmkkeEEzjRiH9gejq01WihofVUppJSpY33x1Cb2m+BbvyfIglg51rsxa1cPLBYRoK1bfU7pD/uMoDk3hcAHp74F77aPg9ZYDqyLoi9pFUjJCmFK5yLlNvTY0Zad81hseP/cKrtudXq7C/c8/h0xF5X7EXrdSS+eYAb2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjjIDRWaBtuKWHXg/ro8XnoOxQC61iwfEpJJyb8HsRY=;
 b=EPRFlYYc3rdhh5yFaTFaw142TedoqmYSyOL9OdvvLEpeHCR/q40p5pgP9UIGIrRmNp0nFrqSPzFmN6G1Ke3ApiACMXkGtUDc1UbkF5QWDeEfq7RJIpMXNGmjVeMHrPjQxOKqR7rHv+j1UXfScOExs6oSAh8tCnz27rfVScR2cPDIueJQCUSYnNfDg7LZjs2oaeQjo+0jwtS27CVJoNv4MMUvDgvIiKSFLVN/FBOmMdf3lMp12GU4ktuLHuIc25RQKbw24hz0F/4oik5PKLk7AWnPAJDUwQG3qwwJxTRH4gFrhGimWjYvsATZ07yqLjGCswVsB/kgco6hGR9Kl+T/tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjjIDRWaBtuKWHXg/ro8XnoOxQC61iwfEpJJyb8HsRY=;
 b=dXb7Vm7mwQd8nk3DLr+ESd6pw/gGbngl0KsShXyY1NGqAR4u9Jzoyf42ir5HAkS+6KDPl0pu2LVsqL5rRJdElCaPdlRECf4DRhIbrrwhp6pjRDV1y7OkrPmduH5ygAeh7y/0YHz+PNPflSR/7Vo0SUB+GeT+eghCk858QSLsGN2Dq7cj3GmxEW30Zjw2QDNiY1r5avwTAD54AMeXfCiPHEVUCd5qjHLTlkcpx3KZBLOSQ1uW75QCQkhelgf+ASaZBq6RhLkZp0J7Xf5ryVZK38oFfH/brgSx7aT6iJP9GXYpdamo3huT5JrI0MyDfqGosMpDi3+IYcAXnOkZ/1ecEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 15 Sep
 2025 02:37:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 02:37:58 +0000
Message-ID: <c829f1fb-911a-41c8-9f78-371781f8e081@nvidia.com>
Date: Mon, 15 Sep 2025 12:37:51 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 03/15] mm/rmap: extend rmap and migration support
 device-private entries
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-4-balbirs@nvidia.com>
 <6f1857b8-45db-4017-b6e8-02ecfa2104a3@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <6f1857b8-45db-4017-b6e8-02ecfa2104a3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c20b20-7765-46aa-9a8e-08ddf400e202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEh1eitCRksydy90WW1XeEJpcmFkVmFTVW5Mdmt3dWY2R2QveHdmK00xc1Z4?=
 =?utf-8?B?NUROVnVYM0QwNlcwamZndmxsTnQrRW9rYVN0K09uV1dvc3BIZ3dEaVhHQkhE?=
 =?utf-8?B?SjAxVmdSNnB1SS94cFVWeXo0MDdMVEUxWmdIUnp5Uk9HeGpia2Z5WkFycTdR?=
 =?utf-8?B?Q3MxN2xFU1hmdTAyYlgzWW0vQnJBajJWcHVBRmlwK3pLTXhUWkRrelovNjJH?=
 =?utf-8?B?Y1h0K1A5WFVwdmZWVmNNVEtDcy81Z1hxOGNpRm9qRmc4MnVST2xzUEpXay9K?=
 =?utf-8?B?Z1dLWldBVjFIeEZxaE1JRFhrQkpZN1I3d3VwaW9vbEsrdDkxZEJPSDh0Rm9z?=
 =?utf-8?B?QnVxR05mdm9xSFJRNmFVTXhlMS9oRFh5UDZPNTB3SHRlSXF3VHZ4MVFkd0lz?=
 =?utf-8?B?QzQ2NVpCSHNmTXcrWFViY2Q3UW84ZldDbm5SWVdrcFpFWDFtVWhUTUFWc0FZ?=
 =?utf-8?B?c2pqQkpINGRFS0VoMnlEN29OS2RQblBYc2xZRGh2LzROcitmbE0rajVjNTB1?=
 =?utf-8?B?ekI1NUd4MlpSZ0JGc045dU5sWWhMTWVWVXpndFMvVG95Nk15WXVES3VjOEdH?=
 =?utf-8?B?OFFQS1I3d3dEUEFGR216aGtyVmlGQ1dVdDgzbFVHYmlnN2dVS0N3bGdwNzFE?=
 =?utf-8?B?UURpaklWam9lR2lUSEM4aHhYenRxRVd5eEdFaTdIbVNtc04yTEFCUDlRRENu?=
 =?utf-8?B?SDlPNFM4WWJvNUtJTU11Y1o3cHRQZ3RPbEliN1Z1d0pqVHN2UWk1YXl5VGlo?=
 =?utf-8?B?dEFwTUF2U3U3QUl1WU5pWXZrdmVZOGJUTk92b2hUQkt0Q25aNkJqRHRSdEw2?=
 =?utf-8?B?UFlMeExZOUhPdGJXaGFkcVBzUTFFQklRUzdJU3JMZGcyR2ZwUHZWa24yL0t3?=
 =?utf-8?B?S2d6NFU4MHZTYktUdG45cnFPalVCOTZscllFQWh0eVVWSy8xbmlaTnBiMEs5?=
 =?utf-8?B?ZDhjUnNXb2pkWGl0ZzZCSW9pVHhqUGQrZHc1TnlEUWlWTDgyV1ErMWwzQUJJ?=
 =?utf-8?B?ZWFkQVQ3YmMwZE9WSW5vMFl5TC93ZkttNS82Y284MzFtbFY2ZEh2cVhpNndy?=
 =?utf-8?B?K0U1RXY4am1WeXJaelhGeENTU3FBYVNqdS9nZDBtWms4SnhHYlhENktlMEI1?=
 =?utf-8?B?bU1KNE5hZG8wU3Nsam5lMWFWblIwR3pib3M3ZXVycFRVQjdCQUxuY2IyZWJw?=
 =?utf-8?B?SDJWRDI3TFdvVE1mZzdsWWE3Ly8vaG9DT0ZtWERZeUx1MGVqWkI2byt6cCtt?=
 =?utf-8?B?TWpFbFNQZDN4d3p3bnlqWHI5bUNobzhDa3BDUmdqVFBhV0s1QWdUdTNxYnZu?=
 =?utf-8?B?TzA1SmhEMXZ0MnN6THNkNGhMeG5TaHVsUGZKMWNJZExpZmN4NFZYL0J2K0VP?=
 =?utf-8?B?dUNtb0hDNURNQWx1cmZJazhGdmt2bWlyT2dNeG5LM1lEdWdZTGhoZ3pRT3dP?=
 =?utf-8?B?MEFmWG9vK1pTQWVaQlZJY0xkRk84blRsZlVPTThqdVcwd2lZN0UyT1dPQWNG?=
 =?utf-8?B?dzlHd2IzODB2Z0Vhd21tUVhtdXNZYy9uODRrdGRlcUx3RVo5NDF2MUNDaGpu?=
 =?utf-8?B?OGNVTlRhbHdaSVBLaUNkV1dHOVJaamtYTW9HV0hjTlJ1WHBveTQ2NXkwb0Za?=
 =?utf-8?B?N0pVVG1aeit1aUppN2JQd0lEQTl0NUNIZzcrUmtPMHJJdVc2UGsvODdlUWVL?=
 =?utf-8?B?dk12NzhhaGZhbWdhZFNBWGdJdjRwdnlYd2tleUVFYmo0QmtBZVBOOStmdkNC?=
 =?utf-8?B?MmZnVytIZ0oxcGU5VWJwS1FiSkE4Rjh0MytQcXdtcGhWQlNETE4wVVJob2RU?=
 =?utf-8?B?RlpveDZENUJlYTNnNmozMXpSNnNLNDg1QXR3RTFTakdHNTVYWW9IaDJKbjBZ?=
 =?utf-8?B?TzhST3RvTk5lTWY5aFIzOFZhcU1Bbll3Z2RCZUpWUm5mZWluTFA0akFQUXZW?=
 =?utf-8?Q?S0cWDxIDQyY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2xNSTlVVnVoYzFjK0gxcVJybEw2dFUvYS9mZlFKUG85ZjhYaDd1MFBBdXM2?=
 =?utf-8?B?VHFMUUkybTdGeTVWdEEveU1Wc09Sa1o2dzBhVThNZHF5d2hRSnBNTHNOMHdJ?=
 =?utf-8?B?Q044ZmErVEhGTTVwdVM4L1FEL2lEQmtOcG1Oc1YzYm5PWERuRUp0ekJwQWF6?=
 =?utf-8?B?ek1DTWFZb3cxV2JYTzRPVzE0a3lXcFoxaUhyN3B0ZFNyR2NhSThvQ1VZc1Nx?=
 =?utf-8?B?d3pFVG9ITVFnUENGQ1ZUWVAyUk4yWWo3Njh5RTgwVmNQTysvd3pVZU5IOWdB?=
 =?utf-8?B?WUw0Mk9nczNNaGx1THhuTzNuSkl0Tm50S3puWmllYTMvMXljRzMvdjk3ZE5E?=
 =?utf-8?B?L09tQ2xKeWRLMVpXR3pTeUx4bDdHaVRZckI2b3J6MlovdzRrMGNMUEwyeGdq?=
 =?utf-8?B?RkYwa2VrK0RKZHAwOEJ1ZXoySHVRc3lCbExXVFdiLytJTkhweitxdnlUTHBn?=
 =?utf-8?B?VEtJQVR0VVJtK2d1Vm02d0x4VGtSeUFodGdoa2lLd3BpT3VyM25GM3ZUK1gv?=
 =?utf-8?B?V0RqdjMvZ2IyZk5HNktLb1VXSkptcG5Fa3ZtRDREdU53SkdRbWhLcDdqTDlq?=
 =?utf-8?B?empSVUZpVHRBN0NMQ3lXT2VoRU5YVmxFaC82UUJPNWVIS1ZVQVA4dURFYmx0?=
 =?utf-8?B?RjF4YStJR0xWOGV0NWpYQVdLd1ovQnN3Zm5OSEo3dTVKMlhQVU9kMHZETW0y?=
 =?utf-8?B?MHpZM2ZaNWVnUEpjWXA2TzRQTFR2b1h2dGI5SHgwUzY3amVmdHhHWkFXVFE3?=
 =?utf-8?B?L0xhbytET3lpd0tha2MzS3YyU29UaVFMWjRmRTUxaHlUTnVtUURUeGRNREE0?=
 =?utf-8?B?c05pdnpIcS9rdWwyMUJ5SFplU05DUjVVYjVoREZHazBkSFY2U0NuRGU5aktU?=
 =?utf-8?B?ZjB3cmhLeU1qYXpoMEhvMm9Ea1l3OTViZE85cjRyMHZyTHNoQ0thUDlFeEhP?=
 =?utf-8?B?cE4xbEV6eXJrb0I4UUNaY0pLeFJ1cmRlN2JidGliR2dWTWE4djVSYkJ5MHNH?=
 =?utf-8?B?Y2g1L1RobGFKRTRuRE9PaG1zMDl5MDQ0N3ZhMG82N20rL05OaXZtK0Q4aHJw?=
 =?utf-8?B?b2Faa3NuSU5rN2FReGlXVytHMEhPWVR1WFc1Zk9LYzFyVmF4cXBYaURsUW9F?=
 =?utf-8?B?OFgxa2RzTm5yOXgzZ05Sb0xGWWJCT1hMNXpkVlhuY1BNdzVUOTVQNG9ndml1?=
 =?utf-8?B?d25ha1pxRVUzWWZMMm5WZ3dIa2tWdUMyWFNlVXo1cGwrUHVtSGZHc0JoOFhB?=
 =?utf-8?B?OXVJOXgxdnMrK21Zbm1NSUY3R0YwYnFQSWEvNTN6TnBjZVEvSDduMWViZHJK?=
 =?utf-8?B?YnBzOGJUQ0hrVitGK1FoMWwvRlRCbzJmWU41Wktqd0lsRzI1Q0t4UEFFQ0tQ?=
 =?utf-8?B?dFphaXBjRjRYZThuQ1g0VzcvN0NHR3VtS0UzVXBlQTVMTmZLc1lFL1V0T0xa?=
 =?utf-8?B?N040L1BuUnA3RUU2WmJReTZrOTdKeWN6SnhsYjBhajRzOEd5b0pUZjVZVjRR?=
 =?utf-8?B?dndUc0ZPcTNwWDh3VXoxTk1OVjNnOHcyc2RCcXZiRnQrcjRlV0JLTFl3T3Vp?=
 =?utf-8?B?MnhJVDU4azhCN1dUaC93QVlubDJybHFaNlI1QTFPZkcrUFNxMmZQS2NQK01p?=
 =?utf-8?B?VytZMWlUMFNCM1E1RlBRQWNzeDBXdURRbXdMTXB2bVpJUjNDa1JUVlBnTFRv?=
 =?utf-8?B?WHh6cG9SRkcydEJjdVF2NXkrS0MyOW52bEJ6c21VNjlVcENwdllYeUcyUVEz?=
 =?utf-8?B?aXJ5ai9KNzArZkw0dVJxTW1EVU14TWpDUHUrWk5HQml1SThnYzJ3M0trOUs5?=
 =?utf-8?B?blJXOEhhTnE1QVNuUzVhMElkdEVBaFE4VE1McFRvYmIwZ3IyWFJnM0dDQXVY?=
 =?utf-8?B?ZnFLZDJQN0h5TS9ua1hocU0rT2UzMFpWWkJwNTA2U1p1RnZjaFVqMVVSWkN4?=
 =?utf-8?B?a29BOTFmTU1pbnZwNE55U09vTVpmV3ZRaUcvbFU1WTV2ZE51MkNFQi9CNWhw?=
 =?utf-8?B?bHJJL2FnMHA1RjY2NzVicSsrcDJBN1VwVEhjT1FXMzhHNEJWcDlQYnRTOWZQ?=
 =?utf-8?B?Ny9lb1NCWmdvOWNKY3lBOWhGdzc3RVN5aWd4Q01zSWozcWFNOCtQdmhXVGNI?=
 =?utf-8?B?bjdaWFo3clJ2d250Qkk4TUtKS1dzaXFWNU0xTVpzUVRRa0wzYlJHRXdqN3lH?=
 =?utf-8?Q?Nv5Qpp9sMTkXRI2k8tagRpdEacCY+U5C74/dubnqA2Rm?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c20b20-7765-46aa-9a8e-08ddf400e202
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 02:37:58.6981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n6K0xP1xBSCJsARebJ0zaJ5eIWIxkFLxgGMbYXFaU/zgg4njzFbWyyx7Vvl0FjsdmlOVh7gxEyZLLseFhmseZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

On 9/11/25 22:04, David Hildenbrand wrote:
> On 08.09.25 02:04, Balbir Singh wrote:
> 
> subject:
> 
> "mm/rmap: rmap and migration support for device-private PMD entries"
> 
> 
>> Add device-private THP support to reverse mapping infrastructure,
>> enabling proper handling during migration and walk operations.
>>
>> The key changes are:
>> - add_migration_pmd()/remove_migration_pmd(): Handle device-private
>>    entries during folio migration and splitting
>> - page_vma_mapped_walk(): Recognize device-private THP entries during
>>    VMA traversal operations
>>
>> This change supports folio splitting and migration operations on
>> device-private entries.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
> 
> [...]
> 
> 
>> +++ b/mm/page_vma_mapped.c
>> @@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>               pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>>               pmde = *pvmw->pmd;
>>               if (!pmd_present(pmde)) {
>> -                swp_entry_t entry;
>> +                swp_entry_t entry = pmd_to_swp_entry(pmde);
>>                     if (!thp_migration_supported() ||
>>                       !(pvmw->flags & PVMW_MIGRATION))
>>                       return not_found(pvmw);
>> -                entry = pmd_to_swp_entry(pmde);
>>                   if (!is_migration_entry(entry) ||
>>                       !check_pmd(swp_offset_pfn(entry), pvmw))
>>                       return not_found(pvmw);
> 
> Why this change? Looks unrelated.
> 

I fixed up and removed the new flag I introduced in v3. Will fix/undo


>> @@ -277,6 +276,15 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>                * cannot return prematurely, while zap_huge_pmd() has
>>                * cleared *pmd but not decremented compound_mapcount().
> 
> Reminder to self: cleanup compound_mapcount() leftovers
> 
>>                */
>> +            swp_entry_t entry;
>> +
>> +            entry = pmd_to_swp_entry(pmde);
> 
> swp_entry_t entry = pmd_to_swp_entry(pmde);
> 

Ack

>> +
>> +            if (is_device_private_entry(entry)) {
>> +                pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>> +                return true;
>> +            }
>> +
>>               if ((pvmw->flags & PVMW_SYNC) &&
>>                   thp_vma_suitable_order(vma, pvmw->address,
>>                              PMD_ORDER) &&
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 236ceff5b276..6de1baf7a4f1 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1063,8 +1063,10 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
>>           } else {
>>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>               pmd_t *pmd = pvmw->pmd;
>> -            pmd_t entry;
>> +            pmd_t entry = pmdp_get(pmd);
>>   +            if (!pmd_present(entry))
>> +                continue;
>>               if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
>>                   continue;
>>   
> 
> If you just did a pmdp_get() you should use it in these functions as well. If not (cleanup later), do a straight *pmd like the others.
> 
> 

Ack

> 
> Apart from that nothing jumped at me.
> 

Thanks for the review,
Balbir
