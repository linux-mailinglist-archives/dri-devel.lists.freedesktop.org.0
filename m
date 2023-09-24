Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D17AD1F8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:43:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320A810E1E5;
	Mon, 25 Sep 2023 07:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2063.outbound.protection.outlook.com [40.92.90.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFA210E1A9
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 17:44:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jb8xw/XiKco/1sAQvp0hyRcJwrbKHZwZgvUVXjw7fejT0L2hLS3FboKt+sDXl1bo9SLexcWP5PiTS8JP/wZ5uV6X4u037TO+64e7u9bMoFbjf+F3EacVFh42niy0Tfq8FUtpdVFSt7pcnrqXoxix89QgGAT/NYqtaRKsoGdFNtOi2jaUClatucsGuloUDwl353BKy9mfAgW63VEQOA8uJx308s/iZcc9VkbxDbYcK2H2lfU0KZk/cC+FclS8foJunweiuSwNpaSzCuT3x2cYEFZSc0KjlxDSFBrTQmOfUoLzfbz3dZAcb1ZTO1MdbYvn6yzUixoimPTOnHGtaBIoNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7rl5G6j4nIMK+0duIsOTFBXzoYbShkjS4kkQr8iKdA=;
 b=ew8WJ+eg/lHE55Wxtf74LGvjZruH7tPbZYEKlI6xucFnggb2n00FlMajI8QyiHgXF2ekwltUhPBS0NyOp0l/S26wCUFlVtPx4HWjh/FkKBXHnBor7+dyjdLQPTAp5nH+CGpv7VxmvoFFdYTYpnY/KHstGD7qukalubUMMrdyvEzsv6C7iLRdgNfUoDLuC7pVbNMSLoBARsLHaTtn38XKxoqg0OE7JOAgJqiwIAd/AGSl0GCXXwM6ZunzhakY9ToxjL5xiR9K9HtL2lIPMc6uFdQ3PpUm0SeaOftgXBQj5nPc1qrghE6TLsHgkAuCkBoxr9N8vUxBqwaGYqvFQBWs2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7rl5G6j4nIMK+0duIsOTFBXzoYbShkjS4kkQr8iKdA=;
 b=hnBeDH2A+ZsL9DrI8eEY/1xdLRS50AD/Dc9unuAGoVl5Cih3Ns32Gvhug64mEkGL0QB+Lv5O9U3Dpk38inQvMh1FJz4qzfRhjh3PmiEi3CvVpGhcQA6WNyCFllOeLn2BqEaNRkNeFn7QFLCwBOjM2wyVVYI7x6qTfco4diZPZNovGLBFbHzUbCFVMq4YbV27q12ibsAhepJxlgWHPWqWrOz+cW6tn0nXy1CCW85ZGJdGapNr2ya+Z5UJ1yUNH90IdNAAyAymdeGnkqE9seNuNRpc/dn18QF/4Qn3OV01UZ0HhxlwAzB1HseUSG2rst7i1zNC98xrWweUP/7YxcoJyA==
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:32::19)
 by AS8P193MB1461.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:39d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Sun, 24 Sep
 2023 17:44:38 +0000
Received: from VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad]) by VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 ([fe80::3164:ae5c:78f7:23ad%4]) with mapi id 15.20.6813.024; Sun, 24 Sep 2023
 17:44:38 +0000
From: Juntong Deng <juntong.deng@outlook.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com
Subject: [PATCH v2] drm: Rename drm_ioctl_flags() to eliminate duplicate
 declaration warning
