Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11956A6A4B9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3E910E5E5;
	Thu, 20 Mar 2025 11:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="KyzWO5cY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KyzWO5cY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2066.outbound.protection.outlook.com [40.107.249.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F31910E5E3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vl/FuWj2wDhCYHJ600RXWqNnHDm+Wd2zWQnQHBeOXLR3zzbBCnp1meWe3eu3wuGEb5fg2RQoabmIk9c5fDvWgtyfc7Rzwx4BAywS0Zwfe0Q6je2rxXlK+2tUxHMpn5zmSQlwC8zSE5iVTSiR/7oFGMgdNbKuL9QyLFuT/Dl6D3Y1IiPj8yYHWCEti7VXWJZccZIYxFabg0nT2AVurK+PbtBEW8Sbdms7PKnTcokw9WB6N+FJGU9h1ml/BEZ6BJlK1RjOYy22R7mrgwLAbB0tNhk0qKVUE55fxk7lipI/Cl46hkagllSTOn+VrQRPVwdYcKUr2fEWhMsgfkke9wXCag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRebtytzwduaT1yFLixubl//0RIkS3ONaXIJs4lqlBI=;
 b=jS1gdEm5R/mP/BVs3t57rNTxyk/0gZdO0/JQzL2KRmh+pq2i0G/Yi85glOWaeuO1u4wRrdBbTXWKTawcvneDryc4305qsP2dZzcVWd6DwuF0idTMa6Mv8TVRd3gFrRlG52c1x1VbstCKVB0VIZMfCQUbdGO7/NZVG5QK/3KkimAEKJpTgOpqHoBCgSOC1zbJ9hHkRKtPX0V5NWRyF+ZBNWMbw40Aw4xtMbwrVjFCbZbuxI9RALwHYzfFOV3oLToDbirFFfQ8tLZd5pqdG+aN1I2VLByI9XmytM0jjBeGxueWVVSmj2wJegVuhtzTuinctC9J3mUWHHjuGk0+lUjgVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRebtytzwduaT1yFLixubl//0RIkS3ONaXIJs4lqlBI=;
 b=KyzWO5cY1/MWK5m7EJN6vA6tAX2eIO1Z/3qI9ozdLJomCIAGXOTO/chmpxszRPnG2XVjIYIOXdqq0GGzRcjiJOYTxTNL5Y0gDkHYw5VB0UXqU6Q5oyH83akCJyoJ0HWhLFKdlotpt/OHOpkL+xsKK35qNIh2iuZwyp5FWO4zdnU=
Received: from AM0PR08CA0027.eurprd08.prod.outlook.com (2603:10a6:208:d2::40)
 by PAVPR08MB9651.eurprd08.prod.outlook.com (2603:10a6:102:31b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:03 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:208:d2:cafe::fe) by AM0PR08CA0027.outlook.office365.com
 (2603:10a6:208:d2::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 11:18:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:02 +0000
Received: ("Tessian outbound bf3b9ac19d92:v597");
 Thu, 20 Mar 2025 11:18:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0868f4351d434c20
X-TessianGatewayMetadata: kqKfuUxgC7LiPkY2f7lIeirY/u3/B+ClWxcIg/vS96ZVzrneE0tBdinuSNz3EVDBGTOdN812OaAYURTqlxALCOU3+HW4Igc0rWNJrbgynm/J+Ox/3XQelCkEqN+FejmgsQxJJhi8SwVZLFCPphxHCyDhrgvMMCm0aRPPnzL73F0=
X-CR-MTA-TID: 64aa7808
Received: from Ld7c658350928.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 823BE96C-9267-4309-9A10-767B3B00ABB6.1; 
 Thu, 20 Mar 2025 11:17:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld7c658350928.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:17:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPVttxSsWn+r6VFKIM0Tw5wP5DXq6U+zV7Hm0tyvXPVsdE4nNAuVk1Yfcaow4JuJ6y9sgisAPl3P17alOEqbMZ9zY0nrMWCg0qZoNf1vlccV01DrjUaFEflNEBhR1SROV5VXe+83dHwickCYk9yHSnGfdIOAoRq97moFeU6XeIp51sxrz8p8hgVEqVuDhC16mswj8rux60bXQ0z0t6jlKeL8J4uHeb7iJUmjZk+OCtGiviHu9TG3isiAX30wT7ejEliMDcG9Z4F9f/d7ozu4KxoeXJKHwc1sYweKcx139MShjbGJ02nfmviofx5FOMqOLz9fRSFTHt+Z8/CPEa1UvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRebtytzwduaT1yFLixubl//0RIkS3ONaXIJs4lqlBI=;
 b=Z/SQ27n9PUymONjQ+4JkX16RtsTQy/TXRp4pELhvpeJDOwMqzB6ZQ6Sbvn7G0C2FLeoBtL84U7UIvG15wSZ4chpGpWqdClULEuGQM43ll0tHWeRXhM+tVJiIms2BjKfBE+sLDE14aVAdRkUlcM75Q8JnA4I1TqZYYTAYKIuo8AMPV29vOIdI3CAZhs105VfiSDFdaApoHLuTWrypjfYDSeEGjxAn0dtqE1ibm2wGenCkKUa1XaPXeG2PlueLZ+Q03Evd2Rxgl80u/vnO3yTC7AItwrQSSMIDJn/v44V7XYvGKsih39eHY/bpXmC99pUxVVAY8VEeOL1rQkH1wqcRcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRebtytzwduaT1yFLixubl//0RIkS3ONaXIJs4lqlBI=;
 b=KyzWO5cY1/MWK5m7EJN6vA6tAX2eIO1Z/3qI9ozdLJomCIAGXOTO/chmpxszRPnG2XVjIYIOXdqq0GGzRcjiJOYTxTNL5Y0gDkHYw5VB0UXqU6Q5oyH83akCJyoJ0HWhLFKdlotpt/OHOpkL+xsKK35qNIh2iuZwyp5FWO4zdnU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:17:54 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:17:53 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/9] drm/panthor: Add 64-bit and poll register accessors
