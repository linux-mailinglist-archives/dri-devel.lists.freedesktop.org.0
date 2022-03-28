Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC54E993F
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0D310EC57;
	Mon, 28 Mar 2022 14:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708EF10E6ED;
 Mon, 28 Mar 2022 14:20:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+i1dBFjXJFM8lDNr0vEb6/FJvXswEErEFtnQ8wJ5yUzh+5Vrrk7FkfhOoDYpDX/IyovC1dH+jlJ7cM6f6dV4aczbc5qqOATfwd2V/ACCarghukfA/Om09IQ1HNo2YPrz7IHhmKqxpZZZd4HOWcwNxEjravIMODDhEG+oHHnPp4mWAT5cmZKjuLvXJnmh+RkDBTCIE3tstp5QpDgHmtgkNk7pkHpA4gVYfzQmhGTK8ctmhPvjPZQ6EOeBdWCKQUc4Gf5a2rjR+1FQxpduXUC7g0pu1RVk9hD4r2LRRtzWCD4je91YRTN1VA8WsR27pzVfnNvVUten+njLsk0XEvDfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6jsYSYVrJAfnAMAIuPRqOxJted8p1nH/CZx0i90tifA=;
 b=FCswR3eoVzBg1ap333q4zloTi1epOz4vT8/auYqed8gKx/ucYLGOfWsce48o4hGTJt8Ll46f6Ga65vWgr+5tgEGMtqNYcba/IwM5xPWzO6zpOcZPTqiXwvveA2iTK5f4jDRgYMfx3OjhD/30VBtD/ksvsHsgi7PKB2nayco21YQlrBjcHDFH2A5zb8XvGi4IoRlic7YXfHz6gIz/KZlTwGQk7ahH3Q1C7hHXXTf20lwJpZ/rnXfRROalY81/LcW/m5JPCSiKRMAH14i39NdcHRsT4tR7RnHhQ5ioxeLU+V6dgn6OYCKu7EonYcHUPs26IqpUC3kiTiVjqzyOBmKAzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6jsYSYVrJAfnAMAIuPRqOxJted8p1nH/CZx0i90tifA=;
 b=sEfxMSD3xMdtXmQ2TJfYowHr53G6g5GpMjKhNVZUnCAsmv25CvGV8DAl/4ivT2MvBuitSqcaxgLbRJyahf0v+C4Imrz8SJ4kTIHcgFVVtQYbTgTCfzzxCsctIgORMNGorGGSsYS25zjKw7Ji17zmf1ABHj0gO5Tjm9T0ucC43oo=
