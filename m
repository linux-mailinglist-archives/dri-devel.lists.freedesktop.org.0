Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27623736405
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4613210E26D;
	Tue, 20 Jun 2023 07:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2138.outbound.protection.outlook.com [40.107.117.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3210E1EA;
 Mon, 19 Jun 2023 11:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awC8UeIvXSoocPfEdYGvseyblw0xw5ADzb1+G5HMzoBzxVUtNhBJU1t4Hm3awLWFwE9SOLzktA9TAKQvlhnAh7Gufl2iUIEi8Z5dlbsCy28YR62xVvIGD/4NXfMbaP1t/ODJisuOy59tLoB2hV3MElOw6fXbq5Oqusq/W7oGNFtUHArVANHbA3j+qiCn95JK6LdN4jb9ScZtkf4SDRa/Psmuk2YJXnMctk2IGbXGKj4S5mpMKrpuIQCENTiwZPa8ZzC3FzKaYcn6uRdPSi76eBX0mMb2iK+ovXDZq5qQeb5ILsDqefYAwAmFJMgO+GctkO+gX6wm7bGubg3OTsWfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivJsXuB2YQe25+wDdOAG6THiewWW1JCsiheI1umJqfw=;
 b=Dj9nWLVP/DFK8zqnunmZegmH6T46JKG0XYLPBOA01zyo81HjjfzbToxYGmrnyD8sHaKB6/Bl/8gnyzTqbR9L54RLOc5SQIEi2RcG3STrgqTzD2UFRiQufHlYNTwNJtipB8chwtC89YGKu1e1icmCYVD5vSQkNji0BcgtpNgr/Ox6Bo8l5GNXvhiOLo//31L6SN8AtJkGPivHIbrgqO6RthoWluoqdSuDTVhx80Di1gOQDRsZDLrFY8/RMCsg5b6pyQsiN7I4AGTpjPqmqpvo2/4hRPiqQdxRyBvN/ft728mO3I5aT16myQ8rVEbEm1aKZtcsz/1bTG+b3nMrsmgpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivJsXuB2YQe25+wDdOAG6THiewWW1JCsiheI1umJqfw=;
 b=D1ls8N7BTi9azjRo8l+JW1Zoq0HyS/4ukDGP8sclshhV9iDaZqxlEfRrJZL2TPcBPGZsraUKF2rWnH7pfVFL0CM2v1k/NDEzoRZC/5z4gwOsZ5IyV/+afUOdK9oDlln3YjefekBOjVzhP2a6uS58gwJkCVRmguT/nPM91uiq1/uJtJTtO3tvIRkiPt8OeiXJQvWJkrc0YyPHOAulVAa50vpGZ3AVRsQtvSt9hLpxHZwC0WLuyp1NIcDXec5G8xRfKQxUu/hz0+7GsoVZmz5lbf7VAi/hw8eDrftTVbBGULIWVU73MTG74JlqwG//AHuKNjUqEQK1rebHkd6mC0ifqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5)
 by TYZPR06MB6566.apcprd06.prod.outlook.com (2603:1096:400:454::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:00:53 +0000
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c]) by SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c%6]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:00:53 +0000
From: Li Dong <lidong@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aric Cyr <aric.cyr@amd.com>,
 Tom Rix <trix@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>,
 "Leo (Hanghong) Ma" <hanghong.ma@amd.com>, Li Dong <lidong@vivo.com>,
 Dillon Varone <Dillon.Varone@amd.com>, Austin Zheng <austin.zheng@amd.com>,
 Mike Hsieh <Mike.Hsieh@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: drm/amd: Fix traditional comparison using max method
