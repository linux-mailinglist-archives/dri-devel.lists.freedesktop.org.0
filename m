Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iWvSN66yemmK9QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:06:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FCDAA7E1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 02:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296E310E790;
	Thu, 29 Jan 2026 01:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RaskTQOq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E7110E790;
 Thu, 29 Jan 2026 01:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APo1Yt4Mv6t5e3kwUFt1za2v+TzOmjEQXnsK76HQ7DN24kTawg9X/HD8XbH52HdQBbRe+wLq5KeocyOzE/xlezxu/8lMuaxiZpQzCVItUVktCRTAICGwTgHW2cGb5geFoXMqjD6rD8ZiiKPjCDvu5CUPs7+Xmi9I4945Q704GZjztezJZmeS62UXYy1I1RmLc6Wrn/8GSJrB3HW3hIrfRUOEEBhqwo9FxfLGM8z/IHJpBrMeGHWrcbHv7GlqZ/Xnaak+EGRez4aT5AxhsKwh9awHFYdQF01iwbj3uYax0mInKQ5wQ/gJ5tZ4Y2VnAqJy0Poyqs9FokcNsu8v41lkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4AvWykiDKd/Yr2Lx1R7qTIPa+IumTtDAU09XZj6zsI=;
 b=BXH2/MsyTkFNORQtvOxxt4+QYNRQb7LlBNXIwh4NTSooAuDQBgwuiv+h5azpKHI6iV35Z2GhVVi56yTeTzeh9qbj20ng+9xlnAOnoUiyyoGbKkXC6wtbL2csQ6vmE66NWOM7Uqzj+S8geSuqQnjKPBV4VqrseC+sPF7hFdqjejNllwPL6WHFclzWmR4E/r63fqw+QTpp57E1bBFPhSIIH+s8wsieOr3Wv5nAB32+2F+ovzYA/JM3x+zoSUy3huxMqh9gUno6OHU9MAEYo/xtoCRfCOwrmlkTanDQnNr5623TKn/F+S+pvuwWo1OxNimMEiFXD/XbYdhh61++Pppm7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4AvWykiDKd/Yr2Lx1R7qTIPa+IumTtDAU09XZj6zsI=;
 b=RaskTQOqNTNYvRT9ykPqaQD0FqmgNhyt5u4wMY8Em1fyqRFBZvQEq0hxEccwprdZRRdu0bCAtxSp6wuuAjLEQbtxQwmJWsTyGB06WojYDkq8zkNal+AeyxoT04STM7Qx4dcCfoZChNjyKMbAcndIcdsK0fBLptasbG6hZavwWPcEyFww0liTg7+qyd/pESm7Kldd8/xq6TZV2rsFzl8xwbKdbtB911J+eDuyV7qsmQTwMR9krTuBR4+svjjvJgOFl7ZgOP1VpPuK7o9yp8uGdkD7f2YD/H4h+CIEfUBMVCv7NIK5PN6LKHOs8X13DNWv6bzUYENRoxJLDe7D2gxlDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB9072.namprd12.prod.outlook.com (2603:10b6:8:be::6) by
 PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 01:06:45 +0000
