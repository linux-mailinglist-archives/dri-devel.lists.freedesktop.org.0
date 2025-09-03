Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38825B41E40
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7551110E212;
	Wed,  3 Sep 2025 12:05:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="iZYdV2C0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013024.outbound.protection.outlook.com [52.101.127.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B86410E212;
 Wed,  3 Sep 2025 12:05:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ep+dvMw9bIMdll8QQY8m8P8tPRXgzGO/r5rtrPHqCF+sJouP27lnlJAfr/a3mqYdVM1QDyiVLLTwJtH9voxJvGN05LH6nfF39HiE/6b5vEAe9cT3a40vOUhaBfz5kQjnWJX/r1usHvYe42EBXm4OQIecGAUvh5s3JjO+2bbEx2ty2/Q9HM35OG233lN9wbuMsykmLnUTnfKESMK0kR4/qLHraS3ItTunjwYzaGsjMBs1/HAA1dv0sw0k6v/YpNNCVJGoieNFotJ+phEmInW97QupPvo+lZnCN/g+zLn3M+6gkK3g6ib49L5Oud3n29eReTaARCbpI2nhHrlHQHt/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wovgIfzXqysTJNd8MuyTej1JT3t9mPt/4OELAyp3jr4=;
 b=D4uSGnxN+QfK/1Tg+rozmaW8OKEJ/eUv748qCYS3ChFjb6dpy7BjviGUUm4ccqlWjzGcPIyuDEHT0hv2C2QFhx3+V5NVToNh0FfPpuQBjj/WxfnYPYXTqIvYN+SVEegT6x5bR2oQkCIVjenNJDbeepHItF7tL4etKvJtyW2UxTCK38eYA4kvmKnMZx51k18N1K6PykxftWIiBChrXXx4Y/qBPJL19gVY8oejm3Ycw2THbStzSfcbvLf+soARxvtPkzJII6yYHwY0ebOftghH4boc8l/XYJ1oUTSRT7lbZiJyPQoErt3BM3Djma1R0VEC055++5YwYgXSwYTiZGHVsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wovgIfzXqysTJNd8MuyTej1JT3t9mPt/4OELAyp3jr4=;
 b=iZYdV2C0uebbD2kOXBSOVsDHGUPGw5ALinjPEzMHnwQt2lJ1mAUa8vpqWYiKK4pRsy058u8QvL8ZMWy1ZVu/glWC69eCilXrk72rpv7K59VSO7N+O2knINvr8U9uMq44g0CG0W8cFLmcjAkgk5zefu/uWA6bBcuFRq3EG4wzzo/cjj94Qg0GP+12KADF6tpMMaJmx7clZp4SON5p5uQcRtmovdHKIipM5xHzS0lmtXtIm3OP/3WbujV+ZOa+QqpKBEfcFMQDybbyzvYLRDzAJzjccHB92jfgoMInftaBmCweykjlIs2YMqYpp8XdvmCcCuj3TEt0YHS+HfEzehcyzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TY1PPF568C2A376.apcprd06.prod.outlook.com (2603:1096:408::914)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 3 Sep
 2025 12:05:12 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 12:05:12 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tao Zhou <tao.zhou1@amd.com>, Xiang Liu <xiang.liu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Yang Wang <kevinyang.wang@amd.com>,
 Victor Skvortsov <victor.skvortsov@amd.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Prike Liang <Prike.Liang@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 "Jesse.Zhang" <Jesse.Zhang@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>, Kent Russell <kent.russell@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tim Huang <tim.huang@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Natalie Vock <natalie.vock@gmx.de>, Candice Li <candice.li@amd.com>,
 Shaoyun Liu <shaoyun.liu@amd.com>, David Belanger <david.belanger@amd.com>,
 Emily Deng <Emily.Deng@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 "David (Ming Qiang) Wu" <David.Wu3@amd.com>, Leo Liu <leo.liu@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 Mangesh Gadre <Mangesh.Gadre@amd.com>, fanhuang <FangSheng.Huang@amd.com>,
 Saleemkhan Jamadar <saleemkhan.jamadar@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 0/6] drm/amdgpu: Remove redundant ternary operators
