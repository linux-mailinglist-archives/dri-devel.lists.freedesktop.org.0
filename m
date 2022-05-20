Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA6E52E6BC
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 09:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C80611B505;
	Fri, 20 May 2022 07:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2093.outbound.protection.outlook.com [40.107.255.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49A9611B25D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 05:45:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niFjM8YbY4m3CUE7ujQyRxX5hsdWenkyw0cet5IxuVC+O2QyxjMxfsA+eH2Z8yFGfrUeYJi4xKEIMs73h2C8pAS4vtclYY5dMpgsl7IVyKWZanjvv3LA/pKinAWy71ZFCcoH0wlOuPuIn6QJVE3d2EdiVchm2I6j2PtWrdFQbl2rwADD86NwAfcI3c5gfWBXN5SnhT/Y2SdSJHj6UFDyD9lt3VyIEaONBkjldkvnfu8IiYGKz2RRFqTsm2KB4982IUdXf0OO/XNj1uFiVPDbw95OgjBNNnOB/ZT3Gp4op05pcJ4OZhfCdr+Svf0N5yv5PeBcdETEjK7X0221YH4QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljO8CJS+yM/tLyDvLfiVabQz2qI4j658vwVPehB8lNM=;
 b=WR8oGIux4SWAPg9pouUQKko4mBHOCWXCc9jl0XggY+s+40F9XmZkGV5MYCYJfE7uWsQzryaVn2k0TdzhSPmZEQHz/dXN0ta+qf/K+y5LcOFg7nr1RtpfQbKa5EqIloa1EwrXCRWNAJ5uqa+2Bp9ym4aKTbPZJoxGVl4cf/Um6x6+S59CXQuV5KHfGKQH2cwpWW+ghGb5sFrNNUUpO9sysYeRm2qo6O8olEkQOCWmP2EBsJ8U5F8I6dsjJTiF43bE9xaOZ3D+99NDVKgOhvFPj4UVsLyZpM3b2VCxXqEAcFyXOobHI71DJdne0M2qNBFDbVDqmhDrKDcrU3PmBsYo4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljO8CJS+yM/tLyDvLfiVabQz2qI4j658vwVPehB8lNM=;
 b=G1WsazcxNIjScT09FluApgjQd6eRk8e2fMppYp5T3nhDyytJJK2xbqHi1OfnCPcmlKeX/RMtPKFwgfnlck/Pc5f9bCdovXFEnxwnpzI19ALJRHFywazw9uJZs58Xedd0ah+HCmlAr7/7vVAFzpQ/PYMcnJAH1NA5f5zTtK7dd/b0gBxzliKQ7Htb9gQ02xygD1A4unZmo33PuM6B55KE7MEbr7/FRbTXZtiKmgLcwHHZSrD9vNLnJPRJDo/XqV9LIfTeq8coMeYQmZpEo+Z9fnLRKF6bNzNTqcL5QyJ3+nAobNIJhbeA0XgYb3//aasdQ9rR5xyZ0kU70pBD8NzmAA==
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com (2603:1096:203:87::17)
 by KL1PR0601MB3782.apcprd06.prod.outlook.com (2603:1096:820:1f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Fri, 20 May
 2022 05:45:36 +0000
Received: from HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8]) by HK0PR06MB3202.apcprd06.prod.outlook.com
 ([fe80::3d31:8c42:b7f1:ece8%7]) with mapi id 15.20.5250.020; Fri, 20 May 2022
 05:45:36 +0000
From: Neal Liu <neal_liu@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Topic: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
Thread-Index: AQHYan9t0ehEszq6CEa8UANcF9oVAa0mXPUAgACwUECAADcBgIAAAEow
Date: Fri, 20 May 2022 05:45:36 +0000
Message-ID: <HK0PR06MB3202D08237C96D4766B070F580D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <20220518062043.1075360-1-neal_liu@aspeedtech.com>
 <20220518062043.1075360-2-neal_liu@aspeedtech.com>
 <YoZoouI4EbnNYE6h@kroah.com>
 <HK0PR06MB32020AEF88CFFD4296762B2880D39@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <YocqrTHm29g9qU69@kroah.com>
