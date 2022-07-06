Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8DE568312
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 11:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B02D112D26;
	Wed,  6 Jul 2022 09:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2106.outbound.protection.outlook.com [40.107.215.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47422112D24;
 Wed,  6 Jul 2022 09:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrxKc/xE3GUZtV85qIQ4rxUdHxu6QhJGowQ/29o7BHnEhykMH4pAxySYvkoomEVLQ4MjCuh4S1R8aICql5FUQwrovFh/P+BZElnF7HwyBt1twyPFHfD8ogc/o4AqVxgz/9S8WYK992Em+TQf6vv4fDHR1QvYBw9EY62k32RIlF4+RP1iDGQtZkr8DOyH0akwiO04vw4wJKkRLuV/xWEO/qVJoSXvqJBaOFyVIzeR08wPTgAAm8feldsYLT01S6AmURIC1lxdSf3/r//97kaj3YzS1W4EXl9zn4IZHfY32PzRP0e21ZLg0laJJ3aVmK4xlZpf3a8Qijcn6REXiaBVpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rNbLZUpRrbHGGuwAWKGyGWO4nihs2eiCveyXEvYcTk=;
 b=U14gcL0CpnoMBfgA6oV8gno/nBj1qN5Prd/dQOadXoDtPovCNvsG7XTg/pBRReCpXTbCMtmY5am6u+hjBEP8MCVu9QecktGKbTY3SQrFIWITCMT/lgjTrMIfJ9+2ZqOF6cCSYv5VH1ANjuBDmRPvZQHHi25U6IB0U9AASuecpn7hapthRp8oQIChjqgM/vhjRifLlObHI/5YfYcYNZAKgERV3biIa4Gv8Brd63KPqwcTNzClPNoZjLF9oEoByQoforKixvYLrRkSdBDXDMpnPRlHqTWjf3HNckvmFXlW4f7g5MZckEX85MXLNqAje9WAWU+UINtBBnTToSkxHELLyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rNbLZUpRrbHGGuwAWKGyGWO4nihs2eiCveyXEvYcTk=;
 b=Zp+gKqUBA8jJFia3DMecQiNZujGgP9YYxU53YciYCEAIDOwOFZSaWwMvhtPW9q2AuDYbJ7pMe9BPUUchxVDjY6A0LQyA0uyt3r4T0XxYcGiswEsPT1FZ8ijqTPTfv5cCxnKmLDNKzLvlUthfzT2O70wPu/cMesn4lhgXW6yj3qg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PS2PR06MB3493.apcprd06.prod.outlook.com (2603:1096:300:63::20)
 by SEZPR06MB5271.apcprd06.prod.outlook.com (2603:1096:101:7a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Wed, 6 Jul
 2022 09:13:59 +0000
Received: from PS2PR06MB3493.apcprd06.prod.outlook.com
 ([fe80::d9bb:28b5:8ef8:952e]) by PS2PR06MB3493.apcprd06.prod.outlook.com
 ([fe80::d9bb:28b5:8ef8:952e%7]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 09:13:58 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Guo Zhengkui <guozhengkui@vivo.com>, Jimmy Kizito <Jimmy.Kizito@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/amd/display: remove repeated includes
Date: Wed,  6 Jul 2022 17:13:27 +0800
Message-Id: <20220706091329.62192-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To PS2PR06MB3493.apcprd06.prod.outlook.com
 (2603:1096:300:63::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35a74bbf-788b-47e9-cc38-08da5f2fdbc6
X-MS-TrafficTypeDiagnostic: SEZPR06MB5271:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5idwzV/FSSeCbADzPASLPDyhGGRG4y6xMeh7zUxRA7avdMsizN7AjugsRcbF+9BHUEJVz0TO+WJT9o4LumwM9/XYF+4NbTm9ivSsYTZgyR80HHTN6GALuBeYL8+RxOWJpKNpUL0xnLz95jAw6U9Cm3QzO3/5OdmDARmA1gO1gSn2M0YnIIMPoq4fwTR/TLEH+jUkiY0wsPV3rtaewE7/OeONo6tCTWwGzZt7Bbc6ky4j4dcqrcGF18yfcPAlClKAnyouY4QqdXhCWABp9OXj2qv4szsMZVOq7a5vPSTryhFyhIZRgDyhe9B/9LSSYKoPe3g9/RU9t3K6DYBbYF1kGwJuUBolo5cO4A1SC03wFtMKT36VYZlyA9z73OCAZNdR7fLcIW8lmTdHGHYlluhOqV9rDmiuArP3Io1ppnmA99zHOaFAFSliAnNLqWI7W6hl0GI99KcQ3OPEfOBs9vet71edb7dNPB7rymxAa1dppgU5nf1g8r4MmYBatetSIfJDS7HXnUpWr80WYTXb12JbNunWAu9ZBidtObct7tDH7hWS1jP9MSWWaFRfujhx0btdx0n9JV+rFZvfyNpkyFGcDdsGjJbJap+ig7xqg/Z4Y206LiwVMCLanRKG04QL4BHqS+a4wiX633ok45AVyAXIK2FBO/EBM6G/+fhCJoe/baGXiXpYq/XH6JM8xqtj5tcSaDI1d/GnXTjV5b1Qzeo2SLx4C4cmm+TUY/KUJVG4mgjZsOBzRrvS88OIsLTqi0Ld+1kEBK+2bcMiS1AmlAIbcPBJGXsusiLpuSdODmssBoQO+186LwbGcKMUQQotdtQxe++ctZ3ch9fanbLcmpux2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PS2PR06MB3493.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(26005)(6512007)(1076003)(52116002)(186003)(86362001)(83380400001)(2616005)(6666004)(2906002)(41300700001)(36756003)(6506007)(38350700002)(38100700002)(8936002)(66556008)(7416002)(110136005)(921005)(478600001)(5660300002)(4744005)(6486002)(4326008)(66946007)(66476007)(8676002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GnAuSeBSs4P32zF8TDhQ35zuw9T43eI0CQ39yyFum3UtCW/gbV6mpdGcfq1J?=
 =?us-ascii?Q?SvUe4yIBzfC7tpp1C4Q38OlAAeC9JcZ8GBh59S+KFpkxtHFapjhHpEttJxoG?=
 =?us-ascii?Q?E+5EwAsp8MYq720t5gAQRXXGcJxuvbh5kBQ2N9KVlXbW2M+xn+3deYKiMuGv?=
 =?us-ascii?Q?4JOWNIr9rfKXdK8S94Gv9JcLhPVKNCsiblcu5rr3d86LdKfQUSvZRgmColco?=
 =?us-ascii?Q?13NC9GtKFzStyJp33QWB2Pc2P2EgiCyv7D/K9b+uFphgBGQfLKV7bDDoTAvi?=
 =?us-ascii?Q?D+5+TAvVsWCo9Vqh1N1r57SENBVWe/gxgkKCwRKxet1lBhNhVP2h2c2jkl4X?=
 =?us-ascii?Q?e2eLVT+ksFEgPtf878R03xXrKW2OgSF/MNi8D0F8MDZaslJsxIx0pnm4zi4f?=
 =?us-ascii?Q?iaUSGzlTg5h7GdlzxX4JxuvHh16plM5v9iTlACN1NvIVG2v0d2sU5ZuwKI5N?=
 =?us-ascii?Q?ybHkzZpzDCffSFrH5hrlQ6u7ly/ksnRijepOriWQqHOPSwhXFYbxFj+G8oa/?=
 =?us-ascii?Q?+aDJW4FrFu9lPod9PyqlVg3p71wMLAjcnHsLcfd3DQ5S5YAs1/qE6YQ8uC49?=
 =?us-ascii?Q?TxhPLhE294MzFGS23PT24lbUpSJX0ewiIGG5oZSqv23aOKBHh7ChZu9thF6h?=
 =?us-ascii?Q?HbbtUv4EoOx2yII/CtfhCjeO70CfMeTsEW+V34SMP/zefo5HsnrpgCEvO92K?=
 =?us-ascii?Q?jEbBb0el1Lt9rCYT0+RV+QTzcOz/zR5//KsnptCDQYDmV+XX+vT1XCjQ3/SB?=
 =?us-ascii?Q?gkQFfTNm6psUPbo0vnuw89XuSEN51hyi98rHM+brozxD9kdQX9TgLpeYfggY?=
 =?us-ascii?Q?67OVkyTH/4Mv4DAzIeacx/BFqp3y4ytbuGMBgnHWrQVwYE5jlmJ4h8HmeMuB?=
 =?us-ascii?Q?rZTiRWHZxj4m2sjo5BNbc//WPtNNpnfiWz2kNP8t4iXM2fp8Akc1Bm3/2xpE?=
 =?us-ascii?Q?96R8kMYNyA1bd6eZfWxWsPIYxdx+Yteip0oYFiQkeLgoEY2ZIQyp0rXDJlw6?=
 =?us-ascii?Q?h9dYDN8XcZHX8SnKrLAycpWANBtTy4C1szkSm2bqePRNc2/z73TxgF69gdot?=
 =?us-ascii?Q?veRbNOYJG6++8X15u2FLJWUak3tE14OOysHJ+DdnwUCtIlUo8OHZ/MRxNbTp?=
 =?us-ascii?Q?Ub6Ir9ZjVOm2WZyblec4j0Rs/udEZ1EeY7TA1jTLssHuGnEDM7G0OzIAycJB?=
 =?us-ascii?Q?aiKVEXeLLOY/7OwuedrdzgYzilQ8n66OMPIdyz7tD0H8aLCOZCHjKZuoPWzy?=
 =?us-ascii?Q?EIiAHTgy946UB2GvxK1PtC5g+ky5KqsjlSNM5cjgi1l7RyqeRxf51JC2oizC?=
 =?us-ascii?Q?DPgek1XAGNK2JA4xfPxV2FuDZaj4lYJS/Ox0ct6/wEOjjooMS0R2Le+cIwTf?=
 =?us-ascii?Q?IHGC6nUxL3KB3YeWzry72E/C7u6Yr30ZMVYrYyiCbYLS9tAZwJ4iqHmnG6Qi?=
 =?us-ascii?Q?uWdTm5raMwrZAf7JSmc9hBNbGSYZf32wqWtfl4CriTZuL6EVzWK+G6GH6jWR?=
 =?us-ascii?Q?QKGDpNpZDSzmlRWzHjURpMSesYklIedR45y5Yzwsp83AcAPjyt8KpJ+ARuGR?=
 =?us-ascii?Q?5mEnV9Fn5A3Ar/5UxhgozRhI4JbcZilNPoYHjUoE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a74bbf-788b-47e9-cc38-08da5f2fdbc6
X-MS-Exchange-CrossTenant-AuthSource: PS2PR06MB3493.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:13:58.7467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7N6a+aGMgsI/Koh535CGsu9xlg1q5dwiyc1sYn0jGCW9pYEVoSDxPZ7ezWyV+OBRgT5Zt7+gYu2pzOJBchnkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5271
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove a repeated "#include <drm/drm_print.h>"

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 795dd486b6d6..6b88ae14f1f9 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -39,8 +39,6 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
-#include <drm/drm_print.h>
-
 #include "cgs_common.h"
 
 #if defined(__BIG_ENDIAN) && !defined(BIGENDIAN_CPU)
-- 
2.20.1

