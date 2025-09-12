Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8E7B541C0
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 06:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4B810E429;
	Fri, 12 Sep 2025 04:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qEGsnToP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2070.outbound.protection.outlook.com [40.107.96.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844DC10E429
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 04:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkxHmzsCS6Dt4OOE8LE0zVmMdpMxZ5EZoRCa5t6eu00RW46RbWrkyhFC3Z10geVhas7X95QKQeKUII3Y3RmNVbBbteqc9aa2nmfb/q0AQ9qGzh/ZNFuc13ogKMOO9Fgvr+oivlp5MJ7AM79mhwovqtn7vPSE8EWdz9e6sMAdll0YOI6KNjuPTYczN0zedNyC9Aj5paGuAdNIOfDZfEdFZkk43X3CbZgbZrceHvN9ioPY+YwRWjVkO0WcKZEpjWuIOGRlH64FctBcOvqSPY/m68YweJq3m39dcL/nKEaMqVjrfWf+DLNyBTFJdy1jLjibJBeKWGxIjptkBGRzccHknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZbnvhPcJkwG7QOK/UjP2uuHdcWwysF8q7nlHm5aGf8=;
 b=tY1LHYVngetkADEfMRWkl2zwjcQAWOsp7Nvx5sRSa2aCPcKrvSUfAAQX2zuL+ZIWksT5oawJAd6RoovD9cxNjUZlPzEs98BPpI6NPWNOxFy3CEKaOqC3kajoJa+++BBmOuwqH1CFjeWIgFbv5Hs8PZ4u9qiLY1iZ7e94B7G5Hlo0Z7MuNLIIcykEXIWrDkXz99K4CsRa7KzlytkQS770SKAApxfiggl2qVrXul11SEu5rSo3RsSOIVs7b+ngEDPXeZEc+ilK/tydxMLZltTjeqeY5gTYC0mfGyRUbHbbYP99V1Z6j+gnleADDL6QGHyNBpZwlTZzjlWtIU03b6P+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZbnvhPcJkwG7QOK/UjP2uuHdcWwysF8q7nlHm5aGf8=;
 b=qEGsnToPCjH9YInxx29jlRcIDg9HBiCQyangVSonn+l3rVfrAyavwUmN3UoLp98dr0WhwSplxi5io6ZBXCOtoGVRyQwElsDk1BLlIUGaYVPi/OxbWVDiouvg69d8jm+/6g8l0nIvNnoL+a/B9STW+Yp22sHBvJYQesv/pLNBJPQv1aUOMN13y1W1mThK6GX+xNYAB8TGXPqFlcwp9bkAhViC1Xs7WabXde+MWqU7mERzTEuRjK0IcDSR2vsANZTYoN5nr1OjWyWkimBrrm7fommTyJQbI6cQukRdxPpnx/YI8ixabr1/XCIyWLnXlRS8T8VbOoYkDDLb9tIgVQxxfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SN7PR12MB6791.namprd12.prod.outlook.com (2603:10b6:806:268::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:49:23 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 04:49:23 +0000
Message-ID: <ce40579b-4ded-473b-8fdb-a41d5b5021d5@nvidia.com>
Date: Fri, 12 Sep 2025 14:49:16 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
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
 <20250908000448.180088-2-balbirs@nvidia.com>
 <8c5267ec-cc85-4eff-b890-eb705472e2b2@redhat.com>
 <f98d3149-9cc1-4211-af8f-e49547134b8c@nvidia.com>
 <244005a2-4796-4985-853e-f916bdfd096a@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <244005a2-4796-4985-853e-f916bdfd096a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:180::44) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SN7PR12MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b987d30-a074-4d46-9676-08ddf1b7be98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnAvTWw5YW1Lb2R5UnNaRW9LNFdudURyT0s0anc2UnRadCsveDEvUkNJSEdq?=
 =?utf-8?B?bncrRElPa3pyQjJvd2dGTXJKQ2phL0U3Rms4b2g0TzJieE9aSmFOakc4S1VC?=
 =?utf-8?B?TWtucU1WRE5xTVdYSnRUcGRCQUVyRGlFdGRtalhJU0lhcjRkamI3aEVGOFFE?=
 =?utf-8?B?VURjSEFYMW9tbUsyRFo0RnErSkE4UU14UjZLVmNtdTJqWXNGL21PcktScWFS?=
 =?utf-8?B?RWg0ZzdDNjd4aDlBUzBiUHZNdk8wUDdBZjliZDNWY2FWT1BUUFNHampZM3c5?=
 =?utf-8?B?aUNQa3FiakRReFB2RFJsVG5SNlJVNzhLclNrSS85QnRTWmc5c0g1THJ1dWpP?=
 =?utf-8?B?QXUyTmg2NEtmVUk3K2hYMzUyUUZXSzBzSE5ZVmZaeUgrL1NkT2xLWnhLaVV1?=
 =?utf-8?B?ak1DOW1sbXBRSHkyMGdGbEFyS0xhSXZWejF2cDB0MWREczZLQU9xTHFnU2cr?=
 =?utf-8?B?dlpZZzhQanl0M0dwN1JpYktBU0lLV3pkL2JISXJQMnhldzlnVmNvaDN1VUxn?=
 =?utf-8?B?NWNZSCswQUxIQ2J4c1NRUU5mSEkzUFJ0U3hERFEyVkhvdTN2T1ZJOFpGREgw?=
 =?utf-8?B?RHY1cXZwcGR6RVFiNjQrV2lXcjFYN29oNXZKTGlXdkhJWWZDTkNJMUwrdXIz?=
 =?utf-8?B?bDNKek5mdXZoZ2E2eFRGaytLckRkNUNCY2sxNE5JTmVJWW5VT1JQWis5WTM0?=
 =?utf-8?B?NTUyVWg2SzlpY1lGVTE4eW1zMmI4Z2xSMzJWVndBckd3Q1NlbTg3Sk5PSUpy?=
 =?utf-8?B?NzlXb21ldWZKdkJYWi9sUXFkcWQzZWtjWGhzTkdLMWxCenp0Q1Q1NWZaN1Vp?=
 =?utf-8?B?WExDN09lQ1RZNEpFSXlWK0xJNy9RQ0k0c0ZPSGpNYk82eE5WVC9NMHRrU3N4?=
 =?utf-8?B?OC8vWmJTcmhNY3F1UFpEVUNUUWZlWHVWcThCQXoydU9xaXozSmNTU0R5NGpX?=
 =?utf-8?B?YU12VnU5SnYybTY1dUFnUFJEY0J1YnRSV0FPOUU0MG5YNTZNYzN4dmx4R1Ay?=
 =?utf-8?B?OFNjQWJTbk4zZzVRUmlCY3BQdUpCU0dTN2FYNG5OeGFoaG1oMnFmTUFsZmxZ?=
 =?utf-8?B?UVl4elozVDYvT2RsNEtlUHFGZmJyeUd6SVJtdlVCTWRZNE9YY2NuUHRCdmhK?=
 =?utf-8?B?b1BwTy9nR3UxYzhQeWpnRmd6cEJSRkpSbzFGUjVmTDcvaWRQd29xYVlOcGN1?=
 =?utf-8?B?TWEyMXZZTGoyY1JNYWxncGZFQmpkOTFPdjhWT2xDb0hxcjhMWTEvbTZmRFlh?=
 =?utf-8?B?dkxGVW1GcThHd3loSzJaZ0lucGEyVHZkUFlrKzBpdWNKMzBMZ1VtdE5OVU4v?=
 =?utf-8?B?T2orQzM3MnFEeDUxN1I5UHNQczZrTUNRQ1ZqT3NPK3lRRkVMbHNLemxUQmFS?=
 =?utf-8?B?RWdwcXNsOFpnZnZYdHZHUS82RmZFdlFKVVVZOFM1eTZBYktOTHBCSXlmcDJ4?=
 =?utf-8?B?SHEwcWRQcW8vRE9oUUZUUmxLczFlRzdJRXZvYXlaUDZLbVFKNStTTUNmWEY1?=
 =?utf-8?B?TGgrRUttYW04am9GemlMTm92eHQybDRvSmExSzl1Q1ROc2Zmd2R0VHpQVlk1?=
 =?utf-8?B?cG1tU2ZmOWN5blNUcWZqeVBmc2NqY2VoZUxZTmZNRXZVeWdjYVFiVVk0aGJl?=
 =?utf-8?B?RmsxRDZ0M0pnY3Y0NzlFL3VqUjQydGJZRzNiQlkzUW11RlArdGJOVDdhT2h5?=
 =?utf-8?B?QUVyU3BVZ2VSeUQreTU5NURRaWFXK0Jjb3BpWmlncjNOSGVUemp1aWNUYWtG?=
 =?utf-8?B?LzVpOG44NEpVZ0JGODNnTWNFVVZreTQ2OGthRVpCd0FXcHNzOTN4RVdESXQz?=
 =?utf-8?B?K3Y3aW9uQlE1ckFtTUtqdk4wZFRoQlkzNkhqK3RoVlF3QTh3c0k1VHNpR0Iz?=
 =?utf-8?B?QWpINHRUakxRS25MTmFjbHFpR2tXR2kwMVJPbWxvY2tFakdpbHdiQk5wTkNz?=
 =?utf-8?Q?rjTHKvVTrQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2NuTEFheURCQXF3Z3U3L1hNTVpiL1U5NGtZZitoWWYySGxXZUpnOEVFMlYv?=
 =?utf-8?B?MFh4RE9IbWlKTURqME5uNVZHa2twZ2xKNjkxQ0UrZ01DNXdoOVEzbHhZYzJ2?=
 =?utf-8?B?ejZjdWp0VXdIcldGeDMyYzBQdVZ1Y2hLejJwd3JZRWRoYkNMN3RPcjV6bUc4?=
 =?utf-8?B?Vi90QkRPN1lzblpiNDFyM0R6b3d4enVkZlRONTNaL1lqeTQwcGFtaU4xRjhJ?=
 =?utf-8?B?eXR5NnBMcS9pVStZM0FwWUVlWFBtWDBteW9JZndJMGYwRTE0TTMreEpLeW0z?=
 =?utf-8?B?Rmg2NmVPdWxrd0xNdGlqdkZieDFJdmlwamthZDV0UkdDNkQvemFsUm1ETXpQ?=
 =?utf-8?B?YWd3dFRKTyt4bklvczNCVGMzVktTeElNS2M5d0xkSDB2SWRpQlhNczlMaUZR?=
 =?utf-8?B?UzVBZGZkaFhIWEJiSyt3QkZjOXo5WnYrYUR3T1Qyd2tOTHNRc25YRG84K3RX?=
 =?utf-8?B?T0hqWDIzdUZMR1VyZkJDcDYzQmowb3Fsd0tsRG9UTTFUTUVZd0UzZ2NJNGFp?=
 =?utf-8?B?RXYrbnRBYUFaMkN2YWswdEp3NmtRTDg5SngycHhxSzVBdS9SSkJ2RmY3Mjhx?=
 =?utf-8?B?NzMzcUJaN2RpbWhmWWFRSUZHUDI4TnZ2dHNuUjl0bTNpaWszZ2g0b0JWUjBD?=
 =?utf-8?B?aXNXQVZOMGJrVW1TMGR5a09rL1hldVF2NjZtS0t6ZFkvbHg4bVg1eTNwamtK?=
 =?utf-8?B?QVRYQ2xwSzEwbHp0L0F4bm14T3BnMnY1dklaUTNDT2MvMnMwdk0rancrd3d1?=
 =?utf-8?B?cWNLWXNaNE1lVittek1HRU9sWkIrdGxCc2hlaXRHOVBOM0xUcXJxQnBPWm4v?=
 =?utf-8?B?S1dDdjBtY3lMYkJXeGdWYXlnL3BtMVBHbEtLRDJMekN5czVncjNCRmUzUXdT?=
 =?utf-8?B?cldVSnBLQUVFeXdpOFdibFlKMVlKZ1VPUEdsWi9UOUFNQTM3MGpHdzNDQmd0?=
 =?utf-8?B?NnBKSXhxYmZmSEV1U29tbFpyTEozSGJnbWdydzFmK1NZOTZZeVBuOUhEYlEv?=
 =?utf-8?B?VUN4bmpvS3pPQjVUNUhpRVh5YWNHdGhWSGdSY0xBaEFXMkpGcHUrOFJGdXY5?=
 =?utf-8?B?VWRvR1dNZjRkdE1YUzIxQzd6akd5NXJ4ZlF4Wkx6dHNkdTA2UWRxakNObFYz?=
 =?utf-8?B?ZTJ4TndPMG5lMk1zN0JkTjlFM1pBMysvRHV0Z3liY2VXMDFuWEt4VTdnWkE4?=
 =?utf-8?B?UzNOREJuQ2tWUTQ1a05nZkluUEdrTHY2MUc1cDRUbXd0MmJia0c3cXkxbWND?=
 =?utf-8?B?VHdtOGdMUGEzYmZ0eW9ndlVvekIwandYVXVObEN2WDlsOUpqVnFKWmp6RmVD?=
 =?utf-8?B?SUc0a01idmFwY2xCNDYrRDRWMHNXVytFN3cwUWVNSGJEblhhcjNaZFAyTUN5?=
 =?utf-8?B?Q3hPcHhiaFJscFhQZ1ZXaS9HWlA2bnpTaEpVTzU1SDVFNzZjZXE1d3VGNHlC?=
 =?utf-8?B?c0hSV3Z2RFN0cC81UEsxV0RHSlBxNGEybFdZZy9sWVptUnFQNFFyUW1zYlpz?=
 =?utf-8?B?M3N1Q3dnWmllS0w5MlZndlVZeGZsa01PRGRNZHlUUUt2UzZSbXhndDd3Z3pK?=
 =?utf-8?B?MEZONlVaS3F2RHY4cHBUMnpFSW96a1g4dlRkSWlNL3lPK1NsMnN6ZE1MYnI4?=
 =?utf-8?B?ejlrcFIzVFdGbkg4cEsrYlJvVEpHTFNDSXh0MUlnR2MzUGFudWN5ZXRIS0hh?=
 =?utf-8?B?NmRDbzFiOGp4L1dVUEk2TlJCdjhXOEM3T3VSaHlncFV3UGhNQ1JnSnhWWkxk?=
 =?utf-8?B?QUZ4VHBsaERySnVlSy9DemEwdTRDbjE5Mi91ZGRzMG1mUTF4dmNvUi92dW1V?=
 =?utf-8?B?Z2tFNWlGSXJhUWRVemw5bzZmQ1lubTU3eVdEK0doakRzbUxYcVBRQitnNWNP?=
 =?utf-8?B?d1VrODlzeXRqa3drVUhxRGoxMHJ0Y2U1NTN4ZXNBRGpBZlRacmYrZ2lRa0Vo?=
 =?utf-8?B?R2YrTjhpWjNCYXZpTE81NXF6VE5Wd2puOS9ZUUZqRi81Q0NmU1BGWEZCaFBM?=
 =?utf-8?B?cTRTQ0ZoL0lZUFpuYklFS2U0b0p0TUxRdzFhV2IzSDdVVXUyaktGYzBWMXpD?=
 =?utf-8?B?WFRPMlNIem1OZkwvRmZWdk9LWmVYUXNTVTV5UG8yRkIyMmlCMmkrYWlsR0lE?=
 =?utf-8?B?cGk1WWt5R2JXbjQ2TEpGUFF3MDNCeENiR1BPMnVNS21oOTdJVUp1VDgzd3dS?=
 =?utf-8?Q?iE9g2JdR5/2NFmE9VazT8KQu4b3ky4PEEtFUEjkBS+Nu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b987d30-a074-4d46-9676-08ddf1b7be98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:49:23.6891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdcxWec91nFVgWU54n9LNNp+qAeTjlPGtAZudeIA9kq4ctZJJCC6hB9DHz8pChT90cd7AB53HY7Sg4IT7nwJtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6791
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

On 9/11/25 22:52, David Hildenbrand wrote:
> On 11.09.25 14:49, Balbir Singh wrote:
>> On 9/11/25 21:45, David Hildenbrand wrote:
>>> On 08.09.25 02:04, Balbir Singh wrote:
>>>> Add routines to support allocation of large order zone device folios
>>>> and helper functions for zone device folios, to check if a folio is
>>>> device private and helpers for setting zone device data.
>>>>
>>>> When large folios are used, the existing page_free() callback in
>>>> pgmap is called when the folio is freed, this is true for both
>>>> PAGE_SIZE and higher order pages.
>>>>
>>>> Zone device private large folios do not support deferred split and
>>>> scan like normal THP folios.
>>>>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> ---
>>>
>>> You missed my comments of this patch in v3.
>>>
>>
>> Hi, David
>>
>> Looks I missed your comments, just checked those were largely about alignment and
>> integrating the code for DEVICE_COHERENT and DEVICE_PRIVATE cases into similar looking
>> bits for zone device folio free and code-alignment. I'll take a look and update as needed.
> 
> Yes, and the confusing folio->mapping = NULL that I cannot connect to THP support.
> 

I can remove that, let me reunify those bits, seems relatively straight forward

Balbir


