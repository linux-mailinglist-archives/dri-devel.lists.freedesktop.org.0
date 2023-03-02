Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D11C6A827A
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 13:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F6810E264;
	Thu,  2 Mar 2023 12:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C52C10E264
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 12:41:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X6BfUFwMxBG29ON2/C3di1XmBBhcvfmdMFJdYMYWMbVF8KRtyqMn050wG0y2MBtGYUdU9khpahWrgBfjQMEBHWT8UdBM0++6lGL+uVkOYfYrbNrFzSEX8t5TUJKcG+GM8siFs/u6M3vmGAEesSveFskOFXJcGzr/NFwWFyf040LI95rseszEMWyUYzg9Mk631GmO0rmGEGMW/9r3PVRHlAt6qxuqsWw1kb0zjHPhEgsatNGdTFhyP/oUA9SP9CGwaPToWuHjzQfu+tFWeqL8hHNPknMPiKLcKwZT/go2SM5H4Ihlx3V72fDZhk2m/5Cwna8Hp2/3IL8xdZOsKvLinw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TrwQhU0q8pA2DL9u5e2P0tkoSCOTiVokBgBDBOJf+MM=;
 b=LxwN5W3HU1iMZ5wupZIlP+GDhqdACp2xQdmF18nrSU0mNm3SdSIuunnBa3MXCY57mdVFsQHhO5b7eWIPT4xFBvXTIZYEiQMKx3Eiulwi1zIZmrektmFX8NjR1T/sOgj+PaYrbkE8MTyX+ikk0cMEMQjoZhKnyMN7GKQfdr2SvqgMWRZxK1+9sXUhxW0qP9yXcavtWqReHogR51eEC0JcTvBJzBAidKpRw1HGvTMf7/l3WCSekwjnxLlbF6icVTIWWDyROloItxcIPWYIacVeDwm2Jiq9IOISczMnIevOTnmo9Ft82/GFBTtygkNmVWtgrpq9FTqxnNFrN/MxldAR2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TrwQhU0q8pA2DL9u5e2P0tkoSCOTiVokBgBDBOJf+MM=;
 b=P3g7MjjecuGgViI0HwAcJRUXGaMv7QrJHI2GTiKgJjJLg/SPGIvBw0jlTe4oNviBgDBlErCEFpOVk/N6SQyUdPdpScn6lXfD3wE07islW8HFlS8SzCbAq4o5Ess+40ufqlA9ZnOGjpLwrKk1m8Zwu1okQ4CbuLE0T0aSm/IN/+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DB9PR08MB8673.eurprd08.prod.outlook.com (2603:10a6:10:3d3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Thu, 2 Mar
 2023 12:41:39 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::cbc1:150c:e3af:5ee7]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::cbc1:150c:e3af:5ee7%7]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 12:41:39 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: add polarity flags to RGB output
