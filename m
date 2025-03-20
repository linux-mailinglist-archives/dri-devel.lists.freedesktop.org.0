Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C84A6A4BC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC6610E5EF;
	Thu, 20 Mar 2025 11:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VFGrEGyu";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VFGrEGyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5200910E5F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:19 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aeCv1WUOhBgXRsvoVnUA6XAGKIHLlYHAhiuISS8inomuLuFYgWN0pPPAlSepdGomftO7Q82mu4Z6naNJD5aRvO8Y2sjDcnM+21P/hotusahbhfRAWZD0xEHreQ2Lc+mBKb7nyI62OZgp2M1sq4tNRoYPAJAFQWA9D4HYvo/VUu2grUa/A7aQWZwTn17bNwwMJKUT8/4p/9bUs4S2sjJ0VY/n1j1H0Fdc6jf2RaEKebcANVpykohDYPP8cmqzQO1F1WRsdJa15ZYnqvKEel5n80zyRidBy7mksYan3o0Gnd96xFON/Obr5Yy9WaN+IR6MQKVlPE6CMwi8JLM2oH3pnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+TFo7nvFg44nY03QWZMc5ZWqasdfjEG3iZmQUgJWyU=;
 b=nNhm63qXXH/9nuCFOZC9Fz1/BMXTIbpeUctjuOBcVinJSzo1AtvW27VCSjH71RQqb2TeeZLhmhx1DxT+wWqnUhOZW+Yng3aVTMwr//zRVBINQxq6yYedPMvopjcRay9SL2hw5mTpdPCYthF7TcI8sVRk8785R+oZfXKWXwv7IkzuKO8falgAxFo8P5/tjW/RIraKmo9g4v9eetVBediWeXpvq7WN/sYfA6nj8ldX4DmsEqVuVvxUcvCYM4Hu4YW2I/hThkLVaPIrC3fzzqjacwKScVBQzZw3E6M8G8cyMTqWGZCLRhIolT2TeGLoPexPEkCpXU7fyDRRZmSMl59KJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+TFo7nvFg44nY03QWZMc5ZWqasdfjEG3iZmQUgJWyU=;
 b=VFGrEGyuaFxPebGbWcmbco2wmC8Ti7xsNle4mZXglbZ3Nt8XTtN1jLfuEaQjiqHFIuHgXjSeXS0X6o4jTPLKg8GNq9zdkZG5DKsFrUj9K9TDiIZTpa78OKrhhsim0X/S2Pg5s620PqkiGRJTMFa1VqdkfRhBSQUstEvvEHrYs+c=
