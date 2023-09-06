Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207B7982DC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 08:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE7510E873;
	Fri,  8 Sep 2023 06:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03olkn2036.outbound.protection.outlook.com [40.92.59.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2331F10E699
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 22:44:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rh78n7VDNJTkOmmewtNne0U604NEKKiTJK4jI9ZZrF+SDhfOvnKfV38nirnKW/KgU7pkZCYGRQ2g1vnXBQbH06QcV5uYuxbyUcyMUlHEBmW/W92MUH/UrWCSrrW1RGh5NdyrmFn5q21r9JnIhNC/u2zZwPlkWFjvIzbgACUr06Suwhqy5v+liveksciAHfiIzMQVe7LPIAQzl9zVy4/BGtHWExl8wapHEfoTnr6ki/BaZRJ/tr2Su9HECo2SAkS16Vy06KT8eYyG2ysQzZcKjFVsA6dKG5xpqfVlypuhqrJFIbuoPoxkYF0vX43jLdsEqIaqe67HDC4dBb9q8MH5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7rl5G6j4nIMK+0duIsOTFBXzoYbShkjS4kkQr8iKdA=;
 b=D9SZy6yIjSFMAWYrTMBOa7C8ktdXg6kb+p0/i0Tk6oHYk3e1jbWPahe3m2hXnkdUGlJrsHnrGjum9BPw9nLFNwkG7QYsInlUtC90hvIYSDGEAi9wvk6R+LbfEQt7ITZ+BJB8Cgf2VSXzV+rZ/Sj/GsIjGUjR5kJjC3sS+GgqPe7hatsc9sDogAHXhNQxb/x2/RUi6GYVp9w0X3SbdtAgRwtrx4dxOI3R2A2rOZ8SHzN/YxjZ3fwoLkvb+x/puvbxUnjNYjEcTaDZ3vt3AwcWsH5iTcIRz1/PpldWLmnoKJOHzKJngYl6zIMuG+gCNxG/YWNcg3+wkUgaNgFGuiL51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7rl5G6j4nIMK+0duIsOTFBXzoYbShkjS4kkQr8iKdA=;
 b=Gt70S4ppX1sBFv9MSGExgGTwqwxPxf98/MAJCF9MRfRQJ1bQOGxPkRM7Gz+N0ekNF5BSi9xuaUcnCUuZCxv5fTBw7My3vOOG7Gw0v4ycMbIdZJE8M6IaMt2YDTs6tpSx+vlyHWpTsyCMdekc6WkswJ8hxURnpJTkVaKwNiUvdKLu6TGH7IRBpUJf+1Hns7DVrS42gKOeBX50P4wcEDTxJH9KqWJHPzbFVpkpLqQto/rLIgCBZvz6fxXapKpWHf9vFgXyVGGn6BSz2YlMBdsAIAvpaCZqnELAC6LAorNeS8yWhmlIkk7nU2d5pglMr1gbNnH/AU3B3F3tZs/Lzje3Sg==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by PAXP193MB2169.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:224::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 22:44:09 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 22:44:09 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
Date: Thu,  7 Sep 2023 06:42:56 +0800
Message-ID: <VI1P193MB07524221858B1A08B9FD7DB499EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [CoOalR+QW3sWvMPO2r5WW5lB15opxGAL]
X-ClientProxiedBy: AS4P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::14) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20230906224256.32612-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|PAXP193MB2169:EE_
X-MS-Office365-Filtering-Correlation-Id: 7af6f73a-849d-4bf9-db3d-08dbaf2ac881
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tfoCSY5PkFGClvgpmEJjSEz5YsP/TTcauHuUVg16OJL1qp2zIg773RZ1g5BwpW9d8MkW46MW1HFVXIZdgIPZ7ghrAtFTKjMNtmgm09vgwuWHWqa2aqALVHybcQP+RGQPhAvhqyDzH6U4Ua8gx5ookLkvjwKFTNdxlCfCq8Mv0Mz3b1KmDZaXUd9aRWGgUqlXMj2Ka2mN4uCjTu9WJkkv+OgZ7yrdKWJw6Fqj5cURAxhKWw12uXdzgTmU2CW1I8hJALevdVdKlbF9g78CS9krzUrTckIaX8/eumZh/60RC37ThmpM4podp+Yt5eGR++xpKdfpccLtU5E5j1gxZVvXE8Ctz/BJATHBLgkZrNpZ4RXLEiYCZAQkpBmCqa94sI0/0pCj5bVENzgbjMPiw/pkMT3pAxBNEBDSORxMMT3cZsJOAspLwUtBNCvPyY5eXI//geSb1raGRwWCkOemEuwp6uSAPoWdkpDNFJHcE6HnqKZ/rK0aydZR7lhGTreOE00ZanaRe1s+KAUW8RAqtkIF/6pwdDjuEYXau9dhFXYiGSDE1Ge5iDfHbfOmZul7AH+T
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bUK+757hs2FvpAKx/d8C38jmoiv2c4ZptgJ4/MNIfzUpbXs8AX6/gZVXULj9?=
 =?us-ascii?Q?W5aAjunT0PNMbmFSoHQISUsL1mzUE+XCxfc+a5N1Ny8qee+PHlcaRB/GCK1+?=
 =?us-ascii?Q?tW+nUNviOY6JB0VlUtUU5JzJC9p5isJDrIBCEFZmqziPDNfObl5VXUKGRMUL?=
 =?us-ascii?Q?3w32cUnmZQdm1M2BTuJozULiwWPplXcxe8bO5jfC/Te0vqgowf/K0vysp/tL?=
 =?us-ascii?Q?aZnMiC7ztkxTWELnF79yxIj4FFfcVbuTugcMbJ+xzt/jSPl+Y45DFQF/oI7c?=
 =?us-ascii?Q?6hpJtu+SsK5Uj5J9tZqgxEavAfIePha8c8O4UC1agW7yhzTPq/GT2TARazLJ?=
 =?us-ascii?Q?YHuFTjq2c5IVXMPdLiV8TDRIsSGxqL0xSQfCi2TXPB0hnUBc02MNOlbJn4EZ?=
 =?us-ascii?Q?vQNFBNZ//4qqe5ONcBDye9vJhCUYmwNEXfKAHQMIOh7QqOwbELTk7qs86hqt?=
 =?us-ascii?Q?thdSO+77dNdB51E9SPDP/5ZlmjfkIJmyUaIS2GA2joDwbDeewgnZMtzmBRdI?=
 =?us-ascii?Q?+1oJ3SDHCsA7gJTG/y++OMRmKaQtKftVFJv2dJktE/3B/4hDEqCcWslMS4TT?=
 =?us-ascii?Q?tMBzR3uQ6QRE45Rx3O9lBPU/6X2ydGnHoOAO2SyyHW7tlr96NLFa+bIhD2IA?=
 =?us-ascii?Q?dhfrcr9eiY1dQS2YMRwuhd1+boqar33cIKX7jAFUSkhhU2TDkan0c7AMPcmE?=
 =?us-ascii?Q?YNxMVc+lfM4oFF/ZifYH3DzntpLTdLzUCHOg60huTvWKzYn6RwTW4en2Dgij?=
 =?us-ascii?Q?xZLeDeO5FLm8B11D/djJQZMJay4j12e8N8NKE0t6XvFEdOyEXV9qIAxYiJ/c?=
 =?us-ascii?Q?iciZjd8bGGEcuDhrJxcI+v91Fxk6vT2GeW43XtVomchPURBf7e3kpAM8rsPI?=
 =?us-ascii?Q?5G9PpxeJ0r3xwyQrZ4jPGd4y2odz+J+rLa+mVowfHnW2ELy6nImFsjicIxS1?=
 =?us-ascii?Q?1bJzKDv4Q/chgRWqXw4V/8c3MhZ+bHLfZVY0vBN+nr9vHUL9SiHEBFOwDd6L?=
 =?us-ascii?Q?8Krg6qtMWmKujaha1CwyIBQ+LvZ5aC8Cm7+FRfSJUl0aDaYEvmSyhCsc7Zct?=
 =?us-ascii?Q?DxPusq3N5blE67VMQYxtotiEP5AMLjoB+EL6ZREXuoAzM8vmi1H4UzHoNEpt?=
 =?us-ascii?Q?Fbvdm3p3NX35Rpff2JGLd/J5cJf4TYQ9RbCIuQbcvRb+qtvpJksFx9+e5Oai?=
 =?us-ascii?Q?peSPm8I3s80a8md6HHNwyrWnF16PLpuCMOKjpl9X8tpQeqXao2Yva/DFfOc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af6f73a-849d-4bf9-db3d-08dbaf2ac881
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 22:44:09.3540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2169
X-Mailman-Approved-At: Fri, 08 Sep 2023 06:56:24 +0000
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
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are 'enum drm_ioctl_flags' and 'bool drm_ioctl_flags(...)' with the
same name, which is not a problem in C, but it can lead to
'WARNING: Duplicate C declaration' when generating documentation.

