Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C72C08083
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF910EB37;
	Fri, 24 Oct 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="GVmWY2HF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GVmWY2HF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011055.outbound.protection.outlook.com [52.101.70.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1088B10EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VrCjXNEnpazBd7ZBpmthhm7I+Pf2Gu2pJd6TSIOgaqwzkCcgYd7BncuhD1hS0obrs/D3eOXKE0cApppXjmlLv2C28gEOfieRey+75lgGStt4BzmZXgrMsaTEc9JtgP6q2vpPVv5r19Xs3neMDe6nbiIANTolXRTdbCb8a/ve6cmgJpo9fvLscRHr2LFp4ULc4rMqlfex1nX4CX5rrvSqdVEB/JWgMFKC8OOL2hheDtSpsu/y4MJpGkeJv+w5YcP4PQTnzJQyfx9CYJdglCtGNHl2+l5TN9jiBBigr+C+WrD1yCYi8iLTAEkCuUYSTJf7v9rWEd270KBwZyy2h+fHEA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5NL/EgfbXs/bIdZ4tz5xHjeebkGV17pN2TlGBMmcgw=;
 b=K2EXGfOKEALKQBlnyeJ/aWIDqnPfIDFL5iwDJO2pU30uOmDpG8xpZrBJBFNQX8GUG9rQmAU3uXb5c5OQsVe+rySCplO3Okx/YOwPeGCOZO4rVkjePO1rPIjereS+6WQhZdtrIlDEbmXJL8dRjTEiBnDIXtbN3PBq8X23juolkB+NEH+nCEHDa9XDjPvuCLkwz0eFmWpQLvxmZ304ISgloqGLY7wnL5P9r428gNQlM0nYwY3dUCPwwQ+6yqXk2j2BGfgjK/DJS1pmB5kpAsLSWiKNIeN9L019W/6fiyZayIcYPDEBlDXgcVNM8pBRkoUqo+B3VoCa1tRRe5ngmyPjdw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5NL/EgfbXs/bIdZ4tz5xHjeebkGV17pN2TlGBMmcgw=;
 b=GVmWY2HFgVjPA+0tSbH+o3u/Mr12DvrlTNI5R5QWnPlvAmIJMUyZKqzfaG3vyfJkMGHIYR/W7dUN+8qhM0Wdyk9itfCQgZ3ogvSlUq3nolX9eTv9mpW0UCtQje1NsOJQY5kRXPrOtIf63j8OC1EaL4KTWoSgJ4axswcj00tSNzE=
Received: from AM9P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::23)
 by PR3PR08MB5691.eurprd08.prod.outlook.com (2603:10a6:102:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 20:22:07 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::b) by AM9P195CA0018.outlook.office365.com
 (2603:10a6:20b:21f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Fri,
 24 Oct 2025 20:22:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0SgYI+86ZcZM1KqHKLB9+a70xmjARkR1XXKdqaelPaR/oIN16fmLL/yIpuoJ/r18AI76jMQFNpdPhWr8J946BVFmZaSPxEuwFi5D3OLDd6qSYb7jYqOb5OQQ29qlXEsDGXAvmUbflnJgttLOxT8AmiycWfqjQgOSNcOxwDDcu8cJY+56uXZmlyJ9aS8/Vh0U/NSE9OjDK1mr1sM2TFga0F2GRiBFtWb3qLVPIEaQGnHiiWth+n2VqKdOrgwvDvB2+ffa4yqB/ETDL+7Wg0T6CXyMmwrV4z1b+tM8I/lJA3yiXxaBn2SS2orM2W/tAbAiiruqALWzQ++g0NqcF4lWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5NL/EgfbXs/bIdZ4tz5xHjeebkGV17pN2TlGBMmcgw=;
 b=Ov62a8HQPmplbJg2PRQQF+OCKslzizdGdxEf4Vg1waWjXa3vvKZAR/Cyi96ldNr++ADw/KpBtesML43Jc3vCDohJnGVgIBuaijZQ32b8egdjdtyyLB8uKDVFRiy7bHyzi2UiYBTDz3fgr1bflEwtlBcsINcKRWFildpTC1D6sFuHBvmPxYJuM/dTVwaK3QgAPrrxqmZVDyVApp0wbc8cqMLry7hDSewTiXLnDDGNnGYGX390HRCZIvExI/AdLjx/2x6qqGO2/gryXGTu6Ib9Ohc2m7W/TQGwktbAgelpcBl42vkuv1WvEiV7ZH4fSi4A2sEevCPPK7otNq4q0fksiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5NL/EgfbXs/bIdZ4tz5xHjeebkGV17pN2TlGBMmcgw=;
 b=GVmWY2HFgVjPA+0tSbH+o3u/Mr12DvrlTNI5R5QWnPlvAmIJMUyZKqzfaG3vyfJkMGHIYR/W7dUN+8qhM0Wdyk9itfCQgZ3ogvSlUq3nolX9eTv9mpW0UCtQje1NsOJQY5kRXPrOtIf63j8OC1EaL4KTWoSgJ4axswcj00tSNzE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:34 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:34 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] drm/panthor: Support 64-bit endpoint_req register for
 Mali-G1
