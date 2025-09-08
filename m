Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9073B483FF
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D3910E463;
	Mon,  8 Sep 2025 06:16:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="Trl2g5zq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11023099.outbound.protection.outlook.com [52.101.72.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A0810E0E5
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:16:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cc5hmDhx3sG2ap5fYBWMeyHljN6A87XABDRE3EEGXOkIhChQLS6iMbYGO2HGMNLVsxRrUXkoKKnUj28BAPXoeBPbb8W11mx3zAyTH+JkIlEI/A9qhT0qutXCBRTHIrqaYb8DCTgVWw6AB3mnwfWHc4BwCh3Yy/7ba4xlKNeu8vm3v0Di/+KZ6/0o0lyiS8VW6LYjn7RWV1eVjS4fsqQqnU05VXfNqREVd4341fzjd0UEBcXMJodlEd637paXtPqcIP1m1OfMzxUwD3H/k/FR/exQT9X8PBPi69qQsiPrK5Yv6uucuGDFk/HZniexZODPfIObz8js86JdyleP1A0NhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PnJQ7Kz53FRziYkeu7ICIkEf7exuPCPw1kXVPMjxFA=;
 b=eq+KRrukRm1mCKTMNoTXt4xwowjhvjPUXroVpXpjVW4w0ncp8D0iLfKdCesj+fpTNidkM6dNxaxLTKpdfdQ2fhdtJAFCwZA+sfInBLFUm5yDUaeoz2646v0fsc3WovMe0d3z6cBLaVrkJXI2Owmx3t4Wf8uHzVazykwN2+kQlr6ZeeWN69IfSBN1C6Ceys+v0O2l3sE+HEA2h/hkLKc4E73lG+c12rTUuQu/j5KHGfD48hWJyOIqxyYqtGj+nQEjbjuUsqbZeJMel64/6UTTg8+3F6L3xktA1q+LCzuIvli7coo5tExu7YX5q4/uFj4hJaxGCHPLf2vNB/0wd88KNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PnJQ7Kz53FRziYkeu7ICIkEf7exuPCPw1kXVPMjxFA=;
 b=Trl2g5zqSBTxWkDeBqryybdeJgINA7qXrTNX4Y10EaqDxHK7tyYuHOucu9JZIncXqsS2LmqnsJGgmgxUQ5Klj3y0lIGRL4JoHB9bEP3PMRp2PZgXoO79/iD423Cwj1n/ECx7rnQ1ZVk0BN2pcAwEtCZF3Nioo1uQQ+9S1WbZ6j2zjQKs7hG2tRm0ku7dj9rS9LO2C76tfhFJim6rFXQ/P20F0XC6DvLOEYt9KdYmI5dL6Qlzd7kzs8dDvgBJ+1343phyhmmhMULoFNgGHENsRGuZevopabsj0xF4WKZ5q5W0KbRmx0bqjSPNt6Il00XIIGU6TjlXHQ3Xp2p9B/GkQA==
