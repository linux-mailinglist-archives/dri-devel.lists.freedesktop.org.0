Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0932A134AF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 09:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12FE10E8DA;
	Thu, 16 Jan 2025 08:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="Amqr8J6Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::715])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61D10E5DB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 11:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IpcECYSt0N3GpMs3ntxxtGPl0qQ895wr84UIxSMzDquKyCk0eDuHVDAEdd6yLYSj8dWutA2g55EU+7dMQ5g3ntE1AlyoNfRtNKnQXoRdNcM5rfD+6sb15gHXk+ZU6RLKLdz76jG/ssUb2SKTjp2eQjGXQY8SKTjKOYzfjPbHhbqmzmc/H2ULvfVk4Rjjxn4FTdknqpEO5NEpF9E/QuCn7BCTE/YxDK+5eEdZfD+lPgbsV1IBTctCv7fu4JJoV4zDYu/4hYJBNtp0kxYncIY+91yqYtMC7aZn2Box5jOhdZebgmmuWL83gT7BAndjkLc6XeF3GGD41JNDuJ5R8p1eeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n61Abt+dQWsi4lbFkJxqx7kuhoeTzNX7bfRwzVOekXg=;
 b=eEd64HqbEUiEW/A/f5nvxy7ZrkdbNc5VpmFwfCHR5xGui5KUUN439AatxEdzP6VrBEchv/wuh4cNIvwXsGohh2rn8MiSfDbUy0+VFNXziqWHxMHzMBVsOeTjY+/WsKNkFw5sTmvt88VGzmpMfBfrcS7X9VKx9zHeua72EvVlr2iLMQIz224OMN7TW9snH05hElyAx/5nn66jTRlRnCY+cZNxaH1jHgi+TYDlJaRMrI+vS/kTGIuk/hpad5da6odAoVmxYYiBq3d691eeE6T5ijkxCaLfuqJaKcYHpok+AuBR1ZmFa/5rL3wt3F6Pur0UTDLjrrLHh1YIxuv8mnfX9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n61Abt+dQWsi4lbFkJxqx7kuhoeTzNX7bfRwzVOekXg=;
 b=Amqr8J6YVGOyD9+M2S2NmdH5SFjNG0aNWrGZLEbj28TjsukzMBbQkmKGII6hTZObZTM9lPazi1lg9CHf4LyZPRRaaubgb0a8hNxGg/hersIPH/L3G8/fKvBNDkeHt6QbYPx+BaR02mLLkgcb0XEpSe7km/Ldvba7lBD1wFmKd2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by CH0PR08MB6842.namprd08.prod.outlook.com (2603:10b6:610:c8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 11:01:51 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%3]) with mapi id 15.20.8335.015; Wed, 15 Jan 2025
 11:01:50 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/ssd130x: some small ssd132x fixes
