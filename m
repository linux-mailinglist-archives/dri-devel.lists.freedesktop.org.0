Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5113A3732FE
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 02:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D6E6E30D;
	Wed,  5 May 2021 00:14:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE6A6E30D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 00:14:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ylm0EitJ8Nvq/OP5DWcBSWjWITg6cwGmz2gJq4cXbSPv92Vs4/ksPBqPDw/IeXKU3grfhok4wxUA/Fri7Wt/sWNVKO/BIL58GEXPf+X8mjPG5y3HyXvZK3JWWpy8DJ3VTEOrCuZuZRUyr0WnnBtK4aIeiyAujHsnKBx11/SPESsnyLkQL/f5TClgvFEhnFoMcYGZuwOQwiNwNchxI7diUlcfhqMD5pN6lCTd+VwxzF3YeRYc+9QdKX0bFTZ6QLTyP7JeKrRwJrNVdD6IW+fodf/njVPGJd+VJ2CxahylqZiyRmm45yXJfsDDlAF3ahHX3mwwuOEHz+py5Toy6mfNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+fCqnJZeyCF0C8QrlarA7isHb3E3x6ASB4sX9Ji0nI=;
 b=JLV9//RBPxbE9iad7hDKc6xLfdfOwMoYuZS2RMSYHpVLR5afJnA6NY/2LEXuY21bpaW81xHS2Qcs3cYUY4QHE3AEVoYBkD73XaiGmPNSHXCyP+VVYMhAhqWcSVi9g9qvVGFGvpXKwQcz8e43IT5A5EwECfBmiCdtbm/oMeAizBdGadCYCbeOpvaMk/ss+7Cv64oKj9MKcmKM4nV/v5HGQWUo/E4ZjK0+M4iezjV/bjreLcJR/yYA4ErVQ7Qwe6AEFEEuXmYvXwwXxyRzWchPKz57FslASsWmwh1iAAfLvR0k1O0QuuZY7I2Yq3qQsCYyNQqnnxIIxg0tVWs0I2rikQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+fCqnJZeyCF0C8QrlarA7isHb3E3x6ASB4sX9Ji0nI=;
 b=hUBBjUISYGkvRIstXPdtQa5H35gbt0qqllX3nX5v0uPaepIenNw1xP+lxdGnbFGntcRz4/NDSv34SLvCmThjPBPIPpjm0UGInUhxLJRn9fksd1uZv4PhMvioQa4rDtxZxZL7RC3cD+a05XP1KmMrhBzQOYTh51rOhiO4mz55XLM=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB4943.namprd12.prod.outlook.com (2603:10b6:5:1bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.26; Wed, 5 May 2021 00:14:45 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4108.024; Wed, 5 May 2021
 00:14:45 +0000
Date: Tue, 4 May 2021 20:14:42 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <20210505001442.kbo42ox7nwqwlewf@outlook.office365.com>
References: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
 <20210503142038.bs2qfzzpqefqmn57@outlook.office365.com>
 <A5W1hYEUZFa0XQrjgvtzuZPiMe44HV9sGFK0XWIVaqYbxZhbEtIkEsgCEqawVTl2pRs1ZLfC3cOq54T9thv9RTOAmHTKStqi-5GR9r-ZvvM=@emersion.fr>
In-Reply-To: <A5W1hYEUZFa0XQrjgvtzuZPiMe44HV9sGFK0XWIVaqYbxZhbEtIkEsgCEqawVTl2pRs1ZLfC3cOq54T9thv9RTOAmHTKStqi-5GR9r-ZvvM=@emersion.fr>
X-Originating-IP: [2607:fea8:56e0:6d60:63ad:ffed:25e3:bc99]
X-ClientProxiedBy: BN0PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:408:e6::31) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:63ad:ffed:25e3:bc99)
 by BN0PR03CA0026.namprd03.prod.outlook.com (2603:10b6:408:e6::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.27 via Frontend
 Transport; Wed, 5 May 2021 00:14:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 456a861b-beb1-4aba-bf05-08d90f5ac982
X-MS-TrafficTypeDiagnostic: DM6PR12MB4943:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4943FA9404F78C2ED8BC376998599@DM6PR12MB4943.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wx4Ed06Y1JLjLDADHVQVvM3tTWJFHqJ5WH7imkqBH9kLMtEPrU3vahodpiRV2Mv28EmrdN0iO1AZP4I8dsvCBVs/tDAtc6u2CB9sv7tfKrljCcJAITUoYLYAic584638tVRn9/85yvQ8gOImcyf9NTrurzTHpXJ1kpQr2lY5y4EETnnriiu8KlKvO5bZwkFeMvFjLRDnHvNkXGs9c4bjYQthkl4/vG0E4i9hBnD32EDvoenviPh+EfFP9crbyyz9Hvkug85iDzlNY3wFJkZ3RJOYh2fTOg5ckaMp19k6WlxgAivEhTsGaf8L0TL+l7Bu9T24QZI6cPX80QwGSEkkYQI9R/yC3F0Dji1aiVTaVeb8bxpPQvDCuaHKt07Msz4ze9o9Y9ssEm8jXZqbc6WKn0OO5ftGUxwLuv/gWcVI3UIdNJv1xwmL3W73A3e+wUb6NjhQDCYbvQF4LNAPj2ZZcdii6E+smb4jlQuLZ7hhB9t/9FA86HdOpQH3gIS+qYU4WGPqcVYBqCmGYBkDe/VJZxU9cHm3PjNxAt+1M+1ru5Yf3QQcwuedRoQWZa6oxHawmcCcEDbQmVdiZObB1sICcls5R5gKgz8kq2l744jpjfjB7CCBzPyyOAp0H8XKLqF3eExUimYGlM3CBY6Lo7+XUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(7696005)(52116002)(66556008)(1076003)(9686003)(66476007)(44144004)(8936002)(86362001)(5660300002)(8676002)(478600001)(186003)(66946007)(6506007)(16526019)(6916009)(21480400003)(2906002)(4326008)(54906003)(316002)(38100700002)(55016002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?o+jAt15l6FD6ualYk7+Gv3va2Ns780irDMxoOHnZmGet3hrIZR7edBXQyQSi?=
 =?us-ascii?Q?fNA9YFW714uzsuFy+G8oNcf37zTE2cZyW+G92nwSOCu2IGTRVUO4CCBgstxH?=
 =?us-ascii?Q?7oMFjv9MO0dev8HygczUOigpJPrHkqrfIzmjLU1ndz0mgJ5fV2FF6dGY/sE5?=
 =?us-ascii?Q?izK07gF3quAjnQhSEFkdXALAZxXt0Ukyr3jqK6rTflRLx7JXdSi23pNAR67z?=
 =?us-ascii?Q?NlkNRDYD1WrF3+GQjHVAGW60LO61nOIuzkH5cWT80ALe9bUqD8mUAOujBLtD?=
 =?us-ascii?Q?FVm8lG2aGGG90xy54E4hdZeHTxpAbHv4e1sO+e/b5M5DbEML5ymP6dYX+09a?=
 =?us-ascii?Q?onWvycBKCM3g1+sBRo9xhTfSBW2pFlP+mV4oekfeilEyYERixFVNEvjS/6QP?=
 =?us-ascii?Q?HFdYGvzPU0k+k0bSiO8PtuW3CEtNYTzYGpmP/MZ53sf1OUWFCtJmfqGG4dUa?=
 =?us-ascii?Q?7/3dCEUd6SJjv4NnLeB7qv9em/jJe/4CbHwR0zUEZD/0SU/jYvNk/GjaSjba?=
 =?us-ascii?Q?tTvD5S9CbDTG0LoHdXclqp4x65jtCiY2guFaUHmci/DSKUVqDuLF7vpNy1KO?=
 =?us-ascii?Q?PjQvyTQDxTJHflOW8IfATZZaKhCFBIDfEdj9ooS9Rq1HDsq08e9RIsR4mTwA?=
 =?us-ascii?Q?CMH8kmSvbhQuJf0fJ8gXuG4LHuPyY/CWylTlOdt181yD6WxQw/wlsvFkwVoC?=
 =?us-ascii?Q?CAzFNdB97C3f4PjxoI23iYTf/uzFYUDeqEDw4GqHP3dcdcNOOcTGkj55hsrY?=
 =?us-ascii?Q?dxS1bnWHmh7MyXeRN6nHJRw5ZRmGVnuZ+EwLpp7yUSLSf7HVQhH16EmN4YnY?=
 =?us-ascii?Q?OiGAhZJsGehbsU/n7pqmyX5hVXY7WYMFIhKQwP0wGC5B07SUYH/jGei9TEml?=
 =?us-ascii?Q?AiO66s3Y1+MfGulxoHkWcqzvEXIyLgwte/6tvi5E9skjr926EGN/KUxutr/J?=
 =?us-ascii?Q?uXRdZQZrnir0Ifl/rNn9Gt7y0NwCqIxy/AoRDKCVUz7joIwRdcs7X0xJ2aP1?=
 =?us-ascii?Q?dkhmtfeoiR1lzlnEVmwMXRd5wwEfTodJtN5jS03hBjrTo8qxVOW+JLIgIWXB?=
 =?us-ascii?Q?F2K3q8bUv8uEnF+sunEBS9AF6bJYvN79VUG+4YDenua0QDvTbUdiiXbCU5t3?=
 =?us-ascii?Q?dTHgYekozrlwL94uLCxtVpEX4G0Awvy9OhuTd8RBFGHAV55m23ZXZoM0TNc6?=
 =?us-ascii?Q?NNhPz2GwPYUuFWRCxBAEiA/sEWZZJKnqy5/Nt/4hF7Afg6W6Jp03YvjbGRrU?=
 =?us-ascii?Q?uG35n68R0DMvHZYwYZ9d52mhYl7/d81PQ4ExO1gmBxHaXESf4Adx8ouL29GS?=
 =?us-ascii?Q?UtcF+E39e1V0eWlc/vT6steER89xU+5PldRCBejzq0L+8VPQbHRjbwR2JfEZ?=
 =?us-ascii?Q?gS0t+h28e5uFbyVQMfgpqJBtjr6D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456a861b-beb1-4aba-bf05-08d90f5ac982
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 00:14:45.3167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTs5VS1W3kr3N1S23SI6mwOwXYO3ufcfFpr3NLK9PXYttZYgPUonnVCT5m2UysVIoi2R3f+vY8N88v65nrvowA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4943
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1251366599=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1251366599==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wgvlisfpikrb2owv"
Content-Disposition: inline

--wgvlisfpikrb2owv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/03, Simon Ser wrote:
> On Monday, May 3rd, 2021 at 4:20 PM, Rodrigo Siqueira <Rodrigo.Siqueira@a=
md.com> wrote:
>=20
> > > diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/g=
pu/drm/drm_gem_framebuffer_helper.c
> > > index 109d11fb4cd4..aeb808a0ba54 100644
> > > --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > > +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> > > @@ -155,8 +155,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device=
 *dev,
> > >  	int ret, i;
> > >
> > >  	info =3D drm_get_format_info(dev, mode_cmd);
> > > -	if (!info)
> > > +	if (!info) {
> > > +		drm_dbg_kms(dev, "Failed to get FB format info\n");
> >
> > Just for curiosity,
> > Why not say something like "FB format is not supported" by the driver?
> > I'm asking because the kernel-doc for drm_get_format_info says "NULL if
> > the format is unsupported".
>=20
> As Ville said, if things got this far and the format is unsupported, some=
thing
> must be going wrong. I'm not confident enough to switch this to a WARN_ON,
> though.

Hi Simon, thanks for your explanation.

Is it common to get "!info" equal true? If not, and imho, I think that
WARN_ON would be good to raise attention to a possible issue.

--wgvlisfpikrb2owv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCR43EACgkQWJzP/com
vP/KLA//VP50Hj0W0S8WL838qmGdUUJkIAlKAogSMlPwQmgv8Dqe8Q5DvlsD/iE8
sKX71dpbHiOLPj/F3vPVj8sHmKg1F+7PcjyTg1477+Ar3s9FaHGimD72DMout34g
a6VmiSR4BIvzyKnjZ6vHhz5M6Cl1fF0rbSdGPAQPu+0RPCq7s5wEzMTAi40h3HkK
a1zhp1VCxL0kXESPZI8blplxQ2soclBu6AV5sM1LxO29n1UlcP2eVc1j/ESD9Lw9
9EL78rDzDUtjsybPyoh5A6os7HTPg/gK1uoGGS3BJMCJBN3fUqY8m5A8akYk9Hrz
NWzpak2KMs9+5YH43CH6+ZeJGNqI+6sAvzbsttFBvht1D8v/rrpjbdNMU+WlCaUF
myO/ciT5GCyMsMwjdhYrH/mzBf80LPU94YUScENdEeajsxLcyUWXDPpPTvMr4EnK
4OALgchnI7OfFbLPJCXBx0nEwkCcoWcDFLJfasfmQxgiwMNYcSg6b802kC4zK9g1
zV46jR9zx3oLB5O53rWRhvzyyUvaO2LObYY7bgUFDgJGRf8yKtOKq/HIqfATaMIv
l8VoFcJT5ISp3RwfDN3zc+4M8GTSC3ab8FvxV7OHxew/YUelK6M+CtNljo3/NLNN
hrEEzqLtWfqx9pHPI22KgwutUJVEhjXua833KQN9rG1v/ObyZoc=
=FgJL
-----END PGP SIGNATURE-----

--wgvlisfpikrb2owv--

--===============1251366599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1251366599==--
