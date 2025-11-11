Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF0C50186
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 00:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3A610E0CB;
	Tue, 11 Nov 2025 23:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MFBiiBEd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010043.outbound.protection.outlook.com [52.101.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 189CB10E0CB
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 23:52:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw2C+Ac3h/K7moAzy1jdP2xWpgvT4+8ryfk3rjxL8Dr+NrmrthCDc7Hm7w2xeZ0RIpIEKevGvdjAn6w+Nafgv8u+QyKYdHbCLtzmROFi+RDhPhG3FjIgLaLaYYPa4JPj6GoioRaVzjvnLEotNQTSI0HAOGi2LJ1L1i731BXT4AT2CVBlLGBzipyJRe0tXsxrRczc1avWPmks+AazFVLQgl8RsZX2vHPHM6jTasOf+nkrW5BA/jmPiw0H9HX8DINzuieHcVqMvmppIkvEdvUifNN8m8dX6dUkiRqySGuP8WKu5oCq8dEFYWcgHT1iDcsDNlLJcPUVZnF1eg9qEq2YgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLAw/sBLo7V65K2+ajGUqGg2JbU6Xi5TdAZsZwg89Xc=;
 b=nTl/SFWwcXBYuqbcqhTqMPoTxewn3Ivyaz6Xm4bGKrJAJZSDV1XzhaojTCDFeIIuvjw7ADX6HeomrqEH/u5zPTiI9gC+w4vwpAh9GTvMhVLvKMUnR0zT/nh23cVFwWi61euRfIW4as9LxL3MyH2DT/TTWoGrV9JtOxFmv9hkea/b4vgfgFj1ucMEESElcHCCyhReqPnKlxx83kQEio0gBq1gepitgyVIAvRzJlS734cEVEbmEfyW1NeTXDN4KnGut34McqYVb+T6X7UJZtkQDrn42P6SHWXOsy10umSaGKJ4n9Dy4alGWxk6NUNppVYq2135E+jh0+fp5lg1vQvLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLAw/sBLo7V65K2+ajGUqGg2JbU6Xi5TdAZsZwg89Xc=;
 b=MFBiiBEd1dI/bK5VQJQa+XnGt6jjYdtLDvei/LtVGnZncswcfHS88RcJ6tDUrypaMQOP7jFSI9uXoY0Bk2ecZH2VjLArWKf4SS9dXf1xNbSV1NOndMmVR3P2Owp1PhJDuDshgdMDPazIoY8jxRDAkF7fuqPpHyScWTvbG4Qs7/Fzmi0SMpgyUteSOvweu96haTiImH7XvYWANseYrWECf7fZddwflx+c0IzkVVQ52WTIZSHPP3trJL6ECr5lsKDSBWbulbXAliOtzCz/NwcURuG1EkJn9Daf5KlFikoBkI5+Lnl7F3jKYIm8AWOdh/370jKZPbkk8/OfEcuMQk1qHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS7PR12MB5840.namprd12.prod.outlook.com (2603:10b6:8:7b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 23:52:51 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 23:52:51 +0000
Message-ID: <7a0f2704-80b5-4cbd-8f3b-ac03692eefd3@nvidia.com>
Date: Wed, 12 Nov 2025 10:52:43 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 00/16] mm: support device-private THP
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
 <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
 <aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com>
 <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251111154326.bc48466a6962fbbffd8ebdd0@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS7PR12MB5840:EE_
X-MS-Office365-Filtering-Correlation-Id: d8953ef2-9c95-4d2e-fb88-08de217d6c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXFLcGNPSHpyN0diamFISjljTS9UdGhrTXEwSDFpWk02WTQvOSt6TlZZYm1w?=
 =?utf-8?B?bnM1amk3Yy9UaWpuU0ljMHNTazY5TFVvem9tYmRoeWgzdThSU25PWXNsWnIx?=
 =?utf-8?B?MGRqdGtEcThwSkN3bDdpbDI3ZXE4YjU4STQrY3pRT2k3MlRBNVZ5eHlJcWk5?=
 =?utf-8?B?VTBnQS85LzY0OVRVOVNKbHYwemxxWjFUSnk0RUxiQXNRdUl1WVdmcEtERTl6?=
 =?utf-8?B?N3YzaFl2OVhHQmFicXNsRnZTNXo5K0NBSFdibzhKTi9KRXRlckxtRENpejEw?=
 =?utf-8?B?VENmbFIvYWc4QW4wcG8zbUJTK0hJbXBTajZnNGt5bG5EVmZOYUlRcTQ4MVpL?=
 =?utf-8?B?L3RleXd3TWdzV2lpY1c5d29YM2h3ZGpVR1VpNmNwUkREaW1ieGhCTWpTMXVs?=
 =?utf-8?B?dkpwcDk4eUxuU3lUL1RlaWxWWnFPUFNLZEpZSFU1VllCNlEwQkpmeEdkK3Bh?=
 =?utf-8?B?V2t3WEdGc05GM3Qwb2xmMWJXdHFkUlVJcFlnU1BJMGpIN211bEo0VlhMZjhi?=
 =?utf-8?B?LzB0ZlplTW1yWEd6UTRmYzVodEdCRm43eldxdW1FRHQ4WlFKL1Z6UzhVbS9i?=
 =?utf-8?B?T0xSTjdSMnQvWVJ5bVZxSEI2VXY0bTdOblNsUFNmWWQzaHRqQjFXc3JacHN1?=
 =?utf-8?B?VStoUVJHZWlxWms0WlNuZFlOdFBNNk5zVENuRGNHYkhKVm9xaXZiMDRBQ1V3?=
 =?utf-8?B?VkxISWxFbXRqckxMMGpsYVppL3RmdW9sTWxNUW9PaEpvTWdrdGhvcGYwVnh5?=
 =?utf-8?B?cWNkZGxBUmIrbnVNVWJXT0k3bHVydUtqcmVUUmhkeTVCck51ZWNTdnErdGFT?=
 =?utf-8?B?UnVUdktvenRrcFJhR1Z5Yk9RbkR6b2RISlg4TWo5bFNYR0d5OHh4NWJzTDk4?=
 =?utf-8?B?eDRNQkg5aU1zSlVlWHNZTGxSVHRmbFd0dzlNK2NUZC9NM05uaG9OS1ZJOG9p?=
 =?utf-8?B?eDltbXBpNUVvSU0vaVlxR0g5cFlaeWRNRXRVcktyZzJuVzVQNXBRVmk2VTM5?=
 =?utf-8?B?VjJQNHBlbVV5WElzai9NRno1a2NXSUhZWDRIZ1FJTHFkQXRGTlVFaVJUeUI3?=
 =?utf-8?B?N2lNUGtDOGk2RUN3eEdGTTBPczdOWXE3L3JPTGE2NkRncmtDdEZPazV0Z1BD?=
 =?utf-8?B?TVNuNlhRTE0rTVNwa0ZoOVo4SzRWL2VQK3hGVmZnUEp4ZkNoT0IzY211c2RZ?=
 =?utf-8?B?SFJpdmRKdDZYWTNvWDJ6ODRCTVptYjVkK2xXVDhlM1dZWEtLUFRoVVgvOER6?=
 =?utf-8?B?RnNWMW9HVlNrTUNJUUx1cEdYbHhmdkEzMVJ4WHdCOGhZV3JTNk5lZ2thM2dr?=
 =?utf-8?B?YWtpc1VuakhMTm9tVFpXK1c5SXlVcGVvbW9zZzF3LzQ4WCsrOWF4QStsVHFY?=
 =?utf-8?B?SjVydDNQUXFpLzFUdE5TbDhZSDdkZWtENkNERXRNeVdEZ21lNWRrWkl0YXVS?=
 =?utf-8?B?YnhmYjB2V1BsUE96OU15bmhkQnRKK25TMjhJUHdMczVWQzZTN01Cc2VtVzJ5?=
 =?utf-8?B?MzNSVHgzWXROOVk3b1hOWDZEekpBYzUrUUhNRjJTb0ZxMVZNbmZHSEcyYkx6?=
 =?utf-8?B?VHNab3lCeXVsZlJxMFliM1R2N1U5K3p6ZnAwcVFudVlNNW9hamJDUnRCMkxs?=
 =?utf-8?B?RlVlWHF3NzZab1FpaGRvY0I4ODlLM29Ja0dKbXRMakxobFJ6cXZrVEJQeGRU?=
 =?utf-8?B?Z05GcHowNGY1UDQ2dHd0L2JPOGp2cDd5aFBmSm1kVnZHbDV1V2FsRkdXQUVj?=
 =?utf-8?B?RW9nUzFHdWtCNTZYY1R6aXREaHBCZFZKcnBRVmxEL25hRW5FYVVrMlNNVEY0?=
 =?utf-8?B?MzFlUGVMRmNhYXo1MlBPYnBNQTEvQk9IbWRVTG5oNlJWenhQU1g5dFJCZEds?=
 =?utf-8?B?Y0srOHU4YXdDcWNKU3cvYW1BNjQ4elVsRXNLUjJzc3NmaXJ1SjdVMitYVGZq?=
 =?utf-8?B?S0w1OURqaERSalJyWE5pZGJZVjdsbGgwa2dnMnp2UWcwU05BVmxBNmk1VHho?=
 =?utf-8?B?YkRCMDBmVEx3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3ErN3BIOVZ1b0dQYnloVWJDcmcxZTN4WUlNK2FWeXIyZ2pDUVo5b3BmTEF4?=
 =?utf-8?B?RG5pN2xMYmNrT3JNZlhXa3o5Tms5RUlFUXVHbXBjR3BtY2hIak5RdmFqbEEx?=
 =?utf-8?B?cG0vN2txUE9YM3hoYlJnRVRwenhJdlhpeHlJTTB5ZGUrUlhUR3FZUjl0Qkp4?=
 =?utf-8?B?Q3o3MGhBSTlxYWtxZWpyQi95ZXlPaGpzZk5XU05oVUhVbzhNR0laU1FxR2xC?=
 =?utf-8?B?YTkxSTFJb0M4anJ3dkNWN0NOa2VCMi9xSDdjcktyckxBZVhvbGJhTnBFMkZE?=
 =?utf-8?B?R3NVOTUyUGxmVUJBbEJ0WjN6UTRoS2hnTFZTVWFKOWtKQi8xdEFtMXl0UXNG?=
 =?utf-8?B?QU5pMlZzVTA5b0JXK21ISHFaYk9vbGhyWjd1MU9oVi8ramd2bWZVaW9XYW1v?=
 =?utf-8?B?cmxtVDRVRzl2eU9LeERrY29nbjc0ZzJ0OTlTS0hGWnhnQTExTVAwQS8veEEv?=
 =?utf-8?B?TlNtMHVnRURySkFUblpGbUNvd2NJdm9QSUZzYVJCcEJrVWtjVW1YRXlUWmFk?=
 =?utf-8?B?bkdhdE13NjhieUdIRG0yRkNEVzlTU05IUndxTTFyTnowUkN4aWRKTFBWMVZ5?=
 =?utf-8?B?b1UzQzBJY0ZDVmQzVlFRKzVIMkZvbEtZVDlpUzBCWnlBRCtjRG1EVWc4RDBP?=
 =?utf-8?B?ZVFZODNKU3FyQVVGZVNjVDRFamd6TGVJdHpRTStIVkhIYWRnQnlMWjlyUnJB?=
 =?utf-8?B?T1F3dDdhWDNtdjNzN0l4YndmZ2RPS3dYc0FVOXpQbVlsWWlnOVRkK0F6OTJi?=
 =?utf-8?B?NmJobWtQREZKTWg1d1d2Qko2cXZ0U3RobkJoZ0pZSmhWaUN4YlNwbDR6ZU45?=
 =?utf-8?B?ODNZcTNGTmZaZmFrT1VEZkZLdVJvQ2tocXp3Q3E2eXUvNHNJNWt1YlpvSmly?=
 =?utf-8?B?QkM4dG90bU1WanR1Z1dWa0pxWEJHQzJUUjVuYUZCdUx3OWd4VjQ2Y0VOSXdp?=
 =?utf-8?B?bU50UUE0d3psWXJkT0FxNDYyU3Q5ckk0d3R4OFg3OGIrMmFyVm1qWXJrTFY2?=
 =?utf-8?B?UlJQWDB0MlRmSmtxYUtWc2FDVmJlZm0yNkJmcUYrdjR0TzQ4YURmd1lxTWlP?=
 =?utf-8?B?SllyaEpIbnZkRmNuQkNNOHgrS2ZrWnlGNldyNTk5ZUcra2JzSjBPOW0yTVAz?=
 =?utf-8?B?MlZmZkk5bDFtZDRJb0ZTdFZuVVd2NVRuUlowSzl6QTIwRVRDN1BZbTZGczRI?=
 =?utf-8?B?eHBoSTBtYWo0Sk1rUU5yVFhxSUFBUzBRaVBUNklrUzByMThEa1ZkMDRUNlRN?=
 =?utf-8?B?K1V0R2xGNjNKUTJ6Y3NPV3J1SXdsOGtDQzFVNzA1M052K1hFREFIN2Y0MG5i?=
 =?utf-8?B?KzhESkNDeUt1VmMxQ0lnUjRtM3piVGhkTVhvQ05qVmJubEZsVHpOS0F4N2I0?=
 =?utf-8?B?QlRsdWU3eWdSR3BxaFdNNzV0VFQvd0g2Rlprdm41UlhVU0VPNlRHNWtPSWdq?=
 =?utf-8?B?cTJuZU5aMTVWN0ozc2tacVZhTzFxM2FhakJvNEttYXhHamxnVXlIVm9udWdR?=
 =?utf-8?B?MTJWdGlzMGFCQjVZU212V2NFN3pJSnJrWVhuVnl2RjdQR2N1UUxhRU14VFZ3?=
 =?utf-8?B?TlpuaHNqTmRrbTRmc0ttZjVqd3lUeTlHSm15dlFwcUp3eEV3YitxTGQ4Ty94?=
 =?utf-8?B?TGdlbEYwQnJQZGNEeVBiOG1pSWgrL0c3WTFCN2l6R0dDYm1pNi9HVU01L1pQ?=
 =?utf-8?B?ZnVMV0h3NU9ydGgxNnlwRG5uS1Nmd1VwbEpwZzliKzJub1RDVGNSc01LOHVQ?=
 =?utf-8?B?S0hLL0Vlb2g3cXE5cUs5WTIzUjQwZnJrSnBUYjB3cXVLUUxUbndKTWlnenc2?=
 =?utf-8?B?OFpSWHNnM01ia3IrdXp4MXZzd25LcFE4bWJmUFpFRGJaa2d6amJBSStIOVYy?=
 =?utf-8?B?TWtSYlBuNy9mR0prbnJudjc1aHlmU3BScFdIYzc2RkVlK3czTHJDd0p6WCtN?=
 =?utf-8?B?ZjU3NUhxZmhKQ05TcCtlRWdMQVZSUGF0Zkh4OW11SzBseXh5cWIrMUZqbTlD?=
 =?utf-8?B?YUVVYk4vSHFpNEJnRjZQM085MjR1ZjM4S0c0bERHNzlwSlRoeW1uNTRCcXNx?=
 =?utf-8?B?c3NjblN2WDc0K1lqMURIckFpLzE2UnVsdjF5a3FYTVpHNjVaVE4vOW9TOVZy?=
 =?utf-8?B?UENIekNGMU5jQ1BJdUVUa1lqYU96ek05djdOK1RKbC9HWWhmTzNwL1B2SWlD?=
 =?utf-8?Q?zwGfXpElt4cmGWMt0F++Q14O/PhkfavXyesTDUnVJDwu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8953ef2-9c95-4d2e-fb88-08de217d6c78
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 23:52:50.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RI5wVlmNnMTb6rF0+/PE1fEmK+3leyLuOUp9VdIQJk4h9An8Hi+YyvndghhFQQanXE6vl8uzpKgOOIi7rAKxlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5840
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

On 11/12/25 10:43, Andrew Morton wrote:
> On Thu, 9 Oct 2025 03:33:33 -0700 Matthew Brost <matthew.brost@intel.com> wrote:
> 
>>>>> This patch series introduces support for Transparent Huge Page
>>>>> (THP) migration in zone device-private memory. The implementation enables
>>>>> efficient migration of large folios between system memory and
>>>>> device-private memory
>>>>
>>>> Lots of chatter for the v6 series, but none for v7.  I hope that's a
>>>> good sign.
>>>>
>>>
>>> I hope so too, I've tried to address the comments in v6.
>>>
>>
>> Circling back to this series, we will itegrate and test this version.
> 
> How'd it go?
> 
> Balbir, what's the status here?  It's been a month and this series
> still has a "needs a new version" feeling to it.  If so, very soon
> please.
> 

I don't think this needs a new revision, I've been testing frequently
at my end to see if I can catch any regressions. I have a patch update for
mm-migrate_device-add-thp-splitting-during-migration.patch, it can be applied
on top or I can send a new version of the patch. I was waiting
on any feedback before I sent the patch out, but I'll do it now.

> TODOs which I have noted are
> 
> https://lkml.kernel.org/r/aOePfeoDuRW+prFq@lstrano-desk.jf.intel.com

This was a clarification on the HMM patch mentioned in the changelog

> https://lkml.kernel.org/r/CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com

That's a minor comment on not using a temporary declaration, I don't think we need it, let me know if you feel strongly

> https://lkml.kernel.org/r/D2A4B724-E5EF-46D3-9D3F-EBAD9B22371E@nvidia.com

I have a patch for this, which I posted, I can do an update and resend it if required (the one mentioned above)

> https://lkml.kernel.org/r/62073ca1-5bb6-49e8-b8d4-447c5e0e582e@
> 

I can't seem to open this

> plus a general re-read of the
> mm-migrate_device-add-thp-splitting-during-migration.patch review
> discussion.
> 
That's the patch I have

Thanks for following up
Balbir
