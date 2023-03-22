Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0BD6C4844
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB5AE10E90C;
	Wed, 22 Mar 2023 10:52:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54CC10E90C
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:52:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaXaHWgcXYm60AW2TOFbMAP4yI1wI5+RP+MhjeH8KoZ4h5nLwjlI+8axjRweOXPS9PaM2m6VGnSyJCgsNoVrqHDC0+0Cgv59kvN217eazkMxVWoZpXXN4rIIfblxjMQTFmBWAyQ8jPCE/JrZ2Qu+znPTvXcCVjCPqOGlq0saqiQ69f9HAqgFPc4dvodvzZ7sHCF9lirBtGeangUIpc/k4lCU64DqAy2FIcZbawFgRLEvYvZv7iJkrzK0MuxclNgCbjuucDvwi0dghhkcihH0rAmZSjKKF+kogWz3HUb1fRH6mAFuViWZ7acPuhga9QT8EV11xuuIEgIgrUbqxaVomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqYoFjwJYuabVD8mrE+qA3glvjxf3i486ZbRAnAE2K8=;
 b=HaED/AWHr2A9ikO5DnqXCfKYTP3SibPk+pCSeBrDZrRExk+ObQU7SECDPjzwXogy9D/PQ63FS8lXqZouogsOEeN1E/kUG98myfdnmZ5WHuT6t9JiqEptCkSFzNYus1vsTmLxOGHMAH5AChgh0RMxvvFduN8HJvroBgnfxQEwgYEfALcImSxlVj7AWGAmbZDHP5wxS52e1wEA7CnQlcpj1i6njIdZkOFBKUwhUHz3A7dhbjp7V3NRR2h+GqKVFPOIae5B39mgFjC1OaztCRJqt7LYyU+2vwTMG4xzO2lQrsC6VW9t+P17QGpjlABtRO8qMC1vDWgKcqPfcCIHHKMXUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqYoFjwJYuabVD8mrE+qA3glvjxf3i486ZbRAnAE2K8=;
 b=kW4AtdGkr7U0g+wk3CuQgi9RTs0GbVr4IxSmVpGsjma3KJQFRul1gKnAnnY3wBXMuCSOho02bFkzzNx9CRIUyzwi9J/sOTayaw9G73uabIASHox+OVruPWMe852700GJcomC7GzgIfMvQEO64u9NbFUTbkEVqWFwIhe7qNsktGc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by BY5PR03MB5093.namprd03.prod.outlook.com (2603:10b6:a03:1e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 10:52:51 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::96e3:3428:3a5b:5872%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 10:52:51 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] RFC: drm: Create a alloc helper flags blob