Received: from DU7P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::29)
 by DBBPR08MB10482.eurprd08.prod.outlook.com (2603:10a6:10:532::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:09 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::5b) by DU7P194CA0013.outlook.office365.com
 (2603:10a6:10:553::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 11:18:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:07 +0000
Received: ("Tessian outbound ec1a125a00e6:v597");
 Thu, 20 Mar 2025 11:18:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d939b7781bfcf113
X-TessianGatewayMetadata: dNIp/+bC4J0yYanAvG9J0MPYT6WssB9VeLVyUbz3CSd7HTLydEie1wXGAvYMlDShdJ1pnH5sfof/UAREvqR+9f2TFyXamNPqApwHjAU0LLidAW8xAQLOdLoqk9oIOQc+UjB0HzPBn5pfuoS0/jQCIU4Mcl00jc1tSLkkp9XaEmc=
X-CR-MTA-TID: 64aa7808
Received: from Lb4d8711e3bea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A295BBC8-F3DE-4584-A8F7-05326D0DE16C.1; 
 Thu, 20 Mar 2025 11:17:59 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb4d8711e3bea.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:17:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2LUU3mX9oSHqju+AXf8vUIyFYEZqrjYA5o7tW9ak/dxIj1Yzyr+au36qWxnn7vnZJqSFGtkQDOCaHhA1/9gGT1HuTfRz3pzzhXzIJfnvHC0ewo691O7JkFSsoDrHenWMn4ofAB6DKouKlzRSliiRnwr+hXNKuBdmyw5NObiSF87Fd52iEjedw88Sr7mE09L27IRwYsbzXSVh8JQfDJulySr+zP31wP6kQmCNwfwfjLvDTN0Fs+kASVxi0du0UfwVS/MARF40WrXUUBcPHbejG2GjGsYdmA2+b0q72YgIWwGrXAkVEK1BQG4NlacK9OGLRrCnYXIYeyUeRJzM3yYPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+TFo7nvFg44nY03QWZMc5ZWqasdfjEG3iZmQUgJWyU=;
 b=eUlc3sMvisdTkTGGZtoKy2AYz6q0iE7yhUVkcnDoZ+e5eNhKh+/HxG/kNCCxb6ZoBXQgeZAUJoD9U44LKvW7R5MOAClInbSQ7KU4RlmIVPe26pibTcA+pEqUStj8sI1wmp6IZAZpNoiihSiD53Y+DTHVgiyNJWBp95VI0uiCgKMYsGVF1FroOF3tBD3J8+l1kYNQnT5IBi2F98SaKg5F9fz2Jr0JbSY4XmX0AmV2nARnFCIVua6hcc9bL0o2sdiw8PEDdXkBrncx9dZqgNSQr0oSw2RgfEBW0os8Yt3xX4MP3DaV+zQao+vSqy6EIACzYVtafsGhhxyVLwNqUILLpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+TFo7nvFg44nY03QWZMc5ZWqasdfjEG3iZmQUgJWyU=;
 b=VFGrEGyuaFxPebGbWcmbco2wmC8Ti7xsNle4mZXglbZ3Nt8XTtN1jLfuEaQjiqHFIuHgXjSeXS0X6o4jTPLKg8GNq9zdkZG5DKsFrUj9K9TDiIZTpa78OKrhhsim0X/S2Pg5s620PqkiGRJTMFa1VqdkfRhBSQUstEvvEHrYs+c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:17:57 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:17:57 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] drm/panthor: Add GPU specific initialization framework
