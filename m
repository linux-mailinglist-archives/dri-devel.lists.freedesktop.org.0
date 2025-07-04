Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE2AF97D5
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 18:17:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BBC10E2BA;
	Fri,  4 Jul 2025 16:17:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HGFZiH2D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2081.outbound.protection.outlook.com [40.107.94.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13B510E2BA;
 Fri,  4 Jul 2025 16:17:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yektX8HCqshk5HT4E19s0i4siwBUvIzLCuCoFXs9zLuiZ0+NboBQn9pDqV2HLomtNBNIVtwJXCCcAlDvsCCXWhpmkjHYa2bnL+22tqU803jtW/65si0PBy763BhvUGSVmExLm5uKo2gjaHCSLYc69eqxP6yOdLT1xJOC39PJmhBi5Y9PwmiuLHPvT8IYsPWyYpSBGABKJJzuvtEGvxhbmSiHyWT3YU+kn84/7sHGUsMATylTF8HHuh3nTfU2fPRDcErmlz5PmUq4QIwBlip/vuyzElMEBwFpi7UW4yVT6K6TGK5Q+X+NRPsKOUPvlXX0sUQeoXRAVFxjMhJY9bDZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j3nkI07L8pdGO55t8piqaqgcKhaHnHh1Gk3OOqlLap4=;
 b=j8JWa9xhxP1jcM+O0W5Jno9YKkvHJ1VvEhb2fNLsuOZkQT+CecPZ0gSZCW0YrESMJNj3/qFRmnbb1Q6H+UJiMBsP691uTFt6R2xdVYvhlOm5zPQq9C7n1hO5HM444LB2+l5Fv2BGdTH7kMeFqJ87SfadfdMAZUwZVVLjX+L+nfSCupRnnmyOa3Jgr3AvPx+o6U+D4al3ZyS7fRRYawK8QHeHeMlelyFuKjc1gpaLT69xwL5ZrvLE9NX74mOUT0/m3ZptYYqmCKt6kBjjMVbSX/fFiyNZ6TXUxzyz2dtdFD6Sk5ufN6N5/ggQUtEz6+5fD4YTMjUPiAICVEHrvqID4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3nkI07L8pdGO55t8piqaqgcKhaHnHh1Gk3OOqlLap4=;
 b=HGFZiH2DmaCzvQbEwbxThI4z3I1ugGuxJ8oYQDYgGwEsIhYfepqLeQT/d2orwKYYS7u9vdcDmkV34rp6fsdDzOlQZRX0n0A736Ezde58gIoqhKdKxDxViNE75QZaCFyRGlDzG0lGJRmHo4TDjPNRiFDxv+kGxmQ17khYM4H9P5DVL6XbbRL3FVkfc3CcomdjKgXlMi011b7U1AdLrBVsYQTxGCMdxxNIbwA5uGzmd6L/S93v3kgjWyD3q5oD3xTTrlGy5UojmukAwECofPLkZRdk5YjchbtwNmzZF5QA8C/ehOELY70hINXu5ovqeolg6LGoBl7xDKoP2R+ZlEC/WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB9528.namprd12.prod.outlook.com (2603:10b6:8:252::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Fri, 4 Jul 2025 16:17:11 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 16:17:11 +0000
From: Zi Yan <ziy@nvidia.com>
To: Francois Dugast <francois.dugast@intel.com>
Cc: Balbir Singh <balbirs@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?utf-8?b?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
Subject: Re: [RFC 00/11] THP support for zone device pages
Date: Fri, 04 Jul 2025 12:17:06 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <D84BBE29-5600-48A3-9900-1787C5B3C8BF@nvidia.com>
In-Reply-To: <aGfcrmyj5soCZCDx@fdugast-desk>
References: <20250306044239.3874247-1-balbirs@nvidia.com>
 <Z8oq10LQBGnqpjQl@lstrano-desk.jf.intel.com>
 <6a8d6234-9d45-40b0-9038-e09f1084b229@nvidia.com>
 <aGfcrmyj5soCZCDx@fdugast-desk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0P221CA0012.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB9528:EE_
X-MS-Office365-Filtering-Correlation-Id: a585039b-27b1-4415-533f-08ddbb163add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGpYa1RZaHUzb2hDMnF2VHM1a1ZvVTdoMFVOckZ0d1YrK3FvUXAwLzBwdXdu?=
 =?utf-8?B?NHo0bXV0M1grenZNaDhsY25EeGphNGExRnNrTzNXNm9UMjhVRk1IL0g5aGky?=
 =?utf-8?B?SlR4bUJzV0EvZlRuVFhhaXVJYm9aU2hzVE1BcCtUNUphWEVRcGJrVXBlZFhp?=
 =?utf-8?B?Y2o2ZS9wTkhnelBKNVc4UnVCVkJ2WkE3UERQOFhSM0RreEpmaUVDR282dDd5?=
 =?utf-8?B?akhFRlA1ZHNkRVEwVGYxazZLNXhzUW5DL0E2bW5wcUN0UEdkUEV4cUtmcXpo?=
 =?utf-8?B?S3daRUJ1NzErWUQ3eEkrbXJoUmtrMWd1aFM1S21yaEw1OW8xaDlaZ2NtS1ow?=
 =?utf-8?B?Qm4zU1N0WFJtb24wZzJwTElwOG1sL0ZzVmhua1FYNVRJeHN3dzJQOE5UcGdm?=
 =?utf-8?B?S0EzelAwRnV2bEl0Um4wRUhjV0hWY2xBanpWZ09sTlA5V1lGeWcxcTc5RXk0?=
 =?utf-8?B?T1EydlpqUjFTZ2p1andBeHZhcnpkb3FiR25OUnZORUFHc3dKdHBVZ1hScG41?=
 =?utf-8?B?QUpqN3B1dGRWMng1SE0wazdtZ0MwWFY3MnVEK2F2dXV3QTByeGlmcmN0S0g2?=
 =?utf-8?B?VUdiZSswRWtBYm9ydFNHZW5NODNQUm41djdSeWhSNEJ1RmZwMjNZZ2oxZUVI?=
 =?utf-8?B?YXc2WnI1L295RGhDNnduQngrM09RQm9IUlpVMFVjcC9IL3BBelFzZG8yNllU?=
 =?utf-8?B?SjUvaENJTzZoYnVNTzVwMm8vR2NGeHhQUTdQRExaclRJakNYbUZoL1JDZjdq?=
 =?utf-8?B?eHhndFJEcVFXcG5rcjR4cE1hWE5hQnFRMmJscDAwR2R2NTFrc3JHc1RtVmVx?=
 =?utf-8?B?dkVWU25PVnJpdWlVOS9JMjNkdzZxNkdaWk1mQndiS3FxTXppN3M4bEtWQkk5?=
 =?utf-8?B?dmZBb0JQVXJnd2l4QjhhZkUyOThjRVR2MndROHVjRHduT1l6dGIwSDdSM2Rv?=
 =?utf-8?B?WHFwQWZLclFndjhuZUpUSkphSjZNVnUrV2JDMVlCQ0VONmhrd25SaFB5RzVV?=
 =?utf-8?B?c2JOYTBmMlBZTTNFalFXTGJuWDdJSnlRWnJib1VpYytabCtnNTNBd2pLS2cv?=
 =?utf-8?B?UmxMWlBsazJXRnVuOFIzcE5UNDIxQ2VIMlZpVElCWi9RTUI2LzJ3ZXdsN1Uw?=
 =?utf-8?B?MlZOSFp1d1N2MXFieE9BSEJkOHFwZ0ZnWFpjVU9lL2x2c1o2Z2ZOVFZBTzNz?=
 =?utf-8?B?L1g4QnllSVgyL00rU3dSVUJ3S0NldldmNHVLVGM4eGFCWVJtV3ZrNy9ia2V2?=
 =?utf-8?B?M0ZBaWdqdmtuYWY1SHVydWx5cFhvR1NGS1JBV1V4QW13a1puNm5CWVYzTTJN?=
 =?utf-8?B?NWluM0NRUmNVNXppOXlLWlA0THg4UDJxbWxXUS8rWFlZNUE3RVhUSWlyUkZr?=
 =?utf-8?B?aDlHaDY3MEtoNG96eUJpcWRYVUtKUFltOVEvTUg2TG1wSm9ydnhtTzdhcjcv?=
 =?utf-8?B?cmQxZVZwa0FOS3pSNVBhRDdNOXBNN3A2Q2pCTW1mRFFTZDdzNXNNbTR1Vy91?=
 =?utf-8?B?VWhYN2pEV1JVMUx4TWRBMHI3YTBzYUxGMHlqQkpWNVUvbVNKbG5ydTIvZldh?=
 =?utf-8?B?a0FwckkxcEFiRUJGUUl1TmtGMm84QjBIZGFTYkMwWkhyYUZ2U1BmNmdEYlRw?=
 =?utf-8?B?TldPNVdYSUNUUDlocWZFcXJTM3BjZTVycXQ2bkFjeStrUnpITVdsWkNjby96?=
 =?utf-8?B?anBGWDlBVGs2VTlmZUpRQWptT3NoZlVycnEvN1JOdW5oNVlQMy8yL1o2dCtR?=
 =?utf-8?B?RFJkb1pRYVRKZTdXWlZrSlFqa3BYdkFvMWttMkhRSmVzek9ZcmZxOW5hODJr?=
 =?utf-8?B?V0xQUG5BZWxvTkVhZDRXaUJKWmk5WWQ3cTNuZEZNQjR0VFlYZ0tTN002citk?=
 =?utf-8?B?TVBHNjZsbTNmWktJWWV5Qy82S3lubnRQRHI0U3g1UThCNEhzZVFlUG4xVkFq?=
 =?utf-8?Q?b6LOyikek1k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejMxZGZqeS8yMFRaMHhtb1prc3VWZjhITnhveW1qaE1iTklKQW1RL3lMTXJF?=
 =?utf-8?B?RUQzbzMyNlROQmcybnY3WnNkL3N2R3J3MzlabEg3M3VROVRROVpCNGVPOVZE?=
 =?utf-8?B?Um1vdnhVSkZhWEl4MnI0bWJkUVZwQjRxUXg4UG1wTVNQQ3VXREdGdUJoQVJY?=
 =?utf-8?B?clFpdVRUeG12V1Y2dXpvUWZlemdzVG04VTZscTA3ZjRHVnVEaWlzUmx4RXhL?=
 =?utf-8?B?WHlWSGlFMVdrSDN1eEx0SnRTazJNbTBMdnVCemtoNHdmbjZPWTFqVmVoNERq?=
 =?utf-8?B?dGpldkJIbUlDT01tNmZGWExlTUo0SndwekJPaXpZVGxMejRWV0gxK09JaVZ3?=
 =?utf-8?B?RmFINytkVmYvelJIZURVNEt3bnVMSWdQM0tIbmN5ZStqak1xeVBuekFnVXZC?=
 =?utf-8?B?N25OeC9RR2N0T3RJTzJtU2ZCM1J3NVFremc4YUZ4dCtNLzhsNkJWWGtPTkFU?=
 =?utf-8?B?ZU9uMWlWdzZpd0d5dzFHYThRT00ybDE4QjRjRmo4NDRVcElCUHlVeW5EZjlQ?=
 =?utf-8?B?dDFzdGo3NUVHRWorZ1RXYXUzTjJpUk93SHVzQVVVcFZLM2VUWkZNZWx0Uk5C?=
 =?utf-8?B?MHdCVDNVSlI2ZEQ5ZS9qQ3BEZ21GeXMyWXhtbTkwS1J5QXZ6Vm8wNmMwYThv?=
 =?utf-8?B?TFJUYUx5dEREOUlybFRERGRuWk8vNkJHb21Jd2VlV0hzNzRJWUtJY1lJR2U0?=
 =?utf-8?B?QUM4dVFmWlRXNUJmQW5WN2I1dlpDTXZEenpnd3N4K2x0SkFBVlo2OTZTSVcy?=
 =?utf-8?B?MDRGZWdncGwyTkxmdFRPMFdQa2ZOVktnRGM3M2RxQXJVNS9zSnc2OVREWGYx?=
 =?utf-8?B?dmRMb1VWOG1JTUdMcFRVbG83R2lTWW44R2FrWFFTS1FCSG5kY3B1VG9BdE9s?=
 =?utf-8?B?TTFrZEtFS2xGQzZuQWppMGg5UjZNUFZFMFJUcEpjVG4rZkxyM3J2TjdPOStl?=
 =?utf-8?B?Q1J0bVIvZm9PaGN3R21YR0dBZi9BSkVjWVMvUE12clkzTHl6S0dJMWRYVEtH?=
 =?utf-8?B?a29TYjdEOXZwaDJLN1NoUUNRdjl3SFVjT2s5dEdoM29nWVlLRFdFWWVHRVVP?=
 =?utf-8?B?aEtpQlFnNHM3eXNtazhLODM4OEtLUUVaNmZNdDdrT2g3M09DdlFhVkJYdTkx?=
 =?utf-8?B?NFhRc01YalBTNm5ORG44V0pqUUdSV29YYnFrZkRrMnkxZnFsalJRekhIVkc0?=
 =?utf-8?B?QXlrbXF6WklJalBDeE9zTVI4OUk4Z2hLbmxXaVY3bktZd0tiN0czT3ZpSEF4?=
 =?utf-8?B?VHh3czAzbEl6ZXkrL3lPamRvVmZRZW1JTE1YS3BFVzlBcmVaZTlXcm5ldU8z?=
 =?utf-8?B?ZTZpczZpcnpzNUc2clhWOG1nTWtBWmlNS005b0Rkd0hqSWtTUEc0YWFRUzU1?=
 =?utf-8?B?WVc5dXcwYTliMGVFNGhpZTdBMVNGTysra0xaZWdPajhwQ0NOZFB4MDlGZ1lI?=
 =?utf-8?B?eGtyUTI3NmFDMEYyTHRXYkgwbjJZT21OZHlHSjBmNEtSVE5ZUTdnNkwzMGtQ?=
 =?utf-8?B?bm5wTTMrS0p1dS9SdW1adWI5RXhRVmRLYm45WjdkNmRheUJWR1pXblBvcWRk?=
 =?utf-8?B?UTc2VU0vY0VXaTFDcExPNXRPNDRKMks3THl5bkN4UVhrQVIwa25CcWlSN0gz?=
 =?utf-8?B?OW4xWVUyTXMwMnd3N05Sa3hmQVVVeTZXdUl0Q3YxU2FBcW9pSEIzVVNaYk5x?=
 =?utf-8?B?czFGdUlNZmJuYTVyY1c0QitwYmJubXRyWmUzVzYyTTFZcG1lR1lXMHRZR1hu?=
 =?utf-8?B?bnJ2cWRZQWRkaUxJN0dxbk45S1J6eU45UEFHQ3dPbFNsNERvMCs0OWpVYmVx?=
 =?utf-8?B?WnpFV0VPS3ZiM1JsQXhIUU81VmxjTzFQMkNFRm5iZkcxUVpXSzI1cU9QbFNl?=
 =?utf-8?B?K2hQYnlkdVNFK1VHaENFNU4xeVBJc3VLazdoSkp0ZGh1Z1lKQVkxSzFUMzhu?=
 =?utf-8?B?V2hWVXVGTTVjNEtlUEx3RVQvSDVDV2tBVEZmUm9JVjc1dWRWaW0zdWpkNWRn?=
 =?utf-8?B?VDRNUmxGdlp1em9rcmlNWG45ams1V2QrOHpHYkJZQ0tXOUE2cmNPeXJ6SU5V?=
 =?utf-8?B?TTJlYXovbzk4NDlzbEdwQWtTLzNCekJmSzl6Uyt5S2JsN3FNRTFPeGhZVHBJ?=
 =?utf-8?Q?Wdr1APFv8MV8xiR+4v18Ata6+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a585039b-27b1-4415-533f-08ddbb163add
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 16:17:10.9051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ttVfNnmb5UQybDE46NAIe2cdz5XVHvGOctVBwMJrc4Y7b56EbkSgcIdObKGKZf3Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9528
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

On 4 Jul 2025, at 9:52, Francois Dugast wrote:

> Hi,
>
> On Fri, Mar 07, 2025 at 10:20:30AM +1100, Balbir Singh wrote:
>> On 3/7/25 10:08, Matthew Brost wrote:
>>> On Thu, Mar 06, 2025 at 03:42:28PM +1100, Balbir Singh wrote:
>>>
>>> This is an exciting series to see. As of today, we have just merged thi=
s
>>> series into the DRM subsystem / Xe [2], which adds very basic SVM
>>> support. One of the performance bottlenecks we quickly identified was
>>> the lack of THP for device pages=E2=80=94I believe our profiling showed=
 that 96%
>>> of the time spent on 2M page GPU faults was within the migrate_vma_*
>>> functions. Presumably, this will help significantly.
>>>
>>> We will likely attempt to pull this code into GPU SVM / Xe fairly soon.
>>> I believe we will encounter a conflict since [2] includes these patches
>>> [3] [4], but we should be able to resolve that. These patches might mak=
e
>>> it into the 6.15 PR =E2=80=94 TBD but I can get back to you on that.
>>>
>>> I have one question=E2=80=94does this series contain all the required c=
ore MM
>>> changes for us to give it a try? That is, do I need to include any othe=
r
>>> code from the list to test this out?
>>>
>>
>> Thank you, the patches are built on top of mm-everything-2025-03-04-05-5=
1, which
>> includes changes by Alistair to fix fs/dax reference counting and change=
s
>> By Zi Yan (folio split changes), the series builds on top of those, but =
the
>> patches are not dependent on the folio split changes, IIRC
>>
>> Please do report bugs/issues that you come across.
>>
>> Balbir
>>
>
> Thanks for sharing. We used your series to experimentally enable THP migr=
ation
> of zone device pages in DRM GPU SVM and Xe. Here is an early draft [1] re=
based
> on 6.16-rc1. It is still hacky but I wanted to share some findings/questi=
ons:
> - Is there an updated version of your series?

Here is a new one: https://lore.kernel.org/linux-mm/20250703233511.2028395-=
1-balbirs@nvidia.com/.

--
Best Regards,
Yan, Zi
