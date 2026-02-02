Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Z+2vAZvrf2lV0QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 01:11:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4508DC79C7
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 01:11:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC0810E1F6;
	Mon,  2 Feb 2026 00:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="giHS0SPc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1504D10E170;
 Mon,  2 Feb 2026 00:11:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8CD07XwNCORzHaJVgvuwOQg/3yl5GUGsiH76N2K/CEqbgqWQNZqXiQf+cgqZnfEVPGeRfOQo+I5OmS2R5rP5nUziio3Bu71kdq7T9a0vhJOyKN+eKG6WkNV0NqRGEULFYKmMa2CI5b0KNOBcwjckb/jEuEVLmoXW0OjlS+3ophfkMeNFg3bMSFPnRw1H1VmdN9V9SmDcKI5M3oSoSlWN+9vPMb8+Rcj9zssup15e/Ltzgh8TkoicXQIE/R7ObcVqfij4tl1AYWuOlghE/zbD/LnarOBbA3oJNprLSHZlBT6pj6XFmJtbG5H3sLXD9DkU/Hp2WoFmE2Jhq6gxdhFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsd7jPD6ZjFBCn7fkvogP89ZnsfSBNff77AG/hw9rFU=;
 b=D/ZmmEM1UsV5YTatsgQgQ2Itku8K34m57ClvT4CkzVCuxN3N8XIktEJDuVoyefvxb5BVEsAkhaUbV/qdrv01ukxcul3P2hMHnuYrLrHZ+1JgdJ3OoXJKvSVM4P0DCEz35ReAXLHbbGieaAyk0UOKGT6b27WXZptaHizfyyijyDW5ejkE3MP5Msz68RhrKBY9QqaC5zRsFEGCifqgGrsvnUXRIlJTqVe9jBMDCmPk1IinwAQizQ1t/cIrv068uvP5ADHc9YtR81mbOw9thCYkQNYCi10LfsuE4cGhsWYB/r2S3406hogdKa7QX9CQauvSCHpRxDNWuUGe+2LL6rQxFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsd7jPD6ZjFBCn7fkvogP89ZnsfSBNff77AG/hw9rFU=;
 b=giHS0SPcBelz6JPN2Itls6urN2MHyUC7EBhDEMjjIa7RYTvGXivzL7FtBbq9Ih7DfJh21jrn8EcEJPQKEYSX42HKROb6I1xQeZWFDks13wa3MsaqI4qm17QoBwTux5zuJfhCYpWCXXeMft3FvMajhH5N9P+hIoa2vnv6Tgq/KVjMNVtSabbqt/adVt7/QTR20Txudv6OD6Xcsh/HPyKd3ogONOpb7MyT/VfGcaVodLfANrTUPoYqpgYsFNwHlTLdyGpO1RLzqBlHXm7NJY5ACIyc9PYgoXNdQ31ESLSYp+NKCfOYDR9tV8wkkybvrky8dTg5tYLTW2K+tqpUw3m9Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB6655.namprd12.prod.outlook.com (2603:10b6:8:d0::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.16; Mon, 2 Feb 2026 00:10:56 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%7]) with mapi id 15.20.9564.014; Mon, 2 Feb 2026
 00:10:55 +0000
Date: Mon, 2 Feb 2026 11:10:50 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 intel-xe@lists.freedesktop.org, Ralph Campbell <rcampbell@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 linux-mm@kvack.org, 
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] mm/hmm: Fix a hmm_range_fault() livelock / starvation
 problem
Message-ID: <lbqqmohxpeynsrunbdyvod2fm4tinzq5coueh2mq6weubste5x@y4f5weqvwszg>
References: <20260130144529.79909-1-thomas.hellstrom@linux.intel.com>
 <20260130100013.fb1ce1cd5bd7a440087c7b37@linux-foundation.org>
 <57fd7f99-fa21-41eb-b484-56778ded457a@nvidia.com>
 <2d96c9318f2a5fc594dc6b4772b6ce7017a45ad9.camel@linux.intel.com>
 <aX5RQBxYB029/dkt@lstrano-desk.jf.intel.com>
 <0025ee21-2a6c-4c6e-a49a-2df525d3faa1@nvidia.com>
 <aX+oUorOWPt1xbgw@lstrano-desk.jf.intel.com>
 <81b9ffa6-7624-4ab0-89b7-5502bc6c711a@nvidia.com>
 <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aX/AgHAZ7Tl4iOua@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SY5P282CA0197.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:249::10) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB6655:EE_
