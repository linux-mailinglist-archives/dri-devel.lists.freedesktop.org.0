Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034EFD10303
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 01:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099D810E0CF;
	Mon, 12 Jan 2026 00:44:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nIgN65aO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013064.outbound.protection.outlook.com
 [40.93.196.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC810E040;
 Mon, 12 Jan 2026 00:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0BlQEDyArWG+hHMgW0p9YeEuAWsasBw3xbx18XHgU3NL1lLwBMJdfXcJzjoXCFUrAc6otyDxjba8BMbJOF3KF4Lqz7CYIURpQJxH/RWli5SBWdmRf/OjwZ7bi6m6I3LTxWit/kO+FpFgEKcGEXizWuZ0nCwIIMOsIB2wM2mY9iOzKjyW60g6cwjk02385HR3hWB9TNpV4juNU6orF68pRx50+6MA0k+ZkaXJcGFYZibnGMbPswWkvQj+5D/5XabnREEPEX0V+GCtGUzWF0yoT/rww99CODGgBga92LmAmjhoL9VXuCeXJdrvNe5rnZh0TEdfkz/NBIcOMItT67dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0WB/0W+tWuBkRxqpvz5b781tyJOLPuQPXsjosuVBfI=;
 b=W40nbtykOyo4GY6y3ZRXuU/Wjlr5OgUVTdyKGrClMNwC+tbl3QZ+mu4kjs5+HX/bMhSEOk7MF2MKsxVxhmiM1kA4T5vd0g15jZ0RQjXui2M0I/n02ZPoFYDNrGupZkrfdAahZr2reWNGnfu6GZPPFQVRnCsMOjovFcH8C43vAKwpSYxZE3RreP7ALtRp2ZYo5M65XydkrwE+wk8rBWBH7arGhFzZmG0TuQBMnQ76I8LMzsW7Q41/EgQzw9JiECP/nzEemEmdPAfac3j93cUVhbKHmVnFGvtnkG2Smr5jw2YiOhO2fa3qijtmO9wPVrJAFcmqddzD5LwbzusnGwhSxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0WB/0W+tWuBkRxqpvz5b781tyJOLPuQPXsjosuVBfI=;
 b=nIgN65aOfaAZEle0Gbc/ghHh4omwv9/592DXCLID4OErdh5CmV5maKbL/mAX5aQKdzL3eFac47v4pVmhE5wmPm4nihUlJu76Zisyhmiu/cLR7rDK4erdPAJZ3hlOjHIvi2yLcDFsKEM6W9+aAwqgiKB1vgHp+q2Kjmgzu0aO9TpoelTCTrd8tV69prr/ZPM2Y5bbPtbPubb8zzZME3e/bdEHD+vOixLSpChnQ3lZUkQ3eXD3CZQzbAJiL/2nbeZrCONxvCM2/cDQ3fOvbJeyhW2OwHmqoYljWvQf3BENzK2iu0qPYINJhouiIzN/8q4164EHS2mEONh3z7nNr5OsTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 00:44:21 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 00:44:21 +0000
Message-ID: <706ba3a6-5be2-46d7-9e7d-d613f2e061cc@nvidia.com>
Date: Mon, 12 Jan 2026 11:44:15 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm/zone_device: Add
 free_zone_device_folio_prepare() helper
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>, 
 Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Andrew Morton
 <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-3-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260111205820.830410-3-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: 095a5221-14d9-4bb5-69dc-08de5173b974
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFdIVW8wNHJVYXpTNHd1K0xNZjhHeDZ0a3c1YnhlVzBqa0tZNXJJeC8zd0R6?=
 =?utf-8?B?QnAyWHZNNC9EMmtSWnVSak4wNEo1SGhZdEJ5QkxmNnhhWHdRYnB1TUpOUngr?=
 =?utf-8?B?T2lidVpkUFVCSkhuWkNhUFFPWjd0NmlwWkVxSWNic0Zmb0NacGYxNmJ5K0s0?=
 =?utf-8?B?Ri9vcXJDVk5SL2xiU0c1L1orait5Umd4eXZXdWlzbjNwZkpKeW1BV2thclVv?=
 =?utf-8?B?UjBPeVg5dFhaMDY0WGZCclRMSDMzMUFuSzZxcE1NU0N6ek05d2tzWFVma3o4?=
 =?utf-8?B?STdqVG54Q29TVmNXRDA1b1kzU0s5K0lBUWVPK09oOVVNSmZEZ1NmbXNyMml1?=
 =?utf-8?B?VDFWN2xpYmt5aHdJTDFxZWRHZ2V5U0hoSkxiWnNIZ2lTZ0ozSjRhTUJTbWU1?=
 =?utf-8?B?MXg3MERPMDJEbDBVU0pVSDdYR0FvRC8zNmpWQTR2ell2aXYrQURveG4xbDJl?=
 =?utf-8?B?cTYzT2E0UHl2RHUreDFvcnNsb3VZeE5lTmtOWllaU1orY1NpR0NVd05mRjZv?=
 =?utf-8?B?c25Xa2dWR1lCQjl5RHFoWnZPQmF2THZWOXhFQ1VOQlVEb0doTXhHUnFlcVJN?=
 =?utf-8?B?a0gxSm94VFQxN0s5WVhQUkZYTExwQ3ArZmp1TUN3aGF2clNha2pOcE91Uklw?=
 =?utf-8?B?QUlkd3BOWTBTNW5rL3pGRXFzMGxtYWp4ZzdzL2xSQ0xlZFdHR3NKNGtQaEsw?=
 =?utf-8?B?QnpRZGZmcS9ab21Ib1hHS1Z1YTRFVnQzL3BxZGcvamhheDJNd3RUN2dIUnFa?=
 =?utf-8?B?cFU3RTBYQVhEY01KUGhiWjZOS3kzU2RCMkxHN2Z4STEzYnArenhGTDBxUFFY?=
 =?utf-8?B?ZjUyK1E0UGZ4NzdWeHVqaHc3OTNzSnpLOFYySXh3aDYvSnVtWWIzS2E2UUNJ?=
 =?utf-8?B?b1FHd256M0VKU0NDUHV5WERITHJtanVxNWxBckJTQWVLQVBTKzdMYndDMG1t?=
 =?utf-8?B?c0N0YUFUdDdxUjNvMzltZEZJVkJHRU5KM3cxNi9IeldPV2V5OSsySmNWNXl5?=
 =?utf-8?B?N1cwc3VwRFNXMWtTR05vRDBXOVBjR2hldUlzVEZJRTNQcXVrQUgzcDc3WU4w?=
 =?utf-8?B?NU9tWGluYjZxZGRTaURHZyt3bkwySVVBdlhaZFN6cDVYNkJSTjZOTEVVQmpu?=
 =?utf-8?B?MUpINEVWVllzTW5FV1RpL3V0TDNPZFhOS0dSN1RHa25DbGI3ZGI0Rng2OHRE?=
 =?utf-8?B?eDJ4cUE5OEpPb3NsYnhFajByVHlzYXhZOFVpb0NuczZrQWhCbVNnRGh0N0pn?=
 =?utf-8?B?Um93TXRqUzRQODBpeUJ1OUtuem9NMnI0b3pPNUhTRWx5ZGlHa3RGeU1sU1M2?=
 =?utf-8?B?cUpac2RXMXB0QndpNkJGU01WQitta1p2d3VsSS93NVFEUTh5c0liLzdacmYv?=
 =?utf-8?B?L0gxdnZjK3UvdmRFNjZMdGREVStxUzJUY2U3S2FoQUhGNGJoZlUrSXJhQXJX?=
 =?utf-8?B?ZmZkeDNZOGZ1d3IxdUw4dDRBVXIvUGd2ZHk3c1JGdm9VTnBBbkZDZTZNK2dW?=
 =?utf-8?B?bFhLaGg0TXJOaGxPcjBSRUF5WFNUQ1JCMVB3ZTBEeTlKRm82bzBUT0FUc1g5?=
 =?utf-8?B?dVNrV1RTVlpLYW1uQ2d0Z2pkZGNzUHRDUk96bklBSjRGYys1aFBjRnJMNU9F?=
 =?utf-8?B?NEQ3QldzVXgwVkxVdE1HbVRXOUVDZ1RPZWJrT3hNbDdDRWR1K0paUjI2dmg0?=
 =?utf-8?B?WUVBajk1V2lIRkc4T0ZBMnJvZFZ0NzBHR2c3am50bVlBQ2JmZTBRY1J0Z2dW?=
 =?utf-8?B?blE3a3VVRVN2ajJWdkdGYkgvUmZOZ3dOOVNwNE5GYStCeTYxNWoxWWV3SVZt?=
 =?utf-8?B?a2ZnbmtrSlZScmgwNytuUm9acDF3Z0JqbmE0OEpuYXRBbFhJdzNhM2pSM082?=
 =?utf-8?B?czBEMjJtcmN4b0RyRXd6c01uczJoT2ozeGFJTmN3T0Ewc0U5Nnd2SkJPSkZ3?=
 =?utf-8?Q?4fHR5nYx1fgLDGOL5D3ywZpzVxJShPqv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bStkckYxOUVmTnVEMVRkMGxobjJ1ZFNxOGRlemk2SkcrMFE4MG9NSkRLY0lP?=
 =?utf-8?B?WjlPUTlsY05hcms2RVdidzNtRlZOVEpVL0RKQS94NnJDR3pJMzdwSmpibUpO?=
 =?utf-8?B?aWZqd1Z1SEhma3Bkdld4aWFSRDFrb0ZoNWRBVzRjcW05bFRuKzlnM0J4RWNN?=
 =?utf-8?B?WTU1cFhoUm83MTlJUTU1ejZITW9Vd0JyM3FsR05vSjhRT2Y4NlNZYTB1SXc3?=
 =?utf-8?B?dEQva2ZDM0ZjM2RXcDFPT0hmcGF6TTZGVzJudml2cHlveW5CUWl4bTNSR1VO?=
 =?utf-8?B?RXNjZjhVeGJPemk4REM5TkRkeUpuSmxLK2xtSkFCTGlqaW50dWxxS2c4dmRr?=
 =?utf-8?B?RjhNWk5qbkk2Szd1aW5xZGxFNnduQjhCalk0RDNvTkpsZGFKVFNibGw5ZThu?=
 =?utf-8?B?RFZ5VEpPOVVRT1dUSkRyMm5mT2wrTm9vaThvSEg3M3FHWS9XL0NqUGdVT2NU?=
 =?utf-8?B?NFJOYnYrVXBKK25lYkIvME1mSXpQVGtzblQ5UEdpTUF3RGxENGh5TmcvYmVN?=
 =?utf-8?B?V3F3MURWZmR0V09RZXZPQmpLMVFuakxTNkhROVJudFdOM0NlQVM3VTJFdURq?=
 =?utf-8?B?OXg1WFNSRlpUVUlrbG1HREllUmFFSXYyYmVWOVE5WjRHbU42c1dQM0xxQVRM?=
 =?utf-8?B?NElId2kyOFZ1TEk3RHBZR0FaRGNlaEhiZmNwOFBheW5PZ3dNbjhmMTBuN0FT?=
 =?utf-8?B?aTNBN1k5SDg4eUoyaUxwRHJ1K2d5UVVHUHNrR2dsMG1mT3paL0MwWThLYkFP?=
 =?utf-8?B?Mjh5NHUxcHZEUHBCUU5xU0xLaXE1WlA3N21DQ0s5RkhoeUxGSU0veGZaSGJ5?=
 =?utf-8?B?d0tJYTdBOVIrVzlBbmcwcTZqeTB6dExHSnN0b3RtMCt0NW9yNlpXT2pZMFZC?=
 =?utf-8?B?Yk8vWkRocGdFTWZoY0thMGkyVTR2VTNPSHJMeDBucStoZFpIMWN4bGlxRXhx?=
 =?utf-8?B?QmRSMFcvQmtpT25XY0c1V0pFaWgrbHNnd2lDd1JTZVM3LzB6SE83d2YxMW5h?=
 =?utf-8?B?Si90NXdndmJPZ092cHBXRWtiWUx2TnpUejF6OGdaWDlRMzRXSk84c3N3VE5K?=
 =?utf-8?B?K0I0VXFoRXdMeTM1em5MbDdielI2R21EMmM2ZjR3K1lMSXl4eGdubm9ZaGFC?=
 =?utf-8?B?cWFTcDArVjV5UjFFaGZhM3RTVUZpVCttVzFSM3ZFbHhpZ1ZaakgySDk4d0g4?=
 =?utf-8?B?YVpJTml3RzdMZ1pLNWFCUFI5OEduMUtlKzJHWDZZN0Y4Ry8rM1A3R2F3OUlo?=
 =?utf-8?B?Q2tERGxCU3NIT0piR2o1YUZ6dEQ2Q0syd2xDSHFzZ1JidWo4Q2kxNlhXQ3p6?=
 =?utf-8?B?WEg2NU1IU0ZsVm1NS1lDMGNvc01rdzAzbVQ2TnA4VzFMSkptZ1hOdnJkd1NK?=
 =?utf-8?B?ZW9peUYrQ2owcHVBbk5zRUJwbkNkRWNnUkozdXI3MHBtd2NpTHFaWStUSDVV?=
 =?utf-8?B?UmdNN1lCRzkzT2dwaXdMSzRhTENZSWZ2Ync4bndqTWg4bWxrUnFJRjNaZFVL?=
 =?utf-8?B?VjRpTzBRVVppN3pNT3NOemI4RXZmZkV6Kzg4QnQveHN1QWE4NDBHakxHV3dN?=
 =?utf-8?B?OWFXWW5WaUlnUXdwTUNUQW8rcUxZYjA1d3ZwbXBoS3VDazFKcmVwc0xaTlhq?=
 =?utf-8?B?M1JvNExnUGh2THNZZCtmaGx5MUFLRTFnZktzYWNucDhhQnZVRUxQV2Y0OTRM?=
 =?utf-8?B?Y1cxbmk5dCt3eDFOaXRyQVhlL05qc2ppdHUwVU9ZTCt3OTNwK3hCMDZUUDJK?=
 =?utf-8?B?Q0RtL0lnZjJiSXA1bER2YlY4Ny8xRmdvL2hLVzhoMnR0OUdoakRnLzM3ekpp?=
 =?utf-8?B?cVUwSjFBQU8zOEcrd1hjbTlwa21UMTNiRnJ5UzFCdWgrM0ZpR1VtNE9YNHRI?=
 =?utf-8?B?TURCbE4vdFpQU0ZuR21IbmNpTXp4R2FpTlJQV3NyQkd5MGZkWWhLUnJnM3FC?=
 =?utf-8?B?VjFWeGpnczhSK0xKUzZFSVFpOGg5bU43WS9pUlFRQWlWRUJDcFcrU2NjTDkx?=
 =?utf-8?B?WHBrTEY3MkYySG1hWjM0OWNsZ3hxM3VwYkxYTG5JZEMzWnhNZU50cC83bnpO?=
 =?utf-8?B?bHE1TitsZXFiRklIekJNZzBNMHFKMDlEMXhIMUxDcmRhUUlsYWhsdHRPK3RD?=
 =?utf-8?B?L2lyWnY0TG5mckhJSGQ2b1lKZGcvSFZSTDkrcGF2eWVwUlpLYkd6dHlpaEM5?=
 =?utf-8?B?M1YyWFlPWi9tMGNNSmNFOERHeGppZ3prSmpobDg5NUZ5NHlkWGpMWmZXUEZQ?=
 =?utf-8?B?UmQwUHFkZzUxd1Y5U0ZFU1R0M1Z4eFBDR2N4cE4rZCtDSWQ4YjNBR25MYmdK?=
 =?utf-8?B?Ui85cDlmekVsRzlNZHlxdllNWENFUXpJYnoyeVhiVE9lclJ6NzlJRnYrSnRD?=
 =?utf-8?Q?DYOgFj9uME44xiF3R1whXOqPga57kBZIjhfX1/2Wj3T77?=
X-MS-Exchange-AntiSpam-MessageData-1: egj9jOKQneAR7w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095a5221-14d9-4bb5-69dc-08de5173b974
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 00:44:20.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MD1V/u+bCdV3AsLCytvF99+CQ6zBi5fhJh3jrRewpSgaFCKAeoF1vJuUfFKHy4chgCp/3dtOBPiEcxWnfMO+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7726
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

On 1/12/26 06:55, Francois Dugast wrote:
> From: Matthew Brost <matthew.brost@intel.com>
> 
> Add free_zone_device_folio_prepare(), a helper that restores large
> ZONE_DEVICE folios to a sane, initial state before freeing them.
> 
> Compound ZONE_DEVICE folios overwrite per-page state (e.g. pgmap and
> compound metadata). Before returning such pages to the device pgmap
> allocator, each constituent page must be reset to a standalone
> ZONE_DEVICE folio with a valid pgmap and no compound state.
> 
> Use this helper prior to folio_free() for device-private and
> device-coherent folios to ensure consistent device page state for
> subsequent allocations.
> 
> Fixes: d245f9b4ab80 ("mm/zone_device: support large zone device private folios")
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: linux-mm@kvack.org
> Cc: linux-cxl@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Suggested-by: Alistair Popple <apopple@nvidia.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  include/linux/memremap.h |  1 +
>  mm/memremap.c            | 55 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 97fcffeb1c1e..88e1d4707296 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -230,6 +230,7 @@ static inline bool is_fsdax_page(const struct page *page)
>  
>  #ifdef CONFIG_ZONE_DEVICE
>  void zone_device_page_init(struct page *page, unsigned int order);
> +void free_zone_device_folio_prepare(struct folio *folio);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 39dc4bd190d0..375a61e18858 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -413,6 +413,60 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn)
>  }
>  EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  
> +/**
> + * free_zone_device_folio_prepare() - Prepare a ZONE_DEVICE folio for freeing.
> + * @folio: ZONE_DEVICE folio to prepare for release.
> + *
> + * ZONE_DEVICE pages/folios (e.g., device-private memory or fsdax-backed pages)
> + * can be compound. When freeing a compound ZONE_DEVICE folio, the tail pages
> + * must be restored to a sane ZONE_DEVICE state before they are released.
> + *
> + * This helper:
> + *   - Clears @folio->mapping and, for compound folios, clears each page's
> + *     compound-head state (ClearPageHead()/clear_compound_head()).
> + *   - Resets the compound order metadata (folio_reset_order()) and then
> + *     initializes each constituent page as a standalone ZONE_DEVICE folio:
> + *       * clears ->mapping
> + *       * restores ->pgmap (prep_compound_page() overwrites it)
> + *       * clears ->share (only relevant for fsdax; unused for device-private)
> + *
> + * If @folio is order-0, only the mapping is cleared and no further work is
> + * required.
> + */
> +void free_zone_device_folio_prepare(struct folio *folio)
> +{
> +	struct dev_pagemap *pgmap = page_pgmap(&folio->page);
> +	int order, i;
> +
> +	VM_WARN_ON_FOLIO(!folio_is_zone_device(folio), folio);
> +
> +	folio->mapping = NULL;
> +	order = folio_order(folio);
> +	if (!order)
> +		return;
> +
> +	folio_reset_order(folio);
> +
> +	for (i = 0; i < (1UL << order); i++) {
> +		struct page *page = folio_page(folio, i);
> +		struct folio *new_folio = (struct folio *)page;
> +
> +		ClearPageHead(page);
> +		clear_compound_head(page);
> +
> +		new_folio->mapping = NULL;
> +		/*
> +		 * Reset pgmap which was over-written by
> +		 * prep_compound_page().
> +		 */
> +		new_folio->pgmap = pgmap;
> +		new_folio->share = 0;	/* fsdax only, unused for device private */
> +		VM_WARN_ON_FOLIO(folio_ref_count(new_folio), new_folio);
> +		VM_WARN_ON_FOLIO(!folio_is_zone_device(new_folio), new_folio);

Does calling the free_folio() callback on new_folio solve the issue you are facing, or is
that PMD_ORDER more frees than we'd like?

> +	}
> +}
> +EXPORT_SYMBOL_GPL(free_zone_device_folio_prepare);
> +
>  void free_zone_device_folio(struct folio *folio)
>  {
>  	struct dev_pagemap *pgmap = folio->pgmap;
> @@ -454,6 +508,7 @@ void free_zone_device_folio(struct folio *folio)
>  	case MEMORY_DEVICE_COHERENT:
>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->folio_free))
>  			break;
> +		free_zone_device_folio_prepare(folio);
>  		pgmap->ops->folio_free(folio, order);
>  		percpu_ref_put_many(&folio->pgmap->ref, nr);
>  		break;

Balbir
