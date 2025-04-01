Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69017A77F71
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 17:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B249910E5FE;
	Tue,  1 Apr 2025 15:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Psr0hmAn";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Psr0hmAn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011036.outbound.protection.outlook.com
 [40.107.130.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A1510E602
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 15:49:06 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=d3WhYetztL8OoHP46Du2tfaJT/BctL7wuDR8mAjqxc8fFZEwuiTsCagqfOEu07vfnBkclxTLi0vp+yzjC9ptRSiRQhP9cnqdZwkMslHVvUsp0+cBR8JjXuUEAsoUGrHYVWW7IuVdB2lGPclraoDAf8tvzLf2TKaGd0q2JZPn4AyELOffsEPwEUU7aDKA+sz2ep0Jni2AOqg/leSOrlIrErRmQlAoyNxX923cLPEuiV5IRIvlEZRoXv0+b3tYFqO2d9VneTvs26bzjAjOwUF+9keetWtK5XwZZ+Jo0BUeOQiCE8Wh/fIHPT0/KNysWKAdMvwnMMSOFPvpCF5UBpvrCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73aJ/NgW4EkLrd1krm3aj73AkSedo8cBOtOcevIJ3xI=;
 b=KEE7lfm34mVnLgnMfE1K9tCASDA972IZIJJtnfKXWTi7YeDf43QlHv6oK4s94Vq49vhx/HyRK8ASo9MQLH9Iz4oi1O1z9anrXLDHz6MmUPBPVbx2A8CGrhupwGrVDl35DQNTl2Djbkg6+59wi8/VMfaIC+Ze7rgS6QiqOaJdzD2pwdi4cdBgMREYZVd7rJWVrgkATJ5u3Ul8pR/k3CFseCF9PEMfxA7Skbx5iuHvOR9m4dNjr91K82f7KNlXeazS56JpLxTVg6EIT+jhv32a12r6TtR0bygR8kDfi9Im/TEX4uF7zp872Zws6iNRNmmTOAPqM6+SkAUdzJ6d2EN8hA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73aJ/NgW4EkLrd1krm3aj73AkSedo8cBOtOcevIJ3xI=;
 b=Psr0hmAnnMUxJ63tm3LV2koB6DVi/itVyHWIY4kPjVeL0Uq/iv84l/mOr3kjfe5XdmQI9gKl6I3xDx9gUGMhkPd+dR0qrNW0b2yTi1YZvonYyaSQRWa/5D5w6SNwLqPaIo8FHEJBgUOxPuBY0nojOYkwMVBAooRpE/176SiIfhs=
Received: from DUZPR01CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::16) by GVXPR08MB7701.eurprd08.prod.outlook.com
 (2603:10a6:150:6d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Tue, 1 Apr
 2025 15:48:56 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::5d) by DUZPR01CA0079.outlook.office365.com
 (2603:10a6:10:46a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 15:48:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 15:48:56 +0000
Received: ("Tessian outbound 8df300e92501:v604");
 Tue, 01 Apr 2025 15:48:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f877ce8a26a71364
X-TessianGatewayMetadata: oHNERHLLSIuK45Qn4WjcaR8YD+44SIV0c5uhxWi/9qc6kjsQR/FSkxNF9NHjyATuzEYO3ztuWTkzNT7avEtgqMjSiv0id4Y4OXo1JODvoBzsKvl6XJNcVJc1GBfAdKJ4xPup6NuGkO/tETr1ZZus1wihxKkVvhi9kGcs+KBuZJT8PeSBiLkC1ZKX6hHVFjnilHeMoM2mXSofbsJu1vRi/w==
X-CR-MTA-TID: 64aa7808
Received: from L037f915c84da.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0A66C371-A3FD-4516-8548-5403BDA98438.1; 
 Tue, 01 Apr 2025 15:48:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L037f915c84da.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 15:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auyrbq0jYWdHp1I81vnBt+HDZO/Ah2/Z5KBln9Nd8CE0vRWcR1Q7HnYMvNIYYdOzaZZxQWrKN6E0EyF/hsaCnqzi9bejR/rCTdPseqDGi1mDdXc8UCw/55vT0iVIjTLNsje4sRJI6Y9uqXLwO1vHtL5990s4CFY5rHPgOly+/xqMdGjXf1LtFpRL7PDrYFa1gEpNhuIEz1fVlXSYgXFbTWWBNC3GJwH1gR5XpTWg+IgCeOhAz7IKXYXijKkldrmlN+dMy2z3JQ17+lTDazLKnr+gaAKY/EJcZT986+DLuMQ7KjDahumxKV2gNIuzzNs6jUcIrlYR9JOYiId/dsThPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=73aJ/NgW4EkLrd1krm3aj73AkSedo8cBOtOcevIJ3xI=;
 b=QS2juvUtvvWlJF1ik2mdd/Rz1U+naA7hCITEqLgaaYgQYx0WwHf2UjkquMQ6hhxJtg8ZeAv4j/ncxk5fMRQoRjBBNu9+Z4fFcOkkAsT0aGGSjo/1uZW07vu/1GHX9Kzz2BQFBxFD7fwMmQypKcAtpO/A8hOAP1FukU0NGu7Hw696xOh1DyL24rV+7JpFqYNnIncBoMclfW/SuuZnvvkiIpW6GVpJulRuihnwk4HG5Nn5MbCtsuaWyZDYic19OR2oG7LBsj+nAmzy6doXma4jZcP/mt3F7Tj0hP/wcTerL9gFKPlglhfSCHAMnLIXCR/zUsHyLAx7tHiMNrPbWqXwGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73aJ/NgW4EkLrd1krm3aj73AkSedo8cBOtOcevIJ3xI=;
 b=Psr0hmAnnMUxJ63tm3LV2koB6DVi/itVyHWIY4kPjVeL0Uq/iv84l/mOr3kjfe5XdmQI9gKl6I3xDx9gUGMhkPd+dR0qrNW0b2yTi1YZvonYyaSQRWa/5D5w6SNwLqPaIo8FHEJBgUOxPuBY0nojOYkwMVBAooRpE/176SiIfhs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU0PR08MB8279.eurprd08.prod.outlook.com (2603:10a6:10:40d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:48:47 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%6]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:48:47 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v3 6/7] drm/panthor: Add suspend, resume and reset handling
