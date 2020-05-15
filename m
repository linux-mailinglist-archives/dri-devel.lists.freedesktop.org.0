Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8851D463E
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 08:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418556EBD8;
	Fri, 15 May 2020 06:53:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770093.outbound.protection.outlook.com [40.107.77.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7236E115
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 05:47:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLG1LHFYkwOG/13CaN9YjKuPJfQDK7oXWiAFkjyPcwD6fc7BKhLw7nGN3SJ95iy5jLxSrElDJ8vDNyNr0p42zobiGkpMyObzj28WYNhzinojHJFRP7OAkzxxvV5As3xMQo/VxY+N9lz83tDTCLEF6Q4vEqpFqJbfwVpinWVIrJl31l4CUxm1QEk9h5aeeoHNhxKvoP07cEQ/TMV5OHdUHJG55cuW7nbCgytBI+Y9FKOe/LV+MALBfCm02pi6AuZxJhl3/r+lhtaGo2ncjsqPjsGVRyKjJjcP4weWZPjwYp+EsNm2o2F8qhgwvzzJUR+0Q7SHhQtRP7m47fZs4/m+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAtwRKp9mAuzqCypxqw/MGu697UqNGt5PSOWckM5FMk=;
 b=B1bWBEVkAheXy5Nn+HbFIPtub/psuw9Wcnhadj/dUoQN8a0jNT/XG6lUuX8ZhM40FXjXQYcBi9ePh7YQE0he3Ha0T/KaiKps4rm+l5pv7ORqGP3pPdS6LuOVv0TFCpGvCty069SEjX8285M2DZk4x/p5naA1AbIoRxlj153jp//yoGJtwsYwnh8J+7vVS1v03CcEYvs6xAonKHnDijlyeUeailqVh+/i695YWwfBx5D8bmbmVT/qjNjB7lhbRvhC+ieOx8+Sv5ytUuQZ0qjzdx/aNYA7iOajkdW1i7jxQfmaAyNVb8oWybEBZh58AIWCBiHdv2BupDsIv08In0OQhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAtwRKp9mAuzqCypxqw/MGu697UqNGt5PSOWckM5FMk=;
 b=LHcajwAyH1uiSPTro16B83GkRYLL8kmy18eU2roX2rHFEnRXM3q5BCny0J+fVZKQRBZFUhlBETUHh4FzpP7ahErTAUf+O+Sg4I72UraatR0pbuXAvW2Ww/P4ZHCoeymLJoB9w7j/VnsEGrMAt4uObLB10NA7yHo3F2gEVciUX+4=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6533.namprd04.prod.outlook.com (2603:10b6:a03:1df::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26; Fri, 15 May
 2020 05:47:48 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::4517:bcc8:a3bd:407f%6]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 05:47:48 +0000
Date: Fri, 15 May 2020 13:47:39 +0800
From: Xin Ji <xji@analogixsemi.com>
To: devel@driverdev.osuosl.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nicolas Boichat <drinkcat@google.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v11 0/2] Add initial support for slimport anx7625
Message-ID: <cover.1589511894.git.xji@analogixsemi.com>
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xin-VirtualBox (114.247.245.254) by
 HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft
 SMTP Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3021.11 via Frontend Transport; Fri, 15 May 2020 05:47:47 +0000
