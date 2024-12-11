Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6C9ED2B9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 17:51:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714210EBBF;
	Wed, 11 Dec 2024 16:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Qs4JS9hZ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qs4JS9hZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2088.outbound.protection.outlook.com [40.107.22.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0881010EBB9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 16:51:23 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H4VU4LOD7TwyUxOeoZztia+ekKrGdGCnmBoRkz3U8mUdT7VczUV9nHClaFMNR7XsfST3OCUq0hOJH/DpumFbUsXtwsmq9J7Sd4VP0O9LJ5r0TTNs4RKwgaqmer1WTm3IOoQ0skT6sKQjO+4gTfoFM2IMq3QDHZmouEikArjVyN31l5y2uAkBNE9jG5nGzJ21sbvtwY/XyJ3UDA0t33g368Up4yxb2kYi6Kf8q9kCQ/CbbJUVfTIJO7coOfmt3gXL0hkQl+UcxCdoOEcI3gniJEcgmOEYcNYPkNa31yN4RJo7GIH6MHb2LY9p2ctRkgutTyKTb93lh10w1iQmJEmLVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M0fqUueGrM75pIOTP2ln7I3QgIGIq/MIWBiNgamU48=;
 b=XxpUFTvglYvI6CfZazU8vfTY2N/tiv9VadoXgiyFwD4x3PCa5gFnf+D+HvBoXuPpoVTPzg/wGakXd4KMRFfN3IZeMcR5ri0pzMkJiaby+cqGRNfGhPRincI2peMp8unSAdCYkcg74jSuHCgekA9AEGrUbuSh2TP8JgQTgg6U8sdGWddz5DgvY5f1ASrpbt7Q9bLBrsBahWQiAtJHKcA0knTmqiT2GAI+mZEauX8WycE+nTuLE8HLmbKNITqczLcyBHhn/fLs3gTJGgKjl1TKds7tqEky2bYzX5QRV0IHsw+Xz1d5Y14Y7Amxvww76V1wfS4Zqyt/APlVTy1A1oMVeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M0fqUueGrM75pIOTP2ln7I3QgIGIq/MIWBiNgamU48=;
 b=Qs4JS9hZ8DViZdTg/dqt34zD/AeSsFgaAovdwYc8hRXf3rL49nrxECkkp3hUl59s67v2Unp7R80xYiTGP20yVudRhfZBVIITeP3in3HvotlAvBO03gf03QJ62heOurQPBVRvJilyj11toqN5Kf6yQnXh3d6VWrTrxOCvT2tSFr8=
Received: from DB3PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:8::49) by
 AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:51:13 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::1a) by DB3PR08CA0036.outlook.office365.com
 (2603:10a6:8::49) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.20 via Frontend Transport; Wed,
 11 Dec 2024 16:51:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 11 Dec 2024 16:51:12 +0000
Received: ("Tessian outbound 2d228e31de9a:v524");
 Wed, 11 Dec 2024 16:51:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 54ad7c95618afe61
X-TessianGatewayMetadata: QF7v0RaNDlZKgrjFIC/FrPbHsYltlmLl4KfRn77Vab8V52jP2Mkjx2h4AvC5H+JsHqdKUrCOrcPgCM+tBQIGHpEhp68njmIk1hD8z/tpElKAcv5uOh8tJFhZcJLPlfuj4WEIj685QnIix5JYLmYGxy89YHv0uliol+oFX/6Q7tw=
X-CR-MTA-TID: 64aa7808
Received: from Lbbb948cb6fe8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB1415DD-17FE-40B0-9681-68D3F8AF9154.1; 
 Wed, 11 Dec 2024 16:51:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbbb948cb6fe8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 11 Dec 2024 16:51:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogGGURi1gvbKuRz6fxhbmR7/Xk5sJnbmSk0uOwD9u5czeNGoLxelPPz3d16MgyUPiT67Z8saa3++1LBI+LVCEJKYR2rJWC9NGOLYVlV/2dhCXlyh7k75kwBjUMnuDmrjidfgxQ6kEJD6PS1sd6ugaPpF2lIotXi1GC/5cnY7RIkzAteN2hKUT4Qltb3+W4Vf7reLXJUK6H8wmzA9wMPYKcM41N7cCdENLKmrVGymEY+BUIq/uQoxMyDQ4gj9mHl6gT7tuvRlCjeZKdScTHZtIhrXoKsvy5pm1OFnx7OIwjkGGhZjGhAGvM8ffozRiq75lyqI96UDZtfNUZlvtkASvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0M0fqUueGrM75pIOTP2ln7I3QgIGIq/MIWBiNgamU48=;
 b=KZYuRbAngRlGk8F4fhiV2wbuy0qVCYVX8cnMit0YGZtfaBoqt3uZchJj1GxU7gwWDFtfb2f5uyOeyEVWUCqtMeC6jZ0MdJZeS0Yh8DkXdsVoks8SgP9kcsXshg0KOexmnLzEsRCO3CQOtkLcMQdrs6OLGapHequVD0N0uzvzOnkSzTQxutJIHaXBEbjcoyoXSf0FF5zEiBGH+6jIt3R2NDNa3h6fR/70KgvWqYVoTDdqNEfF05vMyU4t4d8J1Pw9UABRUG70ltSMn6fGvXvXDCWqbdNj1o67ZWGUF7OZJyCsCj/2JyCWXuNux1PreCmecN0kigDL98N7yXPcj69paQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0M0fqUueGrM75pIOTP2ln7I3QgIGIq/MIWBiNgamU48=;
 b=Qs4JS9hZ8DViZdTg/dqt34zD/AeSsFgaAovdwYc8hRXf3rL49nrxECkkp3hUl59s67v2Unp7R80xYiTGP20yVudRhfZBVIITeP3in3HvotlAvBO03gf03QJ62heOurQPBVRvJilyj11toqN5Kf6yQnXh3d6VWrTrxOCvT2tSFr8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 16:50:58 +0000
