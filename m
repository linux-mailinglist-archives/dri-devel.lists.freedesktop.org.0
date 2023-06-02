Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA2B71FEC5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789EC10E03F;
	Fri,  2 Jun 2023 10:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0459310E03F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:16:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUEJ61tdgw7S7l8tmGqSZM7Ke/Bl6BlV4WJM6RYM+MAcPVbC0AF8ntHPtDxfAo1v07ti/sRmktf5Eg/UYQgjVu9Gfdyx5BEuyL0tjmfYdJSN6ZpK3FnfhOQkSgezvdGuieg8D/08rfaeMJkitN+PiA8SA0tMT6l98RwHDpmv3oIYPu8gY3exBBZl2yDNJPD3Z7JJ51jBpVskYcF4KrQrRKAJo7OQl2CLTqFgjp2ufkSwNGpZHnK4Jc1xATFJu1MuD0OPc1Uwfd+mC4H3mr+9c70k3Rhk3uXhRsqpBTki1SlS+vR6uL43mMeK8kFw0eJYpFf7sXCRBj/PVYSzRldMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UaXI2bhk0GUXb3r/L7pleNe4Lb1pA/cv+9bUiNWwkQY=;
 b=VoknoE3KBf5WXgXJGFWPOGxQoNC9TWxyU4u2x8cdAetRq19brMQN6QkgarWCAtr9RxMtaIxsGrq14+/qOx9lgPmQZU4S6vqpt0Gkg1PBEgMgvmPYRoDZSBfoYGFy1HsRAnSdRDZJaaJ7Y3qLylLRr4raC4/zpTPfmJmDrgaLXISkPCyBP7IES4P36yUWpew64S8ZQHimstGcexnQHnSQSK2CYnWKgYuv/fTywSAlaMm1NJRWZ8I0bQHE9H10rTZhXlqslqkRoou2twuUrAW19zbLcKO8b+Gel5Crap1IpSm4JNA2olHwQaIzh7prkF6EP1akWLP572UtIg+/Rx2/ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UaXI2bhk0GUXb3r/L7pleNe4Lb1pA/cv+9bUiNWwkQY=;
 b=fsN5MSF671egRT0TluNv2VHTe2smhfdn9BSZWLKQhaI+763Ius1Cz+LjxSym376WWixo2ugQO0CtIlKGfZlC9Nyv3wFAZa+fw30gVIQ6wmcEldi6oQIqRqVEEMRTRJYoMXPmUB1QFj8hWEV6F4LEXfgK3DYTQ8uvRpdrBjty5Rw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5361.jpnprd01.prod.outlook.com (2603:1096:604:a0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 10:16:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 10:16:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomba@kernel.org>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: RE: [PATCH 3/3] drm: Fix references to drm_plane_helper_check_state()
Thread-Topic: [PATCH 3/3] drm: Fix references to drm_plane_helper_check_state()
Thread-Index: AQHZlTJEuVN3WjOI50uBFusv3IV2Yq93S5lg
Date: Fri, 2 Jun 2023 10:16:50 +0000
Message-ID: <OS0PR01MB59225B787D7F3B179840CA6A864EA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <2408d7841c91e98e9a2b24b1b4df9b2b865519a6.1685696114.git.geert+renesas@glider.be>
In-Reply-To: <2408d7841c91e98e9a2b24b1b4df9b2b865519a6.1685696114.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5361:EE_
x-ms-office365-filtering-correlation-id: f62386c3-c074-40fc-84ec-08db63527b3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VyV42jO54TYrchljLIODw8tfF+vVS0ri1Fvtdglrr6BQKkDs4or++DGX0R5buYKfgrtPUrqfM65t4f0bPMXuxIW7nxb1C0O9LKBU0lrrArb9hFCr4Ue5CsPmuMRFRD+34IAPJ6+nqOSNJt4CTMqHp153Mzp8vwwcrmeRBwvExZoPOh4EnZXl7wIzVt/m+n86C4InMEUtJW0FgCllfrddJgfctHLkMY6CwREndBHvvOBFXYOyayUKXeVjMVtVQEx2ZijIwiXCbvubrDm1UjYGs8IZsPmJzTVmRx48nNSaQFIOJGiQtVTIS7TdJaHAlbZb0rW93Bcj2p/fmL8/MjigE0J6QscXDEYJRZHnpkYW/6vmTxooEnhbsbA8GEkLAzOjwJb9BH4dp6srPufcqF7HnjWU5wphSsbD+F0py3KyFrTQVNHOI1oupOscC6xI2+Wl8AcDGkey5/Eqg8TbOrce5E9SR033y3JSlHSirGnsAEY1vK1kF2iXzMQrDtNNijahkMPVovbTE9wSPOW8woUPhJB//7AEW1JFOXGUxL1vc07s2w9EFAFUrFNfiZ/kOF7Cj2WoMIuW4fVS+/hkRrU5bqzNsZ9J1rLddbBHmyvWNR2UE2kc0yNB1AMn/pJIHcFXRZR52qVsKAzgIcwyjUN3TQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199021)(2906002)(86362001)(33656002)(7416002)(52536014)(38070700005)(5660300002)(55016003)(7696005)(186003)(83380400001)(71200400001)(26005)(9686003)(6506007)(478600001)(921005)(54906003)(110136005)(66556008)(66476007)(66446008)(66946007)(4326008)(38100700002)(64756008)(316002)(41300700001)(122000001)(8676002)(76116006)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DEkgYUhpt920N3yB9WqkCFFChRtC6yvA38SV0sx19Eg4dfj2jW9ryM1A42vF?=
 =?us-ascii?Q?UndsSpq+MpfX/fv4KvECG6c/qioNwbLKQjGPCjt6T9MsSudcdthX2+yBoRGp?=
 =?us-ascii?Q?7NjhVY5d1CXc3CDTRbpYZKLoHvjwXqN7+oBs2ZDV6R1AVLyvbqfyxrgPkUyy?=
 =?us-ascii?Q?BjkvVjLYwZ7HiTr1kYkadyQDGPox5zMIHA+ZPb+el4U9OJ/YVLnEt5A+kHn5?=
 =?us-ascii?Q?qKdJ9eEhY3+7KJPccLrGtmTLY1sxkewvARLkNR3VXEJBsj20Fo1pQaemMMvH?=
 =?us-ascii?Q?eDEM2u4R2ERAwkbis+lklUTfWARiWMiaZJ1TNQijij2mPP+Ee81PI+XAxsah?=
 =?us-ascii?Q?T8Kp7QdSfcq9UHaLT5WDmlRbDKnXZdFXIeCUAMOE7h4x8NRUjAw+GdVQQhV8?=
 =?us-ascii?Q?oDqn2ICykY81FZm4Oa+GHfOEw0M3vKkf2JvZdQUl+cvBMClPyXQwKBXf+u79?=
 =?us-ascii?Q?Mh0lbZ1olPLXtN3NmW8QpY/Em/jfTlmBC5UfSomX4IaU27d5PIy8OsQml8x4?=
 =?us-ascii?Q?ZkKKxp7ng6WNNEzD7kMx6H2OPTOjw+T7Pfhp6z8M2+5H0SFHIW8E2XAudVuc?=
 =?us-ascii?Q?OJao/TNHX5lmrorPMtf4FRGhv4sZ7ZhplgS+G6oH15+Rr+c3L8B2IVT7xJC4?=
 =?us-ascii?Q?v+CSO4Fk0N1fh4O+7tCbypt/hmAhCUkfMouLS4CIV9C1UcL5XbRW4iLeKP7L?=
 =?us-ascii?Q?CzeRh6ChgAeD5s1E7FOlTX8byf6KLKA2Nc8XwD4+uugGSVYZtDaYl31u9Fad?=
 =?us-ascii?Q?mo+oYgP+Ie9saAcooEM2o2APY2inU+JX75YQjR0TXfQF30TYb62hQcbFxckV?=
 =?us-ascii?Q?hYRKEqG3qXSnUtqU9W1GzizsBCybbVi0+LOudngoJGRivlX1qWbZz6U0H/GE?=
 =?us-ascii?Q?6+Esbu5PogM1eWT2QlTIaa2Wlp3maeRzi0cJP2QpVjbe6eysVvuFZgsLkupc?=
 =?us-ascii?Q?jJBfGV+EWyY3NaVycT2QQvSi8Ts/8K7qmJoYcvc/ZhGonf5KVHbfWDlS/VE5?=
 =?us-ascii?Q?9pfHiolJanaCmBOVlLMwdO9sM+VwI/qmRC1g4HRgWC5bPWPpxvTx9yw2EH2w?=
 =?us-ascii?Q?UX0tqkM+BHCE5BQMQ8lCB97g9GiKrEQZcPFHNmgeFHA1Ek/oYpO0xLxQIPru?=
 =?us-ascii?Q?87WFmhdEmilEh0xy/iYD0eiOarrSiclUId5P1B/xJgzGJxxuvYQ7By9IkF7i?=
 =?us-ascii?Q?u2cJUqccb8RTdjM17PyfS0Hqtkd1gHOmPZmx+eDGAdnuQsQgNsExkdPl0uYb?=
 =?us-ascii?Q?Dc7LL97mRpUakwzdkCNv468va+SFEhu+kRoy7vOJV9723DAmxO+S7okJTk1k?=
 =?us-ascii?Q?eJVUy9XAg5bZVRussmEIIzZdWRJ1a6Hh7rGoV8VjB2K+mgjc4cMcruP0iJzo?=
 =?us-ascii?Q?s4xVRgiJq/WO/iH2OQV9+vi0HovXj0tok+Qk1GEsRCcooh3odhzIi1iO0dU5?=
 =?us-ascii?Q?e0QXtyNDVK+9YVm7/OrC4Pnv4Kw2tlVe/rhTlZmnAnieL8d65gdTbInIahmm?=
 =?us-ascii?Q?5FSfOdKYvOVvPVO/B4sa94iHn25vrlk2k9BPujpVqXIvDKlxWB6eLvup8kCh?=
 =?us-ascii?Q?WhAEIw3MyHBaIuGGf7cXavvEoz5nQ+FfrZOO1GWv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62386c3-c074-40fc-84ec-08db63527b3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2023 10:16:50.8642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: byb7UcXXUcFotvkgePGdSVouQrOcsRlB9lXEObQicbDdb1ok1X0NfejYdG/eeQaFSduFJSQgMZzmTi1itF0ytS0tGeh5IZs1su4ngBMvZJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5361
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thanks for the feedback.

> Subject: [PATCH 3/3] drm: Fix references to
> drm_plane_helper_check_state()
>=20
> As of commit a01cb8ba3f628293 ("drm: Move drm_plane_helper_check_state()
> into drm_atomic_helper.c"), drm_plane_helper_check_state() no longer
> exists, but is part of drm_atomic_helper_check_plane_state().
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Interestingly, all these comments appeared only after the commit that
> removed the function...
>=20
> This is against next-20230602, which does not have the drivers/gpu/drm/{
> =3D> renesas}/rcar-du move yet.
>=20
> Biju: you're adding a new copy in
> drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c

OK, will update the comment in __rzg2l_du_vsp_plane_atomic_check()=20

as it is moved to drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c=20
based on Laurent's review comment.

Cheers,
Biju

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 3 ++-
>  drivers/gpu/drm/tidss/tidss_plane.c     | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index d759e019218181ce..e445fac8e0b46c21 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -600,7 +600,8 @@ int __rcar_du_plane_atomic_check(struct drm_plane
> *plane,
>  	if (!state->crtc) {
>  		/*
>  		 * The visible field is not reset by the DRM core but only
> -		 * updated by drm_plane_helper_check_state(), set it
> manually.
> +		 * updated by drm_atomic_helper_check_plane_state(), set it
> +		 * manually.
>  		 */
>  		state->visible =3D false;
>  		*format =3D NULL;
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c
> b/drivers/gpu/drm/tidss/tidss_plane.c
> index 6bdd6e4a955ab3cc..e1c0ef0c3894c855 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -38,7 +38,8 @@ static int tidss_plane_atomic_check(struct drm_plane
> *plane,
>  	if (!new_plane_state->crtc) {
>  		/*
>  		 * The visible field is not reset by the DRM core but only
> -		 * updated by drm_plane_helper_check_state(), set it
> manually.
> +		 * updated by drm_atomic_helper_check_plane_state(), set it
> +		 * manually.
>  		 */
>  		new_plane_state->visible =3D false;
>  		return 0;
> --
> 2.34.1

