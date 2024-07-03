Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A76B9262C3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 16:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9799410E86F;
	Wed,  3 Jul 2024 14:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=LIVE.CA header.i=@LIVE.CA header.b="C/dmE8Fh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02olkn2062.outbound.protection.outlook.com [40.92.15.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC1D10E86F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 14:01:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9RThZAu40ZJnZE38WDynnexAzw0+Cz+blTg2nUrgUGTWRp6fHBt6Gc4DLncUkVk8+7Ov8JykSw+vfxA56kFrrR2aM0BcKXAjn5OHYqrZBhGwpD1+4+1YMdUdqgCg2wZxj4I6TcZEJYpgMS/JFwA3p3VaDZCSPxMo0DqjTBfB6FgZf+UMfB1JalDTby6kAfQllZD26xBwYt7TF5NMNTHgBcLFjJdI/51M84XzT1FOy+xbR4U72+saEIh5H92OlAyaixugvuS23VTYN56dYDn6EAPamndRndsnoAGgmHoLtvI1KYBtnqUiuSnhFf7SADJZkZ0Qvjs+1hMaIKdTD5keg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNOkO0NQs9MANFj4dNm1HAwi3JXRAUiQokCPThMAUH8=;
 b=JkNdDAjHLxw7k/UZLyyc5hu/XjiPQHjnKpLyIxFzKOWD1bqF5eGlHRpmX0u7gUdmkXDUAh9JcBppdEuiFmuKQvbJoxsG4bVz2RoY/g8GhKxrrj8xg7cTcH3uhL9uNOqEdFxeOwURhyHPXaRifhJkKW6LgOP1twSkx3Q1Lxe9Y0EnB1musF8QIOefeLdrcHFrUBjp5uvhIG9yaGqJ2hRHDFiMW8ngze8CO7o+8g4XP3VzH1OqhYrqVtyNZ3kocVoWZOPf0BdFaTBGbPTA2guYPhKtZ/IELv29kpTxMai7pCBxVcjjuSRBFg7YiLw2ZBFfC/HDSrIwG94uKHpOjzxMFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.CA; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNOkO0NQs9MANFj4dNm1HAwi3JXRAUiQokCPThMAUH8=;
 b=C/dmE8Fhoy/PrUCAY1cMKqoiT5XA4T7lR0aJ8PR/esb5dONgK1axskAwAvvnPIclv7Twlrh9HchH8tQ1wz7GOT2Jg1flMLNe4qFvzD/gLkxuZoXm8bCXwQSceKQtrbDJNk4FnOoi+U4wZopl8N+IZPLVTwKZOaO0x2KoQXwa64ATgX0VLXJS1sqPBPBtUt/CKmE0VUxtR9JaRueUa0vLKi0YBoxyvXW0k8p0SrgBJvl8y2OX5F0s0d/J4bDxwxb4dFkBPQuuOIIlIlRiCtNmMKNVjE8UmatIwv5kOpShCqzDPyYBNwDgjm7PomaW3ktdbWAayNyblLH2QKmkIvL4xA==
