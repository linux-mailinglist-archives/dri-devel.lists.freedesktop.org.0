Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93394B28E80
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 16:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F5210E376;
	Sat, 16 Aug 2025 14:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="UzlH4pEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013018.outbound.protection.outlook.com
 [40.107.44.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A335610E376;
 Sat, 16 Aug 2025 14:38:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMbH3WxOvGcAiJbsBE0kZejnI/XoW2mozXgXujvPhhMoSz6mB0lUflLooVhMrILtFq9LvVuEg1XwMISiQZ7e/OO4fQenVj0WsscAeUUF6QrJ2fXqYAhFC6U5tTCoqGgCu/tVyzshLA+aOuyG76O1SPH6nVt4W5/RjZSRoK0+VhD9JyANlZ/KiIXKDVUlMBcbkL46VG7MqLoeriR7zov1Thamdm6YAp9pnVYBy0jKSCYNAQp565Z+7pYw8Vw5v97NEI2XHAZbwKEFTm+vv+JBDVMKHqhi9IvC07ULQHIoBlhLQgA6NglhfXojoiTlAeiGAVvDnNPDaS32cn9cJJ+8ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BPUA/MZRE2pOlAf7X3bQyssF+I1Lm10RMbE08h7mLBE=;
 b=VBDoQzMZv4IZUxDd+x7oj80dk5kS6FRxHjPewU39uYYyz94IquTh9yC8QlTQe0v0pghgbMEsvn9bRUT4Nhe1TxGC6toxhDaErRe5XyJDIME39YqWv7ZEgsTtluFHneH4H4gBKSOh5e7nabYip/vLRYNCqEblwjZbhU/CPP3K17JupUCFgSpJGzuI2Qlr9UAn16ix+JVwCy/eK4OMxJ+1klmkTrE4YabfMGX2Drg9lllCG4SCGe6IwieeMeDRxyF40BaQCl6c54BOg+WLArDL7hqbFSv4+XGWd28PvsH/qoQH0wybm8X0Hv0n5jnMTH3tG7C43xQ5UYOwS5kTROMVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BPUA/MZRE2pOlAf7X3bQyssF+I1Lm10RMbE08h7mLBE=;
 b=UzlH4pEsY/JErKrZhRQHm6aRJPXlJVDiwbSYBHRP5ZUbA8CK7dgaJrxOKmgoTUF6sUzuTNl4ejtnjfR5A8eXU6WOLXBSDVqKKQChSZDtx//lDy8bNOKcRWPGYcYmJUTD6mex4KYFFLi27nFMUvkoFa69CjM5HAIYsbdo5LUOVYdrEdDJnYYk82AW2Hi9S8M1whb+1/S1VZeOdFU4L6DitTNWVS/wAE9QO2o85d2U1S5JC6F/NgHTdqBmvMjU0swoPBL9HJ5Q1GC97S9Vs7CwLuPZp0aaSnjJQf+AHc2AdFx6sNWlLrLkOs/HYP5NoczpVBsvcSEhgKuwGUAnZTlRBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6771.apcprd06.prod.outlook.com (2603:1096:400:459::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.18; Sat, 16 Aug 2025 14:38:02 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9031.018; Sat, 16 Aug 2025
 14:38:02 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
 GEFORCE/QUADRO GPUS), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), linux-kernel@vger.kernel.org (open list),
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 0/2] drm: Use vmalloc_array and vcalloc to simplify code
Date: Sat, 16 Aug 2025 22:37:49 +0800
Message-Id: <20250816143752.397973-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0014.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::9) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: de5446af-1c78-4961-e370-08dddcd2812a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?48viuTaaRO7dg1kVtiRoxh2nPuIgXtghuNb4MN7IPOCIzguOnYPx/3wdbePE?=
 =?us-ascii?Q?DG/iSemtzXX1mGYxVbGApnoCLD5HXWnm+eoyEcm3YFZVLBTj7q8LPrOZqAGP?=
 =?us-ascii?Q?xNKQcSU8oLR0XsFucdYx/j7pA3VHy2YFEm0vXotPgZQfaOuGq8NhzJK40ar/?=
 =?us-ascii?Q?2ofjQkM1kFBNrcpyZfkzBHNgCVnMhngi5I4w/V+AJubKIFR/zlpVuTa7Cgrx?=
 =?us-ascii?Q?mL0MPU8Td5qiSC65e+e6ZFgLOyWKN+3D5OlK5SEbYa9AJD1hdFcWL3QCiytZ?=
 =?us-ascii?Q?3WR9uuooucLsptVb2PhD1kXJLp8QJko2N8RwdU+y/AN0VsgqU2esUrGdho2I?=
 =?us-ascii?Q?6wfPvfnMqrzXrf7WxNLHU/BMEH88IxVg8+4ScYUejJgY2FJsNHB5nwIIU+zr?=
 =?us-ascii?Q?u0m3dPcLhgu33WPWj3f+SVr+yOuHCv1+J0VmuLw4R/BH087OABrOIQilsvsj?=
 =?us-ascii?Q?liPLZ+5RAJ/MgfgxI3B/ylRqwDs/wJkRWKP2T9ruyB7kZs7ySNczo+MikLIK?=
 =?us-ascii?Q?HWk4cmTPodPDn7jPHUQBzCdd5+hOJ6RIcrrliOQDmAYpHtkiSE1qjqiezm1w?=
 =?us-ascii?Q?QImH7hjEHIK4g/L+BUdhpkAYKfaCoeEQHkgYYJUA5QuM+rjF6W1b5oaYtyEB?=
 =?us-ascii?Q?uOIgl/SR+Vomexrt/m5fSZyXhn3rA3dfFkAhtvXDHMbVkFY84pe/OxFPFjJa?=
 =?us-ascii?Q?vasVkwr46G0FGAL2/vBUKzlC+RVTIjKvWr82PF1/izJqzFhrErpz3VW0sEVj?=
 =?us-ascii?Q?ryffyLjq2201mBb3x6T1McaYuGFhkECdEi1PZpjFXKJRYXsV2rqEDonfUJk+?=
 =?us-ascii?Q?Kzm1bHCHSyran2kLKglrH6JPGWimvON2JbraQcFyH5rvd6koomOkiBcaED52?=
 =?us-ascii?Q?Tn0WrRqmqeS9sUrU/QmRX2MISgiRy4f2iTx9d1A7faBXuP23bnFG4UJ+B27K?=
 =?us-ascii?Q?knsVd9iSrGfYI1z8F/pDqcmCYzJfoNo2n6Pa6bs/vAA36NXE8zepS0oA6YBi?=
 =?us-ascii?Q?cDsr8HgzRZw6ly68KFDXCsAkdtRmP1P1tKJzsx1CCbJfjSlwM5TCN2Kef2vA?=
 =?us-ascii?Q?gVbgCoif1p9NBpusjtk4qlg6VAJ1UOCyctwpP1cO2o1Ki47+Jr1DAmWPC9XW?=
 =?us-ascii?Q?n61HWq5suxJ46SJDIg0lbvM7usi/UJDWRYaOM0MKpyon7eKjfUU9sLlHceis?=
 =?us-ascii?Q?NDkBPMMhmR/uJ2Q6EPfZcnBOaQznk+XfYheXvSaLTWHMIIB2SaunCi20ngXw?=
 =?us-ascii?Q?rpQ8bjV/gNjnpBzUldo32hPpyZeMSKlLhVzldX4lHb1WLRwrPBhE160lEFav?=
 =?us-ascii?Q?qC+w7CJf6HX7rg3lxGKo09cTd1IEjKp3KDqtiq9l3A6zaWfS7kZzV7INjPWS?=
 =?us-ascii?Q?X8pVd/tT1plciU5nA6gTMvWqY3cCaj1Qe//Qp7K6/qtku1D+tQhVWtdqt5Pn?=
 =?us-ascii?Q?MxtEQSMZ4RB5bpbOKMyabZvUqzBSy6mORYWNJZE+4G412dNKM9HYRZo9gBDq?=
 =?us-ascii?Q?xzij/3xglxJZ0GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ezK7LQ55YnK/fUr1PfxU1PnuDQ6ugta6AUvoA7rbtJeIs7lZoLqwan1Q4mpQ?=
 =?us-ascii?Q?UFCQRAd7cGd7GfqnBI6a0w581UdzQcsMtNES84SH31MFbfjTIMlDKQFmpXHS?=
 =?us-ascii?Q?GdYWEPPoNR9nS7l7n8EVZj26wKqrLBSxFY6jm4Nwi7iuvKGZDt7JDY8EBDEZ?=
 =?us-ascii?Q?0m0/ifmKthwWRelOPozQrAcAuM3C4MNr22m+6fzSXuXGFul7N3qG0+k8QiVG?=
 =?us-ascii?Q?EOBIHjwH3Nu+c0Ysl9xJeg7XgQUtDJ5QcWSL5K16ff3r9RSOp00+yjECqY09?=
 =?us-ascii?Q?zWqGRMtyBkW7PF0lc5tGOh85kr7RwtggqtWl8Tq/DGiA0jy+wtiqis6Br3IU?=
 =?us-ascii?Q?JbfCrzUTro0B4Tc6jUyvsRxNALCVWGqPSLZdS+51cbx1mwNBc7USl8kWPFnc?=
 =?us-ascii?Q?EGGt+FipZjIXl+iXVI/av1Cd+js8a9pVMQef4C2yhiyFZvM/HqdNWYnFxNYS?=
 =?us-ascii?Q?HscQ2d7GcWl0k2GYdXn4J7/JKfEofrEa+xKLPFGHOFhQhtBvUd5WIb8w0OU+?=
 =?us-ascii?Q?BDptCiJvvM764I/Qy2iqiVM2y4LyeU3ig6XxfM0NRPampaQHC5KqK4W7sNm4?=
 =?us-ascii?Q?7yl47j1UaSD1KMl8DxTNsT4SE5AdvT2v+CVc9RgiDuUF4pkvgDTWpTzNUl3k?=
 =?us-ascii?Q?eQExGbKpvvw44oizKMaoQOfvQjld0ums1A6liUVssMQAqT3AkCtJFJLAy80P?=
 =?us-ascii?Q?NBCNjuncdYt/JrBcXBLYhxqt0RRy8jcnPoI2hmImhXj3/rPW8Q+gX1zuvPGP?=
 =?us-ascii?Q?4JcnKtxnejSN25qkPDnvx+P6ed6dkNAL5dT+u8y+Fum2E++YmoQ6NlOGG3Jf?=
 =?us-ascii?Q?md4sHG28iw+RcPwYVQAVmx4YOttY8QaxOWrALm0iIaZPkskcQI4cQiuu1U2o?=
 =?us-ascii?Q?0aoIAg+b6OwxxpKAU9odlvoOzq8rMTd2svfakkm7szeKDpwWTJVwJNqSrmHX?=
 =?us-ascii?Q?w2Tcadu8264s0qHk5CfylvjSr/1u8AaWZ2XAF6L6MyXHW3OtVH1zy4/Asjqx?=
 =?us-ascii?Q?L+YXX7d3jw4Ie6DUo/e6wuGiTAPYkbmnSimnm8N955eSvyhIVbKmne8vNhAO?=
 =?us-ascii?Q?+gNiunw2XevssNzpwu1nEjQ2vksiEvwSLjxRPIJ+yE36/e+Aaq74pIATJD99?=
 =?us-ascii?Q?7Dq9Yrp11TV4j+zmJRTSSfDdShUT8FKuh5ECRP3Yf+5e18Odc1VoLntkJMaT?=
 =?us-ascii?Q?0u3eTH1ge3gqjJd0sge0qBPS0mZ9YVfEWLv0rArK9bAqhN45QjCtGu1GX3VE?=
 =?us-ascii?Q?Z61dDNFN52OUZv8MelKuaEK/Y3ii7aEDhWoT06MpVn/maiysr7TFOp+7PKk5?=
 =?us-ascii?Q?qyr/ZanWZrFb7GzKFPJNm5sD/G/FDRP3Xpl6R24+TaX346vf99rvhPTvWWQV?=
 =?us-ascii?Q?0OYHYG8Lk4L/nLEOCFoZoEbI5fAPLmniGbtrocaTlUBsKo7ziYQt73RemcEw?=
 =?us-ascii?Q?iOtWyYLxuliTNV+XTcRUl8v5ZWnR3MCb1w527t5dpI/xBfnkeyyXyrkOi8is?=
 =?us-ascii?Q?WAHE+IjV0hcMCVrtWOhroOwq3IQpwXMv6eKAU0q2QAV91SoE7y/PMDoStI7m?=
 =?us-ascii?Q?GqDAABoSomxTUwIXSYnHvFCAiaM11n/d99d9jbR8?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5446af-1c78-4961-e370-08dddcd2812a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2025 14:38:02.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eHddOFtl9uSUBQAH5cc7ORXXyR+xw1137+RzgcUHPjg7IklKIav6yu6QnVUV4My6auYa0e31AZkz51fgGELmlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6771
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

Remove array_size() calls and replace vmalloc() and vzalloc() with
vmalloc_array() and vcalloc() respectively to simplify the code.

vmalloc_array() is also optimized better, resulting in less instructions
being used [1].

[1]: https://lore.kernel.org/lkml/abc66ec5-85a4-47e1-9759-2f60ab111971@vivo.com/

Qianfeng Rong (2):
  drm/nouveau: Use vmalloc_array to simplify code
  drm/radeon: Use vmalloc_array and vcalloc to simplify code

 drivers/gpu/drm/nouveau/nv84_fence.c | 2 +-
 drivers/gpu/drm/radeon/radeon_gart.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.34.1