Received: from AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897]) by AM6PR08MB3317.eurprd08.prod.outlook.com
 ([fe80::e42a:494c:6581:1897%7]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 16:50:58 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [RFC v2 4/8] drm/panthor: Add panthor perf ioctls
Date: Wed, 11 Dec 2024 16:50:20 +0000
Message-Id: <20241211165024.490748-5-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211165024.490748-1-lukas.zapolskas@arm.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::34) To AM6PR08MB3317.eurprd08.prod.outlook.com
 (2603:10a6:209:42::28)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3317:EE_|DU0PR08MB8422:EE_|DU2PEPF00028D10:EE_|AM8PR08MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d26243-4120-413e-69c8-08dd1a040572
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?fGtZtgayl8WlmUuylfDKId/jfjaCETC/P8yIADu9IbcAj7Iwxu4rvXwJznKO?=
 =?us-ascii?Q?NbIstCxxaVveZDzOIvcHKpnv8FE6I2EF1ng8/E2wrHbLuNuSOktw9C0Sj4zt?=
 =?us-ascii?Q?oclZehxWmd6qml23uV1gWSkZBUseJWQQoqBBQg4tvb/EvBJwFGpzj2dyZ9Sc?=
 =?us-ascii?Q?01XXuCQydmobe+7WHoHadi0Dpz2ZVFPGwyncKCVnQWft4tG8up/qAD6kP6GS?=
 =?us-ascii?Q?Wtkn4i7kcdV+SBC3ZA4EbK0Q6MwNMednCnjCJZesp59J3NStZvdh5cGfEmAR?=
 =?us-ascii?Q?3ixlFwUPh2+ucDKgQlcqcrG3qfWkBkDgdPco4nQIfUgskVUmJG/R3llx7qjm?=
 =?us-ascii?Q?mAhOhJb4JhbY7FCrfSzKQ+0fkvWHWnZpSnWjHy8DRx8s+xIviq51hni0zM01?=
 =?us-ascii?Q?T8xsVMC1hVrrsQlT79/sEzp/zR8HQ/331zVoV01j56SSHW/YCavRLzWNU96Y?=
 =?us-ascii?Q?sRyN3lRzgeTR+mMOAzVWjh1m599yQjZh8E9XgECpG0iZRDwWdg0hwuM4sDis?=
 =?us-ascii?Q?40oZAa6Q1sZDjsDuT29IJkvMgdmYm12KFxmpGPGuuwoscCBrkn1slet6ePV2?=
 =?us-ascii?Q?ANL9FroGEWc9+Jgf0YCCmZIkPT9CXPItiZwSvY41TCyRiMABnOCUGktKRN3A?=
 =?us-ascii?Q?lWiImG8abMQKUEAeZmdhH/ttgeHtYVBv1e15E4GcLJBi4VaKXeUHzHQouyZq?=
 =?us-ascii?Q?/VP5cqNDtB8ihYu06VlfXRqkz7huKKXxcx8IVoSHA30E7WhVRHaDD38KBWL8?=
 =?us-ascii?Q?04437bjwg2RvvUAEya4iVD5Y/eAhLCLuq3DVEZCrv92JaBsa4ZbZKjdLAH8Q?=
 =?us-ascii?Q?jwk6O9TXdKKdbsCaEM4oLgZPXVkcjjru5MeMnxYh0y/Hf1wQnsnZ8CHr5JAw?=
 =?us-ascii?Q?iOyQElzAsjnqmrHO2k/FlZfNcm1RsZdaw0LjVQ64UGPa52UayQ6AGdWRwR5y?=
 =?us-ascii?Q?cpRyVyDhaT2p5nzZ8uo0ic/3P29X3Znmio8GBhcsZBvD826rbq477DIhLQ1R?=
 =?us-ascii?Q?sYRkwpkvoxfzNCccTMw0olI7w7E8rjW0Ai+cwpLmydj40oxcFr/6fscVSqb1?=
 =?us-ascii?Q?65it/i3GBPlJPNictuax/N0prEPtCT0+Zm4rcqwQ6Qd2YzQ7nsJzxPDDZJ/6?=
 =?us-ascii?Q?eOCdRgsK5xtzGjMqWJdz2peosS4UFYo373WqyEtmlX8RBcaNCdIL+GU5NXs3?=
 =?us-ascii?Q?PNGMHc1kbrGLu+0lCSCPe1hi4XKdEnuCpZV6WsDA8ztqiq7JNY7MIILaRWoe?=
 =?us-ascii?Q?Gu8Ehd8pzcu0YyQFGkb2us2AUPMTFEg2wSvrwet5wnV0UL8o257kyxALGU7I?=
 =?us-ascii?Q?xmqSPDgFkbkacuHumcTRYejGbZydEqNv4ll/lGht7lrZtw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3317.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:209:42::28];
 domain=AM6PR08MB3317.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 0e9f8942-a122-4540-9f39-08dd1a03fc67
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|1800799024|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yUjJ49eGmPY6u4bFohVZZmI5SOr5S9xV9Hd7gM11+WI8dF6oefclHL+hi4G5?=
 =?us-ascii?Q?+GENRWclVYeNBsSsniLndDJkRKUUPnFrWxxUxS66sH6ov7vQU0gnlT+KpIpH?=
 =?us-ascii?Q?CYivQ0NslG4JlL9iQLDzkoedA+Y7eo0BtFfkgIKutv3MAQ7JLyYDl4Z8lARf?=
 =?us-ascii?Q?OAauONiYR2ZdcjQOvQjn6ecrSMvNnQvM4anorQu+HpO0KKptWtRcG0bGXzx1?=
 =?us-ascii?Q?t+Dh1kYgfZuM/WHk1uGLYISOIEsrf59T/FUV9EG63tTVyBePvCiwV9mK0WbF?=
 =?us-ascii?Q?Z0thgVqBRprhuda7JBDMlv6MyJXm8e5i0FTMzj7eeOsGQGt45AZ4e/LCSKK2?=
 =?us-ascii?Q?NvMfLO/fv3pqtdEm4tzybKwuotmLjCVK9nIw4mLeHOGak/TxDmnAuFbok03R?=
 =?us-ascii?Q?GTTdoBCp50nMRVrRl6t2DiL07QXZ2UfZonlrV2WGNG4C5na2xSAK7B3Nrnf8?=
 =?us-ascii?Q?xAAynIkAvHRKIRxMmTT1SOZ7Jq1mljIbAOighB3eKN/JkL15GqmqrQCoz5wD?=
 =?us-ascii?Q?I6QaVa7wCuRwk8zrPpkuJc4zplPNatl94nCFgPg9xYTISUKzMuMlUkmCduQE?=
 =?us-ascii?Q?UEhq8JlwuMpSlZoy1dbB2tnOgTVLKSHiFGrtk0mVLBjQ0tM+VfEMTOhsGpKm?=
 =?us-ascii?Q?IRfACCiI8dv4kVQt35K2lMaee2QAaZHbQRvBdcxXs/hXMZHMxPyOsHYSpjGq?=
 =?us-ascii?Q?Zk8eSVOrGwOzFqIrczvgnQTiqA/pWdJPsfPygHjg7fq8kGWWnQMskHxeU6Rl?=
 =?us-ascii?Q?OvE4xtM1YqTRJek08axQcDLZ+PSh4KLd1JF8so+BFes9DEi0BJXVO58DLv09?=
 =?us-ascii?Q?dt153PgkdUhX8bBwhHC2bs7zNHR9R5V5r5mAw2Db7U+Y6RaZK/GreU73xCeL?=
 =?us-ascii?Q?ZLwsWbtAI+gVYPGKv74OugD8pYYP94x7tLbvOaTXA9EAVN4+Y4dVFLllGzRE?=
 =?us-ascii?Q?Ja7zUbJXtw2ZVdAsoAs8eQKJ3QwXGw+j4NtQSKAbWAxSXM7TXotIh/2YHHUq?=
 =?us-ascii?Q?omRYfOhFbXqDmdPjSQ87LuOKb9YycwRdPlv2poik6PiBVu8msKUu3OIfi8S5?=
 =?us-ascii?Q?MXTV3yCUdP9NlO7hVQ6/H/gS0OexPTbJEhgfyW3MH5qdEJAJn+DfjG3YpEm7?=
 =?us-ascii?Q?BIJmReh1gfhif47ppSTrMC/tMBVFcz7Ssyh7rAMZw1Gqpw/tRzdiZCM7sSiq?=
 =?us-ascii?Q?YH8dPoW4kW3TiZUSMdgb1b/A3E4wwqtJsk1Qi1AzPcldR5Doed2EKyhK3Cj2?=
 =?us-ascii?Q?I25HN5LiF7gU4i9cH+rxXX2mwv+euSxVG/aLaol4tSWpZHv4nPiiT4z2aGgJ?=
 =?us-ascii?Q?XprquT4l0meVfLOZMVGhA7cIBqADYCnmOPP4fNgJBCqch6qKvx+IyMDle9sT?=
 =?us-ascii?Q?Q95jS02cPQ1OWY6ObOQvIL9yY2MqDWoJ1ScOxob8umX0e8C+civmY+/ZeEGr?=
 =?us-ascii?Q?oysIrvicSlO0gCogjY6mLfuLSvb5z3n+w3mH3luq5ecpnFwxvtZMyQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(14060799003)(1800799024)(376014)(36860700013)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 16:51:12.9585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d26243-4120-413e-69c8-08dd1a040572
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747
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

