Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA36E7D9D94
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 17:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7233D10EA04;
	Fri, 27 Oct 2023 15:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1065F10EA04;
 Fri, 27 Oct 2023 15:55:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Afi6bKmEpggpp0xIb89qpFQHjyQMrY7miZ97GACz/u+QsAhdEIMgyndbFGq9z7QDrP4kU95WsdWxAnpKHZEmBGgk/ie1jcJc9fX+ORC59oLo/4LQXOptpzSS/znMoMelpv7LT2vttpgEFpQQ8vXAB9eHSKpWTl1qc5MzeKBiowe3mh9e/rHaAwqnWXcGxfwnnmMCUsaGxOOWOp+FPW9INnWPwrWG9a8SN5soy5QGaB6/NItYsWIBY7yVbaBuC5oZbHTi0l0g9Mm/eSJj1ca6UyTkPisdOP6blPHUz2dPFgvCuS3Cm8LqXUlMaVTNmwI7Rq/d+WJuCpDKue1tlWyVmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+zqZKQdh89QCS1E6dUO4TE6GuqZBfDFIQ4HgfmnraU=;
 b=VcXAJXieGPO796Ks2OLKUxC3GyHwD0TnQVLCJ9mNymJFiGcNE4HVci0+Dgbp3ZeRO3tLIwSNtPBr+QlUal0cUaWplhTxDNWpSEiw4wXz5tmx+GjmhiKi/oEhSH8GfMw6WgYejBukTopBiqH0Bpo8wTrBkZlKhq1kWdkz4UoZRPxwT8TYHdnioooWHFrqJ6DRbCr8/rPYcYL9C1adoBHdiOcyBwV/07+bMglGMlwMm3ZL271HAFQBcD/vVCSjEnmuBdwTZrHSXnKMnJBm73r27uLARYCse7D9x2LCIVyBXWSUBlENjatPW3LcUddaz7Kr1xCCQlDsHHRX0pilDMTfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+zqZKQdh89QCS1E6dUO4TE6GuqZBfDFIQ4HgfmnraU=;
 b=BqxRtToHjkZWGvRXI4F1ppC56/eYlCwre1PJWHVFfw/gAzh90CbWkav7MzYxa+gdwAn0BrAM2TaEyiDNIFFEzxZpQCzgsj+eTJMV4wyH8vFsL4Yp/oqGuFWVoO0jolcbDtOUPhools3RzssKKj9xp3YjeELBTNTEdD1p/9VFLkU=
