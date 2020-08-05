Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D077A23D342
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 22:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD5789CC1;
	Wed,  5 Aug 2020 20:46:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F281D899DC;
 Wed,  5 Aug 2020 20:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoFUURHLZm//fkvXSDJeyEHCAAOwpb/PTlRVnNLga+nJPzVWKWL3p5XZvnqa7H0U3SVlidPyLkLszQl9fVpxgkbH4d/2wFhE/UHOrRKbOsBK5XQco64qG+n8nxZyutAYjJMI+GjupMKmziTiY/OJKT6lGtuhd1yt3tuWDamwV7ZHJOMOXNJ3JH1XgQ1TB7Z5Q/v1QSnvPapYf24rjubk9XXCY6ZY0s6PKN+ZIa/dWj/Zwy/pO6BfRRPpBs7ntjm3sHJ6WUmHkkFPQ5UUpAsR53bU3qOOrVn4lFVct7tNRVzAduxJfoiWeO1h0PpsxpBKGJ7PH/jO/epJtO2pJUp6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcE7Mg9dewo/PtrVNA29+bC653ebIH9ss7V5xth3yFQ=;
 b=XTif7QlOH5tfynv4D0NFiHpGL6ndhcEYiL9zIqYIcwnCotUi/scXDT2MLpTMhW250nnMx2MEF6AAi0riaTQ6myWQTDU3C/MvTln4KDZbqXbiKPrmEzfx8qtJcTmn8J4FoYSvNIUlaXkIFShmFjOqxVkQjR4Bm5wsR8IAx+LnFyewKU0dH7DR8tKYWtEtMSlW6XA8QJCI1ZnP5MY0AZw4xfQv0tEqbaURccFKbcXgGQQmnCB5qmaZNhNLNZOYdN/mmur+LA2/aSZ+fPQRhFJ7uHHJUzGTH6GtcE7cSKyYJAF2Ax2sobpmRth7xupsxUc3+7I4p4cJysXNigqNTeNv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcE7Mg9dewo/PtrVNA29+bC653ebIH9ss7V5xth3yFQ=;
 b=D2U7uPJicwOK5CDFBMyaBhjFoiNIdNQqYmtXH7NqgpV0af627XX4cYSJi/QxBBmYqSnYCA702NMVnaVZcSNdN4NiU0BjnlGx1gR6P3IZpm9ZN5twUkRo1QhK2UBGCdqBNK76gXzPcvD4Eq4lBv3sk0+Juc7ZR1YzPgS0oI6wjew=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3275.namprd12.prod.outlook.com (2603:10b6:5:185::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Wed, 5 Aug
 2020 20:46:01 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 20:46:01 +0000
Date: Wed, 5 Aug 2020 16:45:57 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 5/7] drm/amd/display: Reset plane for anything that's not
 a FAST update
Message-ID: <20200805204557.slkhfawjexrqzawu@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-6-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36)
 To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YT1PR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Wed, 5 Aug 2020 20:46:00 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5677877a-a57c-4e31-d751-08d839809037
