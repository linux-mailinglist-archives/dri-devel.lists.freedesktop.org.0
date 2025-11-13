Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178DFC5A07B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 21:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D140F10E206;
	Thu, 13 Nov 2025 20:56:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YQm+0hkK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010028.outbound.protection.outlook.com
 [40.93.198.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0689310E206
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 20:56:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ExrqzdHxuo60xo9knjErZI7UrtIWVCGpVAOBS/vsLSrWbC0PmEwT0WnZwpcApCZaOkIg7XeLt2o8ZtfjsGSZWP4fSAtenu7kRjhA4J2EBPPZZZMUlXN5mVCQVtXRrSTkmb/h95ud80wmSUmuj44eqpOe95DMRrSZ4qWK/g9N0mLMg7r6ABSukykweM9PQHP1ZsoOd9jeArUaVn8xfjwDQxXI7Sm/s5ZMJSvHrcPhlx11nKcYOEIzAyaRrCgPhu1eiZIYdLvxsf5E8xLMgl0gvhUCJjV6da6MIKj4ppzWx/ErxImVYXJXhZ+l74ld3F1K9CwT3UQDoJ3JIJYk3oB6GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF1aNoTEtEBVWNwBdBtDe3JlxC0PE5E4UQC+n4S4NGw=;
 b=JwY+XpOz6n3D5vK+vxEf5tuKS1KuatEev8psAWb9eiV8CeuHZorLjBWmjRwv1464BdQamkHrynS6IZ/hDi9dihGoF40ncF9jj1ztbl1TOEa62ruNJyTl9O1HRFkQmVs8wnDnsTMrJ+ciGoyCAulFfwn9uj4UKN7L5rqvtOcnTuImnu5KrRR5xfku6rm0h6XLroqq4+LKMgM5EJmr/WDoW8nSOtq1lWEh66tuvkF2Q+Fk4xlYYG9cOEMBV6DkcY3UAip9G8bBNs13tCifM/2NU8S84Ya+dLDfp0V1V2g7JGh+Ib/PRpQxnzHvUQNUCiWmJwYr1z7qyXLKc1PaR/MS6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF1aNoTEtEBVWNwBdBtDe3JlxC0PE5E4UQC+n4S4NGw=;
 b=YQm+0hkKF2iscPD5yz5f0+8oWmuvN7l3YX8zZJPM5S4aIK7ueVjnqy/NqR5IETc8NnT2mhuSmqMN1k2BQMknBZFx8t8If6XO+EhgiCb2AGHbU1uhJR5f1qrpiDEhh9YbCd8nPER1nZ/QUjXWq4Yg7TE3hdOVSeNUlL9N+jAfGpNqear3otkv1QTbztFk3W3c+ziq9JDggYcMuOatQiKRwYdO+C0BqqUaMxxL1F3rgLi/mqbYedSYpIUUH80uVvI4PmXdH5C5nUrRwJREZKiskzXmz3FkRGOl3bHRzXP0qqYCaA+ck6zllUTs08MEiu2yyTMPMG3hoxtQkngBINqNkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SA1PR12MB7222.namprd12.prod.outlook.com (2603:10b6:806:2bf::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:55:36 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:55:36 +0000
Message-ID: <5092cfb0-ad25-40ff-9a07-3de86d37665f@nvidia.com>
Date: Fri, 14 Nov 2025 07:55:29 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: fix override of entry in
 remove_migration_pmd
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251113051352.1753714-1-balbirs@nvidia.com>
 <ed523668-92a3-4eaa-a999-4fb7a43e197d@lucifer.local>
 <dd1da795-d37a-47d2-87f5-50853ba43519@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <dd1da795-d37a-47d2-87f5-50853ba43519@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SA1PR12MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: b22249c9-1f2a-4744-465e-08de22f6fed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alo2SXVOOG9qU0l3SHM3b1hrNG9LanI2KytUTVY1anhBZTNLVElRQ1diOU9i?=
 =?utf-8?B?K1prSjFTaXpNU1BwSHc2M0lWWnNVMFRVR08rRUVGdnFTQjFWRlozSEFBSnJX?=
 =?utf-8?B?T0w3bzFoUG5wYXkvZnEwMjlGL2FPaEhueFFMQ3hJZHZhdkZuQ0hIU0xzMjNw?=
 =?utf-8?B?RWVuWFRsOXc4UW80NmlxbWZNZmgyUTdLbmppYjZzV0JFY3ZPTXpDeHo3RnE3?=
 =?utf-8?B?NWdyc0JmZTlVWmFMalZ3enhXMUtHeUF5dGZ4V0dVRzR6ZkplcWRsUzlsUXha?=
 =?utf-8?B?ZnBhZmdaS241SVJLM2FhTzlFZEhmTk15WG1zK3c0V0x6bnV5QnZNeEVVS3Fx?=
 =?utf-8?B?VUI4YmlHUzZ1bG1CY3VydW9NVUxCZXhwMDcwZ2p3NVc1dS9YMGpCOXNlWWZ0?=
 =?utf-8?B?NlFkUktmMFYraGtUbGVyU2hxMjE3UTJBTUpVWVYxbXlNNFdTQ3RHSlV5UW43?=
 =?utf-8?B?bWV2cUxMc2hIYXM3L29yRHQrUE1GUHlnTHdsZmhjL2VXV2tUWkloY1FWWmNm?=
 =?utf-8?B?NFp3NUhucXFtZ043a0hJVFNxd0thQllMTjZvR1FYUG5wektMb0xIaW13WUxH?=
 =?utf-8?B?b1crN3dxV0UxUEpwYlUyUVJncGpwWFZzUHNXRWJXWS82TThwQTlPVlVnQWVS?=
 =?utf-8?B?OVh3RnduSkFMZ09OSXJGdkpmaGtCRGc2SDlqcXc1K3JEVzYrYWlMZUJLckFO?=
 =?utf-8?B?RjVVYmZFemxYS0w1bU45QlZKTVZWWmd6cHFwT1dvekxtSUdQWk5uR3hFQlFh?=
 =?utf-8?B?a3JQL2RLV2VzL3lYYjhlbUdDMWMwQkE5a2RTNTZRbkZmUitqSjMxb25SR0Uy?=
 =?utf-8?B?aGNMeSt3SGpvZ0ZBMWprMnoyb2JiRDlRYTNRWDloSkhVQ1lhR3JOS0hxTVJq?=
 =?utf-8?B?THlXQlRGTms1WGZSY0VSak1EN1N3aEEvMUd1Qlg3NXMvTk5tU0JlRjVEM0tY?=
 =?utf-8?B?V1Y3OHF1Wm5oOUZkc00ycHpSZmpHQlIxRnZXSnoyd0ZMVWJWbUpMdlltTE42?=
 =?utf-8?B?dWIxdVhDNG9jLzBkN0RvVUlRWmgvUHhkcDlSMkJJY0NDdkVtQVhXeklWZGhE?=
 =?utf-8?B?Y0VZQVdDZTRuSjRBRnRJUkJ0VWxYNlpuMWEzcERpYVd6QVhpWk5PK2hrWml1?=
 =?utf-8?B?dGxUMmJXTFpSdm1icVdia1JVUkZ1a0R5MXlkMDJHTVRqdUhTZHphd2llcSs2?=
 =?utf-8?B?TE1IRWQxcEZySmFSV0N5N1lZeWE5c1RwQ05Hc2tYaEVCOUpyL3hFZVZSN1BI?=
 =?utf-8?B?Q2l2WnZkUlBjYjg1OTA3YWJ6aFYremtpcGIwQ0RFN2FnZ0lRTVNkVEN2Zm5k?=
 =?utf-8?B?TDlidVJEZjVJdHJxc3JQUEttMmlwUk1zbzg0TEYzZ2dUSDNydUc3clNXZUMv?=
 =?utf-8?B?U2RJcTN1aGY0SjZZSUc0RmgxVlNMM3lFUjlxVWNuSWtHcWtJa0IyRm91RFJB?=
 =?utf-8?B?Tnd5ajY5MjVqdFMzc1FOaEU3QThWeFFnRUpqYVN3b0g4bURZaGlDaGxUbldE?=
 =?utf-8?B?REMvWUlBYUFqUTJaYWxpWUsvdFlxUVV1YVVidDkzUlVUSXh3enhybloxNTBO?=
 =?utf-8?B?WW5NZGcvZ1ZOUGJ4T3RiZGhiTVB0d3VQMzdISmJxN1drbnEwSlBpMFJ1d1hK?=
 =?utf-8?B?OSthNEdFYTVocE9qNjRiOS9aUTZ6aHg3OENGbHlacStKdTJUM2FWR0Z1M3Va?=
 =?utf-8?B?cjAzMDZXMFc3YmlEdDRjNWpxTmFndWtZYldiMHJ5K2NlVnVPTXJHSkZBRTR3?=
 =?utf-8?B?L2JPbW5aZ2ZPR1htMHlnTlF2TlpyaU5DS29FN0NzRVRWRFFKcnpYVGl6UHZk?=
 =?utf-8?B?eEtMNWNlbFdoTWhoOWRMcjVMVWJjRkplS3UzMzM5YWdFYzlLcXdCMUkzTmFj?=
 =?utf-8?B?YjJKVWRESG0zVkZPdjdic2xYenB5WmkrL2dRckNaN2NXakQzWnZaWVc2eURJ?=
 =?utf-8?Q?oBzq5uZ7/SiecQPH+wNmSzAJRk61cjMo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0U1eDdGOWxRZWZSNU1DTFpNRDFpbkFYRHJ6a3Q1QWp1djN2SVdhMXJjNHh4?=
 =?utf-8?B?NU82SXRHUGNncGVLYVJqU3dWaTl6RGowRFBlZXNJM1FjdUhIdWtCYmRHNm9F?=
 =?utf-8?B?dDQzTGp4NmZ2QUFYV29CS1BBQXhDV2g4eGhETGw1aEdnVUlJYnIxL2lkQkt0?=
 =?utf-8?B?VzBoRFl5T0FDYlFjRzAwb3pBWkNMMFlwUW4yK3hzblpnQzgzVGtMU09BMkoy?=
 =?utf-8?B?UGpQTGVtU29pNlVGWUFPSkpqRXAzOERCNWZNd1d1M2hTakc4M0wzMWdDdms5?=
 =?utf-8?B?eEhVL2g1MUZ2V2tEUmUzV3MvamNFRU5VTEVNeVhObzc1Y09UcmRBV1FNUmlz?=
 =?utf-8?B?b2UzZTNEWXF6eTE5SkJHT01US1YrWERMM0VvNi9NN3duYkV6NVVzYW03R21s?=
 =?utf-8?B?cWs4TlVXcWk4MndNVmpaQjJtbzQ4ZXM4WUtCVWJzQVVZbFRaTG50WWI1UDRN?=
 =?utf-8?B?Z0VyTGdieC9DVXRxUVdwVnlUeVhYdk9qOGkwS3NTcmh6WjFUOUtWdmhaQmM0?=
 =?utf-8?B?SHlRT3BLVDRMcmdLa2ZlYU1oNXVVNTZFclFUcXB3VTlaN2Y4T3VmT1l4dGhH?=
 =?utf-8?B?SDBCRlVReEppYUowaW41T2k1ZHJ4UUdwKy81OTNLS2xORWFlUGw4ODNtUU9m?=
 =?utf-8?B?eW9rOHdGam8yTGROUTRqQkJFSm5RU3FTeUFmb0lHSk44SXNtRGZmSityeHlZ?=
 =?utf-8?B?Tlp4dndPMlRDTDZ6TlQyamhZSkhDYVlmSkV0dHlwKzkxMnJsR09oTFRHeXE3?=
 =?utf-8?B?WlUxSGdpOHI2TDlpSGNNQ1pZSWo3c2V4OFFMRWdsemQwa3VvUWw1WU9DNGI5?=
 =?utf-8?B?RVJONVBiRVU4SDZJdnF3empBMXBUZ015SUxQTzUxdDZzQTlxLzFidWI4dVUx?=
 =?utf-8?B?N1lGVnVWYXJ1QzZ5cTVhMkFWZXBTbHVNMGQ2VGlJMkJFZVJSenkxcjgvVVJl?=
 =?utf-8?B?Y3orQkg3K2h4aHNMUnBZZ1duQjROSEE0bmNwRGlyeDBSQm44OXJWUGZmZTA5?=
 =?utf-8?B?bFNmdVdzTWZ1cnN1NXQ5aS96TFVXdWlmeVpVOW5ER0NGek4vZUN1THE2eUU4?=
 =?utf-8?B?Y3dHMXBBUGNyUmd2L3ZGc1BrWWVhL25mbUF5NlZ6a3FrOFFMTFZrNGhjcnJS?=
 =?utf-8?B?TTloUkxFQnh5M084QmhXQUhhN2VIMlhnZGxwK1d2cnBtMFE5YlZFQUNMRkcr?=
 =?utf-8?B?UE9yWjJMbTZYb3BzWjl4cmMxY0paNUV3Wm4ycGNpQ2ZobXRSalpicTJwVHFX?=
 =?utf-8?B?YlYyc09IMUlwdytoOUxTTnBBaC90VnZZMDBLODE3TjgyN3pyRkt0cXlGcTNu?=
 =?utf-8?B?WFhkaVJybjY1TGZJSURoR3l0YUFNOG91NkNVcmx1US9DcWVGMlRHZWc3ZjAw?=
 =?utf-8?B?YndjK0VyNU5xeDUydmg4ZWJ1TU9YaUJ1cDFaeUk4VVV0b21Xd3BBSnJQaUhh?=
 =?utf-8?B?WGtDdEZ5NzlXcUhVT1c5Y2xBM1ZEQjRiVWd5NHY0a083ektBOERPQ0RCTUdp?=
 =?utf-8?B?ekwwTEtqdVVwZmJ5QjZmY2wwYlpwcktlVHhSL2hHL3hYdERnRGgzNlNlbEg0?=
 =?utf-8?B?cTNxQURKOHJyZm4vdjFBS3FQVXFLOEtnR29SL3Z4THV3WGNrVjJXMjlTQ00z?=
 =?utf-8?B?d1d3Myt2VGE3aUFoNzA5RE10Q3F3emoyUXg0Z0ZTY2daK2pkRm10TXB0cHI0?=
 =?utf-8?B?bUxuUHh6c3g4R1pCUHd6VFFzb3RWSHpFQ2dSakVUK1R4Y1ZDNlNzVE1Oa3Rp?=
 =?utf-8?B?Zmt3Vjc0Nm5GaStvdTNLenJGUEtvMmpxTEkvRjI2VjNrVVkrWVpiQ21jcmxM?=
 =?utf-8?B?cm5LUm14MzhTVS9qSmFHT2IxRVFvbGV0LzZRRlBJTVY3amk0WnZpSzgxS1RO?=
 =?utf-8?B?N3BXbWNoQXcvTEFjVUpRSlBxNkh1S09Sc1JTUFdkZSt4Zmd5ejliUWIzV3pS?=
 =?utf-8?B?S1ZTdERFT3JocjFzOWw0UUcxbkRhUTEyRk9sZ3hmYys1MnErbUZJUkJZSDVZ?=
 =?utf-8?B?SUFnRjU1WlN0L3c2cEVjRkU5TGY0d3VGMHZMNmcvSmNwclJkcWFkNzl6QzZN?=
 =?utf-8?B?d2JObThrdU9TUU15N3FRQ1p2R2Y2VlVQdVRhZTE3YlZXN3NkVldCWHVkVHpi?=
 =?utf-8?B?SFpUSE5LQi9qblRtN2JodXZxVnArd1lYZ1BEaENjS093NEoxWVVabTV4RUNk?=
 =?utf-8?Q?7m46yKnQCmcF72uaE+o+/75hv4KUMiB9cU2L+Fu1WxeG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22249c9-1f2a-4744-465e-08de22f6fed7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:55:36.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wI/kn7SiwRBl5r1BhljsLa+cyRQVGMHE5DsWdRSBGzYmvIGUK0zQ5ZczDBIwhxpZYcoiejBHIxUh0+Hm9ooiIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7222
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

On 11/13/25 23:07, David Hildenbrand (Red Hat) wrote:
> On 13.11.25 12:56, Lorenzo Stoakes wrote:
>> On Thu, Nov 13, 2025 at 04:13:52PM +1100, Balbir Singh wrote:
>>> The softleaf changes exposed a BUG in remove_rmap_pmd() where the
>>> migration entry was being overridden when the folio is device private.
>>>
>>> Use scope local entry for creating the device private pmde. Make the
>>> pmde writable if the migration entry is writable by moving the check
>>> softleaf_is_migration_write() prior to creating the device private entry.
>>>
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Cc: David Hildenbrand <david@redhat.com>
>>> Cc: Zi Yan <ziy@nvidia.com>
>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>> Cc: Byungchul Park <byungchul@sk.com>
>>> Cc: Gregory Price <gourry@gourry.net>
>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>> Cc: Alistair Popple <apopple@nvidia.com>
>>> Cc: Oscar Salvador <osalvador@suse.de>
>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>> Cc: Nico Pache <npache@redhat.com>
>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>> Cc: Dev Jain <dev.jain@arm.com>
>>> Cc: Barry Song <baohua@kernel.org>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>
>> THe logic LGTM but we don't want to have a bisect hazard here by having the bug
>> introduced earlier then resolved here.
> 
> Exactly.
> 

The hazard is a VM_WARN_ON() that checks for is_migration_entry() in the
call to softleaf_is_migration_young(). I am happy to go down that path,
let me send out the fixups, it felt weird to break the rebase, but I
am sure Andrew has a better way of dealing with this stuff.

Balbir