Date: Fri, 24 Oct 2025 21:21:16 +0100
Message-ID: <20251024202117.3241292-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0389.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|AM3PEPF0000A798:EE_|PR3PR08MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 42babff1-91da-46e8-126a-08de133b0098
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?EpQzFQfwQEVryZv3ODLdLwu0Zo7L3//VOyugyZCuhqY9qsq4WBj/bf6Slf5Y?=
 =?us-ascii?Q?YG4uaF6y/miVLFWYWiitVr0R/a4h7cmh0OWsuxOazMXXRfLCFFM+oIZqJ1bv?=
 =?us-ascii?Q?6jtMg0cnRNcbR+ywGj4TB9zwroOSgZmSYZvIm/DTvvNMQJQGH/BTPlCnoiBt?=
 =?us-ascii?Q?+649qyNCeIeMKUMuPFqbpCoyKmGWowtZK9oB7IKH/maOCoDhiQsai8ygt7Na?=
 =?us-ascii?Q?ByGYoK9B2cMMAnWRK4993G9nXqSb8UaTxutUl9VGi/5dcGF4aS9zNi5xcNhv?=
 =?us-ascii?Q?ZcMW2iAh97DarammMGEJqk5Ypep3B9CcNoip6xYx08W1ik0sXAHwoR+OhirJ?=
 =?us-ascii?Q?60skI/gWWhF0k051dH6v8PCyd6+Lt2uTpEFhMBrvhKVi4Wpw28E2yf/Flfby?=
 =?us-ascii?Q?ewTl/d7EyUJtfXLXFUN2j0zdUyTciUricha/KsHRK7YmZcTN1Ze8s6EXdPYi?=
 =?us-ascii?Q?jx/baBRW2OyaY212xpxr1U4DzSvGeEVEmHfguG/wtCRoKeVg+hwI6/JsScwj?=
 =?us-ascii?Q?aQCaxllejhWr7XkPLrW+g7uX5FqHdd+ZRBqr0Fhpx4UPqJvSjFjkrpzLhnkq?=
 =?us-ascii?Q?gi2VTdCgym4d6/AgYyNw3RbvQM1TZqPMI6ckRNDe8IZ+G5TBD3rYbVaWOcNF?=
 =?us-ascii?Q?23fb01f/h/zBzOt8q/uftTDhIT11TdTFi1i9Rwrhk8il2NaZQ/uik1+v+Klg?=
 =?us-ascii?Q?UuUnwy6eOzbhZXquLO1AvMoDvcFTlFPV5XT1cNKzIHTut/YlURL+/3P7yQpx?=
 =?us-ascii?Q?m8+HxhejoT0zq/V9CUW3Uz1bEfvbvQ9VJaUzmCsW0hnaYBdkdXivHfM3nsLj?=
 =?us-ascii?Q?eR0uDzp2PxLJJTJZDjDVaJ7WWiPDjyYoNvNDJTMsaHEB0WWLhw8xjL1GOxWV?=
 =?us-ascii?Q?ZStRTyb3GXYMb4ayfl3ocNO9eWMU61l3F4/23wY7o+333wxno8K8wzBbxjId?=
 =?us-ascii?Q?NbS/1afRiSF6MqNUuVxdGyJYLp8o2aOaFGTcYMdugiTUgKtdh1UF8IPAHsx8?=
 =?us-ascii?Q?Y7JcVV9LqM/a7Nj9+u8thDvbywARJqEyqsm3lsksIPfgEXk1Lp9yxeV1eH0p?=
 =?us-ascii?Q?vSRlr5SmgiDOnB8ovQ72frT6ER8nuXh1ruXmFrUB28aPlX++MPS0hRdRBctv?=
 =?us-ascii?Q?Xfp0aT0DNAVaM7DoV6u/rvUqzeYEZ+M4DjURZWrpIrCY8rHM2H48F5PwLuIX?=
 =?us-ascii?Q?AiFKRBIzvFYrx1K+sBXy6jmZmQqGrnpg4i5ybrh0A2QZC+qp2S2EM+E8zaae?=
 =?us-ascii?Q?R6aUcFrmCy1OPlEmyi73XGyxbuFw+6Fxd5hgNHeAHqowCHU32ocWp708DgJi?=
 =?us-ascii?Q?PrjFEpxGQ6zXqEFIIBiou+tIUVhcN6il/BehztAjxEa9JrkAlue8TBrFEpO7?=
 =?us-ascii?Q?85fMM025rqMmLPBfTQitsVRN49X20Iwq/IRqGkgGFIeF0nsTHnaSAedxQGPj?=
 =?us-ascii?Q?2Ff0KUxSdUDCUFI83dMwoB+oiSMOarEX?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cc4a3649-e31b-4227-71fc-08de133aed47
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|376014|14060799003|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dzFPi0kz61D2c3BSiMrmlNjsoH+LIZ1UNIOrg4+e56UQTi0HpGLCGcisC0hL?=
 =?us-ascii?Q?elPujb32zI6luFe02XD3gyHB9hVOfDjBkYYKyJkrWX3RJ565UG7wSCzrG/XF?=
 =?us-ascii?Q?C1SNQwYBvTkEyOJTAlxGJ4G/aBQgTmdgf8LWH2T87V3oXpa8IQgtR+9P5d2R?=
 =?us-ascii?Q?GnxuLUG1M24bc/8ZxTxOfy6DKtciwh29p6fuPIKU3lxgTvrZ6SEY0HOFaH1K?=
 =?us-ascii?Q?qL1JZAEAO8SUt5o6ZGcH+4FsKwsbGmnrNs7bUf/nPXxLQ7LW8kO1uWBwGTGe?=
 =?us-ascii?Q?3mZOzsvxPqRB/NIRW5M+D5LqGxTcrBbRrv6JpHTOHHjdstEBD5uX23wTBam0?=
 =?us-ascii?Q?/RbxkogziVTyNa/ryOD/LLPJ3VhQo7YJ1Te56ng/eJumzg1WHBsoCdLgqASI?=
 =?us-ascii?Q?MovQ9vIjPS9royC2siJMixpCRPVjs/5v8ub6qQt2QwNvilLnys0u8++BCcww?=
 =?us-ascii?Q?QpYUbrRNYKQbQg6gL3k4FOBGEQRkhv7fz6F/Vy2ySdRl0QVzWRCXFmeG0zu6?=
 =?us-ascii?Q?E+0AOyPCSC2nxJ8ZYkmrhoRiGL7jclTwdRgMv+sYRJ8v93SUmXpbB3EQ6yz8?=
 =?us-ascii?Q?lqhoPMqJtViEMIunUM4TUyTX/OZpWLlMcMaybriNGY4X6U5DD6SF5hBkMUGa?=
 =?us-ascii?Q?GcMxWFTcxF+R5NttevR95XFCQDPhw7qB8TUp1qcIeiG1LOKCpcDbJrSApRaM?=
 =?us-ascii?Q?WkPfNN8M0hfFZdwQEKwaqSuC+NEgbUaJqO8C1XTXrodNBTMBQnHyWTQq7z/8?=
 =?us-ascii?Q?xlkCX5cxHrkS91fN5/oSpjjUGBOMKnDMWYh9HUWKuFF5AJ3TAs54C94xZ41Y?=
 =?us-ascii?Q?O61ePX2XNayi4O0dCMuV71lu6ACKQxXaD23DwtMU7aRIveZ5JHAER+C2jaOS?=
 =?us-ascii?Q?SkLZsUOZ6iedvxPc+HOZcqb5/l4Ej/Rc01NUGgQyDOVfdSmNs5gvc8vRc3G2?=
 =?us-ascii?Q?a989CVnoai9izfHh/OnVGJjXcjbu9aJ0LL6Poi8vSPsiIAgKl3iO8M1caFT7?=
 =?us-ascii?Q?RYD2Pm0DacJvbcScvKZ9E/wgegqDuJX7Jce1P4WKlfzoKNGtoTC9WK6pKfbU?=
 =?us-ascii?Q?dUvVPaM2GDhBLUBaFVZGqt+hQvAx9U4+yEIChEXa4b5LXYigtNBXBQZX4KXN?=
 =?us-ascii?Q?lXR6uJqUI9ddTNqKWD25aUi9StvHy9BFjp+k8P+zOTfNaGfAVgSJXnVgvcLe?=
 =?us-ascii?Q?aqmmkVS2lJm6TotSMci8IIQSqrTg4HtTBdD2YXOLPJJzp6QLZss+c3ycU2cr?=
 =?us-ascii?Q?c2HXTVy/BEZed2wpr3YD0qUx1XKigN3hKLhds5kyqkkCG2rszdhDSaqZexNy?=
 =?us-ascii?Q?Bl97Ax9zX1K3YDJ3W9JiDAvj2yldFdfw4eMYZxNOq1Aa4lZ2Ku52WgllgsLZ?=
 =?us-ascii?Q?2YAVtXrumA3nop8KFdzgIuW7AWdeBdVzBm3JztxHsJ6TQwScGjt2RXSSLXde?=
 =?us-ascii?Q?zb48JzXfnbVUNQIl+g/nwhC3f7MxjZ6bsoYp2AmLAlBFJNfhVbtZNh/LqZHG?=
 =?us-ascii?Q?0J29wVtZEqdfSSumBPGHNG9I3vWVaI8W/AaIds+CznFBDTBAY+tx2nWPpJmI?=
 =?us-ascii?Q?GGVeG6FwGCAjlUn9IIw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(376014)(14060799003)(82310400026)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:06.6103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42babff1-91da-46e8-126a-08de133b0098
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691
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

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
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
index 78f884ccb8b0..9ba10ab1d7c0 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -324,6 +324,42 @@ static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
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