X-MS-Office365-Filtering-Correlation-Id: eceaf0e8-84fc-4db2-7c8f-08de61ef88c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGxBY2tnaGkxMUhqWXRLSFc1Vlo2TjFPb0V5VjY1ZTY4b1ZlSFBhR0l0ZG1S?=
 =?utf-8?B?dmZhQ2F0YTU4RktUWlBocWU4UzVwZFZNdDhXOE5PNk5JNHlNRDhvTFh4bjBH?=
 =?utf-8?B?aHlhbEFSSU5DVVlVRnZ6MEJjV3RxNjloNjVPSWZNNkpRQm4wQWFTTWQvSUJR?=
 =?utf-8?B?dDYwTEhxRHRTempLVmJMVnBjdTF4a2k1dWx5NjQvblJiODN2eER1NHN2Z2pP?=
 =?utf-8?B?OE42d1JacWk0NlQ1a1h5VzhpSll5T3FzTFc5U2hvRURpd2ZycXByZ3JMWTRO?=
 =?utf-8?B?RXhpVEtEOVNwSldUbTdPQTl3SU5TL2RaVFRQd2ZkQzZXRS9jN1ZjRDM3M1Zl?=
 =?utf-8?B?eDM2dnBFd2lPRHJTRDFDN3FtTzBmT0xRMi8rcFNWMXNjUGxNaXgwazZKNDIv?=
 =?utf-8?B?UmNVWFRCT05LSTlCK0U3a2g0VFBjRGtiTHFMNENqa3JzdmxkeWx5WHA3YXZ2?=
 =?utf-8?B?QnpJU3VhS3pmZ2RHNEVXY0dsZ2xnYmpEcWxQUkdjWW1UREx0a2crV2E1ODdo?=
 =?utf-8?B?bTJQVW9RaDZQSGFuSktlQnAwZW1NbDdmaTBYMElIa3lKRGZJZHR0LzBLRzZS?=
 =?utf-8?B?c2hKQkwrUURBaWtCbWo5ZlRVb1VidDFmZHBqL3kySE5lT1dJbWFpVExBQjBp?=
 =?utf-8?B?bnB4V09FMGxBeCtaREdDY3pWOGZ1QjFCN1lPemZjcHl4WGdBeDBCcXU3bFo5?=
 =?utf-8?B?UGNqN3V4YjZ6U3h1QmZscnVHTCtSSjFXL3lGUHFGOHJMZFVGRjBSNWVKZDEr?=
 =?utf-8?B?TnNOeU13a2lrY0VQWVlCUTNWL2d6R2RTV2Y3aENFeGdONGR6YnA2WWcwbnh6?=
 =?utf-8?B?MTB0cmZiMEVGWHBtblgwbVJNZmg0NGxzbnkxQ082aEk1M0N1WFdWQzlJeGth?=
 =?utf-8?B?czZnaWJ1OUZFVjQ4VmlBbWl0dVg4aTFkdnV5Y3k1YjZxMzA3ejJ2Z0w5QnRI?=
 =?utf-8?B?MnlCanZOcDRHMWFXbjNHTzhmTFRHRkxmQUpBWk1aQWhVRTR3RzNaQWVndVdC?=
 =?utf-8?B?ZUJobFJlcUplN2FkcHh6a1krdm9pbVROSnZLZWpmSUU4d3ZDSVZWZTdNRlNE?=
 =?utf-8?B?KzNjMEpoaTdsdnlwZWpUWUIrcVNYSjFxalpTZVFvSFAxSGZaMDdiMFA4YnlU?=
 =?utf-8?B?R2pxRlVBZGJsZDQ0Y3U2U24vS0tWM0Q2aGYyZUx6N2w1a1RGczNnRUpGSUNI?=
 =?utf-8?B?KzZCTDZ3L3kyblgxZHpta21BWk5oYldITlhlOUxDeEpSUklCbTRPbk1FSHZQ?=
 =?utf-8?B?bGM0QUprdXo2eU1jNTNXekY4NEVjL1lQS1RRaUM1VWQwZ1g5M0YyWldqZi9C?=
 =?utf-8?B?Q3Z6WVRyQlFrM3Bnczh4Ty8xc3dPU2pvTVptZFdXd3dHYnNydUJMOENWN3Bk?=
 =?utf-8?B?SVRlb2RJUlBCbkx6Y09PanBVREUwRXlYYlNoaDdzSHVQKyszc0pJN0dZK1o3?=
 =?utf-8?B?VUJwcE4zZTUvOXZhc2twOW5aRGxjYXhrK0JkRXZMWVJSZ2pvdVE5SDJ6bVN4?=
 =?utf-8?B?S3cxejJMM09rTnVrS0tPWWJCR3NTRHVIckordk4wN1lmQjAreVhXV3RPWmlN?=
 =?utf-8?B?RHI2cUlNVmx5MVpkOElvZ1Z6bjhkTEZhMytZbmxFQ3hxNU5IeWYvUHRZeWkz?=
 =?utf-8?B?dFZOV1pPR25PNTZwOERrRFdGZWZCekRsN1haQlVMR2dGSCt1K0lzUno0aE9k?=
 =?utf-8?B?Y0pJWTZUUmJTNEp4N1ZmWjdSVnRSYWRKZ3dQTm14a2JoTkdOWHhGRzJPKzRy?=
 =?utf-8?B?bGxaMUNab21mVUtoK0Y0eFdpTzkrZGlCL096c3BaUHhrN0paT0t6RHdRY2o5?=
 =?utf-8?B?TmlrcU8yVTFMMnB3ODFvWGd4TXc2a0ZGaE5QblF1Qk9kanRYcFBseFRnVGtM?=
 =?utf-8?B?SGxnc3ZWUlgxck9iZ01xZnV6eEhCd3JvaWMwa3c5NWRMa3U4RWJKVlBuSmZL?=
 =?utf-8?B?YjVFL3Z1bzlVRXNOMXVhNGhmUkJ5S0JhOTFpSGtLTXZHb215cFFGN3BYZXI2?=
 =?utf-8?B?Y2pQQk8vOHF5bXNwRDhkWmJLUTg4RVhwUVB5QkVBaUREUy8veUwrekdZekRI?=
 =?utf-8?B?SWVLVTBzRjlkWWl3TUphazQ0WllOTXdnejdPWGdtMXNiNkVraVhEYS94ZlhJ?=
 =?utf-8?Q?rA0Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdvQ3NBWjNOdUpIa3pnc2h5a3ZLUCtUME51V2kxZE80cWdQM3NyRzlvc0tq?=
 =?utf-8?B?SlZ2Wk1SRkc2NXM2Sk41WkhLZWU4SXRVVE51N0NMbjZVa3kzdHNVN0FqT2JV?=
 =?utf-8?B?WVBJQU1CMGFVRTZKS2dhczR4UkxUdE8rMzAxYml6bGZCdFhTSWRFMERCU1hV?=
 =?utf-8?B?Z1oyOVk2VG9Pa1ZIVHRLV2dyYXZTckcvaE1PaW9vQUhHWndMRGF0OUt1Tlk5?=
 =?utf-8?B?QzdjcnFycGxEcFpwSTNObmxEcmM0T0lsSDlkWmZhSWpJUmRrKzNiYTVQSjRS?=
 =?utf-8?B?M3JUTkttU2xUc1l1dGFXTEJGS0w1UkxocW15c3JTMnBINk5TT3VtTXV1VGxI?=
 =?utf-8?B?KzVEcmlPS0U0cUEyYldURW1BUVFyS0NTd3dUVEdtTVFTRnZ0bko3VmhMNXJo?=
 =?utf-8?B?eDl0YUhXaWZUaWduNDl3dFdLMlRJMk9raThxaXkwRTNWRjV2Rm11dFZBYW8v?=
 =?utf-8?B?cm9sa0dPTXVNbVYxT0VCN3loaVQ0cWs4TWJERkpHN1hlOGdSdjVCNktNb2FB?=
 =?utf-8?B?UEVCUUZJSCtOcXNiKzlGVlNmRVR3RUpnVTd0RVZxRGxDV0hEdFNYMDNETzFx?=
 =?utf-8?B?UkV3bWw0YjJVVitGaUdiS2ltc0JJUUZPSCsxTVRGckxnek1YSFZMdjg2YXpm?=
 =?utf-8?B?eXREdGMreERuRitlSFBlOXZhSGxtaWN4amg3RWRjU2NqZWl4MlA0VE9TN1pz?=
 =?utf-8?B?Tng0Ym1oZHoxbEE0UDc4UFFqVGVKY0ZaQWIxRHBreDkzL3hoY3A1YmFHdXZu?=
 =?utf-8?B?WEI5KzludUI0L2tqckkvc1FySnhHRXlnbDJ0VGI5QlE3WE1XVzErMmh3bnY5?=
 =?utf-8?B?SDFiM2NwTXUwOWlWRWFpN2hUNnRWeDB3cDl4SWZ0a1NJVUc2OU9rbkJaUzR6?=
 =?utf-8?B?dzlSbEpSVWZReXRjT3JxYVdMNUg1bnErS3dGaUp6akFRT2Jabzl3R1lpM0t4?=
 =?utf-8?B?Q2VaSWx1ZUZUZ1puVDhvOUszVlAyYitmT3IwOWVXUmtPOFVzbFRjdkhLelVp?=
 =?utf-8?B?WjJZblE3Umk1OVZ3TXZMLzUwU3lQNlVTMDVUeCt6ampyQS9aUzlNN2xHTDY4?=
 =?utf-8?B?UVVMY3RQTHJ4dnZQdUNmdGdkRTNOc0p0YWQyWGkreUFaVHRlQitZRW92WXBu?=
 =?utf-8?B?UWR4N09GK1RXVDlRVDljc003UkoxZytZVGJ5RDhQK1hzY0tmWjAxN2FTMGIx?=
 =?utf-8?B?TXBnSExjelA2cmllQjdyaWczem9HbThDWEtKYnJNcUFWREFFbFEvMWkwUTVG?=
 =?utf-8?B?UWViM2NaN2lOa2JvTDZxQnNYc0ZKUXZJZXJGbVN1cVZZL2VvUmVOb1lWMnJa?=
 =?utf-8?B?WGwyU1gyQTF0ZFpaZi9BMm1taHlVTm40UyswR001RGIySURPb3BwTmp2N2JD?=
 =?utf-8?B?Q0RxMVc3eHN6c1ZpZ1dJRUhqSVFaY1pVbXVWSmx0amR3SFJBTkZnTUx4YzhH?=
 =?utf-8?B?bytDZFdhSndIemhpK2t3Z3pLbEZVY2lqbERUeThmY2N4clgxVS9aeHpjQWxX?=
 =?utf-8?B?ZDFJRmxLZDNnMW84TUhMVy9EYVF3ZG9sbzlmanFkTFRBNjdXMUNCcTc0YmFz?=
 =?utf-8?B?dWduN3AzVWx3dk55ZWlhc1NCc0RIanR1cDByTTBzWWF0QTFWc3NpcjBZZGlJ?=
 =?utf-8?B?TzBROW9CS1E0dDIvMTFMS1dMbmVHemM0VFBYdkt4cTJpc0U0WW5zTURiYzhU?=
 =?utf-8?B?RVFnTDhIWE9YZng3WWxvWE1LRHBsVi9iODcvUENCQ1FVR1ZKRndKNkFGVXoy?=
 =?utf-8?B?MFczcXRNM0xKWmhvZEcvVCtQcWRKeUUxRHJ2TkwrZnNVMzcyY1M0WGJNY2ti?=
 =?utf-8?B?QTdnMGhQUk5obzQ5Wk14Q0hNZXB5Z0JyeDIwdnRwZnJtbFJPdGlUNjBBQmF4?=
 =?utf-8?B?R21LUHoyVmhSZGVVTUFrbjJ6MmFMTzZaVEdYMDR3L2JIZkp6WmNpY0lxU05D?=
 =?utf-8?B?Q2NjMFNPVzU2NlBKbzBvMDJLTDBadkVNQ1BiYWNDdWlzWjByZ3JXa1VyMnZk?=
 =?utf-8?B?S2xMWWNXeTNnaDJjRGNBUVdwcFRkU1JRMHMrMXhDNWNHSDg2VTJvSG91ZFVE?=
 =?utf-8?B?MWYyRHM0eTJ1WnNRZHhObU5KYWwwMzAvMDJQOUQ5NU1CNngwZGVxS1o2cW4w?=
 =?utf-8?B?TmpnSHZneHhpNjhNRVl0b3d4WUxkbStuSmRkVHdjdWdVVTV5SXBhaVpwTGZH?=
 =?utf-8?B?VWhaYXpFTGFzR054SzQ1R1pieHErNjZteVFadU5yYUhiRlJPVmdqeGVDM21q?=
 =?utf-8?B?dGhsUzNVcEVJZkVHbVJQaDJwcnZPTFduVFVERWROSFRPL2dIcEdJT3lNak5P?=
 =?utf-8?B?bG5aZzU0c3FMWEZHMDBOdVN6YTJsc0kzMnpNTHVHU3ZrWkNNV3Jldz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eceaf0e8-84fc-4db2-7c8f-08de61ef88c9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 00:10:55.4902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1aVJWeB7TEVGGHgPo8RDK7J/JEkgjp1pQIG+1XJq8eyUVqB879ZoFNoqrkTWGc/y/dYQMhfZWHakvGy5U6NqwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6655
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[apopple@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4508DC79C7
X-Rspamd-Action: no action

On 2026-02-02 at 08:07 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Sun, Feb 01, 2026 at 12:48:33PM -0800, John Hubbard wrote:
> > On 2/1/26 11:24 AM, Matthew Brost wrote:
> > > On Sat, Jan 31, 2026 at 01:42:20PM -0800, John Hubbard wrote:
> > > > On 1/31/26 11:00 AM, Matthew Brost wrote:
> > > > > On Sat, Jan 31, 2026 at 01:57:21PM +0100, Thomas Hellström wrote:
> > > > > > On Fri, 2026-01-30 at 19:01 -0800, John Hubbard wrote:
> > > > > > > On 1/30/26 10:00 AM, Andrew Morton wrote:
> > > > > > > > On Fri, 30 Jan 2026 15:45:29 +0100 Thomas Hellström wrote:
> > > > > > > ...
> > > > > I’m not convinced the folio refcount has any bearing if we can take a
> > > > > sleeping lock in do_swap_page, but perhaps I’m missing something.

I think the point of the trylock vs. lock is that if you can't immediately
lock the page then it's an indication the page is undergoing a migration.
In other words there's no point waiting for the lock and then trying to call
migrate_to_ram() as the page will have already moved by the time you acquire
the lock. Of course that just means you spin faulting until the page finally
migrates.

If I'm understanding the problem it sounds like we just want to sleep until the
migration is complete, ie. same as the migration entry path. We don't have a
device_private_entry_wait() function, but I don't think we need one, see below.

> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index da360a6eb8a4..1e7ccc4a1a6c 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >                          vmf->page = softleaf_to_page(entry);
> > >                          ret = remove_device_exclusive_entry(vmf);
> > >                  } else if (softleaf_is_device_private(entry)) {
> > > +                       struct dev_pagemap *pgmap;
> > > +
> > >                          if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> > >                                  /*
> > >                                   * migrate_to_ram is not yet ready to operate
> > > @@ -4670,21 +4672,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > >                                                          vmf->orig_pte)))
> > >                                  goto unlock;
> > > 
> > > -                       /*
> > > -                        * Get a page reference while we know the page can't be
> > > -                        * freed.
> > > -                        */
> > > -                       if (trylock_page(vmf->page)) {
> > > -                               struct dev_pagemap *pgmap;
> > > -
> > > -                               get_page(vmf->page);

At this point we:
1. Know the page needs to migrate
2. Have the page locked
3. Have a reference on the page
4. Have the PTL locked

Or in other words we have everything we need to install a migration entry,
so why not just do that? This thread would then proceed into migrate_to_ram()
having already done migrate_vma_collect_pmd() for the faulting page and any
other threads would just sleep in the wait on migration entry path until the
migration is complete, avoiding the livelock problem the trylock was introduced
for in 1afaeb8293c9a.

 - Alistair

> > > -                               pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +                       pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +                       lock_page(vmf->page);
> > > +                       if (get_page_unless_zero(vmf->page)) {
> > 
> > I think this ordering has a problem, because it releases the PTL before
> > getting a refcount. That allows another thread to free the page, and
> 
> Yes, I reasoned that this could be a problem too after thinking about it
> a bit more. The issue with taking a refcount without the lock is that
> we’re back to the livelock problem that was solved here:
> 
> git format-patch -1 1afaeb8293c9a
> 
> > then the lock_page() call here will be doing a use-after-free.
> > 
> 
> I don’t think it’s a use-after-free per se; rather, the page could have
> moved and been reallocated. If the same_pte check were moved under the
> page lock, I think it would largely solve that, but if the page were
> reallocated as a larger folio, the page lock might collide with the
> folio-order bit encoding and hang forever. This is likely extremely hard
> to hit, as you’d need multiple threads faulting the same page plus the
> driver reallocating the page as a folio at the same time, but
> nonetheless it could be a problem.
> 
> So maybe back to drawing board...
> 
> Matt
> 
> > That's why I reversed the order of those, and then as a result the
> > get_page_unless_zero() also becomes unnecessary.
> > 
> > >                                  pgmap = page_pgmap(vmf->page);
> > >                                  ret = pgmap->ops->migrate_to_ram(vmf);
> > >                                  unlock_page(vmf->page);
> > >                                  put_page(vmf->page);
> > >                          } else {
> > > -                               pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > +                               unlock_page(vmf->page);
> > >                          }
> > >                  } else if (softleaf_is_hwpoison(entry)) {
> > >                          ret = VM_FAULT_HWPOISON;
> > > 
> > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > index da360a6eb8a4..af73430e7888 100644
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@ -4652,6 +4652,8 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > >   			vmf->page = softleaf_to_page(entry);
> > > >   			ret = remove_device_exclusive_entry(vmf);
> > > >   		} else if (softleaf_is_device_private(entry)) {
> > > > +			struct dev_pagemap *pgmap;
> > > > +
> > > >   			if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
> > > >   				/*
> > > >   				 * migrate_to_ram is not yet ready to operate
> > > > @@ -4674,18 +4676,13 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
> > > >   			 * Get a page reference while we know the page can't be
> > > >   			 * freed.
> > > >   			 */
> > > > -			if (trylock_page(vmf->page)) {
> > > > -				struct dev_pagemap *pgmap;
> > > > -
> > > > -				get_page(vmf->page);
> > > > -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > -				pgmap = page_pgmap(vmf->page);
> > > > -				ret = pgmap->ops->migrate_to_ram(vmf);
> > > > -				unlock_page(vmf->page);
> > > > -				put_page(vmf->page);
> > > > -			} else {
> > > > -				pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > -			}
> > > > +			get_page(vmf->page);
> > > > +			pte_unmap_unlock(vmf->pte, vmf->ptl);
> > > > +			lock_page(vmf->page);
> > > > +			pgmap = page_pgmap(vmf->page);
> > > > +			ret = pgmap->ops->migrate_to_ram(vmf);
> > > > +			unlock_page(vmf->page);
> > > > +			put_page(vmf->page);
> > > >   		} else if (softleaf_is_hwpoison(entry)) {
> > > >   			ret = VM_FAULT_HWPOISON;
> > > >   		} else if (softleaf_is_marker(entry)) {
> > > > 
> > > > > 
> > > > > > But it looks like an AR for us to try to check how bad
> > > > > > lru_cache_disable() really is. And perhaps compare with an
> > > > > > unconditional lru_add_drain_all() at migration start.
> > > > > > 
> > > > > > Does anybody know who would be able to tell whether a page refcount
> > > > > > still should block migration (like today) or whether that could
> > > > > > actually be relaxed to a page pincount?
> > > > 
> > > > Yes, it really should block migration, see my response above: both
> > > > pincount and refcount literally mean "do not move this page".
> > > > 
> > > > As an aside because it might help at some point, I'm just now testing a
> > > > tiny patchset that uses:
> > > > 
> > > >      wait_var_event_killable(&folio->_refcount,
> > > >                              folio_ref_count(folio) <= expected)
> > > > 
> > > > during migration, paired with:
> > > > 
> > > >       wake_up_var(&folio->_refcount) in put_page().
> > > > 
> > > > This waits for the expected refcount, instead of doing a blind, tight
> > > > retry loop during migration attempts. This lets migration succeed even
> > > > when waiting a long time for another caller to release a refcount.
> > > > 
> > > > It works well, but of course, it also has a potentially serious
> > > > performance cost (which I need to quantify), because it adds cycles to
> > > > the put_page() hot path. Which is why I haven't posted it yet, even as
> > > > an RFC. It's still in the "is this even reasonable" stage, just food
> > > > for thought here.
> > > > 
> > > 
> > > If you post an RFC we (Intel) can give it try as we have tests that
> > > really stress migration in odd ways and have fairly good metrics to
> > > catch perf issues too.
> > > 
> > 
> > That would be wonderful, thanks! Testing is hard.
> > 
> > thanks,
> > -- 
> > John Hubbard
> > 
> 
