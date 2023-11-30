Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40247FF439
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107D210E723;
	Thu, 30 Nov 2023 16:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E7C10E723
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:01:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AUDP2tJ019919; Thu, 30 Nov 2023 16:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:content-transfer-encoding
 :content-type:mime-version; s=dk201812; bh=EYK1KqUTDTPl4Z7U8TQ5r
 WJ9PaZ//BMXEk0Dmej3Mv0=; b=brB+2qiMjxuIGZ8OwyGA1sIEz72wk5X9cneAw
 nj+mhDptvTxO1AqHWBaGNjAhw3KY9krQZwoKvyaRo8t8vC3usbfakNblbJqi/cgR
 qadxpDkvGeWgBpdX2jxCRmZ2qDPt43qUb6kKcZEp2Fewinw7bn2YCURlIs0ijNiq
 7TwKZ/QNQ7skRQSZv2myOBbSoEO2KOB5i0RNSMpSeVG+PB9/cCarEQP3UbwLy38R
 pHwDCCTkooKClP7bAupGnF+yVVXiWJ1RQYOeBQKZ60Af9RcLgP40wZgIr3KbgYXr
 k3ncmPkkPnbXSaZuhrCFvuQwK5vybhSNg6UyXHotaBCWPnrww==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 3upgr70nh9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 16:01:02 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 16:01:01 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.40) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 30 Nov 2023 16:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7GtfIBnrWx8AKfaGyM/sZEY+lK+GneWubR9/USTX28HD+FMzZ5HLXJGtlZegwWHAaHYNoBUU/4GWwRGOwcdrxdRk0PXe0hbTHrj4ECPnRzWCsQFalv7cUknq+mTygeZOs0/hWl0McNf1q59zuNpFKh0250VZA/fd/4MpTnzpOaDoBTxwgs9C31DAozxE0PqXhl69EpSYtA/mSxGTroNtT2A6uOH0VXcLU1o8aiR4tlKr6vL6xIB1+j7Etu13fivMAv09aJkUqeGYpZMxVquFk5YSGz2BBztgY6+hP29njStrRdrLuo+H9UY3fQCw5H6y7gP2iPs660d5KSNxcOWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EYK1KqUTDTPl4Z7U8TQ5rWJ9PaZ//BMXEk0Dmej3Mv0=;
 b=BxMsQKgJCi6L8EQDBw8jY5HngNUyja8QEoAo6XvMY1gq+gCKXqDlX/Gf54bv/u6WBOo7KAwlkgdHZYn36n8zTxdOcDcvxkzn5Q5kbsgJj7oupabMq161qK0o0uFiR3Y3BXOkbHhLWs9MPjx6DHX1BhxbQ3SHSWQ+0Y6hwGXLZyxXUyiyvdoAgSlgPqmVmK1Zj+Km54CTYQ+KDE+uYVEPZnZvy5u50QUgI13H7U0vMa1XWsUWcFLOV+vbmiNnh2F7fdU05IRWiaryfX/kOnAels5sCzHDXzorh/Ntxc9JKE/dgCFBeC/9jr+bf2lKFeOhMRotMCXR1lgPUcN6arASgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EYK1KqUTDTPl4Z7U8TQ5rWJ9PaZ//BMXEk0Dmej3Mv0=;
 b=c39FrDSpG9m6hh9cUiNuGcg9CQt+Hj5gfYA8Xzv7m6pN6WyWfi54TO3tqDpPK1MUQ1K4GnAJqadHuN8TdUchdT5bqM9fEtH0lUm0e555tRZW/uhaBjjyhEhNBH1H843eX0vh4wUOgvn9BUxl/slMVH2426Tl81JHWFK0osmpqaU=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:00:59 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:00:59 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/5] drm/imagination: Fixed warning due to implicit cast to
 bool
