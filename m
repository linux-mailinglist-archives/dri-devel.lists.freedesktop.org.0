Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02206A39570
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 09:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F6510E2A7;
	Tue, 18 Feb 2025 08:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qayb8qvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004F10E0B6;
 Tue, 18 Feb 2025 08:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGRfXdA3WSCKqfFHKKfyS2g1U/mxPSta2yGFHnDTMsC14EK/r4IDeydVGOSnUMESyTKm6N588IZyHUEvHEV7wT/ErgYGeLgVsdT1GXziCPkTtzTz2CK/fC1s/Ur80XpHsCS5XIWpwl59F/buYdLG1yOTPrKfrcNkmZtUA57Q7ohZpcOVeSadIH6xxThEQ7n/3IZdp20Kbvh6SVENLjPyzFL4pgbI4PRbUFibh1Rdr3XTAdzyyL1DW8wRSkZ7HSzUl5XLpCKTkqblqfAv+EOv4ZTNX2ZtIWW0qdM48Ad7gIsjj9lwJuM1VkFpWQU2vUsE1jYDD43MpmlzXRR9nkJGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oraP/SVZibgmjwmEEToPiTukrB6deOESfgKiwhwbmgo=;
 b=seE2GIrzrT22UuxOpgTpwiFyq4TPxQTIi0gXKRFSMTOW1K336whJVCtwy8B6sbiYbjLpIhRfPK9buuZat8P6qXoIngIYmwy2xglsfOdQBHjEhgsWb0GAOQovvNoOaNmmfdwX1sCqaO8yYEFc92UtSgHAVAXNr/Lqi2aM++AeIbJZZAlcfyro4v/SY/2HB7BIRqodkPwhI2Y4OJOG5unt/H8g42ZJyNv6nn0beJ4OdDtpgSHbcTfhNBd7SMNCVZK7riwg3Mx/zMeiAvMsi1E2pSrcQ44aWJk0Bx2ER3gdP6+jUGMrkAlbo1zaFWQpAugamqgQiVicHABkjMDC39Yl/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oraP/SVZibgmjwmEEToPiTukrB6deOESfgKiwhwbmgo=;
 b=qayb8qvKwrDFqmd+Fvr9f1v3qbRLEx5iYNMeLleqDBPLVIm7g5DZjoBZxPutVNrEPIythyY4fWfmPPAx2vwXufb/So7E2iRPlghTieua/IBkVr8h39HX7B86ZoxjOBZn7QNrLxQ/zrERiTrROe1PWiFX2woAC64VIqnWu3RUU37zZb7UqDc6zcrXXvuTMzFT6xjq5tkCdSaOB0roQtWeuu0VH36ga4ZlDgyHBgMgH+p9l2JO2mi+k3kzTgIqC1BUWfxvzLouI8wyiAQKuWZ0C3J13UehjAvbDkDvgE0S0VtHRjuxoqdJUm3SWKDbyt6fqP5/2KmpObv3xE9Bj6C/Sg==
