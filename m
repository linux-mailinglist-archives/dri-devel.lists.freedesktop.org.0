Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FB275BDAC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 07:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1310E61C;
	Fri, 21 Jul 2023 05:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2069.outbound.protection.outlook.com [40.107.104.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2EF10E61C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 05:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtPUNNYrV/3dNPAC9bEJrqnMRd9z5721e3ptGLdOfxyofi5RzYVbr3edk/dl30HO3JEMunLxkLp+Q/C9CXV2XtFhdoO5I3frFNbScvGm2y9vRIBBtZdNPblm53isZt9rBaE51xlZJ6UYPCanIo7DrUBb/vBpamUUF2BDBun+aGkuhbpKb3p0VWFnGeolDkOSqNOWQNk+yCdrbSGRc2t0nWQmIgDq/WR3A4ZlODjbFz753KwBxbp0kBLw7tqafvLCUAHVMpqIQyqwLxyOpIsn95btxIg+inOBy/SVkwplCb6VH1DLrPhhKqOogdrUzRSH8Tzu+uxdh4CEApUZ8u4ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIT1hkDVji6kib6LELR8TOgdiHm5tySbXzu8mvBLHok=;
 b=e1aW7Uy28FsdgXwlYba616UiO1YjVS2mOnlW5xwRkFt4bu7jcTqAd91HYbl/KGARHvaTWQEI+WFrwuy3AZclO/P1zZXCOoJcHmPFQ8SSOzymcPlQr93qwanzgZ61NNt0ftaIslPZ8zO6x5jXv/jXBJYbM/mWuy9xmC6CMHvmce8WhtRXP1Stl4d/qSIHPBvCdeOIxfb/NvHF3fd/uzqDgO8yN+m474VGRsyF6u7+8XjaldYOOOWmTICyU8/v3akqauNcviTxGSGve+Elc6PYoPCYUz8w3pceeycm3fIDsc+JiOoCfskF6RrW8dpSzIcQcyeCpJYBGSwyhvylr19X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIT1hkDVji6kib6LELR8TOgdiHm5tySbXzu8mvBLHok=;
 b=jSuGD8OCm98o15COD7qz8oRq7InfoDjHCIugPjjaFgL6BaMrLXYRlRYkQg4NdZ6+1egwFjMfkd+9gwDNLRMBPVrVfiPy9P8CE0Ops8yZhqdxTIqDg2wkp6NC//qoAU+NJMNYt8TU3dhzHEHBMCN1qD1ANAxlC4BdHf5ILN77ueM=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Fri, 21 Jul
 2023 05:16:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6609.022; Fri, 21 Jul 2023
 05:16:57 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: RE: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Topic: [PATCH] backlight: gpio_backlight: Drop output gpio direction
 check for initial power state
Thread-Index: Adm60FHbZeccRsgE2UutMj3nHgFTFQALOCUAACT+sfA=
Date: Fri, 21 Jul 2023 05:16:57 +0000
Message-ID: <AM7PR04MB7046CF1E1561A37C7A5AC89B983FA@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230720061105.154821-1-victor.liu@nxp.com>
 <20230720112742.GA2525277@aspen.lan>
In-Reply-To: <20230720112742.GA2525277@aspen.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|AS1PR04MB9455:EE_
x-ms-office365-filtering-correlation-id: 5245475b-6cec-44e0-cf1d-08db89a9b4ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TOWDeUZSHgAev40SsOnzECNfjnRf5QHp2UdPgnDK/pgO/LffO4huF+R/h09rXqX7vzfNP2u67Rt/0IX6y43jVnLVqc0vj4Jtfxdq07SlAukcRGSwJuAWxhambvUKE2x7RS9v7acLEtXulG3MrOHawOv6MyG2QUkjzUYVC0m4wNccdk9mmKj+BIt/uT71qcsOmJX0g1qJ0G29IZecCO3/n1CznSXwMZfZHq/XUOcVImKSPWDzahqwpqmgTqV8jJfhXFtkKOK0A8NGBVTFktZ7XN0w1lwebZh3tzUCNDjMlA4bjgS1IIiOJk0fdOPzmLFJen8fBh8xZeS3U0SOPQU1GlO5XCf8oV93cNeW1i23NnEZjXeIofbN1KPIAAk3MLo/lHkSC3Nn3b6LicoA4yeNM14tXVQAKDpaqDZjVvD744oWE2ASya8fnTo7VJHrW/qS9CsR8HK7OeoUTHThtHjDEq6Ohq0kBKWwJ2izHz7ULcUqpBjtYAwMPsBVV3PK4bn2DNPvZlZ+wIsw4VvN95YPutxDiQFcFBggq/XIeBJN2Vl8AebeJ1WhTSg/7WCdCYJ1agRUGyyw0u0D/7iNTtwWj+nza1V1MVo3odQ28T4vFxxjpmiNd9YxtG0JKU8JcQKj
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(38070700005)(86362001)(33656002)(122000001)(38100700002)(55016003)(41300700001)(6506007)(53546011)(9686003)(66446008)(66476007)(76116006)(66556008)(66946007)(6916009)(316002)(71200400001)(4326008)(64756008)(7696005)(186003)(26005)(7416002)(8936002)(8676002)(478600001)(54906003)(5660300002)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z/LEiR+t88Bp64LXdEobK92xcc5ekac8CRDeIT1gYA7hdhgy2VggeJy49nFQ?=
 =?us-ascii?Q?xQSBaBKhRzLEN3so72FoSpJ3JnVTHTKe4PiwgLcpG2oIt8cTI298TZQJfatp?=
 =?us-ascii?Q?iF3XuTtf7rxD16P70UA6Bzl+h7JUIZjxpHhRFddV3lQNdAd+HJRM0ODhWEql?=
 =?us-ascii?Q?6B4wGf7/sgVPr+I7T5X6gQDIIvO5uCGoholLDTIRlP0NbsAD/s1BS66Cddhs?=
 =?us-ascii?Q?12DewbW519FQNjMZR4DPZnWOikA1WYJ4dhERnlGSifgthFXCq+U+HHddo6sS?=
 =?us-ascii?Q?pY6S8AZimMKph8boFhyuxXSFUQNXX3Dszg/wh3ck+/OYVCcsLSD0etZm6zuG?=
 =?us-ascii?Q?waomOHcDZQmVNtKWg4BH6HN4Hbs3CXjh+oFpmOYZMamCbE9fh44oRRVXnxLA?=
 =?us-ascii?Q?ImfDlHzkY4lZvTK39++VuAzjzgYCltfYzKldmF3slPeqKpVO4Lr5E0eu2C/B?=
 =?us-ascii?Q?jLkRgtAbJOmJIcgEDJkuHaJccqcw6aJz39TgATYKi+V6nhu/AbFWBiUmPwik?=
 =?us-ascii?Q?8gVlYpKVFRr+3XgiR7Y2+2Z7xC+WQA90jv8jv8Tm68f2S2M/kfOw6W247/zJ?=
 =?us-ascii?Q?mqqiGAGtPsrP8xnnWzTcGEa+6WL+3wiVZxypab9X+AnPA/+OHelDVU17Hzhz?=
 =?us-ascii?Q?YtfmesxD+VQpr7vcLsl5GRFmr7q6K+hdsbTYbXyydUwraPQtoONhOvpOqrd1?=
 =?us-ascii?Q?Ua6fnGyl/llWz888mbqyHRf6dMJY8F0857FYORh84c7qA8PVSQIC1bcd/tkW?=
 =?us-ascii?Q?UobcB0HcmlbjXutOlKIuvZQ6BO6RoBj7UzYf0vw2CukgLc5DoWBMeEoqNB9D?=
 =?us-ascii?Q?/pekp6l+7p5Rrmqt42jc4EF7eJV38uJF4/jusbSC5bnzDZqJtPL7d8EQpGPI?=
 =?us-ascii?Q?L6w1KkCygSVpDBNehz5KRRrCdwC8yw9Ii+EgZRQ3kD7A7cqIYySa47ZtugdZ?=
 =?us-ascii?Q?gBpuZ++qZEoEZ7T6eNtVswQo1kfyh/j3fl25A7nuBskIQGMfZYK2l43oJJ46?=
 =?us-ascii?Q?2bM2IuPV3PyFGdJvqMPbfbkayObXDostfjuU5N4CIhWhMOcI3jnzEgXJWmyj?=
 =?us-ascii?Q?742N76LOzaTiYRumEdf738xucRfdqPGb/chnf67w2iEUxbZYLk9rhX9AAlHK?=
 =?us-ascii?Q?EclWu0AWJ/UvOua38PmZKyUzRlW2foc5X607V7Qs2RL0PRm9jp6WQChArpdz?=
 =?us-ascii?Q?oK7xB0enC8zOx27mZivXXx7ezZMrlhqfIelNpnX6Y2GbLT3/0FbqcBtlrOTV?=
 =?us-ascii?Q?Gf5yhJgfnlbVRyVNa0FijWM61vwLWiatcKAdWW1e2JSQbBfxYAGU76tfURgZ?=
 =?us-ascii?Q?Q2fN+SoRP9+CiFf9XP7/itDulyK0YvF7GM98E1SRNv/apgOklIZ7zCH7u1bX?=
 =?us-ascii?Q?1Cz5ypp3xNP79qYxr8e7D5fwt0UwUAHwFRPR+XmJ6lVFUTODdKnHvlq6vvXv?=
 =?us-ascii?Q?h4CYlYmoMpQ/ILmlhnZeeWPeIq45vUPFSKox7PmDCiAstyykWtTZIWbY4LHz?=
 =?us-ascii?Q?PFKFedCQ3ljHuzV1RliDxwSvAMcq5F+Hokz01Qdr4qF4X4b75mr+qnr294YS?=
 =?us-ascii?Q?ZsfA0iSuDDyuEoLb/6huuYAJk6mlNCX4tmmNoLUz?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5245475b-6cec-44e0-cf1d-08db89a9b4ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 05:16:57.6208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4uKR5zTo4lJqxfsyI2Fi5s/4Xn5VSHN6TVto3iuw8cC8RW76fYWJfiokVqkamCfK4QecDeLwDJiqBhDNWdavw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455
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
Cc: Andy Shevchenko <andy@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thursday, July 20, 2023 7:28 PM Daniel Thompson <daniel.thompson@linaro.=
org> wrote:
>=20
> On Thu, Jul 20, 2023 at 06:06:27AM +0000, Ying Liu wrote:
> > Bootloader may leave gpio direction as input and gpio value as logical =
low.
> > It hints that initial backlight power state should be
> FB_BLANK_POWERDOWN
> > since the gpio value is literally logical low.
>=20
> To be honest this probably "hints" that the bootloader simply didn't
> consider the backlight at all :-) . I'd rather the patch description
> focus on what circumstances lead to the current code making a bad
> decision. More like:
>=20
>   If the GPIO pin is in the input state but the backlight is currently
>   off due to default pull downs then ...

How about this patch description?

---------------------------------8<----------------------------------------=
---
Without this patch, if gpio pin is in input state but backlight is currentl=
y
off due to default pull downs, then initial power state is set to
FB_BLANK_UNBLANK in DT boot mode with phandle link and the backlight is
effectively turned on in gpio_backlight_probe(), which is undesirable
according to patch description of commit ec665b756e6f ("backlight:
gpio-backlight: Correct initial power state handling").

Quote:
---
If in DT boot we have phandle link then leave the GPIO in a state which the
bootloader left it and let the user of the backlight to configure it furthe=
r.
---

So, let's drop output gpio direction check and only check gpio value to set
the initial power state.
---------------------------------8<----------------------------------------=
---

Regards,
Liu Ying
