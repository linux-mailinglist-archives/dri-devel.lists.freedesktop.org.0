Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE11AC40527
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 15:26:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2117810EAE4;
	Fri,  7 Nov 2025 14:26:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="qbVYjQKN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qbVYjQKN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013053.outbound.protection.outlook.com
 [52.101.83.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9017410EAE3
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 14:26:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=X1/B6bC3Zf9L0zJgsu+fmO/CPWDjjxi56YsSV0VmmHWKwlNVs4Phm/GNWltWOt3FZUzjlsCLhSWubMRJVc0xQ4mK4OTw5kQAu6uqtdA+o53YY3H79+Ii1erLPVO4OSlbT115YDUWduBVBLZLSHQFwahgx+aSCMNNZ1V5vm4oQSnBE5gqnyRQ/n/OB3OE+WfWFbI3hKbfHsUo5uaZ5RXWJMnBVcVkKFWL8Ec5obOQ5Q55upU7QBvLqoXl5eJPszC/kIPmrjzc3oXuucxJ3fpXQuvV2BX6zM0jRbMkH0+rptjRgCRrq/uREM4f7CI6apvN32nZ+UjZYikPmFzjncgBaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RCOejdss8AxGUVSnfnSHwp9QIoVg2l4egJtmEIwohg=;
 b=sc5PTlmnJ7wccSmUUNWU3cfiOeY1o284jiM/bphaPvEXRn0tklrH3ZrZzaq2tuw6KEFSsOENeRF2DPoHJVgzH4mlnJ6goDXbTTSNJ3kmqo6fqExLlfvUOjQlehA7hAmYllo0y5/vK27lfY+H2KopXA5AStYPrnd6CiHjZVn29L1ZP29jmzYKi8AL2Q+crCzXDY2+etWCb2NxHxI7jYd4M14tPB3yz/0Wvwl6A/uLfvEyxa7SvowwiYXFdZaaWB6EhsIt8DqzMJ+ayygzNHEyp5N2Ab75qjUDWipAvUm074eFYnQSqRYKs5usUSj3Zd2HE6kqw704Ii1UzioTESZtQQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RCOejdss8AxGUVSnfnSHwp9QIoVg2l4egJtmEIwohg=;
 b=qbVYjQKNUunvzaEJj3Lz/5pN2kIKUGK6SqLaty8g6JqyMI2pVI6ZQSa0vkICyst3/MXhfflWFvL4Cw+9e5rNYbt6jjf0CK6F3mqCpIieYZVTSr2T4GaPNbmSchi065PZNU3luUmyfhWMpe+wQTQTldLac088tgWntGN114iURos=
Received: from DU7P191CA0010.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::35)
 by VI1PR08MB10148.eurprd08.prod.outlook.com (2603:10a6:800:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:57 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:54e:cafe::62) by DU7P191CA0010.outlook.office365.com
 (2603:10a6:10:54e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Fri,
 7 Nov 2025 14:25:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 7 Nov 2025 14:25:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq4ovleqiq165LTaChQo1TMStOqOhTnt7QP0pIxngKe4zxsryohRoIuzRDM63YWjedYUByW/DfTdfCYKH9U6drrV9qPAx29Q/2h2EUt38eHYOWNgjmHeZygaVRJfaM1eA371G/OEkvEMan77GJ3YIW3ChGNF5u0b/c4IImo3x1Art6tNrL5uTZ4R2T+SHiIduZgmNb7htPu0YFb7EgM+BFGwbr4m9ruI5OleL179g75cXRppCJAkXKDgIbQ/H7EmE4oZGmnakjApDwb9vWswaDL06bb1AjB212xj1GDChHrPj+41tUkxkp3o2YnH+nBMaRFPwCi27V8oEWAtkGIpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RCOejdss8AxGUVSnfnSHwp9QIoVg2l4egJtmEIwohg=;
 b=rmnaTVFHV9V8DI1DF6q0JcZeX3B9l2bY0lXiSonUqqUk24/BTpDvBK0FqRWvR34glC6Uxle3u394ctB7+PTR2vsDsxPTaDuvsLq8o1q3GPxHoOrkdnphIaPlszXuAL0RUb3keAvMyCAiLmn1eX8sMuXnEftEs726tenYgp0RUjYdkpALc2ZvkPIAsXL1felEEDNq58aBsVRS3FCYVp4Bsy7P0RI57frX6i5lXv1shEUFuYqml8p96TrJGfOr6luZ1EeO3JcvM31y6HNiAcJ3kFw3s88WsnZhuaiHcFRN32VVgvIHejDY+/nasyCUK2euMKwmT1beB0megH7StH4LSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RCOejdss8AxGUVSnfnSHwp9QIoVg2l4egJtmEIwohg=;
 b=qbVYjQKNUunvzaEJj3Lz/5pN2kIKUGK6SqLaty8g6JqyMI2pVI6ZQSa0vkICyst3/MXhfflWFvL4Cw+9e5rNYbt6jjf0CK6F3mqCpIieYZVTSr2T4GaPNbmSchi065PZNU3luUmyfhWMpe+wQTQTldLac088tgWntGN114iURos=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 14:25:24 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9298.007; Fri, 7 Nov 2025
 14:25:24 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/8] drm/panthor: Support 64-bit endpoint_req register for
 Mali-G1
