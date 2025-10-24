Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B424BC08082
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E9910EB36;
	Fri, 24 Oct 2025 20:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="IuJTuQs7";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IuJTuQs7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013030.outbound.protection.outlook.com
 [52.101.83.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EBE10E225
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:08 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DRkhNlkTK0huU6WvraVZ2y8nXX9TmAVCqGr4KeGIESGzY1pRwcZDeBEBaDc60r+CqARjZ6TFe/s2up5t1dzZl5LWcHwsdKB9qnPF3RAm2TQUyJ0clX6r6N+zF1iBjhDj8xeVl1/QFnWGNeJEjEoqxJXgwQBkklAa7erFNR/GE6z3ImfzrI9VxzTUW2JI6OxnBpW7OIvCRM8MhsPj+jZd8WoucrVLQ23su1dVmyM6+VQQJJlRQoQmSuJki2AyXPz/i1f0uogZQ1DN2LtsZg4eqk0qIZNUlZh+qE4w6l7l12BBzhzLmieoSJImRfCu3GkzH8nF1CPKeNPX2pj4ix7BlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrcu/Zz0xLClOrjpqGRDoaqCM0hdsVg+84FKO2BmStA=;
 b=mq2jJ6EQ/Ni/WIZpUt8+XFln6ZIPEuc/G6BDcxBONXCTiQeZYwAPoxVj9cQlb26BU3ABPz5BjfYQPEuUHGA/wGnu7JWeDTKmO2IdFX8gpXBoZZv3qeWMyTwfk7EaBnOlUitWfaVkTYpt+fGJkWsAxwEISNWmkxaMHc1enEqA1EzNqn410e+8lvcmwG/xARc8wmw8AyvwvqgpfzhjEd/JC6JZSj/L6YQiTZ6Ckb2AsnXvI+vsknaBshyZbMuOZGv0Sp3iPlhlrH+2vTyDMmuLEbbJfEuNbQx/Y2nRYUsxidRkj8sFpvszJBx+EfqZ8lS7vfNiFGww2DoFtXp5tMzK1w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrcu/Zz0xLClOrjpqGRDoaqCM0hdsVg+84FKO2BmStA=;
 b=IuJTuQs73OfQPLwqPNwkKlwGqPvwDnO/qGlPN2Pu7LUJ/YWZFjzmirw74r3GoAst9tEPHPUb+7AnVJ2wCZjQRFkETzsgW/iVHv+IeXl6ql3f8meyID7SYwTyz4hq7lJJ7O+Mt/WBxzQufMBMpP998Cu32WJf2REf4cR6ZeR5iy0=
Received: from DB9PR06CA0022.eurprd06.prod.outlook.com (2603:10a6:10:1db::27)
 by DU0PR08MB8278.eurprd08.prod.outlook.com (2603:10a6:10:40e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:03 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::72) by DB9PR06CA0022.outlook.office365.com
 (2603:10a6:10:1db::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:22:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXwuZYvRRyiSKHsu+gAsbdWgmkqHtlk4N5rwAXb7yOAhvzOrEUFSX4/AkWgnLadY0TSB771tv11mkpImcXQTyj7foqwC+imSec7G1VDK+jNfyzf/RY5amX1WS8bhxvrselVowQWcgo4yzucAXQFxmSaEwS5Z7f9gqufcvn1M0qgWZGU7ozplc9KU84B7rZD6RWdSaVwlFRgANTs7h/iSDRPa+sWM34ADpm6tQoK0rzIj6BcWELNY+7fAHRB3bf8ChqveEAvnJMCKrZueBanHlalAGund2g7AviySt7agnNqLBcdiVIhRL0iB1aWNlESVCDHpHV5ho3+pqjwJO6GJ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xrcu/Zz0xLClOrjpqGRDoaqCM0hdsVg+84FKO2BmStA=;
 b=JvS+7F5Wqh4pQxhBQi4hso5FQ4OSNDxbHy6AZ9nX6iqWOzSCO4sAHV0MUZdlPlR6q65KTlTUoNlVY68oVIovsmHNundOVgVFzf1A6GAuxW++RtIlAv9WDLQQkUUcSAlkS8Veyt8E3w6YtKY0HeCGJrBKXrQhXmzfmLuc5EeGe7UU1pLfr0tBFdmjkjQPe/XmtKPvLo5rG0E7Up1ZzHh8DjhoouX1LsI1L+U40W9h/d2IqKv/S3s7WFQmupzdUQk5Ax5TvKudPxTC1ILxunxJulzskVEl4LuBR9SELbk41BzwBJCauf0UkAvTU2KfOEu/JNnxv21D4XXJFs7h/w2gwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xrcu/Zz0xLClOrjpqGRDoaqCM0hdsVg+84FKO2BmStA=;
 b=IuJTuQs73OfQPLwqPNwkKlwGqPvwDnO/qGlPN2Pu7LUJ/YWZFjzmirw74r3GoAst9tEPHPUb+7AnVJ2wCZjQRFkETzsgW/iVHv+IeXl6ql3f8meyID7SYwTyz4hq7lJJ7O+Mt/WBxzQufMBMpP998Cu32WJf2REf4cR6ZeR5iy0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:29 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:29 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] drm/panthor: Introduce panthor_pwr API and power
 control framework
Date: Fri, 24 Oct 2025 21:21:12 +0100
Message-ID: <20251024202117.3241292-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0064.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::28) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|DB1PEPF000509F2:EE_|DU0PR08MB8278:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ae4a140-39d8-451f-8cb1-08de133afd62
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JBcHp+2DtecD07zf17GWZ54kC/iMYIEXzZL7wYM6fRs2lt3JtVGq5ICi/gpl?=
 =?us-ascii?Q?mfCXupJBS2pKnoVBqNFHuYNNGPcxMY934fK+I+ywYeD0PAA/WQqZlVhSVtuU?=
 =?us-ascii?Q?+Xmm353iSyjRgrXSH0NNCqBbuEHJW7HiyZ3SZ8tyhS8GjUyzd+3Poxbn331w?=
 =?us-ascii?Q?jzg8BkvFUI4xkCIg1gvDa4lseCa2ZMlqWp6gABpQLmuPgPbQKZ9IphMdrFDj?=
 =?us-ascii?Q?qAnoMGZpUwau584nVpXblexH7U6R4Rxykb2Yv7YJnzx8PV+/iw8GHJt3zHEo?=
 =?us-ascii?Q?VYWnRahoy2+MPGLjgck5hoxq47tEfgjLcijpJt2PD0edhVSOdLuL9vQrT7Zw?=
 =?us-ascii?Q?AJJnWQMn4F/UCVPDGH/NZseMm4x3gtALrG0WfFdEnAAwXhxyeKd5Am+bpiJH?=
 =?us-ascii?Q?Om3met9UTbWGpFOQvxfb2Tlgpl8zdG4gJUWXXHEsbgKujRTWB1nm2gWwLugM?=
 =?us-ascii?Q?atC7l1k0iNGG/IbjtVWhpm8XuL65XbOVf45YiYvD87gR1Rl5HAfNM/7n7mrf?=
 =?us-ascii?Q?Y4AYhiHHSyWSkVEm7ln5MppfOzZiQoT4hT7zLp+nRCIl68NvtUGJz6AXGww6?=
 =?us-ascii?Q?os3CX18EuANt4m2YZSFAckbctVfN0p/orrrHso+oLcEWuIkAriWq7ZaG/qaF?=
 =?us-ascii?Q?PdvSb5dbxMJNZL1wS9Qa8tb14x/imxePvAtXSNv6d3l4a6vxrChpdBldOp1K?=
 =?us-ascii?Q?lNXTkDYZ3BYKLFLsB6ahfQAtAK+wVDUhJFtg4EywyrtHXNJXJADQzf1QwoQJ?=
 =?us-ascii?Q?Fjbik1/R+5OalMR8CTSzLSy4Z1EX8JXdp/8JE6NXqgZEM3u3jVF6EvEHfc99?=
 =?us-ascii?Q?AB483U2i4o/k8hfKAr+T5nYQkRglwyYokYs97GVPnduJKSYnZIIDwiym5Jk+?=
 =?us-ascii?Q?2KiksJIuML201VOwqOK+2FVE0FLw7kweZpfBfvepuegUWFPimiyucM75xSb0?=
 =?us-ascii?Q?6i3qqOFZyWQ5Z3c0HIef6miuknBK6ruRFV15sh7xJwFYR5hkBTN16ziPm2HH?=
 =?us-ascii?Q?/hMmrTTSABsjnhOsiS4PToodjrZOoG3E3T5DCgYIuWZvOeyTZ8V0sBgB6aoO?=
 =?us-ascii?Q?og4DguflzGuKLdQBQ1iDWleacfuzxt4qSuH4QOgxNZx4oZgv9LEGSDJXsnQp?=
 =?us-ascii?Q?mjFQAX/vy2gpBKtKijwDFBaINYHq5fwE9/udpa6hYwiaV1kl1e/j2TW9XGb3?=
 =?us-ascii?Q?sNlwjl6ijD5bD2dd3byne/zwRAEUykZNXjufrtmp7eMn6VaUnsNd4zSXqD68?=
 =?us-ascii?Q?zElscS5kkLFR23LT7kcNMs+vDcfGJ5M68PgcaO+a5ZnDVz2uvqGfqw43p45r?=
 =?us-ascii?Q?AKsjCVfW3Qu/+agFEACexzNnhIBEZnbRF5Gi/RZr+2P8EDH3eWBdCs5bEatO?=
 =?us-ascii?Q?YGbsNpcBYIz5N9sJNiiyBzq6HIPaW/x1wRKC7OKoBRIGmiKNdCwBdTkugnv9?=
 =?us-ascii?Q?Zmoy56uFjpNhiC0dsfo6fjSrRrL+qs6A?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f4db883c-29e1-470e-03f2-08de133ae9f5
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|376014|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8NxItV94WrdHLM/xmXFMod4ylw44PxPXHzAf2ZOVMDn/1ijByW37y8kTM8yt?=
 =?us-ascii?Q?5XepL3BjORs7jsv1/AFkPVcHl93LJeVZByt+NtJg3U6AhkJGN2eBy+CcZ3wN?=
 =?us-ascii?Q?SUQ9+QibscRgYIjxCbXzQND4rC4Mg3xGXwMc57DbkDmPhkDYMDMsaIfz+d6m?=
 =?us-ascii?Q?4xSsEzrhssuNmYsflaEbrRdX5CKUevMkMYTFK2wlpsyosC0WlGihcrEFVOjC?=
 =?us-ascii?Q?/HlVgLzMIwQ6lmkZUCZ3S5z4XL7F+PzV9UJ5/pHIVB9EraG2nuWLl9tPfNPB?=
 =?us-ascii?Q?KinGYMbbjFgvpc190VVoT5QLcu6Rw0//dkkYJXK/MzByBqE8PTQV4teLyEpP?=
 =?us-ascii?Q?Liu/blljxd9k62tJixJjKem7Vb/DnhtAbg2QdlykOjCCpSjvOXi7ypPR2sS6?=
 =?us-ascii?Q?7ExjBqApGZuipiBnR64PTnIoNLQfippWQK9NkXk5EC+K/eqREKlvLWZ8+K6i?=
 =?us-ascii?Q?6VaAiUZ1Ma0hzK3SpP2tifNYh1f81RD5dctCPkGvqGL1dLt9SJrY7whUxEh6?=
 =?us-ascii?Q?QKRLp+PRDcRghG08PirtiK2UJL8G1d0y5IDxmur4fw2FGpjxU47YQSmCgR0A?=
 =?us-ascii?Q?Ut+xlw5Mp6METOkhmGx5VCxeyVLUYRCAKrMIT4pAdHUvCQcdwSURBP4zAXKP?=
 =?us-ascii?Q?ayo/WsW0bnD8kVA8VxRQRPAHs31yfjpNTofp1e/oTM1q1vmIB/yx58HvCKj+?=
 =?us-ascii?Q?3bGupMyKyTJplS8fC1xxdhF/V6lotH+yX8k07293OTp/jUzgD3ACmdDL5xva?=
 =?us-ascii?Q?4KC4OiZCSF/7Z6KFTdP2q1LNwU3tFCItQKyYTGQc52VsY0wjQNEYLXOd6pMf?=
 =?us-ascii?Q?cFF/zgmXWZqqaxukGZdHlDIMrBuNVzmne/0RRp88mEZ43XEUsOYDtE9ak+nz?=
 =?us-ascii?Q?urneX6kO3ENCrw0WUh788LKuYoq979BZ8fVkeNBTQnSeHkJqrb4WMjN1F73P?=
 =?us-ascii?Q?u9Dihyr1ipsWDvUo3tYomP6C/B2PLWp/yzdao8bKR0ezJoDRUcb64olyeqH2?=
 =?us-ascii?Q?zOHqhMYtgbjPiXdVssIU7Kk4PvOHZ/twS5kf0L/n8qNHdVeTYmXGxE9rMMwd?=
 =?us-ascii?Q?RdFBXDR5pfFTSTT1mCUmHubA31Yi/fVMaJ/ijGPipirk2BygVPBglkSaA8Mh?=
 =?us-ascii?Q?DJ6Yx21kgFlzkUV//zIrC+NTNHH4nJX5/897+UtpmSYbNm/ImuefG/zghxHI?=
 =?us-ascii?Q?Cl7Y2ePEeqU6Gkbsh5xFsm6eEK3p1ecz67Dl55ooRoPvPl7/Swr4Y6KmXDJ1?=
 =?us-ascii?Q?cJ/pEf5QE61JcDI0sDRIoqNB3bnp/38sVUvs04Qib7x5Fe/1+xn0UgOkaA6v?=
 =?us-ascii?Q?85RM4EfX9tX1AljRp8iYXWDTZIZhId/anS6LKJxzLkmXl2JuCgbn9BAjm0Um?=
 =?us-ascii?Q?sp/jfp3q0gzuBzfC9NJkM6hqf4WaLW/fVCSrqM2oD/W/9DZcG1mWefqmjb9w?=
 =?us-ascii?Q?p368gvn4o6OuK9CvMyZ5YZcpGLBarYipd2m3+hl493GdTETMVwrr/mXcsrh0?=
 =?us-ascii?Q?9BsvMxJy/0XK95IHOdOUFwCE21+s/Tt2y7ixuSEQLgoJQtP7rjf7EWwzvpW7?=
 =?us-ascii?Q?lYFS0szWkOUQqrpsy48=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(376014)(1800799024)(35042699022)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:01.2189 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae4a140-39d8-451f-8cb1-08de133afd62
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8278
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

