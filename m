Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA831D0C6E5
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 23:14:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2002210E0F6;
	Fri,  9 Jan 2026 22:14:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fylnejHW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652E010E0F6;
 Fri,  9 Jan 2026 22:14:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td6+8EIv0WZR2FXRhXFSL4hX4R0/XynWJ4+B52fX5bkE0ZnKq+uGSMcDLXT/3K0WzC354KFzf6A8nm0pqUMtGcQ/JphtTQnmn7/6gyeg18ShMPP/5n3exC72EuzLdSCUi3Pk6pG3j+vli/TEs41R8lz02fQXCepu9ZcGLkOAuOQ2FtV5HpOMEbMcrrlxq2PUcDwZZe2zkHA95w5OvvAtq0L+pLpFWUous1S2VnqTwCvL9JW26/mXDyjexlczeIJKF32mfsjB5FbDODEXkhWDkMAVfxrgoBc2Z5uA8bhiBxluMoH8FMTN2ItwkwGpHU+hOtNa66v7qUTF0uqd9EqdjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuJ5qsSrrL4aRAgpEGe2Tg9T+nddvb05QYdMcR6tcGc=;
 b=DFg1c3c3zhYZVBPrmH9mJ2Zd7Y0jQC7zF4Rn4lQAlwBklkVuCK/tEjesr/I6ua3zbKYxIQ04rms0nBfvTtvYdnK8UDJqsEKV84LwAWqS3hMUmOHrifZ11iKflYl978VmVwK7f4I5WICN8gnybRPdfmb4JR7fGWf1WBTUp0SA+Vi1MUGTSQeY00472G8Xy4VYL61wWKDwuUrGfRyk4gCpRpZ+/6WxCodHTrKqwooNgHN2WZnt+aHgvn1ISWqE7dWK3dgmvOa7rJ5FdWbJbaWXtpM5FAwpo100l7Z1wZMhRir/TFvkynaN7l2HTkxianmHUDALoAdGI/AMWCb0I5HMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuJ5qsSrrL4aRAgpEGe2Tg9T+nddvb05QYdMcR6tcGc=;
 b=fylnejHWpIGUlUGz9zAmpiPrHYu0wJsuPAhDcLHTghmoiZv/wiwo3xTR8J8zkT7NnmSivzq2QSMIX+kz1d4pqVcZBzEphU1qvZkf207wkyHRbjUQoBYewMUHegqgShQShllESqOEXSNJ0/8Cx2HcLjBwWzPcHsGflW1KLLxXRRtg1MwMopqauCKaTLFx3wPjl3cD7eHy7uoDTd3D28bQ5mJFqrnHqG3YiHWJeQv11/wQks37Hzd89Xb5RXXn+fwxnS72kbcvi2KDYCeiMhfOF9S98F1pIU4QzTEehE7N9ZX/KB60I/LeUaCaQW77EJeCC/k9PW1umWE8quekCl2CSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL4PR12MB9533.namprd12.prod.outlook.com (2603:10b6:208:58f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 22:14:26 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 22:14:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] mm: Split device-private and coherent folios
 before freeing
Date: Fri, 09 Jan 2026 17:14:20 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <DB92CD30-1C6A-4533-83C8-BE7091F706A9@nvidia.com>
In-Reply-To: <5c9f17ce-7174-4e74-92d7-8249f309f756@nvidia.com>
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
 <5c9f17ce-7174-4e74-92d7-8249f309f756@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0043.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL4PR12MB9533:EE_
