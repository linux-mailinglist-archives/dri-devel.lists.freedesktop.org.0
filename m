Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1F8B3D3C0
	for <lists+dri-devel@lfdr.de>; Sun, 31 Aug 2025 15:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E385E10E2F0;
	Sun, 31 Aug 2025 13:50:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ju/zWk25";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25A810E00B;
 Sun, 31 Aug 2025 13:50:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vRnTX2DIcN428HFGP6mK5v6/9uRwp7fdGQ1cUN0Ecb25Iv8uu0yGd6AoqTPblTB3ZHrmwUZoXXAQrPhzy7Y2b3v5DWC6J3pI1dHdB44TlmuGeIFREA2RO3/YBxKCNdXx/aIL5WPCXwUdh+z2Bsw9bFKlr01jfasj7jdEDj7/PI9xQBdnu3uSP56X0eKviIsYiPXbQzKjP2rMeae7addNItOAl6TkiiSAbq13zhl5YfY1Mlw27iUr6o/CCfUhXhmffrweOifijx/iB5o7k7Nfxg32cSQ48GMXSdvgUbSQ7AYmf3xUlf8ars59U1eQqxpppuIJKH/GlBSzhDI/kX68HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkG4lPfypu7Y7F7YTY63UD/fi9gmw0xHQDimJSzjM7E=;
 b=Jf4x/e+GT7/2H5scxqpbU9AYBYackZC26eHkfduSzJfVYtR82DdhImaVgTa5rDi5UBGFJJPEcDuQYyXFaB32FHn/G1OAzBxQ/hPvWhvjN4YvnWta1346KoEZ/a6WUFrGhG7tHWzqsMpoh2SxJKQJfUUrAaawzKI6XVhgHhK2d17laqPbqw235q8QZ+vi8d++ur/u8vTHkUkACEdJxyygkJUA28KHEIU3kTkVbww4Esew6Vj6UDBHHsrL1ElQWz00S+GR7PzMKURrIn90RaXRNF+p2xLXHaW4lxjp38fI9byxiHzVuIRg9UUz0cdYfkMS4aznAeADuRUQ6774by83QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WkG4lPfypu7Y7F7YTY63UD/fi9gmw0xHQDimJSzjM7E=;
 b=Ju/zWk25gFGU4XhC7eQg0wDc2MelK29ngfNZlMkbjNs8Jt9cjToqMnW7NkkUY6bQ5qT4hSifpz3V0yCBClP+mMqX5gXN2hlvezNMrtEdh2Inagj7ayLaSnd1736jfm+oq18VDOUsCEbCLQWfyMMaqppqO0S3lqa3U/+HmqQlyGGf6B20pQY8+4vgJW9rKFRZrT1CacAtBqpy/ekgkBuvXJWAJ9rwdMfcPg9utBwx6QubtTlerVpDxP/KKzkfh2dZKU3znpeqBrjHbXE8evqqsXE7bIjs8vZew2df/HQwaiYQ1rpq6rnDiPHv5OclXnW2KowX7q6ZH82u7Ny8MqkYsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 31 Aug
 2025 13:50:54 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Sun, 31 Aug 2025
 13:50:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 31 Aug 2025 22:50:43 +0900