Add the new panthor_pwr module, which provides basic power control
management for Mali-G1 GPUs. The initial implementation includes
infrastructure for initializing the PWR_CONTROL block, requesting and
handling its IRQ, and checking for PWR_CONTROL support based on GPU
architecture.

The patch also integrates panthor_pwr with the device lifecycle (init,
suspend, resume, and unplug) through the new API functions. It also
registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
is located within the GPU_CONTROL block.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Removed stub functions.
 * Updated BIT() definitions for 64-bit fields to use BIT_U64() to
   address kernel test robot warnings for 32-bit systems.
 * Moved GPU_FEATURES_RAY_TRAVERSAL definition to the next patch where
   it is being used.
 * Drop the use of feature bits in favour of a function that performs a
   GPU_ARCH_MAJOR check instead.
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_hw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_hw.h     |   2 +
 drivers/gpu/drm/panthor/panthor_pwr.c    | 120 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  17 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  78 +++++++++++++++
 8 files changed, 240 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 02db21748c12..753a32c446df 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -10,6 +10,7 @@ panthor-y := \
 	panthor_heap.o \
 	panthor_hw.o \
 	panthor_mmu.o \
+	panthor_pwr.o \
 	panthor_sched.o

 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 224a9237a2cc..9d2adcb5431d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -19,6 +19,7 @@
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
 #include "panthor_mmu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"

