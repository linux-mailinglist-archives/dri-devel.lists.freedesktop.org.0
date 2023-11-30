Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25BF7FF43B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 17:01:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5622510E729;
	Thu, 30 Nov 2023 16:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B4910E728
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 16:01:28 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3AUCeVEx029829; Thu, 30 Nov 2023 16:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :content-transfer-encoding:content-type:mime-version; s=
 dk201812; bh=f/ESO+IR4Dvt6ZwtVsmSAXfO0zfyDZ0UtbvZktsUoPc=; b=GSK
 6VHzuZcOWwGngbMrsXsso5FUdhf+Q0GWzJWgZwUZr7Qy259BRgU+AwmoK6fJMWa3
 0Q//Y4f/7VIHdhA4Z9p2AfzVW5vfB9N03OxZ/XWn1Z+hFPHneI/umUhawu1C/yft
 zJwtgxcXLsAdRSNJHK46AkobnkAqqoigComkEeYn4d66vJXkGiLGADuVUTIX+9Hq
 sceR9WAMFP/MFBxdrC/7sm9HWPCrMlDH4YMMmIUqWjNYQzkTBRPdK2s3ZukCSUrE
 p4L7rLmbrGkgSmky/OdaCnN9E5EtgS37oULya1KCHVySidR3txikYzJKC2cChxuq
 L17XZX20894oa5JsDfw==
Received: from hhmail04.hh.imgtec.org ([217.156.249.195])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 3upgv6rktk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 30 Nov 2023 16:01:03 +0000 (GMT)
Received: from HHMAIL05.hh.imgtec.org (10.100.10.120) by
 HHMAIL04.hh.imgtec.org (10.100.10.119) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Nov 2023 16:01:03 +0000
Received: from GBR01-CWX-obe.outbound.protection.outlook.com (104.47.85.41) by
 email.imgtec.com (10.100.10.121) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 30 Nov 2023 16:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGYHp/9X4jHH43Zy2jaI3gugXnDo73HuDlI2bqjrASpHGsyLQjcX+/2XEpGAVvsjPe4P6m4iX8hLVufBXuYgQZtyxEDfTpex/3gt5oouWPVVj/Vu4uhFbLdBa5C8NC05ScBXnpCh0qGoDCbxT7rNZGQlJ6gCK7xeLXLHC/tcbu8Ro7FIJiuDdUZFhGjcoVsedo+md5QNs3lB26hVQsFuR5mW3DrTK61emr9J+3ej6fg2+eCHzARYiQPTycDTjaZ9TDvr7y9yg37Yzmxtl3KUj3aTRw9j5dQKw2k25iwU9FUnv0oUQeaTX1JhEzzwv59w0ObNfj/YkfejKO6jewsi1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/ESO+IR4Dvt6ZwtVsmSAXfO0zfyDZ0UtbvZktsUoPc=;
 b=maTjSGt/EfXZkb+qNl+Cvd8GidHABxFnL8Wj/wOnCbTqXzmMOgJgQcToM/sUqKcJf8QIsuaY5IGWvWkYV5/Rf/zJZMh+JKU+BFdksYghDv2WmyQQ1achm1zvC+w9l34NHYKWOiCAgtv2WvQ0B8hy+NVPb5cYtnj6W/we8jhDl7tON0uhyfZzUVwUlr8fQatyjvYuEnuBsVj3+CL0j/qthThC6Vkb9nGKMmrd/0iqkNSOFojMVRbE//0xoG/zN15NTpKS2yOgin/wLKIUPb7fzkyvSLJVyOl4TFbd3opBsq3qkomRL6Ban6RXZwvo9UDtr563CszQoSAkuUIrmU9Zew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/ESO+IR4Dvt6ZwtVsmSAXfO0zfyDZ0UtbvZktsUoPc=;
 b=l5iXOF8JDQe5YVJsG8ZdgFrxaRwxjN1/RyiS2lOVwjPuL7+ZGqlFEEHMXPaZTqZcR2U6W18/YDQIhLYJK3xfDHEl7kLKW/ul8rVEnk8TjWNt2kdccYJv34Kephy10qiiJfzgxPsH7TM/gN7soOGZNQTgHGgoFMD0PqDBUBJxx44=
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a0::8)
 by LO3P265MB2410.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 16:01:02 +0000
