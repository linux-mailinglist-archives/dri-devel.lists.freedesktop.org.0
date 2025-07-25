Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C12DB11F67
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 15:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C261910E368;
	Fri, 25 Jul 2025 13:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oH6FC5+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EADD10E363;
 Fri, 25 Jul 2025 13:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VwqJ2da1lUPNi2dPaLOfs65P54SapihdSAqh4Fv0vtOCxPqjOx4401z4zFruU+21UOCkDWiPmqxhaagLaLKsRS+VGbCQd4zAMmbLZA3TyeoTmg3ozr7PI/F55BpDUBGIdEpjU+gKmm4vlbPf31TjP84Odg/1NnLA4WfxERSGDQ6S3Nm41gqO1wcS42/go71N+nj4Hziiw+wzC3eiG8NFcN0RbpPcGqvzUYMGeEXVDFFxsSQ8PIHu8xkeZVkGKOcoLcyKEQhAH6ZKYr6ASIuo01XjXO4EOVHnSd0pK0sr4Dvnan7gxo5h7ZnA/s2TXhx6mcdIhNBvc3Ysjnzm35nlNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J/IY01jNn2uoNZdO8bbK6qDiEvaQyVjSvCdQwp3dJk=;
 b=Vwdj4n3I4mTbvgRr2bafC2NKlvcpXkT7K2Ofew/WB07g7ZyfO30p7srAsc2Qd0ab+iIwa/0iYmWlsvQjAkW0h6M3wPppjEUCKnoKxuouMRz74lKYLEPOmu1h4h7S+60XnyhvoexYmLjSCQW/V46DdxqZgbyBEULxR+E+dO4dLIQYg35THoEGfXzEQdCqXy5zO43Iqwia8Av/YcgmDegcO2DDjEnoQEErlbo1/haJe35M4pEqBrXTusTlMAm1HkW2EAZ+8h9AYam47wynWteUq7Hi6xPrQPzLow2wvMuwtT693jFkVI0dFm6ZdpPDNYIqeP/XgBKv8i8LAN2eXjXyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J/IY01jNn2uoNZdO8bbK6qDiEvaQyVjSvCdQwp3dJk=;
 b=oH6FC5+wuSGPU4Zrl4YOMleGfS6PWbrzb7qahMVo+Na/naQ2hYwDPe1xl34BS/bWbuOM22iwWrCBFfh8tlMoIH2LwFZ4gHKL55+JcGv7ILUozKishKiGSJdNBJuh1NEmJY90j8/tmYGYw9pzMwL6c6YNCJDihiQ2JW6QMF3Kj5PJ4rQJwBDDSEIao9KfXyTD06Q4oWpQOs0glYz+kN6kpw0UEOQGDHIt8RyBZVGd1QCHioPGbUe6gjygP1SuZUyo3xBesbczUnkarod9Cj/4rIcjc6d/q5w508S07lZjVvWiL9KIamr84DAMl2ueTaraY/YkiBDJwYjtmad7HteXbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 13:35:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8964.019; Fri, 25 Jul 2025
 13:35:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 25 Jul 2025 22:35:06 +0900