X-MS-TrafficTypeDiagnostic: DM6PR12MB3275:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB32752ED89A39C79669C15327984B0@DM6PR12MB3275.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0TvdVMSJiLGYqBColS0dcpuSElex9XNUEwo8StoscvDJfWwf9Um9F6Xl3DL+OVvT2TZ6XSjVOz1SOtz/fKJjjlw6/r9S1xRzdg9TyyEnPoH9JNFmebHWvckL0d7FDJFME2uKY9mY9aPIP8d9xKGSkgPZBW0ExBLoVhXjeHq65A/XvkEOfZFnqy4knaXKHXVECsGqZ0uaWz1KKGv/ZHdy5DgOPLtUzPEmAz1+UnZT1k/AL33AA729Z2CWgehdFImC7y+K0ENrVGWo1jWbsIbBsXhHsEOAuW76jSeVvogejqwN5L8h9wc6ujwzTG9QyMu91h1CMyFfYnziSSV+98fWeRKktFT6gLg1yaWd5W9L7PvijVyhR/OUOO5Es8cMMA6ojqJ9SJFSABvY1al1S+EkvzllpbBMZCcY8qjU/vQmDEqDpu3G24DRZOXR7g1o6MQtqJhHs1OrvBQ18qrelJJGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(3716004)(54906003)(5660300002)(15650500001)(478600001)(86362001)(6862004)(7696005)(21480400003)(450100002)(44144004)(52116002)(8676002)(83380400001)(66556008)(55016002)(1076003)(45080400002)(4326008)(66476007)(6636002)(6506007)(316002)(66946007)(8936002)(6666004)(9686003)(966005)(186003)(2906002)(16526019)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: VrGb4dhSwlVADVm67JrlDnSzwN9cUPRbubiU5hmhqXT9jjHvhlLHqKpTjvSI2Eq0kxcy30qghbkJc6Q4jBte4Cq5lfw24p4gPaBDDDfEv7G9zCGjtr4duwEKCTeBji5gAfIbBnDkGAt3vNZy6Ek8a0EcSal6SnLL8pJqaqW1odrv+VDpAxFzUUfW+K+xhB5guodIIXAfxjcyGwroEXkvnV1BIqiEiC9fYlEDcLZ9NWdmZ/ZvpGNM4fGy/TtX74Mj+GrurlwUbYLFMhvXuQ58QeLCMgFDD9F33S2ERP3oiVu49LrZTJJMhayxYsU8Y5jaCg0tkp4JpsX61S09xKBZjyaQ5K85LmBZGP1snYTBesJK6aXlJG9rOOSh8aCa3NRbCiXBUG6mT/vfEfLBtqhH4JfRKWNTp8nGEk+NbYork4fXzxgLe65bPj0IEiLiywsleLSnfrsGc2KSidRSHJgpNDOoay2t49mXzRS5T6gFlv0H//lGUAFIAfRf1HTP7q8pHVWCijFitGfrKxgOAIHW5zlaPkbk4Hfat+m9yy/FAfnaIZ4Xdk7TpKPJvRnQDhTac3ovIY01hieC9X59AkQguFH4PLVyOmVY1YjWXvNPRGczpUnW//wPlX8/h+IAXmkLt93icil0eDi+EQl5E7juTeHP9Mof9ulxPqsLlPIta5TraxVu79MRJcVB4Nvygxgw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5677877a-a57c-4e31-d751-08d839809037
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 20:46:01.2783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2xo/yNSLB75K8E0mrOX/xCKASDWQa2p7Kvo5AnDcBGRJ8LFe5zUSZqa0XPLONmy+7rEe6kCzGYJpqGMAdCpwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3275
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============2031723271=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2031723271==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hqsli323v6qsgcjy"
Content-Disposition: inline

--hqsli323v6qsgcjy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> MEDIUM or FULL updates can require global validation or affect
> bandwidth. By treating these all simply as surface updates we aren't
> actually passing this through DC global validation.
>=20
> [How]
> There's currently no way to pass surface updates through DC global
> validation, nor do I think it's a good idea to change the interface
> to accept these.
>=20
> DC global validation itself is currently stateless, and we can move
> our update type checking to be stateless as well by duplicating DC
> surface checks in DM based on DRM properties.
>=20
> We wanted to rely on DC automatically determining this since DC knows
> best, but DM is ultimately what fills in everything into DC plane
> state so it does need to know as well.
>=20
> There are basically only three paths that we exercise in DM today:
>=20
> 1) Cursor (async update)
> 2) Pageflip (fast update)
> 3) Full pipe programming (medium/full updates)
>=20
> Which means that anything that's more than a pageflip really needs to
> go down path #3.
>=20
> So this change duplicates all the surface update checks based on DRM
> state instead inside of should_reset_plane().
>=20
> Next step is dropping dm_determine_update_type_for_commit and we no
> longer require the old DC state at all for global validation.
>=20
> Optimization can come later so we don't reset DC planes at all for
> MEDIUM udpates and avoid validation, but we might require some extra
> checks in DM to achieve this.

