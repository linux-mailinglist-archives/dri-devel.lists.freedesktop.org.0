Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA0A894E1B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 11:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A489410F440;
	Tue,  2 Apr 2024 09:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CRe+ecrf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2118.outbound.protection.outlook.com [40.107.93.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4779E10F440
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 09:00:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dqv1WnpqSHOEyjirP8SCMZ3/YxEufF4h5MCR53iaIX5dUNVsVVfJx0Q7tGuZZCI7o+Ymz9/8FCYOF+6fFClRjAO2xYbc5+uyDE71cHq1MnMQLhaLmqhSojb5bVo+o5mHU6eCNOOxBGCQSj0c6ZSeqmx0JRbUi5kaS+YhWhhepjnxr2YZAzHCd8cPzKwZganmpByh3EQPpiyoISrb0ljQCQGY8nn1WuTSC6D7SVZhZg+ZLD45pO29+yj9PMZx079gmz94LW7O2FMXTJAXdTJPsDmOrQnDlVpuW3etu29fpsGqP/ZknoGUoYLyTV0FbqUxvYUfv2GukOhS3iwt4ifSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDDAnTcgRJ7/AIFnXAerRAJhG6wa91+0iSxtSUB2QwA=;
 b=GX1JBUvzjln0cet6t9WaSBJvLx+C9NBXAM/Rv6Kbnm+YrNHugRvfbJiMg4DdK4eohhP6E96WtHBX3x7F87oelcDcpA6sDG0YgiBDbpEcspcdU68K4F+4kvbobgeqZx9jYDKDR7MT1p7XgQhwd/Hts5/T1f4R4bAehshLXCGJrUYr0dHPbeVwsJ3H9OmtVL83EfRreNGrAQgW9X0AKK48u/UdHw5JHyt+e2tYNRDLD+0vAzd/1cTwwS/okF/XhWaBVkHsySftEB1PclSxKeUOTX4FxmTMngV12R2zHoAsB/ba73e+NdSj5RUHnVUp0V7M3Z4AU2eMNUOUIubsShp+4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDDAnTcgRJ7/AIFnXAerRAJhG6wa91+0iSxtSUB2QwA=;
 b=CRe+ecrfj1IwuBXmsObdudsAsfoARty7uwHHlZSwwrc8PBzUzZ68TTyOusRl+43PmrLdIuem8O+AUqP/Opm6+PRALZP45stF163NXq0aQ1/AmDPmR44OgZGOJeXQ7jtDdlFCBvoUnb6PDSG1AOhry1yX3gAVKVT52X4ZZPrqQBJy3WpjC5F6kIpzWd4rhDB4qTELB9IN/Fjg8bJLhCwO0FxNOG/vmZ8Dqy9wjV08cADqmf8x7s1njAhDYQRnndS1LxobPJ8CAdTxptwy7+vExteeRE5TzJ50aHjRpoSJ65TsT1s/o2iQjojxVnch4Y7tv4wRWeZbm9+cq808JtJHLA==
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com (2603:10b6:a03:454::10)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 09:00:10 +0000
Received: from SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::ae74:c645:b13d:3d8c]) by SJ1PR12MB6339.namprd12.prod.outlook.com
 ([fe80::ae74:c645:b13d:3d8c%7]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 09:00:10 +0000
From: Akhil R <akhilrajeev@nvidia.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "davem@davemloft.net" <davem@davemloft.net>, "robh@kernel.org"
 <robh@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, Mikko
 Perttunen <mperttunen@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "linux-crypto@vger.kernel.org"
 <linux-crypto@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Thread-Topic: [PATCH v6 3/5] crypto: tegra: Add Tegra Security Engine driver
Thread-Index: AQHaedbyTqDDO44+YUOWKfWU3w8p3rFM+1oAgAfIUmA=
Date: Tue, 2 Apr 2024 09:00:10 +0000
Message-ID: <SJ1PR12MB63391DEE4A7D11B58E3FCC34C03E2@SJ1PR12MB6339.namprd12.prod.outlook.com>
References: <20240319082306.34716-1-akhilrajeev@nvidia.com>
 <20240319082306.34716-4-akhilrajeev@nvidia.com>
 <ZgVBAFmfK7GKgmYi@gondor.apana.org.au>
In-Reply-To: <ZgVBAFmfK7GKgmYi@gondor.apana.org.au>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6339:EE_|SJ2PR12MB8011:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qh+kld80A90kCRkvNdyVgrPY/rnGHZ1zSU8bXOdNyzwsLwwlIrke9iNX8rqiTHRTmFmRLgNgjBknUswKrvcC7Y3umyiiHmyY2dfscCjGOCP61hD6tRtTuXDuSvmQFncFmZHOIMB15nny2US2x5Ot0yNczuL9L9VZXqoKlPV8XEdQkkFixCvMWZv0hS98VrgSsQ8otoQoY51B8e6hU/xoUm52B3YbStv+3L68of0xAnKXnWWkrTMyOiVTzok/vdTTJ+GDOPSq+jFNk/5PdnDES0a75ZEEXWxpvl1vcLKo7BIGqjk2mfBSdlbqhpfkOO7aaZJUaIV7+wBmLfenGigbENRMMXV9ZmJErehdtyNE8EwjVF4ZdQQxWbwshhI9KsWmM63IsdTKaFzfCjUA6LPHg+d3e280YfwIBgbbDXJ1KUZjBkicu41ckOLhWFrRz2jDyhvcz9un0hzb31eEknqusSXaPh/KkTPxz+F+C1F87LANhULIbrgCk0jGMNX2gZesXb5uT/ny+Hf9R89FqfB4vOwAIkziMk2MfAh4dG3YPcRW+BMQpWnKmRihf300W66gtMsr96m39bDVmIyxqrBqdFwkdoIwhWdGIyrFSHOEJxF+4PqTof12EgcVrN0Z7jfBWBh9XALiHdnp264N4I8V7lnRFZjN2D19k0RRWeBABt0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR12MB6339.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7416005)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Heq7ZuhlN1ehdno9+VlHHuokKI3SDhW2Qm17sIOxL9TnepWUTbx1/LJJ0Pg?=
 =?us-ascii?Q?WvB5nzY+P/br3I2aRuWCBKmQAbCnj/YdIcxL81s14LNmdUEs5zvofSG98SfM?=
 =?us-ascii?Q?L12xElyuZxTXl4pVXtv2E4PXYlXXn3MKxNib8UV10cpT5FaFq8zraseuQ8ZG?=
 =?us-ascii?Q?Hi9kTe4bDuOlbh1R9HgUjiLR3iCOazxjd7R26XYcWw8MXO5lH04Ni2lW1reF?=
 =?us-ascii?Q?xH5hai7ykNbk/O6rLkHPY/Wke8SqF1EmzhwXlFD4G9pndqEJvsdhxHd6jk56?=
 =?us-ascii?Q?zYmp0Pmch9KPOE6Uu3VXpZHaerT3vIQtZ1Jn0WSdYazFLY86swoahk/q3sqt?=
 =?us-ascii?Q?AzFZgeD6u/vaTD9B+faYgsyV3vkskDracKo0twwwijhpQzF4u/SeDncmjBka?=
 =?us-ascii?Q?Oh7kcUy4U8iHik9slZ0nM4c4kNPNt7r+zTcMfNdQl9r357UoHDvc6vUSEE5C?=
 =?us-ascii?Q?PaBeZCIuwqgWRQ9dmwP/ECp4tveNGxH60Nt8P07aitdqAubQQBkq23SEpVkD?=
 =?us-ascii?Q?FczoCLN/9jRJekK1QEKkpQdBVR/80Oc+aqBQhDGVaui2VYTau7yc56SGRVCK?=
 =?us-ascii?Q?gmopUKduwHOO0ChJp/qAWQYAPZVPbz92hCxBniBbuqrWVorgXC1JlNp32CIm?=
 =?us-ascii?Q?eUnyks8SU3//+3zVWkXdie+JaGaL6LrFA7p8pvu215maGzbgbXCI8OwVO8yN?=
 =?us-ascii?Q?G3XEB0W1RRVJVc2yjXZWYwK52hs21K74+nnV1E5Yck7lrqlhowjv1YttLmiv?=
 =?us-ascii?Q?sM+GNI9rj4KXTPmUTOWbWsXiAScTPhAmZMSAcwLYc8SabX4SkiFGY1oDJR27?=
 =?us-ascii?Q?b8mMa3JWVJLYS1T4Pt2veFd4Lnbw+uMORE314FUnFzvNOT38HqpW9YiGt+F5?=
 =?us-ascii?Q?MWRBKePIz9AfFMXYfsCokeaEVhhtBb0/vL6kt9ds2uQ75p9XAKOmHolZJSrw?=
 =?us-ascii?Q?pOsr9f+SsmSEghQg8S8RLRsfWLcSSBHVzE8fI/2+W8sQqD9ENj+ckDMTVsuG?=
 =?us-ascii?Q?iRv/xyq1Taz0yFW9Ri/26bWgiaYT5n4bE9NwgGbPlzPMgy5ScaHliTxeeNhV?=
 =?us-ascii?Q?o/+h7gXk1KSyNo28nSNeJsHu1QXqcRKfSpm6Cgpp0VTATjk5fUGIyDN+jxvF?=
 =?us-ascii?Q?66NjPj2Av6wDDa+YhBLn/kV/g62b3EPSmhP2dW/nL8xZxrF0+Lw0cwp8OX2s?=
 =?us-ascii?Q?bFGatArxVuHsf0mkeQtHDcTjIJmAleYhOn+rb5TQfGkEctoyhC1nzvZPpnL7?=
 =?us-ascii?Q?76QsrgcCdJSCzJqtC60KYZdLB2v1qYcptF6FF0B9p3+L5cqR6CT0O0XRDDtX?=
 =?us-ascii?Q?H1olK2dlMyFiQ8LCsnbT7YeVCnPRt78R8TVnJ4F3KuVcJ61prp35VLyAb6o1?=
 =?us-ascii?Q?OjnnT4qHWMPSUMgisakykk3TyIBrM9/HHaZ05J5l/0gPWZAhp5ikB4sZv2ru?=
 =?us-ascii?Q?sm5vgxvTGDbZeUr/Tw9gOcbf0tTSldiZU5lMwKfN3Thk2y05FVGwLWjA2tnl?=
 =?us-ascii?Q?4WOQSeDYegDfRkwtey9kYkQn+mPswGfz9PL838/aCRVm844o60zO5Y0hzfM5?=
 =?us-ascii?Q?bf1pDCGZQ3KyZEqsyPjHn6u40SYZFCXW9eHz7n+m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6339.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437a28ca-d641-4383-b7f7-08dc52f34d12
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 09:00:10.2760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bqeG/O1X1D9WDzrSkGntv8uTYAyOYoExjRTCtLP/YlL2tatUWtx1EmtzQEx+S+dHzTfNRjqUIpXGcqJBQHD9mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
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