Date: Sun, 24 Sep 2023 18:43:33 +0100
Message-ID: <VI1P193MB0752F71CC14FFC9B9A22A6E399FDA@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [16lAXriSjIZ8v8Ytaj1rcYP7dsqMj6Pi]
X-ClientProxiedBy: AS4P190CA0012.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::12) To VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:32::19)
X-Microsoft-Original-Message-ID: <20230924174333.13398-1-juntong.deng@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0752:EE_|AS8P193MB1461:EE_
X-MS-Office365-Filtering-Correlation-Id: 751dcb95-816a-474d-2899-08dbbd25ecb2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEQJyv20eyffHYL3nX03wUH6gyRsPTy+Y6D3incACYWAlaPDUNCOFlQw9T4cHUMvGCJHwqZTQJBfJ+S3H3LUSrbrf31zT/1xtHCf8dRCsm/PxAsrk9iigSEjOx/oHkkYB9np/bIqjLkiv5nxBthmushaN81R/r5M+4c+Avt5vaErCCDZ3971U24hIAtNN91IRZwlroQDA2CEuKwHTDIcIjUrg82d4GV6PoUPo923zS30EFI3N5D5N/5Q7AiDVLZKG25BKU3tyZzpI8J2/3u9szDg972wiJGBO9f/lSFaR3IcZacNRUJwApP5xe6JvXtToAFTDxlG08+qwYyspAnGXz1zV+fGVcmrgsWq63XgujH+pSieqvuTiXaDegTsGyoacfUlH31AxOnJtt7Gy2iG5yJTBaf9bZv6ELPIfq9CqZ+JEXVecYclKnM7ycVR+GoU4BERKZTH7zHQhfnhK5gJsM3DBut6lwF/hyCe8/sIzCzUN7s0ZgKuE/8qCiKDQ7wCUJwu3qTl5ZJoRBSxJcsKYdf6A3ImHA+ScInnKYekXw51Hffup11eEnf1RQcXPND+
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?phqQHd1bvsKKgs7/5mAR1Mp5KAoY5L9z/IMQhxJC2FF5ru0GUlwgIcxKf/3n?=
 =?us-ascii?Q?Z0T5wTH9Y9ba1TsCJPM+5QzlCO3rzAv4tF97CjySsczWbu0HoW3cuPek97+W?=
 =?us-ascii?Q?x73FPLcPXaZoFmoDP2hsFUOXEE6/EmYDzExBC91B1nh16kxnpJXyS550tYTd?=
 =?us-ascii?Q?OshXPW2o+hqOVN89chmqt0TasDK0qw5PhSucNVxXMT3aJ3M3N/hxyAJ5MfHB?=
 =?us-ascii?Q?uZNiBo11W5uxyT/hmi7dQZ7sAg7VPfS3r3VpLtl701oEW2nYnHWvWqK8cLZa?=
 =?us-ascii?Q?iWbpiUZUw3Iw25i1vFdfFxZ+8F5dKlismajeDjjR67zeomjjZWcZxukyONSK?=
 =?us-ascii?Q?bbupGckx0jQCGhjs8UrRDyrl3YQmdRI4P+6pV0hZFnaEZ5Y2WUENNe8+coUY?=
 =?us-ascii?Q?K3k/S1nlvlh3hG01I781CHiDC6uGO58tHf6+2SoQQ+B7uqkI3EdrG5B3LyLY?=
 =?us-ascii?Q?ZOmBSsawxp58FIPSJ3OW4QPp5OR5T2Fx5MhpXj6AeB8irZsF8WWFQ39f51mi?=
 =?us-ascii?Q?iEHO6qpujxAnOXMUS1FMK59O9hsNd2nUkMMWM+P7NynPugX+3e3Zom2fyKUA?=
 =?us-ascii?Q?4OZqqIuiebP2GRtJamsLfoBXW2Jt8qUNjFxhAaXrObTNUfidz2Yn1HCY3JQs?=
 =?us-ascii?Q?GrGSOLtbmRVg032rCmNH1eU+mqsSsapYyOeHcgt69S6NMsySOqQPbftn+tDY?=
 =?us-ascii?Q?0WzTwnixIftdbXcfubtPIka+jAp+CvCQjxK9dTf4rYD7t0zwCeG3iTQuCutO?=
 =?us-ascii?Q?84QQzn0LUIgqLkqwq8ui1rfdcHpOK3sBq/QL0Cllabk0TYk0XmThHXx4TLLc?=
 =?us-ascii?Q?udXN/6yCukl8+Uc9z1TXykYijWmFdQCeZeSDipUbVC8x1Adp2e0iniI2LirI?=
 =?us-ascii?Q?xCfdl9wuYonX5Fs0AFws2mzjLX0A9PJX0aBEDtdaoehASwWV4m3KyXwzdbSL?=
 =?us-ascii?Q?xKos+oavQFBxj1MMJ4cTopevC/0w2o8ftRJ/JsRpSSMJVNtnceJFp5rkhOEh?=
 =?us-ascii?Q?rpoa2l9B9hSKWBau0F0K2C3BQ2VSjmzu60PeoPG4lRKNRUnVeakR3eUI0CBz?=
 =?us-ascii?Q?aPF2x1AcHDCFe15SLG7rk0l5RHxRZTfJ5aUVOga12Ne45IgarcS/jC1DwsBZ?=
 =?us-ascii?Q?fO+mxR8JiRmrJrFDV9kJlLeTSa84Ou66BYZKPOMbIsGwaXdL1ChdvHdaG/98?=
 =?us-ascii?Q?MqPsw1K3dP6AkrFK76d6qSOMqRTE7s+9TgwHSsuaRGWj11hPK7bdvC7hKko?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 751dcb95-816a-474d-2899-08dbbd25ecb2
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0752.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2023 17:44:38.8241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB1461
X-Mailman-Approved-At: Mon, 25 Sep 2023 07:43:28 +0000
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

