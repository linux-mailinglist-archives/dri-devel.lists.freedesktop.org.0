Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C349372EA57
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 19:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA3210E3D1;
	Tue, 13 Jun 2023 17:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CC610E350
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 17:57:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlhRVh3BDQ0O/8PHzCTf9fsLfCGZ2HghKx3eFDXIG+4+PBTELKHoQJKb3sBDCQheONuDRquJS2b7bJiRNGBg3MHMkcZY9zVBwEtJ8TtjoweqfV6F8ANBtU9iz6zsVHSqyHK7uRbupgUKxGLOnCTldXLsK4SJSiy9H89nlxL+bhkfoI8x1ZXVwlnTBEB/qo8hMbWySoXobnvwnL32s4s+6q/0v27hWIeMK2uJyOvbAZWA3R/reOPYYt9x+7ktxg+nCXASH8d3Tthdf3VtPqlkySiRaWv22G/T9fHHJ8p8CwGmeLf+aDMiuhnoFpgjN+b9UuQ5GdHpL9JxV8/hBOpz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoZPwn7EDcmteVV25ScJls3y2WoEFDXNczJS++dPfSM=;
 b=hsus3hlv6YmAO0yrnqY/nFkVqljo/tU16muiyiWSUcMzaNGVMtQLyfDY4p7HNGAQI53uDPdpjii4n9as9zbCSHbMXnlIAkgD/m9U2u/bxqrtoKg4JshwEIgF4F9zaWcSs/Xb/qw6+ke8Z8DslS4U0cyQz0OiA965fNjAstZQ8g9anUOBhGi6vj8ssa231rfCx0vSPnI4+77HqH9eTanznnvgbkx0/2MU5YSZLuOL80dutNOL0AX2d/Ex+QhNw9MIK35XWiaSoYXdf/+ssEaJAE1bVvhzxlIa/Hb8QH73rfZ9CLP1RgwqdfYG4T4LKhBLJb+FrbZLLy8aDLyJVnERiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoZPwn7EDcmteVV25ScJls3y2WoEFDXNczJS++dPfSM=;
 b=cP7Zm74sw2Eq2JdCTkEd039XSmc46QhF7k+rA/uPzDVVR28qb71ywXz7UntUfh8/EwhfoqQVeXQJYRz3vN1thw8hC4ZDXpKpjr086lURxohtkWnCieqMyDGX6LtBjKqnkkzzxhZA108u4qBfiw49BWhulqZuEKgokcYSOT7S5CI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9340.jpnprd01.prod.outlook.com (2603:1096:400:1a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Tue, 13 Jun
 2023 17:57:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Tue, 13 Jun 2023
 17:57:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wA==
Date: Tue, 13 Jun 2023 17:57:55 +0000
Message-ID: <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9340:EE_
x-ms-office365-filtering-correlation-id: 608029bf-002a-4f20-8f02-08db6c37b740
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2jEOh+b6Mi4uyV3gT1V0ix2iNByRp4jUvIh8cNm0rXlSJaiYXBGio5G1cdTB4VklUsU8tYZSBMOkJk/jR8MQRXlBj7KvPAmHR+xQNQP2xHNYys/Kd9jPi7tCkotYMvy3iFUhlplFFteHSOrqUL9CObH0jaaliePsa/j+ivTme/CY4BV+73p0AUxF/fqbySotura5fbKBDLNsWkRh60GCk8SnvbUDVVefz/9Z3+kU0/jDH1pjxUz/Dg0YHhEZxYqYZexvgVaeKzbZ+5juL2X3iHi/QdykeP4uFmvBJAW8tunlqbZbvltyGiIzK8+RC3joPf/MUrj6VBOaDUSrM8pHXRcWNed/gfbzK12Hew1dQiwu31JYBSsGy/1g2kXm018p39anZpcojmxR8LU1u+06geh+Ovm6K8iOW0KHxXVH4f573BWUlcdk18GAMoFWeH3oTbcc+rVY+iPXcg8Mpw4S3G4Pq+JkNxJTSBeJO9b7clq/GoJv85l8DwUcWTZTW2Mz7FjnGR/gmDTAURGhzVWIyLKdbbsCWuD/+l/z47aeGAT2UoLaDhgCbLAayWOUmARUMizik4ZE5UbQzHUvWTfzUz/qdaa3iHhOTclzSemp92q4spbJks5Q4DFWDIvdXLz8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(83380400001)(86362001)(33656002)(38100700002)(122000001)(38070700005)(55016003)(478600001)(41300700001)(110136005)(54906003)(4326008)(71200400001)(7696005)(8936002)(8676002)(2906002)(52536014)(5660300002)(66556008)(7406005)(64756008)(66446008)(66476007)(66946007)(76116006)(7416002)(316002)(186003)(2940100002)(6506007)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HLY110HMRhlA21K4LdNoXy5xXWJli+4fuPj85FmgsOomPpJGInk7Ql6kXV?=
 =?iso-8859-1?Q?VOIBWlHcr2APsMAZuAmRXwsIJBJigaZ0ff9HNRAZhWofJVApxUzKTm+C8w?=
 =?iso-8859-1?Q?dQex5TCD23BZdG0Jw+9rSRAI0i3It3if/y5tKL52/epo6HhGUlRGeZLSQs?=
 =?iso-8859-1?Q?cRYnx48c7wih7JLtgwlntmh0oC9Xdff9vjF5oonu8IAbMl1jGQGGpj83I5?=
 =?iso-8859-1?Q?snoKtNWqPUtYbQRBc66nQfA0lqhoztJC/BnN0aXhHp3widYgYVXODDzFgk?=
 =?iso-8859-1?Q?tCtGYBk2AP+d2Evt/mvGAJ9Hn+UmP3l8kbRKu/2QWDfoE42rLsrbUI2kZz?=
 =?iso-8859-1?Q?8XR6RwBKAlZDCHBY6ZMXgYGNKxQvFoNMgvXxCj+W6PJKsCfV5SDcFCmeH7?=
 =?iso-8859-1?Q?Vf4qf3iEFfkl9RNUZ+IowDFvGoQszQ9yrrhiEoclh69zjNPlX8wpIz9Ftq?=
 =?iso-8859-1?Q?MbXuONZNNnskEIgE+ni+a4BvGI4yNzZRf1B0rAQRadeyiG2hx/VrmWR87h?=
 =?iso-8859-1?Q?6fbiFWECpeVXcAPfm0iKAZblB8V5IzXaIyQeVyW5AFdnzpbUmAEoSQJMZS?=
 =?iso-8859-1?Q?haSybNti0A4Eg54CpnA/64rznfrEHJxVaDn3kFKRojs4TwLai2v+sEiNkj?=
 =?iso-8859-1?Q?8NNm4SU+I2JczrpFEF/fP8OdACvYbGwAHrC4VkzOZhXW46WWpSSAMQ2T/X?=
 =?iso-8859-1?Q?poq3vtUunP9VfIdcp8u/Dd0y5+8Tpw+1tVsN6a40JleToReCez1BkmG/pa?=
 =?iso-8859-1?Q?wgKV6N1nwuQ9Rsh2TFmObamhcQdGPe+cCvC3JF97rFk6+ioKxUbeOzTQPT?=
 =?iso-8859-1?Q?tYZORac5+7EWGxl9CqUP0Z5Sw+4f8TD9xCLT3pQnX5D0HE7PgqXlma+F0l?=
 =?iso-8859-1?Q?ZWvSDZiRerPH55ztoFHIV8s5ksbOKqafXe8sPfEXt5BleIFUu0BA/6YJR1?=
 =?iso-8859-1?Q?STqWcxCGhq7DnkEbfT9xq8VxbczOUQZaM+SkBPNmit7cDaO1OnbDu7N7UO?=
 =?iso-8859-1?Q?FiJGfYLKDE3Hwyu9CRasoEl+u8shR53rqS9KDav5IxKr4DVa106V31XKPy?=
 =?iso-8859-1?Q?WkDykZ1uv2uDAJ1k70p6hENi+DwOFVIB6Ofw1MoJgKGid0aoHqeFmecLZW?=
 =?iso-8859-1?Q?SXBzQbjPrC4ybvs+zuszrnjNHxi5jo9LYWF703fWLCkT+qz55u+NThPu5a?=
 =?iso-8859-1?Q?KMKX7P4QQ8myBe8SAYju09WlCRI/W+yFrodFjxM2qKgs2Ei2a1Wx81hRqP?=
 =?iso-8859-1?Q?/xehFjxMeocCFh629nz3K6D+I2Q1YQg9e2dafQ4a8qHNGPw0xZoXxyIC5x?=
 =?iso-8859-1?Q?KoWEUkjPWtMlAOm0rRamltwxj/mKJBBz9+tFERNRl0/1SAhMiEp+akKpFC?=
 =?iso-8859-1?Q?m2KTjF+ZagX1PGIvs++bSDBLfiXHqWNwuMb+N1+cW2UgjK3MaecLOKuips?=
 =?iso-8859-1?Q?0V1OO45M2W61fArumnP+gAGXId6DQPS9SOT5EQpU+LmcJYRFebrNc+Ugf6?=
 =?iso-8859-1?Q?NUtvpnUCO41g3EYj2DtIscjiQrNByNauFQGlLqFOibYKVD1tSvcBOoHvKo?=
 =?iso-8859-1?Q?mEHbHhzYZJ4PXPXK/C5ctbeIN6jVzue0A5+DVPrSaSJmkigXZvXFU/EoDm?=
 =?iso-8859-1?Q?U0eXOqPf9TIZM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 608029bf-002a-4f20-8f02-08db6c37b740
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 17:57:55.6263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6odplNknN8UEtNRagr1B69q5+d1fxZnh5iFHVeQEDq1Ol298yRcucwObtn7jKvzeOMjinUbbRjVKVpoLUvreJbe2NWGNudsMbm/HMQgS9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9340
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Antonio Borneo <antonio.borneo@foss.st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wolfram,

Thanks for the feedback.

> Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > API
> >
> > Hi everyone,
> >
> > > Perhaps we should first think through what an ancillary device
> > > really is.  My understanding is that it is used to talk to secondary
> > > addresses of a multi-address I2C slave device.
> >
> > As I mentioned somewhere before, this is not the case. Ancillary
> > devices are when one *driver* handles more than one address.
> > Everything else has been handled differently in the past (for  all the
> uses I am aware of).
> >
> > Yet, I have another idea which is so simple that I wonder if it maybe
> > has already been discussed so far?
> >
> > * have two regs in the bindings
>=20
> OK, it is inline with DT maintainers expectation as it is matching with
> real hw as single device node having two regs.
>=20
> > * use the second reg with i2c_new_client_device to instantiate the
> >   RTC sibling. 'struct i2c_board_info', which is one parameter, should
> >   have enough options to pass data, e.g it has a software_node.
>=20
> OK, I can see the below can be passed from PMIC to new client device.
>=20
> 	client->addr =3D info->addr;
>=20
> 	client->init_irq =3D info->irq;
>=20
> >
> > Should work or did I miss something here?
>=20
> I guess it will work. We instantiate appropriate device based On PMIC
> revision and slave address and IRQ resource passed through 'struct
> i2c_board_info'
>=20
> Will check this and update you.

info.irq =3D irq; -->Irq fine
info.addr =3D addr; -->slave address fine
size =3D strscpy(info.type, name, sizeof(info.type)); -->instantiation base=
d on PMIC version fine.

1) How do we share clk details on instantiated device to find is it connect=
ed to external crystal or external clock source? as we cannot pass of_node =
between PMIC and "i2c_board_info" as it results in pinctrl failure. info->p=
latformdata and
Client->dev.platformdata to retrieve this info??

Cheers,
Biju
