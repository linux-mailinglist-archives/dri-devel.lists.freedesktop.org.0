Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D843B2F693
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 13:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50D510E939;
	Thu, 21 Aug 2025 11:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YAsC3P9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010047.outbound.protection.outlook.com [52.101.229.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE1B10E939;
 Thu, 21 Aug 2025 11:28:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVmB+TNGMZX9w5B5DrClJaT8j7d/S4urMdUZNJE+I12/+ZKqXfsREmXVkTg2I+I7UrwnbVTBjuD9ri6qy6lekjuKMjmVkRhLvXWW+oO31PneAB3zL6tyn/1E6FNGtWgencFiL4ApGI67Hdikccp2MrCePlwR5iRUgf8Nbg+ewevONksvKxIIFfpmP9Bnd4nVznqmwjGAn+ZhBtQBlwjkOxILWD++jq+WhQBJOxYpd0nAHg1gVQnnaNQmRJeAexHz1kgj9PEsf3LIYM7ixicsdPGIeEvBOPNuMcOBpop7WOk90CJ+crhc3/4Em++BcB6ngLPGAt2qGLGjB6wDq3aFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=batBPou7p6vt5Z9bn8Nk2nfj7gwkozC1W2UMIXPDDwo=;
 b=xZabjna9u/Y81FSfbO5oOt6Ya2lMUJFPZZKM9byTZ1BcjI4SgQq2bHe4417HIPUecJ4gbWtzmPnA0tX2klRLFaUmpLQbGiNwRIFILyKOEpXzPNaT008N2uoFHEU6cHBnUQic+rzw6SfIgczmNaBuuUjqnZQO4rNUBfSOdqg8lfQQ/nBkI6HBH7YD5FZSWZz9h+GLsDQ+qp4N89inIT+Lf0cNYNk5mJb1tJRyD8KxjnF4ka5iBbUCcObGJUIjQibNo87N708frWU3iTbkpzNKmbvZh7rr2KyXJM7ZWA9PSlBp8CpV4UPXmiSoE3sU29vV4wg5LY4Em+Sl3vuzlhQl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=batBPou7p6vt5Z9bn8Nk2nfj7gwkozC1W2UMIXPDDwo=;
 b=YAsC3P9igXdfVQUuPOrh+U2ysrgV6o3GGcvlBGufKdkd0SnpFRXWNEaeTSr7EOQe3S+vyVWvfcgCMr6etNwriz4oqVqfXNWkxBo5id9PKbazwaCVIneuw9EJPHFCD0w3sA4jKu+J2s5ylgzut02q/UUlZnujwCUzOt0WAQqGN9I=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10811.jpnprd01.prod.outlook.com (2603:1096:400:26e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 11:28:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 11:28:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "airlied@gmail.com" <airlied@gmail.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 geert <geert@linux-m68k.org>, tomi.valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Thread-Topic: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes
 with drm_mode_size_dumb()
Thread-Index: AQHcEnS9RPzKheS8DUq4xJ6ExVmpC7Rs+CdA
Date: Thu, 21 Aug 2025 11:28:24 +0000
Message-ID: <TY3PR01MB11346A4F40CE555D24C093F278632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-19-tzimmermann@suse.de>
In-Reply-To: <20250821081918.79786-19-tzimmermann@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10811:EE_
x-ms-office365-filtering-correlation-id: 9b78a164-43ad-4159-ccaf-08dde0a5d7bd
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?N2kXLEFlj1eGCKIbn+vz8Sgi83kEkUFEy6HwZuvHYltrLvfrGM1P5UmBCtco?=
 =?us-ascii?Q?ak+7V202f7dc7tnDVDU5BrH6nZxNfaPycO4m8GC9relShMvBTSu6FqjHfWro?=
 =?us-ascii?Q?bgL9OiqDAprVigSb5XDqNzrhuPsrrUVHWo5KFojc+HPS9rN60TX/qym0Aqp8?=
 =?us-ascii?Q?SIWIlXCpLtw7GPK6O5BrrwJ6uVNKzhRdGiQzsrXovLrcp6M1g0aAKR+LUHx4?=
 =?us-ascii?Q?QV3E9zqoKjbJ2PbJm3Cm5i5ti78W/SbTKWeAR2kPlZlvDspNjYI226ZL0GC4?=
 =?us-ascii?Q?UE3D1D9iEIHu9HWdAPaicc5TmVM5DNX99GynNqonyEzPd3QBIvJem/k/iYbT?=
 =?us-ascii?Q?R8E+o+POGIWIJIniOuXIRDRc5Kp1Ga5Wd5McEJLO5VQ7Q15hguKv1D1+m84p?=
 =?us-ascii?Q?8jiltoYZoBuEV8CglktXCU3XBMsxkTYv5Gy9rQn8RitoA+x3D7zrl8aa0eL/?=
 =?us-ascii?Q?RaV/m5XH1UXwXwr5Wt7ZWx5MmyckC0bIx+yFOFMHiolUq3y6ot1MOQ5ExX2o?=
 =?us-ascii?Q?NhWGgeY9jTwCXDcbriZ0VsH365Yk5Ex6IrRp04SUHuiAnGPECEW76QMRt9Jv?=
 =?us-ascii?Q?vZv7WWECevwHqKJIY9iZQSPx5bB40jOEbDzJ9VDVi2tnM5U5v7RkIncV6I68?=
 =?us-ascii?Q?vfUnluF9tyIS2ePvN4OOfBEspsHniV28DEWRvyc8Z9hXwUx1yjF2fyCFzV4U?=
 =?us-ascii?Q?EJt6UJqm4Hoxbmnr4ypzm/8Sx4LLCp3RWYhhXvOma8VW2JtYQCsm3iaagCL+?=
 =?us-ascii?Q?pekzcXlRS/BuX9bbFzMgb9dsEinPvHlKi+Ba9WW6rjDC8gtuGfkiDDIkYwFB?=
 =?us-ascii?Q?5i+IbSAvuQbjn412ZXUOQi2P17IfXx5g9wTSwhsdyh/SPaiNWk4Ljm23m7yD?=
 =?us-ascii?Q?7XSaQPLNXEw+1oRFf2SYcIazdsiWSBGVUQ5GbwM+EsnZ7mG/NchBVShCq/sM?=
 =?us-ascii?Q?XzP79aE5tAh91zFX9/d7doTAzSb70CJ+mt3nsJvA93W2VlrK6wJPx4j+nnGL?=
 =?us-ascii?Q?gFqw8OyvWCTUeT6/xN2QXBy45DZDPby/CT3VOAAWfx1El9gqXJTnMdqhDU7v?=
 =?us-ascii?Q?lctq+0oKaHNhu4StQZlGQ9R7cSbPPsZ4HB2P0MqXQana0czLpcXu1Q4G+upF?=
 =?us-ascii?Q?GpQ+wxU0fDjhQjZcKKljFkruaPw4KLLA1kp7smnlkqTv972DnQsypPwwzurc?=
 =?us-ascii?Q?t3JVQvQpDOmNlfT8lAufC/8GCv1GzDbQnNCvd5KyNR9Zg1M6T7cCy8jbl+jF?=
 =?us-ascii?Q?564QUCmcjzKaEMjU9qTXy5bEBb1pAmGB8k/cvjDu9WRYydjIfa89+bsAzw+T?=
 =?us-ascii?Q?wu67TQ1FTrMxk0FjzFfffFotjtTv3O8XBViHlqAvHa7X5CeHBEVJ+zBwNPbz?=
 =?us-ascii?Q?xsx4aaeTg3lV30rmoLuS4B8rA6M26z8bVh+yhU9aHhTfeqBNKKHngi9/vKmv?=
 =?us-ascii?Q?oQN3unTlrNRdSbCWNeBd2uBhMgjzz+gVysDFpajoLxcMlCJSGstZ4A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PYGxOXRJ+AhtkSHRjSSo9MFFvB0Gk260SNAmCENfRdHquF7U5PkIjWNcVC07?=
 =?us-ascii?Q?OMIMxmBrvMBOB+J6bGIDNNvlOPDuasXtMNBaWBrtRaIbY9IxULTIKztviEpz?=
 =?us-ascii?Q?sH67lR0DXw6yUTXyboRaE+EoMjwUltms3WUtxtrNWphbjGuNHrOderM0zLcK?=
 =?us-ascii?Q?pN8rYmnrXasnP3vF1JMqC8ZCCZrnFBQmCh2pD9PQIJ+IHWtYSnCpQPegW8iS?=
 =?us-ascii?Q?lju+SD7BLBBnvizzg1J9k8nQhaHAjtEDOL38Y8pyoz3db1NHfO6x/Fvmfz4b?=
 =?us-ascii?Q?+kf2dgV7zHQldU8kHA6QoqZ7IpZ4bSTxMVXzTL/QB1yPkpbWrt1tELb6B3I1?=
 =?us-ascii?Q?2DdZOWGif6bq3hLXCZ7QqpfZlxaWRAQDGELhasURydZtMkTqNFaXUPihko9b?=
 =?us-ascii?Q?5E/558Doo0t0YxjPXt83KRp3ZE/8WKZKNDItZGavXnRoI+D7nJeX8qjLUwCG?=
 =?us-ascii?Q?cunw8KX1hmqZlOV/ztLqjqgWs8J2nRAXl+iQND8NfWYQ+e/HTepAowFxJfba?=
 =?us-ascii?Q?AalpObkv5Rui5+z4ihA6BBxDB9wNqqJexARo3yePoSoYnxVHQRsOIZGROlqd?=
 =?us-ascii?Q?DAnlEx5VV0poV8aY1ifA8gcvDPAPUTFN1r+bIkHfvQvVIyR58I8Lps2WDTdn?=
 =?us-ascii?Q?STaA5r35JDy7DjGUtwpGdJWwNTvx4IQh7Kqufu8OOjJ65PfAJqxIE87koi3c?=
 =?us-ascii?Q?gnZ1p3ToGwxJb9tIF0qs1FZtyk/Q6B9c7UWmIebNpHiihlViCEDfcB7MdrhG?=
 =?us-ascii?Q?gK3lyWv1fsxbQGq3EP9N4k6EZWHxE1OIyNFYQvCvj2lz8eBxMJOxtC5Vhf04?=
 =?us-ascii?Q?PQ1ePyOIeDARa/m5fAvug+/Fh5y7+g1l6w4YX08BLhvJhiEGdK0AJ0c4qK+z?=
 =?us-ascii?Q?RQLV+jHWn3gleFCdunuzjMZqUmxPxCXDdIwkHwqMRVAVmHaUB6tw8C5kpWOK?=
 =?us-ascii?Q?GSLgZCDecYKymLnUdi5KjIBUQoXqiApPTf5xQkPzy63gykuFdztc/7peC5FG?=
 =?us-ascii?Q?zVF2p6pByXplQJohwey6M2GhdHCrIOiqNffV08n/CKQNgXpcJKB6pUKxX21d?=
 =?us-ascii?Q?lSb3xSHS2UnDZ9M/RYolMTrlbu6tvYg27VX5AMEQsZ+7kPC3fxO6az9URqpB?=
 =?us-ascii?Q?4rbF1DOa5j/j17hez38INcqb4qbZasd4tBIZ7VWGPh2bt626+y5IamYu4RBX?=
 =?us-ascii?Q?H66aqdFMnqQGtZG0C7fWaX7afazH3qVUg+gML+ov1Py2MPhWU8xsePOoN46U?=
 =?us-ascii?Q?T1BgeTjbQm//iGvRtP2c+b/nfTbxOm8d/6DGMjfH2aAPPYih0YkOwcFrew1G?=
 =?us-ascii?Q?IGZJ27G4MOPPAFLv05A7I6XJnLSrXBKu9joq2VEzr+9SU04b0/QyyMRd5T11?=
 =?us-ascii?Q?3p/e/tgowK5UNtOwEna2uL3PvhvqM9pVq0VAdGVMaUMJK7SgaEPBPn/U0wbT?=
 =?us-ascii?Q?UdbWlXajo8nlLBv1VAEcDYVJz2DSPMpL23wcDvYpomqO1hWpcobNA96Fiu8I?=
 =?us-ascii?Q?Nh1GzwGzjejm5QCdlUvwMREc415aGwOXzpg9PqAztkNe17rJ7coxEcBNp5xK?=
 =?us-ascii?Q?GQJmSh6UnEvb6M56cssZ+Qoi/GAeBYJoMW0J89DnP7WLEF1BunVGuu45mx7s?=
 =?us-ascii?Q?rw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b78a164-43ad-4159-ccaf-08dde0a5d7bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 11:28:24.9907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diWP74d6Hjqhrz3I2im0C9R48AtHhdFXOHtAbZWnsRHk5zzsvNCo0dexdMyiki0ZSZZx/wgKEHEcChoGToi+deLdzsEZ1MGzRC44i/17ZSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10811
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

Hi Thomas Zimmermann,

Thanks for the patch.

> -----Original Message-----
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Sent: 21 August 2025 09:17
> Subject: [PATCH v6 18/25] drm/renesas/rz-du: Compute dumb-buffer sizes wi=
th drm_mode_size_dumb()
>=20
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and buffe=
r size. Align the pitch
> according to hardware requirements.
>=20
> v5:
> - include dumb-buffers header for drm_mode_size_dumb() (kernel test robot=
)
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
