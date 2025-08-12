Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 376F6B22B1B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 16:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A9B10E161;
	Tue, 12 Aug 2025 14:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="vnkREB7k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021097.outbound.protection.outlook.com [52.101.70.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADEA10E603
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 14:53:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7IPe05xiBhB/eI7Ea6T5Xlx8P1oAnnMBj8GwT31onTpEquqwaYKGF3HXyb8hngl2b0pDVK9i2pOdpMPfMKuTPaATANXdx38gqC37D9ol455S9zlx/YfzayS9bHTdaW7wHGMvENE0orIPh7wOq+B6m+UpX1nR/oyfSuUvdsKcQgaLRI4L4YaaMSs96u9BunwRoWoaf8AD6+sL+6EukD+x3PrgqpmRhj1w3NWyKFSE8sWXtJgZ5i825y4yzbgEmuo+FC1XljO36jqMA8oXqhK4lF7PhVIgeLOVGemfWTwhIue0MyfVPME0EkKnBDJCgwWx7l4pq2CUHQpy6z8z7LsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obt947oF1Q0FYA4n9KZx+WnYEvhUmKV0P9XER8til3s=;
 b=uk58Hweu1wL2T9jA6Ip+A33ybaTHAmWLg5zTkO2xYFupfZKyu7oF7ddnaq4KBK4foSvWv9C8sDBJF4AtntrrZrs5S3l004akolooNIEI/1Ps/DJxu8dLCpxhBEcwP8+lgPN12fwlIS6YXBQj54RiZuUMpsrrL4zeB6VuQLQPppEOIjnNz5UprdKIB552Cpu3P8d4/u8wUzqwfknIXg1dEKLQy0dZ6wLcGNUSxGOt6wjok7znrfRUwmcJRm2BCiu4e7aurue2yoykYeP7dpdnVll2rXbYBi7DV5TVYBO2oBbTvfgjI53Ozhz/kTyfu6F6+fYx8QTBwzsclGSHLwsgrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obt947oF1Q0FYA4n9KZx+WnYEvhUmKV0P9XER8til3s=;
 b=vnkREB7kddT/6Ghah5V9FmtoeN7/L7y5WH9s3j/qgxcgGvCd9634fSaTINOQgXmbFXWzF0ccTC5Z8JI7HXhyZChPmzt6r7ByywrjOGUDVVNPyVWK9ViB9x6ubDEmuRGRQvxFtXDaR1VFFJiazO4MTV93/uebs7J6sq9BcLmF75ROo48XKMiXbWhM7XoiTYSf9a/B77ERE8x7/1Mbn44TWNpBmS7IxQZOT3JHjCEXrGFMCrvIUOlGtSfp+D8suM7DpQpjbxitNe3f8dtkrOc6ge+K7ayLGK0z8XRg9On1jONxyaeD+dOYt5WXxlr4jdBDfexei1hz8UYVoZHMoUzlYw==
