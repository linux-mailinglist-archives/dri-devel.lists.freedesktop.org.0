Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D80064E6033
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 09:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A28E10E91C;
	Thu, 24 Mar 2022 08:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHE01-GV0-obe.outbound.protection.outlook.com
 (mail-gv0che01on2112.outbound.protection.outlook.com [40.107.23.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533DC10E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Mar 2022 08:15:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC/zkJZdM7zyd7BUc5/4/zL5mvnzDiL3BTsZHRmRmVTUfZuVubAY87LW3Q/ERzAawiGeO2UjGw/SuiefjFwgWnFk283OMjIfsHby6/YKYT++WeH3VNlPlJtcMUDTu6kqNBYUgjUtgQ9/WzXlUsqQMiUkqAv6a0NZRy6QfwvbzD1u2e5SF2H12m0Ol5cJL0tkYMdQ3oyPVxw5xS4Iqqb5kehUYGd469IWbhU6yCxuSCg9+awilB0nLDfOKAM7oXPkQwg5IemAoc8zit9LuC8B3xgCFUNZDOc0Ri10osQ5OOTdy22ItE0yXw2pDrDsGVTkDgqbOAVDAOJWB0ShgXKJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0huro5pY/EbBxdjJ4ugI2PDy9ewcFkLxpjhnqdBvN4=;
 b=lm3EfoICNHooOxGdd2/M6RgFIGsm7ewK5V24yOi11SEidX8GVfjJ6GwOAArzmLzRlq1TFUYWvpfZnJj4/gkQXFu2V28u1ZGEoT4wFZ8iGIdsi3mE55m4Zb/5ovB2mGFpamWH9+8yjFhBYqGcK7+pQYxtRO39UMDXhvuAKh/hZ05fiOuf81Hr/Hld1JklfWvCh+kLOmCbeFqYxLlo1IjivcPiqEmnqNzlxKgYCvCOzwnKhyXtwMoDeYPOJCCf6O2y16gigFECqq2Q6AKnMsHeiD4jY96gdHeHQnikYjelEaqZODkJJFP2Vn0Wt8tac8nAMJSo3kl/5oppdqKeN5Glww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0huro5pY/EbBxdjJ4ugI2PDy9ewcFkLxpjhnqdBvN4=;
 b=nW6iTFnfdFeQrvNQd4w3hxKA8tJnqgC6yoCtK0p1m24PJg9nurt4Q6+Nul7MEot/39eyyXRFXNE5TS+d3nCiEiGmjwZ4J/4i9qkgxoMVHww6nnXVB4v5ptfBEamh/puvbKRd64WtMca9jKP/SyEWyWgcdESZhfhd1VX8CBglXfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR0P278MB0521.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:37::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.17; Thu, 24 Mar 2022 08:15:34 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7d6c:79fa:a2e4:ede8]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::7d6c:79fa:a2e4:ede8%5]) with mapi id 15.20.5102.017; Thu, 24 Mar 2022
 08:15:34 +0000
Date: Thu, 24 Mar 2022 09:15:33 +0100
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Max Krummenacher <max.oss.09@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [RFC PATCH] drm/panel: simple: panel-dpi: use bus-format to set
 bpc and bus_format
Message-ID: <20220324081533.GA249009@francesco-nb.int.toradex.com>
References: <20220302142142.zroy464l5etide2g@houat>
 <9c9a10ca-e6a1-c310-c0a5-37d4fed6efd6@denx.de>
 <CAEHkU3We_odwtWBXHdcwu+_9yEUo0mudC5sVjr0or0C6nbw+vw@mail.gmail.com>
 <20220318163549.5a5v3lex4btnnvgb@houat>
 <CAPY8ntDgWwXyWXDWVouzhdC2wsyjbRgfrvWGU=MRG_2sAquHyQ@mail.gmail.com>
 <20220318171642.y72eqf5qbmuu2ln2@houat>
 <CAPY8ntAjnmAyr=6sdAJWbmiEODHM3=Q3c5UnBCTNgyZqBsWBzQ@mail.gmail.com>
 <5ae44b7cd1f7577c98f316a7d288aa4cf423da2d.camel@active.ch>
 <20220323155817.xcsqxothziot7ba3@houat>
 <ab2db55f6dedba76cd112e4bbc43cf8a7e4332a3.camel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab2db55f6dedba76cd112e4bbc43cf8a7e4332a3.camel@gmail.com>
