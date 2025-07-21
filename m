Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C17B0C22B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBBD10E4E4;
	Mon, 21 Jul 2025 11:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="QjY7qvbd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QjY7qvbd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31C5F10E275
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:08:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uie9LbNIzwbZVjFcAqqlPoYvom/z0ghDfR9Uj7zbQX5gPkvNVilKgmvN+oyIeEoAgU2Jyvi8SKgSvC60Z6jysQ/LKGtRWspspMhYpwKHfJGOGFC8/TlSwe5+B8mfgjG3fpF06o2wPfZx6wjjSBF2+IO2iZOSPCFibC/KyD4XK8LIceOrtiZ7UiCDjjdFiQ7/r8zVlJ/o/QGMaqZtATulZQAcR0Spht+nkJa+lye3S+vGK1hQDvsFaEiBM++9K5EmbSkUCFey8sQTy1ZMMrrtI3ZhKt9tr3EEhD2hjgMVVbUsC3NNHLNAiGlbsmPHBiH138muVIhmMBEpCkkZdsli6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=THDZYAKvi0z2qW074gb/bQn9ZMEzfKB5ezEzxVjRw8w0xK3k1o60MlrVUtJNzSWsO+fmJOxG5SBGcLluSphIwvOmWbL5MUpceAzYX+Fv6SUrV2+6b2RYEnPCwxM91HKwnwpK9P7kkwR7VrqUsGIq8YH/WUtrr191quos7nxkEaNoHkImj68MpAgpQV/tf857yB/nOQM3QG0MTIs7J7wLDB3m1sadVDpaQabeG+my9KQXejqkVs3vl9XTifyptZG1+PnMwU5Idl85aknucLZ2BwrCEGXjj4wuYZw4p0+uSenrXM0kKsoRG03SB5YWVLi4ItS5qEgiDmhuk5gRVBopVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=QjY7qvbd9SEVqceBMO8PxuCikjXq2a1/REaQj175Lngy960VpzIy0q/fmcyBVK4ETBm4vMcOT8zIlrBZZNkBeC6uWsTMRpBwALDtLoqf1wbx60pkgIY1Hg3VxNVzmL6Fj6bGZjzuz0QE+D91u5QOBGv2+3JiiFnLzYasofKpTgo=
Received: from DU7P190CA0006.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::18)
 by PR3PR08MB5673.eurprd08.prod.outlook.com (2603:10a6:102:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.28; Mon, 21 Jul
 2025 11:08:14 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::e5) by DU7P190CA0006.outlook.office365.com
 (2603:10a6:10:550::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:08:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrKluygE0HJk8IFSubqPBucv+Hi71cWbCGJJNLCtwsQYoO585iJYb8CDH6Hg1/Yx6iElGusSqWGIsSxx79OCET/fKot5fgswGcBdsM4BWYFHXwhUudpHXOa9JotciKgcHUt4t3KTH1yM9FbHx3XiPak0WjiwEmlyyHvlj9kLnk4gz9N78bjcTdT2CNItHmAKrs/RaVmdjjCavNvvLojcFctU9cMit3ZOzHQhp3Z04mPGfQ10E+LtmXnpqMoVpaODcwiKtTDgElNoBZtKrxIiyJD6jF4fkUHZ/IB7lAHohl4g1bNeYofblr8oM/Hi/JU3c+tLFFReoQhqdButuccEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=KW1gRW5k4/eSFBkmFSPpKxU9FAL60wrc14Q+uQNk1rGhsWHG5MOtwtzkYTiFbAQFWSOx8gmTgKHlFIQ+guEZLgklRK48p0FxZf1THnlF0CSHlHc0boijBJeTKRR0q5wiWpLkL36vAwzHUzqS8yvYW7SlV22sWBbme4FXP5QCdjkkd0oEHo/8AGScEbrw3cQv5/ExwPVPcOwZIDLf+uGjLpRQ3seZ+fVcqpoyD0fBwL5PRGzUGXlNKcEyxo1Tb0IVtpVMj9/176wHP6E+9gbWrENmIxstv/yv+v/Oyarl+O4e5gGUWA2E+4/RE0RiHGmCJpmVDdf0j1tzrS+jXdG1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkFWZIDme/PHdFL0JQcYW8/sdurQckEzJNe+naho+YA=;
 b=QjY7qvbd9SEVqceBMO8PxuCikjXq2a1/REaQj175Lngy960VpzIy0q/fmcyBVK4ETBm4vMcOT8zIlrBZZNkBeC6uWsTMRpBwALDtLoqf1wbx60pkgIY1Hg3VxNVzmL6Fj6bGZjzuz0QE+D91u5QOBGv2+3JiiFnLzYasofKpTgo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU4PR08MB10984.eurprd08.prod.outlook.com
 (2603:10a6:10:573::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:07:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:07:41 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Mon, 21 Jul 2025 12:07:20 +0100
Message-ID: <20250721110725.1595387-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721110725.1595387-1-karunika.choo@arm.com>
References: <20250721110725.1595387-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0597.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU4PR08MB10984:EE_|DU2PEPF00028D0D:EE_|PR3PR08MB5673:EE_
X-MS-Office365-Filtering-Correlation-Id: e99a7e7c-37e4-47cf-9281-08ddc846e33a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?nWcGCEfspL6uZko0NENLJUhydXfpslsB6h7yTrSM2fM3E4UBQFaaCNrUHQ4P?=
 =?us-ascii?Q?+PXYwqAPlX+NfvgW3hK4x/6oFpi7Oru+VRRi2t6eSG8ls0cP9twCjHK/uXfg?=
 =?us-ascii?Q?q8+P1jqM34Rq5v/mRAAPVoxuZV1QdEdNKOKyHEE0Ug0PBWOPRC7Fz6DoaUOu?=
 =?us-ascii?Q?4f6k9A/fhxtUb3hoF5KDIxkhlfmGgTdmQk7bN541CpYohL+EF/zAa5L1Lv9U?=
 =?us-ascii?Q?eooIMebptN0TcvxUtFes5Qa3Er2OAuXUtIEzVZcdMdyeVCloB55V1n8enYvK?=
 =?us-ascii?Q?rh6k0qXXoVOb8Tt+ewTrTeULfOX5TgzDizFLW3DL9glSJLfUb+1TQnQFPNnw?=
 =?us-ascii?Q?ggN2Mm6knPxXJkQg2fuwvAuquSsFIAcKu6jCyUaWMvEg57cZZCXFg0w3s6OO?=
 =?us-ascii?Q?+R4Z2vSvmUPOjvFf13k07SJFVF9XdYqOM1+gbWD0bhSQ/jJIKgaoisnLE1mQ?=
 =?us-ascii?Q?jF6uDLZGqUtn4TfnjMvq7MbTckbr2RGJepIFo/yHMnxAcQYuUIzX/YsD+itd?=
 =?us-ascii?Q?6F5hHtNpnzvcS4xxsE7sr4ooXOmY4I0LH4CgzrKItboc3f1wjblMySN0t1bF?=
 =?us-ascii?Q?o+8qvbuW47u8QeEpIWXeCqIpZoRnlUZDicDRPZknNhUh0y5QDiIH6mPikj+y?=
 =?us-ascii?Q?7pYQ+nZanm7C18B4CmtS51uUY1wi0r7eXaYiinjZTac9xmZhAdHy19kU01Gw?=
 =?us-ascii?Q?IGK0OkYyR0eY3kcfKZkIXoSrGVMH/kaztV3EvhXCiDKg28sAlTOoP8U66urs?=
 =?us-ascii?Q?uXIt+U93ISgnVfA1oLBo2Dm7gVwv1RyFSVAPklhZyvnz9KqIseIFNKClReTF?=
 =?us-ascii?Q?IKYuiSvkv6UB7zVKAgQd7aRsaIU4Wz36gGuNxmLqbLuq6DsbDgNd7b8JSMXV?=
 =?us-ascii?Q?Yk4C5Tv9licHtUfO6SHjq2OKPblMGSppemNne0WIjoMWQgONlS/KQMxx33Rh?=
 =?us-ascii?Q?f5tJ58+HzsaaWannT7YUGeL8AuLQAjRyn1f2lb2rEgl4JIN/4hri9Rvocug7?=
 =?us-ascii?Q?gRUwfTljrfrHBBgISdoMo22JAcuBoljWk4SY61YMsVA80WN7FveeBI+0WA9K?=
 =?us-ascii?Q?VQVno8J0pAE+vo/LUTCmn1QIIl7hpt6PhHMleUPBaEmqaxkbbCakqK7xDumr?=
 =?us-ascii?Q?33UC8N152RIK4le2j0UIYPyMVrCzqc7xg7Z1nxO0Ho8Qkj58siVa+CkdGGdL?=
 =?us-ascii?Q?6Q9wF4Ws93i4a0tuIYXh5mHWa2hUDmj3dlrLwMDfeAyE54jzoUhVlgJM/YNV?=
 =?us-ascii?Q?3uR7b1KyOO4SpNSgZuv5mQZJb3zBwv5vQP/Iq1CZmvOaF5j1r7umaypt5vrq?=
 =?us-ascii?Q?Qn02XnVq3SdZl5ZV23mJcu5LR0emepzAC7A0dkvd1ZZszMVBXuomegH16dQ/?=
 =?us-ascii?Q?ONZWUFqhM/rrZRUfTfj1Kcl9Q97WIrFSuk0/QafgRzlbvAQLMqBumziLglCy?=
 =?us-ascii?Q?szYQXBuStmI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10984
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 37a0133e-e5b1-4e7b-e75e-08ddc846cfcd
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qYKLnR61vMh9JY6ctWV3xlPHKmkHLDWjK8OXHDC85v5a6JbP+yjwQThKJXzV?=
 =?us-ascii?Q?hoaBhN7a2MJVDzS4A7QbI/l8hDGOLCghQ6wIkeogZWL1lkcWj1NS2oyKXKZO?=
 =?us-ascii?Q?NsCi64w3ekSLPGXLT/liO7Cb+UnW/RniUILw2SSwEEKQnOS3JWJcF1DEqsSQ?=
 =?us-ascii?Q?2P+RTXwBBkw5A9yhGk6XIXrTmDhQkNNpsz4P0qI16dBZLva+hi0jxNlFFoPa?=
 =?us-ascii?Q?tp6pK/SI2RECXOuwSQQKbluBv4/UWm2FVNmYDqPof5Ty9heGxFUx1U+TeSiG?=
 =?us-ascii?Q?EwEt7AW43rslWgMD4FA9Z3dwUmrkWyZg1QpuCrVp3+qoXn6Gr5+BR4/kfpvF?=
 =?us-ascii?Q?wBq0yKfQ2QGyxJjUTAFAwKjnfKLJ5GtGsQC8/wPB/0GKHa8M6C2uA63zvYtY?=
 =?us-ascii?Q?V2g0cM3/ewT1qVzVmvfQJOkMKeEvgVa6/jSnvjdbdMW2EqXFe6d5haQqzQyq?=
 =?us-ascii?Q?MShgXqlpTSsNGWoiGXdotvyplc5BTYKLXL646VcmEIlc0qF2YFiiRmAbsNeR?=
 =?us-ascii?Q?A0zsHdGKOpPhqkXvI6gB8djO5hSqEyOTZ0OeU+GPFCGAOsdrlk31yVqeAb8E?=
 =?us-ascii?Q?xLaGZfLZwEiO+ilapga72eMsVCpgHIPUDulp00vjUQea0IokRwxp8vMxIFVg?=
 =?us-ascii?Q?9mypJ/+Oq4R9oEIFQ3gFASSIvz5CIP7ukjvUUSrGIP7PJxCgsa3Pb4Izsw2v?=
 =?us-ascii?Q?VqC69tJ2BWLNtw9sDRNGdzobsSvxwHWZmiY3NBonKTOh1utZmRAfpKRFbrc2?=
 =?us-ascii?Q?kkAFxQvBXNin5iPT+J+WqkiOTfpj21+ahCRFXMFM7r8HBBSZW4zO9ZM9BA5G?=
 =?us-ascii?Q?ICUhJXBkFqNxQWHhtDrHIsTkWyhGgbuRDeyidUBVCD+Y8ZERs5vgX+iG1n8E?=
 =?us-ascii?Q?v1T7gKZMnpJpgNKlDwT2NFMSW3S/V2HfgRwXqtTbA9zdLT4Xom58axWwR/US?=
 =?us-ascii?Q?FSFheUEuVNgmDq8+2peC+aYVp1LVnWjYkGNXaH0+ZEurUfA4vUKCUorgy4SH?=
 =?us-ascii?Q?HgVWQmEIx3xK7zEk84d4soNxFs5q5Y65yJQuh53YgSVX/9CXiVfpRfT+vhZ4?=
 =?us-ascii?Q?8VfHCVKTYUwN5oNp8uut44+0Aqr1T/grl0Fi4oMsciY39U/FQ3//NTzNeaeO?=
 =?us-ascii?Q?iBqWl+Kl6gT2Q3j1N4erw+cHUFqNvE/1Bs9hgsE3O6vNxzJ0jgGlRsgGLVR6?=
 =?us-ascii?Q?K2D3oPRVPzC+0fQfehd4jIFKNYimz3OhTR2BgBakFOhLuyy0/p5RBROGJ8/X?=
 =?us-ascii?Q?MefF2rI32txh8e3LhIpTd8qE7edQZ3FqHUUMN8q4yLxMJQ2S36WydupxozaW?=
 =?us-ascii?Q?gl4soKblSsMs5BAFwJzHUZ0CeaHf9mAtaWhGjZ8h/y4h5O5jSdZ0IMc4LUB1?=
 =?us-ascii?Q?p7x7BSEYeCbSpevM7+r8vc64Spn6pIW7Y8nHYmsZuKp7h2VFn+QQT3vg18lQ?=
 =?us-ascii?Q?w85Hr0p8eZ5hSAJxYLo4JXv4QOiNMufJ6RyC/MR9oyV71BdttzPD7jaMeoAf?=
 =?us-ascii?Q?AC0gjDZsYH+JvOqeaz3A6xoyTyt0BrHd3oOf?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(14060799003)(36860700013)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:08:14.0905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99a7e7c-37e4-47cf-9281-08ddc846e33a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5673
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
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
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..3f7175cb0ab4
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
\ No newline at end of file
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

