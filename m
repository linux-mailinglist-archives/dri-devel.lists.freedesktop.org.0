Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33EF2B8EC6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 10:29:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 090DA89B27;
	Thu, 19 Nov 2020 09:29:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2074.outbound.protection.outlook.com [40.107.20.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7847F89B27
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 09:29:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aI2LjHQoKk+CjL6QOXtOSUt//gm5u6U2g36RQ5ZuoD2x6dJD0tgLUUnT/FIsmD75ERR9+uE5TRWqqAyqq5/CrDWq13GWDTjjZwibLNhVrOMOisMIompmpKiN4Su8PV+Klqr5YrjuCZCU+81dBh7YaEaqeI0o4zAlNyzDBXs0M4DzkxxkoaXuhctIgK6WsxzjJkRJqzHVR9JxEjcJvyuq2aMpUGU6psbp9heg29ZwtTA08wZUBwwyXRz5a+aLVDZijNFCdpTlAfkNoqwuSDt6sqnzDG353sDctpILk+wSzwuegOYYx/HnzkQTsCg7McVZCgKiHRRoltJgxUCZJhqvbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbsHz6FkxeFODF7wnnilmkkzAYF2HOTyZfupjqIngTs=;
 b=NNpu1B1s878dNCR81Ta3kQIfMf+SCdVHnJ8Yj1Izq0hFTIl6KK35jkg2rciFKZTN+yEkX38Ermq2BBRlhE8M+ve6R4FdQhpkid9A2dojCxA2YIVi8Cv3R/H4ifk49odKXYa2r9wxOqCRSePb+ddNE9NiSHtf/yezhhFe24mGDNDxrLgw7u8bQhn/NnNk0I0g7x1ksR/AVDG2nZJH4u0Q1XtzDmuKQF7ws0qEfEAE7EvYcuQB2t9KJYCdxx6LTa8XvXOZac673l2UkKht3G/L+rAPHyTFAyVG1WGOSSdYEAVjvgg9Cn2P27WqbmsJLfWbGc1mP94/w0QRGlPlN1gpxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbsHz6FkxeFODF7wnnilmkkzAYF2HOTyZfupjqIngTs=;
 b=ZVyjkWaXkbdgyFVTdeUIG2cye0FN9taFxRnIXFqIQZXYop0jP/ZrJYUpQWvUWuyF8tD5E+YOT8AnfRKHn/guze47BVlY4Tt9i4dJ6jFia5ybo3CmexYBvZvnNhHXvp6t4bP7f6LxV9DorqmBvGybWh8oyPS8wi3EvNAeA/0jhsA=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Thu, 19 Nov
 2020 09:29:42 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 09:29:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Thu, 19 Nov 2020 17:22:21 +0800
Message-Id: <1605777745-23625-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
References: <1605777745-23625-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0002.apcprd04.prod.outlook.com
 (2603:1096:3:1::12) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR0401CA0002.apcprd04.prod.outlook.com (2603:1096:3:1::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 09:29:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 65957feb-d38e-4655-fd14-08d88c6da4ea
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB2973B79DA21970533F78DDA698E00@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2f0zoCp8gc1jjvgiXssAkYJ/AUATbQ78eN3k0bSWHGNJ/3ME6hY/ielx4eii9IHb9YSylHHQIbMvg+paSaCF4yEcF9N+LIL5BjFg/ILmITqtt+DaW/7E6fgY7N/UKFRrHhIZkR01rBmgqFuNbGOnD5Q2ZVekd57OwJHqElrYNH098HusnVDHnCawXcY+sCfyEEOtJ01JmG31Gtt0D3yFEi1elY1CNhVAQkNmhmXj2qzwaFTqOlDBJDnHPqKrGHiHGkXazH+709d7/GMmxvf7Ubh2Jtxou9b7OLzhM2vdAfnd2hKdPklYLvbQ9dbRgtvScj22I09cEey9HI3LAI7LlJkGGFC9YXVGtvLOFXfiLoOKwJAlcvrkEa32JLOReSLf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(2906002)(6512007)(26005)(16526019)(186003)(956004)(86362001)(5660300002)(66476007)(6486002)(66556008)(52116002)(36756003)(316002)(6506007)(66946007)(8936002)(478600001)(4326008)(7416002)(6666004)(8676002)(69590400008)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 8TOtuGoUdsYHOOgPH1vJsQSQmiznjpyTEgC/faFNLnto3W3QFZ1xKlmH9005E6FCzPrsHSJKpCqeA2ng+wxAVhSpYQHB9XAAqZeOz9MhVWObJhXmjqDiE5cpCe9AxryQ8ZuEdJUruD5pICpPh3V7/Swr2wzXKgmSodazFKHUyWon9/mklKUxQwSdGl2fRswoOKNyYvNh3MXc/oCztmp2EyOaLX3vBew/hOJhEMNlZsZLOFtMiCc4yQfQy+bUCtygpabqAYWzyU1S6nW9bpt/1K5bAJt1eqe+6sn3LB6dCXzuHlCwo6cxlu21UY6HHofBzlQaWwXwAGtIQigNh4k6BkdV2rUpVViSvvIzG9g+ARmi09s5uthqDFVcxxztIYQm72di48H8Nk8C34ry58NPWpvpsmR8YOwUC+S/Jj3V0SePE66/vqfrEuR+zmTBdAmXh9vbtA5chVP/HEPsH+8xM4v8yGrZgi4G/mUdyd+Uw+ndnVMwGstnJT4V29fBb/REEBz2V7Ra1XztO8HdzoPYNqxZad6cAsZq3nYumnIKtervnXvmvhd5SmBCrciFmV37nZgq9+ESeXGkAtu0BVro+5x4phLAPrPVMTqpfuBcJmf1ovkagOy8aG06K/PzDaxMDLMnLi8hXjvmy6X36mmLUg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65957feb-d38e-4655-fd14-08d88c6da4ea
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 09:29:42.4669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNB8g6qJ3iXC6aI+SUbE6rEvp/pYxOHJKQM8HPmwOVw3j1acUHFMptIqaXFnh5HPU1aRYXdvxLPQSGwvoBPsVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 include/drm/drm_atomic.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 54e051a..9da1e35a3 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -888,7 +888,9 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
