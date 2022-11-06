Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3853261E31E
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 16:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92FF10E00F;
	Sun,  6 Nov 2022 15:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01olkn2099.outbound.protection.outlook.com [40.92.99.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB8510E00F
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 15:48:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+MnsyrCAcDdgWwBWDnlSIKtN8N4nh6TQLSjfAlNv5+4mFXEZHqufN9KxesZgTz7UpPiSoR/w8FmDVSSUlVf5UnGVhSFRqfKZ/30PI8d5ZY3rmJd083y6rD3iPyhg+YFrqvDIbXryBnXra5dkcgClofK/Bo6j2c31UWDhmkmjnt7fV5VM5gm9zLeM9/HKYiSuiEpf/BC5VqFw8+g+1o95WgbfX6yFLovGUtaa+8e2LNr/wZgJHAGQSWeoe7CWWEpJOCddSlA3GrStGvSAn5FEj9pg7qOrKpq1uTwBiDGvqLdH41vIU2E2G4pDyJ1TaljuHlsUKRIUg+1qEMIYQPIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRTDjs2u8sLTTR48R70oqietJp96ueeU5YjoPlA97Hk=;
 b=DAe5hgiil74FgzNQVlYx32BGy9xoNKoYqVgJsyDxANGVIlfYDNpLwg35o+NgrZEzRo4LoyFvlkxtnerMxGvf+pBMslabWuJch+ei6HddxrfR8PxBnlUy/qvuzHMf03Yh0ghD0DIjKN7jF8PzVWGKI5uexILdSj409aPS4Z5ypT5EjEey2J/7zzWGRCkGoCWxp5wEfn6z/67xBRBlkGAuZs+M2wbFuh6XGRq0WcxXj4Ydi5HUUkw0y3S02TbG/Q8OLxEHTVNm9VJT6kcNGW4Z7brxOPx0ABuG7KDxOx7pE3tzmDUtwimu3J+Xgf5usuL20mIKkbjN5hlo8xq9xGBtCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRTDjs2u8sLTTR48R70oqietJp96ueeU5YjoPlA97Hk=;
 b=WE6UbkJ6PSVEtTIuMV1JPV7O2uyEvw9EiIIEo6iuzKMP2PfcACsAGDWNhgkl67th9pZkpq7hzlEe3pgZuRi/kQ9DTyJktvrtmSVKpa3GbJnPNKze8s5v5G7c2J0lgFEiiQK0DNEMYD3uwfYa+jozfAgyWg+6fZDFA1iZeKKsqI2PIsRJ394jcKyrfKxmwztcctJL6MEbeFhmv899fD9GVArG6H5h6dXsrF5YY8LzZJQ1zFaVle6MMPm9T6Wpcv9o5T91AiNVCCKdInqjBgud8LVzhCkYYsklQ6hJigoxyMiT49y1At0ZqS9HLzunu9v88t1A/L1O+3csfK2sLyLspg==
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:152::9)
 by TYCP286MB2416.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:17d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Sun, 6 Nov
 2022 15:47:58 +0000
Received: from TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5]) by TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c90e:cbf3:c23d:43a5%9]) with mapi id 15.20.5791.025; Sun, 6 Nov 2022
 15:47:58 +0000