Message-Id: <DCGNTYLUDMUD.2OVROKOZ97QWP@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH] gpu: nova-core: take advantage of pci::Device::unbind()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250830133255.62380-1-dakr@kernel.org>
In-Reply-To: <20250830133255.62380-1-dakr@kernel.org>
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: f64e93b2-7d81-4d2d-79d9-08dde89562f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjFLTysya2pULzV1UnpUd3FXM3Jpcjg5YkM4eDZqcm5DenRZVm5kbUtkdFQz?=
 =?utf-8?B?NzhHNGtCb2FoR0VMaE90MjNqeDMvd1pGbXE4RjVrRllZdm1YQWtrbG1OTkFj?=
 =?utf-8?B?aVkrWjBaa3ZDelhoMTlJWnBmVzB1c1hzdi9qNmFTVU1ET1A2dU03dFdCOEZO?=
 =?utf-8?B?TXZuUmdFckdyTHdQTzBReEVtY2tNTGtJUHc2cHZzZnVKY1ZQSHRJeWhMVFN4?=
 =?utf-8?B?VVF4NDluUTJ0S1lNbmZVTUFFY2ZveFNRMWRaNkV2SkpIaTVIMUJCM1BaT3di?=
 =?utf-8?B?NjEzNXdxUFlPUXl3VDhELzNUK0RPTW9uUi94TXcwT2l3VWkvWGRYMGlJMU1a?=
 =?utf-8?B?RVN3Q2pDNGNBWWJZRWZwNUhRMStlRW5uOVlMTks5anpKcGZOVDlrMEFZQnZS?=
 =?utf-8?B?NXdHb010d2FYaFBCM25uRk1vekdwVUFjVFVTQVdMbEUzMDBYbVNOQTVVNkR5?=
 =?utf-8?B?S3llUC9Bc1VpUzBiQTR4Uk1yaFEwSGZSakcxYW85ZDUrdHRBeVNuMjNWallZ?=
 =?utf-8?B?dG1NN0I1VkdlVTZTZTl1RjNBMnk0TlJtZU5ndzIxQ2R0Y3lheGxlVSsyeW40?=
 =?utf-8?B?cU1XUCs2a3NFYTFUZzY4K0wxbnkwMDEvNDFscnBiSyt5RjFqWUQ4K3p4Y1Jz?=
 =?utf-8?B?ZjlOWjQrQnJlYTB6Rk1rd3VTcWo2RCtxOHllMGErUXFuU29zUm5KYUNvV0Iy?=
 =?utf-8?B?UHhWWWdwZlVOdVpKTkVqS0Y4VjVsSGF0RUd5UDFNSGZTdVA3ZFlIRVhBSnFQ?=
 =?utf-8?B?ejVUaWZnZGEwMkhlcU1LdHlzOTJmVHgxUjM2OHRwUTRTRDg0ZVgrQVJJUHNz?=
 =?utf-8?B?N2t3eFcxdmdYNnRIeWs5a3NJRkRxL3JFL21WWG9aTzBUb25uQWFkNzd0QTZn?=
 =?utf-8?B?ZnBvUzZXYjlZNVFZMjl4czBhbFVPcDBscFVMRGFKKzdvcnkvK0pvY3pEMUVW?=
 =?utf-8?B?Uy9mVDZpYUdyeXFQV0oweE96MUsxN0FhQU1lSU15RFZCYi9Bem03NENNRmJE?=
 =?utf-8?B?bTdNNkRFbmoyclNSaWt3bi9RNUZPOVEyZzBHSFYweTF6NjhKZ3ZmUjNPV3dv?=
 =?utf-8?B?dENYQ00ycUdLN3FISGZMNU1DRnAycWprcjhSaHJMUzNVVjZydm1lL3BxdElw?=
 =?utf-8?B?MU4zckJqcmdlMnJ4Ym91bUZDNGNrNnBOVENJcjlOZXNwbkYyS3lIR0orbUJn?=
 =?utf-8?B?U3YvZ2V3TjIvRm9WdEVkenNzRzFBSmhXVDY2R3Bpbldma20vM1MyMnlyeUFm?=
 =?utf-8?B?RkVLYUQxNUNhZEJ5SEYxNncwT29jeTgyRktqei9WbkRBNUVVZDJQdkxHVDZ6?=
 =?utf-8?B?T0FIdFhFZ1pXZVdxRHF5N2lwN2dDTUpzaHlQMGRyaXNYaVRFTlgwRHRBSW5D?=
 =?utf-8?B?dDMrWXNzWW03NUs5WFptYlVUQ0gxb3M3aGdCUG1Tc3o1V3dEUlRWeHFqc2FE?=
 =?utf-8?B?ZlF5cUM0OEtqcGttOHVxeU1hN2VKUnYrc0wzRThNUlJnc2c2QjVabmFnUDZo?=
 =?utf-8?B?WWF5M0hOdlRQUHhHZVNCbncyOGtSa3NLTXpxT1lmZ0JleXZQK1h6cFpCL2ll?=
 =?utf-8?B?eit4ajdkZkZmWWUxMCt3ZFBFbzVWNHFYREpjQVNUdTJRaGJiN0lxaTJodDZ1?=
 =?utf-8?B?c3JxWmwvL3p0SWRHanB4NUNlSmcxYWdGK3VSTjkzd3RLTkRRODc1QTJqVm12?=
 =?utf-8?B?QVZwT3pkQzYzbFpHV3VZQVg1ekR0eHl2cVBvWUdMN3AwbkIrTm9iNituSEhs?=
 =?utf-8?B?OXdobFB3djd5Tm9zNWxOOVd4RFlGT0FxZTJHdVhsb1RSbkZzbk81dFVIMzVj?=
 =?utf-8?B?RzlGemVZTFNiMldRS1FtK1ZDSzNHVWRQVG5kcUV5cFp1WktMT09XaDArTG9H?=
 =?utf-8?B?SjJFdTlXendQWmdiTERycnFuQ0RNQ0RZZm5VYnBiallhSG1ENmF6eWwxK0ZW?=
 =?utf-8?Q?17kXrXRnVk4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU5jN2UvUTJZM3NCY1VFcDFOVVpDYzA1c3VBL3p1ZHhhYUhUaUM5MGw5SXcx?=
 =?utf-8?B?SC9HQkV6MGRaZUpwakZHam1ZeVBHU25ObDFrcVJvbGNRZzA2YTNKT0phOG5z?=
 =?utf-8?B?c0pRUm5idkpuQ3JzaitsZllJbEdVS3dQWDN5bTFidjVlRHpaZCt4OUpITXN2?=
 =?utf-8?B?a0hjbVVTeTlqVE43Uk5PcndieXJ1YUVoaUNGaVFQWDI4ZDdSM1ZhL3NYNDlw?=
 =?utf-8?B?Ykh3VlQwdFppRDh0bi9jRkpyeHZVOFJWemFscG5UbklxYkJBd3RHcE1ldnpS?=
 =?utf-8?B?NVNYUk9kTnNXUkY3VVZkVkQ2WEFqQkRITmxWckNoYUxCYkt1d0llYU83cUt4?=
 =?utf-8?B?NEl0ck5GU3V5MjN3L2c1ZXVDZ2J1Zy9BK3RqYW1pdXVDTmtwZ3dUOW41dGVV?=
 =?utf-8?B?MVhaUVpkNlRELyt3UmJPNzdSdk8vZzlRV0xKNGFBcUVBakVNeHBHOTgwVWlj?=
 =?utf-8?B?eFZyMEsyb0dScmcwZXNpRnFIRkFST3ZrR0FPVDlsbEh5alpCNUdoRXllNEF2?=
 =?utf-8?B?VUt2R281YzBMTVdaK2pweVZHQVhiZmpheWpPZUxMNEU4Y001N1k2YlFxa21O?=
 =?utf-8?B?V1h6WlEzd1hDQjQ0aTBSVjhGcnU4b1BmTVljZVJkcWdTR09ySW5RNkthWVlL?=
 =?utf-8?B?dnRhcGdQeDBFM1NxVGxiYlBhcVJ6TnhGTG9ucEl2Q3g0L01CaTZUdXRVVjYy?=
 =?utf-8?B?eEoyVnMybGtKaWFSbjZueUNPOEJ4cFV5aGJ4LzRxSUUrU3p6a3V1b3lpYmlW?=
 =?utf-8?B?VXhIWjJZV2V4dTFBdDNHVHgyMHcxWG40RGtvSVdVNzZBYjREVWtJVkJ4RDdZ?=
 =?utf-8?B?WTRSbFZYUHpsNVVoMzlHUEpxRmZyOEJYRkMyOTQ2Z2swTWxJdXlhOE1RT0VB?=
 =?utf-8?B?NjJpWTRhTWdjNUpFZlFobThGVjNPUjZha0Q0a2hyTEN6b1NVNVpYSzdvTElV?=
 =?utf-8?B?c01qM1lVa0lFdDlXUVhtOURmcm1vdGd1enVFc2p5NzZDdTdJT0I0aXBkVmxP?=
 =?utf-8?B?d2sxaWZwcVUvaDZHMWJ6cW5GZWxKelZTd204cHRjZklHZG90TVh5TUZTYUpS?=
 =?utf-8?B?bGgxSkZIQmN3UXhhRzFJSU5XcVFaOVZqbFBNQjFSUFNkY1Voa3c0NzBidWtQ?=
 =?utf-8?B?dUVZVVRsMjJkMStieTlpcDJVaFJ1OHN5ZWl0MzFYc05ZR090UXhGVDZMUjc5?=
 =?utf-8?B?UCtvUzB5VkpvNkpvdEVvY2xGYTZWOTJtYWtkeEswTTlIWVVmMGN6cW5mNE5K?=
 =?utf-8?B?QTJZTUZIRVhxQzh5SVRVTFI2WkZTM1k2WjAzSUtENE0wMFV2REsrd0M2Q2NO?=
 =?utf-8?B?T2dDWG5CNEpKcTJDc1VMQnRNMWo5VSsyNkJLU1REN0hkckF3dTBBcWpUOUk5?=
 =?utf-8?B?bk9DcVhuZGJQLzlWUXlFcG5CM1lSelpZOHR3M0ZGcnNDbi9lck5BS0gxRXRy?=
 =?utf-8?B?dm0vdVBwbXVJWXJXbk8yaVBibXRkT0pFdktMVy9XcFZmWGdoM2pCSUQrWjJt?=
 =?utf-8?B?Zzlwa2hBSnM5ZWN4L292cTJ6SUxhZU9hTmdnaDY0SlpDc2dNMFZyNUZVT0Yx?=
 =?utf-8?B?Y3gvL2t4UWdsL1p4QSs1LzJMdXYzQ0MxakQ5TlF3SXlEZUJQSnl0bW9IUW5I?=
 =?utf-8?B?YXVidkRTN1U0VThieDQ4d09SWXlyOFh2a0ZhUm1jOTQ1L3NJOGtzNEkrSnhQ?=
 =?utf-8?B?VE9ZUXh4eTRaT2tkNitRNGE3eGxhZG9vMUFZSjRwTXBoeUFja3ZLdUdsQXli?=
 =?utf-8?B?WWpVdHRUYS9PTEp4V1RKVVl6emZpcXYvT1JzT2huUFNhNUtBR0pROWdmUEhH?=
 =?utf-8?B?SmZ1czNBeVNKeGZFT2NIWHhNa3lKZVhvNnR3MXNaOXBPcmhTNkFTZ3lyNGxr?=
 =?utf-8?B?UGsrQUVwYzBxM1VHNDJneDMvQ1hlUnRHUVh3a211em5yUEg4amljNjZZTlEr?=
 =?utf-8?B?bDNyUTU3a3N3NTUxNG5hbWpLTVYyWXRIV0k1RWZZbzhibUhOM3JWQzlyb2JO?=
 =?utf-8?B?UG9meENLOXhZQVBxUFczWGNtMGIrT2M0UkYrNzQ1b3NyVUd1cE1CWU9tNlM3?=
 =?utf-8?B?NCsxTm9qUmQ2SVlrMm5ZRitaWHJPZHZrZGQ1eE1XYjR3SmpXVFVnYXZTaHVv?=
 =?utf-8?B?ZFQzbGpWRy8yTFlKWWQ4RFlBaEduK1RmamllaTBTdld1eXlrZGFkZ1RwQXJh?=
 =?utf-8?Q?ii5p/GkSj+lZ8WwnbSWJajW7M6xZ9+3hLyfW7X8TOye3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64e93b2-7d81-4d2d-79d9-08dde89562f7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2025 13:50:53.5234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14fqW2f5rSRH67iwtRLRWKgb+x8ZbsME8IFH4nODF5PebJyQqiObL5C0Yoa/nQ6cijR+mUFVoryhYqb5Y1sAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
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