Message-Id: <DBL6BUAHZ250.3UCFP2OB3UEIY@nvidia.com>
Cc: <rust-for-linux@vger.kernel.org>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: vbios: use offset_of in
 PmuLookupTableHeader::new
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Rhys Lloyd" <krakow20@gmail.com>, <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718073633.194032-1-krakow20@gmail.com>
In-Reply-To: <20250718073633.194032-1-krakow20@gmail.com>
X-ClientProxiedBy: TYCP301CA0021.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b24008-e346-404f-86e7-08ddcb80136a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elFTb2JWajFCMFZuTHJzU3k4b29wbzk2Vmw4U3A5VjBjUU0xSG9idlQxMzZ6?=
 =?utf-8?B?MHVXbFViMVJWc2Q5dE9QQmFHMXNRWGNlcnRqOFpGd3BJWVJ0QlZndmVBdzNj?=
 =?utf-8?B?Ukg1a0xSOS9od1VuNlovS0czeFJ2RjB0RFh2VmE4MmpTK0xISFRvMlY2YlJn?=
 =?utf-8?B?R0NOcTJ4U1JHZFh4eFAxUXdTdXRHc3lyeHNNNms5UExiSEd4WVA3RG9NS2Ev?=
 =?utf-8?B?dW92R0dXSXd2M1pmUFJ5aWtyVDlXR2ZFVkJHdUNyYnMzS2lLQ0k5bUtGMnl2?=
 =?utf-8?B?L1BSNHlwWXo1Ti9WQ0FtSXlySjc2TzdpMFZlUW5OTTNWc2FobkN5aWE4K3c4?=
 =?utf-8?B?Q2ZaU1N5SWJCb1ViYXlrdnByOVBFV2dLbnU1OHYxdE9hNDZjSXRha0ZpWVNh?=
 =?utf-8?B?YXVyMVRJa0xZR1MraHY5WTRTcEF1akNxMm9nRmpUQWxYOGdEeURzYXVZSVRN?=
 =?utf-8?B?L1NHM2VxdlZaRTRLSDBGU3pnQVVtZHgrdExTQ2s2N2JRUlBlWUhjRkFXLzQ5?=
 =?utf-8?B?QVkzL01yMC84WjZwNGREbGEwMDdYTTlka0pCaDdaWHJJOGdUd1o5MTBJQWJq?=
 =?utf-8?B?NVUxcSthK1VpS3VQUEFXamh5RGtmYU12WDVRcCtOaXRQREoycmVxL1FBQXl5?=
 =?utf-8?B?UlhGMHBWb0YrNWUySTEwYVNuWEpZQkhZNWx0ZW1yQlBDTlQ0UWJDNWtFZ0Nz?=
 =?utf-8?B?MFY3cXFVY05jUDk4ekFSS3AzYUFjYjc5U1BGZjRkUXY1WENMWndDbUZ6d0Ex?=
 =?utf-8?B?WG1paGV6cVo5bVkrRUp6TERPTVpERitWS0lhOUVZRWpHNzduNDFmcmRUb3R4?=
 =?utf-8?B?VXRDc0xoZ3V4cDlwWEtlaHh5VHVwMXdYTGhwT1lHZnNmdXBsWVQzYnFmMHBO?=
 =?utf-8?B?ZXRKcmJZaWdvMVdBN1g3Szlyd1hrSzdmQzFtcHJwV3BLNTRLWm9VKy9KZUNp?=
 =?utf-8?B?RDhXL0cxb2VZRHFmdDk1K3FPU0FlUUJZYktZTU5RaEFOOWc3a095Y2JmbWI1?=
 =?utf-8?B?ZW9adE90RVlDTHZYQ3dnamU4cWh6L0JycE9weHk1L1kwdW92WWp1TUg0VzV6?=
 =?utf-8?B?ZUpnbW9mZ3JjNUR4dWVsc3lDWDZaNTA3UU1qbGQvczVrdXBwNHZ2Nlg3a1E1?=
 =?utf-8?B?UFhhbXRCRk1La01mYU5YRXU2NVBJNUhrelpORjN3RWxjTlhSeXowYlREbmNz?=
 =?utf-8?B?cjg1Sk5QamUyR2NRR3duTnhSb2JISmdMWnhjVGRld0RCV09Ea3ZtVnh6VW5I?=
 =?utf-8?B?MVlDS2s2SmI2TmxIMmV0VGJZTXo5UmZkS2RiclUvakVCSFRHTVgwUFp2b0VK?=
 =?utf-8?B?R3ZrakJ5RUtZTmc4bTM4V08vSlBsNHpyY2VINDhGMjBlRlhYbzRzSXltaWVK?=
 =?utf-8?B?RFFwTFBpblFuWmhXQU5rd1lsWTVTSndNTHUrYUcyTlU2cHJha0kydzZxU2Fi?=
 =?utf-8?B?bXJCTzhSWENTSHVWakVSZDZEMjZzbThIdG1UNmEvbnVwMG1pMXpmZTF0cFZx?=
 =?utf-8?B?VkRWcUF3NHM3WXVXem1jN3IvbXR5QXVydFJLemluckZSZmF0eTlHUXVpeFho?=
 =?utf-8?B?ZHJhd0NpZ0tZYkFhT2FYbkFRNWxWU3ZoRmFnb0JIWGJSUUVNcW12aXU5eXdN?=
 =?utf-8?B?SURqWTgzSUtYMTIxQ3BzRUF6K2lOKy83NVZNSTVzMDBhOUg5NnNKT1dGTE1C?=
 =?utf-8?B?N3pXOTZYam5MSnI2MlFSeHNjMHlIOC9OLzdEYkZ1Q3l5c2JTVlBOUW8yQmhk?=
 =?utf-8?B?SVJlREtoWlVBT0tRZHp0dE9zb0tVbVVJZlNEbGRxNm5SOUlVMStsanhDdGow?=
 =?utf-8?B?QWRmZm5INXFoeDkvMnRYbWd5VldmaVB4dS83MGlQZmsvNE85YnJCWitnUWY4?=
 =?utf-8?B?ajR4cnBOOCs1c2ZWMDIvUE52SzNuZUJHRU4xMU9sUnBGNHJzMnVRU2FXazV2?=
 =?utf-8?Q?af1+haT8l6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEdkYy9hT213OTNjNklSc3BIb2JsdlV2ZDNzcXJDK1ZoQSs2MUVaQkloUjA5?=
 =?utf-8?B?NXp5MHBKemVCNEhYYjNlUDlEaVR6RjBlRmNtZGNPSk5VeHJEcm1vTDgxbEFZ?=
 =?utf-8?B?VmVscG93NndScHhkWE5lcWxzYUZmcWIxSy9SQkJFaU53M1J1Ujk4TGhMRnZp?=
 =?utf-8?B?dEdFUTNVSFNWV1cyYVVQZStHNmxvSHVUWVUzMXNGQkhuRDY4a0hBeDJSZkpD?=
 =?utf-8?B?Zkh4cTlEWGR5dFRndjFZZW82RGhoYUJrWWkrUEE2MExwODNqMWZBVnRjSG5G?=
 =?utf-8?B?TXZlLys5eGR5ZnJQNGJiZHczKys4RHhWSFdjTjlPVWluK2VBS2tIRFgwRmta?=
 =?utf-8?B?Mkp1aXR0WEdIWUV6aG16M2RGS0Y0T1RNVFBrQTgxZk40ZkxhVFdsZjZ2TVlM?=
 =?utf-8?B?T1ZxVVkyQzVpRGFFMlFLbHA2ZVp3NUpTT0ZXRWpKdXFqd2k2VzVHaXY3ZFlC?=
 =?utf-8?B?T2hvTTNzbXdkSnhkRXVDSUNWb2JaY0MyWGZhcHdwY1B5WTZkUW0rcUlUQ2lQ?=
 =?utf-8?B?QmtLQUR5MTNYcUFYMFhRWDVzMFFybS9Ub1phNVNvLzcvWVpiZnJYeDV4bGtX?=
 =?utf-8?B?a0c3N2JvY21leUZYcU9JYUNKODRhV2JxWC9EVHB3N0g4ZnZqajBmcW43dnB2?=
 =?utf-8?B?TGxBdW5EZ3hJU1Q3NXhuODdhK3AyTk5zODhYN0dIN0ptNnQ5N3FKSlBRU3M5?=
 =?utf-8?B?RmJESncyK3lDdDNNdUVMS1VHZ3VGeHUwMUFSZVpvQ0FJSFhVNUdZQjR0NnNZ?=
 =?utf-8?B?YUhQQ09xeGZucm9VeFZlVnpzVU0zbmxKZERDT2FlbXhDNk9wWmsyVUZXVzVn?=
 =?utf-8?B?MU0vRGhNcitzeHM4blMzNFJZbzZQR09meWxXYnhqTFBOR1hpQ2JXUldpRU5z?=
 =?utf-8?B?OUVoRmtzbGtEU3hnd3ZmL2N0bTdFS3NvTlkwNDJrd09zNkVwWkJxYTRFUytG?=
 =?utf-8?B?bU1QbnE1SEFRK0lhQUVBZXB4bXNndHF3NTVCRVhLN3dlVzdtaHk3S3A3UFJw?=
 =?utf-8?B?ZzZOcWxWdFlRdTFWRVlOSFRFeTJ0TW41OFJGdUtRZm9odnFtb1lkNXdTQ3VX?=
 =?utf-8?B?L25HaW8wMFlCVy9mUFNCZGFyTjJXSjc4ZnQyd090b0hKUHhiQTVMQXl2ZFow?=
 =?utf-8?B?TFowVGlCT211c0JLMGZDcWpMZFlTS3RMMWdwYVFFeGtodFQ5a1pBYjB0dGtM?=
 =?utf-8?B?S2E0NDN6NjZaVEtuWWJqa2h3V045WXJRSEJKa25GK2NBdERJU0VYbG5sVitC?=
 =?utf-8?B?YnFjbXM5eHlvUkJnSnpBRDBpVTA1WFU2c0s2VjFvbXk5MEZZeDQvVVNUakJK?=
 =?utf-8?B?NkVvbFBETjdpUjVOVzN3V0FGWGxrSnNIZE9GR2NRRE9rcFhObXM5ZHI1emhV?=
 =?utf-8?B?cTFIUS9tSHFKQjNObWpvSEp0NXhRenpCaDRLS3BkMlZTNHNEVUY4TVEwOFo0?=
 =?utf-8?B?ZlNsNER5Q2FzUTZhQ2l4YXZObkg2OVA3bmVlTi9BSTdPamtpQURqbWVqM3Va?=
 =?utf-8?B?L1ZPTExhT1I5WmdDRll2MktUbmMvclk1RmZzRGEyZnNkOVlYUTRrb3pXNWVp?=
 =?utf-8?B?a3liRDNDWTRSK2kreGVNOU9HdDlad1pDWmFxa3RKK21hQ2VSSjU2cVVyK005?=
 =?utf-8?B?Nk5nRUU2VVVMUEhrT2FJazJuMWVXTXdMRHFFS0pVUlpROXA5Q05GMHJMNzIw?=
 =?utf-8?B?Q0tXaFZtVUhGVG5tdnB0aG1WbGJ4cWV6Y1dha2QzUCtwdDNOcFhBZVlvL2d4?=
 =?utf-8?B?MTVva1ZOWGhlM05ML2MxZFUxSDlyQVkxNXNkMjdhTldlUi9qOE1kbkd4SEhm?=
 =?utf-8?B?UHVmRWVDczZQK2FRNU1nN0hORXN2UGpCeFIyc2RvaGZDQmlNSnlxcCsxSVlF?=
 =?utf-8?B?STc1bUtuUE5HOWlkVEp6RjNMQ3FnWGVucUc0dmxHY1lKdHhUdy9Ka1FwRWI2?=
 =?utf-8?B?Tm5JZTRDUlNmR051ZVF4RUFSdHg1MDI3NkdTZkVpNUtuUmxhcFNIcmYxZUxV?=
 =?utf-8?B?Q0hBTmhUcjBXRHliY2sxajVnZDhSSnIyY1IxSTBEWnZLNk16Q2ZBaUtvY2Y5?=
 =?utf-8?B?MzRWa1Z5VHJHaXhOYTFFVmJEVnFkWWE2TUFoK1JlNFdMMnE3YjI5cUtKS0pz?=
 =?utf-8?B?U1kwSXc2Rk1RcE9jL2NIZTRpd05VTGF3L2hiUUtheGFqOXZWSzlWZDV1NmlO?=
 =?utf-8?Q?ewQNZxXbYDcsGp1ZxgDMJOzmhxpM8Zuh59Lcc7Nu30t0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b24008-e346-404f-86e7-08ddcb80136a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 13:35:10.0676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r0aClP/UD0gPy8pyjE7ub+c4e1PHfRdxt+jCxeicQwhZCIUW/Pl2uy94Uu+uvgZi+qXR61CmYYBqrMarM5+clg==
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
> Use the offset_of macro for each struct field, annotate the
> `PmuLookupTableHeader` struct with `#[repr(C)]` attribute,
> and add a TODO message to use FromBytes when available.
>
> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> ---
>  drivers/gpu/nova-core/vbios.rs | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios=
.rs
> index a77d7a4c8595..cedfcf3476bb 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -893,6 +893,7 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
>  ///
>  /// See the [`PmuLookupTable`] description for more information.
>  #[expect(dead_code)]
> +#[repr(C)]
>  struct PmuLookupTableHeader {
>      version: u8,
>      header_len: u8,
> @@ -901,16 +902,17 @@ struct PmuLookupTableHeader {
>  }
> =20
>  impl PmuLookupTableHeader {
> +    // TODO[TRSM]: use FromBytes::from_bytes when it becomes available.
>      fn new(data: &[u8]) -> Result<Self> {
>          if data.len() < core::mem::size_of::<Self>() {
>              return Err(EINVAL);
>          }
> =20
>          Ok(PmuLookupTableHeader {
> -            version: data[0],
> -            header_len: data[1],
> -            entry_len: data[2],
> -            entry_count: data[3],
> +            version: data[const { core::mem::offset_of!(PmuLookupTableHe=
ader, version) }],
> +            header_len: data[const { core::mem::offset_of!(PmuLookupTabl=
eHeader, header_len) }],
> +            entry_len: data[const { core::mem::offset_of!(PmuLookupTable=
Header, entry_len) }],
> +            entry_count: data[const { core::mem::offset_of!(PmuLookupTab=
leHeader, entry_count) }],

This chunk does not apply - on nova-next PmuLookupTableHeader does not
seem to exist. I think I remember you split PmuLookupTableHeader in
another patch, so can you send all the relevant patches as a series that
applies cleanly on top of nova-next?