Received: from DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1]) by DM4PR12MB9072.namprd12.prod.outlook.com
 ([fe80::9e49:782:8e98:1ff1%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 01:06:45 +0000
Message-ID: <6df341ca-f130-4a30-b2e0-43d1c9962aa5@nvidia.com>
Date: Thu, 29 Jan 2026 12:06:34 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] mm/migrate_device: Introduce
 migrate_pfn_from_page() helper
To: linux-mm@kvack.org
Cc: balbirs@nvidia.com, matthew.brost@intel.com, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 david@redhat.com, ziy@nvidia.com, apopple@nvidia.com,
 lorenzo.stoakes@oracle.com, lyude@redhat.com, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, rcampbell@nvidia.com,
 mpenttil@redhat.com, jgg@nvidia.com, willy@infradead.org,
 linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, jgg@ziepe.ca,
 Felix.Kuehling@amd.com, jhubbard@nvidia.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au
References: <20260123062309.23090-1-jniethe@nvidia.com>
 <20260123062309.23090-2-jniethe@nvidia.com>
Content-Language: en-US
From: Jordan Niethe <jniethe@nvidia.com>
In-Reply-To: <20260123062309.23090-2-jniethe@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:a03:505::26) To DM4PR12MB9072.namprd12.prod.outlook.com
 (2603:10b6:8:be::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB9072:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: eedf9b8c-6460-4797-9ae6-08de5ed2abc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THJ5YkxlV2R4N2U1N0RVdDJVMUM2TEhwSFBtaDhDVWU5dis1Yy8rZC9hMGNG?=
 =?utf-8?B?b0lIRnFIRkhsWkVQSUs2NFdkU2VBRjhCODludE1EaTMvVEdTRkd5ZzZFbHUy?=
 =?utf-8?B?TWRXVktEejhEakJiS3l4UU5DWURieFB6UmJndVNyb0Q5SHFjV2QxdzhUSlRI?=
 =?utf-8?B?OUlFRnhleGw0OW5qSVlheWFvd3U4cXJBaUdySWpOeG9DckVmUk41RzdKUkdl?=
 =?utf-8?B?TEtEVUk5THdieU5kMnFkaUFkRGlkcGNMN3NvS3BhTStIazltNXNzQUZjeDhH?=
 =?utf-8?B?UkgwcEFMaGwxTVlxSDhzOWd3Y3dzZTJjeDdWR0xORDV3bWZGQ0lLdTI4YVpk?=
 =?utf-8?B?cVhYdHRxNFIrb0RVZ3lvbXE5NFlkODJkd2U1VFh1b3VNUER1elFtNGpNZVdp?=
 =?utf-8?B?K3F3ZjZuME5iYkJDQWdBM1ZKK2tldDgxZ0J4NlpBdlBSN3VHZVpSUGd2cVlr?=
 =?utf-8?B?SUdZZ3lkc1Nod0hkOUhnVjNqc2NMMFlKeWN0cVQ1M251RGFoeG9zOUh3aGNq?=
 =?utf-8?B?YWtnQTV2WUIzNkYyajUvb3pFUmNkNGtpRlFWTldhK29EeXEzNVRjR2UxdFZm?=
 =?utf-8?B?NjIzckc3NVNldGpGREs5OTZFV1VBN2s3OHkySDNVNDAzSnoxRjh3WTBrR2Q2?=
 =?utf-8?B?V253NlkvYlV5YlMxZHF1bDQ2cGRTYjkwQmU0a2tOeXpqRkhqOVJKT0pEZ3RL?=
 =?utf-8?B?R2VOVnNhVGFWWFMxTUdIZ2RYbUllL291WklNenNEWEw5Nm9CRjN4c0I3QndK?=
 =?utf-8?B?UXZZVnYvb0thcmZDQkE2RWs1TU44YWlYcmlVVDlCVWZvcEZyc3N1V09nTlVw?=
 =?utf-8?B?NkJhaG1kM0lEK0g2dzJ4OTV0QnVHZ2xWWFZIRFVocjRzQXpHOFBMdTZxRVVl?=
 =?utf-8?B?VDAvWVBVTnkwWmc3K2xSV2Z4Y21rdm5GeTlFVkR6d1daYnRyU21aUlBQRW5M?=
 =?utf-8?B?NkZMK3hhNkdYdHVhWlkwdDRXYlRJcmtBNDRQNnFHenZQQm9FazhaTlRReTBQ?=
 =?utf-8?B?anRSeksvajcxWStCRVo4b0Rab2J2TThsM0d3LzVOQVdIYXRxcFMxK1FxMzhq?=
 =?utf-8?B?bER1emhQeC9LYnhsUUJRaWFjUVN2TjJQT3dvZzdMMlBnaHZ6aFR0UFBpT1Q3?=
 =?utf-8?B?U1VsdjZOUFdTaVdmaWhPaG5WNXdDUzc5RS9YVWRXMWVPR01HSzFzTVU3Q2l1?=
 =?utf-8?B?T1QyMVFRNDFZZlFvYmR1SXVzeEhTNXpwdVhNMmdMT1V3ZmRhV01WWFg2cC9y?=
 =?utf-8?B?dmJEY29EeStqTGt6bHNIcVpURFNjM2VmMzBQU2o0Y2pvWGpLUGVrSDdLczVS?=
 =?utf-8?B?QU9BRVV6bHQxNjhkWkVLTVdMNTd6cGhDY25KNkRGQ1VJbUdLOVZrd2lTSXlF?=
 =?utf-8?B?dTZmY1RkYnM4c3EyL0JaRFlHSGo3Z2kwbVc5bm5YTkhrQXMrOEhDeGIxWVhp?=
 =?utf-8?B?eTlIUm5CU3htNy94Ynp1UHoyRm82OW5lcUQwMnB4QTVKQmZUcmx2dGQzWG5p?=
 =?utf-8?B?NmxEaXZzNjEyZ0pia3hiVFBDZHlLRllmS28ydlVoM01PQXJpTVVhRitjbVZ4?=
 =?utf-8?B?ek5WaDBLay9ablpPOEt3RFhkYlh0VzA4WHJXc3krczRXbEcweWM4dU1YYmgv?=
 =?utf-8?B?Um9uS2pGSnpDT280bURxUUdCZHhmUjVtcWovaENESEF0ZEdETXRtVVlzSkpi?=
 =?utf-8?B?cEtxRmpUREF1SC8zUUlXY1pJUzYvSlJrOGs2L0ltN1h5M3ExK0p6NlJtUndF?=
 =?utf-8?B?M1pHQ05GMThMRjJxbG5wSEUycXJUNFMzZzZFQ2RtZkViYm1ScDFhZkh1VExG?=
 =?utf-8?B?M2hHZTNOMUs0YjBXZGpoejI2eVhiVTc3eWRPZHhzMkJnOGtEVUhnQ3ZWK05k?=
 =?utf-8?B?RVoyTzBMekRkWWJiZEhJVmo4NFhRSG0zOVlBVjdhZnJ5cldxVmpVS1BSb0Iy?=
 =?utf-8?B?OEUvZXdyc3dWN0pSUnk5TjIrRmF6UUprdFVoVE1YRkJFakpWUGpYRXJ6TkxU?=
 =?utf-8?B?ZEdPWis3N244djZMcVFjOE5Bd1pYRzFXSENLNVlnZ1RvWHlPSThYdnJlTVov?=
 =?utf-8?B?THVTdTd0aDVEUWR0ZjJzSE5zcml1K2Q2QjMyK0J2WmI4cEo3Z1hwQmRwSjRL?=
 =?utf-8?Q?cmn4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB9072.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnJacS9Dai9pUnlVaDNqeUs0S09LRzErdDlNek5GUFltN01YZnY0aXNsa1Fp?=
 =?utf-8?B?ckY2akxpRlFwQkVtVUlCWE9VMXdFNzRoeTZYcE41Ulc5Wk81dlhqOFZBQXdF?=
 =?utf-8?B?Z1QyWE5zRUdyN2ljakhuN3NiRU96aXRKQWNUQ2RDUzlEM3ZPOUM3akE2czRk?=
 =?utf-8?B?ZU0wVWo2QzUxcHdKS2lPejNHaHhjMWo1OTFGQzdvYmlhOHFvSktYNnllN3lr?=
 =?utf-8?B?YjlhRU1zSlNqZVIzdlc5SHpyZGV0dlFnSmU4M1RlYWk2cnpLcFVjTGU4c0VL?=
 =?utf-8?B?TnRSNFRVWXVDWnhaanlnZ2M1SmtOcUtBaktRc1BMcnl2YWo2UFRIVjhBRmhT?=
 =?utf-8?B?d2xYaVliOTA1Qld1UVk5MGkyMGFmYk4zT0c4R096Z3NBdThranZSMnM4ckJS?=
 =?utf-8?B?ZUxDZ1NoNUIvb1R5TXRnT3dQcG40aURIOGdyNk1NZHJSeEVHTXNkOGZlTFlW?=
 =?utf-8?B?bGtic2JobFZ1cktvQnhSdmVUeEV0dkZwTHJDZkIySEo3enhlVEhubXBzeldL?=
 =?utf-8?B?aFk1NWlsOWF6UDJNcUo2dndTc255WnE5bDhwK1NZRFhjdnhLVTZoOVh1UzlD?=
 =?utf-8?B?LzMyVDZWSzg3SGFsenlMelFtb1FWeUw1a0lmdmpsQVBwZGlROU5JVENjcUp5?=
 =?utf-8?B?UXJnMXZVN0xPQTFKdlYrbCtOTk4yTkQyaWgxbUw2UFRUTnBrV1cwZVUzYmQy?=
 =?utf-8?B?TW4rdENiSml0UGZQN09XalQxVWN2cnppY2FFdEk2SWwrT3ZhRFlubERuSjdM?=
 =?utf-8?B?OVc4Zm94Nk5aRDBCYllwWGxrbjJsQnVFbzJLZHU1THdrdkxrb0Y0aWVnNU90?=
 =?utf-8?B?cUdmL0huWnlnaEF1bXJ4MWRMaHk0dWRNNUVIaUtPOXAwdytseVRkWTBqMldR?=
 =?utf-8?B?OVp2SG1EblAyL1YyeEw4cTdUOElaNjRvUDNGWVo4L0laSWh2blJqdU9JNnl6?=
 =?utf-8?B?SUozTU1Ob2taY0UzQU5IK0hZYXRPOXl6NEd2L0M3aTVSMW5lRkVjTjFoZ2kz?=
 =?utf-8?B?MWhqZWgxNy8yWHF6dC9qYWlXelRmdThGK1BCbVlCSUcxamxyQjI2QnYxeVN0?=
 =?utf-8?B?Uml1WWhGR3QzbWppZXQ3Nk1HYllxazk4am9pUVVXN1VVRUQ2cmx0V2pKb0xi?=
 =?utf-8?B?U2VsSWphQ3JMdEF2ZDBFdE5FcHR3VUkvUnRqWE5tR2h3UXRtREQ1TjdOVTJ1?=
 =?utf-8?B?bEhYdzZHbG85KzRLaDYrbGE1dFpGZzNDZjEvVWZGSXJNemh6cWhlWVFuY0Ey?=
 =?utf-8?B?YUN2d1ZhVWF3U3AweVR3WXR0K0EwK2V3bGJiVlVPSUYxZnFLOUZWSUNmRVU5?=
 =?utf-8?B?aEVmOTJrcTlyd1BEQmxISU5yUmlKdlhsWU1BM1NNUDUyZTQ0Wjlkck1SYUYx?=
 =?utf-8?B?Sk9BdlcyWFdWeTk1cWtiU3hteEdhRFg0NWtsaTVxc0h3OWk4UjhNdTQxb3ZP?=
 =?utf-8?B?eFc2RHZYZ2tVeFNkUVR4QmQxRTNlSkdIVG5CWU55VzBvdmNEUmo5dkNodGdl?=
 =?utf-8?B?V08za1llNTUrSFQyNUpmMGNLbTN4QXhCYXpPSVY1RVdQckRaTUpzUnJ3Rm4v?=
 =?utf-8?B?clhiamU5L294ckN1SGgwYjd4c2pRV0EvNXlEQ2RvVXJpTHlDcHdVVk5Vb2RT?=
 =?utf-8?B?ZVdkMWs0T2J3MXNxajFlNHVqc1JTN1ZXeE9Od1lqK3VtTjFsejZlQ1Vqd3g0?=
 =?utf-8?B?Si9RUnB2ZUFGbnBZMFNabWRZNGFla3dFSVNScmhoSGNMQXBGb0s2ZXNDQUF4?=
 =?utf-8?B?aUlhT0lVd1pQUTNOU29JdmYyekdMbkY0UTI1QWpUak5CR3VjMGZuSGs5WlRX?=
 =?utf-8?B?dVVNdlcvQ0dYbXRvRUdwSlJCWEJlQjVoQjEvbFFyUlh6YVNqMEJjRnRjRHUr?=
 =?utf-8?B?eDJUcW1XbExBVitNSHRkb1JybU5FSE96Y2wwRGY4SnVZbjYxNitYdWFONVZ0?=
 =?utf-8?B?MjF6ZlluUDl4NUJ5NWRES0xpVUdTTVFVOVltczl0ZHplUDJKb3o2UmpUOGpu?=
 =?utf-8?B?NEVDczY5R3RHUlp2ZUhhc0JpWnYyZlVmL1NPcEVDOGY0dDFMbjJGQW1YbEZV?=
 =?utf-8?B?VnEvbVp5YUJQcEdnblVlRjJGNitDbWZ5RlpyZWE3bXJMQ3hUeGpXL2ZmcjBp?=
 =?utf-8?B?OGpQMzlxaXNXT05ORm1VSGR5aS85VzFMUXhkRVZ3UVY4RFBWakNKRExHZXR3?=
 =?utf-8?B?R1ZjQUdONEZ2bVZhVkcwT1FRcUVtQXJLVUJOd3ZHTTB6ZGFtTGIrVU5TbEhI?=
 =?utf-8?B?Z2p2RkppT0NxcHU1bDlob1ZVYVhac0wrUWRJalh6Wmc3RVNuN0ZUazl6cjdB?=
 =?utf-8?B?OXRMdUt2SGN0N25JeDNEeVNZY29HbXRQWGU0M0hXYytsN0VxNldjZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedf9b8c-6460-4797-9ae6-08de5ed2abc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB9072.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 01:06:45.3459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FsKCeD9i6W2IbjFLlO9TzkUXAeJEIfds40o9AY8gQtqdenoQqomIGeExYfboXhdI9ZS6fThBjW25aUTmYGmTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[nvidia.com,intel.com,linux-foundation.org,vger.kernel.org,lists.freedesktop.org,redhat.com,oracle.com,kernel.org,gmail.com,ffwll.ch,infradead.org,lists.ozlabs.org,ziepe.ca,amd.com,linux.ibm.com,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jniethe@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 40FCDAA7E1
X-Rspamd-Action: no action

Hi,

On 23/1/26 17:22, Jordan Niethe wrote:
> To create a migrate entry from a given struct page, that page is first
> converted to its pfn, before passing the pfn to migrate_pfn().
> 
> A future change will remove device private pages from the physical
> address space. This will mean that device private pages no longer have a
> pfn and must be handled separately.
> 
> Prepare for this with a new helper:
> 
>      - migrate_pfn_from_page()
> 
> This helper takes a struct page as parameter instead of a pfn. This will
> allow more flexibility for handling the mpfn differently for device
> private pages.
> 
> Reviewed-by: Balbir Singh <balbirs@nvidia.com>
> Signed-off-by: Jordan Niethe <jniethe@nvidia.com>
> ---
> v2: New to series
> v3: No change
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>   drivers/gpu/drm/drm_pagemap.c            |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  4 ++--
>   include/linux/migrate.h                  |  5 +++++
>   lib/test_hmm.c                           | 11 ++++++-----
>   mm/migrate_device.c                      |  7 +++----
>   7 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index e5000bef90f2..67910900af7b 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -784,7 +784,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>   		}
>   	}
>   
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage));
> +	*mig.dst = migrate_pfn_from_page(dpage);
>   	migrate_vma_pages(&mig);
>   out_finalize:
>   	migrate_vma_finalize(&mig);


