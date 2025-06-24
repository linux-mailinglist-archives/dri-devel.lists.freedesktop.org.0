Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E64AE63CD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 13:46:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170C910E580;
	Tue, 24 Jun 2025 11:46:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="nODFPU3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11020081.outbound.protection.outlook.com [52.101.84.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4402710E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 11:46:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqmX1JVQMX08x6HsNCqzpyQLcLFBO4wj5Yfg7TiqYRxjUJ4/Qg5eEVgEHVrkjgmCjfggIabQ7Ua8oLC85KMr7bLjTsIIRUi/5aahorxml2nMgGTILOUdLIGp9FQFDshvP2774kUjtGc72yjXfBTcjMa1t9sdEfHXBjH1LKtIUH6cPQ3q/wkiLcgbQkisaweJR4mk9ywX/pXp6l2KtOCE7EE+dYZhNThwBNFmD3JFGtUZolNerVDMUqoAziVcNKZ1jIZMktMkAVYVtB78yjFHapxOmOYbh4KioxqyXiyyDix1d5le4kBuIZmdWpiRdzKkN2VBLkKmUygF0h7op3tPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYK8+2XmszCRh2F55WIp3kMHls8HFkHMNQOXqw9CzEY=;
 b=HBPnmEsYc889GLbz+urkUZR+BfOxnVTC3NeuFV5JJLfaCtFIyNEnWfdP5BEJQalRYvokkUjbXe8hXHrxnWz2KW31dLuYj5WBJB7ggTVBuD4EWXFQGZEYCCBvzDKtsESjHPxFcMihG7PhpSlDAIJlaTHPPMdNV7H/crZce0JXnJdrWh+UJvxERRaQacHtvD6lkxX5JbHMYiAcaZ58dq9KzB8tP0o8eJgE/9jaEzlEwokvPxSvRKy5i8qmZtPUpszeHNAP3S816KRoFEKrcyFCs3cQv5czFG6qa+X60iY8BpKOtaToSeFwr44HaiaORZYmF6y2YyXsjwpcUYpcDeouSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fYK8+2XmszCRh2F55WIp3kMHls8HFkHMNQOXqw9CzEY=;
 b=nODFPU3JiwbTqJWMDgticqf15SgQKCA3oUX//MbqKhHHkA42FMzi8xdqJF83TnWVx7ncA1V6A4zANnJbJygGW50KoLqb0UhslSr8pZLrlfSAnR5Ki6VHROzrQnVjjTG+8icX6m/omIZbqcZerNPM+iqnOdGcyjHr9yRd47kfiParZot8qkF4j1xuwj0+kINrQCQd1yy2i4sA0owOgPd3EpY7e3VcYhcOGbBL1hGEwe8XOZq3DzfddKLllPvlYGjw1r4n+h+UpTSu04dS7FLYjnV8FgeyvEXGJUCZ927ipxGmWgJJCr9vr0oAkwoYTabRr3XPgxjVLr/8KquVb2zzKA==