Date: Fri,  7 Nov 2025 14:24:39 +0000
Message-ID: <20251107142440.1134528-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251107142440.1134528-1-karunika.choo@arm.com>
References: <20251107142440.1134528-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0023.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7505:EE_|DU2PEPF00028D0F:EE_|VI1PR08MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cdf630-e198-4a14-2c18-08de1e0990ba
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ygDj0O+KBN8r/Fxtxmi590JHAZ9zu0cK9n4mbWRuT9r4e6Bh++E0TWeR7UWA?=
 =?us-ascii?Q?PMaSf6fx+Gp0Qp3IkG/255y8CCSprWamDENm7awzudWeMwixMp+uL/L7iSHy?=
 =?us-ascii?Q?Zjflh4Zya82vZjRrr58i/gA/ZbdcdSNRnHPD7sDw/208XDKKpmZcK7omyQ4l?=
 =?us-ascii?Q?S0XKqeGOQ0TOIEqSpCo5loLSKlfb1l4HeHhBYSPjYeF/fz8N3frtkV2VTemO?=
 =?us-ascii?Q?e1S/JQZhOcVPzdNooauSg44ciZET+dUr+et2CtlT5JbabuQa/9qpvpOOcvEl?=
 =?us-ascii?Q?ZRvTYn45e8DxKRvm7QkpIuv4fNMTUf192He4TmODIo6a229jKR+7k2TP1LKH?=
 =?us-ascii?Q?TYSWgnWN3rIN5L1HtaAeVX2YUQBVdNsgnkPcAm/XKMvZxcSRdy8sM0sphi8C?=
 =?us-ascii?Q?IPrmKMVwJXjvYtmTt9om3BXm8xgWWguVpNw9cZOlOHadTfXJUCVoloixxhMo?=
 =?us-ascii?Q?FAF9JwQ2e99buMEpxCjJLh7lEiwag7MIEnnCU1jHNGH5EUuLflnvYZlunoew?=
 =?us-ascii?Q?Hh6erzIb4Fb4aH/GIpgU8pXY4HxGLBaiSgpBhvN4hiV+1uYh3vCZVrB/hDvU?=
 =?us-ascii?Q?WqjgOtgOploUxbJKn6KJk9GKv3+meFu3X1eyISU+Sgh1TXolCt4tLDRhi/Ds?=
 =?us-ascii?Q?/nceJ9wofe2+fsiz3HrmlA+PdXKzn//xnbFovtAu/TVxxgHaWGQAbdDMoVTY?=
 =?us-ascii?Q?+25F7a1DBeTGzLQ6yRlh3VnYAnZCNf+JArf8O48nZXQ/aqjfcqY+UTZuYtVS?=
 =?us-ascii?Q?JtK2e4fzGad2nKCWbt6obEb8AlNMJ+k2P9LrHydndZw18xQKsBS0G7WV4O6v?=
 =?us-ascii?Q?2eXroaFTrWasO/SETXubfC2sLJ+0Ymgmu2pyx8o7spsvU2CAewU82Wl7U+Yq?=
 =?us-ascii?Q?xk8trTHJLGyRr4i1ABCJRqB29yEhvDOaIl4o42bagtwymJO2T7w0vUC2CEyx?=
 =?us-ascii?Q?1V9G9OnfURJmpeya5ZA0TQIFg5gceVytmM9kF6CSocgfsZMOtElJ8wqhmGo7?=
 =?us-ascii?Q?fuJo8XJjBD4bcXkigmxldpPuv2YyBfcdG0mZpnANQH7whw/vxjokE5G5BHJQ?=
 =?us-ascii?Q?Vm/dd6iWT2zf4+WxctcdcwZ8LZskqPr7xTu6d93fm8Pqv6KdoTEKOoWx+sQS?=
 =?us-ascii?Q?P71WcfQI2EXcnaJ+jmohJrQ4tJDEmrn1yPXwxjcEAI7D5gMLpmQt1qJPBBPg?=
 =?us-ascii?Q?TJKXSxIvVbO5Dzdp506QhPGff83PzYgQPcOKwNNHeHQ0B4yJrxZMxuhmZCZx?=
 =?us-ascii?Q?UOg9nKl2B76g6IFN8qVheFXZn3CQ1jzAeXmBvo9BgfOrUwmAgHV49xRozWT+?=
 =?us-ascii?Q?hXJwZs+V5UvtXqsfZaCxA8R8G8dBwMCYjzUD3sWKjxUuPp0NQ4jgc4ATXVc2?=
 =?us-ascii?Q?EoMt91lqam8zJAatxzEE/CKFwYvOmuUGaVwRqZumWDai9Z23jbu4d9Iqq+V9?=
 =?us-ascii?Q?SgNoc2xzBVUJ9Gt500wcja2AgcEoxgdC?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fedc19e7-097c-43ab-d878-08de1e097d54
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?D1zBETDAmaKJQImQsvzQy9qB1zx11ZU9YdfD3RAsXd4/RwMmk8+lkK1c4EoE?=
 =?us-ascii?Q?zVTHH0VX4AwR5W53h5z832M7RMuqCcX42s9fZ5dC8Q6cE1Kz9rofSsJdIoMa?=
 =?us-ascii?Q?3244KfieueSX5Ret92UbJwgdv1ADSg2Ot+Rn4SaSJV0l9hrHMIYmSjP/qSxq?=
 =?us-ascii?Q?ReB6KaIHlApA2JZ+AxB9u/oHdo5IXJyyRzvbWrVBD1+1W3eiw2x3R1fe1YlU?=
 =?us-ascii?Q?b1pA4AMq7z9VesYTfrDSC8h7y7NOhxJadtTTH2VLxZ297y7DqxSDdDvzJDVi?=
 =?us-ascii?Q?BeiQijl21LTt1hivJPSnKEAUn3jTG6tXbfbeWwioWH9uVhBRwsua7nRHENLo?=
 =?us-ascii?Q?YziD6Z3JJSsjqkHs1Gv7JW8VcT/PYaZ1XRLSFE8wlnzduV0jChS5b4u+0WRD?=
 =?us-ascii?Q?9Mud3+6SZ3z3m4e4G121bLJJwZ8Ez3j2TzDOQlsMlO63W6j06UeMJhHxWDDX?=
 =?us-ascii?Q?xQp99/c8St1Vs4djT4CALr20aGuDvJU5iOOfS1Lw3Y75Zp3EoIw7VjOxXcdE?=
 =?us-ascii?Q?lSjBiSaB6Eoxf2HU3trYlUoQySoA446SzqJh69e6RtN1mDX/BDADt+lN+O6R?=
 =?us-ascii?Q?ic803mECnl+Arla7SOst2G3/osRTKXQONn2jRLON6XTuZnIPX5gl6eG9zf1x?=
 =?us-ascii?Q?Z+NeaYNSFXVzTqNskFJQhjLbPAlrqFfeW70/xg7SXVcyacEfsg6+BJQ+Y8LR?=
 =?us-ascii?Q?ZfqOdaDilQdXVzqYNDHlUC1siTUMX0umQZxNt629eA87PX2AhZNFp4Cd8ztU?=
 =?us-ascii?Q?ckZoQxlpbCFIigFnYV7UjKPMCnYc6WjzrMCDaUEVVeHIO55P0iMLNw1iQ2m9?=
 =?us-ascii?Q?TQm19Z+CHsoQyir/brlyGQZ6O9UwpdC/8EwZwUww8nYVw820C/G5VJaLlAgp?=
 =?us-ascii?Q?IQHlLpWRJrjBJEtpxP11h0f65OI5RXnJ5hIya3uRnqjUPAt2Ij4rhzEvq/I8?=
 =?us-ascii?Q?DalA5bKi8pJaM6Fm9njpnaV0FdvAUSVvrY+fKgzc+SExcuLnivwSpO0ZalSK?=
 =?us-ascii?Q?U2lnXf7h5pL1YG4p8DSwHRYlpzt4lKt1gczbfie8cM6UpXF3cWcG0G5Yw1L8?=
 =?us-ascii?Q?Yk2bReXS3Ns06i5wghswFonN66jgEvo+4ig5KtqeHQ/98ce/IliX48YjCaSh?=
 =?us-ascii?Q?uj+QwAyxoATZ+Uu+WH6utqJSa2tYKXog3jtQnRbhA36CeBHA/pMRDX7eRMFt?=
 =?us-ascii?Q?SCYHw7Wl7HOf72z5oSl//mr66OOHrf6r2ZSlC+dUulmQ4D+jieN5P8fCyx5l?=
 =?us-ascii?Q?ijVwbNgzljl7/9ky6jcDzoipv/QwCjligjt4OMbAav/P+fITJkguj7P8q2SC?=
 =?us-ascii?Q?fQPfma6MqnyHMPyGWslxkmN5DdhpGtcZzKMFlbu3mK3P6xr825H4bpjo3MT7?=
 =?us-ascii?Q?pDmZB2Xme1Q+LzSrJten7zIFS1FHb+MAZzvQ0xLPUwYLd2qCjlYLQmAX2fzc?=
 =?us-ascii?Q?ObIfQI4f5dZpmvWzJt+Wrrgios556KvNOYeWlR5lHX4F/tJSsNOrjryHTGsD?=
 =?us-ascii?Q?umYuovo0nKSJ2BkvKxh9qQq+MwOEJobgsNB2P6RuuBHZfKnBRfK8aGbu5V/N?=
 =?us-ascii?Q?MwZ24FkoIM4nY257Oow=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 14:25:56.3764 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cdf630-e198-4a14-2c18-08de1e0990ba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148
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

