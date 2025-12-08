Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0D4CACA81
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C0B10E3E3;
	Mon,  8 Dec 2025 09:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gJ0Rf0no";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013044.outbound.protection.outlook.com
 [40.93.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFF110E3EB;
 Mon,  8 Dec 2025 09:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EAUdh0p66tXOTtUygVjvUlGbxgi2KQpx1RRtQhleDFVwlty8hv10TPkpQI7cjHZoygVxyhkTuvJwz1hDALfnaeVNqf7vFHeJFjnbYqu75G9fxoeXQ5/3gjKP/ZhyUJBl0PhxWVpUA1rqtXtIRZprLL0nSUo/Fi0sflby1E9r4OgK7sQ82H/rZqIwq3pBf0eOFT0vTFoQ/iJycvTicrbPXkb4pfotFPsKDc2zzRPFc0jSvkrKdow3n/x0FLCOZdgGufSDjws6eiuL9djpssB5u4/m7UFNozgWZHDh7SGfNamhoEIvzvkS/hNOrNxXfYC9UAZDfl5OkyEVTN8ES4XAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lR+oZsIvOfwxKTWD7kcizJuf5LRDPU/DJ5opeBnwJco=;
 b=rrEq/GANCRY9K0UPX62pCrcO0LXKu+NIVLgnM7U2tZmc26bgCCVJH4npWXpPZCSYKBnJh70hnzY8UVv4viUM2F0i68km7UX8F97QyenGncdyqwCPa8KMRWFTwND9R+6RAlvg5dYZxI0V99iJqwjdLp76s4iPWideNX2Q7vTyGUScjc/8PRflu4kw+24MU44/xtlE3aXEC+1ftTqM9S0IHqC5LCDmTvqXsFzDABV4/hW/Qw1IAOHgF77ZH+tUEY1bdv1ExcLMeRIUvr/njFju2d9PalhZieyRz/QnjMnPT5vlr109LSkGsJPlzMovd1nOwlfB5SOszq2e3LoJFpwVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lR+oZsIvOfwxKTWD7kcizJuf5LRDPU/DJ5opeBnwJco=;
 b=gJ0Rf0nowjaPqLSR1De/LVDX7wYAadAafZDcfmb7JYUOxkLf0V1MKXzdv4nGjqo4JZFJQPmmljL4LdYaEyC6Nw1vGewVtB3oJDajhIh0QlefECRNrPJ2cWwJIYmxTYdimfyst9zImkPhYOKj6GZcyB5HARwvoFXmVG4pKp+nmfIMRXV8N8DB1kHO/JxPPWK9isGZeF/ujMqNvowm9bY8CFjP0PJbCAAgTgv4JOnJNCNnExLbirfej6cnBOOmJiUaPQDV05jnXiN9Ylj0JfhCP3oMI+DVW/u+2eTFXv9sjDTBmGatKGNb0cKC29oal+wdt/g8pER1lA+DzrdKiZ9G+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:26:54 +0900
Subject: [PATCH 2/9] gpu: nova-core: gsp: remove unnecessary Display impls
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-2-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: c40fe83e-8bef-4c6d-83ed-08de363bf921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFNtVXJSOWhlWStXblQrTGlETUJlejhnWE9qOXoyL2pnNEkwK0lvdHBockVk?=
 =?utf-8?B?UFJRbjFhaVRKaXhZVFl4aFdUbys0MkFvUG1GMVFkbUZCaVIvdmM5RVV6amxD?=
 =?utf-8?B?RDB5czJiZGpBS3V1andwSUlJMnJHa3pGVTltb1dCUC91MG9lUzNtWUJidEs5?=
 =?utf-8?B?UWJ0UHVPZmVqd0M4Zmg4SGRwMk1mMVMxN1ZrS21NeVhDSmgvdGsyL1JGZEZO?=
 =?utf-8?B?VDU2MHdzMmk1cmVBSVZLQzhDaU1WUU9GZHY2SjVraHpoR1VXNXVGRDMzQXJ3?=
 =?utf-8?B?NGJwWnVQODNTRlR5ZXRRQWJCZERjY2IzMTJNNTlFYjFCWnNGV2FSUC94Ti8z?=
 =?utf-8?B?V21BTDVHeDhlK3FNb0Vac0l2a0pWeU0rUHE5NHkzSXVzdEpFZWVHMVVJRTNm?=
 =?utf-8?B?ZU9KKzVpcU9rdXMwa3lwdjJDL2llYXhlOC9PYkZ2SHhub0hLZWUvRXJIZWFi?=
 =?utf-8?B?WGVvV2dUQjMrSWptU050RXlCTVhKcmREWUJPUGV6NDJOVXJFaU01cUpJWW1m?=
 =?utf-8?B?cnZtOUg4cEJncUF6Z1FrV1JTd2J2SVA0M3N0ZGZiWFZBaWJQODVneTVJa2dE?=
 =?utf-8?B?Q2Ixb0NzaTV3VkJBZjUzN1hPMytKRk5KYkdTdTFXVi9SSktnVENxZ0lZL3Jl?=
 =?utf-8?B?cnNjZ0dQS2pTNEQ4YXRmOTQ2ZjZQVTlieVdQNVhSQmFkbENCSHpzTmt3V09k?=
 =?utf-8?B?enFXZExRbnFlOHJlRWtDVnVFUHFoN042QTJDenJKMXdqMHJMWTV4S0RTbmFr?=
 =?utf-8?B?dTk2SUUzeHZFSXV5ZjliMmJvTmNRYm8rTTIzbTZVMmp2ZlBLNGN2dWRCaExS?=
 =?utf-8?B?eEtuZG5UNjFVTzVVbjhMTG1jbjBDUUZnajc3TzE4V09MRk8xajM4Tk9FM1Iv?=
 =?utf-8?B?YU85aFZHMDRKeWdyRzVPQUltY28xY3Yzb1Z4bHIyamFFTU5keTJKZmsrU1A3?=
 =?utf-8?B?VWw1UUNBQW5aY3JUaktEU2hzcjlLdTV4WCtSSTFyY0tWQmE2TmZXRjBzWm1K?=
 =?utf-8?B?SDJoTkIvdnFFU3pRY1FYYlRmV1o4dDZ2ZEUwTzNyRHBQODRVK1pPWjU4NEkv?=
 =?utf-8?B?RUZHQitpbUduS0VjcGRrSEw3VlNSVVllL053YlRtM3gycWRUS0xrVFFwdnFs?=
 =?utf-8?B?TGYyOGxWZy9YdHM0TDBPcXFtZG9ObHBBU1JuTTF5QWZpVFdIUlBVYzJycUhS?=
 =?utf-8?B?Yml0OUhyZCtjaHd5aUNJVGhFOW91TklpeTk5UmRkbzh6QXdZMUs2QzQxMjFr?=
 =?utf-8?B?UUZKWDF6SzFsTm1BczloNjZoa1VwYWZjUTVNOUxNRE40eGR4SjUvd1Z0bFBF?=
 =?utf-8?B?S1FPclpnbnVWL3Jjd1EyM1VVQzI1ZjNoMGVEVWtYUmZvWnhwNmc2ME1oUFow?=
 =?utf-8?B?b0xJbXd4eTlDaFAwREVNSDI4Y294dGgvQ3pIeUtyZ3R6VE0yTDlCd2ZhVlpt?=
 =?utf-8?B?QkcyZzBvQ2RmRDhKamFScEpYb2RsQlBSRDloSCthMEJYUnd0dWFScUdpem1S?=
 =?utf-8?B?QkZZMEhOaXdtTmNDd2N5d2M0QUF1dlpBRFhMTUdYalZxK1FpTy9ockpRbWJy?=
 =?utf-8?B?bm5iaUFMUkdoNTBZbFJJalpOVWg4RnpZT2hzaGlLdFM3dUdPV3grS2NhNGJV?=
 =?utf-8?B?NlRBN1c2OG04MFRPSW5sUENad3FWT2w4TlRDRVNJdXdVeDVPbThKc2NWN0xD?=
 =?utf-8?B?aG0vd2ZrUnF1M3Q2dU40eHhVK2xoclllOEJOUnY2eDdzOWJNZ2RjbUdwU3E5?=
 =?utf-8?B?aUVBYzI5NGR6bDVTUlpxaEFKWHpTYnhMR2txK1pUa21GdVoyVnh6eVJZaHVT?=
 =?utf-8?B?ZTVTS01CM3NjQ0tERm1RSUZ4RmpwMDBkcDhvWXlJUTFxOGNaV0taK2Eyd1Bu?=
 =?utf-8?B?cmduYldKdWhFSmdRejJ0QXBkdVJ4ZUZTbEExbldmbXhvckM5ODd0a3pDWm5r?=
 =?utf-8?Q?qGziEwIxiGbMgNO9vZprzqQsO1skoWrR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVVwTUZ1ZUhlQ2ZLRVZ1elZiYk0rTHovTWYrYStBdDcrUzJ4UmdsaFlOazc5?=
 =?utf-8?B?NHJCRXpUNVpPaFdXTnZsNjdhNE0ydnJjMDFyU2JhTjJ6c2pReHB4d3NwQnA2?=
 =?utf-8?B?N3dpaXVXT29mV2F2ZndaOE1pNHI0Vk9nNDJRY2NMQ0d1b1lFQ0t5RlhlT2RY?=
 =?utf-8?B?M3k0RlVRRDRwSzZmbHlmRlkvRHFjemluUE0wT3VTd0haelU3SHo1Nnl0SHor?=
 =?utf-8?B?S01zenZiODM3RVQ5b0JQRjJZekt0dGY0dVlWakRkK0FBWXl6b2N5NlV3TDd1?=
 =?utf-8?B?M0N4QklRdWNhNXJEY0k3bk5UNU1Uc2lPSW1JZmxKU1lJVnRYSVZJY3NML1A5?=
 =?utf-8?B?ZkdPNERiUENSSmxYTElJcGVpVngxVndCc2N2aVFMVHUwb0tTSkZML0JMNFpa?=
 =?utf-8?B?WnJBTEczc0QrYkdjbGEwQzd3dWc0YUhTdE5DUFg1ZENydElHTU9iQWNpeXVH?=
 =?utf-8?B?MVB1M3R3eUhiL0duZ2t0NlpRTEdJOC8xODJ1dTZnbUp1TXhDUnVJUmlJSmVp?=
 =?utf-8?B?QjZYVkhlenBDOXhGR0tMaFBiZGFpNk84WjRoQW1uZWQxUmpMNUQ2WmRPK3Zk?=
 =?utf-8?B?NTFJalpHQk5EYlM3NXZKTVNuOFR0UTV4Qk84UHcrVkFWdDJuTW9EUTVLb09U?=
 =?utf-8?B?Z3czbGtYUDM3Q0hta1R5dzhGakcrZU5SV3JxYktNUm16dmNwbUxkM2c1Tm0y?=
 =?utf-8?B?anpxTGExb2pTY0xyRWpkUDhoc0ZKb3AyM0ErMUlENCtDWnhidityM3hjZmRH?=
 =?utf-8?B?anYvcUNxZXc0dVg5M0pudjZmZmdCL1Jrd2lVeTJMdk50SFJvZXRkdzU4L3lO?=
 =?utf-8?B?Z1pWTCtGbE9lN2d6Tm1wQ3Z4VHpUb2FKNXNVT1BQanMycXVzTEF6VXMrdTd5?=
 =?utf-8?B?UE9KYmhsNTFtNlRSRFNaNjhYYmdkYWRueUt1SVpZSW04YW13NW1KeEU4L255?=
 =?utf-8?B?TDFURHF1eUpBT3IzNFRqNy9LMXpDZzF4VXpvS0NBekNVcXNjdmZOSGtNb1Rx?=
 =?utf-8?B?dUlFcTBFSkk5dUg2OEJaQWZSeXc2R3NzVnduU0wwNG4wbzA3MmFmTGkrNENV?=
 =?utf-8?B?R1VKdnd5Q2J3TlVYSWZNcERxU0VKMGUvRWduMFltRmtidEtVdmh4dm15K05H?=
 =?utf-8?B?UzhFNlZXUDk4ZHBVQk9XMS9FS3VKK25KUTlIZmRwM3VmdTZFMFdPMUpZcUxR?=
 =?utf-8?B?SmswYUR2TjdRa2xKRGxKdWl0T05kU0R4NjN2bWJySVFwRkExRlNqTGNVYjJQ?=
 =?utf-8?B?N1QyQVBnbWJFYjN0cDc2eFI5bmlPZ1VwdjhQMGVvQkhteWZVVHU1RDluaWR3?=
 =?utf-8?B?alg3Ykc3YW9FdTVSbHh6VVQ5cEp3eis0cmd6N2Y3WWY5U3h0Tm1lcDBNYU9U?=
 =?utf-8?B?cENocUh4dzUxWmZEbnVRUnpMc0pSaUxzNUdjSTV5RXUrU2d1WGtVM2pnWXpF?=
 =?utf-8?B?bGVONW1OR29Mc2RqM2RjZmhmVG9PUThjT3ZrUVVxZlo0ODVEYUp3dGs5RklD?=
 =?utf-8?B?MzltNkZlMzZraDFRN2drUXlrVVdMMXVTTEQ3ZFZCb21DTno1YVUwWkhlWm14?=
 =?utf-8?B?TnZ4eSszaCtjWWdzQXRsSjFxWmdRR0Vqcm0rNHJkVm9jK1JRSW05TG1ac295?=
 =?utf-8?B?TjlKRzJpZ0ZtVGg5MTAwTVdQU1N5TCs5RjVsZG1SNVo1TUdzWWRFZ0Y3T1BN?=
 =?utf-8?B?YWNrOUwzUHZPbDlkOXBlK1dqWXR4bXBIUk5oVWwyc0VpNkV0M0N0MEc3Z0Fj?=
 =?utf-8?B?dVkvdUJPaFJMdW42aXhkQnFkSVZtUXE0cFdDckRFZFpHNjdlRms1UkpCNEdm?=
 =?utf-8?B?eG5UVlBWdjVFNnRJVmszTG5UNFhpOWQ4WFQ5NkVmK20wS2Y5UUl0Qnd2SFh2?=
 =?utf-8?B?ZlR0VVpCRWV0MzM1VVFnbXEyYVIzQ05ISk1PdGdZbkRYSG5IRjVhK2t2bG0y?=
 =?utf-8?B?eGozRFZaK25EQU95TE9wZEFaVS9GbytHNDBiQ0xnVW9JSUl6a3FxUGxLOVR3?=
 =?utf-8?B?SlJ2SC9aMnR4bjFGMjVPd2JDNThFY0dVT1JUZ3RHY2RFeXhXRUtWUDErQWxr?=
 =?utf-8?B?b2lYOGJJRjIyS2lhZ2JaMnB4ZFpxREVxQ2hReWFYenlyTTZhWXRtWitkZGRH?=
 =?utf-8?B?MkNxRDVYd0hYaEMxeDZjNzdWQjk1cHpWcktQNllUN3I3WlNIZ21yZ2hRY3FY?=
 =?utf-8?Q?0OaiPArz49uP6yWWeB6CxtLEuaP38ghCtyRKkKE6O9yl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c40fe83e-8bef-4c6d-83ed-08de363bf921
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:14.5212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPr+5haAqHqHDOEOF9a7dYxuYLbxU6G2AiIAa1RwF2acu0u97EIJx9/5Povb/QkhuvVrkpRSx7YgP2iFQdPmVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

We only ever display these in debug context, for which the automatically
derived `Debug` impls work just fine - so use them and remove these
boilerplate-looking implementations.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs |  2 +-
 drivers/gpu/nova-core/gsp/fw.rs   | 54 ---------------------------------------
 2 files changed, 1 insertion(+), 55 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 5ce85ee1ffce..fa983a3f480c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -531,7 +531,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
 
         dev_dbg!(
             &self.dev,
-            "GSP RPC: send: seq# {}, function={}, length=0x{:x}\n",
+            "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
             self.seq,
             M::FUNCTION,
             dst.header.length(),
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 3baa5455cc32..24e4eaaf1265 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -10,7 +10,6 @@
 
 use kernel::{
     dma::CoherentAllocation,
-    fmt,
     prelude::*,
     ptr::{
         Alignable,
@@ -223,43 +222,6 @@ pub(crate) enum MsgFunction {
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
-impl fmt::Display for MsgFunction {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            // Common function codes
-            MsgFunction::Nop => write!(f, "NOP"),
-            MsgFunction::SetGuestSystemInfo => write!(f, "SET_GUEST_SYSTEM_INFO"),
-            MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
-            MsgFunction::AllocDevice => write!(f, "ALLOC_DEVICE"),
-            MsgFunction::AllocMemory => write!(f, "ALLOC_MEMORY"),
-            MsgFunction::AllocCtxDma => write!(f, "ALLOC_CTX_DMA"),
-            MsgFunction::AllocChannelDma => write!(f, "ALLOC_CHANNEL_DMA"),
-            MsgFunction::MapMemory => write!(f, "MAP_MEMORY"),
-            MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
-            MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
-            MsgFunction::Free => write!(f, "FREE"),
-            MsgFunction::Log => write!(f, "LOG"),
-            MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
-            MsgFunction::SetRegistry => write!(f, "SET_REGISTRY"),
-            MsgFunction::GspSetSystemInfo => write!(f, "GSP_SET_SYSTEM_INFO"),
-            MsgFunction::GspInitPostObjGpu => write!(f, "GSP_INIT_POST_OBJGPU"),
-            MsgFunction::GspRmControl => write!(f, "GSP_RM_CONTROL"),
-            MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
-
-            // Event codes
-            MsgFunction::GspInitDone => write!(f, "INIT_DONE"),
-            MsgFunction::GspRunCpuSequencer => write!(f, "RUN_CPU_SEQUENCER"),
-            MsgFunction::PostEvent => write!(f, "POST_EVENT"),
-            MsgFunction::RcTriggered => write!(f, "RC_TRIGGERED"),
-            MsgFunction::MmuFaultQueued => write!(f, "MMU_FAULT_QUEUED"),
-            MsgFunction::OsErrorLog => write!(f, "OS_ERROR_LOG"),
-            MsgFunction::GspPostNoCat => write!(f, "NOCAT"),
-            MsgFunction::GspLockdownNotice => write!(f, "LOCKDOWN_NOTICE"),
-            MsgFunction::UcodeLibOsPrint => write!(f, "LIBOS_PRINT"),
-        }
-    }
-}
-
 impl TryFrom<u32> for MsgFunction {
     type Error = kernel::error::Error;
 
@@ -330,22 +292,6 @@ pub(crate) enum SeqBufOpcode {
     RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
 }
 
-impl fmt::Display for SeqBufOpcode {
-    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
-        match self {
-            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
-            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
-            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
-            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
-            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
-            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
-            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
-            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
-            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
-        }
-    }
-}
-
 impl TryFrom<u32> for SeqBufOpcode {
     type Error = kernel::error::Error;
 

-- 
2.52.0

