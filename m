Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D80AA7EE883
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 21:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C5E10E6E9;
	Thu, 16 Nov 2023 20:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02olkn2028.outbound.protection.outlook.com [40.92.50.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BBD10E6E9;
 Thu, 16 Nov 2023 20:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LSMMK2LpiCYIlwfEAolno/MlYPT6breerFpLbViMji27mXHJKtlVqiH7J/xkitBIv8D7aCsWpgzKsRWcAzoSZFXje7DfAHefBdSYP3LVdlDOyhYrVSX3jV4i6fH0zEvlEGXvqbrmtJU4B7MnwM73j+72Zs+JEdFzHemHAJgSXJCO2O+N5uwZiJFXlvMU6q7R/mZeZKrAHuXcX0bg2NYsjSc85wi7OXkHQ7+cSR0ij7cc77E5s7eu9r/LzAWEd2sEtfU+NWXPhTKTA41z5RCvD22xfrMTe30j8ikUPPo8dPUryDxSvlin42aOjB6ho10FXt9QKYhYmKsjnF537+j5xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQNshLlt0GdrtbGrvbEjdZvpIZtXhwVa1R42K7SEs30=;
 b=RrtOU6GcZHM9OduetJHhgGoBgwQ+lDULV1nALIdHlD+WNjRF2nPEjDhmIIQcGk4B/KbI87ct1NLuyjGEOxyj6TpGqQZcuk2P97ClBMZY9TgZwdXRhafHG2fxr59JVJLgXAAkTlBhsnVuiyKbfJOtjmvSnxPj7Tmky1yXhU6TEsutYliVqLJo/YsWT5kYA4NPqOySu6CyS78naLE/sDOxFjeb1iVq01l+7YXR6ym/tkgyFZAmph3ZkzHvDsgC6HnTwHrcSOrH2aAYYAqcItmbabMBg9qLE4gz9mA8sA5aCS7KcwW6htzcVzy64c3ySV7mZocRsKZ/eYh2RQPh7uhqcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQNshLlt0GdrtbGrvbEjdZvpIZtXhwVa1R42K7SEs30=;
 b=hFAiJBMAcv87j+USEMjQx7947odItX4rfz0YDzm9ykq4d9BRtR5PE/KuqFiufgs5wJf7Xu3qrXTD/GEkLe/kWkhH0X1CDurLiCvl48Sq3I+0dDbIqJpm5rZuE2ceXQMTDgcQoeXgTC6oe18KK3lV2jRDR13Y0nG81KJVtYpbPPXJORMKbPVxFjicRPt/q9xYK4Uubv1BOxFsBn11+UIWxKT+4JwPDpvcLzIAAhdXJQ/7aNd7juZbBN+4Z7cOkMvijgbvNR6UdA5NW8qC23PvyV6sdyT7VfidYOkuUFAsAgPifMhqqojaRIzPEmb4zyiVDo8fBh7VSX0982s3dG5hkQ==
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:83::20)
 by GVXPR10MB8059.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:111::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Thu, 16 Nov
 2023 20:52:28 +0000
Received: from GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450]) by GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c45:bfdf:a384:5450%7]) with mapi id 15.20.7002.021; Thu, 16 Nov 2023
 20:52:28 +0000
From: Yuran Pereira <yuran.pereira@hotmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Removes unnecessary args check in
 nouveau_uvmm_sm_prepare
Date: Fri, 17 Nov 2023 02:22:00 +0530
Message-ID: <GV1PR10MB65637F4BAABFE2D8E261E1DCE8B0A@GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [2Bib8ajI9sDOFvRIql6hWPrHGcUfuJBD]
X-ClientProxiedBy: JN2P275CA0014.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::26)
 To GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:83::20)
