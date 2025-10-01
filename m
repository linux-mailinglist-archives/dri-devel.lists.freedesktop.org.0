Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363ACBAF544
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9AB10E684;
	Wed,  1 Oct 2025 06:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ikwtSQ5m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012065.outbound.protection.outlook.com [52.101.43.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59F2010E686
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:59:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f84DJQzKw28KaO8Y150wjK1h4vKkCLMfwH/Mg22VJVcVQWn9q7on/d/mplfaW8QlV/f5aiwGQD555ryKocNJp21Ku1p/c+jFRGdkqS+nkTx9exXxVQmxjCx2uP9rMP8AR0dBbuhc3Txyn3FUdjx9/TeWT/b8XH6hmf6KiOF78gAT7Q+beRqMroppGI+XG4o4EnUwzTI+I0sfEHw+JRs0ICWrzBn+NFMoKpFOh4a7jbUG/BsYvRqpub+2LzcqzfMmpbIJIR5JprCp6mTLjtK2xqQ++rlzZrmtf41/mk9HEn5uDmV0R9sJvk5yRomWkLu71WiJH20F801X1tBqdI+RHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8y9rkXr19BPcfATeFuC6hTaQVrI4WrDfcxacrk7C9Zk=;
 b=dYjXySeAvAiD6VJUmCGNFjPh+WnHl/BnQP+KlKUIbdBFpvGa3Udzq7VfREsz6hTB8Auy7xbuu6CxDZj9Yoms1eF929OhqcXQlX2XnoeSqSLwjAKQnpQDIPRizVrYmAOKxGdgeHEp4ETDvia+wNnRfAgM5YVdd3ErthPvv9SYUS07nYqqwMKYovG+e1SIFLKHUQCe2QYzoseNFXNW1h3llwnxCib7vCwqYjiyzDqTL4gIOF3Be2556Rb0B3HYO3bmGQsEUtbeycgIYmr5Mzpyzevh9nRg3BUbl4Mxf+gnxLpNQtW3nPfb07gt3LQ59Mmj2ciTPswc7+dd/BESOfSWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8y9rkXr19BPcfATeFuC6hTaQVrI4WrDfcxacrk7C9Zk=;
 b=ikwtSQ5mWjPjFnhNPZse6a7PMzUFUupt1tLMYHQh3sdTVneVooGPMfhQdE9U2IOEmWV3fiB3ozJNwlLN0vKdqcAS8ISWpiCltg15h5We/AHqCWHwecL7b8X9Xw2vdxFL5ZlQlOO1So6ZEs1m8UOimf52SDK1QTGK3yFRGybiFmmLwtoVRjKbz40Pc0zMMWsK3mYVqAgixhWCKqs419e/i6rn0PjWruaTOmTE4Jwrzo5ss6ilRgcnE1vyEKzXhEdBacNEyfLLyfZxdgFYAog8ks4+H/jx3Ppk26VgIAtFpmAVwm9RdBC+nTk2yO4xnFZaampm4iNY6HwS44BQePTBEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:59:00 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:59:00 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v7 15/16] selftests/mm/hmm-tests: new throughput tests including THP
