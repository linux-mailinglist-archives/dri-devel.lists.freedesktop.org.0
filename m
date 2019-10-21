Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE385DF0BE
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 17:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B3B6E14C;
	Mon, 21 Oct 2019 15:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF0E6E14C;
 Mon, 21 Oct 2019 15:03:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE2UWIgTOUwONZhLYuijOdpOfgG/agmn6Ig5oyX3zq/knHQAXXcH25Cl6bvCZFIEdRUPAYS9yEFxu9fPHYX+rhWbyiF3bLJbuHjqNiaSQylWrqlE38OycNBiQ3Jxb1J45j7JNGGazBMMaqTJK9/DDCXjDypPMDSSklx4PvyV7aJX6I07TAYyWjt1UdNJcK4Rfwcfpc5kYuh3Ptq273BI/245PkkzK8fSq/TF6n3jnRzTeOfuoz+AaEepIuB+0msF8R87y/p0GaKOPWpqAfB0gUM200KyYxPcHmpzp8LUwoLfEQLQvCLkKsra81/O2i1GwUM/yO8lsGDjaPlixLnY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKmJ4wpX5ZyFbumc2ifmjqNnf9wJCU29SEpx72Ochtk=;
 b=PJg58D0KZ7lpi7QWlqipV4tL5Bc4e8mEzQXxkPXqgmkxmsFnZgWprvIO3VGex6vAocjc3sYQTQ5g4U0CkiDSA2vw8DBu7TO+W4vDO1jci+lQdAluonX3qDmOu9Ai1Vx2Z1bl7/sSpRrmOACALXYzjuz1/pXoNL8+2PfD8x7jEZejEgCBU/izojcA0KljcE9sLKR/1uG+pyf1E+uisKIu7uWPJYMrBd+iAsjUR/FVddpf+z8ge2mGz8OM3zuYgAB7aF53SzzY5S6O8HGZdAKu3rTThD23rneH/q2L120xKP9VcgoTpmgFhsPTqm5lwJBsxKCC0JugO31/wkS66bP87w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (52.132.180.155) by
 MW2PR12MB2396.namprd12.prod.outlook.com (52.132.180.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 21 Oct 2019 15:03:54 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::d8af:55c0:b8:fc1a]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::d8af:55c0:b8:fc1a%3]) with mapi id 15.20.2347.028; Mon, 21 Oct 2019
 15:03:54 +0000
From: "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Cornij, Nikola" <Nikola.Cornij@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Manasi Navare <manasi.d.navare@intel.com>,
 =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Rodrigo
 Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: [PATCH] drm: Fix DSC throughput mode 0 mask definition