X-ClientProxiedBy: GV0P278CA0062.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:2a::13) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88010036-6385-4e13-83af-08da0d6e7874
X-MS-TrafficTypeDiagnostic: ZR0P278MB0521:EE_
X-Microsoft-Antispam-PRVS: <ZR0P278MB0521C1F66AEBDDF7F5820957E2199@ZR0P278MB0521.CHEP278.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EtfOY3gJBbkXyVqWppuGsKOdgPMhlqWALnj2yp5SDaJSRmp9w5wdDpINWrLuhA9yyAIIwliHlvs6ZesLV3VAVAdB4TS6ut8AyyXRarGJ4savDd7kV6YttW5ZzfZCiX4gc14FgYQ6Xy2o9QkYkFuT60SxGjX/ri5tVPpIcTWf43qJGkfIadzfRjJwgPdBdFbvq2Y41tgt9uy7p7XscnL3+VJiUzPgZWmqUkLOeZZwKs1DoupUAFJfuodygyGuHTcELBk4uO2q6wl7bSfYvcdTkquALkXhMQxU0zQdRMpFhgmUyfKe0/VlTEABLSSFA7J8LCB9d/ipRXB8bt1uv1AygouKu5pH2uYJKvF2PeixzJUD74/QuicFRCWS2ouDCLptld6fZzCLNfGTp3DSWXI12VKl3EL2TBh6RkfT/jvVwJ8txxB3RuW8Uwgt0hAa5gT58Py66BNAUwOENzzaSSfPmxt4B1gDgWXwoA2ZGie0ycXUnWQH6D0I1d9YJqyuONeSh1oEQ2pekJiS4W1cjJxELmmKvYlrWvTwdnAT5aaQJe7nNfB56MB5uI8gAj0zZ2m2fpt+q1B6VvVqvt+32tqrVttmik96VmIY8UgnY6NHkfmk3tAriQL+6oRQjfYqe+nMAy2ZonUVfDVQUz0Gx6+8PbLLj1fKhXXhny6knkysdLfZsEycmYn5nRez4vYYlu6T8fvFJlTLtXxCd4DlT6WOiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(376002)(396003)(346002)(39850400004)(136003)(38100700002)(33656002)(38350700002)(6486002)(4326008)(5660300002)(8936002)(8676002)(316002)(66476007)(66946007)(7416002)(54906003)(44832011)(26005)(6506007)(4744005)(2906002)(66556008)(52116002)(86362001)(6512007)(186003)(1076003)(508600001)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2gQxEJWh8XRxG1g34zyApnD36YK7qernQZ6Rf+vzjm54XT8+u2jhb5KlGBv?=
 =?us-ascii?Q?UeSUYb29LGhOrT6hKr0GqGxsUuxHlomMiAvWed+jf7kpPI32o5MFFy/I1sae?=
 =?us-ascii?Q?LwRZBUKdylDWTjSeRvEkJNTF49pM7u0r1BxmInzAuWqQACfjKzGj72Ullio6?=
 =?us-ascii?Q?2JqG/+cKWDEBf0DcPYj4L6y07cv7982TDg59AWYJw8ToVjhzj6GBzWdR4P/F?=
 =?us-ascii?Q?FK8pp17zfXWUORBjsn0E0fPPNlHW5GFL6+zX3E/dAopREVnzlCMQKr9vKJtN?=
 =?us-ascii?Q?478xqcs5gM94t6kXZga+Bm/zJbk0kZhfz0/RtlNuRLpCtOs3l3JFEe+JWrup?=
 =?us-ascii?Q?guVeY5W+bmv0Fm/Ihq0YIHcVwvm3xxvIcfMV9pZtWbB5OrRZbEHJTGkO0Ihg?=
 =?us-ascii?Q?rHd38ecHq20LRGZiP1bN7ItR8mS0JSEszkpBaaqmaojecOKRx7DkkUCVgWrR?=
 =?us-ascii?Q?8egy4spz6UJ+L7EnrARVJB2VTN0bONHMuCOediQNb6skQfhQYLQsfun7Mzat?=
 =?us-ascii?Q?BeXHrJyRlSRTVNdq7SiFKRSbzY+U68SnEMUlPWmqVvKhTGmFkgqKr3nPG9bJ?=
 =?us-ascii?Q?HX4UD3MR8UEIxr8VtxZhf4k2+hGhzn8GlVa1URU5pQsnFLxH2yJ+tIt7Ik5U?=
 =?us-ascii?Q?bYBuL5A7HiqjcwrXkDW1u+y703Z1GVlFE16Vn5IOes/ASYoRlONJ3+qlSw3c?=
 =?us-ascii?Q?s4JUZ2vWn1zdOqLUOeu4jOvnZSRIWdSIFSlXauHiStRohluZvwxcdxiHH6i4?=
 =?us-ascii?Q?5SOxPSb9CdLUNqb8sWRsIqqa1t+UA4/K72tPEQw3EsQ36JfzlMorrD+mGNfS?=
 =?us-ascii?Q?HBFR0ArWqYnImUQHjrghx5QQA6l2Fvg1B8RkBApjuf42hZskAai7kjcPtzf/?=
 =?us-ascii?Q?B71H1+qdmiy6YS9vcoF3iKlYPLyCD13xcIeYkdbf0a6RjO16gJad3cfZjHcW?=
 =?us-ascii?Q?aiJhvb8DHfhh4STDxPECVQCkFtn5mXaD+74Yy4nCVmxZD3l8mbUZyVJwEncu?=
 =?us-ascii?Q?tYzq3KuBZZidprhyFGA3cXR98g++GPIzzJBfQDJC0U5Srk9OTWbM6l9iYokd?=
 =?us-ascii?Q?qbur/jmDct2ghPCUqg+hNWkaffE32Rpw/85Fs4JsRwznoYvd2CYRPnaKvP+m?=
 =?us-ascii?Q?gZRlv8oQQiceTmy6Q7MrGOg19Nk1F5+y9SNkHJK49AJZC/dg/XEvDFm992GQ?=
 =?us-ascii?Q?1KjJN6vGTqrNkryUjdFgZFF42wQ+ov8RTextQuRL/PMJXsUPJro4Pr/veG0z?=
 =?us-ascii?Q?+5uEbem+DKRVGonv9nvAu/uCocB0SLkDJif17gUa8qHVWry5wJApWUnfFUCy?=
 =?us-ascii?Q?MSbuaDTAbXAjixDNpHRBl0+VXkh3H81XffFxqBow1AxjzrZdLfZgzahFdWtI?=
 =?us-ascii?Q?8HEdU/OEYS4GWqrUomMsR1egZLUO3OlkrvY/oDuNu2I7gx0RiaPgqUm6+R8J?=
 =?us-ascii?Q?wMbT0zzcZ/DUyYasmgwzA4NuEVazyQMg8he6R7mqeP1B0HNMpMvCSA=3D=3D?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88010036-6385-4e13-83af-08da0d6e7874
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 08:15:34.6842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNQeVSr48Lz59kMiTCbKKF/0jgwm08zoHEOJK57l3tHwHNeBHmamIokQGrmLbG39PKwpV4nTH82mslbsWqkrhTjwhRqmpKWEzAHE1f2X4n4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0521
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
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 DenysDrozdov <denys.drozdov@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Max Krummenacher <max.krummenacher@toradex.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 23, 2022 at 09:06:18PM +0100, Max Krummenacher wrote:
> Am Mittwoch, den 23.03.2022, 16:58 +0100 schrieb Maxime Ripard:
> > On Wed, Mar 23, 2022 at 09:42:11AM +0100, Max Krummenacher wrote:
> > > I would copy the definitions of media-bus-format.h into a header in
> > > include/dt-bindings similarly as it is done for
> > > include/dt-bindings/display/sdtv-standards.h for TV standards.
> > 
> > That might not be an option: that header is licensed under the GPL,
> > device trees are usually licensed under GPL+MIT, and we don't have any
> > requirements on the license for other projects using a DT (hence the
> > dual license).
> 
> That one I didn't consider. That would be solved by a newly invented
> enum.

IANAL, but we are talking about the copyright of something that is not
even a complete API, it is just a list of name/value. I do not believe
that this is a real problem without solution.

Francesco
