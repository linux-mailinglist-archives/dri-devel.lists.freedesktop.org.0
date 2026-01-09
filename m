Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434F9D0C0D7
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 20:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8303F10E93B;
	Fri,  9 Jan 2026 19:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y5qma58V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010052.outbound.protection.outlook.com [52.101.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504B210E93B;
 Fri,  9 Jan 2026 19:24:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBPoqyphcYE3Fg8UZ46rtZCs94r1bVhtNqVh6kjN7UAHDXfolJCF3QF/zQro5TPAX5IFQFbFb1vYFl453irHNMvqETXzorAkHV0PmzMjrIgPTQQ9GC3MdaRc44Mpy+hP/2hANu1FWsXFkU9YpThX6xRNT+m1kCiUuL78vZov6J7Gm9qsgxg/gsOpJSpPlNjLcnEfniBeZqS5PvYAYlsFDDH6pNrumta5ouiunPhBrptKi71P+AkxcFDDod/b1Lp5vO7lNc0upFRR7eHdX7F6tgSjO8WN2VxBgzk0pS/jFrkHVmGJ2LmmTeWFDcbNGSzguQZS68PgKvz+Z6Gdh15zZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NthSTt5gLaKoB0gjAFnQFxizgRKfWokl+ho+BN2odYA=;
 b=EDmtNkwFq1kfpkPu+23ihQbDI89belA8gQdivMPjJlVpt0FbUHJY/HmzRS8Op+7FSmVeFgeubEK/KEbGhgw2/ZlwzBA8F0sFM9hXYksuvcMiz3URqQxBZpRcGKTLJX+w4oknKK/2/n+h4KoaXh4eM2NFaIJYeg2TmH3OaaOQ8YlWk2Udtrk69T5PJBIh0xqTNx9kd1jw5cs6mr9m/3i3ZYZWj/nYkApTV5/1whoOLJtVusRSzevYMqRnc1UpsbQP7RX5OpgQHQPskQoChHZZLSAhMdTn7wXaUqMd1quctooF85fpp/4y5Ve/df2HK7O6WwY7qIvPJLm5HKFQocTbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NthSTt5gLaKoB0gjAFnQFxizgRKfWokl+ho+BN2odYA=;
 b=Y5qma58VbMy8fdc0ahenLA5xwvMopNJDvNopIZznxZFD1/pBo9VxtoKrQ3x/LgYi0C2rUDE1MD4fSI+kDoHKVQGMGtXrm2LOVp8KuP3uzq7rWHgZRAYv1Na8BOGoDyeTFhGjCORq/ngIc2Ff4K8/RShwZTe4hGLf+MfORicmaMeKAFvDWStZcj+k1nBQL+Ko7Z8zDoU5ijiY0GTIuJJ+4I4yNuPQ/yOCLNxMmo7T2RjNW0xIIA945SWa+wtZKceJDH9DgSuOJF0uSiY05Q4C2bxBebh2LztL7mQhS7wl0NrOGmHbPyXr+pKFhJHuA/QIzA7L7E+YVktwIiKhZreSSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA1PR12MB6235.namprd12.prod.outlook.com (2603:10b6:208:3e5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 19:23:55 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 19:23:55 +0000
From: Zi Yan <ziy@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Balbir Singh <balbirs@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Date: Fri, 09 Jan 2026 14:23:49 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <12A9DCBB-0B59-4D63-9BA8-9F99570AFA80@nvidia.com>
In-Reply-To: <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
References: <20260109085605.443316-1-francois.dugast@intel.com>
 <20260109085605.443316-4-francois.dugast@intel.com>
 <d1d80b81-678d-4d28-9ac2-95cb74824e73@redhat.com>
 <DF5A6B81-7811-4654-855F-8EAB76CCCE51@nvidia.com>
 <aWFIW6XCKXPpIinv@lstrano-desk.jf.intel.com>
 <D9ED5F01-E758-4A89-87F2-ABFF5197231D@nvidia.com>
 <aWFSGc7MIUqVsilw@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::29) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA1PR12MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: efdf6329-8c4c-4558-31a4-08de4fb4a10f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDNabEZIbG1uVTJoWFFsRkNrQytoZ2t6MWkrZXVyMGNyUUFDZm52d2JlcWl3?=
 =?utf-8?B?bnh4Y0pQNWxtTDZ3UDlYOUlzM1hZM2FSb1ZwM3laWERsOHJabkxjejUxb01m?=
 =?utf-8?B?MjdVR0w4ZExlZlBhbFNDcW5ZS0pZd1NnRWk0UTRHbVp1UmVNaDVCWkRBK2hm?=
 =?utf-8?B?ODQrcGhqZnRVY1hMZmJOcEFvTVJkUHZXdzExNUh5YkRSdHlIbUp5QnNEMHU1?=
 =?utf-8?B?eGxJVFppS0RFVDBpc25qRDZ4ZFNGVSswUmlVZVhib2VFSDZqNVZVYU5WSExE?=
 =?utf-8?B?UzV5MVFoanpPV2kyZFFDTlZEeDU5Z2dNVlNFR3RUcUNHV1ZpSHdKN3QzRWRE?=
 =?utf-8?B?WFliMmNCelVzdnZzNnkxSFNlSHo5OURqWXR0c3BuTk5TY3ZxMGo3ZFNkMjFI?=
 =?utf-8?B?d1N5MTJlL0c5Z1JXTWY2OFMrMWJmQnhDOER1YUhuTHJNa0ZISTJZaTVieGZY?=
 =?utf-8?B?WUVwVy9zcVJWSis1T0ZKdTlONGY2dC9QTlFKblJBS1JWaXdlekV2ejhMeVZU?=
 =?utf-8?B?Sk0xMU15U2xqZDZyOFNtR1NBb1NDN1pSQnF6U0NOTlhGU1FnRUFZN3pWcHFr?=
 =?utf-8?B?Y0gvNmtTU1BXRWNaWC9Ia01haHJOMEdFc1psRTlhLytUakdDSVdBcnNxc2R0?=
 =?utf-8?B?bCt4Y3JlRXFZVTVlbTJZeUdOWWhmRGdIa3BldzZKcG1FUEpleVoxYktDQ25x?=
 =?utf-8?B?TXU4eTFyaGNJaCtMZS94MDRrd1lhR3JqK1RmaVBoTExVSHExN3IwckpPcFZK?=
 =?utf-8?B?djZtNklrUmJ0d0d0M04wR3pFYlgzYjl2bTBGLzZkMFB0MnRvYW1QaUk5dDNN?=
 =?utf-8?B?UzVLVzBMekNpNkszQndrd3RLOWNueFQvUExlcXB6UXdaWUtKZGFHQ05BUXp5?=
 =?utf-8?B?bGVMNldIcU1CaTNJWFlCZmRvbFpzTHNxZlNnc2dBbzkyWVM0UGNiV0JMaEM3?=
 =?utf-8?B?ZmlHRm5nRnczTUExd0lvb0JlNjlJTHJTNll1V085Z3VHd251ZG5TVmVHTFVO?=
 =?utf-8?B?ckYreFhocitnN3dOTnJ3a0JKa3JTM2xleVNzT2tjb3hPMG1SaSt1ejBwelYy?=
 =?utf-8?B?bGp3ZTJNdWpPV2FaYVVKck51Y0s1bGRZTGV4MjBaVUs1Rzd0MFpLN1h2K2lX?=
 =?utf-8?B?K2U3dDhRd2VHL2dBUXBzNklSeWpjRlVSRmNNYzZiaHZTS3dhWTJmenpQL2VP?=
 =?utf-8?B?dGxReFU0eDM4YlBxRXFGN2lHNHh1cVBxb1VUL2c5dnZVUit2ZTA4OXZNc2RB?=
 =?utf-8?B?c0FYc3oyUVd5cE9DWnJnRHBqRzkxeG1RQmorZTkvQ2ZGK3M2R2RUcVIzdnFu?=
 =?utf-8?B?bGx4cmFqSExNeU9Mbm1oZE1sR3lrd3RiL0tkcW5QcXhVdmxNTVFxOFVQWlFh?=
 =?utf-8?B?YVNJUDg1UmZsK29PbFpHbEFyVVNMU1M2YTBrcFNKWWR3d241eGsvK1lCWlMr?=
 =?utf-8?B?cmtGVTUyNVF0Nk5rYzlNYjliNFl0NjE4Z1o4bUlWdDU4U2ZzVWp2NTc3alds?=
 =?utf-8?B?MHg0OWxTMWowaitlOG1FelQ5VW5zVmxRajQwZW5sTFlzZ1dZQ1BWcDkzSCtD?=
 =?utf-8?B?OGpLTzBFNmF2QUVxOUkrZW10blQ4VVVzdUpYOHpqN3BSNFZyMUozOWdrdG91?=
 =?utf-8?B?bUNhUnRuNlQyYVpBVUthYXNTMmVNSkdhU2tFSHk1VTk2REUxYU5udzVZZmVU?=
 =?utf-8?B?V0xqMGhXVVdlQ1J0c0NQSEdSOXBNcTJ1enpzOGNaWWlkQ0UxWFRCcDYydll3?=
 =?utf-8?B?aGxOYzhoWjBqV1dFaXNWcE9ZSmV5VHZuSkRUTVU0amczdmdYNnFZT21JcXpm?=
 =?utf-8?B?dGJJd0ZWZElmU2ZxT1hnQkJRUjFzSHBnQlJYRi9CbnZXalNhYmhNS0N4MGNF?=
 =?utf-8?B?Z0VJMWlKWDF5MVo3d01zTXBYSmpwdk9Ia096S3kxQ09xM0FQTlJTUUVTQWJY?=
 =?utf-8?Q?IYRtvua6wLjz2WhGDnOArP7ZZGBVaCiY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBuNzRybXlSclVhQ0dadCtTOXJLQnlYSzNTTTVaODBnVjFBNHVyZFphKzdJ?=
 =?utf-8?B?VVBVci92cE9zZ0p1MzFmRnVlS0NOT1dMN2Vwb3JFZ3h1MmZrV2hZR3BYcjNp?=
 =?utf-8?B?SytST0xQaGlzMU9VeFBHT2JzNmlzb2dPL002UHVDWXVMaW90bE5Jb0JISzI1?=
 =?utf-8?B?SFVST2RnNE56QlVPOUZTU05mc0VxM3JqOFJaK3VLMVEwUElHK3BNNWNVSTBv?=
 =?utf-8?B?Y0s0YisxdU1GRTBYb2dubmU1N1FiME1PSWovRFd1YjZRL2tXb2w0dTFpSG9T?=
 =?utf-8?B?T1dueFdLeFV1WkJ0dDl4Y2tKZjBCRXV6TnEzSC9tdXQ0Q1A2WW9Fb202SkNJ?=
 =?utf-8?B?WTI1VldTazdtRnB1YVBucUN1Tmp6Rk80MGVzalBUY1NKcStVM20yNnVjcnVj?=
 =?utf-8?B?a2FUTVRVMmRVZWRQei9odkxSOVp5a1ZCYlh2UWcxZytPUDMwMkxhd2RtRXlX?=
 =?utf-8?B?a0NWb0EwZXM2TjhDaVJuSGJZNkJOWjRNUmwrT3B3Zjd5S2FJR0phNk40Qlgz?=
 =?utf-8?B?UEtpNzJSYkJ1Q3JqMndZdWdjbTUvK3R6MzkxamNTQlZSeklxMWVUaU5xYmFv?=
 =?utf-8?B?cjNIaWdSbys4OGNsNm5SNkNzUnVMS0ttYW9VL3VXdWJpTTEzSzBEQXB0Z09h?=
 =?utf-8?B?S1BoQVMybnV3eTdaSTN0UVdQbjNyZHhYZ21yMFBBRXRNUzJBZmQzZUprVlYr?=
 =?utf-8?B?cmxPS29tRjhOMk9lZGNySXlyMTdDdFY4MHlXNGMwQ3J3bmN2TWk2WXdIVVNT?=
 =?utf-8?B?SzQ5ZnVjY0MvdW1UN3FGT1VzS0F4Vml1NThLWW84Vk02UmVoT0dCREpyYk9H?=
 =?utf-8?B?Q2NTellXWGFiMWJ2bGh5TGhwUzBrWHZvVUVxazRlRzBGdVJXNGZEVS9sWjhL?=
 =?utf-8?B?ZU1aaG55UG9WcFRxaGRXZ1pZVkhpUjVVQmRPMWhrdmd0STRadSs2eDJFbHVv?=
 =?utf-8?B?VkcrOXVDZ1FkMDBTMTBFdHhDVGsrV0NzakoydzhUVmR3eWN3UEpsSWIwMHlN?=
 =?utf-8?B?TlNNYU1BMDZibDdaZVlTbXQ0dWJLUXI3WVI2S2w1a0ZHRzFxSTcweTA0UUk4?=
 =?utf-8?B?U2lhVHJhVTBsMVlQQkxrREU4WTNEeTlKcmZ2VTNsZ1puM0FhTTdrbHVQM2Rr?=
 =?utf-8?B?RlRaeVpjN1Q2NXJoQlQzbDByb2hxdWJKSVMwdHpKSWNJbW5mbW43bWkvNGdp?=
 =?utf-8?B?TnIrTGFPa1FQaDBFUzIwemlFQ1BoS28xbDhPNW56bVlVUVJOMkNVNnRzb1Az?=
 =?utf-8?B?NzdJVjc4ZWR1MWNWU1FCV0tPdUczbzNsa1BsMkdjeDlPamFqcDl6SCt6Vm5p?=
 =?utf-8?B?Nkk2QitkMUw1RzZDN1NGL3V4L2dWVUNyejRNNmw5ZjA5QXZkK2x2VEhYWHNl?=
 =?utf-8?B?ZlF6SERkRlpLNjNlZzhzeStxYktob2JlSlA5Y1U5TEdOYUM2QUYvcDYxRlJD?=
 =?utf-8?B?eUtVRGhxUW44NGhYcEwxOHpMOGNYb0RYRUM0MDF4WTNoM2FPdkRxYmswYWFW?=
 =?utf-8?B?NlFEelJqUUhCNXRLWTF0eTNZYjA5RnpUQlZRMXpEVjZrMTdvMjd1RDFZN3dD?=
 =?utf-8?B?N3ltVTg0enNIeEhkWFJBUkY2QU9sSmNvUjNmVGV3bEw3S2dXQVIxekJTVXlM?=
 =?utf-8?B?RjZUMnNoS0dKTy83UDArbkMvRzIrUzlQV0VMYWFzVlBaM29wSzgxbUhySjNl?=
 =?utf-8?B?UjNxMGU3aUhTVlRiRktPRk40bDJSdE5TRVBxUWJvOE1jOUE0SWhtSUJEVXFT?=
 =?utf-8?B?UVhENDRYZjE3S1pvVk4yd2VCbUl4bHpweXBlaTZ4RnhqdWZEU0JrQmZ6a2hL?=
 =?utf-8?B?TUx6eDBiZk5qK05vci9laEt1cjU5U25KZm1lWEVRODBVWit3bUZGK2dpL3VY?=
 =?utf-8?B?YU9EMUFPejZBRmJKL0ovMnhzSGZnRTN2VncxTFg2eDJLRkpEeDRUa1ltSEpC?=
 =?utf-8?B?QmJVcnBGNDlzREJQR2paK2dCUGoyTDc3RWZnelpyckpZb2tzdFZIRWFIY2Vq?=
 =?utf-8?B?OUk5WG54K1I0cEhVb0VhNmpCUk1mU2JFRDB4OExNNE00US9zNi91OXJ1UW8x?=
 =?utf-8?B?MnplNE9UU2dvRWZyTzltY0ZSNjRSdmtCeU1yQ0R0NURXTVhzOE9JMUJ5Ky9z?=
 =?utf-8?B?Um9VTHBUcVZYRzlubC82b2d3akpVS2xjeU9iaS9JdmNwWFhSbklTT2Y0c0k2?=
 =?utf-8?B?WGZSa01HWXpNeXNJK0REQWE1M0M3dkI2SEhtcnlaWFlBU1puK09lTnh2MnhO?=
 =?utf-8?B?OWkyYmprLytLQkQxY0dNRzBVY2tXVHlwU2Y0dGovRk85NEdsRXMwWEtJaVpl?=
 =?utf-8?B?V1pDSkF5NGNQMDVqVkxjZzk1ckd0QVJjSFNURXBNZTVwak81TmZ1Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdf6329-8c4c-4558-31a4-08de4fb4a10f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 19:23:55.0094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HKJJPB039bYwZYbdwrM3rwkpTQZPIastKvzK0PFtovxAds7xnmwcELilGBqtVzc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6235
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

On 9 Jan 2026, at 14:08, Matthew Brost wrote:

> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>
>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>> On 9 Jan 2026, at 6:09, Mika Penttilä wrote:
>>>>
>>>>> Hi,
>>>>>
>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>
>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>
>>>>>> Split device-private and coherent folios into individual pages before
>>>>>> freeing so that any order folio can be formed upon the next use of the
>>>>>> pages.
>>>>>>
>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>> Cc: linux-mm@kvack.org
>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>> ---
>>>>>>  mm/memremap.c | 2 ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>> --- a/mm/memremap.c
>>>>>> +++ b/mm/memremap.c
>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>  			break;
>>>>>> +
>>>>>> +		folio_split_unref(folio);
>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>  		break;
>>>>>
>>>>> This breaks folio_free implementations like nouveau_dmem_folio_free
>>>>> which checks the folio order and act upon that.
>>>>> Maybe add an order parameter to folio_free or let the driver handle the split?
>>>
>>> 'let the driver handle the split?' - I had consisder this as an option.
>>>
>>>>
>>>> Passing an order parameter might be better to avoid exposing core MM internals
>>>> by asking drivers to undo compound pages.
>>>>
>>>
>>> It looks like Nouveau tracks free folios and free pages—something Xe’s
>>> device memory allocator (DRM Buddy) cannot do. I guess this answers my
>>> earlier question of how Nouveau avoids hitting the same bug as Xe / GPU
>>> SVM with respect to reusing folios. It appears Nouveau prefers not to
>>> split the folio, so I’m leaning toward moving this call into the
>>> driver’s folio_free function.
>>
>> No, that creates asymmetric page handling and is error prone.
>>
>
> I agree it is asymmetric and symmetric is likely better.
>
>> In addition, looking at nouveau’s implementation in
>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->free_folios,
>> which is never split, and passes it to zone_device_folio_init(). This
>> is wrong, since if the folio is large, it will go through prep_compound_page()
>> again. The bug has not manifested because there is only order-9 large folios.
>> Once mTHP support is added, how is nouveau going to allocate a order-4 folio
>> from a free order-9 folio? Maintain a per-order free folio list and
>> reimplement a buddy allocator? Nevertheless, nouveau’s implementation
>
> The way Nouveau handles memory allocations here looks wrong to me—it
> should probably use DRM Buddy and convert a block buddy to pages rather
> than tracking a free folio list and free page list. But this is not my
> driver.
>
>> is wrong by calling prep_compound_page() on a folio (already compound page).
>>
>
> I don’t disagree that this implementation is questionable.
>
> So what’s the suggestion here—add folio order to folio_free just to
> accommodate Nouveau’s rather odd memory allocation algorithm? That
> doesn’t seem right to me either.

Splitting the folio in free_zone_device_folio() and passing folio order
to folio_free() make sense to me, since after the split, the folio passed
to folio_free() contains no order information, but just the used-to-be
head page and the remaining 511 pages are free. How does Intel Xe driver
handle it without knowing folio order?

Do we really need the order info in ->folio_free() if the folio is split
in free_zone_device_folio()? free_zone_device_folio() should just call
->folio_free() 2^order times to free individual page.


Best Regards,
Yan, Zi