In-Reply-To: <YocqrTHm29g9qU69@kroah.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec1c8d04-0746-4bfa-3b7f-08da3a23f6cf
x-ms-traffictypediagnostic: KL1PR0601MB3782:EE_
x-microsoft-antispam-prvs: <KL1PR0601MB3782335351BDB737868FDAAE80D39@KL1PR0601MB3782.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wUEMrGYT2DrXntZ1RBuIdeU+ahMfE0dir6pLGA/Og8vTYTC/1anJAxEOtYxF3yDZ24rkBcLGsQXo9u6uhZ2Ydz6kmNHpZq3WVL/mblWpddH05/IqNQWrXC84gJ2u0SyPCeZveCJ2J9lLwXCiZeCix4s06anFCYpH01k8WkxJrT2K257/inZqSp8LQd/xTmKzyEvinn5nSq7tLJRkImJ5Ty2X7W0hw8sqkTU2D/r9WoensxBwPCXWAD7Zb8Fh00VHXT+aCqkxJl3vrsMsPyVugmvcKBtUQeTKb9jlUDOFweGdLHIPVMlzvQ3VjcnZ5wbqpO2xeE8ZvanHcG1AO99q57dbdde/fsT32s19c7jK2HyTK/kTqqH4kcYjW48OA98SMLS/J/kF1DyFu9wGnFzjm2HgjrMP/iiVtWSMlklZ+PlrPM9rMeXQTFxzav+jgtxdwaOllDNGDifhndrIzMW3NGWkoJ7mg2pAN4pmzfq8K7cu1vRNLEJ42hoavDRvbI1yQCb+5LbJZ/VfXEyBPty73qh9C50U73xfgQxrrZ/U4WRbBN16lq77DBrl2M5/0gJiSrvbgIgdIaSXz6MBcyq69DvX37emjSyH7Y+0HaSGrZFKm36vPE2ZqB2H7PBHP4dLKKDm3Bl97J0h1GDJG7/9jwA7AJt4K422Ci+viA1h8I2lvrd6iNZo33WOy0xpriUpC27Vjjxql7gZroQ3HMUjOQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR06MB3202.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(376002)(39850400004)(136003)(346002)(396003)(366004)(8676002)(4326008)(66476007)(66556008)(52536014)(83380400001)(76116006)(55016003)(5660300002)(7416002)(2906002)(316002)(64756008)(122000001)(38100700002)(86362001)(66946007)(38070700005)(66446008)(7696005)(8936002)(6506007)(186003)(53546011)(66574015)(54906003)(6916009)(26005)(71200400001)(508600001)(33656002)(9686003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?/WvZngISpBZYnm44zam4RTk4E4yN5qv39QnwMyg0v+hXQYMb9NBNhdA9ac?=
 =?iso-8859-1?Q?kPEctjFViAEmUX/TNS6OkZ4YYqp3XdLDEFfw/+MJIh5+hHkCOJwe0NOL+h?=
 =?iso-8859-1?Q?+ruElvXBI4BcSaboAi5FuMqW/x2FMSLggkP1YPremoyfprA6F+MOFAKrx8?=
 =?iso-8859-1?Q?Gm9t6G7fCwkQNqV6Tgn11s9ktrpMXMVW39yrCyhnajx2Tv3l/rCFWVIl3f?=
 =?iso-8859-1?Q?2tLaRwknzzmDeAP8/PPllK4fKkzkg3QzvYaVeD+dzU3g1x5gRTfhlm4QVV?=
 =?iso-8859-1?Q?GUdSOsuwgNYgv/WHYnxAWxgBIujpVm4c2a9sT6IJ6Rjqv2TycUMzsKpC3x?=
 =?iso-8859-1?Q?1SXIDu7KeUomxWwxOHIAFQCW40m3wLwAanGZkfmlnQH6rB37cy8SGdNCmh?=
 =?iso-8859-1?Q?3w2/Ec1v1FBJfCnL7U3iabOz9aa2I0Ozgx81lRx4NP/hDjPekb6XwcGqrJ?=
 =?iso-8859-1?Q?Hp5kzOl2rIPuxZYJin4pF6JPC23ZWgR68ePjHRYSBStxm2BiTsxBqTnHVN?=
 =?iso-8859-1?Q?uSycDxGyJJ+HrvzYboJgvVhF3dQxixXB9KKQdSkSI3LmPs9p/eh5VZ+S4y?=
 =?iso-8859-1?Q?phNg4eGf+ZnvUiPpKlCnSWbezCSnRSIrvqGb5DyuFXBdIG7i+3LuIfUGdX?=
 =?iso-8859-1?Q?D8tOtUfKDvW5z5vNVeZGoE7urhA0ZCjqqLjfcEW/iIQJ8YlaI+QiWosqGX?=
 =?iso-8859-1?Q?cUaZ5lz0sS5emZU8mWmQ45ZOCU4Ez8wpN5ZG9g79o4KpdRJCS98cChDvI1?=
 =?iso-8859-1?Q?N+yA+Sx0CKKJsf4U8rbEpx1AJcP2BauRnyIq9bOn3s7UjQQJFyECe2+dWv?=
 =?iso-8859-1?Q?/nDlNrX+v5aooejmPsSeHfQquHQawuNDtFeG5sD4d5PRsaxeAu7+jM0MnJ?=
 =?iso-8859-1?Q?ydY9f3U98Wc80Kj591HCrSSPYnJdg8C7H2TELYrSRC9asytf2zWpEQmZTZ?=
 =?iso-8859-1?Q?Hcq3Wza8+qYwxcgVPq2hbV4svdH8jCwVT5Gt1JZ3Q3VHg/lBU1BQzNAY7u?=
 =?iso-8859-1?Q?WT1M9SYFOcybMJoKyrsFtNc5NaQmyjSgMY/9GUxHLc9rivc9XztfD/rGf3?=
 =?iso-8859-1?Q?s9eVUO9ZKIf2xilJhGOZZWqZg0Ll+HGtF7tAAGBoa/u5mFS7Mdhc1qqsqg?=
 =?iso-8859-1?Q?YPVs3O6zDydxv6JeMNRENkDILjx8y/Nsyt6+YkiOoczB3sQQG6HwAQlar/?=
 =?iso-8859-1?Q?nDh3o0CR9XOLlN29uPWQf6+8JsHXEyQas8mmML1sJ3UfY+UXcV8vADbQAg?=
 =?iso-8859-1?Q?1mG4Qfp3M8B5S3LgJc3Gyuy3bTRsmhViQi1wyz2khvoNt3aWayQ690KgyF?=
 =?iso-8859-1?Q?Zv/r3XtU2RCx28b4husQGyBtv9p9H3de1CIz0dNI0ntoFJzT9/IRTi/S4G?=
 =?iso-8859-1?Q?ft7vnL10UTVC2CSMLMDYExWEecg7zbyvVScSM/PGR7j9IWFgrFzlebBHwa?=
 =?iso-8859-1?Q?lLQMwaQCQ8k2KdE0ADwNzPjgvT204kx3lIPKwM4PmVPfqqYk7Y445oWf2D?=
 =?iso-8859-1?Q?X83Fdo45Csd4owVGw0iEMQCnCwnpbBsAe6o2hTMOcU/65OSQqcUzSHXaMi?=
 =?iso-8859-1?Q?9nq8fTaZUQEUx83WciYdFnfJZFNQ0Rf2De8Omf0iJF6bZ4Wa376mTrJ9rI?=
 =?iso-8859-1?Q?INY00P0Sh4KMPuDL/hVEA4TDnZ9V+3ZoKIC+lxIJhfaaMyoAntyOUM7484?=
 =?iso-8859-1?Q?tKx+rLQd3YYcpIRBTvZ25+24lhG0SgUSFt5V26CZqceh2qvEHZn3pPy1Dw?=
 =?iso-8859-1?Q?cy6JJMq+lwXKZ6TelRx5PUYl10Axe8saRU2WIMpWcJzdwOAhpxP9ZhETaz?=
 =?iso-8859-1?Q?qw3WNLLLMA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK0PR06MB3202.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1c8d04-0746-4bfa-3b7f-08da3a23f6cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2022 05:45:36.5076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5D5UuLA0/oAuipIr+HK3CMBa9BS0YUWX8XMm/jJXIUZDCs6GJ5NOuoaFtSzgvJ8PRHGkSXwyCFCgwZADBbgRpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3782
X-Mailman-Approved-At: Fri, 20 May 2022 07:59:06 +0000
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
Cc: Felipe Balbi <balbi@kernel.org>, kernel test robot <lkp@intel.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Li Yang <leoyang.li@nxp.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, May 20, 2022 1:44 PM
> To: Neal Liu <neal_liu@aspeedtech.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>; Andre=
w
> Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>; Sumit Semwal
> <sumit.semwal@linaro.org>; Christian K=F6nig <christian.koenig@amd.com>;
> Geert Uytterhoeven <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>;
> linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org; kernel t=
est
> robot <lkp@intel.com>
> Subject: Re: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc driver
>=20
> On Fri, May 20, 2022 at 02:29:36AM +0000, Neal Liu wrote:
> > > -----Original Message-----
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Thursday, May 19, 2022 11:56 PM
> > > To: Neal Liu <neal_liu@aspeedtech.com>
> > > Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> > > <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
> > > Andrew Jeffery <andrew@aj.id.au>; Felipe Balbi <balbi@kernel.org>;
> > > Sumit Semwal <sumit.semwal@linaro.org>; Christian K=F6nig
> > > <christian.koenig@amd.com>; Geert Uytterhoeven
> > > <geert@linux-m68k.org>; Li Yang <leoyang.li@nxp.com>;
> > > linux-aspeed@lists.ozlabs.org; linux-usb@vger.kernel.org;
> > > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org; linux-media@vger.kernel.org;
> > > dri-devel@lists.freedesktop.org; linaro-mm-sig@lists.linaro.org;
> > > kernel test robot <lkp@intel.com>
> > > Subject: Re: [PATCH v3 1/3] usb: gadget: add Aspeed ast2600 udc
> > > driver
> > >
> > > On Wed, May 18, 2022 at 02:20:41PM +0800, Neal Liu wrote:
> > > > Aspeed udc is compliant with USB2.0, supports USB High Speed and
> > > > Full Speed, backward compatible with USB1.1.
> > > >
> > > > Supports independent DMA channel for each generic endpoint.
> > > > Supports 32/256 stages descriptor mode for all generic endpoints.
> > > >
> > > > This driver supports full functionality including single/multiple
> > > > stages descriptor mode, and exposes 1 UDC gadget driver.
> > > >
> > > > Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > The kernel test robot did not report that you needed to add a new
> > > driver :(
> >
> > I had received auto build test WARNING on usb/usb-testing reported from
> kernel test robot.
> > It still mentioned that if the issue is fixed, I can kindly add this ta=
g.
> > Would you prefer not to add this tag for the first coming driver?
>=20
> Please do not add tags that do not make sense to.
>=20
> thanks,
>=20
> greg k-h

Okay, I'll remove it as you suggested.
Thanks

