Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD8562C09
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 08:55:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4969E10E1D4;
	Fri,  1 Jul 2022 06:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774C10E1D4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 06:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=freRwzimWtacX89dMlaAjrtSYnTahqXwz8VF+dcr9VW2fs7a7ZK5s3U4OT7KfY5QuxbWhP9Z3ZuTWjAXZiyJkoOz2kgkbNqoXy3TWaR45lT6RwF2i2trgiG5Z3ohbigfrEu9s28HF5IGQhfVI6JBJlQs7arU4OLx/n81pMVWKQlc8JicsY2Y7v6uxqLBFBX8Yq+QDfTpYoYhxTDghrEuHzBEhqC8UEzntGDWDJ4V4+Kpawu/25C7gPwjfDa8p3m/LclotA7lfpkyjLTJ8fMeJs6NMt8dzVJlPlVJ5SC99M/8MO5rcOfbs4CdkOX0wkAo2kmEV94LyS4KwhyPZ3NdUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KHx4rNO7a8rB3KtIBDCHaTlOtEiWdUo90H6IdOXbFQ=;
 b=TvD8CfRNemkvozq2W7ZPvUBvXRAh2l7MWaMKY1vsfvX+SCpCIoFL1I/SsSh4vpY1/6Cm+kAis0mIvmlotW2Twaj90MzY2LYVMoGWh5Nhb5gXcWHk44vIiEophWAVxOLM1yR7b1DYigyCDRI33XuvMRl0zv4hCYa779BqOYBzSwTfPVI1YCl5NxTPLo59SnCzlt0WuViAyvKLT5U67Kmuy1ibiLqQm3uZiB0KfGuTyzWgIrUwg7yaDuJ+DlGupgAslNpCALbueKzqt/PLutq/QZCHOdF7hIhrz77QDzZ6XQB1fLKYGJEjaf/BETvnDVFOnEBrvZGjibPX2tKuByI5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KHx4rNO7a8rB3KtIBDCHaTlOtEiWdUo90H6IdOXbFQ=;
 b=k6VwSQQxo5EzzUn1mXnLK68ZtyGika+fAFhAnULLuZU4N0krxoVHzNc0hCI6P9b73bqV/WWaSQLuhViv2uxRmAcr33zuFmxHIYdIHpBSER6zkXJuwxNjwJNG++yy5P5KndBA7CjICXq470pgM3mwWRizAC0CR9DszFIiuHqjPpo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB5762.eurprd04.prod.outlook.com (2603:10a6:208:123::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Fri, 1 Jul
 2022 06:54:53 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 06:54:53 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/bridge: fsl-ldb: A few fixes
Date: Fri,  1 Jul 2022 14:56:31 +0800
Message-Id: <20220701065634.4027537-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e187481-9d94-412a-01e7-08da5b2e9993
X-MS-TrafficTypeDiagnostic: AM0PR04MB5762:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BFtqRQ/JkqOst4Mkg1+XhrJbz6zox+iUE1jm4jCqYCI2ueCM+XBX0FdYDsUEmxyFdbGY6dBzjGZrf0iOD2aQXZJvTyKBJFIOwgr32JdnUVMV0GcA9Z/3EeOUbKUI4PHBKu+002gyfSwqJBKy0QOUpgCmlAdJ2h78PWkuRzOSINK0I3bvMYN3jUKCwzxa0sBPkeTVLlhOVE2Z1sQhKc00EXpRrYVi0a8FtWa7s+qOP1CYG/lc26OOOCXyl1jxZQv4+xwEY0NgOBk7XxrHOOBgBJA13KRgm5FefSdI3Fsrz15DNdEuk8HQiaCnkykkxG9szPl9Aygw9VsMAqpbdA6PnHCRvm0yuWP6XD2MplQvn32T5aAHolNqJW+wAOw2UF3NUNUTL9YxPNeXnIe/zw9Iw8/5WTtR2GxQmM88O8totQx6GAfts2Qor7mPB46HvQA2xnZBx1U26NlIt1tg9ATIJcpt5DxAb/Zr9wixdMr60+KdNYeLI4DDKzrLQkfK09jgViTzRx9L46cLhXxoDTJnV0YJktLIMRaUnzjG/QWMLy1V51ZWeI88bmGX+v/xYFKsx0mCfpup/mR2ZZkA1gDkeWNWoPDW5po4miFn79McdZ8wDTO40CTSAdGmqsIt4ikTI1GaoqRv1ohmCgt2RPOH/KWtUDjzCR5/i9yjd0R6Bvevzkfmscq8De7MMTJ8tzNBNFbL3DxhIIIx/8VyZTEvP0F8YuSNJDfTncL/XG9VV69ZN09OFYTkti6tUjU/pYuNR5b0xfbFr/RKjV6jPOQ7AWY8QIjOvGQkio7WQKTUwQ49CoVlgILnqAk7kB2PBMB0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(8676002)(38350700002)(66476007)(316002)(4326008)(66946007)(2906002)(6512007)(38100700002)(7416002)(4744005)(6666004)(66556008)(8936002)(5660300002)(86362001)(83380400001)(41300700001)(6506007)(26005)(52116002)(1076003)(186003)(6486002)(478600001)(2616005)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Dyzq16QUQ2HUhXdVbWfD9Anx3lew25wuHP0afXzFosmSHE/YkUstKggYFLK?=
 =?us-ascii?Q?/6GYDrdbwa2OF3tsDJWjbzZgvgn/rIUtGlY1Wfx7huCBjz+6W4Z/ImhLyAJc?=
 =?us-ascii?Q?VYxGjAx7kVfducEoAcqXqcEQpvnzAC5Mt2b2hL+kxASI869bb7oTFJYqoDDV?=
 =?us-ascii?Q?EwBBjd7VL20us003Tt6QHRhgfkTxOTqaxlB0G5eyMt1PJRPBPu5aHFT16/A8?=
 =?us-ascii?Q?9vXOT2+LuMJcVcRr1CyWaCL1taIuQaPHNl+LGofphH7nMw2Uq/QmyWwAHHKo?=
 =?us-ascii?Q?MXD9aRQ8dI2fXkM4bDt9oNHPVAhRG4mlKSX79ahog6t5sPVWWLngc7k3WNpm?=
 =?us-ascii?Q?DqOLg7PQwSP2B596SjuecYfRa7XOSPop4QJWG9YlLuB0nFKEnOYAKKgZt2/H?=
 =?us-ascii?Q?1AzmbO2X0KXFS8EiYYTqPdBzJlzB/sT4hf27KxeseooUCOA5QTBD6xN8AzdQ?=
 =?us-ascii?Q?jRnTdluAGL33h7IW0CVBC4qOusujaaYa5392TG02ZNRm8HV0sKFlVHOyTzbT?=
 =?us-ascii?Q?fxApUwLE4mC4sZz3MM/Si0PakPThvhyU7IQaxJpzsNZZv0kl8OfeQo3rhKx3?=
 =?us-ascii?Q?ZPvKp7c1LQkTbBeFi6Dwch5oyp7GtqgLe56XxX0387B/RX+zo63+Ts5/+ejE?=
 =?us-ascii?Q?Ahg/ohHmAYST1/teEoAgfbA0v4357irjgrd+d9KRRUjGEWimP/yngXblh6/i?=
 =?us-ascii?Q?5/cfW6+Sa2vFDBzT9TLZW/jV0iws/GDCxyTeFtGfkOWGtYG1f/yE+aMLkDZu?=
 =?us-ascii?Q?vG5NqiqrIG0fXY6ekpKAjkJASJO94H//BxdzFXFNH7SH7c7OEXNn5DHZFwim?=
 =?us-ascii?Q?F3RGH7sO3ef4M0f0qFWztfoOy/0Mjo0aXVRCbZh5Q6FqEwtI4UlrElGeUBst?=
 =?us-ascii?Q?K9g2t2WdrXvhrkKsuVqvE4sFUPtgHvSkwf+4W69PeioCtmyxCmRUqC7E+v/o?=
 =?us-ascii?Q?6h1TuWbE+MbP5ml3FEbD3xpA/P+NHpiA8/2Kg+ynKe15p4uyciGqeGxfhbnv?=
 =?us-ascii?Q?ExvEmMplUFIEFrTuI7opgGoyUyaIvp0RZUrSkwVT5a5+jJ6GXfqxpAbpsPl0?=
 =?us-ascii?Q?Jay1G7PoTPOKMb/g6MPfbxy4qSXu702JrCg0ycjj5XHf7XGz8q357TuUallw?=
 =?us-ascii?Q?XhYMZgORDLlDfeJMBCH9jS4YdrEOZ0n2tZvtrIsFsSprIIRRspAR7ITIdooU?=
 =?us-ascii?Q?6GBftY/6kLE+QeNNePPlnAN0dT+ZsCBK93HxYMkhm/CE/gK9BnnZ6odg0VXM?=
 =?us-ascii?Q?dQ3otkCFiwcD/Iy490pd3Cwau4ufifViqcmPOGpqO/g0IMYEJv67mdecmvVD?=
 =?us-ascii?Q?JLuYuJoIQHMUNYYW7F36BUGdX41hnJ4hua0+Wrwy/L9FUSAA+j0OJgDA9sQh?=
 =?us-ascii?Q?AEK9hup7bU2lRf43tYjpOzd07qWm53lHz/D6LUKGSNbXLcs3DOzasb34L2AZ?=
 =?us-ascii?Q?B0Ptn6R8wv7JGUGcMzR2X7a5Am/5sG6hcjM82VtivWmas4E0DgFXMFVAu0gd?=
 =?us-ascii?Q?Fzhmqq6XDmV4Fr8FMTGaHn7ckFhXg53hWdzpcRQOG4N6Acg9ELRJu5syBFqH?=
 =?us-ascii?Q?YSfrfsGq04Udoz+q9WEmWPjol2RUCGVBy+MNRFtJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e187481-9d94-412a-01e7-08da5b2e9993
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 06:54:53.2486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iYdRBNLCvssXzfCzVQI0mk3y//+pCjCDyrL1/yZCIzmx8bsJCkezMWVKW2dCXmtYPKd5+yofcMoRzWe3YntdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5762
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
Cc: marex@denx.de, jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series contains three fixes for the fsl-ldb bridge driver.

Patch 1/3 fixes mode clock rate validation.
Patch 2/3 fixes LVDS dual link mode.
Patch 3/3 fixes input data enable signal polarity.

Liu Ying (3):
  drm/bridge: fsl-ldb: Fix mode clock rate validation
  drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
  drm/bridge: fsl-ldb: Drop DE signal polarity inversion

 drivers/gpu/drm/bridge/fsl-ldb.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

-- 
2.25.1

