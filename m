Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BAB411CF
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 03:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D1710E85C;
	Wed,  3 Sep 2025 01:20:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nNZoYCr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC0610E851
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 01:20:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=th16ffcc3yI3LhLJEZcS2Z0yyuFAwr0YgCBJ3bU2UG+qbPF4miBHas1qgGW9yv+c4xuffhEB1yD1FdZ0vzMmAdSRF8Z3t9D5C9ck0F/FIlE5/bWuLIlkf2APxhfINKHnkfF/QE5snV5MB33rUbHDXYaLp9OqASRCn3w5iIEFxlYpIqLaV7VoJFzm95IDheUHVp8eNSUspHuknLl4YafumExZdg4zZJdI7v7YwSxkueDdGJPBBBm6FuA8bTHRbceHTUZpydGChNJKBNifsSMLo5Bg2ieKIHDajQjNYDj1Ky+j7twpwEVlEmtnK41gf5OsxTE3GjPs6yCRUEXU/bwZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQgU06nh0L0XAE6IIHtRAaU2LpNTrJ9cohqPUM73CF8=;
 b=n5Vx8lTASOxpHXp2HNIIsDQPhZvgyv9d4m7CPQejathNgh9RQdmsWMPYIXeyAQvCLUGk0JyIO0zwQjW7HI5WpfKS7BrfeLC2T7Xg5hJ7djCEWs04yPgZAsTrohhMxj/fMiHXObbQFHo4HsWcGh9wD1AvoE/wZo12W0vsgd6kLbbuOUi0Rtf0q3GA/hF3aB1VVuwSM2+c4Uw+cRHdhS6zJ2HxQbdf+DyYsQM0uCIV5ONnrs/WBUmoNkddQbOdePfKAoxAl8Ol+Qk4+QUFZ8QMRGN4t5vJEnFryheSPHlYP+RABWUInwAnC2WZ7VwMDNgF5C3ac6BpKYIqMTyPkGvaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQgU06nh0L0XAE6IIHtRAaU2LpNTrJ9cohqPUM73CF8=;
 b=nNZoYCr0HmCGu6Z9LmZTeacfDGieiToQU2EMDqFCJAB4a5RKMewKwpWUAtjrC7d/g0NRQymsQzR8UuCoLn5KS/VFPPTgeG3Qu/tJhpglbpi2QB+lIPYdUEPLGp9Pcm4o06hXLfST9ykL89MhMBHcuAOfkd8onvA9c35TwmPwS3ZGsRby3WoqPxra6IeRu8hi5s2exvssgVvVs8X1vze686iQ972kb9f7+ckd7iYk61P2DtiFG8PB2bfHW9OhNoOR2Y1kSnIm4nR8kcZQU28GcAj0B/SzEDpWax7QS5QYAjC0jybSDk/9lKivB76OIg17lK22U0/VJfOS+d4BlQcOqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.34; Wed, 3 Sep
 2025 01:20:12 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 01:20:12 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [v4 11/15] lib/test_hmm: add large page allocation failure testing
