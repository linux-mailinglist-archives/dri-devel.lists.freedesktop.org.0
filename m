Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA8B06B43
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 03:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AAC10E6F1;
	Wed, 16 Jul 2025 01:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Du3M+c8+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59B910E241;
 Wed, 16 Jul 2025 01:43:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp7j92qaBqKu28bxwcaxvxPh1wWYJTfBjE/1XgOn4VbhEbUkNWID595wyV0Ngms+DuR4pu93SVd0tKm8Cl0EZTppUCk6zEp/Ks+FUQk4AzXFrZXdXbQnBWW+VbFGrctTQ9CdllhTOib2FnfnrISAVID9Goujq1pfbNV4BSNF4XFloLsOca9JTJV6znlZxMlHdhcswG495MV11RoQO3fvG1r/o5YDdKqobeNq7POd2jshw5vxSo/4MUlmTMSQM4hOdRcTiZvhcPSRE7b9wzCnhvcm7gVEddiHaEfn8pG3s751OmYb55P29723jUTOGXOb/1KkEnLDMGpJ/BVjERqdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dU0Bq4utsJESg3vB7PtygPXEPXxHtcqZ/H5JOIQA02o=;
 b=d3VY4oSLkMyu9umg5L/ZHMJCANUsoLu0xPvzallnw2y0xPuAviUl24n7wYef2D+MGw2x+SIsF6j/TGUe8YuxvVtZfDzYEx7Wam9VKnrZ4V4grF2A6oihBKJcpG5T6GXnsf5TnJBQzw6pj5qVRB8J39NHOy4SVNiMA+OlRD62zMRpa5OHeUnD6QIAWlL51ND27uXV5VtSkpyIP9KjwnVa9HZMwi8oBhZmQCyr1dmEk3I6GpQNacL9YiB5QelNJ+NNQQ5M7KhpNyn/TR1zsLYSte5+PdBtf4s/y+8TleTXoKDoLhbJol42PSC2NybiNuvmZnzeY2X7PC6ONW+V58y88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dU0Bq4utsJESg3vB7PtygPXEPXxHtcqZ/H5JOIQA02o=;
 b=Du3M+c8+IhZ0sxhHr2NqeRocP5e+YcqU/ZOk2fx4Vq4p7hASm+ug7EF8fC9lBjoxAip7AC+rjUba3XkbBcmjiDq2nZQHqQsZjRiQxJDdyMx9K6DMDX86Ogf5OoxP5y84zlMPmwSUVjHaNVkr0ECrZXfoMOMEdY9/6BwQJbOMYUyVcZCdomnGb4EtsHrEOdh2u/h67VrZWJ8rBmDgyTdDYyO+b6WBqsjhFxWGEOxZv+PhEDc0WOXdxENLAIQwIYQD1tenAh4pZqvXoV95ckc9rnaLqRtzlNjZwzQHDV+G62G0UDTxbcPQYXSafxu9vv3V497G5KEb+qUyEIQEcSKWhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8032.namprd12.prod.outlook.com (2603:10b6:510:26f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Wed, 16 Jul
 2025 01:43:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 01:43:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 10:43:41 +0900
Message-Id: <DBD3K8IK7UO5.2887TW6EM1CK5@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: vbios: use size_of instead of magic number
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250714104322.100511-1-krakow20@gmail.com>
 <20250714104322.100511-3-krakow20@gmail.com>
In-Reply-To: <20250714104322.100511-3-krakow20@gmail.com>
X-ClientProxiedBy: TYCP301CA0056.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: e34c319a-1c5c-41fe-562d-08ddc40a3318
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjFmL0VrRkZaMG1RMTd1YmViejhpSTU1M2NRNFU4blZCOGlQRm9FQzY3QTQw?=
 =?utf-8?B?MkFpdVBTMTNsZGdBVGdBODBSNmZsNU5zNEUyZ2FHejhYV2FWSk0rdnM0d3B0?=
 =?utf-8?B?STlXcHFCOVoxc1ZwcEdjWFl0aExQYzZrNFBwUHlxN2U1akh6c1A4ZDhJQk9o?=
 =?utf-8?B?ODVBYytYL0tNTlFHQVBLeWJlTjUwUHU5cm9lbnpLQ1RLbWs5KzAyRVYwSzhm?=
 =?utf-8?B?dmhvYllEVlp4Qm5DeENzZy9OREh2S1JUMXp6dU1MSlgweDNWcHJEY2dNcTZB?=
 =?utf-8?B?SzdtamYxcndxUzkzQ25jY1ExckRSK3U1bmx6YUx1ZWlYVEVScy9zQUNGV1NY?=
 =?utf-8?B?U2NGM1l6Z2FYMi80dmNXUTJtdERNenRDeUc3RThFemxhVUNsUFpOWXlkTGVC?=
 =?utf-8?B?Y1F2SjZUSkozcFdNUTlxeWZqZXpNQnZRdFVrVC9mVm5pdlhSUU5zS0Ric2Fm?=
 =?utf-8?B?ZEZpNnM5NTR0VGcwbVVHT3dyN05VTUZTcmh5Tkp4UU5mZUVGa0tvYlRqL1JX?=
 =?utf-8?B?TmlyenRBK0lmWFJha2lVY0dCTnNXQnRRYVZiYmN2ZlIxcGlMM2g3ZkdzdTc4?=
 =?utf-8?B?cGFBdlkrTkxyUS8rb0xSUmR4OFJJc2lrMGVvYjFCbFN6d1hFVGhjbStha1Uv?=
 =?utf-8?B?cUhyWHJnbTVWcmdmZVNDdW5SclM1dHlNbTRoTXFDcFozNDdiWHVHaXUvSEVN?=
 =?utf-8?B?cWt0aHZnczBGNlo1elpUNkxLSWFGby8xRlZLbDZ6MFlxTzdCL0MweUVyc21X?=
 =?utf-8?B?V2FyY2xFZDUyMy92OVUzTzN0ZU5GZ2luK0NVQzYvVENxMWovalRHU3d5M3dI?=
 =?utf-8?B?emNxMmhyOGtNYVhWNm5JYTIzOHZPYlgzbkIveUxNczFwM05EL2NIWlNHc0dM?=
 =?utf-8?B?MFhoSkprckUwd0J4NStRb0FhRUtjaDlxcWhxb3daT3FReEJkT3lOczkrWml4?=
 =?utf-8?B?S05jU1RKdnhJZFpMSk8yOUs5bkJEU2dNRVFmQ0FSZXJyd3B5bEJGcXFPcGZo?=
 =?utf-8?B?MTgzcUZucmJRYWdFM0J4UCsvMURSYjJBbUlFY2RlUGJON3d5STlaUVlwQTht?=
 =?utf-8?B?a1VvZzdZa093azZVMFJwTXRsaVhKRHB3L0g0S1ZhaDdLOFA4U0xmbXJlTU5i?=
 =?utf-8?B?QTVwKzVYT09GbklvMTJMcGdqTi9KWVV1Ry9KTUxZbmdSTEVKNmMxUjBzRDNs?=
 =?utf-8?B?OUZIZHFSbjI5Z2dJNEIvNUFQbExsejE3d1ZpdEcrQlNzNi9NUER0ZkhXaUxS?=
 =?utf-8?B?Wlo1bjNXbGVXTlBoaTZNT0oycWozaEZ4djdUQkdocjh6QTVXTDB1T014enVR?=
 =?utf-8?B?ZnNtOHpOaFZRZXRBTjlXOTdVTFpRamVxV2pNNTd3WHFaY3JPQk9IWnpnR3ly?=
 =?utf-8?B?NXJBKytsWUVXUmRBaG1yK29ZZkkwS1JDVm4zMFhYNGFURXY0cm5weC9COC9P?=
 =?utf-8?B?OC8xakNxd3Y2M0NYTGQyT3NWUCtCZ3g5cGJjemNQRGFhaEFqSUZab3RXQUll?=
 =?utf-8?B?d1RNbU5PTDNZbEZpdWRUWmhQcHkrNXg5RE9ybmpwT1NWMWg1YnFBRG5aMEZE?=
 =?utf-8?B?Y1Fqb2h0RFY5Y1prWmVUZ2RwTGJ4TVRWMWZiV25iaDhmRVF6NVY5YjNIZ1Ew?=
 =?utf-8?B?cXd2MHVKbGVieFliOXVZL1ZlYXFWVkZJSVBBZU9JbHRPb1JXWDZ0WXJrMmlZ?=
 =?utf-8?B?SFBuQm9SU2xoRlBoMlNMdVppR29oZkhXOVBjaSsrUDhzTkVkSmVNNG9IUlRo?=
 =?utf-8?B?aTFlWmNOYk9MUjZ3L2YzclMwMjllbEYzR2wwSkRmSVgrUmUrTEQxenZMa1ZY?=
 =?utf-8?B?em9YbSt6SXJDT1hwQ0RlbGNEZkFJbXRsY05WcDl0RjRWc01ZaWJERU81V2hW?=
 =?utf-8?B?V3F4OFFCRXZwYzhCRDhuUnpmNk83cUx0Z1hsTDBXcnAxVVpFVlJxazBzb0VM?=
 =?utf-8?Q?vgzc9OpXf7k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJISmtYSjN3TWhiTHVab3dZaUVjTjhWRVh1OWx0R2RsdVVEdkptSmx3dUVv?=
 =?utf-8?B?dWVpeFFxMUd1MDhCbzRSZXB0MTIzeUFmRG1SbHlkN2QrYmdZcWFXRDBNRDRE?=
 =?utf-8?B?dlo1NkpudFNqRTNKTEgxdUZ4MG92UlVBK2MrejNzWERXTnVVd0tMajhGSmlJ?=
 =?utf-8?B?VnVSb1hBNzc3bnRuOHNvVk52M1czbS8wb25hSzVPUUlzMWp5bDVLVEJhVDhx?=
 =?utf-8?B?dGs3TVlyeUhHL2dzVGJOWUpLaHQvZlk0dUI1K1J5OHBVYW5lczRCVzBXQXFx?=
 =?utf-8?B?R3pyb25pUHhiSDdIWEMyaC84NFgyVjR5Q3FMYzQ4VHlESjdaN3JxVEltc010?=
 =?utf-8?B?Kyt6YWtzVTYzMlplNUdlRlEwK1doTTdVRG5ndTlyTXd5TDNxWGhoMUtVcE1B?=
 =?utf-8?B?eUlMU08wTkh5QUxHNytXb0UxdEtWaHNNbTRndVNoVzVOUnA2bzdBSm51bVFW?=
 =?utf-8?B?OFM4RWtsOVpIZjR5aThwVTN0TlJxUE1ZN3BXa0w5N3NtWlNZS0NXUHkyVllq?=
 =?utf-8?B?QTdrNHlYMFhmWi9SUDhXczRuYjd6RURIbDcyMXFrOWpRbncwa1pJYVIxVTF0?=
 =?utf-8?B?STkzYUlZY3R6MndmM3JvYnRxa2prSjIwSGM0Y3NrNWxPYlpKb21rYzFxMkg3?=
 =?utf-8?B?RUdaZjhCMXRoUEhwVjV4T1lSRUxsRHhPc0czbUVoWVZTbUhZZHlOSHN6Qld2?=
 =?utf-8?B?dWc3ajhFY2hkcE84cXR1L25lK1M3RGVOVEhDZk9oZm9nbURldzNVRVM0RWxM?=
 =?utf-8?B?dzVvU1VxOFdsUGRFOC9LK0ZwZWRiaC9abDBvMTVRZW9hOEw1L2xQeHc2QWd2?=
 =?utf-8?B?VENKaTVQc0xZejQyMzMyQ09HZ2tGM201ZmhyZ3U5NnhTR3ora1cwQjkrTFJS?=
 =?utf-8?B?c2hWbVlFdlp6cm9odDg5QjdGM3BYVW1va0kzUGhEeURzNUtyQVROQ0R2ZGxL?=
 =?utf-8?B?Y1RSTzdJMHpjeHk5b0FSWmEzYWFmQmNQY1E3N1dkclVHQVFxclNMYytYS21h?=
 =?utf-8?B?bDBGQkQ3WTVGWGg3OUFuRTl2cDVjVk40dEVhTGg1cHhwaERVL0lnbkRPeEtk?=
 =?utf-8?B?MmpZQTJQYk9RTXlQbmFyWjBza3FCaHBYay9vNFlTUEg0bzFMS0tmamxNL2ZW?=
 =?utf-8?B?azlGQW9CcytxeDA2QWJRcXR3ZmdpOGNGT3lraUtpYk1vOXd6MmQ3MC81d3lH?=
 =?utf-8?B?ZGpKR3FRd2NteW5DaHExMG9pbFJ3M1lydDRMMzZPWmx3My9zTUhIQTVWd21m?=
 =?utf-8?B?WTMra3krWk9qbkR4andld3d0QU5WNk05ejVjdmNuSEJZemhYSHNPU0NMOFh6?=
 =?utf-8?B?L1gzV0FGV2dmQVA0Q21ncWlUbGpHT25CZzV2UitFSkVuWnc5alQvL1BwQU9u?=
 =?utf-8?B?Mk4vMkRnbHprWHN1d0RML3owdlltMVNQM28vT1ZZbFFSNEROVjFLYkRWUWR0?=
 =?utf-8?B?REZJMjloM2thNzVsZkRORmlaWnB3YWtGcUhwTDdUNkZVRXR5ckpLUSsyRlVZ?=
 =?utf-8?B?RDQ2MFZWTGpHeVhLc0hEN1RtN01hQTQxN0VxbHNPZXdrWmowTUU5YmVaempU?=
 =?utf-8?B?NkdDanFhRXFVOXBKMGp5VWJEU1lFWlhBbHkzeTY2TjlDZTNLdDVRQlZVaVlB?=
 =?utf-8?B?MTZNYWRjZUY4VjZzOXRLQXI4TjNPZGFybU4raUp5b2VQTzZieGhLcEZTbkJU?=
 =?utf-8?B?Y2RENWUweEhPQmkvcjFJL251RzdHVTN6K0plekZwNlJUZThMUjgvWnNlR0FI?=
 =?utf-8?B?NW1BeGhhZGVBeDRrKzZRN3NtMFV6VW1LSGR4d2JqUDZLRDd2clN0L3Nmd0U3?=
 =?utf-8?B?NWNUa29JTHo5VlFJc0NMbFlhU21PL0lGdUhpbFBWZGJRUTR6ZEdKWlNjM21r?=
 =?utf-8?B?VVBjUTIzSlRqMllOVlNpemZHb1hWSkJ1M3JPcE0wMzN5Y2wwVi9YUUpPQS9V?=
 =?utf-8?B?ZTRITE9NTFUzSnVoWnB0WTJxbG9GMmVYaTBuOUhRRVVuUzVOU2poMzdoZ3lD?=
 =?utf-8?B?UFFyM2xvcjZsd1h5bXFSYnozWjhDQnlOd3dJVm12aUtiL2xHVkNlTzJJRmhM?=
 =?utf-8?B?YVpvQlNtLytXUVZxa0tTaGh6bzRFbzBvckhvbUlaamdDS09SeGg2VGZDbnRG?=
 =?utf-8?B?SkpYcnIwQ2tBZUJUUUNiNi80UTZtZGx4RUdtT3ZMS1J3OTMvbzdWRFc1R2Rs?=
 =?utf-8?Q?kseTl/z3hSQEwubbCvdVZR78GMTI6SY+2mLMBjzB6oip?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34c319a-1c5c-41fe-562d-08ddc40a3318
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 01:43:44.3936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAMtOJXrqqTjwFumAf8PLFOKbIzMRf4utHwOjGeoz6yWm9BxaZ0CM02clPCrHgxtwn/rI1lnU16ZA+1I9GRTUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8032
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

On Mon Jul 14, 2025 at 7:43 PM JST, Rhys Lloyd wrote:
> 12 is identical to the value of `size_of::<BitHeader>()`,
> so use the latter instead.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index 663fc50e8b66..ac35415b4ffb 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -365,7 +365,7 @@ struct BitHeader {
> =20
>  impl BitHeader {
>      fn new(data: &[u8]) -> Result<Self> {
> -        if data.len() < 12 {
> +        if data.len() < core::mem::size_of::<Self>() {

I agree, but would feel better if we also made `BitHeader` `#[repr(C)]`
to really guarantee this.

(or please educate me if this is unneeded :))
