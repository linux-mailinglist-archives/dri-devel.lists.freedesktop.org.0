Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E554EC850B9
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 13:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4B010E3D2;
	Tue, 25 Nov 2025 12:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="E5T64jzO";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="E5T64jzO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8EC810E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 12:57:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vCZclGIUMug3awm8wIzGbrx9dExRInnun9v+DHAyOJPtzmeAZEhHiO4vJXZjVTK5H4dN9hS7WlzDNVAofCNb6Jx1TO/Vu0F/aVMVbPQuS7yFmWH40pqhnv+nj9gOc48HI7x0+OMzeVDZAazLKBUnuf1uCo6sUaRNV9tRWiISvrVEukjBHiY7jcF8EqN2gFwMi8PMQ+IsJmRtUzPEcLgtOR7SLZp73IyTk6hOXsSdwGKxFVHgXimOgY8iwmPH/SA/WHMGP/g0yt6SU4pB7czkxzdwcBX+e8d7i/3SlsfigLTgQjg5hrZOXQxuuTcrnxjyEpKkZdUBxpMZQkvoL1X7Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpTkGTjR1iA4L6AoE7Ljy8734+Z4IVx3PHkDNwRgWpc=;
 b=UcDbVixg4wYm/gdHoFjI4UVDxi+pJBV3wi70EqSyMV+Ud3w18gmQXm+h+/atWjrZBXe8/9JPQgKE6aEo9MsefuddRJhaFyGCJpTBGiQF/VztYylc898v/0TK/xi+M51KfX3cu/kT/Lu5DlyZ86yrJlSCm8tPqXoMLnwik5In8mB1QfHEULzdYLeuI3bCplhyd5qh8TMadMjiCVUA2vmek7uG6MwoisurcpgFgJR4ysrXwvfqkNKAuHAFXKkray+B7SfP5+FQqn8rBZv2nCEuHGG9Kqxn/lO5t/GoViCYBx2E//YsYPEvY8cn3MpnQgrlrGAJcBQohjLjyru4PLxabg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpTkGTjR1iA4L6AoE7Ljy8734+Z4IVx3PHkDNwRgWpc=;
 b=E5T64jzOvQF+I01FED0aB+WSBKfoMbDx2paw+n9h4wbnoUOjC5UDSgIV5yI2TyflLoNl+MhcQHb3PXLWvuJALbywptUQJb69z/xI0/h9HyJMdw9cJJ9X3HGu6Q45vWRh+uqlA7FcpoOp2lZL9Lh0aYO+GNaiOfP10qfYNT9M8N8=