Date: Wed,  1 Oct 2025 16:57:06 +1000
Message-ID: <20251001065707.920170-16-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:806:d1::10) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: b35cd213-d8c7-4b2c-6f18-08de00b7ff67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjlKY3Z4UktYRFU3QzI5QU0zdDBzVURiMDdxUUg4TlFWbnBNejBmMWZtUFdk?=
 =?utf-8?B?Qm8rQ3RqYndCY09mSEU0UzBnUFB2dzJ0a0p4cWRoUlZISnNaMkRLUzExMWZC?=
 =?utf-8?B?T01EUDZXWUZvdzJJZWVXcnR4VWE3VWU3dnhQaWJGZi8xeGNmUVNnU3krU2dy?=
 =?utf-8?B?QlBiTzMvL1Urb2xiVTFicWxJSkhIeXhvZWkxcFJybHlXVXljMVZUNWM1cnRt?=
 =?utf-8?B?cWFXSGRMMEZZSGk1RXhYS3BGZ3BHVyt6bis5ejVoc0F3SXhudkZZUUQ2R3pa?=
 =?utf-8?B?QU4zZ2N6UU0vM1lSRHpHWkFSNm1qWXArOGN2UFpnc1NsaUhjSXJrR0FteEo0?=
 =?utf-8?B?MitMckI2bWxUMEtTMDh6UWtCMnFDRVh6Mm1IdkxRb3J1RkZQSDVmbXZSTUFW?=
 =?utf-8?B?aE05Y3lMWDVuR1hkU0hPQjRlN0RBZ1dWakFmdWUyM1dEYWEyMU9ESDYvUFpJ?=
 =?utf-8?B?Q29WbnVHdUM0amc3cmY3Zi9qYTNiZEF3M3FNckFnNklGQkRLT2VlZUM2V2s3?=
 =?utf-8?B?bGRkSEdZWXJoanpQNlhwaW9zeWpmOVlBb3RIelVLS1h1M1U2SDAyTFZsYzRK?=
 =?utf-8?B?MHRhOER0VXFyK0h0U0w3RVZ0OEpxaEJhREtMWUlXdmZZaVRpaUtlcVFwWllY?=
 =?utf-8?B?Z0Q0R0U3OG14VE9tZVlpaXNrNithWkFsQ2VFclRoaDM1TXdMa0JtbFJKYld0?=
 =?utf-8?B?cHJvWUVDeDVRK3VrWGZhS0xMa28vOFdQU215TUQrT3dTQ3N5Z1lLd1FXaTF6?=
 =?utf-8?B?YU9BVE5taTBzeWgzdndGcTdJMThzd3NLNzJkOTdjRjBPYzVXT2VITlJuSXhR?=
 =?utf-8?B?LzYwdHh3QlBzdFlQSS9OUkd0NU5GMkNVcTQrQitqVFZ3LzhpMUhRMlBuZEY5?=
 =?utf-8?B?KzMzeWc4QzQ1S2cvamdQOHFlWW1peW1UTDFpdmRkTGMrcFlvZ0s4QmRWY1l2?=
 =?utf-8?B?RnFzdDNtbGtNYmRlMU5FRFBkSHZJRDFoZGc0TUY1M0tzOER6cnFzNHNuYmpF?=
 =?utf-8?B?alRoZUNvVjRCYjl3Nk5McG1Zcm9uSHB2UEZkeFVENHBSN0txSjdQMWd3TGM4?=
 =?utf-8?B?aUQrSEJ6UzRaU0xVbGxjakhCWWFMT2svaW5ldkFtZURjZE4xa0xVY1U3eWRX?=
 =?utf-8?B?Y0c3RjBVZkhwYkVUSVhza01PUklQMWdSNVp6MWRrRXU1UUVvckdCbVlSNmF6?=
 =?utf-8?B?dkY1QlBqMmJCRlJ4aXBIYmZsZyttZ1FNK2JSQlVoVndvaHBSbmh1Rk9Mam5i?=
 =?utf-8?B?NlVjU3pyMmpnUzVrSm1tTU5HaTRZYU5mM0tHd1lUWjgvYXJnZ1V0eW5TcTFt?=
 =?utf-8?B?cGQ3UUQ3SXpxWnJtZi8wZ2wvKzdHK3Z4MERIWXltaWF5cDJGclFtNXdaR3pU?=
 =?utf-8?B?UGVqdmk4bWM5djBSNTcrZG05RitOdjZ6U2ZETElZaVQwdkRvaldHQTJPRWlB?=
 =?utf-8?B?dytpdGxoRzB2azFyNmdCTjdkM253enhQMTkxSmIxclYrT1hueVo5UW9UMnZX?=
 =?utf-8?B?MmhETUErS2pPcVlQY24rdW1pTGY2bDRkU3VWUWlmSnpST1lnMlBBTUF5dk0r?=
 =?utf-8?B?R1E0cEkwR1pHbFBzZEV5ejJZdHIyRllBdGliL0cwRG5SMVJxdzgvUWVndXN2?=
 =?utf-8?B?b1pRcjFlang0THo4Q1JGQkFXeldhbTNsbnBOMnlBbmsranROcmpSMnpzalgz?=
 =?utf-8?B?eXZBbEdmWnRzMDVYVzhUQlp1OEtLMFBxNlB6ZnV1eEVDSHVKdHY4ZHZVTzZy?=
 =?utf-8?B?ZkZEN1dQMk1PSFlFZmcvMng5YTMwajczNjJiSGwwWnorOVVyYmxXK2dWWVlp?=
 =?utf-8?B?M205d1ZyVDdWL1YzV2lPcU5kQ1kveGorem1HYWRsdlVPSDFUOGtmQlp3alFr?=
 =?utf-8?B?aFh2T3BnUGNzSWdLejhNMTRsQTVtcHd0N1BpQ2hJKzhZODc4VEdYL21ncngy?=
 =?utf-8?Q?YjkJDArBZK6WcGHlKP4qz8645noEeSgh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFtY0llNTg0NDJnNnY3NWJ2dE5QRWJ3dWtwZkJiRklmRUtBazQwUUR4WSt3?=
 =?utf-8?B?ZllUNTRoTlNnNmZ4T3c5NmVjd3B6RW1Id1pTaHRrQTRtYWNBdm5DU1BSUDNw?=
 =?utf-8?B?azh6WGl3dHdncjlqbWUvMzRENHRXQ29VR2FXb0pNdEJGU241K0ptc3g2S0hr?=
 =?utf-8?B?d3Z5NnoxSkNPRmo3c2xkMTB0MXgzVUxQeXFsTmphazgxcFpNK0g4UXdGWGNh?=
 =?utf-8?B?MHIvUktIOHA4dEtuUWVOWG1ucjFxb2MybHNhVmlpZWYzcSt6bHRUOGluMG4w?=
 =?utf-8?B?MWJmRlBlTnpoMmUwSmRsdW11ZEQ2bTlXa0RLV1FpOGE5YUZEQkZIanJQQWlS?=
 =?utf-8?B?MnFnVkV6a0hzQkRaQTNrdnlnRUZLMlp6U0xxUDBQWXkwVGlZOGkydWJ5NVoz?=
 =?utf-8?B?VVkxdGVoRDRiVTRKK01jMittYTU1blFMd1UzNERmVlVGbFE1OGNybXIvelZP?=
 =?utf-8?B?T2dKcHRZSnoyQXM0NnhROWJjdSs4WStRdENzdEdwbFdvalcwSFlGR3VkV3pU?=
 =?utf-8?B?ekYyM3poZGQzRDVody9JWDdWMVhtRGxwc0ZyeG9zR29pUlJlSXJQSW54T3RZ?=
 =?utf-8?B?MXY2WkZGckRJN213UFV1d2xpOFJLM0tpcXBVcmVxajdyeThCUU1oRjJnalp4?=
 =?utf-8?B?Q2t2MFI4RU5Tc0lCWnp0ZXRzYUM0SDlsVVhSNWJ1bEw3Q3g3R25NbG9oZXFL?=
 =?utf-8?B?WVE4aUtMSkdpekM2eUhBYU1DZ01HWGFQQ3E4emtBelRiZmdDRnpUZW1UUnBN?=
 =?utf-8?B?WDhSZUhMUW5aSVF4dW4rek1mVVlmbDJRVlpvZ2ZGWkl5WWFxUmhHZ2krMmt0?=
 =?utf-8?B?NHhpaVk0QTdlcXhZQkdtUm1wRWd4T1lBcEhtVGhUTnp0RkxWMVhhYllYMVla?=
 =?utf-8?B?cEhRT1c1SzUzdGhqQ0ZLeTZ0cVFsbTViTHpoZ25xcThGZjRsOTNoOWxFTXg1?=
 =?utf-8?B?bGdTTnkzVlNkUExDMDZZZ0hta1pZRU15VWpLTS9kYVUrSThESVkwVkc4UWkw?=
 =?utf-8?B?clJmTGlBMURvTEt6TEtDMGhkOTVTWnR2MjZqM3JwQzZ6Y216eUcxbmIwWWJl?=
 =?utf-8?B?Q0xyaXNhUTRuTHJJU3AvNy9kQ00va1BpS0VHbDNITE1LWnFiNDV1aUhHQ241?=
 =?utf-8?B?cG9ZT0l0ckpRZTJCSm81K1Nab0plb0lDNW9wWmNFRTdOQng5UG1CMVNhY0pF?=
 =?utf-8?B?TC9nWWlNeFF6NXFCdkNKZVRBNjdiTDVkR3lhK3BUQ3FsSVZFMktiQlB3eE9F?=
 =?utf-8?B?QzVVYmprWXY2N1h4MmxSZ2FyTytsblNEL3NzN2c4QnFQOEpyb1dUeDJLR2tx?=
 =?utf-8?B?UDRWWStGaHMySTc4d0pMU1dYZDZCQjlTTG0wNHQ5TVVvSzhHYVVWQkh3aWdY?=
 =?utf-8?B?Y3lpNDV0aDlTZTVabFBzcGZDSy8rcTZxSFNNd3lDY1ZUK2RNZlNaYkk1N0Vm?=
 =?utf-8?B?Y3k0cFQrK0RsTWlnYnJKMDBXRjV2dWp2QzNJSnlPck9HZTB5S1Z2ZHozTHk5?=
 =?utf-8?B?SmQ2UGJRMDJ1K2hERnFFdWYwY3FIbUNialhFOExsbngxdDdMcjBRdU8vMjVp?=
 =?utf-8?B?bWQzMkJ4aGpxKzBkWE9ieklWMDJuTFEwN2w5VHplYk5ndWZqNDdEYzNRM28x?=
 =?utf-8?B?VENLa29NejFaM2VkVWxsYzllVEVNdXNEVllDZlVUNUNMOFZIS2YxQ24zd0V6?=
 =?utf-8?B?bVhhbFdQVDNlR0preXJzUUE5U0FxUU1nZ01VTVdEcnh1UERpNytLdGRaQnhD?=
 =?utf-8?B?SXFhRmFxWks5T2VLYjNWSEltSTNJNXMyL3pJMERXUWdCQkVSSk1sT0NyV01l?=
 =?utf-8?B?MGpCUFh4RDFmb0hOSVdDQ2ZnanFod3FKK2pxVThRMzlWUTdWOG1rUFVkQ1hH?=
 =?utf-8?B?SHJjK0lxMzlHQWJ3VUtjVHNUeG9xTStGOUdWd1cyV3E4Y1dFYUdDdE01U3dr?=
 =?utf-8?B?Tzd4NjJWb2V0dUpPTStadmpHT2pRVjNMdlVsUG1tVzlrVE9qVytvYWtIRVRu?=
 =?utf-8?B?OThFYk1YYlFDajJNbmNSQ3NQbjVUZWRYUzJEbW51M2NobXg4Vi92RThGalh4?=
 =?utf-8?B?MXhjQkFQNEUyU09pelhyU0JTZmtqVmtHTGxZUGRJdk9uQzJYZUs4TUR5UHFQ?=
 =?utf-8?B?d3VEZnNWSmkwTW8rSkYyVlViSlZTQmw2NlVzOEk5UkpWdWpCS2F6SlMzZDhL?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35cd213-d8c7-4b2c-6f18-08de00b7ff67
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:59:00.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5uPUgYW7WnlWjEdwo7XD8HI9SB5UIPnc9zuvBOCo1XmH35oxaBlY+ghv1soG7QmIpGtDE21628kngp7LftCbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

