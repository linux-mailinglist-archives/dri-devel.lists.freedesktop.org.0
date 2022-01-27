Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFAC49ED58
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 22:22:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC3610E1D2;
	Thu, 27 Jan 2022 21:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from na01-obe.outbound.protection.outlook.com
 (mail-cusazon11020018.outbound.protection.outlook.com [52.101.61.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F5D10E1CC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 21:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+YVf0kodVU9XABGThPk+XGm8eMfPdPv66WjgAD3Ui/HkInmyoEtRXjZxyZlxOMGc3Vp7i1NqikrH6zp09K2zYJguJD4MKoL5VPg8AUyV5mBwC4o3subCKpk6mibY5VIHoNmlzUEv0SX25iichm48JYhdtKnYKfJmZUEywCTG7AZZ/tW2Q7caZMYL8X+zcmzfkMr08Q/6/HWNd3L9ZSOluV05n6lXbrbO8THTuG09P7gaA8A9/SxukYlr8gOI6B7NGO8VcTzfx4ha4IVkaqFfVeKwD2MpW5E1UuAzgMko2nMZXfO/7ylb7nbpAX1EGj5yk3nCkciPNoQxgO1dekkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtieCV+H+quWkWGe1AvyhvR8DUguLMfhLK11giWh2zY=;
 b=kCkBxyHaQkkEU84iobKnk122RViNj2LwSmi7arfYtkctz0QME1nOa3+FX7LCPthfWmjogkhSpcyQ0FJFa0YA50epkyFkhCSJXreFwmlFf00rHBJ2oJFPwWucyvDhtONOaQJ3EKrXuoxlIJF0hbn4vXbB9ZiL3rN0KqyPBKna8IBPirpBD/gDiY74dkUewT5TrlEx8gpV2KVYtWirgqni36EnUH0qp2uhfc7xBsdi222D+GdaEKul8m1CPGMlGyEEPuOkHEGsQApJrvPdAFvmhoOvpzOayzQ9y4C86GiyzUOER6U3Ozw0mrMh+/Q5K9Qtl44Ei0QqcIWYHmj1rv9Z6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtieCV+H+quWkWGe1AvyhvR8DUguLMfhLK11giWh2zY=;
 b=aD6rikmFzMa669dOVYuC9DfaFFOlR2OV0ptxBpkiX+e95GuwWM5E5xGRXGFFql+yoORuU6jG6b8OyOQv181jvcKNOFgzFxxzI1ux8X9c/v29ti3GcOQfWtg9dZVlQK56oANKvy8fT1YcPZ9eFqUZGX24zpRtQvPfQWcZmNA6nhQ=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by PH0PR21MB1944.namprd21.prod.outlook.com (2603:10b6:510:1d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.9; Thu, 27 Jan
 2022 21:22:34 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::61d3:a4c2:9674:9db6]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::61d3:a4c2:9674:9db6%7]) with mapi id 15.20.4951.003; Thu, 27 Jan 2022
 21:22:34 +0000
From: "Michael Kelley (LINUX)" <mikelley@microsoft.com>
To: Yanming Liu <yanminglr@gmail.com>
Subject: RE: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Thread-Topic: [PATCH v2] hv: account for packet descriptor in maximum packet
 size
Thread-Index: AQHYBbs9Z9MCDPVXTEy3Gdtosh0+p6xi6g+AgAe+98CAAC2igIAMpPbQ
Date: Thu, 27 Jan 2022 21:22:34 +0000
Message-ID: <MWHPR21MB1593F5A0494D7726E577E03DD7219@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20220109095516.3250392-1-yanminglr@gmail.com>
 <20220110004419.GA435914@anparri>
 <20220114191307.uu2oel7wbxhiqe56@liuwe-devbox-debian-v2>
 <CY4PR21MB1586D30C6CEC81EFC37A9848D7599@CY4PR21MB1586.namprd21.prod.outlook.com>
 <CAH+BkoGWu7BgEJo9+c3kAcyEf1qptvmts1DMoW4RoP=3e7eN7Q@mail.gmail.com>
