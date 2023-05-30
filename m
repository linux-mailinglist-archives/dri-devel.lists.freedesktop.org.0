Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44EEB715898
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 10:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EBA10E2F9;
	Tue, 30 May 2023 08:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2114.outbound.protection.outlook.com [40.107.215.114])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C80D10E319;
 Tue, 30 May 2023 02:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdG9qL7n6SeY+0F7mVWLqXfsXlqdkfXpt578IovnTJX3nVnZqQidgOTqRwmNAcnFvB4CKVoPwAK4aXaTRCGXkOrimDJ8JLZS4CgFrzAvNp5vSr9IGb36NiXeaOUfgFS9+qRFsp8REJnwdoOKFtMaCj0IiTa2DIApYnJ1ypSTYsHqfE19cBTkCeXN3kRpOCuTL5VvLUI60hcDCWDIeqnKKbgPTbj2BEsFxwSp8EdwwCQsHS6Cawi551zoIQ2ET1EwOdOulUZ6KOQ9um4KV+V47B+cVAygMrwcHvNGX/bIGsOBBOArhOq7wLN0oqijOSO0y6py1g4Bsx6RQxewRItQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZEE4sNFdgMdVs70pUWnwNW8fAEBYFJxb7UjnreesYo=;
 b=MRyAlGRQ1whMraMLgBJfp/ujF7UK3g4NctbwdKyXLYkIjO8CfjSea8FxA/tydzwyElkVI0AbkRkOcX3kXj377WwxpGVbjWD5ksi1iN0iRoM8hy9bnvazXgCPAuxKcZAS68MoUe86iyQMWvuAIS9qtI9rHA8U30N5cWD2sE7XUkKr//Q1O1oalFPjV24RLMJHPSBCDBN5LXZDJnzGKWQSEs7PHgA8sKbdaUjbO8QdaWCoiSfcDpezE0lESXqM9+2PoLVJk6UYGq/TTty4iOvD1SZfNEfQJB/PSucc5u5FlcLOx6vpratgkndyz2jkiAlNl2BP6MWmEM2lSYNruM66Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZEE4sNFdgMdVs70pUWnwNW8fAEBYFJxb7UjnreesYo=;
 b=Djv7E0ypiHS3fUqB4oIzCrgLBbsvpSlUextD8qIlAcVqSk18XdErcllo9IhgKkF6FAl4oOeNvEzz2LtjMXhVMfJKz/22uMfc2UKySHYj2elHk0Y0xKhSOTx5qpf8nLGQGxAFhQXxkr3J/YJUJ0D9s3jSsl6AFQM1ZhbG/Z5jrhUo/O/21rjKD1J/f+ke17CT0A/SaR+K/DpIMHo/BfkbeLy/8Nwldh6E9M1R9hXXLH7d1EHN3DKmkRmdEa1S5xKwNHpHLgttPLZSiMVMLYFd5XNsHwA0zkn1IARLK4wKz/GHZ5/Z7ydXYeSjOSzpHj1D1NCQl26wh5uhjO7kM+UqIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com (2603:1096:400:451::6)
 by KL1PR0601MB4433.apcprd06.prod.outlook.com (2603:1096:820:7b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 02:37:44 +0000
Received: from TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e]) by TYZPR06MB6697.apcprd06.prod.outlook.com
 ([fe80::f652:a96b:482:409e%5]) with mapi id 15.20.6433.018; Tue, 30 May 2023
 02:37:44 +0000
From: Lu Hongfei <luhongfei@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jun Lei <jun.lei@amd.com>,
 Alvin Lee <Alvin.Lee2@amd.com>, Nevenko Stupar <Nevenko.Stupar@amd.com>,
 Dillon Varone <Dillon.Varone@amd.com>, George Shen <george.shen@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: Replace the ternary conditional operator with max()
