Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3540DB43A05
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 13:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5209910E9FE;
	Thu,  4 Sep 2025 11:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="gxydoQ7W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012049.outbound.protection.outlook.com [40.107.75.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBF010E9BD
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 11:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8ttJ/EWf6l7jqO5u76lQUbg+8eiMQTJ3IfWc5nplrvE4/9L4is+yAwTz5QxhbZho1uTrFWccVBpDULUgb9Ko951L/WJ2eukol4Wqd9psi5bb4j5CXHVaNKKJPYg7fe4IwRK3ZhDRatglE+ycW1DXbp63vUB4uEto5KA2X72GJZqEJn5U6ym/NUIDJsUGKf76w/EWExbIv8RAtzNyQIEIxwcsf3WkIP66FW9sHo4frKUlyc+DhCVpQ3jiKhR0W9A2pslvEBfUkSEvImzyjdt3oGU1YW9MScvfYu9ji4WfCc98mSjWt01nvkD8qzWyA00Fimbw3CtojQF6F4HkQDarw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnkbIPEFtEcqejzsEUWebNW9CHlgFoybS8JH5GBL0R8=;
 b=PoDq+s5zRpVr5knoghE1P+QCnyzqPylFV+yyNI1usH0tfKXtXGwB7pEyv4L3Eg+wPefeuzZ1dTXrEHjoXBbTgG5UKprLUSxb3YKC6vuuvlVaP+IYYsS4fyqVWuz+BY0cfd1/iBH1RNrh00KtQtjzWiYdNp35flPhNSJtDiEmMKGiZyxg+TB0JoIH5+zu1TMWWdt5n/Fb1dSZwqkM3I6sfeY9Mt5zC1NYA58BLVc6Si9YpuEUll1xrx/heNRF50dmLsOGW7HAJbUtpubulmxKtEaOv2x12DnibH9r3spfArk91T5qdln1G2E0Lvrz0qdHTQFnnOuqUFXvzKYy7GrBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnkbIPEFtEcqejzsEUWebNW9CHlgFoybS8JH5GBL0R8=;
 b=gxydoQ7WlR+aNp+Eeez3uBxf0WKSfyNzNY9sIqUaSERtipEOvCB2SClOV6nTxSVpKuT+iaRos4AMfPuB1ODrobFQhh1krHpKKVd4FOzUMntFIb5Jmsbx+QAuh3CHA0OX3X4ovIHxZsfIiEZ5Setxoj86UeyA4UX63UWp0R6kGDcxkb52AUqWQ39W1jFkce7RA0UfHvnhTjMn26dRSa+6Mkm52UEJfGo2TL2AyUUaW9VbGX47EA/3YQhFNPycarsoGVEVRqX7sokhjohvRneuil1jkJetfeHXomMmdWpIiB1sw5q34G0WgSOnREGm1zwu72ofIvQE4euAqLMyaFN4hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB7063.apcprd06.prod.outlook.com (2603:1096:405:40::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 11:27:04 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 11:27:03 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nitin Gote <nitin.r.gote@intel.com>,
 Luca Coelho <luciano.coelho@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/i915/gvt: Remove redundant ternary operators
Date: Thu,  4 Sep 2025 19:26:40 +0800
Message-Id: <20250904112644.350512-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0061.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::13) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a34a5dd-63c0-4f39-9f73-08ddeba5f8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CXF2R/mbx+wtIINhKeZR0VWBbUP3zPe2SoaghZdVvJCrunCSO2GpuKGbPnC+?=
 =?us-ascii?Q?0MDIXzFd44lB1o9HbYL51YOHiF7mMDRzzrsRNEmzPARs3YMBUI6wyhpdpviE?=
 =?us-ascii?Q?i0rOqeA3VE4krFe+h2y1H0lwcvLPhYLBKG2FG6ElDMBlY+0H/DDbEKcRGG1Y?=
 =?us-ascii?Q?R3vA8DKGnO28Wn2p3gWx07dXkv9xllWRssbU8QztELqibg+ZMcOUBtaDv9Lw?=
 =?us-ascii?Q?kfUNLAH8VAHSPbiHztymeMyJ7psGggzoq9Mv0rHktVRIQW5OtMgCTttLny3G?=
 =?us-ascii?Q?CzHx7VSHJ9E4azxqLf2GTSPuxGYSdBi1/pxfuRPrzBWhYwsRSY8BJGzB2IGX?=
 =?us-ascii?Q?Ge+Xrjp3FURwm6IGCqK8CI/A751Wv9XELm4wh3Fp23nWDS6JwtoDn6TXotK9?=
 =?us-ascii?Q?Dz4MjR2CU3+OdZCfN44TvTIRC0KTvCUVfM7U4DEbUKxlAd5mEEjEPu6rlxNI?=
 =?us-ascii?Q?a50leuqRPjHcQmt3awGsW4TkRK2s3HNwUU8fj+nsYBK2FWh1xzrqo5yghPB6?=
 =?us-ascii?Q?njS1hfml6DeFHCmweOvBXd2bYZZxp0IEGi3AgVzyK99GexhnSHMPt1x4Qpym?=
 =?us-ascii?Q?BTpZ5wX9BN7uRmwsDqKMGHDwfhkaqUNGqpDNfMIc/Onu52SuTtgWjak6LgJd?=
 =?us-ascii?Q?C0EzvEyJw1Aw84ZCFG8JQ4Nnq7nn7RRh4aqbiA+3ljTa6zWMmoa2441S+lqC?=
 =?us-ascii?Q?rI26DiQdnBBrWuSk1bWi8+5qKyZV9H2SC28ROWHZbe66f+az1bdQmKf2PzAi?=
 =?us-ascii?Q?HiJrDI+QmJ2xiZWr1im30NShoTFi0dVPqP1C2lDBO5hThz154kfqJa3ELnu+?=
 =?us-ascii?Q?0JFqfbxDHIjbyLW++mPqHymwWvZLN6F42wn+uyYTVR/W4vCF0EcSApUe2qP5?=
 =?us-ascii?Q?QLkVQ6PcWblgel0cOmpQ5kXl7eOHLADDtGzQMX6hCWw8hQ/M7NKJy6XH918g?=
 =?us-ascii?Q?UGv9lNwQ6z27WE2434/mineEXgUiO5ITO4w1/ieubP4Hs/0xGYuNaY6OtBsX?=
 =?us-ascii?Q?SDDNP8saH8mQjEYBn5sK1fwRPabyEMp8dia44jvH4HNNlkladKrcrQOsjk9/?=
 =?us-ascii?Q?BW6xTEpimuyBLEs+MwzDSo6709TEhDdrLdOu0GMe+C3jKufDmfROJdatG7Vx?=
 =?us-ascii?Q?4uM7STaPYb5jPm/mEP1CAJbNSOGeRqJvALu/a45i72MzshM6GJyR+zYMFbd4?=
 =?us-ascii?Q?VIIYKOicyG42J35krdGQ/PbltPo0OG5zAIwyv5o/fycuzZJD12+x5ihJ5tsq?=
 =?us-ascii?Q?WTmcHTm7E1jZUEEulcyajUf7ehm0KVeVw4vnUa0Wotk7IErXvjLfVKkBqWzi?=
 =?us-ascii?Q?LxEN+mvZO5NRXi9o+QmdxB1UFR+4+eraoj6s5/5iCjUPOxTndsqQ/QvJDTHR?=
 =?us-ascii?Q?rDMrLer0WjKe2UU3exJXJ2lcOMB/6+6SSPjA8Grj6Q1cNdYHep1sqnrOqRfj?=
 =?us-ascii?Q?69ArnrPtNmYBXcExnsrYP7jA19ddC2IgcxShDc4wUloQy1WhWfFf8+k152kM?=
 =?us-ascii?Q?cAWXBWnf06WedaM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/aKuYr1yG5fWZNca1Q66aDQs9n3ivU00mT3V1BIZzrQK5jnqz1p4DLRxNuXB?=
 =?us-ascii?Q?Ptkz5Z4C3b6KKs8v3XruH0Rcc+/0GXPuZq2xr18wVCMJBl6+98NeBW1V+jiy?=
 =?us-ascii?Q?JYWMAbXlFC5Ne+Yhj2QDugnqMe0cucB6E43HyEWifv8Ta1E6MCLYSHYkA5pk?=
 =?us-ascii?Q?x9igLCXyF5x+UaVrfJHnPlIH64B4HgiicdtuRdIp+d+IkS0YrIynjUXVktm5?=
 =?us-ascii?Q?Sf+f25vULhlRVyd6TEX6YoffWrLlgOi95v+Lvcq4XvQseFhoNKAsHpLisZQD?=
 =?us-ascii?Q?GK7i9lIRJVNhxTFtvMNegAfRiIRSO40jpO2D9khvUaUBicMIUAw+A9JVz9K4?=
 =?us-ascii?Q?g9wVKaDbIVQvDfuDKGP18I1eeYTx+E3LO8GY5ENVHmraVx/yZP6OGc3feImc?=
 =?us-ascii?Q?AuGYhf3/PRcdU2/sAXVRkXmnFzKA4g0X+TlI8SqzF4bGVIXz/R6x45H9yumE?=
 =?us-ascii?Q?HHtdm5395oFfkrD+dFi3GCsDoyjONhNU/7NlQtGX4TR9HwPauMJ+odfDabao?=
 =?us-ascii?Q?8DggACyCfEw8ThnZeBjkROABxQWAy/TEhuQAf6ikqnZUtVwdc/xjsW8OM8cM?=
 =?us-ascii?Q?CrDfo7Md+bz6SGEFcPLsem1qSyhr8hhg6tQYTQyuWiYt9ymTNGRGnz/nf4eu?=
 =?us-ascii?Q?AGdhk91GX9T4TkH3F493zvvgvDQaeke9GZK8jlcRSbq5CKtwvgththM0MUdC?=
 =?us-ascii?Q?dwhMWfPxd9YbjOGZnK2pIsSwl8gZTcXW8ZSswP9ZbC36QwwWIqHwVCdJ1m5R?=
 =?us-ascii?Q?9FOBfzwgcXdCvQQt+CAdrfj/ADh3Q9fz7kEyA2ujBbt9x2YnPuhTqI9g8tDy?=
 =?us-ascii?Q?svOO3Ge2oj7AgSACtGDW7qxJunbkD7is+DM47pox7OCvv4ZRqnd4xOczYBRd?=
 =?us-ascii?Q?5A44OEuar0oCuKQK14GdJIbn/5iC9FvqbQFoe2VpvQr3gz6zeZmBATOzAMH1?=
 =?us-ascii?Q?SsFKG7LxlG8YM5p10erw0TqS7ma4yrVlR7oh+OJB1lXTvH7gVER2Df8CZhKf?=
 =?us-ascii?Q?xF1vDsCQn/8hrkqtFz99lg1IQrovbkN3/6fSCq+g155K+N5CwRttU/jhTOJG?=
 =?us-ascii?Q?qC5k2Q9p4JzTykP7CZC5LAwGIyrxNpsmLNSZE/lq3Lt3SdOwsjMRf124dErZ?=
 =?us-ascii?Q?dsHbafc5X5VX53Brb85Fhg7TRjXczOx19gxcckw2F7NyxcSfPH7r4+7Au8Ik?=
 =?us-ascii?Q?2w/j6vdoavFzAMJu9WMaHMn0ZhwFRMgQTi80wCCTGl2e6aEz8NfwawMN8LCg?=
 =?us-ascii?Q?dhSc8GJspWopzpvnvwzFyrV7zI0brwQNJKG8HNkqaZoG2Gp6IDKzDtVR8Y2Z?=
 =?us-ascii?Q?nqgquV3y/l+UifOPHCfbLiNnSpwqo+tER0AXGVwCgMgBXbpelPWEtCfUamy2?=
 =?us-ascii?Q?+QOmqPY9apNoRL281qYNiHUB15FS3ensMKLEYAILwJ1vPY2hPkgkmLzGZoKt?=
 =?us-ascii?Q?AhT9M/mTLKUK7qBPrd0I1o5dVL0sRoAn4CP9JzoRYqyoT+0h7VuYDL47w0SN?=
 =?us-ascii?Q?Wrc76+1dVVBHEab9uMciU7pMbZdPj+seW1G6QzyNesTgRzcZXNkMM7TsUVDk?=
 =?us-ascii?Q?pa/I5eL67zZdbbxSYFRCotLL5tkEdkK5/1XoFewT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a34a5dd-63c0-4f39-9f73-08ddeba5f8b2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 11:27:03.4280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sx6fgeub6KBfZ1oCZXykOVT0+Vi7jo61XAmcqXL0t6pXoTxaU+HwirG6780ylqd008Uiy9Y2HciuGmYPvK1fnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7063
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

For ternary operators in the form of "a ? false : true", if 'a' itself
returns a boolean result, the ternary operator can be omitted. Remove
redundant ternary operators to clean up the code.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915/gvt/cmd_parser.c
index a91e23c22ea1..d432fdd69833 100644
--- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
+++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
@@ -1921,7 +1921,7 @@ static int perform_bb_shadow(struct parser_exec_state *s)
 	if (!bb)
 		return -ENOMEM;
 
-	bb->ppgtt = (s->buf_addr_type == GTT_BUFFER) ? false : true;
+	bb->ppgtt = s->buf_addr_type != GTT_BUFFER;
 
 	/*
 	 * The start_offset stores the batch buffer's start gma's
-- 
2.34.1

