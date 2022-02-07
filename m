Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 416914AB364
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 04:05:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E22F10E3AF;
	Mon,  7 Feb 2022 03:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FB510E373;
 Mon,  7 Feb 2022 03:04:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYu96WpzmH6mc5Sqdf/deBj9vTifvUoqUzycBpI34yow0RShghp11OHuBSO0U13+oLEvLhw/9+BcagFPO1T788emc1lOWrd+wGGY12DldZHnXEEQJILLJSRwWEUaB4X/h8aE+ZakNH7mJekogZHNSe+BGTrlPv3onHOgUOV91C9zEy5BRbgOKhwTwAsZSIL3+LwjtsJW3H06BEWgaWlnxQ8iaaaIwA9eN5JK5nbC+6IucT9yCgoeyR9DvtdOsCTpSvEH0sTXIsEKlNIUlTAINKA+ZWT8bTiqVh94QX6YphkAfLA12omHT4yyLfBzJ9mtUaWflqSwYPmM3kqiGNkIqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0mKa3GFn/K7z3Vp/MPPgKL76eW1ze0iSxZTVlkL+ck=;
 b=XkCWipNofTevI7q6GacIjoZJDa6W35yhe47//ANOre0u78p1GHsu4nwKOxiVfUr02VHF8cip6qgDcIDB7EOcWpTjfToHd2Z2ApsFEicimdpO33eaM9/TX+Pv+Ajbp1/zlHcBX5f/PcmPq3Whu0zDVuE4Dzb2EpWM9dvN4D2qAkfXEiYynVt+b737+ckx6i7gERZZizCGjWvGXDJQawUSbI40lCm1WvrfKYaoRPIwxs0Ty62nRLOV8sj+JSDs2sm9NXEwAR4YN01/EHZJnufyTXU5gxhGk3eqmRyE5RtqM1iP8594LLJMIKFuD19QHAFWSnfrgyt8m2nL8gXZngNxpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0mKa3GFn/K7z3Vp/MPPgKL76eW1ze0iSxZTVlkL+ck=;
 b=VKgSC1iMkWDvacw27isg10Vfulvhvftaa5XEQEtg3fGvKUj9DHSer3fgxDyVbHtSUW+ZltQ3TGT5xb2+EY0sEyRi6V3GnwXXtRZLqdiMKVLpdjz1WraDAYH/4Lg5r27VS5YcG2e3DAD27GRWldcuYtDobg9LWDYzmHnyATaf9rE=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 BN7PR12MB2642.namprd12.prod.outlook.com (2603:10b6:408:26::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.11; Mon, 7 Feb 2022 03:04:54 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::a894:300e:5c16:5639%6]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 03:04:54 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "trix@redhat.com" <trix@redhat.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "nathan@kernel.org" <nathan@kernel.org>, 
 "ndesaulniers@google.com" <ndesaulniers@google.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "Powell, Darren" <Darren.Powell@amd.com>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, "Grodzovsky, Andrey"
 <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH] drm/amd/pm: fix error handling