Received: from AS4P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::17)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 11:46:39 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::1b) by AS4P190CA0005.outlook.office365.com
 (2603:10a6:20b:5de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 11:46:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 11:46:39 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com (40.93.64.27) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 24 Jun 2025 11:46:38 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU4PR04MB10984.eurprd04.prod.outlook.com (2603:10a6:10:586::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 11:46:36 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 11:46:36 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Improve error reporting and handling
Date: Tue, 24 Jun 2025 13:45:15 +0200
Message-ID: <20250624114630.303058-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0092.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::33) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU4PR04MB10984:EE_|AMS0EPF000001AB:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 90f82562-e2f2-430e-d45e-08ddb314c7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?6d6L0ll5RgowXk3rhyXxAzt8WymtNA/FuvC240PL9SOX7MSlyyLuhgejjCK6?=
 =?us-ascii?Q?WYgjGqdceoBoVRiP4b0+5QEDAOEvr21FAXX82KfGdntV2ycDvMKgTZEhXMNT?=
 =?us-ascii?Q?4xxdPhCTd8hDygdQ4uWmAG1T90bT0JgEfTJTDPRC/hYY7T93vqQmPwhC1EMi?=
 =?us-ascii?Q?iPwpb3LyQo84WSRtlxt/eHukVOCpe0UFz9oSIEPdgySFDMpVunv5PYguKCbd?=
 =?us-ascii?Q?iE9GhP5pNALXouytNvLkrx1Woz+lf3d4uPt/aRJqUaaJqpdPdi72QMCn3zp1?=
 =?us-ascii?Q?A5mK/R25uX7HVgTscE4tgBr4jVc3h59HTlJ4EKqRnPWmqmxu9+VYLF/cr2kO?=
 =?us-ascii?Q?1E3AjQy7CWwZiq6eKZKktj2y3Oys8w0ZPQKh0nKWKTzWNg9TvDvZ6iNFR6gJ?=
 =?us-ascii?Q?oygMdpFClkkYfTY9nLS3qsa15L3+P6xtC1njlFdxdbhDoCUgNmSYWJb/QjQs?=
 =?us-ascii?Q?/XWJ2o/Qb277PKP69owcIAlesTG8qhlnXMfNwkd0kVPvehqA0dz8w3RuRpVj?=
 =?us-ascii?Q?KuSwb8vzfpNwYJ41pqBrxfSv1gNgq17lmQ3A6NFwbR6GcFy5DcyleoclepvX?=
 =?us-ascii?Q?UT52eG9N+wP7zGmV3hvK0jYdUnvb9+Ltl2Pbpk0ou7RMA0FcZ4u8crFKIlo2?=
 =?us-ascii?Q?9Xy6GjN7FGfjw93h/y/V03dtWPsrWrWVQUW+clwwq6aKy1nbfs+7MbOYqhGg?=
 =?us-ascii?Q?JCHh6ByALHb6LMRqde+TznQI8Dn+PSt5dln4mo1LbcV+/oIyzuG0dPbbeVBw?=
 =?us-ascii?Q?FukzdTQb30Y1PpXW/nzVtx1LcYKJiWoOdbmqF6dT/o1izk2cwwg3b10b24qI?=
 =?us-ascii?Q?ORXMpBuJT6GQ8b+ZDaBTHEkpkTc+3CRbdK3d7C+UgIpRThhYYv0nNZ62bP5L?=
 =?us-ascii?Q?aEolT+z/ILK7aZOnJQfIQODyrOGrWN/z+dz+KsE2sxcqigGbv4tazcgkJFPp?=
 =?us-ascii?Q?B9wR5mYgSSc2Lg27yZdX8WmRESeqay+28PdIFBrkGtSVtxVukPv1UjMg2mXz?=
 =?us-ascii?Q?hatgmrCiz6rIey3CIuUex/PJauqYU0DPb6dOYfWxGB7vtxoyldMYR9cezhJD?=
 =?us-ascii?Q?pLySaMefBHjvn8Y5VYaFPmCy5gNMonQB/utn5phAC8S5XnSQzDdZyt5xgRR8?=
 =?us-ascii?Q?T9sRopsFKE1ljjvUG8cWia6s7SiFw747TfFLcIAuy6tLszBUNpBekgEsJorw?=
 =?us-ascii?Q?EibxdAlHqj+BZT3MUhcMlg7EAz0/1Jg6Y8dHmx81egJRPgnDCTwwUDY3T1OZ?=
 =?us-ascii?Q?HZHFAslGpucsQzwKY1B9q7KJBe2yh8LdXan7UMebEwBjDd5btjVg+bdQZti+?=
 =?us-ascii?Q?UMbX4T+HEzh/HDTKjztDT4hS4swBywc9CEb27Wu5cedZV7Elng6iqDCcy38/?=
 =?us-ascii?Q?uyWeB6mffEuozOlt4017+rh94BbDsDvABZO3qEQZnhsaOiV37xCCXhNRaH42?=
 =?us-ascii?Q?9q8NUryRxGK3xgtiTr1pChUCDt6PPqnFB6bHWR6RKRbHRqGORHNHyw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10984
X-CodeTwo-MessageID: 4113afed-d9bd-415a-9a30-57deb34b44fe.20250624114638@westeu12-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.213ecd1f-6e92-42df-b45b-58dd7ea05682@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 284653f6-5fa9-429f-1857-08ddb314c614
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700013|1800799024|376014|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8M+b8pZMw7dysil8+9Oel0MyvI+zoLzTh8UFIPqZwAjL6N6o7Xj426Mspyks?=
 =?us-ascii?Q?tA0KX0hRjA3B3vNJVsMJFbb5w3Taw3lHjOW1q2AM43bDOSORsrPvTsGQrWzE?=
 =?us-ascii?Q?wXtF/5sDmpJW1wY73PYjfwxuRcMtbl3YLkUIhlhoXAQD8Z1BWlEwbB3j25Wi?=
 =?us-ascii?Q?vaYYSxqJ/f7n7SWXNmwpRW8LrzRda3m5rzcxmE+NMmMwXgR7OaBDToMykdbe?=
 =?us-ascii?Q?pfU9KPPj/QbfNsS7vxblGHymFlMTtG1xsbtpphv1QE+wpVCUxfV3gJUs4+Vl?=
 =?us-ascii?Q?1756sDrTMl12FgBof68QZgpSx+c7JWfUOBkzwtP8sVX9XE+YumRzDExuAQcx?=
 =?us-ascii?Q?7xfBh/KINlpicSV57zlrC6n6pgcR76ZuPo844MeqONWxydH0LnGFqpw0Rcr5?=
 =?us-ascii?Q?IlVU77KPnSvqi3EyktDluDYU/4oCcnQKUGIDUmJV3X90wmgcf+p23mgtFB9q?=
 =?us-ascii?Q?ZPduJsOo4E5nSzgc0wLeGC3fCGADl4znO+XtvpWTmLiea7Gbu2188vY9z1vn?=
 =?us-ascii?Q?cG7ynBkRoK4Pb9pz5A2lZmBnhGvylvoF87F1ExAihd09sAr/eFmbxhy4cOeB?=
 =?us-ascii?Q?IQZwXnWl3LaQW72/0MDDq725Q/7e+7gbJWJdfk7e84MaedjfBhis/g2eXPT4?=
 =?us-ascii?Q?cT7oqu6clJyqm3iwMQD1tJ14ogYId8rUpDz+bCArUW6/ZnquCOuI8S3iKygK?=
 =?us-ascii?Q?TAe6OXTYDj4LFlq0AZSMUuk07KqtYwnORqxi9xoy3iPyAFQn31iGVA0HcOKk?=
 =?us-ascii?Q?Vkj/F7YHqxBGCqJ/L4jUdc6JewmvFAcMlIaZzZGL75I5pc9zmieLT3IOqRBI?=
 =?us-ascii?Q?hfK2FnDo5/qhJqh5kMKlNMnKocziw+zIuOjxE1pk0aMQF8WQLIfceb8jU4Dk?=
 =?us-ascii?Q?NTz9LnYndtLUHLD75Y7PJXBBWq/DOOPyovbYb+LTckTHnabNvqg4FauEifxX?=
 =?us-ascii?Q?uATcRIcGqK93L0j1FLgoTsSYw9YfRaso+KU/xlETn2lInEIsjbV0zYot0z7Y?=
 =?us-ascii?Q?039VfaZ0eQ9ozGPHfzWtTnuACmS6m0EatM01B7vuzU7HNcFBlY1Wxt37cU45?=
 =?us-ascii?Q?bHHtx7LSctzDw36UMe0HCT4iHEjZFNSm68nErOrjY2072qBKJEPdEKFjKRtA?=
 =?us-ascii?Q?q3olc3r5kQzaTI35pTqdSDS8acaqcKgp+VxXhDDKu73oLeIUH+ahus+nJleC?=
 =?us-ascii?Q?PXkFmz1HlXqbRTLBBfHSOOiTNVx56P5WyKdzCVXz601BOrvyFO0AY1m2bwtv?=
 =?us-ascii?Q?x4iYv4F3DHtUbHR8xPC69kRbGWz+BUVPfquzIDVE3xXzCKoU9QfclQg4xiLF?=
 =?us-ascii?Q?rH6t3Kh6qhJLR1hXBXL+97lPCYWPZRRo2BtuFnykJcd03ZdLJxD60bhxySbb?=
 =?us-ascii?Q?neCYpbQrtzS0MoPvHmwzwUiVzADNyW8x2T4WWtWdfbVZqjdgFF6EnH8pg3FJ?=
 =?us-ascii?Q?yckd6SOzHpZEjv7VzQt3eQ25ha8Ms/eoSE8bsbRxvUYdLm7SPFtfnQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026)(14060799003)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 11:46:39.0636 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f82562-e2f2-430e-d45e-08ddb314c7e7
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381
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