Date: Tue,  1 Apr 2025 16:48:21 +0100
Message-Id: <55457330ddeaa95ad389076b7ad01be452836ae2.1743517880.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::14) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU0PR08MB8279:EE_|DU6PEPF0000B621:EE_|GVXPR08MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 361fba0e-37b3-4aa4-54d0-08dd7134b61e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?79tkHEDLbsA/NyQjgbBLjF5+7u/szp7v0JekKkjHgqkYRURNsjcq4STDLNrL?=
 =?us-ascii?Q?4XwuPp17bmvrXr/GW0YE8+eS59322mp7zY6x/MDB7zOrKc6Y7TW49IK58nOp?=
 =?us-ascii?Q?3YazQL8fz6dFhADYkuaacxSxIqADLIpntx+utA+P5jZl/ZHxc+K9PcOAKIVV?=
 =?us-ascii?Q?Psq3cAZ4qxJXg6pRG4/Xx7+o7IyQcPSMceXEJyE92IMvc49ugKzQkq9rB9pk?=
 =?us-ascii?Q?zQbyeJDr/VdG+29LUwSOTj8yQ6B8VlUMaIrzedh51A+CJzCVvXpRTUyLBGMn?=
 =?us-ascii?Q?cbtSzFsUcCoVNUcXl3cnVRWIMaTmkziZ/EfBHZvyommA+87U0eiltSQnPO9m?=
 =?us-ascii?Q?L1FQEtDkQYZIMi+MQG7y4vv/ugnws0ywOyFCEtBVqOapWhQZmAh9gD8gjtGp?=
 =?us-ascii?Q?tqCJLynLEM40MeaiNZkXn1n1zyjfDop70gfF0l8IH0lmS51tTvv0LAErIvnt?=
 =?us-ascii?Q?ynzUAezRI/wnGPQ3mvj/hcGGNlv6uIZLGKmV3nNoue3+s54R4uwMYwIW8FDT?=
 =?us-ascii?Q?nIQnZciHPCivmFa22oVd+4/D9Zfp2NaDuqG5fW/yBTIyp+7NsISBd8ULEkpq?=
 =?us-ascii?Q?yqrTQYnnsIWPkFURX6M/ONwjOSIlbCPRYccxndpMji6slAfR7P4M7jYgo+3j?=
 =?us-ascii?Q?uAgELKhwOTydfGFuXcqk4Pyh0GZ614e3c3cuLOFIEY8pZ2jabhWG5RepZeU7?=
 =?us-ascii?Q?vzPFqnIoCtT4G7SpCO67euZoCy5leD+MEeLzbk9Tq6P66bP6GXqclxLK8d6C?=
 =?us-ascii?Q?H32pAXxW78cF48fKz0MT2sSah7+wgVM3EAS90WmYmtJBLUoT1LvoHmDV/LsN?=
 =?us-ascii?Q?XnjQH8k5Yil6b+VG6b/Ykv342hcUwk8H4KQ0BLVdQbJZtEDCTuRzqOx4yo/d?=
 =?us-ascii?Q?mHkwthkZ0sBtKt3Dr9qz7nyOkLf1uNBspYVutJM7xs4ML3thYJ75PDeCoFN2?=
 =?us-ascii?Q?NyOnCAV51iPrMTA+bJ+QcGT7Zf2lWXKjL7ZGlBzY1ZwgEZN6shbTWcbXuX+U?=
 =?us-ascii?Q?XujWct7oMWnqaJNo9+yj1CNiPc4rand8H9V9AfrE6yskBBxVqe6OzrRUaje7?=
 =?us-ascii?Q?7fT4IiTBSSbI03CXHzIx8hlTOFu21bL4rkAav6gIVhgv7fFQcu8bqU/rwm+V?=
 =?us-ascii?Q?BLuf9SXFesPQca9n2q744JHrccVjpVlh05mIGc5kaPe0JQZz5h/FhSI0Xcyc?=
 =?us-ascii?Q?1DVeJ7S4JdY2ZAyYgaAVNQBxbSJb9KePcBNpR8KIJndkGOAzgXoSW4rJ2/It?=
 =?us-ascii?Q?KJZpESy3MMal27/+qTs6zTgxsVVjEWb+VnAS4qaApiJ4XoM9jXnK7aAmxnhR?=
 =?us-ascii?Q?Rbamgx5DYGKre7b2qHSJqMkTdFqrVLhSa2Bjk/6QobPC9T/ALUchDIkeryx6?=
 =?us-ascii?Q?bO+P9bbrWREf9dknVACECOA+qf86bePMRAjK3xpOJ6X68ckNJeeOWkQppoCL?=
 =?us-ascii?Q?OLRJVpwqtr4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8279
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:5c::16];
 domain=AM0PR08MB3315.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: c457a5ca-72c1-41cd-6aaa-08dd7134b0ec
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|35042699022|14060799003|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?er8VBdPJLX0I1fWZ/dmGJMgh4jIDq84h0dpdh4VKTWqNwHuJ2rFDkdmkubht?=
 =?us-ascii?Q?jLUtkTR/MlglRA/kBF1FFYZdYGqxWnG0lK/GhYaxlkSvy4c+CQnNF+wGQXuW?=
 =?us-ascii?Q?3LYTl0KlU/+2bKpZ1wIFo4bujkPMDdJSQDQYRbzH9DYB5pk+v7rqBS3hsUIc?=
 =?us-ascii?Q?2G7v9MOZ1vnW+wHKo3w1wp+Z8NdntAAWKu2qXZ3RdUmB/FJ/QucEXtWbO9bJ?=
 =?us-ascii?Q?pDI3UuR43hwA3uCdBrPse7WsZD2aQe55hfg94hvU9wZh1Blk9/PK63/8yhRs?=
 =?us-ascii?Q?YqZYE+F7muX+/1NS2ZbyFR/g23sdrK9kvosguekIDu0qu/s4ys5gR2Nvyh2u?=
 =?us-ascii?Q?KpyeO1J+fXnF9MCLR9escI/FZn9byPKqyev2VqCFDOZffOsuzBZs8SCsERBe?=
 =?us-ascii?Q?la3w6oTas13LNc3sYfN/cWMt6k05Va+wSSgOcMSzhaJWUtuiMpIUBZgxEqlX?=
 =?us-ascii?Q?AyJefEwJvHWG6LHmbeBVG4rzk4Tq4YL6xdNUIr4K6+CC/boAPRxBBfc5IJ9s?=
 =?us-ascii?Q?aDtnWrlcrFOMR9O+34HC+TfCM/j34dlpwo/LwhUaVU/hcqWnBp3KIK6NQNps?=
 =?us-ascii?Q?z5SX0HePQLvrgqsD64ykwOpJQm+u6cAU7K4vZbbE/bvvW9HHHeujGZL1j43m?=
 =?us-ascii?Q?cGOPzfRpXKpWGkJOXOWRw0fcECC77kooUVRZ2aEKBeAGVFiyunNeBJ3fHeX/?=
 =?us-ascii?Q?oEx2yz5i3LmNkzLdWuqhp4VytCw3z/NknpQf/xn3+homKw6NsYX4lXwrW46j?=
 =?us-ascii?Q?FxkY0vHjN96BRX+Ax8Ca2UWGOvdEVjGPrc05KbbaBQvheizSbU653MrS2zIn?=
 =?us-ascii?Q?6ZHSZQwGgJATwqheJEx004oYFgdWAiWQrnQpkBIOSpLOEYYwj6vGgZZ6Csxn?=
 =?us-ascii?Q?JjiEKGmEPQVbIRUEOK36Y+owIrs7xrmGj6kVnzP0mGhCU+sqJTnSXwg1EbEu?=
 =?us-ascii?Q?ZGAlEemjSQiUedjcYzbG/7weF4evWwRaWDUqZOZsQ6/HSaNmh48CivlNPXuk?=
 =?us-ascii?Q?RGBWf2XCjan6ixA21pZf9xfshGS5XjxAKcyb8ENsLKEafkkup+ECj2Oy0UfY?=
 =?us-ascii?Q?mwBnr6H2poaCEwjtchpKOZHpCa0J7Tc54Ch56BgeEe/RdGEHJVXyhOlxEsD6?=
 =?us-ascii?Q?ybNhTrivpdD5M3cqjnFu4AQmlbey46GiwtMqx1Qj1Qx8TtyYDmzAnyTMbJkA?=
 =?us-ascii?Q?S8DT+28Wz+hqBB71+GecYDVETv9YOunIpy0/IasQ4wSs2Cis3EcNKobT5mn3?=
 =?us-ascii?Q?lS2MaRSE8PeKrffurgvPhQdTA389zvUnIr61mUMJfmKb1bguVOHuHLNSWtVu?=
 =?us-ascii?Q?7JQcfw16qu/odIiTo8nW+Rs9A0RKin2/AElvI5eN6rin76mhHMZWctTo7wov?=
 =?us-ascii?Q?r+n3t9k8v8UFC6TeQRCOZ2nBi49VXIdcvYFQwG8axLtfAPy1O5fRLN9H1fGM?=
 =?us-ascii?Q?4lB2lCfKTopcJm7cJbRJBcx95ysaITE7DPJdP3671RT9aaz5jzIF5mGzSRXs?=
 =?us-ascii?Q?dz8EYWsz9DqkIag=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(35042699022)(14060799003)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:48:56.2126 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 361fba0e-37b3-4aa4-54d0-08dd7134b61e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7701
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

