Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 254B1ABA070
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3010EB0A;
	Fri, 16 May 2025 15:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="XdKZZ1AR";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XdKZZ1AR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0310EB0A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:48 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LuY8R8w6KQauw6N551uKd6J6yf3JsVOFBt5lCWqJGzreZlAjFw4Q+kngt+qh1xUAeZuk7w2VNxXn1mkSGfioG49aP5XL4PeoX/7M0wmnZD08E/CSGBtV0IoJtjjhMKOoCZEUbwi4lBKdo/CD3yK/f7NPeQg9s3uW1Te5cOrkGUdBYshmmnP0+R3WtvbZEd+xBJmt2dpX5lLuCgRBCd08eG008jUlOVqgDWtRSum3sPTxX+xCtU4i/MOGKYR25/oeM0PLBg7cO5tx55A0CTsWCNa4VvSnrhx5qqoPPnVabUnLynEZFyW+K60V3LH3FU6a/94N0oP2NGL0x1ef5nUpVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+NeagilbjKs1rhqXxHyQ+akJgI8tOZD3b/EhZi4WQE=;
 b=uDuzGfZxJ0XZKyy+bsywPWtS+0orz6YCJ42TMfjDUFiiyIdJVzshucOh0XOfY5vdyMoOuljOwD022eJJPbQvCFkrIuGNjzpP98hiZZAumwhKfRYC7YZ983pqds6queVTo0ot8gK+hRJBRwa8rr+nDA13d0MA34xD9K28yVqIrAVfiyA4cUyyoa53s/v5jSGqNWw6WYlch2UgXQ6hjNFntZfhs/1BF+UcTsG/l7/NjOWd3ZgskeHWB0upa4qCtnkPtU/VfECbDzfVZrHFop1Rb3Hv5Ag+B54aiNLIxRhh4ETW6wsH/tYEGonvFqihHHq8/5Af5ys+kz8npWiPUglbhA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+NeagilbjKs1rhqXxHyQ+akJgI8tOZD3b/EhZi4WQE=;
 b=XdKZZ1AR0wHGb0mgClfr83m+qwSHl5Gg3aiWzwuoEFqRHw7vPCAA0vMCDLjWzvLYEY5kCM/crMCCOPFBKfl8IMcg9QHyLT4EHuCoiKwHrjAY3ZratGqs0Mxb3Q+/JFmCcHJXfSuxcb3e/YVeh+u6V009t7qbe562oc4jZLBGm5o=
