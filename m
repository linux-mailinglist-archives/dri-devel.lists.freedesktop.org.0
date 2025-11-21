Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C6C7B26B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 18:57:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB62F10E8F5;
	Fri, 21 Nov 2025 17:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="mtoN6mWm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011000.outbound.protection.outlook.com [52.101.125.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D859710E8F5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 17:57:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chkCMbwhSFAgIjmNoQEFH0L4WmHhmeFFLc6Us+QLXZEsXRBEoJpsSGn7KN1grOd4YuWtXxzAOYJPdy1140BY/wnr9B89ceN3T4L3DtJRBFeAo3tT7RhwaCk4CfYL/Oh9fVx569xFXLpOn/4QzWYhVJABETf1T648JqVGPrt43iKeLfqHkFzAT6FNXJhYMuR+F4c8v5G7kNkwe+MFYsCTypQcwvHeU82rIhom0n6dsPJj4MO7nvp31maSkKjxD3U90bO+D0p67Q7zRc32X8v9QLmmFMpOVuAAKujF38+MTGy92fNNxvsoPHYMBKTVtAekE7py1C1h2S2k4Sqgd4/1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfBc5inhaal8Wzi9niAaI3z2iv4aPQo009OyxCSxxoE=;
 b=spOqUywtEBkPSU292yldKi0/vn05S5kFLQAlRqsWkD9AyNWRahd+mgqjHTN2VXXpZQMesrrk2YJucgtqtO3dF1x1PVsHiRSdFKwDnwFBPSWE1o9LqiJo52PCKJjaB9VW+YGF2Hmzp84UkLZldX8ooDKxbAjTbG3zqMZ4j5mpLzgFW1JFG1yU1jMFCc9mUsEeBmP6dSNDyzXMmHdXC0K0765JFihfx8pPV+KwcSjVjzcm8aMUqjPo05E4r2BcbP/trAjlkVhCAmVHPu5uCSMFuT3BJW1BQ3/6xiGOWHR4Vn8V5CH9JBXdJc0DjuauzXNmLddA8lfrCnT1wzqCZ9hJMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cfBc5inhaal8Wzi9niAaI3z2iv4aPQo009OyxCSxxoE=;
 b=mtoN6mWmBICPPI7LbdOJSQzIq5fRCOxGU9BfQ9C2K3tTIA3aOGUrcU/DELSWkV6184EVMPPIFTZgpExEbC9YrApJIX2dF4dG/kjc4a300VTBEc//7ZgKyRX70qVnvVQuAnHfE6uFrYTAc4ceMKrAJ5dLv7rn3Rkc3ltu8KO5Wak=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY7PR01MB13783.jpnprd01.prod.outlook.com (2603:1096:405:1fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 17:57:16 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 17:57:16 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, geert <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v5 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index: AQHcWPwxRrBR+pEeF0OW1RdaNVw7mbT5c60AgADdT4CAAjLVIIAAVGOAgACG0oCAAA1UIA==
Date: Fri, 21 Nov 2025 17:57:16 +0000
Message-ID: <OS3PR01MB83191AEFA889BEF610474ED48AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251119022744.1599235-1-chris.brandt@renesas.com>
 <20251119022744.1599235-2-chris.brandt@renesas.com>
 <20251119001030.bf900d1fcad4db5b63055e2e@hugovil.com>
 <20251119132235.795b633eedbb91f8544262db@hugovil.com>
 <OS3PR01MB8319EE3FB4460584BD8C62B68AD5A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <CAMuHMdWvKSDp3EVThcgU0UiUjXKAu16VtiWER1Xv4cEUdcCUZw@mail.gmail.com>
 <20251121120137.e6ad0e6d98daa15d2a1d3963@hugovil.com>
