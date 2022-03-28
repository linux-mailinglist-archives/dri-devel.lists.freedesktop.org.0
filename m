Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 547014E964D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 14:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A19010E50E;
	Mon, 28 Mar 2022 12:12:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2100.outbound.protection.outlook.com [40.107.237.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3660310E5D6
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 12:12:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBESdYjJW+hmIV4dZRaesa/HCuF/KYDMT2LObBjoQf9akURhmx0+vOy/ja5ZeaZT2bQ4d85JjjPHks1hjd53M9PN2N9xQyPtRH0NjwHLH9abc7qOfJx6n3jj8fUVn4Eq1CYdPOQ5PwTziwKR26yfs8nnk7Y1Mxj0d+U0VwPQKhTFVJhlzx3a8zzlu5V9TncmNEhxTXCJQLCtohAuSPzE1mpyciRe7VBRjmPEusqFbM+Hyt7h6BKGVLBrYtmDF2pIK/o/l9fvVAxdghb5Al60nIX4Qwh2xv9fWoELft7n/xwsvlogXSOdIoTAp/SK7RaRn8oTSH9fLMwXC4J+Ay7JMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQSkMJ4/iMNvv5KoZfWixp6F/ioWt/4hRbhQR3wPg1E=;
 b=c27fbcUksZ6Pn2wlho5iwT1UoRL3vQ4L71WvVV7qrog8ai5QpjHqtN+xpie1+PD8ZKCLHhWws/4GoqbXDgIUbI702qJvNb0WjvPz972nO+Tq981ewopiKN2eI0GpOomj00WxwL4GdYw18CxWsMKdVAozcoVcoJ6YnbZZktt59BKnC9GtMKCQ15A6OSt9EgfnAMkRIKNvxLww0hK/c6DRPLmEEA+lXuSmfPybFg+xR1VeMSRMuUUTa5uOWX1VVFwU5gphtrJPKZyUz1jYtJ/v/CfjfWmE0Egi64BckS4Dhu7KVxTtgivvu85PyemXTARt2GVsZ2gNUkfDo6ygIFThGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQSkMJ4/iMNvv5KoZfWixp6F/ioWt/4hRbhQR3wPg1E=;
 b=Qm1Bh0QRtkuNaz+aUVf0/N8JOVWhE8pQkUy5KvLmmeb7JLtV/vwU9MknQzuWeULgY8RyLb/z1s8wXwPUI5xrAGyre5askSTniILecRK/+tiPKtn6phM5heu8LzW7GifKagIFfToDsxUVsijifEHFM2uK7aq3KL/Rbl8XRVIrKbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM6PR04MB4170.namprd04.prod.outlook.com (2603:10b6:5:9c::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Mon, 28 Mar
 2022 12:12:01 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5102.023; Mon, 28 Mar 2022
 12:12:01 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Xin Ji <xji@analogixsemi.com>
Subject: [PATCH 3/4] dt-bindings: drm/bridge: anx7625: Change bus-type to 7
 (DPI)
Date: Mon, 28 Mar 2022 20:09:54 +0800
Message-Id: <20220328120956.1848795-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328120956.1848795-1-xji@analogixsemi.com>
References: <20220328120956.1848795-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0208.apcprd02.prod.outlook.com
 (2603:1096:201:20::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55cf5dd2-6517-4b42-f64d-08da10b42a3a
X-MS-TrafficTypeDiagnostic: DM6PR04MB4170:EE_
X-Microsoft-Antispam-PRVS: <DM6PR04MB41708305ABBBD8FF02269B47C71D9@DM6PR04MB4170.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXV0uq+TBDR3Vv1RyCObNW5iGhwAP2vhqPhDJ4Qkv3mPRECyK+KTZA8u3wW3BS9lNUUH0M1R7C6e9EA7zhRqK29HS3fg32jsPKcDKVWtVUfaF/lmJAsab8kEp+70h8FuNWVWDtyLCNsLbN7r90wXuUGoukzUAuxpcLpf7+R9tNZMkfwQ74cjPMop3F9jCnB4KfDfqrosbnYdXNFXk7qb3W1RT3uf1TshI8yTbO/gBriMKkXMRwKiqP7p1EzzUW89q/Wm2p72mbTGOTpypE5Jr60Th5wriYhKpStt0ug/15E7miETflrI7qII/TXMBqf+94D1EqQE/vtuT3nGGwDA+53WEFYTwMgUsl+JZTNVVZ8AtdySLw/v3pET+OgX3CEMFTbpTXsvSTu61txAqZVeow1RtQFknuOpUYMl4cbOY+tZxN+72GXi6LV+WfdS8VJgfx2ue2xARToJg70Wsm+Xu6eft0zPgRBLWshxrv1qEaes1GlTVyM/7ykA7pVkLOLQfEDI3aejN1rVaHq5Ah6br+zArg+p2IbHWMtmaS6w2nMJgBRY1u2ZhQJVTxx+gGrxMaStUckcoV4X+YosJQXQ8/5IRoA/KfWYfvOQabxxcOpAtn0qb1fVy7onfErsB5Gt2B3yLHgd2jhbNImYs32Roge4OyFSqHpWozkc7fvBYw16+4hMljQPBE/PsX086zRL3+iAN8VIRBfTihY5M1CO9jijhK6aMP9dSYS+zibP2yg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8936002)(8676002)(7416002)(4744005)(2906002)(110136005)(5660300002)(38100700002)(316002)(38350700002)(66476007)(4326008)(7049001)(86362001)(52116002)(55236004)(66946007)(921005)(186003)(6512007)(1076003)(26005)(66556008)(2616005)(6486002)(6506007)(83380400001)(36756003)(508600001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nH4m5DsPNAJ2dQPh/B1QQB5MEIip8b2UVZx1ZUJAp/IaOw2wETvesNCEajAy?=
 =?us-ascii?Q?oHgBryWvXUdq+KWMPGz/zcBeP9ryIyvxf7a1hy7TebzdcUFq0mtxg48h5fuQ?=
 =?us-ascii?Q?iJQVLbGthjDaGvYx3uHcre+Oop1SJU9Lg3n8M2Ka1jIb0qmA8U3QwOKmnLqo?=
 =?us-ascii?Q?7JaLCFT3pwlOBUyHJOqpSE2dchW5tFl4jbmuJLrmJyHusFOr8NKI2Nq3ph89?=
 =?us-ascii?Q?v2dqzaHL3w6fXqk5oTXtDnpS1H6PJaK7XanqE1Ol/y0i6NBPcQw6tYyshk34?=
 =?us-ascii?Q?ldWHwT5yeY6TBg8INkThsDNgIrFIL+/eQYtg1pf5y09puQyK3LVnkCuykoGn?=
 =?us-ascii?Q?8rCYQWn0NGPjX0fSrSwwYh+UW21Q16ZZ21i4284ksh1+7fNNZJl11aIhqOCY?=
 =?us-ascii?Q?1vS23/iiCBVlTTm9b7jMkQ9LXk0b4HwjIfSEbhv36/qZLBA16fhj6GFdzdQd?=
 =?us-ascii?Q?3eLzYW1bqDVZ3FpKqfcwea0R8TZODsDZx9GRu9JF0UueBu+7ZV7aFL3HDOgF?=
 =?us-ascii?Q?EYrhwN2YrfL1F9VCR5jAXufzlFmpYsNmJbIy5tVAS0eNrfoeANarRmiWySLs?=
 =?us-ascii?Q?JG63iPHNsIxMtAgDJ9Ow5tDbP0/DbxO3UjrmAJ1XMtVZnijsNn+QZu0W4+r5?=
 =?us-ascii?Q?g0AILovhupesrovXL+JhE5/gjBPCv/GxMPblXGs9HsWvRrRf1lo3WBqaZVB3?=
 =?us-ascii?Q?NSBL8c3mYfdanaSK4umFOF7oDhj9uWcbOlz5eTJVRg09fERGuTLo0FyXeawd?=
 =?us-ascii?Q?uKT4NGqrZ2kgwBc3cbXID+M6is0lkEbbjpR01emGHLCF66qROD70J4BVXwTP?=
 =?us-ascii?Q?AepbRo1DYrkmYTYQNVyRshI9nV8ym2l908x7ZORO7T6xt3sr2rQI8VnQcKRt?=
 =?us-ascii?Q?DAhFOnFG/0NMCipC5rGsPdG9jJekkwHOysnAlt3nXuD3JyyQymoDJ3owhI9Q?=
 =?us-ascii?Q?UBo9miPHk7Vz/P2+GI5xRM61ytWD4GM63eRFq3/lQYxYIoNSyC3hMuuf23LD?=
 =?us-ascii?Q?NIRfhrCEJuqBycnbB28Cg4/6qCKtq3gz172pOxaJUaD4l2bGv2ceRbYe/mxL?=
 =?us-ascii?Q?IgKyamcmCg9WUUlMWD/p/XFjQ2kPx4sMn86nNrhBbhuY0OUcwpfJROCOIzz/?=
 =?us-ascii?Q?aok5G3gsWwqrnso7kZcIqaHRZQJncAtpTfmTGEFQJgvtLnztIf0fjaaD4Z59?=
 =?us-ascii?Q?1NKvkBAS03mUhiFELT4vehKRtryIYEfY3hNLTSNUxGd17EntuOtl9ZyHEFCp?=
 =?us-ascii?Q?9EVj7Y2F4gSTfxFy2iC+a2+voiIMXKeL358IXialgXInuD5zAKlyI2AdvmV7?=
 =?us-ascii?Q?GOes4fOXJ4IA07VMtFkQeRyGtSiYpXrhN7c1zFK9Nd8eQQ9HlBcAoEfKwslq?=
 =?us-ascii?Q?jd2eX6KyGQ3ZsG25kxOyE4pjtydCdLoNK/Ws5DeGhLhhDFMG95zWmqvGmX7h?=
 =?us-ascii?Q?iNGLq8fScYfTJ1ALtV+j58xWHW44llPXKxU67fEej6ukJjo4LCw0/8+JBood?=
 =?us-ascii?Q?+98MJgO1uzZGMjNrgE0+g8kL/RLfXwgoGFEwAdMgcZYaLDXEATgOkw/tVNmw?=
 =?us-ascii?Q?UsxXUD4nr1odi/iLGFOms1CyRYwn7kUjpIirR+NPgsDpcN2PPDlDiXm2QZOi?=
 =?us-ascii?Q?fBKz4Gg84OtEPtpQ2oMcmkhQ5eusmO/kbZYHdZ4GuU/8RQVs1irS2ZLNNOyd?=
 =?us-ascii?Q?cOQScD6oGL8oOkqBIUDZNZU0AYmbSYhqseiQ1s2Rjy+M6q945ah+FHMySji5?=
 =?us-ascii?Q?hMVhyauY/g=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cf5dd2-6517-4b42-f64d-08da10b42a3a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 12:12:01.7667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSoDC5jAGHN80RYt6Pa8j+rdn0NAiQKF+WuCQ2+0wVDwlV53sohOHPAr2FSfGERe+OCbUL1k+miyHGBzwK/WDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4170
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
Cc: devicetree@vger.kernel.org, qwen@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change bus-type define for DPI.

Fixes: a43661e7e819 ("dt-bindings:drm/bridge:anx7625:add vendor define")

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 .../devicetree/bindings/display/bridge/analogix,anx7625.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 0d38d6fe3983..4590186c4a0b 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -106,7 +106,7 @@ properties:
               remote-endpoint: true
 
               bus-type:
-                enum: [1, 5]
+                enum: [7]
                 default: 1
 
               data-lanes: true
@@ -158,7 +158,7 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <5>;
+                        bus-type = <7>;
                         data-lanes = <0 1 2 3>;
                     };
                 };
-- 
2.25.1

