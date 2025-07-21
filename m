Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFAFB0CCB4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 23:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AB110E5B6;
	Mon, 21 Jul 2025 21:36:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="PVVS8wBk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="PVVS8wBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4225010E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 21:36:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wwbpDcHw5dBuY08Ga4OozCJkuo3DFDekXC+/BsCZnGThwDFYGEgNX2Ss6UrEF9aKWatBQuhe+dX8tr9q3lRIFmBnQWXUBlHsxW/5kNbe5Ap0GBes+OvDz5YWD07lCtlPbFc/CpdoM+1zQm03F5lsoISpPJ5zfpAOjim8DfKXBhNtyC3Tr1SVCgrt439duBowtApExH5n1JYe9UV1qsnFA7PysUdArw9cn7eNiALvOI+88VtEljMvVpdUlLMOnVGk7PJD2Gl706lovNQvTQ33ricFjgW5VYTkrQN3awmdwi4UwVaSX7ktCmFi6xXoW1SdYrV63t04+O45x07BNPj2hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WODzIyG24A4ijDZb1irMRTrrCA3zva6FDQGyaP59GbA=;
 b=auxt/XmLilA0R4WxubgOWChagN8nkMTG8txRvYUfIDbzyCmt9fLqDVkRrMO9Yt80bHQgUBa3AAXWHS3GlU53JXlhevxVpL2N++HY1ft17hHIdYpGZ64dWwrj6F7/fDfg84uR2UBxUQsYb5dbhFx49v8VTvdnLN1AJhDkHve19pPOiMWVlQuEYG7mfKm5d9Fj2MGB5imm1vRBQvq8WBs+SRhE2helqHhjG+cpit0qLTusTjl5WArGz/vBZIY6bPzPqM+l5byUmpu/Mdf7kOGOBz7oojNwnu/8Iu5AgU1rgr6eXMMEUKXuePUzWR9ntU2QexbypqoHzF5PYv7XyBf6tQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WODzIyG24A4ijDZb1irMRTrrCA3zva6FDQGyaP59GbA=;
 b=PVVS8wBkRG6GgiknyfEkBhbd7F6rnoc6h7hiSOIs57XR4P/l85ZmYIxykLw9LRVMX8yqRiN8JJ0HvhA3Fx+4RdvSxZ0TQXZImBbQnY/I2ltNVzDg3ePBNH44qS4F0ApyVjUWrDZ3ZV9DREKpsrNB9xuCQPle0N8AIK+GIKJa9s8=