X-Originating-IP: [114.247.245.254]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea8ca748-e4e3-4031-1971-08d7f8937fa3
X-MS-TrafficTypeDiagnostic: BY5PR04MB6533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6533306235AFE27FF51A099EC7BD0@BY5PR04MB6533.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04041A2886
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Icg2AMDYxW4wwcFPVSpBXNnqsoXb1M6ZAxrPPql83PttfJu8ExzTkWRZyLyQbQFL1FguCVHO7eAC/ckXh821Q1M5eLFdiT+sMAySntM8GJHfpvYOsDBjUkOp5Z4rJO8ZvHvGQlb8oztJD0I6+l8pAkabbKElJOuJZbggbTt3jpXbfPHn0zKjp0DV9tprApYVivTYHbUrL1GsBXyMePN7+NjZJdjB+riyGb0zB1/p3BOrLUHjjMxBva4utvglTfliLCZY0smpk6Iaz9kOjO2pkBtJLdYU8bebB+cXI9LUmcbPEXXq9AdTT9vf6b0Dt7pWdHdMODbB/whXtb9svgOlhTTs7I49HX6oW71d9XW4IokMwqZKAeD2DqkPNouD9Bm2BPSp7lVcR1bpNQr7run6aT8SHF6vhhNSaZJKZU9pnQyUGRMeCL6w4RiutITMwhT3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39840400004)(376002)(136003)(346002)(366004)(396003)(7416002)(6666004)(6496006)(5660300002)(26005)(16526019)(86362001)(186003)(52116002)(66946007)(54906003)(66556008)(110136005)(66476007)(316002)(4326008)(36756003)(8676002)(956004)(107886003)(8936002)(6486002)(478600001)(2906002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: iCUHo4g7uiBR8+hS5b5Mp73fp9Ct32wQ3e9aHfNSmnHEL+/kX1tHx/vFYBsuXSqIx01JZbn6G+K2e+NEa4qDGwJU04GxpQHLVjsx2/OuB3PJf6ZcCunwleKERQNetZ/B4lIHfAojk36dtUiCkF7PrwZYl/knb4OCxspjAjA54JUZ3uq86JLr4fGWus/9d95u+eSlVL3P2XEnIscxbGxxDj2ugeTLYD6iP6IUeqSAVR223rnoQHYvjrliZKRqGwObR//7C3+caG8D0HUcB4oIacf3DLWKevPFUUplw7ybNm/2xtP/QzYmijUgP8OH/RgPfG6G2BaU/3OwpEC7u8XGG7hlUYNxB42Xx9S0MK1PeLiF1tJ+W0ju7rIDNKmc8IGL8IXKYXGDUQm2VU4r27fxPWeGNH3DitcvJbN65kS2mLiEARXChYObCWkq10Vray2D44huMBK2qi3JrheMlZ2SkYz3SPcZhTRRo4eQlLUUWZcX9FNgw4woqM4yhO7sRBhD
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8ca748-e4e3-4031-1971-08d7f8937fa3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2020 05:47:48.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhcqP552pHlzvHkpXXSB1Of/sQj96UaFZuwXLnvVsJqZrWPRNZezg+JuLSN+bI7LNsNkSAa6/BgSsBYnByrJew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6533
X-Mailman-Approved-At: Fri, 15 May 2020 06:52:55 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sheng Pan <span@analogixsemi.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

The following series add support for the Slimport ANX7625 transmitter, a
ultra-low power Full-HD 4K MIPI to DP transmitter designed for portable device.


This is the v11 version, any mistakes, please let me know, I will fix it in
the next series.

Change history:
v11: Fix comments from Rob Herring
 - Update commit message.
 - Remove unused label.

v10: Fix comments from Rob Herring, Daniel.
 - Fix dt_binding_check warning.
 - Update description.

v9: Fix comments from Sam, Nicolas, Daniel
 - Remove extcon interface.
 - Remove DPI support.
 - Fix dt_binding_check complains.
 - Code clean up and update description.

v8: Fix comments from Nicolas.
 - Fix several coding format.
 - Update description.

v7:
 - Fix critical timing(eg:odd hfp/hbp) in "mode_fixup" interface,
   enhance MIPI RX tolerance by setting register MIPI_DIGITAL_ADJ_1 to 0x3D.


Xin Ji (2):
  dt-bindings: drm/bridge: anx7625: MIPI to DP transmitter DT schema
  drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP bridge driver

 .../bindings/display/bridge/analogix,anx7625.yaml  |   95 +
 drivers/gpu/drm/bridge/Makefile                    |    2 +-
 drivers/gpu/drm/bridge/analogix/Kconfig            |    8 +
 drivers/gpu/drm/bridge/analogix/Makefile           |    1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c          | 1961 ++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h          |  397 ++++
 6 files changed, 2463 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.c
 create mode 100644 drivers/gpu/drm/bridge/analogix/anx7625.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