How about adding this optimization description in our TODO list
under-display folder?

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
=20
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0d5f45742bb5..2cbb29199e61 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8336,6 +8336,31 @@ static bool should_reset_plane(struct drm_atomic_s=
tate *state,
>  		if (old_other_state->crtc !=3D new_other_state->crtc)
>  			return true;
> =20
> +		/* Src/dst size and scaling updates. */
> +		if (old_other_state->src_w !=3D new_other_state->src_w ||
> +		    old_other_state->src_h !=3D new_other_state->src_h ||
> +		    old_other_state->crtc_w !=3D new_other_state->crtc_w ||
> +		    old_other_state->crtc_h !=3D new_other_state->crtc_h)
> +			return true;
> +
> +		/* Rotation / mirroring updates. */
> +		if (old_other_state->rotation !=3D new_other_state->rotation)
> +			return true;
> +
> +		/* Blending updates. */
> +		if (old_other_state->pixel_blend_mode !=3D
> +		    new_other_state->pixel_blend_mode)
> +			return true;
> +
> +		/* Alpha updates. */
> +		if (old_other_state->alpha !=3D new_other_state->alpha)
> +			return true;
> +
> +		/* Colorspace changes. */
> +		if (old_other_state->color_range !=3D new_other_state->color_range ||
> +		    old_other_state->color_encoding !=3D new_other_state->color_encodi=
ng)
> +			return true;
> +
>  		/* Framebuffer checks fall at the end. */
>  		if (!old_other_state->fb || !new_other_state->fb)
>  			continue;
> --=20
> 2.25.1
>=20
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7CRodr=
igo.Siqueira%40amd.com%7Ccc095e7ce6164f529e2708d834c86d1b%7C3dd8961fe4884e6=
08e11a82d994e183d%7C0%7C0%7C637317382766607890&amp;sdata=3DomLC%2BizXVEjjGe=
6IylBpniZzyUGlzTATrgRoWEo6dHc%3D&amp;reserved=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--hqsli323v6qsgcjy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rGoUACgkQWJzP/com
vP8UgQ//Rn7kmI29dAIcSX0uV4hYN99Nomc/AsgMnz7zMWEMo4J8zSVptgakvncP
3l3Fa/W4lOaXBjQhu2AtspAhgxA5QB6Rpdy8DawjgcdYN7sOovS902gYKZAVaJaq
0x+ygpR2H6BQo04NLY3zDca92fctJQYqagxrQIs4o+/OC4zoaDXdjH48QtzYKdbV
VxwbicXAePG5t8+YSrqMejFowiFqwI4qI/R8IoJXYXRqN+GR6KYEcOpDc3vt1YjE
u7NFoVBhEVvqlR2mOFjixJ0NvxXt2EkwJgQvHHsLXmpnvOA/UP3ts3rU31wdCEhZ
RkADsCbxPJlZYIqV4HNBn+ssyBFlwbRt11fVcoCxBXtpd1JMz4LHBuAgoNutNl2P
SFHFdJsak04PlzZwglqIW1Kh+H7lAbYIQpIftcBFESWt4FTicG6yov/UOQRo2mMS
eIO7uvL9DNdhUGcT2rShpwP8bqOnXCiaKBRcTOubi8cWfn+ypF+oMkUtU7WTKfVI
wJm1iy/RqM/95cfODUHHs72S0dIgEfA+fQe4Iu70pf2yWBpdZFsPPBimrsxf4MaB
V2rSn57h0rvveZCPaoLIsMmlwKOKQD/0WOOjATahKs3CFyHaB3XMGqFbZcESKsZh
yabJGlzeRAbFzMVs8mRnAwAX16U1ZwLYL+z2yp+bD+BUjHofeZM=
=9aIn
-----END PGP SIGNATURE-----

--hqsli323v6qsgcjy--

--===============2031723271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2031723271==--