Received: from CWLP265CA0454.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::8)
 by AS2PR08MB8645.eurprd08.prod.outlook.com (2603:10a6:20b:55c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:36:16 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:400:1b7:cafe::96) by CWLP265CA0454.outlook.office365.com
 (2603:10a6:400:1b7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Mon,
 21 Jul 2025 21:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 21:36:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n40qhhbBeozPv1J7WiXAD2ISnB1wn6BQA7aFb3a7AbFdbdzviYBAJjAY1YNCcA1jBmUhp3O94AvhkUJYMs5KM4NjuLzpmXs7GOeZ4D8RVdjkCQe7QBPycOL+nzOFDx1LCz/A3ipOmrLsxzZIf5oIS2sGFnzINiLziQw2Ebbkedecr91fCwvHm0Lg5jUrXqSFbiPtldXLuD3zDEIW8BPxzB2P95wikAl+BXWeiXiYJB8OMZRuttSZjvpuPHmir+/dF7fXWwK8/VlKp9VRMLrtSj2GEp9/tt0ypO0i1e52GZCedoNQ6l+NBTXPrwcjDfu0CaU6IQ5MFWeIJ+AWPA0jXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WODzIyG24A4ijDZb1irMRTrrCA3zva6FDQGyaP59GbA=;
 b=JJ98XRlDxNC43cFC0JiIgcgw4Nnhq5NrBLPvDY2Ixy+I8U9+eCf//TG6Ff/Y5x9oAecRrnjjtR1U68/+3Y62Vyjf8efROBv/9yggw4Q4ojLn4be6PzEmSflGc0RC5KodUyTTzcjay6NGi5FHoBsLv5jovCmSs7QYeW7WRidP1+0QFjBEq01nUNMkTpJuK6NrQ6H+sOYRyRQ+jxJj7U+Qhx2wOsVnIiqoOiih6FVfK0oJVZkhwn8rriwNYJONaWsR4dpyuei1CW6gzWlJEujCKarKt3MmBImZQbTiCDRHG0akpOgVEAXmenyyI2qlI4VSonGQ3yjx4kbNLfN4xgfoEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WODzIyG24A4ijDZb1irMRTrrCA3zva6FDQGyaP59GbA=;
 b=PVVS8wBkRG6GgiknyfEkBhbd7F6rnoc6h7hiSOIs57XR4P/l85ZmYIxykLw9LRVMX8yqRiN8JJ0HvhA3Fx+4RdvSxZ0TQXZImBbQnY/I2ltNVzDg3ePBNH44qS4F0ApyVjUWrDZ3ZV9DREKpsrNB9xuCQPle0N8AIK+GIKJa9s8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PR3PR08MB5611.eurprd08.prod.outlook.com
 (2603:10a6:102:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 21:35:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 21:35:41 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] drm/panthor: Add support for Mali-Gx20 and Mali-Gx25
 GPUs
Date: Mon, 21 Jul 2025 22:35:28 +0100
Message-ID: <20250721213528.2885035-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721213528.2885035-1-karunika.choo@arm.com>
References: <20250721213528.2885035-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0421.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::25) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PR3PR08MB5611:EE_|AM4PEPF00027A65:EE_|AS2PR08MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: df631e44-56c5-4a56-4800-08ddc89e9e86
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?V8UHJyO+L66EezcW1PQxCI7205Es0Ukx5sKI/ynuZyL19bhh2Qo2ZmMlIbrU?=
 =?us-ascii?Q?wiFDHW4PRI942ScjWp0YJLuJzeVeeAg1DZ/esTurShwvHmZJ3UbgtkBzV7a8?=
 =?us-ascii?Q?hRiBttD3M8bEUXoNzs1frAlNeCy4LguRjaKhYBulxT9RMAjIDFuH0gwG9a4q?=
 =?us-ascii?Q?HfOT+aaowebIaoZeFLulilt2YHJrqO2p3vL84utqYhBI2UZtRy/cWx7ayJ4o?=
 =?us-ascii?Q?VTC5QXS2lKLsVbKLMV1EKlBkCKIldJ/ntP1QEK7Vj92xTq3lIKOqkfLF+30N?=
 =?us-ascii?Q?+u2imyhoJxpmFKN+CmzKTG8dwEXA5BKSOyjSnrrxm0xxS1mHQqHLO8idvSGA?=
 =?us-ascii?Q?BxTcGGWvkKQCTqYOdz3VKCmCYtqsco/I+2rPrfGsfQFoulCknpy6U4flQlUl?=
 =?us-ascii?Q?mkBNXz+BDiq3crYNPRxbbG8Wb+/WcAaVxIspEobUQStlzTt9PJiLMF7WIoOA?=
 =?us-ascii?Q?690DhslCTvRZ6rqRx11/1Z+olZLvwgkQDomwuf0m9gimAdKFFyRaXbF0vLCI?=
 =?us-ascii?Q?9DnJ7+DDcfBJSZ3hiM1H7uAwSIVjieGHga8Pnbw1GgNc3ZtH/QtQJXQTuH/v?=
 =?us-ascii?Q?BqJZv8jkr4qLKoRsm3QRdg6V/Y/kGNHTvMOke8eRM4OUCV08j5EZ43ctuNpU?=
 =?us-ascii?Q?GO7t+J3U1t9DDkIZTX6lw8BoUQ1VKHmJD1yut1TpQGjL4Dyb36MRFS+2PuJz?=
 =?us-ascii?Q?rJdi3Y/QGZUXXTUdM9gPD3/2NiBCsGvrTQQiw+MlSxZA3eL9TCu9oiXhawhP?=
 =?us-ascii?Q?mHUDQckSmBz56nxyuJJasACngKMj9QakXCZ/tOJ/21WD2rpjnpXZekZ+bMJQ?=
 =?us-ascii?Q?9bo67dycJ+D4vF6LacpWt06JiKHBGYWEb+mwivrCpBXp4sbrlSAm0HAX2e+K?=
 =?us-ascii?Q?AEKtZUUyHgepEf2POjtEHzt5/dUMOpD5iK+sibIM9BrdRz3ykNEedAURVLjL?=
 =?us-ascii?Q?tc2duj6yZHH4cvY2OD3GXFsdhZc4atj96I8NjYwJGVol0i1XtwfCt25TY3oq?=
 =?us-ascii?Q?3JWRrLaDkd0QF/hkel44F0FDyrt0uuUxTTNqHTZWXFKLYazZu5iUXjhseUIP?=
 =?us-ascii?Q?e5i88ewE7OKwOK5AgKLlAU6Rq5r49KFQL3l97WBhzm9tY1scNI/TO+AJkjF0?=
 =?us-ascii?Q?ihPGp5R0EwRx8Z2b/kqgFvv0HINPCSDJ4DRlsQpvYvLNtSz+YADVh2fqdp8F?=
 =?us-ascii?Q?Jrt0YADjg6a5c2MV6uW4KBhMSYDCSq3i65QfzWdzmr0WyrrjNQWUozKRq3+n?=
 =?us-ascii?Q?a7ciVa9OSTxbUi17coZwY0ed21DAfDcRcV8FWd1NTOs9aaF2HJoq90JAbCuv?=
 =?us-ascii?Q?bZU1fYK8WkseCq19OamYASnFb+9tUhr2O3PBvMdSzt3kXsavt0afrXr/TRJz?=
 =?us-ascii?Q?HYk3AyJ7wptsp6ZhCVgczmJeKCS8lZQMWUZhGs74SfmCSW7LQYQVIEwqssdU?=
 =?us-ascii?Q?osh1Mqf+CY0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5611
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 749daa76-60fd-4ce9-76ba-08ddc89e8ac9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|82310400026|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gYEYonKBFvFPGct8WPvUrL2Gh7pNkPSETKpGzZGCjEvE2fh1Llo4TMhblQ9k?=
 =?us-ascii?Q?pdEM3MBkMAByDsKg+JK4S/lv4c8W4xj9vDeajOK7csRdL2kVwuaBChyGDAC/?=
 =?us-ascii?Q?0ZvZosFZTZT8WtlrUDp0Y5INb6jFWMliw1F4d9sXqZxpXhNuZx27RcMRB/cx?=
 =?us-ascii?Q?HyMHbAXZvmAElGRglJv/9tYMSgTGXsu+kbarCam4u6QA8g6HS8i5n0v7k3u7?=
 =?us-ascii?Q?RNEMOyQXbJm/IZvn1myznj0gqc0O21rTID7RBG7AMFvC9XTZWC7oCl1oAPfc?=
 =?us-ascii?Q?GS3aVuyxSS7tFij/bSeCevINiREUZDaU73I+TU79JiufeFDKDw6RGgUNJAB1?=
 =?us-ascii?Q?/8l1rtitzYT8Q6RDcE3lwwkUO3Nd6XiqIVQx/UFuEVVkKKOwBcwa4owlgBkb?=
 =?us-ascii?Q?6rfKPltCpXXmd9oaq+v+xL6Uea6TbWT5Gu1NXoBBTYUauP0DFVH/BxTiIsVN?=
 =?us-ascii?Q?N2Uevm7tDOrLg251Ab/A/aMVW2iPLoalXm6KDT3NX3TWW9wQfMJ20SIKiW4K?=
 =?us-ascii?Q?f2Pp2FmOAFQmXIct33cFlDbMNo1dqhIo8AaYnV30zDCHPztTyICkVWBiYjPN?=
 =?us-ascii?Q?Ig9Oq2aFjRel1FT6n33T3lyinKFki80Vd3T+OLV3vGtsHCb82MddbkuVmVgp?=
 =?us-ascii?Q?SIFPvEaLUPRzsYspyGd79mfNuth0f5A1N9oR3LkC8S26N0ywWrn4amVZL+Qm?=
 =?us-ascii?Q?RzgN5+pOu7uJwaDi0yN8It178ue2em2bYOLqKpiW2yDIfua61Nbcf+Yhk3GQ?=
 =?us-ascii?Q?9LUSJjOJa2ZpcBjtcsdXeVG/Gf6ur7FHAwpVbEbmYoB3ckphu0L7BHx1xYIH?=
 =?us-ascii?Q?xoOeNvo/1nLiSXgqihDcm/44uZi3csjtWyU/PvVDZ/HBqu43vdhE5yjbsnpX?=
 =?us-ascii?Q?0acxHijF7/dm0UGwAMtEue6/VoROujV/I4f2nWCEDQM6aTrdKXPEjpi3gDT4?=
 =?us-ascii?Q?+HHtRngL3w/GFX7x67gSxF2QsfdiXNZobbloiEVafSn+1UvDe93Vj7+yHMp9?=
 =?us-ascii?Q?t8PzY4ocMiJpa6U+ayf5YHzO5jXx6sTOhCtfBB5XQ5zemBUBEl2UNl8SXoIO?=
 =?us-ascii?Q?18ifpta6yGDzn47MvyBOYFjPvnQi8RWj8XIgA1w7heVW3BKAgztzlrdz+5fE?=
 =?us-ascii?Q?QBM771ny1d96WivA0ZXv+GyRcx+McdQgHf36bk2xVlL8TWCG/rIwUi//WrLP?=
 =?us-ascii?Q?HHRnUHOyRFyo7wbEyp3MThgdEE1rE/C6fAG3I9UEtxPawfCh9IHk9RAchXVA?=
 =?us-ascii?Q?U073vheD7n+vH9BWoFASiIhfU6PKl5tbfifbtJNEhafIn0YF5AsKGfCjelDt?=
 =?us-ascii?Q?iTuSKyFxKnRVlWZ7de+VHnYn6C63a8TBueddtN12IaknjmGPstGfvDg7phcW?=
 =?us-ascii?Q?8Nlj62UjEkMTXCqAM8/4Wbjmf9iCKC+GI6WD0LOrVPpN1+BOFw7c1crDFYDS?=
 =?us-ascii?Q?MREItEmMQJUUMFt9Z49UOzXkyicyG9rA7Wf/ku7ls2wfYwRBogNkt5oRwxSO?=
 =?us-ascii?Q?gmaVoT+YsKvwTYMmS8xTHAq0fy34FU8Ue05O?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 21:36:14.5483 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df631e44-56c5-4a56-4800-08ddc89e9e86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8645
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