Thread-Topic: [PATCH] drm/amd/pm: fix error handling
Thread-Index: AQHYGqEaK1SoVE67J0WJiMLZE9ClrayHaYlA
Date: Mon, 7 Feb 2022 03:04:54 +0000
Message-ID: <DM6PR12MB261982BB4DBCC90F70381121E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20220205150008.1968218-1-trix@redhat.com>
In-Reply-To: <20220205150008.1968218-1-trix@redhat.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-02-07T03:04:47Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=2b99d696-63a7-4ca0-bf44-e753c9397dd4;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c188e0a8-7488-42b9-629c-08d9e9e69d9a
x-ms-traffictypediagnostic: BN7PR12MB2642:EE_
x-microsoft-antispam-prvs: <BN7PR12MB264214EB5827DE579AAD2259E42C9@BN7PR12MB2642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O5Na4Drt+e6IU5twF3tO7fse8sRaBLN5Ag/yXrgkBJSxV/jOHNZOQQOM6FZsArRmiVL9Et0UcJDQIeENhPafnPfjHE17PakC1IPV0ur36qOSKqD2NYKYmdiBOKT2JO22AOuI/V+QPRERRei7ExKAJGQyoyvjCZQbHSvdHE7hQ6U3AiadXEKa6CkI3mn+Ppcug4Nyd2sOU/h2Q1crlBXTqqgUAPtIigodWLTauHhKNYkeJeHvo1+BO1QuTKOW6hf7UkX7/CQl8CUIIJ2Mc5ZHHNU1aBG1XiIsgM/baFw2DAn+GuotqoB5at3rQ0jgzkj+zumA5kqozvmyRiJiqo/mH9UNEsB3ibnQHvZMK84U1bzsofEXPe/eP/f9wOwO899tHmZUi8iQTNjZY6HTgq52GdrEfRrUb0/bM1ezgLsHu1Mz8XMmXQscL48z+EM67VRMx3a9aArY3dmjgLCejekgWN724W3H5gS5YQ04k7M81aBIx9hd9zpejdSQy3LIFmQWaDRdJgrS/eI4OMLcnsWPYVb8laYZmJJHja/mNKFmUw6ptzE4qhu52niJsuzcVJ/5Q+70dq17Mnt3IcKm16by7tMN9yKZh4DYFIEVySGQ32PA8elGJHZmRvGceRS5ZvlPgHPrcKYinTGlA2mLTDcE0mB5G99ZID2zuGSBSYjROMgGnQjiYvJuCKD5fDJaDLUOkwnzGA0i0F3uhwdL7Ybcl4LXzeCbNbPj2/KcekfXVWI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(7696005)(110136005)(122000001)(6636002)(9686003)(53546011)(508600001)(54906003)(6506007)(316002)(52536014)(2906002)(38070700005)(86362001)(76116006)(26005)(66946007)(33656002)(66476007)(186003)(38100700002)(921005)(4326008)(8936002)(8676002)(83380400001)(66556008)(66446008)(5660300002)(64756008)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Awb+bMdpuRa1CEWGzhvwM42zAGS9j9GlvPOLWxso2h3CZtYuCf0ePjjTk5HI?=
 =?us-ascii?Q?Gl2Dav8PQRTqFXxlj0x+d1vM+M+A3MVj8UvtgmNxAyJb1W84QVi3xNPNqt5d?=
 =?us-ascii?Q?7m2jig/xkqN7tn3u+dSlpxnrVN0dJyksN5XYWHgsthhHp/WHaSXQAKasG0IX?=
 =?us-ascii?Q?UMtQBZBoFYNnlDNRr24alC/LOMyCyRCJXfpy4zPeOPpUHDjrhXKa7AaETkIL?=
 =?us-ascii?Q?uh7t4u87SC9BPiHG/GdaFYdHva4ezWUSwg3CkbBVU4ytaZvx6eyP/tKEn8r5?=
 =?us-ascii?Q?wSSul8TlLHqo8mnng9qDdgN2IeZ9iinA7ONAdn2aUcxu8dE7pD1h1+9rZbuC?=
 =?us-ascii?Q?48ioNreXPQsmOSPsRW9kKfevDaF7yvnywVA+2kcay5pkK14fJNEoIf2IFNlk?=
 =?us-ascii?Q?jx/c3pghvgCMOaVTnI2YpNLRsb2dNMy16GnyYwNz3vZll91tW998I0N+AXjO?=
 =?us-ascii?Q?J/weyCJiaKMmSvc1857JgIOvddgW1Z1GedJXohsz7bT1zUImO2vwLQLCtCZe?=
 =?us-ascii?Q?Gr0QJW3WPIQjP5SCrRPjqykROC6BPg2kXWHyjNldO4yaNBcSVIrW3386eUok?=
 =?us-ascii?Q?8QvDpMY2IcGT1+yea7aFjpES6CCFSYtOUnGgd+vM0Tdp8y9cPoWAi4cdwOJB?=
 =?us-ascii?Q?jzdgX/w6JWE2p2+PLzsx1Mfn6gOh4YJ/5DHmSeco5rUShysUav3J9I+USV8b?=
 =?us-ascii?Q?HPMTuA2rFZHxm+GQaUDjRWLnWdbVzNN2S9jR8kvlOdp3OJVE6hGA9er7AjRy?=
 =?us-ascii?Q?063trkbfgp44d4T4s2wS4vRIil7n0fcNzkbD5cFsPMDCn/dm12qXWtzqU66y?=
 =?us-ascii?Q?f1ehWQwWbV9cG76dwXAmtBWBJRoytP/n5terd/uXILzhQ/tLj4DwsS7ahASC?=
 =?us-ascii?Q?fda6o2wqF/+JyzmC3c4z0BFCRILpR2TfOpclHJ9OVUqMVKJnxcS1zVohhO84?=
 =?us-ascii?Q?tl4lzlTxbAUFXzzlTY8f/5BbDXv43V8AMZ2+j3MN6wDotTH20wOOi6DssNOb?=
 =?us-ascii?Q?lDg7K1i9pt3omCN/auZAi2cWAy9SKwo13Sl/ixbUfUxb/PnxZZfj8ngqZ24w?=
 =?us-ascii?Q?CYe0MUkldDok2+cIaOqpnVK3lj66sauXfbWpCtfcXijtAE7Wvjc5/rW9f9hS?=
 =?us-ascii?Q?fMmE1ulnSCEZlg49WZBpXIJKmxDN+79o74bVTRs1d0aYEYXYFqrHPHiXAJU2?=
 =?us-ascii?Q?n1cbCccnqHbCyNHLvNhoo4Fru7LcKA8Xt2mRHbfYqTjrQXo4KUcCJ9/E+cOI?=
 =?us-ascii?Q?pTHtwxBodD9iApB4EWWnrJ1cAlJoRyfMhm8PNvvPEsdMc1ptevq6HA2uW+Z3?=
 =?us-ascii?Q?EnfujW/KlCc/uTjoNMLdkC8miQ9Q9ES0wrCNPIV4/bubAZKudvK95xqFv1k7?=
 =?us-ascii?Q?aihvTBJdbsCLfsiTHLp+NXNgIP+LhJNWsrSqhgjpK+leiKlkpEKpyT/v7NwM?=
 =?us-ascii?Q?lmVF2aMPlxBFr5Mc8pr+uwvabgaDzGj7cEUzZdzQnUVo75ZpkcQPrvkF50MW?=
 =?us-ascii?Q?wF3WEiqIfTaJGW7oeUlcugb2LnF/wwpm/Hc4dnQzfvriqKO5P1LAkQedVxBZ?=
 =?us-ascii?Q?fGv55AYDElNDSjVo/vw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c188e0a8-7488-42b9-629c-08d9e9e69d9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 03:04:54.3339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxdlzYlzeKtnYEubo5WYukrBNMTJw30oNF8I6L4O7L7hNsKz39bwrJ88QsEMY6Zp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2642
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
Cc: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: trix@redhat.com <trix@redhat.com>
> Sent: Saturday, February 5, 2022 11:00 PM
> To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@linux.ie; daniel@ffwll.ch; nathan@kernel.org;
> ndesaulniers@google.com; Lazar, Lijo <Lijo.Lazar@amd.com>; Powell, Darren
> <Darren.Powell@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>;
> Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-
> kernel@vger.kernel.org; llvm@lists.linux.dev; Tom Rix <trix@redhat.com>
> Subject: [PATCH] drm/amd/pm: fix error handling
>=20
> From: Tom Rix <trix@redhat.com>
>=20
> clang static analysis reports this error
> amdgpu_smu.c:2289:9: warning: Called function pointer
>   is null (null dereference)
>         return smu->ppt_funcs->emit_clk_levels(
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> There is a logic error in the earlier check of
> emit_clk_levels.  The error value is set to
> the ret variable but ret is never used.  Return
> directly and remove the unneeded ret variable.
>=20
> Fixes: 5d64f9bbb628 ("amdgpu/pm: Implement new API function "emit" that
> accepts buffer base and write offset")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> index af368aa1fd0ae..5f3b3745a9b7a 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> @@ -2274,7 +2274,6 @@ static int smu_emit_ppclk_levels(void *handle,
> enum pp_clock_type type, char *bu
>  {
>  	struct smu_context *smu =3D handle;
>  	enum smu_clk_type clk_type;
> -	int ret =3D 0;
>=20
>  	clk_type =3D smu_convert_to_smuclk(type);
>  	if (clk_type =3D=3D SMU_CLK_COUNT)
> @@ -2284,7 +2283,7 @@ static int smu_emit_ppclk_levels(void *handle,
> enum pp_clock_type type, char *bu
>  		return -EOPNOTSUPP;
>=20
>  	if (!smu->ppt_funcs->emit_clk_levels)
> -		ret =3D -ENOENT;
> +		return -ENOENT;
>=20
>  	return smu->ppt_funcs->emit_clk_levels(smu, clk_type, buf, offset);
>=20
> --
> 2.26.3
