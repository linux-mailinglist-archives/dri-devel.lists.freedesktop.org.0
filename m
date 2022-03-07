Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4DE4CF893
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 10:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29B210EE9F;
	Mon,  7 Mar 2022 09:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300109.outbound.protection.outlook.com [40.107.130.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146E110EE9F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 09:56:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OInw9ptdhThV942f9FPz0Rd/hpHJ8wsmRpbShPX41jZ2IgkqhxNVP7v0R58EZQ0evsJt9DWQZzoacET9nX9X8uLGuhdlP3w8u8bAVv+I1SYXY8puNdkI8mKnwKkbA3vJymshWxHqo6hDlu4tXACrqWU2X8Y+SGv0QcXTVIq1MWOWvkduO6JWL9tKIe58u8uWg6qHkSqGn3myxpMIjeKd07k6dcDbebh68wrxXdsK8KY0UScxFDWahN+Q5y57WI3eOksdXVbL6Td6roTSGUewvhCZR0evtI4YoDr/VeybujtU8CXnK7mMde8txNSB2PN+DkLJFjEzqegfxXKRrggY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcjSFt6u4NSsFSgY6g9g/sb4Od9X0lYnTX4YrUwJW0s=;
 b=mpoecq7nmPXNUCy/fBFRVQYuwnlZ6tA2UHYf8/YjhCMQwuMK0AyUPOtEZPuqkjysFucBZ7vCAlSb80AbGd5e/u6cpTnbCNHlCm1NTnJLvu4JLE8vAaRs6Um6gDoY17EoXO4LbAAlh86WaMWXcOir9oVLyXw2mV+9kZUlb7v5DGB5FcMVdMJC3IRzxe+A3WnP5P+RN5jmRyGEwkg476S3XatPBhx5sTRdDtmxHT6eXGUtWMqJds7yRl6HIb9/YjuMyqAH6hkcCVD05xdllgBPkFXm/jDfFlIRz09T4zhBs4VSvCzha8QGbqIb8aupYO+HVIhX7/gxqae0+pgRvtt/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcjSFt6u4NSsFSgY6g9g/sb4Od9X0lYnTX4YrUwJW0s=;
 b=XdAfvJ8QgrWAQSGdN3/PYy9FoueHrPlRTZ5MKzG2hLuYabeTj/EfB6GVjv5ViylWV+c+/oSbH2KWBR/NiMeftaO9rqsauKTNfdgcHISTyKfGznKUbQV0G8CKr2W4Mo83kxXbHiLeKxiUI5c/f/DqfDDRrybtiQXIYmiQPdW/IVM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SEZPR06MB5071.apcprd06.prod.outlook.com (2603:1096:101:39::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.14; Mon, 7 Mar 2022 09:56:30 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::9d3f:ff3b:1948:d732]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::9d3f:ff3b:1948:d732%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 09:56:30 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Tomi Valkeinen <tomba@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/omap: fix NULL but dereferenced coccicheck error
Date: Mon,  7 Mar 2022 17:56:12 +0800
Message-Id: <20220307095612.409090-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0050.apcprd03.prod.outlook.com
 (2603:1096:202:17::20) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd23b7b9-a011-4c5a-68b5-08da0020c105
X-MS-TrafficTypeDiagnostic: SEZPR06MB5071:EE_
X-Microsoft-Antispam-PRVS: <SEZPR06MB507122A3AF53ACCA89A8E02AAB089@SEZPR06MB5071.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDUe4FSNJ/Iu9cSgMveZhzTTQt5/dxckq2tv1W63vAfRO9dkcuYsB9Vp3qEFy6L3q4K0IpmLLp15LROVSPJhI9AKdKN40Koxw6u7ibpsenxPf6EjXm5CUD2UDGd/BbCZpb67VlxznO0UfC05GXOaDOe2IMckHWEx6gyl07mqged6yCUkVG8CNPxQShRbdVUrj6pteuXRYW8JPEIRXsUCfM7beClaxNG1Fu/nOlVvgWWO4d9qOI1BonSMrkPm7cPVu6B6xFwa6rlAjcvqo09VaVLBm+BJ1CacOjo5MRHioU61R3OZctYU95mtW5s6tG2tPEuxvqo8V8gEtz8HgpkOyT+mRjvMe9oYPIG3hXapBiuqLAXUThwbLX2kvfwYpWj+q9fqpWoj2Yd2/cZDGJoibTKoyCeVlduqXur0GuzSw34iZJ/Xyo+n6zp2pmuEkbuZNGiCosOqZgeBrNqjrQbtJ9q1uAUJaMoia/WSZ0wbzhlAloxPrwSFDFiOoNXsVWpXXo6H3k2JtNylGW7+IoDEMEZBXfUSxUGWJgrHv7NwrlPKjS8ow0EtDkcSjyVcLDQP3xT5iHibZ3rRIpS4Nym5C8Tr2Sh9bSq8PMh3a55BJN9rMkVlLfreSvqRFJz8qHSDhg1pigE5oWXqKwYMViCxMFxPIwBkm80rHO6rJQUXzhbuZesFgwzjwCGGbfEVgjqI/N73Op8mbOr7D9hJ2Xh0qQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(66946007)(107886003)(52116002)(8936002)(66476007)(4744005)(2616005)(1076003)(186003)(26005)(8676002)(4326008)(5660300002)(86362001)(83380400001)(508600001)(36756003)(6506007)(6666004)(6512007)(110136005)(2906002)(38350700002)(38100700002)(316002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J4HmWOH5MdEF5hVUFvZRamGPIXLBPADEcXqH+iFaPjQbbXD12a2AxkbvqD+G?=
 =?us-ascii?Q?pEgiF/uDW4laK0/0O95UpIgwcF8kNCVDfhVm4FDLKm+Ei8Qy/xqSsqsDjiCn?=
 =?us-ascii?Q?unRK46j5O7Mp/vM7TzBzcTw1dM/mSRKR7k4Yg0kvMzQnLQ+LivuIAjT5gpxO?=
 =?us-ascii?Q?zTRSaIp+0ik5QJHwhc6EzAbBXmC4XWpm8i0k6+80AVRb47vur+U6bk8NlTaP?=
 =?us-ascii?Q?UKvpUsZ05unz4DVXfw8TeHYIj8JOr7t5KG/mYAUVin/6AHKJS6aq36OrjVFT?=
 =?us-ascii?Q?u2RAjujcjKvry5lDnEkA0fyWAlXlPErTskeaQ5uZH1V7TPtJrY7tO6hbs4A0?=
 =?us-ascii?Q?kvjRkWOkNsVEacy19fwY3VsHbA+mQVwSMyCjRGzX4Jdwi+u7lUrEtYAlp0o3?=
 =?us-ascii?Q?55jYX5Dh+aytormec2GkxVFCODwye+RVLgecd48HRBnrf6qU5JRfUAS0VLj7?=
 =?us-ascii?Q?aT55jGMRDW1Ev7TG/rnQ3mqEqAfXZ1AqHhXHFG6IcDFR6YGINGErBnQFcKcZ?=
 =?us-ascii?Q?t3oVG3Yp7TbLp0aQr3NYEV8vO/sR7WT76svxNGuYEL9OhY3qcX2ztYxKnc+9?=
 =?us-ascii?Q?5rmOOkO8tKc97xT1NSGcrlCUtDy41mzu9A6cW3VC8DCh5Csrwq1yGmHa85+1?=
 =?us-ascii?Q?f6HTR2HBesSKFkjSUhmbeh21kpYHQfGkI41DcOVOKAP0F414Z1MMYgTJCNrM?=
 =?us-ascii?Q?RrBKvICcJssgMDczdWncy2M9XygG2CW3yhbCjZNKzDdJwAB0f35JJxNjHd5z?=
 =?us-ascii?Q?+znVwMSeULd+E8Fo2PBS4Y4T8xpyq+rgHyfwVSKfSjdKUAKMsxYXHe/t8cHn?=
 =?us-ascii?Q?JzZ+7ndTSGT4TiOQR1zKsO+yD30sx5X/GRQNJ0WZ3DCzzgJIhjfTpAes9QkI?=
 =?us-ascii?Q?w+iHXyVP5RaYN8zRDOSDtoq1AEEqMiuZ7evIik72G5tUBGQzZJyeMXls9AsS?=
 =?us-ascii?Q?arrlzTM/PaXSX6s0MhDOOSWiRcd27/f2NUJojJs8WGdCing2B/LpkBZzRHvt?=
 =?us-ascii?Q?IN6WAJQd2bHEDKgLTIbaYQm2LFt9n6EW+QgOTHYIhbY7DkHx8gnxp+DaRigq?=
 =?us-ascii?Q?9CK+lq1Y4iBeu4DW1r88HQCEcn0DDehBrtKOzwfobDYwTScqeiodzATAy0K4?=
 =?us-ascii?Q?bwr1je3HZUnMIKWpv4n2CcDRWsxowfBp0EKE57CvcV1soO6dcOgkzkXJe6gt?=
 =?us-ascii?Q?r1OOOE62Mc2/GA70yvaQEygpAQct5MoQBeSNxiKAanZlOh5Fxt/G3Ega07Fy?=
 =?us-ascii?Q?Vof6wJFlnJLJgKqMWvsDUrU/fEYLMRyPpTqsJUuOGQUAY92sSsoxDcCNOx/r?=
 =?us-ascii?Q?eccwZEEr8Ezo6WBTxAlzgrlEw7molO8emq9dJYOKNnCv2SzSpCS6NJiUhrpe?=
 =?us-ascii?Q?peEeUZi4J7pZfZmG9kmH+SU+zSrpoXbcs2B4uQ5/g811oqBX8pTRkKXuxRjx?=
 =?us-ascii?Q?NK3mi7k0Zzm9dU+TB7CdnQwNsayQAhAfQDAB1HEKzxTMnsqP28kzVr1mJkTe?=
 =?us-ascii?Q?uCKE5Fd4PfM4t99vniiOJhE9sQM9VwuUW2GbtwLAo8O6BodHwPGLPI1eJlWf?=
 =?us-ascii?Q?/lgD1yIkasLWS7mrTPSg9BetVIgZjtutvSIKr36OB1HPuI30t5dZp+pm0dl6?=
 =?us-ascii?Q?fuHP3X8pVmfsGhxsh2m7rpk=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd23b7b9-a011-4c5a-68b5-08da0020c105
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 09:56:30.6469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vvOYnygho/cbRWRejA8bxBKkCh5B+heuEbYXer2nxoKvTZ3wlMf7lMmKyMx6tAtA8MA6g2lsZgXYmFSQ8Wf0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5071
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
Cc: Wan Jiabing <wanjiabing@vivo.com>, kael_w@qq.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
./drivers/gpu/drm/omapdrm/omap_overlay.c:89:22-25: ERROR: r_ovl is NULL
but dereferenced.

Here should be ovl->idx rather than r_ovl->idx.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/omapdrm/omap_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index 10730c9b2752..b0bc9ad2ef73 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -86,7 +86,7 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
 						     caps, fourcc);
 		if (!r_ovl) {
-			overlay_map[r_ovl->idx] = NULL;
+			overlay_map[ovl->idx] = NULL;
 			*overlay = NULL;
 			return -ENOMEM;
 		}
-- 
2.35.1