Date: Thu, 20 Mar 2025 11:17:35 +0000
Message-ID: <20250320111741.1937892-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0487.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::12) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|DU6PEPF0000B622:EE_|DBBPR08MB10482:EE_
X-MS-Office365-Filtering-Correlation-Id: cdce27f9-b3cc-462d-d9f4-08dd67a0e43f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?/aeVOFfCqe0QfojEJzsQJgGtLsloqygehQBmZHMvSSMammVX8lLcJRUiDokO?=
 =?us-ascii?Q?GRB2xBD1Xoi9IEC95vmh2qURkmcEOVPWxRBB2kC0MM059tVBjykkpGujoi8o?=
 =?us-ascii?Q?emJl4OW3+IKPy/bujErxTWiM7vKhL+j1gw0kXjf6MCGPdgPvU+ls33jh8XBM?=
 =?us-ascii?Q?lThYPNgZ8XgC+hU1EA2yG2RVkJyv8QBF4wB4P11qulk+wx3uQlMf1WlSpBt9?=
 =?us-ascii?Q?Xpwy09NozOItGrFMPvPgBu6XucTvF2RiUpoeTZHHe5PHeMF6a6Xn2jo4Emcf?=
 =?us-ascii?Q?Hw8XQbHKtQhW1VsES+BnyhD1cB92K/PBBD62GEPhQ6KxhXoV3U+pQgsT4fES?=
 =?us-ascii?Q?cTkQS2SPFjXaVLr7PfHnUNoIDFfMKlnfyxXU6R8bD9dSNV4DycjZVGLcBqBS?=
 =?us-ascii?Q?tEkX6T99lPZY7bxaaH6SmDULOo57kNvLowmpDVh1KjyKtVIw9efIKfdsKVc8?=
 =?us-ascii?Q?D13a6cOgbFnA+YuYpQ54b7hLvqHUP6tT1oS1B1fQauhYxg5CkN+US1VaPpss?=
 =?us-ascii?Q?qrrYL2Prcup+fCxTsoX0HezIg+N54BrRRUyU0+uZYJFByVrUFUk4UG3JznJS?=
 =?us-ascii?Q?M2xdGxuJ/Nw15w4eExl6kZXEzvCEmIql4vJJT4rcUgXbAP1Ngq8BPpFzxTfV?=
 =?us-ascii?Q?aunhqoZK4iP0ftSq7VLoLQ9j9WYMKBWsZg7d7nEaEz5isZF6KbX7Zxd6OkZy?=
 =?us-ascii?Q?q7C/Y/0XcRrZvROrYShgqSFDNIFfunX1OqThBoDcQz9835UwI/S7azBpSgR9?=
 =?us-ascii?Q?ufbYFMKcBtkA6NTCdHbPxEKs8DVdIRKcQR/iqV0dehvKUG62HCaLE3iThn0d?=
 =?us-ascii?Q?YzaGDL/l10e9b7Jt6ULR+W8QI7WNPLbWLClJj8m7/eg4lMKLxQEdzDCpivgD?=
 =?us-ascii?Q?2s2Kxnjeb0BP0MOQVFlKWN5qBgXhjITTWddcmoVR89Kkn6X6N0Dow0XvU2XF?=
 =?us-ascii?Q?6u/FbjtCeyzsRhP+FAEJHuKsbqukZXFClbGSVlhzR9K6m724XAyQd6BlDrDq?=
 =?us-ascii?Q?lW/JMijS3SVX2JbX3yXhpC20x1ViZwQG6OpPWTfGPnBvbY21R6228FZjeM33?=
 =?us-ascii?Q?VsoudyZB3QV+bqs3jGjabadwxrJCGaf/utkTFPEl0WpH4kKfQSUcthB5K37Y?=
 =?us-ascii?Q?bsmihdIJyzwUGmx+FtmVt4JcNk8vQc9EN33FVdHnly32YZnnQ2NmFx3I3Izw?=
 =?us-ascii?Q?jCJQ4g5uByrawg/wHRZMyjW/PlQkTVhLK2KlsV0hti+KNN9ZlHbuOuT/XzJI?=
 =?us-ascii?Q?sjurfWgJhSd1fvSDisxBa1HvQ/XjuCzCQgKRMdknVkytoGhM3+YOMLVRO9qt?=
 =?us-ascii?Q?XBzPES9AO7ZDGPZzG+QZjd0hlrAN8NNskkruvLMllrcwQ99oOKcL22ibWg7o?=
 =?us-ascii?Q?gcuDnhxYWr944WVzmfuxRtJNTzQe?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b1a0d67f-f23f-4cbb-eb11-08dd67a0dd7a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|14060799003|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xg25oIprOdL8cKXKIsftQnfKHBy2ypoN+AHFAKFwPidbWeuJ2Ey0/hRI6n5y?=
 =?us-ascii?Q?JAh81vMCL8jdN7AS8T+bv6IXK4LqQH69ZwVhUiWegW3TfMl6ydFWcc0w0YQB?=
 =?us-ascii?Q?2/T17VAS2nf4L40EGIbUoYV+NMbCnEAmC8vm7fGqQ7BxK74CK2oAy4r6OUuM?=
 =?us-ascii?Q?BY29qV5dq/k/s5WdzbYHuomjiIlqxFphP7NHy6d2259V/cz2ZQG/5Jbx3X6E?=
 =?us-ascii?Q?aan3046lewIXZ/SiJIIH5ZQmC4iFlrCg0rlnVzct7l32gbtQ4CK7P+JQPrQ5?=
 =?us-ascii?Q?AfPlQyahGKIk58Y3l1yFZkGApdNW/eYlygdfgzBeoHpVuwwlAj2F5cdHWb46?=
 =?us-ascii?Q?WwUMmPHww8WMQPQgJjn+eSLjZocvhzBlV1U0niwQ1mXqP6CRSpwff9caz3lv?=
 =?us-ascii?Q?WnGNtk6gNBlgqOCE5mMbkghtHcFNC0O38xNdOehPA9Jdq3dGvrBuEcP4SWm/?=
 =?us-ascii?Q?ywo87XsyOc/GNWt4FILCkamL/wPnmK9xLoga7OPvu0qzsIeLCawbPwUHtiWT?=
 =?us-ascii?Q?z0Ni6e/lP9rVjYd6dbJbUU0Og/sqv/BU8tnO+S9Wn26DL6TBE5rFA0wG5mk1?=
 =?us-ascii?Q?jHgYbZyyEiAWxg6qMh3/EVQIxJBL0K9rDFKnMNqpMLk9J8a1ALFzz+IJzCYt?=
 =?us-ascii?Q?nvQSXU/W80FGbzwzoJA7izvo3YPFmwzDDzRg74qU4MV/NVmQQkdgSYrQHeM0?=
 =?us-ascii?Q?yuvtdqgDSkTYRgFl6t3lGFKzXil4ORqRTCskv9SmgcZsZlWMq6Zcsq45px8z?=
 =?us-ascii?Q?f07VanItLowtAvZ8M1lr5/YwexV0+/h5fKJPgDTeyBkTGgD48E93GTag1tUG?=
 =?us-ascii?Q?R10sVxVCrhUJZE0qUCgV7QrTd7i5yC/qIzeyCn/iTokW6DVU8wM30080lu9B?=
 =?us-ascii?Q?2X57dbRpkvTnFfm+r7csoJQ98zBYyO5oPKLYrn8+OyMm3X7zlfPaOxFM7Qkp?=
 =?us-ascii?Q?vq5L4NvFuN2j+t9gTyl7K59hW68OjQ2gOg4b7KSrJCNTx0xJmbGLf1hfZMa7?=
 =?us-ascii?Q?Lv1yAW4hvfG9Rgv+ibAmwZMGH9yncXWlFkAxqtmlpG4l3OEyY60bmDD71iiS?=
 =?us-ascii?Q?aOp2Uz2mHFEf9TOKitWe6BmdvGC2npje/6Dd8SGdrkGZM65oHSb1QqBWvKMc?=
 =?us-ascii?Q?VEwb5ShrRh4nEdqn2F/rc8BiZVMsxW8OIXtvrzoWGsqgGrzHF1If3Ii4wJBr?=
 =?us-ascii?Q?rzALVr011GnChUFDw5q9AX056hc0IJg6N1pCfiswaYYPZxsgFBifhYUgP1V8?=
 =?us-ascii?Q?yNL453ATOpq2F3KRYzR+WJ9F/LgyD+v69P7gesGYd773AYnS2luc8Bg+DEpI?=
 =?us-ascii?Q?zpFdrF1vNqxkyzx4YmrE5PhTXsspgMhcA2KHlEZO2ES2zq3BZZTs12Scpszp?=
 =?us-ascii?Q?7bwkgEDyo1NVr+17V4dlCLhGD5v7Ys2duVTxvkobt7sPf0h6yAEjDouNUQXC?=
 =?us-ascii?Q?o8s4b4/X5FEbVz87b9vxhs2aLLc2G+/7zLyuFdRChb9aNKBYyYi65qvHP0fj?=
 =?us-ascii?Q?vhnfsC7r9c61jko=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(14060799003)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:07.7984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdce27f9-b3cc-462d-d9f4-08dd67a0e43f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10482
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