Received: from DM6PR02MB4283.namprd02.prod.outlook.com (2603:10b6:5:26::12) by
 SA2PR02MB7562.namprd02.prod.outlook.com (2603:10b6:806:147::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 14:01:17 +0000
Received: from DM6PR02MB4283.namprd02.prod.outlook.com
 ([fe80::881b:c465:e9da:daee]) by DM6PR02MB4283.namprd02.prod.outlook.com
 ([fe80::881b:c465:e9da:daee%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 14:01:17 +0000
From: Josh Simonot <jsimonot@live.ca>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: virtio_gpu_cmd_resource_flush
Thread-Topic: virtio_gpu_cmd_resource_flush
Thread-Index: AQHazMZcnNAp4heC1U+vtLtmW636ALHlCRMt
Date: Wed, 3 Jul 2024 14:01:17 +0000
Message-ID: <DM6PR02MB4283010B4A4CE521B1050042C7DD2@DM6PR02MB4283.namprd02.prod.outlook.com>
References: <DM6PR02MB4283EC97FB486C9E9357D3F0C7DC2@DM6PR02MB4283.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB4283EC97FB486C9E9357D3F0C7DC2@DM6PR02MB4283.namprd02.prod.outlook.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [yrTM269Mzmnlu01dLYcNW5/fDmCYByCg]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR02MB4283:EE_|SA2PR02MB7562:EE_
x-ms-office365-filtering-correlation-id: e5284c79-ba6b-43ea-ce4e-08dc9b689bb5
x-ms-exchange-slblob-mailprops: Vs63Iqe4sQmRZ8qlr/ycpgAEOPKg7MYldUaLSXqBA0e6eMTbre4d5LlvH4kz/q1E38ayQczfy9hR7nwmRBoC3r8Qmdd93qQ3MR9pwbf1G+I2CMomfJmjy9LIyrtZ2RaKlmgyxQcoSmJcUBrrEzboMysTE3kyHbjakuKEsaWUp3QGhRP6Lpo/ScOc3okpMB3Sx548J1gGm+v+/LbXwQ0vOYSxKblhCMM6BZB28FqCWX4sTr+ySS4m87IDT4ZiDTD487SG0Hb7hHtUth2nWRWjtoLZdZDE0uP2RWTYDnFRn/ukkkwcfZfykNgw7gq06Y+yGuHEcQKg0A9hgqUPJAwxjU+TlphDE//t65RWzTinLvcNvHmiEFZ3ir3cgQjr/YNi54nIG2X9QetUtnXyao1djwVIGTaAWJKPDhktNQ6iYEoJqUns4f975gwB6gJwAUVRggMjdRViZ0QF4BRtvosvACbdiY93DcTY8BdFn8WIY+UAbTYi9STRmDb9q21uqpLSCbqLmfdWG2rEqwU1JOw/DSszZxq9tqDtZ22cArFgGHdG0T9g5GX024a5CHve/Odsd3cyECy2+5elnOjTLeXNn9FB3Shz2B3EOrWahnEedfY/7CXFf2vER8RpvgCOTAu0otrKi8m3y/JqRZGzgeP1hy0JPOC1TsURJFH9T17OLIL2IoT/oQy6JcY8zxaIaXcUg23RPjLJzTGA5uGd5dWLKJlaYlE17Z275tNISF9QmbU=
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8060799006|102099032|3412199025|440099028; 
x-microsoft-antispam-message-info: e4dZ+yJj6dTrwPJIeaY/LFIjbwLKx0kdcQqxivV3pT60omnAh+KvqHX1dDO0g0pV6VBSHE8bHPzIM244bMZuXV2I4Qr7Zj6XbKkYg7QdcqroYFP7CLq6WPpc+OhNhR/3Ptltkqiz2orwPZ/5CXMHvFHYCgC+Ir5W8Ee0Xh5ymW7hlJoj3xLUDIsoCGJzsNNMpMSpUoe1x6QXpRcLpEUviXvHFb8SW6X5wC3nR+0g9KJh0H9Re593pWc4kESJoi96gwwhrrWCMQ+nzI9Mfl5zSj6oE+HdlrhiqQjb6Pa4vyac9BekoPxPEqD7gg31NN8lKbuvEGfyc76t2joRjl+sSgui/wvy9roOhZu27Fp17yfse6iym6pC1JHsesBMP/cAnR7jbVV58A5FWH6+5LPj9P1L4CRzar5F93ZOJiMw7UU5d36aYe2pdBwYkJru62bDknFJaY8H2ivUsGgzYdAkwicnkevX3nNYr7bXaF9fbVMAfmCX30++9vXcbdMuEOISU+nFUaACIXXpelfPNSaSqK8QuWvgbQYkTf29pY0bFUCnzi/rr/rsKs8jLMDgi8RVzBu+NaisHAOf8Skvmg3nrHUtn2pNyfqgcxMaCqwuJpKkQ5rtNSU1WsuNGWpNDWO/
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fG4pJV9Q8kzmuuoDGfdM7d9kS7wn51Mq+jK+YV5rJCPJ3ZhJT0wTQ/nf8V?=
 =?iso-8859-1?Q?szBscO3UHQGxWorZk/4pwT8Plueu20SctX4rpRDUqxEst+GjfH2W7wUFDk?=
 =?iso-8859-1?Q?CuJOhqQdpmvLNjPYiinCnP2D+sK+hp6yySBEp+E+QwGjQ41+eHPKCH69km?=
 =?iso-8859-1?Q?5CuMf6hlKJVvjOfdmPRSNyZxlkBIvCWvxaTMvS77HQjzjljpUEGHFN2VZk?=
 =?iso-8859-1?Q?+37ICLtWg8gWKQHTjjmn0vs3hLYxijWaZAe5ASKxUD5aJ4DePAReNKMTEd?=
 =?iso-8859-1?Q?cnHz/Y5U0kUDs2TcjY6sFpD4p8YHPLqXOYOZ11Bm3B5uLKagNWnoEEj8+C?=
 =?iso-8859-1?Q?qFWPd79jdOCsEOwBaVeeGY+rJuv1efJROOPlndusdxNaTV2GcFaxCr5xOj?=
 =?iso-8859-1?Q?3dZj6FEFLUKhw6nSpyPoGgRjh0/+0BMcKYFfv0XzaB3TQSlvnE8VHV/ztT?=
 =?iso-8859-1?Q?Cb4ldT11XIXHZGvYGVNgrNp6iyPZfC9sSKtxWYYSzDNXkzLINPn/XpZIte?=
 =?iso-8859-1?Q?rH+i+p0rCF8liowIVSufgogZehI7OHmGdadI9flYBrXcNxmpzbtNYb34CZ?=
 =?iso-8859-1?Q?pD0JyrUWhfqzVpCYaBWwmG2OlgBmYKVDClIEwToDPfW8TN46a1M9tLZd4G?=
 =?iso-8859-1?Q?2VVSUSZm7+Fu7W+Btz5ooCR8c/tbRXtYPlHAI3BnZLC91dIHOtPwCS0dvw?=
 =?iso-8859-1?Q?qDpwuHAzardvbj3vM0lhT6+T0ttHrm1T0HxZgbAbLMunBaEYTgqCYPISX4?=
 =?iso-8859-1?Q?6jiCkE1cPCaS3mqQBKUXqidspI4JnxcmFTg57tCh7sSEQCTpOyK8oFwGgR?=
 =?iso-8859-1?Q?sqo5Yw7ywYnQiLrb2HYyRT1K42HjSei7UJ83F1oXYyDwwWyIQghD7vzRdy?=
 =?iso-8859-1?Q?CQPG7xG810JBLX6+81UlDWgyDp08n4miRlgpjZ5JhXVOQfPh76gPagegrV?=
 =?iso-8859-1?Q?Okz3g56Uvas9sD7xmZsuhC8jW3h0oMzrRBAeHHR8DV96jaAAEuxQ+1iQap?=
 =?iso-8859-1?Q?xg0MtvcCykrvpTmsW8aOGECo1Goppgy9/gEbs3g9aVjHJgzLN76qebHdxC?=
 =?iso-8859-1?Q?n4eDalhyS900sMbor0z2CpWrxrswBjJLVA4+KpmHHg0XUbKClNaIGSVKB8?=
 =?iso-8859-1?Q?Kw/JlZ0KR2O7snT0pkpoBIb/xV5lj6OhA8PF8yuZNl76aY7WiOIHDW0DzR?=
 =?iso-8859-1?Q?rftZVJXr1/aQ6tGs8w0bT2VpOV5mWqsaRs95iuRHt2qj/mDVK8uM4ja0cg?=
 =?iso-8859-1?Q?4SKplw2sZMkpye0lNzdw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR02MB4283010B4A4CE521B1050042C7DD2DM6PR02MB4283namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-0f88b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4283.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e5284c79-ba6b-43ea-ce4e-08dc9b689bb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 14:01:17.0707 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7562
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

--_000_DM6PR02MB4283010B4A4CE521B1050042C7DD2DM6PR02MB4283namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It looks like the virtio-gpu flush should be fenced, but on the host side t=
he received flush cmd doesn't have the fence flag set, and no fence_id.  So=
, I have to reply right away instead of waiting for scanout to complete.  I=
s that expected?  then what's the right way to vsync the guest?

At the moment, I'm queueing up the resources for scanout, but guest is flus=
hing faster than host vsync.  I briefly looked at qemu implementation, but =
don't understand it yet.  A high level breakdown of what should be happenin=
g would be extremely helpful!

Thanks,
Josh


--_000_DM6PR02MB4283010B4A4CE521B1050042C7DD2DM6PR02MB4283namp_
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
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);">
It looks like the virtio-gpu flush should be fenced, but on the host side t=
he received flush cmd doesn't have the fence flag set, and no fence_id.&nbs=
p; So, I have to reply right away instead of waiting for scanout to complet=
e.&nbsp; Is that expected?&nbsp; then what's the
 right way to vsync the guest?</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">
At the moment, I'm queueing up the resources for scanout, but guest is flus=
hing faster than host vsync.&nbsp; I briefly looked at qemu implementation,=
 but don't understand it yet.&nbsp; A high level breakdown of what should b=
e happening would be extremely helpful!</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">
<br>
</div>
<div style=3D"direction: ltr; text-align: left; text-indent: 0px; margin: 0=
px; font-family: Calibri, Helvetica, sans-serif; font-size: 12pt; color: rg=
b(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);">
Josh</div>
<div class=3D"elementToProof" style=3D"direction: ltr; text-align: left; te=
xt-indent: 0px; margin: 0px; font-family: Calibri, Helvetica, sans-serif; f=
ont-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_DM6PR02MB4283010B4A4CE521B1050042C7DD2DM6PR02MB4283namp_--
