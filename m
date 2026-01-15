Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B7D222A4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 03:41:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574FC10E6A7;
	Thu, 15 Jan 2026 02:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FCtau6J7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16FF810E69E;
 Thu, 15 Jan 2026 02:41:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJ0/6VfCDbqMFfh95VUNPnXCTeOyk+QBqeyxWsf3R/X9sp7/IpZEfADvg6eUYPi7c5P+XFOjI0BtQpVRWjz85WK49NZi/gTdvE+0AxywBcp8E1SdFV7Jod+OY/6oVq1fk7Ue4iWd42+qNujARopmaN8y/e9meIBNlEUUbXRiC//QwsVGV0CPhN6Ou8XNKUHt+5A3kZ6Oqv+uoCkVHe8XlxxxplcWwP92nKOpoMXPg9t9ychdVm9L6A+UtShBwfbpe4RBRTJz/pFwFgnn7CZEgC7u+S0AvlWwOKifurvvh9MSYdsU+CXtRso/PSCHe/Ew7BmSxbNfZnMgqG7UJQ4V+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qb9jiJ5EzrhDcnGS/xZpQT/xhqGn0voxKi3vSxb6Xkc=;
 b=zI2rEGRlv+f//+GKh59qUkgX/5FwooLAOWpwrPaenLkC9ZfpkY5/aYvrLo7Z6vnBDUJvVWNiA+OUYw1DiJCoxmC4kQdNAbK1RlT7E/bSJjpCPQtAcMKG4+VuiqPc+cegmK5A4TeqcXQjxJ9vH/LOu/3QGZy3tcAwCW+FBks4yoyVkw4/c/gjf9eYclV6OJ1AN49swoXW8IYegALHFFt78FxteRCNsP672nXxarfLLSA3KgCd8LgUr+qr02IRznt1MksfJBTw4lVE13L/pWV2DtXrivJ9d6QWRx096INrVuz5EzQeyKn4565F9gaDDCbnl+Ppb7OducVCjDc4pkU97A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qb9jiJ5EzrhDcnGS/xZpQT/xhqGn0voxKi3vSxb6Xkc=;
 b=FCtau6J7fkXcIAgRd3aVSfi1Jrty6tfYUVtTLisEnuPenseQO/pqQ7HmZd33APrbhFG3QPXZwTmCVrLaLBk+INWIRqJsGxR2h7y4FPw9C0wtpjut9W2JrVFGu8xJf0a9dM+UXvcJ20eR9OzYRyeI+i0TNF+TlnnLAz4GK3O4OLXphuaC0h4wQq+LfHBvWM90rFWr9RWhP+QtB3iYu/UuvNbjQEpv/TaCm6qGGYaYHW3aP8bN9c0FufArL6B5Oyk7fHtiCdLQdBApfGHa7ioOAjm0bXWSKBjVr/umWUTsRcIpHCpJu+1a8PP9YLS9SPUSSlpU8NV331K3YNS3mhkEcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 02:41:18 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 02:41:18 +0000
Message-ID: <ce644d03-2257-4bfc-ae3e-3d6e578c3cad@nvidia.com>
Date: Thu, 15 Jan 2026 13:41:11 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] drm/pagemap: Unlock and put folios when possible
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Andrew Morton
 <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, Matthew Brost <matthew.brost@intel.com>