Date: Wed, 22 Mar 2023 18:52:26 +0800
Message-Id: <20230322105226.122467-1-randy.li@synaptics.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0PR07CA0109.namprd07.prod.outlook.com
 (2603:10b6:510:4::24) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5196:EE_|BY5PR03MB5093:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a05af8-15a7-41a5-71df-08db2ac394e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cumEBjgEakVpLFyCFdLPSipI4ngnrgn5xafc+/5pIufV+tmLIMp/pia5koi09CaZd1JI2qFqAOR84fEMqbVwLdde9rq+KQAr4+Vc021UZXMlwgNwcoXTRH36lkqGBLLdhVX3ix76DqEAEQi3j/uaqjvwsPiTYkFqEo0oPO0UPpv8EcKn69FoZdlwmMjb5xjoU418Vm6ZPGvdhc00BxeyABHjn7uNRedUbPSdj8j3lDDYo/Wfc7lYjy6Jw1eEhle656A1biJtV5YXfZ5doXyc4yIFlqiHL/RIv47GACr4qR8k+17aqOUA7RW4Rtrga/num7uVBUioUdwWl8Dy75eCi5cq9WBxnMJ6a9+2OJcNf75mjr2BXGFD+j8Ra/EUs3FdmS+64DENnzBDPJa4ef1FypM0ArtQ83tDbmMDnHIwBQcuHFVe5sqYodKlcBbbcZTsp0hXHLBHVtcr39gBlpj2v0MRrixFvadFn+CUGWAWAGEoMcwMnWOoRjKH09ucKAlKJgmI1eAxEWscojWEGuPF4iM4WUms/L7n+FnDO7Z+Gt6ewzLS1PVMiIsQLUJVb/SlS43hwMxnpeQ7DIEQSGD0/GcEGTSQ55Rpr4uXkv/Sum/aHXpLwLtj4Fjt9YD5ut+4W2ssqe6RVSJlhJnhqmEYRfjZzIguzP+b6N+P/8EG0jFLIXY3If7Eu1P208GXVHbxoOyL+CcMdLQQ9mmby3YnRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5196.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(39850400004)(136003)(366004)(346002)(451199018)(66899018)(66946007)(66476007)(5660300002)(8676002)(66556008)(41300700001)(478600001)(4326008)(86362001)(7416002)(6916009)(36756003)(186003)(316002)(6486002)(52116002)(6506007)(26005)(107886003)(38100700002)(2616005)(8936002)(6512007)(6666004)(38350700002)(2906002)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P2vzdlYjidS+gomcqcdMD2niR+vPrKvjPF8XjLpGKpG1fsFEbFUz+HWr4EwK?=
 =?us-ascii?Q?/5DsBXSH+Urt+CM+j+d+sZcJeoHfbZshKutCcbeGc10WZaDIH8gUptJsUOpI?=
 =?us-ascii?Q?6ThgTcQwcBpHnUM8ABpvRVYcqpNigQ72JmNqSNfnukMk91ve3Sv1LucnPG4N?=
 =?us-ascii?Q?wTSB9pWO+fYl3TAAKdz8sErSqDlafL0I6437iOR/wAE2dur4Ka6Cgq49uKUQ?=
 =?us-ascii?Q?FLa2rBK7Jse5g6khrsBq4PXPtZ6bTnb+LKnasJs0eABRYJKgwRXQoK0Sq0cw?=
 =?us-ascii?Q?v+oI5mXDdAvF1Yhyn6X9cv+1Tl2Mhy/w3m3bXR+NxPpAJorcWkqlE8W5bV5j?=
 =?us-ascii?Q?FakxFelkb97mj1Pzw8aH5qplzzj4MtagoxPx8xYcJMdpsOfrpVJ+z5n4AAKy?=
 =?us-ascii?Q?YJL5hY4i/dZmqKGPl1TxteqsXjNXjMSpu9dxOyY7CiuAxTmwTIDj4yDZSv/o?=
 =?us-ascii?Q?Hxs2sdDyl676w5/Wg/YmxzIelDiIT8oo25c1LQJkuEZGRfkqYY1OaZkGveso?=
 =?us-ascii?Q?Q4q4aE822bazN+XbI9+ivCDaDH58xEwKMRFy0xrdPuUwY9BrDoN3JjtRnrGT?=
 =?us-ascii?Q?egBjKJfmdXjqCfI8R0xlwvz/WtzkAiR1kBHhw5xg+TTtSJumdQO7URqdQqg+?=
 =?us-ascii?Q?f13k7G2dm0ni4ZykWLFB1vWPYN9bHxIm1yee54GzeJ6agKodYrQ2E6VjSOIJ?=
 =?us-ascii?Q?a1rRoFjDPUIq9RXjOlTs20/24gIvjnHP/LkFAgbl0Ka9X6Pk9HN+wGlmYfA0?=
 =?us-ascii?Q?kI/+5PgYnO9XegSqc6oki87VxQW7YyPs5uetPwx/eGLxksPf0P6Mj7MPuwNn?=
 =?us-ascii?Q?NePKZfsTaG5yIe4qLt0X1x3VFx6fI4I24o78ZOCHe3aMnUFhaVfTJosS1w1L?=
 =?us-ascii?Q?1LkkAMMt9Cf1Edlt5ClxQw2T+Ygwopj2CpefzR9uH4PGcGKVLobGVYuOneg8?=
 =?us-ascii?Q?RTSBttHC+tjO9UclsLOc2v4IkbN98wb8B9o2Ys8nJe7eN0grRtK/RWF3e610?=
 =?us-ascii?Q?13ootBqoN3twutohQx9ttEoDKFskwMyXWrDmcExe6gkbi3VxuiK5zNEyqVK0?=
 =?us-ascii?Q?RcExO0MIhkH+L5NR6xU9IALRHNU09E98Cx2ovV0/5OtufgaDIhny9oJ/h5w4?=
 =?us-ascii?Q?s9b5Df3Ndwu8hJF7lEJ5CIukAnE2b3HUQ90CiC+sFe0JL965TkYYKSt+LF6w?=
 =?us-ascii?Q?px6S+AusRheXm5CcNb/61OWkoJCoPla4rqJSol8B4sre8tkhW5pNQ4UHH5en?=
 =?us-ascii?Q?mBDrp0AkmZpHrkvEKpKJfP9SH7i7IWfaykCCZC823gtkMMmtglZGX+dpkjz1?=
 =?us-ascii?Q?YVocKCrlfiPCl0H/LjrMyTiYSziqsJ4dMxWE4g4F7TaQd2F30XOy9Yo0JmVG?=
 =?us-ascii?Q?FdxTo7PFuFXPILyV9Vdjk6THdYiDft6/IhtdA/hpJg7Hon56BxY5Cv/M18cq?=
 =?us-ascii?Q?3FkqcHEaN1Nda5t16+vJGiy+VPhYsisHDVSWZU4H1Gh6TeV7OPiZ7GfcUoaz?=
 =?us-ascii?Q?SjSQNlQ/iIc+sJJBu/4ZJ+z/UCxyBXB3vXImyLP0VW1WBitj1akqGSIFh69U?=
 =?us-ascii?Q?rzNvOaTnq3rR3o3eLfQw6ziesgoePPX3xTo93E3a?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a05af8-15a7-41a5-71df-08db2ac394e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 10:52:51.1210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY5nD6QNlq3I5BFwm93TrjRf/xLQzlLaCaunhCwcJ7XBvIMwGAAjl5ycGllxFThJm0pZcaw7gWx3+F6uKjouPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5093
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
Cc: tzimmermann@suse.de, ayaka@soulik.info, linux-kernel@vger.kernel.org,
 tfiga@chromium.org, "Hsia-Jun\(Randy\) Li" <randy.li@synaptics.com>,
 nicolas@ndufresne.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