Date: Tue, 30 May 2023 10:37:26 +0800
Message-Id: <20230530023731.13534-1-luhongfei@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To TYZPR06MB6697.apcprd06.prod.outlook.com
 (2603:1096:400:451::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6697:EE_|KL1PR0601MB4433:EE_
X-MS-Office365-Filtering-Correlation-Id: f261455f-d6e5-4f57-5b07-08db60b6d8a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vr22PIl5yQw4bQK0lhtEhQJsjjoniAbR4g8EUjssqVhqdFbPg/c1vyWsE61I9W1YnPW7yc7lAJgfNRseb37JDAoG7GD8zwp36bR5vjvUsgWqoC9I9xO4MyReMjcHoQM/xfdwU1IzdRcilpTsLSj3kzdNda3tunJAK77YFHL7XH7SyNqCEtMCX3rKijWft7RtgclsVw9GbSNUAUfubc53ZLGHTKLBfdvvlHa28ICsgYxCQBdwRhGdu2YjAQPyOSrNyU5bMVWZ5FcSc+YHWNrUrcMolkw4xfqd9WyRp1hnuvVijoOIJaa4r1PFvm0hMLYjFMwcqRHheadV9bN7BNm//PTeCYgeCh8Y5qubsz54v/wmAdPkJX/j+I/uhKw+CdiXuHCYMqQw/a/WcmrmUh4tcwz91SaBBRNnj4w0aCkGYfXQ5srgGzCWwfYVcj7kjue4MI2/hxYyPvz3XBEmPdRCf+dzUt1QkDsXSDSoD5MZFiqji+yyhXU7qothB2mx6u4GLr6gbM8aEsEdyf8PiDuFvzRBcMuuUr8bhVOgmDt48o/oDioIKBruO8ceGKCLo/DPEUeGvczP5qTS1w+EhA1BcAfSREcgUaNNjG2S9UrHq5/Aix40fLhn/N/TPageewrBtmv3RB+NIRJqr7hpvewm7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6697.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(478600001)(110136005)(8676002)(8936002)(7416002)(5660300002)(36756003)(2906002)(86362001)(66476007)(921005)(4326008)(66556008)(66946007)(316002)(38350700002)(38100700002)(41300700001)(2616005)(107886003)(186003)(6506007)(1076003)(26005)(6512007)(52116002)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1E8KOIfQbUG6RvcYLJjc9oy0wSuvqiE4kOLu5FrCicXYxWu8jfNYSGa1eoq+?=
 =?us-ascii?Q?LM7b7fqSjqVv3vV1wTR2Rd74XIGhOSXYmS5riCrn2HJU+XIJNcY1gGv5/v5x?=
 =?us-ascii?Q?EmLEIJAS36XanZQBrd/7CC3C19uSsCBNyz24fjXnDPkovfsc7EZ8YsXFibwf?=
 =?us-ascii?Q?xcq3mbBWCAfeXncGFodhZpae9RW4U9vUos/OGwR3YZdbJ/eD032mLEcPRQeC?=
 =?us-ascii?Q?eB9mpAXwolzLUkuvbJ2gwfpt+OYnmKN3bVUDeUT95DaHmsFjWQSNGUt37xPl?=
 =?us-ascii?Q?iarzj3AYl1Nl7vIuOmTcwFQpcIlOTFOExPQeqiSCLViM6hTI1ENLx8117d7L?=
 =?us-ascii?Q?6jqradbTiKCut/2X16i09DUEMIpVZnuqy7tMvMfHU9BvqSmh+iS7TDxConrt?=
 =?us-ascii?Q?/pFMUTt9mmu3uB/g/7NvVBzEIj1q3rjxFzOZfhHSvpkHD6qmjFskDps+siYB?=
 =?us-ascii?Q?JhFi+nDDuPXxCSVAYE1zDrkyEzG4LYYlQaRgaoai3hzinEjeEf79VWpdrupz?=
 =?us-ascii?Q?zZqzhll+AKIPyTqSwnvnFqk2IQULonqJyFlXzODDq2TbD6LJ2txVLat+sLO3?=
 =?us-ascii?Q?BIDmc+KkqXtqklsrSxM0qeQkhshuelv3EyD+oQC+muyl2k7lvzYwJ9xcvOJp?=
 =?us-ascii?Q?WRmjgIoIacG/VCW8CCknyaPOfHtTamAd/uEX37TkcZdyMD0SAQYgf15lTeqT?=
 =?us-ascii?Q?d3P8oAni9ZOvjMFxk/ZMKAm1Iy57kDwBsK8QH8h3crGyNS0GKi5TqeJ5MkEe?=
 =?us-ascii?Q?6vl+nLlvWWwvOTstp8U5fkFC/jYV50Jh0Au6AAPKq5gwcqwWDQe2oe06vfWO?=
 =?us-ascii?Q?Jz/0ZtevDfONsZoYroJUye8deCqmU9owwU5bBWwxmj/zl0qO9sx3qPnzyRq4?=
 =?us-ascii?Q?A0FO8loKq/wIS1zXOtHEo217h3fIprEQ9xGVAfxgZ9H6YPaZzMqxKwhnE426?=
 =?us-ascii?Q?subP1zcIkBuk4205DYHHkirKUKiETGo2XcP9o0CGvK+sM/NgqMS9TtNjK2yS?=
 =?us-ascii?Q?XqxgL984wR94VUd80o53aZWAk0Rl/TlisRBTh8SgVEsGEkyLfrx8v/PyDJ3+?=
 =?us-ascii?Q?vZxpgthsdLC6Pj6k6WZG9D4DOft9ZltB/eMFyLE9LVy6E3Ruvt0mIlLw6ITu?=
 =?us-ascii?Q?a5NthlU+4Lm7lMdAhxG4o/Ya8jTCjv4sGc6xsyZpJjCS23Y+omyQxro5YrHE?=
 =?us-ascii?Q?P8xql8UBw0BVIxSyNSPRbBsQiT2/pnPmJB1ICT6jhCLhbvVZA/RlMaD4giZP?=
 =?us-ascii?Q?efGATyfP4G0af49voZg2+6nn6+lRK/1liYqWxt8Nw+CK1CZ5aK4gxk+HgwMI?=
 =?us-ascii?Q?mCtec8YyAc5vld2+nP1DX+eRWJiXV/yr+16aQm0D+3u45Q9UBYuMOlKkYaco?=
 =?us-ascii?Q?fCEtPwlpBxmJn5VQaIHf6y1rtMCEcjR94W1O2jCk6GVzQr45wuxXxGmDNjkU?=
 =?us-ascii?Q?BLOO4RUlXiYJKCQWq3Ae95I/qQ0WpQpS9ktPwajmRlVSmMP6aljFAfg1t7iL?=
 =?us-ascii?Q?PCR5LtgTCagSoeU7WcXlk83D0q8P7IEgjqhaeIwdpZIx73GMBw1UP3hGqaMx?=
 =?us-ascii?Q?cJnmC5bAlFZEmghEScF7vSfEL7v7U7d9DbKXVJks?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f261455f-d6e5-4f57-5b07-08db60b6d8a0
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6697.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 02:37:43.9488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8NZdCJdJ5kEOocRWQgqzNjK/U4E3MTvhlaHzkROvoY4KhW3tu+uL3lzdTvMURT4GxLNPIx7a9+eA8J5LW6/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4433
X-Mailman-Approved-At: Tue, 30 May 2023 08:33:29 +0000
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It would be better to replace the traditional ternary conditional
operator with max()

Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
index 47beb4ea779d..bbc1f2011e99
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
@@ -915,7 +915,7 @@ static bool subvp_drr_schedulable(struct dc *dc, struct dc_state *context, struc
 	stretched_drr_us = drr_frame_us + mall_region_us + SUBVP_DRR_MARGIN_US;
 	drr_stretched_vblank_us = (drr_timing->v_total - drr_timing->v_addressable) * drr_timing->h_total /
 			(double)(drr_timing->pix_clk_100hz * 100) * 1000000 + (stretched_drr_us - drr_frame_us);
-	max_vblank_mallregion = drr_stretched_vblank_us > mall_region_us ? drr_stretched_vblank_us : mall_region_us;
+	max_vblank_mallregion = max(drr_stretched_vblank_us, mall_region_us);
 
 	/* We consider SubVP + DRR schedulable if the stretched frame duration of the DRR display (i.e. the
 	 * highest refresh rate + margin that can support UCLK P-State switch) passes the static analysis
@@ -1008,7 +1008,7 @@ static bool subvp_vblank_schedulable(struct dc *dc, struct dc_state *context)
 				(double)(vblank_timing->pix_clk_100hz * 100) * 1000000;
 		subvp_active_us = main_timing->v_addressable * main_timing->h_total /
 				(double)(main_timing->pix_clk_100hz * 100) * 1000000;
-		max_vblank_mallregion = vblank_blank_us > mall_region_us ? vblank_blank_us : mall_region_us;
+		max_vblank_mallregion = max(vblank_blank_us, mall_region_us);
 
 		// Schedulable if VACTIVE region of the SubVP pipe can fit the MALL prefetch, VBLANK frame time,
 		// and the max of (VBLANK blanking time, MALL region)
-- 
2.39.0