Received: from DB8PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:10:110::31)
 by AS8PR08MB6311.eurprd08.prod.outlook.com (2603:10a6:20b:290::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:57:04 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:110:cafe::46) by DB8PR04CA0021.outlook.office365.com
 (2603:10a6:10:110::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Tue,
 25 Nov 2025 12:57:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7 via
 Frontend Transport; Tue, 25 Nov 2025 12:57:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWQePck2CE/ZuXXDa9Brv6hCAdS/7G7WyQOyvinfvLCKptN3cWMF/0lOrIAGejdBLH1EVW/C6DZVEFt7osdRq9reQVR2LNQZkTqu4zmVKlr507vYxKjFMOrS39EBqM4rb3F2PwL343QAz6lzDht19Q2TPkV2qoeOhUobPLHOjuSal+8s7xxtXrU1uh3klLFAhoNaTGtCWUsMdmztxBC+64gcjtX8uWQ15YLyZnp+hKXNTxoGwkz6FSbGoN6PlsW7rNWx1NcZ+sCV13VV3tuR+StPl54WOkxT8XJ7UqZs8fWCaFSXHpWOAjc8RLP/cogo+yWor6r51znW1PM7gAvpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dpTkGTjR1iA4L6AoE7Ljy8734+Z4IVx3PHkDNwRgWpc=;
 b=zKpj0o9QGezREVUv3+7le3s8ZocL933M145AZCutkcBH0dB4RdJ2Na6MwtkOkNVFN7Nt2ZMq9p2Zjdupofuc6sT8z+ZbDG9+xOSmzc0T/nBh723lLe5CiZfoGMRXgUOfeM8jvq3NRwazJbuP+HX+7iEFNMT4y3CVj7hOmhmVsP2E2b6v5NgCIf5xNMytfTFqiiGQaOK5ZVToS8na92ADYyPlNRHh44dqeZh1svlpUv6JqXxqBhBbF7i4H0IQXGIEXhJMSfxytgqMjZY7UbDSkE/ZeYpzZ5FMZHdtr2vpPYzGIpaPTq3BSu7EDLSamSUZJ1kdss43FGA6MpjLOh+vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dpTkGTjR1iA4L6AoE7Ljy8734+Z4IVx3PHkDNwRgWpc=;
 b=E5T64jzOvQF+I01FED0aB+WSBKfoMbDx2paw+n9h4wbnoUOjC5UDSgIV5yI2TyflLoNl+MhcQHb3PXLWvuJALbywptUQJb69z/xI0/h9HyJMdw9cJJ9X3HGu6Q45vWRh+uqlA7FcpoOp2lZL9Lh0aYO+GNaiOfP10qfYNT9M8N8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB8937.eurprd08.prod.outlook.com
 (2603:10a6:10:43c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 12:56:32 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 12:56:31 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] drm/panthor: Support GLB_REQ.STATE field for Mali-G1
 GPUs
Date: Tue, 25 Nov 2025 12:55:46 +0000
Message-ID: <20251125125548.3282320-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251125125548.3282320-1-karunika.choo@arm.com>
References: <20251125125548.3282320-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB8937:EE_|DU6PEPF0000A7E1:EE_|AS8PR08MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dac8019-04db-47d9-ec70-08de2c2221e9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?QLqSWqsP1UhllFefWwTAi0JxhRBo7/ALLdHN51UTToEtlQ7C1XENwgFo89Us?=
 =?us-ascii?Q?26iDHDxXU5SPwxO62wsFa3sIIfPf4mOOY3pzhxly4KwNHfFS+U1SeCtNHoMc?=
 =?us-ascii?Q?tjvgkfuI5ITfeQZKAQ0zNWc+ZnRbSQSaLXb3Sfj1oC/E9X/VK7usXouWMCKH?=
 =?us-ascii?Q?hbb5qd3QlliVl4hvJp15l9PPOEhcq5SPYxRWXHzSI+VAJZZpLuHPiUWTjEGF?=
 =?us-ascii?Q?eCBgCJJ6NczY5H1UxT/mxcnjA9wxzgKcWiTq9phqRQP6l2bvXq/tKAy2Wcur?=
 =?us-ascii?Q?xcNvJ1fs55Kq69oeo+fCYAiOewaK+7bL5pKQBIms3Fbc6WeAcp5B5ptgwqJZ?=
 =?us-ascii?Q?BuWQRmPk6HzY+VAa0+fjKEBC189nWJYz4HiUecA90Bg7ytbYFQRmu0DibEZx?=
 =?us-ascii?Q?qk4OEbskhLckC7WKNnGRO9z3qVu4IIBuixTWBF0ma8v/zWT4p0mYdQM1nNyn?=
 =?us-ascii?Q?oTZpLlMpH+UaqjqqgIILMIbM497Ds0nwqVra0apPUfj4z26nHELGiP46iZVs?=
 =?us-ascii?Q?2xqyAhvJz29MzRQGNKDUTzJ5K2Lu5MZvhTFiI4C1b1Nw1exGw548w5t8s4Gi?=
 =?us-ascii?Q?wgrasGvv1LEQ7FKquyMGfWaj4VihN64CLeBvnA9CPft5gqOcvLHZiyGD88Cc?=
 =?us-ascii?Q?Ykh1EXnWxWLotpfaegLFVGYR1kafJWwCUgcNuHYHtyohsIayc/1t8PIcq6jN?=
 =?us-ascii?Q?GpoEeJP5/9dnwFBbMtXOIftMdfsC/cDy+Cdt3AgH/d7e0vj4wCYqa5ldiZPj?=
 =?us-ascii?Q?0+dk88MEKqvI9ATRgSdSEwNqsE20qqLP3XkyL5ODim/0sJUL3SoSPOXKFYuT?=
 =?us-ascii?Q?cTeHb2b/A6wxGEMK8nbwM2qrD7lJtdDulao5Ntx/g2n1Iq3AhngBIkgCi0rB?=
 =?us-ascii?Q?/A3udqcnLZ/aOYbtTd2shQVX7RCHoPYakOSDiCx/mDqKWdVUVsv0+o1N+Q3M?=
 =?us-ascii?Q?WmTEEEFMu4RBWJYBZMK+7fRgKK74Hsjzcm3INxCFdsUYYyWXjtQcay6MV/l5?=
 =?us-ascii?Q?R38Kz4ldkfeo3bf8LaA14K/PntdJnB51qiW7LVy3QHBicn8NdZWwQuDX/hrN?=
 =?us-ascii?Q?1A42wB3dqXDozQTdp4hef6+B6nJTOjSu6R+ib/ijaJxQhkOnJPOsCz7EygbO?=
 =?us-ascii?Q?9ctb8DSPXHPaVq54G1M8x1yxPkHhOBNngFoQMZqx/9sfPvtuDd6HlIn38/Vx?=
 =?us-ascii?Q?caAkmb9gtXlia2nc7ruAPLkQVi02W/dI6bRyeZ0FtGXBzWLWnrykwhbsRx/i?=
 =?us-ascii?Q?4oPCE1ewABrpC6u+gw/ABKLfZ1V0Nxdlsu4V4FfNAQRLXkqBLjrAgn7+2pm3?=
 =?us-ascii?Q?oXg0XmolcOnr3P0s9wKGKwRaVIhq6zwRRW2eXTzj1WqJfkCggtaNWmgyUx5A?=
 =?us-ascii?Q?rBvsAFdEuo84lwWHYOdNKRnitSEcc3P8LFx4BayTY5AwyLgef5enBDDGbgYx?=
 =?us-ascii?Q?EK2JF5gtJnDIqvRMeAOUJ/snGD1U7yzH?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8937
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 69c13119-51c0-4519-4bcc-08de2c220e7c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SH9AMWA/+MBCRvF+1nxqM6EYdTAi0gAR8iPcnPo0c4fYWUdEfMHQjclk9dC3?=
 =?us-ascii?Q?dUKB6KWyMyOc7TG1QXH4/AOU8ENOT+OHhlTVOjYmZKTghRM6+CtIXJ7NebXY?=
 =?us-ascii?Q?bch++nM7M8oKMeSCY5iazzNX8WhnC3w4ljTcIRJwZaMrwY4xl4IFobhEYoc6?=
 =?us-ascii?Q?gLw+S1n+zyVOCSC5pv9VbcUKhe3GoQWCPfax+flxwQTqnUoNW9iGApL5nNhK?=
 =?us-ascii?Q?YOoGu/T3X2+TYpw84IoUyAqjRUAGUfFSj8Qn35BGyWXdozRfgsFzPL30enBf?=
 =?us-ascii?Q?xOpSdh/YWR5ppxz/KIGaER8JkbeRA6bpMgRB3yCcJjOfnsO5UmXgtgkQTDuS?=
 =?us-ascii?Q?udfsUknWo3fUNAG401TQAkL1jtoociNQTw1RNa4nTthbnxQjQGUjW9leqyU3?=
 =?us-ascii?Q?FDV+GLYVQObYhZdlyitdAIzqFpABDNdCj/ZhHpWCIMnkrNJpKSlzHxmXD7n5?=
 =?us-ascii?Q?E7+UayD5B0FAXcocl87Q+XQbnIHhFELUw9Wuu/KeAOHRGVGfnwdknkNiqzmN?=
 =?us-ascii?Q?PF+fB00jUjWMygEbNkrWYcSWw55N7Gj2VPSeNepQRxbTCSvfCWbgWVoVjNQ+?=
 =?us-ascii?Q?u8lB9rX+chlS9I3iux8bkWSl77IQrVjEkPiDBJ1xHFgSq+4hNX+e88nlSNto?=
 =?us-ascii?Q?Xag1x3wIz3GpurvI6SlGeZUTQ1kRIdMJUAIXeLkzKcqw5B9L1LwOIAQ6LKgL?=
 =?us-ascii?Q?Sf0jWMATngLzqtb1wLgHygGC48pdw9mfPji3oShl9xbb/s7hBm0vdXlkYA8m?=
 =?us-ascii?Q?FxvjJDyn1rVK/XPzCHGmgDKimbqR1yNUuNCzraI4fgk4uM9lp1as1wRRXPXw?=
 =?us-ascii?Q?bpJWMCMfkV8Dc26SbMamLTkMgA76FkWuU01jlgzHbmFZ2WZQlmEApeTgBgVq?=
 =?us-ascii?Q?jx5mqAf9ZnIvSSuKG0QENKxsv/IWGA3sRi8gIelXdZAukW4/gGGplQ/FpO7y?=
 =?us-ascii?Q?xKWW+2diCkUrrQ4GTmCEA4o4V52bLMSkznNgRM8spwE4fLwVw7Jb5BJwKDMv?=
 =?us-ascii?Q?IZat4lyR8q83LcjSpw239IDZeeWtswXsq7TaIvQFFfuO1CNpLXNIA3f4wuVj?=
 =?us-ascii?Q?8g6mxEJGPOfNSeIcKXu8fF8RuLj/8m7McP/R/aIiS2rnDUV1JA0+M9P3cTx+?=
 =?us-ascii?Q?7z8o49ulsiEpnoWTBdScPBrongv6tekq/dSx+aHiN8IPKYFSWRKga3m83spy?=
 =?us-ascii?Q?Xa9+jdC+j32kD2PCvtZOIAcF2RGKJRv1wx3UAdWecClkqUZ8yXLMGobhkh3I?=
 =?us-ascii?Q?1pWGL637ifgHlxcxY1YRFHq/ZAkNS0GciiJ9IGc0fHZsqvAZBiPWsDfRy/ID?=
 =?us-ascii?Q?jDuj3g5IRWbotR9wrnH4Ljk/oNJvIqTuG/TmD7rKPHSxctc94KD2wJG2v2wO?=
 =?us-ascii?Q?PejyEGozTaH6lUUJv+Twh/Z+/IW7G/gQ7HHD0ISCzsJlgLruEsz5lgblhhY/?=
 =?us-ascii?Q?rzUrju/aEkNrSyTnUevS7YGWO7zauNRft1fI198Gjui/d7ezeetGJPGzbQf8?=
 =?us-ascii?Q?9v+C0JfKz5FCIdqbII6aTEUYZ5CrbozZ/4UQlFSaL9Ifr8u+Za1HBGU9Uzmk?=
 =?us-ascii?Q?PTpUO2VNsPKgg+p8BCQ=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 12:57:04.1558 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dac8019-04db-47d9-ec70-08de2c2221e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6311
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

Add support for the GLB_REQ.STATE field introduced in CSF v4.1+, which
replaces the HALT bit to provide finer control over the MCU state. This
change implements basic handling for transitioning the MCU between
ACTIVE and HALT states on Mali-G1 GPUs.

The update introduces new helpers to issue the state change requests,
poll for MCU halt completion, and restore the MCU to an active state
after halting.

Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v4:
 * Picked up R-b from Steve.
v3:
 * Fixed missed CSF_IFACE_VERSION check with pathor_fw_has_glb_state().
v2:
 * Reduced MCU_HALT_TIMEOUT_US to 1 second.
 * Wrap the CSG_IFACE_VERSION checks for v4.1.0 with
   panthor_fw_has_glb_state().
 * Removed use of undefined panthor_fw_csf_version() MACRO.
---
 drivers/gpu/drm/panthor/panthor_fw.c | 89 +++++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_fw.h |  7 +++
 2 files changed, 80 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 027c4529f3f2..6b89821ff1dd 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -34,6 +34,7 @@
 #define PROGRESS_TIMEOUT_SCALE_SHIFT		10
 #define IDLE_HYSTERESIS_US			800
 #define PWROFF_HYSTERESIS_US			10000
+#define MCU_HALT_TIMEOUT_US			(1ULL * USEC_PER_SEC)

 /**
  * struct panthor_fw_binary_hdr - Firmware binary header.
@@ -318,6 +319,13 @@ panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
 }

+static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
@@ -997,6 +1005,9 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;

+	if (panthor_fw_has_glb_state(ptdev))
+		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
+
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
 	panthor_fw_toggle_reqs(glb_iface, req, ack,
 			       GLB_CFG_ALLOC_EN |
@@ -1070,6 +1081,54 @@ static void panthor_fw_stop(struct panthor_device *ptdev)
 		drm_err(&ptdev->base, "Failed to stop MCU");
 }

+static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	bool halted;
+
+	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
+
+	if (panthor_fw_has_glb_state(ptdev))
+		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
+
+	return halted;
+}
+
+static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
+
+	gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
+}
+
+static bool panthor_fw_wait_mcu_halted(struct panthor_device *ptdev)
+{
+	bool halted = false;
+
+	if (read_poll_timeout_atomic(panthor_fw_mcu_halted, halted, halted, 10,
+				     MCU_HALT_TIMEOUT_US, 0, ptdev)) {
+		drm_warn(&ptdev->base, "Timed out waiting for MCU to halt");
+		return false;
+	}
+
+	return true;
+}
+
+static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	if (panthor_fw_has_glb_state(ptdev))
+		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
+	else
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+}
+
 /**
  * panthor_fw_pre_reset() - Call before a reset.
  * @ptdev: Device.
@@ -1086,19 +1145,13 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 	ptdev->reset.fast = false;

 	if (!on_hang) {
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-		u32 status;
-
-		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
-		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
-		if (!gpu_read_poll_timeout(ptdev, MCU_STATUS, status,
-					   status == MCU_STATUS_HALT, 10,
-					   100000)) {
-			ptdev->reset.fast = true;
-		} else {
+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
-		}
+		else
+			ptdev->reset.fast = true;
 	}
+	panthor_fw_stop(ptdev);

 	panthor_job_irq_suspend(&ptdev->fw->irq);
 	panthor_fw_stop(ptdev);
@@ -1127,14 +1180,14 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		 */
 		panthor_reload_fw_sections(ptdev, true);
 	} else {
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
+		/*
+		 * If the FW was previously successfully halted in the pre-reset
+		 * operation, we need to transition it to active again before
+		 * the FW is rebooted.
 		 * This is not needed on a slow reset because FW sections are
 		 * re-initialized.
 		 */
-		struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
-
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+		panthor_fw_mcu_set_active(ptdev);
 	}

 	ret = panthor_fw_start(ptdev);
@@ -1172,6 +1225,10 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);

+		panthor_fw_halt_mcu(ptdev);
+		if (!panthor_fw_wait_mcu_halted(ptdev))
+			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
+
 		panthor_fw_stop(ptdev);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index 6598d96c6d2a..a19ed48b2d0b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -214,6 +214,13 @@ struct panthor_fw_global_input_iface {
 #define GLB_FWCFG_UPDATE			BIT(9)
 #define GLB_IDLE_EN				BIT(10)
 #define GLB_SLEEP				BIT(12)
+#define GLB_STATE_MASK				GENMASK(14, 12)
+#define   GLB_STATE_ACTIVE			0
+#define   GLB_STATE_HALT			1
+#define   GLB_STATE_SLEEP			2
+#define   GLB_STATE_SUSPEND			3
+#define   GLB_STATE(x)				(((x) << 12) & GLB_STATE_MASK)
+#define   GLB_STATE_GET(x)			(((x) & GLB_STATE_MASK) >> 12)
 #define GLB_INACTIVE_COMPUTE			BIT(20)
 #define GLB_INACTIVE_FRAGMENT			BIT(21)
 #define GLB_INACTIVE_TILER			BIT(22)
--
2.49.0