The datasheet advises to wait 5ms after starting the video stream before
resetting the error registers. The driver only waits 1ms. Change the
sequence to match the datasheet:
- Turn on the DSI
- Wait 5ms
- Write 0xFF to CSR 0xE5 to clear the error registers

Don't read the error register (which may fail), just write 0xff as the
datasheet suggests.

The driver creates a timer or IRQ handler that reads the error register,
which implements the "wait some time and read the register" part.

When using a timer to poll the status register, the timer did not stop
when the error handler triggers a reset. This has been observed to cause
a series of multiple resets. Let handle_errors return a bool indicating
whether all is fine, and only extend the time when it returns true. That
also allows the IRQ disable call to move to the interrupt routine.

When the error handler does trigger, log a message that explains the
reset cause.

Fixes: ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error recovery mechani=
sm")
Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 50 +++++++++++++++------------
 1 file changed, 28 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge=
/ti-sn65dsi83.c
index 033c44326552..6240a9997cc2 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -417,7 +417,7 @@ static void sn65dsi83_reset_work(struct work_struct *ws=
)
 		enable_irq(ctx->irq);
 }
=20
-static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
+static bool sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
 {
 	unsigned int irq_stat;
 	int ret;
@@ -430,17 +430,20 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 =
*ctx)
=20
 	ret =3D regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
 	if (ret || irq_stat) {
-		/*
-		 * IRQ acknowledged is not always possible (the bridge can be in
-		 * a state where it doesn't answer anymore). To prevent an
-		 * interrupt storm, disable interrupt. The interrupt will be
-		 * after the reset.
-		 */
-		if (ctx->irq)
-			disable_irq_nosync(ctx->irq);
+		if (ret) {
+			dev_err(ctx->dev, "Communication failure\n");
+		} else {
+			dev_err(ctx->dev, "Error status: 0x%02x\n", irq_stat);
+			/* Clear errors if the chip was still responding */
+			regmap_write(ctx->regmap, REG_IRQ_STAT, irq_stat);
+		}
=20
 		schedule_work(&ctx->reset_work);
+
+		return false;
 	}