This patch implements the PANTHOR_PERF_CONTROL ioctl series, and
a PANTHOR_GET_UOBJ wrapper to deal with the backwards and forwards
compatibility of the uAPI.

Stub function definitions are added to ensure the patch builds on its own,
and will be removed later in the series.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c  | 155 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.c |  34 ++++++
 drivers/gpu/drm/panthor/panthor_perf.h |  19 +++
 3 files changed, 206 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index e0ac3107c69e..458175f58b15 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -7,6 +7,7 @@
 #include <asm/arch_timer.h>
 #endif
 
+#include <linux/cleanup.h>
 #include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
@@ -31,6 +32,7 @@
 #include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
+#include "panthor_perf.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -73,6 +75,39 @@ panthor_set_uobj(u64 usr_ptr, u32 usr_size, u32 min_size, u32 kern_size, const v
 	return 0;
 }
 
+/**
+ * panthor_get_uobj() - Copy kernel object to user object.
+ * @usr_ptr: Users pointer.
+ * @usr_size: Size of the user object.
+ * @min_size: Minimum size for this object.
+ *
+ * Helper automating kernel -> user object copies.
+ *
+ * Don't use this function directly, use PANTHOR_UOBJ_GET() instead.
+ *
+ * Return: valid pointer on success, an encoded error code otherwise.
+ */
+static void*
+panthor_get_uobj(u64 usr_ptr, u32 usr_size, u32 min_size)
+{
+	int ret;
+	void *out_alloc __free(kvfree) = NULL;
+
+	/* User size shouldn't be smaller than the minimal object size. */
+	if (usr_size < min_size)
+		return ERR_PTR(-EINVAL);
+
+	out_alloc = kvmalloc(min_size, GFP_KERNEL);
+	if (!out_alloc)
+		return ERR_PTR(-ENOMEM);
+
+	ret = copy_struct_from_user(out_alloc, min_size, u64_to_user_ptr(usr_ptr), usr_size);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return_ptr(out_alloc);
+}
+
 /**
  * panthor_get_uobj_array() - Copy a user object array into a kernel accessible object array.
  * @in: The object array to copy.
@@ -176,8 +211,11 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks))
-
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_info, shader_blocks), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_setup, shader_enable_mask), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_start, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_stop, user_data), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_perf_cmd_sample, user_data))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -192,6 +230,24 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 			 PANTHOR_UOBJ_MIN_SIZE(_src_obj), \
 			 sizeof(_src_obj), &(_src_obj))
 
+/**
+ * PANTHOR_UOBJ_GET() - Copies a user object from _usr_ptr to a kernel accessible _dest_ptr.
+ * @_dest_ptr: Local varialbe
+ * @_usr_size: Size of the user object.
+ * @_usr_ptr: The pointer of the object in userspace.
+ *
+ * Return: Error code. See panthor_get_uobj().
+ */
+#define PANTHOR_UOBJ_GET(_dest_ptr, _usr_size, _usr_ptr) \
+	({ \
+		typeof(_dest_ptr) _tmp; \
+		_tmp = panthor_get_uobj(_usr_ptr, _usr_size, \
+				PANTHOR_UOBJ_MIN_SIZE(_tmp[0])); \
+		if (!IS_ERR(_tmp)) \
+			_dest_ptr = _tmp; \
+		PTR_ERR_OR_ZERO(_tmp); \
+	})
+
 /**
  * PANTHOR_UOBJ_GET_ARRAY() - Copy a user object array to a kernel accessible
  * object array.
@@ -1339,6 +1395,99 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_perf_control(struct drm_device *ddev, void *data,
+		struct drm_file *file)
+{
+	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
+	struct panthor_file *pfile = file->driver_priv;
+	struct drm_panthor_perf_control *args = data;
+	int ret;
+
+	if (!args->pointer) {
+		switch (args->cmd) {
+		case DRM_PANTHOR_PERF_COMMAND_SETUP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_setup);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+			args->size = 0;
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_START:
+			args->size = sizeof(struct drm_panthor_perf_cmd_start);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_STOP:
+			args->size = sizeof(struct drm_panthor_perf_cmd_stop);
+			return 0;
+
+		case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+			args->size = sizeof(struct drm_panthor_perf_cmd_sample);
+			return 0;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	switch (args->cmd) {
+	case DRM_PANTHOR_PERF_COMMAND_SETUP:
+	{
+		struct drm_panthor_perf_cmd_setup *setup_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(setup_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		if (setup_args->pad[0])
+			return -EINVAL;
+
+		ret = panthor_perf_session_setup(ptdev, ptdev->perf, setup_args, pfile);
+
+		return ret;
+	}
+	case DRM_PANTHOR_PERF_COMMAND_TEARDOWN:
+	{
+		return panthor_perf_session_teardown(pfile, ptdev->perf, args->handle);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_START:
+	{
+		struct drm_panthor_perf_cmd_start *start_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(start_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_start(pfile, ptdev->perf, args->handle,
+				start_args->user_data);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_STOP:
+	{
+		struct drm_panthor_perf_cmd_stop *stop_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(stop_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_stop(pfile, ptdev->perf, args->handle,
+				stop_args->user_data);
+	}
+	case DRM_PANTHOR_PERF_COMMAND_SAMPLE:
+	{
+		struct drm_panthor_perf_cmd_sample *sample_args __free(kvfree) = NULL;
+
+		ret = PANTHOR_UOBJ_GET(sample_args, args->size, args->pointer);
+		if (ret)
+			return -EINVAL;
+
+		return panthor_perf_session_sample(pfile, ptdev->perf, args->handle,
+					sample_args->user_data);
+	}
+	default:
+		return -EINVAL;
+	}
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1386,6 +1535,7 @@ panthor_postclose(struct drm_device *ddev, struct drm_file *file)
 
 	panthor_group_pool_destroy(pfile);
 	panthor_vm_pool_destroy(pfile);
+	panthor_perf_session_destroy(pfile, pfile->ptdev->perf);
 
 	kfree(pfile);
 	module_put(THIS_MODULE);
@@ -1408,6 +1558,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(PERF_CONTROL, perf_control, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index e0dc6c4b0cf1..6498279ec036 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -63,6 +63,40 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
 	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
 }
 
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile)
+{
+	return -EOPNOTSUPP;
+}
+
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid)
+{
+	return -EOPNOTSUPP;
+}
+
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	return -EOPNOTSUPP;
+}
+
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+		return -EOPNOTSUPP;
+}
+
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	return -EOPNOTSUPP;
+
+}
+
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf) { }
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index 90af8b18358c..bfef8874068b 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -5,11 +5,30 @@
 #ifndef __PANTHOR_PERF_H__
 #define __PANTHOR_PERF_H__
 
+#include <linux/types.h>
+
+struct drm_gem_object;
+struct drm_panthor_perf_cmd_setup;
 struct panthor_device;
+struct panthor_file;
+struct panthor_perf;
 
 void panthor_perf_info_init(struct panthor_device *ptdev);
 
 int panthor_perf_init(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile);
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid);
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
+
 #endif /* __PANTHOR_PERF_H__ */
-- 
2.25.1