X-MS-Office365-Filtering-Correlation-Id: 2919238f-489f-4dce-f93f-08de4fcc7345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2w5RnpKckhzK0NRMUZLSThhUHAycVd4OGxSL0g1aXlwVS9pQ0cxRHZPOWlU?=
 =?utf-8?B?ZGhRb1RkcTdKTld4UlZGTWx4dXZFQ2hpVEtnbWxUa2FIbGdxR1d0eXpleDlv?=
 =?utf-8?B?ZHF6WGU1b2lDd3cydVA1NitGNHlzK2haSGRCNWFNcGRqWUk5emxQTkthUUlI?=
 =?utf-8?B?cUg0ZUd0VGIvNy84N251NjFEaTAvRWVZa0l2cWNDVkhoQkxTVzhYL1FDQkN5?=
 =?utf-8?B?bzVNakRjRU5FUHF4M3NpenlhZzMyNGZhVC9RUnlYQmVQYTNFMDVGUVpNUGNS?=
 =?utf-8?B?My94TDNJd0NmWWxtWUhQNXU1UkxGZGJib25DbDZGR0pzYUJOTmx3Y09hNEd1?=
 =?utf-8?B?UCs4NllRMm82S2p2MEtJVXFlK3hTMzJXMXVYdnNvMGhFcnYycWlzVnhXZG9h?=
 =?utf-8?B?NlNNSFpuTUJPc29mbU1wdG5zalRaMHlsMkZEeFNodjNzUzhqVzZrTHBUT3Jr?=
 =?utf-8?B?dVo4eWhsbkg0Zk9KbTJaUW81T1l6RFJNTUd5ZFZuSmpMb2ZVc2ZacmFqL1l1?=
 =?utf-8?B?bXBzMHhsc2NkMjVaZ2h2UFRCOHdpNnRQMFBndS80cXYvRDV0R1ZxZHRCUnRo?=
 =?utf-8?B?QnNHS0l6YXJTWnh6bGtTV3dwUWtkdVZlTEsyZVFKQWFsZEovWWtPU25hT3lQ?=
 =?utf-8?B?NGdOL01jOTBWaFNOT05Fa3RaRVZSaTl0TnBFZi85amcvQmFTYlRnOHhaK1Fk?=
 =?utf-8?B?TGdvY0hrZTh6Tmh2YlNtdG5WNGxkWE9tRG5YMno4OEJJcFBOL1I0eDQxZS9O?=
 =?utf-8?B?ZzczVDRmLzcyS2lScW85Y2lxZnJGTVArTlQ1a01BdklEVVYrbjFhK3IwcVQw?=
 =?utf-8?B?am5mRW9GV2FSYWJEM0VvaWVHclFZY1NDNEQrbTdnanExT2dlZTNqaEhPOGNu?=
 =?utf-8?B?bzltb054L1QyMWJZM2N1eWRSUDU5b09IQ0Zob0VFZkxYamN4Z21KZDc2ekhX?=
 =?utf-8?B?MDloY0I0MUdZYTRPWnNseTBieVR0STBnY0VaanVORGZzL3N5dWtyUlZ6SU1K?=
 =?utf-8?B?SVFUWnZiNUJDM0FId3g0MHNmU3FjVjEzc3ZHeXNHWnFQa21SN0NDek1aZm9I?=
 =?utf-8?B?ZHB6N3Y0Uzl0cGo2MmJOZEdBVmdvVDluenFnVjBOc0dzUmdmUjRoL2M2cVJj?=
 =?utf-8?B?Zmw0S0NpN0Z1OTQ2QU5tNVFnbmtRVHh3RFJyZmhZNDFQWmxLNjR1RVJPTFlM?=
 =?utf-8?B?VTlXSTB2VGhldnNkNk43dkRoY2xHL2I0WDZMQ2hYOTRRWWoxK25uWndibmND?=
 =?utf-8?B?NFNpbHBNcXRrZjBUK3NjOTNDcUoyREswemc5VVgxVEpBRzZ2bTVYcURpOXBI?=
 =?utf-8?B?WG5IclVlQ0dxTWhPaUhycGhoaGViWS9WQ2dMTGF2MWhIYlZUVTlUSmhWN3VE?=
 =?utf-8?B?RW1BZ1plM2tNM2dhbC9waGhPOUtjREpxUVczZkgyakUwbXM4djlSanZELzA5?=
 =?utf-8?B?dTlkZHF5Z2RabFdScHU5V3l6UVVvYXlyeDhOY255dUNBMTZBNk0rTGlTRGt1?=
 =?utf-8?B?SDYyYlQ5VnAwaUVQeVQyL1ZBeG1GN1B1ZHRtbHUzUUNybEI0RjNvYXpRVUU2?=
 =?utf-8?B?dFNoKzRid29qQTVydmFSeXFBMDBrWlhxbWZQcGhCbFpLMTcyZDBFL3Nhamps?=
 =?utf-8?B?Sk5tQUVjNHRqdlU3ZGl4NXBWODNYTzBsVHgvTDRmS2krN3F1QXoyb0hCdTdm?=
 =?utf-8?B?a0dCNUFqMXpqaENobnN5L05vdlRJYTNMRTlKQ3RwNTR1TzBQYmxWR1M3N09k?=
 =?utf-8?B?MEFWQ2REZ1MvTXp3dUZHaG0ydXRFbU5uMjhxYVRySGh1RmVJQU5Nb05ta1g2?=
 =?utf-8?B?UjMvdGRYb09wMkJWU0N1NjN1NGRwODU0Uzl4Y1k5Zkg4SHB0K1RGWE1RS0t5?=
 =?utf-8?B?WmRsTjh1cnREeHlVTVhxYVdYVTFyVDVvWjhYYWlaMzhKSmdDNk5WZGlYSTRs?=
 =?utf-8?B?U2hpNzR0cWVSQm1rSHBmeFNhSmpQNmxkdDMxTCs4ZkJDT2NyMmxaRWxmaHI3?=
 =?utf-8?B?eStYSDhlK013PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHlFaSsyM0J5ekhZZDdRUHNJWUlLR3hlbXVYVys0WTlNWkJYbXA0cmdldUIw?=
 =?utf-8?B?RUxEcnlXU2VmTnZZdEZEM2p3RUFKcEFQTkV1NFpEOGZkL2Mxbys4L0JqVFo3?=
 =?utf-8?B?Z2QxV0tvcGdXWWtrVnkzb0R6azQvb0N1dzdiSGJFY2FXdHZYWU5lNEFBUXJi?=
 =?utf-8?B?aEtiVVpqQVFqRjhoV0tKaXlhclB4YTczTWFoZnNMWW9Ib2RBcjdPMFI3bDhz?=
 =?utf-8?B?NDZVdTFNcFFPalNYRXd3ZFRqdGN1YjVabW41dHE4RHFCK3UvNGpjZG5tS1Fz?=
 =?utf-8?B?U2xTS1RIYTBPZUZSL1VNK3hsZkRBQldwMGhCV3FSTnVhU2N3dURDZXMyVVVj?=
 =?utf-8?B?VFF5anVCcG51TkRma0lNMnlWVG9VdnNqMmlkYzJFY2puN05Wd3Bldkxpa1k3?=
 =?utf-8?B?VFVyL0RDK0d3NXd0Z05RdmV4L0xyWHIwTDdWNjZBK2Y5L2t4MDZQQ296NXpD?=
 =?utf-8?B?U2lZS1lNWFJIcXdoejhxR0tpU0VtTlQrZ0U4VnpYVE9Eakc3RUk3U2Z6UmI0?=
 =?utf-8?B?Vk54a0xTZGIvUzAzeHZDdURxOGxUTE1OZkkrOVM5WE82OWlhY2ltcFFsNUFI?=
 =?utf-8?B?UFlUblRhYmgrMUNTblh0M2ZaVXY2SmFJYk9uQm42eTd0RWNyUEcyRHF4Z0R2?=
 =?utf-8?B?dDJiSWNzc0Qza1pjL3I1cWEwSHBFSHJaenB2U3c3d0xrQTE3TTZoRTJzeEVO?=
 =?utf-8?B?Q00wbk9ZWGtGM21TbVg4cFFncHV0L0hJMEhOUVFQeld4Q2QyZ0NiMFlRbUtK?=
 =?utf-8?B?Ym92U3VrU05BRXJuWlUwei94K1haNW1vVklKTlBQUHJVUXdEcDdRTlFnU01H?=
 =?utf-8?B?WWpGZlFEbEtIK0RUMVIyZFdaVk8xbUFINm9GemR5d0lPakFJY3ZMdCtaZ1d5?=
 =?utf-8?B?ZkZxU2pIMmFvQk8xOEJLbEFSQzNnWXU0TWtGN21pS1MzRGFFWlR3QkZTaGc0?=
 =?utf-8?B?Y05NUWNoaTlmWlB1RDBDTWM3bHAyY0RxcDAyRUZnYWR5VVpXdEs2K1JNRGRs?=
 =?utf-8?B?bVFnbFEyQ2dnYS85N2ZMMlBWaHlOSldKRDAyUFF1YWw5aTA2KzVIYThaSllG?=
 =?utf-8?B?WVZ0NVlnYXNuZGdyM3c4b0pjK25TY3E0VTNlZHRseDhESzhLNVpKU0dYcEFM?=
 =?utf-8?B?dEFZejR5SmFmVWFEOU0wamo1YmZRZmVOaUdHM0dReUVMM1p6dlpjOXlnb3g4?=
 =?utf-8?B?K0pHNXZlenR6bnkwTm9ycG0zc0kzdnBtMS8xeVI1V0lydjEzUlRDd0dtOWlK?=
 =?utf-8?B?OGpkQUIwR2hpRHhOUGJWM0E0U1VMWFlpb0gwWjF3Y1RXRGhIWUtEazlJaVVx?=
 =?utf-8?B?TFRHTFdwQ0gvRkV5UGpTcGMyU2lBcGxGQXRKbkNvdXo5WVdRTVVrQkxpSFln?=
 =?utf-8?B?TDBXejZvOEhaTWJUZkFaZHBaOUxORkNNcUlGVzhQYzJmdEhrZkRnb1RSNWNu?=
 =?utf-8?B?VDZ4TWdObEovNEwzSmIzUkMwTENGRjAra2JXcUNML2ovMktBL0kwbXJlVTZ3?=
 =?utf-8?B?VUZHWjZNTHNXV2xPR2lDZlVsbmd0VU9Cc0xvMGpreDd1NGczNXdjTkJQNnBH?=
 =?utf-8?B?WHZaSDRXWHFEM1cvZU5iTTZ6eWdlMHI2Vy9tZXc3Q0dyejNCRTM5WnRXWlRs?=
 =?utf-8?B?amkyb2NXZVpCK1hUY08yYVRRdHBDUWo2MGZvN3JieGswL2ZFeDJXQ0tOZVVu?=
 =?utf-8?B?bG9OQnNES0hvKzMzM1ovT05PRDBObFFua001c2RIY0F2UDV5QkMrSEpJS1RU?=
 =?utf-8?B?QWtyQk4xOHdScmZoOVI5YkwySEZCa3hKOWVMaDdYOWVpRjNSdEFsUnNSVTJS?=
 =?utf-8?B?YWhvNlY1R1lxUXd5RXU4d00rcm8xckpFK09FVE05UGRabEJNUFV1M21pdFlt?=
 =?utf-8?B?bk1LLzNScGxtMlVrZ2V0R3RUQjFCalNuQ2FidThDRmU2ZEVjUWRacE1jQWth?=
 =?utf-8?B?ZmVVK2hldGprN3Jib3YrWGx2U1hiMnlEOUpaV0VJWFJORHhtSEtFMjVYTjBv?=
 =?utf-8?B?Mi9iWC96RmpSdllYVytpYUNJZkFCczJ1R1hRbU1weEY5dzBCUmFXQ3E5TnJv?=
 =?utf-8?B?dXIyZm5ESFFxUkU1N21LbTFKTHpHWC9Xcjh5RFNDM3BFaE8zTi9QZURZaGV2?=
 =?utf-8?B?Z0p5T01GT2ZGTnpRcjZ3UG1tYW5sRHZWWFBFK3hHcjIwb0ZGU25ZQUY2OTVx?=
 =?utf-8?B?Mkdwb3dGZnE4RWZIc1c2bGxVbGRtazFEUjhNQWtzaXpneVNzT1BVcytBVFVZ?=
 =?utf-8?B?WUtPdXkzSEk0ME1XL3lvSEpKWXZkbExES2NMaCtSVTk3YW5vOEFrNWwrTWRJ?=
 =?utf-8?B?U1o4QmpkbXArei9oT2pWK2xQdkhwTTRKTEVNWHFEZDdSblJCcXZ5Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2919238f-489f-4dce-f93f-08de4fcc7345
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 22:14:26.0742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3kTS/PjpiFQIC/7NfUtPeQ6t+x1dv+b9AMiHcuIeBuahyctj84jtBYEHpvrSJi55
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9533
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