Received: from DM4PR12MB5182.namprd12.prod.outlook.com (2603:10b6:5:395::24)
 by MWHPR12MB1613.namprd12.prod.outlook.com (2603:10b6:301:11::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Mon, 28 Mar
 2022 14:20:25 +0000
Received: from DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::4572:27ba:9026:eadf]) by DM4PR12MB5182.namprd12.prod.outlook.com
 ([fe80::4572:27ba:9026:eadf%7]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 14:20:24 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: Melissa Wen <mwen@igalia.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Gutierrez, Agustin" <Agustin.Gutierrez@amd.com>, 
 "Liu, Zhan" <Zhan.Liu@amd.com>
Subject: RE: [RFC PATCH] drm/amd/display: dont ignore alpha property
Thread-Topic: [RFC PATCH] drm/amd/display: dont ignore alpha property
Thread-Index: AQHYQIk8rqNSBLJR80K+rhKrZP/4D6zU21nA
Date: Mon, 28 Mar 2022 14:20:24 +0000
Message-ID: <DM4PR12MB5182CCC2B6476A1FC88E725FEC1D9@DM4PR12MB5182.namprd12.prod.outlook.com>
References: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
In-Reply-To: <20220325204450.kq7kjb7ez63p5srm@mail.igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=aecbcfc4-56e6-45d2-a4ec-bdae653ca915;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-03-28T14:15:00Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30c0bfda-edda-4d76-fa17-08da10c619d7
x-ms-traffictypediagnostic: MWHPR12MB1613:EE_
x-microsoft-antispam-prvs: <MWHPR12MB161340C45ECB2101B0B0CDB7EC1D9@MWHPR12MB1613.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JWBQ0MEMeHeMCkcLwlMS6/xsXA90cd262Wvw7vHuhthuJi+UpERS251qccsOcGgV2ShE7kP2Tr9gQPfHLKMKp/7Dp7rPCj5vEqwIU/DggsrFMl2NDwPgboootQaZKlf3PG4+AvqngAq1PQHXR/oNscT9RHhCD92wx1FVLru+zU88E9/pcEtaMqO+elPja0yjx2wqJRi22isiACu5das/d8i75be+naaPo8VEJEwg2lUW7KFp3CFSNfM1Azfyosi4/JO4nLzR5Gv24k1bVb3e2+4+n5hXpNsb/3xz4fVx1M82efOkqZWKUPMbQrdGI0ok7pJjJMkwOnD+N5T2Xn4n3JWJ1I4U9W9wlDhodBIOoJAM6qx2g7YcNCaZFdz8mbj9nRJuCGlfBWH/YcUG9z1dT2dUb8R8/jfTUL9pnJGvgq7vKEIU6fLEhTkOQWaKragKnzXsXbAArhefaIkhAsRWRfwH0BzKcQnzGgNHTd9nK6Mx9Szj3G0z2u+0DIJTJsx2u/QMCIjSEIm9gxI0nQ8Za+8QNBsQ9JSfbKJhd3wD0qn0c6jKEwS8PlGlfEeUVBxqHSLVne+7SGCsWJ7XZe8s2mkwkYtcih3kdBSRXkYRF3ksbCuNwt1Hsh0OUSTJ9+wy28tpnNGIEd9X7hzXT9nifu0oxOihxOXItRs5CVkpHNeHofVnOXqu7xwsNWcAvYCPc/4TOxmGAsC/5Dgo4USqQQmtO/h13zoA4pUD6m/lbvMMVXYSru4vMikm6Y4nEnBM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5182.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(52536014)(54906003)(55016003)(33656002)(6636002)(5660300002)(83380400001)(8936002)(508600001)(38100700002)(38070700005)(66446008)(8676002)(66556008)(66476007)(64756008)(76116006)(4326008)(966005)(66946007)(86362001)(316002)(921005)(122000001)(71200400001)(9686003)(53546011)(2906002)(6506007)(7696005)(186003)(26005)(192303002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KinH3puNMBLPu+tPKPJ0UzWT4G1NVJo4JDz6AobVl5reySvWpJh062tULQhm?=
 =?us-ascii?Q?+T/KBcX8G1rzeTGLEPdOGSb1hWDQIxXCmw5YI6AW8VPEj/4NyD5HJweMr+U3?=
 =?us-ascii?Q?6cunXh0GAqCWSct/x1x7ZApw0hJn65yxJbLaccK6ugquFPZ1Ksffb594l9Ld?=
 =?us-ascii?Q?uMFabjLLLDLFo+mI0Ve5WVvWv4UyU4ET/zqJcWcAziWDW2xOBaacKywlrL2Y?=
 =?us-ascii?Q?/cxJU5U0B6e09KTqNJtA26pT+uHAxcd9S7iNLIlnnLEoKyXGthmWwQuiBQQe?=
 =?us-ascii?Q?GP2XxP/E3vUYJwlb1MYR1J/Yp2D76HCj6/NH6Adz0iB2EaMduPJO/bWiqmuD?=
 =?us-ascii?Q?LJXCEYy7CPNi2smU0gZWPoBzAQcvO/ubG5mZmAtdsrzENWpVOs4GUS+33pGj?=
 =?us-ascii?Q?yKkQlZErVYe8LQS1c5hzyopIDrk49Nq2bfC5ikNbHCEyXHrxAjRdk86Mtx9U?=
 =?us-ascii?Q?5zGNeGhLQMLhkAHNnh4A9GmEEX8AQ0LaNp02Fz+MzMwXczkq65jI5Jlr1BFk?=
 =?us-ascii?Q?Hx5yJ2MFBo6FiknPPHmpmyjUpFQlyigIWwPh5G57ri2ys2dGMfmHz0tLbIpW?=
 =?us-ascii?Q?9gM7MEbyL9cCwV2ajY/o7E027w+4MTfilzK8nmEla+7x4tfx3y8ONFRe4aVw?=
 =?us-ascii?Q?pUwpUmkLIy1xgTFamiLHlWQz5boFhN2X6v7LZZI1qKNWmbKs/bmwHwk9PRBb?=
 =?us-ascii?Q?YpvmOODxOV7xUIXzRO2GGjjm9q8CD/hml5MqupMFHCCY5ujUdCNQ30ve3uk2?=
 =?us-ascii?Q?lJVtHPGY0lcsnmGYNs1ynz6P4PrmJEOSI+kopLH//sYTkXE3T3HOIHp8Mjxn?=
 =?us-ascii?Q?DLT8nvwUDJ9h0kGB6FckXJXmzm4UbQ3Hdvb9jlvUqO+RBvwQS1sgHUz5alaE?=
 =?us-ascii?Q?t5kkF7DAGc/9ualLAbxi2CQa2jRzzw1DWLCRfNM554uOeQLuygjoMRPKB0DB?=
 =?us-ascii?Q?Do3AXirZLFwZ/MrfoAkAZ/PAQkx4zkL1ojt0cbK58JiBARt5z8CZ2vq+Yzel?=
 =?us-ascii?Q?nP/6OXQYJPJ+cMZH2nlEemvXMQ1X9bSNTyoQpFFX7Fm9HWTx0f8B6OTc5ucj?=
 =?us-ascii?Q?4MMJfevOnp0BfXGHMS2GArFpxM8aHueQfrrCdsxbmK7zwNkFcH6YPGlkRewo?=
 =?us-ascii?Q?7qDaBcWo4QssZ1ZHjLHxxQHZ0M22yIDhCUCW+8ZUBp8vg0oTtFCU82R7P8no?=
 =?us-ascii?Q?hEpQMPhof1mUDYo6OqmivYmzzqUdG0L15U39kPINaj494spQ1BkoBKEU4bLG?=
 =?us-ascii?Q?erWogVEJx7FhaIBKv5QRzn5Hkh+HEHDPZ6cGFa0ZC/Gv6XUgmxYSu9CUQncO?=
 =?us-ascii?Q?iDGQtfuO9crIHyMSZIZnS5/ySVE/eHV0+XWwJNrnohiAoe+h6PaTokmdOUsh?=
 =?us-ascii?Q?WaKt69/nWou8+plYIgGhhPg6tZiAcYtY0y7+i9Cl2z4WoO0G4TXK3YO8Dwv+?=
 =?us-ascii?Q?UtdNeY6w2XPDSZTQZXfHHTHQoCwsSyNaNMIvW1WgcDq2iMZiKRUs0AaFPejH?=
 =?us-ascii?Q?mk/dK4x+sCqlUQH90aWQ77YL6ex2wcjGfG1h0Ih3xCx0oSv9uDDPXjySbip/?=
 =?us-ascii?Q?YHWe1dbWpVOWwkjYOxuTaoWDTgwWGXlqkkt86UeDkVW9OUHo2s1gyI/DhKyT?=
 =?us-ascii?Q?LhVQ+CbFjKhesB+FYp7rJ1Bjn8JYa41sSNDFbqD/B6pTOtHTreJFQ9EpqMg7?=
 =?us-ascii?Q?F/dKI+f+lipKuD8tYikwxbqlyNma3FB/4qwSk6vwD5c4nQomcLZ95O/rf1XO?=
 =?us-ascii?Q?8igrH46i5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5182.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c0bfda-edda-4d76-fa17-08da10c619d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 14:20:24.9031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DVUhBm5H3hFH4jtJE0BN2yZoK4cUgvI9ntOenT4o2VpelX5gX/ezLzeLPfTsbo1A1VZfhZpKG8Jf5g7JNRPJMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1613
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

> -----Original Message-----
> From: Melissa Wen <mwen@igalia.com>
> Sent: Friday, March 25, 2022 4:45 PM
> To: amd-gfx@lists.freedesktop.org; Wentland, Harry
> <Harry.Wentland@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Siqueira, Rodrigo
> <Rodrigo.Siqueira@amd.com>; Kazlauskas, Nicholas
> <Nicholas.Kazlauskas@amd.com>; Gutierrez, Agustin
> <Agustin.Gutierrez@amd.com>; Liu, Zhan <Zhan.Liu@amd.com>
> Cc: dri-devel@lists.freedesktop.org; Simon Ser <contact@emersion.fr>
> Subject: [RFC PATCH] drm/amd/display: dont ignore alpha property
> Importance: High
>
> Hi all,
>
> I'm examining the IGT kms_plane_alpha_blend test, specifically the
> alpha-7efc. It fails on AMD and Intel gen8 hw, but passes on Intel
> gen11. At first, I thought it was a rounding issue. In fact, it may be
> the problem for different results between intel hw generations.
>
> However, I changed the test locally to compare CRCs for all alpha values
> in the range before the test fails. Interestingly, it fails for all
> values when running on AMD, even when comparing planes with zero alpha
> (fully transparent). Moreover, I see the same CRC values regardless of
> the value set in the alpha property.
>
> To ensure that the blending mode is as expected, I explicitly set the
> Pre-multiplied blending mode in the test. Then I tried using different
> framebuffer data and alpha values. I've tried obvious comparisons too,
> such as fully opaque and fully transparent.
>
> As far as I could verify and understand, the value set for the ALPHA
> property is totally ignored by AMD drivers. I'm not sure if this is a
> matter of how we interpret the meaning of the premultiplied blend mode
> or the driver's assumptions about the data in these blend modes.
> For example, I made a change in the test as here:
> https://paste.debian.net/1235620/
> That basically means same framebuffer, but different alpha values for
> each plane. And the result was succesful (but I expected it fails).
>

The intent was that we don't enable global plane alpha along with anything =
that requires per pixel alpha.

The HW does have bits to specify a mode that's intended to work like this, =
but I don't think we've ever fully supported it in software.

I wouldn't necessarily expect that the blending result is correct, but mayb=
e the IGT test result says otherwise.

> Besides that, I see that other subtests in kms_plane_alpha_blend are
> skipped, use "None" pixel blend mode, or are not changing the
> IGT_PLANE_ALPHA property. So, this alpha-7efc seems to be the only one
> in the subset that is checking changes on alpha property under a
> Pre-multiplied blend mode, and it is failing.
>
> I see some inputs in this issue:
> https://gitlab.freedesktop.org/drm/amd/-/issues/1769.
> But them, I guessed there are different interpretations for handling
> plane alpha in the pre-multiplied blend mode. Tbh, I'm not clear, but
> there's always a chance of different interpretations, and I don't have
> a third driver with CRC capabilities for further comparisons.
>
> I made some experiments on blnd_cfg values, changing alpha_mode vs
> global_gain and global_alpha. I think the expected behaviour for the
> Pre-multiplied blend mode is achieved by applying this RFC patch (for
> Cezanne).
>
> Does it seems reasonable? Can anyone help me with more inputs to guide
> me the right direction or point out what I misunderstood about these
> concepts?
>
> Thanks,
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6633df7682ce..821ffafa441e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5438,7 +5438,7 @@ fill_blending_from_plane_state(const struct
> drm_plane_state *plane_state,
>
>       if (plane_state->alpha < 0xffff) {
>               *global_alpha =3D true;
> -             *global_alpha_value =3D plane_state->alpha >> 8;
> +             *global_alpha_value =3D plane_state->alpha;

Isn't the original behavior here correct? The value into DC should only be =
an 8-bit value but we have 16-bit precision from the DRM property. This is =
truncating the bits that we don't support.

>       }
>  }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> index 4290eaf11a04..b4888f91a9d0 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_hwseq.c
> @@ -2367,6 +2367,10 @@ void dcn20_update_mpcc(struct dc *dc, struct
> pipe_ctx *pipe_ctx)
>                       =3D=3D SURFACE_PIXEL_FORMAT_GRPH_RGBE_ALPHA)
>               blnd_cfg.pre_multiplied_alpha =3D false;
>
> +     if (blnd_cfg.pre_multiplied_alpha) {
> +             blnd_cfg.alpha_mode =3D
> MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_GLOBAL_GAI
> N;
> +             blnd_cfg.global_gain =3D blnd_cfg.global_alpha;
> +     }

While I'm not sure we should be exposing/enabling per pixel alpha + combine=
d global gain, I think the correct logical ordering for this would be to mo=
dify the check higher up in the function.

If (per_pixel_alpha && pipe_ctx->plane_state->global_alpha)
    blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA_COMBINED_=
GLOBAL_GAIN;
else if (per_pixel_alpha)
    blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_PER_PIXEL_ALPHA;
else
    blnd_cfg.alpha_mode =3D MPCC_ALPHA_BLEND_MODE_GLOBAL_ALPHA;

This should maintain compatibility with scenarios that don't specify any al=
pha value on the plane.

Note that this logic would also need to be carried down into the dcn10_upda=
te_mpcc function as well.

Regards,
Nicholas Kazlauskas

>       /*
>        * TODO: remove hack
>        * Note: currently there is a bug in init_hw such that
> --
> 2.35.1

