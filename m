Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ADFBD8841
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5FD10E599;
	Tue, 14 Oct 2025 09:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="N4mTUSr0";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="N4mTUSr0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BCF10E597
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WUWI8SR1RAKNzQGNCTrsmDy7c+3/Fu8NZasNdwrH3BHK23o6ZmkeDGqi63hUQIbGRPaiJzxiRWvGRK88amSaWIYYLP85f8YucIIHok+sJaJC1SDdZch4bLdOdp0JQl+0NE9bLacDRT84ce/8MIYMsFJej9xd8kT9V3zlCQJqEbwwgEDEMRUq8V8Zx8VJoolqDVrYqIlhEH1I93Pe5Rg6Kxc0h303+kOGA9VsJfMQva5bgeS9PHfykcuhWsEf9WwSn751ZndvK+hwGt3NvEprCjX9X484Bs0hNQXw8x81db1dP2vLYSb3rk5aRftcCxpQukvA5jUgGlicHP/My1eLHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHf8jhFO02tY6q02C5E50gvV4LZaJQSBPmcUlhVOKK8=;
 b=FUs85irKZLdOJir+oaeXM8sDcDb0yuuy+pCG0Hi1BMzuqdCZOg007AO+j+5m/dwEW/wcdryTbepuPAYPg/3omFhy1nuBbjGvUw+oD7E8PukiJjM/VNYZpSpa2GvrwyogcvYtkRXUs/KjS1/4rTp1aBIK8tbw5d2NU/WhsW5hZUqUcAbkMJSoYiEBpn7zpJVwU6x0W0qqneiot041UJi9dz8BQTnOHM2DQnTO6aUB3Zc4xyKvis00AOSkPXszBQD7g17cvzZEbmAA+YJxe/+uG26BuKQOdvfFw6O11IhpSywd89aEGhxQqEuQBjBrCLrVrdboJ9I449lH2t7/n8HxcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHf8jhFO02tY6q02C5E50gvV4LZaJQSBPmcUlhVOKK8=;
 b=N4mTUSr0ESf7dQopyi5ozRxmOpEtL5Qygu+UOJ+lZh76aOGYF6JcO2YY4X8jcVD3ese0rqAdsl6tobmgbquyv8nZDEAWA499mKLBSJJ2UR74cIIK/rxK+p6vFs0VeoTNKzYhDkg+xXFQyVjd8Qv0VD0pdCcZL4iBBHP77uKDHbw=
