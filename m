Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FFC40506
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80F110E0A9;
	Fri,  7 Nov 2025 14:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="LAm532rC";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LAm532rC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013056.outbound.protection.outlook.com
 [40.107.162.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FCF610EADC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:25:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uaPuymlqcnMvOQv225ZpXENU2sPF0OMmo+TcpQgQ+OukwclDfLR3PQZB8np3f+mcpMVXtXper/bu0yRwP53mYpARnzbYBJ/2CVed0XxAHoVurZnMZBZ8zu+DrsrhrqHh3L33eTev0E2a8Jh9F4wdjUINWeFkuVkf+Db5JUOxno3Dc4Ruy6tXehsPMq4JTNifjijGwPfxVsOqfxRL/4OyIYkDxVOC3bsnBchKCg1O+2SOKv+wpfhgwuWs4LXElbE0VYNL6nfrazhN+1jFhJp+L9/Ad1XjT4nFqYfRhWPi9Lm1Lotu7CZfugGVxUiWO6znXWy58iDr16CPFXiEbBbJYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg46848/ylg64/6Q5JJeCJrkdGpQ9a8mZK9v0T8E2vM=;
 b=pW/8aX5gSxthdJwPQAEX+B3oxf7UHiewASeKH5Zp1UOI4HAiIb89L0qTzCEn5bTGqzP9XPZMtYXH8nEfLnKIFn9s12Bo3+eNot2/bWFHV0w2AngoikujyWQQPgf1L4ic5cfXWmR2xoi5pS0E9BC+phZAS7jM5d/uPMpIABd20zCWKpLYc1thw4vsH7k0X26KRCeSqfW4q7LIEew21B1czjy0XfZzMcO4UbJHem/NipxyEY3sZvJiY+eb+VeMasOai7kFPxOVARpimNSfKuUbXbNof4uwcyTtMLkg9psFuWjWnStSFcFg7X+JF2wACnpc7A9eeOQ/sIFjuAgXpTiDnw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg46848/ylg64/6Q5JJeCJrkdGpQ9a8mZK9v0T8E2vM=;
 b=LAm532rCJXE4Zj+4N57hkbXPYNL4Mx3u1PTXatDXo0u9T1OQNC9Xyh2w/PX7hJjJa0DOdKSRbfl+Nu6oqE5Aon4y1myvhMqLTkuyaOgcUgg8FHYnbSjlqHZgd74e6umABMPA38r3BdsXearDrlfUhqfyUUERdXYeppP2P/yp/IA=
Received: from AM0PR02CA0145.eurprd02.prod.outlook.com (2603:10a6:20b:28d::12)
 by VI0PR08MB10390.eurprd08.prod.outlook.com (2603:10a6:800:207::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Fri, 7 Nov
 2025 14:25:21 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e9) by AM0PR02CA0145.outlook.office365.com
 (2603:10a6:20b:28d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Fri, 7
 Nov 2025 14:25:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Fri, 7 Nov 2025 14:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMlUAszo4EoKFQDuD5ONMt/hlRiOm6Ayi5jj4jWS/2YlQxX5ABqdiYpAPw7a8/S/IB9eY0J0/nvy/qAZgUaS72vchqYaVodSRWW7v8Z9aeecZIsLsWbQ+HxtY/KzqpQaa4i79n5CoUymxj1AZZUxfRvuKIhQ8ycsVio0M36lgoh73hkrMiKzo4y2CwJy/9Oe9m94o3eQDpmsh0qgxgV1rehhVvfPXV9hh6OtQOQG6k9SBuHWBH+jfm2B+OtSiuL7LL1myCrWInyVrwUD9dJHfzHy456Mx5yIp1FjO8BCBBZHWXLNA8DihNAujlB5heBKEyERS7RFaxlOpyXWNXZDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mg46848/ylg64/6Q5JJeCJrkdGpQ9a8mZK9v0T8E2vM=;
 b=Zu1vS9iRDxV5o51J6g4pDgWTGXef4Fv9WAnpzk3PXzSecD5rQ/M7ZdPtIfzv46JC126n6W5ItRvrdM0+Q6Qs1dK3WQ52r4TmP0oBt3g7OYiVF1SolMFnDFi1RUabg/kXgdtH8Vnl/fyLCSox26gI0wkeuJpOIX/R6vNNouT8OcW3VBpHLGDmveTGj0eehZjEw311Yr9djdsCcYVS63WmRb7rg1EqqYcpa9ggnvKGLgWeoKvIB4X9JcnyGFINRc7wJmWJ+KjX1pPWD8Ia6pIJ642dd+AdgT6ZuYayYHF16Ini6ocwKm2W3RmQpQ40EPqTI3Y2iE0s4q8VD/eDidiFTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mg46848/ylg64/6Q5JJeCJrkdGpQ9a8mZK9v0T8E2vM=;
 b=LAm532rCJXE4Zj+4N57hkbXPYNL4Mx3u1PTXatDXo0u9T1OQNC9Xyh2w/PX7hJjJa0DOdKSRbfl+Nu6oqE5Aon4y1myvhMqLTkuyaOgcUgg8FHYnbSjlqHZgd74e6umABMPA38r3BdsXearDrlfUhqfyUUERdXYeppP2P/yp/IA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9682.eurprd08.prod.outlook.com
 (2603:10a6:10:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Fri, 7 Nov
 2025 14:24:48 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:24:48 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Fri,  7 Nov 2025 14:24:32 +0000
Message-ID: <20251107142440.1134528-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0272.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::7) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9682:EE_|AM1PEPF000252DD:EE_|VI0PR08MB10390:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c91cb7-e8d5-43d6-1da9-08de1e097b94
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Gp0kUmLHZpjp5DYQhgHqfk+wtq3ovSmOuK93Lcrr46CEPAjNC7OFMVwS18K7?=
 =?us-ascii?Q?EPH9M3IBuZMxh8DhdZuTlmEh6vf6vje3ijmAdb3JnD9L7skU22mslzeUYdZy?=
 =?us-ascii?Q?yfM0hnrbVHTyiPcuSvu+qifp/2hwWYAU3nRofFtYXhhsLF/VZXlSNu6XMs/N?=
 =?us-ascii?Q?cdUo5SviicQtcpzggQh6v/LExbNDQ4duLqOKiHTpcTvdpFKfdC1qMazU3Vva?=
 =?us-ascii?Q?8DiD0Sw3sJPcf21bG0Hq5QOT9VYw+KIJHLHexeDqemBgFyxMoJDHMcAe1wEs?=
 =?us-ascii?Q?GptzjWVFAUv+7mdy/CtxxsHJJnDdAxrhzt1ajuUG3cBY179c5FLDsB9HF6+N?=
 =?us-ascii?Q?T+/3QPPNBL0rsHoTC/xxPsOtHlT0n96lLJO6Xv6uHgVit9p3EeMfQR/8Oop3?=
 =?us-ascii?Q?yJXEKkIDdgJgNN2UL8I/zguMKWoEzlumVbN4G0x9haWkTKHvSh2QHaA6fXNb?=
 =?us-ascii?Q?hPjNhITXBu2IilPYzz/2744kCJAg4lTogmetWjFL15rVKNoXahr5/dyuR/WK?=
 =?us-ascii?Q?UaCJk/DhkxAP4DrcXJE1tk+Fct9JNx4XjT2DJCCzPN1Zv3khQQ3gvjs/EO1K?=
 =?us-ascii?Q?3E0b5DpZckV/248/EZlW1h1hEdRA6y8amLMQXn4MGTFlc0a6sdKzjBrkuJTB?=
 =?us-ascii?Q?AQJt6DjTXEAahexYrhF/ZOlGNEjL4huirhrn98wtwM6WwBuy5nhGqX49u9RR?=
 =?us-ascii?Q?IdSOffOvRQtlJOfZcNhLX4/dE+Z7M66ZH3IyQqENTneD4OhWonc7YHxuYWVR?=
 =?us-ascii?Q?m3AITFo5yzaaQhwuMWYEt2AGS5REj+vZqbLMPqiZYxbjAkVPfWvZyCtNlvQ/?=
 =?us-ascii?Q?eB9fq6AhBlEvzkxl3KNCI9j8KexWn2fHh9+SICWtXOWDCi6J/4H0rjM+tMeW?=
 =?us-ascii?Q?k83pt70XTxHHERptDr66Ycyg1Dwmd/MlfkV/4KJBFS2hbdEs4+ujW67XEv/Y?=
 =?us-ascii?Q?5VqvX6ZsMyu0Jm5ouKAWLgUSUdtikl7SqrUxBL/Jy04QMt+etvJxP03FFB/s?=
 =?us-ascii?Q?gUg8w2/7qJu4G5qLgOw4ArvcAbZpRcqSy4cq70exQHjiIZTvuzCTyH9K81iV?=
 =?us-ascii?Q?UHRhCJeLDuIpvZOh3oKtPK8MawtGnRsdU4psHKRwr3Gtstm5hRyjHfoyEcVn?=
 =?us-ascii?Q?yVqCdQH2ZtYUsmjH8VCzxtvGCEE8lwD55mkv7SwOpLZv+TdseZK9t3BcYRj3?=
 =?us-ascii?Q?q7p+Ze5gG6tyddfOVrw1FbbpEyhcJPvWHqGr+3+LX2wd/UGecpfTiLlkOH4O?=
 =?us-ascii?Q?GrxMBVhW0K8ojZ+xVzVw/kf1D8DgIceaNvQJ47bEP/qbahmcaBi4m2JgjwNU?=
 =?us-ascii?Q?Sgn7E5Df9IofnAxrVM4v1GomhgQZxjJ0ZtnbTyfIg2PX7sEYTbOfJSlLQeqb?=
 =?us-ascii?Q?EL7m5IGV+T4Pq6vD6kcqiHxVRTOB97Dj4niQxuz8WEv4AcV0RN7NSxjlDtBp?=
 =?us-ascii?Q?UgNoOYmlClg166wO67vq9P2mwxnVZqkB1o0tZHZty4KAWnLPikEKsA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9682
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c7d5c605-aa78-4dd6-3036-08de1e0967da
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|35042699022|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UR+nMkQabeRQFUyo5kxIaSIEKR81VFg5xXMW2pXTbenNf0dDt1HIk+3FcZAA?=
 =?us-ascii?Q?9NRyC9sE5FqlTClUwk2+9gzo62tmouChgBAYFN6BBx9zY1xzilF8zUXUrdlD?=
 =?us-ascii?Q?e2mrLFW7FU9NHkn/K3caXMWrnIkoP/b9qp7o1DyzdDnLGMosjDrtjxb9Hvxl?=
 =?us-ascii?Q?+kSHG4t/+7W4E/aFT2ebRa5OPItPbEgYcZzwA0OiiusM3r9ez7DhTGxNd8ur?=
 =?us-ascii?Q?XPe+umQEqs+sz6jTeqiJOIJJnEKaDE0qeNeG7PZcoF2IpPzJVrzTMNBznxl1?=
 =?us-ascii?Q?+vXrMDvjaF3KTqXk1Ie4wExCTPanUvlC2NE3Yh0qKZBlo2fa6aqht9r2yi/N?=
 =?us-ascii?Q?lhg6TEwrWWLCiATybAwIt41LFUGFvCKu9YBJoECKqj9K0itFXyryC6YWjOlC?=
 =?us-ascii?Q?/efCgQI5D7zBcmnB97YlJGg6FexhmDf/fqwEz2kqve41aLwEOh0KGtqFBkLT?=
 =?us-ascii?Q?fnk77Epg9klSZO+uzaiPC9vZxs4Xgaee/eA7HCGe32J05gWXk/UcwnYkKsH1?=
 =?us-ascii?Q?g0JIoTKAZIUMBPw21NNjrYZGj4OCHIqGIAcuQe9vynFE/yskkA3gNI5b6CFt?=
 =?us-ascii?Q?3ER58yErk5h0RDkxTiIC7uIDIfB8OOza+kdIJ4HD243dgKHF+kLc7Pzn0ttn?=
 =?us-ascii?Q?KQkAMlo6Anvsh4OGUKGeNQM3AIoCfwXS4vHdTzWWoC6prAuRFft0QdoDwUyO?=
 =?us-ascii?Q?Xy3pOiFJXxCWy/0Tct6nq3JbOgF1rLds+j/GeXcwixQOpnIByv7JYwq+ZCcV?=
 =?us-ascii?Q?kb0cWX5tFhn7yJaKPzDZCyEbed9Q9W1BNUi+SMXYcCayA/rHD8hD3aI8DbNa?=
 =?us-ascii?Q?Ipfb5IcOlz/XVp175dT5I6ND83pU+NMkh14PLnYsv3qcsHBHuQpq9cB+y8yj?=
 =?us-ascii?Q?XusONpViS9zUrC1nGUAAkodpDx0Ob4iagpIgbCC3AdSKX4o3bvZ7ncZv8AjN?=
 =?us-ascii?Q?Jea0w9zbALiXXJ+ZUYpHbhA+uggyuFXhIiOMSzFrHE1eIM2+H5cYU6ozWQNX?=
 =?us-ascii?Q?VJ5A/ZYqkJtCBCor8wODuYU017rtDSBku4MLGmZourb5mCl3eUDI6kapixON?=
 =?us-ascii?Q?3vneEXiPsn8CMabmsJ8z4zUgeNUCVq1mJVmyDVLZ6EXysDFQIzOnJOx6sLZS?=
 =?us-ascii?Q?eAqv5MBb91PMDo6V1c8S1tAjUNDD7VXKcVqcqeEhc+CuGOG2Etb79eMJOUaS?=
 =?us-ascii?Q?fjgZWKjm9obJFZTZBLMSpLuHGMl5GkgGNFNymgJpoya+VUXIAOQKBGP7yF/X?=
 =?us-ascii?Q?M+Q5oeXf/ntJ85XxUTyvRYCqAIHZiu/RYTtBfdsS+3dMVe8aJkvWGCy2u4Vz?=
 =?us-ascii?Q?AxDKYWUhwtnz0WXUS+SjJCfKwVm6a+4xU6IfUzNkWwBGsCSGRtjZJTipQPsJ?=
 =?us-ascii?Q?NYw5SsfemeoI/bRQbYd7oJgHoOluK5GFJaOY7lSVzOdQk6q/YFvHmHFsMCg7?=
 =?us-ascii?Q?2F2MrAzyoUW3qBiyf9bl9yczbo8ndw5yI/DcI3ZXNGlfzrC1Hjp/r75/yMfe?=
 =?us-ascii?Q?EJ3SfhduvQHAiRjRFcGAV1iAomzn5BA9MMNuezMxh+I6wmY5yF4oNzK4zPM4?=
 =?us-ascii?Q?vb/H2BmciVRWFkb5cEj8aLEOIJtVfzGxz3Is8Ksl?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:20.9016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c91cb7-e8d5-43d6-1da9-08de1e097b94
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10390
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

This patch series extends the Panthor driver with basic support for
Mali-G1 GPUs.

The v14 architecture introduces several hardware and register-level
changes compared to prior GPUs. This series adds the necessary
architecture-specific support infrastructure, power control and reset
handling for Mali-G1 GPUs.

Patch Breakdown:
[Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
              hooks and abstractions to support the v14 architecture.
              These patches introduce architecture-specific HW binding
              for function pointers.
[Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
              PWR_CONTROL block introduced in v14.
[Patch 6]:    Update MCU halt and warm boot operations to reflect the
              GLB_REQ.STATE changes in v14. This ensures that the MCU is
              properly halted and the correct operations are performed
              on warm boot depending on the FW version.
[Patch 7]:    Align endpoint_req with changes introduced in v14, where
              the register is widened to 64-bit and shifed down by
              4-bytes. This patch adds the necessary infrastructure to
              discern the correct endpoint_req register to use.
[Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
              for v14 architecture, product names and path to FW binary.

v4:
 * Fixed include and forward declaration issues.
 * Addressed code format issues.
 * Picked up R-bs from Steve.
 * Link to v3: https://lore.kernel.org/all/20251027161334.854650-1-karunika.choo@arm.com/
v3:
 * Updated include logic to enable static inline functions in
   panthor_hw.h for function pointers and feature checks.
 * Fixed missed replacement of CSF_IFACE_VERSION check with
   panthor_fw_has_glb_state() check.
 * Link to v2: https://lore.kernel.org/all/20251024202117.3241292-1-karunika.choo@arm.com/
v2:
 * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (formerly PATCH 01/10 and PATCH 02/10).
 * Dropped panthor_hw feature bitmap patch in favor of functions that
   performs the relevant architecture version checks.
 * Fixed kernel test bot warnings.
 * Replaced function pointer accessor MACROs with static inline
   functions.
 * Refined power control logic, removed unnecessary checks and redundant
   stubs.
 * Replaced explicit CSG_IFACE_VERSION checks with functions describing
   the feature being checked for.
 * General readability improvements, more consistent error handling,
   behaviour clarifications, and formatting fixes.
 * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/


Karunika Choo (8):
  drm/panthor: Add arch-specific panthor_hw binding
  drm/panthor: Add architecture-specific function operations
  drm/panthor: Introduce panthor_pwr API and power control framework
  drm/panthor: Implement L2 power on/off via PWR_CONTROL
  drm/panthor: Implement soft reset via PWR_CONTROL
  drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
  drm/panthor: Support 64-bit endpoint_req register for Mali-G1
  drm/panthor: Add support for Mali-G1 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h |   8 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 131 +++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  12 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 107 ++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  47 +-
 drivers/gpu/drm/panthor/panthor_pwr.c    | 549 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
 drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
 13 files changed, 989 insertions(+), 40 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

--
2.49.0

