Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1CAB11F5D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C1110E229;
	Fri, 25 Jul 2025 13:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ggCr0Bu8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2065.outbound.protection.outlook.com [40.107.212.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC48010E229;
 Fri, 25 Jul 2025 13:30:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm4anMRyCvVpCCqt/hYJ9DWVrK92mjhpBPyqsE3670Br/836xNMom3NPMELp3NJ9zI0OgR5YbOuhjUIKaSdaDdDhUHjN+OfYmc0IbpBgVyDuKDZspMtOBMxAmCdPguKFKJoW4y6Mz4wZARH6K5D+RA2Xi3KHVTzqv5mOXHn53PyN8FDn2CTLyeww0qTOi6h7QknA+I3rUDmXuCwEDKLdy01koAK0Hsp8ihf24iHiB08l2dtVZ8Qzi9xSiVT5YHFhJXJq3FYWmhMQZqMJsUFipbT3sBYUXSkOXP1VIAxle8PZoIfZxHl+NXVtx5dwPNZV78YA+Om32/UwcuJG1cx+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0tvaluYuzcQ9F03p21WAAnjoAGZtwdPxSq9AXBNnes=;
 b=TgKKrKf2o3x1IqrHLR5SsehWznytOrYN1pxOCX/V9GStbo84OZq5PK85dxLc/RgmAt4V+UYS1VaOAF6/vzeRmesrbaCwqpXdRYXdnZPFa+PKAFG6c/2aSRJCOIJ4sRZjET3Tj98Jo2RsHnvJoamQYw6NmbEmdfYbR90YKRk7hU7SmFn8hQqjXs86C0vJX80ltvm0nVFo2QGNupFUmaE39XektTTn8WhuGd/mhkuVmMIildc5sgyOVQ4UDbZ5A1h7cX5NNi2LoWSk26Amup4cFkixbIpkZkehVA29sE3eI6WuhK4ofJxWhic3CT71/KNwwdRpIft7AEh+Z5ND6ZAUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0tvaluYuzcQ9F03p21WAAnjoAGZtwdPxSq9AXBNnes=;
 b=ggCr0Bu8lzYTVJjhI2l6ov8xgZnilVwyH4vWvnsg/FGIxdAlwGg3l3zMVkhc60GueWsXF+j725IFN3x0qhvPnp0tgM0F8IJEHd6J3Idn2vKQorxFQaJfRWngaNxS9FonX120QuJ0+2Ph9UwOCGkwdVEx67qCRRp91lMgMJdGrKa6Vl3XtWbY/SeTKVPnV5DXS4VRUepAy8E+wmAW/1syQhrKESedk09o4VpG2ymXJORxiASx0ij+ku6WyucT5WoNPw11xPb6s33Yc9+KWgv6IPRkWqhuPhbrHbzk866Onp/00Kv0lHrUygsNJDdOxBkR9VmeFIagjLhlUrm9I80pLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 13:30:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 13:30:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 22:30:03 +0900
Message-Id: <DBL67Z2JPGOH.2ZMUNUYVQO7E4@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: vbios: change PmuLookupTableEntry to
 use size_of
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718073633.194032-1-krakow20@gmail.com>
 <20250718073633.194032-3-krakow20@gmail.com>
In-Reply-To: <20250718073633.194032-3-krakow20@gmail.com>
X-ClientProxiedBy: TY2PR0101CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 1283900c-1f71-4d61-b397-08ddcb7f5ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVN0S21CU2F0YXdRVzdrdnVHeEpnaXEzYW1PL0RuVTlPWFpJR1RXdUNSNU1T?=
 =?utf-8?B?bkllWDdBUFM3dnpKaWtETnFGL1UrQjRoNURlWVFYS1FyeDdCaFVtU0FncjJx?=
 =?utf-8?B?TE1DMEVJMHV6aFUzRVp3R2dUek9MOG1GTGVwK2l2cGRqaXplcGRHNUs4aysy?=
 =?utf-8?B?emVZN3ByajV0ZHkrRkErV2UxTTdBUit3cEZiYVFpb1lqUkNEdVQwMkk0Ym1o?=
 =?utf-8?B?ZUc1TUQycW8vQTNBTWptT3l6V2pCWm0vSC94aWd2TERBZlg1Qm9FTVZhNVov?=
 =?utf-8?B?cGMrVTF5ckJqOVpxRDNHQjdJWDMwTDRPa3NzTWw4YWI1OU5qT1E0dEVIZTRo?=
 =?utf-8?B?Rm4wQnBsZ0ttSGdTRGxqU1BvNDd3cEVFMVdCWUgrR0I3OHZiN21DWGRBMGlT?=
 =?utf-8?B?OS8yL21Gc012clNTQnNVNmxqNGxKQllRdDIrMTNGSmk1TVQzbjhkQzFTdmR4?=
 =?utf-8?B?SVFVTnFxWnFTRytrRExPdDcyMmZQODNFcFk0QVk0eEw2ZzRmMy9GM3orYjlG?=
 =?utf-8?B?UTBBWWRtOUJwcEJDZXF2VXIvT1Y4bndhalRXOWk2SENxNW5NaUwzd2hKcTRo?=
 =?utf-8?B?VVUwKzE0d0lJV2M0WFFLd1o5RFFVK0o2Z0wzYThDbVpyM09CNnBZZDFrNk5I?=
 =?utf-8?B?T0tWbG5UakwvZXVvTUhTQkNxbVJUaDI2OUpGVnNEdGtRZ0paWHVxcFZJT2dr?=
 =?utf-8?B?angzZnhqN3AyRHJ3Q3hjN3k3RlJZSUpDSzdVc1NEQ04ycnVZSHlyTVlGOGF1?=
 =?utf-8?B?YkRXaXV4NGJhNG51ZndRNjJNc2Z2VmRxa09vemVwSUxYaUxJQUR3TEFVSGMv?=
 =?utf-8?B?SDZEOVRLQ2VtOENpeGgza3pCSUpNWEJkTVo3bjVNcmI2RmVwczFlV0c0Wnlz?=
 =?utf-8?B?MFpGSXhHdjN0aDJ2MFh3TmEreCsvRmpSa0sweVhqYnhkTVdzcCtxYTBsMDNM?=
 =?utf-8?B?aFVpY3lramp0OEszNWhoZnE5YXRzZUxvbldCclNZZDU2RGFOWmtLaGMzcXFh?=
 =?utf-8?B?ajFyNkV2by9rYWZzNERYZE1Pa0YyRU9nR0wvOE96VllPb2FkMzEwQVA4T0pV?=
 =?utf-8?B?ZU9LRndqeERjeTQvdGdhdkU5RE53MnQyMC9xNXo4dHIyYm8wREV3M3FHdjZO?=
 =?utf-8?B?dmJjajlZVm9Xejd3VWVVaXFDNzBOamZZSXhjK3VnQ0k5ZHhTLzdoOWtUSUpK?=
 =?utf-8?B?UFZZemEyVVVhRnVBRXB4TDI1TE1nRVF1N1UvSUJIa2FneVcrVFk4OWxFSjF4?=
 =?utf-8?B?OXl3dVhIUVUrYjRSSnJMSlpmZnBadEx5OW5hL2JKNzUyS21BeS9FOFZoQ3du?=
 =?utf-8?B?M0dXRGtQZWRBd1doMFI2V3NSSjlXbklkejFXbHRBaGVZTU0yUzU0V0lQSjN2?=
 =?utf-8?B?SmhId0pwUitZTXpyajA4UllBYmFtUFNKc1BhVGxGQjNYaXNlc3V3QnZtemxG?=
 =?utf-8?B?RENSbFhZeHhSdGQ1TWZ6WURyRFdiY2tzUGV5TjJPNnhGSWM0aU1KVS8vbTBt?=
 =?utf-8?B?N01rbnJwUmpuckdyUFBOWWgvUzI1bFRHV0JSWlV4dWR1WlBKTVVtaVZoT1Jp?=
 =?utf-8?B?cDJqQVJFVi9tVlNEQTBGei94dGdXSTJJU1V2UUFVQnI0bmU3S0x6c3NBcncx?=
 =?utf-8?B?YnNkSzZaN3NYTWwxSHI1QnNJRlpiZVFBM0RzRnJOVmNCVjQ2QzZGT1JFYmpr?=
 =?utf-8?B?Y2xMKzJ4RjgveCtueGZGTVNnMmpyZDA5TUtKUzVxcC9TM01RMVFNSi9QZ0li?=
 =?utf-8?B?Z29PdEtuQkVyVlhZb210ZWVTdU9TV3NCRlFFM3NoYTloR2wyVWdvc1lFSFZR?=
 =?utf-8?B?alpodWQ1RFN3czFPaXR5ZVpMUzlpMUZmQlp0ZlJEaTV2VVFWREtwMnFYZUw4?=
 =?utf-8?B?cDRQaG8wZTdlUG90UXpDVEdrS1RxTlZHYjloWVdzWTBmbCtLQmdOeUxtanpB?=
 =?utf-8?Q?8cdw8ZGp0gg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXdVVy92STlVTWJmOWFQdjRLTW5EVTlVemZMeE1IV0VVMVVtdHV5NkQzMnA5?=
 =?utf-8?B?K1YrTUxkb0V5eXI2Z01rZHAwbjlSQTFMZVQrZEIzOXpnYVhRV2NVem90ckU2?=
 =?utf-8?B?UzE1enJmTTYyMkQ5N0dIby9zWjdKdmMyaDVPNG9xbk5ERGpnb2prdFdLRXZM?=
 =?utf-8?B?dzBGNSsvVWltZlpLZXlNQ3c1SGovcVNzRmYxSnpVU0ZhVWxndnVmU29BQU9C?=
 =?utf-8?B?QnNTQy9LK1d3elFVYW9mOUo2R1ZYb3Q2Y0k2OENBVTlmSFkzcVVMNHNISDVO?=
 =?utf-8?B?M1lHN3NtaFNoRWdGM3EvRUpqbTZ4bjQzRHZtYkJFVjA5VFp2ZEpNTXptcHlB?=
 =?utf-8?B?YVIzTTh0RzZvWlpSa3hsU0lHUFA3MDR0UWlRUW9iTUlIQnhDRmV1K3ZDOFY5?=
 =?utf-8?B?ZVhRQ3oveTFHdW5kdGdZcVNwVzhpeVFuV3BVVEtOclFFMnFBcGRGc2VMVmVY?=
 =?utf-8?B?ZEVUN0YvV2VoNXA1ZDhCdnk5RWxZRURiRDR0RVN2Z1ArNklYV083ZThMMkNG?=
 =?utf-8?B?cDVpd3RRbHczY3A3ajB0OVFuQWtWQjZmalFHNHdkZHE0QjVEc1QvV0ZLZmxl?=
 =?utf-8?B?NU91RlR4RnhSRGNkY01xdWJkSHAwOWczTW5BVnJrYUkyNnRPaXZ4MThmYVZp?=
 =?utf-8?B?b2VRdjJncS9xb1RZZGpaSTlBNE4wb2czSXNxRmxlYlJHZHMyTURHOUE3WTJp?=
 =?utf-8?B?cXhlbDNPYitGNkpUaGdJeEU4aHJuTmFtQmJ2UHkvME9mV3djcFZEYU5oTHpW?=
 =?utf-8?B?Zi85K0dSbFZxaWIxb1k4Mi9hMWRyNWVES3hyVmZzOTVEcTRXaGhWYUVZQVk4?=
 =?utf-8?B?UmhEMytmZzB4RWJkOCs5THNJd3NuWWtrQmJZRkNVVFZqRCszTUVlR2RpNnYw?=
 =?utf-8?B?akVZV3ZXK0VtbWxxYytUQUFMdER0SXcwdi9Mc2svY1Q2aWVnUjNLOThTRWdY?=
 =?utf-8?B?Wm9vbGNlQThFR2VWbCs4K2NHVHV2YW9nVDVuSEZ5YlI3M2RRMURWL08vUnRu?=
 =?utf-8?B?KzNGNWkrUjIzWlZlMHBMN1hxMXZzUmV6TFpDM0paOXdiSkN5b1lHT0xxbHpI?=
 =?utf-8?B?emllU0ZZSzdWU3EybGVLNnJrQmhzbWJHeFVLUWs0UDI5M01GWVN2ZmRZUzlD?=
 =?utf-8?B?Y0Y1eGgxQ3hVWGdxNmk4MzhjZ2tydjZ3Vjc0WDRycDRKeWhMS2srMmVzMlBk?=
 =?utf-8?B?NkczRnluUURSYmp1V1hkekRHZ0JOM1JYditHUldZbkFrS0V6MWVVVDhSeXR5?=
 =?utf-8?B?cG4rc20rZElkUm1IQ2QreUoyelVxUTNnOTRsbGQvbUhKL3Z5QTE1eHBmWlR6?=
 =?utf-8?B?Q292czFoK3Z3VXkrdU9YSHN1M0g4SndPcFdBT1NlMXF0MHVRK2hNNTdTMEhs?=
 =?utf-8?B?eExYS1pzZXRhZnE0V0gwWWdrQll3SnlZZHdCc3dmRklGWjFCd2kySzVVY1dJ?=
 =?utf-8?B?bUxQKzF1anBxNkJNQTBoZ2YzbU1QbmN2UFVITVU4RnFBOGpEZDJoWlZJTGlG?=
 =?utf-8?B?YjZkdTNsanVSWlJRRXpvSkpKbmxzQWZvMFRJWk5ib3lOK3VuYlU1ODZjUENP?=
 =?utf-8?B?UXlZamYyVW56YXp3YkVCRXQzcXFFWTA0M0ZtelNPS2tZWmQ2TitkSmpEVnY4?=
 =?utf-8?B?S0pEQXkzR2hqRW9aRFhWRkh0MHhZckdqdFRVbm5kVm5QakdqMm9QK0RNK0di?=
 =?utf-8?B?SlkwRm51WHMzbHMrVUpxSHJoRUpaZ05CSDBCNXYzY0RJMHdCYzk3OWwrMnli?=
 =?utf-8?B?Mi9CNlJ6R1I5Z2FZWENha1JEZnV6L3JjaUsvcUtTQmk4Qy9OVURmT293M01w?=
 =?utf-8?B?aVg5UUcrOEw1eEEweURYMkhMdExLNmcwazJ2dzZIcnNwSjMxUkh6ajJjWXl3?=
 =?utf-8?B?cUFBdFNJWWE4YU5tVlNwNE9wVTNKUDdaWVhTanBNWEhxdDFRaVRpQThJVDFv?=
 =?utf-8?B?N1hWZlNxKzRmcG10em4yVmJRRnpBYjIzaW9UcFkydS82cXVuNkZGSmVnSVNo?=
 =?utf-8?B?TUFQRExmWkJONlFIUVJIODhYQUhjTTdEQ1hDRmRrNTh1MVgvdzNSOWhQd1Rz?=
 =?utf-8?B?SFBtWlFWcElkOHo3cTh2VzZzbzc3QWlpakE4aUtoZ0dEU29ZeDVoQjlmdWNH?=
 =?utf-8?B?RXBOcWxweDZ4M2Rab2lBdUo2Risrdm43TERXclZPdFJUTUU5NVUreENOZFNH?=
 =?utf-8?Q?YdUvDeSD+nSBlP5uPziL/hhFARhet8JLxwYJ4KNx6U7v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1283900c-1f71-4d61-b397-08ddcb7f5ed6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:30:07.0439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goEbBYCewdTRa8hxc1v58O6uu2UePsHDdZM1CS6v/d5v4/QzRUfqYAFRElp11f7fbJAT4vfMdcMheDj/MfBN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
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

On Fri Jul 18, 2025 at 4:36 PM JST, Rhys Lloyd wrote:
> Annotate the PmuLookupTableEntry with an `#[repr(C, packed)]` attribute.
> Removes another magic number by making the struct the same size as
> the data it needs to read, allowing the use of
> `size_of::<PmuLookupTableEntry>()`
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>

Looking good - I'll also push this one after a short grace period. Thanks!