According to the purpose of the function, rename 'drm_ioctl_flags(...)' to
'drm_ioctl_flags_check(...)' to eliminate the warning.

Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 drivers/gpu/drm/drm_ioctl.c         | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 include/drm/drm_ioctl.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f03ffbacfe9b..feaa58ca36f7 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -911,7 +911,7 @@ long drm_ioctl(struct file *filp,
 EXPORT_SYMBOL(drm_ioctl);
 
 /**
- * drm_ioctl_flags - Check for core ioctl and return ioctl permission flags
+ * drm_ioctl_flags_check - Check for core ioctl and return ioctl permission flags
  * @nr: ioctl number
  * @flags: where to return the ioctl permission flags
  *
@@ -922,7 +922,7 @@ EXPORT_SYMBOL(drm_ioctl);
  * Returns:
  * True if the @nr corresponds to a DRM core ioctl number, false otherwise.
  */
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
+bool drm_ioctl_flags_check(unsigned int nr, unsigned int *flags)
 {
 	if (nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END)
 		return false;
@@ -934,4 +934,4 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
 	*flags = drm_ioctls[nr].flags;
 	return true;
 }
-EXPORT_SYMBOL(drm_ioctl_flags);
+EXPORT_SYMBOL(drm_ioctl_flags_check);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8b24ecf60e3e..2aafc7a62bee 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1287,7 +1287,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 			goto out_io_encoding;
 
 		flags = ioctl->flags;
-	} else if (!drm_ioctl_flags(nr, &flags))
+	} else if (!drm_ioctl_flags_check(nr, &flags))
 		return -EINVAL;
 
 	return ioctl_func(filp, cmd, arg);
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 6ed61c371f6c..465c5de2d5cd 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -175,7 +175,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 /* Let drm_compat_ioctl be assigned to .compat_ioctl unconditionally */
 #define drm_compat_ioctl NULL
 #endif
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags);
+bool drm_ioctl_flags_check(unsigned int nr, unsigned int *flags);
 
 int drm_noop(struct drm_device *dev, void *data,
 	     struct drm_file *file_priv);
-- 
2.39.2

