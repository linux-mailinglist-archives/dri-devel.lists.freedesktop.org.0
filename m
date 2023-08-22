Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3282D783C43
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 10:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85FE410E1BF;
	Tue, 22 Aug 2023 08:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2071.outbound.protection.outlook.com [40.107.6.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AEC710E1BF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 08:56:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6NJG213NUzDT0z0gsXPfs2EqmbiihhZOlsT+sSvWnpRJ9kJcYgt2tfslDbYKdMH1R7Q9CjrQOA2MJRzjh0OQZMb9thHPLDvrRrg2qt0ZclhzoIFrRXrYM9UIPYMzrImhgkr+4R9Zj6rqqh83rQjHp8Hts4LIpAn5jT8brQEUSgbfG+Tr5HcywVFvLbdaB7/0WW/IT/BqZSakmHTmJ97E/Wt4Ea1uhhCoIyBeQHrPoXDYRFgleLqSCWIi3DeWZ+NsxPxE2PJz7ib/J8aGcREiftOBSDjDgWSs4qzQsC9JXMQwsB4rcilgyks1y6VQOcTFyXhMf0KV9yepLwONHKLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1k0Hl3T0lJIPQVnOJ+2W3tItoaFeyfhqnnQRi6U3Ls=;
 b=gS3J4A/y+gGyN6xcATEBX7eldtkFuQloYO4b0p1GpzUhfkI4COCvTgjsuJR/CjHzN5piTgYz6Q+InUcFoBb86iCz0mXJq/rfvkedY7gl6IIH2mFeuh3P56k/+TjtdIzOw3JnraKWoPaYoMfT0xnUiMjPlcavctQmmxMp2kU+O5Sl7KZ2s+QwDkvsE+85ebEHzEpq7dZCeYZhTd4afbxIn0zah+fiQCEEmT6JL4vlJSuDlYQ4Zq8xUHXx3KynhKbSJt246pp7aP5wig6HwIrotPeVo8CPztOM2B0b32WCfTfw2pxKE2U/goI2fM/ToJggcJq3j1dWjUyrSvN2enJaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+1k0Hl3T0lJIPQVnOJ+2W3tItoaFeyfhqnnQRi6U3Ls=;
 b=Lh2lRMvQ7vSbep9x9M455khYNVejrYbFblvxvuvnCjV5yZR1GCPv28Hj8kkopoI/ygIA6rdMZeP3BfjO2gyuND3LcLFcQ1GGFBaV14KXAHB1J3KuxM+7BKjr71UaVlwUyjbvebJquJRsaB2DuAz8ztJJVu3T/RQDNExx1AjMhKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 08:56:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::9018:e395:332c:e24b%4]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 08:56:06 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v14 RESEND 4/6] drm/atomic: Avoid unused-but-set-variable
 warning on for_each_old_plane_in_state
