Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C74B9B320F9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 19:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CE710E170;
	Fri, 22 Aug 2025 17:03:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DunmO4jA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061.outbound.protection.outlook.com [40.107.100.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6C10E170;
 Fri, 22 Aug 2025 17:03:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9f9LK7gNfiW4xzcluNdEqYGoYa0GmnbKpOdobLNBO/YBQOIrGS1dX3Y0Cj7DEEdSTi+W3MzAbE2wYpZg8vIlZBomz2H6PXUyxyGsQg717MFKHoFplvaIpyjjhPziu/2KM0bbuHxMXuhpHHfLuh4lrr9EahbINVP5JKzRfzfKD0gn6g8xFII4nsjc9n8VI5eEq862t6bhCLNf+KXh2+L5DQUTDPfRK3JHXc4l3JGZyksfUFd+pgfv21M5Pta05+wnMZ2WGP2mbt4JE06OCBDoFdQrz9c5+QWjtk3QctMHbxHKWdS+4UZBfx5UzJ8zam+43Gyl2Qwk56dNP7JlYjGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/+7QemjF75ZjF6JGcgD2XtA9yISqwNy7vUijFYlAfE=;
 b=ERQFrscOH4llH8zRZG7Sq9/hK+P50NnxoK9f5WCCfal5w0k6Hciz9EX/Qu0s6teMyN7jk1NAd1ZlRs/gE2d0DweOqovC/7ykNrr+3oHC4yNon2HMlAzSfJuzyeBFIZDbyHtWBXPdYixr1/2kA7PNgk5BmZbIkHs5n02v2OUfio/bPS+aCyD2lIpPGyVeZG/3bGAzO3D9xSp4Ti1fHwmK8DVamGDdwlKcYQFvj6kP3mz0AQZxUTCKki4H5YInRn3K+8pBEFAc/EfP9Y+V+aypIlpE3Ur9TuLYVr6PP7PwvpYDJu1mvZTJkHMaDvEKOpHhukEw+0yytXD5bedCYMkwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/+7QemjF75ZjF6JGcgD2XtA9yISqwNy7vUijFYlAfE=;
 b=DunmO4jAoiMgFdmOSPuLI3/PBM1pSgkfpwxSs4FKR36H4d6rkSmEc5Qg2nLLe+DV08hyZ9MQIDjSITW/Ko7BnKKZ8F7rlpAPz1WOtE29Vx32NSsYIoDbSZutD53FQlyrWm1w19NZ3H7j7KtXKnQN7UD+uZV9sJXBoinygwwub10y8tz8Sw2kRjQyn6jw6B/7RCKCI2gCve3XVK624LRhmeXZ2IisX0JAK2ogYEZCEtBA5HGiYnGeACmEelndiI/+jv/cnXE+663jWhIALAUwo6NDVWyIxjuYC23uOBCGYlRR6d7bdDqoOR2IGoQHCRbMNjFng4laN5kRMe6Iv3e81Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SA3SPRMB0011.namprd12.prod.outlook.com (2603:10b6:806:31a::7)
 by MW4PR12MB7144.namprd12.prod.outlook.com (2603:10b6:303:21b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Fri, 22 Aug
 2025 17:03:15 +0000
Received: from SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5]) by SA3SPRMB0011.namprd12.prod.outlook.com
 ([fe80::3228:78a0:2b93:2cd5%7]) with mapi id 15.20.9052.012; Fri, 22 Aug 2025
 17:03:15 +0000