On 9 Jan 2026, at 17:11, Balbir Singh wrote:

> On 1/10/26 07:43, Zi Yan wrote:
>> On 9 Jan 2026, at 16:34, Balbir Singh wrote:
>>
>>> On 1/10/26 06:15, Zi Yan wrote:
>>>> On 9 Jan 2026, at 15:03, Matthew Brost wrote:
>>>>
>>>>> On Fri, Jan 09, 2026 at 02:23:49PM -0500, Zi Yan wrote:
>>>>>> On 9 Jan 2026, at 14:08, Matthew Brost wrote:
>>>>>>
>>>>>>> On Fri, Jan 09, 2026 at 01:53:33PM -0500, Zi Yan wrote:
>>>>>>>> On 9 Jan 2026, at 13:26, Matthew Brost wrote:
>>>>>>>>
>>>>>>>>> On Fri, Jan 09, 2026 at 12:28:22PM -0500, Zi Yan wrote:
>>>>>>>>>> On 9 Jan 2026, at 6:09, Mika Penttil=C3=A4 wrote:
>>>>>>>>>>
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> On 1/9/26 10:54, Francois Dugast wrote:
>>>>>>>>>>>
>>>>>>>>>>>> From: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>>
>>>>>>>>>>>> Split device-private and coherent folios into individual pages=
 before