Date: Thu, 20 Mar 2025 11:17:33 +0000
Message-ID: <20250320111741.1937892-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|AM4PEPF00027A6B:EE_|PAVPR08MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 1086a793-557e-43c8-7a3c-08dd67a0e164
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ghwbbx4LDgu1mCBjYmIruUORTZ2jJMVvOYR6/SW/N8KC2oZgvlMWgSI/IXG3?=
 =?us-ascii?Q?IQ4UgLlLWrfZ0jQJgUmgfSz7zg+cKagcH5vUIWoaCCYev2XJraVtQB+31jPJ?=
 =?us-ascii?Q?vXMcrqIUxXljUiOWQ8B2t7/vzdGGRYL9HacATXSFjW31KxV5lZZCkR7huasD?=
 =?us-ascii?Q?Tl/hsjo6zb9PoOwXODKkBcVG02m1us2WKe6yULC4qdd845Cf7ww4fv5O6lT3?=
 =?us-ascii?Q?Iu4YzZ76vNiHxBESE/aVPgKqbLNOsf1Q2I7YA8Tgu79Hbz/B9VTkzUpd2ZiE?=
 =?us-ascii?Q?XHGw1ZrCE9oyrF/nx640HDQIEpv1M0aLLG2AnnhJJv3TP6fDSV3U4QiQY8Pl?=
 =?us-ascii?Q?h0bVMmLDYqB0iOtBWNYfCJxz1m9Av1GegpRqRzNN6nYjn0/4xwaghBI9FV7d?=
 =?us-ascii?Q?aTIOVG6wXvtD8wkDFhGqDNMnXpEKenrnMPU272oP7F5xFCSjhyPLsdWgCHq0?=
 =?us-ascii?Q?cjSBq7OeH3NJYzwSFONFUPoIqUUL/6Y/ipQVHqQ4pcIi0wBJ8WcgLLqINiua?=
 =?us-ascii?Q?CgdeN0o/1xpPKJgpnBu1HJZiDEeOKUbGBLtGocrWcDz9QMuk/n6/bZrJ/2Rv?=
 =?us-ascii?Q?5jGrxqHFZBsTG+Lf3C+hUKh4Dob0/f/lfC7a841fHhsZHLcY6U/hHgfGgVbD?=
 =?us-ascii?Q?m/zln4Az/ki57DgIQN+d5/EfvdXIw+XJ7gzI4U8AsGUjJ3mbWqFOQZhQLVnv?=
 =?us-ascii?Q?1aJqvW/0SRbdUdygABDa82o2T4/rPb9/Je2S7UeID3/pyQoLVGPbWTtOua8r?=
 =?us-ascii?Q?MJkEQ5/Q+kdhF94kB2xOFfs/OMckUmZpX7DvryxeaMaOXGxhYFnFdwJBRSkK?=
 =?us-ascii?Q?Q8nb66YZy94+KT8PYmzV2h87VJeYFUfJoJsAPoBCO1j26sfdcxJFpWjOy7Az?=
 =?us-ascii?Q?KwGhDU/WC7dqzX0ZzV8Lz0nJMupyf4Y/9qQc8iu5X5G68svXfF5/58JHH31T?=
 =?us-ascii?Q?dTKSWIOSvxfzHnArDMz/I+xL77foiAFyfVH2Q4VKx3BRd3OZBxtCr9gyuVPl?=
 =?us-ascii?Q?nxdRY87kkLhL37Ke14EIW8Q10wmMuwgazSKtovtL9zLXU1lZvxFKC2A8If4R?=
 =?us-ascii?Q?ERDl7W6PZT13gnmistg0RTWNZrZMEGS8BhUMFRayR3NxlgBLnVugQzFsoVmu?=
 =?us-ascii?Q?blKGLhj/VvJkWv/on6MOTr6JMdUieF+r2aYHGZMqBccwoqCnjUrZaJw48ThS?=
 =?us-ascii?Q?wR/vzvaTujgHGh5AbHUl/pYCUuzbWkN2hu72huMaPRYVh2S+3YSn7cuoZuqs?=
 =?us-ascii?Q?lx8QDxU/ToEJc1doiAeezJ08pl0AckSfXSsb/VsvrNJaWHjZbjjIMCH5zBSG?=
 =?us-ascii?Q?1XGCGIvB0mO30MyP2NG7kcI6nOGgxurNbT+LqdK4Olyzouh+tn6dqNDqjm7B?=
 =?us-ascii?Q?IcVj4TY2yvPe7DX5sSK8P/qkXuXy?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 65afeabe-54d5-41b5-35d5-08dd67a0dbd0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OUWsPNVp5U9iwzWpZ0HiM3shHsRcm6MozUcmGKqvlKABHZWmdBqNRDptwXzn?=
 =?us-ascii?Q?purQOEkkbk2FlT9HY3WL/k7KLEZCfyex6pouvzonekFaAdgwwmzbas4oMAly?=
 =?us-ascii?Q?pYNdayUYg5DAFsGNLdBnRGfOpQoEvn5IK5Kkf9OnMaNxVAXDBiRw1siaBG+a?=
 =?us-ascii?Q?sXzdwnukCE8VJUK+bBPybWNYkNp8+EbE5elvVJae7nU0ZiPNBCx9vKFMU4Yt?=
 =?us-ascii?Q?QtSAPt7tfW0mL9kC6TiB2dRC3iGXfquO/dlqVtLnWrHbgeOMQlyx+CpXo/cN?=
 =?us-ascii?Q?M2/aMi8mY6Zrm4qo/869VBmy8n3KEOippO1gemiUuQceq/+BYjL7MfPMHdRv?=
 =?us-ascii?Q?QaQI5OlQwebtCPJ+zbQdkLJmtrcGywuMTDLVRk0SelJiMLNfd+Cu8lisWOhY?=
 =?us-ascii?Q?qUTBQkY7Eeg6oQAMPqdaGH2k8uoBR69ths+61gJjVYgVcbFuUTwq/rgBWTr8?=
 =?us-ascii?Q?kZ2hO4En3+8CSzHBL43M0bHNsIQFhxBarOQcWbbFrBw7XMJXM5d//S4Mat3N?=
 =?us-ascii?Q?DefRCvHbBi+kQoxLHIpEQ+hhjBiaaD1vNFBal8VD81RT/JP24nkvvwZ85e+0?=
 =?us-ascii?Q?Ih9n8Pjt6RILUa9JnuibJzZDkLnG9JTQPjgtI0+/B1nuDcFmT77AVVWOoykX?=
 =?us-ascii?Q?zUeOGCT8cJdggoOlEB4sv5/j5E0cBplKrWqsZ6znPQVXnJJKAUfjT6KHyhCw?=
 =?us-ascii?Q?tmhqPWi/cy6wVwmBU06EG7Qkizl645msv2D3v9UprCy91B9LtKPgNmgFHLuL?=
 =?us-ascii?Q?CA1Z4mY6T5lU5YyrxstoYi7qHe7nGe707uz5aUxRDfba3scOryglGekxv5QG?=
 =?us-ascii?Q?cQO6HGqZ7xqvcFgq7zuOf74oOVYCe4NIUhWrnIeMrCrNg/pzYTZx4GLZDH10?=
 =?us-ascii?Q?wkB7XODs2hi7xMkFeR2ijy1yu/1QFmNegjYgI6OP4TwmWztVz/wmnrfttQoh?=
 =?us-ascii?Q?vN7+VkP3cU2jph7BIB5jvld572OO+L7RSumql0DAM7czFq2yjM2oijvddsfb?=
 =?us-ascii?Q?oAz9pBozSbEthR76YRt6VlBDfkn7h1b5wGwaRlCdZjZ1SzdztJ/tyJzdr08F?=
 =?us-ascii?Q?FXp56X1fwW+uSd4ooF4v2EgUpPUe0IMl3a98N8YF309Wgr0a0z5vyV2ogk71?=
 =?us-ascii?Q?xTzT1U9aYhPueJUzIeS6oLLmWw9Cn/3cVxD76dUmN6LXuA7QjVuQNal6p+bo?=
 =?us-ascii?Q?QeQujm8rpu3GSzWwds2rZzqKi9eK+k86kkITo/WNMXZrSb4DcudLbu1+c6C4?=
 =?us-ascii?Q?vTzDFdSRP3cnMDPMdQ05SeFgiBdrCFde7Kl143O8kvcjXXqS+aPgHaSAMmaK?=
 =?us-ascii?Q?LAn6/VM/aXhRLJ7vU+S45sBp092+w9nzOBa8ltoZojnFa38jNylIRziEm/G5?=
 =?us-ascii?Q?fUdD9SKvqAYCgjIaioVgoo8m/SISVsxHgwEGjcegfFk3ETDg6Rm2qLUsCjEv?=
 =?us-ascii?Q?JTxB5uYdJnVuYcDvzxAmaHjayMhQyri1n74fm1RQmdbaCFtwxnI6PK68Q6n9?=
 =?us-ascii?Q?ty7DJ5xbdAvV06A=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:02.9115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1086a793-557e-43c8-7a3c-08dd67a0e164
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9651
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