Received: from CWLP265CA0353.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5a::29)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 15:58:44 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:401:5a:cafe::64) by CWLP265CA0353.outlook.office365.com
 (2603:10a6:401:5a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Fri,
 16 May 2025 15:58:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27
 via Frontend Transport; Fri, 16 May 2025 15:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vk8MfX0jk8pZSnCgDJbzIoEVevc7eVwWaYIw1d/+qUF7C+dRsVgZN1N5imBH2pAf95ZEPgER1Uaxf/LqKIKOjXyBVGD7WkmxNJpWKH0eZqtKHsNyNPwMEoDmM0W6nQ6uBK6CMUDwlOotmdfOjzuxq9J2gtmMln4wP0k+xJN9KhqfCQWP+fpJh/DzLZ297Hj++3fBYori9qn1faIcFqHfslOAFE47yJF62n3DtMHicahz88rIN4JH4f+0hLm10QAMgfg5l/x7Qxbuu0Skt6kE7OKX1fnS0wZuTMY13q74ajDEcKVlTKHXTsriWK3E5sdxJYiACVkmQGDMMoKb5Y2ODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+NeagilbjKs1rhqXxHyQ+akJgI8tOZD3b/EhZi4WQE=;
 b=Aj50EvEwEMUHbenPrnBI9X0uxyz/BeMhHwC5o8ZJFUcO5pjU8gPCbS1FM42HtEzPaUga7uw0RtEgO1hR7fnOLgvdpGR5pkHC7Xbj0ZD2eMQsAzPVBvfgOGqFYM2gbQ1Yzmq3JRoyTw3JXb/1KMkkcaHKi3aO3RoRhakBDUAXQd2TLAbKi+ZyDzV/tDbdM8fdPSi71im/9UnAGOvSYu8ZIGm+Ep2hIxKIfEcBfYHwxim0apyy2UXu8HkwHAJ71WaMroKI4/CkB+qWL3Meae91lJqLcvHW5xF3bMwFoNXyWC7/3Hp+14AernMLyGvYG65hUCit+kBPme554aNwnndXeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+NeagilbjKs1rhqXxHyQ+akJgI8tOZD3b/EhZi4WQE=;
 b=XdKZZ1AR0wHGb0mgClfr83m+qwSHl5Gg3aiWzwuoEFqRHw7vPCAA0vMCDLjWzvLYEY5kCM/crMCCOPFBKfl8IMcg9QHyLT4EHuCoiKwHrjAY3ZratGqs0Mxb3Q+/JFmCcHJXfSuxcb3e/YVeh+u6V009t7qbe562oc4jZLBGm5o=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by DU4PR08MB11174.eurprd08.prod.outlook.com (2603:10a6:10:577::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Fri, 16 May
 2025 15:58:11 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:11 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Date: Fri, 16 May 2025 16:49:38 +0100
Message-Id: <0319137f966f2dbffc54e51f7a2a3cbac837507b.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|DU4PR08MB11174:EE_|AMS0EPF000001AE:EE_|DB9PR08MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 55526825-729c-4455-eb00-08dd9492886b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?P1iIWJmhZL3fGX/HhLTZhXx3BjG5CZvd7JlIZtvdaT+aCMQQ08/W2BPPFCtp?=
 =?us-ascii?Q?pdJdVu54Zfz/BZzCVCUPFu96G9jqhwH04Rx3kEmzerD8b6R0V4IWxZOkfrkx?=
 =?us-ascii?Q?1cDkXEpBi9tZnuJFbiV9qQQCrJ5eZDv4LOg3UKVzg2fMa5utjysI+U+C1w/7?=
 =?us-ascii?Q?q3l/G6l2pxo7jvgaLBu1P6cNAzGAOwHHfybUl7KHjl6DSMg15hauNOHg21c+?=
 =?us-ascii?Q?imhiJBKDrtIqbF+DO5+k5VlqTX3vZ1wA8AvF9kNKU3Z6TZLcVQwbc2H2EyeT?=
 =?us-ascii?Q?T5RfcCb0psIRhU7QNq2/RFb/1/VFWtrL0HJ5zKFy7X01VKKDNTJ51wcHjNfs?=
 =?us-ascii?Q?C/L48wNMNZ9yETcOmokbikzA9SNLCTDjXyCo4iNvfWHeoRp6uUe6+LOCuqWd?=
 =?us-ascii?Q?bOfdDQ7cj4dlEACpUFvWQttPWu4cmjPQXZ1rZaAh5POTHHMVqWxgvw7oHNPq?=
 =?us-ascii?Q?jwXCECgv1e4nWdhcgvqWK+91aBUY1OShGDn2YWWq2aHSguQUwUTt4vR9X5PI?=
 =?us-ascii?Q?yZxwqdhCdssbAwodi9pFQ58RIfg/DDv8oOu923ih153FFzwvRDpmVlCi0Ya8?=
 =?us-ascii?Q?b8TSfqDW7N3m13rQQm/bcn/Ief/hi18ZsFCCyyvUVe2vqVPRsCgTFeiG+evS?=
 =?us-ascii?Q?dsCKfiZomtya/Blb5RDV/W9Y9YNubrAsv0ugi3mhGU0Be0VuEmBtmp4bx1pK?=
 =?us-ascii?Q?+NQrusKcjqQMrl042dMxExuVBQPgR3mqj53EuqHXvZd6eXAgvsv5SEohonkV?=
 =?us-ascii?Q?AjMABdGmnkg3XvcbVUHnl0tGOhlMHr2QB4alpdgbJ5qvFNapyBtPNZKb+UOd?=
 =?us-ascii?Q?Ri4lgX5S0M0Ajx8vZ89b5KxV31VDrxNqOTSjDAD8MRPoot+/yUADb1lxJzcS?=
 =?us-ascii?Q?6smaaXm7IQ+AjUf/bEdwVDpP+xA58ZWNwyuzJ3A1W5tqUBj8NioK9Wl9gIt/?=
 =?us-ascii?Q?6H8tJGHcW8I5hz6a1riCn9segM+aiWelgRfsP5+HYcMT+LJFWnROy664N9wQ?=
 =?us-ascii?Q?o8ltzW2lBrzJcA09Fp4ZgTKXt1v/JacduyJ7qrFIlDPqlLJUJAiDj3kfi8b1?=
 =?us-ascii?Q?RWcIkdJ5t+9mZXaciM4KfxBdxXJZhF4DRcoJz81s1p3hjiG55pYXAnDsQ76X?=
 =?us-ascii?Q?ySCenBb+W+N3wzqTowFpdrZXm4APQE5N40vZpzWN2GjwQRqTj+7lPpL8LmKI?=
 =?us-ascii?Q?7CfYMaWIl76zQvPzN3Djitr30U1HrJ7XU40K0DCsNKrCU9EFeH9g8DAFvPYV?=
 =?us-ascii?Q?JNkfErIrw4lHQvObfYW3nb4UQekCs1K+M+xBeV2AudZeSUE2lTef0o+5R9iZ?=
 =?us-ascii?Q?Dd2uNvLCgf7rLmev6/9TgKaH4BwbwcJMplKBKmIGvURt6Gi0I9pXlSlYPxpS?=
 =?us-ascii?Q?ijMhWpv09lN5gcnr6cLrZSjbR97okC2ZoXZuQaF7TjSQTtPUA6dw6mFv9ETS?=
 =?us-ascii?Q?z9darGwtft+Ln8F/igarUzcoq/3j4ovp2qr8+Tk9GBlvLk5cLsUnYA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8c229703-0f28-4587-82b0-08dd94927566
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y4Wk4MXNKZPNiOTehryn4zSru55hEO5JeU+Hiebh5neye8mg2ZyPRX3VYEEq?=
 =?us-ascii?Q?OPVeFJoZvKXRw8Zd5zfb6LKNb8UrIS8TZ0U+Wey0yhYyBvqZCS6Yzvnr/1qx?=
 =?us-ascii?Q?n+76/nKZ4F4lKh0bkPHjA4GLh8um3AA4U+yf75LvjwGrFtBg10/De5d+p5hE?=
 =?us-ascii?Q?SYMIYbePsSE4TbcxTEqiN9XzHqE64MabY453/fujor8EZx/z7QYR2AgFv6YG?=
 =?us-ascii?Q?pO3Xr2C7lQ6ajc6hcPkx1C7mFF+jWC24D2IwL4fVFF4KpTJuixawr1P/yewl?=
 =?us-ascii?Q?CelHHAMFfRkiUuvz61MxT90brVhyBtMKhSIHxu7CfEEOxlraYZbotdLoM52V?=
 =?us-ascii?Q?0WWNL5wI5A1cHcUYIPFUC77jbxkmfu6zNzbLLQwacCgo1KBwAhpo00ys6QAt?=
 =?us-ascii?Q?Ufg1D0ICoBxzCaauZYvHwr3rfOzhmthEN84ttumvwtQuXIvnF54J55aB30Q1?=
 =?us-ascii?Q?4ntNj1DhsfcF/XPuc5zxoUoReotW0+q50vVK1mfEHv95DzaE/rB+RvbbFT/Y?=
 =?us-ascii?Q?i58kT6P34ZCim1tqqhZDXF2X6wXjxh07G8/5tpsGlDBA9G1L4p6eDw147u1l?=
 =?us-ascii?Q?9ATnoIgYkugx/hybbYWxvJlR1JoLMnsMWUuv7OroO620C9byTkHYUpDlpLhD?=
 =?us-ascii?Q?iYraVuO/6SvK3VQWCcbj8lYT+g8sC6+vWpWF1eUEOV01GWzOlfqGuYljQHjC?=
 =?us-ascii?Q?ApTW4bDafHfw2eYVKFxv2lQNJWuSRvjg3ZO4cdJxrtrDNjzKloJzegBROCpo?=
 =?us-ascii?Q?I67qET6vmnmvxKOmRm7kxIRtmHxOyS6RsqNMKZz0h2PmtJXeL5sl2xj4eAHA?=
 =?us-ascii?Q?BsB1a3y3AgUuD5eptA4y2cF1vf+lLFnMnIGlGwhLXQlLk9vW8teMPm0Txe5X?=
 =?us-ascii?Q?wgPOaZAZotEfOfzM15FutG0c8DbEOryOGB3E46OLRixjY2yBhv/GA4fcFzMj?=
 =?us-ascii?Q?xtWfDinY1hLp02+9AWdg+WiwCICia0RzMhvAKcPVO6v/BXL+YI7I0FY/M4Xt?=
 =?us-ascii?Q?gsxeCdh72UY233DNfRBRXh8Zc3DZ3isB+cnPGWHACXwuB1t05r9v+iAeTwJe?=
 =?us-ascii?Q?KJ23HL6KW9TzUwOTuOffNijr2kI+KC68Gg++oKT47TJ6Qru4SzEHcKVqbgp5?=
 =?us-ascii?Q?oaVfKZVIm/BLrB999Otf49ZMc+qPb3u1sAo5sNJV5pZ19BugIRFTve5P0vSw?=
 =?us-ascii?Q?x15uNwt6Kd9m9Wyv3Wy2C2tSOgxJpf/+pWQDYKRUYaRx5dsVUBLMEjicO47/?=
 =?us-ascii?Q?f0uqx0xzaCGNFNUPXqo5E9RH3Lasosvwnbhd421NNJ2G4HLWNwQmfj7XywN3?=
 =?us-ascii?Q?eSu0QExNZTSswaIt9Up4DA26VNyZ3CBSDCJbOPFkrfuB7oTbSd9BrkTTT8oA?=
 =?us-ascii?Q?EKIZVmBHu9KMFfv5gfnfxm8lp8xtnHkOFxYHdqUIxTEcP+D39igZ7AZ2e795?=
 =?us-ascii?Q?DjdLxHgtzlYC3cyseJ0fiC7nNb5oJyQhoCph5HcBnqW7+mzmuKoYT8XPm4I5?=
 =?us-ascii?Q?do1PHES4t1W+ED3FVJ6FwC+PlmQCXO1tFyMsRRgw245RWpVtH3Znjmnvbw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:43.0351 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55526825-729c-4455-eb00-08dd9492886b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
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

To allow for combining the requests from multiple userspace clients, an
intermediary layer between the HW/FW interfaces and userspace is
created, containing the information for the counter requests and
tracking of insert and extract indices. Each session starts inactive and
must be explicitly activated via PERF_CONTROL.START, and explicitly
stopped via PERF_CONTROL.STOP. Userspace identifies a single client with
its session ID and the panthor file it is associated with.

The SAMPLE and STOP commands both produce a single sample when called,
and these samples can be disambiguated via the opaque user data field
passed in the PERF_CONTROL uAPI. If this functionality is not desired,
these fields can be kept as zero, as the kernel copies this value into
the corresponding sample without attempting to interpret it.

Currently, only manual sampling sessions are supported, providing
samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
session is allowed at a time. Multiple sessions and periodic sampling
will be enabled in following patches.

No protection is provided against the 32-bit hardware counter overflows,
so for the moment it is up to userspace to ensure that the counters are
sampled at a reasonable frequency.

The counter set enum is added to the uapi to clarify the restrictions on
calling the interface.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_drv.c    |   1 +
 drivers/gpu/drm/panthor/panthor_perf.c   | 694 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h   |  16 +
 4 files changed, 713 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 818c4d96d448..3fa0882fe81b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -225,6 +225,9 @@ struct panthor_file {
 	/** @ptdev: Device attached to this file. */
 	struct panthor_device *ptdev;
 
+	/** @drm_file: Corresponding drm_file */
+	struct drm_file *drm_file;
+
 	/** @vms: VM pool attached to this file. */
 	struct panthor_vm_pool *vms;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 9d2b716cca45..4c1381320859 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1356,6 +1356,7 @@ panthor_open(struct drm_device *ddev, struct drm_file *file)
 	}
 
 	pfile->ptdev = ptdev;
+	pfile->drm_file = file;
 
 	ret = panthor_vm_pool_create(pfile);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 9365ce9fed04..15fa533731f3 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -2,13 +2,177 @@
 /* Copyright 2023 Collabora Ltd */
 /* Copyright 2025 Arm ltd. */
 
-#include <linux/bitops.h>
+#include <drm/drm_gem.h>
 #include <drm/panthor_drm.h>
+#include <linux/bitops.h>
+#include <linux/circ_buf.h>
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_perf.h"
 
+/**
+ * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
+ *                        to the maximum number of counters available for selection on the newest
+ *                        Mali GPUs (128 as of the Mali-Gx15).
+ */
+#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
+
+enum panthor_perf_session_state {
+	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
+	PANTHOR_PERF_SESSION_ACTIVE = 0,
+
+	/**
+	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
+	 *                                 counters during the last sampling period. This flag
+	 *                                 gets propagated as part of samples emitted for this
+	 *                                 session, to ensure the userspace client can gracefully
+	 *                                 handle this data corruption.
+	 */
+	PANTHOR_PERF_SESSION_OVERFLOW,
+
+	/* Must be last */
+	PANTHOR_PERF_SESSION_MAX,
+};
+
+struct panthor_perf_enable_masks {
+	/**
+	 * @mask: Array of bitmasks indicating the counters userspace requested, where
+	 *        one bit represents a single counter. Used to build the firmware configuration
+	 *        and ensure that userspace clients obtain only the counters they requested.
+	 */
+	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
+};
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+/**
+ * enum session_sample_type - Enum of the types of samples a session can request.
+ */
+enum session_sample_type {
+	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
+	SAMPLE_TYPE_NONE,
+
+	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
+	SAMPLE_TYPE_INITIAL,
+
+	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
+	SAMPLE_TYPE_REGULAR,
+};
+
+struct panthor_perf_session {
+	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
+
+	/**
+	 * @pending_sample_request: The type of sample request that is currently pending:
+	 *                          - when a sample is not requested, the data should be accumulated
+	 *                            into the next slot of its ring buffer, but the extract index
+	 *                            should not be updated, and the user-space session must
+	 *                            not be signaled.
+	 *                          - when an initial sample is requested, the data must not be
+	 *                            emitted into the target ring buffer and the userspace client
+	 *                            must not be notified.
+	 *                          - when a regular sample is requested, the data must be emitted
+	 *                            into the target ring buffer, and the userspace client must
+	 *                            be signalled.
+	 */
+	enum session_sample_type pending_sample_request;
+
+	/**
+	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
+	 *                    simplicity, the current implementation exposes the same structure
+	 *                    as provided by firmware, after annotating the sample and the blocks,
+	 *                    and zero-extending the counters themselves (to account for in-kernel
+	 *                    accumulation).
+	 *
+	 *                    This may also allow further memory-optimizations of compressing the
+	 *                    sample to provide only requested blocks, if deemed to be worth the
+	 *                    additional complexity.
+	 */
+	size_t user_sample_size;
+
+	/**
+	 * @accum_idx: The last insert index indicates whether the current sample
+	 *                   needs zeroing before accumulation. This is used to disambiguate
+	 *                   between accumulating into an intermediate slot in the user ring buffer
+	 *                   and zero-ing the buffer before copying data over.
+	 */
+	u32 accum_idx;
+
+	/**
+	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
+	 *                  userspace will be responsible for requesting samples.
+	 */
+	u64 sample_freq_ns;
+
+	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
+	u64 sample_start_ns;
+
+	/**
+	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
+	 *             manual sampling sessions only) and when stopping a session. This handle
+	 *             allows the disambiguation of a sample in the ringbuffer.
+	 */
+	u64 user_data;
+
+	/**
+	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
+	 *           being emitted.
+	 */
+	struct eventfd_ctx *eventfd;
+
+	/**
+	 * @enabled_counters: This session's requested counters. Note that these cannot change
+	 *                    for the lifetime of the session.
+	 */
+	struct panthor_perf_enable_masks *enabled_counters;
+
+	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
+	size_t ringbuf_slots;
+
+	/** @ring_buf: BO for the userspace ringbuffer. */
+	struct drm_gem_object *ring_buf;
+
+	/**
+	 * @control_buf: BO for the insert and extract indices.
+	 */
+	struct drm_gem_object *control_buf;
+
+	/** @control: The mapped insert and extract indices. */
+	struct drm_panthor_perf_ringbuf_control *control;
+
+	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
+	u8 *samples;
+
+	/**
+	 * @pending: The list node used by the sampler to track the sessions that have not yet
+	 *           received a sample.
+	 */
+	struct list_head pending;
+
+	/**
+	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
+	 */
+	struct list_head sessions;
+
+	/**
+	 * @pfile: The panthor file which was used to create a session, used for the postclose
+	 *         handling and to prevent a misconfigured userspace from closing unrelated
+	 *         sessions.
+	 */
+	struct panthor_file *pfile;
+
+	/**
+	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
+	 *       the lifetime of the session must extend at least until the sample is exposed to
+	 *       userspace.
+	 */
+	struct kref ref;
+};
+
 struct panthor_perf {
 	/** @next_session: The ID of the next session. */
 	u32 next_session;
@@ -72,6 +236,122 @@ static void panthor_perf_info_init(struct panthor_device *ptdev)
 	perf_info->sample_size = session_get_user_sample_size(perf_info);
 }
 
+static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
+		*setup_args)
+{
+	struct panthor_perf_enable_masks *em = kmalloc(sizeof(*em), GFP_KERNEL);
+	if (IS_ERR_OR_NULL(em))
+		return em;
+
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
+			setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
+			setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
+			setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
+			setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
+			setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
+
+	return em;
+}
+
+static u64 session_read_extract_idx(struct panthor_perf_session *session)
+{
+	const u64 slots = session->ringbuf_slots;
+
+	/* Userspace will update their own extract index to indicate that a sample is consumed
+	 * from the ringbuffer, and we must ensure we read the latest value.
+	 */
+	return smp_load_acquire(&session->control->extract_idx) % slots;
+}
+
+static u64 session_read_insert_idx(struct panthor_perf_session *session)
+{
+	const u64 slots = session->ringbuf_slots;
+
+	/*
+	 * Userspace is able to write to the insert index, since it is mapped
+	 * on the same page as the extract index. This should not happen
+	 * in regular operation.
+	 */
+	return smp_load_acquire(&session->control->insert_idx) % slots;
+}
+
+static void session_get(struct panthor_perf_session *session)
+{
+	kref_get(&session->ref);
+}
+
+static void session_free(struct kref *ref)
+{
+	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
+
+	if (session->samples && session->ring_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
+
+		drm_gem_vunmap_unlocked(session->ring_buf, &map);
+		drm_gem_object_put(session->ring_buf);
+	}
+
+	if (session->control && session->control_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
+
+		drm_gem_vunmap_unlocked(session->control_buf, &map);
+		drm_gem_object_put(session->control_buf);
+	}
+
+	eventfd_ctx_put(session->eventfd);
+
+	kfree(session);
+}
+
+static void session_put(struct panthor_perf_session *session)
+{
+	kref_put(&session->ref, session_free);
+}
+
+/**
+ * session_find - Find a session associated with the given session ID and
+ *                panthor_file.
+ * @pfile: Panthor file.
+ * @perf: Panthor perf.
+ * @sid: Session ID.
+ *
+ * The reference count of a valid session is increased to ensure it does not disappear
+ * in the window between the XA lock being dropped and the internal session functions
+ * being called.
+ *
+ * Return: valid session pointer or an ERR_PTR.
+ */
+static struct panthor_perf_session *session_find(struct panthor_file *pfile,
+		struct panthor_perf *perf, u32 sid)
+{
+	struct panthor_perf_session *session;
+
+	if (!perf)
+		return ERR_PTR(-EINVAL);
+
+	xa_lock(&perf->sessions);
+	session = xa_load(&perf->sessions, sid);
+
+	if (!session || xa_is_err(session)) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EBADF);
+	}
+
+	if (session->pfile != pfile) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EINVAL);
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	return session;
+}
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
@@ -109,6 +389,412 @@ int panthor_perf_init(struct panthor_device *ptdev)
 	return ret;
 }
 
