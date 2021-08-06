Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD03E26A5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 11:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E656EAE2;
	Fri,  6 Aug 2021 09:00:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2105.outbound.protection.outlook.com [40.107.237.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47AAB6EAE2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 09:00:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZMt6eqhT/0+S2JKsbgAl2NURaclZ2fdgW9w4V7v6Rn3o5cC0mZMWCkUgZCbf8CbEtCStYgm3DozbqTPw6KrOd+1t5XBSs/IMe1MOOcj5fo6rMw4TpRZNPCw3/JhJt7ZDSGDzDnHLAqW27KTi4eiYGIKm0eWfjcSjKGXUcSftkyIOZ1kgPGjuYUASywB2c1WTII0m4dRaeTNsk20CnrpmksVFJdBFtPHtoS7QgzoEnGsWqjKsNiGUwYUAk73h7WRTNHlcmwF+vSB3TLJ2QxwK2MN7rHapnJVcB9mKu9MUON31JoTHO2Odzx6ixJA7V9HLVDJwRfAh+InkyebZJ9c/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3vWmupjqf9h8MKnCPjILYoPE4BSqhWVV7gfMYR5fhA=;
 b=CNRK/bjDlMoeJcvYl0WjGWvaqECD6ngTtNoG81PbT2Ix3GlmCeK6G/iUEgZPtS6kgmOx+lq0LCSLhir7nBS9RjZdKwNeu2+6taodaCVogcUqyN/Jf3S5A2yYT9T2EWWvdlsvQNYsErN+7gxPAilPro3CCR60Vas3xq47SRrE9nD1oQgGW7/snqDXYLO1VM1KNvw18cUIqgP8ZxiazqiJ0k709QIV/S5qyNcz2etvWL7Q9pWREvSy5Dv7RtvU1i1Li4NLaG23Qc2Kve81mbzsM2JTEaUj0vIhbWH/pLl9jc0Ux8ONEeeiN/aLhnibYingI/GhT3x515jryBCfqh00Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3vWmupjqf9h8MKnCPjILYoPE4BSqhWVV7gfMYR5fhA=;
 b=3bbgn8G038V+vXpO+AdZ5XGzJqcYZ1NaqiNuDDD8e4MuOgRyvZoI5D0X8CTV8429VgXrDOt/tNPI6anfKOHKrMkKTlGdSMSk+219hpuNmwvcKd43TnkY4ZAVPND4eciUS+pGmyLlzw4G7cYveolbTVHtSQ1ZAcf9rlkIoAkmUcg=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB7026.namprd04.prod.outlook.com (2603:10b6:a03:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16; Fri, 6 Aug
 2021 09:00:32 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 09:00:32 +0000
Date: Fri, 6 Aug 2021 17:00:25 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Dan Carpenter <dan.carpenter@oracle.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Torsten Duwe <duwe@lst.de>,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org
Subject: Re: [PATCH v1 1/1] drm/bridge: anx7625: Tune K value for IVO panel
Message-ID: <20210806090025.GB2189624@anxtwsw-Precision-3640-Tower>
References: <a565cb1662d2f8300905a369c575e19176fd8e4c.1628148418.git.xji@analogixsemi.com>
 <YQw9AKozQCPzk1wh@ravnborg.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQw9AKozQCPzk1wh@ravnborg.org>
X-ClientProxiedBy: HKAPR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:203:d0::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0003.apcprd04.prod.outlook.com (2603:1096:203:d0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 09:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23964c05-9c46-4218-a5d4-08d958b8a51e
X-MS-TrafficTypeDiagnostic: BY5PR04MB7026:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB7026C80360C1479D6C9A80D7C7F39@BY5PR04MB7026.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iWn3ydW8FUMYfCp3Dy6jjHo8KvqL+saduI5/QvMnnPSk4Q1+u3lmTs4oRaBzRjTKE0Z+adRW3XCabUYxszDbgCR5LEQRnyhkMhn9gli6Ko+vHTkWfvy7Ady+6TZ/D1Hea4mN6HoFbrHKgDg3TSlHK2dvac1vvhKI5RJX/+i9xgNa1s0qz+qK4+0WvHOLWKupXDruItX//+hnG+19JEOGEl7l7tGrigi8yOherfkb7Zh3X5Fvn7Apmio5JtUIMQ/GDx0mmKhcNy8rwwCE9jVUjZfMKhWwlaiO2Nc7iEReDEyRrBIXXlglQHr0tF29ufpqMhJAWPv+IW41toXpI8ZIEetxrPTT+coYU5FhLU1DDFROWZA8yCbF+YAiwdwQyryn+EIECqviwPraYyzVNH5gRJGubkMOJuCx1eT+FuzcVePNdOjwNiIN3wW+4IvCXmM5BH6AWgLaZ8Sa6aEgqT2+b28eVdzm7h81Q8wEjb0E5RH2ToErRAD9e5QFJFA/fxsw3sKzWuUuyiEvPt5l1xoev5CleV0u9QhI4b5PILXACQBH+shLLMIW4VJMVf5Y+8uf7fseWDFP42h1mACZuodGnQlgKgUOAK5mt4upS5u8iPDcuMmGiN6c3mEdIkPmyFP2XpY452H/QjuCSali5C/y8R8eNLGooOl1zUAW8FNqFyyt8vilWZxaSb9QiijXDFrNn9JpclwPtbe3xgD+K0TdOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(346002)(366004)(39840400004)(136003)(4744005)(956004)(9686003)(1076003)(66946007)(2906002)(66556008)(6496006)(38350700002)(33656002)(83380400001)(52116002)(7416002)(66476007)(6666004)(38100700002)(33716001)(5660300002)(55236004)(8676002)(55016002)(478600001)(8936002)(26005)(186003)(54906003)(6916009)(86362001)(4326008)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CRtG/dA8mwpVLe2q1rmInGp2Tmq1ix1dMm22zxL8jbfnahqWBBrWz/P73vNc?=
 =?us-ascii?Q?o3EKt06Bxz5ePZUAuiab5iOztX/EXyjboKjiP9cstUAxAT3vihuYcHyl2EpH?=
 =?us-ascii?Q?0joWrBwcYRpqnYQn2S/Vs24JqE7Jf9oETa4XQQ+4cOoD8C7tzrwpoesVYAYr?=
 =?us-ascii?Q?hhKMnUfYgSHCcfiTGXW4cPX0RwH0Oe/oP4T9sSpwiZxvMsxiuH1Z7AyPi6J4?=
 =?us-ascii?Q?lt8kZ06HyD97kg1xA1yHWrrS1OWBw0jK8vuWadHhwnnchSuObEOdTD/eUo1q?=
 =?us-ascii?Q?98l9A+sP+W9Y43MVEM7q6HkGDkB7zJW+Lxs9vGQMH1AY0/cmAFKpBmxS+Mq/?=
 =?us-ascii?Q?wbhTdhx0amx4ucC+mMqaUyWJKaC4FMMshJ7wXKu+q///7IV52jJeALK98Qxy?=
 =?us-ascii?Q?R7A/VDl+FC5voFbES4owhZvYVceER4fy223k981W2H7qZyNKG3zfpA8dyhOC?=
 =?us-ascii?Q?ch/uCiL6LEYNdLeQwj44u8K5vHx9t/xt0fSunqm2QqtKzbHPruyF4CLjyuuM?=
 =?us-ascii?Q?JpPSrj40YzH7oWf26L1lVKlJkCPggPsHgzcjsVM9INIBM1LGXgrAazFjtYcS?=
 =?us-ascii?Q?TqDmobD6NF0oRVZov3khBqnI3NNEdQ1C6saLBE328r5YdSiXJWiyLdziO8mZ?=
 =?us-ascii?Q?v5WWeTCzRlEB8NZV0T5hpExjfMf3JgCMIKcNvAYEWiP/ktBLKnF/9i44uxfZ?=
 =?us-ascii?Q?bOdN73my0SFplXPiNX9Nx986lT1E0CsBxuDaG2iJQtBDPPKegbvOAmnMoDjy?=
 =?us-ascii?Q?crMCWdlIyav8mHe/tJ0F1kb8f9Om/1P7Y9ECRJOSqTabFu2qED9/3ECgVv6E?=
 =?us-ascii?Q?SEO2dB5fji0QPltrV3ZkUcwiaDUo6bJBP0OMsuOUVSP2E4FKdU5qiLKcsoeX?=
 =?us-ascii?Q?5Zce8ZV/d87vx2CnbPEJ+6gDALLyzAl1YrdE33oCjOsz9ekQBKGHH4E2bO2u?=
 =?us-ascii?Q?9QS+C4rZ/MeQNG+hKu2NIH67rTxSWNOBZocdhYvm6EEzt36pcFz1HiUIUZ9N?=
 =?us-ascii?Q?eOeeG9qvpP/TIw30yOzKOK4mN8kte+W3OzPBd3YAEb1olWYY9IZXqZKkLS7f?=
 =?us-ascii?Q?HjFXVC08+k7kyOax01+QzqhUt7TXPPbrx+88nQEsKCP2w6oMFXwu+zMajVJf?=
 =?us-ascii?Q?4B+bC/ub6duPv0NE5WjtwajBJ8iuNUr+N384AOSUkG1yXaxKl73lwx8KhHWd?=
 =?us-ascii?Q?geE8m9RQ9YygZwOxwfSjwUshvvjfZY7Rr/4jbTC+CzcKlmOQSFfryzYagCrx?=
 =?us-ascii?Q?8N6GKBMXx+vPmn+fbgh5q+k2rcic7deLHxN3VGwj1dkl3KzuUnXD2WqLtM0s?=
 =?us-ascii?Q?jFbQMCHuJd0+SSNisqedlRcC?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23964c05-9c46-4218-a5d4-08d958b8a51e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 09:00:31.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ca8Zbf4jUP6/ENjuZvM0XI5F5ADbtik8ZGT3jaWoSornjJvDagHN/TJTlgf6tJKGZ5VMZwhbd6gBgefdfyvWXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7026
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

On Thu, Aug 05, 2021 at 09:33:20PM +0200, Sam Ravnborg wrote:
> On Thu, Aug 05, 2021 at 03:30:55PM +0800, Xin Ji wrote:
> > IVO panel require less input video clock variation than video clock
> > variation in DP CTS spec.
> > 
> > This patch decreases the K value of ANX7625 which will shrink eDP Tx
> > video clock variation to meet IVO panel's requirement.
> > 
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> Looks good, I assume someone else (Robert) picks this.
> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
Hi Sam Ravnborg, OK, thanks,
Xin