On Sat Aug 30, 2025 at 10:32 PM JST, Danilo Krummrich wrote:
> Now that we have pci::Device::unbind() we can unregister the sysmem
> flush page with a direct access the I/O resource, i.e. without RCU read
> side critical section.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/driver.rs |  4 ++++
>  drivers/gpu/nova-core/gpu.rs    | 20 ++++++++++----------
>  2 files changed, 14 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index 274989ea1fb4..02514e1e2529 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -54,4 +54,8 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo=
) -> Result<Pin<KBox<Self
> =20
>          Ok(this)
>      }
> +
> +    fn unbind(pdev: &pci::Device<Core>, this: Pin<&Self>) {
> +        this.gpu.unbind(pdev);
> +    }
>  }
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 8caecaf7dfb4..2db9afdc6087 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -163,7 +163,7 @@ fn new(bar: &Bar0) -> Result<Spec> {
>  }
> =20
>  /// Structure holding the resources required to operate the GPU.
> -#[pin_data(PinnedDrop)]
> +#[pin_data]
>  pub(crate) struct Gpu {
>      spec: Spec,
>      /// MMIO mapping of PCI BAR 0
> @@ -174,15 +174,6 @@ pub(crate) struct Gpu {
>      sysmem_flush: SysmemFlush,
>  }
> =20
> -#[pinned_drop]
> -impl PinnedDrop for Gpu {
> -    fn drop(self: Pin<&mut Self>) {
> -        // Unregister the sysmem flush page before we release it.
> -        self.bar
> -            .try_access_with(|b| self.sysmem_flush.unregister(b));
> -    }
> -}
> -
>  impl Gpu {
>      /// Helper function to load and run the FWSEC-FRTS firmware and conf=
irm that it has properly
>      /// created the WPR2 region.
> @@ -309,4 +300,13 @@ pub(crate) fn new(
>              sysmem_flush,
>          }))
>      }
> +
> +    pub(crate) fn unbind(&self, pdev: &pci::Device<device::Bound>) {
> +        // Unregister the sysmem flush page before we release it.
> +        kernel::warn_on!(self.bar.access(pdev.as_ref()).map_or(true, |ba=
r| {
> +            self.sysmem_flush.unregister(bar);
> +
> +            false
> +        }));
> +    }

Maybe I'm overtly cautious, but this method can be called from a large
part of the driver, leaving the Gpu device in a half-unbound state. The
`PinnedDrop` approach had the benefit of not allowing this.

One way to solve the problem would be to make this method `pub(in
crate::driver)`, so other modules cannot call it.
