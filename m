Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3047942E7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC79710E058;
	Wed,  6 Sep 2023 18:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01olkn2034.outbound.protection.outlook.com [40.92.65.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249110E1B6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 16:46:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzANdwbPKRSBfYL+hG/DM8kXvSwm0PttYIQI3rkbNz3KSyPRpR3bjzPV2w2ywTqWKpVJRpUg6Ruu+X3LZhY+syNGuBXhBM1/JDYC2wUY4SMfpl8rWKGfHNeFqTEhtkQLpWnzd624sYUlrQmGEPZ1MXW8Ow189inx97ZWmlIEgK10W4EhomSyILQhS44nmN3xW100xw25IP4Fr+sr3w0kHsje2gtxDj6Oz7NELHIUrL/v+nlDlTyhubmaMCoAFajIItr9EZB7GGJclkni7+XX+hUbzS5YX7Pbq3cC3pFDa9Nx1zjh6LVCuCUxPx/WBJdcn2Z8EufbWLN+Ql4pcamxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R21wmXrAFmFt8rpghQT+7WZnFnA7+/WDKyI2f2deSN8=;
 b=Sg6tnVHECtB2NwGX9JepRobcxufJX6OiZVBib3XZlgB4e6vo1iB0hRmT+7TN81w4ZYjwXE0gjDVBTyjazIsfR39SeU3WqX+P0IPF+jAHDIdwiij/9fzANYgbGcnxX3/WnvSPt4w5u3BjmnuviMklQk+WaBt5oyI5zNPSYsSRxqg1XPkl7ZGT4aOMNxIvRNGX5O0Ab9jDNwRXp8YQwLaC00x9v7Gx7UyHcioNe64GnlnLCD9sVFITHdXh7T0P7LXWzlWzyFz4R9yqCrgNDoD0zteQ6J4J2AaH7gnf8fqv7z6Um0nW4gVF9zXhJNapY+kCbB6eUdJ/O3hwkh+x+bmDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R21wmXrAFmFt8rpghQT+7WZnFnA7+/WDKyI2f2deSN8=;
 b=QkFNIdlCMy06QLAqKG0Be8Eo3DdZVGFeHFJzU7FWG+BGo4NKP3b1nrFSjwuwi0nmyP1LRzx1J2Qox//B7IQiUucXPr8FHJm/MX3RcTM6LZ1udtu3QlnShxxongx6EH6qYeLAi5KmdGdrw48amKRVu0PtF1gx3AK3DGar7FHz5ZPtP0nRhdUiHPrv5l1lAhEbM4yVhoMEOBEmfFPBIVOqGBaIS1XF9Z2FDCeuf8bhgmeJ+iENUk84JB16a9CV0e9Iwo0W3VE11h5BwYRtRXe8qO9aZ999WWrTIEe8b9BybjsfAkJnbJi8rKCxhFGaYmzsBecLcalhfQwzlcdkNrfUiw==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by DB9P193MB1900.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:24a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 16:46:13 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3d3c:61f2:146f:b3b4%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 16:46:13 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
Date: Thu,  7 Sep 2023 00:45:47 +0800
Message-ID: <VI1P193MB0752635EE197F2BB14A2D87499EFA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [JT1n74E14+jD+T8Xjlx0+O2voZOfgrR3]
X-ClientProxiedBy: AM8P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::11) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20230906164547.13873-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|DB9P193MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: 281b9519-29aa-4509-0c8d-08dbaef8c7b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiq1gzUhQ7999Bffa8+BerDIG7iSgK5t8g0tfgjXQwPz5vysVZYB1GMx6uL1FtwyA/R2rTDaRoqIqbm29eDCMVvWNHco0QRWEIaY7zVRmxQ+K0n3NBZU/idXhmacIwCQCmq3pZn5amsM5P0z5S6UWsgvlUvxM8YMvNZDxC3p9t5T4aIUjtb1OrjkHTKHHR30uqNtoCOYgBWu1Jg27cWx8bc59dEjz8F5LCqOcaxCkdT9GsJt2WWufxMKinjveIumF7mD3tVUmEc4iKGuXrgFcgnXQwDrbTU0yjT/dHsQHg2xvYWcW3F6lRWkCn/TjBeFDRSB7UJD+OrlXNV5N/UJtAb9+LP4HBbXCVSGX4K6JXkGJ84udUND+G+TTwb1dXRas1JowmELB44unwvs0cx2wlyXFgygMIWGAMWuzj9+mO1cyIWA4/UFW56kOJc50EIp7yqQU1uJxDc/RwePhwC+YO7S9NhXBf5ZBZhzARTadyRo4vu8PiienpIC2ZxiNjvQ/ZXyyJ0rz+Ngbl2G9uDXwHJClcqqWZcQYi63UKE0zizDTSyYxt8LNUYY8RBpvIfe
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KPgo6GiFPm+QoTKVrz6PD+l56CBMKaIBh9t2mykCHA8tzZzYD/m4UJPCGAE9?=
 =?us-ascii?Q?304jX62S1jxjLb7kYym2YWNr7tLpcEIo4yEatXfX+fS+V/Cz+V6LjQjnzabx?=
 =?us-ascii?Q?V38HGO483XgUWBpnIiokQeoXLLPv4jeDd34nmpT4MEKoWtuGyJFLMEFXv8iv?=
 =?us-ascii?Q?7+GHTvRk8PbvC7yuqaPjnine+TsmVw3VGDKtkUJZ74ejIbSlNlgDPiSbCOSy?=
 =?us-ascii?Q?pB5nafZc9MnzscRFhTV5Bu7feNAvXCSLZl2v0NnnbM0QqJwJ93p0IAA0+wKX?=
 =?us-ascii?Q?sQol+qVWpXl4PgmtiZHhafo9RwTEwcPmH6exqaqneUpmBw1yYH5N/DPBqrAp?=
 =?us-ascii?Q?dYPbnIEnjZc+KH1I0OEgJlAv5V2ONhoP71MmC80TcP4EltsiCNSZi1x9nX7f?=
 =?us-ascii?Q?Pv8OxCieUV2cdJYpts/DxmHLgGuL5tuXdppoH8y2GnBO29TIt/xxYXB4L06D?=
 =?us-ascii?Q?TKT+4sdITbGpGf8/a2X4QVHOuxvGEvl+vss/bnu0B2IESnVYuGFYrXRQLlBp?=
 =?us-ascii?Q?+25Ez0Neoq2bPfzMdbpsNGYFHM3SjVDvZ/KwYQTF1Wxj1PljAzbTxVRDTemX?=
 =?us-ascii?Q?y3ZQ8unN4yuypbNqb1C9HWOrK9bGE4HE3qbb6p1eTmL7f1SFsiYjpaF9eD63?=
 =?us-ascii?Q?V/8lV0mcyA+XFxgBTJG3EaAKR+JfpnOa09Gm2rpOixakaqO4xK9iSvVEQ7e9?=
 =?us-ascii?Q?jUIRgJjuMrIAHdkxBdVeAGVCVGYRfas5MabCUV58rWjhG+8n1goavxJzqQoo?=
 =?us-ascii?Q?L+0UKefRNvosyJ7U5DCFZZnUdTWU9aGE6ZQLocu0X66DZ/iLeamSIOMwJ4Vs?=
 =?us-ascii?Q?YM4uL1GaSs8ef+COoilsfQPRr9LpZqioJCkx/HAk52FdR9j1BsvudBQLRPmZ?=
 =?us-ascii?Q?hR33oa/+hegKTGGAh+bu9MS7DBljaL7kbKBp4uZrJfmayhhVzJ4Rg4drUCBo?=
 =?us-ascii?Q?fZKOD3UEcWSKOAJarL0pTvLDPCCj6m0wCvkOuZgkSUQNuYNQfH5B9CUKAlq9?=
 =?us-ascii?Q?erPz69kNInNrpT3BqF16b3wM2YN+e3RHMVbhvJq1wgiGhDEQ7JZMehgmNB6C?=
 =?us-ascii?Q?5U/2JPmEWxrdK0XR6RhJGNjqMp3S2NY5Ghuo7C6Z1Bl7eOitkvVwoEDUxvd6?=
 =?us-ascii?Q?/EZLlT5QyuiboVjvWgqS9lS6RcbzsRNQ1XVYi2bZDV26G2PQ8iamvZVYW6Wl?=
 =?us-ascii?Q?yE+7yGH+OI5MVJfehctZp3qGfKvNM1X9Yab83laK/P34RIOhozFNgV8UrQI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281b9519-29aa-4509-0c8d-08dbaef8c7b4
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 16:46:13.0340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P193MB1900
X-Mailman-Approved-At: Wed, 06 Sep 2023 18:15:36 +0000
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
'drm_check_ioctl_flags(...)' to eliminate the warning.