> >
> > +             .alg.skcipher.op.do_one_request =3D tegra_aes_do_one_req,
> > +             .alg.skcipher.base =3D {
> > +                     .init =3D tegra_aes_cra_init,
> > +                     .exit =3D tegra_aes_cra_exit,
> > +                     .setkey =3D tegra_aes_setkey,
> > +                     .encrypt =3D tegra_aes_encrypt,
> > +                     .decrypt =3D tegra_aes_decrypt,
> > +                     .min_keysize =3D AES_MIN_KEY_SIZE,
> > +                     .max_keysize =3D AES_MAX_KEY_SIZE,
> > +                     .ivsize =3D AES_BLOCK_SIZE,
> > +                     .base =3D {
> > +                             .cra_name =3D "ofb(aes)",
> > +                             .cra_driver_name =3D "ofb-aes-tegra",
> > +                             .cra_priority =3D 500,
> > +                             .cra_flags =3D CRYPTO_ALG_TYPE_SKCIPHER |
> CRYPTO_ALG_ASYNC,
> > +                             .cra_blocksize =3D AES_BLOCK_SIZE,
> > +                             .cra_ctxsize =3D sizeof(struct tegra_aes_=
ctx),
> > +                             .cra_alignmask =3D 0xf,
> > +                             .cra_module =3D THIS_MODULE,
> > +                     },
> > +             }
> > +     }, {
>=20
> OFB no longer exists in the kernel.  Please remove all traces of it from =
your driver.

Okay. Will remove and post a new version.

>=20
> Also please ensure that yuor driver passes the extra fuzz tests.

Yes. It does pass the extra fuzz tests.


Regards,
Akhil