This patch adds 64-bit register accessors to simplify register access in
Panthor. It also adds 32-bit and 64-bit variants for read_poll_timeout.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_regs.h | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 42dc3fedb0d4..7ec4a1d04e20 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -238,4 +238,59 @@
 #define gpu_read(dev, reg) \
 	readl((dev)->iomem + (reg))
 
+#define gpu_read_relaxed(dev, reg) readl_relaxed((dev)->iomem + (reg))
+
+#define gpu_write64(dev, reg, data)                            \
+	do {                                                   \
+		u64 __val = (u64)(data);                       \
+		gpu_write(dev, reg, lower_32_bits(__val));     \
+		gpu_write(dev, reg + 4, upper_32_bits(__val)); \
+	} while (0)
+
+#define gpu_read64(dev, reg) \
+	(gpu_read(dev, reg) | ((u64)gpu_read(dev, reg + 4) << 32))
+
+#define gpu_read64_relaxed(dev, reg)  \
+	(gpu_read_relaxed(dev, reg) | \
+	 ((u64)gpu_read_relaxed(dev, reg + 4) << 32))
+
+#define gpu_read64_sync(dev, reg)                     \
+	({                                            \
+		u32 lo, hi1, hi2;                     \
+		do {                                  \
+			hi1 = gpu_read(dev, reg + 4); \
+			lo = gpu_read(dev, reg);      \
+			hi2 = gpu_read(dev, reg + 4); \
+		} while (hi1 != hi2);                 \
+		lo | ((u64)hi2 << 32);                \
+	})
+
+#define gpu_read_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
+	read_poll_timeout(gpu_read, val, cond, delay_us, timeout_us, false, \
+			  dev, reg)
+
+#define gpu_read_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
+				     timeout_us)                            \
+	read_poll_timeout_atomic(gpu_read, val, cond, delay_us, timeout_us, \
+				 false, dev, reg)
+
+#define gpu_read64_poll_timeout(dev, reg, val, cond, delay_us, timeout_us)    \
+	read_poll_timeout(gpu_read64, val, cond, delay_us, timeout_us, false, \
+			  dev, reg)
+
+#define gpu_read64_poll_timeout_atomic(dev, reg, val, cond, delay_us,         \
+				       timeout_us)                            \
+	read_poll_timeout_atomic(gpu_read64, val, cond, delay_us, timeout_us, \
+				 false, dev, reg)
+
+#define gpu_read_relaxed_poll_timeout_atomic(dev, reg, val, cond, delay_us, \
+					     timeout_us)                    \
+	read_poll_timeout_atomic(gpu_read_relaxed, val, cond, delay_us,     \
+				 timeout_us, false, dev, reg)
+
+#define gpu_read64_relaxed_poll_timeout(dev, reg, val, cond, delay_us,         \
+					timeout_us)                            \
+	read_poll_timeout(gpu_read64_relaxed, val, cond, delay_us, timeout_us, \
+			  false, dev, reg)
+
 #endif
-- 
2.47.1

