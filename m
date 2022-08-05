Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868E558ABD7
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 15:53:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FBDB5961;
	Fri,  5 Aug 2022 13:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150047.outbound.protection.outlook.com [40.107.15.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677AFB593F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 13:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbZXQUHb9ZIGjDvlycSspAnB6LNvrUW5sUx2m3aIE7/Oqi4yF3iG5AG711mB3rPW8sOqznSIydAm/aMjoIL/JVVhV4IW2+jyNK0cUMuJF3VkboHVZUibrI9eYV4/rjnbfBsbV5sGFWbxBHV49dEiqVWHi5Ugi8Gkdb/EIPqO9AeLlWwH/ZaHdgSj/0r1AxSopbXUfWa40+JqRF4gTy42LUPoajB4vArys0p6GBLKW7Z07ObDCEAlTqwNhRDRdjoelUNqDgjrFpGtQYjfqzd/F2LZRy6GQuTd2ebo8p/ImiwIuoSIE+1qiYPgXbOntLXrk5BcEiROlIgmX7cIWfx+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1aHZakLKgyN/aCYstT3aJ2yNG1oV3I7auaGJhkSoZhg=;
 b=N8uEJniLkcZlM7IpJ9wSJN2D3lp1UIDTr+XRPqftBLyXIZ3B2PU2JzAEHXAZzlUDnMsCmn9AnwUIblPZo/wMZZFozHj4PgBDanFAmD9R0CqjDR+A7tFitA+Ki0XBWxEIQlCAiRqZSxEN2AN6byBW4YI+aU6b7BtvtVRitVDUtGj6lr9mXrTtWd7qrVGduPQWiC25/gXestkM5iOraNmwG9lVdq4EVYbf/F/vVtTRIVX91BNxsIgK8YoCbeULA7nBRkRjDQSsGcbQvb5l7FTjLu9Se28e+E7f8SDWvRbbuTxhq2UoEa5l7qQR7uCShtACdN/Sbf6hII+275g//Id28w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1aHZakLKgyN/aCYstT3aJ2yNG1oV3I7auaGJhkSoZhg=;
 b=lNMa76lQbm9XXyVIzUJOlx+p+rYQ+5H/enh7QtGTN/Oc1kjflw4zSOVzc2WVlxTTpZqY0zwPm66QmxGH5MeBDahuhJBjluOHkuTW6B8dfzbR1iD3P7cmSXoIKIy+tRTrhu6qhLeRZOr52ZMutUu2ZtkM96TSNT2CDTjqCrE+LlQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com (2603:10a6:20b:f1::11)
 by AM6PR04MB5861.eurprd04.prod.outlook.com (2603:10a6:20b:a3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Fri, 5 Aug
 2022 13:53:38 +0000
Received: from AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532]) by AM6PR04MB6743.eurprd04.prod.outlook.com
 ([fe80::4cae:16ea:e349:6532%3]) with mapi id 15.20.5504.014; Fri, 5 Aug 2022
 13:53:38 +0000
From: Olivier Masse <olivier.masse@nxp.com>
To: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com,
 Brian.Starkey@arm.com, christian.koenig@amd.com,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add dma-buf secure-heap
