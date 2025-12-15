Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45047CBF2FA
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CE710E59A;
	Mon, 15 Dec 2025 17:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="runDZZcK";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="runDZZcK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25ACB10E52D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:16:11 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gOfuYMn0ST65+xIU8ZlFIpaiRXpycSslb1EnOssogwnAE4IF6raMpPUTvNHTGQiYHxC/XIb71BNi5BH+/5FuOegdEBEoCiGbURcO/pmpFRA9rS4xl2+WMbVXbd9WsugQCTyJw0MD6HdFLswHhDaUnS46mNf1UvRYwra6uTUBm48Z/dRoOAmOcflOLytu6uVxq5BcTg84znee/YCYqiAAxaKXqYwE//RRivQZlX9Sgz3e9LsiXm5VJcnrhy0RjkV5i/dJZRtUY1Q32HhkNx3InNDuYvzhuGw6UzPUOGNv06EuBdTVai9lQitEavFJ2OYx/mSIndjdnxIq8DmqrqxQow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9Eu9OvhQd7RSo0UI9mH5kXUOBzOtuYiFOHBhqjzrd8=;
 b=MvySAwZra2T9RCi/2HLh5sDjrvkq0Duo+pXwein3q6eAGiWigCxsTInO0sLD2owUSNP66bt6q53GF7bMeviFBoub6CgpIkdbbcpThmfQYhUfdQJky5NAmAa3pcrCVmeIMqZjzdI5E/HrISkq+w/2EGuFAzpp7XDd8kWA4zBUFYUu6fYz8pDuLr5z4nY7HLklwuCNXMxdm5iMuRwUAF+H0bWcudS7DWSKvqn0j8yKrgG8x6fXfIa9kD/98aTbu1ibb2+eXxiAW8Lr3tLh5zoaIWzk5Iom+MVcq7JYDXGE3rPD4t99+xtXgD3hoZ2R6O1MfhBb9amxxkUFT8Ggvnh6qA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9Eu9OvhQd7RSo0UI9mH5kXUOBzOtuYiFOHBhqjzrd8=;
 b=runDZZcKYqvkyWuPa6OkEm4bEpW0j8d+/PHkaiN8mxHyuVYw60nUNFti96OND+AfsPgWphqd4xxtPzCOQ4x/mYNwbAN54mVhHEV5YDvItJi++CQvtvEO6ruHllAVGuhB8laZDkGw5DFIXlUFF+SuWvZY5R+kdRjoFLAgXCn3wb4=