Received: from CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34]) by CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 ([fe80::a85a:76f7:c085:2b34%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 16:01:02 +0000
From: Donald Robson <donald.robson@imgtec.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/5] drm/imagination: Fixed missing header in pvr_fw_meta
Date: Thu, 30 Nov 2023 16:00:14 +0000
Message-Id: <20231130160017.259902-2-donald.robson@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231130160017.259902-1-donald.robson@imgtec.com>
References: <20231130160017.259902-1-donald.robson@imgtec.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0033.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::11) To CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1a0::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB5770:EE_|LO3P265MB2410:EE_
X-MS-Office365-Filtering-Correlation-Id: b40dfe32-ccb8-4b33-a585-08dbf1bd8d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRK9qDlaQCy1RKBQF2oLm0hIQLMBtHXdAOARqHWtPy2VcIu1FDDH+OJ3p6xih7UXd+pbbaBV+leo2YXcv+BzgpYTG0oRvUh8CBee4HQy4rPy6vdtTI9bv7JC2PHo5pVjQzLn5x/AFanzazT7rpZmHLKC0Ka1ByFVJ48U4IsxHwyexuFQ1EKJpnf7sYnYMUddPLFfna7Jd11D+Kaqy3eJASjxVlJuKMDvQ0dGhFw+PVAiI+hjXPFxz5WfnwSkI182Q7vtUEp0j9sxGiVNikRFDVZn6nBwawyW4BHtfP4ep5hVgHm8KzYbFhAag2qzrLqwyGFSgDa4zwmeeez76Z+l38k4UNIXV184cX0MmXPWUCmF45Lcmma202ockQtlUzWhH1REM3+JR6SJXgCh76CRu/8OunGAXA0mnTgydFfbr6PGxN2JF41ix26o5UWEAQIc9DNqczsEbYSb3jcSul6Yb4nMPH+CxkJT0D1FKfaM7SNhR22hmS9VVkWgYObsWJisXe7m7Uek3DDbuE0yzrN/5zL3lP4kleZiZ0wQA7u9gnuCuAiNnw3MiUc/Q6k6USrqFDXADF0MsvMSBgMQ8EKeMymSddAMS5/+CXIZWhiRjFatKsKeoZCnaXQEAOVIOpCeZa1Mx+uhYOYufgK6FU+WfA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(1076003)(2616005)(38350700005)(66946007)(316002)(66476007)(54906003)(7416002)(66556008)(2906002)(5660300002)(4326008)(44832011)(8936002)(8676002)(86362001)(478600001)(6506007)(52116002)(6512007)(36756003)(41300700001)(6486002)(966005)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hgHos+JUJJ0DIXzQh6Q38EQgY3PMimOgjrHeP/1QqQypbJoLFdw0ZKNC7Ye?=
 =?us-ascii?Q?05tZXKErHfq1+RXhWZeCl613EssEE2iawTdgkckMMAI5j9WdzUlyigOerx0A?=
 =?us-ascii?Q?SLrpAeAhGe7Vfwzf2XcGy7sByU5aUX2FR1VTKj/rwQcUs+Wn4+kUGZ93j2dQ?=
 =?us-ascii?Q?tAPHlhw2hMeRHWE9Dhi0j7xdFGi+Tv0z/IEeW+ETDk3ndsIP/pI7RhFOhPdB?=
 =?us-ascii?Q?mTVPd4xEoC9UMB38Yjq3swst9z4VLYPN3oUmcZnRK+n1Wd0el0N3BeMLEFSR?=
 =?us-ascii?Q?m9u1LOUt+dNG0lMljzc5fNitcYK/WBO56LbhjIeij3c00LYZb0UlqtQ4lAoP?=
 =?us-ascii?Q?CqfvBEYXRxZkDq2mVtvrhy/o6wne4xiPMIJhoZgR8Ym84sb81Awfor5+mhFo?=
 =?us-ascii?Q?aukD0o/TwvbEIgKBkkmkEgRdyO1WmEY4L3QMbd4pVceAwHDvTOLc368IAjRo?=
 =?us-ascii?Q?TxnwLXq2gTDNXLqrsEljGCImfx0r9NrSFZlxaFywdYrNx8oWYhJi4cHSSlPo?=
 =?us-ascii?Q?OKWtziyzXlVkqpcqwPJxcawlx6aczBRcFW1foc3QY9g+KeRdkCdU05WV8Hok?=
 =?us-ascii?Q?vOYmehcj6EVBYkXZMvrGRMwDb/lpVtqjlKg2rh1SSyvkq4gLzsMqhTMmxXfC?=
 =?us-ascii?Q?AdHxBJ1U7wVrlWGO2kpZVfNzLkBxyTpWT94u9bKuLeKBaF587vtJUx7NPLgs?=
 =?us-ascii?Q?Ziec4BRD+IOXheApEYPa4HxicsnlLQBWjUKsjiUatv6PyBkplJGJJjEGtFf7?=
 =?us-ascii?Q?vYrfdp3W16tbl+oKjesie14bmb77Ni7xWnpRM1d56SQoz0AooOGBV+ACD+hl?=
 =?us-ascii?Q?WbN1nwbJKuqLZ/BgKVNTevuwh01IN5fGCJocNw0m9Wta/rTpK3uiFPp6wBZ7?=
 =?us-ascii?Q?tKtAcHqU/NuWsw/+8jwYTg18uS+4NSD22DT+iQe/Py+W6VpLRQZFRtpUQRib?=
 =?us-ascii?Q?9ylcR3xA+Rwnfm29wX8s5XXzor3zD7OSM+2BlcbjiN8UNvLCm4T1gNpNr0I4?=
 =?us-ascii?Q?yG7YER/29jTcu/KfxLR5kxuUj8Eh7rjQyvOqsIiPfV65yuBNKpBRDs2jofGZ?=
 =?us-ascii?Q?LRgkCXvkSS8zvBLVdknbWW46wA23I+KEhlelEQ5UT2lt0iv8p/oBT/qqKdxH?=
 =?us-ascii?Q?LE1Su0ZmQZHW1NtFgjgEMqyGaTGv6AjgYBOYBjzylecfoXodRkoaJIgldpv5?=
 =?us-ascii?Q?QHIOSh9Sr37eXZ0OFiMVURksklupcJ48vxeYPHxArcX34IglOZVhJ+KMIB+U?=
 =?us-ascii?Q?VZfYQ1vAPpxlXdaxmpjGgRjj3ZhMDfnKjcXkELDYL3d+LrKqY58Ehk2Qrn9C?=
 =?us-ascii?Q?oU0zSFGbW/9+iDgkaY7NqZL9tPUtVlNXKAf69QrevgDee9oK6wKZEjtOvicX?=
 =?us-ascii?Q?0aQSbQ2ycBKdW3bX/X/ATRayKCCqr+5AyX0BDx+pfANbshUJ4ldXReVsq2D6?=
 =?us-ascii?Q?ed6MqwLuWIXOTo5CjnELNfsvD/+xoI6hWMjCIIUjsPn4ezl65EwF2SC/J+3J?=
 =?us-ascii?Q?sujs53tPowa6z41mwVKwtfkPbXG/rVXo+7b1fePeaa6UVAiVvPxlGBd274ao?=
 =?us-ascii?Q?1hMY0mHUfZ0NXo1z/0siop9kI3q7oJlzAE5FNXmHJwhdauHK6QBFc6Qre3vM?=
 =?us-ascii?Q?EA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b40dfe32-ccb8-4b33-a585-08dbf1bd8d05
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB5770.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 16:01:02.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6w32yHbcNZVgRVFfe30rptIrbDKIRC9DBOj1XcgUQVFA3TUJU3BAo6p/Ay5S/HXWgK/3ez5cZEn3//nt7DJnzXMEQS7vLgDuWQ65XnsPtY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO3P265MB2410
X-OriginatorOrg: imgtec.com
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-GUID: RyEW2BchtIfUQ9tgvQAXs0xA0F6iXxGZ
X-Proofpoint-ORIG-GUID: RyEW2BchtIfUQ9tgvQAXs0xA0F6iXxGZ
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
Cc: Arnd Bergmann <arnd@arndb.de>, mripard@kernel.org, matt.coster@imgtec.com,
 boris.brezillon@collabora.com, donald.robson@imgtec.com, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A missing header causes the compiler to warn that the function below is not