Add support for the 64-bit endpoint_req register introduced in CSF v4.0+
GPUs. Unlike a simple register widening, the 64-bit variant occupies the
next 64 bits after the original 32-bit field, requiring
version-dependent access.

This change introduces helper functions to read, write, and update the
endpoint_req register, ensuring correct handling on both pre-v4.0 and
v4.0+ firmwares.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v2:
 * Wrap the CSG_IFACE_VERSION checks for v4.0.0 with
   panthor_fw_has_64bit_ep_req().
 * Removed wrongly included code from previous patch.
 * Reordered CSG_EP_REQ_PRIORITY_GET() and CSG_EP_REQ_PRIORITY() to
   reuse CSG_EP_REQ_PRIORITY_MASK definition.
 * Updated panthor_fw_csg_endpoint_req_*() functions to accept CSG iface
   structure instead of a CSG id.
 * Update endpoint_req variables to u64.
 * Minor readability and code quality fixes.
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.h    | 25 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 21 +++++++++------
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fb1f69ef76fb..2ab974c9a09d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -325,6 +325,42 @@ static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
 	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
 }

+static bool panthor_fw_has_64bit_ep_req(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0);
+}
+
+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		return csg_iface->input->endpoint_req2;
+	else
+		return csg_iface->input->endpoint_req;
+}
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		csg_iface->input->endpoint_req2 = value;
+	else
+		csg_iface->input->endpoint_req = lower_32_bits(value);
+}
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		panthor_fw_update_reqs64(csg_iface, endpoint_req2, value, mask);
+	else
+		panthor_fw_update_reqs(csg_iface, endpoint_req, lower_32_bits(value),
+				       lower_32_bits(mask));
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index a19ed48b2d0b..fbdc21469ba3 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -167,10 +167,11 @@ struct panthor_fw_csg_input_iface {
 #define CSG_EP_REQ_TILER(x)			(((x) << 16) & GENMASK(19, 16))
 #define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
 #define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
-#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
 #define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
+#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & CSG_EP_REQ_PRIORITY_MASK)
+#define CSG_EP_REQ_PRIORITY_GET(x)		(((x) & CSG_EP_REQ_PRIORITY_MASK) >> 28)
 	u32 endpoint_req;
-	u32 reserved2[2];
+	u64 endpoint_req2;
 	u64 suspend_buf;
 	u64 protm_suspend_buf;
 	u32 config;
@@ -464,6 +465,16 @@ struct panthor_fw_global_iface {
 		spin_unlock(&(__iface)->lock); \
 	} while (0)

+#define panthor_fw_update_reqs64(__iface, __in_reg, __val, __mask) \
+	do { \
+		u64 __cur_val, __new_val; \
+		spin_lock(&(__iface)->lock); \
+		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
+		__new_val = (__cur_val & ~(__mask)) | ((__val) & (__mask)); \
+		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
+		spin_unlock(&(__iface)->lock); \
+	} while (0)
+
 struct panthor_fw_global_iface *
 panthor_fw_get_glb_iface(struct panthor_device *ptdev);

@@ -473,6 +484,16 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);