In-Reply-To: <CAH+BkoGWu7BgEJo9+c3kAcyEf1qptvmts1DMoW4RoP=3e7eN7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=ea6c9051-7354-494a-bc5c-30b630d3e7a6;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-01-27T21:19:17Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de5696b3-a466-454b-ba73-08d9e1db2282
x-ms-traffictypediagnostic: PH0PR21MB1944:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <PH0PR21MB1944F30E421966CBAAF20C5DD7219@PH0PR21MB1944.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V8bPROwwN54BLz/gPnhjshtnBmZRnSraXHjwx9LeH+mxMYGH1Pjuf4zceYELZ+oqJ9WOtZ5HeNKQYPaVJFKc5A+XG9iHpwNCVEboxWVIbvUIJEbZIO3+JqICkmyIPmGX6zT+1UB/HuiSvbEb0/D2JFl3RVVczSStkKhVMTa8HwCi8jPGOg39PfafLMtZtLOeLnQBLq5d2hdZssHlhDhr923C/UHchSdnm5mwRXJ3cmms4Kui+PYwZFW3qDBlr7k1r/nTBEkG71pC/dbpd8RH/g1uumlliBh1l/D6EpAnYfrTq9GKvqV8IwP8Ot4u+h4FTzfCR5pcyn2Bnf60BQk9243UbIdjWCzuOMk8gsyjTp2zyW0F8WBYYXJydysSj02a9mGGPczKIX6nbIj0DjqzbTgmNkMXXTzd9WFHMzDfuF4UMoPw1eqX2VSgb/x7kF4pauSri5dpOj19M5mWpM0PSE7+P0eoKWEZWbPBKeuzpVoFsk4DTfCk5OsfOQ1YmykH+Ij9/wYUeK5CP+dBElGEoEY8s+AFa32uPPBXMYvdztu4ilb4Izzer4XBqc+icQNk6x7C6UcLSM0Re5oCKbFRP8wFU0u3bCgErMCooLcaT3oXH/mAluTKg9bnTAACzXCKz8uYFpdrysc+DpkcUSetcj8TjUDAPbwQhmyNtDZlFAYDbhw8GooyJbYTiFR5h8g86nDx8g3RmGGDtiE06Hreaa3M5subSe5bT/8gzGIBAEn2/cORlNdiS0k+gjskFSj03YCKvmRur9km1m/pitwRP0JoGBY3Z8oL3qZUntn9fEMlyiFEgwYQq/rF05PMx1nDSHN6TQ/n0XsSA24WlJmR/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(15650500001)(6916009)(54906003)(66946007)(7416002)(66476007)(66556008)(5660300002)(4326008)(26005)(71200400001)(76116006)(186003)(316002)(8936002)(8676002)(38070700005)(52536014)(64756008)(66446008)(10290500003)(9686003)(6506007)(33656002)(8990500004)(53546011)(38100700002)(55016003)(966005)(7696005)(83380400001)(86362001)(82960400001)(508600001)(122000001)(82950400001)(2906002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n1jykoqIjLLjbuOhZeCSTA6PESnuL0P4wMOBYBrwskk+pJ4JMZ5gITvFPmJG?=
 =?us-ascii?Q?V/XwfrgVv8Vr7lwQj8B4n6+UtOeLg2oFwFyRwDYavLbyjJHNNb9oadn2iMXy?=
 =?us-ascii?Q?zIpYQLkvmSy8bCzzC7FgWpF296Pn4JoBoCNe3EqtdM8LyQS+Q0Pzm3AEBSY9?=
 =?us-ascii?Q?vsW5jyS3iU5qSJ94tiOde/bbpkEk5O7gpfwxdVnv/oOHhWbfnZcvms4Gq53f?=
 =?us-ascii?Q?D7gjMH4GwYr3m2O9zuGdd3LLF4uPAaCHdeBHNoHywF7yXGqgz2vnFtNejGpU?=
 =?us-ascii?Q?cgTh1IPwzVpQYPPvlPhXmu2QhdKGYBUwILookB866c1YneSKRF1z021jBL+z?=
 =?us-ascii?Q?vocyoHoTiqgAPUvX74xJdpGRvuAJ5gQRGX/kDVqRRuLXwPiTznkf/JBVYLKb?=
 =?us-ascii?Q?HKXWKxMuemcUySFhTKQKD271Y5wfNHkdLfvKDGMF28FDslsy0HySaDCNSdcM?=
 =?us-ascii?Q?aa1vEGpq2VVza7eX/NfB7/pu2dK7+EEDBa5dLvXKksZzLIzbWHKnA8EfySJD?=
 =?us-ascii?Q?WZ8b1KRoj05yyqq0S+cPC8c2URw5mBS9w4CTnG97Jn14L4zyV+wDgqS+Trlv?=
 =?us-ascii?Q?7M4lTIUaMNzSkL9p24FTNUbsIL6bGX28/NAzVtK3Fp0i38qP2yvIGh/lSkdJ?=
 =?us-ascii?Q?Y7LfFS9A6X+n8IAb4LEa4AftIVZi943cwf65R3r1SOqTnBMcg15zbrO9ywEe?=
 =?us-ascii?Q?89HhJ5XJsCLJitnRjpPbuPUsRyP9dMrSKFqEf4KkUFX7g6u8voTfMGvDR3Ig?=
 =?us-ascii?Q?u+xGpsbHwmriopiK11/b3TEYfQwAmvHWi+w0+tZv2IzAauhUOzFkP2I44YTJ?=
 =?us-ascii?Q?ZZDoA4gmDvl8FurGa6WsHdc6BR9yVh7kBXN/TUOZLtlZSlKV21BEP0YtCJrt?=
 =?us-ascii?Q?kcOH5E5LEXbOtCnPfyaCb+cLYRx6D4p4sLB4iHRipyOm2Mik8AeTvSB+cyVi?=
 =?us-ascii?Q?mMsZ0AUbvo98fHPwV7+iSGUnQlRAOxqBR3I/EKDJZLadKCVB1T2cDI8eY+FW?=
 =?us-ascii?Q?Et5G0/6d+DJDbcM5+/4AWJ+wW7QDf27YEmqHGzvPNxJsONXEMF0Clq8VAPlu?=
 =?us-ascii?Q?YS+MM7GWHD9s/2z5oitfDys41/aqxp7+4Th+kHIFxmaHKR7DB54l102d9K/q?=
 =?us-ascii?Q?qbzwt16ZWuMTGXx3I390BoDXr4hSMF7hERkOJjk1n2JfzF2PQZAqhdIXx+9K?=
 =?us-ascii?Q?USy/+i+YgiEUDv2J+1/H+HL9VlI2lR1v/j7IyNvO8bJcBEjHi2M7SH5gEXhQ?=
 =?us-ascii?Q?fCc4EsISJ4f5PUSM9W+xXWhE+HaiG3lBsCOWjCttlmawYlTOIAYC7LfauSZv?=
 =?us-ascii?Q?iTo4h71gLwAktCrDA0jcFfcbVu+o7mc88j0p9syqkxgOXj8X7kSuFJ5HkY4Z?=
 =?us-ascii?Q?ZSTqoYyWuTp/DJYt4Xfrrg4f7GnVfKIN/dw+h1OhIkbj1ctxzw57FCF7ns7B?=
 =?us-ascii?Q?nuhmIrozzVFRh3LTBDM4yqb5HBGQspIAvYKm8XGyxXH2zK9+m7cjU4dOCHs1?=
 =?us-ascii?Q?hDKIxJo473LadK3Qs2JHWLv5qW7CN2MWhUYWHRsn84s0LPYpfx9xRsw8iCny?=
 =?us-ascii?Q?biF+nqFLk7G7NLcs9Un2fwf0Hyo40L47poHc1J0YipJVAmVFKDJva1lhFu9C?=
 =?us-ascii?Q?ols6jeddijP90HG91eDRNTLNPOTA2qi29f3a2Vu3HjPzKmjSKbAvPGklDzQ4?=
 =?us-ascii?Q?5uPDrw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5696b3-a466-454b-ba73-08d9e1db2282
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2022 21:22:34.0416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mpdy78zrxXvjQanDD0zhI4401E7GKpe+DWJkd1pNCg6tzZ8kDpi9Y6GoswSbUcTq/GWjrZACZYnIQ91eMOgdYLLoBLogzOBgg8pJbxqnKjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR21MB1944
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
Cc: Andrea Parri <parri.andrea@gmail.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "lkmlabelt@gmail.com" <lkmlabelt@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>,
 KY Srinivasan <kys@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yanming Liu <yanminglr@gmail.com> Sent: Wednesday, January 19, 2022 1=
2:14 PM
>=20
> On Thu, Jan 20, 2022 at 2:12 AM Michael Kelley (LINUX)
> <mikelley@microsoft.com> wrote:
> >
> > From: Wei Liu <wei.liu@kernel.org> Sent: Friday, January 14, 2022 11:13=
 AM
> > >
> > > On Mon, Jan 10, 2022 at 01:44:19AM +0100, Andrea Parri wrote:
> > > > (Extending Cc: list,)
> > > >
> > > > On Sun, Jan 09, 2022 at 05:55:16PM +0800, Yanming Liu wrote:
> >
> > The VSS driver in hv_snapshot.c allocates a receive buffer of 8 Kbytes
> > and sets max_pkt_size to 8 Kbytes.  But the received messages are
> > all fixed size and small.  I don't know why the driver uses an 8 Kbyte
> > receive buffer instead of 4 Kbytes, but the current settings are
> > more than sufficient.
> >
>=20
> Well, I'm not sure, on August 2021 there was a patch changing
> max_pkt_size to 8 KiB for VSS driver:
> https://lore.kernel.org/linux-hyperv/20210825190217.qh2c6yq5qr3ntum5@liuw=
e-devbox-debian-v2/T/
>=20
> The patch mentioned a 6304 bytes VSS message. Which is part of the
> reason I tried to address the more "general" problem of potentially
> mismatching buffer size.
>=20

This is certainly interesting.   The Linux driver is not processing
all those bytes, so I'm not sure what Hyper-V is passing to the
guest.  I'll check with the Hyper-V team to be sure.

Michael