forward declared.

>> drivers/gpu/drm/imagination/pvr_fw_meta.c:33:1: warning: no previous prototype for function 'pvr_meta_cr_read32' [-Wmissing-prototypes]
      33 | pvr_meta_cr_read32(struct pvr_device *pvr_dev, u32 reg_addr, u32 *reg_value_out)
         | ^
   drivers/gpu/drm/imagination/pvr_fw_meta.c:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      32 | int
         | ^
         | static 
   1 warning generated.

Include the correct header.

Reported-by: Arnd Bergmann <arnd@arndb.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202311250226.Da2yiSKp-lkp@intel.com/
Fixes: bb52a8dc84f2 ("drm/imagination: Implement firmware infrastructure and META FW support")
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_fw_meta.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_fw_meta.c b/drivers/gpu/drm/imagination/pvr_fw_meta.c
index 119934c36184..c39beb70c317 100644
--- a/drivers/gpu/drm/imagination/pvr_fw_meta.c
+++ b/drivers/gpu/drm/imagination/pvr_fw_meta.c
@@ -4,6 +4,7 @@
 #include "pvr_device.h"
 #include "pvr_fw.h"
 #include "pvr_fw_info.h"
+#include "pvr_fw_meta.h"
 #include "pvr_gem.h"
 #include "pvr_rogue_cr_defs.h"
 #include "pvr_rogue_meta.h"
-- 
2.25.1

