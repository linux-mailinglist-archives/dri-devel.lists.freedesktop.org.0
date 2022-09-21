Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A37D85C0520
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 19:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08ABA10E21D;
	Wed, 21 Sep 2022 17:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01olkn2022.outbound.protection.outlook.com [40.92.98.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C91710E499
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 16:46:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmkvumER24sM3cEM323YYDWmvpig4FIpECJEthPqjlGsXl+RWfwCdYEbh/t0RAeo3OiAdTUubAhMrooRAS+t5hcDaXmqALjpJ6awsly2xDZCHDY52sQOW8w3w9R2QvPjzvFD5JHBsMIE+8iGWi6rsnof2vz2ydn8RjUa9jfhOT1au5vc7g5zV17ZbyCLmzxFVh0plpu6qhtE7j4fpgd28uFbIXXxAAa6fUYTFw/u/hd5BvbWkVDn1234PL9fz/jploNmTjjOmK9YC3KuPGSrMYqNJLu4ASm98UT8NkFl9rZP1FPx5JNfqhQPPsUgfgpU1n/qXRB293aqqhVIgOqAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VLv+ChILk/ZFvL4qMEyh8rYOwzv3JPGRcpKvLgSTmU=;
 b=eVo56Uu1C93rBVO+Q+gP+Azv8/AXOPTMm9C72yV9UdPfREWhgXyUvkSaCuo5GQZ9CC//POnbNVZ2FPPYRu/V/XqK+gZKfTKDI4oIyXuce58JR4fLdKMrwqH58zJf7JSF0M9+beWSrbZ6mT/R9vCMTrplq2mVpjuKti7czMAqHyT2zi71GtZ1yDP41bT3q/0SnCHdGvHT7U6xf4yyYelFE9iCkcI5oSuHdGucMcyaUu8Tge6ZRIR1BXAOpCUMqBmm+ntqHWmUV2pfIUvyhi349c9GxBr9shJnN/bBb7CSHExSBmEEyVLJM0MTuK0+bw6Qjsg3SAIMaqdx8c9i3fQ9ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VLv+ChILk/ZFvL4qMEyh8rYOwzv3JPGRcpKvLgSTmU=;
 b=sUH4Zj90dREsbjSHGz5d6Z2LDz+fmPXXSazRQUgzcwq7Ydz7rulbJcygZDk2bteZf0Gw/GIKF9ShE/fcFLoUwsc6MaBPxTMBRsJEzhRimcumny8cQb9yP/BLST9/GqCnWnfjecwWQ/UqfL6UHfvpcSJ4lcmKd2SHnZ6c40w20yYNNfzKuNR8oFvm7dZUlIZ9imauc9x+LWesPwbKpFQdl4vzVU/uAXOKVgTPOOcyhVFd/j4W5h/vOCstzm8sJM4wkUCGaxsW9oqhj0s2FR/r/zQex5cOL6Ork0eJGrrLQplDNqT6IMZsKgQGOBRd6kfUq0ne3QsQ3BMY5D3tnu/RDA==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYWP286MB2683.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:24e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Wed, 21 Sep
 2022 16:46:34 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f093:ab8c:7e3:f312]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f093:ab8c:7e3:f312%4]) with mapi id 15.20.5654.017; Wed, 21 Sep 2022
 16:46:34 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: zackr@vmware.com
