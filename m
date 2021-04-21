Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C9366F22
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47EEA6E084;
	Wed, 21 Apr 2021 15:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750123.outbound.protection.outlook.com [40.107.75.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F2C6E084
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:27:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJNcAlyQbIzayli/Tj82za69ohYI5amY/CqKsSZBsNbtPLsRcCFkzTl6tqQre9/2l/UfHN47p3myfDjGikxsHYR8hGHDwNo59id+dU5ImMqwWOGTN2fKJt9JyBCSMWUbvCW+yR4AQjPoyGf6MLS9u4IG2l2xG0Urp+J7362i7EJHmsHZHIsY7gvYECmP9eDsZBBulnRS746xlZBy8JMC9W4y6Cq4q3ldXMiyn041d18Z8qukj5bM0v3PXZOozIwUunFVSGUY9/as7+QNyZ1hwmA0eGHAxXDqkAVJ/97LEAR99Upd+4vDUZyS04ZS/kjO8sia21KTT4qGbfbNa1Rz1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PVxifqyGM9WgUge7yVaMGBSTRodEfhHDL3QmTOFTII=;
 b=iXjeX+XPlOD9Vf2KEmPH7hvc4w41/0Tx0/OqFRxUBDo5JR9OpHQazxU/QubRnRzuPdXbLA/DChmqoliGh0ZeAPk2rC5cSlMgZewV7zvKSAFkMilAIZY80RPaRqPyxyUq+rr3203buZtkCPjzs9UDXmrD3NvOGWH1MXEoUBVdDFIfTUdfo3dZxuyhuXNlRPS319HAclpr+IWwwZXxIsepLgWkKwteKR8tlfTt6AK5QcKbJezFxjK+5TubjaKjZxnUxTtLTbyk0pOOriFJ1jvxjj24Jlp/hsgRGVLpNspQUq3NBSE2Skq3YnT9l5ORads72l2+o9FLh+cAFuZIp0eDbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PVxifqyGM9WgUge7yVaMGBSTRodEfhHDL3QmTOFTII=;
 b=M9VmyYHdCBjO2w2OIk42FxnD5i4PDU4GIp5cefwvpKzih/R+uWIjlr+LHrofnHHZ/gexB5mk/zyDzdBhXr7HwyAeGGht4rKS+L3NaLVqZ+9BcqUlDknPPgECFBNHzZoqG8y66J6rxRpOlii6hwDay1CZYMEL842kogG91wKKagQ=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by MW2PR2101MB0905.namprd21.prod.outlook.com (2603:10b6:302:10::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.10; Wed, 21 Apr
 2021 15:27:24 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::3c30:6e04:401d:c31f]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::3c30:6e04:401d:c31f%5]) with mapi id 15.20.4087.016; Wed, 21 Apr 2021
 15:27:24 +0000
From: Michael Kelley <mikelley@microsoft.com>
To: Joe Perches <joe@perches.com>, KY Srinivasan <kys@microsoft.com>, Haiyang
 Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/1] video: hyperv_fb: Add ratelimit on error message
Thread-Topic: [PATCH 1/1] video: hyperv_fb: Add ratelimit on error message
Thread-Index: AQHXNfwbMInj8J9Lc0erCaPnZXj03qq90y8AgAFDusA=
Date: Wed, 21 Apr 2021 15:27:24 +0000
Message-ID: <MWHPR21MB1593C45E6B94664509FA940DD7479@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <1618933459-10585-1-git-send-email-mikelley@microsoft.com>
 <c5de33a3cd1dc18688fc2bb7cf6a84aedcc5a041.camel@perches.com>
