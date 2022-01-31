Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0584A3C82
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 03:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE5010E388;
	Mon, 31 Jan 2022 02:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2051.outbound.protection.outlook.com [40.107.236.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186F610E2B4;
 Mon, 31 Jan 2022 02:01:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxCNaPN1uTtRhF26czjZGX9NIQ+gjNWulol0ArcABb78t1Kr3HDtAlC+L0snFsYPDO2Osts7nwhPdyATdBGQD26jO4J5hk6h06iuCNomv3UAJqafvTRnOgXbJIRTbc8gDDzuJhgF/YyCP8sAUOB4PIyZ22CXQ5It40It9wI5Cadfm/KxL2loYlT0MKNLgJZzwRvRRG6574KsAC4Tqv9UAw7yz8Pxw2nyZx8qaSPTV++8BFWjvOhMuBgB6yQ4oED+p6XQHnc2QfgmV15SggcUJZtg2lI/xw4M6+dVDH8dUgpZFXqLxEa+DamK1icQ4YyYkARjIgrlzLswEOWVwlX3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jagXLBPwjKvEcZKEl3peU03Wm2oUCUpMejjx5Mp57mc=;
 b=Mm95f9A+ZS/O1KlrVViV1A2Gywz/7OV0tsztMDxF8aNUfCIuZcmMapqkNwc6YE0194EEDRsQaDSYbyunWQtTJOUNDOG3qiE5tUZ7EdmRUy1+zUAPsarFL4ZjKNsPSdEsNj9tjGSxo1gIA+bcPaA0x3WGjbW39jr3w6B+jpCMKs/iSd6jCUyoG81Bb0AcyfpiNPjNJXu25kLYiqeWFeo6ysqF4iC1WQ5LjIULjJ9uxNqI99dnvNnWu4M3+yGDpAFkHAGEbc4JnDh5GcE0KEG0Oksnn2QJNYDkRCk22aGSwY6mojkzDSWmSMTS0dDPj1jzWZjmu4z2FyzGXSgcAHpYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jagXLBPwjKvEcZKEl3peU03Wm2oUCUpMejjx5Mp57mc=;
 b=YF327xZYFMcfMzp3HHfb0wVRpXgIvxB68+psfqlSAj8QTB/druy/CVsjxGPX/OZEiV/fD4ppB9omldD2/0Yujktk2Zb+/aC2wF1rr0ee1fyp8PF0fkFALvtIXenk00sQVKIq/Pe7r8VaqAkA1d07xg7mPtQgiCfe+eYBEJ19F9k=
Received: from BYAPR12MB4614.namprd12.prod.outlook.com (2603:10b6:a03:a6::22)
 by DM5PR12MB1292.namprd12.prod.outlook.com (2603:10b6:3:73::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.18; Mon, 31 Jan 2022 02:01:17 +0000
Received: from BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636]) by BYAPR12MB4614.namprd12.prod.outlook.com
 ([fe80::d0d1:eba5:5729:c636%4]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 02:01:17 +0000
From: "Lazar, Lijo" <Lijo.Lazar@amd.com>
To: "trix@redhat.com" <trix@redhat.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "nathan@kernel.org" <nathan@kernel.org>, 
 "ndesaulniers@google.com" <ndesaulniers@google.com>, "Zhou, Peng Ju"
 <PengJu.Zhou@amd.com>, "Li, Candice" <Candice.Li@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Clements, John" <John.Clements@amd.com>, "Chen,
 JingWen" <JingWen.Chen2@amd.com>, "Zhang, Bokun" <Bokun.Zhang@amd.com>,
 "Skvortsov, Victor" <Victor.Skvortsov@amd.com>, "bernard@vivo.com"
 <bernard@vivo.com>
Subject: Re: [PATCH] drm/amdgpu: initialize reg_access_ctrl
Thread-Topic: [PATCH] drm/amdgpu: initialize reg_access_ctrl
Thread-Index: AQHYFSAT9mOFR7fU50awMUb87snu6Kx8Yi/9
Date: Mon, 31 Jan 2022 02:01:17 +0000
Message-ID: <BYAPR12MB461493A03B9D4DCFF01F677D97259@BYAPR12MB4614.namprd12.prod.outlook.com>
References: <20220129145347.1417849-1-trix@redhat.com>
In-Reply-To: <20220129145347.1417849-1-trix@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=True;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-01-31T02:00:04.3618338Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ea405576-c65e-4994-19e8-08d9e45d91a7
x-ms-traffictypediagnostic: DM5PR12MB1292:EE_
x-microsoft-antispam-prvs: <DM5PR12MB1292C8304E81CF914E0FF19397259@DM5PR12MB1292.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nyHlsGUR42wg261nmOq1MngS3I3lL2DAcvcPIUBz64U/n6Sx9mDOkmHsP69wGYgv+Khz74urMF8rK4d/czaFuNWE3KA0kDJbuFhSZZhdRvMbsI83N5Vf2aiGrTjx1dIrG15xwhtbOtb9OF0AoXidceO9B/ZoruqGfuTxbHsM0pUawh0PCVuq69t9lHH6Q+h3QCppJG/q2eKYO8NLRP5NNc71dDEj2Lx8Vnjv5HcJg9W8AUJO2BFHst/aYzskWctWKjF7v+OtcHFMmjSDq1rj9MQmLB2RtDUa5c27xLSxenh8cJbFhfTa+m45kTFx71zHNGV9/Eyx3EUkQNpLF5MTqik05OBeq3I2IWK1RqzXu8OmOsuBijeiG+edllFJjxrdZvVQ5YWEbwTc8Y3YP1mifcQfBO6gKhndGUJbXXx7mnlUhQ+r3sf+Zow7zlvKUG5Kdiz79fEOH3QA4f/y2GKE6uqxzKzh1ulq2C9qsgTwcE2MVZjDIjhpXkZz18ZH0GZjoCY6JDV9zG0Oyp7HNoD0kXkJaSuSQk8tlrSgTW9+AdLG2urWkay4BhOGsTyaqT87l0IC22j7W9vuangTFNwJheFOaPXYwi1DB99yxb8JNClV8m11PPBmFrs0mabh7lU8I39GGJ3JJcIsvoCBoSMCbQjL0znAu1UTw2htw0q/c4SCAhy8DN4wGJ+8genAWMZjJ96vwBUkOCrFqhnCH/MVuMgFfV6Qz990SPUS/YW/jEyi0x5p1VE3iE77SfCpq58oL/MG2dNXZaeZZ04NLMl+OpzzORufAegcFtJNdInQh85bbvYkKEkg3UjdyqBsV18s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB4614.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(9686003)(55016003)(26005)(186003)(86362001)(966005)(7696005)(33656002)(508600001)(6506007)(166002)(558084003)(122000001)(21615005)(2906002)(91956017)(71200400001)(64756008)(4326008)(66946007)(66556008)(66476007)(66446008)(8676002)(8936002)(76116006)(5660300002)(7416002)(38100700002)(52536014)(38070700005)(316002)(921005)(110136005)(54906003)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qKwhDbo4Vif0XSd/mGS8ntvmaa21smMD9RXOOIZGXnacX7XAdoZ4VQVKhX/P?=
 =?us-ascii?Q?LdTgdvSdpAgcbIlKHPswWOqzMFRrIuVsoiWm1dGqCGfxsoTXrQOJparoER8I?=
 =?us-ascii?Q?Dk/HHExgGcsk7qpv842jpQc+C/fUhbxNf21G4flh+YPkSTEJtsNKvvXk+0rr?=
 =?us-ascii?Q?zYoLWcXRz5GlaUP1BFMDUa5zdkY/ws6IZD5Y/4UD+l1Tp0HNRdp4q+DaJkuF?=
 =?us-ascii?Q?JA6MxEPlwca9+X+PNzkXNt20n9pqAVv6HPovke2WRAgpc1rA17HQqQZVugYa?=
 =?us-ascii?Q?Yrjb3Ag1KRfEOgfCGEwpC5zkbEKEkvPJAByXISMgrvpl3fD6/CmYkjpg2Uhy?=
 =?us-ascii?Q?ij3HaZkjf7KnN7xI2eQkPNzjC3NX7sGno/V0nHSjvC3BD/i3ce6iCu/7aHtO?=
 =?us-ascii?Q?1KjCGMb7xwR5aIxLYQHNWFHnkz0NKe9cuPnh56bsXYVB3HDL3qwi28xOmkAf?=
 =?us-ascii?Q?ESAjW+lFaPuEy2jB1n26CuF0rxb/D5nmWNCQaGYbJN1hw3D7M5dMQ+BCOnmb?=
 =?us-ascii?Q?bUv3bErT07qMzZurseqrF79jgn0CTkUHgbTVDCay3JQ69L2iNJpV1ULK6koe?=
 =?us-ascii?Q?OOC9mHQu47KQNPZIKxeVAfbeKS1IlTK+4wxhhtINZoZUiZ85yj06oEaskXTE?=
 =?us-ascii?Q?TCNMbB2XRqBRsXcQ7sB9jAq4uVAhQi6j3VirathBU7//nN7n2tgOEVJsAA9a?=
 =?us-ascii?Q?lRIbdr0YtUhV+IVf5wJ0G2EPsu9ULUdycySKENax6GgD4009g8V5Pw1NXWHR?=
 =?us-ascii?Q?ge4R+suf+1c+F7+s8+9STA4RuDytpP37dCT7JN89e8Y+F47fXG7bOWxc9s2P?=
 =?us-ascii?Q?z7rX9+I/FkG7Efqs5I4raJQzEoA7fgzqBzStMDUIB4mjIna1RMsWvHYNPRLZ?=
 =?us-ascii?Q?JQqBzXgiQaemibBxgLdVrvJkSHa1iT4iXwRzOUC8KXlOcxtWNXLUL3uwGSwp?=
 =?us-ascii?Q?YlOONK1HWvUcIiDg3cokEHsFccJdiZwfN2fOGX4GXLeNuQayWnuYJoqi3mhJ?=
 =?us-ascii?Q?/Cr3Gw/enrG/G04U1E9RsdmtT0vI/lRD+4pIQpQVdRpgW4ug4a9P+2hS99RW?=
 =?us-ascii?Q?8q/USUx5AXQ5WvL26c68Jbv6JzA8d7yKQmxwfZtcvl/2hy4u8UA4E2Ms5/w9?=
 =?us-ascii?Q?P83vy3JMXQIfV+g3/VYT5crHDlUREjN/IVIkSKZUJE88fY3ooLLf3pMu+q3p?=
 =?us-ascii?Q?lAvVusgK+MxbXnF8UX3h3y4OzW8ARfRDrwC6p7btiU7dspaUX5Cm8gkSLniE?=
 =?us-ascii?Q?rg0rz+LtguTpWvWyrnJIo/NzVQLrNIvGmYlkH/uE52IjGzyGPkJYKJ0AqK+A?=
 =?us-ascii?Q?L3BIJ9EljPeJQPCiNI3mqKYM8PoxQ+NDFW85ZTHzdZlI2B8dO/L0FDgX4JBy?=
 =?us-ascii?Q?pF9I5L89ornsuhDzVCXQ36ExsnKySFWJwTSkk/0jpNU291YtQA3GecWIE7Ix?=
 =?us-ascii?Q?5XhcWpnuLxKK07C7qiGolm1cA6pztuRFOmdKOOD1SJvJWQj0C6gn83tfHTd+?=
 =?us-ascii?Q?HcgB6QuN2PGCIxW5gHMelV3eJCQ3PXVc0S60xr32ggpobnTpUctai7iHFAbh?=
 =?us-ascii?Q?aiN4unqCQzjGknvKoqPTUfA4zFX4ywhIUW7bnrL2?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB461493A03B9D4DCFF01F677D97259BYAPR12MB4614namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4614.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea405576-c65e-4994-19e8-08d9e45d91a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 02:01:17.5593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Xb4A9wmLEy7DUqBNwoThycQwUCiCBfDrPBE7AM61fJsb4BEtGHfS8qJA2AXTUsU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1292
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
Cc: Tom Rix <trix@redhat.com>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR12MB461493A03B9D4DCFF01F677D97259BYAPR12MB4614namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Thanks, the patch is already submitted.

https://www.spinics.net/lists/amd-gfx/msg73613.html

Thanks,
Lijo

--_000_BYAPR12MB461493A03B9D4DCFF01F677D97259BYAPR12MB4614namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#008000;margin:15pt;" al=
ign=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
Thanks, the patch is already submitted.<span></span></div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<br>
</div>
<div style=3D"color: rgb(33, 33, 33); background-color: rgb(255, 255, 255);=
" dir=3D"auto">
<a href=3D"https://www.spinics.net/lists/amd-gfx/msg73613.html">https://www=
.spinics.net/lists/amd-gfx/msg73613.html</a><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">
<div><br>
</div>
Thanks,<br>
Lijo</div>
</div>
</body>
</html>

--_000_BYAPR12MB461493A03B9D4DCFF01F677D97259BYAPR12MB4614namp_--
