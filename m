Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A9A28A9B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 13:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9DA10E793;
	Wed,  5 Feb 2025 12:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DrKUlWrS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ECB210E793;
 Wed,  5 Feb 2025 12:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7+uMaGMfsGhfNXhSPgLOsiWEfA7aNrjaD5Qq2W/dtxRq9BZyRaB7luSnmBqtu2ycBNHSDPisYZ4S4Cdi7Y74sgqzAdRgDT8AlaKR0FTIebusKNlkndjyAXOraDWtB5IrAfaLmVN8IEoMsNSb3bwXrUhr9osoVOQqWPqD8KJPPPcWOD6GQKFem5cSgsOb+kQUwwAIRT/mIhUaI9tMP1ZQ4OmMSVWKiJlsQ4KFaNJsjBuUs+v0HQvY/rtZJD38B6ndGsOLiyPInD5u/0cYGW26ntOwmVtVyJQh/lkjPPxehSoZdK/Ml1KrIrdcweX1fGzv7mxGhOHAm1kY6OG7lYfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGuvXerG9G9JkPE00XWiN20eQc8MYdU3Mo/qc3fuCJY=;
 b=FjynDo8vbHvn/TEmsd/BHOwINEc5EbXx2ElLfZxMOjwqQGNlWsa/ABUIS5ditMjUScEpZy8HtcQJeT5JgoVrVmRALhp/hYxctd8EfhIOVLkWNIcKLyDEtZlM1pHOO8T/ecfv6XDwYQYmKttuuCLWyB+XVYK0WQRMAyRCea03jSLF6gAHtRAaf4zdh526wZNaldn8s/M6Q2eU462N3/d7mRGR7JET2GkKyIhwLeFB05D06i3EjL9HnM3tRf+jp5yQ/qwwg5LgUaqvavFOCPlOjK9iJDv/Z7MiKKzw20JgwGf/+Ha4n73GLco1sqq+qabJVgKal0DmWFz4z1zydxwLAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGuvXerG9G9JkPE00XWiN20eQc8MYdU3Mo/qc3fuCJY=;
 b=DrKUlWrSLjHZ+w/1vZd8+hk9Z+X+pQoD3Ui5ViOrpRKYjK65NlYCniCqcqjTdQQZ1pGCJCcDdiUzJFNru2xezOrQdxIwasTpOXBZQg74rlWj5EqNIw2uzdD4U/nl7gfLjc8YPnYEX9Qzu3qN1CFWQ6/TU6jo2Ci/M34NL9psBUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 12:44:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 12:44:54 +0000