Received: from AS4P190CA0021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::6)
 by DU5PR08MB10399.eurprd08.prod.outlook.com (2603:10a6:10:520::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:16:04 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::19) by AS4P190CA0021.outlook.office365.com
 (2603:10a6:20b:5d0::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:15:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 17:16:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBD+hZ5EWsFOiWfwPzZu4SBVq2rFcRhkoOqwd308cguhFh8nLcmanUZCF1nM2Dwoh5/XJyFRf3QK0hZ0gSjeBfek92DA4UMRcP04ayl7QxmEj8aClVu0LvqhgUY5GiHv8E0r/HoK9dzJuj/UD9xC5Xa4qTaEN6lvTMbm5GRrv5YtOVUaTSE0M03CIOqyh34e7Z7HEfXk+vzyPsFIZvd6kovbQP4qwS/ujYPvWxaNqP/crZRlowm9MDN4QEeRh1SGJUBqx7IPh5hQWN69f9Fh/yJYwgTU6eiCmkEA5zhLzGHvv0CgOndtd6jqPLBs+t9MR+tPTvkhP0blMaZEaDYbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9Eu9OvhQd7RSo0UI9mH5kXUOBzOtuYiFOHBhqjzrd8=;
 b=F0S6rGP36rTcX5LG+X8LDZwYZlUp/3WbE45GdkxvO970zz1SZlIz6oOpnzUKjM3LMG4hi/2Yd3N0h0nJd5v+/qVKglpC1B11UbKFbrEt1jzGKp3te/yjcIlkOx5qQ4wGNpzAawXgjDnp+OmWwHnLqM+Gn4Lplnu+gOvrAF2LHuT+WINpuJAkU+3IdvF0qoCkNxLAZg2V1QyVA6UOI35jHbaLZebOZdjXxtzneEUibK8VgR9m/G+m7klXn4N0JtaEUV3mnRAC3xKdDmGTxNU+EVEuA0xu/cvC6ErHnw2hytffwZI0wKjP3K/SM/irw9sDOIxmD07tPm5FUXZ1tCJCXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9Eu9OvhQd7RSo0UI9mH5kXUOBzOtuYiFOHBhqjzrd8=;
 b=runDZZcKYqvkyWuPa6OkEm4bEpW0j8d+/PHkaiN8mxHyuVYw60nUNFti96OND+AfsPgWphqd4xxtPzCOQ4x/mYNwbAN54mVhHEV5YDvItJi++CQvtvEO6ruHllAVGuhB8laZDkGw5DFIXlUFF+SuWvZY5R+kdRjoFLAgXCn3wb4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by GV1PR08MB10607.eurprd08.prod.outlook.com (2603:10a6:150:16c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:14:59 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::a89a:b887:8053:a1fb%6]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 17:14:59 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: nd@arm.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mihail Atanassov <mihail.atanassov@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v6 0/7] Performance counter implementation with single manual
 client support