References: <20260114192111.1267147-1-francois.dugast@intel.com>
 <20260114192111.1267147-3-francois.dugast@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20260114192111.1267147-3-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd8bf9e-edea-4bf8-74cb-08de53df8f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitGVjBOQ1laMU1FWGE0T1E0NHNYU1BtQk5yUEptYUdZcUdzVktuYXpKVG9G?=
 =?utf-8?B?a3EyWTFkb3lJYWxZOGtLMHVMWS8ra3FJcE0xaEd2c1lldndKeEVsZVV2WDZj?=
 =?utf-8?B?cEtLdXNiQXp3OU5jRjVEblJsa0pPMjlRbTY2QUl3Y1pGaE5pOVM0cUtNNXhJ?=
 =?utf-8?B?WnpXZ0xzaCtyS3hFTW5TYXpEL3NDcDNOTkFYY3JrYzk2KzN4d0JYMFNDTWxw?=
 =?utf-8?B?bHpDamtMMUZ1Q2pyV3M3OVVXamVvQ1pMMXJuZ1ZVeVBXbGs1dEJZTTk0OElD?=
 =?utf-8?B?TEdXUkJQS0JhK2dLTFltU2R1TjZjNHhZRFptOXA5eklYZFR1ZXdVSS82Z1E3?=
 =?utf-8?B?c0dpTjM5VCtKS3NGYzhNQ2IvLzgwQ2RpU1AzamVUL01mc1phTVhTejFhd1k3?=
 =?utf-8?B?bVNFMHpNeHQ2Nk5Xa2hxa3FacXhwQkxLZmdzRlp2c2ZtQS9UT1VWL2Q1czds?=
 =?utf-8?B?bGZ3NEVCeGY5MUhSRDAzbHc2NjExZG9IOVJWcDdOKzdJK1cyQ2RlbnhndjRE?=
 =?utf-8?B?U2NHZmo2UDAzeE1POGtCRzhxWXMxZm9kZ215Qm9wT1BNc3RINHdBSXh5eFZl?=
 =?utf-8?B?NkU0dGdMcmhNRm1ObndwUzgxYVNIelJ6SU9JSlo0Sk9XZy9rZ2h6eHdKeHll?=
 =?utf-8?B?WUdvbDU5N29RMnJRTDJSZlkvNnBsc3NINitwMnB0OCtGK2pxNTBQdVdHT2Fq?=
 =?utf-8?B?aGh1Q0ZIMTljdW50OUl5K2E4YW1LVzdsTzEwM0Z4TXVwZkdRUG9WZjlZSWZD?=
 =?utf-8?B?b3ZJZ1NxTnZuTTNQd2VScXhYYjBTcW5KbjZqMGtWdzhIN01DcWF6YnpYNUxz?=
 =?utf-8?B?NlpaWC9lcFRadnpNMno4LzZydWNXLzhpRTY4K2g4elJzVWo0ZGJrU3dHcnM1?=
 =?utf-8?B?RittYkJnZkpsQWxWcEtrYzhtUWZPVjFKZlM4RHlQZzMySGtjQXR6SW95S1F2?=
 =?utf-8?B?bHpkNnNCbGJzUm1ZcGJ3U3NsUjlJbXVQdjgvSnJIQUZsYkZxaEVQRnYrVUk2?=
 =?utf-8?B?VXNBWVpkWWovR1VBTkh1Tmd4bTRSRkgrbXE2WVE3QzRrM1dVTFUyWlcyelAw?=
 =?utf-8?B?QXFmSGpEcEVLUVF2bUJPQTJqVG5PZE4rMzV1OThNUDdJVVFLUko1MllFa1BL?=
 =?utf-8?B?SDN3bmVuNDdDVFNlWklkVStDeXdUVHRLc0tkTUk2UXBZOFFTODhrWDJnZDB6?=
 =?utf-8?B?TjlQVzRQL0ZYRmk0NlJDbnQrY1RnYWJZMUZ0VUpYSUFTTUc5ZnNkczBzclMv?=
 =?utf-8?B?amJISzZORHJpZVNSdHJQZEdlSzVVKytqWEgrTVZPT09ERHkxTVFOcm1nMFZO?=
 =?utf-8?B?elNEQ0Q3Mk9pR25OWmtMNlEySzhQeGx5WWdidWoyZW01OVl5ZnhtU0hEc0h6?=
 =?utf-8?B?UWY0VmhhMXBOMVRmalF6aFJ1SWRtaWRWcm1EMm5ybmJ1YkV6c0JVaTJBS3Rs?=
 =?utf-8?B?bnppVHgwNit3aHBKa2FVL1VKWVJ2OHBZNnZlWGtXUzJCZThaeTRxL1hZdnhj?=
 =?utf-8?B?N05XTFNXV1NKTHZQSjNqaURzY1VrczZ2K3licDk2TWprMy9IN0J3ZUpTbTVq?=
 =?utf-8?B?TnllaThiUC9DcGxzRVRFRnlmQ0t4M3dPTlB1NWRmanpMOUxqRWMyRmQyeWs5?=
 =?utf-8?B?TU1aZlJRSzcyVVV1T3VsV0w5NW0rL1dPUldQSC9qT09kNjVqZFJMZWM5T0lF?=
 =?utf-8?B?bnB4cnNtV3liTmpDS2NLWCt1MURERXZCWW5oa3FidGdZV3liOTUvOXRRMDA0?=
 =?utf-8?B?anQ3bHYydFU4Q0Y0QnVFRk5JeExDWTl3ODJZaEUyc1hpOTZxVWdGNjVYTFV5?=
 =?utf-8?B?WVBBZUNGTWZRenRzc0hnQ2w0L2pmT284d3U2aVVPZFVUQnVoMXQvRzRodTYy?=
 =?utf-8?B?L05SR3ZiWVgwZ21rVFViVTJsN2hEUlk3dXN2MjVuQmNvMVBMa25zRkdQMFQ5?=
 =?utf-8?B?SzJHcW1XczNFRmVNWSs3Y0pMOHY4T2JSMU96TGJQZVFQWWxhbzhLV2lqRnlu?=
 =?utf-8?B?WkpkMmpQT2gzZkVXVU0xd2VkTlVLUDVUZUlGT0d3Mk56c1podHpTQVptWjlQ?=
 =?utf-8?B?MVIxSVpGa29nR0tEWkZVNWtHSkZkTDZXZUFaNjZYMmpxbDA4WXRnY1diOG55?=
 =?utf-8?Q?azkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3dMRkVjRjBOcVVFOXhTVW11NTJ1ckRhWW1TcERJVWFiejY2dVFaSUgvb2pP?=
 =?utf-8?B?dDVwSWtQQ2ZwY1V2MWNJQzJYZUxldDZka2RibU0wL1NIblV3Qy9IczlCR3Bs?=
 =?utf-8?B?TEJ3NUZqRTRKRUY2R3gyOUx0emV3Sno5d000OUxoUGNsanpVOTJHdC9jbTRC?=
 =?utf-8?B?cHJaRnNlaS9GY21RVEw5QnFJTnJ1cXJEQmpRdUp2aXF2ajBzQlhDTytkOStG?=
 =?utf-8?B?MDJBZUFCQ1pkek4xTzk3VDB6RlQ3RHB2bWZacVNlOFBXSEZ0N2NRcGlRVk15?=
 =?utf-8?B?c09keTlvMFZvVUF6YnRTNDRsVkEyWlVIUEdodWJQdEZkMjBGSG5nR1FCM3Ny?=
 =?utf-8?B?QVBKOHJVNDdjQ3ZKQVFOWkY3VGYweURlZldWSDdoaktYR3V2SEY3LzF3VTRn?=
 =?utf-8?B?WHBTL04yWXE2bjQzdFRzMEpvNnRVSWNnc3FRR0pVb0wwcjBUOU1KVm9zOCtq?=
 =?utf-8?B?eUM3cjF1MEs2enpObzQ4YmVZYVlPUVp5UkI0MGlPS0FYV3RuNjFTekprZWc0?=
 =?utf-8?B?YzA1VVF0WHM2VC9JaFF4VVhaeVNYNlUrdHVRT3o0Rkw0UkhxODFwQ0xDNHJD?=
 =?utf-8?B?YVVuY2pkWFQ4OXg2b2prcEJiWTdZMVNGOXpzbXhUMllyOGlHSnRBNHZsa1pY?=
 =?utf-8?B?MmZaL0JWZEFaakRnMkJ0bk15THlkcnErTmZLcHBRd0poVFdJQlVJQ3pWRGh5?=
 =?utf-8?B?Nmk3c3E0aEpiK0tpNmFoaVE4YlZacG50ZE8wRDlBK3BnemV5bGhkMS8xNk5o?=
 =?utf-8?B?Kyt1YXplckd0YlRrbXFOcjI3RSttbWd5WTdLY1ozK3dwbXJEcnI5OTFhZXQ5?=
 =?utf-8?B?bm45dlV6SW94bmR3WjYvQUpEUVZiRmJEN0J6dDBLZWpBd0NPV2tZcU04TFpM?=
 =?utf-8?B?YnI4bFRMV1o0T2tZY2tDdW5UbkFQSERmM2owVjIrY0ZaVjdLSkFxRXpvYXBo?=
 =?utf-8?B?b1I3VzlzVkZ2MW5NZ0graHJ5dXd1cXpYdlhXcHNHcjU0bEI3Nm1NZERHTnhI?=
 =?utf-8?B?b2FCaGZrQUVNeWQ2cUlXQ2d3V0MrZGRreGlVZmd6cWdyUWxmU1pGSkk1cGxT?=
 =?utf-8?B?RUxteGd4M1hxQUF3eGZTRktEZmZ6SGVtd0FiSjRQdjE0WjhnRWVyS0xkN1FE?=
 =?utf-8?B?U2JOckltY1hDK0g5V3JVbXduR2VIU280d0cxYXdqaVFZMDE3LzVLT2NGdzhU?=
 =?utf-8?B?TmduWXltNzFZWWZJbXVMRW1wQUhUT0NFU2F3K1Y1dTdUOVpUaUswSDBwbWZh?=
 =?utf-8?B?U2l6WkhUZnJUVVlvamJ5L05tUVZJRVpYbFVZTWNhWTFMVVVjaDJnTUN5QUpK?=
 =?utf-8?B?TlRCeTROaHFLV3NaVjM1bmdvc0JiL0VYTUh6VWxPbEE3aC9UMFBwdjc4cnVh?=
 =?utf-8?B?VFZRN1RxbzV6SzFSTERMNHpaUTA4bGRjdlFKQlI5WEVLVGlRaUllQlVVK08y?=
 =?utf-8?B?Qm9CSXd2NmllZklRUC9GT3ZFU28xaEVWYUFLU2VWa1BvemphQWRMcFFCdGp2?=
 =?utf-8?B?dGhuT1M5cXhjMkJrRWFEU1J6RTJzaW56amVWNEludFhiSWsxOGdTUjV5aW01?=
 =?utf-8?B?SGJNL0NDRDQ2eFVpdTFhYjFYUDJWK3lRS2diL2ZTekJuQmhlTTNaWWU3R1lW?=
 =?utf-8?B?emVzdjRPcWNSYWlIWVVtS2FpMDlOZHU4R3U5OFRwSjBya1hsTWp6a09KM3Bs?=
 =?utf-8?B?aFAxVWlwSDBNcy9OR3BOOWh2U2l4bEZHYUhZZ1cvemJwUUE4ZVd1ZDh6Zndm?=
 =?utf-8?B?S3NCQjBFb3I3cnNKMHA1dHdIalpCRkVDcDU3TnNBUmFyYk54L3dBQm9Ba1NK?=
 =?utf-8?B?YVZZb1dnb0cydnhtYk1SWmd6czlxZy9WWW1JWFhqS2JDdHFjcVdRdDJLL3E5?=
 =?utf-8?B?QUdPckIrNFB1dWp0eGYybnRCWDdDVE9yK0tIY1ZubVNvMU95UWNXYmlIWXh5?=
 =?utf-8?B?Y3d1eTRQekk3L3VUb3RZRFhBeStYYTV3aFVDcFAySkxPODg3dFlLZVgwc2c4?=
 =?utf-8?B?aWVEbldRck9PcjhuYkNiODJSdUtwZlg4UC95cHNYR1NsYUFwVGp1aUNLb2N4?=
 =?utf-8?B?aWF2WTlUVWUzOHZBNmNmT3cyd2ZDR3QwdXpydGNNZzZITlJqOVRYYUxsaW9G?=
 =?utf-8?B?aU5mdmdZQVRHWkIxNVlwK292MkJvSHIxd0dlL1UrdTlLMEs5QVdXMlJod25Y?=
 =?utf-8?B?OCsvaEdCYWhhbEJBYXROc2h5d2xJNGF0MHJ2R3FaY2ZKL1QyQm9qV25NeDJW?=
 =?utf-8?B?dlk5dVQ3Z3B6ZDhoNzFIbjFrencwNHhSbUxyaGNEZ0JMcU9JWVZHWkRRSTY3?=
 =?utf-8?B?cUJvOHd3QVNXQm1TQ3hrdk1sZXNPTjB6SEtKdXBJMzBhNURPTmVjcy9yS2Ix?=
 =?utf-8?Q?c7slYwVuMftFYES0vPdy+SvHN+FO+PdE1n+xw5EnElTa8?=
