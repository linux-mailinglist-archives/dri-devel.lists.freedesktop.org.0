Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB50B0C265
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101ED10E4FF;
	Mon, 21 Jul 2025 11:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="g/0x5ELe";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="g/0x5ELe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011015.outbound.protection.outlook.com [52.101.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF5110E4FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:32 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GKJR+hwz2UOIdGdurcbzNFVCe82lHT8w9SyzEXReUUsuJBY8jEpsYTMsC3q108rRSeKfnr2vDggOC9TIYEbarYMl/Vkr3+M605QgpHGcdFDvtxSL2QNcEGug8dvZBWRwE+f54tv09/luZifpD50rLuR1HZP4FcuPM1Sbr1GRbsLaqkmG0TCH4ownJsxPW/mR/d+0800+4vuL/gNyKliwtJQUFg8rXlxWe1G1sVIVP9k9dvVsIf1i1BrXhTDj8+oU0VtknSJmT7Ya7zaoITo/nfBIP5tfKjFBvErDnkf+YFs0DfDfhzz3Flr808IBkQ5Q6h/0Dc/cDoaTg463YYZUrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=EVrdabo8zyPt7by5yqaNe01dI9UxaGD9e8vStwq4T5dLm1LtjQG3XO/En5c6gb/3iGSH4NGtwldkNWqti6tWyVD5/4vFbqoLFFgucwZYFdeJjKNHe1UtXBk/foCZ2XCIdEstlYkEs4XiTNZcyyqKiyk53x+2lCoDC0rBJe1L9Mx6cK5B/DMug2SyXSCnhFKP+esTQU/fxQq2OJJeUyOuCTBiGjGbrrphid4BScjXPdawsqy1+dpP8ZeAKlE4piMNin8RzrppjrGeSOAb/h95i1LX2N3OBTuL4nB0KVZNQqBRknHY+HogzeIhgIiibzrdv91mxici6uL/rdP2rashmg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=g/0x5ELe73nEqpJyGE9FcVLY7NnUQ4r8dUDLQ2IH7V75/7Wqy/Ha4Km8sWUHZE9qSv7Px+7wg5RyikC+8GszMvqKTEPz7dlgU1lXXrvsri4OSEMFs6a1xSmkfkfq9wON+/STs4mvgkuXoIJuBS4UgbaV9uwIJ83zaxrnP59KiTo=
Received: from DU7P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::21)
 by DU4PR08MB11104.eurprd08.prod.outlook.com (2603:10a6:10:570::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:14:27 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::99) by DU7P195CA0024.outlook.office365.com
 (2603:10a6:10:54d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:14:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:14:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1vh2cx4eTfrjl/USNbyGCOUAZRS1fdgun35vzijxDec5H1T8dZ1QkOQaP7ZX0FWYM408WN+XrV1rYOchOHuQbmcOvZ/Oc4/AN9huOYol9IY4Fp0dgRjeVa3Ax6qaraA0UGSL1SSkTMUTj9o58y2l+faf+QU2tEFbyk/foe9OfKBam/Nt4PmL8N0LAIr9G+MWl+BdqodpKTM8MXcB5Bud6284nueUAHi0z+6xzjbtV5v5+j/pHRarg6Tow2Qyb99HrbeqmC3Awcf6aU1E5HJtw1xRuqikG7UeMfa13OafsQzw5xkfTz2KlA5qq+gktxTNk9phYZgknOSEsuUMGS81Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=sBGIbRZpePQ7T6HK+UQGIzI/sISHOART7pGTZTA6ZF/EPP46Bp1/bZL9T02HnQZ8kt00qe2ePVfVaHkR9g+QnqVlX7iOkT4jhjujSQHIfcHsKq2KEzcsWcM9V/ho7tynRQOQULmJ1xTOVKoWf26Sx4s62capO4Kzm8y2Aos/N+onXnpol1lZvcsyUlCOXukrZu+7xuYIDUhWIuHFvdwKbK3qRwUP0T7mA9rkXVhR+Us5nALPKD7u52sT6eXkBq2gCZa8xuLm8nDk9fc/L7SOUwZwhF0zlUxpC79qU1xWH/OkiH7eBngiwKVEN/HDnqTsNV3IuDe3JaSPh2sYGlpT6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26i7DJghwRP9I2GSKcU+jf+GSCbSidsEmUiVCyyYsVg=;
 b=g/0x5ELe73nEqpJyGE9FcVLY7NnUQ4r8dUDLQ2IH7V75/7Wqy/Ha4Km8sWUHZE9qSv7Px+7wg5RyikC+8GszMvqKTEPz7dlgU1lXXrvsri4OSEMFs6a1xSmkfkfq9wON+/STs4mvgkuXoIJuBS4UgbaV9uwIJ83zaxrnP59KiTo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:54 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:54 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/6] drm/panthor: Simplify getting the GPU model name