The sampler must disable and re-enable counter sampling around suspends,
and must re-program the FW interface after a reset to avoid losing
data.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   7 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 102 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   6 ++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 7ac985d44655..92624a8717c5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -139,6 +139,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
+	panthor_perf_pre_reset(ptdev);
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
@@ -148,6 +149,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
 	panthor_sched_post_reset(ptdev, ret != 0);
+	panthor_perf_post_reset(ptdev);
 	drm_dev_exit(cookie);
 
 	if (ret) {
@@ -496,8 +498,10 @@ int panthor_device_resume(struct device *dev)
 			ret = panthor_device_resume_hw_components(ptdev);
 		}
 
-		if (!ret)
+		if (!ret) {
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
+		}
 
 		drm_dev_exit(cookie);
 
@@ -561,6 +565,7 @@ int panthor_device_suspend(struct device *dev)
 		/* We prepare everything as if we were resetting the GPU.
 		 * The end of the reset will happen in the resume path though.
 		 */
+		panthor_perf_suspend(ptdev);
 		panthor_sched_suspend(ptdev);
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 3cb79b999886..753c65294745 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -1803,6 +1803,76 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 	}
 }
 
+static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system is suspending.
+ *
+ * This function must not be used to handle MCU power state transitions: just before MCU goes
+ * from on to any inactive state, an automatic sample will be performed by the firmware, and
+ * the performance counter firmware state will be restored on warm boot.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_suspend(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_suspend(&perf->sampler);
+}
+
+/**
+ * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system has resumed. This must not be used
+ * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
+ * @panthor_perf_suspend.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_resume(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_resume(&perf->sampler);
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -1836,3 +1906,35 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	ptdev->perf = NULL;
 }
+
+void panthor_perf_pre_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (!ptdev || !ptdev->perf)
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_stop_sampling(sampler->ptdev);
+}
+
+void panthor_perf_post_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (!ptdev || !ptdev->perf)
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_write_sampler_config(sampler);
+
+	panthor_perf_fw_start_sampling(sampler->ptdev);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index c482198b6fbd..fc08a5440a35 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -13,6 +13,8 @@ struct panthor_file;
 struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+int panthor_perf_suspend(struct panthor_device *ptdev);
+int panthor_perf_resume(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
 int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
@@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 
 void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
 
+void panthor_perf_pre_reset(struct panthor_device *ptdev);
+
+void panthor_perf_post_reset(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