Received: from BN9PR03CA0858.namprd03.prod.outlook.com (2603:10b6:408:13d::23)
 by PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Tue, 18 Feb
 2025 08:32:37 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:13d:cafe::76) by BN9PR03CA0858.outlook.office365.com
 (2603:10b6:408:13d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.20 via Frontend Transport; Tue,
 18 Feb 2025 08:32:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.2 via Frontend Transport; Tue, 18 Feb 2025 08:32:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 18 Feb
 2025 00:32:25 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 00:32:25 -0800
Received: from localhost (10.127.8.11) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Tue, 18
 Feb 2025 00:32:23 -0800
Date: Tue, 18 Feb 2025 10:32:22 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
CC: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, "Danilo
 Krummrich" <dakr@kernel.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau/pmu: Fix gp10b firmware guard
Message-ID: <20250218103222.0000313b@nvidia.com>
In-Reply-To: <CALHNRZ99cs=rcR07jqsZE7Q3ndLqteKG8K8zpAm4vaEhsYwTLw@mail.gmail.com>
References: <20250217-nouveau-gm10b-guard-v1-1-0d96f0068570@gmail.com>
 <CALHNRZ99cs=rcR07jqsZE7Q3ndLqteKG8K8zpAm4vaEhsYwTLw@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH7PR12MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d4f0ea-0c18-4341-3d67-08dd4ff6cced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDBiTGphUzJDWWJ0NEpFeDA3YmlCdUdYL1BMdGZZRTd0Y1B2VFZucFBOa3VG?=
 =?utf-8?B?bkxvMjFETTdGeWV4QzNFeHRTSVpVMThpOGVSanUvakJTbmdKUmE5UlpOc3pn?=
 =?utf-8?B?MTFqZFBCaVRnMHFvV3FZd1p4RmNVQTc3MzdnU2trZERackJ2c2NRYWc3M3Q3?=
 =?utf-8?B?TEozZ3ZTZnY2eTlPWkpKZS9IOEtwMlp6Y0lteG1ueDZ1UFN0TG54MFNKb1FC?=
 =?utf-8?B?QVFWdElKU2wvalYyQTF4RUVvYTZnWmZ6M0dMcHdCTno5a0h1YW5HeE83Yzll?=
 =?utf-8?B?VU1md3dHSXBuVE9xUHR3M1g1VTR0M3RyaUJ4OUZoUzdFODlyb2ZnVXlFZHpv?=
 =?utf-8?B?RGxQamtjeFAxZWNtY3ZhQ1p0MEJKai8vRXJPaWlBdktLVk1TdHFOUFhLSVo1?=
 =?utf-8?B?RTUwNzJ1YnRqYks3UkkxN2p5VDc5SFFPTkZCWDB3MGgvQnhWZ0JGMWVRT0xy?=
 =?utf-8?B?UHdFNTgxakRlSlBKWGppOHNmZmgvR29GTE1FVU0zS2FIam5sMHdKYkpKOU5M?=
 =?utf-8?B?TndnV3N4eGliN3o3TFhlY0pmL240M3hWeFY1MVRlbXQyL3NkZWZ1TGR4NklH?=
 =?utf-8?B?MkN5QkVtYy94RkZ2Q2hWeEJPMm9WTThaTE51T3NVSzlXbnp6clNpU09FQkpx?=
 =?utf-8?B?WHRyWFNsNGdSU2lMdmk1TDdsY1JGWGZsQnZIcDFiTWVsK0dlbkFYK0RTUHFP?=
 =?utf-8?B?TjBlL2psVkJYQXptdTNIZWxsTDRWTHJpNW5TZG50WWhjd01uenRiUkN3WFho?=
 =?utf-8?B?d2Z6VlVxOXBoZ1JzRTFYTjVrc0NDTzZJU2FZckZwbk5QaW1XbDZTNUtrWWJN?=
 =?utf-8?B?NEM3UUJJODQvdVFyNGpXWWQrdjRpNWVEaFIyQkYxZU5EWERCTjRVdHJLYk5B?=
 =?utf-8?B?dldmcGMzbkVaN2E1SGNsYWpxU3dxaFBOYXB3elp3SklVT0h2K0U0dUJPNzlL?=
 =?utf-8?B?ZS9rb2VHeHc3N002dUlYeXIzL2dPQU0zdGIxNWpTNUNhQTNZUE5ZZDNiZDYr?=
 =?utf-8?B?bkYxc3pBZGVLK3BOU0lXSFo2aTBobUVZVjZlVmFtL3NXTi9rRUQ5NkNZdW1s?=
 =?utf-8?B?c2tsbGU2SFlGbzZYYU5pbnlwcER6MWdFaXNtZ1djcHEyWHJuUjdRY25SSThE?=
 =?utf-8?B?Ynd4anRKSmQwT1RidkdWcEk0TEl6Vng4ajRqdnlDM1h3blhWeE1Fdzh5SDlE?=
 =?utf-8?B?Q3p0enFOM2did2o3Rk1UNmFWVkNSNTdSUVkvM3hNaFE5NW9hTDBvaFpIOHFN?=
 =?utf-8?B?c0Vaemo5TFk0WVIwYnRhRlh0WCs1UUtZaGIwN3dKVEhWNVAyQThQNk5WWU9t?=
 =?utf-8?B?eGF4YXQ0RGNvbEo3SHBnSFBpbUpOWHNnay9EaXMwNWpuN2xraUZHRkIrY1Nk?=
 =?utf-8?B?T3FPbk9mK1c2d1V3TEtuWWNhcVF3bzV0OVFRZzVJQnJUOHBaQzZoeU11dHZy?=
 =?utf-8?B?MTJ1a2ZMN0NTQ1A0MGpOdHNjNWllQkxGaWRMK3RjMVd2Nk0zV0QwM1dWZUhG?=
 =?utf-8?B?QjhTVWcyTXBUYTl5aWRxdXQ2bFdjQmRZOVN0eVhIeC82M2VMZlJmUjQwZk54?=
 =?utf-8?B?aFlYVFJvdG13RXF1Wk05alhIZWllYk5lU2gvRVhPZWtieHYrZ1h4N0JOcmJ1?=
 =?utf-8?B?aXhIcWdFR05hQnVid2pSbUpIamZpMGNoYW5oU3orRm15R1o3YzlNeC9wbk0y?=
 =?utf-8?B?QVZpQisyckZTcHYraUZJM1B0T1A4d2p1K256MGI5aE1LZkwvY0ZwZ2thLzBF?=
 =?utf-8?B?cHVxcXpISkFEUi9vdkRiYVRKcVFyRjkvL0U2S29ycGJ3YkE2WFp5V2J5YjVK?=
 =?utf-8?B?WTJDTG5wdTI3c3I4OHhkOFpQVVVDaEE3bHlrcGNwNkR3WEVKdWRURVZxbTl3?=
 =?utf-8?B?OStkZjh4dzFMTUd0NXhsVU5PZWVLbkhXMTByTDBjRnBBZEN0T2w3ai9WVGcw?=
 =?utf-8?B?SW54OC9XV2NzNWgwdjhyeE9TbWtwNTBYR3VTM1FKa1BFT3RMd2tweFFsZGVL?=
 =?utf-8?Q?cmIVIfGffCnCmQpzI6q+OgtlG2GJCM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 08:32:37.3096 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d4f0ea-0c18-4341-3d67-08dd4ff6cced
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954
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

On Mon, 17 Feb 2025 17:46:41 -0600
Aaron Kling <webgeek1234@gmail.com> wrote:

> On Mon, Feb 17, 2025 at 5:43=E2=80=AFPM Aaron Kling via B4 Relay
> <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> >
> > From: Aaron Kling <webgeek1234@gmail.com>
> >
> > Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on a=
vailable firmware")
> > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/=
gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> > index a6f410ba60bc94ec9d52fc78868acddfc6770e19..d393bc540f8628812990dff=
e4c2f7e9014be07c5 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
> > @@ -75,7 +75,7 @@ gp10b_pmu_acr =3D {
> >         .bootstrap_multiple_falcons =3D gp10b_pmu_acr_bootstrap_multipl=
e_falcons,
> >  };
> >
> > -#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> > +#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
> >  MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
> >  MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
> >  MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
> >
> > ---
> > base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
> > change-id: 20250217-nouveau-gm10b-guard-a438402b5022
> >
> > Best regards,
> > --
> > Aaron Kling <webgeek1234@gmail.com>
> >
> >
>=20
> Apologies to the maintainers for the multiple resends. For some reason
> the lists weren't accepting my submissions. Looks like it went through
> with b4, so hopefully I won't have more trouble in the future.
>=20

It seems like this version doesn't have a comment body. Might need to
double check the b4 setup.

> Sincerely,
> Aaron Kling
>=20