In-Reply-To: <20251121120137.e6ad0e6d98daa15d2a1d3963@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY7PR01MB13783:EE_
x-ms-office365-filtering-correlation-id: 5efbcdc9-155a-4a20-7971-08de29276839
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?diSdPGn7H/bQQrbYqYl1qMryJynhoNfjmp3UdfQHdOivgU9W3R7LGX61/N6k?=
 =?us-ascii?Q?NDQzcoOgDUuCp1o+dqO0gz3JW1ehgvkTuAwwxS6IxpNTkpVkaalXRsqA1Ty8?=
 =?us-ascii?Q?ICFyiofHeaxUlxcRrZ/MXo0kjxbyk7n0tkp54/jUdpWKxjlKMkAtzdmv91jw?=
 =?us-ascii?Q?KhGWCK8x99dl4YnI84i8+1/AQx5nIoVKRrWud7er5u7mJR58yGkiHj3uCa+E?=
 =?us-ascii?Q?zv/SCAllmpk2Y+ZnjBBq2YNB8YqnfpskoXI8REjg3QVVD7EYShpYw/DcAQnl?=
 =?us-ascii?Q?v0CdZ0+1jbYEgcTEgSVMV+0BZS057HYRcwYBv7AOWPdpDZElHMXCYr105+Gr?=
 =?us-ascii?Q?Jfj3fNz8fpkNfP6PVg9ciE1kfn8d5dwduqWhxoM7bOn5f454V88UJ0ApLWqB?=
 =?us-ascii?Q?yZlHAs3pkB8cCRxTocCvkxfEFiqB6Tl+chjCB6o5AZ0gsyf0zQIN6hHJu/OX?=
 =?us-ascii?Q?jQxjTIZI8oUeBXPfnZIWnDdL5lUCgMNiIh+lpmUS+jYG767DgiNkMzgqz18c?=
 =?us-ascii?Q?Rfd2X4vFF4/6ZZSzrGQgGEWfjLENfkC3kMMgGC9tg9nE0bORJm1wt+ToTPiN?=
 =?us-ascii?Q?TUCM8pUCy0uqaMCqakJmt1R5NWg5ZwAivDfUo2MTKDOvgYNwAhXVookscHtS?=
 =?us-ascii?Q?167YidW8Yg3YZvj2pwvIG9Doq8plOpSCUiiCzJDMS2zJ431b1+Y7EETR/znr?=
 =?us-ascii?Q?z+zm5/WFdoyzNKNIShXIz4AMhnz9yBMIMsPngYnlWQfRVsQI4xqM5lMNQnIA?=
 =?us-ascii?Q?9vIQfVGJt6yhMQHSFQzVZQCJNg6t1dJRDhGK2eA3xcm+HcEqiGoT8Pbd+8V5?=
 =?us-ascii?Q?QAvGakBhP782ktSSpJFH/Cm9KswV+tYWsuvIU3x2ql3fnyifJGRL5tlZpXEv?=
 =?us-ascii?Q?MirmcrtWBpgd+Pra/fuQHHcPbXNMHlR7xJf4sgSBkZK1WEXThv9b+g6nMx2P?=
 =?us-ascii?Q?Ep48reNkQ9UhzSt6irKpXUq9FyQDNLk9LrJkazVbdYkC/4oJXzY9f1iGXCGN?=
 =?us-ascii?Q?N1wkiDhcLFgG6ZhPoqc3Y0KY85gHFExN45abVgR+nlnKCjfRgUBn1QbDSNh+?=
 =?us-ascii?Q?hEpwWJAiQdKeZoWFUqJgQDUaQ9FeseakkBi11DYgesA9pfusZbc5ClflkFYg?=
 =?us-ascii?Q?NTfA40Q7o3k7aDpnsN/JAvo5avrrwb/8N7jlvL1NoAxf5/Ke9lDhwpRRvwJZ?=
 =?us-ascii?Q?t3PhDPGDH3Y2SaswGooQ+Cu4xQjNd2lLNkSe2haWDflC93CiBVgcGulyJQ1i?=
 =?us-ascii?Q?UlURbujTXzpzSepBtXdLChnnZbZQMyR9lVH/mM6/oH3AqF8sg+LS4u17vuo5?=
 =?us-ascii?Q?j4qdraYDcce5VkXEuPxiHF+WrL/NkDeX32k5BvuAhvRQ2a4XcXcc75FucLvU?=
 =?us-ascii?Q?Dhb4vDjKmhqDIU5WEJdjaLjM6r+PQRQ4ezHmTOsukNrcZ8TW4iNeFF4379RA?=
 =?us-ascii?Q?0STCwfOXE5X1NRgS1WK8kciKutSggf16mv3knRcvdrRQ1GRnQ0eFyOmIr4xg?=
 =?us-ascii?Q?87vgHyQSb7rUmjQ189DiGotjx8jiQE4RYFR6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HqexQipprhCV8Le5CsUNBPJO6OeWqK2gHHioObuMqZpc/gWkcYZYT9Ft0BGt?=
 =?us-ascii?Q?53gIEj1eb6MvUfxQLJdwgAP1c8jjlN2HL6mV/1shB8k5njJMxpET61STWJ8p?=
 =?us-ascii?Q?ZELBUydP/DPIm03G54/KOEbtVCFwc4BlYSaUxDmYzDJQZOog12IhVIZa6c/L?=
 =?us-ascii?Q?9H6S096J00mXQD5hzs6RJ0Ewk9EsDOrmt1bq3N9ltfjJu9NfAld7eg9aQBVQ?=
 =?us-ascii?Q?IHR07ObAFawE4HsJ9no27yZIctHic6RVCTbuj9ZPshwrGduk58ymkisnZs1B?=
 =?us-ascii?Q?nrtbS+WFC8GPQhi+a/+ofLqJt5PrSqWqEOcrqMxJ6i//JCnImeLYi14EEKan?=
 =?us-ascii?Q?2ld0UH78bVP2Qjg1FEtxWrxRNmi9PH4pAYuicR7+8N5WFnbI2H4dtUcbcWZ2?=
 =?us-ascii?Q?sTOe+cn9/aGAyRjbMiyMMJv1S1FdVt2/5SMrYznvReBUcRh4GE+Gcq3VqMtF?=
 =?us-ascii?Q?MXKOdL3yLSC8iVR5Y9wRPo+2GPTxvXicfq0OUU5bkeDDo1mxWfG+82XKheCE?=
 =?us-ascii?Q?Xu4wOwud/pE+EKaSMPKMX2j6G7lh0/bptjRBqa1iG2CVLHjRy+oIE7PHSVWm?=
 =?us-ascii?Q?Tj2LVNtuVvtoAvtE0/Edh+138eVxF6Dzn4iZVFtaJ6Uh2i7YUWDYWYC5BEyx?=
 =?us-ascii?Q?+tyktXZYwSRvr1XikDUaMv5YImuy+nAcCJexmGFn9lOkCFqGu9HEQ2mkVbWZ?=
 =?us-ascii?Q?+nt20aqwH7sKVX0oYCkNG47SgGBszZWKqtD02l5MSjcWDH3iKfiuzlrJF+GQ?=
 =?us-ascii?Q?xvLH/r5wPyZ4HzgXNqqpy2ge8MGrPxCG54E2XgF0413TFnrWS8PBvUcmEfnN?=
 =?us-ascii?Q?2t3tpgfrY46Tt9kWhBYQhUlQTpzzEu9uzPabRXx3SbidpVsJxUwf6Hfbh+2D?=
 =?us-ascii?Q?zS7CYs1tIsU8eGk5cZ1SJqbNMNl3FOH2nUy2b9PsjaeHkEIqbxupwA1UiDib?=
 =?us-ascii?Q?ONQBA5J99rNitGALWPWyVaiEkHLeJ7WomOHRpAZRXQBnOkHiF0mI5Mg3P5mh?=
 =?us-ascii?Q?Ivcky3xW2bc5zHtwF2WZw7su1HTgL27TK1EYSgD27o1VPBqQeuixap86pJ46?=
 =?us-ascii?Q?TGQMxeQ3uyIGa4llGR3CfQR8cuyiWHjDCf0k4S5TcUeSO6eXwr8KLLUgKvo5?=
 =?us-ascii?Q?JFOci4geldOFWaMObNhpyWbdim7Hv38VOhsy5DCl3cMX+/NFB81cZO35Zp0g?=
 =?us-ascii?Q?Gwor7p/w+SmkuTBd8gNZjaJzjbndELmkET8jPi8pegyInva3Tqa5wCgF4PDu?=
 =?us-ascii?Q?h0DcvfkB2mmHb2t2Q1cLteLb2ZBsPjFVo0DU1+y+4xZqZ+d26OTUMznD8Ah+?=
 =?us-ascii?Q?Fsoc8T0cWPYBlz3atypSZa9CCDfN5NNbnIVE34+U9Y4Bk8iIQsj5e478koRX?=
 =?us-ascii?Q?bg8qdDvkHm9nCv4bRukV7Sr/1aQGeNJjCA8lwQmZ6DqDk/Xhd7uUPx06ookc?=
 =?us-ascii?Q?V00Zaz5I8/uNnnT5R8e6Uc9X6/2otHX92ABDdEBjVjEsPAcTr/2pNwwEL6j4?=
 =?us-ascii?Q?Cg91uSrb88k2jEPuX6MCgIbvb5xnLUcVLsW1LovyyGYWUGStWYdA+UbVhI8w?=
 =?us-ascii?Q?sI4hLt9ELN+r/jjDcclU/wLTdULWP9o1oR+Nb10u?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efbcdc9-155a-4a20-7971-08de29276839
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 17:57:16.2005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5CxGk7PNd13Ohnq7peuu3Udmo4ERo/3ftdymvQ16myGrZmaFmr3/v0MkHNG6E/6xqMus2CfoSZ9WlJaZpjeB9Hl30L8LQbwnh/JGQD0uro=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13783
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

Hi Hugo,

On Fri, Nov 21, 2025 12:02 PM, Hugo Villeneuve wrote:
> > Pieces of code are reused all the time. So I think it is better to=20
> > make sure it doesn't overflow on 32-bit.
>=20
> Here is a potential idea for implementing it so that it doesn't overflow.
> I tested it (compile and run) on a 32-bit platform, and also with my RZG2=
L board.
> Note that I defined an intermediate variable to improve readability (exta=
l_hz):

I just started looking at this too.

I think the existing code is more complicated than it needs to be.
All we want is a simple quotient (intin) and remainder (fracin).

Let me try out your code with different boards and resolutions and see if i=
t matches the excel sheet I use to verify all the math/registers.

If it's the same, then I'll put it in V6 (which is ready to go as soon as w=
e fix this last part)

Thanks,
Chris