Message-ID: <2cf6b444-33cd-4313-a624-8d1a9cd6ec9a@nvidia.com>
Date: Fri, 22 Aug 2025 10:03:12 -0700
User-Agent: Mozilla Thunderbird
From: James Jones <jajones@nvidia.com>
Subject: Re: [PATCH 3/3] drm/nouveau: Advertise correct modifiers on GB20x
To: Faith Ekstrand <faith@gfxstrand.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-4-jajones@nvidia.com>
 <CAOFGe97AN_yo7Mg4Z7s=qOFzSGzzs6CLEAhByf-ks2GthFj0aw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAOFGe97AN_yo7Mg4Z7s=qOFzSGzzs6CLEAhByf-ks2GthFj0aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::39) To SA3SPRMB0011.namprd12.prod.outlook.com
 (2603:10b6:806:31a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3SPRMB0011:EE_|MW4PR12MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: e22664e9-c663-4320-520d-08dde19dc8cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M0hXTE05elYybStkUEUrcWxtU3dheDdLY1k0dE95Z1FIdGl4a1Mya1RXT01O?=
 =?utf-8?B?SmttR1dzeklqdENjNnIzMDNJeGxKOTcxb1F5VnlkbEUwQ1hzdEkrbGkvNDg3?=
 =?utf-8?B?eHIyak1GckdkbG9kZElIWEhvYUhxcW9BT05NdHZGa0tSdHNicDZEZkhBZHJx?=
 =?utf-8?B?eFlMRjQvUHN0R2hxYWtJMWFTSFJKVTNDWTBFNlZuRUlMMlpXby9Pb1E1ZnFn?=
 =?utf-8?B?VjMvc1JHRys2akV3clMzWUZCNHdtbUgwNG5OZ0pIRVQ0SENGOWFtWUFqbkxL?=
 =?utf-8?B?KzBvSmUwSE5FMWZXL2VJVDFBa0FGK2c3VDc4c0hBOEFScERKd0Ivc1JHRnly?=
 =?utf-8?B?VkVUT1hyWitRMDlyZWp6WVlPT0VQTkc3QVlVV2x0aVJ6NjRqOVU2R09qVUpx?=
 =?utf-8?B?ZXZlanFjT3ZKQlh6NmRjTGhialJLaDFsa0tOeWVIK1NYSWRqOHlFaU0xSm5t?=
 =?utf-8?B?d2FJYVN5Z2Rqd1VQR2xWQ3JwUGdXMXFtY29SMXQ0RWh0akpscDFhYTRrTzZZ?=
 =?utf-8?B?cWc1N2VkNHlKQkhjK0hGcGl4YmxoREQzUlFocnhtNDRUVG5TZkQvQXJ0YUUy?=
 =?utf-8?B?NHZURUF0SGN2MFg4TVJKZjVyeEhvU0RqVUpvbUUyYkhGUDU4bktJQ1F0Zkdj?=
 =?utf-8?B?TjJ0UU93aWFUVm1kbTlZTFhZWjZaSWlEYTFDY0J1TGkrdkNVbXp5dGJ0MHZT?=
 =?utf-8?B?U0h4YjF6YTJrOHBTbmpHRDdHK2NkRXN3YnRTWWNiZjduVEhxb0NpajhmUTZV?=
 =?utf-8?B?b0lETDBYNXFjMFlLUkR1MU81MHRaYjdxdE9xTWZLTWhqYjZYN0RGUFZ0Y1RO?=
 =?utf-8?B?ZVdEc1FTWmJHeUJtQ1Z2ZWg0dFVaSHlaeUJkcjZ3RmZiOUZjQkR4RGtuZDRl?=
 =?utf-8?B?MFhidDF2ZUJnZFd6dVRkbWU5SmlMNWR4bXoyTkxJZGdyMjFkYkZaUTJnYnNH?=
 =?utf-8?B?YXhuNXhsbUlCUjlUc2RMblVjOHQ0YkJrR1pobjQvU290UjEyaHBjNERDcG92?=
 =?utf-8?B?Z2VIaEFvQXFFUzd3L3R5dGhtem5qYkVWNkwvR2RQT2hZMkZ5b0NWTmZqY1lo?=
 =?utf-8?B?d2xTakIrUVNVQTh0SWJIdjdGYWRKUUlTU3RrRHdQa3REUmtyVVdZVEdkK3dK?=
 =?utf-8?B?VmQ0Tm9jSjJ4NU1xdmFHYVpCTWF6Z091TWFNcVg0d2xnMGFhcDBZVGl1WVZS?=
 =?utf-8?B?a0lOWTNkU1o2djJYUTZpRWdIbEpXL21kS0EyVlVVMHlTa05SZEhtL2E3Zkxp?=
 =?utf-8?B?bElYT2dOOUJSc0FaSnA2a2YweEcvRzUvNG5VY0FnWktvY0JWeWVtNGZNV2dJ?=
 =?utf-8?B?KzlKZk1VTEhoMDFBVWpRZmtwbzVJTUQ1NFdpWjBRN1YrcnUxWE1Pd2pFSU9T?=
 =?utf-8?B?ZmRPZVBjdisyK0FSbXJSUEdwOHVReFRqVVVRa1cxVTNRSzRIR3UzM1owOFdM?=
 =?utf-8?B?V2JQOVRUSndENHJJQkhHQWZuK2pnU1VPYUN0WXJ1Z1hzWThCNFBzaU9Zc1Av?=
 =?utf-8?B?OXA5OUFBeE1Vdk03YWYyeVI0TVRBTzJ1N0JZNXZKMWIyTVZTYjhYKzg4MG9v?=
 =?utf-8?B?OE9WeVhxVk1FMHorQVNGN1ArN0xPWkdaY0wzdnFaZWRuNC9jenR0QWM3cU1C?=
 =?utf-8?B?aGVGMUd6T3dWa3RVZ0I5TTdKYmFoWWNKV0M2bVVOTm5mVEN3Y0JWRW1FNjVD?=
 =?utf-8?B?MUs5S1g0QWhUQlAvKzZXT290NFZUNk9vdWFST1pIKzNweWRGSTVEVmNuYWhV?=
 =?utf-8?B?aGdEUExIMVF0NkN3a2txU2NOZFNBNTdLR0dwSzdpVlFGNHJoUy9wYzROdVFW?=
 =?utf-8?B?YXJBVkt3cTY3MDdFZTRqaDNyejBRRGwwM2dMTjYrU2Uvam0rQldGWndraHZT?=
 =?utf-8?B?RERnbFRWV045RXlvQWdQZlNTdnVwNzdpcVVRaEtJeE0rdmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3SPRMB0011.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elpINDhzVW54TU1LOTVwaFlsYXJjVW9YYVFSNWNuYzEvR01DM1lDM2l0SHU1?=
 =?utf-8?B?UkI1eGxLNUFGKzMzU01FS0JWVStpWHUvZll6dDhSdW84bk84ZGRYNVczTGVV?=
 =?utf-8?B?WVpEYkthNXJUaGFIR3BENDI1SE0zYzdPTlMyR2hoOEdrL2phR1YwNXlMY1d6?=
 =?utf-8?B?cXZ6NnYvMHBZd0w3a1lYRDNrUjVIOGhyMWEwQU1xd0RkZmlNUVZ2eDNjaERY?=
 =?utf-8?B?SmFUdk52MlUwQUdPS3VJeXRQUkdFU04xQjFGcExOQml4d3NFSTFKb3plRjk3?=
 =?utf-8?B?dFZvdzF3ZFZJZ1JkUkNZWFJrZWFTSXNCOEljMHp6U0NWZjFCUGJpTnhjbmFS?=
 =?utf-8?B?QVArVHlxeFZwT1lsd2JXMERKWVpGbGJVUk1JWVowWnpPQzdUNlh6VzdycWlk?=
 =?utf-8?B?ZU1CWk00ejFRVkpOb3g0eElZQUJnVktyazlqMVVkcVluRmoxUDdicTdJMmxy?=
 =?utf-8?B?NnJoRTNsVTR2WEdSWTJ4Yjd0QVZXUjJ2b2lPckRnUkl1V2tRY0VsYzZPdFhh?=
 =?utf-8?B?Wk1jcGpzRkYwVWpZUTlmU2Y0TjlXUDlteU1lYVFBS3RETExQTHJsYmpwVlZp?=
 =?utf-8?B?VWp3S0ZlQnNDamF1NkpFMC90UG94K21RZ2ppSFVGY1djNFV4T2lTcjJRRWZm?=
 =?utf-8?B?YVFoWStUZDBJaU55Rit1YzZtUEF4K1J5SHdOWlRnKzNqVW1BMkcxM2dKeXBC?=
 =?utf-8?B?SW9NQTVIRWZ3VjI5Zm5hWGEreE5jbHdGaVdhenlLcWptQ0RaUXRYQ0xNWnZB?=
 =?utf-8?B?ZTcyVGpPM3BHeFJyczVSUGpWY08ySmNmMzJuV2tyZ0dRZkNPaFVVMDFpa3ZH?=
 =?utf-8?B?MEp3amk2MVVEamxidEVVWW9iM0FoMWdNWjlVbXFVRnFXZXBtamhSMWpCTjNE?=
 =?utf-8?B?ZVdMaVpOcG5uWGt5eXlYZEFSSVM3a2o4V1dERDE1blljV2laVElzM0pBTURZ?=
 =?utf-8?B?cksxWi8xT3E5N05qMlFNRHVldC9XdHVjdllMbE12TGJLSmVyMFBrOWcxVjlq?=
 =?utf-8?B?OEt4RnNYOG5vQitHY0RrSG5DOEpNYzl6US9La29UU3o0aXZ2Z09kS1grcnVE?=
 =?utf-8?B?cDd1ZjFXcXhBRGZ2UkxjSjI0MVJ4NVdsTnQzQnE3TGNPM3Rzd2ZmZWt6MjZ4?=
 =?utf-8?B?OW9wWnFZSkFYd3hjNzY2bE5uSXhuUzduWlJ2TmtFcGIyU3NsQlBSNDRvSE5I?=
 =?utf-8?B?NWFyc0Q0S2hWdXAzTEFZWDgrRjdQQ2FwN1BEbmF4MlM4SCtMMGhscmloNUxw?=
 =?utf-8?B?SzIzbjd1WXRzSys4T09DdWFUY3ZhUFFxYWhYVmtyZnp6SFhHMjdxZzUvSHoz?=
 =?utf-8?B?N3VBWmp6LzVHWVVENkNRMGV6ZWxJTUpOUkc2Mno4TXJpVnBtY1ZCT1dld2tE?=
 =?utf-8?B?a1lUbUhvMFhBbHp1eDVIOG1GT09NeUNHaGZjNmhmQnd6bWN2YXkrWlNacnp0?=
 =?utf-8?B?NXJldjRzQ2NrY3ZleEdFNHJpalM3S25OVVRQY3krcmpMVnM2VWt3MkJCcUZY?=
 =?utf-8?B?dm56ZnZjak0waHZmUHJYcmxxMzc1SjRtbTVqS3Fxb2R6MVhoakVUUi9XeFBN?=
 =?utf-8?B?aEhoZ240TWhhKzM5dGtTZk9KdWYvc2c3MU5UT3NYWlJQMFhhNmlCdXV6Wm9j?=
 =?utf-8?B?THQ2TGtkUDJZSU1Sd3FKc1hQMnR1QjYvN3RoZzE5RmJYTW9tU3ZwODV2WGVy?=
 =?utf-8?B?TjJtdG9VODVObDJYempienl2bWZOT05UUlpuVzV4TkdheW9aWXNrSTBPdWFL?=
 =?utf-8?B?YzFTR1crZVRpUWxuS2wwMlRTV3VRUDJzRG00Z3U1MDBWYVJ5WC9PU0JWOUJI?=
 =?utf-8?B?M3VFMW9oczNINzdqNnpIc2ZndGR0NXo4SlA0UW00Y1dzK0VVTEJxNHVCS1dV?=
 =?utf-8?B?dUFHYkJUNllMYXZwQzA0ZnRqYVFtOERoZExrNWpOL2VwS0FpQjh1V1MyMWlm?=
 =?utf-8?B?ajJOMkVHTjNWMkFiR25JTXRpSE5uMVowZG5QaHVFQ1pFQnJaeEJPYVNtL3R3?=
 =?utf-8?B?dlE2UVVLa0NSbk50bExORVdZbndhR1RaVEdNWGlrcVNOSS93dlYzT0ZvQVFK?=
 =?utf-8?B?eEZlZjcyYkpSMmFpbTcwaHA0bm5pTktVMTdBcjR6dktCbW5iQm5od2M0SlV0?=
 =?utf-8?Q?H5hVl7QTR7baECUvv0y0MbBdq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22664e9-c663-4320-520d-08dde19dc8cd
X-MS-Exchange-CrossTenant-AuthSource: SA3SPRMB0011.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 17:03:15.3209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cPcaYib2+x1TIOeyW4SaGS+y1Ofx9dDHndZ9eqbnV2pEue71m6EzsXOCWJXH+XK9gqWDOXsMe5wXIBQ5lJJKOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7144
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

On 8/22/25 08:48, Faith Ekstrand wrote:
> 
> On Mon, Aug 11, 2025 at 5:57 PM James Jones <jajones@nvidia.com 
> <mailto:jajones@nvidia.com>> wrote:
> 
>     8 and 16 bit formats use a different layout on
>     GB20x than they did on prior chips. Add the
>     corresponding DRM format modifiers to the list of
>     modifiers supported by the display engine on such
>     chips, and filter the supported modifiers for each
>     format based on its bytes per pixel in
>     nv50_plane_format_mod_supported().
> 
>     Note this logic will need to be updated when GB10
>     support is added, since it is a GB20x chip that
>     uses the pre-GB20x sector layout for all formats.
> 
>     Signed-off-by: James Jones <jajones@nvidia.com
>     <mailto:jajones@nvidia.com>>
>     ---
>       drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
>       drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
>       drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
>       drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
>       4 files changed, 59 insertions(+), 3 deletions(-)
> 
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/
>     drm/nouveau/dispnv50/disp.c
>     index e97e39abf3a2..12b1dba8e05d 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
>     @@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)
>              }
> 
>              /* Assign the correct format modifiers */
>     -       if (disp->disp->object.oclass >= TU102_DISP)
>     +       if (disp->disp->object.oclass >= GB202_DISP)
>     +               nouveau_display(dev)->format_modifiers =
>     wndwca7e_modifiers;
>     +       else if (disp->disp->object.oclass >= TU102_DISP)
>                      nouveau_display(dev)->format_modifiers =
>     wndwc57e_modifiers;
>              else
>              if (drm->client.device.info <http://
>     client.device.info>.family >= NV_DEVICE_INFO_V0_FERMI)
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/
>     drm/nouveau/dispnv50/disp.h
>     index 15f9242b72ac..5d998f0319dc 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
>     @@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct
>     drm_encoder *encoder);
>       extern const u64 disp50xx_modifiers[];
>       extern const u64 disp90xx_modifiers[];
>       extern const u64 wndwc57e_modifiers[];
>     +extern const u64 wndwca7e_modifiers[];
>       #endif
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/
>     drm/nouveau/dispnv50/wndw.c
>     index e2c55f4b9c5a..ef9e410babbf 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
>     @@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)
>       }
> 
>       /* This function assumes the format has already been validated
>     against the plane
>     - * and the modifier was validated against the device-wides modifier
>     list at FB
>     + * and the modifier was validated against the device-wide modifier
>     list at FB
>        * creation time.
>        */
>       static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
>                                                  u32 format, u64 modifier)
>       {
>              struct nouveau_drm *drm = nouveau_drm(plane->dev);
>     +       const struct drm_format_info *info = drm_format_info(format);
>              uint8_t i;
> 
>              /* All chipsets can display all formats in linear layout */
>     @@ -800,13 +801,32 @@ static bool
>     nv50_plane_format_mod_supported(struct drm_plane *plane,
>                      return true;
> 
>              if (drm->client.device.info <http://
>     client.device.info>.chipset < 0xc0) {
>     -               const struct drm_format_info *info =
>     drm_format_info(format);
>                      const uint8_t kind = (modifier >> 12) & 0xff;
> 
>                      if (!format) return false;
> 
>                      for (i = 0; i < info->num_planes; i++)
>                              if ((info->cpp[i] != 4) && kind != 0x70)
>     return false;
>     +       } else if (drm->client.device.info <http://
>     client.device.info>.chipset >= 0x1b2) {
>     +               const uint8_t slayout = ((modifier >> 22) & 0x1) |
>     +                       ((modifier >> 25) & 0x6);
>     +
>     +               if (!format)
>     +                       return false;
>     +
>     +               /*
>     +                * Note in practice this implies only formats where
>     cpp is equal
>     +                * for each plane, or >= 4 for all planes, are
>     supported.
>     +                */
>     +               for (i = 0; i < info->num_planes; i++) {
>     +                       if (((info->cpp[i] == 2) && slayout != 3) ||
>     +                           ((info->cpp[i] == 1) && slayout != 2) ||
>     +                           ((info->cpp[i] >= 4) && slayout != 1))
>     +                               return false;
>     +
>     +                       /* 24-bit not supported. It has yet another
>     layout */
>     +                       WARN_ON(info->cpp[i] == 3);
> 
> 
> Should this really be a WARN_ON()? A DRM log message, maybe, but 
> WARN_ON() implies something went funky inside the kernel, not that 
> userspace asked for something it shouldn't.

This is indeed a something funky in the kernel case. See the comment 
above: "This function assumes the format has already been validated 
against the plane and the modifier was validated against the device-wide 
modifier list at FB creation time." This isn't technically true at 
format blob query time, but in that case this function is just used as a 
filter against those same lists. Hence, the implication is someone 
modified the kernel to report 24-bit formats for some display plane on 
this device, and the WARN_ON is meant to guard against that/validate the 
assumption from the comment.

I went through the DRM code again to verify the "format has already been
validated" assumption still holds up, and I see these callers of this 
function:

drm_plane_has_format() - Validates the format against the plane's format 
list right before calling this function. This is the path a format from 
userspace would go through, indirectly as a drm_framebuffer property, 
when validating it against a plane during a commit operation.

create_in_format_blob() - As mentioned, simply iterates through the 
plane's format list.

Thanks,
-James



>     +               }
>              }
> 
>              return true;
>     diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/
>     gpu/drm/nouveau/dispnv50/wndwca7e.c
>     index 0d8e9a9d1a57..2cec8cfbd546 100644
>     --- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
>     +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
>     @@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw,
>     struct nv50_wndw_atom *asyw)
>              return 0;
>       }
> 
>     +/****************************************************************
>     + *            Log2(block height) ----------------------------+  *
>     + *            Page Kind ----------------------------------+  |  *
>     + *            Gob Height/Page Kind Generation ------+     |  |  *
>     + *                          Sector layout -------+  |     |  |  *
>     + *                          Compression ------+  |  |     |  |  */
>     +const u64 wndwca7e_modifiers[] = { /*         |  |  |     |  |  */
>     +       /* 4cpp+ modifiers */
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
>     +       /* 1cpp/8bpp modifiers */
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 0),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 1),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 2),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 3),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 4),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 5),
>     +       /* 2cpp/16bpp modifiers */
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 0),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 1),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 2),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 3),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 4),
>     +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 5),
>     +       /* All formats support linear */
>     +       DRM_FORMAT_MOD_LINEAR,
>     +       DRM_FORMAT_MOD_INVALID
>     +};
>     +
>       static const struct nv50_wndw_func
>       wndwca7e = {
>              .acquire = wndwc37e_acquire,
>     -- 
>     2.50.1
> 