Received: from AS9PR06CA0711.eurprd06.prod.outlook.com (2603:10a6:20b:49f::19)
 by AM8PR04MB7796.eurprd04.prod.outlook.com (2603:10a6:20b:243::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:53:07 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:49f:cafe::f1) by AS9PR06CA0711.outlook.office365.com
 (2603:10a6:20b:49f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 14:53:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 14:53:06 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com (40.93.65.12) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 12 Aug 2025 14:53:05 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB10742.eurprd04.prod.outlook.com (2603:10a6:10:58c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 14:53:03 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 14:53:03 +0000
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
Subject: [PATCH 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver (RFC)
Date: Tue, 12 Aug 2025 16:51:33 +0200
Message-ID: <20250812145256.135645-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB10742:EE_|AM1PEPF000252DA:EE_|AM8PR04MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e108b79-ca5c-4cb2-7c56-08ddd9aff23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?mXzIgRDxWcmGyOsEIER5Sy5IxkBa95Ped0qHG71kexySUUETlf0Ln1ojYpg/?=
 =?us-ascii?Q?BCVY/OeLi2pxP9MzN1XRMSUJeTOtJQidHJS0Rv+XbhZh++VUcZfKrGoy3N2q?=
 =?us-ascii?Q?72nuIUDBHsV3zHS6LgD9UR4Axa1UyLpzkOH6iUjSl3UVS6H+psAfO9MfF8S0?=
 =?us-ascii?Q?I9GuunrVRNktbW6X/5OOyHuks63Z3wmlj3gIanlP1BgAQYX7RE5cdWXFzxQC?=
 =?us-ascii?Q?QPcrYyPx/D6vZXLeUUfFTJxzc5wRlem3CiMasnUeA+MfEIcZpVvxapBKHacS?=
 =?us-ascii?Q?XXtQOe/J9xYZ5AWJ9a9WLwccF6RWMZ1sQW+Q+Wg7pRm6qWPkHHXaWTaEQGo1?=
 =?us-ascii?Q?WaoQrDEl71ONpTqZ2Cr42CTwZZ3uJ5yjt0/twg6Vj1y5R8gk2Gp+1bzx/LoG?=
 =?us-ascii?Q?2ETq4ekFLrAzcMkCL7fPdxw7UQfsnUFpKKyyrMaQnnT/F5U7PRw093NBzw8L?=
 =?us-ascii?Q?ZyOlbWtN2NtjPziOcxObNzaAp1gusodfI250xtG+wiVARA1DEptnBqW/0Vqa?=
 =?us-ascii?Q?6Z7+VjuzrLKQ18fpZqHPURPsq9wY4yo4EgGk8jmc+FUtQrlSQbcObdq/DvF3?=
 =?us-ascii?Q?DtfUya9zsaMN1YvaMCyjuYKMeeWgd4CKWGgu3P1/p3fdAoVHflOMRUwQ070t?=
 =?us-ascii?Q?Vhn8mYmzOE+GYEs4dbzaqV9z3n/Sc19ssLg/DHisPhpqpLcrKV+QoPmihF+z?=
 =?us-ascii?Q?8dEmUEmC/l3gApp75mU4KgKPUwc+afQmdwXO2NIooNHrx8YHu5LHuRyLbtwR?=
 =?us-ascii?Q?N9DIO3Vqlw7FTpLm7mmTFs3O6rbNRNkXkwDBypfnrf1ugHz0Gn2yHE6cWm8f?=
 =?us-ascii?Q?3hmux339EYu0Q+oTvC5kpz9v+II5fS0mN6Bmqo+fRpaYVit5noRDvm4sWRMF?=
 =?us-ascii?Q?TBQS3ktgilj98YeeOeo3Qs+hPH6b2h3GQrqGPT63ND6cnU2LcGHSLqeKdStP?=
 =?us-ascii?Q?V+n3U3c5Mh5vXrPm44fUnAgQZtN4lI9EZtR+T0WGGVzou6FxB/bUCUrxcmfV?=
 =?us-ascii?Q?9v0j2j+2hIrrSycZ+TVKinTxT/bgkKXyDy23eob+9tJoYpqmA3PRwL+A00lV?=
 =?us-ascii?Q?6TnZ/j+g2SyV+tw/DzAlaR6d2SgezUS20iYcwY32uM3LOm3WtlVEdKGde4hh?=
 =?us-ascii?Q?hYPRnwED914XfSzTBXQwTt2i4Hxa/tJ70kgztxADrXbew9KSd26JW8Z9DaYL?=
 =?us-ascii?Q?xMgledvZFCtHU3+0xVcgtzfh3AQLqXFtQqMZY2+Ckbh1wR5Ims3Acv2Xjfxw?=
 =?us-ascii?Q?q2AtVKSWmqLrlN5sPaje9xPhUqc9YnmU/jRZtUTsp4WbRvtPt5zB0dW09WHX?=
 =?us-ascii?Q?NbeMUZKHHtbY81KSSG2mB+VlL5mlr4YzrXmeluDRA2ZWNZhJdtcGzKTyzzuP?=
 =?us-ascii?Q?7B2DTGk1DIo/KC5eZ3s4EnA25msAbYbvfAcrMQIPvTFWyLGz8sCBdSfQlB94?=
 =?us-ascii?Q?uWYh77zV7q6jjLpsD3P86kb3D7lHOct6vzmdPchn9/L4yPPr8FHk1g=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10742
X-CodeTwo-MessageID: 4e119739-4957-4be1-b86b-1912e314e2e6.20250812145305@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.c8608b8f-6aa9-4650-b701-3b3ffa0b2b1d@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 58b2fcd6-0980-432f-f430-08ddd9aff053
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|14060799003|36860700013|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yH6RDI5lSvkgIZ5nbc+TsT1qI44gYigClh8wDHoxintPNgo7zIz+fuUFd3lz?=
 =?us-ascii?Q?yxXdne1jjeJW3/KEPz9yNCrHAckVq8F0regwXLDBxoncbhfzXYbrIHD37Sid?=
 =?us-ascii?Q?m/ZJtJ4fk1iCMCj6OVIoSfGPh8FF2Jc6ZSRyy/2QJZEBK2pegoioGB2AOu5F?=
 =?us-ascii?Q?G59XQNJev8O7f8OihoYYqObceh2F4D3hfg7hWwZGGIWMd+qo23fBXRzPyCK+?=
 =?us-ascii?Q?DBYmWsxDBJptNPrzy2Phwki3f1LL4K6JriWHNcaxp0o4A0dRtkhq8fkTJqu2?=
 =?us-ascii?Q?M0VrwiWuRMYSSTXxlGJiibAMXjWh0CISswjZm2BLPdnhUXqvLVRXnT4Ka3N1?=
 =?us-ascii?Q?SiSTBbVgBjaoZDfZU1HG+DZIXSShqHAnwPV8w6RJVpR0gNGq72l0/Hdem8/A?=
 =?us-ascii?Q?eu6WNbqRtzGgRynmGAi/yAXpGVKea0TgjiykdXADS5s+fLR5x0nT9j3y0/CZ?=
 =?us-ascii?Q?XS6mOMMiwvg1pwhqRXjG5rsai7K56lQONQcDk+dWVFTV1wOKAJS7FwgSSaMa?=
 =?us-ascii?Q?e4s1kQQ8JoszNDFu9DFoLwuiBzzO9auuoBeWe+wMesi61vNvTd1VuP5q5zIA?=
 =?us-ascii?Q?iIJugKded+su6ff7U/No4BoaH8R3l4jpNcJ2iM0/Ih16JjhFWS0BkN9pV4D7?=
 =?us-ascii?Q?jMzD81e7i8D6c1Ca2bXEEUwp2LwktXLx5InS8GIMnAZQ7yZLsW/c1gsZAttp?=
 =?us-ascii?Q?Um5w7iIAqJOpwONVe8DfNQeh4xlot6+cL3hyvuhAmXCjytsM3UBMYzIslHCC?=
 =?us-ascii?Q?wNntCweOHFOQFrrguBUb8JiTI4n0kSBHg5o9eyRkIGkoVebcrPFfxZe7+bYb?=
 =?us-ascii?Q?pPlHNbg9CG3SU0T9Wexzi9+SD+zu45/786QaNYRRqR13BNFyN8ATkU+tnjvP?=
 =?us-ascii?Q?Q0D5XYJX3SrGxxsLRQAB+hEF0wD1Vdn89e1OJvna0ujHGyze+Q8wCnWHxlTt?=
 =?us-ascii?Q?cXZLYUXGLO+exZaBBCK+wekW0xPrnEvGANFkzESPAfSZsP2zb68MyiKtcyAe?=
 =?us-ascii?Q?3AvOqpmqeqcjZkdwBTF+4KcZyuzoxp+rRXb8PIhR7rngTH1kuHWQtcOOxjnI?=
 =?us-ascii?Q?iVrmK+pAUnR6qLPHLKS6Qa5bcH+pyK/Tu4iXvA8+BYRmKppF3HkS4cWti37V?=
 =?us-ascii?Q?BerlpUwuh95LoPHN2pXeIsw3BmAhORtIvRf/PMpiw2cAECyb2RLcjG4S1aeG?=
 =?us-ascii?Q?EvlM/YNCyD0cShWqPMUdZu2ZTnFHSZ+0rJQS02K88w1ORpogq5OTShhOy5lq?=
 =?us-ascii?Q?mGmD4kyxOVYKOXg6TAYEQDB2tfM/EHNMVJu7IiyW3uyYCnOldHPzw9WMNH4w?=
 =?us-ascii?Q?BOOVqiPf4HQl1vkZ1qgIEWxylywtHwWQ3sh65xxMi1dxNw5TH44Z6nOgP24C?=
 =?us-ascii?Q?+I+74wSNnFJ9/m1vg9x8jISR/N2OR75pI2yQoEjNAbLydRbRRcNnm30cFmR3?=
 =?us-ascii?Q?zVdUR6gDC7vj6XinCu2fZTEIjN/bDMYKBcK7q4gApBtWUw4J0lV7EA=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(14060799003)(36860700013)(376014)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 14:53:06.2452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e108b79-ca5c-4cb2-7c56-08ddd9aff23a
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7796
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

I'm fully aware that both bindings and driver require some more rework,
the bindings aren't complete yet and the driver needs some more #defines
for bitfields and such (the core code is over 5 years old).

My main question to the maintainers here: Is this a viable solution?
And if so, I'll do my best to document and clean it up further...



Mike Looijmans (2):
  dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159
    bindings
  drm: bridge: Add TI tmds181 and sn65dp159 driver

 .../bindings/display/bridge/ti,tmds181.yaml   | 104 ++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 512 ++++++++++++++++++
 4 files changed, 628 insertions(+)
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
