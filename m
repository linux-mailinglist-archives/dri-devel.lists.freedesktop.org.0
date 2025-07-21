Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3744FB0C275
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CC910E4F9;
	Mon, 21 Jul 2025 11:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AOBUBwOs";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AOBUBwOs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012010.outbound.protection.outlook.com [52.101.66.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9E110E4F9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:15:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=M8/RtjFE6gn9yXv1drQyO5kJnQNj3Fpa2XXP7N8DRW/Wnm7RjMaE4IlF7kCtJGpYoBPGAtR3vEMdQrpwNLb7POda5gPFwbT4WFpNOLW/o4PtAXfoisBJTt2Rjq9+N+k3r3AuhWljFuoZO6WRDoUW+EJmOBII6z+ITbvjDz0JDAGX9iRUShVXA43QuNHMgmTgKtHJTRLAUJuTIMn0X6hsPrWVO58jgrYZH0rRcMRdremfce3cE21o1UAbPCwSlGothHgUw7OpIRv0/hUoUpXXCXWx3tWI7vloR4fRrPIIXZlHV+v4HG7tw5IcDa/dMg0T3BvBs8AS1O8H8Zc4IDabeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=HqbOxaC7cDqIEssY39H0ys9q2TpZmwVhGE/301uGgjWQLXH39INRxHWzkBhlxlyBNHfcEC3a+5YQIJMAT7MUcMQZr7UhpiormWJSpxEY2/YKQUPvC/42Rs+/DEaMI65xPTGM2NbECyAzimAj682TlENyMvSmnw19kuqhyNBkWHKK/Ct9FL3EPjyjWD5/Ka6aSwgKGNM/oUOcFYCx7uecE6IyZEdhssc8h+CnCvG6UYGM6QwX/XKgxBEXsUFPtb54iB6AxtfTpyaci2hIk7J0COD/7OlKDI392eVZioyUSbRJ6Xk6omsheak9DTq7EWAzvOOr/b5PoT+8pCC8XJ3dNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=AOBUBwOsVg3nTLKfaERZ4JxpDgniMj3pDazOJmGwxBurcef525hSkJIEflEW0FBngECxXjLfYWfS65x4Ir5FAkb3keIIXC9VfRIdpebh/9ihYSyKH+IMzQ0jgB7dJqxsvzRITRXXcSJNowao1xA6O28o4yLO735ZZUDLIHcC268=
Received: from DUZP191CA0060.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::10)
 by AS8PR08MB9480.eurprd08.prod.outlook.com (2603:10a6:20b:61f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:15:08 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::4b) by DUZP191CA0060.outlook.office365.com
 (2603:10a6:10:4fa::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 11:15:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOlIHcEd50QmhOcG/mYYHpN+jwbX/v+E2Z9GSGS9rbdrDwSUGApv0FkaTQna5ZrYiXGUw2e7ly2FNVvB3GkhW9r2oXm2ZX6AvyDDevsm+Zv3aIGT+vbbAK7+1Wks6FsapJHK+nUshrEWDgjlQbt65bu6kAkrMmMmEmlKtxx8V9pYoMs03ajwPExCsWSgf7BQg/RZpQMDo2z3XP8ENwbISQz7MaHYt70OB4Y2LFMUnp62Yv8vyLNPe6ffIn31LMBc5f/1jRhmhxjqaQZ5C3FAdLhKT0nW397lBWBdLNU/So/Kgh10Borw10UxN+GlKZxdVRF6I3+0SyB33ue9y9245w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=ZNWqQuhX3FYnupeuBNC92U5Be/NOfNeSs+7sFzg0/90LK/ehyt6XiCcr3avVwrKVchtSvUXtsoNh3Z0FQyPik0R8LacvbPriWWHHEBtaqxOEZiPSlD1lsCNSyDdD6DSW89doAT+DXAdMDRoisSXnCot5tDQo72x0X5wfPnHGigt/48y6ISFcDLvKezJGB28CHwLCcI57nTiSp+7Wc6bj/gWPD/fBCtIC7LC9gIo/6Za7HXQ+TtFuagi89V+M+SrACMVMqcclQqdAeXVpPnuClvQWi2uf182SvIwljwDBzh25rZdUDw5W2VHnpOLyQhZLTw7txVdI3P+Hqsdn7QwNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VlBVOSA2uwG0PJ4AtWxlHPkPm47o6l3sglU4RMSnT88=;
 b=AOBUBwOsVg3nTLKfaERZ4JxpDgniMj3pDazOJmGwxBurcef525hSkJIEflEW0FBngECxXjLfYWfS65x4Ir5FAkb3keIIXC9VfRIdpebh/9ihYSyKH+IMzQ0jgB7dJqxsvzRITRXXcSJNowao1xA6O28o4yLO735ZZUDLIHcC268=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:57 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:57 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] drm/panthor: Add support for Mali-Gx15 family of GPUs