Date: Thu,  2 Mar 2023 13:39:49 +0100
Message-Id: <20230302123949.957998-1-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0502CA0033.eurprd05.prod.outlook.com
 (2603:10a6:803:1::46) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|DB9PR08MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: 35fbd6fc-f654-4cd3-d436-08db1b1b7817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: il5oqvPi5jdFRXi2qBLXlVjwodYzAGf8fCUwzeTKUAqk83HB+KccYYPuxnaWzsyMgltgxgP2qoT9KrIgq+HudnMgCSV1Sxrus6+W8xVv5MEJihgXP/DqRcXosLE7PvJPnxHz551axy+AhejVz7fCp6xCYMTxLDWnX85BXExRznuPRf3AvFhYKE5zTqHjV6p7PwpFoxztz3YWZLHIy4FOfJjNzcCjSp43tBoXJmPtdmKwhbRQsG4d6ZoKeBI8TuQea9UqYtzjzsqLdDsCDH8cpLsE2vmbdnUhYgrVcy4DbvF5/MhEiav5p5s4UAGr6VQH4oP/GB6eLHVy1UX8epcO3GE/Yf3GJNDbSsHebfGDtGHtITuT4lR5KvhUmCLDhr+WFz5eX5KXQbx/zGrLnN++/zDhtAljNhT1dDTAJ379v6l3WuzSuAVyY3i8AxLMYa7lAH/K96JKeCKBkfksHSSIkK8+q9RcSgwpgUPRLTqLnCH4gpEKD+eNQjmmGtGMG7ftw+mvZnDJwFxSs5FvBFAKkOW8p+yT9vzFTs/jWl4T93iM+WTwThsZ0Gt9N3g9SjQ2DI0tnfYytg8Ylz/bkXs97UuAwHmEOkR+PIZQjV0Dg1XyYGttc0itaE3zjpluwVJbyHtkH/aBqYNR5jKtZGplgmAxsH1BDBw+Td9+vciZu7jgyX78FUO3LLI+GV+lt2Ji/x05dDwjEAOmTFUSTut4Yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(39850400004)(136003)(396003)(376002)(451199018)(66946007)(4326008)(66476007)(8676002)(66556008)(41300700001)(26005)(6666004)(6512007)(186003)(6506007)(107886003)(1076003)(36756003)(86362001)(4744005)(44832011)(2906002)(38350700002)(8936002)(5660300002)(38100700002)(83380400001)(54906003)(316002)(6486002)(2616005)(478600001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctFbKZH7axD3X417Fb6lC/J0DDvKeyIjKoJMMDhO7e+fKDehASGneHRiSb4E?=
 =?us-ascii?Q?ogQrudiWHZvgVXly8eJ1LT5VaFoBq4f3wySrSPahbXpSOTi/J4YIFSgIPZS1?=
 =?us-ascii?Q?ye6l9YCbkATiE0A0pkyCW4n4ct9YgV59b4KC1H/LD2Gx3MBv3donZGHG2CoG?=
 =?us-ascii?Q?Y/jtcAs6tQNLkfu5OaP1uIbgyBRR6RB6zud80h9C0Dx3f/mTXd13j4yD8sMZ?=
 =?us-ascii?Q?iA0nTi2+nv7CzFWlTTeHIFBXjIBpK+a0KkVK2Of7eY6dyst8UUj6ibug98mj?=
 =?us-ascii?Q?KO52Timhwyg2HIJcaRMliyYijhnm+KZ11W3ScwINRi3ts+0eYFULOBm098Gj?=
 =?us-ascii?Q?vCAJPij2LGD4ruGvuj3QlZwKLBlWy3QlJgJfiK1lpX0widIYEFoVD42kwaX6?=
 =?us-ascii?Q?AvnAZ76iu+PQk5JnAuSnl+cAXIEJ66mtw4oBhpFtQ4jiMAVCjgkHHe9qk8Be?=
 =?us-ascii?Q?UUGQsOqPy0w5v1leJPGox8AoRlWdIx+VM9Lt5gLgVph7LkzONnnLuioZ23Hl?=
 =?us-ascii?Q?cI9hch4a6nq8ccvt5ge3OQjVs4yMJizApyLV/mv6S3U7VPfceS9gwTU9R1/t?=
 =?us-ascii?Q?EUhFo9otaJschRw538MShQ2DzCTFbzl549F2aag78ez2IpAVNKK0s7EXF8RM?=
 =?us-ascii?Q?UcQpzg1pOqXARmMjX7/bq9xrQQakTXOqVld+NhEpGTdsxzaBZb6WXEqReFL+?=
 =?us-ascii?Q?aPIlGlKaTtA6Vx3er7TxtP7bRJk4myv4QziNYZjWgD+IoI/G7jC9DeE8qc6l?=
 =?us-ascii?Q?YIVCbjT6lBCEuSmLZs9oqisEe58648Nj9RA0+ckDsYBO3Dx/mTD7Rc/bSeAb?=
 =?us-ascii?Q?MsTQKtcwPaghuS02YYqb0xV/u6kJB7M9PSZ/igW1qc9HtYbKyBSv/zFxpIr+?=
 =?us-ascii?Q?35DI4IbiQU7A+XFcyweIp7mw/GfEuei8IBbzjllg0ZDIs0dMxKjH3kq3Fsbw?=
 =?us-ascii?Q?egfQwRmfN6KNLJToP5aj58GTkZCAWxZiHZgPOFSRNHONzEWaGAMgRjq8XPhl?=
 =?us-ascii?Q?j+uR4Bl6XyVhBW5NBHIXiCgzC9YzOnVy8vcp9SlRo/45rIrMzdQ5daXvlSTT?=
 =?us-ascii?Q?3PuVBpws4tAi8wgVS0suIcl/SrVtduHCmlSRF1MIYEcWw0l8jd5rFF2QgKBP?=
 =?us-ascii?Q?+pqTy21Ufyq78l4mmOKHRBE7m648oYUDV+R6lrWWOxFc+Un5nO+qsGe4sHmg?=
 =?us-ascii?Q?w81P4qEHCnMwwTKKwA1A+JeQLyAsC4hrdQ1ER4IDJBbhPgmVCUGVxszwsEt+?=
 =?us-ascii?Q?ZEhSAAhy3XH5deg/4P4c5L23uqSNGzGZDiYFQD1nSwTdosoVi/JEi7Ubi5cO?=
 =?us-ascii?Q?1CUjM8O2PrHZyCJ6hox7LWW+0+ewBbIA13uNk4WfJNHEYngT70JQvKK1NUaq?=
 =?us-ascii?Q?3d/tN7zHOQ9j+MzdrLSxNkOGEe8wHhCrfMVKk6R742gbDTcpUkMgX/ZnfSM+?=
 =?us-ascii?Q?Ac6jJUNj987NehAjfQ8FcP071A3H8oPpmuWW6okDXxqfu2CbrTDNivFUPyPv?=
 =?us-ascii?Q?PM/xkmmUcuXQAlwxtRY9T++PzVm2BB0zZWQPIIQhykFcM+t0+0JT9VtHz1Fd?=
 =?us-ascii?Q?VaXkWtLlsK1JT72R0s2YWpcHoQv9qC6wYCPm9H1L6hv8akD/As1zmgD23DD8?=
 =?us-ascii?Q?Cmc0rOP5h2Wfq4HASEMpSp0=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 35fbd6fc-f654-4cd3-d436-08db1b1b7817
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 12:41:39.7201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6BiRASMInPPjxIad8QxH2xXdUxXtkGtMkbnz20cCvasKOQOPoNkkSFP1QOLWxnCNFFDg6g1CUqy6aUvkqT0TXNAZP4dDZXdznu0FQBacvHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8673
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sandy Huang <hjc@rock-chips.com>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use h/v-sync and pixel clock polarity flags for RGB output. For all other
outputs this is already implemented.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 8cecf81a5ae0..e8b61973ade2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1435,6 +1435,8 @@ static void rk3568_set_intf_mux(struct vop2_video_port *vp, int id,
 		die &= ~RK3568_SYS_DSP_INFACE_EN_RGB_MUX;
 		die |= RK3568_SYS_DSP_INFACE_EN_RGB |
 			   FIELD_PREP(RK3568_SYS_DSP_INFACE_EN_RGB_MUX, vp->id);
+		dip &= ~RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL;
+		dip |= FIELD_PREP(RK3568_DSP_IF_POL__RGB_LVDS_PIN_POL, polflags);
 		if (polflags & POLFLAG_DCLK_INV)
 			regmap_write(vop2->grf, RK3568_GRF_VO_CON1, BIT(3 + 16) | BIT(3));
 		else
-- 
2.37.2