>>>>>>>>>>>> freeing so that any order folio can be formed upon the next us=
e of the
>>>>>>>>>>>> pages.
>>>>>>>>>>>>
>>>>>>>>>>>> Cc: Balbir Singh <balbirs@nvidia.com>
>>>>>>>>>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>>>>>>>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>>>>>>>>>> Cc: David Hildenbrand <david@kernel.org>
>>>>>>>>>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>>>>>>>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>>>>>>>>>> Cc: linux-mm@kvack.org
>>>>>>>>>>>> Cc: linux-cxl@vger.kernel.org
>>>>>>>>>>>> Cc: linux-kernel@vger.kernel.org
>>>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>>>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>>>>>>>>>>> ---
>>>>>>>>>>>>  mm/memremap.c | 2 ++
>>>>>>>>>>>>  1 file changed, 2 insertions(+)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>>>>>>>>>> index 63c6ab4fdf08..7289cdd6862f 100644
>>>>>>>>>>>> --- a/mm/memremap.c
>>>>>>>>>>>> +++ b/mm/memremap.c
>>>>>>>>>>>> @@ -453,6 +453,8 @@ void free_zone_device_folio(struct folio *=
folio)
>>>>>>>>>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>>>>>>>>>>>>  			break;
>>>>>>>>>>>> +
>>>>>>>>>>>> +		folio_split_unref(folio);
>>>>>>>>>>>>  		pgmap->ops->folio_free(folio);
>>>>>>>>>>>>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>>>>>>>>>  		break;
>>>>>>>>>>>
>>>>>>>>>>> This breaks folio_free implementations like nouveau_dmem_folio_=
free
>>>>>>>>>>> which checks the folio order and act upon that.
>>>>>>>>>>> Maybe add an order parameter to folio_free or let the driver ha=
ndle the split?
>>>>>>>>>
>>>>>>>>> 'let the driver handle the split?' - I had consisder this as an o=
ption.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Passing an order parameter might be better to avoid exposing cor=
e MM internals
>>>>>>>>>> by asking drivers to undo compound pages.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> It looks like Nouveau tracks free folios and free pages=E2=80=94s=
omething Xe=E2=80=99s
>>>>>>>>> device memory allocator (DRM Buddy) cannot do. I guess this answe=
rs my
>>>>>>>>> earlier question of how Nouveau avoids hitting the same bug as Xe=
 / GPU