Date: Wed,  3 Sep 2025 11:18:56 +1000
Message-ID: <20250903011900.3657435-12-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903011900.3657435-1-balbirs@nvidia.com>
References: <20250903011900.3657435-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0092.ausprd01.prod.outlook.com
 (2603:10c6:10:111::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 552991f4-0479-49ca-4547-08ddea8807b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStkZ09EUkQwbW1jMG5STTArRFVqY2VBNjhLK0w1Mjc4QTlFdjh6Z3dzdi9V?=
 =?utf-8?B?aEVlNHIwZXNsQ1B3RkcvYmVBNmFybkQrVHpQYTdCTlRMb05qQWlubnJTUVJ2?=
 =?utf-8?B?S0RydGw1L09idm1oRmpDVW52VjliL1p1Z05EMzI1SnNSVnlYdnBWMWk2Y3NB?=
 =?utf-8?B?UGRjVEJzcklGM0Q3M0R3R0g3Q1AzUTN1NVd4UzM2SHNsM0RPdDhRWW51NHo1?=
 =?utf-8?B?YnhUNWM2NFlidEU2dWRrTW95WGF2Tyt2Q1duUngwREJURlozdExkSDlpOFhz?=
 =?utf-8?B?Sk5lRHduQm9STkZQYjI1Y1IwbU5wLzlvS3lveEJGWjRvdVpXcStVR25QR0l6?=
 =?utf-8?B?V09JL0x1L3kyTGhlNFpRcWs4OFhBSDhhRXVUTUFYWGF6elh1NGhHc3RUdC9L?=
 =?utf-8?B?YXg2TjNpc1hiYXYyb1NSZVdkbUNwOEZveXFEVE9ZMmIya0t1TTF5ekNQZ0lG?=
 =?utf-8?B?WlQ4S3ZLMEJBS1BPNUJVU2xvOHZGcVIwNnJyQUNuZTQ3Z1BkZXZ4a1M5cXBU?=
 =?utf-8?B?Nkh5THV3WlFXOXVUTE9zcGsxUDVHUlpsOWxYS1pwdndCYjFueXFiTE9Cbkhp?=
 =?utf-8?B?TERGdFFFV2h5S0tLMzM0Y3BVSzhUYXIvRnpDUEorWnhvbHF2Z2dsM0xobU4w?=
 =?utf-8?B?QkhPMkhMQWJJc3paejdqTHpoVnBjN3NlTTVvYjNyNmNMQ0JjNzRRdTNUN1NN?=
 =?utf-8?B?aEs1cE4wS2lMSm5McXR6V1k0TGRCRFhxaGtzaDluTWdRNTNWU3JGSVY0Vmt6?=
 =?utf-8?B?aXhqV3MyVnBXRnJrVWUwSDYxWStKVzlLWEM5b2xjUnQrTmtaTXc4N0w1WHFD?=
 =?utf-8?B?ZEdWRTFnbVVETXI1dExrQXJoUEF6dnFINjg1ZGptZHNUMEZpakp2RkNIWktv?=
 =?utf-8?B?a0FFTVhDQ0pGck1RY3AvMFRiMEV1TFNZMDY0cGhPWHZyTEY1eVF0MWhjc1o3?=
 =?utf-8?B?YlViT2N5dkJEOG1tSnMyZzJlOTNqT2VJSzJXSnl4WkgyeE5YS1MrbzBBajY1?=
 =?utf-8?B?M25HSHFYYVhFS0JBTjdPc1lMcE9tSkdheWtmbVBYVVo4R0JpWnVtSzFTdXZl?=
 =?utf-8?B?UlFoUHJrdGhFcGt0R1k1RTJhRStJS1hFakhqclNPZTU4L3JTZWhGRTBudEF6?=
 =?utf-8?B?WVBVZVhGSllYYU4yT3MwTS9RMSswNU5vdVd2ckhTNEpiaHN6bGlTa3U4K1ZV?=
 =?utf-8?B?WWp2aXhFTHNwa0l3K09ObHE0U1d5eFMzTWk3TVk1c3ZYTFp1b2Urd1JFTXRE?=
 =?utf-8?B?anl5TElxWkVHL2pweVlISmdHMEZMdGs5SWlQR2RMWUxBZVhFWE5lUkVxNytQ?=
 =?utf-8?B?WFZUWW41cUpDRU1EaGllQ1NnWDIwTHFoemNFY2ZLalV3TzNFVFZSaXFOb3I1?=
 =?utf-8?B?RkRja0VTdUhtazNJditkOENwNDZFc05xL084Q2tWUzBzd3J0S2tQbEpvSjJV?=
 =?utf-8?B?MC9TMno2dm1iZU1hUlR0blVraDJ6TnRIWnpHMDAxdmFNQ1pEYjRJMGQvR2lj?=
 =?utf-8?B?SEg3OWlaMXRuM0FDZDRjaVFhaEt5WTh4aGtuVU16ekhlTCtEczl3TFdJUEgz?=
 =?utf-8?B?NUJqdmFwOFZrVTFtemRUQUQ5SzlLMTRicUpnQXdFdERVOEFXallwSlNhZ0Ey?=
 =?utf-8?B?anFNWE1ycnBxRmNLd2h1d2wzOWNGUzBaYXMyaGFwNlRWaE5uTWYyU1ptdngx?=
 =?utf-8?B?cnQ3TnpmTEh4L3dtd004Y0RaL2VkejFWZUxPNWNZc1hsaWlqb2pVclFxL0pX?=
 =?utf-8?B?MURKYWduY1pNeTg2UXRHcWZndStBT3lNWGNZdTloNGpwRHhLM0trV1ZUWXJV?=
 =?utf-8?B?S2s5WlVMVlN6R1NkVzFGd3htTW9IQlFlUUJuempUZkhzN0RuSWlDelJKd0ZU?=
 =?utf-8?B?aHU0d2RwZ0RyZk1uYTVIWjBkckFLQnVyRnVHcjR4UEhGQmFXRUszelBBWWh3?=
 =?utf-8?Q?bg/Al3CjLzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlhzNVFKNW5ML2lNVnVjZitwREZJeXA5dTcrQmE1czE0Z1dFQzNUWDNWVlA3?=
 =?utf-8?B?K2poZ0lqZWYzei9ja1JyY2FhdTlqc3d0SW9tYnlWa3dMMEVKbXNlaUwrdXM0?=
 =?utf-8?B?Sk1mSkpvM1JMWDhkYVBNVU1EbmlKSFVwelVVYjZyOFUrVEtrbEhkQ2FYeVc1?=
 =?utf-8?B?ZlZwY2ZvK003TmVQRk9lcFdhL1c5NXl5ZHZISmNBRnhuOVNHK0g5T29UYkJ4?=
 =?utf-8?B?Ry9OTG5TOUY0ekg2dHdNMDhUVGJMVytTU0UyZXZENHF1VHMzUDdHRmZZQ09w?=
 =?utf-8?B?UlBRa09keWlaMi9RNWNTVzQyNDJtN0RQSU8vNjdTaXVHNmlzc0RLSVhNVDMy?=
 =?utf-8?B?RFNuUWJmOXlOSDBUdHMrZnZraWpxVk03M2FwUXZYbktCYXVnUk1jenpnWFht?=
 =?utf-8?B?Y0wwV29raUw5cUhCbzN0WG40VGxZOEZFZUQ3MnorNFJUY1N4TGlMTmxyK043?=
 =?utf-8?B?Y3RSQlVvNUJtM3F5dVZRbG5YWnFhV2luemxaYXMzR25XdGFja3VYazlOenZH?=
 =?utf-8?B?OXpYWEloVktMS1MwN3dSWlcvL1gwTmhJemJSb21qd0RqUVJka1NVSVQ2OEp1?=
 =?utf-8?B?eG9zd3AxcS81aUkzNHVUdFc5V1Y3NVRiRUYvMFQwczEyRlBuRUxSdzlrdDFC?=
 =?utf-8?B?RW13MGpzanpOdW9EY2hhcnFRVk94U1NoZnc5bm0xN0lGSFZUNXp0ZHUrTTdr?=
 =?utf-8?B?UjZnTjRFNTlGZFYyUTluWDExK1lCRkVJLzBpaFJWbXRVR1JSbjFPS0xCd1Vp?=
 =?utf-8?B?ekpnd2pvYjZvMEVERXozb2VwMjZuRkdrVGkxZkgxbmcxRlE3R2F5cGQwWFor?=
 =?utf-8?B?TytzNGVnNkt4NDdvMENxZGRyVVY1STUwU0JsMnRJdWhXclVlTDdGenBGOFJr?=
 =?utf-8?B?QnZNQXRteHlVdzVUZjNKWkx4YUxRdlpSNHVCN3NyVXRHNDh4dWhtN05uUm5Y?=
 =?utf-8?B?b1Q5QWVtNjRzMDVLTmRpVCtybHNCblNPTVR5YVYvZ3NRL2E1Qk4rM1NwSlB4?=
 =?utf-8?B?ZUE3NHlPTWM5YXFsY09tVkh5dEJ4a1QzcUVYZHJIRGVqNjhzeUhBMENwMndF?=
 =?utf-8?B?WkJneFJZS2FsVXJMU005OUhWNzlMbENqY0V5am50K3QxbDN0YXFIeE5XSytF?=
 =?utf-8?B?emZwLzVMbms3ZUFwNTQwUERDZHFQd2IrT0JKbDlWQm9FN0hPRVZrL2VuZXJR?=
 =?utf-8?B?ZHFtcjhPV29DRHhhR0NHamVrSElObGlPNWxVUzVUUWZiUGVKUmRHQlhJR3JB?=
 =?utf-8?B?MlR3Qk9ac3pRMjNEVlR4NTYvL2JEclY2anBQenlROWQwK0JKSXcrdXpSWG5r?=
 =?utf-8?B?bmxURm5ZbVgvck1DVkQvcEdaRUpjQ1lNRzJ6emlmZnVzamdmRExRRUgxS3hE?=
 =?utf-8?B?SXZpS2pVRmRiZ1hMVmRXSVlQR2hBQUdhWW9wSklpdnYxTUFDdzQrTFgveFNZ?=
 =?utf-8?B?OU5ESmM2My93R0lyR0xNSGJTNHA5VSs1Y0pUU0tacnM5eHBqalMwYkQrMy9p?=
 =?utf-8?B?YmZyRC9RSzU3MEwvM2QxVmpId1lOdXVQbHM3MmNQR0k0Vi9KQ0dyVzBBRjhW?=
 =?utf-8?B?QVFPTGErcndpSldOZVE4NWZ6Ylc4TThJRjlGUWFYWFFjSGtQelFNS0g3QlIw?=
 =?utf-8?B?a0paQkFjZEVtU1JNN2dRcjdhbk91SmpDdFBwSFExcTlUMXcwQWhOeWNES2oy?=
 =?utf-8?B?dU9zZG5oSEYzWkVrNnFxaExKeUluVEhtektJT3l3YVYwcE1wT0t4N1RwVWYy?=
 =?utf-8?B?YTNpcitvZFlXM3ZUZkhnZmNPMWgwZzhBV01sS1dGMUd1eFQ5WmM4RUtvSjF0?=
 =?utf-8?B?WU1NdHhmbVJTK05JdGVnZTNZN09LeEFTK0syc3FTTGNybHA1V1RtV294Wk5C?=
 =?utf-8?B?QWlmNVNBWmMrc1ZoNDAycytPTkd3b2FlS3ZzU1JwTHFaMnRmM0U5U1Mwem1C?=
 =?utf-8?B?aTNGZGpLV0pjMlpNRmx3R3QzN1FJdmlTSnUxTUF0ZTRYTC96SXNyZlZVZit6?=
 =?utf-8?B?eWlNSXRRK3pkQnhTUDFPbzRhZGMyUThFK3lBNGRtZTMzQ3V3VUtvM3l4Wk9N?=
 =?utf-8?B?eUFYb3NsSnhwekphWGNSRkFoYWxVZ2pMbTB3YzFvcXFZM0J4VVpBd1J5aTVv?=
 =?utf-8?Q?FdSXNVCeHcZLkPAx6McnJ+I92?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 552991f4-0479-49ca-4547-08ddea8807b6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 01:20:12.6501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKN2xJRUWnVh3eNIu2tMnKPYUYepnKbpAFyfWCOkUZ8w4UDltz9i8i/osMLsAS1yR8DhfJT6d8IwyUx5wQktRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708
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

Add HMM_DMIRROR_FLAG_FAIL_ALLOC flag to simulate large page allocation
failures, enabling testing of split migration code paths.

This test flag allows validation of the fallback behavior when
destination device cannot allocate compound pages. This is useful
for testing the split migration functionality.

Cc: Andrew Morton <akpm@linux-foundation.org>
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

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 lib/test_hmm.c      | 61 ++++++++++++++++++++++++++++++---------------
 lib/test_hmm_uapi.h |  3 +++
 2 files changed, 44 insertions(+), 20 deletions(-)

diff --git a/lib/test_hmm.c b/lib/test_hmm.c
index 375ecefc1388..ec48d8c336ca 100644
--- a/lib/test_hmm.c
+++ b/lib/test_hmm.c
@@ -92,6 +92,7 @@ struct dmirror {
 	struct xarray			pt;
 	struct mmu_interval_notifier	notifier;
 	struct mutex			mutex;
+	__u64			flags;
 };
 
 /*
@@ -699,7 +700,12 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
 		     page_to_pfn(spage)))
 			goto next;
 
-		dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			dpage = NULL;
+		} else
+			dpage = dmirror_devmem_alloc_page(dmirror, is_large);
+
 		if (!dpage) {
 			struct folio *folio;
 			unsigned long i;
@@ -959,44 +965,55 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
 
 		spage = BACKING_PAGE(spage);
 		order = folio_order(page_folio(spage));
-
 		if (order)
+			*dst = MIGRATE_PFN_COMPOUND;
+		if (*src & MIGRATE_PFN_WRITE)
+			*dst |= MIGRATE_PFN_WRITE;
+
+		if (dmirror->flags & HMM_DMIRROR_FLAG_FAIL_ALLOC) {
+			dmirror->flags &= ~HMM_DMIRROR_FLAG_FAIL_ALLOC;
+			*dst &= ~MIGRATE_PFN_COMPOUND;
+			dpage = NULL;
+		} else if (order) {
 			dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER_MOVABLE,
 						order, args->vma, addr), 0);
-		else
-			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-
-		/* Try with smaller pages if large allocation fails */
-		if (!dpage && order) {
+		} else {
 			dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
-			if (!dpage)
-				return VM_FAULT_OOM;
-			order = 0;
 		}
 
+		if (!dpage && !order)
+			return VM_FAULT_OOM;
+
 		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
 				page_to_pfn(spage), page_to_pfn(dpage));