Message-ID: <76739b4e-a1e8-48f9-b547-69b1e2a2504f@amd.com>
Date: Wed, 5 Feb 2025 13:44:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] drm/scheduler: Remove mention of TDR from scheduler API
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250205111427.8043-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a996053-fbe3-4ef1-3be9-08dd45e2e3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzFqVVN5NG1uM3Y5UWJyQkVsVDdqQ1BTVytkSEJ2VW9yMzZDbG5WZHloaUx2?=
 =?utf-8?B?ZmJXV2xvQWxzVVJ2S0Q3cUwyWE9lN3phcFRHamFiRmQ4UlBTYXBvc1ZvTjFQ?=
 =?utf-8?B?ZFhHYWtjNmpVdVQ4WU1wK0E4YlNXS3JoNWJnZFJSd0VIUkt3SzY1UFhMNnBE?=
 =?utf-8?B?UXh5cVFDMzRyWlY4MTJuVTQxV0JOSEUxMlZSQ3B3Z25Icjk3RkJUVFgwOEp0?=
 =?utf-8?B?cVJaMkFOWk1uY2ZIRjl6Zm1xdVZrT3huUzlRQUxPNTZQbDhpQW5kWWN0NmhH?=
 =?utf-8?B?elViWjRoanY1TEpBTjVydGpDbFpJUzJpTE0wcW1TUnNBY1JhR2NUQUM2aWUr?=
 =?utf-8?B?K2V4eTNaVXBiWnduaXlnOCtoNkQ4ejYwU3ljdy9ldVBrcnIxV2JqRk5HUENs?=
 =?utf-8?B?OUVKRkpON1JxSm1td3hXWE4rM1R5NWtqMkVRZzdXYklUN2p6cmNDUFVPZnp5?=
 =?utf-8?B?czlhVEcyVFJzYjE1bEZNVG1OL1ZGL3U2OWR3Tk9oV0JLSXlwZzJzOTN5SWlY?=
 =?utf-8?B?djFaSEFDOUdmQUdmck5sUWFsVmhOK0xmbC9EOHhHcE5vYzdkWjF6dTFLanUx?=
 =?utf-8?B?Nm9yUy9iVHd2WWJYNWFhRnk5MFlhMHNXK010bHl0RFk3MlRkbXRGMFJkK1la?=
 =?utf-8?B?NklHb3lnejBYWndQZEVqbjFPSFBvZmJSWDI3YnVVYUNEYjlLZy9NOUFZdkI5?=
 =?utf-8?B?S3ZYNDFpcmo5SWR0MVgzeUxDSThnUkRaa2dzQzFxL2drZUVuSXYzQVNwaU5o?=
 =?utf-8?B?ZlIwUTlSbFZLQVpWaG04QVVSN2t2Yjg3dThldG1ueVFERW9TNUVEVkJYVUg2?=
 =?utf-8?B?N1lXUitqd2FFZFJZVHptNDZiUnVWN0VtK2FEZ0N5dGhMYngvRGJFR1VJbEJC?=
 =?utf-8?B?MmpYRVU2K0xFRmxhemwwTXY0U0dvNmVNRExIYXZOOERIUXJZazA3b2drN3hz?=
 =?utf-8?B?aXgwTEtiTXp0bDE1VnBIVTU4a094bjVCZHlPSERNUXlTY2EzdnZhVjBBcm9H?=
 =?utf-8?B?Q0tuc0NObjdLanI3aTBVM29Gbyt3NklFTVZlZ2M2Uk56N2dIeHFlbEgwWGpm?=
 =?utf-8?B?bnpDTXB6dFFxVTRBcGh4em5JTVZjMHM4R3VSSWhzZzFYbW4vRnI3NE1haHJE?=
 =?utf-8?B?aFA4Skd2OTdzNmxYSTIzblpEWDNoQTM2ZEZubnVyOTE5VnM3M05obWl2VGtv?=
 =?utf-8?B?VTJuWHV0Umk2ZnZLc2ltL2dxRDBxZG5jUFFuTUxiMUVnekh0bTg5L3dQMVZS?=
 =?utf-8?B?SzBUQ2gvR3FEQ0NIbUsxNWREbGNuc09hTDFCM3ZZUzk4aXZrNEpTdjIzcXpC?=
 =?utf-8?B?QkdZcWRucmUzU2VHQU1kaVdhSGFqUXRiWG55M3BpazhnQkJtMldEcUQzVUxG?=
 =?utf-8?B?cmtXU0dQSHBXUGVkUzMwWGt0ZlVkQjd4ZXJVajZmOVVicUxTVGx4TmRDM3RK?=
 =?utf-8?B?blhqOVRoNkY5ZXFmQUdNTkYrajMwY29LY0g1THNUSXU3bUZvYlZWOFRlQ2Vz?=
 =?utf-8?B?MDRLZ2hJODR3VHpYSFFLUDJ4c1dPS3dJZ0k1ZlRPY3JvN051UFBKRDg3VWJL?=
 =?utf-8?B?aTlzMG9Tem1oLzM0T0UwMGQ4OURUaWgxTG9oRVFrblhRQ0hubjlBWG1pSmVh?=
 =?utf-8?B?bWRMYkV6UWZDU3JJSXNqZVpkbTF0L3Zjc0RGbDJDdkpQaVZGcEhsWHY5aWdC?=
 =?utf-8?B?MzVRSjNZTHh2MURrUG9oeEhNa3JoMTNoekxHY3JQVWZKckE3WlBQTTZZWVVP?=
 =?utf-8?B?S3JoKzlGYWRyajBVbERyc1hpMmZ3U0JSRUs1TTUyRXJlckVFWXRjNnhtY1Zv?=
 =?utf-8?B?enVsQnRGZ1lvUlBaRi9Lc09UU2xOZXJza0h2V0FKaXpIaHZOYWJyU1A0S0Vr?=
 =?utf-8?Q?ugD39+ss7w6X/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJjb0dnQXJlUWY3b2taRlZQRmpySDJwMU9MYkdTa3ErcFhWRnpsdHdnSWkz?=
 =?utf-8?B?d3hPL0dNOExDeWJSSWViR1JzdWcyVGN4NG00SGJCTVhpSGVqNXowaHpLT1N4?=
 =?utf-8?B?KzU5dVVGMXh1aURhUkZkYndGWkFIQ1VMVEk0T1hjVW1HUEwzSkIzYlhHbEFi?=
 =?utf-8?B?c3RlZWdJaWtJME1WdVRvSjI3b0IzelN0SU5UWEhWTjRQbThpSTc0aElpa2ww?=
 =?utf-8?B?ZHpEOE0reVcxWm11clp6YlZqQ2FReDVWdy90OUxxK2E4ZFVGZVA3M0JZb1Bn?=
 =?utf-8?B?ZEFWWUtzRlo4WjdudzNaOGtXZHRnU1RnamZwTktuZXQvRlRtaFQyY2tGUThD?=
 =?utf-8?B?bC9ZVWVlTHEzYVlJYnVFeTFiMUZuL29ETS9nZHBRckxHL05rU0ZxMDJiRFZF?=
 =?utf-8?B?VE93dHhDckJRU1dhWmpGQThTaG5VOElEN09TUUs0YW85TXdxMVFEblBIRVJE?=
 =?utf-8?B?MUtuTjU5TUxobXdWYUM5SUZNZk5XNHdLdHNPWmRhL0N6MkNwdm81SjBsRFJD?=
 =?utf-8?B?RFBCS3VFUmdpL1laQnhINytkZys5QWRxeFFWWmlOSXdWR2owZm0xbGt3QjRL?=
 =?utf-8?B?Qk1DVWNHbjYwNmxFRENqdWZxNmlidXkwYmM5a0VoSjlWenU5b3NpZ2MrQXpi?=
 =?utf-8?B?LzJVS0xra0ZjYVRWNWFCb1hCQTNnSDJaSWx5OE04TzlXZ08vUG9RS2lJMlVO?=
 =?utf-8?B?MCs1OTRXRkJtbUI2UEgvQUdET2xsL3cyd25hUXNrdFEzemdrQ1FDOVVYU1Zi?=
 =?utf-8?B?aEpNc1RVZkxqeFRCQkFKNSs4T3VSWDExeWRLUUNNMGtKc1hrQWE0ZHdCRXFp?=
 =?utf-8?B?RVRqcFZUY1AwWUNxb29sY1lnVDJ0cVVYSUJ0Zk15VXEzeGpTa3lMRXVJcm5H?=
 =?utf-8?B?d0REU3VRV0pLR0Mwa0dMV1pMNmhQbmlvUFZEVTFkRGRaSDh6bVIvOXoyU2N4?=
 =?utf-8?B?eitZZmxKbHZFYkNkem9ISXVDcVJET1cwQjQwTCttV29Kc244YUl2amVDSFlo?=
 =?utf-8?B?YUw1cm45YlVGWGVNRHZWUWFJL1VrTno4NDFhbmlEVkYrdXRaZG1paml2UFgw?=
 =?utf-8?B?cm1mU0dUUHc0N0tTNHFkMk1JR0JuK3hDbGc3c1pXQWJ6cmlkSWlFQk9GNnY4?=
 =?utf-8?B?NGc3TTJ5WE1ObGM2ZkRlNFRabzJhaUJLTHFFb3FCUUtpcVhWdDByT3RJdUpm?=
 =?utf-8?B?MFhoSXVwV25EWGR4bFFCK1BMRXNrMUcxTXZONDlaZDBsdkJPaGcwaXdtbG9k?=
 =?utf-8?B?WitNdy8zaGNrSUdFZTZBcmdpQ0ovMDFqWlhOczNkSExLWDRnMnRJRDZSVlE4?=
 =?utf-8?B?dzY3b3NNSm1nRUsrWUY4b2lIZzhnTjNYUFJSRkZ1cDJVVzNkVVhubms0T3hI?=
 =?utf-8?B?bktmb0pocXJLaVdGcXNKaWdjWkNRTm1Sc3BSeTFnZXkvT0VUQzMwRDJSOVBs?=
 =?utf-8?B?SFFvL1RKK05wbEQ5WWRyNVUzYVNaT21heVcrZUlZblI4dUw3c1NVMS9JUS8z?=
 =?utf-8?B?UnlML1BzVnBWaGd2ck8wd1FKdlVPOG84dDFWam1vbEZDeDAvcTRTcllmQWRn?=
 =?utf-8?B?UTFJQURKZGdyNFl4dlFRRHBqeDdqMWVJQlFhK0paYjhkYmNUcTB0eElaK3BX?=
 =?utf-8?B?OGo2bDdQVjluR1RkLzV5NmI5SExubUh4alRlWkdGT1Zjb0FmUXI3T2NqbHky?=
 =?utf-8?B?ckZBbVltNzYwbXZTM0t1MTJKdGhPRHhyRHZTU3hYNUN0bzljSVc5cGc3anpz?=
 =?utf-8?B?dmh3bXpXZm1nMGIxU1g4TkI0bjUrOTBYSVBiWnZOOGZwN1RLRGNBTFYxZDdp?=
 =?utf-8?B?MTdmVldlNDYvUlRKVEF3UUtsZXpCTXM5WmpkelN2TlUrKzF4K2cxWm5Wbm1r?=
 =?utf-8?B?NVI4VXhwbzV3TlkyVE42ck9udWIwSEtOemlMelFQRGw1MFQ4SzdxSnNJbFlu?=
 =?utf-8?B?RDdCS1NVN2NJWTM2NDhydWZHazB0ckNMRGJnMGdPRDNOdXJoS2lpNFhBRnNN?=
 =?utf-8?B?Q1BjRWFTWVhuamM1ajlvYVdGazRQZlovUnRYQ0J1L2ZBUmV6MlI4TXZyenZN?=
 =?utf-8?B?WkcrOWFnMUJXTU1yOWFvVEZReEdIdjhMZ0VFd1JjbjA5c0hwYWpUWHFGM1oy?=
 =?utf-8?Q?zEhNU82DjmT3A1edb0+UIHU6E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a996053-fbe3-4ef1-3be9-08dd45e2e3e3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 12:44:54.7902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kvmgAsN9o4GynIs4YUFeuV/0FxVsCWP8fUAO/18Dm5Fde0Dsy6GJqZ7WHvEhZ7Bk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
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