+
+	return true;
 }
=20
 static void sn65dsi83_monitor_work(struct work_struct *work)
@@ -448,9 +451,8 @@ static void sn65dsi83_monitor_work(struct work_struct *=
work)
 	struct sn65dsi83 *ctx =3D container_of(to_delayed_work(work),
 					     struct sn65dsi83, monitor_work);
=20
-	sn65dsi83_handle_errors(ctx);
-
-	schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
+	if (sn65dsi83_handle_errors(ctx))
+		schedule_delayed_work(&ctx->monitor_work, msecs_to_jiffies(1000));
 }
=20
 static void sn65dsi83_monitor_start(struct sn65dsi83 *ctx)
@@ -639,18 +641,13 @@ static void sn65dsi83_atomic_enable(struct drm_bridge=
 *bridge,
 				    struct drm_atomic_state *state)
 {
 	struct sn65dsi83 *ctx =3D bridge_to_sn65dsi83(bridge);
-	unsigned int pval;
=20
+	/* Wait 5 ms after starting DSI stream */
+	usleep_range(5000, 5500);
 	/* Clear all errors that got asserted during initialization. */
-	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
-	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
-
-	/* Wait for 1ms and check for errors in status register */
-	usleep_range(1000, 1100);
-	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
-	if (pval)
-		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
+	regmap_write(ctx->regmap, REG_IRQ_STAT, 0xff);
=20
+	/* Start checking for errors in status register */
 	if (ctx->irq) {
 		/* Enable irq to detect errors */
 		regmap_write(ctx->regmap, REG_IRQ_GLOBAL, REG_IRQ_GLOBAL_IRQ_EN);
@@ -929,7 +926,16 @@ static irqreturn_t sn65dsi83_irq(int irq, void *data)
 {
 	struct sn65dsi83 *ctx =3D data;
=20
-	sn65dsi83_handle_errors(ctx);
+	if (!sn65dsi83_handle_errors(ctx)) {
+		/*
+		 * IRQ acknowledged is not always possible (the bridge can be in
+		 * a state where it doesn't answer anymore). To prevent an
+		 * interrupt storm, disable interrupt. The interrupt will be
+		 * after the reset.
+		 */
+		disable_irq_nosync(ctx->irq);
+	}
+
 	return IRQ_HANDLED;
 }
=20
--=20
2.43.0

base-commit: 78f4e737a53e1163ded2687a922fce138aee73f5
branch: linux-master-sn65dsi83-errorhandling

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