This patch aims to lay the foundation to provide support for multiple
Mali GPUs through a framework by which differences in registers,
functionality, and features can be managed.

It introduces the concept of the arch_id which is a 32-bit ID in the
format of ((arch_major << 16) | (arch_minor << 8) | arch_rev). The 8-bit
fields of the arch_id provides future proofing past the 4-bit fields of
the GPU_ID's arch_major, arch_minor, and arch_rev.

The arch_id is used to select the correct abstraction for the GPU, such
as function pointers for operations specific to the GPU, base addresses
describing changes in register offsets, and supported features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |  1 +
 drivers/gpu/drm/panthor/panthor_device.c |  5 ++
 drivers/gpu/drm/panthor/panthor_device.h |  3 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 70 ++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     | 63 +++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  2 +
 6 files changed, 144 insertions(+)
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
index a9da1d1eeb70..a6fca6b3fabd 100644
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
@@ -243,6 +244,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index da6574021664..82741bf1a49b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -120,6 +120,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;
 
+	/** @hw: GPU specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;
 
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..234bfd50cf0d
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+static struct panthor_hw panthor_hw_devices[] = {
+	{
+		.arch_id = GPU_ARCH_ID_MAKE(10, 0, 0),
+		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
+	},
+};
+
+static int init_gpu_id(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+
+	if (!ptdev->gpu_info.gpu_id) {
+		drm_err(&ptdev->base, "Invalid GPU ID (0x0)");
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	u32 arch_id = 0;
+	int i, ret;
+
+	ret = init_gpu_id(ptdev);
+	if (ret)
+		return ret;
+
+	arch_id = GPU_ARCH_ID_MAKE(GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id),
+				   GPU_ARCH_MINOR(ptdev->gpu_info.gpu_id),
+				   GPU_ARCH_REV(ptdev->gpu_info.gpu_id));
+	if (!arch_id) {
+		drm_err(&ptdev->base, "Invalid arch_id (0x0)");
+		return -ENXIO;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_devices); i++) {
+		u32 mask = panthor_hw_devices[i].arch_mask;
+		u32 hw_arch_id = panthor_hw_devices[i].arch_id;
+
+		if ((arch_id & mask) == (hw_arch_id & mask)) {
+			hdev = &panthor_hw_devices[i];
+			break;
+		}
+	}
+
+	if (!hdev) {
+		drm_err(&ptdev->base, "Unsupported GPU (arch 0x%x)", arch_id);
+		return -ENODEV;
+	}
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature)
+{
+	return test_bit(feature, ptdev->hw->features);
+}
+
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..5eb0549ad333
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+#include <linux/types.h>
+#include <linux/bitmap.h>
+
+struct panthor_device;
+
+/**
+ * enum panthor_hw_feature - Bit position of each HW feature
+ *
+ * Used to define GPU specific features based on the GPU architecture ID.
+ * New feature flags will be added with support for newer GPU architectures.
+ */
+enum panthor_hw_feature {
+	/** @PANTHOR_HW_FEATURES_END: Must be last. */
+	PANTHOR_HW_FEATURES_END
+};
+
+/**
+ * struct panthor_hw_regmap - Register offsets for specific register blocks
+ */
+struct panthor_hw_regmap {
+
+};
+
+/**
+ * struct panthor_hw_ops - HW operations that are specific to a GPU
+ */
+struct panthor_hw_ops {
+
+};
+
+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+	/** @arch_id: Architecture id to match against */
+	u32 arch_id;
+
+	/** @arch_mask: Mask for architecture id comparison */
+	u32 arch_mask;
+
+	/** @features: Bitmap containing panthor_hw_feature */
+	DECLARE_BITMAP(features, PANTHOR_HW_FEATURES_END);
+
+	/** @map: Panthor regmap */
+	struct panthor_hw_regmap map;
+
+	/** @ops: Panthor HW specific operations */
+	struct panthor_hw_ops ops;
+};
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+bool panthor_hw_supports(struct panthor_device *ptdev,
+			 enum panthor_hw_feature feature);
+
+#endif /* __PANTHOR_HW_H__ */
+
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 7ec4a1d04e20..ba452c1dd644 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -19,6 +19,8 @@
 #define   GPU_VER_MINOR(x)				(((x) & GENMASK(11, 4)) >> 4)
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
+#define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
+
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
 
-- 
2.47.1