Date: Mon, 15 Dec 2025 17:14:46 +0000
Message-Id: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0433.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::13) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|GV1PR08MB10607:EE_|AMS0EPF00000193:EE_|DU5PR08MB10399:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b34a3e4-2026-4bb9-32a1-08de3bfda072
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MS9EbEovV21HVlJTTjFNeEk2OUdZNjErMFZzeGY1Yy81N2pkWVRmYURQR3NQ?=
 =?utf-8?B?eXFSZ21mN1RiSkN3RFJwZWFKNzF6c2RiS04rVzVJWExRS0ZGS1Zub3dOOGRI?=
 =?utf-8?B?blF6RlVUeGEyemJseS9LdDQ4eHhHSTRwb01VdkU3aXNKQVlRdnp2TDRYK1ZZ?=
 =?utf-8?B?WnYxRElreTBWcVg5RnRDRmdSdDVjZnQra0xIeDY3Uy8xOTFzS2NpSWlFcVpZ?=
 =?utf-8?B?WUNHSnBoL2FlL1ZGUFBBcHhEbEI2Mkg3RUxmNDRpUjVqQnA1ZUNHei95b0Za?=
 =?utf-8?B?RkQ5VVRwcVA2dFpQMzlneUpaYTZjSUREdFcveWpZemNuYTRtenc2bjRLUDhM?=
 =?utf-8?B?Y1pYTWx3WHJYTlNMOHZ5Z0lVczBLTFdFSDlUNUtpWXhRM0hFOGxZSkJKamNO?=
 =?utf-8?B?c1cwSzNIYWZQZ2YzSUJGRk9JeUNoTklmc0FvYThRaStvNTRBTnNWdEJMY2ZK?=
 =?utf-8?B?SnVtbE1wUWMzT0hXaGNaL25QMUpwMU44SHE4RjhzSS9yVUVHckdLam5oVkRk?=
 =?utf-8?B?MGcwQTRzamRVbU9QMzJHT3ZmQnVYNTVLVmxiSlMvZkZOeDQxNC91M01tL1h6?=
 =?utf-8?B?dUVpbGRSZFo0NE5aSStyY3JRUkhFVEVKSmVzL0FCb3RMOEFCMndFbXpCQmJ2?=
 =?utf-8?B?dm51TjRJaDhISlp2N3VQS1lKWlV5K3dkS2ZoNXNxOFh2Z2p1d3BOTEVUZFNz?=
 =?utf-8?B?ZFJwMUQ2TTZ2czJEb0tJdjdQWGxwMmtCWDdzOEVCY1NBRlZ0YlRnZjQ1bG5F?=
 =?utf-8?B?aDBnUTdQb2ExSS9DNS9kVzNYQzdwdGZnZHFzaFRuNnFiL0hGYUovL2hHSDZD?=
 =?utf-8?B?VXRadHRBa1VySldnOEFNYmQ0MFphejcxbG9oaFdTWkhaL0NCa0JsZTMwbXFp?=
 =?utf-8?B?WXVjTWFDYUY1MElWZFd3N21SYVNTbXhIdllzVlNVWlFmWThydWt5dEQrMmpT?=
 =?utf-8?B?cFRnaHRQNUNtMnp6UXJVVDFNOUJ1eHNmVW9tcTcwWExiZk9waW5YZyt1OE04?=
 =?utf-8?B?ZHJQb2R0RzJUbUg0QVhSVUZPeStiaUNZS0V3RmlVeEtUT0ZLeDdjYWliTDFN?=
 =?utf-8?B?WitRV2p1L3J2aktPK2NXeS94M3Q3enBHK3RYUVA1WFB5R1Ztd3crM3dGTHdh?=
 =?utf-8?B?aHM0SHFlbnpuaGc4cGFzcmJIdHBQa2NZeGd6TmM5cUp1dzd1QTlkalJDenNp?=
 =?utf-8?B?TkNPeTdmeFh3NVlJa0JORXFiQVU0YWNaMnJXL3cxSWF4amxjOVlrMDhyNHV2?=
 =?utf-8?B?Zno2b3lPODBWUFVpMVZxT1Z3YjQ0Z2JBNUxsVDdZdjRDUVRTMjFYb2RxcGNi?=
 =?utf-8?B?SXB0MWkrYXVaMjUrWi8wekE2UHc2NVB2ZWtwYWp1TWNBQ2cwVE5kYUE4N1dR?=
 =?utf-8?B?STVpaVFmU2xyM3BPRzNnWkh1VGlBcmZZaXJMbGZWZkJkQytqbklkOGZ5NHNL?=
 =?utf-8?B?S3RMVnNVNHdQcldlRDlrSzZCeWVmbldxa3NYUythVnZxU2dnV29qWDRyM0lB?=
 =?utf-8?B?cTBCWmlmUXFwUjYzczRxTnlLY0NJTjJKcStVUDkrbWJZK0xqRzYwZm0rQXZH?=
 =?utf-8?B?WFVuSFZCY2pmUUw3VFlzQStqUWFzc2s1MWh3TGNOM2RlNEtRSDhpQkdXMGpK?=
 =?utf-8?B?NURZZlRmSjdiaUlSVSt1VnhaT29zUi9wNXFGeDRNK2EydUZhYlhlNGZ4eDRs?=
 =?utf-8?B?cmxjdEUzM0crcmo5cTJnUnNtbnZOS3M3NDhVVzRBY3RYMU9YcEJQeGEzMlRQ?=
 =?utf-8?B?UkRaZ3NpbDZtWjZHMmZKUE81UFRFUVRrYjJUZllTS2JDSVVCSzJJS2R2SjJG?=
 =?utf-8?B?TllwTk1XbmpFZ2dQM2lEUTNTZGw4WUlYbERIVmR0Z1VkUWdXQUMvbFkyeHdG?=
 =?utf-8?B?aEFGSlRIbjhoYmpRYks0aG5TQUFsNmRmU3pwcHZnTGo0WWc9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10607
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f52b78f9-59e3-4104-7ee5-08de3bfd7a02
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckpGSVo1Sk5GSGpqRGNzSFFUc0prQngzdXRkQjhCQ21ZY1p6UlFtVnN3cTNr?=
 =?utf-8?B?SGZpRGNNSUpKTG1JbEJNNm91dVQ4b0V3c0dISEdJcHZvSlRsekNGVG1XK3By?=
 =?utf-8?B?UHNKMDk1NWZuZElObXc5SWw0MldTSEZ4WjRrUXlSUFBsdmw2VkJpTFc1dDY2?=
 =?utf-8?B?M3ZLTHZrdE0vaGt0UEtjWkYwSmV6KzBIeW5jaHZSWHEwdVhPeVIrN21COUhk?=
 =?utf-8?B?ZW5VTm9MZEczenY0Zzk5R3REVFgzSjdaRkhsN3dXdTR4NlIyN1VMNzNvdWs0?=
 =?utf-8?B?ZC9aWFI3OFJRRS9zcUhBNE9DVmlZWWNBWlFyRnpNdzlSdGZsNm5vM2YrYTZL?=
 =?utf-8?B?dmFaSVl2NEpTZjlLbDNqVmZWSEgrVzcvQmVOa1FWclF1bXZaVGFUZE4rV1d0?=
 =?utf-8?B?UlVLZENsbU1NVGhYUlp1alIzSUtwWUFZaTYxSExVVjFxaDNvVGEzY1hhTkpp?=
 =?utf-8?B?ZFJrVjlXSjZUenRGRUJ3N2dDMkhUcWpDcUF6RGcydlZnOXRrR3k2Z1dUME5H?=
 =?utf-8?B?WTAwUEp0bzlaV1JIWEkybi91akd2NmQ0YXFWYWVQY3hMUkRUVi9tUVludlNj?=
 =?utf-8?B?QXFnWWN5SWRQUEF2WE4rcUcyMjdMZHArOHhydG1OcHlVREdvTlNJSTZCcUo4?=
 =?utf-8?B?ZllrajBXRTFOV3V0RzdpNEhCRXZkYmVMeWc5R2szV09xeUZOdWN3SlROZlpM?=
 =?utf-8?B?cElEYlhDSlB6TzZ6cU5NVVNJYzV1ZlkvN012VUxxbkFuMmVaRDhmL3lOWXlv?=
 =?utf-8?B?Z0VCTG1GUzlNMnlRS0s5UXRLUzh6S3dpSTlhMHdaNWlBR3ZoZ012VXRXTTJj?=
 =?utf-8?B?bTgwbERTWEk0cUgwT2Vqd3RjTEFUSDNzSUhDYmkxUVYwRVJEczZuWDB2Q2Yz?=
 =?utf-8?B?YitzOHFXV2F0NEh3N2h6MUsxVzRuSzh5Z2REL3Bmci9HTmZNeHRzZlFIRFlJ?=
 =?utf-8?B?QjVyVkdiL2hMenV4dGE4cE9rRlovM3RuZHh5WklYY0lMMS9lbXhBdWNnWTg0?=
 =?utf-8?B?TTFNM3RPYTN0b05ieW0yMFFQZHlFL2pMUUs2bTFVK2s1TXA5dzdwQTI1RzJy?=
 =?utf-8?B?UUNrSloyWXJ5eTRrUlNDZXRpQnRVTkdqaTdiWXJDOExiWGl1cENGNmRwRTNT?=
 =?utf-8?B?SGVqbzgxeUR4MHJkQlAxaUJRS2FLdVNpNGNBY0ZzeExWdTVITWNuQnNWUU9Q?=
 =?utf-8?B?V3Y0cWlKdGNvbzF1SWkrQkZPUEpIYUFhRlluZm9INnEvdndTR21QalpxQ1lr?=
 =?utf-8?B?dkVMc0VsODhFZ0ZuNnNIV0NGRXFDTi9MNnltUGRUS0FHSWIxZ3dlK0poemRW?=
 =?utf-8?B?T1NRTWZsODJ1OWtock5FVEp1Q0JzdGJoZWZ6djZEUHB1d2tzdFo2aHIvOHRq?=
 =?utf-8?B?VGh1bnR0bHo3a2JjaFIwaUdaeGdnRENDMzNyRU1hYm5RZUJVZkF3NzVYUm5r?=
 =?utf-8?B?b0VUd0hlT1dSL29xMGpJNUxIWjZtcGZqamUycFdhRG0xa1JoMW96OHdBQU9H?=
 =?utf-8?B?b0k3Vlh3VHhrMWQwTmUwZURab1Q3S2c0THhabjJETFRJVlRTYThHRmVKQVlr?=
 =?utf-8?B?dDdvWXRxdklSdmVEQ1h6clBPRlBnMnpJeFhYNVR2ZFE4bUZYSXFWMlNjZEE2?=
 =?utf-8?B?MXI5TldEL3J6eXhISjQ3ZUpCcGZiNUkyUGFBdjJnL25xT1VKbnZLczBmSlJU?=
 =?utf-8?B?SFNoQmF5aWtHQk9ObmdRMC9pdmFtTHVMOUtNZ1pvWVQ5TDRiS2NkV2ZTUk1Y?=
 =?utf-8?B?SkthekpMTk9yQ3d0dVJRUGZXSkk1Mm5KOGJlbTFMQ2cwRnA4a0pjV1k5NlZM?=
 =?utf-8?B?MjNQdTNaWkNlMFJrWmRyR2VhWGNKRjA1Z0JFVU04L3FmY1hGTVVEL3VpWDRr?=
 =?utf-8?B?TEwyT2pQOEpKNnBWRDhaWE5odFNrR0pmOHErQUpVckg4d3h6Ti9xNmNOaWdw?=
 =?utf-8?B?ME94LzVnbXVUeXlLclhqWlhrSmZZTFpLcHdrZ1lYanJVRU8yRXZ6aWdxdVdC?=
 =?utf-8?B?cXppdURTS3lQWVh6YVhyOFlKdi9OY0NzWWF4cnBKNnl1aVk2d0ZiNWI3a0M4?=
 =?utf-8?Q?QqQTs5?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(376014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:16:03.6815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b34a3e4-2026-4bb9-32a1-08de3bfda072
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10399
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

Hello,

This patch set implements initial support for performance counter
sampling in Panthor, as a follow-up for Adrián Larumbe's patch
set [1]. This version of the patch series fixes a number of issues,
including FW ring buffer wrapping and IRQ handling for the
performance counter IRQs. The size of the sample is also added
to the uAPI, allowing for the PERF_INFO DEV_QUERY to be sufficient
to handle backwards and forwards compatibility of the interface.
The Mesa implementation is also now available [2].

Existing performance counter workflows, such as those in game
engines, and user-space power models/governor implementations
require the ability to simultaneously obtain counter data. The
hardware and firmware interfaces support a single global
configuration, meaning the kernel must allow for the multiplexing.
It is also in the best position to supplement the counter data
with contextual information about elapsed sampling periods,
information on the power state transitions undergone during
the sampling period, and cycles elapsed on specific clocks chosen
by the integrator.

Each userspace client creates a session, providing an enable
mask of counter values it requires, a BO for a ring buffer,
and a separate BO for the insert and extract indices, along with
an eventfd to signal counter capture, all of which are kept fixed
for the lifetime of the session. When emitting a sample for a
session, counters that were not requested are stripped out,
and non-counter information needed to interpret counter values
is added to either the sample header, or the block header,
which are stored in-line with the counter values in the sample.

The proposed uAPI specifies two major sources of supplemental
information:
- coarse-grained block state transitions are provided on newer
  FW versions which support the metadata block, a FW-provided
  counter block which indicates the reason a sample was taken
  when entering or exiting a non-counting region, or when a
  shader core has powered down.
- clock cycles elapsed over the sampling period and
  clocks associated with a particular block. This is
  because the clock assignments depend on the system
  integration, and are needed to normalize counters
  representing clock values.

All of the sessions are then aggregated by the sampler, which
handles the programming of the FW interface and subsequent
handling of the samples coming from FW.

Mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35024

v6:
- xa_erase -> xa_delete to fix up dangling session issues
- Move setting user data into request callback to avoid setting it on error
- Embed the enable mask into the sampler
- Added helper for sample_enable and sampler_disable to eliminate duplicate checks
- Drop PM reference on session enable failure
- Drop the panthor_perf_em_zero function
- Added R-b's for the first several patches
- Added added reading of the PRFCNT_FEATURES register on supporting architectures
- link to v5: https://lore.kernel.org/dri-devel/cover.1753449448.git.lukas.zapolskas@arm.com/

v5:
- Started re-using perf info size fields instead of
  recomputing the size where needed
- Removed panthor_file pointer to the drm_file
- Fixed ordering of subsystem unplug on init failure
- Using the kernel struct size to allocate memory for user-passed
  uAPI struct.
- Inlined panthor_perf_sampler_{suspend,resume} into
  panthor_perf_{suspend,resume}
- Inlined
- Updated all callers of CIRC_SPACE_TO_END to use CIRC_SPACE
  for correct ring buffer wraparound.
- Free the session and sampler enable maps on termination
- Drop the return values from panthor_perf_{suspend,resume}
- Update userdata and end timestamp on accumulation
- Removed the ptdev checks on suspend and resume paths
- Link to v4: https://lore.kernel.org/dri-devel/cover.1747148172.git.lukas.zapolskas@arm.com/

v4:
- Added sample size to the uAPI.
- Clarified the bit-to-counter mapping for enable masks.
- Fixed IRQ handling: the PERFCNT_THRESHOLD and PERFCNT_OVERFLOW
  interrupts can be handled by checking the difference between the
  REQ and ACK bits, whereas PERFCNT_SAMPLE needs external data to
  validate.
- FW ring buffer indices are now only wrapped when reading the buffer
  and are otherwise left in their pre-wrapped form.
- Accumulation index is now bumped after the first copy.
- All insert and extract index reads now use the proper, full-width
  type.
- L2 slices are now computed via a macro to extract the relevant
  bits from the MEM_FEATURES register. This macro was moved from
  the uAPI due to changes in the register making it unstable.
- Consistently take the sampler lock to check if a sample has been
  requested.
- Link to v3: https://lore.kernel.org/dri-devel/cover.1743517880.git.lukas.zapolskas@arm.com/

v3:
- Fixed offset issues into FW ring buffer
- Fixed sparse shader core handling
- Added pre- and post- reset handlers
- Added module param to control size of FW ring buffer
- Clarified naming on sampler functions
- Added error logging for PERF_SETUP
- Link to v2: https://lore.kernel.org/dri-devel/20241211165024.490748-1-lukas.zapolskas@arm.com/

RFC v2:
- Link to v1: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6

[1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35024

base commit: e48123c607a0

Adrián Larumbe (1):
  drm/panthor: Implement the counter sampler and sample handling

Lukas Zapolskas (6):
  drm/panthor: Add performance counter uAPI
  drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
  drm/panthor: Add panthor perf initialization and termination
  drm/panthor: Introduce sampling sessions to handle userspace clients
  drm/panthor: Add suspend, resume and reset handling
  drm/panthor: Expose the panthor perf ioctls

 drivers/gpu/drm/panthor/Makefile         |    1 +
 drivers/gpu/drm/panthor/panthor_device.c |   16 +-
 drivers/gpu/drm/panthor/panthor_device.h |    8 +-
 drivers/gpu/drm/panthor/panthor_drv.c    |  149 +-
 drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
 drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 2000 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
 drivers/gpu/drm/panthor/panthor_regs.h   |    3 +
 include/uapi/drm/panthor_drm.h           |  565 ++++++
 10 files changed, 2792 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h

--
2.33.0.dirty