Date: Mon, 21 Jul 2025 12:13:40 +0100
Message-ID: <20250721111344.1610250-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0424.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::28) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|DB1PEPF000509FB:EE_|DU4PR08MB11104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a39386a-4cf2-49ad-2555-08ddc847c173
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?WbkNb0yuwhgF7QHF7q1clXgKR/d/AvU4Ugjr8wgZ5vOLWAFZDmPLAoAln0lv?=
 =?us-ascii?Q?vhCcOT8WDNbu2TuP6WvLCGToiD2dBveNdRBWcjRggpuMT75dXBs438J/bHmP?=
 =?us-ascii?Q?77PbwmtjM4uz4eXml7CV1/E4ZFxwO3ClslueJJE33xU74tdDCyd3IjPBof/K?=
 =?us-ascii?Q?45Ob259+Q8/GNCLYWnhB7d0x251ZB7PR59w/IaRb/Dj+dGyTBuQlDoG/koky?=
 =?us-ascii?Q?gDnM0NvmYiwMIRgm0h8LOQU90cTRFIkXhi9xCnPsMQeh9Tx77oy97+YkDuLl?=
 =?us-ascii?Q?R00t0RURq7PNRXz/5PU8FqPM9h2BeY28Gjt5wh6sA7I3e3aiDMYbmJZA0G13?=
 =?us-ascii?Q?DuoWl0HFpuaO2FdFWscM5MCPMAufrhxiR7+bnSDcWo7/Uuv+Oze9tyynLhmE?=
 =?us-ascii?Q?rVugqMG11IxOoKdiMpQmAOELap8xmzyQZagI1l5iOz4driHIf9qfZBEYTR5l?=
 =?us-ascii?Q?+VsqEzGWxJ8PLkyh2/Qqe5XIEhIfkg4AxJsDpaHRRJoq9PUR/dXHUS4e5rri?=
 =?us-ascii?Q?kCdQcWGz43hpVEFRX1NDda1JDqk6ZRl042TurZANmeogCsBQn/i1tB8GAZy2?=
 =?us-ascii?Q?EJ0HWxH6hDWT/bXBOX5N6zA4wo/kC5U+Q2HsYR4CUCv4WpfYkCDWCT6OQkYh?=
 =?us-ascii?Q?QgwCBkPelR6tkUZbCQPaFQkB0qhdPEvseWCo5d4pJt+dSCGEeV/oj5ZWG7im?=
 =?us-ascii?Q?ekt/1ACpX5VAmSWsWhZceAF6RqXkFksOGcPR1YMD0ftItvszjsy3k6aOu8v4?=
 =?us-ascii?Q?5FcFD5s288oT2vVch6t02shV0PZxBFMYgW5+FGIeqABg/85rUO9rv10lNdyw?=
 =?us-ascii?Q?u1XizHOr7SE/linhSmk7og4qaG7pXmGlwSMyME0kfSV9j02ZOI6VZoy7VNzs?=
 =?us-ascii?Q?kHcbg+guPpylHzdntOBGI2esEYJcrposnXZnu95NG6szLUHCLsq4KXsegOn3?=
 =?us-ascii?Q?htgXqcTPQahyGumxIEu8GSHoBb81yg7vu01xyAtIypWJROW7NE/VId4puALg?=
 =?us-ascii?Q?BtGmimSylVGMV6QEUmm9YwpvR0KJ30BFSxoUzpgOWG7kIvIF21xy52nNnD8s?=
 =?us-ascii?Q?XqYVqEhhQm3KBBAvqSm0HNxgrNGqW29lNEoz5O8FTALgAjwYgpNCtCAegHmH?=
 =?us-ascii?Q?STZxSuw+ZlkJxDYp9zzERMaWtpriOe/5i44JNjqX0+5gNv4738HIDRQjEXbm?=
 =?us-ascii?Q?1y2mpchIXVjULnVOUtwPbEv4lP42/B3CA3yNf2rq0Xg2hr646Jun6TuEkC+y?=
 =?us-ascii?Q?wk6rfcHcfI4ohmdjN5ZYt71PFvB5xn9PKygB4RH+fMKdGLiORMG2sahz55p8?=
 =?us-ascii?Q?kb3toRSSYCmhYQEUwh3TPt/f728Kwo1Oo2DuZzDoJ5HJhV4iQYXi2gcNs7K5?=
 =?us-ascii?Q?ic+5/swgHYuSA4ptLomZ/RzJuv9vMkjVZ6RYIewJRgT8ItdEow=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70b38b09-32d2-4ba6-b50f-08ddc847ade4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XZI+loLThUiC7HijUmTNnJYgp1PhVEFKvO94H8DHhxfsdwKvVxkTZOrg3Z8U?=
 =?us-ascii?Q?E7mL6VW0Q9Z5NtuvWl2xv4IwpvhICa7rzrIjpBfvsfDNf5EE5RX7JfPMpFeC?=
 =?us-ascii?Q?5V28OE8pScSAnorO/BN7FPrrWApusXqADSsHZUHLyADy/hS336msc9URQ9q0?=
 =?us-ascii?Q?2jDgpI788Ll3H6u2mioVPRXrkE8QqfcvOwKY1hLCoU8UzR4Tjj72ydFjb2Zp?=
 =?us-ascii?Q?BVBj5TFdByHIEq9rjVY0MMoCxi8kEqhtb2T+Xp4gnq3aebU1k85WyDWQQFOZ?=
 =?us-ascii?Q?wCpYPVPtN7TPoe1nVYbKNmcQDjq0x3YL4eizvGqh5LX59asXIuCoKf0Mu11/?=
 =?us-ascii?Q?9vw7Ac4nvD3LkLLJJXTbjXwRNDwegqblwN8eia3IyoblfY/5iebYzKti/VZo?=
 =?us-ascii?Q?XS6J9/byY7Y74I0sA/uScJCI9kybOfohMhThXBCnn8umW+0K/dqcaJ7jDgVr?=
 =?us-ascii?Q?98Ug2uZ6bk/HMWN9hj/j2V7z3X1HpuSEPpw6uvm3vQYkywF0FLzBxv0gMLbK?=
 =?us-ascii?Q?xKtipyD1gaWmq6DQRXJEyeLyinE6GQmV9kgYQ5KSgbQA1KOqnDkTKxrO9dob?=
 =?us-ascii?Q?mkPY7nHPbp76Pf/T3nj+JdmvWyHRxj1tJuLiriH87HvlmqUyc2FK4sO2v9v5?=
 =?us-ascii?Q?s0Fm1qy7XCgqKgAKP8KYbiFeyskwk204XKhGlH9nEZ8zax24lk9FyLtlv7+N?=
 =?us-ascii?Q?/kgLHl6sYxWkCIvP0dKLi9sAd+9BV8vV0ja6ujENxz7LatPlj1jEyBWeMmg5?=
 =?us-ascii?Q?613NrPs2mi1guUIR9SU57coIqfu81v9Ha7/PHGQJmlyCdLBYrWDvqe3x323X?=
 =?us-ascii?Q?emw3Ms638kEqIjKQt61B0ab4fRt7e/OFNFVlJFTSxQKmjzVOhmivOtIWrZQO?=
 =?us-ascii?Q?tlmCHr6k2MkU/e095ewmwd1Dzt20jL/05qjbW+MJr4tF2MrhjUNRbewixwWq?=
 =?us-ascii?Q?VFKvF01H8/gRo9d9R7NVcAJa9XNIbTVjJQQ255iBpf1S350ulgw4TWzYoA1a?=
 =?us-ascii?Q?jPKKCvH/hC1o1B9JC0ZxafEe/ZDidxdn4K9D1eXquRKi7/fd01jwAd+ul8jp?=
 =?us-ascii?Q?KPuT4EjhrS+TMWxJ30GPmvIqn46KbHFTFRP3E4fFyaNEyJWrAzzY/Re2974b?=
 =?us-ascii?Q?9qXg1o4BI2eXiRZIV/mTWVz/XdM8UOPYojwVgvXdlwQ01cKD1agmgbzEdmNw?=
 =?us-ascii?Q?UIX3WPBur/EWHNmXfGJMi3u8dVUekudna5FO0X9RydPv3MILHu/uuFp7Hwwc?=
 =?us-ascii?Q?EmwofQglxQTo9IbTVjadd1zPyPSrJ58T9ETNimjgA0DwWC2I1K0ulnqZlwD1?=
 =?us-ascii?Q?8ejF+snuLnDTsNLmdRdweNCYst5Qv14FprVkhoBLlaZe1keRDFpq9+ukt9rk?=
 =?us-ascii?Q?hlC8B/SiCtFQIKsgdDdxMFIWaxZWa2g8xBFIkJwVxBeUNXte2w65+nXnSbYz?=
 =?us-ascii?Q?9i8ftoupt2fu7J1rPA3lzD8mPORFGAb5nksa6CZmRgwx7UBkhmg9Du8eO1wz?=
 =?us-ascii?Q?FLyx5wfo1I4rO5abg1bbgEGK3BDBKECk0RLV?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(14060799003)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:26.9274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a39386a-4cf2-49ad-2555-08ddc847c173
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11104
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 3f7175cb0ab4..f39010c0ca86 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,39 +5,22 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
+#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
+	(((arch_major) << 24) | (prod_major))
+
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
 
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
+	return "(Unknown Mali GPU)";
+}
 
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
@@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
-- 
2.49.0

