Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EABA7D93CF
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCDC10E965;
	Fri, 27 Oct 2023 09:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2110.outbound.protection.outlook.com [40.107.105.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBCB010E968
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:36:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUGabeWcxiemKgjruwpPUSZZgdZFKolKntlzIKEG1N96qS8Qb5OTXDjw5Qhi0WGgbC0tLVZpJIej/+/hOhVOqfnQSAvPIBnj8Ti0Lk2wxOk7R5YHeTIBqRN0JORHqfw2esSZ7mMkJAgh0j+NBqtY4++B66FremUnxy2uCfR3O3H/E7YBq4rQv/kQAIB3VjmSaz28cERuVRwyqxwwMdJsvXbsrxoBEX4nXzhvxyLgwRWUkzV04hVosX1Ytem7/2P9Sm/xUElH4b+IAh0tRyxG5RHH1bO/8BAo+sklz0FNPn5dVTodKKaWZ3Wb4j6YKtLQZGP0989qEFnrCOGfIfMilg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eUoGOhNV3z3k49ry2r2tTGICDpctwLvZl1lEtDE7pU=;
 b=caryr6r4MXAdSWnMSlIT5BeIe0+36j/muAAk/8cQqPt+JN62gEUuAIJn+FXGlw4BM5orM8kY1Aez5VKAU9i3QpCSVLHq/cp/zYFdomHlVDTe6nzVRS5mKMHgSzMvcE11p5yCK1Lu+Tm3TkF4mg1CBHdNWKN7y8PRjpfJlljqEOQ7YYkFx/HShvDGNXBTRIqnD4vgTOtHGCGHLG4lY/YXGtaZ9oLeHJUURkF/gSj1R7awWffnpmOWzFw+9StuaKb9tpJYKyXQkO6AAMU5TeSwGpR2TxyaH6ZXSc8Y04Vr/jU8rZkqZ6HQGDjNyQoGZqTpUZxRfxHRXpJBPW0zundTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2eUoGOhNV3z3k49ry2r2tTGICDpctwLvZl1lEtDE7pU=;
 b=AMwfS+FoVkdGzn6GbNWa26rlUmycQEtgynav9cKhqRTCJzBAteET3BN9HvOjhRnyHGSg+Stqae1QsznHy54BvwzGk7xzdz1UQd8EPe4H/aEPN6n8B80plqT9Z7Zp5EByt8JN5bN03HHvDEcQzuUpqefrfDa8hkODFcA1P0zwsmY=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PA4PR03MB8295.eurprd03.prod.outlook.com (2603:10a6:102:260::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 09:35:57 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 09:35:57 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaB//Vr2lGoiWaYEqV/lAWTsFsCLBccI+AgADxa4A=
Date: Fri, 27 Oct 2023 09:35:57 +0000
Message-ID: <ZTuEfY6UjOLPoPAZ@emil-HP-ZBook-Studio-G5>
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
 <5aa375f1-07cd-4e28-8cd5-7e10b4b05c6a@kontron.de>
In-Reply-To: <5aa375f1-07cd-4e28-8cd5-7e10b4b05c6a@kontron.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PA4PR03MB8295:EE_
x-ms-office365-filtering-correlation-id: 78bc2eb3-ed09-4b13-5dab-08dbd6d01fba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IjueICAJncbfwxFxr2/wXXpLkPBy/yI1E7O9nx+GJbd9Map8DpcG53gNIidTPoL6MRQmFUuiJAm13nbOzEMihZ3UlmXiIc71WnFJEs+0XxI0NSBTERDiRpkPrJwdhbG8XC65h9AmoWtGkoduUfJwldM6D9HQsXr5P7+D/ZLZS7lDx9jFCSb4LpVJHHVV7HqRST1dAmhv45a7L3vf0V0EAIjIMETv2tyt0ZcaNbQf3mqZu4LqiHKwOyLnzaF63jHId3+V7rTpgf8xJBRRbMcnj5nGS6+sPJ0CtumTTE1fgplNI9cqyR3UyufAkItu8afSklxe5YhGJfgMpArUdxCWrsm1g2HNgNpkPTyeKLE8fcgF2GAnQHgFwl/uIVVQ7oXJIj0nD68s9oumaApFzlwnTFZP1mdyOPc1DU4K+VYN0UMCAOdNA1oA/OAsRPdfJNzDo8b/rBr5onk5Sob5Jq3l6e/rD0KcO74c+3iKLfV4m7B70gqm4gVYZWS/4U2FIYohWU3ZYkCVmn9CLTdLD1yVXrQOI1vmeOKgtw2Q5q9/CIv3J1DzsD6sFpAuLxQa7xRLEqXYLTyXyWP6Mp1hDPuuH/GjnXcAVR/oF9hCTfQImfBLzXfCu6YTyG2poUJMJMc06LsG6czIl/+V8Vtd33J8ao/kPTfmB87kyGM+UWI/oEsJ783/YIngfx8nyeiZYscVWkKaz8C81FM3NIevH94KnA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(136003)(396003)(366004)(39850400004)(230473577357003)(230922051799003)(230273577357003)(230373577357003)(230173577357003)(186009)(451199024)(64100799003)(1800799009)(66556008)(54906003)(66946007)(64756008)(66446008)(91956017)(316002)(76116006)(6916009)(66476007)(53546011)(6506007)(71200400001)(122000001)(9686003)(38100700002)(6512007)(8676002)(4326008)(8936002)(7416002)(33716001)(26005)(5660300002)(966005)(66574015)(6486002)(2906002)(478600001)(86362001)(83380400001)(38070700009)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?M+yof0HR+XpKIqvtYM9N6Bg+7yhaNF0fMSGtxonh2HKMDbZPe5V99BMk3j?=
 =?iso-8859-1?Q?7mPNjSjBddfO1f0p/ycBrWv8ycpdsQFHh1XNpBGnbwxM/PN9/L0fLB/vky?=
 =?iso-8859-1?Q?HOxYh/y4QtFdesFiv8Arg6/FrtIIPkItVe5i1LkKWSPTq0n5J7rXM8Wrz3?=
 =?iso-8859-1?Q?XEG9BBIu3alFndcz82I7qNbqqMhIfuf6fSyaNZRxXniLxoc52j/pMKKa6Z?=
 =?iso-8859-1?Q?0GcX9agw8s8iklZpslHXMjBiGIrw37+Spy3os2f8SSnziHxQZysUq/FXiR?=
 =?iso-8859-1?Q?q8PmNtZDvfo9gJ8C4scRQgrLVfckJ88tVkoUCCFPV0kXD38IjcARMtG5Hd?=
 =?iso-8859-1?Q?8QTXAUkNBNDOPFYJ1NH+qCTHonW6KtUv7FrDk4vqeKdU/3vyJk/5gxXhvW?=
 =?iso-8859-1?Q?JEg0jyDF2zjdxkpWZPfobXsm+SL93ujdB9X/HpGSf/aEtjNasoZ5wybmdp?=
 =?iso-8859-1?Q?7OKIwDK5PMNgTILP/3sUW1FyXgD4Wr/Oa9otPqzC22GpYI+h5iLTy7IwBy?=
 =?iso-8859-1?Q?OSsIKH5qPvHFeWu1lkYgg20XQDfiMQvQ6PTpkPysXHI121t3Y47ZI0KoeB?=
 =?iso-8859-1?Q?5kZhs5HAlX8n9cMcf/PoSOfJrdvgPPslinOQJN4uAAJZLGkacejZ75Fvh3?=
 =?iso-8859-1?Q?S0mzjrR/mt8VRpvj/WCMl/aPwaGJZQGkweOmozR51WVbUNRrTc5Ebw++8X?=
 =?iso-8859-1?Q?4AAuE+W6UFgWQ2b7aSEHXHfi1PT50hZxEKRRR3CJK4MfjDPkd1Np3srjSI?=
 =?iso-8859-1?Q?3EiZ4rS8unQ2bpP0kJhrf1cYMmy2P6YxlREHYVgEUTeO1Zbqtwl8rsVDkX?=
 =?iso-8859-1?Q?PkBJTZ5d3ZStbbfhdN+0E8ycg0NUSimL+gH1cNd8Xs3x6m4v/eVq12M3aH?=
 =?iso-8859-1?Q?+JRM0yXZJsDF5FKGwR8a8669Ndpvyqf/myILpJq5G/Bam05TwvjMsvNDU4?=
 =?iso-8859-1?Q?cUFCTv14AJM8G36JqeM6I48vkgtXhUOWwmGpKRvSzcrZMQ67ov1PndEwYv?=
 =?iso-8859-1?Q?YNgithtBXA8hz3nSIlF/wMTHfneuqhVpO9fXkaTahl8PK9X1Uzmy+6WuzC?=
 =?iso-8859-1?Q?ssSOvYg4w7yqyHBu7n6tm8/7fXopq/nP+akvhA8xII/y4gBfuEkFZ3H3QS?=
 =?iso-8859-1?Q?tpVfCF55bn5yyuZT/zLZqNSXTZpm3aXwS+vJjZ/G9K8Z09PTZQjZeAoFip?=
 =?iso-8859-1?Q?l5FzXFaVnS9WPZt0VAk/gwpDggFE5SWqVHEYcdgIGusB0guz1G/cR15aUo?=
 =?iso-8859-1?Q?19yyPKLPRUKmMpY7kZZ9nwDQRAkIMTc2+gGCQX9JD5SV3SfBh6HJOE75SS?=
 =?iso-8859-1?Q?DP08tbvxQtqN26XnmeZd5B0k8r2u5aKH2tYxUZtjg1lXgqla0C89fKy/0G?=
 =?iso-8859-1?Q?zP/O7ErOxB0HLEsCXoEgciKgYn7bNqq8Tg5CJ+ICKX6d1DEBt4tCVEywjq?=
 =?iso-8859-1?Q?BIeshEXuTVNaY4m+gTrhRIwtbNoMRCIXz7cxuty/dVCjYhU4WL1fYtaTlD?=
 =?iso-8859-1?Q?Gr+uC/EZkb6gV1LPE5spv43KbjQ9Dli9cRd5AU5CKhys+B7hYOw7Ip5P5B?=
 =?iso-8859-1?Q?YNMhXOIVrmK0kKJDulN9tmOBMenirkL2axJmQa7r567/tZ6t9qSVwB/RNf?=
 =?iso-8859-1?Q?EfSVHWN7BrNDJbITGvySkb/LrwO5mua8De8W+6/g6lWg6Pn78qMf1HFA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <AB4C5C8216336946B9A987D8A2BAC7D6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bc2eb3-ed09-4b13-5dab-08dbd6d01fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 09:35:57.6531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y1V5dLY7YKnFL6e3sSsbyvPcHQsPiAQ8wT6dQi69kBBo1jRdYYbXHjEcNJWTOR/TCNH7gizjq/61rmwTKmpzkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8295
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 26, 2023 at 09:11:53PM +0200, Frieder Schrempf wrote:
> [You don't often get email from frieder.schrempf@kontron.de. Learn why th=
is is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On 26.10.23 13:30, Emil Abildgaard Svendsen wrote:
> > [Sie erhalten nicht h=E4ufig E-Mails von emas@bang-olufsen.dk. Weitere =
Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/Lear=
nAboutSenderIdentification ]
> >
> > Currently reading EDID only works because usually only two EDID blocks
> > of 128 bytes is used. Where an EDID segment holds 256 bytes or two EDID
> > blocks. And the first EDID segment read works fine but E-EDID specifies
> > up to 128 segments.
> >
> > The logic is broken so change EDID segment index to multiple of 256
> > bytes and not 128 (block size).
> >
> > Also change check of DDC status. Instead of silently not reading EDID
> > when in "IDLE" state [1]. Check if the DDC controller is in reset
> > instead (no HPD).
> >
> > [1]
> > ADV7511 Programming Guide: Table 11: DDCController Status:
> >
> >   0xC8 [3:0]  DDC Controller State
> >
> >   0000        In Reset (No Hot Plug Detected)
> >   0001        Reading EDID
> >   0010        IDLE (Waiting for HDCP Requested)
> >   0011        Initializing HDCP
> >   0100        HDCP Enabled
> >   0101        Initializing HDCP Repeater
> >
> > Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
>=20
> This patch somehow seems to break the reported display modes with my
> setup (i.MX8MM DSI -> ADV7535 -> FullHD screen) when I test on current
> linux-next.
>=20
> Without this patch I get 30 valid modes reported by modetest.
>=20
> With this patch applied I only get 5 valid modes. The screen still comes
> up with the 1080p default mode though, that is now not even in the list
> anymore.

Okay, I believe it's because I return when DDC controller is in reset. I
believe you hit this because HPD override is enabled for ADV7535 which
in my experiments isn't needed. But I will see if I can address that in
another commit.

For this commit I will simply remove the return. Reading EDID clearly
still works when DDC is in reset. Maybe because of the 200 ms wait?=