@@ -101,6 +102,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
 	panthor_gpu_unplug(ptdev);
+	panthor_pwr_unplug(ptdev);

 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
@@ -248,10 +250,14 @@ int panthor_device_init(struct panthor_device *ptdev)
 	if (ret)
 		goto err_rpm_put;

-	ret = panthor_gpu_init(ptdev);
+	ret = panthor_pwr_init(ptdev);
 	if (ret)
 		goto err_rpm_put;

+	ret = panthor_gpu_init(ptdev);
+	if (ret)
+		goto err_unplug_pwr;
+
 	ret = panthor_gpu_coherency_init(ptdev);
 	if (ret)
 		goto err_unplug_gpu;
@@ -292,6 +298,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 err_unplug_gpu:
 	panthor_gpu_unplug(ptdev);

+err_unplug_pwr:
+	panthor_pwr_unplug(ptdev);
+
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 	return ret;
@@ -445,6 +454,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 {
 	int ret;

+	panthor_pwr_resume(ptdev);
 	panthor_gpu_resume(ptdev);
 	panthor_mmu_resume(ptdev);

@@ -454,6 +464,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)

 	panthor_mmu_suspend(ptdev);
 	panthor_gpu_suspend(ptdev);
+	panthor_pwr_suspend(ptdev);
 	return ret;
 }