X-MS-Exchange-AntiSpam-MessageData-1: 3mMNd8iMaPN0YA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd8bf9e-edea-4bf8-74cb-08de53df8f32
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:41:17.9356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+A3JcMu6pZCgQrdXMsYZcReWyOXtC0iJdMpAspbII4kdP2A4oAQXbVxqywae9JZG4B4P7J7NXItww19WHfIYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

On 1/15/26 06:19, Francois Dugast wrote:
> If the page is part of a folio, unlock and put the whole folio at once
> instead of individual pages one after the other. This will reduce the
> amount of operations once device THP are in use.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Balbir Singh <balbirs@nvidia.com>
> Cc: linux-mm@kvack.org
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/drm_pagemap.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.c
> index c497726b0147..b31090b8e97c 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -154,15 +154,15 @@ static void drm_pagemap_zdd_put(struct drm_pagemap_zdd *zdd)
>  }
>  
>  /**
> - * drm_pagemap_migration_unlock_put_page() - Put a migration page
> - * @page: Pointer to the page to put
> + * drm_pagemap_migration_unlock_put_folio() - Put a migration folio
> + * @folio: Pointer to the folio to put
>   *
> - * This function unlocks and puts a page.
> + * This function unlocks and puts a folio.
>   */
> -static void drm_pagemap_migration_unlock_put_page(struct page *page)
> +static void drm_pagemap_migration_unlock_put_folio(struct folio *folio)
>  {
> -	unlock_page(page);
> -	put_page(page);
> +	folio_unlock(folio);
> +	folio_put(folio);
>  }
>  
>  /**
> @@ -177,15 +177,23 @@ static void drm_pagemap_migration_unlock_put_pages(unsigned long npages,
>  {
>  	unsigned long i;
>  
> -	for (i = 0; i < npages; ++i) {
> +	for (i = 0; i < npages;) {
>  		struct page *page;
> +		struct folio *folio;
> +		unsigned int order = 0;
>  
>  		if (!migrate_pfn[i])
> -			continue;
> +			goto next;
>  
>  		page = migrate_pfn_to_page(migrate_pfn[i]);
> -		drm_pagemap_migration_unlock_put_page(page);
> +		folio = page_folio(page);
> +		order = folio_order(folio);
> +
> +		drm_pagemap_migration_unlock_put_folio(folio);
>  		migrate_pfn[i] = 0;
> +
> +next:
> +		i += NR_PAGES(order);

Is this just a wrapper on top of folio_nr_pages()?

>  	}
>  }
>  

Reviewed-by: Balbir Singh <balbirs@nvidia.com>