Maddy, would you mind taking a look at the ppc ultravisor changes here and
patch [PATCH v3 13/13] ("mm: Remove device private pages from the physical
address space").


Thanks,
Jordan.


> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 7a8990b30fa0..1f03cf7342a5 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -652,7 +652,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   		pr_debug_ratelimited("dma mapping dst to 0x%llx, pfn 0x%lx\n",
>   				     dst[i] >> PAGE_SHIFT, page_to_pfn(dpage));
>   
> -		migrate->dst[i] = migrate_pfn(page_to_pfn(dpage));
> +		migrate->dst[i] = migrate_pfn_from_page(dpage);
>   		j++;
>   	}
>   
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index 03ee39a761a4..526105aa4b05 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -742,7 +742,7 @@ static int drm_pagemap_migrate_populate_ram_pfn(struct vm_area_struct *vas,
>   			goto free_pages;
>   
>   		page = folio_page(folio, 0);
> -		mpfn[i] = migrate_pfn(page_to_pfn(page));
> +		mpfn[i] = migrate_pfn_from_page(page);
>   
>   next:
>   		if (page)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 58071652679d..a7edcdca9701 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -249,7 +249,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>   		goto done;
>   	}
>   
> -	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
> +	args.dst[0] = migrate_pfn_from_page(dpage);
>   	if (order)
>   		args.dst[0] |= MIGRATE_PFN_COMPOUND;
>   	dfolio = page_folio(dpage);
> @@ -766,7 +766,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
>   		*pfn |= NVIF_VMM_PFNMAP_V0_W;
> -	mpfn = migrate_pfn(page_to_pfn(dpage));
> +	mpfn = migrate_pfn_from_page(dpage);
>   	if (folio_order(page_folio(dpage)))
>   		mpfn |= MIGRATE_PFN_COMPOUND;
>   	return mpfn;
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 26ca00c325d9..d269ec1400be 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -140,6 +140,11 @@ static inline unsigned long migrate_pfn(unsigned long pfn)
>   	return (pfn << MIGRATE_PFN_SHIFT) | MIGRATE_PFN_VALID;
>   }
>   
> +static inline unsigned long migrate_pfn_from_page(struct page *page)
> +{
> +	return migrate_pfn(page_to_pfn(page));
> +}
> +
>   enum migrate_vma_direction {
>   	MIGRATE_VMA_SELECT_SYSTEM = 1 << 0,
>   	MIGRATE_VMA_SELECT_DEVICE_PRIVATE = 1 << 1,
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 8af169d3873a..7e5248404d00 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -727,7 +727,8 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   				rpage = BACKING_PAGE(dpage);
>   				rpage->zone_device_data = dmirror;
>   
> -				*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +				*dst = migrate_pfn_from_page(dpage) |
> +				       write;
>   				src_page = pfn_to_page(spfn + i);
>   
>   				if (spage)
> @@ -754,7 +755,7 @@ static void dmirror_migrate_alloc_and_copy(struct migrate_vma *args,
>   		pr_debug("migrating from sys to dev pfn src: 0x%lx pfn dst: 0x%lx\n",
>   			 page_to_pfn(spage), page_to_pfn(dpage));
>   
> -		*dst = migrate_pfn(page_to_pfn(dpage)) | write;
> +		*dst = migrate_pfn_from_page(dpage) | write;
>   
>   		if (is_large) {
>   			int i;
> @@ -989,7 +990,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>   
>   		if (dpage) {
>   			lock_page(dpage);
> -			*dst |= migrate_pfn(page_to_pfn(dpage));
> +			*dst |= migrate_pfn_from_page(dpage);
>   		}
>   
>   		for (i = 0; i < (1 << order); i++) {
> @@ -1000,7 +1001,7 @@ static vm_fault_t dmirror_devmem_fault_alloc_and_copy(struct migrate_vma *args,
>   			if (!dpage && order) {
>   				dpage = alloc_page_vma(GFP_HIGHUSER_MOVABLE, args->vma, addr);
>   				lock_page(dpage);
> -				dst[i] = migrate_pfn(page_to_pfn(dpage));
> +				dst[i] = migrate_pfn_from_page(dpage);
>   				dst_page = pfn_to_page(page_to_pfn(dpage));
>   				dpage = NULL; /* For the next iteration */
>   			} else {
> @@ -1412,7 +1413,7 @@ static void dmirror_device_evict_chunk(struct dmirror_chunk *chunk)
>   
>   		/* TODO Support splitting here */
>   		lock_page(dpage);
> -		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
> +		dst_pfns[i] = migrate_pfn_from_page(dpage);
>   		if (src_pfns[i] & MIGRATE_PFN_WRITE)
>   			dst_pfns[i] |= MIGRATE_PFN_WRITE;
>   		if (order)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 23379663b1e1..1a2067f830da 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -207,9 +207,8 @@ static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
>   			.vma = walk->vma,
>   		};
>   
> -		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
> -
> -		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
> +		migrate->src[migrate->npages] = migrate_pfn_from_page(folio_page(folio, 0))
> +						| write
>   						| MIGRATE_PFN_MIGRATE
>   						| MIGRATE_PFN_COMPOUND;
>   		migrate->dst[migrate->npages++] = 0;
> @@ -328,7 +327,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				goto again;
>   			}
>   
> -			mpfn = migrate_pfn(page_to_pfn(page)) |
> +			mpfn = migrate_pfn_from_page(page) |
>   					MIGRATE_PFN_MIGRATE;
>   			if (softleaf_is_device_private_write(entry))
>   				mpfn |= MIGRATE_PFN_WRITE;