Date: Thu, 30 Nov 2023 16:00:13 +0000
Message-Id: <20231130160017.259902-1-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO3P265MB2410:EE_
X-MS-Office365-Filtering-Correlation-Id: 248372c1-1e13-456d-173f-08dbf1bd8b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMPyjV6qRfpCbdiGlydpIPlCrCebRK/zeGUw3Od1KzBWC6m7inobQHZFiOW1iXFROMrNO/1NnjRqHzHgBizKAbocINjxyzVwRlJ7RCSzdp937d9mpngfXV6TnS4FSZu4nHO6gdIMmp12ZQtnhJC7iAlXk/Mkj7fuNEC7Sb4oc69j0eGDVMYOn5AU3JK/fzLBHmuEe/tFu4Ox3E+1vKmGbF4uEJ/uHvYKHH/5FCHb0I696MBqcysFZctYzlsXB2eoqZQnJZSNE/n/kqtz7u0f0HlDTgCTR9QeXsryr2iZD+BFQFgBptKFZ52LXvDbeiM6FduRmqnGlFSsD0bF0mEo/0mlV6tZO2HCa22gs343iAvAOvUkGsf2BG2U6Y+tGh9sRum8RfB/BWOXaCJdjwQ2hLleDhb7cCMyMBby6aUARiZ1B6+qSBd8Eqqr9ommhsKVgBcDla6Ohk8k/Sr0OxBcy45fwBbOw3JobT8FcO4vJP1HarwtT/sDzXVaoOY/lb11Bs51/z5WRewDmz/DQHH+ocWrxalbxy/oymiIZCLhtLOo3mOXr/zsGELE+vM4pK0pm/fqtHt4hURWkCop1/i4Nr/uEZ6P6niVqjAXbnzYM3WPAyNVAf+RBAhObF2fwgCQjxDjoX+AZshC7SFjq10X2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66946007)(316002)(66476007)(66556008)(2906002)(5660300002)(4326008)(44832011)(8936002)(8676002)(86362001)(478600001)(6506007)(52116002)(6512007)(36756003)(41300700001)(6486002)(966005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rvFEvx1ENBv2d2XnrV+ydSRxxaxFiJ788T/MrE8Vk8CDiKMGH6kAG8keF33X?=
 =?us-ascii?Q?BNTITO374YgG/jN1xK/0zHI1LnI7SZ0UfWfSu7E6vMrNpZEbp/eNSR7vSDuZ?=
 =?us-ascii?Q?JlV7i3Q/f+oY8GoMTEwPEzC6RMJEyW9BrsOatHmkGlMHszXCdgpYKrL1g7oe?=
 =?us-ascii?Q?e+HugB/ESVVMzuvhatV+VChGGWHkLiswN3cBjqarQSj+0eNJh36X0zmm2dOq?=
 =?us-ascii?Q?/UJGPI4TR59vX1IIHempiwX8GVr1uFDEq5Qt6uGQ0M/T0WTbi1oCQZsRprc3?=
 =?us-ascii?Q?DvE7MI76FlvGeDwvIjGWmL35Oi0td9JzbnVSh1rbSvjptZo8YtIzjYIoxees?=
 =?us-ascii?Q?sO3ry5v2VBYj46+K6QSgUza32kNjNQ7RmIavE0IVsUWh307aqACDGVPdqPf6?=
 =?us-ascii?Q?5XPepfaYM5m7cZmHe0gnbrLI+bKFr3GDuXkbhd8/oXc6YMapLmrVJi+6rUvb?=
 =?us-ascii?Q?f7ApzlxdytrcYNiz7aO1pkFnvnzfGuCgscCT2Bsmsjl6PlIZsRrD23gKINBL?=
 =?us-ascii?Q?gOzWV7qTqVT+/4Q7+zlbBJDtxJwzh1I/KNVZK0pbIkOFtXKbEPi7xg99oOdq?=
 =?us-ascii?Q?DL77gDUkKomCGPb1Asa1gLA+w9bf333ZSwBbcMExtOmicQKVVZ8f5XZyNO85?=
 =?us-ascii?Q?jztxn0VKWYPNqQ5o9K2XonqhPQdbx94+643S281UbH9GkU4/GvaRhbZMmmbb?=
 =?us-ascii?Q?HQNTb4h7qrdZ4vHqIaGtQwfLQuryGCdOi4ViG4NMgFGmgW/Klz8IKKTVrY4T?=
 =?us-ascii?Q?H04AtSU/2SPy6FoSufndryQhd9fmLLAikeRybyVBui7MKsaODRcQIV0Deh7m?=
 =?us-ascii?Q?waUMb4xArco8Fcq8u487NZOl5iypEUv/HinJ0goK9koVrSMUoVLeaebkfghs?=
 =?us-ascii?Q?6BfNs+nAx8EXnwlrsmb1WJD8EjnsihNQGppu/LtlHtIFH2jpYOg8tY0rFAxF?=
 =?us-ascii?Q?3PNlndTVyHMZ6n7qQnG9J34YlrARKJNe65IZkOXC/tIXyP1Fgy37OiBrz+tS?=
 =?us-ascii?Q?OoBftmH/Swxx0oDhNddvEMrUjPusi7xnGH37lUi6qDpS20tZcrDeVOoUUYA6?=
 =?us-ascii?Q?PeTOj0Br7dd0zO7NCLdoNNDs1OFw5Agc64gfS7HfekAvKfKZzw3p7cAGWYSP?=
 =?us-ascii?Q?/SU6cbeiFcvZNU73HUXc/8kV8JZs6wkmTo/qnjRuSo0FjgrKM9YmMwv+nJw7?=
 =?us-ascii?Q?vIbHjIfU5yjXSJYxN7KPdpzq4vxz2CL/wKp+1dIVH8DstfNGzrWr9eA5kDlF?=
 =?us-ascii?Q?JcyBbuxXUrLNt86APvT54ukUMleAKuUVy28IV+Arhpv21RNo90o0g/X4v+XW?=
 =?us-ascii?Q?6iMW8Kh+tVJXZ0ms7L/WktX1Q/+450XDOFAjVVY7EOHJpaLjnTcmgevLqFjx?=
 =?us-ascii?Q?SZqyPQCpkyqY+IvmE+pqZW+fBwpAuZWwB2yGWlO31ntXHHZ13OMYMThEYyDD?=
 =?us-ascii?Q?yUb+LZ/NWk6GSUlFeMAwPGpKwREC01BqFrFg0J/Z45v4IM8XmVbcu704oPzk?=
 =?us-ascii?Q?kAr9qE+6z2aXPwYeNUFK3vtvaauXAzj1rwnBv/9T197mnKQkmrpnJTCZCQLE?=
 =?us-ascii?Q?e8gETSPS1WiovJWja6cPM8eNv4mJd/3mvqgVRkdg5JB8slPpSdTLIbbmiGuY?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 248372c1-1e13-456d-173f-08dbf1bd8b94
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:00:59.7579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JF7Uc0WMzcRkDpOMzvCEFOEMzGwlnYjX2/wKkQ0vgMNIeG50IrOP9ZJnQF5gOhbel/tk44ErFWfmsuVHuowm4UhQrzT/rTwIuNKrKX78YEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2410
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-ORIG-GUID: rLKPciWTK4LyM_Akzqp-J86nkaU1v3da
X-Proofpoint-GUID: rLKPciWTK4LyM_Akzqp-J86nkaU1v3da
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
Cc: mripard@kernel.org, matt.coster@imgtec.com, boris.brezillon@collabora.com,
 donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This line appears to confuse the compiler and had been noticed previously in
clang-tidy output. There isn't anything fundamentally wrong that I can see.
I suspect that it just looks like a mistake - hence the first note.  By making
the second operand an actual bool result, const correctness can be preserved
while silencing the warning.

>> drivers/gpu/drm/imagination/pvr_device_info.c:230:47: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                      ^  ~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: use '&' for a bitwise operation
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                      ^~
         |                                                      &
   drivers/gpu/drm/imagination/pvr_device_info.c:230:47: note: remove constant to silence this warning
     230 |         } else if (features_size == mapping_max_size && (mapping_max & 63)) {
         |                                                     ~^~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311241752.3iLyyFcA-lkp@intel.com/
Fixes: 1ff76f7a5b45 ("drm/imagination: Add GPU ID parsing and firmware loading")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_device_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device_info.c b/drivers/gpu/drm/imagination/pvr_device_info.c
index 11e6bef52ecd..d3301cde7d11 100644
--- a/drivers/gpu/drm/imagination/pvr_device_info.c
+++ b/drivers/gpu/drm/imagination/pvr_device_info.c
@@ -227,7 +227,8 @@ int pvr_device_info_set_features(struct pvr_device *pvr_dev, const u64 *features
 	/* Verify no unsupported values in the bitmask. */
 	if (features_size > mapping_max_size) {
 		drm_warn(from_pvr_device(pvr_dev), "Unsupported features in firmware image");
-	} else if (features_size == mapping_max_size && (mapping_max & 63)) {
+	} else if (features_size == mapping_max_size &&
+		   ((mapping_max & 63) != 0)) {
 		u64 invalid_mask = ~0ull << (mapping_max & 63);
 
 		if (features[features_size - 1] & invalid_mask)
-- 
2.25.1