@@ -567,6 +578,7 @@ int panthor_device_suspend(struct device *dev)
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
 		panthor_gpu_suspend(ptdev);
+		panthor_pwr_suspend(ptdev);
 		drm_dev_exit(cookie);
 	}

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 2026cc6532ce..3231c8154e60 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -32,6 +32,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;

@@ -127,6 +128,9 @@ struct panthor_device {
 	/** @hw: GPU-specific data. */
 	struct panthor_hw *hw;

+	/** @pwr: Power control management data. */
+	struct panthor_pwr *pwr;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 092962db5ccd..09aef34a6ce7 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -192,3 +192,8 @@ int panthor_hw_init(struct panthor_device *ptdev)

 	return 0;
 }
+
+bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev)
+{
+	return GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id) >= 14;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 2665d6dde2e3..4c71f27d1c0b 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -32,4 +32,6 @@ struct panthor_hw {

 int panthor_hw_init(struct panthor_device *ptdev);

+bool panthor_hw_has_pwr_ctrl(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_HW_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
new file mode 100644
index 000000000000..da64fe006a8b
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/iopoll.h>
+#include <linux/wait.h>
+
+#include <drm/drm_managed.h>
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_pwr.h"
+#include "panthor_regs.h"
+
+#define PWR_INTERRUPTS_MASK \
+	(PWR_IRQ_POWER_CHANGED_SINGLE | \
+	 PWR_IRQ_POWER_CHANGED_ALL | \
+	 PWR_IRQ_DELEGATION_CHANGED | \
+	 PWR_IRQ_RESET_COMPLETED | \
+	 PWR_IRQ_RETRACT_COMPLETED | \
+	 PWR_IRQ_INSPECT_COMPLETED | \
+	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
+	 PWR_IRQ_COMMAND_INVALID)
+
+/**
+ * struct panthor_pwr - PWR_CONTROL block management data.
+ */
+struct panthor_pwr {
+	/** @irq: PWR irq. */
+	struct panthor_irq irq;
+
+	/** @reqs_lock: Lock protecting access to pending_reqs. */
+	spinlock_t reqs_lock;
+
+	/** @pending_reqs: Pending PWR requests. */
+	u32 pending_reqs;
+
+	/** @reqs_acked: PWR request wait queue. */
+	wait_queue_head_t reqs_acked;
+};
+
+static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
+{
+	spin_lock(&ptdev->pwr->reqs_lock);
+	gpu_write(ptdev, PWR_INT_CLEAR, status);
+
+	if (unlikely(status & PWR_IRQ_COMMAND_NOT_ALLOWED))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_NOT_ALLOWED");
+
+	if (unlikely(status & PWR_IRQ_COMMAND_INVALID))
+		drm_err(&ptdev->base, "PWR_IRQ: COMMAND_INVALID");
+
+	if (status & ptdev->pwr->pending_reqs) {
+		ptdev->pwr->pending_reqs &= ~status;
+		wake_up_all(&ptdev->pwr->reqs_acked);
+	}
+	spin_unlock(&ptdev->pwr->reqs_lock);
+}
+PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);
+
+void panthor_pwr_unplug(struct panthor_device *ptdev)
+{
+	unsigned long flags;
+
+	if (!ptdev->pwr)
+		return;
+
+	/* Make sure the IRQ handler is not running after that point. */
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+
+	/* Wake-up all waiters. */
+	spin_lock_irqsave(&ptdev->pwr->reqs_lock, flags);
+	ptdev->pwr->pending_reqs = 0;
+	wake_up_all(&ptdev->pwr->reqs_acked);
+	spin_unlock_irqrestore(&ptdev->pwr->reqs_lock, flags);
+}
+
+int panthor_pwr_init(struct panthor_device *ptdev)
+{
+	struct panthor_pwr *pwr;
+	int err, irq;
+
+	if (!panthor_hw_has_pwr_ctrl(ptdev))
+		return 0;
+
+	pwr = drmm_kzalloc(&ptdev->base, sizeof(*pwr), GFP_KERNEL);
+	if (!pwr)
+		return -ENOMEM;
+
+	spin_lock_init(&pwr->reqs_lock);
+	init_waitqueue_head(&pwr->reqs_acked);
+	ptdev->pwr = pwr;
+
+	irq = platform_get_irq_byname(to_platform_device(ptdev->base.dev), "gpu");
+	if (irq < 0)
+		return irq;
+
+	err = panthor_request_pwr_irq(ptdev, &pwr->irq, irq, PWR_INTERRUPTS_MASK);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void panthor_pwr_suspend(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_suspend(&ptdev->pwr->irq);
+}
+
+void panthor_pwr_resume(struct panthor_device *ptdev)
+{
+	if (!ptdev->pwr)
+		return;
+
+	panthor_pwr_irq_resume(&ptdev->pwr->irq, PWR_INTERRUPTS_MASK);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
new file mode 100644
index 000000000000..b325e5b7eba3
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_PWR_H__
+#define __PANTHOR_PWR_H__
+
+struct panthor_device;
+
+void panthor_pwr_unplug(struct panthor_device *ptdev);
+
+int panthor_pwr_init(struct panthor_device *ptdev);
+
+void panthor_pwr_suspend(struct panthor_device *ptdev);
+
+void panthor_pwr_resume(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PWR_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..5469eec02178 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -205,4 +205,82 @@
 #define CSF_DOORBELL(i)					(0x80000 + ((i) * 0x10000))
 #define CSF_GLB_DOORBELL_ID				0

+/* PWR Control registers */
+
+#define PWR_CONTROL_BASE				0x800
+#define PWR_CTRL_REG(x)					(PWR_CONTROL_BASE + (x))
+
+#define PWR_INT_RAWSTAT					PWR_CTRL_REG(0x0)
+#define PWR_INT_CLEAR					PWR_CTRL_REG(0x4)
+#define PWR_INT_MASK					PWR_CTRL_REG(0x8)
+#define PWR_INT_STAT					PWR_CTRL_REG(0xc)
+#define   PWR_IRQ_POWER_CHANGED_SINGLE			BIT(0)
+#define   PWR_IRQ_POWER_CHANGED_ALL			BIT(1)
+#define   PWR_IRQ_DELEGATION_CHANGED			BIT(2)
+#define   PWR_IRQ_RESET_COMPLETED			BIT(3)
+#define   PWR_IRQ_RETRACT_COMPLETED			BIT(4)
+#define   PWR_IRQ_INSPECT_COMPLETED			BIT(5)
+#define   PWR_IRQ_COMMAND_NOT_ALLOWED			BIT(30)
+#define   PWR_IRQ_COMMAND_INVALID			BIT(31)
+
+#define PWR_STATUS					PWR_CTRL_REG(0x20)
+#define   PWR_STATUS_ALLOW_L2				BIT_U64(0)
+#define   PWR_STATUS_ALLOW_TILER			BIT_U64(1)
+#define   PWR_STATUS_ALLOW_SHADER			BIT_U64(8)
+#define   PWR_STATUS_ALLOW_BASE				BIT_U64(14)
+#define   PWR_STATUS_ALLOW_STACK			BIT_U64(15)
+#define   PWR_STATUS_DOMAIN_ALLOWED(x)			BIT_U64(x)
+#define   PWR_STATUS_DELEGATED_L2			BIT_U64(16)
+#define   PWR_STATUS_DELEGATED_TILER			BIT_U64(17)
+#define   PWR_STATUS_DELEGATED_SHADER			BIT_U64(24)
+#define   PWR_STATUS_DELEGATED_BASE			BIT_U64(30)
+#define   PWR_STATUS_DELEGATED_STACK			BIT_U64(31)
+#define   PWR_STATUS_DELEGATED_SHIFT			16
+#define   PWR_STATUS_DOMAIN_DELEGATED(x)		BIT_U64((x) + PWR_STATUS_DELEGATED_SHIFT)
+#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT_U64(33)
+#define   PWR_STATUS_ALLOW_FAST_RESET			BIT_U64(34)
+#define   PWR_STATUS_POWER_PENDING			BIT_U64(41)
+#define   PWR_STATUS_RESET_PENDING			BIT_U64(42)
+#define   PWR_STATUS_RETRACT_PENDING			BIT_U64(43)
+#define   PWR_STATUS_INSPECT_PENDING			BIT_U64(44)
+
+#define PWR_COMMAND					PWR_CTRL_REG(0x28)
+#define   PWR_COMMAND_POWER_UP				0x10
+#define   PWR_COMMAND_POWER_DOWN			0x11
+#define   PWR_COMMAND_DELEGATE				0x20
+#define   PWR_COMMAND_RETRACT				0x21
+#define   PWR_COMMAND_RESET_SOFT			0x31
+#define   PWR_COMMAND_RESET_FAST			0x32
+#define   PWR_COMMAND_INSPECT				0xF0
+#define   PWR_COMMAND_DOMAIN_L2				0
+#define   PWR_COMMAND_DOMAIN_TILER			1
+#define   PWR_COMMAND_DOMAIN_SHADER			8
+#define   PWR_COMMAND_DOMAIN_BASE			14
+#define   PWR_COMMAND_DOMAIN_STACK			15
+#define   PWR_COMMAND_SUBDOMAIN_RTU			BIT(0)
+#define   PWR_COMMAND_DEF(cmd, domain, subdomain)	\
+	(((subdomain) << 16) | ((domain) << 8) | (cmd))
+
+#define PWR_CMDARG					PWR_CTRL_REG(0x30)
+
+#define PWR_L2_PRESENT					PWR_CTRL_REG(0x100)
+#define PWR_L2_READY					PWR_CTRL_REG(0x108)
+#define PWR_L2_PWRTRANS					PWR_CTRL_REG(0x110)
+#define PWR_L2_PWRACTIVE				PWR_CTRL_REG(0x118)
+#define PWR_TILER_PRESENT				PWR_CTRL_REG(0x140)
+#define PWR_TILER_READY					PWR_CTRL_REG(0x148)
+#define PWR_TILER_PWRTRANS				PWR_CTRL_REG(0x150)
+#define PWR_TILER_PWRACTIVE				PWR_CTRL_REG(0x158)
+#define PWR_SHADER_PRESENT				PWR_CTRL_REG(0x200)
+#define PWR_SHADER_READY				PWR_CTRL_REG(0x208)
+#define PWR_SHADER_PWRTRANS				PWR_CTRL_REG(0x210)
+#define PWR_SHADER_PWRACTIVE				PWR_CTRL_REG(0x218)
+#define PWR_BASE_PRESENT				PWR_CTRL_REG(0x380)
+#define PWR_BASE_READY					PWR_CTRL_REG(0x388)
+#define PWR_BASE_PWRTRANS				PWR_CTRL_REG(0x390)
+#define PWR_BASE_PWRACTIVE				PWR_CTRL_REG(0x398)
+#define PWR_STACK_PRESENT				PWR_CTRL_REG(0x3c0)
+#define PWR_STACK_READY					PWR_CTRL_REG(0x3c8)
+#define PWR_STACK_PWRTRANS				PWR_CTRL_REG(0x3d0)
+
 #endif
--
2.49.0