Date: Mon, 21 Jul 2025 12:13:42 +0100
Message-ID: <20250721111344.1610250-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0632.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::22) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|DB1PEPF000509F3:EE_|AS8PR08MB9480:EE_
X-MS-Office365-Filtering-Correlation-Id: 509b5dbd-d19d-41f9-f9d9-08ddc847d8fb
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?I9RK7lhSMw3PZcBL6sDYlW/CBhr7fdB9fdzSg90hXQPeIFdIMGWNF7U5vEk/?=
 =?us-ascii?Q?i1t5qmOKtUp7l2OLo6C6/VjRlsX55B6u4+4sAv8Qa4pZ7nw4a/WmvaSN3dMv?=
 =?us-ascii?Q?wJHs/V1enh+qUn0PILZctzSqLf3CvjAAH7MFF0QcwOaGRMpCu0lL25aHbFrk?=
 =?us-ascii?Q?3JYIg142lLZFrW5o2TmOMh9mbW9Sc5WJbuuUvuiY7i1pLOpNNkrX0q4a7/R7?=
 =?us-ascii?Q?F/hrJznpeNY2x+oGdD78xk1nCa6GVM63YkpRqMye1oTS91jrGA/VXUGc/B9h?=
 =?us-ascii?Q?bJQT/AFnbV2uFHSifkGcmGn9iARVhYrdu1Zg2OS0A4zYXGET3wkmqAhDGx2t?=
 =?us-ascii?Q?q2bnnJx6r41BRPvejnnNePFLjorUCl9ktL9HMlRwC5aOAV+Qxf9VKXS1BxBG?=
 =?us-ascii?Q?noBgD6PWFgspGUulCfod2xj7p+Ad2cl7gXxfbh6BZIIU8+7atP0U4QXjmITK?=
 =?us-ascii?Q?KIWSKru05JSgVzmdhmvN/wbOxW9N8dPcmSZzdD1ihyYNNxlpWbZV6AX3Jlgs?=
 =?us-ascii?Q?+PTKafRZFa+B8oDPDkUUlGvrjWWGWuhFGZ9IZoSALkbY3VGuefDt5OP49mXB?=
 =?us-ascii?Q?HA46SYPy1GeUw7bcrERYUtfpqrFsmsnEjI9m0uODZFSv5Ujr8K7XLU3kdVci?=
 =?us-ascii?Q?qxQLVCAapKkD/efjjRIrh3lIIUPzPCcB7UxU82JqxFxzkKd2G/4g8BNgQqlU?=
 =?us-ascii?Q?FCQp6q8T8m+OR/DxjQF0OFK5WHAzR7KPPiuvyekwZcIRA9AZ1cTrBsHbrxmS?=
 =?us-ascii?Q?gMu1bCp3V0YqLXkyyKi8/QhXdvHGCJO6vMlYfBeJg+L647tWv4UWUBVAqPrK?=
 =?us-ascii?Q?ISUW6B17Bt8BKvCeCgSZx1X2YjrnxJ5dVlcEruaiFvXE434SddDtjtFwvku2?=
 =?us-ascii?Q?/sK2BVfvcSiUBbhM4OUZahnO+T3rQmXf3LM0tTTQ9XuITdWTRHwkJp0HWkpE?=
 =?us-ascii?Q?LbbV1YkWFG+y6rclLEuSWZd+5vEF62H5K2yIeYc07kU4WIAvAxhIr3EhHpXL?=
 =?us-ascii?Q?z/mzPAWUWFat74LS43bD1Qfv85E1ZEJuWBqj0mpLa/0sb+X98QU7CnR0LbII?=
 =?us-ascii?Q?OKNtHPbABtci6JA874uTu5cfQ+MmJIW1JuJ4VRMEiNteI1m1IISVkAWdQ4X1?=
 =?us-ascii?Q?ncmwyQ3rCGSnSDAoBxrKM+aTx/8YcKYKg8qijdYTooDtp2mEHL9B6JrKinq1?=
 =?us-ascii?Q?X3UrUfkJo6QIc3WPtYX858GQI1SRIx+6Demmk1RuBf2rPff994qEltVmPps+?=
 =?us-ascii?Q?kzJ4SMK0h2Dybe6odClXgRgYQxC9tMDAlJYC+W1xZizRhR85Bd3JVxAbx8Fo?=
 =?us-ascii?Q?i+ZwyiHDlzPsA1+dtBNz5KdhTEl/ImnL9YGAIxHCtK8eywf34w8w0aDg0+cs?=
 =?us-ascii?Q?C8Nwogkg5S4XpeYouNcFBPJwIdgVf2MObt7dnBRDY9cSbEzsdA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 27fa84cb-962a-41b0-b6bb-08ddc847af7b
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|1800799024|82310400026|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eov1DZlhLuYeR34DE3+pSA8VuphFdLBfZz8+cZn9LH9vFZikKO5N6+/C9whl?=
 =?us-ascii?Q?FW8sREsWE6QXgWuSxSH+LFiYSJ+1vSpuEobz9o1wp8cS5VnsHjbrsKjGgnVD?=
 =?us-ascii?Q?Opu8/ewOpzJfD9+W5zxMkCSymLAvvcrkFfXKd6fZgy1WbzQZM9mEzI5ayXAL?=
 =?us-ascii?Q?YBdWpVdGcry15Npzzb94A536IQl4fZIajCEObh4fM/qaDZ9Ft3mjNFdnBAfp?=
 =?us-ascii?Q?nB1FZNb5fRBBhYvDuK8CsLgc9qWpLv3xRww//rfsT0OdqbcGjH9cBRdDqxZx?=
 =?us-ascii?Q?OF0tIyVIPLLUxbwk43PxcW6ByfDBbXm4DwD44IuVwUnAy+pt2fkFD6ia9z2G?=
 =?us-ascii?Q?KxrYOHOOvp/nTqOu2VLVVMCCOAFZKRgiEwIVFZU4twUYDl0azeG/S65HPCIs?=
 =?us-ascii?Q?hfCIcpqG61Ops+LuASuK+enq5TqccN1gMnGFA6gZI6xruHKD75MPs9iaBajv?=
 =?us-ascii?Q?iWMo74ALoXzLh75TLHhlWOQ4nUVEwvnpxJGITk+0WMVPgpgg13Z5iUccLGXi?=
 =?us-ascii?Q?puvvn0vVTv3N3LNAvM1ja1utuBop1Z2wfkz7czgYeGC5QBmjW+/XcTa4Mo4N?=
 =?us-ascii?Q?q0sa+KMwEO4FVI/Y3S31Sb7hCI5lmQN+/+LR8kk7Qpws0EEhsI+jR8dIQHWT?=
 =?us-ascii?Q?ospV/m8RqbfJwtM38IblbErpKdFb0lPZ/lH3y7EdHms0Ezm8UGmNZ1UJUcI/?=
 =?us-ascii?Q?SwOkOGZGCQ5Q0pyab+fbxRc5JlpSQbPaiX3cJ9O2UT+bXlguQAP9jHQ5abdx?=
 =?us-ascii?Q?8514Dcn0KWVbs9rS2Ug8mNSl8svY/TkWKe5epwyohfSx7tn2Q8J6nnSF6ATF?=
 =?us-ascii?Q?wg6I6l6a+rMJwz+P2N7rcTwdWUDgH38XJobnEzSm3h35DWRX+9iOATsNppYP?=
 =?us-ascii?Q?vxstCrFdqDO91n3WMG73V9ovE5pGIvl/1XSjj4+HbCJmk5HVdq7o1CDtn2of?=
 =?us-ascii?Q?vXbZ205xML2hEmph7bBR4BVD3ALRbaZFM8tv13cr8+3mgO4DYK2N45U9DW6j?=
 =?us-ascii?Q?QJcBO5ZqVRpsiLVGCZWakBNYgIxCs0Jtl9REhZTuJldHXTNqXtCQBR+WI2Ul?=
 =?us-ascii?Q?HdlVLcSMEmJ4EudqjHJSCYlbio5OCDiVmS6A2cF3duAVss+jC0Nx1hFzfSp1?=
 =?us-ascii?Q?Fl71JmQC5OX3H8YSnIGS/rPqo5fR3qPlWhnEG0DMeHgOGKxNhzeU/qkDMLiU?=
 =?us-ascii?Q?eZvI8Dx9EE5bY4KeYw60HucU1glxda/JiyR6Wnu1nTCoY0crWdeXh+7A2CfE?=
 =?us-ascii?Q?B0pQGRSuabb2dx3CQ633eTImUwGt4qfnjGvjSlRxpOIbO3PXmu8PWP/zP/mA?=
 =?us-ascii?Q?AjtmzEPYcHSv4k3hk+AWngwqk1UmNWCz38XniwUUsLd5m4sfIS13n2JpsrsO?=
 =?us-ascii?Q?y/GYihMZDdmnsZa9OhTXKz0AX1QZ3mUkPYcYWmeU6LFdCc2cYdC0813dqS6H?=
 =?us-ascii?Q?iGsSy9DOFhbxgKQ6zwwCq3l3oIAPyxU/i2ehUVf4ETFIh5i0BbGLt0SJapN7?=
 =?us-ascii?Q?cauungZSrWwFQMNMwCHOmPWwIQDO9TOmTe83?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(14060799003)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:15:06.3997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509b5dbd-d19d-41f9-f9d9-08ddc847d8fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9480
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

Mali-Gx15 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info. It also adds the following
registers that are specific to the kernel driver only:
- ASN_HASH_0~2
- DOORBELL_FEATURES
- PRFCNT_FEATURES
- SYSC_ALLOC0~7
- SYSC_PBHA_OVERRIDE0~3

Additionally, Mali-Gx15 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for Mali-Gx15 GPUs.
- arch 11.8 FW binary support

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 15 +++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 11 +++++++++++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 7f138974d43b..a7583342d797 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -13,6 +13,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -23,6 +26,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G510";
 	case GPU_PROD_ID_MAKE(10, 4):
 		return "Mali-G310";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -53,6 +65,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 48bbfd40138c..e4c34f70a880 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -70,6 +70,10 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define GPU_PRFCNT_FEATURES				0x68
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
@@ -81,6 +85,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -107,6 +113,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)				(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
@@ -115,6 +123,9 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
+#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
+
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index e1f43deb7eca..467d365ed7ba 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -327,6 +327,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

