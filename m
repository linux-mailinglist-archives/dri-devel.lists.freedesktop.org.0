Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C19425CC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 07:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29A10E1B8;
	Wed, 31 Jul 2024 05:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5YUDcF90";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4352F10E1A1;
 Wed, 31 Jul 2024 05:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQBt58lFqSzbcP42MItZxuGfk9bZ1DMweFQFPtK0ReYNdcGmP/Tdx55JE2/50bKXI2YqrkqbuUaTlY1Kg2AD/RCGiAckQDT2FhMlbFJX5QK1hknhzgzF6OxCiBcqTQ0Vatsw/eiDf8P5rID/LE203pUWs1Ed/yd4PP10YmYAx7vM7nyZLAHYMfsTAPboXeV8twO30sAzIfRycydK3B5HgW8XOROt8MwHfwXy64YUjW+oKqAAORPagN32wqgmTbhe4d2N1xSSYvoDZzInXD+buMppHo4iHzPy4I7dKERposmYC/+5I1gMCVUF/ly71GtlcwfE0HsV37pNmf+/Vv406Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKjDgjFKH1hMid4UxWLbwbkdc4Msu050/Ifxd4dwz/4=;
 b=kAI/woh1KPm31X8+3zvM4rH+ldKSQunWHXMEZzreW7D7N021q2FTu4IRQnyg2A3lLstzkCm00/dwL2mIlXKLXwjy2cRrzLGdBQL+8cEoEZkuUz/VViixB1bXL/htLAkBfj8eM82onz05bNktCnRnKuuUvZ4UgSbRpYmsW7if1dcpk2f4U5qYqR4C/y0kV8F5Mp5zGsw95foWffpjUFMjp8NmDO8FL/vCVld+qw1lUND1/e+/hzmm9TdG7Juw0eZlaH5vPWY7FTZlyEIho/3yj6/tSewsOW4c9TNLK5q9ojtPlof3fP16wfdYx1Jz8Jh3iU3184YaHiYQB6m3S956HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKjDgjFKH1hMid4UxWLbwbkdc4Msu050/Ifxd4dwz/4=;
 b=5YUDcF90wE81WrrqWvNLR+zsaU/jE9jceLzQGQX1159CeURtQROonyldPkjgthcxC9vtYun40rtviGaLqL+/sD+zZ4DmB3te6WYoZEeV2nwqjS05i9iT5gH1TQJsk939DM99mbzV/6eWrvHfYOLgaxKuGeb2tNEuv5pw1GMcA64=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by SJ2PR12MB9239.namprd12.prod.outlook.com (2603:10b6:a03:55e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 05:36:34 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 05:36:34 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Kevin Holm <kevin@holm.dev>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, ML dri-devel
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, "Zuo, 
 Jerry" <Jerry.Zuo@amd.com>, "Mohamed, Zaeem" <Zaeem.Mohamed@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Thread-Topic: [PATCH 6.10] drm/amd/display: Refactor function
 dm_dp_mst_is_port_support_mode()
Thread-Index: AQHa4rHRGT+ZPp8aBkCgop6L7FIvmbIQURAQ
Date: Wed, 31 Jul 2024 05:36:33 +0000
Message-ID: <CO6PR12MB5489996666D6EE16982E6E94FCB12@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240730185339.543359-1-kevin@holm.dev>
In-Reply-To: <20240730185339.543359-1-kevin@holm.dev>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=b65ee151-5750-4be6-a018-3c81eb5ec609;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-07-31T05:33:59Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|SJ2PR12MB9239:EE_
x-ms-office365-filtering-correlation-id: acbb470a-b1ad-4123-bd4c-08dcb122bd14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?BXwJoDCUDypQRLFVR5tADjgQ0lWjCeSM822oEarHsz1kPzf8UQyoRQN2Qlbd?=
 =?us-ascii?Q?kashgVkz+wsKDWGaw6MPWhnDe4rVRyd88X8KLOHW802+yKy6hCHUOt+a6a8h?=
 =?us-ascii?Q?SHbcWktJowmtzxnisyFXudNq/G21v+7uhHGrS7cW9v1XZFGocyuYWeEw/wII?=
 =?us-ascii?Q?i251urJz4UTgY1lFRW2RLdkAUeJQun/XxZ/Hi3dJpAX9S4/TKYsYJ0pjEA4C?=
 =?us-ascii?Q?A0x357YnBPCOIw5FZrDisGwGeZsh9Nin2Ir+W4yezbcVoWxd+u9pxiN8PL11?=
 =?us-ascii?Q?e18j9GAZpfSnYJpa0PmZ5SMlUgwgNb4o4mQMeSt1cxH2KaC2CUl3UMsp/c2t?=
 =?us-ascii?Q?Y2Ecw3/hB1iXaH4TRNRsi4zQP/jArg3pWuDomX9+G+GUTQXpADTXmVTaUAo4?=
 =?us-ascii?Q?HZYiIZlDPVTOAMqwESNVEo0hst24e5B0mBXKfo4TZHEwcAJ8mC0tUmzL8130?=
 =?us-ascii?Q?lKujC3Av74rfN9cYwA3rxh5jn52YJqdINsO7sl6q2jSEGaPb6uA9ObPKU16U?=
 =?us-ascii?Q?UmMTNjq9y1Vph/j9EX5opV1mukkKEhM2G5SHNx06rcvS7QhB3AmhPOAMt3H8?=
 =?us-ascii?Q?za9nsroNcAgoaAt1F9zJSntrC7kusmFtwzcH7eOKNVI6LMmVCwKDSlnLcYTh?=
 =?us-ascii?Q?bDB4JRmL79uIsPEn2VbTKQ4oEugGeDO9rYsMR+tzSVgTLONOT6Vtp/PBrxfE?=
 =?us-ascii?Q?8+bfl3WXK906cdxkT8kzh0HeBZf6HPsGLeQAaVlxsjEaXlPXShTWKLEvco1I?=
 =?us-ascii?Q?qwB5RpSO9Lvmsuy/dfBvYtDiT4lAclAB2GT3jyCx20Y7uPzgKJEyqaLTT/EX?=
 =?us-ascii?Q?Y4EkkXe39rkysKNn7utxO5jJ/fB4wXjWsOjhObAqE6tcP7ajE/UsacfiMK9y?=
 =?us-ascii?Q?5aW/vgAoDEsghcw17b6+zEN1Opi/abtTKP5h0jlBxn333BOMojM6oNj/ZYHs?=
 =?us-ascii?Q?TPYeakl/299shORNpIm/M/xxaxsYJQtm9+vbDlKuSgtuJ+jaVWNayTnYH49p?=
 =?us-ascii?Q?yHX0qR5k8wTkHyRCbLVczugq8FbiQe1odLkTmzsST43Pi3R5Mi3xbYDAxiUp?=
 =?us-ascii?Q?6ytwPVcsIyu7U14Yu05e+mvgBFH2s71OYE3ocFrWpAdZowUaRktN9hL2mgpW?=
 =?us-ascii?Q?5cdDE6q3H6RzqjLXPWwv8C2GZyuUWvmI+pDc5d7Qm6HEBb08iub4AAMpwSK+?=
 =?us-ascii?Q?p4RWxR1Xw6NnwsyZSjrpnpDJRe5kxUkaXhMdYT8k0Ce4RbxE2mun2FnNJ+dr?=
 =?us-ascii?Q?sVk37K48UkasgDxCeW2/rbztjavp4jX9L9ZcCPKUQDmfIIUctzmwbMrTHlU0?=
 =?us-ascii?Q?uAoyMw3zpm9co6MKud7qNIjK3FgzeWn0HU8/55mwyjHSDA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rqAe7NVSArdMvj/KzLIIKTEAY/k7b4aIVnDylGYZ3W4ucwUbByzPr/9MuFVY?=
 =?us-ascii?Q?vGKI1uryL9LBIBrGYfB3w+PjRPumysJWt09/AzIMQgs0Ha75eX3ixYHEpfMZ?=
 =?us-ascii?Q?kED5FnGNBWSR4m9pT00+LNAw2V4ClwVj6t+0+12ub9JmJ7gAzEJzRmRNdpuH?=
 =?us-ascii?Q?Ig8satK/tMcqT1VUmUOz1P+4YgBMaY3H8VE+SFFvVL6F8OqvJwhcdtSW+KgY?=
 =?us-ascii?Q?LOAZOf5rPf4OZCOwe5ojLT6zPswiCIigSqlnTJDM4f/GQRv33wYyxzVh/Jzv?=
 =?us-ascii?Q?ULCFLPqCBeHfVBQLHEpL7ItRUxv4J+cQ/iKlKp07nKVA8qIsq1lWhqk5l3JL?=
 =?us-ascii?Q?s0TWeKpZyc5YKIaCKB7TMaYBhfhNg6gS31SCxwp+AyJ517OLKY2CRKCOypRb?=
 =?us-ascii?Q?bJIKXTbfZunt1h5Itidj+YVyPgblxY8y1d0U1B+Cov5k3JdBrnajrMYqVFUX?=
 =?us-ascii?Q?TdpFoipaeGGu0j9PLRFVGo0z99BUzEY/+LqNyfwvd2/H3E+QuQcA1f34X5aj?=
 =?us-ascii?Q?2eZK/y2FdgM60fSHDnC4arGy8RlTAkCeYJMZnbeHOYFkALCQqPttwi4G+ReI?=
 =?us-ascii?Q?LJmuS1pkwu/5tUqPH+aD48Cda1mhLQcJOlNTv3JFoo/G04moZaCpmNLuhMct?=
 =?us-ascii?Q?TrslH9Ls6y3uZ4w+4kyHJU/r3NuV+UY0crfYb9atDJCXPhp8Jif5eAOQwKYk?=
 =?us-ascii?Q?LjpvvCvSjk4OotUq/WrnL4kOz6MSjZZCFG3YNkQrMrkgRKlIjEhAQzRBW1Kj?=
 =?us-ascii?Q?PKc0S0UyWj1CPY5jHJieDozs9ONNyhgadNqhx3kmxsurIa8j91oK6Zv85Ihz?=
 =?us-ascii?Q?JDRbtFM+uGnQkgMTHSxzDNlFJKH0fhMKynOPp14Dk6mXWu7G2An1LPwOo7tY?=
 =?us-ascii?Q?stv6HAgTQHniMbIjTDQthZ+/JNZd9/IR9pDuyqdnrVvZyF964LU+c5vRBnCG?=
 =?us-ascii?Q?RFbTMsszBRxItdJLG1RDps9gzGBz5Hs5j4eE9/yxlNAOO3ti3D07W4h1LW6x?=
 =?us-ascii?Q?DUDU8WxM46z71JAi33iIzZ9P/iYfLt9d7jzl1t9A39qIku03haddXbGL1+tO?=
 =?us-ascii?Q?DqHGT0anLTpZqq8b5gT/gMF1YoCsxTsACzY4lmwQaoO07atSRMdi8mMeODi1?=
 =?us-ascii?Q?+uIqdmw3J0agr89DrEA4VLvK0j4nPEAoCePbcVVqE+tU2CF9QGKRn6orMb/r?=
 =?us-ascii?Q?BBpE854XfTCsFuuYuuw6kv59zjuEyKWtB/6eaFYr0ge4E8V6a3IOVdPGJEDB?=
 =?us-ascii?Q?d5/u4fLiQn0q949Rv732OdsVv1RI7WpC30BdYzAPYO2x4zFwuBN5x4Fe1Fh0?=
 =?us-ascii?Q?UmE0CRcbRnc2KqlyhsYYLGQVyY0vH/gIFXw/U/rz2sPvMWKVmw2E0Q64Ws1s?=
 =?us-ascii?Q?MFxEZoOiy5rO6ATBDzZqItABVFhiasyjHvU3y0NYGfu1CVZ7RAyx4KegG84c?=
 =?us-ascii?Q?N6eM+XvIoopcuMTOmYARbCumwWk5s8HL7946HyWLPy5Jaqu2iQAoYlO8bxT9?=
 =?us-ascii?Q?yURPBnGutL8Uul2VXdqIdnTiaxRC1o3Zya3QE5UZtqgHrs78EvnVOS/p6x39?=
 =?us-ascii?Q?F++oRb6ysRZww4g3f/8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acbb470a-b1ad-4123-bd4c-08dcb122bd14
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 05:36:33.8803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdIK6duYUjFX6mnbWTelwqYgDFl6bQ7IVhEqkjDDLFjvsgDN99b7zapw3PvZEKLQRhZisE8/lDNATKhxzeG4MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9239
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

Thanks for the help Kevin! It looks good to me.

Regards,
Wayne Lin

> -----Original Message-----
> From: Kevin Holm <kevin@holm.dev>
> Sent: Wednesday, July 31, 2024 2:54 AM
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
> +             drm_dp_dpcd_read(aux, DP_LINK_BW_SET, &link_bw_set,
> 1) !=3D 1)
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

