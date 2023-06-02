Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D37209C9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 21:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575B810E63D;
	Fri,  2 Jun 2023 19:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2104.outbound.protection.outlook.com [40.107.114.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA1B10E63D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 19:29:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UeLaNkcsLgaU9H63QIg4qGp/Pb2J9ChXYMbjP/f4ifUz3r1DFwdT2ggfryXwR7JKcZ/47DiTPh1lk+FiLAT3KhtjmTtv2web1HoPyz6CTZfjJqCmh5+eQTJxyh9w4E995uBCC2zVI6d2KTrjjO8dbUCsnkQ4vkQMXvLTnV2JtjPWYYIlQT2V7TJ/5T9TATQbwX0QNM/KvgxpfeVeAx/qruJWt9svL4HBa7SEOwjdEt7DzPu4Vzqci/momjGleku0eNIIivWVBfRcHPxUwWWxX6mEoy1EaMPkgBQLl6F+wdUXSDvEWyXxvMwGE6KtRmzwNtN7jyuYjTl4LsdA4arfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlZD0eju3rcWVxkcZHAMM1ra4yeMRvHBWpCZgN3WP8Q=;
 b=OhVKxvuBREuZdrMTjO8/10N3oABeJ3QRWcYkyD4sv2Z4/JIDxmjr1hjJkM21iuVYQXD/LeALPXk5jT/U4yB4/BHG7ccACxORUcwtMrGRDDiNOS0+mZ9dN/Kte0dpxW0lY81mZL/t0mE29kPlFeSYtW3j10Ab36NDH0S/olAsf+l0B4dUrXH46y2kAMmllZXPn6prZBxIBGd/N4QQNApSE5QneT8DgxMBdysjTk1FDGJRRo2ILZ6sfIQkKHeBtrCMGgHJbNZE+eJZkph0H4up7QKBxr8pjygGpicyQz1A89e5tjKW57ktIc0/snMdAh0uzzNVnpggbPCphQC9bsHBfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlZD0eju3rcWVxkcZHAMM1ra4yeMRvHBWpCZgN3WP8Q=;
 b=p9ZteS1OLGw35YlwT0CatIL4sj70+DA9v9LdqChgt/VLn5mdxps2Ki0eQGH1+VjSqKE8tGvttsT8aRJoQqVo27icsNd842KPNvCMasXexxpppjYYMhgwn/jo+P0eQrMS+BEB4fW8buVbuP/ofss2YzJ/aFraUVTmU0eUl6bY+8A=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB11116.jpnprd01.prod.outlook.com (2603:1096:400:368::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Fri, 2 Jun
 2023 19:29:45 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 19:29:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
 KMS init errors
Thread-Topic: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
 KMS init errors
Thread-Index: AQHZkwwGOSF2+7QhD06cC0ftzXjWg6936mFQ
Date: Fri, 2 Jun 2023 19:29:45 +0000
Message-ID: <OS0PR01MB592200F03BE4C64092321EB3864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20230530153251.22302-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB11116:EE_
x-ms-office365-filtering-correlation-id: f803cefd-8aa8-4bf0-4751-08db639fb8d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bP1JQlZ3u9Liz8HnKBInWEBkNtYF+8Kaz+eyf4fBo/yD7Cqc+JSvpwgHIWFDNFEdKuqzwP4GdPm6FdFyxeZtG94otXSDzjf9FBYTrbiMDbo0QhuxVJFFLWnJGP3nhrqete9zS+Rr3VM6eHjMf8luCR1+P1V2RsZ32BA6CV8l+wcf2jBObyQnN+Z+ckTZ5mrE3jdzOvJTW8BFQpTTpqD6HwZX9wt0fGqo53GnpwBT8ACFYBTEVJ2jTi5hHou09UjiqFpl4QcbC/gOGQ3v8F3A2lfPQV5D4ED3F3sYXHG+/usLq4NVUYGrP1yvNZGXBOih27c4IilpG/4fUDXMh6+Xwwd90FihQmJn1PXFTmgA2nm6R1xyw1Vn8EqMhdowBPC8MeMyW7bPjKdCWROgZqrAEkwnIfPfM3evG1U7o1NxxMd+bYOfTdthUq84ZZlYrXUpFQZER1hdIu90w8j54ETDHBHUraGULk+Rs1AdQoZa4yHqEnj/BrK4WpaN4nFs7mEze9ZU8IlbtgjN11c9LGYHpJ8uOnhpCcqIrYMD3VhKCiJHVUhMREdqY7bAohuUwwE4QXD6oAUdE7tQRZ7pvlC52Cq+9iE7v0gVewDzZMytKCAPz5UkJa7NbErilsCCQ/hq
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199021)(41300700001)(86362001)(2906002)(38070700005)(83380400001)(52536014)(5660300002)(8936002)(8676002)(33656002)(38100700002)(66946007)(64756008)(316002)(66556008)(122000001)(4326008)(66476007)(76116006)(66446008)(54906003)(110136005)(186003)(6506007)(26005)(9686003)(478600001)(55016003)(7696005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DRPUkul7bHciSDx2ScwWq224YmRIDajRx2PNGIQzlQ+0Ec8mzVCl7pHurPCQ?=
 =?us-ascii?Q?xQQv58oYWcH6M2hP9MHXCstuDdy0zzR2njoOcmj90RHcJg4HSu3SmXWQN79Z?=
 =?us-ascii?Q?VKOY6vYAfjRSyDUkIdwvHB8QWHmghpgIWBPobR6zH1R/+adGCF4Zjl27HaZK?=
 =?us-ascii?Q?++jWHPBa19JzKttAgnLw4tOb2QxfcF0VTH2chV7MftTGpZ8k+9c8GN3je2fQ?=
 =?us-ascii?Q?HeWUNtVobHzT6iESB0/QcYCwQErDzCDr6EOIZI3mlWSZrbcvbdSYq4yJbocD?=
 =?us-ascii?Q?xxnNDH2Y7Tp/Lig1WOzRxh3LeXb+Jy/KgDS9cbwH68QbBtzJFs4mPTCPMGYV?=
 =?us-ascii?Q?16RhGqds8RLd+sF5MwM8QBtXWfU7HzSyFmWyTNjvHyh09PUC233RVae++JeP?=
 =?us-ascii?Q?HIOXxRMWs5bg4E5EfZmnl8MR7RmdQ83CLJVOrq30Q3/SykHXJoZmg53ph339?=
 =?us-ascii?Q?2aSJCqM2aO7iqTpPtAuxBSBfWWjpP3eGyP7qAwVzODR7YoO+KselegaqNH9H?=
 =?us-ascii?Q?DjUwWciZWPaRzRi3zmGDA9XDvh/zGr2yHcbOG8aXb18TVZqsYYpCOXN3ux1B?=
 =?us-ascii?Q?zh+c2FXjIcfrmg7zHTHnQ7rWK9OF2J+R3/vINp6saO0QtcLneE0sYpEUHxB1?=
 =?us-ascii?Q?O8BijRpfz0M+ckfDgjz/l1sBYh96mIYuRXVDkiELHCoA+IZk0oFkkY630fNy?=
 =?us-ascii?Q?nyHqRodYVjKN5aj8ASGLWr7/9Aey4PBkY/mzmrRArwLCEw89+ziV2Nei3pO6?=
 =?us-ascii?Q?2acPQOqYrj0csO4YBhL4kpVJQ2wqZ6q1l6Pe7ositt6ec5ZiRC0FXPHvLguE?=
 =?us-ascii?Q?jKtEDFSklEQqlPYdUuJG1WT5LkDr/x+1VBVEOhMAF0E/xdza+AmjgT96kGeH?=
 =?us-ascii?Q?Ct0fhLr2c8f9MIBWk1MB2AYaETYfhuDDji+qa5XtnuM5HVvudpo5oiyM+KgG?=
 =?us-ascii?Q?s7pptvTHxOlptoi+RUEhiuEOW1CEkG+cbrIoO3uF6pW/zfVHbKuBG0hCQRpd?=
 =?us-ascii?Q?PlYLDdRllUjDN9QhbVpKRj1o6NkgQavCutjpHuEA7lSBwe8cfzvsKSjx1oL5?=
 =?us-ascii?Q?Pa0eyTRaAkfXgXTrs0nLmcGvMq+fKekAZR7f6LmrEk/yMJymCyMLKPU5orKO?=
 =?us-ascii?Q?FxRgBoy6V4+ydkB1q376dy0bPcH6rLgktaiIHXVrYH3jcyA9QT+pl9J0a+O1?=
 =?us-ascii?Q?n+bFNs1BE0WALDDJbw0y329gV5BRbcwzIZCedkRrovlK0JCOx1+7UVs6704H?=
 =?us-ascii?Q?GIwwexzc11dNFBDjsP/winh+GKSzcrevQKD+i4FdmWCKCNVY+47G6/Hhl8Ms?=
 =?us-ascii?Q?JOhyTjS/fPsw69j9vIUk4y8Y3wMjzbWf8qmGdqP6sYmtCOWS9Om19hdC1Fx/?=
 =?us-ascii?Q?Vv4cQjiRuHYH74/I/fnY2EYbRquQOCk3SRPxLAxIMosVz5cVrfB9P+0jY8GF?=
 =?us-ascii?Q?sGg4dzje3KrI2C07B6JD1L+RQHvOLEVLxtP67/fBmI4kzcv/yC9J96KXeRGu?=
 =?us-ascii?Q?tib/VUzYFtj5Jb0H3254sSRby4YfL+M3v+D8zG7GJVZqDXKVZSnaUY+S7nGg?=
 =?us-ascii?Q?lTX19fgB08Sipqe1R2HL+P+BYVFKozI2U/oP5uNK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f803cefd-8aa8-4bf0-4751-08db639fb8d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 19:29:45.5080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heMp1zFRm/SG0hego1vKbxXprAnvYA4hHebyRRd4UEcLe860ozub49jWb9LFw/gZET2q7mSpsc1+nN7VFR85KWzZl1xPHH/G5IjGGyYyAxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11116
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
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thanks for the patch.

> Subject: [PATCH v2] drm: rcar-du: Use dev_err_probe() to record cause of
> KMS init errors
>=20
> The (large) rcar_du_modeset_init() function can fail for many reasons,
> two of two involving probe deferral. Use dev_err_probe() in those code
> paths to record the cause of the probe deferral, in order to help
> debugging probe issues.
>=20
> Signed-off-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c | 4 ++++
> drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 8 ++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> index 12a8839fe3be..5b752adb1b02 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
> @@ -701,6 +701,10 @@ static int rcar_du_probe(struct platform_device
> *pdev)
>  	/* DRM/KMS objects */
>  	ret =3D rcar_du_modeset_init(rcdu);
>  	if (ret < 0) {
> +		/*
> +		 * Don't use dev_err_probe(), as it would overwrite the
> probe
> +		 * deferral reason recorded in rcar_du_modeset_init().
> +		 */
>  		if (ret !=3D -EPROBE_DEFER)
>  			dev_err(&pdev->dev,
>  				"failed to initialize DRM/KMS (%d)\n", ret);
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e815..a9b01027bf03 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -932,8 +932,10 @@ int rcar_du_modeset_init(struct rcar_du_device
> *rcdu)
>=20
>  	/* Initialize the Color Management Modules. */
>  	ret =3D rcar_du_cmm_init(rcdu);
> -	if (ret)
> +	if (ret) {
> +		dev_err_probe(rcdu->dev, "failed to initialize CMM\n", ret);
	=09
	dev_err_probe(rcdu->dev, ret, "failed to initialize CMM\n");

	similarly for below one.
Cheers,
Biju

>  		return ret;
> +	}
>=20
>  	/* Create the CRTCs. */
>  	for (swindex =3D 0, hwindex =3D 0; swindex < rcdu->num_crtcs;
> ++hwindex) { @@ -952,8 +954,10 @@ int rcar_du_modeset_init(struct
> rcar_du_device *rcdu)
>=20
>  	/* Initialize the encoders. */
>  	ret =3D rcar_du_encoders_init(rcdu);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		dev_err_probe(rcdu->dev, "failed to initialize encoders\n",
> ret);
>  		return ret;
> +	}
>=20
>  	if (ret =3D=3D 0) {
>  		dev_err(rcdu->dev, "error: no encoder could be
> initialized\n");
> --
> Regards,
>=20
> Laurent Pinchart

