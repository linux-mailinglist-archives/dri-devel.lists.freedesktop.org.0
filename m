Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44067B0C22A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98C810E273;
	Mon, 21 Jul 2025 11:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="IRpGYeqP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IRpGYeqP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42B310E273
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:18 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UxforvZw3nkUEywmvrvof68ZBGWjXeztYLHlXFVUqNXFCy2gJj0qNQ1ZUt4C+UAW9xmZkXKL75R7FI7OhTaWt4EiAeLAaOI8CJ8d9d1r9WiyhmYn95qAGsyFGKIO9/RzBoGD/hYwyi5geDV7N9JA37vv3kswZtvTezF4Iyug1m3tZZ8NDTkzb0V8kd4DtEdsonK/uHuHJhwjUlQvT0P44ByuyKY4euh9176ahgoozHmrxYOPkuOezxNP8BJKaXlT/DHo/+KGyZEtmnzk3WzCyZc6PutlxeGbtdRx9YZRfAcv8aAqigJdPYy/b2RmIS6PmSUr0ipdw//I+jcSRtL4cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=Mr/PmeVu+/DDncriFXq0qKKVoTforVLG+d5jKo2kZjylWOVaJov7SDWvMTbchDuZgucAu3HGnOO53oKTPdwH1eAyAwW2aqI384cITdU8m/HZCiKmwKF8jQDq8rC5Wpszk+LVKJe+AXvg7Muw8FqQmXrgC0yZPhEaeqk0F4J8O1NylmoCMxYco3mTHYFz3ucXi2bn/o6ECbk6O/47EZdXTC6dxmC04jOzKZRg5ZCYnhgFE/JJns23ByN4ci2hkTj1zOTu0N8y74haUbryNp4gL2MTClHndbDeR8/KpTraIvjXuVi7OlQaYNa7RNh8kTC8rb4u44Hk/o5tjzxq2IoUGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=IRpGYeqPA74Y9d87eDs/jGu1teQJj6039KOoKVI7ZNn6JgDfkXsh7X6glJ4BYVXvo2uZGdFDu9Q0OZZitPD3nvHfEJljU54HwBUXe41GQaEU6HhErs7+CCBUNCk/NoTeS5kRY/qsrg9jJkSh3T2cIEXd5MLa0n1gXZIqisQcut8=
Received: from DUZP191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::18)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Mon, 21 Jul
 2025 11:08:14 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::30) by DUZP191CA0058.outlook.office365.com
 (2603:10a6:10:4fa::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:08:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:08:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM/jB87cQP5lpqpxM5PDvbVpa6ePztA00DLzG6zeGTwtB6BdphsmlpLkveZaLjqWlQSbUdYYX+x3g0AnB2gfa/PVxOPy6UDBekN+O1yq1Iam4MoopZ4a/afLjOxDXoKzrWTO5I49bkXyiawHb99XPI6WoOUGTG+Uk/UwRxf8dhKXmUFPCNmmfbBuHV+EBbpOt9LIg9v4pMaEtJJolKUq35LOcI+kDX/7PFASos2q7il1JhcwvEm9ro/jGDv6qrLrDy2sU26BP1elurgN8bj6pZIcZxJKCfFa+AvaZn12+ZCLgeaoc4lkiOZIQFEA6q7oXQd21L4uK3b4QEUMEulkZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=CrRge0klq4usBSORVF4xsK1ys9l1canjjPJepY8lIjLtXr3Vu1+NwePDs0WJc3lecFJHepTYLpVmk8iIYypVJzlrOM1+AWB5rGrDTDqqYNZhMwLeY4w7TBl3tk2CXQYucnMKywfCpBL1D/jB4kcln1Y/+QhvbO6vgVwm6LbjZWb+6JtxL3mqs7DH+9vudr0dmXfRpR47cUDDPevEDIshzzpvZd0Svc2nBLyE3UZe2m71OgLa+tlj4ffA/WsEZsFaRdKWJm9dlvKic0bfoo0ioxJkLYG/z3ogEz/BDIS8RIGyCB3m9ktM6jlasbNioAe/Ay06pA/YMlZEW193RcLA+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM5+fugmiQHI7E4QjvxGZm2+KpAK9BiUHTWRJ5WDZxU=;
 b=IRpGYeqPA74Y9d87eDs/jGu1teQJj6039KOoKVI7ZNn6JgDfkXsh7X6glJ4BYVXvo2uZGdFDu9Q0OZZitPD3nvHfEJljU54HwBUXe41GQaEU6HhErs7+CCBUNCk/NoTeS5kRY/qsrg9jJkSh3T2cIEXd5MLa0n1gXZIqisQcut8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU4PR08MB10984.eurprd08.prod.outlook.com
 (2603:10a6:10:573::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:37 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:37 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Add support for new Mali GPUs
Date: Mon, 21 Jul 2025 12:07:19 +0100
Message-ID: <20250721110725.1595387-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0591.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU4PR08MB10984:EE_|DU2PEPF00028D02:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ca0e7b-28d1-49f7-9720-08ddc846e1b3
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Khz8k4B3T5mkroDelY4KQ3wbCkR195fvoxHDG2DVGllH0Vh+1wcLzX2ET0jI?=
 =?us-ascii?Q?cq+IKyo/83AzjPhti4ZEn07cocyxZ3dkdYajBnP1I/WsV1ldz2LFIlCSMh/a?=
 =?us-ascii?Q?JSBtTTm121uKSMgYGNdw55NzF8WVVO0+u3amcK8eLF2HABTnlMiZKnNKXIrm?=
 =?us-ascii?Q?H3Ll1/wX191ftPd/oAI97NmmWjZRSZ0fsB2aD8CBB2+Y2iYFno6vk16cU/HS?=
 =?us-ascii?Q?w9B3Sp1IY6HSIzFOvsb5+Vrisp/Mnu7KRLsKE1ASFrdPJlPrxGkpYyCoxJ9E?=
 =?us-ascii?Q?nawvnO9SJttHZOAi+O5rEMt4wp3BZgKnL80YQLrxe8BBKWcwSUyiRgQdnwEv?=
 =?us-ascii?Q?d/xVyAtezJ2lIRJ1/tYcQRIX24rAuS8EtP7RDdcxI+rCAwOYkVv1HqdtZ0kD?=
 =?us-ascii?Q?stTAnBa8bDoqSRLbMEQ+/58Kc2p/uuJtBe+29dxbIyBE0t8kLb16JYf6HjQh?=
 =?us-ascii?Q?G+1e2/BZksKJWr1O9IobvaRj/sE95oAEs+2qNYLS6sNDBTimy9/8J1847y9c?=
 =?us-ascii?Q?cewEyOk25UQARk19w1QuuMcXGfeSJWkNQl/LHKgliir0aUEKdDu550c1vVU4?=
 =?us-ascii?Q?5oKQUYbJi8d7+7jo3SddAOM3YtwFUn95uUIuh/R2wtcTmY5CFkMNvvg5QmpA?=
 =?us-ascii?Q?mebgVEShF/pU5vVBLW58yedAIN3+shWBYTmHfq9XKh4mcI+F21ZMVUb52/fV?=
 =?us-ascii?Q?wOSbUS+GL3SeR9d4XKDQRiK8nvM0lZGx7mIK6L+i1xuVS3RzY0zH5jsihRZI?=
 =?us-ascii?Q?RNfJls25N80cBJgHQKmh5tGhpoIJ9eIwqMWI6LQGv3PB19tyBgumL2YFjBIL?=
 =?us-ascii?Q?sdfcf84olFhPOx2jBrDdWAuYyR8f2KOYD276gcgh5oBmLRw9FC2kap6Ss+UN?=
 =?us-ascii?Q?WAeYzvGyMZ1XG14h4rhT5x/wqXQg4uTDbDAZlKpcouaUE+A97hDQHtRKrtOY?=
 =?us-ascii?Q?MA8f5adbmLWrY9tFHxipEBr166/ZGO1Yd8dVX5AEnd+K+cKoTj8yAUy+1bj5?=
 =?us-ascii?Q?MK4XgKMt1Jg0gh3SMyzfYxmUaTY+sMmWMW7Vjhlak72+rJA9MTgrmRpejLDw?=
 =?us-ascii?Q?+XcA+9aBYJqgZvBhEkT2bTqn81iG0gwx91fKToCq1Ayxe1UcsYisxrIDlKtM?=
 =?us-ascii?Q?W68oX43Q9AbIwtRnVVNeWOvYKbAf1UZ1+HGqx0OozZOdZiFYfIf4Cd6AsA1A?=
 =?us-ascii?Q?La/ryrtmlGvPA7mC+IO54T8ukViKywMUqVgb6qyJoRkQ0iiPoyqSztPWkqBd?=
 =?us-ascii?Q?sNflaXeQ1zeVTyjbjUoOBdRro4RhQxQnQo6ReOAsQ7Ibpl4HtspyaKplsVUS?=
 =?us-ascii?Q?W4YTmowSXCT2SAhiLiNitdS7a3Ah4JUnRMPD4u20Vy6g5mareB4Uaw2trjFM?=
 =?us-ascii?Q?S067KxPDYu0n5SybI9J7yI2ovejFZmVoD2jqZx6IoLq58AM5lv4T8lR4a0I3?=
 =?us-ascii?Q?87WiqjAeJ5c=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10984
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0a7c14c8-1b78-49b0-8932-08ddc846cce7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|36860700013|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+bcrFGymhbWrGdxcLNRwDoHDxcmV9xRVVpL5n4iQnKm6gkq4S6GLmI6s7rQV?=
 =?us-ascii?Q?4v2odX4ZLJlNl2lOmuWRjuxdQnLTV3TfQlTw4sU+V9gknreAjOeeEhnnkUkM?=
 =?us-ascii?Q?MqMjEirYGkwRrtvV8r6cCkeoTUB+ViVF9Y2HQcd2JNhBstWq6NxHd9gDTW3V?=
 =?us-ascii?Q?32O9YEQgOM8GXRjKlOyTzbhSAdSoEmVUvMwBzPjYZmBgGtv/5YECX8J+YJID?=
 =?us-ascii?Q?dEp/7Ev6jXCaJOVvMqTos4NeevMTxC/mnA8QY0+fO1jN5gLU5in63fgjUCjN?=
 =?us-ascii?Q?VfytpMruFP7T3AEQzpPyFs4dRTnE5DXZPSzBSmlsySVeqRIpE//IQkj4Xc0z?=
 =?us-ascii?Q?qaaS5NPnoxT7ohK5Nitl8mIB+YphetkI7A+7mdKrcZgREmNHTVaojWs8vKqC?=
 =?us-ascii?Q?/rwl/qw2PY9fcXtfMrEvy2zesQQbLZqoeXSkisxB30PuQHqd+GIx5EU1oqNr?=
 =?us-ascii?Q?W6F6jwz/hn+13kFI11cfGIxUvvm1BaUyK9579d76w67L1NEhYKJ3Kngh+cQQ?=
 =?us-ascii?Q?OqgdiXRnUMQ19Cspov+CHQmXzoFqXdyWBYnxW2VuvrbYMNBvHgPa5qz6Nuja?=
 =?us-ascii?Q?AyrLAnbtWfV9fbMql+o9+bUTJiUQXtNdkqOkQYXPVTwUBHYPMyQp6nVNExfE?=
 =?us-ascii?Q?chUfC7wDebbPGJh9CI+iU4PNxjWvxmI5XNXMow7S76esIwbKs47mu6wzKHp3?=
 =?us-ascii?Q?clhoUqZp+Oiehfv17TQYgKL10Fewm0s92jU8VMRCCMnAqS1Z03E97ZmKpK1Z?=
 =?us-ascii?Q?mA0uEelwc48Lmbgd1Kvx43rOag+ta38awf/nRIyrcWeqCG9rWvpwt7/WOjF4?=
 =?us-ascii?Q?AfGWFJABe4HlEp31hEcpwJQqoxVY3dfBjU53E77iDODzfjOmB0mDPyzGTe9R?=
 =?us-ascii?Q?SUVEXpsCL/l8QqDc0RV8iu+iQhdjKFa44jJ6EBQaqUGRfk4X2UPqK7kqsNNk?=
 =?us-ascii?Q?19IWwsTwBxCYIPcygzhhNxaaXrlgwen68nR0gP9PtNTw1uouXa1+7DYyQvSH?=
 =?us-ascii?Q?EE4yl6CDA4lrdXHJnDu5huCSaJnONrPyY1WbZ5rFPhMkDITY1++O/zMayL1O?=
 =?us-ascii?Q?5le+fCNZrSD73Ai9VlI7CYGzcbxnhIH0cjn5jBa/CFzGscOBO180nAyQACyv?=
 =?us-ascii?Q?ajDAP/gJDwlEaVR5tYg7P3Q6UhnmtfASCJuXbQq1PQYdYv6Ch3V1gd6K5GGf?=
 =?us-ascii?Q?AIgyUE3LcC28JtSIyx7+1U3PjfgihVx9M7lOqz9hIftRlluvP7x9jn0nFxNM?=
 =?us-ascii?Q?acpkHY+A2UVEJLMURVvI+6zsqamjTxUNIP+fDJd8qCfGuAlhxNFvbSUAiOlC?=
 =?us-ascii?Q?chLkChJYRykje1eMZl6WAQHnH1E+v4iiAyc1Jg5VrZiAHyikhkNt4KQ2XG/f?=
 =?us-ascii?Q?gxGd6/pEIxhL+bLHeqg8bpBJS5vN03pkTLuo0g2owoqdT2YmIpvqzE7LTsHd?=
 =?us-ascii?Q?9/YuixMXFTCZ0aBdLDUYPLhOxE0+aA259EVE5Xu92hRgzf9G0hOJKaD08L0D?=
 =?us-ascii?Q?xQTTkdNZQeBc2mNS8onuGfX4vBj8KfGPJWjsrmxQAi7tgq47fvQyAFcOMw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(36860700013)(1800799024)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:11.5341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ca0e7b-28d1-49f7-9720-08ddc846e1b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458
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

This patch series introduces some minor refactoring to enable support
for new Mali GPUs.

Key changes:
- Addition of cache maintenance via the FLUSH_CACHES GPU command for all
  supported GPUs in place of FLUSH_MEM and FLUSH_PT MMU_AS commands.
- Added SHAREABLE_CACHE support for GPUs from Mali-Gx20 onwards if
  coherency is enabled.
- Fixed minor issue with the setting of the coherency protocol.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Adds panthor_hw and refactors gpu_info initialization into
             it, laying the foundation for subsequent changes.
[PATCH 2]:   Simplifies the method of determining the GPU model name
             while making it more extensible.
[PATCH 3]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 4]:   Adds support for Mali-Gx15 GPUs.
[PATCH 5]:   Adds cache maintenance via FLUSH_CACHES GPU command due to
             the deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards. This feature is extended to all
             previous GPUs as this method of cache maintenance is
             already supported.
[PATCH 6]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs. This also
             adds SHAREABLE_CACHE support, in addition to fixing a minor
             issue with setting the coherency protocol.

v5:
- Removed all of the GPU-specific initialization boilerplate as it was
  not being used.
- Merged [PATCH 1/7] and [PATCH 2/7] into one.
- Fixed issue with getting model name before the gpu_info struct is
  populated.
- Merged AMBA_FEATURES and AMBA_ENABLE into GPU_COHERENCY_FEATURES and
  GPU_COHERENCY_PROTOCOL registers respectively. Reworked the fields of
  GPU_COHERENCY_FEATURES and added SHAREABLE_CACHE support.
- Link to v4: https://lore.kernel.org/all/20250602143216.2621881-1-karunika.choo@arm.com/
v4:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v3:
- Kindly ignore this patch series as there were duplicate patches being
  included.
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Karunika Choo (6):
  drm/panthor: Add panthor_hw and move gpu_info initialization into it
  drm/panthor: Simplify getting the GPU model name
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-Gx15 family of GPUs
  drm/panthor: Make MMU cache maintenance use FLUSH_CACHES command
  drm/panthor: Add support for Mali-Gx20 and Mali-Gx25 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   7 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    | 103 ++-----------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 125 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 ++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  33 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  22 +++-
 include/uapi/drm/panthor_drm.h           |   3 +
 9 files changed, 214 insertions(+), 96 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

