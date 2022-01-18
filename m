Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93348492394
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 11:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C604112396;
	Tue, 18 Jan 2022 10:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20060.outbound.protection.outlook.com [40.107.2.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8340A112A21
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 10:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VLcjcxSPddkgVkGA+t3JKfXe2lp7w6AiscD8iCCW5kBc/SHv9+18hugMzSZTHSAJuhf3c1AdFUHK/yrf/gtB8V8DG1j0o8c49nntP0GB3EQ2ePGutrFp/Ub5iqhYhv79IL7gsoyIqdqhtD1WKDUIuCb1LHS0nFCohAim5baHdQb1A3pcqPyID7hrN9+Wjck8ot5jhSiln7dhoCK+paPknj38cAj9KO1FERvzXQbYkCGNPeNav05y8mjo0maelxI1tHSMeeAWIqbNLKzdIC3nqo6mMNVX8khXBJQdlV0L2z5eKtH7Y5RIpZ4F5749M3b+NNqDOQw9uDp5J0d+sKR9XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGFJu9ePxU9Hq1RAKgqiR955Jqrgla1w2AmwIRXifEc=;
 b=IYr/8kf+4CRWVakVrSHpUsamdKxGVef+3YEbzdlv6VIZ6FjbAFofyJrZsEUuf844TI4XPLOuDJXHOOFEp//e2jJhrq5xcu5a2vvwuQb/gRYPvIXiFzL48rAVCSNjjt07u/nXkmMxhlSdWaC48BQIFDXZ2EZnCxbnYjCK1JUOlgF71q3IdeChCI8Vo5ie3VbGB85rIbrnYGylvP74zBnrTJKnjnw7aeIYC9G0953i5KyzoqK17q2mPniYmp+DrCK5JKqZM/Mqe4zQC47gJF1Aq70y6BjW8c4oLF3Ba+jQEwcFJ7VbX96xADdC37cJLE5lObwYVXz87mgLXZ6meutzTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGFJu9ePxU9Hq1RAKgqiR955Jqrgla1w2AmwIRXifEc=;
 b=UqSKYo4i9Ho+DZz3jicsXdKH2kOZYDUoVDUeheBwwcVWWcK6jq5MjboeyE7UGSRY+nsosYJFv0S1GcgR5cRfrNpBuNFqvMxUfxKAgylc9YtK1yLz8XcQD39MlsQMlwkeIQ98pwfmzgIEbUgnWSMy3EPSyYBGOyiucJRuSwIbiis=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB7897.eurprd04.prod.outlook.com (2603:10a6:10:1e7::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 18 Jan
 2022 10:14:59 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 10:14:58 +0000
Message-ID: <1d945988f774732c204f9dabdb8fa5795f0eca24.camel@nxp.com>
Subject: Re: [PATCH] phy: dphy: Correct clk_pre parameter
From: Liu Ying <victor.liu@nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,  linux-rockchip@lists.infradead.org
Date: Tue, 18 Jan 2022 18:14:47 +0800
In-Reply-To: <96cd66cd-8e90-5f68-6009-f48015400aae@intel.com>
References: <20220118025918.1444288-1-victor.liu@nxp.com>
 <96cd66cd-8e90-5f68-6009-f48015400aae@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25ff25dd-54e4-43dd-d9ab-08d9da6b61c7
X-MS-TrafficTypeDiagnostic: DBBPR04MB7897:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB7897B1DE333F54D78ECE59E998589@DBBPR04MB7897.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bvvdOV6ymRnREx3S/IijYc9oOQbUCxRAPp5s0IDS7vEEib6gDpDTlT/BzCfjufN4JhziYZ2h1ZrdqetwSfYo4koHOhsh7aOwATEPI5dLQGRQrF+G3wHKYuYt6pcVLe2ozotf3olPb0zPBKZWYg8JLE7XgslM7YVCJxgVC8DTOjZ0vhz4GqZn+XP2EFMk+InuLrhxf93A3Aw7YF3MtCSd6yyL9Q52U/+8NnHc9pULtKIljPFG7zgZVpBnhAKds6ho81KIBHl1A6n/M56dVKoAJE61xz4cl2luFlCNbdr9E+mD0K2gJfzBdXD1Hz0YkNFLwBw+l3WyznU6HwlE5zSdv3H7OEP4fIB9S22PPBNGizLuVI4ANJLklh5PArMuaqkxMRwEoEVMYu/1meYJITqu8tSbK/m/AHoy7Z3KPJbowc3zkZhuQr2WnMkrzUqDxE2CzYR7HrLamGuiCWSSqglFYnqYuvaTzoD5SFx6pWGPzxC5RmyAkZS/b6oyJm/h2onthsyPUtyj+ttGRsVHBqxxG92EJVInCGxUDDlE67wHVScd/jCxJuI5goMKxw1OSVortQ8xWeSWIyDz4oZ5NwRT3oVSsBB30WgHe8vzzomCeF8luNl3cLMnyIwogGxkunBPqXJU1qDY0XWHK6hDJ5y88s5Ljw/nPz3wSpYn/SdExMOKYwmyHNV73mE6xKUS3W9fLlBW/dgFh3vquW3PHWYng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(36756003)(8936002)(66946007)(8676002)(66556008)(66476007)(6666004)(54906003)(316002)(186003)(86362001)(53546011)(6506007)(52116002)(26005)(83380400001)(4326008)(508600001)(66574015)(5660300002)(7416002)(2906002)(2616005)(6486002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFROZndGejlnYldxTzNvREFVZWZCbjlVNEZWUkFlZTZkcmJDY3dvNDBNSWly?=
 =?utf-8?B?RXU3TlhrakpiY1gzeWMrK2xOOHY5R3Z3YVFYTER6MDFCVnlsSGpUMEx5aE5H?=
 =?utf-8?B?aDMxL0lNRlhES3JnS2xjWXRza0p1T2JodVhMWElZUE55ZHJwNzBkcXJuaGIz?=
 =?utf-8?B?d1B5eWI4OU9QbSs4aFdYSWwrNWJWeXAwSUpiOWU5WHJGNnpwWmhheG51VHJx?=
 =?utf-8?B?TVZxUEVkcWxSSjlNVnN1QUlhanRSbVZlanl5L1MySWpraTJwbW9xbkhaYlVR?=
 =?utf-8?B?MjEvbjF6M05OK1ZFUDZiamdwOFE2cU1YbldZVEwzbU9LTE5lRkZGTWIrQXRP?=
 =?utf-8?B?VHd2NHdLRUpzK05McWp5MGJVVlIybXB3Sjh2dVJnSmxQd0xjTmtDYTE2SDFX?=
 =?utf-8?B?ekxUQ0JWcmtoQnB0dTNIUGJnQmJmZDlIVEg5Z3FTR2Q2UGd1Nzkvb0ZOclpI?=
 =?utf-8?B?R1FtSkpKWklkNks3RWEvMzJjVEZiUS9qT1RQZUM1anBOSWMxQ3FhcXpiOGo0?=
 =?utf-8?B?NURJSUxqQXZHaXB2SlppdDhGSkVVQ1hoQ00rZ1dJdTNKQVZMcjBtSHFWYisw?=
 =?utf-8?B?cEpWRTRyb3JqYTduYVZDcUZzOG1BVWpma0g3RW5oOWhBcmpFOUFvTkxCUCtp?=
 =?utf-8?B?UlBaVDdDWUtFdlVDVjRrMXprMFAvcU9XbDd2RHluV3NTUC9lT3NUU0NqdXVW?=
 =?utf-8?B?TWIrYys2WksyWnVPY042TmMzcDJNWFQ3Nnc0aUUvMXlvQWNYa0FrN0k1SmZh?=
 =?utf-8?B?azJsazZqRHFtOEdrSUtuY2pRV1RseVJMV3lENUJ0RlJqK0FPWklkNGkrZ1Fy?=
 =?utf-8?B?dkdodERnWVN3czc5Zmt6VStROGhMMEpSbVFmRXJWN3ZpM0dzY1Z3c2N4RGtS?=
 =?utf-8?B?Z3RKZUFYcjcrSXRiOXlXamI5WWdnQkZxNXgxMnVYY0NObzJMT1ljbElDT3Ro?=
 =?utf-8?B?UnZvQWxoTHowL0FDUFplTTlYU1U3bHpkOUp5TWlWWXd6dm42UlVPRmpvcElK?=
 =?utf-8?B?OXdHelNiblhGcHpEN2hVSGhFMDk4UzNkQ3AzMU00UHgvbE9jT3BQZFVEUWlL?=
 =?utf-8?B?Wm0xT3FEWHhaLzZBYzZrQXFKSGxtdWN2QmJMT1VhK0I2VW5ZMHNyVTVYc0d6?=
 =?utf-8?B?SjZwNzZtWnNnR1RRd1NwRElvWjIrelJCZVVLaUt0bk1wYm1JUC9VOUpEM0p3?=
 =?utf-8?B?UkJ6bkNOTlA1aEU0KzZabk9VeUxRc0FMSGV6czhxbTNNYldUZTVVM3ZTZmNR?=
 =?utf-8?B?cFl2OG5zN3k0emxocGExakFiZVNOS0UrdGNlblpETllSOUc3L1hINi9CY3lr?=
 =?utf-8?B?QUlCZE42T1l0ZU43TEp1YVlrNEszUU9TNmI5ZUtaVWJTcVAxQjFZNFVpVHZV?=
 =?utf-8?B?ZVZmcytiSEJQZG1xMXFhejVScHNMNUk1aG43RDByRVgvMmNKZUFvVklneDBG?=
 =?utf-8?B?RXRzNHh1NFROU2g4QzFBak9vdVM4blB3emdyQTdteUpjYXQzWjF4MVo2SDJa?=
 =?utf-8?B?SU5RbEh6cVE4NitYWG81LzRQbEdjcE8rRWZ3bzhUaDBnMjl6RFRQdndIcVdL?=
 =?utf-8?B?eXhpR2dKZU95UHl1UW41K1NVMnBFSDA0bFlSN2RhMjk0aEFlT3dHTTFHOE9k?=
 =?utf-8?B?NTFERCs1YmxZYytCSnVZK0FIUGxCc2J0a2ZwTFNhWUxEelBQWTBCcnBlaVNZ?=
 =?utf-8?B?SVFaZVY5Q2UySXRBVWo4WFd0bkFwRmNUWStyUVVMNGN3MUpZZXFXbDI0eEhv?=
 =?utf-8?B?K1QyZnhsakZxUW56aVcxRTJmT3dscmoxUXZtY281N3JGS0hzNXFiSDVLbkNz?=
 =?utf-8?B?aXpYQU1RamdTVEtPSHB1MHRSSVhBTWlNNFIzRXBXa2RMNk9BS0FCRFZuaXls?=
 =?utf-8?B?UCtmSDBFY0hMN1Q5SG5lZFUwUjdSQlFOdWdiVlQ0NDk2L1h2aUFzT21nS25y?=
 =?utf-8?B?UUI3a08zcTEwdEVqYVEvbVhzenhKVUg3OUJPTmlaQTJ1WVFueUNnOHhQV1JC?=
 =?utf-8?B?dkFkVE8xdDlac296QXRWak82bC9zNDJiNEFHeElrcytUcy9zb0RqNEpRanZh?=
 =?utf-8?B?aERLSnZ2VDFYSWlBeW5KMUFwTjhmZTZPdGdMeUNIUHBVb1dFdjloYUxTMENO?=
 =?utf-8?B?ajlQZ0tjNnFuRVhkZytxd291SmN6RDl2SU5uWWRJSzFkSkt1eFNiVmpXUDli?=
 =?utf-8?Q?0Cz4zLjXgI7vqd2+h3+fAGI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ff25dd-54e4-43dd-d9ab-08d9da6b61c7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 10:14:58.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jab9QxRm+Vc0XDAs3uOhqoLhm9mc3ksGLBRUn3JTG+nPVBUbV9HsqtuGRFpClWgbUvCr9kbL1bFHX7rcfefV2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7897
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

Thanks for your review.

On Tue, 2022-01-18 at 10:24 +0100, Andrzej Hajda wrote:
> Hi,
> 
> On 18.01.2022 03:59, Liu Ying wrote:
> > The D-PHY specification (v1.2) explicitly mentions that the T-CLK-PRE
> > parameter's unit is Unit Interval(UI) and the minimum value is 8.  Also,
> > kernel doc of the 'clk_pre' member of struct phy_configure_opts_mipi_dphy
> > mentions that it should be in UI.  However, the dphy core driver wrongly
> > sets 'clk_pre' to 8000, which seems to hint that it's in picoseconds.
> > And, the kernel doc of the 'clk_pre' member wrongly says the minimum value
> > is '8 UI', instead of 8.
> > 
> > So, let's fix both the dphy core driver and the kernel doc of the 'clk_pre'
> > member to correctly reflect the T-CLK-PRE parameter's unit and the minimum
> > value according to the D-PHY specification.
> > 
> > I'm assuming that all impacted custom drivers shall program values in
> > TxByteClkHS cycles into hardware for the T-CLK-PRE parameter.  The D-PHY
> > specification mentions that the frequency of TxByteClkHS is exactly 1/8
> > the High-Speed(HS) bit rate(each HS bit consumes one UI).  So, relevant
> > custom driver code is changed to program those values as
> > DIV_ROUND_UP(cfg->clk_pre, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD), then.
> > 
> > Note that I've only tested the patch with RM67191 DSI panel on i.MX8mq EVK.
> > Help is needed to test with other i.MX8mq, Meson and Rockchip platforms,
> > as I don't have the hardwares.
> > 
> > Fixes: 2ed869990e14 ("phy: Add MIPI D-PHY configuration options")
> > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Kevin Hilman <khilman@baylibre.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Guido Günther <agx@sigxcpu.org>
> > Tested-by: Liu Ying <victor.liu@nxp.com> # RM67191 DSI panel on i.MX8mq EVK
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> >   drivers/gpu/drm/bridge/nwl-dsi.c                 | 7 ++-----
> >   drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c    | 3 ++-
> >   drivers/phy/phy-core-mipi-dphy.c                 | 4 ++--
> >   drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c | 3 ++-
> >   include/linux/phy/phy-mipi-dphy.h                | 4 +++-
> >   5 files changed, 11 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> > index a7389a0facfb..f1fdcdf763ee 100644
> > --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> > +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> > @@ -196,12 +196,9 @@ static u32 ps2bc(struct nwl_dsi *dsi, unsigned long long ps)
> >   /*
> >    * ui2bc - UI time periods to byte clock cycles
> >    */
> > -static u32 ui2bc(struct nwl_dsi *dsi, unsigned long long ui)
> > +static u32 ui2bc(struct nwl_dsi *dsi, unsigned int ui)
> >   {
> > -	u32 bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -
> > -	return DIV64_U64_ROUND_UP(ui * dsi->lanes,
> > -				  dsi->mode.clock * 1000 * bpp);
> > +	return DIV_ROUND_UP(ui, MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
> 
> I have some doubts here. According to specs:
> 
>      UI - duration of any HS state on the Clock Lane,
> 
>      TxByteClkHS - exactly 1/8 the High-Speed(HS) bit rate
> 
> I'd like to emphasize "BIT RATE" above (not clock rate).
> 
> In such case I would expect that ui2bc would take into account number of 
> lanes:
> 
> byte clock cycles = div_round_up(ui * dsi->lanes, 8)
> 
> So in case of one lane we need 8 ticks to get byte, and in case of 4 
> lanes 2 ticks are enough.
> 
> Am I correct, or I've missed sth?

Sorry, I think you are wrong.

The spec also mentions that it is recommended that all transmitting
Data Lane Modules share one TxByteClkHS signal.  So, usually,
TxByteClkHS has nothing to do with data lane number, but only UI - one
bit period is HS state.  I think the NWL DSI follows the recommended
implementation.

'Table 20 HS Transmitter AC Specifications' in the spec notes
that Applicable when supporting maximum HS bit rates ≤ 1 Gbps (UI ≥ 1
ns).  This hints that HS bit rate is 1/UI. 

> 
> 
> >   }
> >   
> >   /*
> > diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > index cd2332bf0e31..8a818cdb7606 100644
> > --- a/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> > @@ -250,7 +250,8 @@ static int phy_meson_axg_mipi_dphy_power_on(struct phy *phy)
> >   		     (DIV_ROUND_UP(priv->config.clk_zero, temp) << 16) |
> >   		     (DIV_ROUND_UP(priv->config.clk_prepare, temp) << 24));
> >   	regmap_write(priv->regmap, MIPI_DSI_CLK_TIM1,
> > -		     DIV_ROUND_UP(priv->config.clk_pre, temp));
> > +		     DIV_ROUND_UP(priv->config.clk_pre,
> > +				  MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD));
> >   
> >   	regmap_write(priv->regmap, MIPI_DSI_HS_TIM,
> >   		     DIV_ROUND_UP(priv->config.hs_exit, temp) |
> > diff --git a/drivers/phy/phy-core-mipi-dphy.c b/drivers/phy/phy-core-mipi-dphy.c
> > index 288c9c67aa74..ccb4045685cd 100644
> > --- a/drivers/phy/phy-core-mipi-dphy.c
> > +++ b/drivers/phy/phy-core-mipi-dphy.c
> > @@ -36,7 +36,7 @@ int phy_mipi_dphy_get_default_config(unsigned long pixel_clock,
> >   
> >   	cfg->clk_miss = 0;
> >   	cfg->clk_post = 60000 + 52 * ui;
> > -	cfg->clk_pre = 8000;
> > +	cfg->clk_pre = 8;
> >   	cfg->clk_prepare = 38000;
> >   	cfg->clk_settle = 95000;
> >   	cfg->clk_term_en = 0;
> > @@ -97,7 +97,7 @@ int phy_mipi_dphy_config_validate(struct phy_configure_opts_mipi_dphy *cfg)
> >   	if (cfg->clk_post < (60000 + 52 * ui))
> >   		return -EINVAL;
> >   
> > -	if (cfg->clk_pre < 8000)
> > +	if (cfg->clk_pre < 8)
> >   		return -EINVAL;
> >   
> >   	if (cfg->clk_prepare < 38000 || cfg->clk_prepare > 95000)
> > diff --git a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> > index 347dc79a18c1..67b0a17be7e3 100644
> > --- a/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> > +++ b/drivers/phy/rockchip/phy-rockchip-inno-dsidphy.c
> > @@ -364,7 +364,8 @@ static void inno_dsidphy_mipi_mode_enable(struct inno_dsidphy *inno)
> >   	 * The value of counter for HS Tclk-pre
> >   	 * Tclk-pre = Tpin_txbyteclkhs * value
> >   	 */
> > -	clk_pre = DIV_ROUND_UP(cfg->clk_pre, t_txbyteclkhs);
> > +	clk_pre = DIV_ROUND_UP(cfg->clk_pre,
> > +			       MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD);
> >   
> >   	/*
> >   	 * The value of counter for HS Tlpx Time
> > diff --git a/include/linux/phy/phy-mipi-dphy.h b/include/linux/phy/phy-mipi-dphy.h
> > index a877ffee845d..ab1f736fbcd3 100644
> > --- a/include/linux/phy/phy-mipi-dphy.h
> > +++ b/include/linux/phy/phy-mipi-dphy.h
> > @@ -6,6 +6,8 @@
> >   #ifndef __PHY_MIPI_DPHY_H_
> >   #define __PHY_MIPI_DPHY_H_
> >   
> > +#define MIPI_DPHY_UI_PER_TXBYTECLKHS_PERIOD	8
> 
> Do we need to define it? I guess it is just BITS_PER_BYTE.

Either way would do I think.  I'll wait for a while to see if others
have comment here.  If no, I may switch to use BITS_PER_BYTE in v2.

Regards,
Liu Ying

> 
> 
> Regards
> 
> Andrzej
> 
> 
> > +
> >   /**
> >    * struct phy_configure_opts_mipi_dphy - MIPI D-PHY configuration set
> >    *
> > @@ -42,7 +44,7 @@ struct phy_configure_opts_mipi_dphy {
> >   	 * the transmitter prior to any associated Data Lane beginning
> >   	 * the transition from LP to HS mode.
> >   	 *
> > -	 * Minimum value: 8 UI
> > +	 * Minimum value: 8
> >   	 */
> >   	unsigned int		clk_pre;
> >   