Date: Mon, 19 Jun 2023 18:54:45 +0800
Message-Id: <20230619105514.1888-1-lidong@vivo.com>
X-Mailer: git-send-email 2.31.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0030.jpnprd01.prod.outlook.com
 (2603:1096:404:28::18) To SEZPR06MB5022.apcprd06.prod.outlook.com
 (2603:1096:101:48::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5022:EE_|TYZPR06MB6566:EE_
X-MS-Office365-Filtering-Correlation-Id: 061b6f3b-f862-4025-5d1a-08db70b472f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5OB6F7x2elN9xCqCf/TNGmDdR8bVTBQT3tJOwa3bAzQNckTa7FBOWrrjfVL7CvtSDS6Et9nHw7D2eYilnYXkKBpk7aMmqHE2g2N2OqH74oOHhg+jMAO/2FeG+Yl45NoaxSertxgaZDRXxwGsngPtXpjmHAGDWBOS7jUXstqNrcvYhwR+fG+yZfHd97MfNs/MVZuf+TNvfZLkqKY9W85ysndiRNycWkIeTgTSLk5Gktb5E4UDZikvUf1ON1f+GYvWxTn399DVREokSPqq12Al6dsSDBYVHY5dl+w4bY68g/Dbl1RjyH5IDDabpcU42eQg1IoJNtx0Z3qtA5TC3a+dQ5kpyk1LHz6pAA+zu43SCmmu47JQXg9nitl3hIkA4qOFo4RYdKMp4pRPEYgNqlsgVQVLMywmMZHhqYkoNhpN+SqjSEDevqTm1D9BikbJaFDd2k0R2moqo00XZ+0FU1AHwO+IY01SPu7JGyTb832vOZNbLqJx5hWlMwqJVHOWJOGAh8zTu+uqVHm6N0+4V1bMXqgcKPekKFnxuNusXHE7u969Do9kV3EjAAn5n0drWr9qMBsBiGOKnH8axtmTC4BPZgbsBopB2Wo2GnGiH/noURQaUmuQW3yLoOZKpJTPSK4lKoXPVC6Jv+8wA6K9TFNlpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5022.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39850400004)(346002)(136003)(396003)(366004)(451199021)(478600001)(83380400001)(86362001)(107886003)(6486002)(52116002)(6666004)(316002)(38350700002)(921005)(66556008)(66476007)(4326008)(66946007)(38100700002)(1076003)(6506007)(6512007)(26005)(186003)(110136005)(2616005)(8676002)(8936002)(7416002)(2906002)(5660300002)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dHfrkXeJ+aWLt6NXHGKX10UD+ocpvbEGlpcSSBpmvskth7Saq8DPoLvlatU1?=
 =?us-ascii?Q?czuRvkLU/GNB+CFdkDB+P1SYbVr5VzILDIn3uJg7fK30cdY2yBe90lI5czrF?=
 =?us-ascii?Q?MH1f9znks8roVAdlZPsIgq5bXb0L3bZY2yCaeV1hEnjQRkxQI0MJKt51Wt0I?=
 =?us-ascii?Q?tKr4/GTVOzrFI/qKJUF9CfDLd2UJm8aWVSido5gQQzEBLEIQmRcYCEI81ygG?=
 =?us-ascii?Q?mklVoh9128rXIURRjgvUrNn8o1CTvjYnvvHwcGMZWwe6ZzK5XwU5azjYA3lg?=
 =?us-ascii?Q?oUqfWeUoakvrpnJBWMB8aTxr4EFB8xY0pwyF9I32nIHxI4dH6fB/kboCsBgX?=
 =?us-ascii?Q?9XhKYZZ50EPpLi8NYEedxtzWcZVJR33oFQGqwcou+njsKVcC0ja4OVgKiHUD?=
 =?us-ascii?Q?8/klJmrN4mjg81xIqRdqr6/tJHr+7b5Zz4rCv/1xA0BGeUxKRJo2dsfIM5xu?=
 =?us-ascii?Q?2ylIBzffbidsIU1lMBSnN2wqwxjg5jP8lymry0LJwH9fEt4ckNze1Di8u5mL?=
 =?us-ascii?Q?TBQ7xCNyNLziQWBF2or34IhrREi2DzBnmzfRG4R/ICzciL8BZsHk6a47sYLY?=
 =?us-ascii?Q?Q+Aku5xiZYC6v8DqVbrY4JYueObLjdjIUWCyf5V7hEAHTa5V1GQ/QbasPrL7?=
 =?us-ascii?Q?Q2XobAUG6RTLybuGMCSNtwVhLghqdCdC37ZmhUqNtIgBIL6Q9S35O3fp4zus?=
 =?us-ascii?Q?6bZxJWBJ/Fz/L8TYHNY3iMcSB8LN3bYRR3NLYg9g1fruVBFVC8aKhcf0Y+dQ?=
 =?us-ascii?Q?tgydx8jFR+XeU/xBBySR3yIh83Dyq79U6lD79tC9ctnf7sYiypVWhMSzTubx?=
 =?us-ascii?Q?1T0Ym6RM60NRtYkdM57he+aj3gPVmDKtqykPcYPBpN7rMOzfbXF/2OtxhG3P?=
 =?us-ascii?Q?yajav+8P+4ncOf99SAYjnv3//BQACAWhQEez50IYkZKjylEdoZrOzdtPPtw0?=
 =?us-ascii?Q?w+/Zi13SlEjyiBTYk0Y7d9hnH5jOAFvDFgaGXEkUe2YZSoJ9pZEuHJN4sCNG?=
 =?us-ascii?Q?nsKRfe0EqbaNlKAiI/FyBhwmPSkKF5bQnv+/QRC0hSngSkcsbKF+Ft8Cg3PA?=
 =?us-ascii?Q?xMsgNkpayjPTOUOPsw5hkKrCr2VpYoOn0ACVdgu34+XIt002bbyAjyJ4WzoZ?=
 =?us-ascii?Q?d/CeWd0p5gRthOkVqF69UFlxP8iEMy+7sFcSvbSI2MdwNU75hWgAsvWJXgy3?=
 =?us-ascii?Q?dQkS0yECG3HFv0VmYRVgOmzEwfSg6N9Ki84ORkmbE0xKbPzSWC8KbTDW6tY+?=
 =?us-ascii?Q?HihjPOvtiKG8sj+o3cZ3ZAEDEg42b7CPJWRK2oXcyRs2e8u/0N16LOQulnED?=
 =?us-ascii?Q?ULsk/sHbnLPuxbDWNe9RCkzZi8HuvCHRpiaFyhO+8wL0nKwyUSCAzK8eNnNk?=
 =?us-ascii?Q?Pw4P47qzp+J8PyrYViTAqSpICsLc2c/4AvcOiuOvHk9ZdfvZyuno+Njuqwhj?=
 =?us-ascii?Q?NOXU500KanPQQEpsIfqwE3j/3p4FoKEeXQWqWaYlt5KqsNV1kQVNfXZtj4PZ?=
 =?us-ascii?Q?Wres30O23FipdFae5jbsR+L1xLStDuzSPhKkFlmMqjRmtO6Ce94pcQq3JVIt?=
 =?us-ascii?Q?H3v42iM3UE55M7+3x/UfJYsU16pzlzfrj81w2upZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061b6f3b-f862-4025-5d1a-08db70b472f0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5022.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:00:53.1894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNhjA7SaKE19oryodqvX6Touw3yOPA8h7S+V0F8bLdmnd2Hv1KG2+EkpYDVLY5GLNBDlqFQZSQRvJiQM/FUnmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6566
X-Mailman-Approved-At: Tue, 20 Jun 2023 07:08:55 +0000
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It would be better to replace the traditional ternary conditional operator with max()

Signed-off-by: Li Dong <lidong@vivo.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index dbd60811f95d..a5eabde53fa4 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1005,8 +1005,7 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
 			(stream->timing.h_total * stream->ctx->dc->caps.max_v_total));
 	}
 	/* Limit minimum refresh rate to what can be supported by hardware */
-	min_refresh_in_uhz = min_hardware_refresh_in_uhz > in_config->min_refresh_in_uhz ?
-		min_hardware_refresh_in_uhz : in_config->min_refresh_in_uhz;
+	min_refresh_in_uhz = max(min_hardware_refresh_in_uhz, in_config->min_refresh_in_uhz);
 	max_refresh_in_uhz = in_config->max_refresh_in_uhz;
 
 	/* Full range may be larger than current video timing, so cap at nominal */
-- 
2.31.1.windows.1