X-Microsoft-Original-Message-ID: <20231116205200.105928-1-yuran.pereira@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR10MB6563:EE_|GVXPR10MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: e856e520-e34f-4b02-bbf9-08dbe6e5f1e2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RBRw7d7RSzUQ+TL56OyqMdDZdMo9uHzAdgHgOJwHfRNPMR8ww9idT99gz8eysMVFt+rRUeoLcnoQCJPN++1nTBqVMULllU2bEQXkArvyNeiOr0yC7dczjTCMat/I2Umvq3d3t8OfuZBVX8c0//baZyEBDNs4D2bodgZ0MTGHR+mZuVSiz8noEUhHyuIwfoNMIrna1DGhoE1QZI2kacQ8NRRZZklMcNHVMZJPIqJ1srt+8hmMevZk35PzUfxL2zfdATpviuzRtcoYTROqH4rYcDmp3l/HlfnskTlI10/gFziM+qIw3q5OkZlEYANu7MQSZsSN+tOvGDZwqfAWtxU+mLrUkiVvLO03PJsnFSTgTkg+oSpLOykyWSVghMuZQR/C17cH9ICzXZgIngNsqy79qbZon9juwKqU+A7qWOsrqSdzzQJpta+Gz+KRheWXwiQARNpgE7vgXLbOFF85YNb+4Ko7Do2VUN98SJ1lGHdaorRZxTOe0Ztc+ib2lKtWlB5eW6xg21geAqwQos4rqEoOhelhVqr8FVHnAex2ssFzHHOnqHhPqoGEfvL5HJqYVwmEhxJVagp0XM8b9mrHmwgTT5UQoxP9ZSEfzcwLD4aNvbo=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PDVrgFeOfY6fiXnfuCCUJ+SCC3J2CdLX1sT0xrgTWw7vw6HcMp/VT8kTK4s3?=
 =?us-ascii?Q?1dM5GMp1uK6qHhzm2RD+IHEt4sFCDDE5D9d3boxCv564zJsdAWpzT/rC1BYv?=
 =?us-ascii?Q?V1iBj2o5mYN75gcvbfXQUjEcJZzZDLArxa2WZqs4WhvW9TzndKTUQjHiPaMU?=
 =?us-ascii?Q?Y2xo17tiwXy+QW5l/lbKRDw8HsBOCt4ST6sE6dlUFRG7OGJjAC1LYRYywfFa?=
 =?us-ascii?Q?Lr+ulBRLkyAuJ7PTJx668C8pq7bFjzLWqJli8x5tVt4iSu6X+8F16TZ7deQ2?=
 =?us-ascii?Q?noD2LwWqrv0qr/zRwDo3vJW/Py+2GD4KAh7EW6w0cItUejdCYwIaE0TlYKpz?=
 =?us-ascii?Q?0bdCE7KiiEPlyHJmedcgEd74T/qqBjHq0wtR/rhlkNuNcheTeerJQd45tRJg?=
 =?us-ascii?Q?Wcx3xj2yq792kNqQymjCEmCbVShA1WWnATOdFFua6aK8aN5lJLuugIaRFyDI?=
 =?us-ascii?Q?ibt0Ct70nBYncz0I9dxMinYtTLfjlOSa84yr2UaortIJkdkayPaCGDeYl/7+?=
 =?us-ascii?Q?qCrbMAsUucoTi9A916CVJnmQV8ilaSTc4vyoQTzFv9kJtc4Im0kBGhUvtnYi?=
 =?us-ascii?Q?hkLrWeFxDdYeKwbTmyaodMj6k6hYPeSCCquSnr2YWfKBXnWU5wynpsTDDOUv?=
 =?us-ascii?Q?HeltbFDszqoEEAQ2m1GKpLQa+AqDNi8pMo5Y6vQzdaf/ZGa10ItEBxEbUuHc?=
 =?us-ascii?Q?oHB5j1WBtJjIPiVKR2Q9Eiev2EvfHOoum0NgvUCOYqmbDBJbYkoyNdK1xuyD?=
 =?us-ascii?Q?nfwF56h+FJxselYZIZSCzCf9Q92pxnLyPgVjekzc6gzVsEqAN2TVlYVzSV5a?=
 =?us-ascii?Q?9l259N9XdJMOc1Qub9Mpwv2sKetdjaRI2RcBpQ//kqLZC5X+LYGgHvAC5ejM?=
 =?us-ascii?Q?KDSuWus0qe9iK9CiI6ecZ9StaRLAyOTfWpdiSNCRCWy79ksCRo7qrGmvgHL6?=
 =?us-ascii?Q?8pC6KZ2uBzf7GmhOeIuYpV8ih/gAaHSCQf9xTC4pw6CDdXVvC7FXptXRWYi7?=
 =?us-ascii?Q?R3Dx/rRTR61Gvi/c+B9rlPGR90xyiICJhvAAcKdpipfh2Xs0PoWB7Y2Yfto4?=
 =?us-ascii?Q?MSLK2feEYkLAt2ErSJGJBxZd+XwRLz9S1cpKm6uPD2Y/PkXQ+gG3d0Nmh3WX?=
 =?us-ascii?Q?nnmTKDp2MeKbNCQD+VA4MXJ9axhFmZ7/W0/kyBBqTxFvpHIY/eNgoLfOGrGE?=
 =?us-ascii?Q?ZUKS9XPjRjuYyeyQHqZYjy/V39Eg2blVXAPru/TzXot4tHX/LpNKHFsnufo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-6b909.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e856e520-e34f-4b02-bbf9-08dbe6e5f1e2
X-MS-Exchange-CrossTenant-AuthSource: GV1PR10MB6563.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 20:52:28.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8059
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
Cc: kherbst@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, dakr@redhat.com,
 Yuran Pereira <yuran.pereira@hotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking `args` after calling `op_map_prepare` is unnecessary since
if `op_map_prepare` was to be called with  NULL args, it would lead
to a NULL pointer dereference, thus never hitting that check.

Hence this check can be removed, and a note added to remind users of
this function to ensure that args != NULL when calling this function
for a map operation as it was suggested  by Danilo [1]

[1] https://lore.kernel.org/lkml/6a1ebcef-bade-45a0-9bd9-c05f0226eb88@redhat.com

Suggested-by: Danilo Krummrich <dakr@redhat.com>
Signed-off-by: Yuran Pereira <yuran.pereira@hotmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 5cf892c50f43..c8c3f1b1b604 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -604,6 +604,10 @@ op_unmap_prepare(struct drm_gpuva_op_unmap *u)
 	drm_gpuva_unmap(u);
 }
 
+/*
+ * Note: @args should not be NULL when calling for
+ * a map operation.
+ */
 static int
 nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			struct nouveau_uvma_prealloc *new,
@@ -624,7 +628,7 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
 			if (ret)
 				goto unwind;
 
-			if (args && vmm_get_range) {
+			if (vmm_get_range) {
 				ret = nouveau_uvmm_vmm_get(uvmm, vmm_get_start,
 							   vmm_get_range);
 				if (ret) {
-- 
2.25.1

