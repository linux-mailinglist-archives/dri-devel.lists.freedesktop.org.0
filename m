Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4B9178BB0
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39B6D6EAC8;
	Wed,  4 Mar 2020 07:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980806E8A3
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 13:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HpONZZZ8u3w9g5kH8dckxSDzIAAlGZ7lLUtiFziR+wJji12OWChtEZZ/vjTHz7gG4GYU0QZHbehd/Oz/DcFSUURomWqsp4nngLYnl0TiLD2D14tENqeD1F6T6g7SO2yfxMFpkQgIMv06jKsSSRljh0/HCiU8TtEgp2VaoW/gUg5Y5fwseBSNdzJmEwsxAIpnzHtDUvr5cn7SgLSSVJGXpKqMPjyNeL9zdmffrEtaZkURbO67apzFuhW7fvnx5JuS+Om9n5TqeoBOAvCV1G4dfvy98niCYb+XS+sF0TKHH0UHySBbhn+KrlcKUFpXZaJ4HEDgrTMlCDp/tO216HOyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRmo6Ffq6IZjA0xFjPqMenqJbxrCd3GT41s/wHGz+qA=;
 b=aWzdbwPhfrkBgK7iGjLQvHW/vty5jHjRLjMJ2MMYFyaDIJ66DR2lsuvrxUS0RgwSKbnPicrX5z0by8jNCGTkmKU9JzeexS8z0jQwdgbu0NuesjyLdAUh2lN5PjfX65fWVYpEfwJvv6b9KIuUzxW9nmoCMImOXvDQS4BiMOhOYZUBsWkKCGyb78C8div1sD0ryyyHllqr3ukpsX4MCFeY4x6Vp4fR5ey/MPNNWuFs8itso4t8pTXYB5Jrm0/bJyPQJpfUnQku3JN1Q/TqVCdxhv9zdQ0FCa7hC3v+0aIGZXtVD5orpinU3E7ve13rzff7kSqkGQ46Xb0BI7dOvpmlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRmo6Ffq6IZjA0xFjPqMenqJbxrCd3GT41s/wHGz+qA=;
 b=ZN3DH8QI+X1vnZCrag/uG7UOY4cz/gi8bkhKCyX2xX5ia0KiYVy3NCyaI8ZGI2cx6mHzhdUUSJA7YXdhOIXeSaurxuddnm4+Mptk4zU39dzA6Rn2xA9plT8RrTWojiCDuYJSDzChSmeFaQ1MkZbNqxDQEfnVTEXuJufhTAQqoKI=