Received: from AM0PR05CA0086.eurprd05.prod.outlook.com (2603:10a6:208:136::26)
 by AM8PR04MB8001.eurprd04.prod.outlook.com (2603:10a6:20b:24f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.12; Mon, 8 Sep
 2025 06:16:17 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:208:136:cafe::cb) by AM0PR05CA0086.outlook.office365.com
 (2603:10a6:208:136::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 06:16:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 06:16:17 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com (40.93.76.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 08 Sep 2025 06:16:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU7PR04MB11091.eurprd04.prod.outlook.com (2603:10a6:10:5b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 06:16:11 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9115.007; Mon, 8 Sep 2025
 06:16:11 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181
 and SN65DP159 bindings
Date: Mon, 8 Sep 2025 08:15:57 +0200
Message-ID: <20250908061605.76787-2-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908061605.76787-1-mike.looijmans@topic.nl>
References: <20250908061605.76787-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.de794bf7-6833-4973-a353-90f9e4a06895@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU7PR04MB11091:EE_|AM3PEPF0000A791:EE_|AM8PR04MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: a0541e52-38e6-4822-18f8-08ddee9f38da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?MKgpX/WSUaHlRsZouwkwGVJ72fZyFlUz1Adjo9OestIX2iriTzo0zoZsm6Hv?=
 =?us-ascii?Q?8uiHVKa+6BvwtAms6wUWshAVBiCBfV5qrSYdg0P74kKUxMHHiVeJY2Ww96+S?=
 =?us-ascii?Q?vQnZV26Sbs9fPrF0pND0HENh00pLwRaUye6RKo8vXTxYd5cQwHIkbRHa8rn3?=
 =?us-ascii?Q?EZmRLeAzhSiKRcZ4usR3F0nfrciyVUS295PRgRcMRZuN8T/eIETyzxJIz8KH?=
 =?us-ascii?Q?Sw4AVhUKMyeeRXFOvlesBOtQiVv/1DQdMi2j9Wrhtwljqnapd5T8WsPKFItS?=
 =?us-ascii?Q?l9/oCx1nwA/JovHmqh0JkmqaqLK+fFqC1QD7iwH+DNr2qaf6lwGf5bMD/UWU?=
 =?us-ascii?Q?tVT7COUNCR7FcIPNX92pv5anlE3Il/b9F/RMR5CQXfryklSgk/kfLaBf0CRo?=
 =?us-ascii?Q?D0zzm8VGC5VB5N7nLER9tQL7GNfpBBs4pYH/jMB+K44FYL3n8IWUcwt6esdz?=
 =?us-ascii?Q?6yEYp1GYrEvIb0JyVuWKXh1wXYd8nt+2I0WjduXdj2SFb/Zr0C3hgd8BaIYh?=
 =?us-ascii?Q?HsQISykiaiLQxUu9lBG2WSbTpI5fvjFBAWlvGf58CfMWn/uARZ6Vvr6Ai3Y6?=
 =?us-ascii?Q?68F1/rCcxAWQ38gGe7hFYkmUt7SJC0dl9Lx+DxCpbIolRvYrgR7x3usOL6+D?=
 =?us-ascii?Q?Pk8zrUg6I8Ws2tsT8bi0cvIQjB3LL2sHimpM26m/Nd2E3//lOBMlY8NwHTul?=
 =?us-ascii?Q?IkD+61UEGPqa6hhsRTfQGsIMLOxF0XkymcTy+5cmT+/gjiBr1zuHNrbuWlO/?=
 =?us-ascii?Q?rpUxFl6IV/nqWSjckOoExwzAc4KQOO+9Jl7UAG8Wt70g7y/cce1aNVof5amg?=
 =?us-ascii?Q?N7wGKQCCXJd1zx8Nbgd93bRuVE4wg6rA8ZI0I2TA3XTrScSIDIkxQVKXAxcn?=
 =?us-ascii?Q?AgMVe7CxtZC7IDAHVOk2HT5wyx0/8cRmXCdLYIS1EfTebakTESlpmfcPbHf7?=
 =?us-ascii?Q?DPWYExxEMlEQoY2y/+oUTE/vCKpB/IIJV5X5MTlpjchQtUN2agSAPXIZgnJM?=
 =?us-ascii?Q?EhxKynI6lPOznR6tOoCBD1MU+J2t6soHPkhZEYxqo7lrXdkvSKq5PjXJEYYJ?=
 =?us-ascii?Q?sj09nF9MqtOHnokjFBvzvi2kBKBSQ1S30XmgytP+6VHi69i7pjFedJwZxhQS?=
 =?us-ascii?Q?1z2aXrsJMy5As882UwZPnQK5aTrPC1OL4zeM/cnDF9BfkkB9/SDypDTBn9Vz?=
 =?us-ascii?Q?F0YE3JOCWaBJVsan0UN6ZDR651dmO5oI5yDEQG1b53aGcWAXQyCBHtGUtFH6?=
 =?us-ascii?Q?XZ5tCmM+5ivTgK4SApF3koCGZLQGS7Vx5RIyJ9pMa/n9NI7VMenJsUIw0Bl8?=
 =?us-ascii?Q?5lSOwBN6BITK11ZtC4x/I3m/dGkFi0cwabZ9RdZnUJuOl0UWwOh25Ev1ez9Z?=
 =?us-ascii?Q?RUgYZaDzrasemomKecoyyEhN9z08L/MUDoLXWzRRZKR74H0MqKFHZ7jGbGDP?=
 =?us-ascii?Q?9mzPKVOoLPE=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11091
X-CodeTwo-MessageID: 1807405e-a5a9-4a40-b81b-b7ed13e3e03a.20250908061616@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3d1ea858-914f-439f-4153-08ddee9f350d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|35042699022|82310400026|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1qq7ZXE/IGoSLPcKZvLY6+NM92p71WzqHrZ5bX7fBd1pe2i0MMNB77dBENO+?=
 =?us-ascii?Q?oCJHluTflhU1S+hgSOv43FsRXQEF6Sl++LhodL3sdF2a+ZJAe8Zy1E7rfEgb?=
 =?us-ascii?Q?0KazSzTGmzID+FgBQhro/iK6/wndy2JZw4LhJ4xvrcQxC8VahQXCtTqqH0Y2?=
 =?us-ascii?Q?MHU1wa+8TnvH2gVnZxeQFCNn9V7XHSy0ckduzJWs5wWw7l3qJ+6RddEtf/ce?=
 =?us-ascii?Q?yMp+H9Wk64B3kuvad9tCSP4RdyVFLhz4auggfGaHXi15V1fxHEbftFpou/0f?=
 =?us-ascii?Q?8sr5cBIvUiIftV7bdkoklPE7/Baj/klxI428+/6qrYJRu4Cf9udZ35n1nWer?=
 =?us-ascii?Q?4QD/6hSN9rpVlklZ0S2VuYfKv7f0d7lTxC5xZoOTrSThVSx7iSsDSbTkxnUv?=
 =?us-ascii?Q?cdOTv2T4JeB1/KFRxRqQ/qYC79POkqCNmGrJxTOCcATe5RSPmhkQh90VGfyK?=
 =?us-ascii?Q?ZLI0bN4LNMPM3iPIstwlTg5iUEF2/VQx2HOe2PB6MKJhvF75lH5WkxzK+7Kl?=
 =?us-ascii?Q?dRIR+D5QYAUSoB2RcySlWnJvJyG1yJRankm/MbzDhXjob+52IyGm58vXMEXm?=
 =?us-ascii?Q?phLJRJufexwiZhr01nHdEAHEQv6/zlKR/NRQqeh4XNJMguu+abEzftru1GgM?=
 =?us-ascii?Q?Wueics/6H2burXudEWG3evvujyKa2GPSTFgNRRC21WEfibedn94qMBwwvC+K?=
 =?us-ascii?Q?t9o0uPco5ReEJpWCUNoiSt5n5ipSlS1FIeOBkFkPpmWQPcpqurlt5tIK2vKR?=
 =?us-ascii?Q?UT7YXPfZS2o3migOPPsPEzPAZ08vt3goPTpVpOPQJADg8dPiauI50fu4eWuj?=
 =?us-ascii?Q?zh9oAymMM1QRO/4RE6it2CwTXLb3xKWn7LP6AqlCL9MCWe0YDI4TAqaNfT/7?=
 =?us-ascii?Q?QcOWBxiOi7ty/dZOHAUdnhDGG/o3I+Y1/0RD/GRorJBrL7lBp1POlMXB13sO?=
 =?us-ascii?Q?kO6KrYG8nDBbomIj1FDAHmt46VcEqEjBjrlInp2NFTKSayqT4MX9m9OZgO+R?=
 =?us-ascii?Q?H3WYuv2bNJ3CuCB45cXylK5485r84oidSrz5jGSMxkNT3Zsr74DTEUhdLq9A?=
 =?us-ascii?Q?iVajPDVmj3IZC7+eAsTir3hr8wJmLR03JgOlDPnzWNpDbQ7A8IZeXceghmTI?=
 =?us-ascii?Q?O0/zC9h5/dqVGe6xCK2JSxNZjlgSEeo3qf+xpVWWIYUW8xJup7VlCUt2PR61?=
 =?us-ascii?Q?BaGMeojl5PnUa2Hr1b/KyPW5o1zZgZfpnvwCYbJOxZ9Qkrjb+aAciQ0m/qs9?=
 =?us-ascii?Q?8LhyD6kYd6Rnszm8IJNmJP5VaRPkoa+xQlQUF4O3Z4kchX/6BKUqDtFd/6j+?=
 =?us-ascii?Q?9kGckqy4IqzDVM+xVz+/HwB5a5gOrf07iRABZjzNq80YCETrqcOFJTzByvq3?=
 =?us-ascii?Q?8h/O2aDm62S3GaR4jIqQMvLWPCd6ff9AYHBjsUMn0pk7r29i6j/vkkF2+eaB?=
 =?us-ascii?Q?kDe1QUaLEzuyJuS1r7nkYBrHvV5TtsNBOjIQYRvvSFrE9KOGB/V6RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(35042699022)(82310400026)(14060799003)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 06:16:17.6890 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0541e52-38e6-4822-18f8-08ddee9f38da
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8001
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

Add DT binding document for TI TMDS181 and SN65DP159 HDMI retimers.

The two chips have similar register maps, but different applications
(source vs. sink).

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>

binding

---

Changes in v5:
ti,equalizer and ti,mode changed to enum
Rename ti,slew-rate to slew-rate
Make properties conditional for DP159/TMDS181
Remove ti,dvi-mode (always set to avoid conflict)

Changes in v4:
Use fallback compatible

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate

Changes in v2:
Document driver specific bindings like slew-rate and threshold

 .../bindings/display/bridge/ti,tmds181.yaml   | 170 ++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tmds181.ya=
ml b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
new file mode 100644
index 000000000000..aad4cc57dfef
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tmds181.yaml
@@ -0,0 +1,170 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/ti,tmds181.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TMDS181 and SN65DP159 HDMI retimer/redriver chips
+
+maintainers:
+  - Mike Looijmans <mike.looijmans@topic.nl>
+
+description: |
+  Texas Instruments TMDS181 and SN65DP159 retimer and redriver chips.
+  https://www.ti.com/product/TMDS181
+  https://www.ti.com/product/SN65DP159
+  When I2C control is enabled, various pin strapping options like equalize=
r and
+  slew-rate are unavailable. These can be configured through I2C using the
+  properties defined here.
+  A common application for these chips is to convert AC coupled serdes out=
puts
+  from an FPGA or SoC into HDMI compliant signals.
+
+properties:
+  compatible:
+    oneOf:
+      - const: ti,tmds181
+      - items:
+          - const: ti,sn65dp159
+          - const: ti,tmds181
+
+  reg:
+    enum:
+      - 0x5b
+      - 0x5c
+      - 0x5d
+      - 0x5e
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO specifier for OE pin which acts as active low reset.
+
+  vdd-supply:
+    description: Core power supply, 1.1V
+
+  vcc-supply:
+    description: IO power supply, 3.3V
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for HDMI (ish) input
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Video port for HDMI output (panel or bridge)
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+    required:
+      - port@0
+      - port@1
+
+  ti,mode:
+    enum:
+      - source
+      - sink
+    description:
+      Force chip to operate in "source" or "sink" mode.
+
+  ti,retimer-threshold-hz:
+    minimum: 25000000
+    maximum: 600000000
+    default: 200000000
+    description:
+      Cross-over point. Up until this pixel clock frequency the chip remai=
ns in
+      the low-power redriver mode. Above the threshold the chip should ope=
rate
+      in retimer mode.
+
+  slew-rate:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 3
+    default: 3
+    description: Set slew rate, 0 is slowest, 3 is fastest.
+
+  ti,equalizer:
+    enum:
+      - adaptive
+      - disabled
+      - fixed
+    default: adaptive
+    description: Configure the equalizer
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: ti,sn65dp159
+
+then:
+  properties:
+    ti,mode:
+      default: source
+
+else:
+  properties:
+    ti,mode:
+      default: sink
+    slew-rate: false
+
+required:
+  - compatible
+  - reg
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        bridge@5b {
+            compatible =3D "ti,sn65dp159", "ti,tmds181";
+            reg =3D <0x5b>;
+            vdd-supply =3D <&vcc_1v1_reg>;
+            vcc-supply =3D <&vcc_3v3_reg>;
+            reset-gpios =3D <&gpio2 1 GPIO_ACTIVE_LOW>;
+            slew-rate =3D <2>;
+            ti,retimer-threshold-hz =3D <350000000>;
+            ti,mode =3D "source";
+            ti,equalizer =3D "disabled";
+
+            ports {
+                #address-cells =3D <1>;
+                #size-cells =3D <0>;
+
+                port@0 {
+                    reg =3D <0>;
+
+                    endpoint {
+                        remote-endpoint =3D <&encoder_out>;
+                    };
+                };
+
+                port@1 {
+                    reg =3D <1>;
+
+                    endpoint {
+                        remote-endpoint =3D <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
--=20
2.43.0


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