Date: Fri,  5 Aug 2022 15:53:27 +0200
Message-Id: <20220805135330.970-1-olivier.masse@nxp.com>
X-Mailer: git-send-email 2.25.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0017.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::7) To AM6PR04MB6743.eurprd04.prod.outlook.com
 (2603:10a6:20b:f1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce340460-a409-4f50-cd35-08da76e9e567
X-MS-TrafficTypeDiagnostic: AM6PR04MB5861:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cgJ7/YxjPrC2AVkJpHkPpOA8+anyjSrCV0h2cEpP/2Ekesxsju38YVd0i42GQErVKkvOoErt0CpoeATc+YYpnZG8QZcUXU6fwe4xBLVLHqjt/NwP30Ayu45Ri/LeKyQUHqEPrK4ULvChKXt8Zi0fhJem+VNzeKuuhaA9LrOt6BeYQuRrHFoE79p7aDYdP6fwQNkpYozPJfHGrfeXJ14g0G6H4RPNCUjMMMBqGgynSygRMPtUi20FjsyEd954SMWhELd5HXOqlXvENx44xEUNqXChDa3J7+H/E5v/cyvnEWCSjOEhubpHa3L6cBQacqSO2JDttrp+z6FrBSVHb/DKYu5lm5QO0mrL5NP7TvWgSyLs8BzSRCHjRH0KdnLWeYfMtw7N116hNuieTnjEEpR6EL54Kea9dkPGiC3+WMuHB09AnqjJfZWwoOJeELu89QENJhA+L6AEEzdDyJwBeZcMhtnnuopbL3uCDvzXxh2w4flaef7Q3zkgVaOD77RDVh3mQ0czMbugUrkVlcb8cMcINzZtY+JJGByukPPkTma6NfkXEmT8k+ImmroqdFqlfOcd05oXVYNe2/Z2B/hpb5xt8Qb2zKd5CgRJoQLMVBVnogU/TrCPmXin3xyyhX0ox6imCW7ODpbCgr2tCsgnjZq01JfbPk74hjsAzbElnwcvhySBPg0obK5lJQKWndopaUQRSp8UEj0l4e6MxrSkPvvR9RdFT/75uJh74b4KRCB35q+r5UAgQDWCeEaSy26TIJl2e01SzRvZrRxctu/thKTT2U+vV8oCfjDfpfPLh21THHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB6743.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(86362001)(36756003)(38350700002)(38100700002)(6506007)(6666004)(6512007)(55236004)(2616005)(26005)(41300700001)(1076003)(186003)(478600001)(52116002)(66556008)(316002)(4326008)(66946007)(6486002)(8676002)(66476007)(4744005)(5660300002)(44832011)(2906002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kOXH0dUb1AwznxBFpg2e76FrTyBbjj2OObGlbZAREtvwW87NHpP7qeBYR8jT?=
 =?us-ascii?Q?vhywzYLo+bna9bMejBy26Em9QjJDRQzqcZu4F258Smgb5PSmFcVUSLBCUjdE?=
 =?us-ascii?Q?zg7Uwq4B7ydgA2x7ntoCvmibUMdY75419EUlBibLjwKbaDP9A/7VgWocyNuK?=
 =?us-ascii?Q?cTsLIMCmCkH5X3XM8y7edNQrSTIFUIX9KYhaAm5pkQmEey9Z1+Ow4HUDdL2i?=
 =?us-ascii?Q?9XIpaj3F/9Vz/Jew5gnbHIuVxrftJNnjmzKurFB736qzszJ5Oz9DhldTauc1?=
 =?us-ascii?Q?8/G2T4/yszhOzEUKgSs+K+hPkHT5uqEpUoU2fVqShXa3rAKlIDN4/7c5opIY?=
 =?us-ascii?Q?ksQeqZnMpCKNeEq4InXI7LJ2p++etewCEJA29ApVLAjgQnJvDkrKaqeyxrl7?=
 =?us-ascii?Q?i7PMOziknC9wZvrsRRm9FwlVoNSCouDMWwmyvUjqm0WqujL1LK8Qe+3kfJO6?=
 =?us-ascii?Q?WvCIH+EsRc4O/HHWYVq9A/Ah+E0R74Sm4quk4GKwr4bC7AQ22CozGb+oprsL?=
 =?us-ascii?Q?7ckIHiUzvSoBCpsZgOmheVXgdI1sRZXZ/jhkkerSPapoY4laA1poVuUSZFNE?=
 =?us-ascii?Q?3FnBgZYKc0u2XxVVW2WcDpHJ6x7SeWWTCVgxn3uvniP+GXfKoXgIGroeGsDI?=
 =?us-ascii?Q?7p6VIe8vHNyZp1nAnzYuMpDzAq72P/ckLiwiqcWBdWk0Xxlp1h/qOt6dS4Uv?=
 =?us-ascii?Q?exe+9hirOCJlScDiUxSS4m4Oa6Tmxg0TTwqi20sRgW2WJRXnRIYgWHiTRKlw?=
 =?us-ascii?Q?pTc2pmzaIK4RKmBfxfrYy8EOaJqY/QgLup/NC21A+9Ql+wdCCY3QPm9taLpj?=
 =?us-ascii?Q?pxK4y3ViGOXo/hGUmz6RZmDGwiptw1g2ohRN+v2vp5yenzhmqYyhznkuOp5W?=
 =?us-ascii?Q?iOYn9ddrmGFS3gfJzOlPIoV3d+OTCwHPH+zQSfk9AnHNgwmytoaWkr/tmrpb?=
 =?us-ascii?Q?826Jlk+G5GxGQPVS+uNKWZ3F5NenHtCpRmmnaIZM6BmslVcb/lBhQf7OO71K?=
 =?us-ascii?Q?38KPOJAhVjuloQo+xDKswAOkNlSwiF68qnglcHVxWmLl0n8jyZr4v2fA4o+t?=
 =?us-ascii?Q?uvkF5IOb9Ka4DT3ZgqS9vUGWsIxa5D/HxboTjl6D5W5/m8LB5fU/C6et7C/w?=
 =?us-ascii?Q?glj4zPMzS/doYI8XybFMdf9m4TLjHePNEqackrntZOMvpqY8Y9D4S/7D3wQE?=
 =?us-ascii?Q?9PlVoRLKMB+5HtDYtv4VdA13dciMZxRkEd0iFYl4fxhx6OaA7co4VmzQveB7?=
 =?us-ascii?Q?6Unv5CPv/lYJM1aw98Zn/02LoFPfa3VYbGIzO3CPoJ55wnI07z04Zo8CBEUw?=
 =?us-ascii?Q?L+GdJq1k9mA+Emf+6bvhQMi9kgC5DjLnth+BUjjUX0RLPYkbVF98b8HS4bDo?=
 =?us-ascii?Q?tYYLUy/XMgVY0eEjdgeTz2Fzu2AfXoQVikDp36gQtjuLfFfG/DExo13/K/es?=
 =?us-ascii?Q?f2HGOVOKsZ/GJSuh1C4HHnOPi6RrZc2atOTPeZzkrSP4pORM5vzcRUI/HINO?=
 =?us-ascii?Q?Rb9JwQOWXSu+WBn3+T7W73IsBcQ8f9s6vVpNUivS9mAFmZ62WAoxwFd+AQMA?=
 =?us-ascii?Q?6I3lYEy6Mj3dttSZBai+SP13vcVJYUzUkQnhRFBm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce340460-a409-4f50-cd35-08da76e9e567
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 13:53:38.4119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEZT/HXClOZ69ToKpahY9ijdMgXXjfbg0BsLN/DNVa4vJEIklVRSK6BFKjocp3YOnznSKoxI5EHHawqqKZQBWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5861
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
Cc: clement.faure@nxp.com, olivier.masse@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Purpose of these patches is to add a new dma-buf heap: linaro,secure-heap
Linaro OPTEE OS Secure Data Path feature is relying on a reserved memory
defined at Linux Kernel level and OPTEE OS level.
From Linux Kernel side, heap management is using dma-buf heaps interface.

Olivier Masse (3):
  dma-buf: heaps: add Linaro secure dmabuf heap support
  dt-bindings: reserved-memory: add linaro,secure-heap
  plat-hikey: Add linaro,secure-heap compatible

 .../reserved-memory/linaro,secure-heap.yaml   |  56 +++
 .../arm64/boot/dts/hisilicon/hi6220-hikey.dts |  11 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/dma-buf/heaps/Kconfig                 |   9 +
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/secure_heap.c           | 357 ++++++++++++++++++
 6 files changed, 436 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,secure-heap.yaml
 create mode 100644 drivers/dma-buf/heaps/secure_heap.c

-- 
2.25.0