Date: Tue, 22 Aug 2023 16:59:47 +0800
Message-Id: <20230822085949.816844-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230822085949.816844-1-victor.liu@nxp.com>
References: <20230822085949.816844-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 555029f0-2356-43f6-116f-08dba2ed9f3f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ThoE/J0+hbboYNPH0M1iKCbRTaJTHmybq+PnB6kPLE47vXkDK2GH6LYjPS2rLo+5ZoPqcIXL+VYymryCsuXhTa+/n8C9GAmbODP2yvYEH7/SVb7071MENxg5nbynzDPckHzQGQ70R7H78kJJvrHKvB3Ut5JewLVxniXnLDBEso0KujMt8sZnFvVmeQ+d7gCiArBASfji9wpMzdQWoX2vhUHKgMiualFCUFoJuPdOqspFKeDTiRZjVLhr1KwfeI3OH7xNDH1Ca2rlTCealje8xKZgovGUvPVxMLUrLACxqqIIyteStIzKYsQkQ6LzkG9FSnEo5z53CgIf7KO7F1aLgELd9Pbb9p2Ql4Im7CZRwJarAS9Ny7oqk/BBzfMAikj3IB6Mq+Qwcc3Z+KHXyESC9Zfl0gNc6g/gfKVrX65jCLHIOE8j70CE9TBYXA62sdDh7C5RMraynIRk/cvvCLlXQ/woXfRuyBRvc4lLVjEQle9TXdqjj0GNpp9PmhGtUeUhZNCUJTD+tCwcmejeDY2VRBX9yENuqPSpG13/5Ua6nL3mYTl8Gu/tOA12vlhV2pQM+as41rz/hLOGMP6imAASVqCOBg4k2kW8yTbzZ658FeQsC3TJOX44uZu6qlaF5iZG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(39860400002)(346002)(376002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(316002)(66946007)(6512007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(1076003)(478600001)(6666004)(38100700002)(52116002)(38350700002)(6506007)(6486002)(83380400001)(2906002)(7416002)(86362001)(5660300002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hdf231wHll035YgsufjaLLghjpY8w35ytuYEKTozHxsngeRgSjxZ//NlIVie?=
 =?us-ascii?Q?9P6km79OX8vQNLsgZOUO0sDCH6mMPxuzVhaSbistC8a2Bt+B8iAZ2ZC6thGt?=
 =?us-ascii?Q?lQewKikhPkA/9SwKxyko7OSN8mElBGA0xShgdUODkCpkkfxeEeC2/s1PBlfP?=
 =?us-ascii?Q?sghLh1wSDIb3l4CooX8N6UZgEKIWHetudQt8QqC8+WoWRb1aFtXt8PkQNwIb?=
 =?us-ascii?Q?fUjKNNcmtq1koz8ToToJ8BVJvtKra8tsPmbYtJMMwR56zBS7R9XUozxJ1eC4?=
 =?us-ascii?Q?LbFjmJ1Jy1CNhEiEYfDedQywMVhuB9msuSycMOVcvzwxhfm/OIoX44u+td3k?=
 =?us-ascii?Q?k46VVegiQnXNwTy1fqi06Aqb8ORpvHsK0OvvFLWeQLEOmdPyN0/dCYHQXc1G?=
 =?us-ascii?Q?14bw+Y912AoKhb0887KUq3G9uJ8I3pAhX37R4Udd/fvsYZLv3u26+Kd9Z4i1?=
 =?us-ascii?Q?icGNX32ZIDcu7li/neV78eu37Dwkr4Pn/E7dEi7asQicAXArTWUBkSvZzmc1?=
 =?us-ascii?Q?O5QUr5wv8Hr9eC7qTVKPPopeoHpcY+AgcrZYazUPdKQgeL2sOwPFWs+9CQ7y?=
 =?us-ascii?Q?B3n+ofU3yHF9zekzUJt7icRccci39Jn9Knvfm1ITzNoO818SlKeoQ23JY0dZ?=
 =?us-ascii?Q?yPozrGiHmNijR90WCfuQ61jLiRSkokmU+lEovkHifJbayaQ9cEUQbZOY6wAs?=
 =?us-ascii?Q?omCKQ03HGiGVU7Ly0/j72XsvrJ2GktTGGKUAshy1e3+dPOpLsf0umAE9aenY?=
 =?us-ascii?Q?Usw+H/+EtUbErl5doatuWusV06PQ6KW+usPVVVWwfxkEUMt6zFYlnOGhH00G?=
 =?us-ascii?Q?hc6IIkSbo8GSmURDG+/XfE4eA6D+u9wyGResQz9mOCLmuRCtaSruKlBv12tg?=
 =?us-ascii?Q?X+5s1mB+/i+c9xrY8kBp0w7GtTYjc05WZCjQDavtMDOWlsW8BPCutN4hj7pO?=
 =?us-ascii?Q?lSf3iI2TBuk+rlAaUlpjeZwcfYxtGs9nJWAKnNdVSBVk1cMNgHYJ9ybFVz5f?=
 =?us-ascii?Q?h19apKGY8LwpSi2NzfSS/dzS+F6WDEEOqpNlNhs50Oh7OXP4qH2RceBYIv+o?=
 =?us-ascii?Q?SqDqaUzCyGHVbhJO8/lramoZSo8TzznByYqORkF+5f5OlBq42mdJfF0YF9uW?=
 =?us-ascii?Q?AZFH5MHHdmCYX5iNpYvqv3Vfw4IGb136qknMVrHhHts/AmnoUkk031qbJERZ?=
 =?us-ascii?Q?/Ixj8cHte/qkbA6YeXDhecLEU02AHzz+loTmcaS13Xm+TH7Snxqj72u47zny?=
 =?us-ascii?Q?NgEsOVPi7VSzq6X2fYIQLCv6GgQFMnw+iKIaCvKz74CaDIpnOzJONK0N9wEu?=
 =?us-ascii?Q?8+wbttUzI7ye+8IgJWCqTC+YHncNJcWwztgzc+OnLjNT+KK2SDSxdazlsGK3?=
 =?us-ascii?Q?/6bzmX7nDIiI4UaeYO+zaHyJE3CH697HnK9WIVLRYQgPcZOybrMo29dBMMpa?=
 =?us-ascii?Q?lNuC55gQqF8ouQ3eMGYYB5EgPirfxUXkd8OzZqi/Y6QxETh0Bfn3GXV305fJ?=
 =?us-ascii?Q?E23jWi8hIl2xnrpYdLbmbiZKKXE1SbN6nRtEze+hAmJWYuJVvcUxz4gnGKVZ?=
 =?us-ascii?Q?IfiWfmY8jkU0zhWcpIEh/CZzY1no52Si2AmD+vBW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 555029f0-2356-43f6-116f-08dba2ed9f3f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 08:56:06.8252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NHGiuSJnaLWrvVkhlkyWe0azWJz5e3MaMHFQsnzVPdhORMhJpJwbMl7/9vjHhVSfVlFAJZjdRt7MJEaLMR06Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
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
Cc: conor+dt@kernel.org, tzimmermann@suse.de, marcel.ziswiler@toradex.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, mripard@kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v6->v14:
* No change.

v5->v6:
* Fix commit message typo - s/Artifically/Artificially/

v4->v5:
* No change.

v3->v4:
* Add Daniel's A-b tag.

v2->v3:
* Add a missing blank line.

v1->v2:
* No change.

 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index cf8e1220a4ac..33fcc38a1dc9 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -954,7 +954,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
+
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.37.1