Thread-Topic: [PATCH] drm: Fix DSC throughput mode 0 mask definition
Thread-Index: AQHViCDBGBjd4qRZ6EarWeAe3wdSvw==
Date: Mon, 21 Oct 2019 15:03:53 +0000
Message-ID: <20191021150345.igdye4kv35nsk4ox@outlook.office365.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::37) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abffdd11-83fe-4da3-0978-08d75637e38b
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MW2PR12MB2396:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR12MB23964DDF217A60185F7F7AD898690@MW2PR12MB2396.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(199004)(189003)(52116002)(6506007)(5660300002)(66446008)(486006)(305945005)(4326008)(6512007)(7736002)(316002)(476003)(81166006)(26005)(6436002)(81156014)(6486002)(110136005)(54906003)(8676002)(66946007)(64756008)(66556008)(66476007)(66616009)(186003)(14444005)(256004)(102836004)(386003)(99286004)(6116002)(71190400001)(71200400001)(14454004)(2906002)(99936001)(478600001)(86362001)(1076003)(66574012)(9686003)(66066001)(8936002)(25786009)(3846002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR12MB2396;
 H:MW2PR12MB2524.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JwLp9jPBuD24w50xucNpc2qGYh3TwzXjyfdY2wF+Pr9C3xukWLFbW1cPKdW93tHOAzsAmqfC2w1LTR/BImgLwvBjald0vIGVPthS0qwLjlw1HZjTG8GfiBHmcG7IZwPQQtJhDcJetUMAdVM6vtEqitoAshHkIEz0we+m1cYWh6MEwddED+50qc21y8wQA0oErv0h8mmXsBC5sz5cxNz1C84XQcGAWq3ZpSIPlNtzZj6I54v96/OaxNjLRdElqqIws+0p5aMsJ+JK7wXG8hISgzIJgqloqQp6Z20Me5eMSWoHrjHWPhg6M5Z0otlMOS9GDYjp0/PwRu5OgBCfAUVV7Oj5MszodH0/Qfx2XUjHf3VernOY3yFd05RnouiCsD1Qqu+GghY1yqn38xUh1SF54Jg58TaJRf0HTFd/zCSehHQ=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abffdd11-83fe-4da3-0978-08d75637e38b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 15:03:53.9143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ObGiSz5F+1JEFDZ2K28U7b6M/hMn8jw3AttynPuZS3I4xUdJkZ6/NOK/YDNGOrlBvU7vF2q/rY8x8oSukZ0fvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2396
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKmJ4wpX5ZyFbumc2ifmjqNnf9wJCU29SEpx72Ochtk=;
 b=yeIYHWEEWa1Ffe4fi83tuBdz2dG7DvJUcboI3DZIUv8lBIvYxmKl7RiRHIngM2PBW55TT1ogrQGRAp9NpZPq53zybrFmPLFZN33AyavMIlQlohEzY5aT4BlbwANOVT+hKJwVGNnFXOd+rEZzDh2uDg1ijB/XbyDQCnlDWxOw9ig=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Rodrigo.Siqueira@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1260489781=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1260489781==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3lsl3gfam5s22oo"

--y3lsl3gfam5s22oo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Commit d7cd0e05 introduced a change at DP_DSC_THROUGHPUT_MODE_0_170
which is not aligned with the spec. This commit replace 15 << 4 by
15 << 0 for DP_DSC_THROUGHPUT_MODE_0_170 in order to make it follow the
specification.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nikola Cornij <nikola.cornij@amd.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
Fixes: d7cd0e053b1 (drm/amd/display: Add 170Mpix/sec DSC throughput support)
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 include/drm/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index cfadeeef8492..52024049c59e 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -306,7 +306,7 @@
 # define DP_DSC_THROUGHPUT_MODE_0_900       (12 << 0)
 # define DP_DSC_THROUGHPUT_MODE_0_950       (13 << 0)
 # define DP_DSC_THROUGHPUT_MODE_0_1000      (14 << 0)
-# define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 4)
+# define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 0) /* 1.4a */
 # define DP_DSC_THROUGHPUT_MODE_1_MASK      (0xf << 4)
 # define DP_DSC_THROUGHPUT_MODE_1_SHIFT     4
 # define DP_DSC_THROUGHPUT_MODE_1_UPSUPPORTED 0
--=20
2.23.0

--y3lsl3gfam5s22oo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2tyNEACgkQWJzP/com
vP+7wA//cJA8A/GTTnrSIvANq6DelaHl5FiGoVqMsqRuDQ7RoM4/s35wzkbUzvkk
5MHuMxuYCH4DN824/ZZ4hwahyjuojTSZZj++/olO3UbzOFoT9DmlpUUZ/74H5eCp
pP5f/r2snJQkA/++RK0R2vW7NvkGcnjSbl2S0SIYlC7FWhq86pur4y3KkRFJQs1O
LPL98M2q4uR7L4a80InBT786ZjlyAy2rEQAMHjc1/to20EE7/ZZwTS4ESZaHm3Os
QWsA6Lm2bYxtusgi2hG8FQvLRWQEeNYAM5/VOGFrIPP9Oa0cyaXreRfp/iBzW304
aTYA8uRnEs3Gc9kdUeCWkYi7YZ6m8X9zaWlNmMd1KZph6EyJfZZxFW9lCvLnuYdm
AmO0FjCidw5Ws41EGQDPtd5BtMDXtuaE5OG129keR67E8G0vbS/a5cuYwTJ94ORW
lyrcZNhDFx2dhwaZdh0BpDGgddKtEX18ZWlk7zPFkAUzczBzAlNX2VDRL2pez9tJ
3+fzN3VZGdW2xdgecq87h5iYb8+XydhdFbU8J3YJTfiuyboEYoRvtxoBBzzZ+C6t
gnJ8uFsVCeUoJaexOIgrVLwXJ0Hs3uXt6XWqglGho0nsNMbDzyTlHqTddaBfSf13
WiTB74/T/8Q9X7oaIKyGOL+yTFyUZ66pVPdedlrbK88P/9Rawa8=
=0dLe
-----END PGP SIGNATURE-----

--y3lsl3gfam5s22oo--

--===============1260489781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1260489781==--
