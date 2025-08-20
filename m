Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB88B2DFB3
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE4FA10E766;
	Wed, 20 Aug 2025 14:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="QQjQVpln";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020126.outbound.protection.outlook.com
 [52.101.84.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CB310E760
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/XBnx5vJt2vu3YiL5gWoupv0qS6d8m2qw0gDfY3AYJXBtfyaumczWCvMD4OlXHrHINdMY4eBhqGTD7LIWDw6nHK13OKPnyjCsStz7bkGLRn6NLWfMFwFk7dekwY6MS+loo7qGOeqB3/klRFnamXcECKKuH25V25mYtpRrRVBur/GjZ2V+nYQplpFKW/YVGEMfyns2W4zEnCyhLcQYn2jo7qEzFOtMXXnRqRIWRWXxHV/3n+DZKNHjf6uNeJiarxhr1YUs4XOFlyUqHkRuPwCPcA+/0At2wYU2grDds8/SoeAEL7KG6KBbSzkWzyJvJm7w5IZuLam88yHLZmixhIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSoUTn7d9w/We7f7gTFtFfKRvZWdYSTndOLSDqFTwBU=;
 b=c+KYBVegP1EkHtDDCKOTXaKJIKF9XMUfo3M9cmZrM8P1brq2U2c8MygCkOVMGaYSlsWcZvY6LCK8UIqciK7Mb+9hh0G1vSYAe4K4od5UAPwQgwQGC7M09c06Bg7qbqTRRU33WF3y0H3Up4t4AgLh7CavlTwPVpDwFnvrlpbTKvXtMme8q8s5fixplRnNJK5SzjoWk9u+jZbT+Y38cN3M19/l4I5ZkIFwan+UUYxvUHga3OKzjFybGMSCyXhzUzuDLBwcaT+yG3WI+W2TciVrPYl0rodH5yMbj8/V+MrOyv/VULqY9TQo1+OOiY1cL4/o5k0GbEIikmUlWHUeDdHlnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSoUTn7d9w/We7f7gTFtFfKRvZWdYSTndOLSDqFTwBU=;
 b=QQjQVplnwk9RiJ71zKX7dNgNCVprq5IdzbaQUE8B1EtXil0Z/KXWhlUV+QDHgF4JTIaSkScsl5MKApXkD8EivdvBCHUQjriRl5E/WotMf37QQPPcJ6plXWKqeH0xX9W+U2hvsSqYKL7H5d5GQe1xOiN6IC7K7H+hPsYViKACpI4Dx+RJykTLGa3ak29juo4wHdya6vZ1bTM6Pc82f1ZfquUXw1JlVbROQMvK1Bc0/ED3m3rUEPwBmlje35rQciYq9LCDBDeoH72jC50/QBoYBtN3UTCtK9vEJo91Qg2HhDVMZeTmzjC/dCRYfZeI7xBNrUWR6A4S0jmPchSLKfOO4A==
Received: from CWLP265CA0489.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18a::10)
 by PAXPR04MB8080.eurprd04.prod.outlook.com (2603:10a6:102:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:41:37 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:400:18a:cafe::f8) by CWLP265CA0489.outlook.office365.com
 (2603:10a6:400:18a::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.25 via Frontend Transport; Wed,
 20 Aug 2025 14:41:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.0 via Frontend Transport; Wed, 20 Aug 2025 14:41:37 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com (40.93.64.4) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Wed, 20 Aug 2025 14:41:36 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAXPR04MB9006.eurprd04.prod.outlook.com (2603:10a6:102:20e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Wed, 20 Aug
 2025 14:41:34 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 14:41:34 +0000
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
Subject: [PATCH v3 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Wed, 20 Aug 2025 16:40:33 +0200
Message-ID: <20250820144128.17603-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0118.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAXPR04MB9006:EE_|AM4PEPF00025F96:EE_|PAXPR04MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: c64653fe-414a-477b-0589-08dddff7aabc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?2rHhMokZwYVp4GoePmYL2c/EPg77BRBV+b64ggFUNlG8TWnPisdQ36XTdwe7?=
 =?us-ascii?Q?taFERQAC/KpGnICdzeeUWPXnAXMVP3ujAkaJErYASrMhpyvXjp1meypFe+M/?=
 =?us-ascii?Q?7m6tTLAo6Uk6vQ9Cx1IRadDq4ktaFdKGJZ2rclNq8pMx3ilthKEss0nue92S?=
 =?us-ascii?Q?CACORfqSFVs2Oy/fsxYz+o/dR96/6sFcNJ3XJM0mpO6iV04SYtvCz5sl2OEK?=
 =?us-ascii?Q?LKF++F52M/j7ocJgg/XA9bzfmSPtPssU5HLNa8gq55XtS4+dte5XAc7Bi5xR?=
 =?us-ascii?Q?XZquUDTM5S3KRAQZ0vpaNe/jjOikQCTVc7+/WCk86cXlAo/zLo8gf0AjBtTS?=
 =?us-ascii?Q?MYOXUUgVg6Qo+hR40tjsHN25ezE98rTTNazxp5caNeMvdrAUrwQXtZxe2vPs?=
 =?us-ascii?Q?StV0ymd+MDlKw1CqspG1P5rRJas+IkNwvLdS1DjfbW4v3zyAGpCkoFNWqSl5?=
 =?us-ascii?Q?nKHJXuNKiNoqUHQ4LkUP02s7p4zaUENe8g9jzhG2engiw9O4XETPiouo+qaD?=
 =?us-ascii?Q?S5/dgNJ3e0TWeHiieQP38elwto0VGmdAPVQxflhe35zTiyHQa1MFDQtA83Gy?=
 =?us-ascii?Q?YhMnQ0wlY7bHpEqupYzaazJFKsy0F6yrPOXnBaitOpljygKzMkSBpA8nGEHg?=
 =?us-ascii?Q?TR/O9IC0WL8URuOQzNZeNxdgfhPkKJFnPoJv3ZVJLAJ2Gsvm4Lu5LBbsKEu5?=
 =?us-ascii?Q?aW/BfhcfNYKXPCC0uUd9WVMbs9bUrOShOVt31OWkeZqS0jZrtsUtUs4UHCAt?=
 =?us-ascii?Q?FDNTfV/Yt9vRKevSCTjFepSJQDYV8N63MXNZ7vcx3rExSYNzJHs5+3YFS9TD?=
 =?us-ascii?Q?8H0IcHhvdJRlQMBc+T7kg0Te7XO6oA1Tp/XGIHwkbkbkpUrdXOsoTnkTECZF?=
 =?us-ascii?Q?PF95zaessFu4fWIP8RCvnmbM8EN4xVhY1vLxLNA3CDN3zukzRw3sP9oY64Jq?=
 =?us-ascii?Q?ejiIZSem15uD3tEHDNztUWD6l+vHGmfu3yORdTbmPTUjHSmrAXmEsSqr6or9?=
 =?us-ascii?Q?2bWXs4zus0yP6jTgdI/w01H9m4K9P01zbeaPTIXR4+ATsHoCUIbQ3BgMIydQ?=
 =?us-ascii?Q?aWgPr6ryDP063duBNLUtoIP+TYxEkS/WUYCmxqnaNzpJydm/ZCsJNcGQMsWQ?=
 =?us-ascii?Q?LZDaZwgsGL44VKZIzmisUUAqUIODc5OBhAMIoPM48lkpV84aDS5MsQhXqDCX?=
 =?us-ascii?Q?EZZBjUxMNsHNsqy1SiyVSbXJdr/672nqEJNhGahzkws+0UP26kEig1LpUWLJ?=
 =?us-ascii?Q?3m5Wimr+69T0fPF6idLA2achIdpKGziQ1yy8i1+n2vGwfPoQtFkLxK+S5Fj/?=
 =?us-ascii?Q?RTnOjs3S+MVdimj2APVjTnQ2AGQ8pR6Ki3Dcy85lha/bXL7nVqbR1GDYPWfg?=
 =?us-ascii?Q?28CwGR27FcyVpwTFdu8S40ebVVBf+pWGjxzhxNnM/xXvkEGqKN3wYk/z7nxk?=
 =?us-ascii?Q?DkpQuhOeySEhKJpZlGFZkJqcbfEgLOVjsWatucP3O3TxgNYuAbU39Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9006
X-CodeTwo-MessageID: be5ab300-b153-4b44-b11d-a798301a692c.20250820144136@westeu11-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.240a57fb-1688-4800-82be-38225b2122e0@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0bfd3905-5d8d-4412-35dc-08dddff7a914
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|36860700013|7416014|376014|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s4PLA2pOpCFb8ieCQiiVv+0r/ayOGWjQTh/8FdM96PBqZ9PffrZ2iwpy4ctf?=
 =?us-ascii?Q?hW8KF4kzCqsBdrIDNR+Jnrz9bwX8y1/FQKeaD1mMSxllecz6iESvm2Dbto95?=
 =?us-ascii?Q?J2ThXyUqDeuw2N4NvAQPPOOAUULExQDYtNqEmYEQKMFi+yAyaRUPt5/pftB/?=
 =?us-ascii?Q?YnkVNi8CzHyLE7IBUKLbcTFft2fTmbx9vrdzudcOW1tqV26fdK02yc2TQMHQ?=
 =?us-ascii?Q?sTS11qBfJAxG2nglyJB0g3e8qBI0jVhVo8GBWm77eN1jMUgh8Fz0SQllfRmu?=
 =?us-ascii?Q?sY0W814QhhLMwuxx2HiQ3k9+p71w1Z1PPMPkeqYfWF1z7gYynTFDpOX5EQAC?=
 =?us-ascii?Q?9TVl06dgiLmhWdSF7Pm169ArXY8ZaF4bCP3YfcTGxGvIoc7jXTjxmHAtCTzy?=
 =?us-ascii?Q?QyEpR6keMw5alb9jM3ryd20QxzysMVS0p21SbrdfG9NvrBwB74kr+xm0FwFz?=
 =?us-ascii?Q?s06q84PujvGggSu2mq7bJ6S9+RIYK/4xGpPT+90JomWry5/0XVUoLi3ArIz0?=
 =?us-ascii?Q?+18BjgHP3HVvAyIqK5airkZWfoB6HkPav12X/IoGx/w1Z77iCZ2yq/FCtRyZ?=
 =?us-ascii?Q?DHpHRHVsW0dfcgX90gww2qQ1CYdbgxBZSyyQcS+ejcn9GFgsa6yGXbvtjGRz?=
 =?us-ascii?Q?l58AAmofPLj1tLYEW3chL/id+WraF/YFbSa08Mv08gJTgfO2Hq/2FVlUJiB8?=
 =?us-ascii?Q?b437sDRcUAkuYRAxwypfu/Hn8RM+kmv4nsAj0iCEdtyPekQrAw3kzD2DXbkK?=
 =?us-ascii?Q?DaTDh79i+ZyApY4sh63k0E3o1pstFbrBdI111ePsrXXDDyJE8Yc5meUXxQ7B?=
 =?us-ascii?Q?+W9ex4QsQX5BmTeR0KMY+gGS4Hu18eDXHh5e3GHQGjGPVM1ucH/nnlBTKW20?=
 =?us-ascii?Q?NXsYzW/uPiNZxviitJcV4x+s+w7VDQGa+TOqWGMcpzf/v3VNMskhVlGKILnZ?=
 =?us-ascii?Q?kDpiA4Q4EP7+w24E5OV4sDyJ0d08NI5FlDRQliAt6cUieQuVH8NhXe29XcfH?=
 =?us-ascii?Q?TbNQNSgGKfmIgQwqgfGvjZxqeIp3hwkugzj0BHeML3tlodYex9D3zr5EClV8?=
 =?us-ascii?Q?Ur8U61HZasNIH3xst6x327zElc0u9ua5BP85Xn259AroGDxpqm9DnMAoGFCn?=
 =?us-ascii?Q?XALFV/Db756K2nVAu8EmduQWtsDYx3pvj29U/bFf+Dxub/dUxxgjlpK2Purg?=
 =?us-ascii?Q?rRWEy+1/1n4OGuN4vfm18jD8adGHjeBf/9v4w+AwcJji08zgxEiZ4JL/FAkq?=
 =?us-ascii?Q?vOWrklXL0sx7F3Z27KJeEcXpuKZU4/HD1dkVOnM/XHlPUc4s+NKTMt71SB7n?=
 =?us-ascii?Q?Jp/NZvSdoUd4S3EgzA6hD2x/lNjotIV0Z0KX4F0sAvwFfxOncALXHxDHSc+u?=
 =?us-ascii?Q?wuexuIDRDo15ymYKKF64hIqVGqdb1EMNC4ekUrkNe0Xr2MTaNq9TPqWoqi9N?=
 =?us-ascii?Q?fE/BUWNKkcg=3D?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(36860700013)(7416014)(376014)(14060799003)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 14:41:37.0380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64653fe-414a-477b-0589-08dddff7aabc
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8080
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


In the past I've seen (and contributed to) hacks that model the chips as
phy or even (really!) clock drivers. Since the chip usually sits between
a signal that is (almost) HDMI and a HDMI connector, I decided to stop
lying and write it as a DRM bridge driver.

Our experience with these chips is that they work best under manual control
enabling them only once the signal is active. At low resolutions (under 4k)=
,
the optimal setting is usually to only use redriver mode. Setting the
termination to 150-300 Ohms improves EMC performance at lower resolutions,
hence the driver enables 75-150 Ohms for HDMI2 modes and defaults to
150-300 Ohm termination for other modes.


Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Document driver specific bindings like slew-rate and threshold
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

Mike Looijmans (2):
  dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159
    bindings
  drm: bridge: Add TI tmds181 and sn65dp159 driver

 .../bindings/display/bridge/ti,tmds181.yaml   | 150 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 409 ++++++++++++++++++
 4 files changed, 571 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

--=20
2.43.0

base-commit: 53e760d8949895390e256e723e7ee46618310361
branch: drm-ti-tmds181

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