This patch adds firmware binary and GPU model naming support for
Mali-Gx20 and Mali-Gx25 GPUs.

The GPU_COHERENCY_FEATURES macros are slightly reworked as the
assumption that FEATURE = BIT(PROTOCOL) no longer holds with the
introduction of the SHAREABLE_CACHE_SUPPORT, which is BIT(5) on the
GPU_COHERENCY_PROTOCOL register. As such, the feature bits are now
individually defined. Further changes were also made to enable
SHAREABLE_CACHE_SUPPORT if coherency is enabled and the feature is
supported.

This patch also fixes a minor bug that incorrectly writes ACE instead of
ACE_LITE to GPU_COHERENCY_PROTOCOL if coherency is enabled.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  2 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |  2 ++
 drivers/gpu/drm/panthor/panthor_gpu.c    | 14 ++++++++++++--
 drivers/gpu/drm/panthor/panthor_hw.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  5 ++++-
 5 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 81df49880bd8..f547aa4159ec 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -34,7 +34,7 @@ static int panthor_gpu_coherency_init(struct panthor_device *ptdev)
 	 * ACE protocol has never been supported for command stream frontend GPUs.
 	 */
 	if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
-		      GPU_COHERENCY_PROT_BIT(ACE_LITE)))
+	     GPU_COHERENCY_FEATURE_ACE_LITE))
 		return 0;
 
 	drm_err(&ptdev->base, "Coherency not supported by the device");
diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fa6e0b48a0b2..9bf06e55eaee 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1405,3 +1405,5 @@ MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch12.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch13.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 5e2c3173ae27..df2419706fe0 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -45,8 +45,18 @@ struct panthor_gpu {
 
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
-	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+	u32 coherency_protocol = GPU_COHERENCY_NONE;
+
+	if (ptdev->coherent) {
+		coherency_protocol = GPU_COHERENCY_ACE_LITE;
+
+		if ((gpu_read(ptdev, GPU_COHERENCY_FEATURES) &
+		     GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT))
+			coherency_protocol |=
+				GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT;
+	}
+
+	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL, coherency_protocol);
 }
 
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index a7583342d797..3fcb69a6f959 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -35,6 +35,24 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		fallthrough;
 	case GPU_PROD_ID_MAKE(11, 3):
 		return "Mali-G615";
+	case GPU_PROD_ID_MAKE(12, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G720-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G720";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(12, 1):
+		return "Mali-G620";
+	case GPU_PROD_ID_MAKE(13, 0):
+		if (shader_core_count >= 10 && ray_intersection)
+			return "Mali-G925-Immortalis";
+		else if (shader_core_count >= 6)
+			return "Mali-G725";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(13, 1):
+		return "Mali-G625";
 	}
 
 	return "(Unknown Mali GPU)";
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..1beb365c0fec 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -111,12 +111,15 @@
 #define GPU_REVID					0x280
 
 #define GPU_COHERENCY_FEATURES				0x300
-#define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
+#define   GPU_COHERENCY_FEATURE_ACE_LITE		BIT(0)
+#define   GPU_COHERENCY_FEATURE_ACE			BIT(1)
+#define   GPU_COHERENCY_FEATURE_SHAREABLE_CACHE_SUPPORT	BIT(5)
 
 #define GPU_COHERENCY_PROTOCOL				0x304
 #define   GPU_COHERENCY_ACE_LITE			0
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
+#define   GPU_COHERENCY_SHAREABLE_CACHE_SUPPORT		BIT(5)
 
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
-- 
2.49.0