+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface);
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value);
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask);
+
 int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
 			     u32 *acked, u32 timeout_ms);

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee5..d6f5efc10312 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1139,11 +1139,13 @@ csg_slot_sync_priority_locked(struct panthor_device *ptdev, u32 csg_id)
 {
 	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
 	struct panthor_fw_csg_iface *csg_iface;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

 	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-	csg_slot->priority = (csg_iface->input->endpoint_req & CSG_EP_REQ_PRIORITY_MASK) >> 28;
+	endpoint_req = panthor_fw_csg_endpoint_req_get(ptdev, csg_iface);
+	csg_slot->priority = CSG_EP_REQ_PRIORITY_GET(endpoint_req);
 }

 /**
@@ -1303,6 +1305,7 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	struct panthor_csg_slot *csg_slot;
 	struct panthor_group *group;
 	u32 queue_mask = 0, i;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

@@ -1329,10 +1332,12 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	csg_iface->input->allow_compute = group->compute_core_mask;
 	csg_iface->input->allow_fragment = group->fragment_core_mask;
 	csg_iface->input->allow_other = group->tiler_core_mask;
-	csg_iface->input->endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
-					 CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
-					 CSG_EP_REQ_TILER(group->max_tiler_cores) |
-					 CSG_EP_REQ_PRIORITY(priority);
+	endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
+		       CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
+		       CSG_EP_REQ_TILER(group->max_tiler_cores) |
+		       CSG_EP_REQ_PRIORITY(priority);
+	panthor_fw_csg_endpoint_req_set(ptdev, csg_iface, endpoint_req);
+
 	csg_iface->input->config = panthor_vm_as(group->vm);

 	if (group->suspend_buf)
@@ -2230,9 +2235,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 				continue;
 			}

-			panthor_fw_update_reqs(csg_iface, endpoint_req,
-					       CSG_EP_REQ_PRIORITY(new_csg_prio),
-					       CSG_EP_REQ_PRIORITY_MASK);
+			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
+							   CSG_EP_REQ_PRIORITY(new_csg_prio),
+							   CSG_EP_REQ_PRIORITY_MASK);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
 						CSG_ENDPOINT_CONFIG);
--
2.49.0