Received: from PH8PR12MB7279.namprd12.prod.outlook.com (2603:10b6:510:221::10)
 by IA0PR12MB8277.namprd12.prod.outlook.com (2603:10b6:208:3de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Fri, 27 Oct
 2023 15:55:49 +0000
Received: from PH8PR12MB7279.namprd12.prod.outlook.com
 ([fe80::4c4d:fe66:2403:1b86]) by PH8PR12MB7279.namprd12.prod.outlook.com
 ([fe80::4c4d:fe66:2403:1b86%4]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 15:55:48 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, Yuran Pereira
 <yuran.pereira@hotmail.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Thread-Topic: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in
 amdgpu_dm_setup_replay
Thread-Index: AQHaCFMIiCH2+6zK2kijRBI/zx7TwrBdyrMAgAAAOBI=
Date: Fri, 27 Oct 2023 15:55:48 +0000
Message-ID: <PH8PR12MB727953EE85D593EF25650454F9DCA@PH8PR12MB7279.namprd12.prod.outlook.com>
References: <DB3PR10MB683590457246A6625BAA6102E8DDA@DB3PR10MB6835.EURPRD10.PROD.OUTLOOK.COM>
 <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
In-Reply-To: <dc2242cd-6522-4073-b376-edc2a9abc3d9@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-27T15:55:47.097Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR12MB7279:EE_|IA0PR12MB8277:EE_
x-ms-office365-filtering-correlation-id: 48e17315-77c8-4b83-54af-08dbd705300b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wh5ES+VPgVPKtxnP7FZ8AUChBsuzUnim8VkJmr+8ROsus86xf6jQfYJWaiqMURPYSRLYMBF72jk98iu7y0dLY0+Mk3aGU0FUYThYhHC37DvNjSj1xoQcmfSm8rtBFhgmw5/XExMKMO/lOuU0ilbXb0rpom74rlof+ohnvqCCDye6ikuD1sEDvGlG2K3hh9axN+6+C2aVp58QOPeaRNqCWMLOFSWzK9i4cYvPxeKHr9nitDcNbU2aN4uFkuSZ5G7GYgT+vH4er5WRbtmruncP8lrlbHLEBjvcwZC1uoSMTL9ZPNY4OI7HHhwqKxGAEr075OfwyCQzfV4Q/9NOU4RGDF7l2LvgkczQvLXhaRMJvlKrsykiluaUGuWYEbR+q++LkqwiLPalAkjZ4VaGN4afpmRn18Of4yE1wZzcyC3NDzyZ4LGeongvGayFHWCOIkiVyMMk4WV6k6OwmEgJhy/RKxDeCCPVR7TQvdQstR0VPoHLObr7il5sgMRi4QQbLgRSB91xu1U/w3OVlKqdTP07bMV1zK/4FfFY8yYA4bQl6qlqUxgb9bJ5TgO2XM9v1zz0Q8oneuDfkO6q7Tm0J5+H0C2QLbgkDpFs/0whYNklAir6CjSFnZsoBaHCxKgdqjEh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7279.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(110136005)(52536014)(41300700001)(66446008)(8936002)(8676002)(54906003)(4326008)(91956017)(478600001)(2906002)(5660300002)(55016003)(19627405001)(38070700009)(316002)(66476007)(64756008)(66946007)(76116006)(66556008)(33656002)(86362001)(122000001)(7696005)(53546011)(26005)(9686003)(45080400002)(6506007)(38100700002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FoCX76HnMQ29RtK12vUClECtp1iL2vPIcYws7iPYjfw/jgLp3HKshGQl+r?=
 =?iso-8859-1?Q?n5GmGEFqWo90eg2C8XYhJGGfvtYqzhpOABEB4vSJUp9/abHyTBYKWEWxP6?=
 =?iso-8859-1?Q?Q5rW26kSP4D4fvM3DOFE7fTsJP9gPjO4YTrPXYvldw9r1sbF3CxqJGZpHe?=
 =?iso-8859-1?Q?xZp+1ARKxS8q8EmNC7qYW6iIKoUNo6I9BaqUlogxIQD2kv9VOfrHNFBDDr?=
 =?iso-8859-1?Q?PGrN4XIMUwKTmGhdPfOMfOgYzzBeVjW/N9TrjCdNIjJEdouVKNzBEixxMK?=
 =?iso-8859-1?Q?B8PAaDqxApohqo3wQPC/SLva69FYlMMbbvg8qOEVkVPuow6Lwz15dpIk2x?=
 =?iso-8859-1?Q?zBJDglPaXq6v912mq6WVrNXR9k3ZgumZcKZyg6bS4CImcfVddPZYfpQjLS?=
 =?iso-8859-1?Q?iJTSVCEk3gEaBAclEK+GcxMyUazqhdXB9m7f6q0VgFvo+5djBDtkN7WEkp?=
 =?iso-8859-1?Q?KdeE8AwEQmFFmTm/Eg2PK9MHYQbInjLoe8VSJwtf54t/ZHCem5oXSP/jwH?=
 =?iso-8859-1?Q?qGXHyF149dEy549WiqjQte+TZW8jnknW4B8fD8MNqdp8y1XIMYLJBen2Bh?=
 =?iso-8859-1?Q?KkJJu5LtRwLLnLwyYzc951Xh/TEmWK7VAAQp09Pet0+RUm/wQtMvtM292t?=
 =?iso-8859-1?Q?ksm2CzODoPcBNR1DWLYtikr/9fa55Oggsod1dW3NH5NQ5uGGKtq1JVjOMe?=
 =?iso-8859-1?Q?vQNhUi46halMyqqoMmHwC0mwU1bNFUtzzWSWaPfMw/k9k0FWHntNcniHXl?=
 =?iso-8859-1?Q?cNSmcCF//Ih83gG66qjwa7/7Avtqqocv+x5A2T2VbTZJzUcc4FQQNuet9+?=
 =?iso-8859-1?Q?LDN90lVIA5nIi+KCn1G00JKasrh/MCnsVQhdcI72z/NlA19Npl/emD4WkN?=
 =?iso-8859-1?Q?7zzXcPsWP/jkl8QIna1rsH9+c0UgTLmnCVZAk1aCChKyGHDn0nslvx1/ql?=
 =?iso-8859-1?Q?39YxY1L0OviVm4cCrQ87gZ1MZWSKdCQZQLM6lgBCfB7qoKcykCt9NnPu18?=
 =?iso-8859-1?Q?rHWVxI8qVegedItbp4PE7qf9YogQrqnv3jeLrpsahBp2W5icYIOM/+v2oZ?=
 =?iso-8859-1?Q?0xTxLJcqIUJnnElLnW2BXt6IQCdbeUBm+oZ8foOxLT+Le68RUUAZzkZeyX?=
 =?iso-8859-1?Q?x9gT88MA2sy0aBH03vrTLl7dguT03MZFR882q8tU80/3Rp3MnvrewbeQsx?=
 =?iso-8859-1?Q?UyA3vi1rX9JeS3eo0TvS2wD0HhogOjBQml77qq8SlJ5wjvY15n34J0tIwu?=
 =?iso-8859-1?Q?iUc7Yj9cTrwTRZy/YInFGNgFYwrhoelOILeW9ZpL721C4OaV5wh5wNvw6W?=
 =?iso-8859-1?Q?/yOKDDatPTUC+MjSKwrC4hulKbvUib6cg7sT3Wc140OI3h62L7jsEYtxyC?=
 =?iso-8859-1?Q?iyQ6GkV+qUeRuupyBBRyvlM+cjr+gLIZhxdqwKTpVNhChDpHuoBdHjjr8w?=
 =?iso-8859-1?Q?3Y8oey5zKvm4jijHAxv9PM3g6/eW8ReVCi7WAugotE7HGpFPTOsfld7bxL?=
 =?iso-8859-1?Q?BjXAKj6tbkaiRYZbUkEchQUv2h8R7cCX+ixqKODjbd27uV45UlomT0ILO3?=
 =?iso-8859-1?Q?mPGepp0jVbOTuDBrvExGEZcVKBbXKCWTQH32czMeUTjSKtcCVzPfLxmHm9?=
 =?iso-8859-1?Q?rFtgjYt1FMTqA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH8PR12MB727953EE85D593EF25650454F9DCAPH8PR12MB7279namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7279.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e17315-77c8-4b83-54af-08dbd705300b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 15:55:48.3674 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gBFStNWOHFCK1XrRuBSURR305JoSPB4NVU6r31JOmsKYgsJvwlTOi2Sz6ioVtPlX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8277
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PH8PR12MB727953EE85D593EF25650454F9DCAPH8PR12MB7279namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]


There was a consensus to use memset instead of {0}. I remember making chang=
es related to that previously.

Bhawan

________________________________
From: Mahfooz, Hamza <Hamza.Mahfooz@amd.com>
Sent: October 27, 2023 11:53 AM
To: Yuran Pereira <yuran.pereira@hotmail.com>; airlied@gmail.com <airlied@g=
mail.com>
Cc: Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Lakha, Bhawanpreet <Bhawanpree=
t.Lakha@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Siqueira, Rodrigo <Rodr=
igo.Siqueira@amd.com>; linux-kernel@vger.kernel.org <linux-kernel@vger.kern=
el.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri=
-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Deucher, Al=
exander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@am=
d.com>; linux-kernel-mentees@lists.linuxfoundation.org <linux-kernel-mentee=
s@lists.linuxfoundation.org>
Subject: Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage in amdg=
pu_dm_setup_replay

On 10/26/23 17:25, Yuran Pereira wrote:
> Since `pr_config` is not initialized after its declaration, the
> following operations with `replay_enable_option` may be performed
> when `replay_enable_option` is holding junk values which could
> possibly lead to undefined behaviour
>
> ```
>      ...
>      pr_config.replay_enable_option |=3D pr_enable_option_static_screen;
>      ...
>
>      if (!pr_config.replay_timing_sync_supported)
>          pr_config.replay_enable_option &=3D ~pr_enable_option_general_ui=
;
>      ...
> ```
>
> This patch initializes `pr_config` after its declaration to ensure that
> it doesn't contain junk data, and prevent any undefined behaviour
>
> Addresses-Coverity-ID: 1544428 ("Uninitialized scalar variable")
> Fixes: dede1fea4460 ("drm/amd/display: Add Freesync Panel DM code")
> Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c b/d=
rivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> index 32d3086c4cb7..40526507f50b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c
> @@ -23,6 +23,7 @@
>    *
>    */
>
> +#include <linux/string.h>
>   #include "amdgpu_dm_replay.h"
>   #include "dc.h"
>   #include "dm_helpers.h"
> @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, struc=
t amdgpu_dm_connector *ac
>        struct replay_config pr_config;

I would prefer setting pr_config =3D {0};

>        union replay_debug_flags *debug_flags =3D NULL;
>
> +     memset(&pr_config, 0, sizeof(pr_config));
> +
>        // For eDP, if Replay is supported, return true to skip checks
>        if (link->replay_settings.config.replay_supported)
>                return true;
--
Hamza


--_000_PH8PR12MB727953EE85D593EF25650454F9DCAPH8PR12MB7279namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
There was a consensus to use memset instead of {0}. I remember making chang=
es related to that previously.
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
Bhawan<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof ContentPasted0">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b> Mahfooz, Hamza &=
lt;Hamza.Mahfooz@amd.com&gt;<br>
<b>Sent:</b> October 27, 2023 11:53 AM<br>
<b>To:</b> Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;; airlied@gmail.c=
om &lt;airlied@gmail.com&gt;<br>
<b>Cc:</b> Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Lakha, Bhawanpree=
t &lt;Bhawanpreet.Lakha@amd.com&gt;; Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;=
; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; linux-kernel@vger.ker=
nel.org &lt;linux-kernel@vger.kernel.org&gt;; amd-gfx@lists.freedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt=
;dri-devel@lists.freedesktop.org&gt;; Deucher, Alexander &lt;Alexander.Deuc=
her@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; linux-=
kernel-mentees@lists.linuxfoundation.org &lt;linux-kernel-mentees@lists.lin=
uxfoundation.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: Fixes uninitialized variable usage =
in amdgpu_dm_setup_replay</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">On 10/26/23 17:25, Yuran Pereira wr=
ote:<br>
&gt; Since `pr_config` is not initialized after its declaration, the<br>
&gt; following operations with `replay_enable_option` may be performed<br>
&gt; when `replay_enable_option` is holding junk values which could<br>
&gt; possibly lead to undefined behaviour<br>
&gt; <br>
&gt; ```<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_config.replay_enable_option |=3D pr_e=
nable_option_static_screen;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pr_config.replay_timing_sync_suppor=
ted)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_config.replay=
_enable_option &amp;=3D ~pr_enable_option_general_ui;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt; ```<br>
&gt; <br>
&gt; This patch initializes `pr_config` after its declaration to ensure tha=
t<br>
&gt; it doesn't contain junk data, and prevent any undefined behaviour<br>
&gt; <br>
&gt; Addresses-Coverity-ID: 1544428 (&quot;Uninitialized scalar variable&qu=
ot;)<br>
&gt; Fixes: dede1fea4460 (&quot;drm/amd/display: Add Freesync Panel DM code=
&quot;)<br>
&gt; Signed-off-by: Yuran Pereira &lt;yuran.pereira@hotmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c |=
 3 +++<br>
&gt;&nbsp;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
&gt; index 32d3086c4cb7..40526507f50b 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c<br>
&gt; @@ -23,6 +23,7 @@<br>
&gt;&nbsp;&nbsp;&nbsp; *<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; <br>
&gt; +#include &lt;linux/string.h&gt;<br>
&gt;&nbsp;&nbsp; #include &quot;amdgpu_dm_replay.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;dc.h&quot;<br>
&gt;&nbsp;&nbsp; #include &quot;dm_helpers.h&quot;<br>
&gt; @@ -74,6 +75,8 @@ bool amdgpu_dm_setup_replay(struct dc_link *link, st=
ruct amdgpu_dm_connector *ac<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct replay_config pr_conf=
ig;<br>
<br>
I would prefer setting pr_config =3D {0};</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; union replay_debug_flags *debug_flags =3D NULL;<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;pr_config, 0, sizeof(pr_config))=
;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // For eDP, if Replay is sup=
ported, return true to skip checks<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (link-&gt;replay_settings=
.config.replay_supported)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return true;<br>
-- <br>
Hamza<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH8PR12MB727953EE85D593EF25650454F9DCAPH8PR12MB7279namp_--