In Android, we could also call gralloc to allocate a
graphics buffer for the decoder, display or encoder.
In the GNU Linux, we don't have such framework, the only
thing we could have is the GBM.
Unfortunately, some platforms don't have a GPU may not
ship the gbm library or the GBM is a part of proprietary
GPU driver. They may not know the allocation requirement
for the other display device.

So it would be better to offer an generic interfaces
for the application allocating the buffer from the 3rd place,
likes DMA-heap or DRM dumb.

The storage of this blob would is different to the modifier
blob, userspace would likes the format key and modifiers
data relation. It would be better to let application seek
the allocation flags they want.

Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 include/uapi/drm/drm_mode.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..ee5b4d5aee0a 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -218,6 +218,11 @@ extern "C" {
 #define DRM_MODE_CONTENT_PROTECTION_DESIRED     1
 #define DRM_MODE_CONTENT_PROTECTION_ENABLED     2
 
+/* DRM buffer allocation flags */
+#define DRM_BUF_ALLOC_FLAG_DUMB_IMPORT		(1UL << 63)
+#define DRM_BUF_ALLOC_FLAG_SEPARATE_PLANE	(1UL << 62)
+/* bits 0~31 were reserved for DMA-heap heap_flags */
+
 /**
  * struct drm_mode_modeinfo - Display mode information.
  * @clock: pixel clock in kHz
@@ -1168,6 +1173,37 @@ struct drm_format_modifier {
 	__u64 modifier;
 };
 
+struct drm_buf_alloc_flags_blob {
+#define FORMAT_BLOB_CURRENT 1
+	/* Version of this blob format */
+	__u32 version;
+
+	/* Flags */
+	__u32 flags;
+
+	/* Number of fourcc formats supported */
+	__u32 count_formats;
+
+	/* Where in this blob the formats exist (in bytes) */
+	__u32 formats_offset;
+
+	/* Number of drm_buf_alloc_flags */
+	__u32 count_alloc_flags;
+
+	/* Where in this blob the modifiers exist (in bytes) */
+	__u32 alloc_flags_offset;
+
+	/* __u32 formats[] */
+	/* struct drm_buf_alloc_flags alloc_flags[] */
+};
+
+struct drm_buf_alloc_flags {
+	__u32 format;
+	__u32 pad;
+	__u64 modifier_mask;
+	__u64 flags;
+};
+
 /**
  * struct drm_mode_create_blob - Create New blob property
  *
-- 
2.17.1