+static int session_validate_set(u8 set)
+{
+	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
+		return -EINVAL;
+
+	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
+		return 0;
+
+	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
+		return capable(CAP_PERFMON) ? 0 : -EACCES;
+
+	return -EINVAL;
+}
+
+/**
+ * panthor_perf_session_setup - Create a user-visible session.
+ *
+ * @ptdev: Handle to the panthor device.
+ * @perf: Handle to the perf control structure.
+ * @setup_args: Setup arguments passed in via ioctl.
+ * @pfile: Panthor file associated with the request.
+ *
+ * Creates a new session associated with the session ID returned. When initialized, the
+ * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
+ *
+ * Return: non-negative session identifier on success or negative error code on failure.
+ */
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile)
+{
+	struct panthor_perf_session *session;
+	struct drm_gem_object *ringbuffer;
+	struct drm_gem_object *control;
+	const size_t slots = setup_args->sample_slots;
+	struct panthor_perf_enable_masks *em;
+	struct iosys_map rb_map, ctrl_map;
+	size_t user_sample_size;
+	int session_id;
+	int ret;
+
+	ret = session_validate_set(setup_args->block_set);
+	if (ret) {
+		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
+				setup_args->block_set);
+		return ret;
+	}
+
+	session = kzalloc(sizeof(*session), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(session))
+		return -ENOMEM;
+
+	ringbuffer = drm_gem_object_lookup(pfile->drm_file, setup_args->ringbuf_handle);
+	if (!ringbuffer) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
+		ret = -EINVAL;
+		goto cleanup_session;
+	}
+
+	control = drm_gem_object_lookup(pfile->drm_file, setup_args->control_handle);
+	if (!control) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
+		ret = -EINVAL;
+		goto cleanup_ringbuf;
+	}
+
+	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
+
+	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
+		drm_err(&ptdev->base, "Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
+				ringbuffer->size, PFN_ALIGN(user_sample_size));
+		ret = -ENOMEM;
+		goto cleanup_control;
+	}
+
+	ret = drm_gem_vmap_unlocked(ringbuffer, &rb_map);
+	if (ret)
+		goto cleanup_control;
+
+	ret = drm_gem_vmap_unlocked(control, &ctrl_map);
+	if (ret)
+		goto cleanup_ring_map;
+
+	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
+	if (IS_ERR(session->eventfd)) {
+		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
+		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
+		goto cleanup_control_map;
+	}
+
+	em = panthor_perf_create_em(setup_args);
+	if (IS_ERR_OR_NULL(em)) {
+		ret = -ENOMEM;
+		goto cleanup_eventfd;
+	}
+
+	INIT_LIST_HEAD(&session->sessions);
+	INIT_LIST_HEAD(&session->pending);
+
+	session->control = ctrl_map.vaddr;
+	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
+
+	session->samples = rb_map.vaddr;
+
+	/* TODO This will need validation when we support periodic sampling sessions */
+	if (setup_args->sample_freq_ns) {
+		ret = -EOPNOTSUPP;
+		goto cleanup_em;
+	}
+
+	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
+			&perf->next_session, GFP_KERNEL);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "System session limit exceeded.\n");
+		ret = -EBUSY;
+		goto cleanup_em;
+	}
+
+	kref_init(&session->ref);
+	session->enabled_counters = em;
+
+	session->sample_freq_ns = setup_args->sample_freq_ns;
+	session->user_sample_size = user_sample_size;
+	session->ring_buf = ringbuffer;
+	session->ringbuf_slots = slots;
+	session->control_buf = control;
+	session->pfile = pfile;
+	session->accum_idx = U32_MAX;
+
+	return session_id;
+
+cleanup_em:
+	kfree(em);
+
+cleanup_eventfd:
+	eventfd_ctx_put(session->eventfd);
+
+cleanup_control_map:
+	drm_gem_vunmap_unlocked(control, &ctrl_map);
+
+cleanup_ring_map:
+	drm_gem_vunmap_unlocked(ringbuffer, &rb_map);
+
+cleanup_control:
+	drm_gem_object_put(control);
+
+cleanup_ringbuf:
+	drm_gem_object_put(ringbuffer);
+
+cleanup_session:
+	kfree(session);
+
+	return ret;
+}
+
+static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	const u64 extract_idx = session_read_extract_idx(session);
+	const u64 insert_idx = session_read_insert_idx(session);
+
+	/* Must have at least one slot remaining in the ringbuffer to sample. */
+	if (WARN_ON_ONCE(!CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots)))
+		return -EBUSY;
+
+	session->user_data = user_data;
+
+	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/*
+	 * For manual sampling sessions, a start command does not correspond to a sample,
+	 * and so the user data gets discarded.
+	 */
+	if (session->sample_freq_ns)
+		session->user_data = user_data;
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
+		u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	const u64 extract_idx = session_read_extract_idx(session);
+	const u64 insert_idx = session_read_insert_idx(session);
+
+	/* Manual sampling for periodic sessions is forbidden. */
+	if (session->sample_freq_ns)
+		return -EINVAL;
+
+	/*
+	 * Must have at least two slots remaining in the ringbuffer to sample: one for
+	 * the current sample, and one for a stop sample, since a stop command should
+	 * always be acknowledged by taking a final sample and stopping the session.
+	 */
+	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
+		return -EBUSY;
+
+	session->sample_start_ns = ktime_get_raw_ns();
+	session->user_data = user_data;
+
+	return 0;
+}
+
+static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	session_put(session);
+
+	return 0;
+}
+
+static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return -EINVAL;
+
+	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
+		return -EBUSY;
+
+	return session_destroy(perf, session);
+}
+
+/**
+ * panthor_perf_session_teardown - Teardown the session associated with the @sid.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the perf control structure.
+ * @sid: Session identifier.
+ *
+ * Destroys a stopped session where the last sample has been explicitly consumed
+ * or discarded. Active sessions will be ignored.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
+{
+	int err;
+	struct panthor_perf_session *session;
+
+	xa_lock(&perf->sessions);
+	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
+
+	if (xa_is_err(session)) {
+		err = xa_err(session);
+		goto restore;
+	}
+
+	if (session->pfile != pfile) {
+		err = -EINVAL;
+		goto restore;
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	err = session_teardown(perf, session);
+
+	session_put(session);
+
+	return err;
+
+restore:
+	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
+	xa_unlock(&perf->sessions);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_start - Start sampling on a stopped session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as stopped when it is created or when it is explicitly stopped after being
+ * started. Starting an active session is treated as a no-op.
+ *
+ * The @user_data parameter will be associated with all subsequent samples for a periodic
+ * sampling session and will be ignored for manual sampling ones in favor of the user data
+ * passed in the PERF_CONTROL.SAMPLE ioctl call.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_start(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_stop - Stop sampling on an active session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
+ * ioctl. Stopping a stopped session is treated as a no-op.
+ *
+ * To ensure data is not lost when sampling is stopping, there must always be at least one slot
+ * available for the final automatic sample, and the stop command will be rejected if there is not.
+ *
+ * The @user_data will always be associated with the final sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_stop(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_sample - Request a sample on a manual sampling session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * Only an active manual sampler is permitted to request samples directly. Failing to meet either
+ * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
+ * with a full ringbuffer will see the request being rejected.
+ *
+ * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_sample(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
+ * @perf: Handle to the panthor perf control structure.
+ * @pfile: The file being closed.
+ *
+ * Must be called when the corresponding userspace process is destroyed and cannot close its
+ * own sessions. As such, we offer no guarantees about data delivery.
+ */
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
+{
+	unsigned long sid;
+	struct panthor_perf_session *session;
+
+	if (!pfile || !perf)
+		return;
+
+	xa_for_each(&perf->sessions, sid, session)
+	{
+		if (session->pfile == pfile) {
+			session_destroy(perf, session);
+			xa_erase(&perf->sessions, sid);
+		}
+	}
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -124,8 +810,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 		return;
 
 	if (!xa_empty(&perf->sessions)) {
+		unsigned long sid;
+		struct panthor_perf_session *session;
+
 		drm_err(&ptdev->base,
 			"Performance counter sessions active when unplugging the driver!");
+
+		xa_for_each(&perf->sessions, sid, session)
+			session_destroy(perf, session);
 	}
 
 	xa_destroy(&perf->sessions);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index e4805727b9e7..89d61cd1f017 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -7,10 +7,26 @@
 
 #include <linux/types.h>
 
+struct drm_panthor_perf_cmd_setup;
 struct panthor_device;
+struct panthor_file;
+struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
+int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
+		struct drm_panthor_perf_cmd_setup *setup_args,
+		struct panthor_file *pfile);
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid);
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+		u32 sid, u64 user_data);
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