>>>>>>>>> SVM with respect to reusing folios. It appears Nouveau prefers no=
t to
>>>>>>>>> split the folio, so I=E2=80=99m leaning toward moving this call i=
nto the
>>>>>>>>> driver=E2=80=99s folio_free function.
>>>>>>>>
>>>>>>>> No, that creates asymmetric page handling and is error prone.
>>>>>>>>
>>>>>>>
>>>>>>> I agree it is asymmetric and symmetric is likely better.
>>>>>>>
>>>>>>>> In addition, looking at nouveau=E2=80=99s implementation in
>>>>>>>> nouveau_dmem_page_alloc_locked(), it gets a folio from drm->dmem->=
free_folios,
>>>>>>>> which is never split, and passes it to zone_device_folio_init(). T=
his
>>>>>>>> is wrong, since if the folio is large, it will go through prep_com=
pound_page()
>>>>>>>> again. The bug has not manifested because there is only order-9 la=
rge folios.
>>>>>>>> Once mTHP support is added, how is nouveau going to allocate a ord=
er-4 folio
>>>>>>>> from a free order-9 folio? Maintain a per-order free folio list an=
d
>>>>>>>> reimplement a buddy allocator? Nevertheless, nouveau=E2=80=99s imp=
lementation
>>>>>>>
>>>>>>> The way Nouveau handles memory allocations here looks wrong to me=
=E2=80=94it
>>>>>>> should probably use DRM Buddy and convert a block buddy to pages ra=
ther
>>>>>>> than tracking a free folio list and free page list. But this is not=
 my
