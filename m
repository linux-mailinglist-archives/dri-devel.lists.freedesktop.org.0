Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F985346FB3
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 03:52:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFAB88249;
	Wed, 24 Mar 2021 02:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20075.outbound.protection.outlook.com [40.107.2.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284EA88249
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 02:52:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYJg2dsiQXRwaQTqW0qiY69SWZqbZNUrNn9WDSJvYqgnQqpnqFxiPzOtQ72v1/srEjjmgUktLtIUSY1NwJuYxBHHQMMfrHbOpHsJyqOcsKiPLu9jEIU+3vD1joE63SeoBCabh2Yq2Kyoe55UGH6tJaX+3rlWoTSj5Q4KdAd8ybUtlsk4M7b7VGWKQOb8u6EUYOFN4nHMFdkpGO1T1vdgr9PBarXq2J0kN71gEIe9QOg/CbguY4Ue8ja/yJmPvSJGgzt0LoJXVO7Z/P7r/oVWp1c+5u1NxQLzlK/qQw4HihLWrdANbG4+quk9i4Cgytfv9iuNB+oS0VlqKajIeQopuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3msbDLVig5TDeBeIUNlcBBjUdrbeWlg7fEQYMYDJ1I=;
 b=Um+qRwimqH6a1NaMIlPKjorM1izrvyhZETZJTcvfMQ0d6X81FPH3uRJHnXv+iUhzYm33eCjRrBryqRaGyQS4c3hsgwzGf1PtWZgrKKzsj9euXAt5z13tOWbQF2FoT6d20pdJNwOGx6BAB/DUqBNojQn0QOsbHXlr4NNLedmrl+oWT3AOdOyep2yFw7Lf2og8Lk6vAX3mPxrlr/2DaDazmELMgkr1R0n4b7N2TZm/cEBRsK0T3CJIojvzFUydzfkQMkEzzVllPr3j+sUxCmvG1VkBulJemG9shCDPNlYbsmVe0mRkFrbbfHjpK/MmXu5aCJzxBfOWa6M3CWW/yRbrew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3msbDLVig5TDeBeIUNlcBBjUdrbeWlg7fEQYMYDJ1I=;
 b=pIXX6pSWmwy3RHevD3MJHWN41xRWyg7pHYFb28r8nLOaMKSQ8ROlNfcItWk0b5eMYYr7oDxKBdUWgTADyTZlvZZJGUr/G4UE6KLqlg3tn/lhwzo7kAH5C6O+iqrbSGgJUcdSx1tnkAw5Oebb4RG9ad11hsoeFxHtgZj4XH9omGU=
Authentication-Results: perches.com; dkim=none (message not signed)
 header.d=none;perches.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5181.eurprd04.prod.outlook.com (2603:10a6:803:62::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 02:52:23 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 02:52:23 +0000
Message-ID: <957096a844761fe3069eff983ff308ae65e8d47c.camel@nxp.com>
Subject: Re: [PATCH] drm/imx: fix out of bounds array access warning
From: Liu Ying <victor.liu@nxp.com>
To: Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>
Date: Wed, 24 Mar 2021 10:50:49 +0800
In-Reply-To: <7ef41d771af88f84b650ff83771cd59eb745634f.camel@perches.com>
References: <20210323130550.2289487-1-arnd@kernel.org>
 <7ef41d771af88f84b650ff83771cd59eb745634f.camel@perches.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0023.apcprd03.prod.outlook.com
 (2603:1096:203:c9::10) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 HKAPR03CA0023.apcprd03.prod.outlook.com (2603:1096:203:c9::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.10 via Frontend Transport; Wed, 24 Mar 2021 02:52:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e146848d-253f-42e4-dc76-08d8ee6fd9b8
X-MS-TrafficTypeDiagnostic: VI1PR04MB5181:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB51817CA05D2D37DE08D9494798639@VI1PR04MB5181.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 53wuYKoV9lhPKt/p1fU6COmcCv+1yJip1L24nsjd4PgJMtZe5eFZgXQK7h2+C3+IIw5SZp5MbXWFCxg+53dPF20F9smHeTlxL20Jpt9+/OunynhwZHakkRUZm0/cLmccu/dC1Q/mnES+cpZ3z2uSdc58WdNVSD6WaP6THFjop4eqCmZ4+m+D3QeizZozHcdGoHMVC/N+IOCRtwalqCD6NSMzU5Rh37PlMeAtWs8gwhrxMxjWkD2wBq5QEyQYCNaKf/rOxkQdH9Adqu4GjfGcGrs5QTLZN/RfhQo+/9jm8gwhy65p4MIU8dlTgtESNNVkvw0/wTd/SJuOKP1lqrBqCgyEWyK4joCGvW4hi4dooZKBVhtnXxAamBGfVl4Sy/mzK7+RSK+l2ebl9mWtulryk4qx5AKkM/Fl/RBLHT/C1BE6E2VLdKSOgy6/lgQdj+ULc5SZCM3HX44u3j4DiB5gLCd6dgrBsTTG/YBJW2MSNAk8yLJCgxbRzwqZ6T0df7C2RXgIMWqu7tls3YE0MLokwiVTVwgaJq5U0lqbTlabqlYR6aSkKRHvQKRPpROJIvxgPYITGU7WHRkPZS79ezFt1CqxQs8auu5Ve4RmuGBZ6mpavCFw7lC7H4OC1cSTRwx/EdtRfawECTTrDcCaqitHGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(4326008)(2616005)(36756003)(186003)(498600001)(6486002)(54906003)(110136005)(66556008)(16526019)(66476007)(956004)(66946007)(26005)(7416002)(6496006)(38100700001)(83380400001)(2906002)(52116002)(8936002)(8676002)(86362001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SXVlUHFvbldBMGt6b2FZbGYwZkw4V0JHTWQrdHRQc0pvTTNJeDNCRllLMjdO?=
 =?utf-8?B?cm9BRUo4VytXbTg1M1ViREUrM0hBSCtlSXloYkFPWWxFOGs0RmtoTHpRbG5I?=
 =?utf-8?B?WHNSbzF2am9KVkJyeGIzZ0dpNHRKNW1PeGpUb3hWVVBGNVNXN0t4aExTOC9u?=
 =?utf-8?B?TnhwRHU3UmFnWE9ma0JlNmFxS3d0Qy9IeEVtVDRYaHM0VEZtTCthdk5WejZD?=
 =?utf-8?B?YzZ0azkyYU5GRVRIWFZGWjVmU3A5Qys2UEgxaUwzb01OQm5Qa3ppeWR6L1Nk?=
 =?utf-8?B?RldDbXVhbm1TR0tIaU9uOUFSN0dFMU95a1N1OXFVNGdwOTNkUG5LNlp6dDZw?=
 =?utf-8?B?K09XZTc4VnNzWHllQlBnZHBxclYvajBjOUxJcmNaRFRWbVlPSlhsTDVYNUgr?=
 =?utf-8?B?bW9NMDFwbVNwMGRYVStzYWpIZnlEVzltSnY1YTlMaFpISTBIR3Q5OTNyWEVt?=
 =?utf-8?B?R01SelFoa1IxV3ptV256NkRUYVlySTZUZWhrSkNsMHlQYi9BYWJmZHBEclBO?=
 =?utf-8?B?QTc1aVAxN2h1V0xJSVhleUNEK2cya0JhUXFEMjVOc21ISEVGSlRNWm9lcEd6?=
 =?utf-8?B?NXEvL0xDVGUzcGJsTnRkaEVPRjFtY3hLU0RLRHpjWFpxbzB1cEgzNVFwOVdQ?=
 =?utf-8?B?dHZFMnVJeWk1MSszUER5M0R6K0FlcUVGSEdraGFpWWxaNXhHakQzUWFMV3I4?=
 =?utf-8?B?ZW16eGwrWWxmYStLSndUNjVFTDd2bjVaZlNGN0xMUm9sTWc4TXVNSTVIQ3Jz?=
 =?utf-8?B?SEtpalRESFRQZ0hhWFNoTGxma0d2dlo2YjRjQTdLVUUydkwrdWtUZE5BRVY4?=
 =?utf-8?B?eVpWM3NxaFpGd3lxYitmZlJINkhsckN5M2pMazVuczNIcE9peExKbXI1QS9D?=
 =?utf-8?B?Ukx6cStISVRJT09ta2Fxc2NCRitxbVRrU2VNWG5XVGVsSFBRY3VEN2oxcDBT?=
 =?utf-8?B?T0pMd0RIMHYxbVJkamJMRzc1MEk3R1NxYTZXVkZ5Y0xXbTdvenZpTkRoZ2cz?=
 =?utf-8?B?RmNDTGo2SStHL0pvWFBSY202RmFFZmJlSjMwSDhwUk5YenlKSzU2R09wMlhZ?=
 =?utf-8?B?QTBFZ3l6YUVhSTJnRmgzUElkUzFwNlZ3NmphbmEySlg4dUUvNXFHZ1Fmcnpm?=
 =?utf-8?B?QUdyNmVwV0hDQjhTa2N4ZmRVNHZQN0xVbFpuN21iZWJacWVaNks4U1cxYzZU?=
 =?utf-8?B?MWNGNmltcWdjS2VCS0syRlZ6MmhlWmJld0ZiU2hCVWFpbzVJRlpoREJOSFd0?=
 =?utf-8?B?RC9BY3cxaVg4K25aYzV2SEVzdElUTkV4SlhDSTVSNFZmeUhEWDRDczVSaFNU?=
 =?utf-8?B?UXVjdkZIVkR6Y2N1SXg3UFJVbzJxSENsRE5xOWZiZk43VGFHNWlkQ1JQN2N4?=
 =?utf-8?B?NFJiVktoS215bFByRkpYcm03cXpGZWRDV1habjZRZU1VWnJvUzNNZENIaTBU?=
 =?utf-8?B?dGlxdDBEWGwvMEpwVzJQYjBYQVY3UkUxekZzYlhWSjBvNHZhVUVjOEdRcTMr?=
 =?utf-8?B?ejNxTlV0cUs4OFFrTmw0cUhIcXlhTThkd0N5cjVPVEZYMWFXK0RMazM2R3Jp?=
 =?utf-8?B?YmlWVktRempkNXBaYTRnN1NVUHI5a3g1S2hmR21UU3liWWw2SE0vcXc1U2VT?=
 =?utf-8?B?UHoxNm5rZWhNeWxYRkFPTVNNZjhIUWtjd3MzSExVN1lFbEh5d3ZZclBsSEo3?=
 =?utf-8?B?eVpXZWlEaGwzNHB0a0lMRGxmZW03K2FZeFc4MU42WTJKdHlPQ3M4RjY4QkZW?=
 =?utf-8?Q?fVk99KIb6wcSq9kzL98ESJ10hczn8vRpQ8oFIQy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e146848d-253f-42e4-dc76-08d8ee6fd9b8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 02:52:23.8724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CbboxsKkfgFLG/GXPnqls64rbOgDTEY37qWYCx/oJM8YUHPPYsbsFBbiUflXnC+bi6ttlAjvp8/IsuBfHWGfIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5181
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-03-23 at 07:19 -0700, Joe Perches wrote:
> On Tue, 2021-03-23 at 14:05 +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > When CONFIG_OF is disabled, building with 'make W=1' produces warnings
> > about out of bounds array access:
> > 
> > drivers/gpu/drm/imx/imx-ldb.c: In function 'imx_ldb_set_clock.constprop':
> > drivers/gpu/drm/imx/imx-ldb.c:186:8: error: array subscript -22 is below array bounds of 'struct clk *[4]' [-Werror=array-bounds]
> > 
> > Add an error check before the index is used, which helps with the
> > warning, as well as any possible other error condition that may be
> > triggered at runtime.
> []
> > diff --git a/drivers/gpu/drm/imx/imx-ldb.c b/drivers/gpu/drm/imx/imx-ldb.c
> []
> > @@ -197,6 +197,12 @@ static void imx_ldb_encoder_enable(struct drm_encoder *encoder)
> >  	int dual = ldb->ldb_ctrl & LDB_SPLIT_MODE_EN;
> >  	int mux = drm_of_encoder_active_port_id(imx_ldb_ch->child, encoder);
> > 
> > +	if (mux < 0) {
> > +		dev_warn(ldb->dev,
> > +			 "%s: invalid mux\n", __func__);
> 
> trivia:
> 
> Any real reason to make this 2 lines?  It fits nicely in 80 chars.  Maybe:
> 
> 		dev_warn(ldb->dev, "%s: invalid mux: %d\n", __func__, mux);
> 
> or maybe:
> 
> 		dev_warn(ldb->dev, "%s: invalid mux: %pe\n",
> 			 __func__, ERR_PTR(mux));

+1

The second one looks better as it's more informative.

Regards,
Liu Ying

> 
> > @@ -255,6 +261,12 @@ imx_ldb_encoder_atomic_mode_set(struct drm_encoder *encoder,
> []
> > +	if (mux < 0) {
> > +		dev_warn(ldb->dev,
> > +			 "%s: invalid mux\n", __func__);
> 
> etc...
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