Subject: [PATCH] drm/vmwgfx: Protect pin_user_pages with mmap_lock
Date: Thu, 22 Sep 2022 00:46:22 +0800
Message-ID: <TYCP286MB23235C9A9FCF85C045F95EA7CA4F9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [wB63a1nI2eSfo0bM3nJYgBeElOtFmbmbGX1jvoDwffg=]
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20220921164622.651969-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYWP286MB2683:EE_
X-MS-Office365-Filtering-Correlation-Id: 386957fb-cc0d-4fbc-e01c-08da9bf0d7b8
X-MS-Exchange-SLBlob-MailProps: rYPt1fhvLTX15y/mp8GCG83TOVSPOMmUkYtyR4RpB1LeBqupdwcKUbFq/FhHzT/qtGBKYwZqYkrrehka4NvXUn2U6jA/RAvHOU0WUTEvH624z1zxhCIR/BEFhqRTikGoSHLWvbCzEby4yjx3KDPHWeXjWAudXRtepXRC4tGTuy/uOEvLdxY8mgT0JRgduS571R7JPMPodCT3tQJFNTgwafX1KCiKCLnYp171ogYWptCTRPIsx/Rh4pc6EgWLmFxi+GdbzdWL6HsMjxCizN6k3OEFLlENBbA6cYTHxiMOnJDcCwQM0YwFAnaMG4nEp8EDqrx9YMXQ/BLsz9JQnw8G6QHwT7zkd0OoERzjh6kPl0pwC3OoGXKyyPMtIyxDD0eg5niTEMASu5BKrI6SixE2I1H9hWrpJuGaufkTTY8BJeWuRdosB61uOrCGxg7H+SdfqKxhrMsy9PQs2GpjhlqSmFZj3E1dV7ddZnAffwp7x9Glq1i34CzW5G/uC4MOa0EQKk3THxjS2lGqEzmzqtsjoYNPt4/8A02y4meFAEoIkFvPZcKdJ7M8Wu/c4BSzAyKGvaXhpe23pO3W3/VxQ9ePTsxCIpx36i0KwWAq6Rzx4qvyoDwjyjWRWOylGEzqYzsHvHwdG0dB+mQybSz/wzd2gukqki5lbO7ZgOh8Qm4g9R9USIigeeSFutGxSRgjIL+4jcHtQlU2tlXEdKY3hoghDA==
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SZa3/Scc8BtiK5YCCMgSDLnNysJq47CvK8iZs1HFngGcQH9vF33yvE3WrGhjkrvpgaFfysdIxeYf563CjOvLLEzd3Fyzj9gWVUm0859SGOph3pzwP0wdYrdGPyEmT8sId2NZaEkz7JoeKYM0JD8KUnXqEmjkKzktQLyZlxrcN8U0ZImjmiijeYwnnKZAIpUM+ECPG6Tv+iSOm8JtjMWDwPOVnu2u6wClGiBh64Bg5pflwNOBYvYd+b+U1ypJLzGig6YzKikPwa+AC/BibDIsa5+AQmw/qzlA6vyhS+6F2Q7ivnEs3MzUyhN1iT7VGHDd1EZAjZHgeDio/m0LQo69SlvS/L0cxy3o7dW3whgjw7Ywz6MDxnadvceDy4X7szKTm/QKazBA+HFqvL6zSU2TvBv2JEKVlvfy7qXNvLDjoXy0fU24SX36ML9d6Y67OL/VIHYLL+i7Q19sPKBaIHtEgjX7UKTBDuqFndOd1WSxMx3d4RwqDVDfQDRw+eNNU5U4x/LTy2DCWFIbLg/RJIN+x+C8wUo6DLZ0OxDj7rxm0cT3DSkzE5ZGGQ0vvt8XSsdxtS6vh79umCoWx1SuD39zG0v4taMn6+I1GqrDxYxP4BNK2GtNPlS/oGU2hAgPC+jSmS0h4+DbUA2Bxg3Mr75xuQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EZM3yqpMN46Zg63GR6CHlhkQPK23pB5Lzg+W6oO0BpcQ3y5W9uZXdm9coYzH?=
 =?us-ascii?Q?wysewvs/ifaJf6FV2XHgOlMSk4mAzhHleULdTmyZjX3ZbGY1bQwttO2aqnq8?=
 =?us-ascii?Q?z3SoUjeQmDUE/0sTRPHgw/2KhncIeK4Vjif60XvqKRA+E2UPqLGrBRcSM8ka?=
 =?us-ascii?Q?krJbE5jRDM4wuh1BRwuacL9Nlmu8MbXJXfE37LTzxac6qXasSbB3K9spoi8T?=
 =?us-ascii?Q?pPlvCA198/yCpAVj4tBPdUStvJgEapBbvl/Y/rc2Sr9CF6kbPgHRPISDviqT?=
 =?us-ascii?Q?Nk++mFX8X2k4Sr3WzwTvbO6YilU2RyCiUevahO6xqsXiNZ9hsT/AAn7WwFxe?=
 =?us-ascii?Q?bmOn/xwoGXYuQQj/574zXFZcu/c7j2+GVBP95uowA5+uG3iSr1Amgkw8g3ca?=
 =?us-ascii?Q?DQO3rAzbWObVqUPM4Gb+2sY3z74p2QBmmuikvTfVEaffLZCCw0GRoZfPvDI5?=
 =?us-ascii?Q?bQzYswDgy29Rb2Fov9lLXd5hXreV+qGPiqXwK89CQRmwQXkeage4rd6QLwN5?=
 =?us-ascii?Q?MAjPqLzd2jHuaTXavs8NepsGusBeWVXDv9+Fr4vWP580aSAPBQAvBjujkJyR?=
 =?us-ascii?Q?Y/+Gs1LLKNgCZI5eG3vhee+yxZoBs2TB4RKF829wO2uWWUQOJ34DSrnlB60l?=
 =?us-ascii?Q?CBTKLc5KJvfrzz2HvvYrPmvBv8+ANRJ9Ez7GJyCn7Q+d4dgZyhnTmXVZ8qhq?=
 =?us-ascii?Q?ykCCwfL9ailjgorw2SwtbuRzsyv+IRTbqvJIYIK3nWtcTNw9uF+6jOcerLK4?=
 =?us-ascii?Q?DyeT2D+Oz4jfiHv2Qm/EDez5h0mun6Jkn0bCPNXCZe4LakM7/R95A0s4pWWR?=
 =?us-ascii?Q?O+wZ/JjUmwE6eFiqeQCGPhV20fv7hPlQmlcT+u3ffvTkwfBMHGt/Z1UbX/b+?=
 =?us-ascii?Q?2uTlkAMmJ4hZzFVPNwubWABb/XHPppEFatnciJTDrckPPJKA/bGtvKs+qJU7?=
 =?us-ascii?Q?T38GVZzw6OacNucoqyred1qu7ll6kCKfjYSlBkxY7dr6tukvbPRtpzYCdpt1?=
 =?us-ascii?Q?wOD7ivNPxvBQnP8yKeRwgbHyY+7UXeDi2AW1klQUYFI7NSqYzfJJxboMudx7?=
 =?us-ascii?Q?c5SN5oS5G9uYqYj5vpmcS1rrT9S6KSyH5LZmlnWeQgCxkoodYhzci3eqCNxY?=
 =?us-ascii?Q?mF4EvnRif9SVRz7N3h2kXRcN/vJ1Knak3v4k8X3sg8J86wwtit9FMqT/qin3?=
 =?us-ascii?Q?1ZZERiXuyrnJd14j6gHV3PfBvn1SzUtfDkUl22yPcpnHhArmJAbVsqUA1wNB?=
 =?us-ascii?Q?mt+GbXi1YgdOMS53Qr8Q09egM+T69NIVIhozLx8WtA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386957fb-cc0d-4fbc-e01c-08da9bf0d7b8
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 16:46:34.2676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB2683
X-Mailman-Approved-At: Wed, 21 Sep 2022 17:10:29 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Dawei Li <set_pte_at@outlook.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch includes changes below:
1) pin_user_pages() is unsafe without protection of mmap_lock,
   fix it by calling mmap_read_lock() & mmap_read_unlock().