Signed-off-by: Juntong Deng <juntong.deng@outlook.com>
---
 drivers/gpu/drm/drm_ioctl.c         | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 include/drm/drm_ioctl.h             | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index f03ffbacfe9b..30699a0a10bc 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -911,7 +911,7 @@ long drm_ioctl(struct file *filp,
 EXPORT_SYMBOL(drm_ioctl);
 
 /**
- * drm_ioctl_flags - Check for core ioctl and return ioctl permission flags
+ * drm_check_ioctl_flags - Check for core ioctl and return ioctl permission flags
  * @nr: ioctl number
  * @flags: where to return the ioctl permission flags
  *
@@ -922,7 +922,7 @@ EXPORT_SYMBOL(drm_ioctl);
  * Returns:
  * True if the @nr corresponds to a DRM core ioctl number, false otherwise.
  */
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
+bool drm_check_ioctl_flags(unsigned int nr, unsigned int *flags)
 {
 	if (nr >= DRM_COMMAND_BASE && nr < DRM_COMMAND_END)
 		return false;
@@ -934,4 +934,4 @@ bool drm_ioctl_flags(unsigned int nr, unsigned int *flags)
 	*flags = drm_ioctls[nr].flags;
 	return true;
 }
-EXPORT_SYMBOL(drm_ioctl_flags);
+EXPORT_SYMBOL(drm_check_ioctl_flags);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 8b24ecf60e3e..9615104451b3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -1287,7 +1287,7 @@ static long vmw_generic_ioctl(struct file *filp, unsigned int cmd,
 			goto out_io_encoding;
 
 		flags = ioctl->flags;
-	} else if (!drm_ioctl_flags(nr, &flags))
+	} else if (!drm_check_ioctl_flags(nr, &flags))
 		return -EINVAL;
 
 	return ioctl_func(filp, cmd, arg);
diff --git a/include/drm/drm_ioctl.h b/include/drm/drm_ioctl.h
index 6ed61c371f6c..2fc5fc86f711 100644
--- a/include/drm/drm_ioctl.h
+++ b/include/drm/drm_ioctl.h
@@ -175,7 +175,7 @@ long drm_compat_ioctl(struct file *filp, unsigned int cmd, unsigned long arg);
 /* Let drm_compat_ioctl be assigned to .compat_ioctl unconditionally */
 #define drm_compat_ioctl NULL
 #endif
-bool drm_ioctl_flags(unsigned int nr, unsigned int *flags);
+bool drm_check_ioctl_flags(unsigned int nr, unsigned int *flags);
 
 int drm_noop(struct drm_device *dev, void *data,
 	     struct drm_file *file_priv);
-- 
2.39.2

