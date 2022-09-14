Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA335B8218
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 09:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285D610E89B;
	Wed, 14 Sep 2022 07:38:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2090.outbound.protection.outlook.com [40.107.215.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3A10E89A;
 Wed, 14 Sep 2022 07:38:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqzF7aeNkuHnObf888xb6CXFpSpAcr9z2fYolv223c4lTAHpPD3BYrJaA4S5He1SYoLspw3i6b294powHpGy/d9NVarSk/FuXdIIIr2wGRIMdaZQKFSHnI1gXcEtplPOlOh8YsYYdz4l50rUd9E+gJB+AZdoSYG9tWgQxFxQzbGTUn8CipEfRddUfGvUBdeFvF0Zp+kDz/ntzkimC9b75de/lPZEJP4jBykFLcUGsj4+dQp5UN4psf586o1hUCZl5kNPSJpxCf7xp43igeX3x3e6teF9NkCU200gTLql8AxSSunt3alOetc3r5Q8j1qk2WSg31vg/J6RxRaBY/QXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IWLZQNQOQ6a2pKBJctd2TrxGLgngVKO0Vu0wLLdXCW4=;
 b=U/1Y1bHfvct6x3SPAOo5h63sSTuf7qohzMi/R+SG3WS/MYwmyoNTB4VUvyops20kGdGp+tnkE5HSjnPXyw7cRpBHm6v7UqLRgRXBptQfkEerip3LmjZWDqoCCtdS627OobdeQz2vdocTyzzunOvvakzreQFEJAHLhDC6X3bc6C21P2Kvh1c87+Xfd0SbNmw8RssFGOXuRh8OSFu2+BJpFQA6nAffhxoNitiGRwZR8H2SeyK1m0796mnUiA0OynOu/kCe39PLjonR2QTXBhvSjzFMRamlMJganBxTo3j1SoR2nl73tGpOK87tHxT9fxTMMTWwKXO25qBnSxFvAENkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IWLZQNQOQ6a2pKBJctd2TrxGLgngVKO0Vu0wLLdXCW4=;
 b=KVzzAjB73ojwZDdw8e/ECPbSbSN6W2O1/9l46jx56p4u4us6OtIMbwTbnVum/mKA6pDjjFt4J36F2OBnqzFb79+NmKvPKYVIkys9T/IOE0ZHHhjmrzRJufDcLUZDNDGuf53z5GkN+MFzBvrhFBZzfcaa2AQWBkLAYpE0HIE+mzzIwrqnazRQmsqDHO9l40EJqQfoIPjkgQ/klDRSBEqTmYbLf0Y5hcTUNHPhvYb0/vF1yYlmad3znnwixVd2ukbvVL5yOdar+vo7hFMOzaNAbJ702M6duRfe5WVO5PwNJr7zZMFJvlrWoV6TudPWe3FeJl2GYsc29zi09NYk+Deolw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by TY0PR06MB5628.apcprd06.prod.outlook.com (2603:1096:400:31f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.21; Wed, 14 Sep
 2022 07:38:44 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::f9ad:4efb:64f6:856b]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::f9ad:4efb:64f6:856b%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 07:38:44 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jerry Zuo <jerry.zuo@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 Leo Chen <SanChuan.Chen@amd.com>, George Shen <george.shen@amd.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Yang Li <yang.lee@linux.alibaba.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu/display: using swap() instead of temp variable
Date: Wed, 14 Sep 2022 00:36:43 -0700
Message-Id: <20220914073756.4736-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4173:EE_|TY0PR06MB5628:EE_
X-MS-Office365-Filtering-Correlation-Id: b1eac043-235b-4706-e34b-08da962426db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOidmZf0hq7quabtRp8w8ioxNdJFJUnk2L6AsPbLrZHSWn6qqVpTQCsc8sxHrX57fVbu+UHzwHfzN1ceBgtMdgjacUIFkoCp7GM+wtgQjJzGBizwxfnRxweiR2vgZkewg8fSXyBLCnEDGmcQk9AEt1ZJKZ08K09ILr1ifJevr2bhogRjvyX8yJlzkXk6BNSddBV7HTGBA+DKIP2XNxrv+JSCQRPzuDrHYD1Vh7hTJ60nkB0gLv8RXglnl6K0AaHopDh3Hvkfw7RZ68y7+iBGHgJa93SKFIhzt4yE7R1Y2qbyPYY2MuayrFZAc5C3/oiT5kK5JbXDPDPQsojMNp9lTWrKrIiUF9qDAY31OqZX8cXUIHJtiOYknHWFe0jNflwcI+osVq3vQqINMTkhLHwKWGETcL1XwyDOGhC9God9x3BrpNdWyPzI/RV41HrmLG5dp37ca7O9bzouqqSkIBGFnOCCpTZQBTLStTNdT6G9N/DbuBD+ah51TRQPFQmWzelzlcs078smjNR7qclHiMpVKOAJrD4zdT1TydZX/2B/HL7TD/Wj/3MNTgHG6g7GcmEu6T52ZVIWYO/oNNHuSUuSeXEIsDSD/M2gydnijolvGW2oythKIaPa8aFXuHEp/qKlhHtmcQfUbwC21+HJeM0/x+7ILsZ3nIKrDPflEwTDkwYT/NrPCnOQ2htQLSI8zoCEo+TV4Ni3G2b9qs8B222abLGbrKx6EtDpqV/Wh2/bzUd3pUNz2KMQihNAk63FGE7iUpuqmiaWsSZQfiDje6/PZrejkZFPyZVRUtF4zKktVQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199015)(478600001)(2616005)(107886003)(110136005)(66476007)(52116002)(2906002)(5660300002)(38100700002)(66946007)(26005)(36756003)(83380400001)(6512007)(41300700001)(7416002)(1076003)(186003)(86362001)(6506007)(921005)(66556008)(8676002)(6486002)(38350700002)(4326008)(8936002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oTMSLbaxaFzbypFkMHdg9ls8CKFFUilvxYQ+UHAhEiE2snOmJ9unVUvtzb5Q?=
 =?us-ascii?Q?dHue/p/wGmWUYptEu5cAmwBwehM/oujQNF1R1tbg6vf8qEUUiw9D+jt+NW/w?=
 =?us-ascii?Q?npDD1bBKrPStDUp02GzLUgOBAB6Bb6+Nh1FRqFchMUQXYjny5dbuEPiq3apX?=
 =?us-ascii?Q?08oRutKFTUg5oS/JoTQv5WiHCJzinQDqAzKkHbQldLeJARylnw7TV57S6PA6?=
 =?us-ascii?Q?aiuaEODa9/NMEjGWfBT5bOfhS87pQ7JtFIVKfk4RzRcOtyaQ5aUQJj7HF5rU?=
 =?us-ascii?Q?4DghD9O8UlD8+vxhPXfo3rbAFQhaSXGnheQ2Bhx8mLAJ/X+vAFhqZ/YRpaZi?=
 =?us-ascii?Q?vE5gDp8kHU0Xqrp6rCcbp1qF6NetB9W+n6vcwWG7x9zGuhVCPvU2bGt5vann?=
 =?us-ascii?Q?OAEG/YNFgH4ck4eAuVcGOB78og0BRWP65d6NcGxfzMtRotLwNeYAiRL24BUP?=
 =?us-ascii?Q?A5MXHVZFvtOB5+etjOBPi2qSSegnl3Xz06nQluNk8sIe7SoCoK+iQx0LBrB5?=
 =?us-ascii?Q?dlqq2T6NaMzKnmFnTp3H/3ZjRMMFBOPqqcZSZ8yURj74GeGR02Z7ixKbocTM?=
 =?us-ascii?Q?tLgMMBGivFH8/MWDxWz8M9BiLi/YCG15snpwYBlvBVcFfRc5GMUihtZ5bw9W?=
 =?us-ascii?Q?BV5RY55ZvSzuobU4M9EtS4TiPFHxdXGQhn8NNnZzYkcXfsxHC1c5LhCBJiO2?=
 =?us-ascii?Q?ugdvVfmoZ8eicGOVOHxJwtA6ZQmShxNv7u5koBcpEBG8XO6ifoHOp8I0MH5c?=
 =?us-ascii?Q?dj7A2z/QKr6zArNgI2Aga2Ml9a+rWfMAk+mvMOPTPzNzqC26uK41GExvG+0r?=
 =?us-ascii?Q?oCbMUKpbpSNG3Rx3u/jk+7s/2LJdG5Vsxn1RRvzrgfm19TyZ3Gg9H9MOfZZF?=
 =?us-ascii?Q?zx2bVjWIO1wmUThyUU38xm0ly1x7z/AXvR6azCaBuEeizfXUjxT/9p+8ZK5Y?=
 =?us-ascii?Q?4/SPLr7hinOmfwSoE4/S+JHq4FTq+QPQTxcAQe6Inivjhjt10aPd7ln7MDnE?=
 =?us-ascii?Q?u1oiHg/TaY+8EoJlB1ffANGIy2KZJ6Ovj8ohpPH9W9qxzqgZtqPRn0s0sKcT?=
 =?us-ascii?Q?7o61pQB1FvTsC4sCtzNC1P5AK/+aQUHUL6b1G2dn2Q4wD5V4XZPicCdZwpyc?=
 =?us-ascii?Q?MbiezHCo4u38xYZJ5gQJRacBfiKbCerojnf7wer/fPcpug7nkP1jj4J/M5tq?=
 =?us-ascii?Q?L+zyGBvqEc3Ug0srW4jFCnrMpYA4AwVzhpPM1KcQTkMs5hjBghE0XWStPJs1?=
 =?us-ascii?Q?CahAYqzI3YLyH/XCsvba3d3lTIEpKmsSss0gl4eVczHfOFrhcqC40w/dJSSo?=
 =?us-ascii?Q?lpkUGmXFQBWP87py2uAIijHwVamxT0AmH77GdHyAyGwIzBjIL2fS/QB3sX8z?=
 =?us-ascii?Q?uRWhWYo5i/tvWUJxB67dghDwC2wWIB1Q6dnC20YHh8tUly5Ws3FjKFX0rDsC?=
 =?us-ascii?Q?uzKxPrOTddzq8PVRqQ+9dZDnxlATb99v8hPrL+KiWNckxd/qS0aol8r3gckl?=
 =?us-ascii?Q?DZQ5Kz5RFO8qqBrTuB5iGFFKXvkvsNiodchDLEaPuPwuOrgegMQIuOdC9yUt?=
 =?us-ascii?Q?BynaTG8wjH71peCNJO5D6ZfAK/PpN/m/rOD/XmS7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eac043-235b-4706-e34b-08da962426db
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 07:38:44.2998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z7jcILwfhUBqce/uWr5MoJv3eOv2M4+TenTNrF7fDmhvJtaVDfPZgQdLmvpupS5xNlDVyKEJaNsJQi0UXi9N0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5628
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
Cc: Yihao Han <hanyihao@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use swap() instead of the temp variable to swap values.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
index 85ed0afb74a9..7ef528c5b700 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
@@ -2907,7 +2907,6 @@ static enum bp_result construct_integrated_info(
 	struct atom_common_table_header *header;
 	struct atom_data_revision revision;
 
-	struct clock_voltage_caps temp = {0, 0};
 	uint32_t i;
 	uint32_t j;
 
@@ -2983,10 +2982,7 @@ static enum bp_result construct_integrated_info(
 				info->disp_clk_voltage[j-1].max_supported_clk
 				) {
 				/* swap j and j - 1*/
-				temp = info->disp_clk_voltage[j-1];
-				info->disp_clk_voltage[j-1] =
-					info->disp_clk_voltage[j];
-				info->disp_clk_voltage[j] = temp;
+				swap(info->disp_clk_voltage[j-1], info->disp_clk_voltage[j]);
 			}
 		}
 	}
-- 
2.17.1