Date: Wed, 15 Jan 2025 11:01:36 +0000
Message-ID: <20250115110139.1672488-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.48.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0215.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::22) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|CH0PR08MB6842:EE_
X-MS-Office365-Filtering-Correlation-Id: b4fd4a49-f2b5-4dff-2e35-08dd35540349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?A4JpqOvKrdQmm+pc/oYLK+QAb4guhI0+HpaIxxdPAA5UvMV+7/X0SACLdzQF?=
 =?us-ascii?Q?E1OhIwbUEcUgBuapXkyWY3kIpTj/8SAb4ivSyyHZe4nkc9ANydtSXJy2SJxn?=
 =?us-ascii?Q?pe5ojZs4Gnnwj2+1hxUywtlaxl853cBQQh3XhhtGz6iGpJV34nkq7Yr481Fl?=
 =?us-ascii?Q?mMo8WYeo/5CGFiK1d0vrgrGcrc4mMY2CT0Dim8vt3E+K0Y2o5DjB7Iv9EByv?=
 =?us-ascii?Q?10HVJRIQIi7QnjteJCXbYm5xYZxr6Nl8VfpqcsChyQD2ojVvrn0+tHQycE9d?=
 =?us-ascii?Q?oXo2HQ5IdeWYpD1hYOCduQYzHYLq+v0jxHA9SiwNC9+8nCJyLr8lySuokJ20?=
 =?us-ascii?Q?mSq6tLYRnYja1Vtbhkz9S4czzNC9i7JKFqJ6RXpmLibx6pjAnUcufQhtoQsK?=
 =?us-ascii?Q?+3sOSFufSJPvqQkH7U5cwBMJMweVH7ZMuW+iW7130Kq0cPjXxn6KulFszB4Q?=
 =?us-ascii?Q?mmhlc89XQlQuWvj5endbZDbCWdCBCGpcO6Nsefb/5er/wTG/H1z8FbY7UdQs?=
 =?us-ascii?Q?fitsm7fYO2Y04pcg7bhZju7ym/iCl7wTAlN1PX5V8d8hubkW3eFIKdpX/ynJ?=
 =?us-ascii?Q?VxiDyRPbOOT2mVFmP2hR+I6vc6LkPEz13v3UmFeMmjjvJHQb5RB7G07asM1l?=
 =?us-ascii?Q?MGj3U7fqmexXD0k1ryPkgLdJHRGfbzmczIYyzK+37t5KUpJ4SM7OcehZVwNL?=
 =?us-ascii?Q?0vynZSYOJFOphUZZUTOZkn+7h//UDE5o+0pxu8LDRZBtAEWEFKfJibpTXJrQ?=
 =?us-ascii?Q?k/9v872iUXt5FmTMga1yvEGNLUttWl9eaWrl2Qoq7oCExWAh4nEu2Yp1rSNd?=
 =?us-ascii?Q?hAd3IR67SC5qxYArjcy/3ovlxPxLs07hoKf+/yKg8isykBzNCiTehPKYXdl6?=
 =?us-ascii?Q?Qkz3MnL961tnhG93CMJyv3nzMSScQ1W4sTSz6DJWPJIRaHrBLMxnLCweYqGi?=
 =?us-ascii?Q?aDhs9Us9ZyTryBZpgCIcMb3qScdXQm/wx1OoPqyUwt3W06UJtpEdABfQ5VoK?=
 =?us-ascii?Q?A5NEpZO5ZFxtZpfXfTmy8W1YxRnxgsseKoYsyU+J5lKCSa1UTTWX6dhz9xOQ?=
 =?us-ascii?Q?5ugpgtS64YExd5jAUhaZT8olXVJyChci9gCvIvW96MlPoLX0iCkPetC586uF?=
 =?us-ascii?Q?vhSv8hcD8VwJ+DgNz36lrVzixvGqkLF0c62LmGuil3HQrg3E9lgMnAYhL3E8?=
 =?us-ascii?Q?gMfSWBk7FbEzIxBicwGXdYw6k0XxtSOItg8qIJGYpt/ybh89xABYni3PY4ON?=
 =?us-ascii?Q?ZmiXhxQB+IhSS4424WZXZdWJDmQ6PPVM8goL7xGUjANCc1US6lrf02N8zpfF?=
 =?us-ascii?Q?m0YprjvZjgNr5pVGAiXC9TlMhW9PBwPnaQOhq6Flj/McfY5LJfjhBg1Gyh15?=
 =?us-ascii?Q?heBhHRLpVaLaLlIFvhoAVKONu7ycmgLi5g7Vt4QZ25SxDVNu4ctEvysxYvBb?=
 =?us-ascii?Q?2LAVhZ9a6LSce3Abdx//kh+ckYGPdSay?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rq+lag9iOZWFx+UHwxXUL5DWQ/tk7IAiSUwzlfZwNhoDnYh6YXX2Oot9cTyb?=
 =?us-ascii?Q?S5lrsBwGzX0MzUurv3Iy+x4KOM+jlt+tl3KRbe40KhStzqsffY/dw23nNVEW?=
 =?us-ascii?Q?MfzL7yYTcbIoMQDAgtzGdQr9hazYkS91tTiM42MvkJldEzfaLWw25ZdvhbYK?=
 =?us-ascii?Q?Brt0YMc3TtLBKC2lKiKph4Y6lJJy1pJ8bAAdpnpBlAIXB5FEw49I4jRYpdZb?=
 =?us-ascii?Q?o0t1UnU18kylsy5ZgT0hDdzZjSZVyYByaGNXfY3FhOgvgZeYwEqwr+mnvaC7?=
 =?us-ascii?Q?WBBzE4hyDWPvVWIWbWaU0ubwYPxdeujD6QYc+3SBdFODA55KikgCUhf7ER5a?=
 =?us-ascii?Q?qRV/1HyADhUbqQ0pN9F2CMaezHmNmypsEEsIixqztjG9M7TiuqpEjYuUXICG?=
 =?us-ascii?Q?jMJCILbgFqrEXpbz4wl2WoC8wqekrk2x6BDe2k5sLIqgFQseateix/LlSbX5?=
 =?us-ascii?Q?4JA4uRtDwcdaE7vkrWeorgR8tO764FehTWGLeYYF0gE5uGQQ7sUFlIQDveiv?=
 =?us-ascii?Q?koZb3IY2lo9EJxkvHZuBUqxEwkrb4+xoXDgCL04P85H4xYfXweo/1HyiMtvD?=
 =?us-ascii?Q?rn3adlDTAVjMW0oWpADpnIDPuLkE1ni26KmiWY4saq+GQH/fXYNaaVIBSpe2?=
 =?us-ascii?Q?Gx1+kddNVaUmkdfBADychMTL4MxvmyhtxZvxubYnhma2RfUsPq1oF78tE3Az?=
 =?us-ascii?Q?R/skQaM0aQjcgVLj/Beudneh521cn8432Mrhlqbf8RvexGHkNURxUX5NK5P2?=
 =?us-ascii?Q?JAmke4G9bKrgRrb0eVOWFKc/7FXsmae/akuYObloPBBarOw4HXl1OpZv6tgb?=
 =?us-ascii?Q?GEM7wBqkVWYUesVnoRLB0MsRC9aCQmflqUzHpHU98NaWgSW3TsaHidKpmEs6?=
 =?us-ascii?Q?ktDEUl0BoSOmF0H/qgDZbcnlmSz4L9W9YifYgJtO6mOu+Pq2qJIXfLLyXj6C?=
 =?us-ascii?Q?TGsLXz3qR7jhdYXBOcdxya4yU0fg3v/o/NXnT5JOTC0RjpXroD2eSojNM3RO?=
 =?us-ascii?Q?ZBex88V0zPY963a8g+M8WAH5MnR5nxdHzF5m2hQ2xoHQoNxyC6tgQ7OqVrVV?=
 =?us-ascii?Q?6fHJNXCwSRh+wXzqkKf4l7qROvjL4w0Q3Oo9ftQk8nm8G3qHS/Uz/qHLUk2D?=
 =?us-ascii?Q?ZiLhsdwV60JAdGPvLN71SW9xR/2691Bpot5FcbVXqgf0Dyfyk+V/7SFnSamS?=
 =?us-ascii?Q?AGA9uza65iMa8/RcfV/MkYxjnQmFSsmfhcSgXnQr5o31T7gKdiWcg0RRI7Sc?=
 =?us-ascii?Q?PhKOs7k2ppwwXZHTbP7nugk3pKV6tTX/gfrda7fzuQ7ZZa6TEaYiRXptoRos?=
 =?us-ascii?Q?1D3G1gxhkOm1YKOF82tzfWvRLom3nJW+hsSyHBvAYhMLYfcRR/Voa2/wBYF5?=
 =?us-ascii?Q?57l9q+gIervoy3Y6CsasbXOb9WUBehgQvOXKSlpFzUPFteuJib4Mj70JDIu+?=
 =?us-ascii?Q?AHjllDQnKneW7x7KQ7QE71K4YWz/h/vjdWkIIxVAWiexA8TaRShlQoeRLi+k?=
 =?us-ascii?Q?F0+b97dMAAnRr/pIbkIEpKH4zhEOl8yoHrUqDwU4SK7AFT0vJgWeWc/cc7Wc?=
 =?us-ascii?Q?msIKzkxKhmlFgYhcNbVYgiriu93wUsEKzCGSXb+Tk/YMtKKhA0yjqlZfWxMi?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4fd4a49-f2b5-4dff-2e35-08dd35540349
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 11:01:50.8099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lj8ilhf0uMMB1lMDZT5SKeQ5Bq3DrYbSwVVd5NXLWG8hWac2tU4Hnyz0t+8gInPHINJfi5wBfHQ1VUw3/ZxziqZjBas4a9RsQsNlioBTUWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6842
X-Mailman-Approved-At: Thu, 16 Jan 2025 08:07:59 +0000
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

Two small fixes for ssd132x family chips in the ssd130x driver.

Since v1:
- One patch is dropped as it turns out not to be needed
- Both remaining patches have typo fixes in the commit messages and
  added trailers

John Keeping (2):
  drm/ssd130x: fix ssd132x encoding
  drm/ssd130x: ensure ssd132x pitch is correct

 drivers/gpu/drm/solomon/ssd130x.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.48.0

