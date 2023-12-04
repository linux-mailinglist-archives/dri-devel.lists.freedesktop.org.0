Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062A98034E6
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF93F10E1C8;
	Mon,  4 Dec 2023 13:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF7C10E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 13:29:05 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3B47gkHo007184; Mon, 4 Dec 2023 13:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=bYx+9g9R7LhUOVLBIchUW
 hOLWX9I8s02RkZJCunbH9k=; b=ciFLFO1NbIzOR0SAL62+KN8b0jTyMvDMeZDI0
 M48rhU03s83VhHD7rmjJHII8havpqKAxXuUUmiL/XA8Y/IQKlpxU4F0EW/C9yd/Y
 poe0qV3/ZVyfjq/OlQSpdgVv/JUAlEbgMK0eUmk4L3ixckNsQW9PAo7kQHdlMD8Y
 XvYodecVZPgeb5vNWUoUb1/G9T6miM4j2oBl7iFkPU75NrJo6bYddRD1VUaW7P7R
 UL1iiwkhzIHVQPtvdxMONDC+X7LKGmW13/h7GbDnPTok+vXqP7dMZk9sMuVwvJTX
 ieRl6xVuQh4ycJcYLp1PerY1856+YcwFrHPILRjv6R20JhXHg==
Received: from hhmail05.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3uqwhw9fx9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 04 Dec 2023 13:28:59 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL05.hh.imgtec.org (10.100.10.120) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 13:28:58 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Dec 2023 13:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA7Fk32g6igBNqa9ormgiZw5EsqynARzP7gA55Wf1Vpy3osZHFkND2s+d8x7laNVXp+THtX1K+47jKvcIhE7PZMzSWyhLbkOjQyBZIR2Qw9jQGcjbV1wk18FwE47xjJ7Ub1QCFZClYCifH4P2b2RZG3SdkbHW/tr2NR1TwjPWi0TgXCPStOL/NDzZJgy8J1ho4qqvW25T+kXIbOOOhhdfUpHkL0iQ24q5lSmmYCbEekWBNFuaIL57GjOeVynxi2BPBmouTf8wXd716h97Lm63qjrG4bvl9c0q/4sSEkfXP0EQc5CHJijrRLTTzalxE6LSm4HlKgoUS7KkV6IGMfKqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYx+9g9R7LhUOVLBIchUWhOLWX9I8s02RkZJCunbH9k=;
 b=DPIueYEkwgoh1SgZXNZLOpMnAMFBWy/KOx37V2e1arhN9Cf9G1fC2+3aFxG0t7EGcvBogyM9OCgplnj5Beahksx8QhpsEEGEI1dxvytbOlGR7MRlodCdNv3GCBzPSq8Wsyojm8B+l6st0DrO8jquoiFLjY0rSxUXsD/WdDpZNyP+YLMrADA1FEGazguOgZ3K+tdYOmvILnLiC7xQMsGe20XTsxBn1MUjBDjIEsjDPjTPjh1u8nGAd1T1bC/Ajj03dF70hQGCkeUZfngTLcXHh1P4lOV25jATcszyFtRSlhQhyunEkBBmdVR1fjKtr4oSjGbFvJHI5wWC6KO06bCljA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYx+9g9R7LhUOVLBIchUWhOLWX9I8s02RkZJCunbH9k=;
 b=ZRyhsYAuQPnwDD0kJtdgQTs54RKSU1Kq+PnolEfKqb4X3G9y3+4FZ1nQsP1BIvbHZj4zO06VBuaV3CesnAGcPV+LMo064CEPKRVgA7KvgY3Jejg3QCm4JWjmzJgPxMXeuZljpdJ4UCIcccEyEwfhBp/i+hLExbsqOdCnAhRtHXA=
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a5::14)
 by LOYP265MB2013.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:120::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 13:28:57 +0000
Received: from LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba]) by LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 ([fe80::3ca3:d6ce:efeb:31ba%3]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 13:28:57 +0000
From: Frank Binns <frank.binns@imgtec.com>
To: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] MAINTAINERS: Document Imagination PowerVR driver patches go
 via drm-misc