Am 05.02.25 um 12:14 schrieb Tvrtko Ursulin:
> Christian suggests scheduler should not use the term TDR because it only
> can do basic timeout detection on it's own, not the full blown timeout-
> detection-and-recovery (TDR) as the term is generally understood.

There is even more to the term TDR on Windows than 
timeout-detection-and-recovery.

For example it includes a certain signaling of errors which works 
totally different on Linux.

> Attempt to rename it to a more basic drm_sched_trigger_timeout.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> ---
> While doing this I have however noticed the pre-existing drm_sched_fault
> API sitting right below drm_sched_tdr_queue_imm() added by
> 3c6c7ca4508b ("drm/sched: Add a helper to queue TDR immediately").
>
> It does not appear to be documented in the kernel doc why is the
> newer API setting sched->timeout permanently to zero, or why are
> both needed and what are the considerations to use one versus the
> other. Perhaps Matt can clarify as the author of the newer API.

Oh, good point. I wasn't aware of that duplication.

Regards,
Christian.

> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 32 ++++++++++++++------------
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h  |  4 ++--
>   drivers/gpu/drm/xe/xe_guc_submit.c     |  8 +++----
>   include/drm/gpu_scheduler.h            |  8 +++----
>   4 files changed, 27 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index a48be16ab84f..b01792fe6141 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -433,7 +433,8 @@ static void drm_sched_start_timeout(struct drm_gpu_scheduler *sched)
>   
>   	if (sched->timeout != MAX_SCHEDULE_TIMEOUT &&
>   	    !list_empty(&sched->pending_list))
> -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, sched->timeout);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> +				 sched->timeout);
>   }
>   
>   static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
> @@ -444,20 +445,20 @@ static void drm_sched_start_timeout_unlocked(struct drm_gpu_scheduler *sched)
>   }
>   
>   /**
> - * drm_sched_tdr_queue_imm: - immediately start job timeout handler
> + * drm_sched_trigger_timeout: - immediately start job timeout handler
>    *
>    * @sched: scheduler for which the timeout handling should be started.
>    *
>    * Start timeout handling immediately for the named scheduler.
>    */
> -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched)
> +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched)
>   {
>   	spin_lock(&sched->job_list_lock);
>   	sched->timeout = 0;
>   	drm_sched_start_timeout(sched);
>   	spin_unlock(&sched->job_list_lock);
>   }
> -EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
> +EXPORT_SYMBOL(drm_sched_trigger_timeout);
>   
>   /**
>    * drm_sched_fault - immediately start timeout handler
> @@ -469,7 +470,7 @@ EXPORT_SYMBOL(drm_sched_tdr_queue_imm);
>   void drm_sched_fault(struct drm_gpu_scheduler *sched)
>   {
>   	if (sched->timeout_wq)
> -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, 0);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, 0);
>   }
>   EXPORT_SYMBOL(drm_sched_fault);
>   
> @@ -489,14 +490,15 @@ unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched)
>   {
>   	unsigned long sched_timeout, now = jiffies;
>   
> -	sched_timeout = sched->work_tdr.timer.expires;
> +	sched_timeout = sched->work_timeout.timer.expires;
>   
>   	/*
>   	 * Modify the timeout to an arbitrarily large value. This also prevents
>   	 * the timeout to be restarted when new submissions arrive
>   	 */
> -	if (mod_delayed_work(sched->timeout_wq, &sched->work_tdr, MAX_SCHEDULE_TIMEOUT)
> -			&& time_after(sched_timeout, now))
> +	if (mod_delayed_work(sched->timeout_wq, &sched->work_timeout,
> +			     MAX_SCHEDULE_TIMEOUT) &&
> +	    time_after(sched_timeout, now))
>   		return sched_timeout - now;
>   	else
>   		return sched->timeout;
> @@ -517,9 +519,9 @@ void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,
>   	spin_lock(&sched->job_list_lock);
>   
>   	if (list_empty(&sched->pending_list))
> -		cancel_delayed_work(&sched->work_tdr);
> +		cancel_delayed_work(&sched->work_timeout);
>   	else
> -		mod_delayed_work(sched->timeout_wq, &sched->work_tdr, remaining);
> +		mod_delayed_work(sched->timeout_wq, &sched->work_timeout, remaining);
>   
>   	spin_unlock(&sched->job_list_lock);
>   }
> @@ -541,7 +543,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
>   	struct drm_sched_job *job;
>   	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
>   
> -	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
> +	sched = container_of(work, struct drm_gpu_scheduler, work_timeout.work);
>   
>   	/* Protects against concurrent deletion in drm_sched_get_finished_job */
>   	spin_lock(&sched->job_list_lock);
> @@ -659,7 +661,7 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>   	 * this TDR finished and before the newly restarted jobs had a
>   	 * chance to complete.
>   	 */
> -	cancel_delayed_work(&sched->work_tdr);
> +	cancel_delayed_work(&sched->work_timeout);
>   }
>   EXPORT_SYMBOL(drm_sched_stop);
>   
> @@ -1107,7 +1109,7 @@ drm_sched_get_finished_job(struct drm_gpu_scheduler *sched)
>   		list_del_init(&job->list);
>   
>   		/* cancel this job's TO timer */
> -		cancel_delayed_work(&sched->work_tdr);
> +		cancel_delayed_work(&sched->work_timeout);
>   		/* make the scheduled timestamp more accurate */
>   		next = list_first_entry_or_null(&sched->pending_list,
>   						typeof(*next), list);
> @@ -1325,7 +1327,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
>   	INIT_LIST_HEAD(&sched->pending_list);
>   	spin_lock_init(&sched->job_list_lock);
>   	atomic_set(&sched->credit_count, 0);
> -	INIT_DELAYED_WORK(&sched->work_tdr, drm_sched_job_timedout);
> +	INIT_DELAYED_WORK(&sched->work_timeout, drm_sched_job_timedout);
>   	INIT_WORK(&sched->work_run_job, drm_sched_run_job_work);
>   	INIT_WORK(&sched->work_free_job, drm_sched_free_job_work);
>   	atomic_set(&sched->_score, 0);
> @@ -1395,7 +1397,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>   	wake_up_all(&sched->job_scheduled);
>   
>   	/* Confirm no work left behind accessing device structures */
> -	cancel_delayed_work_sync(&sched->work_tdr);
> +	cancel_delayed_work_sync(&sched->work_timeout);
>   
>   	if (sched->own_submit_wq)
>   		destroy_workqueue(sched->submit_wq);
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index c250ea773491..3fd728b1bfd6 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -44,9 +44,9 @@ static inline void xe_sched_stop(struct xe_gpu_scheduler *sched)
>   	drm_sched_stop(&sched->base, NULL);
>   }
>   
> -static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
> +static inline void xe_sched_trigger_timeout(struct xe_gpu_scheduler *sched)
>   {
> -	drm_sched_tdr_queue_imm(&sched->base);
> +	drm_sched_trigger_timeout(&sched->base);
>   }
>   
>   static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 913c74d6e2ae..968709fd6db4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -778,7 +778,7 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
>   		xe_sched_submission_start(sched);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(sched);
> +		xe_sched_trigger_timeout(sched);
>   		return;
>   	}
>   
> @@ -807,7 +807,7 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>   	if (xe_exec_queue_is_lr(q))
>   		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
>   	else
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		xe_sched_trigger_timeout(&q->guc->sched);
>   }
>   
>   /**
> @@ -986,7 +986,7 @@ static void enable_scheduling(struct xe_exec_queue *q)
>   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>   		set_exec_queue_banned(q);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		xe_sched_trigger_timeout(&q->guc->sched);
>   	}
>   }
>   
> @@ -1144,7 +1144,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   			xe_exec_queue_get(q);	/* GT reset owns this */
>   			set_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
> -			xe_sched_tdr_queue_imm(sched);
> +			xe_sched_trigger_timeout(sched);
>   			goto rearm;
>   		}
>   	}
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index cf88f2bd020f..666968cf505d 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -494,10 +494,10 @@ struct drm_sched_backend_ops {
>    *                 finished.
>    * @job_id_count: used to assign unique id to the each job.
>    * @submit_wq: workqueue used to queue @work_run_job and @work_free_job
> - * @timeout_wq: workqueue used to queue @work_tdr
> + * @timeout_wq: workqueue used to queue @work_timeout
>    * @work_run_job: work which calls run_job op of each scheduler.
>    * @work_free_job: work which calls free_job op of each scheduler.
> - * @work_tdr: schedules a delayed call to @drm_sched_job_timedout after the
> + * @work_timeout: schedules a delayed call to @drm_sched_job_timedout after the
>    *            timeout interval is over.
>    * @pending_list: the list of jobs which are currently in the job queue.
>    * @job_list_lock: lock to protect the pending_list.
> @@ -527,7 +527,7 @@ struct drm_gpu_scheduler {
>   	struct workqueue_struct		*timeout_wq;
>   	struct work_struct		work_run_job;
>   	struct work_struct		work_free_job;
> -	struct delayed_work		work_tdr;
> +	struct delayed_work		work_timeout;
>   	struct list_head		pending_list;
>   	spinlock_t			job_list_lock;
>   	int				hang_limit;
> @@ -571,7 +571,7 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>   				    struct drm_gpu_scheduler **sched_list,
>                                      unsigned int num_sched_list);
>   
> -void drm_sched_tdr_queue_imm(struct drm_gpu_scheduler *sched);
> +void drm_sched_trigger_timeout(struct drm_gpu_scheduler *sched);
>   void drm_sched_job_cleanup(struct drm_sched_job *job);
>   void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>   bool drm_sched_wqueue_ready(struct drm_gpu_scheduler *sched);