Received: from BYAPR02MB5382.namprd02.prod.outlook.com (2603:10b6:a03:9d::23)
 by BYAPR02MB4839.namprd02.prod.outlook.com (2603:10b6:a03:51::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.18; Tue, 3 Mar
 2020 13:11:56 +0000
Received: from BYAPR02MB5382.namprd02.prod.outlook.com
 ([fe80::a466:fa93:8bc5:8ee6]) by BYAPR02MB5382.namprd02.prod.outlook.com
 ([fe80::a466:fa93:8bc5:8ee6%6]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 13:11:56 +0000
From: Devarsh Thakkar <DEVARSHT@xilinx.com>
To: Rohit Visavalia <RVISAVAL@xilinx.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "imirkin@alum.mit.edu"
 <imirkin@alum.mit.edu>, "emil.velikov@collabora.com"
 <emil.velikov@collabora.com>, =?iso-8859-1?Q?Ville_Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Topic: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
Thread-Index: AQHV679WQkeNaKVZxEqHWeaYqd47Jaguu5cAgAgmTQA=
Date: Tue, 3 Mar 2020 13:11:55 +0000
Message-ID: <BYAPR02MB5382500BD847244DC731B454BCE40@BYAPR02MB5382.namprd02.prod.outlook.com>
References: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
 <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: imirkin@alum.mit.edu, emil.velikov@collabora.com,
 ville.syrjala@linux.intel.com
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=DEVARSHT@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b6af977-06c6-4cae-19f1-08d7bf7472db
x-ms-traffictypediagnostic: BYAPR02MB4839:|BYAPR02MB4839:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4839F112EE8564DBF5464408BCE40@BYAPR02MB4839.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 03319F6FEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(189003)(199004)(110136005)(54906003)(478600001)(5660300002)(4326008)(8676002)(8936002)(66574012)(7696005)(81156014)(81166006)(186003)(107886003)(76116006)(53546011)(6506007)(55016002)(9686003)(33656002)(66946007)(71200400001)(66446008)(66556008)(86362001)(316002)(26005)(52536014)(64756008)(2906002)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4839;
 H:BYAPR02MB5382.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l/d1Ipn9rIsjmk61dVx3BEs3WaUMENYdsH0J7leXoGBNexbgxv4DAIYPrheRuFSeoOB2grdlqVVT0gfO40LbYY34vgmwutzXFSZz2nIndx0FREESyivPhRKlMM81AmAP1U2vYnG7/0pxJqauFJ6wwHIhlAtWJJ4gVaLFPP7tWKbjgocPdWGKp66B1Z1TNugI4uSxEDTTYZoboIoxeK8XksNgQauTY3BQg6l11h6Lh+iSpYkVLNGLM0gmR/BO184polbCtfbsGwFp7XnPlsTqLuV+rFM5jOUZkBWcEgGt2UqZ1E340bKmKXlPzZJYGPmWfrALw0pXSU/Na+chAT0J8bpCA5ZgZj8rYXa56LC8kJLRWFTuriML835Fk90EjRsFrMgec09ODQxV2IRdotTL+hn/RDhRe4GG94h9zLqtxrbfXz5TwuX+H1mnUv9lq/dW
x-ms-exchange-antispam-messagedata: XOowjLFcJ1o9dXjFbdnWdhXTQy6B9IxH7bw+HMrQg+j081L5p91V7u9P5G9TT1Yx4MijshwUOH7lF/PFP/JaApTNsjeaGk917wDvjFz8nJ08y4KiAQjUsIbBQSYcyDqK7Jv/vG7KddvQTeMymwaIbg==
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6af977-06c6-4cae-19f1-08d7bf7472db
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2020 13:11:55.7639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 40AOnaGaOlFKMpp6KsshCmOw4Y84QW6WG/d1P0Q2uyYNp8tsfwodg4Eu0IkTLgmCgvYsqKPR7jKGcEPEGj2u4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4839
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
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
Cc: Ranganathan Sk <rsk@xilinx.com>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Dhaval Rajeshbhai Shah <dshah@xilinx.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rohit,

This makes sense to me as gamma was implemented as optional property.
Reviewed-By: "Devarsh Thakkar <devarsh.thakkar@xilinx.com>"

@emil.velikov@collabora.com, @imirkin@alum.mit.edu, @Ville Syrj=E4l=E4, Cou=
ld you please ack and help merge this patch if it also look good to you ?

Regards,
Devarsh

> -----Original Message-----
> From: Rohit Visavalia
> Sent: 27 February 2020 00:40
> To: Rohit Visavalia <RVISAVAL@xilinx.com>; dri-devel@lists.freedesktop.or=
g;
> imirkin@alum.mit.edu; emil.velikov@collabora.com
> Cc: Hyun Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>; Dhaval
> Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> <VARUNKUM@xilinx.com>; Devarsh Thakkar <DEVARSHT@xilinx.com>
> Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
> add_property_optional returns true
> =

> Gentle reminder.
> =

> + Ilia Mirkin, +Emil Velikov.
> =

> Thanks & Regards,
> Rohit
> =

> > -----Original Message-----
> > From: Rohit Visavalia [mailto:rohit.visavalia@xilinx.com]
> > Sent: Tuesday, February 25, 2020 3:08 PM
> > To: dri-devel@lists.freedesktop.org
> > Cc: Hyun Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>;
> > Dhaval Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> > <VARUNKUM@xilinx.com>; Devarsh Thakkar <DEVARSHT@xilinx.com>; Rohit
> > Visavalia <RVISAVAL@xilinx.com>
> > Subject: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
> > add_property_optional returns true
> >
> > gamma is a optional property then also it prints error message, so set
> > gamma only if add_property_optional() returns true.
> >
> > Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> > ---
> >  tests/modetest/modetest.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.c
> > index b907ab3..379b9ea 100644
> > --- a/tests/modetest/modetest.c
> > +++ b/tests/modetest/modetest.c
> > @@ -1138,7 +1138,7 @@ static void set_gamma(struct device *dev,
> > unsigned crtc_id, unsigned fourcc)
> >
> >  	add_property_optional(dev, crtc_id, "DEGAMMA_LUT", 0);
> >  	add_property_optional(dev, crtc_id, "CTM", 0);
> > -	if (!add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
> > +	if (add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)) {
> >  		uint16_t r[256], g[256], b[256];
> >
> >  		for (i =3D 0; i < 256; i++) {
> > --
> > 2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