In-Reply-To: <c5de33a3cd1dc18688fc2bb7cf6a84aedcc5a041.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=d473cfa3-8c7f-4f20-8b7e-2d7e5f767aa5;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-04-21T15:17:27Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [75.104.93.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aee71c07-f7e0-46aa-30bb-08d904d9f6ec
x-ms-traffictypediagnostic: MW2PR2101MB0905:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW2PR2101MB0905AEAEBEE7648EB258E2EAD7479@MW2PR2101MB0905.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AIB4rxBRWgQlY4RYRDO88Irb3nCgp20kQYIMU63YG3KPQVnPVyzcoH+ImfvZiWcetBUt6pHalnyZLgYiEtdD2HE3hAmVpEVVQQIUHbuavo9aUpa7vve4yieqYqNIcb6/ol92BUmnvmgorjlLHsaEwkodAS/cqwJcfzp/pmK4cfCug7NWqxE6ARcM8prwy8rOleiCXwSlapZcpg6VQrxR1en7mlMrjCmTfxQ34Uisn4LcdpwoPV1GQ0e/eaZAFhYEWEYwZ0B4Cd0c5SPeJ3IWMeOnNHz78UdpvCadyMTaAiWUei0Msez93YEn6oWr+6zeyLTaMifeey2rxC0KqfVZiNBbr/wosaVZlQnsy5lGwsAQYvjyc6FHQTO2W35V5HGw1eXkl3U6Ww1HukyUtGaciUxpu6Cx6nEFQCxlaXdvpZ7p3EvtcCmqFuhlRCcfYyPPpli/AopnDtj62F/lR28XML94Guv2+a3h3Lm5/u4CSvvtkTwHt+C61Ppx9FcKiYTFD4gec21kDZTk1ZS2CM1HWJygd2K70VI+p3hCEQ8gBrf0dClf2FvsjnGVRWSL1QkvTsNi9wfSBewdTL2mI36vKcb7aGTRpKOyBNCFP4AIJrw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR21MB1593.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(66476007)(66946007)(26005)(110136005)(76116006)(8676002)(6506007)(66556008)(64756008)(66446008)(52536014)(82950400001)(82960400001)(71200400001)(5660300002)(55016002)(7696005)(9686003)(186003)(8990500004)(83380400001)(2906002)(478600001)(38100700002)(122000001)(86362001)(10290500003)(15650500001)(33656002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?GxMIieSpy3qRb0HWRKr3NDgYVYcTUZCx3FiWnATBOqW6nzWJVxWieNwio6?=
 =?iso-8859-1?Q?itGxOK97AoFgV0K6sg/Kg6iIieRogKeqxDVPttAS3MrsXzurfsnOGh/87t?=
 =?iso-8859-1?Q?czaSwK0/Qp6LE2ajfHwfBRafqbUZlA4HpRh1ZXt8GtRx9DF30u+hRbsghL?=
 =?iso-8859-1?Q?Uvxl9xUiBtoVOLfIufCMvJGemht0D6Adsd0IWg3ho0QvHBFMS2UNzCqrjc?=
 =?iso-8859-1?Q?Ggc3rGSGD/r7qdAvg7lwDPv7Tw8boxOvZTNGs16LYQ3AIl2t8MknYM8gNA?=
 =?iso-8859-1?Q?I0isi4LvL6pyan+sMX1i99c90B7o+D/gPZSK5LeAnzChG6fjA6bLLaR+Y6?=
 =?iso-8859-1?Q?GO9VnszSTbIcY5Eq1spQbVRtzrgkEx6feIVP59bKLU3eYTZGFcYmoiEaDo?=
 =?iso-8859-1?Q?6/WyCPaDcocteps8LuSNMdnGIKTzGRXYDZI526njhjQt0dKzHoZg0kqayG?=
 =?iso-8859-1?Q?R9IcXydhMaznZA6IUtBIVy5ZidKIbnIgvdWVrVcPXa2zf03WYkw+V6TP2F?=
 =?iso-8859-1?Q?vB4qEEK84T9r+fQ7vPFMbwF2PA02y7WvhwDMRtO01d3c93PcPIPpOXP1Ca?=
 =?iso-8859-1?Q?9hgo/0conIRknS65afEjpMgZM81NFPhvDwBwika3TxkHY+T+8GaZvyPxCR?=
 =?iso-8859-1?Q?nXDp0dqhWUAI9OogRCYtOmXz+FxJo87APpOcFAU2B1ehG9fObmrzW8YCVS?=
 =?iso-8859-1?Q?kBS37YKPbGp35w7T1NazHv0yWl+4wBsdbYyMlZbv3YmVeU4eDFkPJeChTQ?=
 =?iso-8859-1?Q?i1Yg9W9zg2AiIyURsEtEoL3HS4vmr/p8Gabh8dfITfU1RiV9UMcQ6UnRRB?=
 =?iso-8859-1?Q?JlcSrTrWvNbP6TYp6joX+Bm48QGQt0EzZDbDjp9VCZtkFDY1hbsFaDYQvy?=
 =?iso-8859-1?Q?DBhdFkAxc8Tq1GPFkLEE9cO8HBqno/c5uBa63Ym5x/QJ+ts8qevpOlna92?=
 =?iso-8859-1?Q?t4SxsZzWXpl7CMYn2n8yQ+c4RbgCu/TFWoogZZZBN+Ew+0zdairvmcU93S?=
 =?iso-8859-1?Q?0KgKrHyBc5XQJHKos69XYDRYHLkGRbcbC9jcGTvCwjWtkF845bFsN3/20b?=
 =?iso-8859-1?Q?0QRVqkai7N9tJaMrtEo7ztGxdKMZm++tJn+HUImBcSiOxmKGE1GNnBXaz3?=
 =?iso-8859-1?Q?WriN7sAKm7y6HlrrQwVxHkv3GAkGQlRgVMvJNX5B/xRUMnnjl5/eyMc7I9?=
 =?iso-8859-1?Q?WtyP4hBgCdIM7viRI0biJeU79yEhiPD15oxT62WIar2OsY2diFcNoCHvoP?=
 =?iso-8859-1?Q?wrR7WL4vzTcpAK3zfQftgWHRtDQm0fMLRoePTGAey/Jqgp2dDyZU7E2F5O?=
 =?iso-8859-1?Q?5ymSqnm6hTZ+Coi2KyVM3/dAmgsobVb9iqpEUVgdo2e+aYSvJMl6MN1PsA?=
 =?iso-8859-1?Q?hWm7C+wyNA?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee71c07-f7e0-46aa-30bb-08d904d9f6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2021 15:27:24.5524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QoKHJ+bMR9g/svZovhOlf2vB8QmXgdafgyyHBFiJPkCeJ6DTxe1MdcXpS6BDp7BHgpBzKQxXRaahbfbYVvmTlbhXdT43deW/5W8fQscuvmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR2101MB0905
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joe Perches <joe@perches.com> Sent: Tuesday, April 20, 2021 12:59 PM
> =

> On Tue, 2021-04-20 at 08:44 -0700, Michael Kelley wrote:
> > Due to a full ring buffer, the driver may be unable to send updates to
> > the Hyper-V host.  But outputing the error message can make the problem
> > worse because console output is also typically written to the frame
> > buffer.  As a result, in some circumstances the error message is output
> > continuously.
> >
> > Break the cycle by rate limiting the error message.  Also output
> > the error code for additional diagnosability.
> >
> > Signed-off-by: Michael Kelley <mikelley@microsoft.com>
> =

> None of the callers of this function ever check the return status.
> Why is important/useful to emit this message at all?
>

Except during device initialization, the messages tell Hyper-V
about updates to the frame buffer contents.  The fbdev
framework functions (such as fillrect) that eventually call synthvid_send()
are void functions.   So the message is the only alert that something
has gone wrong in the communication with Hyper-V, which makes
it useful for diagnostic purposes.

Michael

 =

> > ---
> > =A0drivers/video/fbdev/hyperv_fb.c | 2 +-
> > =A01 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hype=
rv_fb.c
> > index 4dc9077..a7e6eea 100644
> > --- a/drivers/video/fbdev/hyperv_fb.c
> > +++ b/drivers/video/fbdev/hyperv_fb.c
> > @@ -308,7 +308,7 @@ static inline int synthvid_send(struct hv_device *h=
dev,
> > =A0			       VM_PKT_DATA_INBAND, 0);
> >
> >
> > =A0	if (ret)
> > -		pr_err("Unable to send packet via vmbus\n");
> > +		pr_err_ratelimited("Unable to send packet via vmbus; error %d\n", re=
t);
> >
> >
> > =A0	return ret;
> > =A0}
> =


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