2) fix & refactor the incorrect exception handling procedure in
   vmw_mksstat_add_ioctl().

based-on branch: vmwgfx/drm-misc-fixes
based commit: d8a79c03054911c375a2252627a429c9bc4615b6

Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 2aceac7856e2..ec40a3364e0a 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1020,9 +1020,9 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	const size_t num_pages_info = PFN_UP(arg->info_len);
 	const size_t num_pages_strs = PFN_UP(arg->strs_len);
 	long desc_len;
-	long nr_pinned_stat;
-	long nr_pinned_info;
-	long nr_pinned_strs;
+	long nr_pinned_stat = 0;
+	long nr_pinned_info = 0;
+	long nr_pinned_strs = 0;
 	struct page *pages_stat[ARRAY_SIZE(pdesc->statPPNs)];
 	struct page *pages_info[ARRAY_SIZE(pdesc->infoPPNs)];
 	struct page *pages_strs[ARRAY_SIZE(pdesc->strsPPNs)];
@@ -1076,6 +1076,7 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	if (desc_len < 0) {
 		atomic_set(&dev_priv->mksstat_user_pids[slot], 0);
+		__free_page(page);
 		return -EFAULT;
 	}
 
@@ -1083,28 +1084,33 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 	reset_ppn_array(pdesc->infoPPNs, ARRAY_SIZE(pdesc->infoPPNs));
 	reset_ppn_array(pdesc->strsPPNs, ARRAY_SIZE(pdesc->strsPPNs));
 
+	/* pin_user_pages() needs protection of mmap_lock */
+	mmap_read_lock(current->mm);
+
 	/* Pin mksGuestStat user pages and store those in the instance descriptor */
 	nr_pinned_stat = pin_user_pages(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat, NULL);
 	if (num_pages_stat != nr_pinned_stat)
-		goto err_pin_stat;
+		goto __err_pin_pages;
 
 	for (i = 0; i < num_pages_stat; ++i)
 		pdesc->statPPNs[i] = page_to_pfn(pages_stat[i]);
 
 	nr_pinned_info = pin_user_pages(arg->info, num_pages_info, FOLL_LONGTERM, pages_info, NULL);
 	if (num_pages_info != nr_pinned_info)
-		goto err_pin_info;
+		goto __err_pin_pages;
 
 	for (i = 0; i < num_pages_info; ++i)
 		pdesc->infoPPNs[i] = page_to_pfn(pages_info[i]);
 
 	nr_pinned_strs = pin_user_pages(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs, NULL);
 	if (num_pages_strs != nr_pinned_strs)
-		goto err_pin_strs;
+		goto __err_pin_pages;
 
 	for (i = 0; i < num_pages_strs; ++i)
 		pdesc->strsPPNs[i] = page_to_pfn(pages_strs[i]);
 
+	mmap_read_unlock(current->mm);
+
 	/* Send the descriptor to the host via a hypervisor call. The mksGuestStat
 	   pages will remain in use until the user requests a matching remove stats
 	   or a stats reset occurs. */
@@ -1119,15 +1125,15 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	return 0;
 
-err_pin_strs:
+__err_pin_pages:
+	mmap_read_unlock(current->mm);
+
 	if (nr_pinned_strs > 0)
 		unpin_user_pages(pages_strs, nr_pinned_strs);
 
-err_pin_info:
 	if (nr_pinned_info > 0)
 		unpin_user_pages(pages_info, nr_pinned_info);
 
-err_pin_stat:
 	if (nr_pinned_stat > 0)
 		unpin_user_pages(pages_stat, nr_pinned_stat);
 
-- 
2.25.1