From: Dawei Li <set_pte_at@outlook.com>
To: zackr@vmware.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Subject: [PATCH v2] drm/vmwgfx: Protect pin_user_pages with mmap_lock
Date: Sun,  6 Nov 2022 23:47:36 +0800
Message-ID: <TYCP286MB23235B138D18ECA0797A6D0FCA3D9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [VGGibGjGkpg7UT7/c+36S57z9jitl/mJ]
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:152::9)
X-Microsoft-Original-Message-ID: <20221106154736.2531922-1-set_pte_at@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCP286MB2323:EE_|TYCP286MB2416:EE_
X-MS-Office365-Filtering-Correlation-Id: b0807d59-c6f6-4d80-ccec-08dac00e473a
X-MS-Exchange-SLBlob-MailProps: ymJijV9pwJmAfsszP5iRwe6T3KVknaQSMQ/5HCy0tWeLtYQ/FAV0bsqm26PUCGTrg5MaePZEvxSJygGKnizJDAxR07jfRaomqefxxic1QTwDrxvyIjAVTC9jYglpaCpi8G+5EPc3Ehzc4RbLbCEMA27EAQmJYH1XTS9061tF5rLMzucsw3huK/auQ6h44BgG8EXteJkildAMJPJAonzxHBgABaE/rGGd66xREj6UQMc8+bVrEUYnKpfKnRHihGJ7migZ0sHyy6ha9qYXCkQvudHDnEPP0UXalZJE7Fr9Z+9HCSc6XlyHIvGEIWb5ZYktp3TdkxDKrVGCaTZtjfaTBvStBU2K7RMHdaZFO1mugg4vTX2ExU73ZoLgMWA+5T3esoq1wBrHuQ+QxKgi1Talaj76XtROdP9PyCLaREX8aHVZM72Arp9+CH40P2rTfRJKxR6TM/Ilww2E9RfyRUx+twPPeX2cZ0UtmJUgm6oun0/kuGCEp2xiD986KwJo0PO7nhrroF4q4uVJrMGggImc0WPdLMse53b0y1fdvWAAF+ux8m8m+vFaxFF7SFqhwDLaircCQhdZEqa+me/YJuZh2e14uQR0VMSz3pe//+eah4vSdK+/x6eNoCQ7bItUePu1d486cadLCCPYGQ1rbQjep21qPxUkarlz/DL71vmOjb7yZtc0z+5s31HcnFEsEhJmC1Lm9YL2TUCPrmfzQ30XP4ytdiBYnGYgS8fKJ5sVgkAdR4vP7UBGSm5JA3HXVz+rF26p8ahTWjCxXjDQuikbtIdzX0uAb5rzNWzw/Dnti1Ga9u8eh5hgL6puJVPxuCPO
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vXUuBCXeBxWJoG2+UVXqst7OkfW7nYq3/NDYWdRK7T1RPPmfCvnyI5yx/FBs1CsXdpG8FK0D8rVB1cf2JfTjPH1adt7wOdY5oi+01M80xs37TqHKeYzaGAY9tObn36cn5Sfuqxq5h/cb297TZW82O6Bc0CrFzafsuHgGPm4VjV4a4amnFl98vpV1WFyL58CFSmnKSMRMhFy0476iM8DxzWNZQP0jy8vw4gqWqsnzB+DU0T3w9DhVrtgyfQ+RrJPGf3s6bDTXkl/eq/7yfnjkZPqBjPI+z4ZxwduLAIRR5UQH0IFKa2GIlZD/M+qaJXFxz8KvVbtoTelpZQmUOwDgtuycaLWBAQW0ntDTCu5Augbompau+CTUCwxzZEBp+ArWD0iasYv7rHKTDl/2f7C3iJQoTE89ZuIkUbN+z71ZZ9y1sFgYBuhqrmpkezN08rWYdaf6ExsV7bmFf/jCkoPe7aeBjNCeR93XqfAtJMdpVsI5AAgkF5C9laAlsOlHOiA02hO2LbiSbvQjPmjY/ytA0mkv/CjD+ThZ4AtlAtN6tj947B0TLhmas+6kHMObif1BEAUM4pkSWYSprAKraRnwLWDTgbBDRnCkUxMxbol0g1RV7LXi/ZR+0vcs80H86zcgzDRnD6tL3SrBBAf/s2Aq+LAs/f8RhcRjss1xuRVnTm42govBry55EZDszfgJXdRb
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RiJ1uBxVxUOIk105UrdW4t/k/P7yCo0dz5o4OzI6uyx+R7s0/7oecaPqMDjW?=
 =?us-ascii?Q?xVbmaNH6D1ShshW/nXNQfz3K2jpk21hD/QNKzIKF8oH4X/p8DJdQ0YOQ0spK?=
 =?us-ascii?Q?sosOcUbcBohvTf6lwMpjULM6irn0WI9TC6u94ESyYuf8PZ/2h5wJQdoaFDSm?=
 =?us-ascii?Q?BmS1/Pa477ejNPLHkya76u+qR8uAbBAUZzxawAXF1LmbS60RPFfxORtOu/oA?=
 =?us-ascii?Q?Pe9elNeeldoUaUzxpwoY5tcDY+nX6ORc3y6qx5nmQtV4xCKOwJYzrkjjznuo?=
 =?us-ascii?Q?kgNz4Id/U+o3IlbM75KhMOO1j9QUG2mzNs4HyU43AjnZNSDV/J/rWTyHDKVq?=
 =?us-ascii?Q?zRyMs93fT2kFlvfb+GUrkByZos8gWVk1ch6xEPDy2pMNsmOI4DgD3YstlOtY?=
 =?us-ascii?Q?RlHMlGXHY8iK197IrWNFJRb8IYYKeIw+H8UV+UhBqJDKrdvO4JN9RviXa1X8?=
 =?us-ascii?Q?wtF2at9VKnOWGRASi3FKxCRL20ArGFiTXG1soNfXf2/pnlj6ROQUdVimeHFd?=
 =?us-ascii?Q?NU1StpnFms91j/7om8PtScUsh28Rcaep7RXbLO2LIuInAYQZ1b92BOPmUmA5?=
 =?us-ascii?Q?2XEM1Ua++bdU5Agh3U0yGZnd/UVyZ05hLJeMboestvGEOEH6RVDhaOI7obKb?=
 =?us-ascii?Q?kg2z+0OL5qL+gThryaIx0nLRisaeBdzGGZyP6z0wAGL5tbCAf9TMBZDEQx7u?=
 =?us-ascii?Q?URVsZ6hJYHFM9oRNHexXczTAhuA4n9dzOfaFKrUqNiOoQ2VTgjEDv/FPBtCC?=
 =?us-ascii?Q?mbuFtimSKHFEvivTgcG5RJJPnxBrqvCmLQKNwsR0ncPhu+hp+HfCz/wD/4Pk?=
 =?us-ascii?Q?4ohYO882UU9MjVSp6KB1Dks3/9vOe2xiBT23piq7drxzBXIYuDfqazDS96FW?=
 =?us-ascii?Q?F5SbTeKvCJfQawvfvhG0hlMf7LkJmOGFOEotQCVRigaS55fTQjkvxm/EN6NO?=
 =?us-ascii?Q?Wh0/VFrEun7llmF8Zb2sod/ILnEC79SMRFWBWOLlVko3hbkhQI1OBGFet0bk?=
 =?us-ascii?Q?NGjRZ86F7hfIDH7/goWPSNu9sJsS3ZF50/8/cSRCMxbQJ9oJskbDa+tMLYa7?=
 =?us-ascii?Q?WWhfukX3LdahZqNnJnaXXz/bj0FBQ1y0U+nWyD1vJX44GMVj4uH5mWQ80/sB?=
 =?us-ascii?Q?k3LMDX+HsK/GWCemdRGDdSdB6tf4+8SH4UYLLKvJl2e5eslfrVGfrD0nIwcq?=
 =?us-ascii?Q?/loaphtcbmAYL4uNLZnNB27Fj9SeahY31paFv6BFJX15ehfTvsJrhvgWhXML?=
 =?us-ascii?Q?SbqtanhRhZ7rJ+VbQYV+srvovcQqoyMGK28jzHHGIA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0807d59-c6f6-4d80-ccec-08dac00e473a
X-MS-Exchange-CrossTenant-AuthSource: TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2022 15:47:58.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2416
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
Cc: krastevm@vmware.com, Dawei Li <set_pte_at@outlook.com>,
 linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch includes changes below:
1) pin_user_pages() is unsafe without protection of mmap_lock,
   fix it by calling mmap_read_lock() & mmap_read_unlock().
2) fix & refactor the incorrect exception handling procedure in
   vmw_mksstat_add_ioctl().

Fixes: 7a7a933edd6c ("drm/vmwgfx: Introduce VMware mks-guest-stats")
Signed-off-by: Dawei Li <set_pte_at@outlook.com>
---
v1:
https://lore.kernel.org/all/TYCP286MB23235C9A9FCF85C045F95EA7CA4F9@TYCP286MB2323.JPNP286.PROD.OUTLOOK.COM/

v1->v2:
Rebased to latest vmwgfx/drm-misc-fixes
---
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index 089046fa21be..ec40a3364e0a 100644
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
@@ -1084,28 +1084,33 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
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
@@ -1120,15 +1125,15 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
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