-		lock_page(dpage);
-		xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
-		copy_highpage(dpage, spage);
-		*dst = migrate_pfn(page_to_pfn(dpage));
-		if (*src & MIGRATE_PFN_WRITE)
-			*dst |= MIGRATE_PFN_WRITE;
-		if (order)
-			*dst |= MIGRATE_PFN_COMPOUND;
+
+		if (dpage) {
+			lock_page(dpage);
+			*dst |= migrate_pfn(page_to_pfn(dpage));
+		}
 
 		for (i = 0; i < (1 << order); i++) {
 			struct page *src_page;
 			struct page *dst_page;
 
+			/* Try with smaller pages if large allocation fails */
+			if (!dpage && order) {
+				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
+				lock_page(dpage);
+				dst[i] = migrate_pfn(page_to_pfn(dpage));
+				dst_page = pfn_to_page(page_to_pfn(dpage));
+				dpage = NULL; /* For the next iteration */
+			} else {
+				dst_page = pfn_to_page(page_to_pfn(dpage) + i);
+			}
+
 			src_page = pfn_to_page(page_to_pfn(spage) + i);
-			dst_page = pfn_to_page(page_to_pfn(dpage) + i);
 
 			xa_erase(&dmirror->pt, addr >> PAGE_SHIFT);
+			addr += PAGE_SIZE;
 			copy_highpage(dst_page, src_page);
 		}
 next:
-		addr += PAGE_SIZE << order;
 		src += 1 << order;
 		dst += 1 << order;
 	}
@@ -1514,6 +1531,10 @@ static long dmirror_fops_unlocked_ioctl(struct file *filp,
 		dmirror_device_remove_chunks(dmirror->mdevice);
 		ret = 0;
 		break;
+	case HMM_DMIRROR_FLAGS:
+		dmirror->flags = cmd.npages;
+		ret = 0;
+		break;
 
 	default:
 		return -EINVAL;
diff --git a/lib/test_hmm_uapi.h b/lib/test_hmm_uapi.h
index 8c818a2cf4f6..f94c6d457338 100644
--- a/lib/test_hmm_uapi.h
+++ b/lib/test_hmm_uapi.h
@@ -37,6 +37,9 @@ struct hmm_dmirror_cmd {
 #define HMM_DMIRROR_EXCLUSIVE		_IOWR('H', 0x05, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_CHECK_EXCLUSIVE	_IOWR('H', 0x06, struct hmm_dmirror_cmd)
 #define HMM_DMIRROR_RELEASE		_IOWR('H', 0x07, struct hmm_dmirror_cmd)
+#define HMM_DMIRROR_FLAGS		_IOWR('H', 0x08, struct hmm_dmirror_cmd)
+
+#define HMM_DMIRROR_FLAG_FAIL_ALLOC	(1ULL << 0)
 
 /*
  * Values returned in hmm_dmirror_cmd.ptr for HMM_DMIRROR_SNAPSHOT.
-- 
2.50.1

