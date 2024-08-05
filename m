Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EA9947D40
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 16:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C2310E216;
	Mon,  5 Aug 2024 14:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TwhlmkhZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2063.outbound.protection.outlook.com [40.107.96.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0DD410E213;
 Mon,  5 Aug 2024 14:53:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWUzX5bOib1HLH85KdEU6VzrhTk0Vd1n2nB4iBegOhfV4olk7P/fKBj7PEDZQjhx5cCCFVGbjfcDVXWby1+WPwUEFQLPDLbl5DkzXWKUvMCeys2QgMhA0mpXthWTzG+B0r6QRGCyPchG4x8r6rL205j6FG6VXE/I0wuuSL/NIG6UM93MtDaBEsBmwIV8IYAmsPbcLDFdAZ8LXw4EP7JPobeJpjw3hG5uaR60t/OMkfORDMNpD35z+phJTwkYDTuXz8I399zKdil1rg/FklPbslR3C1M+pCzkaUNprvxTBQ+gsqGzUhBUbnvvE5CjXkpwc1Vmgcmu5MCrj+0qXoE+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k84rXDxULlXTFRNgiGQheUUSbMplieTIhKSaJm1csw=;
 b=knJR4uaexmSYbIx7BGudLkM4HbFRNI/0VZPjlTtDR4t/g2UA+TYuPh6KpisfV4jUQnyuu3OHCC/VplTPP6pDJVbftaksHSCnuUGn51vs+pLZ4wRm3o6qe+vhp4Q/NEKxjY1hLr0mTI41ef9qXWH+SLhJm6HJ/hK1Nz9GBnr6qvUU8AcsKreKr5GG5R2j4ziXZRucBgZ32+XFgi/SnuoTREnFd1xbnozkLD2NLboLl4y6RyL2fIQl98Qbw+ifVfpS1CDUVzIszm/pDboDajDvOTXOojuxaGpZCYn/FGPySH9rHR6ILya7QCl7/7yObMuw7KHOfmx2q64So8dSHevNvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k84rXDxULlXTFRNgiGQheUUSbMplieTIhKSaJm1csw=;
 b=TwhlmkhZ19/4PY8KtSySnKYaLa74BMS7euA5FE9Scc93powOAlCK5+j5dpPUgqDDAR+MDpRnXy1bYep7Ja/P+Pjkew9veQ6qk1NCVLGUunymnFwCauV33XPkRxS3CDXwWg/FDm4vjF8WEK6RHQgsefdfqairmXqv7JJazk4ZXXE=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by MW3PR12MB4425.namprd12.prod.outlook.com (2603:10b6:303:5e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 14:53:12 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 14:53:12 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Kevin Holm <kevin@holm.dev>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "Lin, 
 Wayne" <Wayne.Lin@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Mohamed,
 Zaeem" <Zaeem.Mohamed@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
Subject: RE: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Thread-Topic: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Thread-Index: AQHa4rHW43j5fShMmkG6pSIm6JTBz7IYyLkw
Date: Mon, 5 Aug 2024 14:53:12 +0000
Message-ID: <BL1PR12MB5144C6C4CA6661626CA81ADCF7BE2@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240730185339.543359-1-kevin@holm.dev>
In-Reply-To: <20240730185339.543359-1-kevin@holm.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=2975144f-c0b1-47f9-afcb-dc959d91d1fe;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-08-05T14:52:32Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|MW3PR12MB4425:EE_
x-ms-office365-filtering-correlation-id: 4bcb3db2-844e-4285-8dc4-08dcb55e541c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kw1+AXRwtV9Fh80pqFr/TTMlx4DRPYg8iDaxC9g8Zk/EAdc21JVCotfnjKtI?=
 =?us-ascii?Q?qaade2N+nbqVsVahj1IJecUJr8PUfYwnTNtbPXFb9r7xV1CjLw9ubTYPTDsb?=
 =?us-ascii?Q?Pul/oUOk97CKHgqXWrpHsaZlI8F6Z/FyosoviVbOEgqOdaYTx7yQyluFmeyf?=
 =?us-ascii?Q?XAfQSQZ/v2oDIjq1C6F5yVoaf6r16o+F4Iytrq7jVwYsAoWHDS37aDhFIKl7?=
 =?us-ascii?Q?u7H0viuWQvWKUlb1sRdYL5V21zm0Z8sC1AeWWJPruPUr6ofSo8gE+Q/9JCfX?=
 =?us-ascii?Q?5ONdqzfd5/sdONh2SUJ5Kg+6PZw8+CLdAHE1M1RtvObpI/3CmTANR6S75RWA?=
 =?us-ascii?Q?FD6bf8hwExVaK89+Xv2Ce5X74xYZCgTIpYMJwqtn8MxSjTvwvN22dqcOFQu3?=
 =?us-ascii?Q?nCuRf6YxHCn6hEs70Sf22BTc8f1XTsf79pbnjOpuq8GtYeuUKgzawwwnrGeI?=
 =?us-ascii?Q?4lHsJR/CBKu6HqvcLRjlTfS4LPglm9VelhwqlUZrWnmyNc2XTZxtQyC5FLMl?=
 =?us-ascii?Q?wU3hKElUs0fs7W6YirGrxrh7T9RqSXFgxlbdgLPds3mdixE7rKK3MFpv2BcS?=
 =?us-ascii?Q?9Dwhhbj4Ms0I3K7Ipr2Ctb7pSXOLxsmzK9zPXqKCP3SRYUfLKNILhIwk+/vf?=
 =?us-ascii?Q?XQw5/SfgNRYuSSwY0ZdUKNeqnCE2qS8hUTU6ZKwqGPCjMuJ/AqQG9Q5AkoKL?=
 =?us-ascii?Q?oCn/LKrBChkAUhDWiiRqxUeS7czPe0+o8Kqdx542eb5v7wfFVK18WXPuGk1v?=
 =?us-ascii?Q?Fjw/7KxHS5FNdgVzFVFiw8LFYDBR/zFA9oErHIuEz+E9GwtTvymqw6Zw4seM?=
 =?us-ascii?Q?xgEN82QT1o3i6j/nulEiYOyr7mbbnfI8d73FhwhW+r34i2EglPQzoCJelyJt?=
 =?us-ascii?Q?OqZF6lMLOWOQP+j7S/1kwKP+Tzi48t309H+04wSLMMeFDioyoi7BShQFw+cN?=
 =?us-ascii?Q?dhsgOLJBp/wIRqhOXWzxH5hvgJe24VWsB1Wa1Fe0W1Uo/yfLHsyFXBpFbt1/?=
 =?us-ascii?Q?q9JRk9cvm+XLpN44Ofzrt42bbLOUFYRyvGthgYXeMBs+0utwLm1gv2hLo2Hv?=
 =?us-ascii?Q?rwldginDmjjHDSwyVcdQGyng+gl/DxWiINVy2s9TeOfLB5kb3OIEVEDQ6qOg?=
 =?us-ascii?Q?HnuTh64Foh2qVAWIrI2VNueiQYbnb7hWBkpUU0tFjbGA/Hz6hCfi5MOe3/vV?=
 =?us-ascii?Q?GN42VwpBLPTsjXomZalk0/HpXYmtH4i9hBWrIya8xLtvK2nUKMnHeMZS3RNW?=
 =?us-ascii?Q?YRbm4PXYu/I/Rm+lyZbrsEMALaT5iMlMbexbINims+lFwA9PP+zWPozCXpbP?=
 =?us-ascii?Q?X/GjTU0zJiq+t2DgKuks8plnnW0+qvJy3KiK8l9rUagd/Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SjUyYoTnWAVBks7JKQ0jTccRq6zKkTM9HTiSQhpNhsoMGi5HCcKLUn+aMtIA?=
 =?us-ascii?Q?qELhypGhKV3bE5Ch1LNilQi17OAUMs94Kmn9DwshHqgFKSO6Th3yfTkZxDLP?=
 =?us-ascii?Q?giPkjVRA2XzeovTx66DnUwkLGiOkDe93DoxGM4Err4Og8DXzTHN6hTN8oZEY?=
 =?us-ascii?Q?oTCawyloJvINF6cD7reSiwqFd6u6skctlgJKxHRjCxa7yx1NlenZ3IeHjiRC?=
 =?us-ascii?Q?lbR4jbQAhC98kVTy/etlNK2MzXBiPvK4i+r5CZYLxeiWDwB4+N3sXo9G1dxf?=
 =?us-ascii?Q?HStfwUkajat74FOtyKc9UeV05a37qLKUsHIgagEPRtrGIc1YZDLfDvpNsFjY?=
 =?us-ascii?Q?48T92/lQUa+YIteUOtGU5ZCJQuPGttqufUK79klXGI3OK2nrwNJuVAMW0GW5?=
 =?us-ascii?Q?qCWpNrNWl7jhJjvotgVoGmaJPXNjxPzi94G4Z3mgpAhl7m60JAdbTNVwj4Sb?=
 =?us-ascii?Q?ELbEI+viGW+dNkRpDGu4pE/ko7Kei6q84x2KDyrolhLPjgsNInYTmJqBePee?=
 =?us-ascii?Q?4+fnddUJXMefGAMmk70q5EwinZaQEKBBX7PxpzHsy9NjrCavQaPnDXJquM8g?=
 =?us-ascii?Q?0hGra+e6TGBCogIPSjDJulu96dv5Y6NhBZOw3LK/WpKcqCv2Gs6YPxjMwuWU?=
 =?us-ascii?Q?ePFmLNjrE2xDOwRGptgcgzQ7+kxwGaYet9PzfXh16//Yyw7UyQcPP1Nbo5vr?=
 =?us-ascii?Q?aPMCKq1sJW8BYll9pv7QSdLRNyARkcR8JM8DYZieNBzTYtlqX7uoBsB8M0Pf?=
 =?us-ascii?Q?5lsHI44nmQ2/NGSRJNfiOkF8faIevck0mshVSoQkM/WYzyF/WCU2362dRbx9?=
 =?us-ascii?Q?x/KS74z/PuVtVs1f5EFW0OWlFGbhl2Wuo5XTZbuEZdO5Rm/MrtOxARaMRPM1?=
 =?us-ascii?Q?Slza+lzxktjKZCh4RrHgOeo7xwOTHoK6cB3I1RVclc6dALO9lyOVlvuU2iAt?=
 =?us-ascii?Q?mqijBAINtXW+jk4tCJYvpHw0MCji+kGn3DXlqpoRZ7ytkXlApv37f04aMCuS?=
 =?us-ascii?Q?dhUlY6cxvNqeMbJVvIXQ9ozwH0r0xN4XYAJaodTmRupvjuXsFX3Vt4evyZ86?=
 =?us-ascii?Q?IWu6kpKt6TbX33/Hyb37ydLCxKl4Ag5/og18nOsO8nDg0XbjbsMXlMwD134z?=
 =?us-ascii?Q?CAfWwWdAvaXi/xFfiUubfw6J8sEFoXK0RKTLM3WHbRQVk6vyBQEhrWX8oZUv?=
 =?us-ascii?Q?RhHbYo11QWo5/E6nn7OlPKiSeA4nAJpS5gEtMh2E7lT7DMjdx3ltfSQTw+wV?=
 =?us-ascii?Q?HhKl0uggzNeLR7CMGyFV5kYbS5q7q3ue5qY1974FHGHpvnGEACRLsi0Qqwsi?=
 =?us-ascii?Q?/RS688ktYNOCPHx6Gw2xPG/4JMt3XYIeZSiv1tEPZUde2XlIpwVS04Q9yFdI?=
 =?us-ascii?Q?CyKQOFR8VU4EVUt+ncJv25y4weVrxN4ko2wvKetQcvz0oI35dUDStAyP0k84?=
 =?us-ascii?Q?IjOH238HUho9XVRYEP01d3KY4bpc1UY+f/xeBq6fn2P+G3gRZCPeanpG9FtU?=
 =?us-ascii?Q?cdi6a5pDF1G4EReBiEcqGi+NwTy0rVLpocmKOJZ747rLA/qk0JsZSexMBOHU?=
 =?us-ascii?Q?vRRflLDYwBjHAmearWU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bcb3db2-844e-4285-8dc4-08dcb55e541c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 14:53:12.1969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m9LdonpT3IglWaqj0N5INZy37eoq91MK5wJ6xW9Q72nEkInG5ZXsmZeUJCY6IOBX7M7gxZaMX0/NrJxD8aKtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4425
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

[Public]

> -----Original Message-----
> From: Kevin Holm <kevin@holm.dev>
> Sent: Tuesday, July 30, 2024 2:54 PM
> To: stable@vger.kernel.org
> Cc: regressions@lists.linux.dev; amd-gfx@lists.freedesktop.org; ML dri-de=
vel
> <dri-devel@lists.freedesktop.org>; LKML <linux-kernel@vger.kernel.org>; L=
in,
> Wayne <Wayne.Lin@amd.com>; Zuo, Jerry <Jerry.Zuo@amd.com>;
> Mohamed, Zaeem <Zaeem.Mohamed@amd.com>; Wheeler, Daniel
> <Daniel.Wheeler@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Kevin Holm <kevin@holm.dev>
> Subject: [PATCH 6.10] drm/amd/display: Refactor function
> dm_dp_mst_is_port_support_mode()
>
> From: Wayne Lin <wayne.lin@amd.com>
>
> [ Upstream commit fa57924c76d995e87ca3533ec60d1d5e55769a27 ]
>
> [Why]
> dm_dp_mst_is_port_support_mode() is a bit not following the original desi=
gn
> rule and cause light up issue with multiple 4k monitors after mst dsc hub=
.
>
> [How]
> Refactor function dm_dp_mst_is_port_support_mode() a bit to solve the lig=
ht
> up issue.
>
> Reviewed-by: Jerry Zuo <jerry.zuo@amd.com>
> Acked-by: Zaeem Mohamed <zaeem.mohamed@amd.com>
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Tested-by: Daniel Wheeler <daniel.wheeler@amd.com>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> [kevin@holm.dev: Resolved merge conflict in .../amdgpu_dm_mst_types.c]
> Fixes: 4df96ba6676034 ("drm/amd/display: Add timing pixel encoding for
> mst mode validation")
> Link:
> https://lore.kernel.org/stable/d74a7768e957e6ce88c27a5bece0c64dff132e
> 24@holm.dev/T/#u
> Signed-off-by: Kevin Holm <kevin@holm.dev>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> I resolved the merge conflict so that, after this patch is applied to the=
 linux-
> 6.10.y branch of the stable git repository, the resulting function
> dm_dp_mst_is_port_support_mode (and also the new function
> dp_get_link_current_set_bw) is identical to the original commit.
>
> I've confirmed that it fixes the regression I reported for my use case.
> ---
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 232 +++++++++++-----
> --
>  1 file changed, 147 insertions(+), 85 deletions(-)
>
> diff --git
> a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index a5e1a93ddaea..e90f9d697511 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1595,109 +1595,171 @@ static bool
> is_dsc_common_config_possible(struct dc_stream_state *stream,
>       return bw_range->max_target_bpp_x16 && bw_range-
> >min_target_bpp_x16;  }
>
> +#if defined(CONFIG_DRM_AMD_DC_FP)
> +static bool dp_get_link_current_set_bw(struct drm_dp_aux *aux, uint32_t
> +*cur_link_bw) {
> +     uint32_t total_data_bw_efficiency_x10000 =3D 0;
> +     uint32_t link_rate_per_lane_kbps =3D 0;
> +     enum dc_link_rate link_rate;
> +     union lane_count_set lane_count;
> +     u8 dp_link_encoding;
> +     u8 link_bw_set =3D 0;
> +
> +     *cur_link_bw =3D 0;
> +
> +     if (drm_dp_dpcd_read(aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
> &dp_link_encoding, 1) !=3D 1 ||
> +             drm_dp_dpcd_read(aux, DP_LANE_COUNT_SET,
> &lane_count.raw, 1) !=3D 1 ||
> +             drm_dp_dpcd_read(aux, DP_LINK_BW_SET, &link_bw_set, 1)
> !=3D 1)
> +             return false;
> +
> +     switch (dp_link_encoding) {
> +     case DP_8b_10b_ENCODING:
> +             link_rate =3D link_bw_set;
> +             link_rate_per_lane_kbps =3D link_rate *
> LINK_RATE_REF_FREQ_IN_KHZ * BITS_PER_DP_BYTE;
> +             total_data_bw_efficiency_x10000 =3D
> DATA_EFFICIENCY_8b_10b_x10000;
> +             total_data_bw_efficiency_x10000 /=3D 100;
> +             total_data_bw_efficiency_x10000 *=3D
> DATA_EFFICIENCY_8b_10b_FEC_EFFICIENCY_x100;
> +             break;
> +     case DP_128b_132b_ENCODING:
> +             switch (link_bw_set) {
> +             case DP_LINK_BW_10:
> +                     link_rate =3D LINK_RATE_UHBR10;
> +                     break;
> +             case DP_LINK_BW_13_5:
> +                     link_rate =3D LINK_RATE_UHBR13_5;
> +                     break;
> +             case DP_LINK_BW_20:
> +                     link_rate =3D LINK_RATE_UHBR20;
> +                     break;
> +             default:
> +                     return false;
> +             }
> +
> +             link_rate_per_lane_kbps =3D link_rate * 10000;
> +             total_data_bw_efficiency_x10000 =3D
> DATA_EFFICIENCY_128b_132b_x10000;
> +             break;
> +     default:
> +             return false;
> +     }
> +
> +     *cur_link_bw =3D link_rate_per_lane_kbps *
> lane_count.bits.LANE_COUNT_SET / 10000 *
> total_data_bw_efficiency_x10000;
> +     return true;
> +}
> +#endif
> +
>  enum dc_status dm_dp_mst_is_port_support_mode(
>       struct amdgpu_dm_connector *aconnector,
>       struct dc_stream_state *stream)
>  {
> -     int pbn, branch_max_throughput_mps =3D 0;
> +#if defined(CONFIG_DRM_AMD_DC_FP)
> +     int branch_max_throughput_mps =3D 0;
>       struct dc_link_settings cur_link_settings;
> -     unsigned int end_to_end_bw_in_kbps =3D 0;
> -     unsigned int upper_link_bw_in_kbps =3D 0, down_link_bw_in_kbps =3D =
0;
> +     uint32_t end_to_end_bw_in_kbps =3D 0;
> +     uint32_t root_link_bw_in_kbps =3D 0;
> +     uint32_t virtual_channel_bw_in_kbps =3D 0;
>       struct dc_dsc_bw_range bw_range =3D {0};
>       struct dc_dsc_config_options dsc_options =3D {0};
> +     uint32_t stream_kbps;
>
> -     /*
> -      * Consider the case with the depth of the mst topology tree is equ=
al
> or less than 2
> -      * A. When dsc bitstream can be transmitted along the entire path
> -      *    1. dsc is possible between source and branch/leaf device (com=
mon
> dsc params is possible), AND
> -      *    2. dsc passthrough supported at MST branch, or
> -      *    3. dsc decoding supported at leaf MST device
> -      *    Use maximum dsc compression as bw constraint
> -      * B. When dsc bitstream cannot be transmitted along the entire pat=
h
> -      *    Use native bw as bw constraint
> +     /* DSC unnecessary case
> +      * Check if timing could be supported within end-to-end BW
>        */
> -     if (is_dsc_common_config_possible(stream, &bw_range) &&
> -        (aconnector->mst_output_port->passthrough_aux ||
> -         aconnector->dsc_aux =3D=3D &aconnector->mst_output_port->aux)) =
{
> -             cur_link_settings =3D stream->link->verified_link_cap;
> -             upper_link_bw_in_kbps =3D
> dc_link_bandwidth_kbps(aconnector->dc_link, &cur_link_settings);
> -             down_link_bw_in_kbps =3D kbps_from_pbn(aconnector-
> >mst_output_port->full_pbn);
> -
> -             /* pick the end to end bw bottleneck */
> -             end_to_end_bw_in_kbps =3D min(upper_link_bw_in_kbps,
> down_link_bw_in_kbps);
> -
> -             if (end_to_end_bw_in_kbps < bw_range.min_kbps) {
> -                     DRM_DEBUG_DRIVER("maximum dsc compression
> cannot fit into end-to-end bandwidth\n");
> +     stream_kbps =3D
> +             dc_bandwidth_in_kbps_from_timing(&stream->timing,
> +                     dc_link_get_highest_encoding_format(stream->link));
> +     cur_link_settings =3D stream->link->verified_link_cap;
> +     root_link_bw_in_kbps =3D dc_link_bandwidth_kbps(aconnector-
> >dc_link, &cur_link_settings);
> +     virtual_channel_bw_in_kbps =3D
> +kbps_from_pbn(aconnector->mst_output_port->full_pbn);
> +
> +     /* pick the end to end bw bottleneck */
> +     end_to_end_bw_in_kbps =3D min(root_link_bw_in_kbps,
> +virtual_channel_bw_in_kbps);
> +
> +     if (stream_kbps <=3D end_to_end_bw_in_kbps) {
> +             DRM_DEBUG_DRIVER("No DSC needed. End-to-end bw
> sufficient.");
> +             return DC_OK;
> +     }
> +
> +     /*DSC necessary case*/
> +     if (!aconnector->dsc_aux)
> +             return DC_FAIL_BANDWIDTH_VALIDATE;
> +
> +     if (is_dsc_common_config_possible(stream, &bw_range)) {
> +
> +             /*capable of dsc passthough. dsc bitstream along the entire
> path*/
> +             if (aconnector->mst_output_port->passthrough_aux) {
> +                     if (bw_range.min_kbps > end_to_end_bw_in_kbps) {
> +                             DRM_DEBUG_DRIVER("DSC passthrough.
> Max dsc compression can't fit
> +into end-to-end bw\n");
>                       return DC_FAIL_BANDWIDTH_VALIDATE;
> -             }
> +                     }
> +             } else {
> +                     /*dsc bitstream decoded at the dp last link*/
> +                     struct drm_dp_mst_port *immediate_upstream_port
> =3D NULL;
> +                     uint32_t end_link_bw =3D 0;
> +
> +                     /*Get last DP link BW capability*/
> +                     if (dp_get_link_current_set_bw(&aconnector-
> >mst_output_port->aux, &end_link_bw)) {
> +                             if (stream_kbps > end_link_bw) {
> +                                     DRM_DEBUG_DRIVER("DSC decode at
> last link. Mode required bw can't fit into available bw\n");
> +                                     return
> DC_FAIL_BANDWIDTH_VALIDATE;
> +                             }
> +                     }
>
> -             if (end_to_end_bw_in_kbps < bw_range.stream_kbps) {
> -                     dc_dsc_get_default_config_option(stream->link->dc,
> &dsc_options);
> -                     dsc_options.max_target_bpp_limit_override_x16 =3D
> aconnector->base.display_info.max_dsc_bpp * 16;
> -                     if (dc_dsc_compute_config(stream->sink->ctx->dc-
> >res_pool->dscs[0],
> -                                     &stream->sink-
> >dsc_caps.dsc_dec_caps,
> -                                     &dsc_options,
> -                                     end_to_end_bw_in_kbps,
> -                                     &stream->timing,
> -
>       dc_link_get_highest_encoding_format(stream->link),
> -                                     &stream->timing.dsc_cfg)) {
> -                             stream->timing.flags.DSC =3D 1;
> -                             DRM_DEBUG_DRIVER("end-to-end
> bandwidth require dsc and dsc config found\n");
> -                     } else {
> -                             DRM_DEBUG_DRIVER("end-to-end
> bandwidth require dsc but dsc config not found\n");
> -                             return DC_FAIL_BANDWIDTH_VALIDATE;
> +                     /*Get virtual channel bandwidth between source and
> the link before the last link*/
> +                     if (aconnector->mst_output_port->parent-
> >port_parent)
> +                             immediate_upstream_port =3D
> +aconnector->mst_output_port->parent->port_parent;
> +
> +                     if (immediate_upstream_port) {
> +                             virtual_channel_bw_in_kbps =3D
> kbps_from_pbn(immediate_upstream_port->full_pbn);
> +                             virtual_channel_bw_in_kbps =3D
> min(root_link_bw_in_kbps, virtual_channel_bw_in_kbps);
> +                             if (bw_range.min_kbps >
> virtual_channel_bw_in_kbps) {
> +                                     DRM_DEBUG_DRIVER("DSC decode at
> last link. Max dsc compression can't fit into MST available bw\n");
> +                                     return
> DC_FAIL_BANDWIDTH_VALIDATE;
> +                             }
>                       }
>               }
> -     } else {
> -             /* Check if mode could be supported within max slot
> -              * number of current mst link and full_pbn of mst links.
> -              */
> -             int pbn_div, slot_num, max_slot_num;
> -             enum dc_link_encoding_format link_encoding;
> -             uint32_t stream_kbps =3D
> -                     dc_bandwidth_in_kbps_from_timing(&stream-
> >timing,
> -
>       dc_link_get_highest_encoding_format(stream->link));
> -
> -             pbn =3D kbps_to_peak_pbn(stream_kbps);
> -             pbn_div =3D dm_mst_get_pbn_divider(stream->link);
> -             slot_num =3D DIV_ROUND_UP(pbn, pbn_div);
> -
> -             link_encoding =3D
> dc_link_get_highest_encoding_format(stream->link);
> -             if (link_encoding =3D=3D DC_LINK_ENCODING_DP_8b_10b)
> -                     max_slot_num =3D 63;
> -             else if (link_encoding =3D=3D
> DC_LINK_ENCODING_DP_128b_132b)
> -                     max_slot_num =3D 64;
> -             else {
> -                     DRM_DEBUG_DRIVER("Invalid link encoding
> format\n");
> -                     return DC_FAIL_BANDWIDTH_VALIDATE;
> -             }
>
> -             if (slot_num > max_slot_num ||
> -                     pbn > aconnector->mst_output_port->full_pbn) {
> -                     DRM_DEBUG_DRIVER("Mode can not be supported
> within mst links!");
> +             /*Confirm if we can obtain dsc config*/
> +             dc_dsc_get_default_config_option(stream->link->dc,
> &dsc_options);
> +             dsc_options.max_target_bpp_limit_override_x16 =3D
> aconnector->base.display_info.max_dsc_bpp * 16;
> +             if (dc_dsc_compute_config(stream->sink->ctx->dc->res_pool-
> >dscs[0],
> +                             &stream->sink->dsc_caps.dsc_dec_caps,
> +                             &dsc_options,
> +                             end_to_end_bw_in_kbps,
> +                             &stream->timing,
> +
>       dc_link_get_highest_encoding_format(stream->link),
> +                             &stream->timing.dsc_cfg)) {
> +                     stream->timing.flags.DSC =3D 1;
> +                     DRM_DEBUG_DRIVER("Require dsc and dsc config
> found\n");
> +             } else {
> +                     DRM_DEBUG_DRIVER("Require dsc but can't find
> appropriate dsc
> +config\n");
>                       return DC_FAIL_BANDWIDTH_VALIDATE;
>               }
> -     }
>
> -     /* check is mst dsc output bandwidth
> branch_overall_throughput_0_mps */
> -     switch (stream->timing.pixel_encoding) {
> -     case PIXEL_ENCODING_RGB:
> -     case PIXEL_ENCODING_YCBCR444:
> -             branch_max_throughput_mps =3D
> -                     aconnector->dc_sink-
> >dsc_caps.dsc_dec_caps.branch_overall_throughput_0_mps;
> -             break;
> -     case PIXEL_ENCODING_YCBCR422:
> -     case PIXEL_ENCODING_YCBCR420:
> -             branch_max_throughput_mps =3D
> -                     aconnector->dc_sink-
> >dsc_caps.dsc_dec_caps.branch_overall_throughput_1_mps;
> -             break;
> -     default:
> -             break;
> -     }
> +             /* check is mst dsc output bandwidth
> branch_overall_throughput_0_mps */
> +             switch (stream->timing.pixel_encoding) {
> +             case PIXEL_ENCODING_RGB:
> +             case PIXEL_ENCODING_YCBCR444:
> +                     branch_max_throughput_mps =3D
> +                             aconnector->dc_sink-
> >dsc_caps.dsc_dec_caps.branch_overall_throughput_0_mps;
> +                     break;
> +             case PIXEL_ENCODING_YCBCR422:
> +             case PIXEL_ENCODING_YCBCR420:
> +                     branch_max_throughput_mps =3D
> +                             aconnector->dc_sink-
> >dsc_caps.dsc_dec_caps.branch_overall_throughput_1_mps;
> +                     break;
> +             default:
> +                     break;
> +             }
>
> -     if (branch_max_throughput_mps !=3D 0 &&
> -             ((stream->timing.pix_clk_100hz / 10) >
> branch_max_throughput_mps * 1000))
> +             if (branch_max_throughput_mps !=3D 0 &&
> +                     ((stream->timing.pix_clk_100hz / 10) >
> branch_max_throughput_mps * 1000)) {
> +                     DRM_DEBUG_DRIVER("DSC is required but max
> throughput mps fails");
>               return DC_FAIL_BANDWIDTH_VALIDATE;
> -
> +             }
> +     } else {
> +             DRM_DEBUG_DRIVER("DSC is required but can't find common
> dsc config.");
> +             return DC_FAIL_BANDWIDTH_VALIDATE;
> +     }
> +#endif
>       return DC_OK;
>  }
> --
> 2.45.2