Date: Mon,  4 Dec 2023 13:28:47 +0000
Message-Id: <20231204132847.1307340-1-frank.binns@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0575.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::7) To LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2a5::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO6P265MB6032:EE_|LOYP265MB2013:EE_
X-MS-Office365-Filtering-Correlation-Id: 727bb08c-02df-4e8e-d055-08dbf4ccf7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7sGmHCdTSmu80pqpsXVfEXglXWm71mBZC/LIbAZX/GikctlxtOts47ltreb76CIKwOTEuWzCRD0PUr33/1f1NeJMdX0fW4TvYuGU3NvpbX6iUvkAAiprw2fPLDhEVBHHd2ahHQgBsKAnh+PYKFNk7xAIPcFRImqS5jFCxp2IyukpUZ/ml36sZc5JEZzbk/CHLFF0frfHpzQmhUiUBfjmgpYYG22ACjpGj/P2Vy3QQtrwCX9bOowvLL9Ze2KHU5kUoDxZB0UtT6zmJgOdSLdbIDUIg592Ed/KUtZxD+rZFbPBOXw2n1u+fy/fqzobpxcWlLnfTr5bZzHyNob3+NtDuw1zQAZWN+pf/yq1z216POWjbaqC5KgVhGchY/tOluIpeWPYfGf7BD6zJvnC9dDY8Yjv5u6Cj5BcCckE6EARghN62ivcYZf5iLx0iKWMYBO7JCTOsIZU6Ncchgum0+dh+7QNGDogHH5Bxms5godo0R1cxbWld1FYgwmEJtgIRdotDPPVOma2oy0XYLJVf7ma1LByMelssmj3Yu2FHGnBtsxt8ja8N7iAguJLjbbv6ePQGV73HnGK5+uYcaNMnDGXr/qC7gqDb0bFtSxs8C5RPudWszESjAulrm5idkgbhH/M
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39850400004)(376002)(366004)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(107886003)(2616005)(44832011)(8936002)(8676002)(86362001)(38100700002)(52116002)(55236004)(6506007)(6512007)(26005)(1076003)(6666004)(478600001)(6486002)(316002)(66556008)(66946007)(66476007)(4744005)(2906002)(38350700005)(36756003)(41300700001)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Z18/bC4HL6dKnxPX+WjwuoWemY1DpGPHdvgSIRJlDeh8vpWR0o22kzPa5pV?=
 =?us-ascii?Q?C1ZbSvXHIeLt7++VssJbIeW6oMORZBVBz4CEpRA+zDcH/hSXplTEKG8cOqZR?=
 =?us-ascii?Q?G4EhOJv2EadVfIXMtlMLbR5KaAASQMlmJIMR02kdQDGJ/Ax1d7/0x/EoG02n?=
 =?us-ascii?Q?fpDawQUSyBRPHooYss/L53MR/9f3Svyl+UsXfBTAKxlX9Eei1SliapDJH6iP?=
 =?us-ascii?Q?CL2N2NO+aNZ6ij+I34m0M9QSwWW1IPSIW4X2WZ+uddLyUvoHUOvBTmIuLtrl?=
 =?us-ascii?Q?91iDiJDHn+xWGA02888yxTwtOuD6zcSp968iqIsU0EyCCBLB8BXd9IedkC+M?=
 =?us-ascii?Q?1ERI7WndDRR+TWbZ5p6bGS8HE6Auj4KC44clqzCd4QO8SraYr+ZPvszhnBCV?=
 =?us-ascii?Q?mDPMUc1K5Qz0fut3OZ3EUEHYAlXu9ML2ieRjI1T9tw669IoCev2pmNffsoc3?=
 =?us-ascii?Q?KvyPJWnjS4dtF9tlzKcWpyDsVk4BzJuH8vAUb33VciGfTWArrK14+ZGdKxwx?=
 =?us-ascii?Q?WMY9OHnmOkz/TD1PSCJg+BS8mVji9OVgeHi+sfpg0F4Hro+iH7u7jTvFPaju?=
 =?us-ascii?Q?URbkZCK/U5izt95Wu2+e0iDL9cNuQRjSsoiqcIVxFu6JJyhoIBQmUC7EDbGa?=
 =?us-ascii?Q?uI01p4DgB61QZJHgnntVTtEbrc9E6mwIwUg76+wl7lbcsv/jukU9HowhBCmb?=
 =?us-ascii?Q?mtMYtsiKTSfGx2L/lkgTpVRA8r0N7wuzSZiT3M0R/8eq1JVea3gLr5DDXUuq?=
 =?us-ascii?Q?FbOAsKBf0tNHN7oFQUgM0LGuqlNmjjl+jd8tWTAuRoZ2wxtp7Ss0GG3jUv0r?=
 =?us-ascii?Q?a9WWN4dlyPVzMiM4hlTLU5NfbFSWkUQLIv5BR/DZpDdmHiyaFNIQa+0E1Dwk?=
 =?us-ascii?Q?KL5YoTxebU2LXYc5YXoDCbqs14/1BkYqhtVZhrgF7FzDtrfzWLj+2/EiQpqf?=
 =?us-ascii?Q?a3CZYUU2voIvLr0YxUzmcJ1X2UvrwS+D40IgewddqFGBSmV6E5MxLyDdo7OF?=
 =?us-ascii?Q?LqRXCXV2oymFEQRRfK4vTUgVfhDvMtq0hnAYiaCzzY7Ofa4PY3cjzusCu9rO?=
 =?us-ascii?Q?7EWxFRvnMcnw+eh/YJljPwoLYmxrxtGk9qkCIiGTofg+prcDzgLKA4DxH9N6?=
 =?us-ascii?Q?iUoAhWRLTy7/KUuG+2MDZJIsWZb5vX1RQbesu/h+vRwyr7ebi87nPSIBUYQd?=
 =?us-ascii?Q?oaGUFWX5n4AGN1udoj4vuB+Fysb6dRtvULgkS9dvNNVL5SQJ9/nI+cOjrrMI?=
 =?us-ascii?Q?pvgInRTJzqAqi3qTfmez+2NTTkOV33G/nV7gtdGUHUFYjU/CvkRKeVy9K9bx?=
 =?us-ascii?Q?m0LCvwJRj1KWQ5DxMlYXmcsEq4H1vAoWymMLCdOzvhLTgizGt2qlWnUYjlFF?=
 =?us-ascii?Q?YISiKBbQSDIXVYQfZkkMfIBgxlvPY6fIOIUw1JrnVx2U6B0WsiVtyk/nZX/7?=
 =?us-ascii?Q?UZzessSbCaG1Z5rw9MN8pL5RhNRqZOZ7GSCw9RAdhGBBTmeJ6GTZdOf0+UhI?=
 =?us-ascii?Q?RFGVVtaEq+uU6GkaSQpmSySMv+CSPkqnCAGs75NLOCJPPtq0g5M0i6xK9MUV?=
 =?us-ascii?Q?MbO05YbzFy5CFVnV/GiAIlhazFxouAZ+9ivNK4hObBqsJnLBNEGPUffIGJ4h?=
 =?us-ascii?Q?Bw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 727bb08c-02df-4e8e-d055-08dbf4ccf7d1
X-MS-Exchange-CrossTenant-AuthSource: LO6P265MB6032.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 13:28:57.2954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yiD1Z1SIqV193TQiIrTrF+UZgBJW8KnFQYAjTIo7WKTju/H27da6UA8c1tg6wiuwv9V6PEI8Kib5JfnVuCGIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB2013
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: poMTVRlmyZQ-0NjWKk4iOwx-2IkoCOdr
X-Proofpoint-ORIG-GUID: poMTVRlmyZQ-0NjWKk4iOwx-2IkoCOdr
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
Cc: matt.coster@imgtec.com, donald.robson@imgtec.com, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the tree used by nearly all other DRM drivers, so use it for the
PowerVR driver as well.

Signed-off-by: Frank Binns <frank.binns@imgtec.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ba904b46efe..d4b46b3db022 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10397,6 +10397,7 @@ M:	Frank Binns <frank.binns@imgtec.com>
 M:	Donald Robson <donald.robson@imgtec.com>
 M:	Matt Coster <matt.coster@imgtec.com>
 S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/gpu/img,powervr.yaml
 F:	Documentation/gpu/imagination/
 F:	drivers/gpu/drm/imagination/
-- 
2.25.1