Add new benchmark style support to test transfer bandwidth for zone device
memory operations.

Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 tools/testing/selftests/mm/hmm-tests.c | 197 ++++++++++++++++++++++++-
 1 file changed, 196 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/hmm-tests.c b/tools/testing/selftests/mm/hmm-tests.c
index dedc1049bd4d..5a1525f72daa 100644
--- a/tools/testing/selftests/mm/hmm-tests.c
+++ b/tools/testing/selftests/mm/hmm-tests.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <sys/mman.h>
 #include <sys/ioctl.h>
+#include <sys/time.h>
 
 
 /*
@@ -209,8 +210,10 @@ static void hmm_buffer_free(struct hmm_buffer *buffer)
 	if (buffer == NULL)
 		return;
 
-	if (buffer->ptr)
+	if (buffer->ptr) {
 		munmap(buffer->ptr, buffer->size);
+		buffer->ptr = NULL;
+	}
 	free(buffer->mirror);
 	free(buffer);
 }
@@ -2657,4 +2660,196 @@ TEST_F(hmm, migrate_anon_huge_zero_err)
 	buffer->ptr = old_ptr;
 	hmm_buffer_free(buffer);
 }
+
+struct benchmark_results {
+	double sys_to_dev_time;
+	double dev_to_sys_time;
+	double throughput_s2d;
+	double throughput_d2s;
+};
+
+static double get_time_ms(void)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	return (tv.tv_sec * 1000.0) + (tv.tv_usec / 1000.0);
+}
+
+static inline struct hmm_buffer *hmm_buffer_alloc(unsigned long size)
+{
+	struct hmm_buffer *buffer;
+
+	buffer = malloc(sizeof(*buffer));
+
+	buffer->fd = -1;
+	buffer->size = size;
+	buffer->mirror = malloc(size);
+	memset(buffer->mirror, 0xFF, size);
+	return buffer;
+}
+
+static void print_benchmark_results(const char *test_name, size_t buffer_size,
+				     struct benchmark_results *thp,
+				     struct benchmark_results *regular)
+{
+	double s2d_improvement = ((regular->sys_to_dev_time - thp->sys_to_dev_time) /
+				 regular->sys_to_dev_time) * 100.0;
+	double d2s_improvement = ((regular->dev_to_sys_time - thp->dev_to_sys_time) /
+				 regular->dev_to_sys_time) * 100.0;
+	double throughput_s2d_improvement = ((thp->throughput_s2d - regular->throughput_s2d) /
+					    regular->throughput_s2d) * 100.0;
+	double throughput_d2s_improvement = ((thp->throughput_d2s - regular->throughput_d2s) /
+					    regular->throughput_d2s) * 100.0;
+
+	printf("\n=== %s (%.1f MB) ===\n", test_name, buffer_size / (1024.0 * 1024.0));
+	printf("                     | With THP        | Without THP     | Improvement\n");
+	printf("---------------------------------------------------------------------\n");
+	printf("Sys->Dev Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->sys_to_dev_time, regular->sys_to_dev_time, s2d_improvement);
+	printf("Dev->Sys Migration   | %.3f ms        | %.3f ms        | %.1f%%\n",
+	       thp->dev_to_sys_time, regular->dev_to_sys_time, d2s_improvement);
+	printf("S->D Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_s2d, regular->throughput_s2d, throughput_s2d_improvement);
+	printf("D->S Throughput      | %.2f GB/s      | %.2f GB/s      | %.1f%%\n",
+	       thp->throughput_d2s, regular->throughput_d2s, throughput_d2s_improvement);
+}
+
+/*
+ * Run a single migration benchmark
+ * fd: file descriptor for hmm device
+ * use_thp: whether to use THP
+ * buffer_size: size of buffer to allocate
+ * iterations: number of iterations
+ * results: where to store results
+ */
+static inline int run_migration_benchmark(int fd, int use_thp, size_t buffer_size,
+					   int iterations, struct benchmark_results *results)
+{
+	struct hmm_buffer *buffer;
+	unsigned long npages = buffer_size / sysconf(_SC_PAGESIZE);
+	double start, end;
+	double s2d_total = 0, d2s_total = 0;
+	int ret, i;
+	int *ptr;
+
+	buffer = hmm_buffer_alloc(buffer_size);
+
+	/* Map memory */
+	buffer->ptr = mmap(NULL, buffer_size, PROT_READ | PROT_WRITE,
+			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+
+	if (!buffer->ptr)
+		return -1;
+
+	/* Apply THP hint if requested */
+	if (use_thp)
+		ret = madvise(buffer->ptr, buffer_size, MADV_HUGEPAGE);
+	else
+		ret = madvise(buffer->ptr, buffer_size, MADV_NOHUGEPAGE);
+
+	if (ret)
+		return ret;
+
+	/* Initialize memory to make sure pages are allocated */
+	ptr = (int *)buffer->ptr;
+	for (i = 0; i < buffer_size / sizeof(int); i++)
+		ptr[i] = i & 0xFF;
+
+	/* Warmup iteration */
+	ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+	if (ret)
+		return ret;
+
+	/* Benchmark iterations */
+	for (i = 0; i < iterations; i++) {
+		/* System to device migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_sys_to_dev(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		s2d_total += (end - start);
+
+		/* Device to system migration */
+		start = get_time_ms();
+
+		ret = hmm_migrate_dev_to_sys(fd, buffer, npages);
+		if (ret)
+			return ret;
+
+		end = get_time_ms();
+		d2s_total += (end - start);
+	}
+
+	/* Calculate average times and throughput */
+	results->sys_to_dev_time = s2d_total / iterations;
+	results->dev_to_sys_time = d2s_total / iterations;
+	results->throughput_s2d = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->sys_to_dev_time / 1000.0);
+	results->throughput_d2s = (buffer_size / (1024.0 * 1024.0 * 1024.0)) /
+				 (results->dev_to_sys_time / 1000.0);
+
+	/* Cleanup */
+	hmm_buffer_free(buffer);
+	return 0;
+}
+
+/*
+ * Benchmark THP migration with different buffer sizes
+ */
+TEST_F_TIMEOUT(hmm, benchmark_thp_migration, 120)
+{
+	struct benchmark_results thp_results, regular_results;
+	size_t thp_size = 2 * 1024 * 1024; /* 2MB - typical THP size */
+	int iterations = 5;
+
+	printf("\nHMM THP Migration Benchmark\n");
+	printf("---------------------------\n");
+	printf("System page size: %ld bytes\n", sysconf(_SC_PAGESIZE));
+
+	/* Test different buffer sizes */
+	size_t test_sizes[] = {
+		thp_size / 4,      /* 512KB - smaller than THP */
+		thp_size / 2,      /* 1MB - half THP */
+		thp_size,          /* 2MB - single THP */
+		thp_size * 2,      /* 4MB - two THPs */
+		thp_size * 4,      /* 8MB - four THPs */
+		thp_size * 8,       /* 16MB - eight THPs */
+		thp_size * 128,       /* 256MB - one twenty eight THPs */
+	};
+
+	static const char *const test_names[] = {
+		"Small Buffer (512KB)",
+		"Half THP Size (1MB)",
+		"Single THP Size (2MB)",
+		"Two THP Size (4MB)",
+		"Four THP Size (8MB)",
+		"Eight THP Size (16MB)",
+		"One twenty eight THP Size (256MB)"
+	};
+
+	int num_tests = ARRAY_SIZE(test_sizes);
+
+	/* Run all tests */
+	for (int i = 0; i < num_tests; i++) {
+		/* Test with THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 1, test_sizes[i],
+					iterations, &thp_results), 0);
+
+		/* Test without THP */
+		ASSERT_EQ(run_migration_benchmark(self->fd, 0, test_sizes[i],
+					iterations, &regular_results), 0);
+
+		/* Print results */
+		print_benchmark_results(test_names[i], test_sizes[i],
+					&thp_results, &regular_results);
+	}
+}
 TEST_HARNESS_MAIN
-- 
2.51.0