>>>>>>> driver.
>>>>>>>
>>>>>>>> is wrong by calling prep_compound_page() on a folio (already compo=
und page).
>>>>>>>>
>>>>>>>
>>>>>>> I don=E2=80=99t disagree that this implementation is questionable.
>>>>>>>
>>>>>>> So what=E2=80=99s the suggestion here=E2=80=94add folio order to fo=
lio_free just to
>>>>>>> accommodate Nouveau=E2=80=99s rather odd memory allocation algorith=
m? That
>>>>>>> doesn=E2=80=99t seem right to me either.
>>>>>>
>>>>>> Splitting the folio in free_zone_device_folio() and passing folio or=
der
>>>>>> to folio_free() make sense to me, since after the split, the folio p=
assed
>>>>>
>>>>> If this is concensous / direction - I can do this but a tree wide
>>>>> change.
>>>>>
>>>>> I do have another question for everyone here - do we think this split=
ing
>>>>> implementation should be considered a Fixes so this can go into 6.19?
>>>>
>>>> IMHO, this should be a fix, since it is wrong to call prep_compound_pa=
ge()
>>>> on a large folio. IIUC this seems to only affect nouveau now, I will l=
et
>>>> them to decide.
>>>>
>>>
>>> Agreed, free_zone_device_folio() needs to split the folio on put.
>>>
>>>
>>>>>
>>>>>> to folio_free() contains no order information, but just the used-to-=
be
>>>>>> head page and the remaining 511 pages are free. How does Intel Xe dr=
iver
>>>>>> handle it without knowing folio order?
>>>>>>
>>>>>
>>>>> It=E2=80=99s a bit convoluted, but folio/page->zone_device_data point=
s to a
>>>>> reference-counted object in GPU SVM. When the object=E2=80=99s refere=
nce count
>>>>> drops to zero, we callback into the driver layer to release the memor=
y.
>>>>> In Xe, this is a TTM BO that resolves to a DRM Buddy allocation, whic=
h
>>>>> is then released. If it=E2=80=99s not clear, our original allocation =
size
>>>>> determines the granularity at which we free the backing store.
>>>>>
>>>>>> Do we really need the order info in ->folio_free() if the folio is s=
plit
>>>>>> in free_zone_device_folio()? free_zone_device_folio() should just ca=
ll
>>>>>> ->folio_free() 2^order times to free individual page.
>>>>>>
>>>>>
>>>>> No. If it=E2=80=99s a higher-order folio=E2=80=94let=E2=80=99s say a =
2MB folio=E2=80=94we have one
>>>>> reference to our GPU SVM object, so we can free the backing in a sing=
le
>>>>> ->folio_free call.
>>>>>
>>>>> Now, if that folio gets split at some point into 4KB pages, then we=
=E2=80=99d
>>>>> have 512 references to this object set up in the ->folio_split calls.
>>>>> We=E2=80=99d then expect 512 ->folio_free() calls. Same case here: if=
, for
>>>>> whatever reason, we can=E2=80=99t create a 2MB device page during a 2=
MB
>>>>> migration and need to create 512 4KB pages so we'd have 512 reference=
s
>>>>> to our GPU SVM object.
>>>>
>>>
>>> I still don't follow why the folio_order does not capture the order of =
the folio.
>>> If the folio is split, we should now have 512 split folios for THP
>>
>> folio_order() should return 0 after the folio is split.
>>
>> In terms of the number of after-split folios, it is 512 for current code=
 base
>> since THP is only 2MB in zone devices, but not future proof if mTHP supp=
ort
>> is added. It also causes confusion in core MM, where folio can have
>> all kinds of orders.
>>
>>
>
> I see that folio_split_unref() to see that there is no driver
> callback during the split. Patch 3 controls the order of
>
> +		folio_split_unref(folio);
>  		pgmap->ops->folio_free(folio);
>
> @Matthew, is there a reason to do the split prior to free? pgmap->ops->fo=
lio_free(folio)
> shouldn't impact the folio itself, the backing memory can be freed and th=
en the
> folio split?

Quote Matthew from [1]:

... this step must be done before calling folio_free and include a barrier,
as the page can be immediately reallocated.

[1] https://lore.kernel.org/all/aV8TuK5255NXd2PS@lstrano-desk.jf.intel.com/

Best Regards,
Yan, Zi