Date: Wed,  3 Sep 2025 20:03:44 +0800
Message-Id: <20250903120449.380087-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0293.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TY1PPF568C2A376:EE_
X-MS-Office365-Filtering-Correlation-Id: c5cbe733-f877-4da1-5af6-08ddeae22260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KfoN3rbMiEGjbKyhohLhiY3hwY4fE2meLzaTDHcKPhQXjfQjqZTQ/QWcEdJ/?=
 =?us-ascii?Q?zPnakAO1emnHJW0hbS4WPNSVzFQ154QAYQvs4oerTKpuE1c5ginkCjKs3mdr?=
 =?us-ascii?Q?NQ0ZauXDMWi11+/rrBwvBGpa04R332zYP+p+hW8ZuC0xkF8PQywSziIXOKiK?=
 =?us-ascii?Q?dbePt6quGL6If282yDy0wIPja92mhQWrfiKe3asITMTVDGcYQvPA0rzOLr35?=
 =?us-ascii?Q?wNlqt7Lfc7lVVVw1dRFB/kXuYfmjaIKB9tIYNUEvcMP8E/dpgeDyXb5+2XgH?=
 =?us-ascii?Q?x1X5o+wvHV7ah8lQuw2HV5ahJeo2IBjJxeKGIlUO4lxLCEQiUKvR3vxIkFiB?=
 =?us-ascii?Q?2kRM4DqmrBJBXOhVVVNL8+3hvqgTfEVjoPfF3k3LL8fF1sJWmoXI5C2Q8pUO?=
 =?us-ascii?Q?f6uRLeUWmflw1pMjUBCAzFSsgZFsPY4FuvBCy0rsrPjBeOv91C9tkqfeCWQ9?=
 =?us-ascii?Q?dR5KFvqRN5RBuPx/vmLa2eeUFr6Wq937KO2qI4nj45uZAwKFbZK4w+wc1lsl?=
 =?us-ascii?Q?oGz3iGMmCcT5VrXbudchdSZWUsImECiSb7ZJnCSehIVJdm+RGQdBzOz5cm/1?=
 =?us-ascii?Q?lXjY8BOiFgPHeIr7sSb+PHlwmuM+MclWsBPHHou2uqSdrmaFbu2CBcoKOGys?=
 =?us-ascii?Q?QmD3XCRXakYHMRjhtb0LzWjcYQTQ6VBREspu8RIncancozN3PBVI+Tchc7mw?=
 =?us-ascii?Q?ogiesj2b6v075GUHk9nyWkE3oFNVvyciyjtiF5Ynbxx6avOKuzD39eSpceIC?=
 =?us-ascii?Q?6JDiGv566IqzlK2wV0TKEH0zFGzwotQym8Jj0kgt06wI9WnkGLNqWIWNAlEt?=
 =?us-ascii?Q?CvO6YbWm2wXrcYuSU4iOtyDwIfgn6d71z7UvQo/tTVX+uzo/+OBHbuX2Zn6r?=
 =?us-ascii?Q?X+BdKzlGtp+N+MNvszGNfoSz5gw+iqijT4TbZSnIxUroIzzRZNj6xkCJkxb4?=
 =?us-ascii?Q?kB7cYl+2pcEkrOJo0siUTwsU9CVTeiJWTGf9Bh3qlIaMzSDRj0298InyeYlJ?=
 =?us-ascii?Q?ulVLyKbyrTwnehL2A9LEuj38WllxSLYZ7KgmU7JHnsVnzj258maf6j3N+6Jo?=
 =?us-ascii?Q?4wBYWbUZ5vrWlG3/8hGbnPklaFiF6bysFN69WChVC90GbO9en39NcgSowGUg?=
 =?us-ascii?Q?SbT0u6jTMaHBfCEAzqSH3ppTsRI+HmDucU6SCGAn8Cq+1RoCxI5NljTPB9dP?=
 =?us-ascii?Q?Ak9jenDugfZfRb13xkmfQzpVSJJlsf3/Y54jIGRddcZCVp8Y6RBVY7O4efAu?=
 =?us-ascii?Q?lDDuMZLRIdgNwKx9lcjEiT+d0+dX6Dd8ZLdrkgZdHxoK26X/GsVS6q8xnrT3?=
 =?us-ascii?Q?LASr239lI31sQL0Sm+GsLMTta4iv/6k4kbP2XnTywJXGlx1a0T0xUF0g55G2?=
 =?us-ascii?Q?6eadfaA3BXDgiMgDcKx49A4fUaCRbDlki5B+X7HuPF2IsIX6FZat+W0MzY+3?=
 =?us-ascii?Q?hO3lapDQkNuzUl0S/tmSsh5dRSdiweU+Y8CehZwzVzzJ7gBGUvBAIVqGDMRB?=
 =?us-ascii?Q?ctx1WuNf4sdTS70=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8eYcUvKIml8R7MziZ1GYFxxkUrXK0W3GMjLARD7Su1JxhDyFgy4iM2M6TsBt?=
 =?us-ascii?Q?vGxGpl3I/DQntyaUJNXPR5zVfTg2Slc2jnq1GAdHhoK5c0dA4BXpiqY0o702?=
 =?us-ascii?Q?rwKaC6pMcus9yqIA9S69ACRG4u7FVBx76rX0Q6ta6VsDyo8inQaG0IQ4uCHl?=
 =?us-ascii?Q?e96VY55sAizkBZvwedO588kruzFU4xAHFzPsAAYYPpYt8YYzpGN2H0J7JfUd?=
 =?us-ascii?Q?9VpwKi/RdyKFr26LOZuUGpzcBua+nEskFrCmpjSK1hCMSIAqeX+EbmdrPxLo?=
 =?us-ascii?Q?WyI1vNM1LMRXKC6xYILeZrhpBR2F0BoPdEJHBWIzQOOoJkkH8Tdivri4dMj4?=
 =?us-ascii?Q?AyriONWn2jYnEt2MFo1Un5eyQGzNE7wzZsLKGjrMzuMb6wtWwhZrzrqyjhUX?=
 =?us-ascii?Q?RJLnEI1c/x+++fCIIXrXDm/T4liql2aOulzR8lnyDH9Kx9RT5t03Bushm5sX?=
 =?us-ascii?Q?GDLuvmQ0wwkmF1C23ujSxcHtlcrRtJWAVQtKxEpSE0DOkV+WztkeXTYSB554?=
 =?us-ascii?Q?Kbj92E6uYKx7knSLRC0T5b3zVY1bq8HyAcTEvgeJRY9FrzBG8XDKarHLDbgR?=
 =?us-ascii?Q?jSS90qES5Mh39Kk0tpex1Exwi67rdsOICXfk70eUs09GPBug2+/S9i5FbzMu?=
 =?us-ascii?Q?Qa1vxxuqYQ8gaDksUzoLE0nvkYKeAFWDap/iuRNnIcVvfYSOPm+ZjRzTxUzs?=
 =?us-ascii?Q?3ynbshOIVs0H12JWPDS8wVaV01729agbvN7dvcZojHG140TyBFWgBBhmAZfd?=
 =?us-ascii?Q?PJij4QCuyJquNxQnSx2UEVAj4hmQzHtkyFoazdnq6JivpsfzJ4z+BU/LBPHg?=
 =?us-ascii?Q?/k7IRjlnQyXdXD3OdWbhcW5KZ3KOOGg/3r7DbDLXldez1jh9hZZRvZHJoSz9?=
 =?us-ascii?Q?/k/dnEuJrn73MVv2G7a7v7ZgAZtI4Eq4wWx9pKQRVL6R8gv9TTedMxBp+nzw?=
 =?us-ascii?Q?GrhFmsbWKZY4QUrwFc8oRRyvKvyGtnD8Kynnohs3YY5TshA2iQItYn+ijOo4?=
 =?us-ascii?Q?Sgkf+R8IYF4elhMZUyn+2dFZMb7p0kPtIcf0pMn9ALiyScHknNEnRS11yU44?=
 =?us-ascii?Q?7aSrsPKnySnyhRHtb4EgA76ZFCdS2ixf/iKKZjmdxTL3yPeKnCnAm0MTJZxW?=
 =?us-ascii?Q?9DMlB/7YtE7UEPrxSMQLzqH/P1LSVZGvGK5doTt+uUVWFHNo3ja+QTuEAdcD?=
 =?us-ascii?Q?hplu9ouyL75ysXoHTKM1LuNmjJZ5AKlSR5xB3ih3EwK1O8HhF/RUaDJf17hF?=
 =?us-ascii?Q?rwiMZqFph0jfyIz5vtEdycleFRnbz86t0IxtXLjTjypOcu7S2Gu+048mB8iM?=
 =?us-ascii?Q?0DLIQMDtKm+8ADUS+4xwAQ2mWLYrcphFsHMDrKpQTE5y/t/7gLQ9nS/Ud03A?=
 =?us-ascii?Q?P0lHwLn9XnXZLQ22d9IWWgNdgSCv0vFUHhtJfezM+MSRriXmcxxb3Aj+kR0+?=
 =?us-ascii?Q?1fsW0st7TmnuE25SfYmH1ZlipFJymPDp6arq1B4lO03Rbd05j/agE4uLvp4E?=
 =?us-ascii?Q?Is4gUlcR29AIeBF9o9YI2AlRepO355qT+V0wN480w6uZFKeAPJu7TU4LZp2B?=
 =?us-ascii?Q?/yJGdUjtToUCeBQo0JGrEcITCDki8JbNOwfH8w5U?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5cbe733-f877-4da1-5af6-08ddeae22260
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:05:11.9765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWM2/0WtYF3YyS4uGahC2zzIHhJrwAjDSxYHOQrKb6YBnLHoh/r7vtkTSbaFRTI/pOjYuklQHpHlAOSJVTPrYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF568C2A376
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

For ternary operators in the form of "a ? true : false" or
"a ? false : true", if 'a' itself returns a boolean result, the ternary
operator can be omitted. Remove redundant ternary operators to clean up the
code.

Liao Yuanhong (6):
  drm/amdgpu/amdgpu_cper: Remove redundant ternary operators
  drm/amdgpu/gfx: Remove redundant ternary operators
  drm/amdgpu/gmc: Remove redundant ternary operators
  drm/amdgpu/ih: Remove redundant ternary operators
  drm/amdgpu/jpeg: Remove redundant ternary operators
  drm/amdgpu/vcn: Remove redundant ternary operators

 drivers/gpu/drm/amd/amdgpu/amdgpu_cper.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/gfx_v12_0.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v11_0.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/gmc_v12_0.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/ih_v6_0.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/ih_v6_1.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/ih_v7_0.c     | 3 +--
 drivers/gpu/drm/amd/amdgpu/jpeg_v4_0_5.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_0.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/jpeg_v5_0_1.c | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0_5.c  | 2 +-
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c  | 2 +-
 14 files changed, 14 insertions(+), 22 deletions(-)

-- 
2.34.1