Received: from DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) by AS8PR08MB8444.eurprd08.prod.outlook.com
 (2603:10a6:20b:566::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 09:44:50 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:46a:cafe::12) by DUZPR01CA0090.outlook.office365.com
 (2603:10a6:10:46a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 09:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Tue, 14 Oct 2025 09:44:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fj5dFvUutkLBSXrTLokS8eB/AukbTxqelMCCuYjqGDSv2LhDGhzP3DykYDwtMVQnHLqsJd3m8QyS1Ldpa4QeCRmTb4RxP5b8kr3TR/2M1E0koxk6xhpLFFLlZ8SwEUZPS5AWvQYrsFqTy1AcOnj3sUWtHoLVbSoYJPkBXzFaFKqHdymBSdsTgT8cWMg2tXO940z74E6ehGraiA54z6MlBQ2u9BajCkEYCSKHfYfGU38H/uV7Z+9nn/c7aBoLudXHxpiJh68mcfo2jEnWyM/mYelNmfxWTQOAgjtcUi1SiGYmmywi4pI0+ldGfKBcBj7vZIGNE2ZgTzdcSqsUn6eAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHf8jhFO02tY6q02C5E50gvV4LZaJQSBPmcUlhVOKK8=;
 b=ews67tHddQh22+rdEsce6Y4FS3ARwrKa4cjRzHHGK+GGrbVnluTH9tXtK11kAZ4jEiWkTVQwbkrB0UYIW8EmtfV1CiCOCV1Hb49xE3WKakftrdhfoGE0RojcHrfhveVpI4zNNEvweI7PPyX+lRfwuGIq4pyaPtuGVfMyjM0n2eV6ixRvNTR9LKaSSwbnCb1ukptVHUu0GwBuJ1bEUYOthCHebka1HB2AmmaUNVnNFr5e0suTwRfPnysX/0Wc8xtnzZ28efmkFKyLyeB5ge837LxvJyZ2Ai/kBQAW+rt/l0p0hr5iKz+7WMLpS/a26PAN0E8P5drz2GiKrWKx4/pdJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHf8jhFO02tY6q02C5E50gvV4LZaJQSBPmcUlhVOKK8=;
 b=N4mTUSr0ESf7dQopyi5ozRxmOpEtL5Qygu+UOJ+lZh76aOGYF6JcO2YY4X8jcVD3ese0rqAdsl6tobmgbquyv8nZDEAWA499mKLBSJJ2UR74cIIK/rxK+p6vFs0VeoTNKzYhDkg+xXFQyVjd8Qv0VD0pdCcZL4iBBHP77uKDHbw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU2PR08MB10039.eurprd08.prod.outlook.com
 (2603:10a6:10:49d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 09:44:10 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:10 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 05/10] drm/panthor: Introduce panthor_pwr API and power
 control framework
Date: Tue, 14 Oct 2025 10:43:32 +0100
Message-ID: <20251014094337.1009601-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0281.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:373::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU2PR08MB10039:EE_|DU6PEPF00009525:EE_|AS8PR08MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 42962946-4fed-4f6c-2f08-08de0b065040
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?47ncGPyQz5VRYce+EO8lDpgFnWTzhRO++373PArEfvWNBllZPPBePjrODuNj?=
 =?us-ascii?Q?Z+u4bxpIGo/M6cD1z2bNNb8WbEY3lB1N7NEI5kPSclPSq1MvCaXGQZKQ3zaP?=
 =?us-ascii?Q?lYw/Vj8bqz2H4OIYp14uNUYV0m3QiqilV+ErF5TSoqDiLgtZa4YFGQkz+F6h?=
 =?us-ascii?Q?8rFiK8IlgjkMHIH1nfzM3OZfOGK/5c3NclNFGTl6YIl/R2UHQFpyLBaUb4m1?=
 =?us-ascii?Q?WB3s7kJsIj0zVnqGJaxuRTXktrIKseBETiXlizaSTbIjlRrpz2Ej3Tpyju7n?=
 =?us-ascii?Q?ZmbVuLvMLu/dFsBFzJ0LsNW3z7grDQHz1X6bfkXsXqJ0jB45GR/J8UeJi/Uj?=
 =?us-ascii?Q?iIpqfAJOjf1K7FCi5cfhEZcDXWkWGsADMF7OHJ5iOlIYlE9JmJUZdQem2qJB?=
 =?us-ascii?Q?Eik7a7d5F0nABmhVcACe6eTIOI9bUDEux8c3pDVwejtqawsgyn4rCG8YlYOW?=
 =?us-ascii?Q?3tg5IqqIjNZlxEZZsLXz9G/cXPnY+gbg3QgAjwdHolCGsw55hUXujKZpx8iY?=
 =?us-ascii?Q?2Oydt/v9+BBWL5Ook3XoUcBrrwfTlmrc2EngSnYvITN1RQ2ehHGL0zOQUXyX?=
 =?us-ascii?Q?c+lxOnI/NeCaYIHQd6rI1s0H1w7yoRHi3Ig1N+W/ilC/13uHS910/u1czsLS?=
 =?us-ascii?Q?4qe6O2vx+RyLyZwxgFG52Eu9mx8ajDyDdqly7UyvxSZEYuoO88P3tbgAohzc?=
 =?us-ascii?Q?66w49YJeNxLgM758YfWjB3//iBNQPLl1BM1WaUdhOq4BgT/dAKDJsFXienqV?=
 =?us-ascii?Q?uFEQg0hHy1/yCBu+WdtY5Onhu9nyZlD2L4umwQNiw9ime9Nj/oWUVSvcsE6h?=
 =?us-ascii?Q?mHhowodHaZesAjq5DYN4gpZObiMCV8/iLI46S8xdgIP88wqstXSQYhp3OUxQ?=
 =?us-ascii?Q?4O9+LGZ3Y9TO0bLUZTLB/OXHLE65pqvRH+qvQqevIfKlTTfIW6bSGdq6fdSr?=
 =?us-ascii?Q?JhQ3NU6SZx0jsfjZ7GNZypxBjO+IYPblvXYbTo3Fd0ytNsrRdbLCXRhMFgtH?=
 =?us-ascii?Q?F3Pk3ib/+RlB6tV9AardCQDo4gE5pt4sEeUVpB7M+sSLZlbTPa6uCS0VpnYc?=
 =?us-ascii?Q?ARRjznGASjsxOtKc7qYJemYuU1unbvuiJRXx0AQiJPMMl3+WG6LJGFimuQ5O?=
 =?us-ascii?Q?/Pxqi+ZbzlSCmhGBw8O35z/tZmHB037AdxajCH+KsuWNQXyHFIuY7oJ/oOJr?=
 =?us-ascii?Q?+4nSA8g5pm1FhXR5xuU0VuPxxFh3SDJ50vUAubBDpHbSA2AhxQC0Ikq1/axc?=
 =?us-ascii?Q?xD52LEzb9TsuPsBcUxmAug5aB6ROQzq/aAmbKde3EgPwtOpuFbVJ4vTVX14N?=
 =?us-ascii?Q?3q6gZoesiWpa72J5Mp89JX+zNrSy9JM31ScX0aFZfw3XfuN+4gNalHa9ursE?=
 =?us-ascii?Q?1vDRaAtN3LS3/zHAkr0S54OlPZsE5O3lifr3JxvfFZuSh7BkeEjyrFnOHwHq?=
 =?us-ascii?Q?AGmnbBnroVy6wm1/AGE+qqLeSXjqpSs2?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10039
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e6b806c8-b5bd-4832-750f-08de0b0639cc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8CZKVVkFtMqoEheTg+Bwjjidu93fSAG3Fqc02qWGLuGGCbN0GkJv0WiaczbU?=
 =?us-ascii?Q?qxJkCMSfbWhtGB+qmD2rrTD/kOgMBMZSJXL2bqpGApQlYpwwJl6pVlmtu1oR?=
 =?us-ascii?Q?doxdTC0Y/OeWSK7ZBGWKhND2FQC/Sx4jeOPJteKotyuMoFTumtSMBR8jvpvu?=
 =?us-ascii?Q?VO3j1ZHeLj63qpNEbCNDsI9JNOqVtZcqyxuC+wCoxomQxRlUKv2Ahc06KoYj?=
 =?us-ascii?Q?EzwuO8S0QDpxWhJD1ld8q+2X7YnDB4qCs08vUWxTfnmtFKYJIPJC1cXPSMpg?=
 =?us-ascii?Q?PWm8G3J9AVJ4d7syq/D8+gvV/dzyDZJQCJfASL7mlnQyPtSuerhCgH2kVICL?=
 =?us-ascii?Q?72a/Fk0QWTvMrOWQqQMIiSFcWPqaiC2qCQ5UTy9F7ri92hu/KwW1KVJO3V78?=
 =?us-ascii?Q?gRptMAJlV8+QWawP1H2sXKP6PxWafeBM9tklzPJHa/9kalH9AxuyX4Vi/QdH?=
 =?us-ascii?Q?FlCjZiS5Q+nptBKuKrpPmLJD1AavoNlHC16nNBR3taj5g408YGflJ+OyqgzO?=
 =?us-ascii?Q?cG2nbRArIEn665JCYhkqgZaDFbPk4IdoAu2BSqv5mNkPegoE17IiEVOkVEsy?=
 =?us-ascii?Q?hiH+Ercn2JzELXdBjyjKgg1ZO/Or82TZUk5s65du9ig+ZBQcwZNMQ09aAME0?=
 =?us-ascii?Q?KSrjh1o/AqDdI2a/cSV2iHyCq8nJmp0pYnYx4gWqZ/9RJe3sb71hByGBr2FL?=
 =?us-ascii?Q?snpr0B559BgYbWvEe92anauVqCzw1JTL/C6lQKGG8IOPuJdRRNzUdi+XX0f8?=
 =?us-ascii?Q?ayR6C63sBoTXyX0dCbHSlHU4atEYWPF6G9uVqsuKvM/EB2/5yKybx6vtIKUB?=
 =?us-ascii?Q?4y3xOOM6oGntgIQSp11VTdvaPsu5OXzn84C79XB9wf2cR6N9UH22uxyZ3TC5?=
 =?us-ascii?Q?PPi5LtYPPhnPlMjV8l86YqLtuNSxE0To0kGYiczqxgc63Znbth9dYyJohZ9w?=
 =?us-ascii?Q?391PuR6yaLo5oshxdzogr56HnLu7TStkpNJAJ70R95oHgV1wlhJuENafk2nE?=
 =?us-ascii?Q?SUrBUqZHMyI96JDTopm6vvHOMSc4Yo7JjMkG+MiL+oakfbiXXxFdddgqlOjQ?=
 =?us-ascii?Q?J3NdLu5cqbeiZxZL9HBO4ZqgcMrSG1huMqzqIy9yw4N2+3ZOWhv4pfw2+f4b?=
 =?us-ascii?Q?AqBy5TUqZUXYsn53i6qrrPgUbr+YT2P+CJjCYaqJv00rWHVJlmwpy7z1QZWc?=
 =?us-ascii?Q?+Ummpd0JchsFrtXJRl/m1Wc5fs5dULW0HYrkXDjkPc0/PrXM3df3wZrRCpKG?=
 =?us-ascii?Q?0fne6U481Cp/+utDmj3CW2uN6Xv+83KgUwiqRsXZu7OKK22cOuxXBCbZZhYG?=
 =?us-ascii?Q?Na7mAqTlPxlMyKRCb6aNx2V2MB6EqnnzzryH/pgAKudUez5FcsKcZJBlthrJ?=
 =?us-ascii?Q?fEWyYqLg84UOJF0x/e/ZCrsBhUJ/yv/toFd1K1Ud/FKXk9DkOoJjhK7nszX9?=
 =?us-ascii?Q?FFM6YoPZwTOlUZFm8pfvtspxynRLYLiTbFizqLrhT1ix6pfq+geQnkrdc56i?=
 =?us-ascii?Q?gprzqXNgSvFHAz8A1B5okaCHi+JK9GlL+XGHPfENAh477eftj9aMAQZHSKw9?=
 =?us-ascii?Q?p9yyqomd7fx8PxBjW0g=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:47.6201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42962946-4fed-4f6c-2f08-08de0b065040
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8444
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
handling its IRQ, and defining the PANTHOR_HW_FEATURE_PWR_CONTROL
feature flag.

The patch also integrates panthor_pwr with the device lifecycle (init,
suspend, resume, and unplug) through the new API functions. It also
registers the IRQ handler under the 'gpu' IRQ as the PWR_CONTROL block
is located within the GPU_CONTROL block.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  14 ++-
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_hw.h     |   3 +
 drivers/gpu/drm/panthor/panthor_pwr.c    | 135 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  23 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 +++++++++++++
 7 files changed, 258 insertions(+), 1 deletion(-)
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
index 847dea458682..d3e16da0b24e 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -20,6 +20,7 @@
 #include "panthor_gpu.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
+#include "panthor_pwr.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
 
@@ -102,6 +103,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
 	panthor_fw_unplug(ptdev);
 	panthor_mmu_unplug(ptdev);
 	panthor_gpu_unplug(ptdev);
+	panthor_pwr_unplug(ptdev);
 
 	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
@@ -249,10 +251,14 @@ int panthor_device_init(struct panthor_device *ptdev)
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
@@ -293,6 +299,9 @@ int panthor_device_init(struct panthor_device *ptdev)
 err_unplug_gpu:
 	panthor_gpu_unplug(ptdev);
 
+err_unplug_pwr:
+	panthor_pwr_unplug(ptdev);
+
 err_rpm_put:
 	pm_runtime_put_sync_suspend(ptdev->base.dev);
 	return ret;
@@ -446,6 +455,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 {
 	int ret;
 
+	panthor_pwr_resume(ptdev);
 	panthor_gpu_resume(ptdev);
 	panthor_mmu_resume(ptdev);
 
@@ -455,6 +465,7 @@ static int panthor_device_resume_hw_components(struct panthor_device *ptdev)
 
 	panthor_mmu_suspend(ptdev);
 	panthor_gpu_suspend(ptdev);
+	panthor_pwr_suspend(ptdev);
 	return ret;
 }
 
@@ -568,6 +579,7 @@ int panthor_device_suspend(struct device *dev)
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
 		panthor_gpu_suspend(ptdev);
+		panthor_pwr_suspend(ptdev);
 		drm_dev_exit(cookie);
 	}
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 1457c1255f1f..05818318e0ba 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -31,6 +31,7 @@ struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
 struct panthor_perfcnt;
+struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;
 
@@ -126,6 +127,9 @@ struct panthor_device {
 	/** @hw: GPU-specific data. */
 	struct panthor_hw *hw;
 
+	/** @pwr: Power control management data. */
+	struct panthor_pwr *pwr;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 5a4e4aad9099..caba522cd680 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -15,6 +15,9 @@ struct panthor_device;
  * New feature flags will be added with support for newer GPU architectures.
  */
 enum panthor_hw_feature {
+	/** @PANTHOR_HW_FEATURE_PWR_CONTROL: HW supports the PWR_CONTROL interface. */
+	PANTHOR_HW_FEATURE_PWR_CONTROL,
+
 	/** @PANTHOR_HW_FEATURES_END: Must be last. */
 	PANTHOR_HW_FEATURES_END
 };
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
new file mode 100644
index 000000000000..d07ad5b7953a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -0,0 +1,135 @@
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
+	if (!panthor_hw_has_feature(ptdev, PANTHOR_HW_FEATURE_PWR_CONTROL))
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
+int panthor_pwr_reset_soft(struct panthor_device *ptdev)
+{
+	return 0;
+}
+
+int panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+{
+	return 0;
+}
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
+{
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
index 000000000000..a4042c125448
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -0,0 +1,23 @@
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
+int panthor_pwr_reset_soft(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+
+void panthor_pwr_suspend(struct panthor_device *ptdev);
+
+void panthor_pwr_resume(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_PWR_H__ */
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 8bee76d01bf8..84db97c11e68 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,7 @@
 
 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)
 
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
@@ -205,4 +206,82 @@
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
+#define   PWR_STATUS_ALLOW_L2				BIT(0)
+#define   PWR_STATUS_ALLOW_TILER			BIT(1)
+#define   PWR_STATUS_ALLOW_SHADER			BIT(8)
+#define   PWR_STATUS_ALLOW_BASE				BIT(14)
+#define   PWR_STATUS_ALLOW_STACK			BIT(15)
+#define   PWR_STATUS_DOMAIN_ALLOWED(x)			(1 << (x))
+#define   PWR_STATUS_DELEGATED_L2			BIT(16)
+#define   PWR_STATUS_DELEGATED_TILER			BIT(17)
+#define   PWR_STATUS_DELEGATED_SHADER			BIT(24)
+#define   PWR_STATUS_DELEGATED_BASE			BIT(30)
+#define   PWR_STATUS_DELEGATED_STACK			BIT(31)
+#define   PWR_STATUS_DELEGATED_SHIFT			16
+#define   PWR_STATUS_DOMAIN_DELEGATED(x)		(1 << ((x) + PWR_STATUS_DELEGATED_SHIFT))
+#define   PWR_STATUS_ALLOW_SOFT_RESET			BIT(33)
+#define   PWR_STATUS_ALLOW_FAST_RESET			BIT(34)
+#define   PWR_STATUS_POWER_PENDING			BIT(41)
+#define   PWR_STATUS_RESET_PENDING			BIT(42)
+#define   PWR_STATUS_RETRACT_PENDING			BIT(43)
+#define   PWR_STATUS_INSPECT_PENDING			BIT(44)
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

